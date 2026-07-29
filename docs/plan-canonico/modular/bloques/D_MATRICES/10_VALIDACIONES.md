### SECCIÓN — VALIDACIONES

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-RBAC-027` a `AUTH-RBAC-028` — 2 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-RBAC-027 — Validar que no exista acceso operativo global accidental

**Estado:** APROBADA  
**Bloque:** BLOQUE D — Validaciones de matrices  
**Naturaleza:** Validación contractual transversal y puerta de cierre  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-RBAC-026 — APROBADA  
**Tarea posterior reservada:** AUTH-RBAC-028 — Validar que la administración no dependa del check-in  
**Catálogo validado:** `vento.authorization@1.0.0`  
**Dataset base validado:** `vento.authorization.base-role-grants@1.0.0`  
**Dataset operativo validado:** `vento.authorization.operational-role-grants@1.0.0`  
**Dataset de overrides validado:** `vento.authorization.individual-overrides@1.0.0`  
**Aserciones ejecutadas:** **20**  
**Incumplimientos bloqueantes:** **0**  
**Resultado propuesto:** **PASS**  
**Hash de evidencia:** `sha256:83842bb7dc8e727c12f2f8a2f1948cb57d9a793e73308bc2cb71c675f73a337b`

Esta tarea valida documentalmente que ninguna matriz, componente,
excepción inicial, clave legacy o relación con dispositivos produzca
autoridad operativa global accidental.

No crea tablas, no inserta filas, no modifica Supabase, no genera
migraciones, no altera RLS o RPC y no materializa los datasets.

---

#### 1. Objetivo

Confirmar que el modelo contractual cumple simultáneamente:

```text
AUTORIDAD OPERATIVA
→ permiso exacto
→ actor humano efectivo
→ rol operativo vigente
→ turno válido
→ check-in cuando corresponda
→ sede y área compatibles
→ recurso real relacionado
→ dispositivo permitido
→ ausencia de denegación
```

Y que no existe ningún camino equivalente a:

```text
ROL OPERATIVO
→ TODAS LAS SEDES

CHECK-IN
→ TODOS LOS PERMISOS

DISPOSITIVO
→ AUTORIDAD

GERENCIA_OPERATIVA
→ ESPECIALISTA UNIVERSAL

NULL
→ GLOBAL

APP ACCESS
→ TODAS LAS FUNCIONES
```

---

#### 2. Alcance de la validación

La validación cubre:

1. las 499 concesiones lógicas de la matriz base;
2. las 240 concesiones lógicas de la matriz operativa;
3. el seed vacío de excepciones y denegaciones;
4. las 22 claves legacy bloqueadas;
5. los 14 permisos técnicos retirados;
6. las 17 filas legacy pendientes de clasificación;
7. los 12 roles operativos;
8. los 22 componentes operativos de doble condición;
9. la relación entre paquetes de dispositivo y autoridad;
10. las reglas de resolución territorial y de recurso.

No valida todavía:

- filas físicas;
- UUID territoriales;
- RLS;
- RPC;
- consultas reales;
- consumidores de aplicaciones;
- backfills;
- migraciones;
- telemetría de producción.

Esas validaciones pertenecen a E3, BLOQUE R y QA.

---

#### 3. Fuentes contractuales

| Fuente           | Identificador                                       | Hash                                                                      |
| ---------------- | --------------------------------------------------- | ------------------------------------------------------------------------- |
| Catálogo         | `vento.authorization@1.0.0`                         | `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe` |
| Matriz base      | `vento.authorization.base-role-grants@1.0.0`        | `sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1` |
| Matriz operativa | `vento.authorization.operational-role-grants@1.0.0` | `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f` |
| Overrides        | `vento.authorization.individual-overrides@1.0.0`    | `sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10` |

Regla:

```text
VALIDACIÓN CONTRACTUAL
→ usa snapshots exactos
→ no reinterpreta matrices
→ no corrige silenciosamente datasets
```

---

#### 4. Resultado ejecutivo

| Dimensión                                            | Resultado        |
| ---------------------------------------------------- | ---------------- |
| Acceso operativo global accidental                   | **NO DETECTADO** |
| Wildcards                                            | **0**            |
| `null` interpretado como global                      | **0**            |
| Perfiles base/globales dentro de matriz operativa    | **0**            |
| Permisos `BASE_ONLY` dentro de matriz operativa      | **0**            |
| Claves legacy o retiradas dentro de matriz operativa | **0**            |
| `nexo.inventory.remissions.dispatch`                 | **0**            |
| Dispositivos usados como beneficiarios               | **0**            |
| Empleados concretos embebidos en matriz operativa    | **0**            |
| Overrides iniciales capaces de ampliar autoridad     | **0**            |
| Incumplimientos bloqueantes                          | **0**            |
| **Veredicto**                                        | **PASS**         |

---

#### 5. Validaciones automatizables

| ID                | Control                                            | Esperado | Obtenido | Resultado |
| ----------------- | -------------------------------------------------- | -------: | -------: | --------- |
| `RBAC-GLOBAL-001` | Conteo operativo                                   |      240 |      240 | **PASS**  |
| `RBAC-GLOBAL-002` | Roles operativos canónicos                         |       12 |       12 | **PASS**  |
| `RBAC-GLOBAL-003` | Pares rol-permiso únicos                           |      240 |      240 | **PASS**  |
| `RBAC-GLOBAL-004` | Filas del carril OPERATIONAL                       |      240 |      240 | **PASS**  |
| `RBAC-GLOBAL-005` | Concesiones operativas directas                    |      218 |      218 | **PASS**  |
| `RBAC-GLOBAL-006` | Componentes operativos                             |       22 |       22 | **PASS**  |
| `RBAC-GLOBAL-007` | Permisos BASE_ONLY en matriz operativa             |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-008` | Componentes con modalidad incorrecta               |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-009` | Alcances operativos con prefijo CTX-               |      240 |      240 | **PASS**  |
| `RBAC-GLOBAL-010` | Perfiles base/globales dentro del carril operativo |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-011` | Uso de null como alcance                           |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-012` | Wildcards                                          |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-013` | Permisos fuera del catálogo activo                 |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-014` | Claves legacy bloqueadas                           |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-015` | Permisos técnicos retirados                        |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-016` | Apariciones de dispatch                            |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-017` | Intersección entre códigos de rol base y operativo |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-018` | Registros del seed de overrides                    |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-019` | Dispositivos usados como sujetos de concesión      |        0 |        0 | **PASS**  |
| `RBAC-GLOBAL-020` | Empleados concretos embebidos en matriz operativa  |        0 |        0 | **PASS**  |

