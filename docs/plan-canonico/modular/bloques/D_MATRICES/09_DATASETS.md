## DATASETS CANÓNICOS

Los datasets canónicos solo podrán iniciarse cuando AUTH-CAT-024 haya:

- validado el diff contractual completo;
- aprobado la versión definitiva del catálogo;
- publicado el número de versión;
- publicado la huella o hash contractual;
- confirmado las sustituciones legacy;
- actualizado las matrices, excepciones, denegaciones y paquetes afectados;
- confirmado que las claves nuevas permanecen sin concesiones implícitas.

### ✅ AUTH-RBAC-024 — Definir dataset canónico de matriz base

**Estado:** APROBADA  
**Bloque:** BLOQUE D — Datasets canónicos  
**Naturaleza:** Definición documental de dataset lógico, versionado e inmutable  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CAT-024 — APROBADA  
**Tarea posterior reservada:** AUTH-RBAC-025 — Definir dataset canónico de matriz operativa  
**Dataset:** `vento.authorization.base-role-grants@1.0.0`  
**Catálogo:** `vento.authorization@1.0.0`  
**Huella contractual:** `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`  
**Registros lógicos:** **499**  
**Roles base incluidos:** **7**  
**Hash del dataset propuesto:** `sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1`

Esta tarea convierte las matrices base aprobadas y el diff contractual de
AUTH-CAT-023 en un dataset lógico único, determinista, verificable y listo
para su futura materialización física.

No crea tablas, no inserta filas, no modifica Supabase, no genera
migraciones, no altera RLS o RPC y no publica todavía archivos físicos del
paquete `@vento/contracts`.

---

#### 1. Objetivo

Definir de manera exacta:

1. qué roles base forman parte de la matriz canónica;
2. qué permisos activos recibe cada rol;
3. cuáles concesiones son completas por el carril base;
4. cuáles filas representan únicamente el componente base de una
   autorización `BASE_AND_OPERATIONAL`;
5. qué alcance y condiciones conserva cada concesión;
6. qué versión contractual y hash debe referenciar el dataset;
7. cómo se serializa, ordena, valida y verifica el contenido;
8. qué queda reservado para AUTH-RBAC-025, AUTH-RBAC-026 y BLOQUE R.

Flujo:

```text
MATRICES BASE APROBADAS
AUTH-RBAC-001 A AUTH-RBAC-007
        +
DIFF CONTRACTUAL APROBADO
AUTH-CAT-023
        +
CATÁLOGO CONGELADO
AUTH-CAT-024
        ↓
DATASET CANÓNICO DE MATRIZ BASE
AUTH-RBAC-024
```

---

#### 2. Decisión principal

El dataset de matriz base contiene exclusivamente concesiones positivas
explícitas para los siete roles base canónicos:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
```

No incluye:

- oficios base legacy;
- roles operativos;
- concesiones individuales;
- denegaciones;
- wildcards;
- aliases;
- claves legacy bloqueadas;
- permisos técnicos retirados;
- permisos `OPERATIONAL_ONLY`;
- expansiones físicas por sede o área;
- bypasses por nombre de rol.

Regla:

```text
FILA PRESENTE
→ CONCESIÓN BASE POTENCIAL

FILA AUSENTE
→ DEFAULT_DENY