Resultado:

```text
assertions = 20
passed = 20
failed = 0
result = PASS
```

---

#### 6. Cobertura por rol operativo

| Rol operativo                | Registros | Resultado territorial                              |
| ---------------------------- | --------: | -------------------------------------------------- |
| `cajero_satelite`            |        20 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `barista_satelite`           |        11 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `cocinero_satelite`          |        11 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `servicio_salon`             |        11 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `mostrador_satelite`         |        11 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `operador_integral_satelite` |        21 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `produccion_cocina`          |        16 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `produccion_panaderia`       |        16 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `produccion_reposteria`      |        16 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `bodeguero`                  |        36 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `conductor_logistica`        |        16 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| `gerencia_operativa`         |        55 | `PASS` — limitado por `CTX-*`, contexto y recurso. |
| **Total**                    |   **240** | **PASS**                                           |

Ningún código de rol operativo coincide con un código de rol base.

La separación de namespaces evita que una matriz base sea consumida como
matriz operativa por coincidencia nominal.

---

#### 7. Regla territorial obligatoria

Las 240 filas operativas cumplen:

```text
scope_expression
→ comienza por CTX-
```

No aparece ningún perfil propio del carril base o de alcance global:

```text
G(B)
G-FUNC
G-FIN
G-SRC
ORG
ORG-REF
ORG-LOCAL
GLOBAL_PERMISSION
```

Los perfiles `CTX-*` no son etiquetas suficientes por sí solos. La
implementación deberá resolver en servidor las dimensiones declaradas por
cada fila:

- sede activa;
- área activa;
- punto operativo;
- caja;
- bodega;
- orden;
- lote;
- remisión;
- ruta;
- vehículo;
- recurso asignado;
- relación de origen o destino.

Regla:

```text
CTX-* SIN RECURSO RESUELTO
→ INDETERMINATE
→ DENY
```

---

#### 8. Prohibición de globalidad por ausencia de datos

No se admite:

```text
site_id = null
→ todas las sedes

area_id = null
→ todas las áreas

resource_id = null
→ todos los recursos

route_id = null
→ todas las rutas
```

Una dimensión nula deberá significar únicamente:

- no aplicable para ese contrato;
- dato todavía no resuelto;
- decisión indeterminada.

Nunca significa global.

La implementación física deberá usar constraints, validadores o contratos
discriminados que impidan estados ambiguos.

---

#### 9. Acceso a aplicación

Los permisos de entrada como:

```text
fogo.access
nexo.access
origo.access
pulso.access
```

solo permiten presentar la aplicación o su estado de entrada.

Regla:

```text
<app>.access
≠
acceso a todas las capacidades internas
```

La navegación, la URL y cada acción interna deberán volver a evaluar su
permiso exacto.

Una aplicación no podrá inferir:

```text
PUEDE ENTRAR
→ PUEDE OPERAR TODO
```

---

#### 10. `gerencia_operativa`

`gerencia_operativa` contiene 55 decisiones explícitas.

No es una autoridad operacional global.

Sus alcances se limitan a:

- sede o área activa;
- jornada coordinada;
- operaciones que afecten su territorio;
- recursos bajo coordinación expresa;
- consultas y componentes sensibles exactos.

No recibe automáticamente:

- operaciones ordinarias de caja;
- custodia de conductor;
- ejecución especializada de producción;
- administración global de catálogo;
- autoridad sobre todas las sedes;
- permisos por nombre de rol.

Regla:

```text
GERENCIA_OPERATIVA
→ coordina capacidades exactas

GERENCIA_OPERATIVA
≠
cajero + bodeguero + conductor + productor
```

---

#### 11. Producción y recetario operativo

Las tres filas operativas de:

```text
fogo.production.recipe_book.view
```

para:

```text
produccion_cocina
produccion_panaderia
produccion_reposteria
```

no se consideran globales porque están limitadas a:

- la disciplina productiva exacta;
- recetas publicadas aplicables;
- órdenes de esa disciplina;
- proyección operativa;
- exclusión de costos, márgenes, borradores, edición y maestro completo.

Condición obligatoria para implementación:

```text
RECETARIO OPERATIVO
→ filtrar por orden, producto, receta publicada y área productiva compatibles
→ no exponer el maestro completo
```

Si una consulta física no puede demostrar esa relación, la decisión deberá
ser `DENY` o `INDETERMINATE`.

---

#### 12. Conductor y custodia

`conductor_logistica` queda limitado a:

- rutas asignadas;
- vehículo asignado;
- remisiones asignadas;
- segmentos logísticos vigentes;
- custodia aceptada;
- tránsito iniciado;
- entrega registrada.

No puede consultar el tablero logístico global ni operaciones de otros
conductores.

La separación:

```text
accept_custody
start_transit
deliver
```

impide que una única clave amplia conceda todo el ciclo.

`nexo.inventory.remissions.dispatch` no aparece en el dataset.

---

#### 13. Bodeguero e inventario

`bodeguero` recibe capacidades sobre la bodega activa y recursos bajo su
custodia.

No recibe por contexto:

- todas las existencias de la organización;
- otras bodegas;
- otras sedes;
- aprobación o resolución de su propia diferencia;
- administración del catálogo;
- modificación silenciosa de cantidades;
- recepción comercial y entrada física como un único efecto.

La visibilidad de un extremo de una transferencia o remisión no concede
autoridad sobre el otro extremo.

---

#### 14. Caja y PULSO

Las operaciones ordinarias se limitan a:

- actor humano;
- turno;
- sede;
- área;
- punto de venta;
- sesión de caja;
- pedido o pago relacionado.

Las acciones sensibles son componentes operativos:

```text
reverse
cancel
return
refund
discount
```

Y requieren:

```text
COMPONENTE BASE DEL MISMO ACTOR
+
COMPONENTE OPERATIVO DEL MISMO ACTOR
+
MISMO PERMISO
+
MISMO RECURSO
+
MISMA SOLICITUD
```

No pueden combinarse componentes de actores diferentes.

---

#### 15. Excepciones y denegaciones

El seed de:

```text
vento.authorization.individual-overrides@1.0.0
```

contiene cero registros.

Por tanto, en la versión contractual inicial:

- ninguna excepción amplía alcance;
- ninguna concesión operativa individual crea globalidad;
- ninguna denegación legacy se expande;
- ninguna de las 17 filas legacy participa;
- revocar un deny no crea un allow.

Los overrides futuros deberán pasar nuevamente esta validación cuando:

- utilicen alcance organizacional;
- no tengan expiración;
- sean operativos;
- afecten permisos sensibles;
- utilicen tipos de sede o área;
- contengan recursos múltiples.

---

#### 16. Dispositivos compartidos

Los datasets no contienen:

```text
device_id
device_code
device_package
shared_device_id
```

como sujetos de concesión.

Un paquete de dispositivo:

```text
→ restringe qué capacidades pueden presentarse o ejecutarse
→ no añade permisos
→ no crea turno
→ no crea check-in
→ no cambia el actor efectivo
→ no amplía sede o área
```

La evaluación deberá usar siempre la intersección:

```text
AUTORIDAD DEL ACTOR
∩
CAPACIDADES PERMITIDAS POR EL DISPOSITIVO
```

Nunca la unión.

---

#### 17. Filas legacy

Las 17 filas legacy de `employee_permissions` permanecen fuera del dataset
canónico.

Antes de cualquier backfill deberán clasificarse.

Regla:

```text
FILA LEGACY NO CLASIFICADA
→ NO AUTORIZA
```

Especialmente deberán bloquearse:

- identidades inactivas;
- identidades técnicas;
- dispositivos representados como usuarios;
- claves retiradas;
- claves legacy uno-a-muchos;
- duplicados;
- filas sin alcance verificable.

---

#### 18. Pruebas negativas obligatorias

La implementación deberá demostrar, como mínimo:

| Caso                                              | Resultado esperado       |
| ------------------------------------------------- | ------------------------ |
| Rol operativo válido sin turno                    | `DENY`                   |
| Turno válido sin rol operativo                    | `DENY`                   |
| Check-in en sede distinta                         | `DENY`                   |
| Área no perteneciente a la sede activa            | `DENY`                   |
| Recurso de otra sede                              | `DENY`                   |
| Ruta no asignada al conductor                     | `DENY`                   |
| Bodega diferente a la activa                      | `DENY`                   |
| Sesión de caja de otro actor                      | `DENY`                   |
| `null` territorial ambiguo                        | `DENY` o `INDETERMINATE` |
| Dispositivo permitido sin permiso humano          | `DENY`                   |
| `<app>.access` sin permiso interno                | `DENY`                   |
| Componente base de actor A y operativo de actor B | `DENY`                   |
| Fila legacy no clasificada                        | `DENY`                   |
| Permiso por prefijo                               | `DENY`                   |
| `dispatch` solicitado                             | `DENY`                   |
| Recetario maestro desde proyección operativa      | `DENY`                   |

---

#### 19. Pruebas positivas controladas

| Caso                                                     | Resultado esperado                   |
| -------------------------------------------------------- | ------------------------------------ |
| Cajero con pedido propio, turno, check-in y caja válidos | Evaluar `ALLOW` según permiso exacto |
| Bodeguero con stock de bodega activa                     | Evaluar `ALLOW`                      |
| Conductor con remisión y ruta asignadas                  | Evaluar `ALLOW`                      |
| Producción con orden y receta publicada del área activa  | Evaluar `ALLOW`                      |
| Gerencia operativa con recurso de sede coordinada        | Evaluar `ALLOW`                      |
| Acción sensible con ambos componentes del mismo actor    | Evaluar `ALLOW`                      |
| Mismo permiso sobre recurso fuera de alcance             | `DENY`                               |

Un caso positivo nunca debe probarse únicamente con el nombre del rol.

---

#### 20. Puertas para implementación física

La materialización futura deberá fallar si detecta:

1. alcance operativo global;
2. `null` convertido en global;
3. wildcard;
4. permiso `BASE_ONLY` en matriz operativa;
5. rol operativo sin contexto;
6. paquete de dispositivo como fuente de allow;
7. empleado o dispositivo embebido en matriz de rol;
8. clave legacy o retirada;
9. `dispatch`;
10. consulta de recetario maestro;
11. recurso territorial no resuelto;
12. combinación de componentes entre actores;
13. fila legacy activa antes de clasificación;
14. diferencia entre conteos o hashes contractuales.

Resultado requerido:

```text
FAIL CLOSED
→ DETENER MIGRACIÓN
→ NO PUBLICAR DATASET FÍSICO
→ PRODUCIR EVIDENCIA
```

---

#### 21. Evidencia canónica

La evidencia se serializa mediante:

- UTF-8 sin BOM;
- saltos LF;
- primera línea = manifiesto compacto;
- líneas siguientes = aserciones compactas;
- orden por ID;
- sin timestamps;
- un único LF final;
- SHA-256 sobre todos los bytes.

```jsonl
{"validation_id":"vento.authorization.no-accidental-global-operational-access","validation_version":"1.0.0","catalog_id":"vento.authorization","catalog_version":"1.0.0","contract_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","base_dataset_id":"vento.authorization.base-role-grants","base_dataset_hash":"sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1","operational_dataset_id":"vento.authorization.operational-role-grants","operational_dataset_hash":"sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f","override_dataset_id":"vento.authorization.individual-overrides","override_dataset_hash":"sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10","assertion_count":20,"blocking_failure_count":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-001","control":"Conteo operativo","expected":240,"actual":240,"result":"PASS"}
{"id":"RBAC-GLOBAL-002","control":"Roles operativos canónicos","expected":12,"actual":12,"result":"PASS"}
{"id":"RBAC-GLOBAL-003","control":"Pares rol-permiso únicos","expected":240,"actual":240,"result":"PASS"}
{"id":"RBAC-GLOBAL-004","control":"Filas del carril OPERATIONAL","expected":240,"actual":240,"result":"PASS"}
{"id":"RBAC-GLOBAL-005","control":"Concesiones operativas directas","expected":218,"actual":218,"result":"PASS"}
{"id":"RBAC-GLOBAL-006","control":"Componentes operativos","expected":22,"actual":22,"result":"PASS"}
{"id":"RBAC-GLOBAL-007","control":"Permisos BASE_ONLY en matriz operativa","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-008","control":"Componentes con modalidad incorrecta","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-009","control":"Alcances operativos con prefijo CTX-","expected":240,"actual":240,"result":"PASS"}
{"id":"RBAC-GLOBAL-010","control":"Perfiles base/globales dentro del carril operativo","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-011","control":"Uso de null como alcance","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-012","control":"Wildcards","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-013","control":"Permisos fuera del catálogo activo","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-014","control":"Claves legacy bloqueadas","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-015","control":"Permisos técnicos retirados","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-016","control":"Apariciones de dispatch","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-017","control":"Intersección entre códigos de rol base y operativo","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-018","control":"Registros del seed de overrides","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-019","control":"Dispositivos usados como sujetos de concesión","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-GLOBAL-020","control":"Empleados concretos embebidos en matriz operativa","expected":0,"actual":0,"result":"PASS"}
```