FILA BASE_COMPONENT
→ NO AUTORIZA POR SÍ SOLA
```

---

#### 3. Manifiesto contractual del dataset

```json
{
  "dataset_id": "vento.authorization.base-role-grants",
  "dataset_version": "1.0.0",
  "dataset_schema_version": "1.0.0",
  "catalog_id": "vento.authorization",
  "catalog_version": "1.0.0",
  "catalog_schema_version": "1.0.0",
  "contract_release_hash": "sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe",
  "record_count": 499,
  "role_count": 7,
  "direct_base_count": 463,
  "base_component_count": 36,
  "effect": "ALLOW_ONLY"
}
```

El estado de aprobación no forma parte del payload ni del hash. La huella
permanece estable cuando la propuesta pase de `PROPUESTA` a `APROBADA`,
siempre que no cambie ningún registro ni metadato contractual.

---

#### 4. Resultado cuantitativo

##### 4.1 Conteo por rol

| Rol base                  | Concesiones directas | Componentes base |   Total |
| ------------------------- | -------------------: | ---------------: | ------: |
| `propietario`             |                  109 |               12 |     121 |
| `gerente_general`         |                  107 |               12 |     119 |
| `gerente`                 |                   81 |               12 |      93 |
| `supervisor`              |                   58 |                0 |      58 |
| `auxiliar_administrativa` |                   47 |                0 |      47 |
| `contador`                |                   45 |                0 |      45 |
| `marketing`               |                   16 |                0 |      16 |
| **Total**                 |              **463** |           **36** | **499** |

##### 4.2 Conteo por tipo de concesión

| Tipo             | Cantidad | Efecto                                                                                                   |
| ---------------- | -------: | -------------------------------------------------------------------------------------------------------- |
| `DIRECT_BASE`    |      463 | El carril base puede satisfacer la autorización completa, sujeto a alcance, recurso y demás condiciones. |
| `BASE_COMPONENT` |       36 | Solo aporta el componente base de una autorización `BASE_AND_OPERATIONAL`.                               |
| **Total**        |  **499** | Sin duplicados.                                                                                          |

##### 4.3 Conteo por modalidad

| Modalidad              | Cantidad |
| ---------------------- | -------: |
| `BASE_ONLY`            |      251 |
| `BASE_OR_OPERATIONAL`  |      212 |
| `BASE_AND_OPERATIONAL` |       36 |
| `OPERATIONAL_ONLY`     |        0 |
| **Total**              |  **499** |

##### 4.4 Conteo por aplicación

| Aplicación | Registros de concesión base |
| ---------- | --------------------------: |
| `shell`    |                           7 |
| `anima`    |                          48 |
| `aura`     |                           3 |
| `fogo`     |                          19 |
| `nexo`     |                         251 |
| `numera`   |                          27 |
| `origo`    |                          31 |
| `pass`     |                           2 |
| `pulso`    |                          18 |
| `viso`     |                          93 |
| **Total**  |                     **499** |

---

#### 5. Roles incluidos

##### 5.1 `propietario`

- 121 concesiones lógicas.
- 109 concesiones directas.
- 12 componentes base de doble condición.
- Recibe las 14 claves VISO de gobierno aprobadas.
- No recibe permisos operativos por nombre del rol.
- No recibe wildcard ni bypass.

##### 5.2 `gerente_general`

- 119 concesiones lógicas.
- 107 concesiones directas.
- 12 componentes base de doble condición.
- Recibe 12 claves VISO.
- No recibe por matriz:
  - `viso.authorization.denials.approve`;
  - `viso.authorization.denials.revoke`.

##### 5.3 `gerente`

- 93 concesiones lógicas.
- 81 concesiones directas.
- 12 componentes base de doble condición.
- Toda concesión territorial se limita a cobertura administrativa activa.
- No recibe gobierno VISO de autorización por matriz.

##### 5.4 `supervisor`

- 58 concesiones directas.
- 0 componentes base de doble condición.
- El cero del diff contractual es una decisión explícita.
- No recibe las nuevas acciones sensibles PULSO, NEXO, ORIGO o VISO.

##### 5.5 `auxiliar_administrativa`

- 47 concesiones directas.
- 0 componentes base.
- No recibe `origo.procurement.receipts.register` por matriz general.
- Una responsabilidad formal adicional deberá resolverse mediante
  concesión individual base en AUTH-RBAC-026.

##### 5.6 `contador`

- 45 concesiones directas.
- 0 componentes base.
- Mantiene finalidad financiera, de conciliación y evidencia.
- No recibe las nuevas capacidades sensibles del diff.

##### 5.7 `marketing`

- 16 concesiones directas.
- 0 componentes base.
- Mantiene únicamente capacidades de marca, contenido y consulta comercial
  expresamente aprobadas.

---

#### 6. Roles excluidos

Los siguientes códigos no forman parte del dataset canónico de matriz base:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

Son oficios base legacy o conceptos operativos históricos. No se transforman
en roles base canónicos ni se copian a este dataset.

Su transición deberá:

- inventariar consumidores;
- migrar trabajadores a roles base válidos cuando corresponda;
- utilizar roles operativos durante el turno;
- conservar compatibilidad temporal;
- ejecutarse mediante BLOQUE R.

La exclusión del dataset no elimina físicamente registros actuales.

---

#### 7. Esquema lógico de registro

Cada línea de concesión utiliza exactamente estos campos y este orden:

| Campo                  | Tipo   | Regla                                                                      |
| ---------------------- | ------ | -------------------------------------------------------------------------- |
| `grant_id`             | string | Identificador determinista `base-role-grant:<role_code>:<permission_key>`. |
| `role_code`            | string | Uno de los siete roles base incluidos.                                     |
| `permission_key`       | string | Clave exacta activa de `vento.authorization@1.0.0`.                        |
| `authorization_mode`   | enum   | `BASE_ONLY`, `BASE_OR_OPERATIONAL` o `BASE_AND_OPERATIONAL`.               |
| `lane`                 | enum   | Siempre `BASE`.                                                            |
| `grant_type`           | enum   | `DIRECT_BASE` o `BASE_COMPONENT`.                                          |
| `effect`               | enum   | Siempre `ALLOW`.                                                           |
| `scope_expression`     | string | Alcance lógico aprobado por la matriz fuente.                              |
| `condition_expression` | string | Condiciones normativas que deben conservarse.                              |
| `source_task`          | string | Tarea que originó la fila.                                                 |

El dataset es lógico. `scope_expression` no se traduce todavía a UUID,
filas territoriales o tablas físicas.

---

#### 8. Semántica de `DIRECT_BASE`

Una fila `DIRECT_BASE` significa:

```text
ROL BASE VIGENTE
+
PERMISO ACTIVO
+
ALCANCE COINCIDENTE
+
RECURSO VÁLIDO
+
CONDICIONES SATISFECHAS
+
SIN DENEGACIÓN APLICABLE
=
AUTORIZACIÓN BASE POSIBLE
```

No significa:

- acceso global automático;
- acceso a todas las sedes;
- acceso a APP-REVIEW;
- omisión de contrato de recurso;
- autorización por sede seleccionada;
- eliminación de denegaciones;
- acceso técnico privilegiado.

---

#### 9. Semántica de `BASE_COMPONENT`

Las 36 filas `BASE_COMPONENT` corresponden exclusivamente a permisos
`BASE_AND_OPERATIONAL`.

Distribución:

| Familia                               | Roles base                            | Claves por rol | Componentes |
| ------------------------------------- | ------------------------------------- | -------------: | ----------: |
| PULSO — acciones sensibles            | propietario, gerente_general, gerente |              5 |          15 |
| NEXO — diferencias de conteo          | propietario, gerente_general, gerente |              2 |           6 |
| Matrices originales — doble condición | propietario, gerente_general, gerente |              5 |          15 |
| **Total**                             | —                                     |              — |      **36** |

Regla:

```text
BASE_COMPONENT
+
OPERATIONAL_COMPONENT DEL MISMO ACTOR
+
MISMO RECURSO Y SOLICITUD
+
CONTEXTO VÁLIDO
=
AUTORIZACIÓN POSIBLE
```

Un componente base aislado produce denegación.

---

#### 10. Diff contractual incorporado

##### 10.1 PULSO

Se agregan componentes base para `propietario`, `gerente_general` y
`gerente`:

```text
pulso.payments.transactions.reverse
pulso.sales.orders.cancel
pulso.sales.returns.create
pulso.payments.transactions.refund
pulso.sales.discounts.apply
```

Total:

```text
5 claves × 3 roles = 15 componentes
```

##### 10.2 NEXO

Se agregan componentes base para los mismos tres roles:

```text
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
```

Total:

```text
2 claves × 3 roles = 6 componentes
```

##### 10.3 ORIGO

Se agrega una concesión base directa para los tres roles:

```text
origo.procurement.receipts.register
```

Total:

```text
1 clave × 3 roles = 3 concesiones
```

##### 10.4 VISO

Se agregan:

- 14 concesiones directas a `propietario`;
- 12 concesiones directas a `gerente_general`;
- 0 concesiones a los demás roles.

Total:

```text
14 + 12 = 26 concesiones
```

##### 10.5 Resultado total del diff

```text
15 PULSO
+ 6 NEXO
+ 3 ORIGO
+ 26 VISO
= 50 COMPONENTES O CONCESIONES BASE NUEVAS
```

---

#### 11. Exclusión de claves legacy y retiradas

El dataset no contiene ninguna de las 22 claves legacy bloqueadas ni
ninguna de las 14 claves técnicas retiradas de AUTH-CAT-024.

En particular, no contiene:

```text
pulso.pos.main
viso.staff.permissions.manage
nexo.inventory.remissions.dispatch
```

No se admite:

```text
LEGACY AMPLIO
→ COPIAR CONCESIÓN
→ TODAS LAS CLAVES NUEVAS
```

Cada una de las 50 incorporaciones fue aprobada explícitamente por rol y
clave.

---

#### 12. Ausencia, denegación y precedencia

Este dataset solo contiene `ALLOW`.

No contiene filas `DENY`.

Reglas:

1. ausencia de fila = denegación por defecto;
2. ausencia de fila no crea una denegación explícita;
3. AUTH-RBAC-026 define excepciones y denegaciones;
4. una denegación aplicable prevalece sobre esta concesión;
5. revocar una denegación no crea una fila en este dataset;
6. ninguna concesión individual modifica la matriz base;
7. no se duplican filas `deny` para representar ausencias.

---

#### 13. Alcance lógico y futura proyección física

La matriz conserva expresiones como:

```text
NT-APP
G(B)
ORG
AS
AA
AS/AA
AS-REL
ORG-LOCAL
G-FUNC
G-FIN
G-SRC
```

Estas expresiones son contractuales y deberán convertirse posteriormente
en estructuras físicas aprobadas por E3 y BLOQUE R.

Una concesión lógica podrá proyectarse a más de una fila física cuando
requiera territorios explícitos.

Por tanto:

```text
499 REGISTROS LÓGICOS
≠
499 FILAS FÍSICAS OBLIGATORIAS
```

La futura materialización deberá conservar equivalencia semántica y producir
su propio conteo y checksum.

---

#### 14. Orden canónico

Los registros se ordenan por:

```text
role_code ASC
permission_key ASC
```

No se utiliza:

- orden de inserción;
- UUID;
- fecha;
- nombre humano;
- orden de la interfaz;
- orden de Supabase.

El orden estable permite reproducir el hash.

---

#### 15. Serialización y hash

La huella se calcula así:

- UTF-8 sin BOM;
- saltos LF;
- primera línea = manifiesto JSON compacto;
- líneas restantes = registros JSON compactos;
- campos en el orden de la sección 7;
- registros ordenados por la sección 14;
- sin espacios finales;
- un único LF al final;
- SHA-256 sobre todos los bytes;
- sin estado de aprobación ni timestamp.

Resultado:

```text
dataset_hash = sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1
```

Cualquier cambio en:

- rol;
- permiso;
- modalidad;
- tipo de concesión;
- alcance;
- condición;
- tarea fuente;
- manifiesto contractual;

deberá producir otra versión y otro hash.

---

#### 16. Validaciones obligatorias

El dataset deberá pasar, como mínimo:

1. `record_count = 499`;
2. `role_count = 7`;
3. 499 pares únicos `role_code + permission_key`;
4. 463 filas `DIRECT_BASE`;
5. 36 filas `BASE_COMPONENT`;
6. 251 filas `BASE_ONLY`;
7. 212 filas `BASE_OR_OPERATIONAL`;
8. 36 filas `BASE_AND_OPERATIONAL`;
9. 0 filas `OPERATIONAL_ONLY`;
10. 0 filas `DENY`;
11. 0 claves legacy bloqueadas;
12. 0 claves técnicas retiradas;
13. todas las claves existen entre los 140 permisos activos;
14. todo `BASE_COMPONENT` corresponde a `BASE_AND_OPERATIONAL`;
15. ninguna fila usa wildcard;
16. ninguna fila utiliza `null` como global;
17. ninguna fila depende de sede seleccionada;
18. ninguna fila concede `service_role`;
19. ninguna fila crea bypass por nombre de rol;
20. el hash coincide con el publicado.

Resultado documental de validación:

```text
records = 499
unique_role_permission_pairs = 499
direct_base = 463
base_components = 36
legacy_matches = 0
retired_matches = 0
operational_only_rows = 0
dataset_hash = sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1
```

---

#### 17. Relación con tareas posteriores

##### AUTH-RBAC-025

Definirá exclusivamente:

- concesiones de roles operativos;
- carril `OPERATIONAL`;
- componentes operativos de `BASE_AND_OPERATIONAL`;
- retiro de `nexo.inventory.remissions.dispatch`;
- contexto de turno, check-in, sede y área.

No podrá editar este dataset.

##### AUTH-RBAC-026

Definirá:

- concesiones individuales base;
- concesiones individuales operativas;
- denegaciones por carril;
- denegaciones actor-wide;
- vigencia, motivo y trazabilidad.

No podrá convertir ausencias de esta matriz en filas `DENY` automáticas.

##### AUTH-RBAC-027 y AUTH-RBAC-028

Validarán respectivamente:

- ausencia de acceso operativo global accidental;
- independencia entre administración base y check-in.

##### BLOQUE R

Materializará los datasets mediante:

- estructuras físicas aprobadas;
- migraciones versionadas;
- reconciliación;
- pruebas;
- rollback;
- retiro legacy controlado.

---

#### 18. Payload canónico del dataset

La primera línea es el manifiesto. Las 499 líneas siguientes son los
registros de concesión.

```jsonl
{"dataset_id":"vento.authorization.base-role-grants","dataset_version":"1.0.0","dataset_schema_version":"1.0.0","catalog_id":"vento.authorization","catalog_version":"1.0.0","catalog_schema_version":"1.0.0","contract_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","record_count":499,"role_count":7,"direct_base_count":463,"base_component_count":36,"effect":"ALLOW_ONLY"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.access","role_code":"auxiliar_administrativa","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. El acceso a la aplicación no concede todas sus capacidades.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.attendance.shifts.create","role_code":"auxiliar_administrativa","permission_key":"anima.attendance.shifts.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Puede registrar turnos dentro de reglas y plantillas aprobadas. No crea roles operativos nuevos ni amplía cobertura laboral.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.attendance.shifts.update","role_code":"auxiliar_administrativa","permission_key":"anima.attendance.shifts.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Puede corregir datos administrativos de turnos autorizados. No cancela, no altera historial cerrado y debe conservar auditoría.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.workforce.employee_documents.delete","role_code":"auxiliar_administrativa","permission_key":"anima.workforce.employee_documents.delete","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Solo documentos eliminables según retención y estado. Requiere motivo, auditoría y no puede borrar evidencia legal o ya consolidada.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.workforce.employee_documents.upload","role_code":"auxiliar_administrativa","permission_key":"anima.workforce.employee_documents.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Solo tipos documentales aprobados y trabajadores válidos. Debe registrar actor, fecha y documento objetivo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.workforce.employee_documents.view","role_code":"auxiliar_administrativa","permission_key":"anima.workforce.employee_documents.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Consulta administrativa de documentos laborales. Los campos especialmente sensibles se enmascaran o exigen una capacidad adicional.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.workforce.employee_photos.upload","role_code":"auxiliar_administrativa","permission_key":"anima.workforce.employee_photos.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Solo fotografías laborales autorizadas, vinculadas a un trabajador válido y con trazabilidad.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.workforce.staff_invitations.create","role_code":"auxiliar_administrativa","permission_key":"anima.workforce.staff_invitations.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Solo invitaciones basadas en perfiles, sedes y roles previamente aprobados. No permite crear propietarios, conceder permisos ni eludir aprobaciones.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:anima.workforce.team_members.view","role_code":"auxiliar_administrativa","permission_key":"anima.workforce.team_members.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. Consulta transversal de equipo para apoyo administrativo; datos no necesarios permanecen ocultos.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:fogo.access","role_code":"auxiliar_administrativa","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. El acceso a la aplicación no concede todas sus capacidades.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:fogo.production.orders.view","role_code":"auxiliar_administrativa","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Seguimiento administrativo de órdenes de producción relacionadas con su cobertura; no ejecuta producción ni crea lotes.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.access","role_code":"auxiliar_administrativa","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. El acceso a la aplicación no concede todas sus capacidades.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.assets.items.create","role_code":"auxiliar_administrativa","permission_key":"nexo.assets.items.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Registro administrativo inicial de activos dentro de sedes autorizadas. No asigna ubicación, custodia, valoración ni movimiento físico.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.assets.items.view","role_code":"auxiliar_administrativa","permission_key":"nexo.assets.items.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Consulta o registro administrativo dentro de la cobertura autorizada. No sustituye ejecución física ni contexto operativo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.catalog.categories.view","role_code":"auxiliar_administrativa","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.catalog.presentations.view","role_code":"auxiliar_administrativa","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.catalog.products.view","role_code":"auxiliar_administrativa","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.catalog.request_policies.view","role_code":"auxiliar_administrativa","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.catalog.units.view","role_code":"auxiliar_administrativa","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.finance.cost_centers.view","role_code":"auxiliar_administrativa","permission_key":"nexo.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.finance.internal_invoice_amounts.view","role_code":"auxiliar_administrativa","permission_key":"nexo.finance.internal_invoice_amounts.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — documento o relación que involucra al menos una sede activamente asignada o formalmente atendida por el rol; la visibilidad de un extremo no concede autoridad sobre los demás.","condition_expression":"Carril base. Consulta sensible limitada a documentos vinculados a la cobertura autorizada; debe aplicarse mínimo privilegio y auditoría.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.finance.internal_invoices.view","role_code":"auxiliar_administrativa","permission_key":"nexo.finance.internal_invoices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — documento o relación que involucra al menos una sede activamente asignada o formalmente atendida por el rol; la visibilidad de un extremo no concede autoridad sobre los demás.","condition_expression":"Carril base. Consulta o soporte administrativo del recurso relacionado. Toda mutación queda limitada por el contrato de recurso y por la cobertura de cada extremo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.inventory.adjustments.view","role_code":"auxiliar_administrativa","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Consulta o registro administrativo dentro de la cobertura autorizada. No sustituye ejecución física ni contexto operativo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.inventory.entries.view","role_code":"auxiliar_administrativa","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Consulta o registro administrativo dentro de la cobertura autorizada. No sustituye ejecución física ni contexto operativo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.inventory.movements.view","role_code":"auxiliar_administrativa","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Consulta o registro administrativo dentro de la cobertura autorizada. No sustituye ejecución física ni contexto operativo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.inventory.remissions.update","role_code":"auxiliar_administrativa","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — documento o relación que involucra al menos una sede activamente asignada o formalmente atendida por el rol; la visibilidad de un extremo no concede autoridad sobre los demás.","condition_expression":"Carril base. Solo actualización de metadatos y correcciones administrativas permitidas por estado. No solicita, prepara, despacha, recibe ni cancela.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.inventory.remissions.view","role_code":"auxiliar_administrativa","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — documento o relación que involucra al menos una sede activamente asignada o formalmente atendida por el rol; la visibilidad de un extremo no concede autoridad sobre los demás.","condition_expression":"Carril base. Consulta o soporte administrativo del recurso relacionado. Toda mutación queda limitada por el contrato de recurso y por la cobertura de cada extremo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.inventory.stock.view","role_code":"auxiliar_administrativa","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Consulta o registro administrativo dentro de la cobertura autorizada. No sustituye ejecución física ni contexto operativo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.inventory.transfers.view","role_code":"auxiliar_administrativa","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — documento o relación que involucra al menos una sede activamente asignada o formalmente atendida por el rol; la visibilidad de un extremo no concede autoridad sobre los demás.","condition_expression":"Carril base. Consulta o soporte administrativo del recurso relacionado. Toda mutación queda limitada por el contrato de recurso y por la cobertura de cada extremo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.settings.remission_policies.view","role_code":"auxiliar_administrativa","permission_key":"nexo.settings.remission_policies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:nexo.settings.sites.view","role_code":"auxiliar_administrativa","permission_key":"nexo.settings.sites.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:numera.access","role_code":"auxiliar_administrativa","permission_key":"numera.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. El acceso a la aplicación no concede todas sus capacidades.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:numera.finance.cost_centers.view","role_code":"auxiliar_administrativa","permission_key":"numera.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:numera.finance.expenses.view","role_code":"auxiliar_administrativa","permission_key":"numera.finance.expenses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos vinculados a sedes o áreas activamente asignadas o formalmente atendidas dentro del proceso administrativo autorizado.","condition_expression":"Carril base. Consulta de gastos vinculados a sedes o responsabilidades administrativas autorizadas. No incluye modificación ni analítica estratégica.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:origo.access","role_code":"auxiliar_administrativa","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. El acceso a la aplicación no concede todas sus capacidades.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:origo.catalog.product_reviews.view","role_code":"auxiliar_administrativa","permission_key":"origo.catalog.product_reviews.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta del estado de revisión del catálogo; no aprueba ni modifica productos maestros.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:origo.procurement.purchase_orders.view","role_code":"auxiliar_administrativa","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — documento o relación que involucra al menos una sede activamente asignada o formalmente atendida por el rol; la visibilidad de un extremo no concede autoridad sobre los demás.","condition_expression":"Carril base. Consulta o soporte administrativo del recurso relacionado. Toda mutación queda limitada por el contrato de recurso y por la cobertura de cada extremo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:origo.procurement.receipts.view","role_code":"auxiliar_administrativa","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — documento o relación que involucra al menos una sede activamente asignada o formalmente atendida por el rol; la visibilidad de un extremo no concede autoridad sobre los demás.","condition_expression":"Carril base. Consulta o soporte administrativo del recurso relacionado. Toda mutación queda limitada por el contrato de recurso y por la cobertura de cada extremo.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:origo.procurement.suppliers.view","role_code":"auxiliar_administrativa","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta de referencia para apoyo a compras. Datos contractuales, bancarios o restringidos requieren controles separados.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:shell.access","role_code":"auxiliar_administrativa","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. El acceso a la aplicación no concede todas sus capacidades.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:viso.access","role_code":"auxiliar_administrativa","permission_key":"viso.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. El acceso a la aplicación no concede todas sus capacidades.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:viso.delivery.rates.view","role_code":"auxiliar_administrativa","permission_key":"viso.delivery.rates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:viso.organization.businesses.view","role_code":"auxiliar_administrativa","permission_key":"viso.organization.businesses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo o referencia organizacional exacta, en modo de consulta, dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta exacta del dato de referencia; no concede modificación, aprobación ni autoridad organizacional general.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:viso.workforce.employees.view","role_code":"auxiliar_administrativa","permission_key":"viso.workforce.employees.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. No requiere turno ni check-in, pero sí empleado activo, permiso vigente, alcance resuelto, recurso válido y ausencia de denegaciones.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:viso.workforce.schedules.view","role_code":"auxiliar_administrativa","permission_key":"viso.workforce.schedules.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. No requiere turno ni check-in, pero sí empleado activo, permiso vigente, alcance resuelto, recurso válido y ausencia de denegaciones.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:viso.workforce.staff_calendar.view","role_code":"auxiliar_administrativa","permission_key":"viso.workforce.staff_calendar.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. No requiere turno ni check-in, pero sí empleado activo, permiso vigente, alcance resuelto, recurso válido y ausencia de denegaciones.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:auxiliar_administrativa:viso.workforce.vacancies.view","role_code":"auxiliar_administrativa","permission_key":"viso.workforce.vacancies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FUNC — ámbito organizacional ordinario exclusivamente para el proceso administrativo de personal definido por esta clave; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base. No requiere turno ni check-in, pero sí empleado activo, permiso vigente, alcance resuelto, recurso válido y ausencia de denegaciones.","source_task":"AUTH-RBAC-005"}
{"grant_id":"base-role-grant:contador:anima.access","role_code":"contador","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos ni a capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. La entrada no concede acceso automático a módulos, datos o acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:fogo.access","role_code":"contador","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos ni a capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. La entrada no concede acceso automático a módulos, datos o acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:fogo.production.batches.view","role_code":"contador","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia productiva de todas las sedes ordinarias, únicamente para costeo, conciliación y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite verificar cantidades y estados productivos como evidencia de costeo; no crea lotes ni ejecuta producción.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:fogo.production.orders.view","role_code":"contador","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia productiva de todas las sedes ordinarias, únicamente para costeo, conciliación y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite verificar cantidades y estados productivos como evidencia de costeo; no crea lotes ni ejecuta producción.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.access","role_code":"contador","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos ni a capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. La entrada no concede acceso automático a módulos, datos o acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.analytics.internal_reports.view","role_code":"contador","permission_key":"nexo.analytics.internal_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta consolidada sensible; no autoriza alterar fuentes, aprobar operaciones ni modificar cierres.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.analytics.margin_reports.view","role_code":"contador","permission_key":"nexo.analytics.margin_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta consolidada sensible; no autoriza alterar fuentes, aprobar operaciones ni modificar cierres.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.assets.counts.view","role_code":"contador","permission_key":"nexo.assets.counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia patrimonial y de conteo de activos de todas las sedes ordinarias para conciliación contable.","condition_expression":"Carril base de consulta. Permite verificar existencia, clasificación y conteos de activos; no registra, asigna, valora ni modifica activos.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.assets.groups.view","role_code":"contador","permission_key":"nexo.assets.groups.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia patrimonial y de conteo de activos de todas las sedes ordinarias para conciliación contable.","condition_expression":"Carril base de consulta. Permite verificar existencia, clasificación y conteos de activos; no registra, asigna, valora ni modifica activos.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.assets.items.view","role_code":"contador","permission_key":"nexo.assets.items.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia patrimonial y de conteo de activos de todas las sedes ordinarias para conciliación contable.","condition_expression":"Carril base de consulta. Permite verificar existencia, clasificación y conteos de activos; no registra, asigna, valora ni modifica activos.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.catalog.categories.view","role_code":"contador","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo empresarial exacto requerido para interpretar documentos, cantidades y valoraciones.","condition_expression":"Carril base de consulta. Solo referencia de productos, presentaciones, categorías o unidades para interpretar documentos financieros; no permite modificar el catálogo.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.catalog.presentations.view","role_code":"contador","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo empresarial exacto requerido para interpretar documentos, cantidades y valoraciones.","condition_expression":"Carril base de consulta. Solo referencia de productos, presentaciones, categorías o unidades para interpretar documentos financieros; no permite modificar el catálogo.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.catalog.products.view","role_code":"contador","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo empresarial exacto requerido para interpretar documentos, cantidades y valoraciones.","condition_expression":"Carril base de consulta. Solo referencia de productos, presentaciones, categorías o unidades para interpretar documentos financieros; no permite modificar el catálogo.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.catalog.units.view","role_code":"contador","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — catálogo empresarial exacto requerido para interpretar documentos, cantidades y valoraciones.","condition_expression":"Carril base de consulta. Solo referencia de productos, presentaciones, categorías o unidades para interpretar documentos financieros; no permite modificar el catálogo.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.finance.cost_centers.view","role_code":"contador","permission_key":"nexo.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Acceso global específico para revisión y procesamiento contable; aplica minimización, trazabilidad, segregación de funciones y restricciones de período.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.finance.internal_invoice_amounts.view","role_code":"contador","permission_key":"nexo.finance.internal_invoice_amounts.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Acceso global específico para revisión y procesamiento contable; aplica minimización, trazabilidad, segregación de funciones y restricciones de período.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.finance.internal_invoices.generate","role_code":"contador","permission_key":"nexo.finance.internal_invoices.generate","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Exige documento fuente válido, período abierto, numeración y reglas tributarias aplicables, idempotencia, actor identificado y auditoría. No crea ni modifica movimientos físicos de inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.finance.internal_invoices.issue","role_code":"contador","permission_key":"nexo.finance.internal_invoices.issue","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Exige documento fuente válido, período abierto, numeración y reglas tributarias aplicables, idempotencia, actor identificado y auditoría. No crea ni modifica movimientos físicos de inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.finance.internal_invoices.view","role_code":"contador","permission_key":"nexo.finance.internal_invoices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Acceso global específico para revisión y procesamiento contable; aplica minimización, trazabilidad, segregación de funciones y restricciones de período.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.finance.internal_prices.view","role_code":"contador","permission_key":"nexo.finance.internal_prices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Acceso global específico para revisión y procesamiento contable; aplica minimización, trazabilidad, segregación de funciones y restricciones de período.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.finance.internal_variances.view","role_code":"contador","permission_key":"nexo.finance.internal_variances.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Acceso global específico para revisión y procesamiento contable; aplica minimización, trazabilidad, segregación de funciones y restricciones de período.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.adjustments.view","role_code":"contador","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.entries.view","role_code":"contador","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.initial_counts.view","role_code":"contador","permission_key":"nexo.inventory.initial_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.movements.view","role_code":"contador","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.production_batches.view","role_code":"contador","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.remissions.view","role_code":"contador","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.stock.view","role_code":"contador","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.stock_counts.view","role_code":"contador","permission_key":"nexo.inventory.stock_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.transfers.view","role_code":"contador","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:nexo.inventory.withdrawals.view","role_code":"contador","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia transaccional de inventario de todas las sedes ordinarias para conciliación, valoración y trazabilidad financiera.","condition_expression":"Carril base de consulta. Permite revisar la evidencia fuente del movimiento; no registra, prepara, recibe, despacha, cuenta ni modifica inventario.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:numera.access","role_code":"contador","permission_key":"numera.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos ni a capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. La entrada no concede acceso automático a módulos, datos o acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:numera.analytics.break_even.view","role_code":"contador","permission_key":"numera.analytics.break_even.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta consolidada sensible; no autoriza alterar fuentes, aprobar operaciones ni modificar cierres.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:numera.analytics.financial_reports.view","role_code":"contador","permission_key":"numera.analytics.financial_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta consolidada sensible; no autoriza alterar fuentes, aprobar operaciones ni modificar cierres.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:numera.analytics.profitability.view","role_code":"contador","permission_key":"numera.analytics.profitability.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta consolidada sensible; no autoriza alterar fuentes, aprobar operaciones ni modificar cierres.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:numera.finance.cost_centers.view","role_code":"contador","permission_key":"numera.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta organizacional sensible del recurso exacto; no autoriza registro, aprobación, cierre o exportación mientras no existan permisos atómicos para esas acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:numera.finance.expenses.view","role_code":"contador","permission_key":"numera.finance.expenses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta organizacional sensible del recurso exacto; no autoriza registro, aprobación, cierre o exportación mientras no existan permisos atómicos para esas acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:origo.access","role_code":"contador","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos ni a capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. La entrada no concede acceso automático a módulos, datos o acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:origo.procurement.purchase_orders.view","role_code":"contador","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia comercial y de abastecimiento de todas las sedes ordinarias, únicamente para revisión, conciliación y soporte contable.","condition_expression":"Carril base de consulta. Permite verificar documentos fuente y contrapartes para conciliación; no crea órdenes, recibe mercancía, modifica proveedores ni ejecuta operación física.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:origo.procurement.receipts.view","role_code":"contador","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia comercial y de abastecimiento de todas las sedes ordinarias, únicamente para revisión, conciliación y soporte contable.","condition_expression":"Carril base de consulta. Permite verificar documentos fuente y contrapartes para conciliación; no crea órdenes, recibe mercancía, modifica proveedores ni ejecuta operación física.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:origo.procurement.suppliers.view","role_code":"contador","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-SRC — evidencia comercial y de abastecimiento de todas las sedes ordinarias, únicamente para revisión, conciliación y soporte contable.","condition_expression":"Carril base de consulta. Permite verificar documentos fuente y contrapartes para conciliación; no crea órdenes, recibe mercancía, modifica proveedores ni ejecuta operación física.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:shell.access","role_code":"contador","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos ni a capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. La entrada no concede acceso automático a módulos, datos o acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:viso.access","role_code":"contador","permission_key":"viso.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos ni a capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. La entrada no concede acceso automático a módulos, datos o acciones.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:viso.finance.accounting.view","role_code":"contador","permission_key":"viso.finance.accounting.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-FIN — ámbito organizacional ordinario exclusivamente para la capacidad financiera indicada; excluye APP-REVIEW, demo, pruebas y recursos aislados.","condition_expression":"Carril base financiero. Consulta de información contable autorizada; no concede administración general de VISO ni acceso a personal, seguridad o configuración.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:contador:viso.organization.businesses.view","role_code":"contador","permission_key":"viso.organization.businesses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — referencia organizacional exacta en modo de consulta dentro del entorno productivo ordinario.","condition_expression":"Carril base. Consulta de empresas y unidades necesarias para clasificar información financiera; no concede modificación organizacional.","source_task":"AUTH-RBAC-006"}
{"grant_id":"base-role-grant:gerente:anima.access","role_code":"gerente","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.attendance.shifts.cancel","role_code":"gerente","permission_key":"anima.attendance.shifts.cancel","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.attendance.shifts.create","role_code":"gerente","permission_key":"anima.attendance.shifts.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.attendance.shifts.update","role_code":"gerente","permission_key":"anima.attendance.shifts.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.workforce.employee_documents.delete","role_code":"gerente","permission_key":"anima.workforce.employee_documents.delete","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.workforce.employee_documents.upload","role_code":"gerente","permission_key":"anima.workforce.employee_documents.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.workforce.employee_documents.view","role_code":"gerente","permission_key":"anima.workforce.employee_documents.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.workforce.employee_photos.upload","role_code":"gerente","permission_key":"anima.workforce.employee_photos.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.workforce.staff_invitations.create","role_code":"gerente","permission_key":"anima.workforce.staff_invitations.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:anima.workforce.team_members.view","role_code":"gerente","permission_key":"anima.workforce.team_members.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:fogo.access","role_code":"gerente","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:fogo.production.batches.view","role_code":"gerente","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:fogo.production.orders.view","role_code":"gerente","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.access","role_code":"gerente","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.analytics.internal_reports.view","role_code":"gerente","permission_key":"nexo.analytics.internal_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.analytics.margin_reports.view","role_code":"gerente","permission_key":"nexo.analytics.margin_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.assets.counts.view","role_code":"gerente","permission_key":"nexo.assets.counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.assets.groups.view","role_code":"gerente","permission_key":"nexo.assets.groups.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.assets.items.create","role_code":"gerente","permission_key":"nexo.assets.items.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.assets.items.view","role_code":"gerente","permission_key":"nexo.assets.items.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.catalog.categories.view","role_code":"gerente","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.catalog.presentations.view","role_code":"gerente","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.catalog.products.view","role_code":"gerente","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.catalog.request_policies.view","role_code":"gerente","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.catalog.units.view","role_code":"gerente","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.finance.cost_centers.view","role_code":"gerente","permission_key":"nexo.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.finance.internal_invoice_amounts.view","role_code":"gerente","permission_key":"nexo.finance.internal_invoice_amounts.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.finance.internal_invoices.view","role_code":"gerente","permission_key":"nexo.finance.internal_invoices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.finance.internal_prices.view","role_code":"gerente","permission_key":"nexo.finance.internal_prices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.finance.internal_variances.approve","role_code":"gerente","permission_key":"nexo.finance.internal_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.","condition_expression":"La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.finance.internal_variances.resolve","role_code":"gerente","permission_key":"nexo.finance.internal_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.","condition_expression":"La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.finance.internal_variances.view","role_code":"gerente","permission_key":"nexo.finance.internal_variances.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.adjustments.register","role_code":"gerente","permission_key":"nexo.inventory.adjustments.register","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.","condition_expression":"La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.adjustments.view","role_code":"gerente","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.entries.override","role_code":"gerente","permission_key":"nexo.inventory.entries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.","condition_expression":"La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.entries.view","role_code":"gerente","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.initial_counts.view","role_code":"gerente","permission_key":"nexo.inventory.initial_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.location_catalog.update","role_code":"gerente","permission_key":"nexo.inventory.location_catalog.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.locations.view","role_code":"gerente","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.lpns.view","role_code":"gerente","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.movements.view","role_code":"gerente","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.production_batches.view","role_code":"gerente","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.remissions.cancel","role_code":"gerente","permission_key":"nexo.inventory.remissions.cancel","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.remissions.update","role_code":"gerente","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.remissions.view","role_code":"gerente","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.stock.view","role_code":"gerente","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.stock_count_variances.approve","role_code":"gerente","permission_key":"nexo.inventory.stock_count_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, contexto vigente, segregación entre captura y aprobación o resolución, recurso compatible, motivo y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.stock_count_variances.resolve","role_code":"gerente","permission_key":"nexo.inventory.stock_count_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, contexto vigente, segregación entre captura y aprobación o resolución, recurso compatible, motivo y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.stock_counts.view","role_code":"gerente","permission_key":"nexo.inventory.stock_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.storage_positions.view","role_code":"gerente","permission_key":"nexo.inventory.storage_positions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.transfers.view","role_code":"gerente","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.warehouse_operations.view","role_code":"gerente","permission_key":"nexo.inventory.warehouse_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.withdrawals.view","role_code":"gerente","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.inventory.zones.view","role_code":"gerente","permission_key":"nexo.inventory.zones.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.logistics.driver_operations.view","role_code":"gerente","permission_key":"nexo.logistics.driver_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.logistics.fulfillment.view","role_code":"gerente","permission_key":"nexo.logistics.fulfillment.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.logistics.fulfillment_routes.view","role_code":"gerente","permission_key":"nexo.logistics.fulfillment_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.logistics.operations.view","role_code":"gerente","permission_key":"nexo.logistics.operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.logistics.operations_board.view","role_code":"gerente","permission_key":"nexo.logistics.operations_board.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.logistics.supply_routes.view","role_code":"gerente","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.printing.jobs.view","role_code":"gerente","permission_key":"nexo.printing.jobs.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.","condition_expression":"El gerente usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.printing.templates.update","role_code":"gerente","permission_key":"nexo.printing.templates.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.settings.remission_policies.view","role_code":"gerente","permission_key":"nexo.settings.remission_policies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:nexo.settings.sites.view","role_code":"gerente","permission_key":"nexo.settings.sites.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:numera.access","role_code":"gerente","permission_key":"numera.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:numera.analytics.break_even.view","role_code":"gerente","permission_key":"numera.analytics.break_even.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:numera.analytics.financial_reports.view","role_code":"gerente","permission_key":"numera.analytics.financial_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:numera.analytics.profitability.view","role_code":"gerente","permission_key":"numera.analytics.profitability.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:numera.finance.cost_centers.view","role_code":"gerente","permission_key":"numera.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:numera.finance.expenses.view","role_code":"gerente","permission_key":"numera.finance.expenses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:origo.access","role_code":"gerente","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:origo.catalog.product_reviews.view","role_code":"gerente","permission_key":"origo.catalog.product_reviews.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:origo.procurement.purchase_orders.view","role_code":"gerente","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:origo.procurement.receipts.register","role_code":"gerente","permission_key":"origo.procurement.receipts.register","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Carril base completo. No requiere turno ni check-in; exige orden, proveedor, documentos, sede receptora y recurso válidos. No registra stock ni sustituye la entrada física propietaria de NEXO.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:origo.procurement.receipts.view","role_code":"gerente","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:origo.procurement.suppliers.view","role_code":"gerente","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:pulso.delivery.deliveries.override","role_code":"gerente","permission_key":"pulso.delivery.deliveries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS-COMERCIAL ∩ CTX — componente base limitado a sedes comerciales asignadas; ejecución solo dentro del contexto operativo válido de la entrega.","condition_expression":"La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible, recurso y sede coincidentes.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:pulso.payments.transactions.refund","role_code":"gerente","permission_key":"pulso.payments.transactions.refund","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:pulso.payments.transactions.reverse","role_code":"gerente","permission_key":"pulso.payments.transactions.reverse","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:pulso.sales.discounts.apply","role_code":"gerente","permission_key":"pulso.sales.discounts.apply","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:pulso.sales.orders.cancel","role_code":"gerente","permission_key":"pulso.sales.orders.cancel","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:pulso.sales.returns.create","role_code":"gerente","permission_key":"pulso.sales.returns.create","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"AS/AA — sedes y áreas dentro de la cobertura administrativa activa del gerente; el recurso debe pertenecer a ese territorio.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente:shell.access","role_code":"gerente","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.access","role_code":"gerente","permission_key":"viso.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.catalog.commercial_categories.view","role_code":"gerente","permission_key":"viso.catalog.commercial_categories.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.content.menu.view","role_code":"gerente","permission_key":"viso.content.menu.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.delivery.rates.view","role_code":"gerente","permission_key":"viso.delivery.rates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.finance.accounting.view","role_code":"gerente","permission_key":"viso.finance.accounting.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.","condition_expression":"Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.organization.businesses.view","role_code":"gerente","permission_key":"viso.organization.businesses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.workforce.employees.view","role_code":"gerente","permission_key":"viso.workforce.employees.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.workforce.schedules.view","role_code":"gerente","permission_key":"viso.workforce.schedules.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.workforce.staff_calendar.view","role_code":"gerente","permission_key":"viso.workforce.staff_calendar.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente:viso.workforce.vacancies.view","role_code":"gerente","permission_key":"viso.workforce.vacancies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-003"}
{"grant_id":"base-role-grant:gerente_general:anima.access","role_code":"gerente_general","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.attendance.shifts.cancel","role_code":"gerente_general","permission_key":"anima.attendance.shifts.cancel","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.attendance.shifts.create","role_code":"gerente_general","permission_key":"anima.attendance.shifts.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.attendance.shifts.update","role_code":"gerente_general","permission_key":"anima.attendance.shifts.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.workforce.employee_documents.delete","role_code":"gerente_general","permission_key":"anima.workforce.employee_documents.delete","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.workforce.employee_documents.upload","role_code":"gerente_general","permission_key":"anima.workforce.employee_documents.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.workforce.employee_documents.view","role_code":"gerente_general","permission_key":"anima.workforce.employee_documents.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.workforce.employee_photos.upload","role_code":"gerente_general","permission_key":"anima.workforce.employee_photos.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.workforce.staff_invitations.create","role_code":"gerente_general","permission_key":"anima.workforce.staff_invitations.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:anima.workforce.team_members.view","role_code":"gerente_general","permission_key":"anima.workforce.team_members.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:aura.access","role_code":"gerente_general","permission_key":"aura.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:fogo.access","role_code":"gerente_general","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:fogo.production.batches.view","role_code":"gerente_general","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:fogo.production.orders.view","role_code":"gerente_general","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:fogo.production.recipes.view","role_code":"gerente_general","permission_key":"fogo.production.recipes.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.access","role_code":"gerente_general","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.analytics.internal_reports.view","role_code":"gerente_general","permission_key":"nexo.analytics.internal_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.analytics.margin_reports.view","role_code":"gerente_general","permission_key":"nexo.analytics.margin_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.assets.counts.view","role_code":"gerente_general","permission_key":"nexo.assets.counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.assets.groups.view","role_code":"gerente_general","permission_key":"nexo.assets.groups.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.assets.items.create","role_code":"gerente_general","permission_key":"nexo.assets.items.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.assets.items.view","role_code":"gerente_general","permission_key":"nexo.assets.items.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.catalog.categories.view","role_code":"gerente_general","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.catalog.presentations.view","role_code":"gerente_general","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.catalog.products.create","role_code":"gerente_general","permission_key":"nexo.catalog.products.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.catalog.products.view","role_code":"gerente_general","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.catalog.request_policies.view","role_code":"gerente_general","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.catalog.units.view","role_code":"gerente_general","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.cost_centers.view","role_code":"gerente_general","permission_key":"nexo.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_invoice_amounts.view","role_code":"gerente_general","permission_key":"nexo.finance.internal_invoice_amounts.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_invoices.cancel","role_code":"gerente_general","permission_key":"nexo.finance.internal_invoices.cancel","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_invoices.generate","role_code":"gerente_general","permission_key":"nexo.finance.internal_invoices.generate","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_invoices.issue","role_code":"gerente_general","permission_key":"nexo.finance.internal_invoices.issue","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_invoices.view","role_code":"gerente_general","permission_key":"nexo.finance.internal_invoices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_prices.view","role_code":"gerente_general","permission_key":"nexo.finance.internal_prices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_variances.approve","role_code":"gerente_general","permission_key":"nexo.finance.internal_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_variances.resolve","role_code":"gerente_general","permission_key":"nexo.finance.internal_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.finance.internal_variances.view","role_code":"gerente_general","permission_key":"nexo.finance.internal_variances.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.adjustments.register","role_code":"gerente_general","permission_key":"nexo.inventory.adjustments.register","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.adjustments.view","role_code":"gerente_general","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.entries.override","role_code":"gerente_general","permission_key":"nexo.inventory.entries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.entries.view","role_code":"gerente_general","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.initial_counts.view","role_code":"gerente_general","permission_key":"nexo.inventory.initial_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.location_catalog.update","role_code":"gerente_general","permission_key":"nexo.inventory.location_catalog.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.locations.view","role_code":"gerente_general","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.lpns.view","role_code":"gerente_general","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.movements.view","role_code":"gerente_general","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.production_batches.view","role_code":"gerente_general","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.remissions.cancel","role_code":"gerente_general","permission_key":"nexo.inventory.remissions.cancel","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.remissions.update","role_code":"gerente_general","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.remissions.view","role_code":"gerente_general","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.stock.view","role_code":"gerente_general","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.stock_count_variances.approve","role_code":"gerente_general","permission_key":"nexo.inventory.stock_count_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, contexto vigente, segregación entre captura y aprobación o resolución, recurso compatible, motivo y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.stock_count_variances.resolve","role_code":"gerente_general","permission_key":"nexo.inventory.stock_count_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, contexto vigente, segregación entre captura y aprobación o resolución, recurso compatible, motivo y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.stock_counts.view","role_code":"gerente_general","permission_key":"nexo.inventory.stock_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.storage_positions.view","role_code":"gerente_general","permission_key":"nexo.inventory.storage_positions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.transfers.view","role_code":"gerente_general","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.warehouse_operations.view","role_code":"gerente_general","permission_key":"nexo.inventory.warehouse_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.withdrawals.view","role_code":"gerente_general","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.inventory.zones.view","role_code":"gerente_general","permission_key":"nexo.inventory.zones.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.logistics.driver_operations.view","role_code":"gerente_general","permission_key":"nexo.logistics.driver_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.logistics.fulfillment.view","role_code":"gerente_general","permission_key":"nexo.logistics.fulfillment.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.logistics.fulfillment_routes.view","role_code":"gerente_general","permission_key":"nexo.logistics.fulfillment_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.logistics.operations.view","role_code":"gerente_general","permission_key":"nexo.logistics.operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.logistics.operations_board.view","role_code":"gerente_general","permission_key":"nexo.logistics.operations_board.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.logistics.supply_routes.view","role_code":"gerente_general","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.printing.jobs.view","role_code":"gerente_general","permission_key":"nexo.printing.jobs.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.printing.templates.update","role_code":"gerente_general","permission_key":"nexo.printing.templates.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto y, cuando sea local, AS/SS/AST/AA/SA/AAT explícitos; sin G genérico.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.settings.remission_policies.view","role_code":"gerente_general","permission_key":"nexo.settings.remission_policies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:nexo.settings.sites.view","role_code":"gerente_general","permission_key":"nexo.settings.sites.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:numera.access","role_code":"gerente_general","permission_key":"numera.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:numera.analytics.break_even.view","role_code":"gerente_general","permission_key":"numera.analytics.break_even.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:numera.analytics.financial_reports.view","role_code":"gerente_general","permission_key":"numera.analytics.financial_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:numera.analytics.profitability.view","role_code":"gerente_general","permission_key":"numera.analytics.profitability.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:numera.finance.cost_centers.view","role_code":"gerente_general","permission_key":"numera.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:numera.finance.expenses.view","role_code":"gerente_general","permission_key":"numera.finance.expenses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:origo.access","role_code":"gerente_general","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:origo.catalog.product_reviews.view","role_code":"gerente_general","permission_key":"origo.catalog.product_reviews.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:origo.procurement.purchase_orders.view","role_code":"gerente_general","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:origo.procurement.receipts.register","role_code":"gerente_general","permission_key":"origo.procurement.receipts.register","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base completo. No requiere turno ni check-in; exige orden, proveedor, documentos, sede receptora y recurso válidos. No registra stock ni sustituye la entrada física propietaria de NEXO.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:origo.procurement.receipts.view","role_code":"gerente_general","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:origo.procurement.suppliers.view","role_code":"gerente_general","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El gerente general usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:pass.access","role_code":"gerente_general","permission_key":"pass.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-CLIENT-ADMIN — superficie laboral-administrativa no territorial.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:pulso.delivery.deliveries.override","role_code":"gerente_general","permission_key":"pulso.delivery.deliveries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"Cobertura base explícita sobre sedes comerciales ordinarias; ejecución = alcance base ∩ CTX operativo de la entrega.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:pulso.payments.transactions.refund","role_code":"gerente_general","permission_key":"pulso.payments.transactions.refund","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:pulso.payments.transactions.reverse","role_code":"gerente_general","permission_key":"pulso.payments.transactions.reverse","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:pulso.sales.discounts.apply","role_code":"gerente_general","permission_key":"pulso.sales.discounts.apply","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:pulso.sales.orders.cancel","role_code":"gerente_general","permission_key":"pulso.sales.orders.cancel","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:pulso.sales.returns.create","role_code":"gerente_general","permission_key":"pulso.sales.returns.create","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:shell.access","role_code":"gerente_general","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.access","role_code":"gerente_general","permission_key":"viso.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.audit_logs.view","role_code":"gerente_general","permission_key":"viso.authorization.audit_logs.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.base_grants.approve","role_code":"gerente_general","permission_key":"viso.authorization.base_grants.approve","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.base_grants.create","role_code":"gerente_general","permission_key":"viso.authorization.base_grants.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.base_grants.revoke","role_code":"gerente_general","permission_key":"viso.authorization.base_grants.revoke","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.base_grants.suspend","role_code":"gerente_general","permission_key":"viso.authorization.base_grants.suspend","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.base_grants.view","role_code":"gerente_general","permission_key":"viso.authorization.base_grants.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.context_simulations.view","role_code":"gerente_general","permission_key":"viso.authorization.context_simulations.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"OWN más consulta de terceros mediante concesión administrativa sensible explícita; sin impersonación real.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.denials.create","role_code":"gerente_general","permission_key":"viso.authorization.denials.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.denials.view","role_code":"gerente_general","permission_key":"viso.authorization.denials.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.operational_grants.approve","role_code":"gerente_general","permission_key":"viso.authorization.operational_grants.approve","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.operational_grants.create","role_code":"gerente_general","permission_key":"viso.authorization.operational_grants.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.operational_grants.revoke","role_code":"gerente_general","permission_key":"viso.authorization.operational_grants.revoke","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.operational_grants.suspend","role_code":"gerente_general","permission_key":"viso.authorization.operational_grants.suspend","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.authorization.operational_grants.view","role_code":"gerente_general","permission_key":"viso.authorization.operational_grants.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:gerente_general:viso.catalog.commercial_categories.view","role_code":"gerente_general","permission_key":"viso.catalog.commercial_categories.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.content.content_blocks.view","role_code":"gerente_general","permission_key":"viso.content.content_blocks.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.content.menu.view","role_code":"gerente_general","permission_key":"viso.content.menu.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.content.website_content.view","role_code":"gerente_general","permission_key":"viso.content.website_content.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.delivery.rates.view","role_code":"gerente_general","permission_key":"viso.delivery.rates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.finance.accounting.view","role_code":"gerente_general","permission_key":"viso.finance.accounting.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.loyalty.customers.view","role_code":"gerente_general","permission_key":"viso.loyalty.customers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"Dominio cliente o negocio completo mediante concesión base explícita; sede solo como filtro de actividad.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.loyalty.products.view","role_code":"gerente_general","permission_key":"viso.loyalty.products.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.organization.businesses.view","role_code":"gerente_general","permission_key":"viso.organization.businesses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.platform.app_updates.view","role_code":"gerente_general","permission_key":"viso.platform.app_updates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.workforce.employees.view","role_code":"gerente_general","permission_key":"viso.workforce.employees.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.workforce.schedules.view","role_code":"gerente_general","permission_key":"viso.workforce.schedules.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.workforce.staff_calendar.view","role_code":"gerente_general","permission_key":"viso.workforce.staff_calendar.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:gerente_general:viso.workforce.vacancies.view","role_code":"gerente_general","permission_key":"viso.workforce.vacancies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-002"}
{"grant_id":"base-role-grant:marketing:anima.access","role_code":"marketing","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos, módulos ni acciones internas.","condition_expression":"Carril base. Permite utilizar la superficie laboral personal de ANIMA; no concede gestión de documentos, equipo, invitaciones ni turnos.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:aura.access","role_code":"marketing","permission_key":"aura.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP-DORMANT — entrada no territorial a una aplicación diferida; la concesión permanece inactiva hasta que AURA sea auditada y habilitada formalmente.","condition_expression":"Carril base. Capacidad reservada para el dominio funcional de marketing. No podrá utilizarse productivamente hasta confirmar repositorio, procesos, datos, responsables y controles de AURA.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:nexo.access","role_code":"marketing","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos, módulos ni acciones internas.","condition_expression":"Carril base. Entrada administrativa de consulta al catálogo; no habilita inventario, logística, finanzas, impresión ni operación física.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:nexo.catalog.categories.view","role_code":"marketing","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CATALOG — referencia comercial organizacional exacta para productos, presentaciones, categorías o unidades dentro del entorno productivo ordinario; excluye APP-REVIEW, demo, pruebas y campos internos no necesarios.","condition_expression":"Carril base de solo lectura. Se limita a atributos comerciales necesarios para contenido, menú, fichas y campañas. Costos, márgenes, existencias, proveedores, recetas y campos técnicos requieren permisos separados.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:nexo.catalog.presentations.view","role_code":"marketing","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CATALOG — referencia comercial organizacional exacta para productos, presentaciones, categorías o unidades dentro del entorno productivo ordinario; excluye APP-REVIEW, demo, pruebas y campos internos no necesarios.","condition_expression":"Carril base de solo lectura. Se limita a atributos comerciales necesarios para contenido, menú, fichas y campañas. Costos, márgenes, existencias, proveedores, recetas y campos técnicos requieren permisos separados.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:nexo.catalog.products.view","role_code":"marketing","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CATALOG — referencia comercial organizacional exacta para productos, presentaciones, categorías o unidades dentro del entorno productivo ordinario; excluye APP-REVIEW, demo, pruebas y campos internos no necesarios.","condition_expression":"Carril base de solo lectura. Se limita a atributos comerciales necesarios para contenido, menú, fichas y campañas. Costos, márgenes, existencias, proveedores, recetas y campos técnicos requieren permisos separados.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:nexo.catalog.units.view","role_code":"marketing","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CATALOG — referencia comercial organizacional exacta para productos, presentaciones, categorías o unidades dentro del entorno productivo ordinario; excluye APP-REVIEW, demo, pruebas y campos internos no necesarios.","condition_expression":"Carril base de solo lectura. Se limita a atributos comerciales necesarios para contenido, menú, fichas y campañas. Costos, márgenes, existencias, proveedores, recetas y campos técnicos requieren permisos separados.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:shell.access","role_code":"marketing","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos, módulos ni acciones internas.","condition_expression":"Carril base. Permite ingresar al hub laboral; no amplía la matriz ni concede aplicaciones adicionales.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.access","role_code":"marketing","permission_key":"viso.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a datos, módulos ni acciones internas.","condition_expression":"Carril base. Entrada a la superficie administrativa de VISO; cada módulo interno exige su permiso explícito.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.catalog.commercial_categories.view","role_code":"marketing","permission_key":"viso.catalog.commercial_categories.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CONTENT — contenido y configuración comercial de las unidades, marcas o canales ordinarios expresamente cubiertos por el recurso; excluye entornos aislados.","condition_expression":"Carril base de consulta. Permite organizar contenido y campañas por categorías comerciales; no autoriza crear, editar o retirar categorías.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.content.content_blocks.view","role_code":"marketing","permission_key":"viso.content.content_blocks.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CONTENT — contenido y configuración comercial de las unidades, marcas o canales ordinarios expresamente cubiertos por el recurso; excluye entornos aislados.","condition_expression":"Carril base de consulta. Permite revisar bloques de contenido; no autoriza crearlos, editarlos, publicarlos ni eliminarlos.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.content.menu.view","role_code":"marketing","permission_key":"viso.content.menu.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CONTENT — contenido y configuración comercial de las unidades, marcas o canales ordinarios expresamente cubiertos por el recurso; excluye entornos aislados.","condition_expression":"Carril base de consulta. Permite revisar el menú y su información comercial; no autoriza editar precios, disponibilidad, recetas ni configuración operativa.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.content.website_content.view","role_code":"marketing","permission_key":"viso.content.website_content.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CONTENT — contenido y configuración comercial de las unidades, marcas o canales ordinarios expresamente cubiertos por el recurso; excluye entornos aislados.","condition_expression":"Carril base de consulta. Permite revisar contenido del sitio web; no concede publicación, edición, infraestructura, analítica ni administración técnica.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.delivery.rates.view","role_code":"marketing","permission_key":"viso.delivery.rates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-COMMERCIAL — tarifas y coberturas necesarias para comunicación comercial y campañas, únicamente en modo de consulta.","condition_expression":"Carril base de consulta. Solo para comunicar coberturas, condiciones y promociones; no permite modificar tarifas ni reglas de entrega.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.loyalty.products.view","role_code":"marketing","permission_key":"viso.loyalty.products.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G-CAMPAIGN — productos y beneficios de fidelización para planeación de campañas; no concede acceso a clientes, puntos, canjes ni administración de PASS.","condition_expression":"Carril base de consulta. Permite diseñar comunicación y campañas sobre beneficios existentes; no concede acceso a clientes ni modificación del programa.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:marketing:viso.organization.businesses.view","role_code":"marketing","permission_key":"viso.organization.businesses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-REF — consulta de empresas, marcas y unidades de negocio necesarias para segmentar contenido y campañas; sin capacidad de modificación.","condition_expression":"Carril base de consulta. Permite identificar empresa, marca, unidad y canal aplicables al contenido; no concede administración organizacional.","source_task":"AUTH-RBAC-007"}
{"grant_id":"base-role-grant:propietario:anima.access","role_code":"propietario","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.attendance.shifts.cancel","role_code":"propietario","permission_key":"anima.attendance.shifts.cancel","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.attendance.shifts.create","role_code":"propietario","permission_key":"anima.attendance.shifts.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.attendance.shifts.update","role_code":"propietario","permission_key":"anima.attendance.shifts.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.workforce.employee_documents.delete","role_code":"propietario","permission_key":"anima.workforce.employee_documents.delete","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.workforce.employee_documents.upload","role_code":"propietario","permission_key":"anima.workforce.employee_documents.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.workforce.employee_documents.view","role_code":"propietario","permission_key":"anima.workforce.employee_documents.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.workforce.employee_photos.upload","role_code":"propietario","permission_key":"anima.workforce.employee_photos.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.workforce.staff_invitations.create","role_code":"propietario","permission_key":"anima.workforce.staff_invitations.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:anima.workforce.team_members.view","role_code":"propietario","permission_key":"anima.workforce.team_members.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:aura.access","role_code":"propietario","permission_key":"aura.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:fogo.access","role_code":"propietario","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:fogo.production.batches.view","role_code":"propietario","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:fogo.production.orders.view","role_code":"propietario","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:fogo.production.recipes.view","role_code":"propietario","permission_key":"fogo.production.recipes.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.access","role_code":"propietario","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.analytics.internal_reports.view","role_code":"propietario","permission_key":"nexo.analytics.internal_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.analytics.margin_reports.view","role_code":"propietario","permission_key":"nexo.analytics.margin_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.assets.counts.view","role_code":"propietario","permission_key":"nexo.assets.counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.assets.groups.view","role_code":"propietario","permission_key":"nexo.assets.groups.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.assets.items.create","role_code":"propietario","permission_key":"nexo.assets.items.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.assets.items.view","role_code":"propietario","permission_key":"nexo.assets.items.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.catalog.categories.view","role_code":"propietario","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.catalog.presentations.view","role_code":"propietario","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.catalog.products.create","role_code":"propietario","permission_key":"nexo.catalog.products.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.catalog.products.view","role_code":"propietario","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.catalog.request_policies.view","role_code":"propietario","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.catalog.units.view","role_code":"propietario","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.cost_centers.view","role_code":"propietario","permission_key":"nexo.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_invoice_amounts.view","role_code":"propietario","permission_key":"nexo.finance.internal_invoice_amounts.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_invoices.cancel","role_code":"propietario","permission_key":"nexo.finance.internal_invoices.cancel","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_invoices.generate","role_code":"propietario","permission_key":"nexo.finance.internal_invoices.generate","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_invoices.issue","role_code":"propietario","permission_key":"nexo.finance.internal_invoices.issue","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_invoices.view","role_code":"propietario","permission_key":"nexo.finance.internal_invoices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_prices.view","role_code":"propietario","permission_key":"nexo.finance.internal_prices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_variances.approve","role_code":"propietario","permission_key":"nexo.finance.internal_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_variances.resolve","role_code":"propietario","permission_key":"nexo.finance.internal_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.finance.internal_variances.view","role_code":"propietario","permission_key":"nexo.finance.internal_variances.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.adjustments.register","role_code":"propietario","permission_key":"nexo.inventory.adjustments.register","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.adjustments.view","role_code":"propietario","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.entries.override","role_code":"propietario","permission_key":"nexo.inventory.entries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.entries.view","role_code":"propietario","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.initial_counts.view","role_code":"propietario","permission_key":"nexo.inventory.initial_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.location_catalog.update","role_code":"propietario","permission_key":"nexo.inventory.location_catalog.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.locations.view","role_code":"propietario","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.lpns.view","role_code":"propietario","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.movements.view","role_code":"propietario","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.production_batches.view","role_code":"propietario","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.remissions.cancel","role_code":"propietario","permission_key":"nexo.inventory.remissions.cancel","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.remissions.update","role_code":"propietario","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.remissions.view","role_code":"propietario","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.stock.view","role_code":"propietario","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.stock_count_variances.approve","role_code":"propietario","permission_key":"nexo.inventory.stock_count_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, contexto vigente, segregación entre captura y aprobación o resolución, recurso compatible, motivo y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.stock_count_variances.resolve","role_code":"propietario","permission_key":"nexo.inventory.stock_count_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, contexto vigente, segregación entre captura y aprobación o resolución, recurso compatible, motivo y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.stock_counts.view","role_code":"propietario","permission_key":"nexo.inventory.stock_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.storage_positions.view","role_code":"propietario","permission_key":"nexo.inventory.storage_positions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.transfers.view","role_code":"propietario","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.warehouse_operations.view","role_code":"propietario","permission_key":"nexo.inventory.warehouse_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.withdrawals.view","role_code":"propietario","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.inventory.zones.view","role_code":"propietario","permission_key":"nexo.inventory.zones.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.logistics.driver_operations.view","role_code":"propietario","permission_key":"nexo.logistics.driver_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.logistics.fulfillment.view","role_code":"propietario","permission_key":"nexo.logistics.fulfillment.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.logistics.fulfillment_routes.view","role_code":"propietario","permission_key":"nexo.logistics.fulfillment_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.logistics.operations.view","role_code":"propietario","permission_key":"nexo.logistics.operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.logistics.operations_board.view","role_code":"propietario","permission_key":"nexo.logistics.operations_board.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.logistics.supply_routes.view","role_code":"propietario","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.printing.jobs.view","role_code":"propietario","permission_key":"nexo.printing.jobs.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.printing.templates.update","role_code":"propietario","permission_key":"nexo.printing.templates.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto y, cuando sea local, AS/SS/AST/AA/SA/AAT explícitos; sin G genérico.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.settings.remission_policies.view","role_code":"propietario","permission_key":"nexo.settings.remission_policies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:nexo.settings.sites.view","role_code":"propietario","permission_key":"nexo.settings.sites.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:numera.access","role_code":"propietario","permission_key":"numera.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:numera.analytics.break_even.view","role_code":"propietario","permission_key":"numera.analytics.break_even.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:numera.analytics.financial_reports.view","role_code":"propietario","permission_key":"numera.analytics.financial_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:numera.analytics.profitability.view","role_code":"propietario","permission_key":"numera.analytics.profitability.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:numera.finance.cost_centers.view","role_code":"propietario","permission_key":"numera.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:numera.finance.expenses.view","role_code":"propietario","permission_key":"numera.finance.expenses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:origo.access","role_code":"propietario","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:origo.catalog.product_reviews.view","role_code":"propietario","permission_key":"origo.catalog.product_reviews.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:origo.procurement.purchase_orders.view","role_code":"propietario","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:origo.procurement.receipts.register","role_code":"propietario","permission_key":"origo.procurement.receipts.register","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base completo. No requiere turno ni check-in; exige orden, proveedor, documentos, sede receptora y recurso válidos. No registra stock ni sustituye la entrada física propietaria de NEXO.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:origo.procurement.receipts.view","role_code":"propietario","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:origo.procurement.suppliers.view","role_code":"propietario","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"El propietario usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:pass.access","role_code":"propietario","permission_key":"pass.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-CLIENT-ADMIN — superficie laboral-administrativa no territorial.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:pulso.delivery.deliveries.override","role_code":"propietario","permission_key":"pulso.delivery.deliveries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"Cobertura base explícita sobre sedes comerciales ordinarias; ejecución = alcance base ∩ CTX operativo de la entrega.","condition_expression":"La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:pulso.payments.transactions.refund","role_code":"propietario","permission_key":"pulso.payments.transactions.refund","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:pulso.payments.transactions.reverse","role_code":"propietario","permission_key":"pulso.payments.transactions.reverse","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:pulso.sales.discounts.apply","role_code":"propietario","permission_key":"pulso.sales.discounts.apply","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:pulso.sales.orders.cancel","role_code":"propietario","permission_key":"pulso.sales.orders.cancel","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:pulso.sales.returns.create","role_code":"propietario","permission_key":"pulso.sales.returns.create","authorization_mode":"BASE_AND_OPERATIONAL","lane":"BASE","grant_type":"BASE_COMPONENT","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Componente base únicamente. La acción exige además componente operativo del mismo actor, turno y check-in vigentes, caja y recurso compatibles, reautenticación fuerte, motivo, evidencia, control de versión y auditoría.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:shell.access","role_code":"propietario","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.access","role_code":"propietario","permission_key":"viso.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso no territorial a la aplicación.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.authorization.audit_logs.view","role_code":"propietario","permission_key":"viso.authorization.audit_logs.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.authorization.base_grants.approve","role_code":"propietario","permission_key":"viso.authorization.base_grants.approve","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.base_grants.create","role_code":"propietario","permission_key":"viso.authorization.base_grants.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.base_grants.revoke","role_code":"propietario","permission_key":"viso.authorization.base_grants.revoke","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.base_grants.suspend","role_code":"propietario","permission_key":"viso.authorization.base_grants.suspend","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.base_grants.view","role_code":"propietario","permission_key":"viso.authorization.base_grants.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.context_simulations.view","role_code":"propietario","permission_key":"viso.authorization.context_simulations.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"OWN más consulta de terceros mediante concesión administrativa sensible explícita; sin impersonación real.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.authorization.denials.approve","role_code":"propietario","permission_key":"viso.authorization.denials.approve","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.denials.create","role_code":"propietario","permission_key":"viso.authorization.denials.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.denials.revoke","role_code":"propietario","permission_key":"viso.authorization.denials.revoke","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.denials.view","role_code":"propietario","permission_key":"viso.authorization.denials.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.operational_grants.approve","role_code":"propietario","permission_key":"viso.authorization.operational_grants.approve","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.operational_grants.create","role_code":"propietario","permission_key":"viso.authorization.operational_grants.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.operational_grants.revoke","role_code":"propietario","permission_key":"viso.authorization.operational_grants.revoke","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.operational_grants.suspend","role_code":"propietario","permission_key":"viso.authorization.operational_grants.suspend","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.authorization.operational_grants.view","role_code":"propietario","permission_key":"viso.authorization.operational_grants.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG — gobierno organizacional ordinario; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base sensible. Requiere reautenticación fuerte, actor activo, recurso objetivo válido, segregación de funciones y auditoría; no permite autoaprobación ni autoafectación.","source_task":"AUTH-CAT-023"}
{"grant_id":"base-role-grant:propietario:viso.catalog.commercial_categories.view","role_code":"propietario","permission_key":"viso.catalog.commercial_categories.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.content.content_blocks.view","role_code":"propietario","permission_key":"viso.content.content_blocks.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.content.menu.view","role_code":"propietario","permission_key":"viso.content.menu.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.content.website_content.view","role_code":"propietario","permission_key":"viso.content.website_content.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.delivery.rates.view","role_code":"propietario","permission_key":"viso.delivery.rates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.finance.accounting.view","role_code":"propietario","permission_key":"viso.finance.accounting.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.loyalty.customers.view","role_code":"propietario","permission_key":"viso.loyalty.customers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"Dominio cliente o negocio completo mediante concesión base explícita; sede solo como filtro de actividad.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.loyalty.products.view","role_code":"propietario","permission_key":"viso.loyalty.products.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.organization.businesses.view","role_code":"propietario","permission_key":"viso.organization.businesses.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.platform.app_updates.view","role_code":"propietario","permission_key":"viso.platform.app_updates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.workforce.employees.view","role_code":"propietario","permission_key":"viso.workforce.employees.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.workforce.schedules.view","role_code":"propietario","permission_key":"viso.workforce.schedules.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.workforce.staff_calendar.view","role_code":"propietario","permission_key":"viso.workforce.staff_calendar.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:propietario:viso.workforce.vacancies.view","role_code":"propietario","permission_key":"viso.workforce.vacancies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados.","condition_expression":"Carril base. Sin turno ni check-in.","source_task":"AUTH-RBAC-001"}
{"grant_id":"base-role-grant:supervisor:anima.access","role_code":"supervisor","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:anima.attendance.shifts.create","role_code":"supervisor","permission_key":"anima.attendance.shifts.create","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — turnos del personal y de las áreas dentro de la cobertura administrativa activa del supervisor.","condition_expression":"Carril base. Apoyo a la programación local. No crea cobertura territorial, no cambia roles base y no sustituye una aprobación superior cuando el flujo la exija.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:anima.attendance.shifts.update","role_code":"supervisor","permission_key":"anima.attendance.shifts.update","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — turnos del personal y de las áreas dentro de la cobertura administrativa activa del supervisor.","condition_expression":"Carril base. Solo cambios permitidos por estado y campo. No cancela turnos ni modifica relaciones laborales fuera de la sede administrada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:anima.workforce.employee_documents.upload","role_code":"supervisor","permission_key":"anima.workforce.employee_documents.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — documentos del personal vinculados a sedes o áreas asignadas al supervisor.","condition_expression":"Carril base. Solo carga de documentos admitidos por el flujo local; no elimina, reclasifica ni administra expedientes fuera de su cobertura.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:anima.workforce.employee_documents.view","role_code":"supervisor","permission_key":"anima.workforce.employee_documents.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:anima.workforce.employee_photos.upload","role_code":"supervisor","permission_key":"anima.workforce.employee_photos.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores vinculados a sedes o áreas asignadas al supervisor.","condition_expression":"Carril base. Solo actualización autorizada de fotografía; no modifica identidad, rol base, sede ni perfil administrativo.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:anima.workforce.team_members.view","role_code":"supervisor","permission_key":"anima.workforce.team_members.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:fogo.access","role_code":"supervisor","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:fogo.production.batches.view","role_code":"supervisor","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:fogo.production.orders.view","role_code":"supervisor","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.access","role_code":"supervisor","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.analytics.internal_reports.view","role_code":"supervisor","permission_key":"nexo.analytics.internal_reports.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — reportes operativos de sedes o áreas asignadas.","condition_expression":"Carril base. Excluye margen completo, rentabilidad consolidada y datos de otras unidades.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.assets.counts.view","role_code":"supervisor","permission_key":"nexo.assets.counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.assets.groups.view","role_code":"supervisor","permission_key":"nexo.assets.groups.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.assets.items.view","role_code":"supervisor","permission_key":"nexo.assets.items.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.catalog.categories.view","role_code":"supervisor","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.catalog.presentations.view","role_code":"supervisor","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.catalog.products.view","role_code":"supervisor","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.catalog.request_policies.view","role_code":"supervisor","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.catalog.units.view","role_code":"supervisor","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.","condition_expression":"Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.finance.cost_centers.view","role_code":"supervisor","permission_key":"nexo.finance.cost_centers.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/ORG-LOCAL — centros de costo estrictamente vinculados a las sedes asignadas.","condition_expression":"Carril base. Consulta de referencia operativa; no concede reportes financieros completos ni capacidad de configuración.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.finance.internal_invoices.view","role_code":"supervisor","permission_key":"nexo.finance.internal_invoices.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — facturas internas relacionadas con sedes asignadas al supervisor.","condition_expression":"Carril base. Consulta operativa del documento y su estado; no incluye valores protegidos por permiso separado ni permite generar, emitir o cancelar.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.finance.internal_variances.view","role_code":"supervisor","permission_key":"nexo.finance.internal_variances.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — variaciones operativas asociadas a sedes o áreas asignadas.","condition_expression":"Carril base. Solo revisión y seguimiento. No aprueba ni resuelve la variación.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.adjustments.view","role_code":"supervisor","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.entries.view","role_code":"supervisor","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.initial_counts.view","role_code":"supervisor","permission_key":"nexo.inventory.initial_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.locations.view","role_code":"supervisor","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.lpns.view","role_code":"supervisor","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.movements.view","role_code":"supervisor","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.production_batches.view","role_code":"supervisor","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.remissions.update","role_code":"supervisor","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — remisiones en las que participe una sede asignada y el contrato permita edición desde ese extremo.","condition_expression":"Carril base. Solo correcciones ordinarias en estados y campos editables. No cancela, despacha, recibe ni altera efectos ya consolidados.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.remissions.view","role_code":"supervisor","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.stock.view","role_code":"supervisor","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.stock_counts.view","role_code":"supervisor","permission_key":"nexo.inventory.stock_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.storage_positions.view","role_code":"supervisor","permission_key":"nexo.inventory.storage_positions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.transfers.view","role_code":"supervisor","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.warehouse_operations.view","role_code":"supervisor","permission_key":"nexo.inventory.warehouse_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.withdrawals.view","role_code":"supervisor","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.inventory.zones.view","role_code":"supervisor","permission_key":"nexo.inventory.zones.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.logistics.driver_operations.view","role_code":"supervisor","permission_key":"nexo.logistics.driver_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.logistics.fulfillment.view","role_code":"supervisor","permission_key":"nexo.logistics.fulfillment.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.logistics.fulfillment_routes.view","role_code":"supervisor","permission_key":"nexo.logistics.fulfillment_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.logistics.operations.view","role_code":"supervisor","permission_key":"nexo.logistics.operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.logistics.operations_board.view","role_code":"supervisor","permission_key":"nexo.logistics.operations_board.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.logistics.supply_routes.view","role_code":"supervisor","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.printing.jobs.view","role_code":"supervisor","permission_key":"nexo.printing.jobs.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.","condition_expression":"El supervisor usa el carril base; el carril operativo continúa independiente.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.settings.remission_policies.view","role_code":"supervisor","permission_key":"nexo.settings.remission_policies.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo consulta o seguimiento local. No modifica catálogos, políticas, plantillas ni estructura de sede.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:nexo.settings.sites.view","role_code":"supervisor","permission_key":"nexo.settings.sites.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.","condition_expression":"Carril base. Solo consulta o seguimiento local. No modifica catálogos, políticas, plantillas ni estructura de sede.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:origo.access","role_code":"supervisor","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:origo.procurement.purchase_orders.view","role_code":"supervisor","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:origo.procurement.receipts.view","role_code":"supervisor","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato.","condition_expression":"Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:origo.procurement.suppliers.view","role_code":"supervisor","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"ORG-LOCAL — proveedores relacionados con compras o recepciones de las sedes asignadas.","condition_expression":"Carril base. Solo datos operativos necesarios para seguimiento; campos contractuales o financieros sensibles permanecen enmascarados o denegados.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:shell.access","role_code":"supervisor","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:viso.access","role_code":"supervisor","permission_key":"viso.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.","condition_expression":"Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:viso.delivery.rates.view","role_code":"supervisor","permission_key":"viso.delivery.rates.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/SS/AA/SA explícitos — tarifas aplicables a sedes o áreas asignadas.","condition_expression":"Carril base. Solo consulta para operación local; no modifica tarifas ni políticas de entrega.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:viso.workforce.employees.view","role_code":"supervisor","permission_key":"viso.workforce.employees.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:viso.workforce.schedules.view","role_code":"supervisor","permission_key":"viso.workforce.schedules.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-004"}
{"grant_id":"base-role-grant:supervisor:viso.workforce.staff_calendar.view","role_code":"supervisor","permission_key":"viso.workforce.staff_calendar.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor.","condition_expression":"Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.","source_task":"AUTH-RBAC-004"}
```

---

#### 19. Fuera del alcance

AUTH-RBAC-024 no:

- crea un archivo JSON físico dentro del repositorio;
- publica un paquete;
- inserta `role_permissions`;
- elimina permisos legacy;
- migra empleados;
- crea roles;
- genera UUID;
- expande territorios;
- cambia RLS;
- cambia RPC;
- implementa guards;
- modifica dispositivos;
- crea excepciones;
- crea denegaciones;
- ejecuta rollback;
- modifica Supabase.

---

#### 20. Riesgos controlados

##### Riesgo 1 — Wildcard de propietario

Control:

```text
121 FILAS EXPLÍCITAS
≠
propietario = *
```

##### Riesgo 2 — Gerente se vuelve global

Control:

```text
scope_expression territorial
+
recurso real dentro de cobertura
```

##### Riesgo 3 — Componente base ejecuta acción operativa

Control:

```text
grant_type = BASE_COMPONENT
→ insuficiente por sí solo
```

##### Riesgo 4 — Roles legacy reaparecen

Control:

```text
solo siete roles base incluidos
```

##### Riesgo 5 — Clave legacy alimenta el dataset

Control:

```text
legacy_matches = 0
```

##### Riesgo 6 — Conteo lógico se confunde con filas físicas

Control:

```text
dataset lógico versionado
≠
proyección física posterior
```

##### Riesgo 7 — Aprobación modifica el hash

Control:

- estado y timestamp excluidos del payload;
- contenido semántico inmutable.

---

#### 21. Criterios de aprobación

AUTH-RBAC-024 podrá aprobarse cuando se acepte que:

1. el dataset se identifica como
   `vento.authorization.base-role-grants@1.0.0`;
2. referencia `vento.authorization@1.0.0`;
3. referencia la huella contractual exacta de AUTH-CAT-024;
4. contiene exactamente 499 registros lógicos;
5. incluye exactamente siete roles base;
6. contiene 463 concesiones directas;
7. contiene 36 componentes base;
8. no contiene roles operativos;
9. no contiene oficios base legacy;
10. no contiene permisos `OPERATIONAL_ONLY`;
11. no contiene claves legacy o retiradas;
12. ausencia de fila continúa siendo `DEFAULT_DENY`;
13. no se crean denegaciones explícitas redundantes;
14. el diff de 50 incorporaciones queda reproducido;
15. `BASE_COMPONENT` nunca autoriza por sí solo;
16. el orden y la serialización son deterministas;
17. el hash del dataset es
    `sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1`;
18. AUTH-RBAC-025 y AUTH-RBAC-026 no podrán modificar este dataset;
19. la proyección física se reserva para BLOQUE R;
20. no se implementan código, migraciones ni cambios en Supabase.

---

#### 22. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-CAT-024  | APROBADA    |
| AUTH-RBAC-024 | APROBADA    |
| AUTH-RBAC-025 | NO INICIADA |

No se avanza a AUTH-RBAC-025 hasta recibir aprobación explícita de
AUTH-RBAC-024.


### ✅ AUTH-RBAC-025 — Definir dataset canónico de matriz operativa

**Estado:** APROBADA
**Bloque:** BLOQUE D — Datasets canónicos  
**Naturaleza:** Definición documental de dataset lógico, versionado e inmutable  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-RBAC-024 — APROBADA  
**Tarea posterior reservada:** AUTH-RBAC-026 — Definir dataset canónico de excepciones y denegaciones  
**Dataset:** `vento.authorization.operational-role-grants@1.0.0`  
**Catálogo:** `vento.authorization@1.0.0`  
**Huella contractual:** `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`  
**Registros lógicos:** **240**  
**Roles operativos incluidos:** **12**  
**Hash del dataset propuesto:** `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f`

Esta tarea convierte las matrices operativas aprobadas en AUTH-RBAC-008 a
AUTH-RBAC-019 y el diff contractual aprobado en AUTH-CAT-023 en un dataset
lógico único, determinista, verificable y listo para su futura
materialización física.

No crea tablas, no inserta filas, no modifica Supabase, no genera
migraciones, no altera RLS o RPC y no publica archivos físicos del paquete
`@vento/contracts`.

---

#### 1. Objetivo

Definir de manera exacta:

1. cuáles son los doce roles operativos canónicos;
2. qué permisos activos recibe cada rol durante contexto operativo válido;
3. qué concesiones son completas por el carril operativo;
4. cuáles filas aportan únicamente el componente operativo de una
   autorización `BASE_AND_OPERATIONAL`;
5. cómo se expresan turno, check-in, sede, área y recurso;
6. cómo se incorpora el diff de 29 concesiones y el retiro de `dispatch`;
7. cómo se serializa, ordena, valida y verifica el dataset;
8. qué queda reservado para AUTH-RBAC-026, AUTH-RBAC-027,
   AUTH-RBAC-028 y BLOQUE R.

Flujo:

```text
MATRICES OPERATIVAS APROBADAS
AUTH-RBAC-008 A AUTH-RBAC-019
        +
DIFF CONTRACTUAL APROBADO
AUTH-CAT-023
        +
CATÁLOGO CONGELADO
AUTH-CAT-024
        ↓
DATASET CANÓNICO DE MATRIZ OPERATIVA
AUTH-RBAC-025
```

---

#### 2. Decisión principal

El dataset contiene exclusivamente concesiones positivas explícitas para:

```text
cajero_satelite
barista_satelite
cocinero_satelite
servicio_salon
mostrador_satelite
operador_integral_satelite
produccion_cocina
produccion_panaderia
produccion_reposteria
bodeguero
conductor_logistica
gerencia_operativa
```

No incluye:

- roles base;
- oficios base legacy;
- concesiones individuales;
- denegaciones;
- wildcards;
- claves legacy bloqueadas;
- permisos técnicos retirados;
- permisos `BASE_ONLY`;
- contexto operativo global;
- permisos permanentes;
- expansión por prefijo, aplicación o dispositivo.

Regla:

```text
FILA PRESENTE
+
MISMO ACTOR
+
ROL OPERATIVO ACTIVO
+
TURNO VÁLIDO
+
CHECK-IN CUANDO CORRESPONDA
+
SEDE Y ÁREA COMPATIBLES
+
RECURSO VÁLIDO
+
SIN DENEGACIÓN
=
AUTORIZACIÓN OPERATIVA POSIBLE
```

Una fila no sobrevive al cierre del turno o del contexto operativo que la
originó.

---

#### 3. Manifiesto contractual

```json
{
  "dataset_id": "vento.authorization.operational-role-grants",
  "dataset_version": "1.0.0",
  "dataset_schema_version": "1.0.0",
  "catalog_id": "vento.authorization",
  "catalog_version": "1.0.0",
  "catalog_schema_version": "1.0.0",
  "contract_release_hash": "sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe",
  "record_count": 240,
  "operational_role_count": 12,
  "direct_operational_count": 218,
  "operational_component_count": 22,
  "effect": "ALLOW_ONLY"
}
```

El estado de aprobación y la fecha documental no forman parte del payload ni
del hash.

---

#### 4. Resultado cuantitativo

##### 4.1 Conteo por rol operativo

| Rol operativo                | Directas | Componentes operativos |   Total |
| ---------------------------- | -------: | ---------------------: | ------: |
| `cajero_satelite`            |       15 |                      5 |      20 |
| `barista_satelite`           |       11 |                      0 |      11 |
| `cocinero_satelite`          |       11 |                      0 |      11 |
| `servicio_salon`             |       11 |                      0 |      11 |
| `mostrador_satelite`         |       11 |                      0 |      11 |
| `operador_integral_satelite` |       16 |                      5 |      21 |
| `produccion_cocina`          |       16 |                      0 |      16 |
| `produccion_panaderia`       |       16 |                      0 |      16 |
| `produccion_reposteria`      |       16 |                      0 |      16 |
| `bodeguero`                  |       36 |                      0 |      36 |
| `conductor_logistica`        |       16 |                      0 |      16 |
| `gerencia_operativa`         |       43 |                     12 |      55 |
| **Total**                    |  **218** |                 **22** | **240** |

##### 4.2 Conteo por tipo

| Tipo                    | Cantidad | Efecto                                                                                                            |
| ----------------------- | -------: | ----------------------------------------------------------------------------------------------------------------- |
| `DIRECT_OPERATIONAL`    |      218 | El carril operativo puede satisfacer la autorización completa, sujeto a contexto, alcance, recurso y condiciones. |
| `OPERATIONAL_COMPONENT` |       22 | Solo aporta el componente operativo de una autorización `BASE_AND_OPERATIONAL`.                                   |
| **Total**               |  **240** | Sin duplicados.                                                                                                   |

##### 4.3 Conteo por modalidad

| Modalidad              | Cantidad |
| ---------------------- | -------: |
| `BASE_OR_OPERATIONAL`  |      174 |
| `OPERATIONAL_ONLY`     |       44 |
| `BASE_AND_OPERATIONAL` |       22 |
| `BASE_ONLY`            |        0 |
| **Total**              |  **240** |

##### 4.4 Conteo por aplicación

| Aplicación | Registros operativos |
| ---------- | -------------------: |
| `fogo`     |                   19 |
| `nexo`     |                  181 |
| `origo`    |                    9 |
| `pulso`    |                   31 |
| **Total**  |              **240** |

##### 4.5 Evolución desde las matrices originales

| Concepto                              | Cantidad |
| ------------------------------------- | -------: |
| Concesiones operativas originales     |      212 |
| Adiciones contractuales               |       29 |
| Retiro legacy                         |        1 |
| **Concesiones operativas congeladas** |  **240** |

Cálculo:

```text
212
+ 29
- 1
= 240
```

---

#### 5. Esquema lógico de registro

Cada registro utiliza exactamente estos campos:

| Campo                   | Tipo   | Regla                                                               |
| ----------------------- | ------ | ------------------------------------------------------------------- |
| `grant_id`              | string | `operational-role-grant:<operational_role_code>:<permission_key>`.  |
| `operational_role_code` | string | Uno de los doce roles operativos canónicos.                         |
| `permission_key`        | string | Clave activa exacta de `vento.authorization@1.0.0`.                 |
| `authorization_mode`    | enum   | `BASE_OR_OPERATIONAL`, `OPERATIONAL_ONLY` o `BASE_AND_OPERATIONAL`. |
| `lane`                  | enum   | Siempre `OPERATIONAL`.                                              |
| `grant_type`            | enum   | `DIRECT_OPERATIONAL` u `OPERATIONAL_COMPONENT`.                     |
| `effect`                | enum   | Siempre `ALLOW`.                                                    |
| `scope_expression`      | string | Perfil de alcance operativo aprobado.                               |
| `condition_expression`  | string | Condiciones de turno, check-in, recurso, transición y auditoría.    |
| `source_task`           | string | Matriz original o `AUTH-CAT-023`.                                   |

El dataset es lógico. No traduce todavía expresiones de alcance a UUID,
filas físicas o políticas RLS.

---

#### 6. Semántica de `DIRECT_OPERATIONAL`

Una fila `DIRECT_OPERATIONAL` significa:

```text
ROL OPERATIVO ACTIVO
+
PERMISO EXACTO
+
CONTEXTO OPERATIVO VIGENTE
+
ALCANCE COINCIDENTE
+
RECURSO VÁLIDO
+
TRANSICIÓN PERMITIDA
+
SIN DENEGACIÓN APLICABLE
=
AUTORIZACIÓN OPERATIVA POSIBLE
```

No significa:

- permiso permanente;
- permiso base;
- acceso a todas las sedes;
- acceso fuera de turno;
- custodia de otro actor;
- capacidad por compartir dispositivo;
- autorización sobre recursos ajenos;
- omisión de idempotencia o auditoría.

---

#### 7. Semántica de `OPERATIONAL_COMPONENT`

Las 22 filas `OPERATIONAL_COMPONENT` corresponden únicamente a
`BASE_AND_OPERATIONAL`.

Distribución:

| Familia                    | Roles                                                                 | Componentes |
| -------------------------- | --------------------------------------------------------------------- | ----------: |
| Matrices originales        | `gerencia_operativa`                                                  |           5 |
| PULSO sensible             | `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` |          15 |
| NEXO diferencias de conteo | `gerencia_operativa`                                                  |           2 |
| **Total**                  | —                                                                     |      **22** |

Regla:

```text
COMPONENTE BASE DEL ACTOR
+
COMPONENTE OPERATIVO DEL MISMO ACTOR
+
MISMO PERMISO
+
MISMO RECURSO
+
MISMA SOLICITUD
+
CONTEXTO VÁLIDO
=
AUTORIZACIÓN POSIBLE
```

No se admite combinar:

```text
BASE DE UNA PERSONA
+
OPERATIVO DE OTRA PERSONA
```

Una fila `OPERATIONAL_COMPONENT` aislada produce denegación.

---

#### 8. Diff contractual incorporado

##### 8.1 PULSO — 23 adiciones

Acciones ordinarias para `cajero_satelite` y
`operador_integral_satelite`:

```text
pulso.sales.orders.create
pulso.payments.transactions.collect
pulso.cash.sessions.start
pulso.cash.sessions.close
```

Resultado:

```text
4 claves × 2 roles = 8 concesiones directas
```

Acciones sensibles para `cajero_satelite`,
`operador_integral_satelite` y `gerencia_operativa`:

```text
pulso.payments.transactions.reverse
pulso.sales.orders.cancel
pulso.sales.returns.create
pulso.payments.transactions.refund
pulso.sales.discounts.apply
```

Resultado:

```text
5 claves × 3 roles = 15 componentes operativos
```

`gerencia_operativa` no recibe por matriz las cuatro operaciones ordinarias
de caja.

##### 8.2 NEXO — 5 adiciones

Componentes operativos para `gerencia_operativa`:

```text
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
```

Concesiones directas para `conductor_logistica`:

```text
nexo.inventory.remissions.accept_custody
nexo.inventory.remissions.start_transit
nexo.inventory.remissions.deliver
```

Resultado:

```text
2 componentes
+
3 concesiones directas
=
5 adiciones
```

##### 8.3 ORIGO — 1 adición

```text
bodeguero
+
origo.procurement.receipts.register
```

La concesión registra recepción comercial. No registra stock ni sustituye
la entrada física de NEXO.

##### 8.4 Resultado

```text
23 PULSO
+ 5 NEXO
+ 1 ORIGO
= 29 ADICIONES
```

---

#### 9. Retiro de `dispatch`

Se elimina del dataset:

```text
conductor_logistica
- nexo.inventory.remissions.dispatch
```

La sustitución es:

```text
conductor_logistica
+ nexo.inventory.remissions.accept_custody
+ nexo.inventory.remissions.start_transit
+ nexo.inventory.remissions.deliver
```

No existe equivalencia automática uno-a-muchos.

`dispatch` puede permanecer físicamente durante una migración controlada,
pero:

- no forma parte del dataset canónico;
- no admite asignaciones nuevas;
- no puede reconstruirse desde las tres claves nuevas;
- debe retirarse mediante BLOQUE R con telemetría, pruebas y rollback.

---

#### 10. Reglas de contexto operativo

Toda fila exige:

1. actor humano identificado;
2. relación laboral activa;
3. rol operativo efectivo;
4. turno publicado y vigente;
5. sede activa autorizada;
6. área activa cuando el contrato lo requiera;
7. check-in activo cuando el permiso lo requiera;
8. recurso relacionado con la jornada;
9. contrato de recurso satisfecho;
10. dispositivo compatible cuando corresponda;
11. ausencia de denegación aplicable;
12. auditoría del actor real.

El dispositivo compartido nunca sustituye:

```text
actor
rol
turno
check-in
sede
área
permiso
recurso
```

---

#### 11. Reglas específicas de segregación

##### 11.1 Caja y pagos

- una sesión de caja pertenece a actor y punto concretos;
- cobrar no concede reversar;
- cancelar no revierte pagos, inventario o producción por implicación;
- crear devolución no ejecuta reembolso;
- cerrar sesión no aprueba diferencias;
- las acciones sensibles exigen ambos carriles.

##### 11.2 Diferencias de inventario

```text
ACTOR QUE CAPTURA
≠
ACTOR QUE APRUEBA O RESUELVE
```

`bodeguero` no recibe `approve` ni `resolve` por matriz.

##### 11.3 Custodia logística

- aceptar custodia no inicia tránsito;
- iniciar tránsito no registra entrega;
- entregar no registra recepción del destinatario;
- ninguna de las tres claves modifica cantidades;
- la discrepancia genera evidencia y flujo de resolución separado.

##### 11.4 Recepción comercial

```text
ORIGO
→ recepción comercial

NEXO
→ entrada física y custodia
```

El dataset no fusiona ambos efectos.

---

#### 12. Ausencia y denegación

El dataset contiene únicamente `ALLOW`.

Reglas:

1. ausencia de fila = `DEFAULT_DENY`;
2. ausencia no crea una denegación explícita;
3. AUTH-RBAC-026 define excepciones y denegaciones;
4. una denegación aplicable prevalece;
5. revocar una denegación no crea una concesión;
6. un permiso nuevo no aparece por prefijo;
7. un paquete de dispositivo no crea filas en este dataset.

---

#### 13. Alcance lógico y proyección física

Los perfiles `CTX-*` son expresiones contractuales.

Una fila lógica podrá generar varias filas físicas por:

- tipo de sede;
- sede concreta;
- tipo de área;
- área concreta;
- punto operativo;
- caja;
- ruta;
- vehículo;
- recurso asignado.

Por tanto:

```text
240 REGISTROS LÓGICOS
≠
240 FILAS FÍSICAS OBLIGATORIAS
```

La futura proyección deberá conservar equivalencia semántica, producir su
propio conteo y publicar checksum.

---

#### 14. Orden canónico

Los registros se ordenan por:

```text
operational_role_code ASC
permission_key ASC
```

No se utiliza orden de inserción, UUID, fecha, interfaz o tabla física.

---

#### 15. Serialización y hash

La huella se calcula así:

- UTF-8 sin BOM;
- saltos LF;
- primera línea = manifiesto JSON compacto;
- 240 líneas siguientes = registros JSON compactos;
- campos en el orden de la sección 5;
- registros en el orden de la sección 14;
- sin espacios finales;
- un único LF al final;
- SHA-256 sobre todos los bytes;
- sin estado, fecha o timestamp.

Resultado:

```text
dataset_hash = sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

---

#### 16. Validaciones obligatorias

El dataset deberá pasar:

1. `record_count = 240`;
2. `operational_role_count = 12`;
3. 240 pares únicos `operational_role_code + permission_key`;
4. 218 filas `DIRECT_OPERATIONAL`;
5. 22 filas `OPERATIONAL_COMPONENT`;
6. 174 filas `BASE_OR_OPERATIONAL`;
7. 44 filas `OPERATIONAL_ONLY`;
8. 22 filas `BASE_AND_OPERATIONAL`;
9. 0 filas `BASE_ONLY`;
10. 0 filas `DENY`;
11. 0 claves legacy bloqueadas;
12. 0 claves técnicas retiradas;
13. 0 apariciones de `nexo.inventory.remissions.dispatch`;
14. todas las claves pertenecen a los 140 permisos activos;
15. cada componente corresponde a `BASE_AND_OPERATIONAL`;
16. no existen wildcards;
17. no existe contexto operativo global;
18. no se concede autoridad por dispositivo;
19. el diff añade 29 decisiones y retira 1;
20. el hash coincide con el publicado.

Resultado documental:

```text
records = 240
unique_role_permission_pairs = 240
direct_operational = 218
operational_components = 22
legacy_matches = 0
retired_matches = 0
dispatch_matches = 0
base_only_rows = 0
dataset_hash = sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

---

#### 17. Relación con tareas posteriores

##### AUTH-RBAC-026

Definirá:

- concesiones individuales base;
- concesiones individuales operativas;
- denegaciones por carril;
- denegaciones actor-wide;
- vigencia, motivo y trazabilidad.

No podrá modificar este dataset.

##### AUTH-RBAC-027

Validará que no exista acceso operativo global accidental.

##### AUTH-RBAC-028

Validará que administración base y check-in permanezcan independientes.

##### BLOQUE R

Materializará:

- tablas o archivos físicos;
- expansión territorial;
- migraciones;
- reconciliación;
- sustitución de `dispatch`;
- pruebas;
- telemetría;
- rollback.

---

#### 18. Payload canónico

La primera línea es el manifiesto. Las 240 líneas siguientes son los
registros.

```jsonl
{"dataset_id":"vento.authorization.operational-role-grants","dataset_version":"1.0.0","dataset_schema_version":"1.0.0","catalog_id":"vento.authorization","catalog_version":"1.0.0","catalog_schema_version":"1.0.0","contract_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","record_count":240,"operational_role_count":12,"direct_operational_count":218,"operational_component_count":22,"effect":"ALLOW_ONLY"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.access","operational_role_code":"barista_satelite","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-APP — turno publicado y vigente, rol efectivo `barista_satelite`, sede activa autorizada y área operativa válida de tipo `bar`. No exige check-in para mostrar la entrada y los bloqueos.","condition_expression":"Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.catalog.categories.view","operational_role_code":"barista_satelite","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar categorías.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.catalog.presentations.view","operational_role_code":"barista_satelite","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.","condition_expression":"Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.catalog.products.view","operational_role_code":"barista_satelite","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.","condition_expression":"Turno vigente y rol `barista_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.catalog.request_policies.view","operational_role_code":"barista_satelite","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.","condition_expression":"Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.catalog.units.view","operational_role_code":"barista_satelite","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.inventory.remissions.request","operational_role_code":"barista_satelite","permission_key":"nexo.inventory.remissions.request","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `bar`, utilizando origen, ruta, productos, presentaciones y políticas válidas.","condition_expression":"Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.inventory.remissions.update","operational_role_code":"barista_satelite","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.","condition_expression":"Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.inventory.remissions.view","operational_role_code":"barista_satelite","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.","condition_expression":"Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:nexo.logistics.supply_routes.view","operational_role_code":"barista_satelite","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.","condition_expression":"Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:barista_satelite:pulso.access","operational_role_code":"barista_satelite","permission_key":"pulso.access","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-BAR-PULSO — turno publicado y vigente, rol `barista_satelite`, sede autorizada y área operativa válida de tipo `bar`.","condition_expression":"Carril operativo. Permite entrar a PULSO y mostrar el contexto de barra. No autoriza por sí solo consultar comandas, cambiar estados de preparación, registrar faltantes, rehacer productos, operar ventas, pagos, caja, puntos ni entregas.","source_task":"AUTH-RBAC-009"}
{"grant_id":"operational-role-grant:bodeguero:nexo.access","operational_role_code":"bodeguero","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-NEXO-APP — Turno publicado y vigente, rol operativo `bodeguero`, sede autorizada y área activa de tipo `warehouse`. Permite entrar a NEXO; no concede ninguna capacidad interna por sí solo.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.catalog.categories.view","operational_role_code":"bodeguero","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-CATALOG — Categorías necesarias para búsqueda, clasificación y operación física del inventario autorizado.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.catalog.presentations.view","operational_role_code":"bodeguero","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-CATALOG — Presentaciones, empaques, conversiones y unidades logísticas necesarias para recibir, contar, ubicar, trasladar, retirar y preparar inventario.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.catalog.products.view","operational_role_code":"bodeguero","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-CATALOG — Productos vigentes que pueden almacenarse, recibirse, ubicarse, trasladarse, retirarse o incluirse en remisiones de la bodega activa. Excluye costos, márgenes, proveedores y configuración administrativa.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.catalog.request_policies.view","operational_role_code":"bodeguero","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-REQUEST-POLICIES — Políticas publicadas aplicables a solicitudes y abastecimiento de las sedes atendidas por la bodega activa. Solo lectura; no permite modificarlas.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.catalog.units.view","operational_role_code":"bodeguero","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-CATALOG — Unidades, equivalencias y factores publicados necesarios para validar cantidades, presentaciones y conversiones.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.adjustments.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-ADJUSTMENTS-READ — Ajustes finalizados que afecten stock bajo custodia de la bodega activa. Durante conteos ciegos no se mostrarán existencias teóricas, variaciones ni información que sesgue el conteo.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.entries.register","operational_role_code":"bodeguero","permission_key":"nexo.inventory.entries.register","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-ENTRY-REGISTER — Registro ordinario de entrada física a la bodega únicamente cuando exista una fuente válida: recepción aprobada, lote productivo liberado, devolución, remisión recibida u otro evento canónico autorizado. No permite crear stock sin soporte.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.entries.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-ENTRIES — Entradas ordinarias y sus líneas vinculadas a la bodega activa, incluida su fuente empresarial, estado, ubicación y trazabilidad visible.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.initial_counts.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.initial_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-INITIAL-COUNT — Sesiones de conteo inicial asignadas a la bodega activa, con visibilidad limitada por etapa. No concede modificar la base inicial fuera del flujo formal.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.location_assignments.assign","operational_role_code":"bodeguero","permission_key":"nexo.inventory.location_assignments.assign","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-PUTAWAY — Asignación de stock o LPN recibidos a una ubicación válida dentro de la bodega activa. Exige compatibilidad de producto, capacidad, lote, estado y restricciones de almacenamiento.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.locations.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-TOPOLOGY — Ubicaciones activas pertenecientes a la sede y al área de bodega del contexto operativo. No concede administrar el catálogo de ubicaciones.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.lpns.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-LPN — LPN y contenedores bajo custodia de la bodega activa, con contenido, lote, ubicación y estado necesarios para operar. No permite reasignarlos sin el permiso correspondiente.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.movements.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-MOVEMENTS — Movimientos que tengan origen, destino o efecto dentro de la bodega activa. La visibilidad de un extremo no habilita actuar sobre territorios no autorizados.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.production_batches.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-PRODUCTION-BATCHES — Lotes productivos reflejados en inventario cuando ingresen, se encuentren o deban trazarse dentro de la bodega activa. No concede operar FOGO ni modificar lotes productivos.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.remissions.prepare","operational_role_code":"bodeguero","permission_key":"nexo.inventory.remissions.prepare","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-REMISSION-PREPARE — Preparación de remisiones cuyo origen sea la bodega activa: reserva, alistamiento, cantidades preparadas, faltantes, sustituciones permitidas, empaque y estado listo para transporte. No inicia el tránsito.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.remissions.receive","operational_role_code":"bodeguero","permission_key":"nexo.inventory.remissions.receive","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-REMISSION-RECEIVE — Recepción de remisiones cuyo destino autorizado sea la bodega activa. Exige verificación física, cantidades recibidas, diferencias y transferencia de custodia. El actor no puede recibir una remisión que preparó en el mismo extremo.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.remissions.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-REMISSION — Remisiones donde la bodega activa sea origen, destino receptor o custodio explícito. Excluye visibilidad general de otras sedes y campos no necesarios para la etapa.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.stock.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-STOCK — Existencias de la bodega activa por producto, presentación, lote, LPN y ubicación. No concede acceso a otras sedes ni a áreas no cubiertas por el contexto.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.stock_counts.perform","operational_role_code":"bodeguero","permission_key":"nexo.inventory.stock_counts.perform","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-COUNT-PERFORM — Captura y envío de cantidades físicas en sesiones válidas de la bodega activa. No concede aprobar diferencias, ajustar stock, reabrir sesiones cerradas ni alterar resultados de otro actor.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.stock_counts.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.stock_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-COUNT-READ — Sesiones de conteo asignadas o ejecutadas en la bodega activa. Antes del envío debe preservar modalidad ciega; las diferencias y el stock teórico solo se muestran según la etapa y autoridad aprobadas.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.stock_validations.perform","operational_role_code":"bodeguero","permission_key":"nexo.inventory.stock_validations.perform","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-STOCK-VALIDATION — Validaciones físicas o dirigidas sobre un conjunto autorizado de stock y ubicaciones. Registra evidencia y diferencias, pero no corrige cantidades ni crea ajustes automáticamente.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.storage_positions.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.storage_positions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-TOPOLOGY — Posiciones de almacenamiento pertenecientes a zonas y ubicaciones autorizadas de la bodega activa.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.transfers.create","operational_role_code":"bodeguero","permission_key":"nexo.inventory.transfers.create","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-TRANSFER-CREATE — Traslados ordinarios entre ubicaciones autorizadas de la misma sede y área de bodega. Los movimientos entre sedes se gestionan mediante remisiones; los movimientos hacia consumo productivo se gestionan mediante retiros o el flujo canónico correspondiente.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.transfers.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-TRANSFERS — Traslados donde la bodega activa sea origen o destino autorizado. La consulta de un extremo no amplía la autoridad sobre el otro.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.warehouse_operations.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.warehouse_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-OPERATIONS — Cola y estado de operaciones ordinarias de la bodega activa: recepción física, ubicación, traslado, retiro, conteo, validación y preparación.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.withdrawals.register","operational_role_code":"bodeguero","permission_key":"nexo.inventory.withdrawals.register","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-WITHDRAWAL-REGISTER — Salida física de stock desde ubicación y lote exactos de la bodega activa hacia un destino o motivo válido. Debe impedir stock negativo, duplicidad, retroactividad no autorizada y consumo sin trazabilidad.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.withdrawals.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-WITHDRAWALS — Retiros originados en la bodega activa, incluidos sus productos, cantidades, motivo, destino operativo y actor registrador.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.inventory.zones.view","operational_role_code":"bodeguero","permission_key":"nexo.inventory.zones.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-TOPOLOGY — Zonas de almacenamiento pertenecientes a la bodega activa.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.logistics.supply_routes.view","operational_role_code":"bodeguero","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-SUPPLY-ROUTES — Rutas y ventanas de abastecimiento publicadas necesarias para priorizar y preparar remisiones desde la bodega activa. No concede modificarlas ni coordinar transporte completo.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:nexo.printing.jobs.view","operational_role_code":"bodeguero","permission_key":"nexo.printing.jobs.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-PRINT-JOBS — Trabajos de impresión originados por operaciones de la bodega activa, como etiquetas de LPN, ubicaciones o preparación. No permite editar plantillas.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:origo.access","operational_role_code":"bodeguero","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-ORIGO-APP — Entrada operativa a ORIGO para verificación física de abastecimiento durante el turno. No concede compras ni recepción por sí sola.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:origo.procurement.purchase_orders.view","operational_role_code":"bodeguero","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-PURCHASE-ORDERS — Órdenes de compra aprobadas o vigentes cuyo destino receptor sea la sede o bodega activa. Mostrar solo productos, cantidades, presentaciones, proveedor, estado y datos necesarios para la recepción.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:origo.procurement.receipts.register","operational_role_code":"bodeguero","permission_key":"origo.procurement.receipts.register","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-PURCHASE-RECEIPT-REGISTER — recepción comercial de órdenes cuyo destino receptor sea la sede y bodega activas del actor.","condition_expression":"Carril operativo completo. Requiere turno y check-in válidos, orden, proveedor, líneas, cantidades y documentos recibibles, actor humano identificado, atomicidad, idempotencia y auditoría. No crea ni aprueba órdenes, no modifica proveedores y no registra directamente stock; la entrada física continúa siendo propiedad de NEXO.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:bodeguero:origo.procurement.receipts.view","operational_role_code":"bodeguero","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-PURCHASE-RECEIPTS — Recepciones de compra vinculadas a la sede o bodega activa, incluidas sus cantidades, diferencias y estado. No concede registrar, revertir ni aprobar recepciones.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:bodeguero:origo.procurement.suppliers.view","operational_role_code":"bodeguero","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-WH-SUPPLIER-IDENTITY — Proyección mínima del proveedor necesaria para identificar la entrega y validar documentos. Excluye información bancaria, negociación, costos no requeridos y administración del maestro.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, sede, área y recurso deben resolverse en servidor; toda mutación es idempotente y auditable.","source_task":"AUTH-RBAC-017"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.access","operational_role_code":"cajero_satelite","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-APP — turno publicado y vigente, rol efectivo `cajero_satelite`, sede activa autorizada y área operativa válida de tipo `cashier`. No exige check-in para mostrar la entrada y los bloqueos.","condition_expression":"Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.catalog.categories.view","operational_role_code":"cajero_satelite","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar categorías.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.catalog.presentations.view","operational_role_code":"cajero_satelite","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.","condition_expression":"Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.catalog.products.view","operational_role_code":"cajero_satelite","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.","condition_expression":"Turno vigente y rol `cajero_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.catalog.request_policies.view","operational_role_code":"cajero_satelite","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.","condition_expression":"Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.catalog.units.view","operational_role_code":"cajero_satelite","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.inventory.remissions.request","operational_role_code":"cajero_satelite","permission_key":"nexo.inventory.remissions.request","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `cashier`, utilizando origen, ruta, productos, presentaciones y políticas válidas.","condition_expression":"Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.inventory.remissions.update","operational_role_code":"cajero_satelite","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.","condition_expression":"Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.inventory.remissions.view","operational_role_code":"cajero_satelite","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.","condition_expression":"Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:nexo.logistics.supply_routes.view","operational_role_code":"cajero_satelite","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.","condition_expression":"Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.access","operational_role_code":"cajero_satelite","permission_key":"pulso.access","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-POS — turno publicado y vigente, rol `cajero_satelite`, sede autorizada y área operativa válida de tipo `cashier`.","condition_expression":"Carril operativo. Permite entrar a PULSO y mostrar el requisito de marcación. No autoriza ventas, pagos, caja, anulaciones, puntos ni entregas por sí solo.","source_task":"AUTH-RBAC-008"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.cash.sessions.close","operational_role_code":"cajero_satelite","permission_key":"pulso.cash.sessions.close","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-PULSO-CLOSE — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo y área o punto de caja compatibles, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.cash.sessions.start","operational_role_code":"cajero_satelite","permission_key":"pulso.cash.sessions.start","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-PULSO-START — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo y área o punto de caja compatibles, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.payments.transactions.collect","operational_role_code":"cajero_satelite","permission_key":"pulso.payments.transactions.collect","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-PULSO-COLLECT — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo y área o punto de caja compatibles, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.payments.transactions.refund","operational_role_code":"cajero_satelite","permission_key":"pulso.payments.transactions.refund","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-CASHIER-DOUBLE-PULSO-REFUND — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo y área o punto de caja compatibles, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.payments.transactions.reverse","operational_role_code":"cajero_satelite","permission_key":"pulso.payments.transactions.reverse","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-CASHIER-DOUBLE-PULSO-REVERSE — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo y área o punto de caja compatibles, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.sales.discounts.apply","operational_role_code":"cajero_satelite","permission_key":"pulso.sales.discounts.apply","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-CASHIER-DOUBLE-PULSO-APPLY — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo y área o punto de caja compatibles, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.sales.orders.cancel","operational_role_code":"cajero_satelite","permission_key":"pulso.sales.orders.cancel","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-CASHIER-DOUBLE-PULSO-CANCEL — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo y área o punto de caja compatibles, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.sales.orders.create","operational_role_code":"cajero_satelite","permission_key":"pulso.sales.orders.create","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-CASHIER-PULSO-CREATE — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo y área o punto de caja compatibles, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cajero_satelite:pulso.sales.returns.create","operational_role_code":"cajero_satelite","permission_key":"pulso.sales.returns.create","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-CASHIER-DOUBLE-PULSO-CREATE — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo y área o punto de caja compatibles, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.access","operational_role_code":"cocinero_satelite","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-APP — turno publicado y vigente, rol efectivo `cocinero_satelite`, sede activa autorizada y área operativa válida de tipo `kitchen`. No exige check-in para mostrar la entrada y los bloqueos.","condition_expression":"Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.catalog.categories.view","operational_role_code":"cocinero_satelite","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar categorías.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.catalog.presentations.view","operational_role_code":"cocinero_satelite","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.","condition_expression":"Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.catalog.products.view","operational_role_code":"cocinero_satelite","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.","condition_expression":"Turno vigente y rol `cocinero_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.catalog.request_policies.view","operational_role_code":"cocinero_satelite","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.","condition_expression":"Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.catalog.units.view","operational_role_code":"cocinero_satelite","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.inventory.remissions.request","operational_role_code":"cocinero_satelite","permission_key":"nexo.inventory.remissions.request","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `kitchen`, utilizando origen, ruta, productos, presentaciones y políticas válidas.","condition_expression":"Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.inventory.remissions.update","operational_role_code":"cocinero_satelite","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.","condition_expression":"Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.inventory.remissions.view","operational_role_code":"cocinero_satelite","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.","condition_expression":"Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:nexo.logistics.supply_routes.view","operational_role_code":"cocinero_satelite","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.","condition_expression":"Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:cocinero_satelite:pulso.access","operational_role_code":"cocinero_satelite","permission_key":"pulso.access","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-KITCHEN-PULSO — turno publicado y vigente, rol `cocinero_satelite`, sede autorizada y área operativa válida de tipo `kitchen`.","condition_expression":"Carril operativo. Permite entrar a PULSO y mostrar el contexto de cocina. No autoriza por sí solo consultar comandas, cambiar estados de preparación, registrar faltantes, rehacer productos, operar ventas, pagos, caja, puntos ni entregas.","source_task":"AUTH-RBAC-010"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.access","operational_role_code":"conductor_logistica","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-NEXO-APP — Turno publicado y vigente, rol `conductor_logistica`, sede logística autorizada y contexto de ruta o vehículo válido. Permite entrar a NEXO; no concede capacidades internas por sí solo.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.catalog.presentations.view","operational_role_code":"conductor_logistica","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-CARGO-CATALOG — Presentaciones y empaques necesarios para verificar físicamente la carga asignada, incluyendo unidades logísticas y equivalencias visibles en el manifiesto.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.catalog.products.view","operational_role_code":"conductor_logistica","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-CARGO-CATALOG — Productos incluidos en remisiones, manifiestos, LPN o incidencias asignadas al conductor. Excluye costos, márgenes, proveedores y catálogo administrativo.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.catalog.units.view","operational_role_code":"conductor_logistica","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-CARGO-CATALOG — Unidades y conversiones necesarias para contrastar cantidades preparadas, cargadas y entregadas. No permite modificar equivalencias.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.inventory.lpns.view","operational_role_code":"conductor_logistica","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-LPN — LPN, contenedores, sellos y bultos vinculados exclusivamente con remisiones bajo custodia asignada al conductor. No permite reasignar, abrir o alterar contenido por sí solo.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.inventory.movements.view","operational_role_code":"conductor_logistica","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-CUSTODY-MOVEMENTS — Eventos de inventario y custodia relacionados con remisiones asignadas: preparación final, carga, despacho, tránsito, entrega y recepción. No concede acceso al historial general de inventario.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.inventory.remissions.accept_custody","operational_role_code":"conductor_logistica","permission_key":"nexo.inventory.remissions.accept_custody","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-ACCEPT-CUSTODY — aceptar custodia de bultos, LPN y cantidades declaradas exclusivamente para remisiones, ruta, vehículo o segmento logístico asignados al actor.","condition_expression":"Carril operativo completo. Requiere turno y check-in válidos, asignación logística vigente, estado previo compatible, transición idempotente, evidencia temporal y ubicación auditable. No permite modificar cantidades declaradas ni convertir discrepancias en ajustes silenciosos.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.inventory.remissions.deliver","operational_role_code":"conductor_logistica","permission_key":"nexo.inventory.remissions.deliver","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-DELIVER — registrar entrega física al receptor previsto exclusivamente para remisiones, ruta, vehículo o segmento logístico asignados al actor.","condition_expression":"Carril operativo completo. Requiere turno y check-in válidos, asignación logística vigente, estado previo compatible, transición idempotente, evidencia temporal y ubicación auditable. No permite modificar cantidades declaradas ni convertir discrepancias en ajustes silenciosos.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.inventory.remissions.start_transit","operational_role_code":"conductor_logistica","permission_key":"nexo.inventory.remissions.start_transit","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-START-TRANSIT — iniciar tránsito de una remisión ya recibida en custodia exclusivamente para remisiones, ruta, vehículo o segmento logístico asignados al actor.","condition_expression":"Carril operativo completo. Requiere turno y check-in válidos, asignación logística vigente, estado previo compatible, transición idempotente, evidencia temporal y ubicación auditable. No permite modificar cantidades declaradas ni convertir discrepancias en ajustes silenciosos.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.inventory.remissions.view","operational_role_code":"conductor_logistica","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-REMISSIONS — Remisiones asignadas al conductor, a su ruta o vehículo, y aquellas listas para recogida en un origen autorizado. Incluye origen, destino, líneas, cantidades preparadas, bultos, estado e instrucciones mínimas.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.logistics.driver_operations.view","operational_role_code":"conductor_logistica","permission_key":"nexo.logistics.driver_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-SELF — Operaciones propias del conductor y su trazabilidad durante el turno. No permite consultar desempeño, ubicación o historial de otros conductores.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.logistics.fulfillment.view","operational_role_code":"conductor_logistica","permission_key":"nexo.logistics.fulfillment.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-FULFILLMENT — Cumplimiento de remisiones y paradas asignadas al conductor: pendiente, recogida, en tránsito, entregada, recibida o con incidencia. No expone cumplimiento organizacional global.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.logistics.fulfillment_routes.view","operational_role_code":"conductor_logistica","permission_key":"nexo.logistics.fulfillment_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-FULFILLMENT-ROUTES — Ruta, secuencia de paradas, ventanas, restricciones y destinos asignados para el turno. No permite crear, editar o reasignar rutas.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.logistics.operations.view","operational_role_code":"conductor_logistica","permission_key":"nexo.logistics.operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-OPERATIONS — Operaciones logísticas donde el conductor sea actor asignado o custodio vigente. Incluye secuencia, estado, origen, destino, ventanas y bloqueos necesarios para ejecutar la ruta.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.logistics.operations_board.view","operational_role_code":"conductor_logistica","permission_key":"nexo.logistics.operations_board.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-BOARD — Tablero limitado a las operaciones asignadas al actor, ruta o vehículo durante el turno. No muestra el tablero logístico global ni operaciones de otros conductores.","condition_expression":"Carril operativo con prerrequisito `T+C`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:conductor_logistica:nexo.logistics.supply_routes.view","operational_role_code":"conductor_logistica","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-DRV-SUPPLY-ROUTES — Rutas de abastecimiento publicadas que correspondan a la jornada y a las remisiones asignadas. Solo lectura; no concede coordinación general ni modificación de frecuencias.","condition_expression":"Carril operativo con prerrequisito `T`. Actor, turno, check-in cuando aplique, asignación, ruta, vehículo y recurso deben resolverse en servidor; toda mutación debe ser idempotente y auditable.","source_task":"AUTH-RBAC-018"}
{"grant_id":"operational-role-grant:gerencia_operativa:fogo.access","operational_role_code":"gerencia_operativa","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-FOGO-APP — Entrada a FOGO durante el turno de coordinación. No concede acciones internas por sí sola.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:fogo.production.batches.view","operational_role_code":"gerencia_operativa","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-PRODUCTION-STATUS — Órdenes y lotes de producción vinculados con la sede activa, sus áreas operativas o abastecimientos que afecten la jornada. Solo seguimiento y coordinación.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:fogo.production.orders.view","operational_role_code":"gerencia_operativa","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-PRODUCTION-STATUS — Órdenes y lotes de producción vinculados con la sede activa, sus áreas operativas o abastecimientos que afecten la jornada. Solo seguimiento y coordinación.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:fogo.production.recipe_book.view","operational_role_code":"gerencia_operativa","permission_key":"fogo.production.recipe_book.view","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-PRODUCTION-RECIPE — Recetario operativo estrictamente necesario para verificar ejecución, rendimientos e incidencias de órdenes activas en la sede o área coordinada.","condition_expression":"Carril operativo. Requiere turno, sede/área compatibles y relación con una orden o incidencia activa. No permite consultar ni administrar el maestro completo de recetas.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.access","operational_role_code":"gerencia_operativa","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-NEXO-APP — Entrada a NEXO durante un turno válido de `gerencia_operativa`. No concede funciones internas ni alcance multisede por sí sola.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.assets.counts.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.assets.counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-ASSETS — Activos, grupos y conteos relacionados con la sede o área activa. Solo consulta de estado, custodia e incidencias; no creación ni administración del maestro.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.assets.groups.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.assets.groups.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-ASSETS — Activos, grupos y conteos relacionados con la sede o área activa. Solo consulta de estado, custodia e incidencias; no creación ni administración del maestro.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.assets.items.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.assets.items.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-ASSETS — Activos, grupos y conteos relacionados con la sede o área activa. Solo consulta de estado, custodia e incidencias; no creación ni administración del maestro.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.catalog.categories.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-CATALOG — Catálogos operativos vigentes necesarios para coordinar inventario, solicitudes, producción y remisiones de la sede activa. Excluye configuración y costos protegidos.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.catalog.presentations.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-CATALOG — Catálogos operativos vigentes necesarios para coordinar inventario, solicitudes, producción y remisiones de la sede activa. Excluye configuración y costos protegidos.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.catalog.products.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-CATALOG — Catálogos operativos vigentes necesarios para coordinar inventario, solicitudes, producción y remisiones de la sede activa. Excluye configuración y costos protegidos.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.catalog.request_policies.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-CATALOG — Catálogos operativos vigentes necesarios para coordinar inventario, solicitudes, producción y remisiones de la sede activa. Excluye configuración y costos protegidos.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.catalog.units.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-CATALOG — Catálogos operativos vigentes necesarios para coordinar inventario, solicitudes, producción y remisiones de la sede activa. Excluye configuración y costos protegidos.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.finance.internal_variances.approve","operational_role_code":"gerencia_operativa","permission_key":"nexo.finance.internal_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-VARIANCE — Componente operativo de una variación vinculada a la sede o jornada activa. Requiere además autoridad base compatible, evidencia, separación de funciones y auditoría reforzada.","condition_expression":"Asignar solo el componente operativo. La autorización final exige componente base válido, turno y check-in activos, recurso territorialmente compatible y actor distinto de quien originó o capturó la diferencia cuando la segregación lo requiera.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.finance.internal_variances.resolve","operational_role_code":"gerencia_operativa","permission_key":"nexo.finance.internal_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-VARIANCE — Componente operativo de una variación vinculada a la sede o jornada activa. Requiere además autoridad base compatible, evidencia, separación de funciones y auditoría reforzada.","condition_expression":"Asignar solo el componente operativo. La autorización final exige componente base válido, turno y check-in activos, recurso territorialmente compatible y actor distinto de quien originó o capturó la diferencia cuando la segregación lo requiera.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.adjustments.register","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.adjustments.register","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-ADJUSTMENT — Componente operativo sobre inventario de la sede/área activa. La ejecución final exige además concesión base compatible, diferencia documentada, motivo, reautenticación y auditoría reforzada.","condition_expression":"Asignar solo el componente operativo. La autorización final exige componente base válido, turno y check-in activos, sede/área compatibles, motivo, reautenticación y auditoría reforzada.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.adjustments.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.adjustments.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-CONTROL — Entradas o ajustes que afecten la sede activa, con actor, documento, motivo, estado y trazabilidad. No amplía por sí sola la capacidad de registrar.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.entries.override","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.entries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-ENTRY — Componente operativo para una entrada excepcional en la sede/área activa. Requiere simultáneamente autoridad base, documento o incidente válido, motivo y control de duplicidad.","condition_expression":"Asignar solo el componente operativo. La autorización final exige componente base válido, turno y check-in activos, sede/área compatibles, motivo, reautenticación y auditoría reforzada.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.entries.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.entries.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-CONTROL — Entradas o ajustes que afecten la sede activa, con actor, documento, motivo, estado y trazabilidad. No amplía por sí sola la capacidad de registrar.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.initial_counts.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.initial_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-COUNTS-READ — Conteos de la sede o área activa, respetando modalidad ciega, etapa, segregación de funciones y ocultamiento del stock teórico cuando corresponda.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.locations.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.lpns.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.movements.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.movements.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.production_batches.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.remissions.cancel","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.remissions.cancel","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-REMISSION-CANCEL — Cancelación operativa de remisiones relacionadas con la sede activa, solo en estados cancelables, con motivo obligatorio, reautenticación y auditoría. No revierte custodia o inventario por inferencia.","condition_expression":"Carril operativo. Exige turno y check-in activos, recurso relacionado con la sede coordinada, estado cancelable, control de versión, motivo obligatorio y auditoría. La cancelación no ejecuta ajustes ni devoluciones implícitas.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.remissions.request","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.remissions.request","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-REMISSION-REQUEST — Solicitudes justificadas para la sede o área activa, sujetas a políticas, presentaciones mínimas, disponibilidad y trazabilidad del solicitante.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.remissions.update","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-REMISSION-UPDATE — Actualización de prioridad, programación, observaciones y datos operativos permitidos de remisiones relacionadas con la sede activa. No altera cantidades bajo custodia ni etapas cerradas.","condition_expression":"Carril operativo. Solo campos y estados expresamente editables; cualquier cambio de cantidades, origen, destino, custodia o inventario exige permiso atómico diferente o se deniega.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.remissions.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-REMISSIONS — Remisiones cuyo origen o destino corresponda a la sede activa, o cuya operación requiera coordinación directa del turno. Los datos de la otra sede se proyectan al mínimo necesario.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.stock.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.stock_count_variances.approve","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.stock_count_variances.approve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-STOCK-COUNT-VARIANCE-APPROVE — componente operativo limitado a la diferencia de conteo de la sede, área y jornada activas.","condition_expression":"Componente operativo únicamente. Requiere componente base del mismo actor, contexto vigente, recurso exacto, motivo, evidencia y auditoría. El actor que captura el conteo no puede aprobar o resolver su propia diferencia.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.stock_count_variances.resolve","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.stock_count_variances.resolve","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-STOCK-COUNT-VARIANCE-RESOLVE — componente operativo limitado a la diferencia de conteo de la sede, área y jornada activas.","condition_expression":"Componente operativo únicamente. Requiere componente base del mismo actor, contexto vigente, recurso exacto, motivo, evidencia y auditoría. El actor que captura el conteo no puede aprobar o resolver su propia diferencia.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.stock_counts.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.stock_counts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-COUNTS-READ — Conteos de la sede o área activa, respetando modalidad ciega, etapa, segregación de funciones y ocultamiento del stock teórico cuando corresponda.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.storage_positions.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.storage_positions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.transfers.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.transfers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.warehouse_operations.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.warehouse_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.withdrawals.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.inventory.zones.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.inventory.zones.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-INVENTORY-VIEW — Inventario, ubicaciones, LPN, movimientos, lotes, traslados, retiros, zonas, posiciones y operaciones pertenecientes a la sede o área activa. Sin visibilidad global implícita.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.logistics.driver_operations.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.logistics.driver_operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-LOGISTICS — Tablero, operaciones, conductores, cumplimiento y rutas que afecten la sede activa o estén bajo coordinación expresa del turno. Excluye operaciones ajenas y ubicación histórica innecesaria.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.logistics.fulfillment.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.logistics.fulfillment.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-LOGISTICS — Tablero, operaciones, conductores, cumplimiento y rutas que afecten la sede activa o estén bajo coordinación expresa del turno. Excluye operaciones ajenas y ubicación histórica innecesaria.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.logistics.fulfillment_routes.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.logistics.fulfillment_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-LOGISTICS — Tablero, operaciones, conductores, cumplimiento y rutas que afecten la sede activa o estén bajo coordinación expresa del turno. Excluye operaciones ajenas y ubicación histórica innecesaria.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.logistics.operations.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.logistics.operations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-LOGISTICS — Tablero, operaciones, conductores, cumplimiento y rutas que afecten la sede activa o estén bajo coordinación expresa del turno. Excluye operaciones ajenas y ubicación histórica innecesaria.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.logistics.operations_board.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.logistics.operations_board.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-LOGISTICS — Tablero, operaciones, conductores, cumplimiento y rutas que afecten la sede activa o estén bajo coordinación expresa del turno. Excluye operaciones ajenas y ubicación histórica innecesaria.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.logistics.supply_routes.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-LOGISTICS — Tablero, operaciones, conductores, cumplimiento y rutas que afecten la sede activa o estén bajo coordinación expresa del turno. Excluye operaciones ajenas y ubicación histórica innecesaria.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:nexo.printing.jobs.view","operational_role_code":"gerencia_operativa","permission_key":"nexo.printing.jobs.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-PRINT-JOBS — Trabajos de impresión originados por operaciones de la sede activa, únicamente para seguimiento, reintento técnico autorizado o diagnóstico; no edición de plantillas.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:origo.access","operational_role_code":"gerencia_operativa","permission_key":"origo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-ORIGO-APP — Entrada operativa a ORIGO para coordinar abastecimiento y recepción de la sede activa. No concede compras ni administración de proveedores.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:origo.procurement.purchase_orders.view","operational_role_code":"gerencia_operativa","permission_key":"origo.procurement.purchase_orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-ORIGO — Órdenes, recepciones y proyección mínima de proveedores vinculadas con entregas o abastecimientos de la sede activa. Solo consulta operativa.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:origo.procurement.receipts.view","operational_role_code":"gerencia_operativa","permission_key":"origo.procurement.receipts.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-ORIGO — Órdenes, recepciones y proyección mínima de proveedores vinculadas con entregas o abastecimientos de la sede activa. Solo consulta operativa.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:origo.procurement.suppliers.view","operational_role_code":"gerencia_operativa","permission_key":"origo.procurement.suppliers.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-ORIGO — Órdenes, recepciones y proyección mínima de proveedores vinculadas con entregas o abastecimientos de la sede activa. Solo consulta operativa.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:pulso.access","operational_role_code":"gerencia_operativa","permission_key":"pulso.access","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-MGR-PULSO-APP — Entrada a PULSO durante el turno para coordinación comercial de la sede activa. No concede ventas, caja, pagos, pedidos ni cierres por sí sola.","condition_expression":"Carril operativo. Requiere actor activo, turno publicado y vigente, check-in cuando aplique, sede/área compatibles, permiso exacto y recurso resuelto en servidor. Nunca produce alcance global.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:pulso.delivery.deliveries.override","operational_role_code":"gerencia_operativa","permission_key":"pulso.delivery.deliveries.override","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-DELIVERY — Componente operativo de una confirmación excepcional de entrega en la sede activa. Exige autoridad base compatible, evidencia, reautenticación, motivo y auditoría reforzada.","condition_expression":"Asignar solo el componente operativo. La autorización final exige componente base válido, turno y check-in activos, sede/área compatibles, motivo, reautenticación y auditoría reforzada.","source_task":"AUTH-RBAC-019"}
{"grant_id":"operational-role-grant:gerencia_operativa:pulso.payments.transactions.refund","operational_role_code":"gerencia_operativa","permission_key":"pulso.payments.transactions.refund","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-PULSO-REFUND — componente operativo de coordinación limitado a la sede, jornada, punto de venta y recurso activos.","condition_expression":"Componente operativo únicamente. Requiere turno y contexto válidos de gerencia_operativa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No sustituye el rol ordinario de caja.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:gerencia_operativa:pulso.payments.transactions.reverse","operational_role_code":"gerencia_operativa","permission_key":"pulso.payments.transactions.reverse","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-PULSO-REVERSE — componente operativo de coordinación limitado a la sede, jornada, punto de venta y recurso activos.","condition_expression":"Componente operativo únicamente. Requiere turno y contexto válidos de gerencia_operativa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No sustituye el rol ordinario de caja.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:gerencia_operativa:pulso.sales.discounts.apply","operational_role_code":"gerencia_operativa","permission_key":"pulso.sales.discounts.apply","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-PULSO-APPLY — componente operativo de coordinación limitado a la sede, jornada, punto de venta y recurso activos.","condition_expression":"Componente operativo únicamente. Requiere turno y contexto válidos de gerencia_operativa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No sustituye el rol ordinario de caja.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:gerencia_operativa:pulso.sales.orders.cancel","operational_role_code":"gerencia_operativa","permission_key":"pulso.sales.orders.cancel","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-PULSO-CANCEL — componente operativo de coordinación limitado a la sede, jornada, punto de venta y recurso activos.","condition_expression":"Componente operativo únicamente. Requiere turno y contexto válidos de gerencia_operativa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No sustituye el rol ordinario de caja.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:gerencia_operativa:pulso.sales.returns.create","operational_role_code":"gerencia_operativa","permission_key":"pulso.sales.returns.create","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-MGR-DOUBLE-PULSO-CREATE — componente operativo de coordinación limitado a la sede, jornada, punto de venta y recurso activos.","condition_expression":"Componente operativo únicamente. Requiere turno y contexto válidos de gerencia_operativa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No sustituye el rol ordinario de caja.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.access","operational_role_code":"mostrador_satelite","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-APP — turno publicado y vigente, rol efectivo `mostrador_satelite`, sede activa autorizada y área operativa válida de Mostrador, resuelta desde el área exacta del turno y su tipo canónico. No exige check-in para mostrar la entrada y los bloqueos.","condition_expression":"Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.catalog.categories.view","operational_role_code":"mostrador_satelite","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar categorías.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.catalog.presentations.view","operational_role_code":"mostrador_satelite","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.","condition_expression":"Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.catalog.products.view","operational_role_code":"mostrador_satelite","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.","condition_expression":"Turno vigente y rol `mostrador_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.catalog.request_policies.view","operational_role_code":"mostrador_satelite","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.","condition_expression":"Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.catalog.units.view","operational_role_code":"mostrador_satelite","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.inventory.remissions.request","operational_role_code":"mostrador_satelite","permission_key":"nexo.inventory.remissions.request","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área de Mostrador activa, utilizando origen, ruta, productos, presentaciones y políticas válidas.","condition_expression":"Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.inventory.remissions.update","operational_role_code":"mostrador_satelite","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.","condition_expression":"Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.inventory.remissions.view","operational_role_code":"mostrador_satelite","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.","condition_expression":"Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:nexo.logistics.supply_routes.view","operational_role_code":"mostrador_satelite","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.","condition_expression":"Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:mostrador_satelite:pulso.access","operational_role_code":"mostrador_satelite","permission_key":"pulso.access","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-COUNTER-PULSO — turno publicado y vigente, rol `mostrador_satelite`, sede autorizada y área operativa válida de Mostrador, resuelta desde el área exacta del turno y su tipo canónico.","condition_expression":"Carril operativo. Permite entrar a PULSO y mostrar el contexto de mostrador. No autoriza por sí solo consultar colas de entrega, alistar o empacar pedidos, cambiar estados, confirmar entregas ordinarias, cobrar, operar caja, anular, devolver, acumular puntos ni cerrar servicios.","source_task":"AUTH-RBAC-012"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.access","operational_role_code":"operador_integral_satelite","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-APP — turno publicado y vigente, rol efectivo `operador_integral_satelite`, sede activa habilitada para formato integrado y área exacta cuando la configuración la exija. No exige check-in para mostrar entrada y bloqueos.","condition_expression":"Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.catalog.categories.view","operational_role_code":"operador_integral_satelite","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar categorías.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.catalog.presentations.view","operational_role_code":"operador_integral_satelite","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.","condition_expression":"Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.catalog.products.view","operational_role_code":"operador_integral_satelite","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.","condition_expression":"Turno vigente y rol `operador_integral_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.catalog.request_policies.view","operational_role_code":"operador_integral_satelite","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.","condition_expression":"Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.catalog.units.view","operational_role_code":"operador_integral_satelite","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.inventory.remissions.receive","operational_role_code":"operador_integral_satelite","permission_key":"nexo.inventory.remissions.receive","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REMISSION-RECEIVE — recepción ordinaria de remisiones cuyo destino sea la sede integrada activa, con recurso, origen, cantidades y estado válidos.","condition_expression":"Turno y check-in activos. Reautenticación fuerte, verificación física, control de concurrencia y auditoría antes/después. Solo confirma recepción en destino; no permite preparar, despachar, cancelar ni alterar el origen.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.inventory.remissions.request","operational_role_code":"operador_integral_satelite","permission_key":"nexo.inventory.remissions.request","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REMISSION-REQUEST — crear una solicitud para la sede integrada activa y desde el área exacta cuando la configuración la exija, utilizando origen, ruta, productos, presentaciones y políticas válidas.","condition_expression":"Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.inventory.remissions.update","operational_role_code":"operador_integral_satelite","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.","condition_expression":"Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.inventory.remissions.view","operational_role_code":"operador_integral_satelite","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.","condition_expression":"Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:nexo.logistics.supply_routes.view","operational_role_code":"operador_integral_satelite","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.","condition_expression":"Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.access","operational_role_code":"operador_integral_satelite","permission_key":"pulso.access","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-PULSO — turno publicado y vigente, rol `operador_integral_satelite`, sede habilitada como formato integrado y área exacta cuando corresponda.","condition_expression":"Carril operativo. Permite entrar a PULSO y mostrar la superficie integrada. No autoriza por sí solo pedidos, preparación, servicio, ventas, pagos, caja, anulaciones, devoluciones, fidelización, entregas ni cierres.","source_task":"AUTH-RBAC-013"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.cash.sessions.close","operational_role_code":"operador_integral_satelite","permission_key":"pulso.cash.sessions.close","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-PULSO-CLOSE — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.cash.sessions.start","operational_role_code":"operador_integral_satelite","permission_key":"pulso.cash.sessions.start","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-PULSO-START — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.payments.transactions.collect","operational_role_code":"operador_integral_satelite","permission_key":"pulso.payments.transactions.collect","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-PULSO-COLLECT — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.payments.transactions.refund","operational_role_code":"operador_integral_satelite","permission_key":"pulso.payments.transactions.refund","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-DOUBLE-PULSO-REFUND — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.payments.transactions.reverse","operational_role_code":"operador_integral_satelite","permission_key":"pulso.payments.transactions.reverse","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-DOUBLE-PULSO-REVERSE — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.sales.discounts.apply","operational_role_code":"operador_integral_satelite","permission_key":"pulso.sales.discounts.apply","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-DOUBLE-PULSO-APPLY — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.sales.orders.cancel","operational_role_code":"operador_integral_satelite","permission_key":"pulso.sales.orders.cancel","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-DOUBLE-PULSO-CANCEL — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.sales.orders.create","operational_role_code":"operador_integral_satelite","permission_key":"pulso.sales.orders.create","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-PULSO-CREATE — operación ordinaria de venta, cobro o sesión de caja exclusivamente en la sede, área, punto y turno activos del actor.","condition_expression":"Carril operativo completo. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, actor humano identificado, recurso vigente, transición idempotente y auditoría. La sesión de caja es personal y no puede reutilizar la identidad de otro actor.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:operador_integral_satelite:pulso.sales.returns.create","operational_role_code":"operador_integral_satelite","permission_key":"pulso.sales.returns.create","authorization_mode":"BASE_AND_OPERATIONAL","lane":"OPERATIONAL","grant_type":"OPERATIONAL_COMPONENT","effect":"ALLOW","scope_expression":"CTX-INTEGRATED-DOUBLE-PULSO-CREATE — componente operativo limitado a la venta, pago, devolución, descuento o sesión de caja del contexto activo.","condition_expression":"Componente operativo únicamente. Requiere turno publicado, check-in activo, sede integrada habilitada y función de caja activa, componente base del mismo actor, mismo permiso, mismo recurso y misma solicitud; además reautenticación fuerte, motivo, evidencia, control de versión y auditoría. No autoriza por sí solo.","source_task":"AUTH-CAT-023"}
{"grant_id":"operational-role-grant:produccion_cocina:fogo.access","operational_role_code":"produccion_cocina","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-FOGO-APP — turno publicado y vigente, rol `produccion_cocina`, Centro de Producción habilitado y área activa exacta de Cocina Caliente.","condition_expression":"Carril operativo con prerrequisito `T`. Permite entrar a FOGO, ver el estado del contexto y los bloqueos. No concede por sí solo lotes, órdenes, recetario ni otra capacidad.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:fogo.production.batches.create","operational_role_code":"produccion_cocina","permission_key":"fogo.production.batches.create","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-BATCH-CREATE — creación de lotes para órdenes válidas asignadas a Cocina Caliente, con receta publicada, cantidades, unidad, responsable y trazabilidad.","condition_expression":"Turno y check-in activos. La creación debe ser idempotente, validar orden, receta operativa, área, cantidades y estado, y atribuir el lote al actor efectivo. No permite editar recetas maestras.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:fogo.production.batches.view","operational_role_code":"produccion_cocina","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-BATCH — lotes vinculados a órdenes y ejecución de Cocina Caliente dentro del Centro de Producción.","condition_expression":"Turno y check-in activos. La consulta se limita a lotes del área productiva activa y a la información necesaria para ejecutar y verificar la producción; no concede información de otras áreas.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:fogo.production.orders.view","operational_role_code":"produccion_cocina","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-ORDER — órdenes de producción destinadas o asignadas a Cocina Caliente y vigentes para el turno o periodo operativo autorizado.","condition_expression":"Carril operativo con prerrequisito `T`. Permite preparar la jornada consultando instrucciones y prioridades; no permite modificar, reasignar, aprobar ni cancelar órdenes.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:fogo.production.recipe_book.view","operational_role_code":"produccion_cocina","permission_key":"fogo.production.recipe_book.view","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-RECIPE-BOOK — proyección operativa publicada de recetas aplicables a órdenes de Cocina Caliente, con porciones, insumos, proceso y controles necesarios.","condition_expression":"Carril operativo con prerrequisito `T`. Solo recetario operativo vigente y aplicable; sin costos, márgenes, secretos administrativos, versiones borrador, edición, exportación masiva ni acceso al maestro completo.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.access","operational_role_code":"produccion_cocina","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-NEXO-APP — turno publicado y vigente, rol `produccion_cocina`, Centro de Producción y área activa de Cocina Caliente.","condition_expression":"Carril operativo con prerrequisito `T`. Permite entrar a NEXO y ver el contexto del área. No concede por sí solo inventario, movimientos, retiros ni otra capacidad.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.catalog.categories.view","operational_role_code":"produccion_cocina","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-REF — categorías necesarias para localizar insumos y productos relacionados con Cocina Caliente.","condition_expression":"Turno vigente. Solo lectura y búsqueda; no permite administrar categorías.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.catalog.presentations.view","operational_role_code":"produccion_cocina","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-REF — presentaciones, empaques y conversiones publicadas necesarias para interpretar insumos y cantidades productivas.","condition_expression":"Turno vigente. Solo lectura; no permite crear ni modificar presentaciones.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.catalog.products.view","operational_role_code":"produccion_cocina","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-REF — productos e insumos vigentes aplicables a recetas, lotes o retiros de Cocina Caliente.","condition_expression":"Turno vigente. Proyección mínima de identificación; excluye costos, márgenes, proveedores, configuración y campos técnicos no necesarios.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.catalog.units.view","operational_role_code":"produccion_cocina","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-REF — unidades, equivalencias y empaques publicados necesarios para recetas, lotes y consumos.","condition_expression":"Turno vigente. Solo lectura; no permite modificar unidades ni factores de conversión.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.inventory.locations.view","operational_role_code":"produccion_cocina","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-INVENTORY-REF — ubicaciones activas desde las que Cocina Caliente está autorizada a consumir o consultar insumos.","condition_expression":"Turno vigente y área activa válida. La consulta se limita a topología necesaria para la operación; no concede asignar ubicaciones ni administrar su catálogo.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.inventory.lpns.view","operational_role_code":"produccion_cocina","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-INVENTORY-LPN — LPN o contenedores relacionados con insumos disponibles para Cocina Caliente o con el lote productivo activo.","condition_expression":"Turno y check-in activos. Debe limitar contenido, posición, custodia y trazabilidad al recurso que el actor necesita identificar; no concede movimientos ni reasignaciones.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.inventory.production_batches.view","operational_role_code":"produccion_cocina","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-INVENTORY-BATCH — trazabilidad de inventario derivada de lotes creados por Cocina Caliente o vinculados a sus órdenes activas.","condition_expression":"Turno y check-in activos. Solo lectura de disponibilidad, lote y trazabilidad necesaria para verificar el efecto productivo; no concede ajustes, entradas manuales ni movimientos.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.inventory.stock.view","operational_role_code":"produccion_cocina","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-INVENTORY-STOCK — existencias de insumos disponibles para consumo autorizado por Cocina Caliente en ubicaciones compatibles.","condition_expression":"Turno y check-in activos. Consulta sensible y acotada al área, ubicación, producto y lote aplicables; no permite consultar inventario general de la sede ni de otras áreas.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.inventory.withdrawals.register","operational_role_code":"produccion_cocina","permission_key":"nexo.inventory.withdrawals.register","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-WITHDRAWAL-REGISTER — registro de consumo de insumos desde ubicaciones autorizadas hacia una orden o lote de Cocina Caliente.","condition_expression":"Turno y check-in activos. Validar stock, presentación, unidad, lote, ubicación, cantidad, receta u orden relacionada, idempotencia y concurrencia. No permite inventario negativo, ajustes, traslados ni consumos sin trazabilidad.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_cocina:nexo.inventory.withdrawals.view","operational_role_code":"produccion_cocina","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-KITCHEN-WITHDRAWAL — retiros o consumos asociados al actor, al lote activo o a Cocina Caliente dentro del turno vigente.","condition_expression":"Turno y check-in activos. La consulta se limita a consumos propios o del recurso productivo autorizado; no expone retiros generales de otras áreas o trabajadores.","source_task":"AUTH-RBAC-014"}
{"grant_id":"operational-role-grant:produccion_panaderia:fogo.access","operational_role_code":"produccion_panaderia","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-FOGO-APP — turno publicado y vigente, rol `produccion_panaderia`, Centro de Producción habilitado y área activa exacta de Galletería y Panadería.","condition_expression":"Carril operativo con prerrequisito `T`. Permite entrar a FOGO, ver el estado del contexto y los bloqueos. No concede por sí solo lotes, órdenes, recetario ni otra capacidad.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:fogo.production.batches.create","operational_role_code":"produccion_panaderia","permission_key":"fogo.production.batches.create","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-BATCH-CREATE — creación de lotes para órdenes válidas asignadas a Galletería y Panadería, con receta publicada, cantidades, unidad, responsable y trazabilidad.","condition_expression":"Turno y check-in activos. La creación debe ser idempotente, validar orden, receta operativa, área, cantidades y estado, y atribuir el lote al actor efectivo. No permite editar recetas maestras.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:fogo.production.batches.view","operational_role_code":"produccion_panaderia","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-BATCH — lotes vinculados a órdenes y ejecución de Galletería y Panadería dentro del Centro de Producción.","condition_expression":"Turno y check-in activos. La consulta se limita a lotes del área productiva activa y a la información necesaria para ejecutar y verificar la producción; no concede información de otras áreas.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:fogo.production.orders.view","operational_role_code":"produccion_panaderia","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-ORDER — órdenes de producción destinadas o asignadas a Galletería y Panadería y vigentes para el turno o periodo operativo autorizado.","condition_expression":"Carril operativo con prerrequisito `T`. Permite preparar la jornada consultando instrucciones y prioridades; no permite modificar, reasignar, aprobar ni cancelar órdenes.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:fogo.production.recipe_book.view","operational_role_code":"produccion_panaderia","permission_key":"fogo.production.recipe_book.view","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-RECIPE-BOOK — proyección operativa publicada de recetas aplicables a órdenes de Galletería y Panadería, con porciones, insumos, proceso y controles necesarios.","condition_expression":"Carril operativo con prerrequisito `T`. Solo recetario operativo vigente y aplicable; sin costos, márgenes, secretos administrativos, versiones borrador, edición, exportación masiva ni acceso al maestro completo.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.access","operational_role_code":"produccion_panaderia","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-NEXO-APP — turno publicado y vigente, rol `produccion_panaderia`, Centro de Producción y área activa de Galletería y Panadería.","condition_expression":"Carril operativo con prerrequisito `T`. Permite entrar a NEXO y ver el contexto del área. No concede por sí solo inventario, movimientos, retiros ni otra capacidad.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.catalog.categories.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-REF — categorías necesarias para localizar insumos y productos relacionados con Galletería y Panadería.","condition_expression":"Turno vigente. Solo lectura y búsqueda; no permite administrar categorías.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.catalog.presentations.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-REF — presentaciones, empaques y conversiones publicadas necesarias para interpretar insumos y cantidades productivas.","condition_expression":"Turno vigente. Solo lectura; no permite crear ni modificar presentaciones.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.catalog.products.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-REF — productos e insumos vigentes aplicables a recetas, lotes o retiros de Galletería y Panadería.","condition_expression":"Turno vigente. Proyección mínima de identificación; excluye costos, márgenes, proveedores, configuración y campos técnicos no necesarios.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.catalog.units.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-REF — unidades, equivalencias y empaques publicados necesarios para recetas, lotes y consumos.","condition_expression":"Turno vigente. Solo lectura; no permite modificar unidades ni factores de conversión.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.inventory.locations.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-INVENTORY-REF — ubicaciones activas desde las que Galletería y Panadería está autorizada a consumir o consultar insumos.","condition_expression":"Turno vigente y área activa válida. La consulta se limita a topología necesaria para la operación; no concede asignar ubicaciones ni administrar su catálogo.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.inventory.lpns.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-INVENTORY-LPN — LPN o contenedores relacionados con insumos disponibles para Galletería y Panadería o con el lote productivo activo.","condition_expression":"Turno y check-in activos. Debe limitar contenido, posición, custodia y trazabilidad al recurso que el actor necesita identificar; no concede movimientos ni reasignaciones.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.inventory.production_batches.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-INVENTORY-BATCH — trazabilidad de inventario derivada de lotes creados por Galletería y Panadería o vinculados a sus órdenes activas.","condition_expression":"Turno y check-in activos. Solo lectura de disponibilidad, lote y trazabilidad necesaria para verificar el efecto productivo; no concede ajustes, entradas manuales ni movimientos.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.inventory.stock.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-INVENTORY-STOCK — existencias de insumos disponibles para consumo autorizado por Galletería y Panadería en ubicaciones compatibles.","condition_expression":"Turno y check-in activos. Consulta sensible y acotada al área, ubicación, producto y lote aplicables; no permite consultar inventario general de la sede ni de otras áreas.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.inventory.withdrawals.register","operational_role_code":"produccion_panaderia","permission_key":"nexo.inventory.withdrawals.register","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-WITHDRAWAL-REGISTER — registro de consumo de insumos desde ubicaciones autorizadas hacia una orden o lote de Galletería y Panadería.","condition_expression":"Turno y check-in activos. Validar stock, presentación, unidad, lote, ubicación, cantidad, receta u orden relacionada, idempotencia y concurrencia. No permite inventario negativo, ajustes, traslados ni consumos sin trazabilidad.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_panaderia:nexo.inventory.withdrawals.view","operational_role_code":"produccion_panaderia","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-BAKERY-WITHDRAWAL — retiros o consumos asociados al actor, al lote activo o a Galletería y Panadería dentro del turno vigente.","condition_expression":"Turno y check-in activos. La consulta se limita a consumos propios o del recurso productivo autorizado; no expone retiros generales de otras áreas o trabajadores.","source_task":"AUTH-RBAC-015"}
{"grant_id":"operational-role-grant:produccion_reposteria:fogo.access","operational_role_code":"produccion_reposteria","permission_key":"fogo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-FOGO-APP — turno publicado y vigente, rol `produccion_reposteria`, Centro de Producción habilitado y área activa exacta de Repostería.","condition_expression":"Carril operativo con prerrequisito `T`. Permite entrar a FOGO, ver el estado del contexto y los bloqueos. No concede por sí solo lotes, órdenes, recetario ni otra capacidad.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:fogo.production.batches.create","operational_role_code":"produccion_reposteria","permission_key":"fogo.production.batches.create","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-BATCH-CREATE — creación de lotes para órdenes válidas asignadas a Repostería, con receta publicada, cantidades, unidad, responsable y trazabilidad.","condition_expression":"Turno y check-in activos. La creación debe ser idempotente, validar orden, receta operativa, área, cantidades y estado, y atribuir el lote al actor efectivo. No permite editar recetas maestras.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:fogo.production.batches.view","operational_role_code":"produccion_reposteria","permission_key":"fogo.production.batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-BATCH — lotes vinculados a órdenes y ejecución de Repostería dentro del Centro de Producción.","condition_expression":"Turno y check-in activos. La consulta se limita a lotes del área productiva activa y a la información necesaria para ejecutar y verificar la producción; no concede información de otras áreas.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:fogo.production.orders.view","operational_role_code":"produccion_reposteria","permission_key":"fogo.production.orders.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-ORDER — órdenes de producción destinadas o asignadas a Repostería y vigentes para el turno o periodo operativo autorizado.","condition_expression":"Carril operativo con prerrequisito `T`. Permite preparar la jornada consultando instrucciones y prioridades; no permite modificar, reasignar, aprobar ni cancelar órdenes.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:fogo.production.recipe_book.view","operational_role_code":"produccion_reposteria","permission_key":"fogo.production.recipe_book.view","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-RECIPE-BOOK — proyección operativa publicada de recetas aplicables a órdenes de Repostería, con porciones, insumos, proceso y controles necesarios.","condition_expression":"Carril operativo con prerrequisito `T`. Solo recetario operativo vigente y aplicable; sin costos, márgenes, secretos administrativos, versiones borrador, edición, exportación masiva ni acceso al maestro completo.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.access","operational_role_code":"produccion_reposteria","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-NEXO-APP — turno publicado y vigente, rol `produccion_reposteria`, Centro de Producción y área activa de Repostería.","condition_expression":"Carril operativo con prerrequisito `T`. Permite entrar a NEXO y ver el contexto del área. No concede por sí solo inventario, movimientos, retiros ni otra capacidad.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.catalog.categories.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-REF — categorías necesarias para localizar insumos y productos relacionados con Repostería.","condition_expression":"Turno vigente. Solo lectura y búsqueda; no permite administrar categorías.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.catalog.presentations.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-REF — presentaciones, empaques y conversiones publicadas necesarias para interpretar insumos y cantidades productivas.","condition_expression":"Turno vigente. Solo lectura; no permite crear ni modificar presentaciones.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.catalog.products.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-REF — productos e insumos vigentes aplicables a recetas, lotes o retiros de Repostería.","condition_expression":"Turno vigente. Proyección mínima de identificación; excluye costos, márgenes, proveedores, configuración y campos técnicos no necesarios.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.catalog.units.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-REF — unidades, equivalencias y empaques publicados necesarios para recetas, lotes y consumos.","condition_expression":"Turno vigente. Solo lectura; no permite modificar unidades ni factores de conversión.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.inventory.locations.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.inventory.locations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-INVENTORY-REF — ubicaciones activas desde las que Repostería está autorizada a consumir o consultar insumos.","condition_expression":"Turno vigente y área activa válida. La consulta se limita a topología necesaria para la operación; no concede asignar ubicaciones ni administrar su catálogo.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.inventory.lpns.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.inventory.lpns.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-INVENTORY-LPN — LPN o contenedores relacionados con insumos disponibles para Repostería o con el lote productivo activo.","condition_expression":"Turno y check-in activos. Debe limitar contenido, posición, custodia y trazabilidad al recurso que el actor necesita identificar; no concede movimientos ni reasignaciones.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.inventory.production_batches.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.inventory.production_batches.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-INVENTORY-BATCH — trazabilidad de inventario derivada de lotes creados por Repostería o vinculados a sus órdenes activas.","condition_expression":"Turno y check-in activos. Solo lectura de disponibilidad, lote y trazabilidad necesaria para verificar el efecto productivo; no concede ajustes, entradas manuales ni movimientos.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.inventory.stock.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.inventory.stock.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-INVENTORY-STOCK — existencias de insumos disponibles para consumo autorizado por Repostería en ubicaciones compatibles.","condition_expression":"Turno y check-in activos. Consulta sensible y acotada al área, ubicación, producto y lote aplicables; no permite consultar inventario general de la sede ni de otras áreas.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.inventory.withdrawals.register","operational_role_code":"produccion_reposteria","permission_key":"nexo.inventory.withdrawals.register","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-WITHDRAWAL-REGISTER — registro de consumo de insumos desde ubicaciones autorizadas hacia una orden o lote de Repostería.","condition_expression":"Turno y check-in activos. Validar stock, presentación, unidad, lote, ubicación, cantidad, receta u orden relacionada, idempotencia y concurrencia. No permite inventario negativo, ajustes, traslados ni consumos sin trazabilidad.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:produccion_reposteria:nexo.inventory.withdrawals.view","operational_role_code":"produccion_reposteria","permission_key":"nexo.inventory.withdrawals.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-PROD-PASTRY-WITHDRAWAL — retiros o consumos asociados al actor, al lote activo o a Repostería dentro del turno vigente.","condition_expression":"Turno y check-in activos. La consulta se limita a consumos propios o del recurso productivo autorizado; no expone retiros generales de otras áreas o trabajadores.","source_task":"AUTH-RBAC-016"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.access","operational_role_code":"servicio_salon","permission_key":"nexo.access","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-APP — turno publicado y vigente, rol efectivo `servicio_salon`, sede activa autorizada y área operativa válida de tipo `service`. No exige check-in para mostrar la entrada y los bloqueos.","condition_expression":"Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.catalog.categories.view","operational_role_code":"servicio_salon","permission_key":"nexo.catalog.categories.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar categorías.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.catalog.presentations.view","operational_role_code":"servicio_salon","permission_key":"nexo.catalog.presentations.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.","condition_expression":"Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.catalog.products.view","operational_role_code":"servicio_salon","permission_key":"nexo.catalog.products.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.","condition_expression":"Turno vigente y rol `servicio_salon` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.catalog.request_policies.view","operational_role_code":"servicio_salon","permission_key":"nexo.catalog.request_policies.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.","condition_expression":"Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.catalog.units.view","operational_role_code":"servicio_salon","permission_key":"nexo.catalog.units.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.","condition_expression":"Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.inventory.remissions.request","operational_role_code":"servicio_salon","permission_key":"nexo.inventory.remissions.request","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `service`, utilizando origen, ruta, productos, presentaciones y políticas válidas.","condition_expression":"Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.inventory.remissions.update","operational_role_code":"servicio_salon","permission_key":"nexo.inventory.remissions.update","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.","condition_expression":"Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.inventory.remissions.view","operational_role_code":"servicio_salon","permission_key":"nexo.inventory.remissions.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.","condition_expression":"Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:nexo.logistics.supply_routes.view","operational_role_code":"servicio_salon","permission_key":"nexo.logistics.supply_routes.view","authorization_mode":"BASE_OR_OPERATIONAL","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.","condition_expression":"Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.","source_task":"AUTH-RBAC-011"}
{"grant_id":"operational-role-grant:servicio_salon:pulso.access","operational_role_code":"servicio_salon","permission_key":"pulso.access","authorization_mode":"OPERATIONAL_ONLY","lane":"OPERATIONAL","grant_type":"DIRECT_OPERATIONAL","effect":"ALLOW","scope_expression":"CTX-SERVICE-PULSO — turno publicado y vigente, rol `servicio_salon`, sede autorizada y área operativa válida de tipo `service`.","condition_expression":"Carril operativo. Permite entrar a PULSO y mostrar el contexto de servicio de salón. No autoriza por sí solo gestionar mesas, tomar pedidos, modificar comandas, confirmar entregas, cobrar, operar caja, anular, devolver, acumular puntos ni cerrar servicios.","source_task":"AUTH-RBAC-011"}
```

---

#### 19. Fuera del alcance

AUTH-RBAC-025 no:

- crea archivos físicos dentro del repositorio;
- publica paquetes;
- inserta filas;
- elimina físicamente `dispatch`;
- migra trabajadores;
- publica turnos;
- crea check-ins;
- expande territorios;
- modifica RLS;
- modifica RPC;
- implementa guards;
- cambia dispositivos;
- crea excepciones;
- crea denegaciones;
- modifica Supabase.

---

#### 20. Riesgos controlados

##### Riesgo 1 — Rol operativo permanente

Control:

```text
FIN DE CONTEXTO
→ FIN DE AUTORIDAD OPERATIVA
```

##### Riesgo 2 — Componente operativo suficiente

Control:

```text
OPERATIONAL_COMPONENT
→ INSUFICIENTE POR SÍ SOLO
```

##### Riesgo 3 — Gerencia como especialista universal

Control:

- no recibe operaciones ordinarias de caja;
- no recibe custodia o tránsito;
- solo recibe componentes y coordinación exactos.

##### Riesgo 4 — Bodeguero autoaprueba diferencias

Control:

```text
capturar
≠
aprobar
≠
resolver
```

##### Riesgo 5 — `dispatch` permanece canónico

Control:

```text
dispatch_matches = 0
```

##### Riesgo 6 — Dispositivo concede autoridad

Control:

```text
PAQUETE DE DISPOSITIVO
→ FILTRA
→ NO CONCEDE
```

##### Riesgo 7 — Conteo lógico confundido con filas físicas

Control:

```text
dataset lógico
≠
proyección física
```

---

#### 21. Criterios de aprobación

AUTH-RBAC-025 podrá aprobarse cuando se acepte que:

1. el dataset se identifica como
   `vento.authorization.operational-role-grants@1.0.0`;
2. referencia el catálogo y hash de AUTH-CAT-024;
3. contiene exactamente 240 registros;
4. incluye exactamente doce roles operativos;
5. contiene 218 concesiones directas;
6. contiene 22 componentes operativos;
7. no contiene permisos `BASE_ONLY`;
8. no contiene roles base;
9. no contiene claves legacy o retiradas;
10. `dispatch` no aparece;
11. las 29 adiciones de AUTH-CAT-023 están reproducidas;
12. el retiro legacy está reproducido;
13. ausencia de fila continúa siendo `DEFAULT_DENY`;
14. los componentes no se combinan entre actores;
15. turno, check-in, sede, área y recurso continúan siendo obligatorios;
16. los paquetes de dispositivo no conceden;
17. el orden y serialización son deterministas;
18. el hash es
    `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f`;
19. AUTH-RBAC-026 no podrá modificar este dataset;
20. la materialización física queda reservada para BLOQUE R.

---

#### 22. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-024 | APROBADA    |
| AUTH-RBAC-025 | APROBADA    |
| AUTH-RBAC-026 | NO INICIADA |

No se avanza a AUTH-RBAC-026 hasta recibir aprobación explícita de
AUTH-RBAC-025.


### ✅ AUTH-RBAC-026 — Definir dataset canónico de excepciones y denegaciones

**Estado:** APROBADA
**Bloque:** BLOQUE D — Datasets canónicos  
**Naturaleza:** Definición documental de dataset lógico inicial, contrato transaccional y transición legacy  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-RBAC-025 — APROBADA  
**Tarea posterior reservada:** AUTH-RBAC-027 — Validar ausencia de acceso operativo global accidental  
**Dataset:** `vento.authorization.individual-overrides@1.0.0`  
**Catálogo:** `vento.authorization@1.0.0`  
**Huella contractual:** `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`  
**Registros canónicos iniciales:** **0**  
**Filas legacy esperadas para revisión posterior:** **17**  
**Hash del dataset inicial propuesto:** `sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10`

Esta tarea define el dataset canónico que separa las excepciones positivas
individuales de las denegaciones explícitas aplicables a trabajadores.

La versión inicial se publica intencionalmente vacía:

```text
0 concesiones individuales base confirmadas
0 concesiones individuales operativas confirmadas
0 denegaciones base confirmadas
0 denegaciones operativas confirmadas
0 bloqueos transversales confirmados
```

Las 17 filas legacy conocidas de `employee_permissions` no se incorporan como
autorizaciones canónicas. Se reservan para inventario, clasificación y
migración controlada en BLOQUE R.

Esta tarea no crea tablas, no inserta filas, no modifica Supabase, no genera
migraciones, no altera RLS o RPC y no publica todavía archivos físicos del
paquete `@vento/contracts`.

---

#### 1. Objetivo

Definir de manera exacta:

1. el dataset inicial de excepciones y denegaciones;
2. el contrato común de un override individual;
3. los campos específicos de concesiones base;
4. los campos específicos de concesiones operativas;
5. los campos específicos de denegaciones por carril y transversales;
6. la semántica de vigencia y ciclo de vida;
7. la precedencia frente a matrices y contexto;
8. la transición de las 17 filas legacy;
9. el orden y hash del dataset inicial;
10. la separación entre seed canónico y registros transaccionales futuros.

Flujo:

```text
AUTH-RBAC-020
→ concesiones individuales base

AUTH-RBAC-021
→ concesiones individuales operativas

AUTH-RBAC-022
→ denegaciones por carril y bloqueos transversales

AUTH-RBAC-023
→ restricciones de dispositivo compartido

AUTH-CAT-023
→ cero excepciones y cero denegaciones automáticas

AUTH-CAT-024
→ catálogo 1.0.0 congelado

AUTH-RBAC-024
→ matriz base congelada

AUTH-RBAC-025
→ matriz operativa congelada

AUTH-RBAC-026
→ dataset individual inicial
→ contrato de runtime
→ transición legacy
```

---

#### 2. Decisión principal

El dataset canónico inicial contiene **cero registros**.

Esta ausencia es una decisión normativa, no una omisión.

```text
SIN NECESIDAD EMPRESARIAL APROBADA
+
SIN SUJETO HUMANO VALIDADO
+
SIN PERMISO, CARRIL, ALCANCE, VIGENCIA Y APROBACIÓN
=
NO CREAR OVERRIDE
```

No se migrará automáticamente:

- ninguna concesión individual legacy;
- ninguna fila negativa legacy;
- ningún permiso amplio hacia varias claves atómicas;
- ninguna asignación perteneciente a una identidad técnica o dispositivo;
- ninguna concesión redundante con la matriz del rol;
- ninguna intención no verificable.

Regla crítica:

```text
DEFAULT_DENY
≠
EXPLICIT_DENY
```

La ausencia de una concesión sigue produciendo denegación por defecto. No se
crean filas `DENY` redundantes para representar ausencias.

---

#### 3. Manifiesto contractual

```json
{
  "dataset_id": "vento.authorization.individual-overrides",
  "dataset_version": "1.0.0",
  "dataset_schema_version": "1.0.0",
  "catalog_id": "vento.authorization",
  "catalog_version": "1.0.0",
  "catalog_schema_version": "1.0.0",
  "contract_release_hash": "sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe",
  "canonical_record_count": 0,
  "individual_base_grant_count": 0,
  "individual_operational_grant_count": 0,
  "base_lane_deny_count": 0,
  "operational_lane_deny_count": 0,
  "actor_wide_deny_count": 0,
  "legacy_source_row_count_expected": 17,
  "legacy_confirmed_functional_grant_count": 0,
  "legacy_confirmed_deny_count": 0
}
```

El estado de aprobación y la fecha documental quedan fuera del payload y del
hash.

---

#### 4. Resultado cuantitativo

##### 4.1 Registros canónicos iniciales

| Clase                                | Registros |
| ------------------------------------ | --------: |
| Concesiones individuales base        |         0 |
| Concesiones individuales operativas  |         0 |
| Denegaciones individuales base       |         0 |
| Denegaciones individuales operativas |         0 |
| Bloqueos individuales transversales  |         0 |
| **Total canónico inicial**           |     **0** |

##### 4.2 Estado legacy conocido

| Concepto                                                         |   Cantidad |
| ---------------------------------------------------------------- | ---------: |
| Filas existentes en `employee_permissions`                       |         17 |
| Excepciones funcionales reales confirmadas                       |          0 |
| Denegaciones funcionales confirmadas                             |          0 |
| Identidades involucradas conocidas                               |          2 |
| Identidades inactivas o con naturaleza de dispositivo detectadas | Al menos 1 |
| Filas autorizadas para migración automática                      |          0 |

##### 4.3 Resultado de AUTH-CAT-023

| Decisión diferencial                                           | Cantidad |
| -------------------------------------------------------------- | -------: |
| Concesiones individuales automáticas por las 29 claves nuevas  |        0 |
| Denegaciones individuales automáticas por las 29 claves nuevas |        0 |
| Expansiones automáticas desde permisos legacy                  |        0 |

---

#### 5. Identidad del dataset

```text
dataset_id = vento.authorization.individual-overrides
dataset_version = 1.0.0
dataset_schema_version = 1.0.0
catalog_id = vento.authorization
catalog_version = 1.0.0
catalog_schema_version = 1.0.0
contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

La versión inicial es un **seed canónico**.

No representa el historial transaccional posterior.

Después de implementar la administración de excepciones:

```text
SEED DATASET
→ define estado inicial y contrato de bootstrap

RUNTIME RECORDS
→ representan decisiones empresariales posteriores
→ tienen versionado por fila y auditoría
→ no reescriben el seed 1.0.0
```

Solo será necesaria una nueva versión del dataset seed cuando cambien:

- registros iniciales incorporados por despliegue;
- esquema lógico;
- semántica de clases;
- reglas de validación;
- tratamiento de legacy;
- dependencia contractual con el catálogo.

---

#### 6. Tipos canónicos de registro

El contrato admite dos familias:

```text
INDIVIDUAL_GRANT
EXPLICIT_DENY
```

##### 6.1 `INDIVIDUAL_GRANT`

Subtipos:

```text
INDIVIDUAL_BASE_GRANT
INDIVIDUAL_OPERATIONAL_GRANT
```

Efecto:

```text
ALLOW
```

##### 6.2 `EXPLICIT_DENY`

Subtipos:

```text
BASE_LANE_DENY
OPERATIONAL_LANE_DENY
ACTOR_WIDE_DENY
```

Efecto:

```text
DENY
```

`STRUCTURAL_DENY` no se administra mediante este dataset.

Los bloqueos estructurales proceden de:

- identidad inexistente o inválida;
- trabajador inactivo;
- aplicación inactiva;
- permiso inactivo o retirado;
- sesión inválida;
- recurso inexistente;
- contrato imposible;
- configuración estructural inválida.

---

#### 7. Sobre común de registro

Todo registro futuro deberá conservar:

| Campo                 | Tipo             | Regla                                                    |
| --------------------- | ---------------- | -------------------------------------------------------- |
| `override_id`         | string/UUID      | Identificador estable y no reutilizable.                 |
| `record_kind`         | enum             | `INDIVIDUAL_GRANT` o `EXPLICIT_DENY`.                    |
| `record_subtype`      | enum             | Subtipo exacto aprobado.                                 |
| `employee_id`         | UUID             | Trabajador humano exacto.                                |
| `permission_key`      | string           | Clave exacta activa del catálogo.                        |
| `authorization_lane`  | enum             | `BASE`, `OPERATIONAL` o `ALL_COMPATIBLE`, según subtipo. |
| `effect`              | enum             | `ALLOW` o `DENY`, coherente con la familia.              |
| `scope_type`          | enum             | Tipo de alcance contractual.                             |
| `scope_mode`          | enum/null        | Modo explícito de cobertura cuando corresponda.          |
| `organization_id`     | UUID/null        | Organización exacta cuando aplique.                      |
| `site_id`             | UUID/null        | Sede exacta cuando aplique.                              |
| `site_type`           | string/null      | Tipo de sede permitido cuando aplique.                   |
| `area_id`             | UUID/null        | Área exacta cuando aplique.                              |
| `area_kind`           | string/null      | Tipo de área permitido cuando aplique.                   |
| `resource_type`       | string/null      | Tipo de recurso restringido.                             |
| `resource_id`         | UUID/string/null | Recurso exacto cuando aplique.                           |
| `relation_type`       | string/null      | Relación contractual requerida.                          |
| `resource_constraint` | object/null      | Propiedad, asignación o conjunto permitido.              |
| `effective_from`      | timestamptz      | Inicio de vigencia.                                      |
| `effective_until`     | timestamptz/null | Fin de vigencia o nulo solo con justificación reforzada. |
| `timezone`            | string           | Zona horaria canónica usada para la vigencia.            |
| `status`              | enum             | Estado permitido por la familia.                         |
| `reason_code`         | enum             | Motivo estructurado.                                     |
| `justification`       | string           | Explicación humana verificable y minimizada.             |
| `evidence_reference`  | string/null      | Referencia a evidencia en el sistema propietario.        |
| `source_reference`    | string/null      | Acta, suplencia, proyecto, incidente o solicitud.        |
| `requested_by`        | UUID             | Actor humano que solicita.                               |
| `approved_by`         | UUID/null        | Actor autorizado que aprueba.                            |
| `created_by`          | UUID             | Actor que crea el registro.                              |
| `created_at`          | timestamptz      | Fecha de servidor.                                       |
| `updated_by`          | UUID/null        | Último actor que modifica.                               |
| `updated_at`          | timestamptz      | Última fecha de servidor.                                |
| `reviewed_at`         | timestamptz/null | Última revisión administrativa.                          |
| `revoked_by`          | UUID/null        | Actor que revoca.                                        |
| `revoked_at`          | timestamptz/null | Fecha de revocación.                                     |
| `revocation_reason`   | string/null      | Motivo estructurado o explicación segura.                |
| `version`             | integer          | Control optimista de concurrencia.                       |
| `source_task`         | string           | Tarea contractual que habilita la semántica.             |

Reglas:

1. `null` nunca significa global.
2. Un campo territorial nulo debe ser coherente con `scope_type`.
3. Un recurso exacto no puede pertenecer a un territorio incompatible.
4. La aplicación debe resolver el recurso real en servidor.
5. No se admiten claves, carriles o clases desconocidas.
6. No se admite un dispositivo como `employee_id`.
7. No se admite `service_role` como beneficiario.
8. El mismo sujeto no puede autoaprobar una decisión sensible.

---

#### 8. Contrato de concesión individual base

```text
record_kind = INDIVIDUAL_GRANT
record_subtype = INDIVIDUAL_BASE_GRANT
authorization_lane = BASE
effect = ALLOW
```

##### 8.1 Modalidades compatibles

| Modalidad del permiso  | Resultado                                      |
| ---------------------- | ---------------------------------------------- |
| `BASE_ONLY`            | Puede producir allow completo por carril base. |
| `BASE_OR_OPERATIONAL`  | Puede producir allow completo por carril base. |
| `BASE_AND_OPERATIONAL` | Solo aporta componente base.                   |
| `OPERATIONAL_ONLY`     | Configuración inválida.                        |

##### 8.2 Campos adicionales

| Campo                     | Regla                                                                  |
| ------------------------- | ---------------------------------------------------------------------- |
| `grant_component_type`    | `DIRECT_ALLOW` o `BASE_COMPONENT`.                                     |
| `compatible_base_roles`   | Opcional para diagnóstico; nunca crea herencia por rol.                |
| `redundancy_check_result` | Debe demostrar que la matriz base no cubre completamente la necesidad. |
| `sensitivity_controls`    | Controles adicionales exigidos por el permiso.                         |
| `review_frequency`        | Obligatoria para concesiones indefinidas o sensibles.                  |

##### 8.3 Estados

```text
DRAFT
PENDING_APPROVAL
SCHEDULED
ACTIVE
SUSPENDED
REVOKED
EXPIRED
REJECTED
```

##### 8.4 Motivos permitidos

```text
TEMPORARY_ADMINISTRATIVE_COVERAGE
SPECIALIZED_RESPONSIBILITY
TERRITORIAL_RESPONSIBILITY_EXTENSION
PROJECT_ASSIGNMENT
CONTROLLED_READ_ACCESS
DOUBLE_CONDITION_BASE_COMPONENT
BUSINESS_CONTINUITY
OTHER_APPROVED
```

`OTHER_APPROVED` exige justificación reforzada.

##### 8.5 Invariantes

- no crea rol base;
- no reconstruye una matriz completa;
- no concede `OPERATIONAL_ONLY`;
- no crea turno o check-in;
- no reduce un allow existente;
- no supera el alcance máximo del permiso;
- no elimina sensibilidad;
- un deny aplicable prevalece;
- una concesión redundante debe rechazarse.

---

#### 9. Contrato de concesión individual operativa

```text
record_kind = INDIVIDUAL_GRANT
record_subtype = INDIVIDUAL_OPERATIONAL_GRANT
authorization_lane = OPERATIONAL
effect = ALLOW
```

##### 9.1 Modalidades compatibles

| Modalidad del permiso  | Resultado                                           |
| ---------------------- | --------------------------------------------------- |
| `BASE_ONLY`            | Configuración inválida.                             |
| `BASE_OR_OPERATIONAL`  | Puede producir allow completo por carril operativo. |
| `BASE_AND_OPERATIONAL` | Solo aporta componente operativo.                   |
| `OPERATIONAL_ONLY`     | Puede producir allow completo por carril operativo. |

##### 9.2 Campos adicionales

| Campo                          | Regla                                                         |
| ------------------------------ | ------------------------------------------------------------- |
| `grant_component_type`         | `DIRECT_ALLOW` u `OPERATIONAL_COMPONENT`.                     |
| `compatible_operational_roles` | Lista no vacía de roles operativos exactos.                   |
| `requires_published_shift`     | Siempre `true`.                                               |
| `requires_active_checkin`      | Derivado del permiso.                                         |
| `requires_active_area`         | Derivado del permiso.                                         |
| `device_restriction_mode`      | Referencia a la política de AUTH-RBAC-023.                    |
| `redundancy_check_result`      | Debe demostrar que la matriz operativa no cubre la necesidad. |
| `review_frequency`             | Obligatoria para concesiones indefinidas o sensibles.         |

##### 9.3 Estados

```text
DRAFT
PENDING_APPROVAL
SCHEDULED
ACTIVE
SUSPENDED
REVOKED
EXPIRED
REJECTED
```

##### 9.4 Motivos permitidos

```text
TEMPORARY_OPERATIONAL_COVERAGE
SPECIALIZED_OPERATIONAL_RESPONSIBILITY
SUPERVISED_TRAINING
PROJECT_OR_PILOT_ASSIGNMENT
CONTROLLED_OPERATIONAL_READ_ACCESS
DOUBLE_CONDITION_OPERATIONAL_COMPONENT
BUSINESS_CONTINUITY
OTHER_APPROVED
```

##### 9.5 Invariantes

- no crea rol operativo;
- no sustituye la asignación de otro oficio completo;
- exige turno publicado;
- exige check-in cuando el permiso sea `T+C`;
- exige rol operativo compatible;
- no crea sede o área activas;
- no concede acceso organizacional global;
- termina con el contexto;
- el dispositivo puede restringir, nunca ampliar;
- un deny aplicable prevalece.

---

#### 10. Contrato de denegación explícita

```text
record_kind = EXPLICIT_DENY
effect = DENY
```

Subtipos:

| Subtipo                 | Carril           | Efecto                                                     |
| ----------------------- | ---------------- | ---------------------------------------------------------- |
| `BASE_LANE_DENY`        | `BASE`           | Bloquea únicamente allows base coincidentes.               |
| `OPERATIONAL_LANE_DENY` | `OPERATIONAL`    | Bloquea únicamente allows operativos coincidentes.         |
| `ACTOR_WIDE_DENY`       | `ALL_COMPATIBLE` | Bloquea la clave exacta en todos sus carriles compatibles. |

##### 10.1 Compatibilidad

| Modalidad              | Base deny | Operational deny | Actor-wide deny |
| ---------------------- | --------: | ---------------: | --------------: |
| `BASE_ONLY`            |        Sí |               No |              Sí |
| `OPERATIONAL_ONLY`     |        No |               Sí |              Sí |
| `BASE_OR_OPERATIONAL`  |        Sí |               Sí |              Sí |
| `BASE_AND_OPERATIONAL` |        Sí |               Sí |              Sí |

##### 10.2 Estados

```text
DRAFT
SCHEDULED
ACTIVE
REVOKED
EXPIRED
REJECTED
```

Las denegaciones no utilizan `SUSPENDED`.

Una denegación activa termina mediante:

- expiración;
- revocación auditada;
- sustitución versionada.

##### 10.3 Motivos permitidos

```text
SEGREGATION_OF_DUTIES
TEMPORARY_RESPONSIBILITY_RESTRICTION
TRAINING_OR_CERTIFICATION_REQUIRED
SECURITY_INCIDENT
CREDENTIAL_OR_IDENTITY_RISK
INVESTIGATION_HOLD
DATA_PROTECTION_RESTRICTION
FINANCIAL_CONTROL_RESTRICTION
OPERATIONAL_SAFETY_RESTRICTION
CONTRACTUAL_RESTRICTION
OTHER_APPROVED
```

##### 10.4 Invariantes

- una denegación usa una clave exacta;
- no existen wildcards;
- el alcance determina coincidencia, no precedencia;
- un allow más específico no vence un deny aplicable;
- revocar un deny no crea un allow;
- un deny no corrige una matriz mal diseñada;
- un actor-wide deny no se crea por rol;
- una denegación ambigua no se activa;
- una denegación no puede bloquear el principal de recuperación sin control reforzado.

---

#### 11. Precedencia canónica

```text
STRUCTURAL_DENY
        ↓
ACTOR_WIDE_DENY
        ↓
LANE_DENY
        ↓
ALLOW
        ↓
DEFAULT_DENY
```

Orden de evaluación:

1. resolver principal autenticado;
2. resolver actor efectivo;
3. validar identidad laboral;
4. validar trabajador activo;
5. validar aplicación y permiso;
6. resolver modalidad;
7. resolver recurso y territorio reales;
8. evaluar `STRUCTURAL_DENY`;
9. evaluar `ACTOR_WIDE_DENY`;
10. evaluar carril base;
11. evaluar `BASE_LANE_DENY`;
12. combinar matriz base y concesión individual base;
13. resolver contexto operativo;
14. evaluar `OPERATIONAL_LANE_DENY`;
15. combinar matriz operativa y concesión individual operativa;
16. combinar carriles según modalidad;
17. aplicar dispositivo, sensibilidad y prerrequisitos;
18. producir decisión estructurada;
19. registrar auditoría.

No se admite evaluar allows y omitir la búsqueda posterior de denies.

---

#### 12. Alcance y coincidencia

Tipos conceptuales permitidos:

```text
ORGANIZATION
ASSIGNED_SITES
SPECIFIC_SITE
SITE_TYPE_EXPLICIT
ASSIGNED_AREAS
SPECIFIC_AREA
AREA_KIND_EXPLICIT
OWN_RESOURCE
RELATED_RESOURCE_SET
SPECIFIC_RESOURCE
GLOBAL_PERMISSION
```

Reglas:

1. `GLOBAL_PERMISSION` solo se admite cuando el permiso lo permita y exista
   aprobación reforzada.
2. `ACTOR_WIDE_DENY` puede usar `GLOBAL_PERMISSION`.
3. Una concesión global individual es excepcional.
4. Un área debe pertenecer a la sede indicada.
5. Un tipo de sede o área debe declarar modo de cobertura.
6. APP-REVIEW, demo y territorios aislados nunca se incorporan por
   coincidencia de tipo.
7. Una operación multiterritorial se bloquea cuando cualquier recurso
   obligatorio coincide con un deny aplicable, salvo contrato explícito de
   ejecución parcial.
8. La sede seleccionada en frontend no modifica el alcance.

---

#### 13. Vigencia

Todo override debe declarar:

```text
effective_from
effective_until
timezone
status
reviewed_at
```

Reglas:

- una decisión futura no participa antes de `effective_from`;
- una decisión vencida no autoriza ni bloquea;
- la expiración se verifica durante autorización;
- no depende únicamente de cron;
- no existe renovación silenciosa;
- extender vigencia produce decisión auditada;
- una decisión indefinida exige justificación y revisión periódica;
- trabajador, permiso o aplicación inactivos producen bloqueo estructural;
- activar, suspender, revocar o expirar invalida caché;
- los registros históricos no se eliminan.

---

#### 14. Gobierno y segregación

##### 14.1 Concesiones

Las capacidades VISO aprobadas en el catálogo gobiernan:

- consultar;
- crear;
- aprobar;
- suspender;
- revocar;

de concesiones base y operativas.

Reglas:

- el beneficiario no se autoaprueba;
- el solicitante no se autoaprueba cuando exista conflicto;
- el operador técnico no adquiere autoridad empresarial;
- los permisos sensibles y alcances globales exigen aprobación reforzada;
- la aprobación debe evaluar el resultado efectivo completo.

##### 14.2 Denegaciones

Las capacidades VISO aprobadas gobiernan:

- consultar;
- crear;
- aprobar;
- revocar;

denegaciones.

No existe `suspend` para denegaciones.

`gerente_general` no recibe por matriz:

```text
viso.authorization.denials.approve
viso.authorization.denials.revoke
```

La autoridad deberá proceder de un actor expresamente autorizado.

---

#### 15. Tratamiento de las 29 claves nuevas

Las 29 claves creadas en AUTH-CAT-022:

- admiten overrides solo según su modalidad;
- comienzan con cero concesiones individuales;
- comienzan con cero denegaciones explícitas;
- no heredan asignaciones de permisos legacy;
- no heredan bloqueos de permisos legacy;
- requieren revisión humana clave por clave.

Claves legacy especialmente relevantes:

```text
pulso.pos.main
nexo.inventory.remissions.dispatch
viso.staff.permissions.manage
```

No se admite:

```text
DENY LEGACY AMPLIO
→ EXPANDIR A TODAS LAS CLAVES NUEVAS
```

---

#### 16. Transición de las 17 filas legacy

##### 16.1 Estado conocido

```text
employee_permissions
→ 17 concesiones positivas conocidas
→ 0 denegaciones funcionales confirmadas
→ 0 excepciones diferenciales confirmadas
```

##### 16.2 Clasificación obligatoria

Cada fila física deberá clasificarse en una sola categoría:

```text
LEGACY_REDUNDANT_WITH_BASE_MATRIX
LEGACY_REDUNDANT_WITH_OPERATIONAL_MATRIX
LEGACY_DUPLICATE
LEGACY_INACTIVE_EMPLOYEE
LEGACY_TECHNICAL_OR_DEVICE_IDENTITY
LEGACY_PERMISSION_RETIRED
LEGACY_PERMISSION_REPLACED
LEGACY_GRANT_UNRESOLVED
LEGACY_DENY_UNRESOLVED
MIGRATION_CANDIDATE_PENDING_APPROVAL
MIGRATED_TO_CANONICAL_OVERRIDE
RETIRED_AFTER_RECONCILIATION
```

##### 16.3 Reglas

1. ninguna fila se activa en el dataset por existir físicamente;
2. una fila redundante se retira después de verificar equivalencia;
3. una identidad técnica o dispositivo no migra como beneficiario humano;
4. un duplicado se consolida sin ampliar alcance;
5. una clave retirada no se reinterpreta;
6. una clave legacy uno-a-muchos no se expande;
7. una intención no verificable queda `UNRESOLVED` y no autoriza;
8. una candidata a migración exige permiso activo, carril, alcance, vigencia,
   motivo y aprobación;
9. el backfill debe ser idempotente;
10. la limpieza física requiere reconciliación y rollback.

##### 16.4 Registro de transición

El inventario legacy deberá conservar:

| Campo                         | Regla                                                     |
| ----------------------------- | --------------------------------------------------------- |
| `legacy_source_table`         | Tabla física de origen.                                   |
| `legacy_source_id`            | Identificador original.                                   |
| `legacy_employee_reference`   | Identidad encontrada.                                     |
| `legacy_permission_reference` | Clave o identificador original.                           |
| `legacy_is_allowed`           | Valor original sin reinterpretación automática.           |
| `normalized_permission_key`   | Clave canónica candidata o nulo.                          |
| `candidate_lane`              | Carril candidato o nulo.                                  |
| `classification`              | Una categoría de la sección 16.2.                         |
| `review_status`               | `PENDING`, `REVIEWED`, `MIGRATED`, `RETIRED` o `BLOCKED`. |
| `reviewed_by`                 | Actor humano revisor.                                     |
| `reviewed_at`                 | Fecha de revisión.                                        |
| `decision_reference`          | Evidencia de la decisión.                                 |
| `migration_target_id`         | Override nuevo cuando exista.                             |
| `notes`                       | Explicación minimizada.                                   |

Este registro es de migración. No es una fuente de autorización.

---

#### 17. Dataset inicial y runtime

##### 17.1 Seed inicial

El payload de `1.0.0` contiene solo el manifiesto porque no existen registros
individuales aprobados.

##### 17.2 Registros futuros

Después de implementar el gobierno VISO, una decisión aprobada podrá crear un
registro runtime.

Cada registro deberá:

- cumplir el esquema;
- validar modalidad;
- comprobar redundancia;
- comprobar segregación;
- registrar versión;
- emitir eventos;
- invalidar caché;
- conservar historial;
- respetar el catálogo activo.

##### 17.3 Cambios de catálogo

Un override runtime vinculado a una versión anterior:

- conserva su versión histórica;
- debe revisarse cuando cambia el permiso;
- no se migra automáticamente a otra clave;
- se suspende o bloquea cuando la clave queda retirada;
- requiere decisión nueva cuando cambia la semántica.

---

#### 18. Serialización y hash

La huella del seed inicial se calcula así:

- UTF-8 sin BOM;
- saltos LF;
- primera línea = manifiesto JSON compacto;
- no existen líneas de registros;
- sin espacios finales;
- un único LF al final;
- SHA-256 sobre todos los bytes;
- sin fecha, timestamp ni estado de aprobación.

Payload:

```jsonl
{"dataset_id":"vento.authorization.individual-overrides","dataset_version":"1.0.0","dataset_schema_version":"1.0.0","catalog_id":"vento.authorization","catalog_version":"1.0.0","catalog_schema_version":"1.0.0","contract_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","canonical_record_count":0,"individual_base_grant_count":0,"individual_operational_grant_count":0,"base_lane_deny_count":0,"operational_lane_deny_count":0,"actor_wide_deny_count":0,"legacy_source_row_count_expected":17,"legacy_confirmed_functional_grant_count":0,"legacy_confirmed_deny_count":0}
```

Resultado:

```text
dataset_hash = sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10
```

---

#### 19. Validaciones obligatorias

El seed deberá validar:

1. `canonical_record_count = 0`;
2. `individual_base_grant_count = 0`;
3. `individual_operational_grant_count = 0`;
4. `base_lane_deny_count = 0`;
5. `operational_lane_deny_count = 0`;
6. `actor_wide_deny_count = 0`;
7. `legacy_source_row_count_expected = 17`;
8. `legacy_confirmed_functional_grant_count = 0`;
9. `legacy_confirmed_deny_count = 0`;
10. no contiene `employee_id`;
11. no contiene claves legacy;
12. no contiene permisos retirados;
13. no contiene wildcards;
14. no contiene identidades técnicas;
15. no crea allows o denies por las 29 claves nuevas;
16. no convierte `DEFAULT_DENY` en filas explícitas;
17. el hash coincide con el publicado.

Resultado documental:

```text
canonical_records = 0
legacy_rows_expected = 17
automatic_grants = 0
automatic_denials = 0
legacy_expansions = 0
dataset_hash = sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10
```

---

#### 20. Eventos mínimos de runtime

##### 20.1 Concesiones base

```text
individual_base_grant_requested
individual_base_grant_approved
individual_base_grant_rejected
individual_base_grant_scheduled
individual_base_grant_activated
individual_base_grant_updated
individual_base_grant_suspended
individual_base_grant_reactivated
individual_base_grant_revoked
individual_base_grant_expired
individual_base_grant_redundancy_detected
individual_base_grant_conflict_detected
```

##### 20.2 Concesiones operativas

```text
individual_operational_grant_requested
individual_operational_grant_approved
individual_operational_grant_rejected
individual_operational_grant_scheduled
individual_operational_grant_activated
individual_operational_grant_used
individual_operational_grant_blocked
individual_operational_grant_updated
individual_operational_grant_suspended
individual_operational_grant_reactivated
individual_operational_grant_revoked
individual_operational_grant_expired
individual_operational_grant_redundancy_detected
individual_operational_grant_conflict_detected
```

##### 20.3 Denegaciones

```text
deny_created
deny_scheduled
deny_approved
deny_activated
deny_updated
deny_revoked
deny_expired
deny_rejected
deny_conflict_detected
deny_recovery_risk_detected
```

##### 20.4 Transición legacy

```text
legacy_override_discovered
legacy_override_classified
legacy_override_blocked
legacy_override_migration_proposed
legacy_override_migrated
legacy_override_retired
legacy_override_reconciliation_failed
```

---

#### 21. Respuesta de autorización

Cuando un override participe en una decisión, la respuesta deberá poder
registrar:

```text
allowed
decision
decision_id
permission_key
authorization_mode
authorization_lane
matrix_sources
individual_grant_ids
deny_ids
deny_class
deny_scope
reason_code
blocked_reasons
resource_contract_result
context_result
device_result
```

No será suficiente devolver únicamente `true` o `false`.

Los motivos confidenciales deben permanecer protegidos.

---

#### 22. Relación con dispositivos compartidos

Un dispositivo compartido:

- no recibe grants;
- no recibe denies humanos;
- no se convierte en beneficiario;
- no transfiere overrides entre actores;
- no conserva autoridad después de cerrar sesión;
- puede filtrar o impedir una capacidad;
- nunca amplía una concesión;
- nunca ignora un deny aplicable.

La evaluación usa siempre el actor humano efectivo.

---

#### 23. Relación con AUTH-RBAC-024 y AUTH-RBAC-025

```text
MATRIZ BASE
+
MATRIZ OPERATIVA
+
CONCESIONES INDIVIDUALES
-
DENEGACIONES APLICABLES
+
CONTEXTO Y RECURSO
=
DECISIÓN EFECTIVA
```

AUTH-RBAC-026 no modifica:

- `vento.authorization.base-role-grants@1.0.0`;
- `vento.authorization.operational-role-grants@1.0.0`.

Los tres datasets son independientes y se combinan durante la evaluación.

Una necesidad general deberá corregirse en la matriz correspondiente.

Una necesidad particular podrá utilizar un override individual aprobado.

---

#### 24. Relación con tareas posteriores

##### AUTH-RBAC-027

Validará que:

- ninguna concesión individual operativa produzca alcance global;
- `null` no se interprete como global;
- ningún dispositivo amplíe contexto;
- las filas legacy no creen acceso accidental.

##### AUTH-RBAC-028

Validará que:

- un allow base no dependa de turno o check-in;
- una concesión operativa sí exija su contexto;
- los componentes de doble condición permanezcan separados.

##### BLOQUE E

Diseñará la función unificada de decisión, razones estructuradas, precedencia,
caché e invalidación.

##### BLOQUE E3

Definirá tablas, relaciones, índices, constraints, RLS, funciones y transición
objetivo de Supabase.

##### BLOQUE R

Implementará:

- dataset seed;
- extracción de las 17 filas;
- clasificación legacy;
- backfill;
- reconciliación;
- migración idempotente;
- retiro controlado;
- telemetría;
- rollback.

##### BLOQUE QA

Probará:

- vigencia;
- expiración;
- revocación;
- cambio de turno;
- check-out;
- alcance;
- recurso;
- segregación;
- dispositivos;
- denies;
- transición legacy.

---

#### 25. Fuera del alcance

AUTH-RBAC-026 no:

- crea excepciones para personas concretas;
- crea denegaciones reales;
- aprueba las 17 filas legacy;
- publica archivos físicos;
- crea tablas;
- inserta registros;
- ejecuta backfill;
- elimina `employee_permissions`;
- migra identidades;
- modifica RLS;
- modifica RPC;
- implementa guards;
- cambia dispositivos;
- invalida sesiones;
- modifica Supabase.

---

#### 26. Riesgos controlados

##### Riesgo 1 — Migrar las 17 filas como válidas

Control:

```text
17 LEGACY
→ 0 CANÓNICAS AUTOMÁTICAS
```

##### Riesgo 2 — Convertir ausencia en deny explícito

Control:

```text
NO ALLOW
→ DEFAULT_DENY
→ NO CREAR FILA
```

##### Riesgo 3 — Concesión individual como segundo rol

Control:

- verificación de redundancia;
- finalidad particular;
- alcance explícito;
- revisión periódica.

##### Riesgo 4 — Permiso operativo permanente

Control:

- turno obligatorio;
- rol operativo compatible;
- check-in cuando corresponda;
- expiración.

##### Riesgo 5 — Deny legacy expandido a claves nuevas

Control:

```text
LEGACY UNO-A-MUCHOS
→ REVISIÓN HUMANA
→ CERO EXPANSIÓN AUTOMÁTICA
```

##### Riesgo 6 — Dispositivo como sujeto

Control:

```text
employee_id
→ trabajador humano
```

##### Riesgo 7 — Revocar deny concede permiso

Control:

```text
REVOKE DENY
→ REEVALUAR ALLOWS
→ NO CREAR ALLOW
```

##### Riesgo 8 — Seed vacío interpretado como tarea incompleta

Control:

- manifiesto versionado;
- hash reproducible;
- cero explícito por cada clase;
- transición legacy separada.

---

#### 27. Criterios de aprobación

AUTH-RBAC-026 podrá aprobarse cuando se acepte que:

1. el dataset se identifica como
   `vento.authorization.individual-overrides@1.0.0`;
2. referencia `vento.authorization@1.0.0`;
3. referencia la huella contractual de AUTH-CAT-024;
4. el seed inicial contiene exactamente cero registros;
5. existen cero concesiones base automáticas;
6. existen cero concesiones operativas automáticas;
7. existen cero denegaciones automáticas;
8. las 17 filas legacy no se incorporan como autorizaciones;
9. `DEFAULT_DENY` no se materializa como deny explícito;
10. se distinguen grants y denies;
11. se distinguen carriles base, operativo y todos los compatibles;
12. `STRUCTURAL_DENY` permanece fuera del dataset administrable;
13. los grants usan claves exactas y modalidades compatibles;
14. los denies usan claves exactas, alcance, vigencia y motivo;
15. un deny aplicable prevalece;
16. una concesión positiva nunca restringe otra concesión;
17. los dispositivos no reciben ni transfieren overrides;
18. la transición legacy tiene clasificación explícita;
19. el hash inicial es
    `sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10`;
20. la implementación física queda reservada para BLOQUE R.

---

#### 28. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-025 | APROBADA    |
| AUTH-RBAC-026 | APROBADA    |
| AUTH-RBAC-027 | NO INICIADA |

No se avanza a AUTH-RBAC-027 hasta recibir aprobación explícita de
AUTH-RBAC-026.