Resultado:

```text
evidence_hash = sha256:83842bb7dc8e727c12f2f8a2f1948cb57d9a793e73308bc2cb71c675f73a337b
```

---

#### 22. Veredicto

```text
RESULTADO = PASS
INCUMPLIMIENTOS BLOQUEANTES = 0
OBSERVACIONES DE IMPLEMENTACIÓN = 3
```

Observaciones:

1. el recetario operativo debe materializarse como proyección filtrada y no
   como acceso al maestro;
2. `<app>.access` debe permanecer separado de capacidades internas;
3. la implementación debe resolver territorios y recursos en servidor y
   fallar cerrada ante ambigüedad.

Estas observaciones no cambian los datasets aprobados y no reabren el
catálogo.

---

#### 23. Criterios de aprobación

AUTH-RBAC-027 podrá aprobarse cuando se acepte que:

1. las 20 aserciones contractuales pasan;
2. no existe alcance operativo global;
3. las 240 filas usan perfiles `CTX-*`;
4. no existen perfiles base o globales en la matriz operativa;
5. no existe `null` con semántica global;
6. no existen wildcards;
7. no existen claves legacy o retiradas;
8. `dispatch` no aparece;
9. los roles base y operativos permanecen separados;
10. `gerencia_operativa` no es especialista universal;
11. los permisos de entrada no conceden funciones internas;
12. los componentes dobles pertenecen al mismo actor;
13. los dispositivos restringen, pero no conceden;
14. las 17 filas legacy no participan;
15. el seed de overrides permanece vacío;
16. el recetario operativo se limita a proyección aplicable;
17. toda dimensión territorial se resuelve en servidor;
18. la implementación futura deberá fallar cerrada;
19. el hash de evidencia es
    `sha256:83842bb7dc8e727c12f2f8a2f1948cb57d9a793e73308bc2cb71c675f73a337b`;
20. AUTH-RBAC-028 queda habilitada únicamente después de aprobación expresa.

---

#### 24. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-026 | APROBADA    |
| AUTH-RBAC-027 | APROBADA    |
| AUTH-RBAC-028 | NO INICIADA |

No se avanza a AUTH-RBAC-028 hasta recibir aprobación explícita de
AUTH-RBAC-027.


### ✅ AUTH-RBAC-028 — Validar que la administración no dependa del check-in

**Estado:** APROBADA
**Bloque:** BLOQUE D — Validaciones de matrices  
**Naturaleza:** Validación contractual transversal y cierre del BLOQUE D  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-RBAC-027 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-001 — Diseñar AccessContext canónico  
**Catálogo validado:** `vento.authorization@1.0.0`  
**Dataset base validado:** `vento.authorization.base-role-grants@1.0.0`  
**Dataset operativo validado:** `vento.authorization.operational-role-grants@1.0.0`  
**Dataset de overrides validado:** `vento.authorization.individual-overrides@1.0.0`  
**Aserciones ejecutadas:** **23**  
**Incumplimientos bloqueantes:** **0**  
**Resultado propuesto:** **PASS**  
**Hash de evidencia:** `sha256:84573a502cddc91e8b3acf4603399a5d2812724770084e0381121aee7fe18250`

Esta tarea valida que las capacidades administrativas concedidas por el
carril base no dependan de turno, check-in, rol operativo, sede operativa o
área operativa.

También confirma la regla inversa:

```text
TURNO O CHECK-IN
→ NO CREAN AUTORIDAD ADMINISTRATIVA
```

Y preserva la doble condición:

```text
BASE_AND_OPERATIONAL
→ componente base independiente
→ componente operativo contextual
→ acción final exige ambos componentes del mismo actor
```

No crea tablas, no inserta filas, no modifica Supabase, no genera
migraciones, no altera RLS o RPC y no materializa los datasets.

---

#### 1. Objetivo

Confirmar que el modelo contractual cumple simultáneamente:

```text
BASE_ONLY
→ carril base
→ sin turno
→ sin check-in

BASE_OR_OPERATIONAL POR CARRIL BASE
→ carril base suficiente
→ sin turno
→ sin check-in

BASE_OR_OPERATIONAL POR CARRIL OPERATIVO
→ contexto operativo vigente

BASE_AND_OPERATIONAL
→ base no depende de check-in
→ operación sí depende de contexto
→ acción final requiere ambos
```

Y que no exista ningún camino equivalente a:

```text
SIN CHECK-IN
→ PERDER ADMINISTRACIÓN

CHECK-IN ACTIVO
→ GANAR ADMINISTRACIÓN

ROL OPERATIVO
→ HEREDAR MATRIZ BASE

ROL BASE
→ EJECUTAR CAPACIDAD OPERATIVA

COMPONENTE BASE
→ EJECUTAR ACCIÓN DOBLE
```

---

#### 2. Alcance de la validación

Se validan:

1. 499 registros de matriz base;
2. siete roles base;
3. 463 concesiones base directas;
4. 36 componentes base;
5. 240 registros de matriz operativa;
6. doce roles operativos;
7. 218 concesiones operativas directas;
8. 22 componentes operativos;
9. doce claves `BASE_AND_OPERATIONAL`;
10. el seed inicial de overrides con cero registros;
11. la separación de carriles;
12. la independencia entre administración y presencia operativa.

No se valida todavía:

- implementación de `AccessContext`;
- consultas reales de turno o check-in;
- RPC;
- RLS;
- filas físicas;
- sesiones reales;
- consumidores de aplicaciones;
- caché e invalidación;
- migraciones;
- telemetría.

Esas comprobaciones continuarán en BLOQUE E, E3, BLOQUE R y QA.

---

#### 3. Fuentes contractuales

| Fuente           | Identificador                                       | Hash                                                                      |
| ---------------- | --------------------------------------------------- | ------------------------------------------------------------------------- |
| Catálogo         | `vento.authorization@1.0.0`                         | `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe` |
| Matriz base      | `vento.authorization.base-role-grants@1.0.0`        | `sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1` |
| Matriz operativa | `vento.authorization.operational-role-grants@1.0.0` | `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f` |
| Overrides        | `vento.authorization.individual-overrides@1.0.0`    | `sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10` |

La validación consume snapshots exactos. No modifica las matrices ni
recalcula sus hashes.

---

#### 4. Resultado ejecutivo

| Dimensión                                            | Resultado        |
| ---------------------------------------------------- | ---------------- |
| Administración base dependiente de turno             | **NO DETECTADA** |
| Administración base dependiente de check-in          | **NO DETECTADA** |
| Permisos `OPERATIONAL_ONLY` en matriz base           | **0**            |
| Permisos `BASE_ONLY` en matriz operativa             | **0**            |
| Concesiones directas base con alcance `CTX-*`        | **0**            |
| Componentes base tratados como autorización completa | **0**            |
| Roles base confundidos con roles operativos          | **0**            |
| Diferencias entre familias de doble condición        | **0**            |
| Overrides iniciales capaces de alterar la separación | **0**            |
| Incumplimientos bloqueantes                          | **0**            |
| **Veredicto**                                        | **PASS**         |

---

#### 5. Validaciones ejecutadas

| ID                 | Control                                                  | Esperado | Obtenido | Resultado |
| ------------------ | -------------------------------------------------------- | -------: | -------: | --------- |
| `RBAC-CHECKIN-001` | Registros del dataset base                               |      499 |      499 | **PASS**  |
| `RBAC-CHECKIN-002` | Roles base canónicos                                     |        7 |        7 | **PASS**  |
| `RBAC-CHECKIN-003` | Filas declaradas en carril BASE                          |      499 |      499 | **PASS**  |
| `RBAC-CHECKIN-004` | Concesiones base directas                                |      463 |      463 | **PASS**  |
| `RBAC-CHECKIN-005` | Componentes base                                         |       36 |       36 | **PASS**  |
| `RBAC-CHECKIN-006` | Permisos OPERATIONAL_ONLY en matriz base                 |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-007` | Concesiones base directas que exigen turno               |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-008` | Concesiones base directas que exigen check-in            |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-009` | Concesiones directas declaradas como carril base         |      463 |      463 | **PASS**  |
| `RBAC-CHECKIN-010` | Concesiones base directas con alcance CTX                |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-011` | Componentes base con modalidad incorrecta                |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-012` | Componentes base explícitamente insuficientes            |       36 |       36 | **PASS**  |
| `RBAC-CHECKIN-013` | Registros del dataset operativo                          |      240 |      240 | **PASS**  |
| `RBAC-CHECKIN-014` | Roles operativos canónicos                               |       12 |       12 | **PASS**  |
| `RBAC-CHECKIN-015` | Filas declaradas en carril OPERATIONAL                   |      240 |      240 | **PASS**  |
| `RBAC-CHECKIN-016` | Permisos BASE_ONLY en matriz operativa                   |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-017` | Alcances operativos declarados como CTX-*                |      240 |      240 | **PASS**  |
| `RBAC-CHECKIN-018` | Componentes operativos con modalidad incorrecta          |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-019` | Intersección entre códigos de rol base y operativo       |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-020` | Diferencia entre familias de permisos de doble condición |        0 |        0 | **PASS**  |
| `RBAC-CHECKIN-021` | Permisos de doble condición en carril base               |       12 |       12 | **PASS**  |
| `RBAC-CHECKIN-022` | Permisos de doble condición en carril operativo          |       12 |       12 | **PASS**  |
| `RBAC-CHECKIN-023` | Registros iniciales de overrides                         |        0 |        0 | **PASS**  |

Resultado:

```text
assertions = 23
passed = 23
failed = 0
result = PASS
```

---

#### 6. Cobertura por rol base

| Rol base                  | Directas | Componentes base |   Total | Exigencias positivas de turno/check-in en directas |
| ------------------------- | -------: | ---------------: | ------: | -------------------------------------------------: |
| `propietario`             |      109 |               12 |     121 |                                                  0 |
| `gerente_general`         |      107 |               12 |     119 |                                                  0 |
| `gerente`                 |       81 |               12 |      93 |                                                  0 |
| `supervisor`              |       58 |                0 |      58 |                                                  0 |
| `auxiliar_administrativa` |       47 |                0 |      47 |                                                  0 |
| `contador`                |       45 |                0 |      45 |                                                  0 |
| `marketing`               |       16 |                0 |      16 |                                                  0 |
| **Total**                 |  **463** |           **36** | **499** |                                              **0** |

La independencia aplica a los siete roles base, no únicamente a
`propietario` y `gerente_general`.

La autoridad base continúa sujeta a:

- trabajador activo;
- permiso activo;
- alcance aprobado;
- recurso válido;
- contrato de recurso;
- sensibilidad;
- reautenticación cuando corresponda;
- ausencia de denegación aplicable.

No estar sujeta a check-in no equivale a carecer de controles.

---

#### 7. Semántica de la matriz base

Las 463 filas `DIRECT_BASE`:

- están declaradas en el carril `BASE`;
- no contienen requisitos positivos de turno;
- no contienen requisitos positivos de check-in;
- no utilizan alcances `CTX-*`;
- pueden satisfacerse sin contexto operativo;
- no dependen de una sede o área seleccionada como contexto de trabajo.

Regla:

```text
DIRECT_BASE
+
ROL BASE VIGENTE
+
ALCANCE BASE COINCIDENTE
+
RECURSO VÁLIDO
+
SIN DENEGACIÓN
=
AUTORIZACIÓN BASE POSIBLE
```

No se consulta turno o check-in para crear el allow base.

---

#### 8. `BASE_ONLY`

Un permiso `BASE_ONLY`:

- solo puede resolverse por el carril base;
- no necesita turno;
- no necesita check-in;
- no puede aparecer en la matriz operativa;
- no se concede por activar un rol operativo;
- no desaparece al finalizar la jornada.

Regla:

```text
CHECK-OUT
→ NO REVOCA BASE_ONLY

AUSENCIA DE TURNO
→ NO BLOQUEA BASE_ONLY
```

Sí pueden bloquearlo:

- trabajador inactivo;
- permiso inactivo;
- alcance no coincidente;
- recurso inválido;
- denegación aplicable;
- sensibilidad no satisfecha;
- sesión o identidad inválida.

---

#### 9. `BASE_OR_OPERATIONAL`

Esta modalidad define dos caminos alternativos independientes.

##### 9.1 Camino base

```text
BASE ALLOW VÁLIDO
→ AUTORIZACIÓN POSIBLE
→ SIN TURNO
→ SIN CHECK-IN
```

##### 9.2 Camino operativo

```text
OPERATIONAL ALLOW VÁLIDO
+
CONTEXTO OPERATIVO
→ AUTORIZACIÓN POSIBLE
```

Reglas:

1. el fallo del carril operativo no invalida un allow base válido;
2. el fallo del carril base no invalida un allow operativo válido;
3. no se mezclan fragmentos incompletos de caminos alternativos;
4. el resultado debe identificar qué carril autorizó;
5. un check-in no transforma un permiso ausente en allow.

---

#### 10. `BASE_AND_OPERATIONAL`

Existen doce claves de doble condición.

Ambos datasets contienen exactamente la misma familia de doce claves:

```text
nexo.finance.internal_variances.approve
nexo.finance.internal_variances.resolve
nexo.inventory.adjustments.register
nexo.inventory.entries.override
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
pulso.delivery.deliveries.override
pulso.payments.transactions.refund
pulso.payments.transactions.reverse
pulso.sales.discounts.apply
pulso.sales.orders.cancel
pulso.sales.returns.create
```

El dataset base aporta 36 componentes.

El dataset operativo aporta 22 componentes.

Las cantidades son distintas porque cada clave se concede a combinaciones
diferentes de roles base y operativos. La familia de permisos es idéntica.

Regla:

```text
BASE_COMPONENT
→ no exige check-in para existir como componente
→ no ejecuta la acción

OPERATIONAL_COMPONENT
→ exige contexto operativo compatible
→ no ejecuta la acción por sí solo

AMBOS DEL MISMO ACTOR
+
MISMO PERMISO
+
MISMO RECURSO
+
MISMA SOLICITUD
=
AUTORIZACIÓN FINAL POSIBLE
```

No se admite:

```text
BASE DE ACTOR A
+
OPERATIVO DE ACTOR B
```

---

#### 11. Separación entre rol base y rol operativo

Los siete códigos de rol base y los doce códigos de rol operativo tienen
intersección cero.

```text
BASE ROLE CODE
≠
OPERATIONAL ROLE CODE
```

Esto evita:

- activar un rol operativo mediante el cargo administrativo;
- transformar el check-in en cambio de rol base;
- retirar administración al finalizar un turno;
- inferir una matriz base por similitud nominal;
- inferir operación por jerarquía administrativa.

Un trabajador puede poseer ambos conceptos, pero se resuelven como fuentes
independientes dentro del mismo `AccessContext`.

---

#### 12. Check-in

El check-in:

- confirma presencia operativa;
- selecciona un contexto permitido;
- vincula sede y área operativas;
- activa únicamente capacidades operativas compatibles;
- puede ser obligatorio por permiso;
- debe pertenecer al actor real;
- expira o se cierra.

El check-in no:

- crea un rol base;
- concede permisos administrativos;
- amplía cobertura administrativa;
- modifica la matriz base;
- supera denegaciones;
- convierte una sede activa en alcance global;
- permite operar con el componente base únicamente.

Regla:

```text
CHECK-IN
→ CONTEXTO

CHECK-IN
≠
AUTORIDAD ADMINISTRATIVA
```

---

#### 13. Turno publicado

El turno:

- habilita la posible activación de un rol operativo;
- define ventana temporal;
- acota sede y área;
- soporta validación laboral;
- no crea permisos por sí solo.

Regla:

```text
TURNO
+
CHECK-IN
+
ROL OPERATIVO
+
PERMISO OPERATIVO
+
RECURSO VÁLIDO
=
OPERACIÓN POSIBLE
```

No se admite:

```text
TURNO PUBLICADO
→ TODA LA MATRIZ OPERATIVA

TURNO PUBLICADO
→ MATRIZ BASE
```

---

#### 14. Cierre de turno y check-out

Cuando termina el contexto operativo:

- las concesiones operativas dejan de participar;
- los componentes operativos dejan de participar;
- la sede y área operativas dejan de estar activas;
- la sesión de dispositivo compartido deberá cerrarse o bloquearse;
- se invalidan decisiones operativas almacenadas.

No se alteran:

- rol base;
- concesiones base;
- componentes base;
- cobertura administrativa;
- excepciones individuales base vigentes;
- denegaciones base vigentes.

Regla:

```text
CHECK-OUT
→ REEVALUAR CARRIL OPERATIVO

CHECK-OUT
≠
REVOCAR CARRIL BASE
```

---

#### 15. Interfaz y navegación administrativa

Una pantalla administrativa no debe:

- pedir check-in para consultar una capacidad `BASE_ONLY`;
- ocultarse por ausencia de turno cuando existe allow base;
- redirigir a selección operativa para ejercer administración;
- reutilizar el estado de check-in como señal de autorización base;
- perder acceso al cerrar jornada;
- consultar únicamente `get_operational_context`.

Debe usar la decisión unificada:

```text
AccessContext
+
AuthorizationDecision
```

Y mostrar el carril que autorizó.

---

#### 16. Dispositivos compartidos

Un dispositivo compartido puede exigir identificación y contexto para
operación.

No puede exigir check-in como condición universal para acciones
administrativas base.

Regla:

```text
ACCIÓN BASE EN DISPOSITIVO COMPATIBLE
→ evaluar actor y permiso base
→ no inventar requisito operativo

ACCIÓN OPERATIVA
→ evaluar actor, turno, check-in, rol, sede y área
```

El paquete del dispositivo puede bloquear una capacidad, pero no cambiar su
modalidad.

---

#### 17. Excepciones y denegaciones

El seed inicial de overrides contiene cero registros.

Los overrides futuros deberán preservar la separación:

##### Concesión individual base

- no requiere check-in;
- no crea turno;
- no crea rol operativo;
- no concede `OPERATIONAL_ONLY`.

##### Concesión individual operativa

- exige turno;
- exige rol operativo compatible;
- exige check-in cuando corresponda;
- termina con el contexto.

##### Denegación

- puede bloquear carril base, operativo o ambos;
- revocarla no crea un allow;
- no convierte check-in en fuente de autoridad.

---

#### 18. Pruebas negativas obligatorias

| Caso                                                                       | Resultado esperado                   |
| -------------------------------------------------------------------------- | ------------------------------------ |
| Propietario activo sin turno solicita `BASE_ONLY` concedido                | No bloquear por ausencia de turno    |
| Gerente general sin check-in solicita capacidad base concedida             | No bloquear por ausencia de check-in |
| Auxiliar administrativa cierra jornada y consulta capacidad base concedida | Mantener evaluación base             |
| Trabajador con check-in pero sin permiso base solicita administración      | `DENY`                               |
| Trabajador con turno pero sin rol operativo solicita operación             | `DENY`                               |
| Rol base intenta permiso `OPERATIONAL_ONLY` sin contexto                   | `DENY`                               |
| Componente base sin componente operativo                                   | `DENY`                               |
| Componente operativo sin componente base                                   | `DENY`                               |
| Componentes pertenecen a actores distintos                                 | `DENY`                               |
| Check-out seguido de reutilización de decisión operativa en caché          | `DENY`                               |
| Interfaz administrativa depende solo de `active_checkin_session`           | Prueba debe fallar                   |
| RPC base exige `checkin_session_id` obligatorio                            | Contrato inválido                    |
| Matriz operativa contiene `BASE_ONLY`                                      | Publicación bloqueada                |
| Matriz base contiene `OPERATIONAL_ONLY`                                    | Publicación bloqueada                |

---

#### 19. Pruebas positivas controladas

| Caso                                                                                      | Resultado esperado                            |
| ----------------------------------------------------------------------------------------- | --------------------------------------------- |
| Rol base con `BASE_ONLY`, sin turno y sin check-in                                        | Evaluar `ALLOW`                               |
| Rol base con `BASE_OR_OPERATIONAL`, sin check-in                                          | Evaluar carril base                           |
| Rol operativo con `BASE_OR_OPERATIONAL` y contexto válido                                 | Evaluar carril operativo                      |
| Ambos carriles posibles en `BASE_OR_OPERATIONAL`                                          | Registrar carril autorizante sin exigir ambos |
| `BASE_AND_OPERATIONAL` con ambos componentes del mismo actor                              | Evaluar `ALLOW`                               |
| Check-out de actor con capacidad base                                                     | Conservar evaluación base                     |
| Denegación base aplicable con check-in activo                                             | `DENY`                                        |
| Denegación operativa aplicable con allow base alternativo válido en `BASE_OR_OPERATIONAL` | Evaluar carril base                           |

---

#### 20. Requisitos para `AccessContext`

AUTH-CTX-001 deberá separar explícitamente:

```text
base_role
assigned_sites
assigned_areas
```

de:

```text
active_shift
active_checkin_session
operational_role
operational_site
operational_area
```

No se admite un único objeto ambiguo como:

```text
current_role
current_site
current_area
```

porque permitiría confundir cobertura administrativa con contexto
operativo.

---

#### 21. Requisitos para `AuthorizationDecision`

La decisión deberá informar separadamente:

```text
base_decision
operational_decision
base_matched_allows
operational_matched_allows
base_denies
operational_denies
authorization_requirement
authorizing_lane
blocked_reasons
final_decision
```

Para `BASE_ONLY`, el evaluador no debe bloquear porque falte contexto
operativo.

Para `BASE_OR_OPERATIONAL`, debe evaluar ambos caminos de manera
independiente.

Para `BASE_AND_OPERATIONAL`, debe exigir ambos componentes del mismo actor.

---

#### 22. Invalidación y caché

Los cambios operativos deben invalidar únicamente decisiones que dependan
de ellos.

| Evento                             | Invalidar carril base |           Invalidar carril operativo |
| ---------------------------------- | --------------------: | -----------------------------------: |
| Inicio de turno                    |                    No |                                   Sí |
| Fin de turno                       |                    No |                                   Sí |
| Check-in                           |                    No |                                   Sí |
| Check-out                          |                    No |                                   Sí |
| Cambio de sede o área operativa    |                    No |                                   Sí |
| Cambio de rol operativo            |                    No |                                   Sí |
| Cambio de rol base                 |                    Sí | Puede requerir reevaluación completa |
| Cambio de cobertura administrativa |                    Sí |                       No por sí solo |
| Cambio de permiso o catálogo       |                    Sí |                                   Sí |
| Denegación actor-wide              |                    Sí |                                   Sí |

La implementación podrá invalidar más ampliamente por seguridad, pero no
debe interpretar la ausencia de contexto operativo como denegación del
carril base.

---

#### 23. Puertas para implementación física

La implementación deberá detenerse si detecta:

1. un `BASE_ONLY` condicionado a turno;
2. un `BASE_ONLY` condicionado a check-in;
3. una concesión base directa con alcance `CTX-*`;
4. un permiso `OPERATIONAL_ONLY` en matriz base;
5. un permiso `BASE_ONLY` en matriz operativa;
6. un check-in que crea permisos base;
7. cierre de turno que elimina administración;
8. combinación de componentes entre actores;
9. un único campo ambiguo para rol, sede o área;
10. una caché operativa reutilizada después de check-out;
11. una interfaz administrativa que solo consume contexto operativo;
12. un override base que exige check-in;
13. un override operativo que sobrevive al contexto;
14. diferencias entre las familias de permisos de doble condición.

Resultado:

```text
FAIL CLOSED
→ DETENER PUBLICACIÓN
→ PRODUCIR EVIDENCIA
→ NO CORREGIR SILENCIOSAMENTE
```

---

#### 24. Evidencia canónica

La evidencia se serializa mediante:

- UTF-8 sin BOM;
- saltos LF;
- primera línea = manifiesto compacto;
- líneas siguientes = aserciones compactas;
- orden por ID;
- sin timestamps;
- un único LF final;
- SHA-256 sobre todos los bytes.

```jsonl
{"validation_id":"vento.authorization.base-administration-independent-from-checkin","validation_version":"1.0.0","catalog_id":"vento.authorization","catalog_version":"1.0.0","contract_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","base_dataset_id":"vento.authorization.base-role-grants","base_dataset_hash":"sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1","operational_dataset_id":"vento.authorization.operational-role-grants","operational_dataset_hash":"sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f","override_dataset_id":"vento.authorization.individual-overrides","override_dataset_hash":"sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10","assertion_count":23,"blocking_failure_count":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-001","control":"Registros del dataset base","expected":499,"actual":499,"result":"PASS"}
{"id":"RBAC-CHECKIN-002","control":"Roles base canónicos","expected":7,"actual":7,"result":"PASS"}
{"id":"RBAC-CHECKIN-003","control":"Filas declaradas en carril BASE","expected":499,"actual":499,"result":"PASS"}
{"id":"RBAC-CHECKIN-004","control":"Concesiones base directas","expected":463,"actual":463,"result":"PASS"}
{"id":"RBAC-CHECKIN-005","control":"Componentes base","expected":36,"actual":36,"result":"PASS"}
{"id":"RBAC-CHECKIN-006","control":"Permisos OPERATIONAL_ONLY en matriz base","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-007","control":"Concesiones base directas que exigen turno","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-008","control":"Concesiones base directas que exigen check-in","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-009","control":"Concesiones directas declaradas como carril base","expected":463,"actual":463,"result":"PASS"}
{"id":"RBAC-CHECKIN-010","control":"Concesiones base directas con alcance CTX","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-011","control":"Componentes base con modalidad incorrecta","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-012","control":"Componentes base explícitamente insuficientes","expected":36,"actual":36,"result":"PASS"}
{"id":"RBAC-CHECKIN-013","control":"Registros del dataset operativo","expected":240,"actual":240,"result":"PASS"}
{"id":"RBAC-CHECKIN-014","control":"Roles operativos canónicos","expected":12,"actual":12,"result":"PASS"}
{"id":"RBAC-CHECKIN-015","control":"Filas declaradas en carril OPERATIONAL","expected":240,"actual":240,"result":"PASS"}
{"id":"RBAC-CHECKIN-016","control":"Permisos BASE_ONLY en matriz operativa","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-017","control":"Alcances operativos declarados como CTX-*","expected":240,"actual":240,"result":"PASS"}
{"id":"RBAC-CHECKIN-018","control":"Componentes operativos con modalidad incorrecta","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-019","control":"Intersección entre códigos de rol base y operativo","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-020","control":"Diferencia entre familias de permisos de doble condición","expected":0,"actual":0,"result":"PASS"}
{"id":"RBAC-CHECKIN-021","control":"Permisos de doble condición en carril base","expected":12,"actual":12,"result":"PASS"}
{"id":"RBAC-CHECKIN-022","control":"Permisos de doble condición en carril operativo","expected":12,"actual":12,"result":"PASS"}
{"id":"RBAC-CHECKIN-023","control":"Registros iniciales de overrides","expected":0,"actual":0,"result":"PASS"}
```

Resultado:

```text
evidence_hash = sha256:84573a502cddc91e8b3acf4603399a5d2812724770084e0381121aee7fe18250
```

---

#### 25. Veredicto

```text
RESULTADO = PASS
INCUMPLIMIENTOS BLOQUEANTES = 0
OBSERVACIONES DE IMPLEMENTACIÓN = 4
```

Observaciones:

1. `AccessContext` debe separar cobertura administrativa de contexto
   operativo;
2. `AuthorizationDecision` debe exponer decisiones por carril;
3. la caché debe invalidarse por dependencias y nunca convertir falta de
   check-in en deny base;
4. las interfaces administrativas no pueden depender exclusivamente del
   contexto operativo.

Las observaciones no modifican los datasets ni reabren el catálogo.

---

#### 26. Cierre del BLOQUE D

La aprobación de AUTH-RBAC-028 produce:

```text
BLOQUE D
→ MATRICES APROBADAS
→ DATASETS APROBADOS
→ VALIDACIÓN DE GLOBALIDAD = PASS
→ VALIDACIÓN DE INDEPENDENCIA DEL CHECK-IN = PASS
→ CERRADO DOCUMENTALMENTE
```

Queda habilitado:

```text
BLOQUE E — Contexto y decisión de autorización unificados
AUTH-CTX-001 — Diseñar AccessContext canónico
```

La aplicación física continúa reservada para BLOQUE R, después de aprobar
arquitectura E3, estructuras, backfills, integridad, pruebas y rollback.

---

#### 27. Criterios de aprobación

AUTH-RBAC-028 podrá aprobarse cuando se acepte que:

1. las 23 aserciones pasan;
2. las 463 concesiones base directas no exigen turno;
3. las 463 concesiones base directas no exigen check-in;
4. no existen permisos `OPERATIONAL_ONLY` en matriz base;
5. no existen permisos `BASE_ONLY` en matriz operativa;
6. los 36 componentes base son insuficientes por sí solos;
7. los 22 componentes operativos son insuficientes por sí solos;
8. las doce claves de doble condición coinciden entre carriles;
9. los códigos de rol base y operativo no se confunden;
10. check-in no crea autoridad administrativa;
11. check-out no elimina autoridad base;
12. turno no crea autoridad administrativa;
13. `BASE_OR_OPERATIONAL` conserva caminos alternativos;
14. `BASE_AND_OPERATIONAL` exige ambos carriles;
15. los componentes deben pertenecer al mismo actor;
16. las concesiones individuales futuras preservarán la separación;
17. los dispositivos no cambian la modalidad;
18. `AccessContext` separará ambos planos;
19. `AuthorizationDecision` expondrá ambos carriles;
20. el hash de evidencia es
    `sha256:84573a502cddc91e8b3acf4603399a5d2812724770084e0381121aee7fe18250`;
21. el BLOQUE D queda cerrado documentalmente;
22. AUTH-CTX-001 queda habilitada después de aprobación expresa;
23. no se implementa ningún cambio físico.

---

#### 28. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-027 | APROBADA    |
| AUTH-RBAC-028 | APROBADA    |
| AUTH-CTX-001  | NO INICIADA |

No se avanza a AUTH-CTX-001 hasta recibir aprobación explícita de
AUTH-RBAC-028.


Regla de implementación de matrices

AUTH-RBAC-024 a AUTH-RBAC-026
→ definen y aprueban datasets canónicos
→ no insertan, actualizan ni eliminan datos en Supabase

La aplicación física de estos datasets deberá ejecutarse únicamente
dentro del BLOQUE R, después de:

- aprobar la arquitectura objetivo del BLOQUE E3;
- crear las estructuras canónicas necesarias;
- completar los backfills correspondientes;
- validar integridad referencial;
- disponer de pruebas y rollback;
- crear la migración versionada en `vento-shell`.

Regla de cierre

propietario
gerente_general

→ no requieren turno ni check-in para acciones BASE_ONLY
→ reciben permisos administrativos globales explícitos
→ no reciben bypass por nombre de rol
→ las capacidades OPERATIONAL_ONLY continúan exigiendo contexto operativo
