### MINI-BLOQUE — GOBIERNO DE ACCESO Y SEGURIDAD

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **gobierno de acceso y seguridad** dentro de **G VISO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `VISO-AUTH-001` a `VISO-AUTH-020` — 20 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear catálogo administrativo de roles base” y concluye con “Crear exporte de matriz de acceso”.
<!-- PLAN-SECTION-META:END -->

### ✅ VISO-AUTH-001 — Crear catálogo administrativo de roles base

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad
**Tarea siguiente:** VISO-AUTH-002 — Crear catálogo administrativo de roles operativos
**Tipo de tarea:** documental; definición del catálogo administrativo canónico de roles base que VISO deberá presentar y consumir sin crear una segunda fuente de verdad ni conceder autoridad por el nombre del rol
**Bloque:** `G_VISO — GOBIERNO DE ACCESO Y SEGURIDAD`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/01_GOBIERNO_DE_ACCESO_Y_SEGURIDAD.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante el cierre documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT` y al gate `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el catálogo administrativo de roles base que VISO deberá utilizar para representar responsabilidades laborales permanentes sin mezclar identidad, rol operativo, sede, área, turno, permisos ni autoridad efectiva.

El catálogo administrativo no crea un universo nuevo. Su función es proyectar de forma comprensible y administrable el catálogo canónico versionado ya aprobado para autorización, manteniendo una correspondencia exacta con la fuente compartida y evitando que VISO, una pantalla o un repositorio consumidor introduzcan roles locales, aliases o interpretaciones incompatibles.

La regla raíz queda:

```text
CATÁLOGO BASE VERSIONADO
+
OCHO CÓDIGOS CANÓNICOS
+
SEMÁNTICA FUNCIONAL APROBADA
+
SEPARACIÓN ENTRE ROL Y PERMISO
+
SEPARACIÓN ENTRE BASE Y OPERACIÓN
→
CATÁLOGO ADMINISTRATIVO VISO
```

Y nunca:

```text
NOMBRE DEL ROL
→
AUTORIZACIÓN
```

---

#### 2. Base normativa y fuentes de autoridad

Esta tarea consume y conserva las decisiones aprobadas de identidad, autorización, contexto y matrices sin redefinirlas.

Fuentes vinculantes:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — identidad laboral y actor efectivo;
- `AUTH-MOD-002` — separación entre rol base y rol operativo;
- `AUTH-MOD-003` — roles administrativos globales;
- `AUTH-MOD-004` — roles administrativos por sede;
- `AUTH-MOD-005` — catálogo operativo separado;
- `AUTH-MOD-006` — casos híbridos sin crear roles híbridos;
- `AUTH-MOD-021` — rol base mínimo no privilegiado `trabajador_operativo`;
- `PROC-ACTOR-001` — aplicabilidad de los ocho roles base sobre los procesos canónicos;
- `SHELL-CON-004` — contrato compartido versionado de roles base y grants base;
- el catálogo versionado `packages/contracts/authorization/catalog/base-roles/versions/1.1.0/base-roles.json`.

La autoridad para la identidad de un rol base es el código canónico versionado. VISO no será una fuente paralela capaz de crear una identidad de rol que el contrato compartido no reconozca.

La relación conceptual continúa siendo:

```text
empleado activo
→ exactamente un rol base vigente
→ permisos base explícitos
→ cobertura administrativa aplicable
→ evaluación de autorización
```

El rol base no es una identidad separada del empleado y no constituye por sí solo una decisión de autorización.

---

#### 3. Resultado canónico

VISO deberá exponer un catálogo administrativo con exactamente las ocho identidades vigentes de `BaseRoleCode@1.1.0`:

1. `propietario`;
2. `gerente_general`;
3. `gerente`;
4. `supervisor`;
5. `auxiliar_administrativa`;
6. `contador`;
7. `marketing`;
8. `trabajador_operativo`.

La cardinalidad contractual es:

```text
roles base canónicos = 8
duplicados = 0
roles operativos dentro del catálogo base = 0
oficios legacy dentro del catálogo base = 0
aliases locales = 0
fallbacks por nombre = 0
```

La proyección administrativa deberá conservar el mismo conjunto de códigos que la fuente compartida. Una lista local divergente, una copia manual no versionada o un valor admitido únicamente por una interfaz no serán equivalentes al catálogo canónico.

---

#### 4. Catálogo administrativo materializado documentalmente

| Rol base | Naturaleza funcional permanente | Procesos canónicos vinculados | Interpretación administrativa obligatoria |
| --- | --- | ---: | --- |
| `propietario` | Gobierno organizacional global | 69 | Puede ser elegible para capacidades reservadas y de gobierno solo mediante permisos explícitos; nunca equivale a wildcard ni a bypass universal. |
| `gerente_general` | Dirección ejecutiva global | 69 | Puede recibir capacidades globales explícitas, pero no hereda automáticamente capacidades reservadas del propietario. |
| `gerente` | Administración integral de sedes asignadas | 68 | Su autoridad administrativa natural permanece limitada por sedes asignadas, recurso, finalidad y permiso exacto; no es administrador global por nombre. |
| `supervisor` | Supervisión administrativa local | 60 | Su participación se limita a supervisión y administración local autorizada sobre sedes asignadas; no adquiere gobierno organizacional. |
| `auxiliar_administrativa` | Apoyo administrativo funcional | 54 | Puede recibir capacidades permanentes de captura, coordinación o consulta limitada; no implica aprobación, gobierno ni acceso global. |
| `contador` | Función financiera permanente | 32 | Su aplicabilidad se limita a hechos, conciliación, análisis y documentación financiera autorizados; el nombre del rol no concede aprobación ni alcance territorial general. |
| `marketing` | Marketing, contenido y análisis comercial limitado | 22 | Su aplicabilidad se limita a contenido, campañas, canales, oportunidades y análisis autorizados; no concede control sobre operaciones, pagos, inventario o identidad completa. |
| `trabajador_operativo` | Rol base mínimo no privilegiado | 13 | Conserva autoservicio personal esencial y cero autoridad operativa derivada del rol base; la operación exige contexto operativo independiente. |

La distribución suma **387 vínculos proceso–rol aplicables** sobre **552 pares posibles** entre 69 procesos y 8 roles base.

La aplicabilidad de un rol a un proceso significa únicamente que puede existir una capacidad permanente explícita relacionada con ese proceso. No significa que el rol posea el permiso, que pueda aprobar la acción o que quede autorizado en cualquier contexto.

---

#### 5. Semántica de cobertura administrativa heredada

El catálogo deberá preservar, como contexto explicativo y no como concesión, la clasificación administrativa vigente que ya existe para los roles cuya cobertura predeterminada está definida:

| Rol base | Cobertura administrativa predeterminada | Regla |
| --- | --- | --- |
| `propietario` | `ORGANIZATION` | La cobertura organizacional delimita territorio administrativo posible; no concede todos los permisos. |
| `gerente_general` | `ORGANIZATION` | La cobertura organizacional no incorpora capacidades reservadas del propietario. |
| `gerente` | `ASSIGNED_SITES` | Solo participan sedes asignadas y utilizables; varias sedes no equivalen a organización completa. |
| `supervisor` | `ASSIGNED_SITES` | Solo participan sedes asignadas y utilizables dentro del permiso exacto. |
| `auxiliar_administrativa` | `ASSIGNED_SITES` | La cobertura territorial no convierte el rol en aprobador ni administrador global. |
| `contador` | `NONE` | Los permisos explícitos no territoriales o globales permitidos se resuelven por grant, no por el nombre del rol. |
| `marketing` | `NONE` | Los permisos explícitos no territoriales o globales permitidos se resuelven por grant, no por el nombre del rol. |

Para `trabajador_operativo`, esta tarea no inventa una cobertura administrativa general por nombre de rol. Se conserva la decisión de `AUTH-MOD-021`: es un rol base mínimo no privilegiado, con su matriz base exacta gobernada por el contrato compartido y administrada posteriormente por `VISO-AUTH-003`; no se proyecta como rol operativo ni adquiere territorio operativo por pertenecer al catálogo.

La cobertura administrativa es un insumo de contexto. Nunca es un `ALLOW`.

---

#### 6. Información mínima de cada entrada del catálogo

Cada entrada administrativa deberá permitir distinguir, como mínimo:

- código canónico estable del rol;
- naturaleza funcional permanente;
- pertenencia a la versión canónica vigente;
- cantidad de procesos canónicos en los que el rol resulta aplicable;
- clasificación de cobertura administrativa cuando esté definida por el contrato vigente;
- frontera explícita de lo que el rol no autoriza por sí mismo;
- separación respecto de roles operativos;
- referencia a que la matriz de permisos se administra fuera de esta tarea.

La representación visible puede utilizar texto humano explicativo, pero el código canónico no podrá derivarse de una etiqueta traducida, nombre informal, cargo observado o texto editable.

La identidad administrativa deberá seguir:

```text
role_code canónico
→ identidad estable

descripción visible
→ explicación

nombre informal
→ no identidad
```

---

#### 7. Gobierno de identidad y versionado

El catálogo administrativo de VISO no podrá ampliar silenciosamente el universo canónico.

Reglas obligatorias:

1. `role_code` es la identidad estable de la entrada;
2. VISO no podrá reconocer como válido un código ausente del contrato compartido vigente;
3. una etiqueta visible no podrá sustituir el código;
4. una renombrada visual no podrá cambiar la identidad contractual;
5. un nuevo código de rol base requerirá primero una versión canónica aprobada del contrato compartido;
6. un retiro o sustitución deberá respetar el gobierno de compatibilidad y transición aplicable;
7. VISO no podrá mantener un rol retirado como identidad autorizable mediante fallback local;
8. una versión desconocida o incompatible deberá impedir que la proyección administrativa se presente como canónicamente vigente;
9. el orden visual no establecerá jerarquía ni precedencia de autorización;
10. ningún rol podrá adquirir permisos por el solo hecho de aparecer en el catálogo.

La versión vigente consumida por esta tarea es `1.1.0`.

---

#### 8. Exclusiones obligatorias

No forman parte del catálogo administrativo de roles base:

- roles operativos como `cajero_satelite`, `barista_satelite`, `cocinero_satelite`, `servicio_salon`, `mostrador_satelite`, `operador_integral_satelite`, `produccion_cocina`, `produccion_panaderia`, `produccion_reposteria`, `bodeguero`, `conductor_logistica` y `gerencia_operativa`;
- oficios legacy como `cajero`, `cocinero`, `mesero`, `barista`, `panadero`, `pastelero`, `repostero` o `conductor`;
- códigos documentales obsoletos tratados anteriormente como base, incluidos `logistica` y `talento_humano`;
- `propietario_admin`;
- usuarios técnicos de dispositivo;
- `service_role`;
- aplicaciones;
- sedes;
- áreas;
- tipos de sede o de área;
- perfiles operativos;
- turnos;
- permisos;
- grupos de navegación.

Una coincidencia de nombre no convierte ninguna de esas identidades en rol base.

---

#### 9. Separación de responsabilidades dentro de VISO

`VISO-AUTH-001` fija únicamente el catálogo administrativo de identidades base y su semántica mínima de presentación.

| Tarea | Responsabilidad reservada |
| --- | --- |
| `VISO-AUTH-002` | Catálogo administrativo de roles operativos. |
| `VISO-AUTH-003` | Permisos y matriz por rol base. |
| `VISO-AUTH-004` | Permisos y matriz por rol operativo. |
| `VISO-AUTH-005` | Roles permitidos por sede. |
| `VISO-AUTH-006` | Roles permitidos por área. |
| `VISO-AUTH-007` | Perfiles operativos por trabajador. |
| `VISO-AUTH-008` | Sedes asignadas al trabajador. |
| `VISO-AUTH-009` | Áreas asignadas al trabajador. |
| `VISO-AUTH-010` | Rol operativo efectivo del turno. |
| `VISO-AUTH-011` | Validación de turnos sin rol operativo. |
| `VISO-AUTH-012` | Validación de incompatibilidad de área. |
| `VISO-AUTH-013` | Vista previa trabajador × sede × área × turno. |
| `VISO-AUTH-014` | Simulación de permisos efectivos. |
| `VISO-AUTH-015` | Origen de cada permiso. |
| `VISO-AUTH-016` | Conflictos de configuración. |
| `VISO-AUTH-017` | Excepciones individuales. |
| `VISO-AUTH-018` | Auditoría de cambios de seguridad. |
| `VISO-AUTH-019` | Restricción de quién administra seguridad. |
| `VISO-AUTH-020` | Exporte de matriz de acceso. |

Por tanto, esta tarea no administra grants, asignaciones, perfiles, turnos, excepciones ni decisiones efectivas de autorización.

---

#### 10. Reglas de consistencia y fallo cerrado

La proyección administrativa deberá considerarse inconsistente cuando ocurra cualquiera de estos casos:

| Caso | Resultado documental exigido |
| --- | --- |
| Falta uno de los ocho códigos vigentes | catálogo no conforme; no declarar paridad canónica |
| Aparece un noveno código no aprobado | catálogo no conforme; no incorporarlo por compatibilidad local |
| Existe un código duplicado | catálogo no conforme |
| Un rol operativo aparece como rol base | catálogo no conforme |
| Un oficio legacy aparece como rol base | catálogo no conforme |
| La descripción visible contradice la naturaleza aprobada | catálogo no conforme |
| La cobertura visible amplía la cobertura canónica | catálogo no conforme |
| La interfaz interpreta la posición del rol como jerarquía | interpretación inválida |
| El catálogo asigna permisos implícitos | responsabilidad invadida; corresponde a la matriz explícita |
| La fuente canónica no puede resolverse | no presentar una lista local como sustituto autoritativo |

No existirá fallback hacia una lista embebida, hacia `employees.role` sin reconciliación contractual o hacia un conjunto observado en una sola aplicación para declarar que el catálogo está vigente.

---

#### 11. Handoff contractual

El resultado de esta tarea entrega a `VISO-AUTH-002` y `VISO-AUTH-003` un universo base cerrado y no ambiguo:

```text
8 roles base canónicos
+
códigos estables
+
naturaleza funcional
+
aplicabilidad de procesos
+
cobertura administrativa conocida
+
fronteras de autoridad
```

`VISO-AUTH-002` deberá construir el catálogo operativo como universo separado.

`VISO-AUTH-003` deberá consumir exactamente estas ocho identidades para administrar la matriz base, preservando el contrato de grants vigente y sin transformar la pertenencia al catálogo en una concesión.

Las tareas posteriores podrán mostrar asignaciones, simulaciones, conflictos y auditoría, pero ninguna podrá redefinir silenciosamente qué códigos pertenecen al catálogo base.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea materializa en VISO decisiones de catálogo, separación de carriles, identidad de rol y límites de autoridad que ya están protegidas por el registro vigente. No introduce una nueva identidad de rol, modalidad de autorización, regla territorial, concesión, transición física ni comportamiento operativo que requiera ampliar el registro.

---

#### 13. Cobertura de prueba vigente reutilizada

La tarea reutiliza, sin modificar, la cobertura vigente:

- `TREQ-SHELL-040` protege el conjunto exacto de ocho `BaseRoleCode`, la incorporación de `trabajador_operativo`, la exclusión de aliases y oficios legacy y la integridad del contrato compartido;
- `TREQ-AUTH-001` protege que una lista local o nombre de rol no conceda autorización final;
- `TREQ-AUTH-008` protege la separación entre capacidades base permanentes y capacidades operativas dependientes de turno, check-in y contexto;
- `TREQ-VISO-001` protege la coherencia posterior entre administración de seguridad, efecto visible, conflictos, alcance, origen y resultado consumido por las aplicaciones.

Esta trazabilidad no cambia estado, contenido, paquete, evidencia ni secuencia de esos requisitos.

---

#### 14. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | Esta definición documental no ejecutó build del repositorio; la batería del checkout propietario permanece separada de la decisión canónica. |
| LOCAL | NOT_EXECUTED | No se registró una ejecución local del artefacto dentro de esta definición documental. |
| REMOTA | PASS | La rama canónica vigente de `vento-shell` fue contrastada en solo lectura: continuidad actual, archivo propietario, topología, políticas documentales, catálogo `BaseRoleCode@1.1.0`, contrato generador, modelo AUTH y matriz `PROC-ACTOR-001` resultaron coherentes con las decisiones materializadas aquí. |
| OPERATIVA | NOT_APPLICABLE | La tarea no cambia procesos operativos, turnos, permisos efectivos ni acciones de trabajadores y no requiere observación operacional para cerrar su definición documental. |
| FÍSICA | NOT_EXECUTED | No se materializaron UI, Server Actions, contratos distribuidos, migraciones, datos ni cambios Supabase; la ejecución física permanece detrás de `POST_E5_PACKAGE`. |

---

#### 15. Criterios de aceptación

- [ ] El catálogo contiene exactamente los ocho códigos de rol base vigentes.
- [ ] `trabajador_operativo` aparece como rol base mínimo no privilegiado.
- [ ] `logistica`, `talento_humano`, oficios legacy, roles operativos y `propietario_admin` no aparecen como roles base canónicos.
- [ ] Cada rol conserva la naturaleza funcional aprobada y su cantidad vigente de procesos aplicables.
- [ ] La suma de vínculos aplicables permanece en 387 sobre 552 pares posibles.
- [ ] La cobertura administrativa conocida se presenta como contexto y nunca como permiso.
- [ ] `propietario` y `gerente_general` no se convierten en wildcard.
- [ ] `gerente`, `supervisor` y `auxiliar_administrativa` no amplían `ASSIGNED_SITES` a cobertura organizacional.
- [ ] `contador` y `marketing` no reciben cobertura territorial general por el nombre del rol.
- [ ] `trabajador_operativo` no adquiere autoridad operativa por pertenecer al catálogo base.
- [ ] Ninguna entrada del catálogo concede permisos implícitos.
- [ ] El código canónico, y no una etiqueta visible, identifica la entrada.
- [ ] VISO no crea una segunda lista autoritativa independiente del contrato compartido versionado.
- [ ] La tarea no invade las responsabilidades reservadas a `VISO-AUTH-002` a `VISO-AUTH-020`.
- [ ] Los cambios físicos permanecen fuera del cierre documental y detrás de la topología y gate vigentes.
- [ ] Se conservan cero cambios al Registro Canónico de Requisitos de Prueba.

---

#### 16. Límites

Esta tarea no:

- crea ni modifica código de VISO;
- crea rutas, pantallas, componentes o Server Actions;
- declara un archivo físico de VISO como implementation unit;
- modifica el paquete compartido de contratos;
- modifica `base-roles.json`;
- modifica datasets de grants;
- modifica `public.roles`, `employees.role` ni otra relación Supabase;
- crea migraciones;
- crea RLS, RPC, triggers o grants;
- asigna roles a empleados;
- crea o administra roles operativos;
- administra permisos por rol base;
- administra permisos por rol operativo;
- define disponibilidad de roles por sede o área;
- administra perfiles, turnos o asignaciones territoriales;
- crea excepciones individuales;
- ejecuta simulaciones;
- modifica precedencia, denegaciones o autorización efectiva;
- crea aliases para compatibilidad legacy;
- retira físicamente roles legacy;
- selecciona package ni autoriza implementación.

La existencia AS-IS de superficies administrativas no las convierte automáticamente en el destino físico de esta tarea. La identidad de la unidad de implementación y los archivos exactos se resolverán únicamente dentro del package y gate físico correspondiente.

---

#### 17. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad`

**TAREA ACTUAL APROBADA**
`VISO-AUTH-001 — Crear catálogo administrativo de roles base`

**SIGUIENTE TAREA RESERVADA**
`VISO-AUTH-002 — Crear catálogo administrativo de roles operativos`


### ✅ VISO-AUTH-002 — Crear catálogo administrativo de roles operativos

**Estado:** APROBADA
**Tarea anterior:** VISO-AUTH-001 — Crear catálogo administrativo de roles base
**Tarea siguiente:** VISO-AUTH-003 — Administrar permisos por rol base
**Tipo de tarea:** documental; definición del catálogo administrativo canónico de roles operativos que VISO deberá presentar y consumir como universo temporal separado de roles base, permisos, sedes, áreas, perfiles y turnos efectivos
**Bloque:** `G_VISO — GOBIERNO DE ACCESO Y SEGURIDAD`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/01_GOBIERNO_DE_ACCESO_Y_SEGURIDAD.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante el cierre documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT` y al gate `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el catálogo administrativo de roles operativos que VISO deberá utilizar para representar las funciones temporales que un empleado puede ejecutar durante un turno, sin convertir el catálogo en fuente de identidad laboral, permiso, asignación territorial o rol efectivo.

El catálogo administrativo no crea un universo nuevo. Su función es proyectar de forma comprensible y administrable el catálogo operativo canónico versionado, conservando una correspondencia exacta con la fuente compartida y evitando que VISO, una sede, una aplicación, una pantalla o un perfil creen códigos operativos locales.

La regla raíz queda:

```text
CATÁLOGO OPERATIVO VERSIONADO
+
DOCE CÓDIGOS CANÓNICOS
+
SEMÁNTICA FUNCIONAL APROBADA
+
SEPARACIÓN ENTRE CATÁLOGO Y TURNO EFECTIVO
+
SEPARACIÓN ENTRE ROL Y PERMISO
→
CATÁLOGO ADMINISTRATIVO VISO
```

Y nunca:

```text
APARECER EN EL CATÁLOGO
→
ROL OPERATIVO EFECTIVO
```

ni:

```text
NOMBRE DEL ROL
→
AUTORIZACIÓN
```

---

#### 2. Base normativa y fuentes de autoridad

Esta tarea consume y conserva las decisiones aprobadas de identidad, autorización, contexto, matrices y procesos sin redefinirlas.

Fuentes vinculantes:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — identidad laboral y actor efectivo;
- `AUTH-MOD-002` — separación entre rol base y rol operativo;
- `AUTH-MOD-005` — catálogo operativo canónico;
- `AUTH-MOD-006` — casos híbridos sin crear roles híbridos;
- `AUTH-MOD-009` y `AUTH-MOD-010` — turno, check-in y rol operativo efectivo;
- `PROC-ACTOR-002` — aplicabilidad de los doce roles operativos sobre los procesos canónicos;
- `SHELL-CON-005` — contrato compartido versionado de roles operativos y grants operativos;
- el catálogo versionado `packages/contracts/authorization/catalog/operational-roles/versions/1.0.0/operational-roles.json`.

La autoridad para la identidad de un rol operativo es el código canónico versionado. VISO no será una fuente paralela capaz de crear una identidad operativa que el contrato compartido no reconozca.

La relación conceptual continúa siendo:

```text
empleado activo
→ turno publicado y válido
→ rol operativo asignado
→ rol activo
→ sede habilitada
→ área compatible
→ check-in cuando la política lo exige
→ rol operativo efectivo
→ permisos operativos explícitos
→ evaluación de autorización
```

El catálogo contiene identidades posibles. No demuestra que una de ellas sea efectiva para un actor en este instante.

---

#### 3. Resultado canónico

VISO deberá exponer un catálogo administrativo con exactamente las doce identidades vigentes de `OperationalRoleCode@1.0.0`:

1. `cajero_satelite`;
2. `barista_satelite`;
3. `cocinero_satelite`;
4. `servicio_salon`;
5. `mostrador_satelite`;
6. `operador_integral_satelite`;
7. `produccion_cocina`;
8. `produccion_panaderia`;
9. `produccion_reposteria`;
10. `bodeguero`;
11. `conductor_logistica`;
12. `gerencia_operativa`.

La cardinalidad contractual es:

```text
roles operativos canónicos = 12
familias funcionales = 4
duplicados = 0
roles base dentro del catálogo operativo = 0
oficios legacy dentro del catálogo operativo = 0
propietario_admin = 0
aliases locales = 0
fallbacks entre catálogos = 0
```

La proyección administrativa deberá conservar el mismo conjunto y orden contractual de códigos que la fuente compartida. Una lista local divergente, una copia manual no versionada o un valor aceptado únicamente por una interfaz no serán equivalentes al catálogo canónico.

---

#### 4. Catálogo administrativo materializado documentalmente

| Rol operativo | Familia | Función principal | Área normalmente requerida | Procesos aplicables |
| --- | --- | --- | --- | ---: |
| `cajero_satelite` | Operación satélite | Caja, cobro y operación POS en sede y área habilitadas. | Sí | 39 |
| `barista_satelite` | Operación satélite | Preparación y control de bebidas y barra. | Sí | 38 |
| `cocinero_satelite` | Operación satélite | Preparación y producción de cocina en punto de venta. | Sí | 38 |
| `servicio_salon` | Operación satélite | Atención, servicio, entrega y seguimiento de salón y mesa. | Sí | 33 |
| `mostrador_satelite` | Operación satélite | Atención, alistamiento, entrega y operación de mostrador. | Sí | 40 |
| `operador_integral_satelite` | Operación satélite | Ejecución integrada únicamente en sedes que habiliten esa variante. | Depende de la sede | 45 |
| `produccion_cocina` | Producción | Cocina caliente central dentro del área asignada. | Sí | 33 |
| `produccion_panaderia` | Producción | Panadería y galletería dentro del área asignada. | Sí | 33 |
| `produccion_reposteria` | Producción | Repostería y pastelería dentro del área asignada. | Sí | 33 |
| `bodeguero` | Logística | Bodega, inventario, custodia y preparación logística. | Sí | 36 |
| `conductor_logistica` | Logística | Transporte y custodia durante rutas y entregas asignadas. | Puede usar área general | 25 |
| `gerencia_operativa` | Coordinación | Coordinación directa de la operación durante el turno. | Depende de la sede | 51 |

La distribución suma **444 vínculos proceso–rol aplicables**.

La familia funcional organiza la presentación del catálogo, pero no crea herencia de permisos entre roles de la misma familia.

---

#### 5. Aplicabilidad sobre procesos canónicos

`PROC-ACTOR-002` evalúa los doce roles operativos contra los 69 procesos canónicos.

Resultado vigente:

```text
procesos evaluados = 69
roles operativos = 12
pares proceso-rol posibles = 828
vínculos aplicables = 444
procesos con al menos un rol operativo aplicable = 51
procesos sin rol operativo directo = 18
roles desconocidos, legacy o base usados como operativos = 0
```

La aplicabilidad de un rol a un proceso significa únicamente que ese rol puede participar operativamente en alguna variante o tramo del proceso bajo contexto válido.

No significa:

- que posea todos los permisos del proceso;
- que pueda ejecutar cualquier transición;
- que pueda aprobar o cerrar el proceso;
- que pueda actuar en cualquier sede o área;
- que pueda acceder a cualquier recurso del proceso;
- que el proceso deba ejecutarse durante un turno;
- que un rol base pueda sustituirse por el rol operativo;
- que un proceso marcado `NO_APLICA` pueda habilitarse por tener turno.

Por tanto:

```text
ROL OPERATIVO APLICABLE
≠
PERMISO CONCEDIDO
≠
ROL EFECTIVO
≠
AUTORIZACIÓN FINAL
```

Los 18 procesos sin rol operativo directo permanecen deliberadamente fuera de la autoridad derivada del turno.

---

#### 6. Rol catalogado, asignado y efectivo

VISO deberá mantener separados tres estados conceptuales:

| Concepto | Significado | Concede autoridad por sí mismo |
| --- | --- | ---: |
| Rol catalogado | Código operativo existente dentro del universo canónico. | No |
| Rol asignado | Rol programado en un turno concreto. | No |
| Rol operativo efectivo | Rol asignado cuyo turno, sede, área, actividad y precondiciones operativas son válidos en el contexto evaluado. | No; habilita únicamente el carril operativo para evaluar permisos explícitos |

La resolución efectiva conserva:

```text
rol asignado
+
turno válido
+
sede válida
+
área válida
+
política de check-in aplicable
=
rol operativo efectivo posible
```

Incluso con rol operativo efectivo:

```text
ROL EFECTIVO
+
PERMISO OPERATIVO EXPLÍCITO
+
ALCANCE COMPATIBLE
+
RECURSO COMPATIBLE
+
SIN DENEGACIÓN PREVALENTE
=
AUTORIZACIÓN OPERATIVA POSIBLE
```

Un perfil operativo predeterminado solo puede proponer un valor al planificar un turno. No constituye evidencia de rol efectivo.

Un dispositivo compartido no asigna roles operativos y su `navigation_role` no puede sustituir el contexto real del actor.

---

#### 7. Reglas funcionales obligatorias por familia

##### 7.1 Operación satélite

Los seis roles de operación satélite representan funciones concretas del punto de venta.

`cajero_satelite` no concede configuración general de PULSO ni administración comercial.

`barista_satelite` y `cocinero_satelite` conservan especialidades distintas aunque una sede pueda compartir físicamente un área.

`servicio_salon` no se convierte en caja por participar en cobro, entrega o cierre de una mesa.

`mostrador_satelite` no equivale automáticamente a `cajero_satelite`.

`operador_integral_satelite` representa una variante operativa aprobada para formatos pequeños o integrados. No es la unión automática de los demás cinco roles y no funciona como superusuario.

##### 7.2 Producción

`produccion_cocina`, `produccion_panaderia` y `produccion_reposteria` son identidades operativas distintas.

Compartir procesos productivos no permite intercambiar las tres identidades ni ampliar automáticamente un área de producción hacia otra.

La participación productiva no concede ajuste global de inventario, administración de catálogos o liberación de decisiones reservadas si el permiso exacto no lo permite.

##### 7.3 Logística

`bodeguero` permanece como rol operativo. No forma parte del catálogo base.

Su ámbito natural es bodega, inventario, custodia y preparación logística, sin adquirir producción por la sola manipulación de materiales.

`conductor_logistica` representa transporte y custodia en tránsito. No adquiere facultades productivas, de inventario global, recepción general ni cierre administrativo por el nombre del rol.

##### 7.4 Coordinación

`gerencia_operativa` representa coordinación directa durante un turno.

No es:

- rol base;
- administrador global;
- sustituto de `gerente` o `gerente_general`;
- bypass;
- wildcard;
- permiso para actuar fuera de la sede, área, recurso o proceso autorizado.

Un actor puede combinar un rol base administrativo con `gerencia_operativa`, pero ambos carriles permanecen independientes.

---

#### 8. Integridad con el contrato de grants operativos

El catálogo administrativo de VISO deberá permanecer compatible con el contrato operativo compartido vigente sin administrar todavía su matriz.

La versión `vento.authorization.operational-role-grants@1.0.0` conserva:

```text
registros = 240
pares rol-permiso únicos = 240
DIRECT_OPERATIONAL = 218
OPERATIONAL_COMPONENT = 22
BASE_OR_OPERATIONAL = 174
OPERATIONAL_ONLY = 44
BASE_AND_OPERATIONAL = 22
BASE_ONLY = 0
```

La huella contractual vigente es:

```text
sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

Estos valores funcionan como frontera de integridad entre el catálogo y la futura administración de permisos operativos.

`VISO-AUTH-002` no modifica, agrega, elimina ni reinterpreta ninguno de esos grants.

La administración de la matriz operativa pertenece a `VISO-AUTH-004`.

---

#### 9. Gobierno de identidad y versionado

Reglas obligatorias:

1. `operational_role_code` es la identidad estable de la entrada;
2. la versión vigente consumida por esta tarea es `1.0.0`;
3. VISO no podrá reconocer como canónico un código ausente del contrato compartido vigente;
4. una etiqueta visible no podrá sustituir el código;
5. una renombrada visual no podrá cambiar la identidad contractual;
6. un nuevo código exigirá primero una versión canónica aprobada del catálogo compartido;
7. un retiro o sustitución deberá respetar el gobierno de compatibilidad y transición aplicable;
8. un código operativo no podrá convertirse en rol base por coincidencia de nombre, uso histórico o conveniencia de interfaz;
9. un código base no podrá aceptarse como operativo;
10. no se crearán roles por aplicación;
11. no se crearán roles por sede;
12. no se crearán roles por área;
13. no se crearán roles desde un perfil individual;
14. no se crearán roles desde una estación o dispositivo;
15. una versión desconocida o incompatible deberá impedir que la proyección se presente como canónicamente vigente;
16. el orden visual no establece jerarquía ni precedencia de autorización;
17. pertenecer al catálogo no concede permisos.

---

#### 10. Exclusiones obligatorias

No forman parte del catálogo administrativo de roles operativos:

- los ocho roles base canónicos;
- cargos administrativos;
- oficios legacy usados históricamente como roles base;
- `propietario_admin`;
- usuarios técnicos de dispositivo;
- `service_role`;
- perfiles operativos de trabajador;
- turnos;
- check-ins;
- sedes;
- áreas;
- tipos de sede o área;
- permisos;
- excepciones individuales;
- grupos de navegación;
- nombres de estaciones;
- códigos generados localmente por una aplicación.

Una coincidencia semántica de nombre no convierte ninguna de esas entidades en `OperationalRoleCode`.

---

#### 11. Separación de responsabilidades dentro de VISO

`VISO-AUTH-002` fija únicamente el catálogo administrativo de identidades operativas y su semántica mínima de presentación.

| Tarea | Responsabilidad reservada |
| --- | --- |
| `VISO-AUTH-003` | Administración de permisos y matriz por rol base. |
| `VISO-AUTH-004` | Administración de permisos y matriz por rol operativo. |
| `VISO-AUTH-005` | Roles operativos permitidos por sede. |
| `VISO-AUTH-006` | Roles operativos permitidos por área. |
| `VISO-AUTH-007` | Perfiles operativos por trabajador. |
| `VISO-AUTH-008` | Sedes asignadas al trabajador. |
| `VISO-AUTH-009` | Áreas asignadas al trabajador. |
| `VISO-AUTH-010` | Rol operativo asignado y efectivo dentro del turno. |
| `VISO-AUTH-011` | Validación de turnos sin rol operativo. |
| `VISO-AUTH-012` | Validación de incompatibilidad entre rol, sede y área. |
| `VISO-AUTH-013` | Vista previa trabajador × sede × área × turno. |
| `VISO-AUTH-014` | Simulación de permisos efectivos. |
| `VISO-AUTH-015` | Origen de cada permiso. |
| `VISO-AUTH-016` | Conflictos de configuración. |
| `VISO-AUTH-017` | Excepciones individuales. |
| `VISO-AUTH-018` | Auditoría de cambios de seguridad. |
| `VISO-AUTH-019` | Restricción de quién administra seguridad. |
| `VISO-AUTH-020` | Exporte de matriz de acceso. |

La secuencia canónica continúa por `VISO-AUTH-003`, aunque la matriz que consume directamente las doce identidades operativas se desarrolle después en `VISO-AUTH-004`.

Esta tarea no adelanta ninguna de esas responsabilidades.

---

#### 12. Reconciliación con superficies físicas observadas

El código actual de VISO ya contiene una superficie de matriz operativa que consume un catálogo denominado `vento_operational_roles_v1` y una matriz territorial denominada `vento_site_operational_role_matrix_v1`.

Esa superficie ya expresa dos fronteras compatibles con esta tarea:

- los roles se seleccionan desde un catálogo aprobado;
- la habilitación por sede o área se administra como relación separada del catálogo.

También existe una superficie distinta de permisos por rol que actualmente consulta el catálogo base `roles` y su matriz `role_permissions`.

Estas observaciones no convierten ninguna de las dos superficies en la unidad física propietaria de esta tarea.

La existencia AS-IS de una pantalla, vista, RPC o tabla no autoriza:

- modificarla durante el cierre documental;
- declarar que `VISO-AUTH-002` ya está implementada;
- fusionar catálogo operativo con matriz territorial;
- fusionar catálogo operativo con permisos;
- omitir el package y gate físicos;
- reutilizar un comportamiento legacy como fuente contractual.

La identidad exacta de la futura unidad de implementación se resolverá exclusivamente dentro del package y gate físico correspondiente.

---

#### 13. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea materializa en VISO decisiones de catálogo operativo, separación de carriles, temporalidad del rol, aplicabilidad por proceso y límites de autoridad que ya están protegidas por el registro vigente. No introduce un nuevo código operativo, una nueva modalidad de autorización, un grant, una regla territorial, una transición física ni un comportamiento operativo adicional que requiera ampliar el registro.

---

#### 14. Cobertura de prueba vigente reutilizada

La tarea reutiliza, sin modificar, la cobertura vigente:

- `TREQ-SHELL-041` protege el conjunto exacto de doce `OperationalRoleCode`, la integridad del dataset operativo, la exclusión de roles base y `propietario_admin`, y la ausencia de aliases o fallbacks;
- `TREQ-AUTH-001` protege que una lista local o nombre de rol no conceda autorización final;
- `TREQ-AUTH-007` protege que la administración de roles operativos y su disponibilidad territorial requiera capacidad administrativa explícita;
- `TREQ-AUTH-008` protege que las capacidades operativas dependan de turno, check-in, rol operativo efectivo y compatibilidad territorial;
- `TREQ-AUTH-010` protege segregación de funciones entre caja, producción, bodega, logística y otras responsabilidades operativas;
- `TREQ-VISO-001` protege la coherencia posterior entre configuración administrativa de VISO y el resultado consumido por las aplicaciones operativas.

Esta trazabilidad no cambia estado, contenido, paquete, evidencia ni secuencia de esos requisitos.

---

#### 15. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | Esta definición documental no ejecutó el build del checkout propietario. |
| LOCAL | NOT_EXECUTED | No se registró una ejecución local de los validadores documentales sobre el artefacto insertado en el checkout. |
| REMOTA | PASS | La rama canónica vigente fue contrastada en solo lectura contra continuidad, topología, políticas documentales, `OperationalRoleCode@1.0.0`, `AUTH-MOD-005`, `PROC-ACTOR-002`, el validador del dataset operativo, el Registro 04A y las superficies VISO relacionadas. |
| OPERATIVA | NOT_APPLICABLE | La tarea define el contrato administrativo del catálogo y no cambia turnos, asignaciones, permisos efectivos ni acciones reales de trabajadores. |
| FÍSICA | NOT_EXECUTED | No se modificaron UI, Server Actions, contratos distribuidos, migraciones, datos ni Supabase; la materialización permanece detrás de `POST_E5_PACKAGE`. |

---

#### 16. Criterios de aceptación

- [ ] El catálogo contiene exactamente los doce códigos operativos vigentes.
- [ ] Los doce códigos pertenecen exactamente a cuatro familias funcionales.
- [ ] No existe solapamiento con los ocho roles base canónicos.
- [ ] `propietario_admin` no aparece como rol operativo.
- [ ] No aparecen oficios legacy, aliases o códigos creados por aplicación, sede, área, perfil o dispositivo.
- [ ] Cada rol conserva su familia, función principal, requerimiento de área y cantidad vigente de procesos aplicables.
- [ ] La suma de vínculos aplicables permanece en 444 sobre 828 pares posibles.
- [ ] Se conservan 51 procesos con rol operativo aplicable y 18 sin rol operativo directo.
- [ ] La aplicabilidad de proceso no se interpreta como grant ni autorización.
- [ ] El catálogo distingue rol catalogado, rol asignado y rol efectivo.
- [ ] Un perfil predeterminado no autoriza.
- [ ] Un dispositivo no asigna roles.
- [ ] `operador_integral_satelite` no se convierte en superusuario ni unión automática de permisos.
- [ ] `gerencia_operativa` no se convierte en administrador global ni bypass.
- [ ] `bodeguero` permanece como rol operativo y no como rol base.
- [ ] `conductor_logistica` no adquiere producción, inventario global o recepción general por nombre.
- [ ] Los roles productivos permanecen separados por especialidad.
- [ ] El catálogo no administra grants ni invade `VISO-AUTH-004`.
- [ ] La matriz territorial no se absorbe en esta tarea y permanece reservada a `VISO-AUTH-005` y `VISO-AUTH-006`.
- [ ] La asignación y efectividad del turno permanecen reservadas a `VISO-AUTH-010` a `VISO-AUTH-012`.
- [ ] La versión operativa compartida permanece `1.0.0`.
- [ ] La frontera contractual de 240 grants y su huella vigente no se modifica.
- [ ] Los cambios físicos permanecen fuera del cierre documental y detrás de la topología y gate vigentes.
- [ ] Se conservan cero cambios al Registro Canónico de Requisitos de Prueba.

---

#### 17. Límites

Esta tarea no:

- crea ni modifica código de VISO;
- crea rutas, pantallas, componentes o Server Actions;
- declara un archivo físico de VISO como implementation unit;
- modifica el paquete compartido de contratos;
- modifica `operational-roles.json`;
- modifica el dataset `operational-role-grants@1.0.0`;
- modifica `public.operational_roles`;
- modifica matrices de sede o área;
- modifica turnos;
- modifica perfiles operativos;
- modifica check-ins;
- crea migraciones;
- crea o modifica RLS, RPC, triggers o grants;
- administra permisos por rol base;
- administra permisos por rol operativo;
- habilita roles en sedes;
- habilita roles en áreas;
- asigna roles a trabajadores;
- asigna roles a turnos;
- crea excepciones individuales;
- ejecuta simulaciones;
- modifica precedencia, denegaciones o autorización efectiva;
- crea aliases para compatibilidad legacy;
- retira físicamente roles legacy;
- selecciona package;
- autoriza implementación física.

---

#### 18. Handoff contractual

El resultado de esta tarea entrega un universo operativo cerrado y no ambiguo:

```text
12 roles operativos canónicos
+
4 familias
+
función principal por rol
+
requerimiento territorial de referencia
+
444 vínculos de aplicabilidad
+
fronteras de autoridad
+
separación entre catálogo, asignación y efectividad
```

`VISO-AUTH-003` continuará con la administración de permisos por rol base y deberá conservar intacto el universo operativo definido aquí.

`VISO-AUTH-004` deberá consumir exactamente estas doce identidades al administrar la matriz operativa, sin incorporar roles base, aliases, `propietario_admin` ni códigos locales.

Las tareas territoriales y de turno posteriores podrán vincular estos códigos a sedes, áreas, perfiles y turnos, pero ninguna podrá redefinir silenciosamente qué identidades pertenecen al catálogo operativo.

---

#### 19. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-AUTH-001 — Crear catálogo administrativo de roles base`

**TAREA ACTUAL APROBADA**
`VISO-AUTH-002 — Crear catálogo administrativo de roles operativos`

**SIGUIENTE TAREA RESERVADA**
`VISO-AUTH-003 — Administrar permisos por rol base`


### ✅ VISO-AUTH-003 — Administrar permisos por rol base

**Estado:** APROBADA
**Tarea anterior:** VISO-AUTH-002 — Crear catálogo administrativo de roles operativos
**Tarea siguiente:** VISO-AUTH-004 — Administrar permisos por rol operativo
**Tipo de tarea:** documental; definición del contrato administrativo para gobernar concesiones de permisos por rol base sin crear una fuente paralela de catálogo, autorización o denegaciones
**Bloque:** `G_VISO — GOBIERNO DE ACCESO Y SEGURIDAD`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/01_GOBIERNO_DE_ACCESO_Y_SEGURIDAD.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante el cierre documental; la materialización futura queda sujeta a `PER_IMPLEMENTATION_UNIT` y `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo VISO deberá consultar y gobernar las concesiones del carril base para los ocho roles base canónicos, manteniendo separados catálogo, grant, alcance, modalidad, condición, denegación, contexto operativo y decisión efectiva.

La regla raíz es:

```text
ROL BASE CANÓNICO
+ PERMISO CANÓNICO
+ MODALIDAD COMPATIBLE CON BASE
+ ALCANCE Y RECURSO VÁLIDOS
+ CONCESIÓN BASE VIGENTE
+ SIN DENEGACIÓN PREVALENTE
→ BASE ALLOW POSIBLE
```

Nunca:

```text
NOMBRE DEL ROL → AUTORIZACIÓN
CAMBIO EN UI → AUTORIZACIÓN INMEDIATA
```

---

#### 2. Fuentes vinculantes

Esta tarea conserva sin reescribir:

- `ADR-AUTH-001`;
- `AUTH-MOD-002`, `AUTH-MOD-003`, `AUTH-MOD-004`, `AUTH-MOD-018`, `AUTH-MOD-019` y `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-007`, `AUTH-RBAC-024`, `AUTH-RBAC-027` y `AUTH-RBAC-028`;
- `SHELL-CON-003`, `SHELL-CON-004` y `SHELL-CON-006`;
- `VISO-AUTH-001` y `VISO-AUTH-002`.

Contratos compartidos vigentes:

```text
vento.authorization@1.0.0
vento.authorization.base-role-grants@1.1.0
BaseRoleCode@1.1.0
PermissionScopeCode@1.0.0
```

VISO administra configuración efectiva gobernada por estos contratos. La interfaz no modifica los archivos versionados de `@vento/contracts` ni crea códigos contractuales nuevos.

---

#### 3. Universo administrativo cerrado

La administración opera exclusivamente sobre:

```text
BaseRoleCode = 8
PermissionKey activas = 140
base-role-grants de referencia = 504
```

Roles admitidos:

1. `propietario`;
2. `gerente_general`;
3. `gerente`;
4. `supervisor`;
5. `auxiliar_administrativa`;
6. `contador`;
7. `marketing`;
8. `trabajador_operativo`.

No se admiten roles operativos, oficios legacy, `propietario_admin`, dispositivos, usuarios técnicos, aplicaciones como sujetos, aliases locales ni claves de permiso desconocidas o retiradas.

---

#### 4. Matriz base vigente

`base-role-grants@1.1.0` contiene:

| Rol base | Concesiones |
| --- | ---: |
| `propietario` | 121 |
| `gerente_general` | 119 |
| `gerente` | 93 |
| `supervisor` | 58 |
| `auxiliar_administrativa` | 47 |
| `contador` | 45 |
| `marketing` | 16 |
| `trabajador_operativo` | 5 |
| **Total** | **504** |

Cada concesión referencia `role_code`, `permission_key`, `authorization_mode`, `lane`, `grant_type`, `effect`, `scope_expression`, `condition_expression` y `source_task`.

Las 504 filas usan:

```text
lane = BASE
effect = ALLOW
```

La matriz administra concesiones positivas. Ausencia de concesión significa ausencia de `BASE_ALLOW`; no crea por sí misma una denegación explícita.

Distribuciones de integridad:

```text
DIRECT_BASE = 468
BASE_COMPONENT = 36

BASE_ONLY = 256
BASE_OR_OPERATIONAL = 212
BASE_AND_OPERATIONAL = 36
OPERATIONAL_ONLY = 0
```

Por aplicación:

```text
shell=8, anima=52, aura=3, fogo=19, nexo=251,
numera=27, origo=31, pass=2, pulso=18, viso=93
```

---

#### 5. Modalidades y límites del carril base

| Modalidad | Regla administrativa |
| --- | --- |
| `BASE_ONLY` | Puede satisfacerse por carril base sin turno ni check-in, sujeto a actor, alcance, recurso y denegaciones. |
| `BASE_OR_OPERATIONAL` | El carril base puede autorizar completamente; el carril operativo sigue siendo alternativa independiente. |
| `BASE_AND_OPERATIONAL` | El grant base es solo `BASE_COMPONENT`; la acción final exige componente operativo compatible del mismo actor. |
| `OPERATIONAL_ONLY` | No admite grant base y debe bloquearse en esta tarea. |

La modalidad proviene del contrato del permiso. No se infiere desde rol, ruta, pantalla ni tabla.

---

#### 6. Alcance

VISO deberá consumir la taxonomía canónica:

```text
NT, ORG, G, AS, SS, AST, TST, AA, SA, AAT, ATW, CTX, OWN
```

Solo podrá presentar scopes admitidos por el permiso y respetará `AllowedScopeSet`, `MaximumScope`, recurso y modalidad.

Reglas:

- `G` no es wildcard;
- `ORG` no significa todas las sedes por inferencia;
- `TST` no se infiere desde `AST`;
- `CTX` no sustituye turno, check-in ni área;
- `OWN` no amplía territorio;
- un territorio o recurso obligatorio irresoluble bloquea el cambio;
- no existe fallback hacia un scope más amplio para permitir guardar.

---

#### 7. Operaciones administrativas canónicas

El catálogo vigente separa exactamente:

```text
viso.authorization.base_grants.view
viso.authorization.base_grants.create
viso.authorization.base_grants.approve
viso.authorization.base_grants.suspend
viso.authorization.base_grants.revoke
```

| Acción | Semántica |
| --- | --- |
| `view` | Consultar matriz, modalidad, alcance, condición y procedencia. |
| `create` | Registrar una propuesta de concesión válida; no equivale a aprobación. |
| `approve` | Aprobar una propuesta después de revalidar seguridad, scope, recurso y segregación. |
| `suspend` | Interrumpir temporalmente la eficacia de un allow conservando historia. |
| `revoke` | Retirar la eficacia futura del allow conservando evidencia histórica. |

No existe un permiso canónico genérico equivalente a `manage all permissions`.

Cada acción se autoriza por separado en servidor.

---

#### 8. Autoridad para administrar grants base

El snapshot vigente concede las cinco capacidades anteriores únicamente a:

- `propietario`;
- `gerente_general`.

No están concedidas a los otros seis roles base.

Para ambos roles son `BASE_ONLY`, `DIRECT_BASE`, con alcance `ORG`, y exigen:

- reautenticación fuerte;
- actor activo;
- recurso objetivo válido;
- segregación de funciones;
- auditoría;
- no autoaprobación;
- no autoafectación.

Por tanto:

```text
CREATE ≠ APPROVE
PROPONER ≠ APROBAR EL PROPIO CAMBIO
ADMINISTRAR ≠ AMPLIAR LA PROPIA AUTORIDAD
```

Una restricción de segregación no puede existir solo en frontend.

---

#### 9. Reglas de mutación

Una propuesta de grant base solo es válida cuando:

1. el rol pertenece a los ocho `BaseRoleCode`;
2. el permiso pertenece a las 140 identidades activas;
3. la modalidad admite carril base;
4. el scope pertenece al conjunto admitido por el permiso;
5. territorio y recurso son resolubles;
6. no existe duplicado ambiguo;
7. no se usa clave legacy, alias o inferencia por prefijo;
8. el actor posee la capacidad administrativa exacta;
9. no existe autoafectación prohibida;
10. quedan registrados motivo, actor y trazabilidad;
11. `create` permanece separado de `approve`.

`approve` debe revalidar todo el cambio. No podrá confiar en una validación antigua si cambió rol, permiso, scope, recurso, versión contractual o propuesta.

Suspender o revocar un allow no crea un deny.

La matriz base no podrá usar:

```text
is_allowed = false
```

como atajo para crear una denegación contractual nueva. Las denegaciones pertenecen al modelo separado de deny y precedencia.

---

#### 10. `trabajador_operativo`

Su snapshot vigente conserva exactamente cinco grants:

```text
shell.access
anima.access
anima.workforce.employee_documents.view
anima.workforce.employee_documents.upload
anima.workforce.employee_photos.upload
```

Los cinco son `BASE_ONLY` y `DIRECT_BASE`.

La administración no podrá convertir este rol mínimo en sustituto de roles operativos ni eludir turno, sede, área, check-in o matriz operativa.

---

#### 11. Experiencia administrativa mínima

Para cada combinación relevante VISO deberá distinguir:

- rol base;
- aplicación;
- permiso y etiqueta humana;
- modalidad;
- grant type;
- scope;
- condición;
- procedencia;
- existencia o ausencia de `BASE_ALLOW`;
- condición de `BASE_COMPONENT`;
- operación administrativa pendiente.

Está prohibido:

- conceder por prefijo;
- conceder una aplicación completa mediante `<app>.access`;
- conceder una familia mediante un switch masivo;
- convertir “todos” en wildcard;
- ocultar la doble condición de `BASE_AND_OPERATIONAL`;
- presentar una propuesta como grant efectivo;
- confundir ausencia con deny explícito.

Las vistas completas de simulación, origen, conflictos y auditoría permanecen reservadas a tareas posteriores.

---

#### 12. Reconciliación AS-IS de VISO

La superficie actual `/roles-permissions`:

- consulta roles activos y permisos;
- modifica `role_permissions`;
- usa scopes genéricos `global`, `site`, `site_type`, `area`, `area_kind`;
- usa `permissionCode: "staff.permissions.manage"` dentro del guard de VISO;
- guarda mediante delete + insert;
- admite `is_allowed`.

Es evidencia AS-IS, no contrato TO-BE.

La futura materialización deberá reconciliar:

| AS-IS | TO-BE |
| --- | --- |
| guard genérico | `base_grants.view/create/approve/suspend/revoke` separados |
| delete + insert | ciclo gobernado de creación, aprobación, suspensión y revocación |
| `is_allowed=false` | deny explícito separado de la matriz positiva |
| scopes genéricos | scopes derivados del contrato canónico |
| roles de tabla local | membresía validada contra ocho `BaseRoleCode` |
| permiso local existente | identidad validada contra catálogo versionado |
| control principalmente de UI | autorización, reauth y segregación en servidor |

Esta tarea no modifica esa ruta ni Supabase.

---

#### 13. Fallo cerrado

Se rechaza la operación ante:

- rol base desconocido;
- permiso desconocido, legacy o retirado;
- permiso `OPERATIONAL_ONLY`;
- scope no admitido;
- territorio o recurso obligatorio irresoluble;
- actor sin permiso administrativo exacto;
- reautenticación requerida ausente;
- autoaprobación;
- autoafectación;
- duplicado ambiguo;
- cambio concurrente no revalidado;
- auditoría no persistible;
- versión contractual incompatible;
- intento de convertir `is_allowed=false` en deny nuevo;
- discrepancia entre UI y servidor.

Prevalece siempre la decisión de servidor.

---

#### 14. Separación de responsabilidades

`VISO-AUTH-003` no absorbe:

- `VISO-AUTH-004`: permisos por rol operativo;
- `VISO-AUTH-005` y `006`: disponibilidad por sede y área;
- `VISO-AUTH-007` a `012`: perfiles, asignaciones y rol operativo efectivo;
- `VISO-AUTH-013`: vista previa trabajador × sede × área × turno;
- `VISO-AUTH-014`: simulación;
- `VISO-AUTH-015`: origen de permisos;
- `VISO-AUTH-016`: conflictos;
- `VISO-AUTH-017`: excepciones individuales;
- `VISO-AUTH-018`: auditoría administrativa;
- `VISO-AUTH-019`: restricción de quién administra seguridad;
- `VISO-AUTH-020`: exporte de matriz.

La futura implementación física de esta tarea continúa detrás de `PER_IMPLEMENTATION_UNIT` y `POST_E5_PACKAGE`.

---

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

Las reglas materializadas ya están protegidas por requisitos vigentes de catálogo, autorización, administración territorial, separación de carriles, integridad de la matriz base y coherencia de VISO. No se introduce una nueva identidad, modalidad, scope o regla empresarial que exija ampliar el registro.

---

#### 16. Cobertura de prueba vigente reutilizada

Sin modificar el registro, se reutiliza la cobertura que protege:

- exactitud de los ocho roles base y de `base-role-grants@1.1.0`;
- prohibición de autorización por listas locales de roles;
- validez de claves de permiso;
- administración de seguridad mediante capacidad explícita;
- independencia entre administración y turno/check-in;
- segregación de funciones;
- coherencia entre configuración VISO y resultado consumido por las aplicaciones.

Esta trazabilidad no cambia estado, contenido, paquete ni evidencia de ningún requisito.

---

#### 17. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La definición documental no ejecutó build del checkout propietario. |
| LOCAL | NOT_EXECUTED | La tarea aún no fue insertada ni validada en el checkout local de su rama documental. |
| REMOTA | PASS | Se contrastaron continuidad, topología, políticas, archivo propietario, catálogo de 140 permisos, ocho roles, dataset base 1.1.0, validador de 504 grants, scopes y superficie VISO AS-IS. |
| OPERATIVA | NOT_APPLICABLE | No se cambian permisos efectivos ni acciones reales de trabajadores durante este cierre documental. |
| FÍSICA | NOT_EXECUTED | No se modificaron VISO, Server Actions, `role_permissions`, Supabase, migraciones ni contratos distribuidos. |

---

#### 18. Criterios de aceptación

- [ ] Se administran exclusivamente ocho `BaseRoleCode`.
- [ ] El universo de capacidades conserva 140 `PermissionKey` activas.
- [ ] El snapshot conserva 504 grants: 468 `DIRECT_BASE` y 36 `BASE_COMPONENT`.
- [ ] Los conteos por rol son 121, 119, 93, 58, 47, 45, 16 y 5.
- [ ] La matriz sigue siendo `ALLOW_ONLY`.
- [ ] `OPERATIONAL_ONLY` no puede agregarse al carril base.
- [ ] `BASE_COMPONENT` no se presenta como autorización completa.
- [ ] Ausencia, suspensión, revocación y deny explícito no se confunden.
- [ ] Los scopes provienen del contrato y no de una lista genérica local.
- [ ] Las cinco acciones `base_grants.*` se autorizan por separado.
- [ ] Solo `propietario` y `gerente_general` poseen actualmente las cinco capacidades administrativas del snapshot.
- [ ] Toda mutación sensible exige reautenticación fuerte, segregación y auditoría.
- [ ] No existe autoaprobación ni autoafectación unilateral.
- [ ] `trabajador_operativo` conserva sus cinco grants mínimos en el snapshot vigente.
- [ ] `/roles-permissions` no se declara canónica por su sola existencia.
- [ ] El guard legacy observado no se conserva como autoridad TO-BE.
- [ ] No se invade la matriz operativa de `VISO-AUTH-004`.
- [ ] No se modifican contratos, datos ni Supabase durante el cierre documental.
- [ ] Se conservan cero cambios al Registro Canónico de Requisitos de Prueba.

---

#### 19. Límites

Esta tarea no modifica código de VISO, rutas, componentes, Server Actions, `@vento/contracts`, catálogos, datasets, `role_permissions`, `employee_permissions`, `operational_role_permissions`, denegaciones, migraciones, SQL, RLS, RPC, triggers ni datos Supabase.

Tampoco crea roles, permisos, scopes, aliases, excepciones, perfiles operativos, asignaciones de sede/área, roles de turno, simulaciones, packages ni autorizaciones físicas.

La identidad exacta de la unidad física se resolverá únicamente mediante el package y gate aplicables.

---

#### 20. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-AUTH-002 — Crear catálogo administrativo de roles operativos`

**TAREA ACTUAL APROBADA**
`VISO-AUTH-003 — Administrar permisos por rol base`

**SIGUIENTE TAREA RESERVADA**
`VISO-AUTH-004 — Administrar permisos por rol operativo`


### ✅ VISO-AUTH-004 — Administrar permisos por rol operativo

**Estado:** APROBADA
**Tarea anterior:** VISO-AUTH-003 — Administrar permisos por rol base
**Tarea siguiente:** VISO-AUTH-005 — Administrar roles permitidos por sede
**Tipo de tarea:** documental; definición del contrato administrativo para consultar y gobernar concesiones de permisos por rol operativo sin convertir VISO, una tabla legacy o una matriz territorial en fuente paralela de autorización
**Bloque:** `G_VISO — GOBIERNO DE ACCESO Y SEGURIDAD`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/01_GOBIERNO_DE_ACCESO_Y_SEGURIDAD.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante el cierre documental; la materialización futura queda sujeta a `PER_IMPLEMENTATION_UNIT` y `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo VISO deberá consultar y gobernar las concesiones del carril operativo para los doce roles operativos canónicos, conservando separados:

- catálogo de roles operativos;
- catálogo de permisos;
- concesión positiva por rol operativo;
- modalidad de autorización;
- contexto laboral y territorial;
- alcance contractual;
- disponibilidad del rol por sede o área;
- asignación del rol al turno;
- check-in cuando corresponda;
- denegaciones;
- excepciones individuales;
- decisión efectiva.

La regla raíz queda:

```text
ROL OPERATIVO CANÓNICO
+
PERMISO CANÓNICO
+
MODALIDAD COMPATIBLE CON CARRIL OPERATIVO
+
GRANT OPERATIVO VIGENTE
+
ROL OPERATIVO EFECTIVO
+
CONTEXTO, RECURSO Y TERRITORIO COMPATIBLES
+
SIN DENEGACIÓN PREVALENTE
→
OPERATIONAL_ALLOW POSIBLE
```

Y nunca:

```text
ROL OPERATIVO EN CATÁLOGO
→ AUTORIZACIÓN
```

ni:

```text
GRANT OPERATIVO
→ OPERACIÓN FUERA DE TURNO O CONTEXTO
```

---

#### 2. Fuentes vinculantes

Esta tarea conserva sin reescribir:

- `ADR-AUTH-001`;
- `AUTH-MOD-002`, `AUTH-MOD-005`, `AUTH-MOD-006`, `AUTH-MOD-009`, `AUTH-MOD-010`, `AUTH-MOD-018` y `AUTH-MOD-019`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-009` a `AUTH-RBAC-019`;
- `AUTH-RBAC-025`, `AUTH-RBAC-027` y `AUTH-RBAC-028`;
- `SHELL-CON-003`, `SHELL-CON-005` y `SHELL-CON-006`;
- `VISO-AUTH-002` — catálogo de doce roles operativos;
- `VISO-AUTH-003` — gobierno administrativo de grants base.

Contratos compartidos vigentes:

```text
vento.authorization@1.0.0
vento.authorization.operational-role-grants@1.0.0
OperationalRoleCode@1.0.0
PermissionScopeCode@1.0.0
```

VISO administra configuración efectiva gobernada por estos contratos. La interfaz no edita los archivos versionados de `@vento/contracts`, no crea nuevos códigos de rol y no transforma strings legacy en identidades canónicas.

---

#### 3. Universo administrativo cerrado

La administración opera exclusivamente sobre:

```text
OperationalRoleCode = 12
PermissionKey activas = 140
operational-role-grants de referencia = 240
```

Roles admitidos:

1. `cajero_satelite`;
2. `barista_satelite`;
3. `cocinero_satelite`;
4. `servicio_salon`;
5. `mostrador_satelite`;
6. `operador_integral_satelite`;
7. `produccion_cocina`;
8. `produccion_panaderia`;
9. `produccion_reposteria`;
10. `bodeguero`;
11. `conductor_logistica`;
12. `gerencia_operativa`.

No se admiten:

- roles base;
- `propietario_admin`;
- oficios legacy;
- roles creados por aplicación;
- roles creados por sede o área;
- aliases locales;
- usuarios o empleados concretos como sustitutos del rol;
- dispositivos como sujetos de grant;
- claves de permiso desconocidas, retiradas o legacy bloqueadas.

La identidad del sujeto de esta matriz es siempre `OperationalRoleCode`.

---

#### 4. Matriz operativa vigente

`operational-role-grants@1.0.0` contiene exactamente:

| Rol operativo | Grants | Directos | Componentes |
| --- | ---: | ---: | ---: |
| `cajero_satelite` | 20 | 15 | 5 |
| `barista_satelite` | 11 | 11 | 0 |
| `cocinero_satelite` | 11 | 11 | 0 |
| `servicio_salon` | 11 | 11 | 0 |
| `mostrador_satelite` | 11 | 11 | 0 |
| `operador_integral_satelite` | 21 | 16 | 5 |
| `produccion_cocina` | 16 | 16 | 0 |
| `produccion_panaderia` | 16 | 16 | 0 |
| `produccion_reposteria` | 16 | 16 | 0 |
| `bodeguero` | 36 | 36 | 0 |
| `conductor_logistica` | 16 | 16 | 0 |
| `gerencia_operativa` | 55 | 43 | 12 |
| **Total** | **240** | **218** | **22** |

Cada concesión de referencia relaciona, como mínimo:

```text
operational_role_code
permission_key
authorization_mode
lane
grant_type
effect
scope_expression
condition_expression
source_task
```

Las 240 filas usan:

```text
lane = OPERATIONAL
effect = ALLOW
```

La matriz operativa es `ALLOW_ONLY`.

---

#### 5. Distribuciones contractuales

##### 5.1 Modalidad de autorización

```text
BASE_OR_OPERATIONAL = 174
OPERATIONAL_ONLY = 44
BASE_AND_OPERATIONAL = 22
BASE_ONLY = 0
TOTAL = 240
```

##### 5.2 Tipo de grant

```text
DIRECT_OPERATIONAL = 218
OPERATIONAL_COMPONENT = 22
TOTAL = 240
```

##### 5.3 Aplicación del permiso

```text
FOGO = 19
NEXO = 181
ORIGO = 9
PULSO = 31
TOTAL = 240
```

##### 5.4 Integridad

```text
pares rol-permiso únicos = 240
roles base dentro del dataset = 0
propietario_admin = 0
BASE_ONLY = 0
wildcards = 0
legacy dispatch = 0
```

Huella contractual:

```text
sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

Estas cifras son controles de integridad del snapshot contractual y no cuotas configurables.

---

#### 6. Significado de las modalidades operativas

| Modalidad | Regla del carril operativo |
| --- | --- |
| `BASE_OR_OPERATIONAL` | Un grant operativo directo puede satisfacer el carril operativo cuando existe contexto operativo válido; el carril base sigue siendo una alternativa independiente. |
| `OPERATIONAL_ONLY` | La capacidad solo puede satisfacerse por carril operativo válido. No puede crearse un grant base equivalente. |
| `BASE_AND_OPERATIONAL` | La fila operativa es exclusivamente `OPERATIONAL_COMPONENT`; la acción final exige además el componente base compatible del mismo actor. |
| `BASE_ONLY` | Está prohibida en la matriz operativa. |

Reglas:

```text
OPERATIONAL_COMPONENT
→ nunca autorización completa
```

```text
BASE_ONLY
→ nunca operational grant
```

```text
BASE_AND_OPERATIONAL
→ mismo actor
→ componente base válido
→ componente operativo válido
→ misma decisión final
```

No se permite combinar el componente base de una persona con el componente operativo de otra.

---

#### 7. Contexto operativo obligatorio

Un operational grant no se vuelve efectivo por existir en la matriz.

La evaluación deberá resolver, según el contrato exacto del permiso:

- actor humano efectivo;
- turno publicado y vigente;
- rol operativo asignado;
- rol operativo efectivo;
- sede activa;
- área activa cuando corresponda;
- compatibilidad rol × sede;
- compatibilidad rol × área;
- check-in cuando la condición contractual lo requiera;
- recurso objetivo;
- relación del recurso con actor, sede, área, ruta, caja, bodega, orden o proceso aplicables;
- modalidad;
- denegaciones prevalentes.

La regla general es:

```text
GRANT OPERATIVO
+
CONTEXTO OPERATIVO VÁLIDO
→ CANDIDATO A ALLOW
```

pero no todas las capacidades tienen idéntico prerrequisito de presencia.

Por ejemplo, una capacidad de entrada a una aplicación puede permitir mostrar el contexto y sus bloqueos sin exigir todavía check-in si su contrato así lo declara, mientras una mutación física puede exigir turno + check-in + recurso compatible.

Por tanto, VISO no podrá aplicar una regla simplificada de:

```text
TODO PERMISO OPERATIVO
→ SIEMPRE MISMO CHECK-IN
```

La condición se obtiene del contrato exacto de la concesión y del permiso.

---

#### 8. Alcance operativo y prohibición de globalidad accidental

La matriz operativa canónica no contiene alcance operacional global.

Las 240 concesiones utilizan expresiones contextuales `CTX-*` y no perfiles base o globales.

VISO deberá representar esa semántica sin convertirla en un selector libre de:

```text
global
cualquier sede
cualquier área
```

La taxonomía compartida de scopes continúa siendo:

```text
NT, ORG, G, AS, SS, AST, TST, AA, SA, AAT, ATW, CTX, OWN
```

pero esta tarea no puede usarla para fabricar autoridad territorial.

Reglas obligatorias:

1. `CTX` no sustituye turno, check-in o área;
2. un grant operativo no habilita el rol en una sede por sí mismo;
3. un grant operativo no habilita el rol en un área por sí mismo;
4. la disponibilidad del rol por sede pertenece a `VISO-AUTH-005`;
5. la disponibilidad del rol por área pertenece a `VISO-AUTH-006`;
6. la asignación del rol al turno pertenece a `VISO-AUTH-010`;
7. la validez del turno y del área pertenece a `VISO-AUTH-011` y `VISO-AUTH-012`;
8. una dimensión territorial obligatoria irresoluble falla cerrada;
9. no existe fallback hacia un territorio más amplio.

---

#### 9. Operaciones administrativas canónicas

El catálogo vigente separa exactamente cinco capacidades para gobernar grants operativos:

```text
viso.authorization.operational_grants.view
viso.authorization.operational_grants.create
viso.authorization.operational_grants.approve
viso.authorization.operational_grants.suspend
viso.authorization.operational_grants.revoke
```

| Acción | Semántica |
| --- | --- |
| `view` | Consultar matriz operativa, modalidad, grant type, condición, contexto y procedencia. |
| `create` | Registrar una propuesta válida de operational grant; no la vuelve efectiva por sí sola. |
| `approve` | Aprobar una propuesta después de revalidar rol, permiso, modalidad, seguridad, contexto contractual y segregación. |
| `suspend` | Interrumpir temporalmente la eficacia administrativa del allow conservando historia. |
| `revoke` | Retirar su eficacia futura conservando evidencia histórica. |

No existe una capacidad canónica genérica equivalente a:

```text
manage operational permissions
```

Cada operación administrativa debe autorizarse independientemente en servidor.

---

#### 10. Autoridad para administrar grants operativos

El snapshot base vigente concede las cinco capacidades `operational_grants.*` únicamente a:

- `propietario`;
- `gerente_general`.

No están concedidas a los otros seis roles base.

Para ambos roles las cinco capacidades son:

```text
authorization_mode = BASE_ONLY
grant_type = DIRECT_BASE
scope = ORG
```

y sus condiciones exigen:

- reautenticación fuerte;
- actor activo;
- recurso objetivo válido;
- segregación de funciones;
- auditoría;
- no autoaprobación;
- no autoafectación.

Administrar una matriz operativa es una capacidad administrativa base. No requiere que el administrador haga check-in para adquirir la autoridad administrativa cuando el contrato base la concede.

---

#### 11. Segregación y lifecycle de cambios

La administración deberá separar:

```text
PROPUESTA
→ APROBACIÓN
→ GRANT OPERATIVO VIGENTE
→ SUSPENSIÓN O REVOCACIÓN
```

Reglas:

```text
CREATE ≠ APPROVE
```

```text
PROPONER ≠ APROBAR EL PROPIO CAMBIO
```

```text
ADMINISTRADOR ≠ PODER AMPLIAR SU PROPIA AUTORIDAD
```

Antes de crear o aprobar un cambio deberán resolverse:

- actor administrador;
- permiso administrativo exacto;
- rol operativo objetivo;
- permiso objetivo;
- modalidad;
- tipo de grant;
- expresión contextual;
- condiciones;
- procedencia;
- posible autoafectación;
- actor que propuso;
- actor que aprueba;
- motivo y evidencia requeridos.

La segregación no puede depender únicamente de esconder controles en frontend.

---

#### 12. Reglas de creación y aprobación

Una propuesta de operational grant solo es válida cuando:

1. el rol pertenece a los doce `OperationalRoleCode`;
2. el permiso pertenece al catálogo activo;
3. la modalidad es `BASE_OR_OPERATIONAL`, `OPERATIONAL_ONLY` o `BASE_AND_OPERATIONAL`;
4. `BASE_ONLY` queda rechazado;
5. `BASE_AND_OPERATIONAL` usa `OPERATIONAL_COMPONENT`;
6. `OPERATIONAL_COMPONENT` solo se usa para `BASE_AND_OPERATIONAL`;
7. el par rol-permiso no es un duplicado ambiguo;
8. no se usa wildcard;
9. no se usa `propietario_admin`;
10. no se usa un rol base;
11. no se usa una clave legacy bloqueada;
12. no se infiere un permiso por prefijo;
13. existe condición contextual no vacía;
14. existe expresión de scope no vacía;
15. existe `source_task`;
16. el actor posee `operational_grants.create`;
17. no existe autoafectación prohibida;
18. se registra trazabilidad.

`approve` debe revalidar todo el contrato de la propuesta.

Si cambió el rol, permiso, modalidad, contexto, versión contractual, procedencia o evidencia desde la revisión, la propuesta deberá volver a evaluarse antes de adquirir eficacia.

---

#### 13. Ausencia, suspensión, revocación y deny

VISO deberá distinguir:

| Estado conceptual | Efecto |
| --- | --- |
| Sin operational grant | No existe `OPERATIONAL_ALLOW` para ese par. |
| Grant vigente | Puede aportar allow únicamente con contexto operativo válido. |
| Grant suspendido | No aporta allow mientras la suspensión aplique. |
| Grant revocado | No aporta allow hacia futuro; conserva evidencia histórica. |
| Denegación explícita | Es una regla de deny separada con su propia clase y precedencia. |

La matriz operativa continúa siendo `ALLOW_ONLY`.

Por tanto:

```text
is_allowed = false
```

no se utilizará como atajo para inventar una denegación contractual.

La ausencia de operational grant tampoco se interpreta como un deny explícito contra el carril base de un permiso `BASE_OR_OPERATIONAL`.

---

#### 14. Experiencia administrativa mínima

La vista deberá permitir entender, para cada combinación:

- rol operativo;
- familia funcional;
- aplicación;
- permiso;
- etiqueta humana;
- modalidad;
- `DIRECT_OPERATIONAL` u `OPERATIONAL_COMPONENT`;
- expresión contextual;
- condición;
- procedencia;
- existencia o ausencia del grant;
- si exige componente base adicional;
- estado administrativo de la propuesta o grant.

La UI podrá agrupar por aplicación o familia funcional, pero la decisión permanece atómica por permiso.

Está prohibido:

- activar permisos por prefijo;
- convertir `<app>.access` en acceso a todas las capacidades internas;
- conceder una familia completa mediante un único switch;
- presentar un `OPERATIONAL_COMPONENT` como permiso final;
- mostrar un rol catalogado como si fuera efectivo;
- convertir “todas las sedes” en alcance operativo global;
- presentar una propuesta pendiente como grant vigente.

---

#### 15. Reconciliación AS-IS del runtime y VISO

El corte remoto read-only observado para `public.operational_role_permissions` conserva:

```text
filas = 32
roles con filas = 7
permission_code distintos = 11
is_allowed = false = 0
filas sin site_id, area_id y area_kind = 32
```

Distribución AS-IS:

| Rol observado | Filas |
| --- | ---: |
| `barista_satelite` | 3 |
| `bodeguero` | 5 |
| `cajero_satelite` | 5 |
| `cocinero_satelite` | 3 |
| `conductor_logistica` | 3 |
| `gerencia_operativa` | 7 |
| `operador_integral_satelite` | 6 |
| **Total** | **32** |

Los cinco roles canónicos sin filas en esa tabla son:

- `servicio_salon`;
- `mostrador_satelite`;
- `produccion_cocina`;
- `produccion_panaderia`;
- `produccion_reposteria`.

Además, el catálogo físico `public.operational_roles` observado todavía contiene trece códigos activos porque conserva `propietario_admin`.

Esa fila física legacy:

```text
propietario_admin
```

no pertenece al `OperationalRoleCode` canónico y no puede adquirir grants por compatibilidad.

El dataset contractual objetivo conserva 240 grants sobre 12 roles y cuatro aplicaciones. Las 32 filas físicas actuales no sustituyen ese contrato.

En el repositorio VISO observado, `/operations/preview` lee `operational_role_permissions` para mostrar permisos junto con la matriz de sede/área. La búsqueda estática no identificó una superficie VISO que materialice el lifecycle TO-BE de `operational_grants.create/approve/suspend/revoke`.

Por tanto:

```text
RUNTIME AS-IS OBSERVADO
≠
CONTRATO ADMINISTRATIVO APROBADO
```

La reconciliación física queda diferida a la instancia propietaria autorizada.

---

#### 16. Frontera con la matriz territorial

`VISO-AUTH-004` administra qué capacidades puede aportar un rol operativo bajo contexto válido.

No administra dónde puede existir ese rol.

La separación obligatoria es:

```text
VISO-AUTH-004
rol operativo × permiso
```

```text
VISO-AUTH-005
rol operativo × sede
```

```text
VISO-AUTH-006
rol operativo × área
```

y posteriormente:

```text
VISO-AUTH-010
trabajador × turno × rol operativo
```

Por tanto, los campos legacy `site_id`, `area_id` o `area_kind` presentes en una tabla física no autorizan a absorber dentro de esta tarea las responsabilidades territoriales reservadas.

La futura implementación deberá reconciliar la persistencia física sin crear dos fuentes contradictorias de territorio.

---

#### 17. Fallo cerrado

La operación se rechaza ante:

| Caso | Resultado |
| --- | --- |
| Rol no perteneciente a los doce códigos canónicos | Rechazar |
| `propietario_admin` | Rechazar |
| Rol base usado como operativo | Rechazar |
| PermissionKey inexistente, retirada o legacy bloqueada | Rechazar |
| `BASE_ONLY` | Rechazar operational grant |
| `BASE_AND_OPERATIONAL` sin `OPERATIONAL_COMPONENT` | Rechazar |
| `OPERATIONAL_COMPONENT` sobre otra modalidad | Rechazar |
| Wildcard | Rechazar |
| Duplicado ambiguo | Rechazar |
| Expresión contextual vacía | Rechazar |
| Condición vacía | Rechazar |
| Actor sin permiso administrativo exacto | Rechazar |
| Reautenticación requerida ausente | Rechazar |
| Autoaprobación | Rechazar |
| Autoafectación prohibida | Rechazar |
| Contexto obligatorio irresoluble | Rechazar |
| Auditoría no persistible | Rechazar |
| Versión contractual incompatible | Rechazar |
| Intento de crear deny con `is_allowed=false` | Rechazar dentro de esta matriz |
| Discrepancia UI-servidor | Prevalece servidor; no guardar |

---

#### 18. Handoff contractual

La tarea entrega una matriz administrativa cerrada y verificable:

```text
12 roles operativos
+
140 permisos activos como universo de identidad
+
240 grants de referencia
+
218 DIRECT_OPERATIONAL
+
22 OPERATIONAL_COMPONENT
+
174 BASE_OR_OPERATIONAL
+
44 OPERATIONAL_ONLY
+
22 BASE_AND_OPERATIONAL
+
0 BASE_ONLY
+
5 operaciones administrativas separadas
+
contexto operativo obligatorio
+
sin globalidad operativa
+
deny separado
+
fallo cerrado
```

`VISO-AUTH-005` consumirá exactamente los doce roles definidos aquí para administrar su disponibilidad por sede.

No podrá modificar la matriz de permisos al administrar territorio.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea materializa en VISO obligaciones ya aprobadas de catálogo operativo, matriz operativa, administración de seguridad, contexto laboral, segregación, territorialidad y coherencia. No introduce nuevos códigos, modalidades, scopes ni reglas empresariales que exijan ampliar el Registro Canónico de Requisitos de Prueba.

---

#### 20. Cobertura de prueba vigente reutilizada

Sin modificar el registro, se reutiliza la cobertura vigente que protege:

- el conjunto exacto de doce roles operativos y la huella de `operational-role-grants@1.0.0`;
- el conjunto permitido de scopes y el fallo cerrado ante territorios irresolubles;
- la prohibición de autorización por listas locales de roles;
- la validez de `PermissionKey`;
- la administración de roles y permisos mediante capacidad explícita;
- la exigencia de contexto operativo para capacidades operativas;
- la resolución determinista de sede y área;
- la segregación de funciones;
- la coherencia entre configuración VISO y resultado consumido por las aplicaciones.

Esta trazabilidad no cambia estado, contenido, paquete, evidencia ni secuencia de ningún requisito existente.

---

#### 21. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La definición documental no ejecutó build del checkout propietario. |
| LOCAL | NOT_EXECUTED | La tarea aún no fue insertada ni validada dentro de la rama documental local. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, topología, políticas, archivo propietario, catálogo de 140 permisos, doce roles operativos, dataset 1.0.0, validador de 240 grants, permisos administrativos `operational_grants.*`, código VISO y estado read-only de `public.operational_role_permissions` y `public.operational_roles`. |
| OPERATIVA | NOT_APPLICABLE | No se cambian turnos, grants efectivos, asignaciones, check-ins ni acciones de trabajadores durante este cierre documental. |
| FÍSICA | NOT_EXECUTED | No se modificaron VISO, Supabase, `operational_role_permissions`, `operational_roles`, migraciones, RLS, RPC ni contratos distribuidos. |

---

#### 22. Criterios de aceptación

- [ ] Se administran exclusivamente los doce `OperationalRoleCode`.
- [ ] `propietario_admin` queda excluido.
- [ ] No existe solapamiento entre roles base y operativos.
- [ ] El universo de identidad conserva 140 `PermissionKey` activas.
- [ ] El snapshot conserva exactamente 240 grants y 240 pares únicos.
- [ ] Los conteos por rol son 20, 11, 11, 11, 11, 21, 16, 16, 16, 36, 16 y 55.
- [ ] Se conservan 218 `DIRECT_OPERATIONAL` y 22 `OPERATIONAL_COMPONENT`.
- [ ] Se conservan 174 `BASE_OR_OPERATIONAL`, 44 `OPERATIONAL_ONLY`, 22 `BASE_AND_OPERATIONAL` y 0 `BASE_ONLY`.
- [ ] Se conservan 19 grants FOGO, 181 NEXO, 9 ORIGO y 31 PULSO.
- [ ] La huella contractual permanece `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f`.
- [ ] La matriz continúa siendo `ALLOW_ONLY`.
- [ ] `BASE_ONLY` no puede agregarse al carril operativo.
- [ ] `OPERATIONAL_COMPONENT` solo puede representar `BASE_AND_OPERATIONAL`.
- [ ] Un grant operativo nunca reemplaza turno, rol efectivo, sede, área o recurso.
- [ ] No se introduce alcance operativo global.
- [ ] El check-in se exige conforme al contrato exacto y no mediante una regla simplificada global.
- [ ] Las cinco acciones `operational_grants.*` se autorizan independientemente.
- [ ] Solo `propietario` y `gerente_general` poseen actualmente las cinco capacidades administrativas del snapshot base.
- [ ] Toda mutación sensible aplica reautenticación, segregación y auditoría.
- [ ] No existe autoaprobación ni autoafectación unilateral.
- [ ] Ausencia, suspensión, revocación y deny explícito permanecen separados.
- [ ] La tabla AS-IS de 32 filas no se declara equivalente al dataset canónico de 240.
- [ ] `public.operational_roles` AS-IS no convierte `propietario_admin` en rol canónico.
- [ ] No se absorben responsabilidades de `VISO-AUTH-005`, `VISO-AUTH-006` ni `VISO-AUTH-010` a `VISO-AUTH-012`.
- [ ] La materialización física permanece detrás de `POST_E5_PACKAGE`.
- [ ] Se conservan cero cambios al Registro Canónico de Requisitos de Prueba.

---

#### 23. Límites

Esta tarea no:

- modifica código de VISO;
- crea una pantalla física de administración;
- modifica `/operations/preview`;
- modifica `/operations/site-roles`;
- modifica `@vento/contracts`;
- modifica `operational-roles.json`;
- modifica `operational-role-grants.jsonl`;
- modifica `public.operational_roles`;
- modifica `public.operational_role_permissions`;
- elimina `propietario_admin`;
- crea migraciones;
- ejecuta SQL de escritura;
- modifica RLS;
- modifica RPC;
- modifica triggers;
- modifica grants PostgreSQL;
- crea nuevos roles;
- crea nuevos permisos;
- crea nuevos scopes;
- administra la matriz base;
- administra disponibilidad de roles por sede;
- administra disponibilidad de roles por área;
- administra perfiles operativos;
- asigna roles a trabajadores o turnos;
- cambia check-ins;
- crea excepciones individuales;
- crea denegaciones;
- ejecuta simulaciones;
- selecciona package;
- prepara package gate;
- aprueba package gate;
- autoriza ni ejecuta implementación física.

La identidad exacta de la unidad física se resolverá únicamente mediante el package y gate aplicables.

---

#### 24. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-AUTH-003 — Administrar permisos por rol base`

**TAREA ACTUAL APROBADA**
`VISO-AUTH-004 — Administrar permisos por rol operativo`

**SIGUIENTE TAREA RESERVADA**
`VISO-AUTH-005 — Administrar roles permitidos por sede`


### ✅ VISO-AUTH-005 — Administrar roles permitidos por sede

**Estado:** APROBADA
**Tarea anterior:** VISO-AUTH-004 — Administrar permisos por rol operativo
**Tarea siguiente:** VISO-AUTH-006 — Administrar roles permitidos por área
**Tipo de tarea:** documental; definición del contrato administrativo de elegibilidad rol operativo × sede, separado de permisos, áreas, perfiles de trabajador, turnos y autorización efectiva
**Bloque:** `G_VISO — GOBIERNO DE ACCESO Y SEGURIDAD`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/01_GOBIERNO_DE_ACCESO_Y_SEGURIDAD.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante el cierre documental; la materialización futura queda sujeta a `PER_IMPLEMENTATION_UNIT` y `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo VISO deberá administrar la disponibilidad de los doce roles operativos canónicos por sede operativa elegible, sin convertir esa relación territorial en permiso, perfil de trabajador, rol de turno ni autorización final.

La unidad lógica de esta tarea es:

```text
site_id
+
operational_role_code
→
RELACIÓN EXPLÍCITA DE ELEGIBILIDAD POR SEDE
```

La regla raíz queda:

```text
SEDE OPERATIVA ELEGIBLE
+
OperationalRoleCode CANÓNICO
+
RELACIÓN ACTIVA ROL × SEDE
→
ROL DISPONIBLE PARA SER EVALUADO EN ESA SEDE
```

Y nunca:

```text
ROL PERMITIDO EN SEDE
→ PERMISO CONCEDIDO
```

ni:

```text
ROL PERMITIDO EN SEDE
→ ROL EFECTIVO DEL TRABAJADOR
```

ni:

```text
ROL PERMITIDO EN SEDE
→ AUTORIZACIÓN FINAL
```

---

#### 2. Fuentes vinculantes

Esta tarea conserva y consume, sin reescribir:

- `ADR-AUTH-001`;
- `AUTH-MOD-005` — catálogo operativo separado;
- `AUTH-MOD-007` — sede asignada, sede activa y elegibilidad operativa;
- `AUTH-MOD-008` — área asignada, área activa y relación sede–área;
- `AUTH-MOD-009` y `AUTH-MOD-010` — turno publicado y contexto operativo;
- `AUTH-RBAC-008` a `AUTH-RBAC-019` — matrices de los doce roles operativos;
- `AUTH-RBAC-025` — dataset operativo canónico;
- `AUTH-RBAC-027` y `AUTH-RBAC-028` — separación entre carril base y operativo y compatibilidad contextual;
- `VISO-AUTH-002` — catálogo administrativo de doce roles operativos;
- `VISO-AUTH-004` — permisos por rol operativo y frontera con la matriz territorial;
- `SHELL-CON-005` — contrato compartido de roles operativos.

La fuente de identidad del rol continúa siendo `OperationalRoleCode@1.0.0`.

La fuente del catálogo de sedes continúa siendo `public.sites`, pero no todo registro de ese catálogo es una sede operativa elegible.

La administración de VISO no crea nuevos códigos de rol ni nuevos códigos de sede.

---

#### 3. Identidad de la relación por sede

La identidad lógica de una regla de esta tarea es:

```text
(site_id, operational_role_code)
```

donde:

- `site_id` identifica una sede operativa elegible;
- `operational_role_code` pertenece exactamente al catálogo canónico de doce roles;
- la relación declara elegibilidad territorial a nivel de sede;
- una misma pareja no puede existir de forma ambigua o duplicada.

No forman parte de la identidad site-level:

- `area_id`;
- `area_kind`;
- `employee_id`;
- `shift_id`;
- `permission_key`;
- `is_default`;
- nombre visible de la sede;
- etiqueta visible del rol;
- familia funcional;
- punto físico de check-in o checkout.

Una etiqueta o nombre visible no sustituye ninguno de los dos identificadores estables.

---

#### 4. Universo de sedes operativas elegibles

Una sede solo puede participar en esta matriz cuando:

1. existe en el catálogo canónico de sedes;
2. está activa;
3. es utilizable como sede operativa o laboral;
4. no es un punto físico usado únicamente para marcación;
5. no es un entorno aislado de revisión;
6. no está oculta de la operación;
7. su identidad es resoluble de forma inequívoca.

El corte remoto vigente contiene exactamente cinco sedes que satisfacen la proyección operativa actualmente utilizada por VISO:

| Código de sede | Sede | Tipo contractual observado |
| --- | --- | --- |
| `CENTRO_PROD` | Centro de Producción | `production_center` |
| `MOLKA_PRINCIPAL` | Molka | `satellite` |
| `SAUDO` | Saudo | `satellite` |
| `VENTO_CAFE` | Vento Café | `satellite` |
| `VENTO_GROUP` | Vento Group | `admin` |

El baseline actual excluye expresamente:

| Código | Motivo de exclusión |
| --- | --- |
| `APP-REVIEW` | Entorno aislado de revisión; no es sede laboral operativa ordinaria. |
| `pickup_camioneta_principal` | Punto físico de marcación; no define la sede operativa ni concede territorio. |

La proyección física `viso_operational_sites` filtra actualmente por sede activa y `operational_visibility = operational`. Esa vista es evidencia AS-IS compatible con este corte, no una autorización para que una futura clasificación desconocida se convierta automáticamente en sede elegible.

Una nueva sede futura deberá primero ser una sede operativa válida según el catálogo y su gobierno antes de poder recibir relaciones rol × sede.

---

#### 5. Matriz inicial de roles permitidos por sede

El baseline documental adopta exclusivamente las dieciséis relaciones activas y únicas observadas en el corte remoto porque:

- todas pertenecen a las cinco sedes operativas elegibles;
- todas utilizan uno de los doce `OperationalRoleCode`;
- cubren los doce roles canónicos;
- no contienen duplicados site-level;
- son coherentes con las familias y funciones operativas ya aprobadas;
- no requieren inferir nuevas relaciones.

La matriz queda:

| Sede | Roles operativos permitidos | Cantidad |
| --- | --- | ---: |
| `CENTRO_PROD` — Centro de Producción | `bodeguero`; `conductor_logistica`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria` | 5 |
| `MOLKA_PRINCIPAL` — Molka | `operador_integral_satelite` | 1 |
| `SAUDO` — Saudo | `barista_satelite`; `cajero_satelite`; `cocinero_satelite`; `servicio_salon` | 4 |
| `VENTO_CAFE` — Vento Café | `barista_satelite`; `cajero_satelite`; `cocinero_satelite`; `mostrador_satelite`; `servicio_salon` | 5 |
| `VENTO_GROUP` — Vento Group | `gerencia_operativa` | 1 |
| **Total** | **12 roles canónicos cubiertos** | **16** |

No se agrega ninguna relación adicional por semejanza de nombre, tipo de sede, familia funcional, uso histórico o conveniencia de interfaz.

---

#### 6. Invariantes cuantitativos del baseline

La proyección site-level inicial queda cerrada con:

```text
sedes operativas elegibles = 5
relaciones activas rol × sede = 16
relaciones únicas rol × sede = 16
roles operativos cubiertos = 12 de 12
duplicados rol × sede = 0
sedes operativas sin rol permitido = 0
relaciones fuera del universo de sedes elegibles = 0
```

Estos conteos representan el baseline documental de esta tarea.

No son una regla que obligue a conservar para siempre cinco sedes o dieciséis relaciones. Una evolución futura deberá modificar explícitamente la configuración canónica aplicable y conservar trazabilidad; nunca se inferirá automáticamente desde `site_type`, familia de rol o una nueva fila física.

---

#### 7. Reglas por familia y sede

##### 7.1 Operación satélite

Los roles de familia satélite no se habilitan automáticamente en todas las sedes `satellite`.

Cada relación debe existir explícitamente.

Por tanto:

```text
site_type = satellite
≠
todos los roles satélite permitidos
```

El baseline distingue:

- Molka mediante `operador_integral_satelite`;
- Saudo mediante cuatro roles explícitos;
- Vento Café mediante cinco roles explícitos.

`operador_integral_satelite` no es la unión automática de los demás roles y no convierte una sede pequeña en una superficie de privilegio amplio.

##### 7.2 Producción

Los roles `produccion_cocina`, `produccion_panaderia` y `produccion_reposteria` están permitidos por sede únicamente en `CENTRO_PROD` dentro del baseline.

La especialidad de área permanece separada y será gobernada por `VISO-AUTH-006`.

##### 7.3 Logística

`bodeguero` y `conductor_logistica` están permitidos por sede en `CENTRO_PROD` dentro del baseline.

La relación de `conductor_logistica` con Centro de Producción no convierte sus puntos físicos de entrada o salida en sedes operativas, ni le concede operación organizacional global.

##### 7.4 Coordinación

`gerencia_operativa` está permitida por sede en `VENTO_GROUP` dentro del baseline.

Ese rol continúa sin ser:

- rol base;
- administrador global;
- bypass;
- wildcard;
- sustituto de `gerente` o `gerente_general`.

Una relación futura con otra sede requeriría una configuración explícita; no se hereda por la familia `gerencia`.

---

#### 8. Relación entre sede y área

Esta tarea define únicamente el nivel de sede.

La dependencia hacia `VISO-AUTH-006` queda:

```text
ROL PERMITIDO EN ÁREA
→ requiere
ROL PERMITIDO EN LA SEDE PADRE
```

Por tanto:

```text
area_id válido
+
rol permitido en área
+
rol NO permitido en sede
→ configuración inválida
```

Una relación site-level no demuestra, por sí sola, que el rol pueda operar en cualquier área de la sede.

Para roles que normalmente requieren área, la relación por sede es solo el dominio padre sobre el cual `VISO-AUTH-006` podrá definir compatibilidad más específica.

Para roles que pueden operar site-wide, la ausencia de `area_id` no significa organización completa ni todas las sedes.

---

#### 9. `is_default` no es autoridad site-level

La elegibilidad rol × sede no define un rol predeterminado para todos los trabajadores de la sede.

El estado físico actual contiene `is_default`, pero su unicidad vigente está asociada a sede + área y no a la pareja lógica site-level de esta tarea.

Por tanto:

```text
rol permitido en sede
≠ rol default de la sede
≠ rol default del trabajador
≠ rol del turno
```

`VISO-AUTH-005` no asigna semántica contractual nueva a `is_default`.

La selección predeterminada y la asignación efectiva deberán permanecer en las tareas de área, perfil y turno que correspondan, sin convertir un default de interfaz en autorización.

---

#### 10. Efecto de una relación activa o inactiva

Una relación activa rol × sede significa únicamente que el rol es elegible para ser usado en esa sede dentro de una configuración operativa válida.

Una relación inactiva no podrá utilizarse para crear una nueva asignación operativa que dependa de esa elegibilidad.

Cambiar la disponibilidad no autoriza a reescribir silenciosamente:

- turnos históricos;
- asistencia histórica;
- eventos auditados;
- decisiones de autorización históricas.

Los turnos abiertos, futuros o todavía no ejecutados que queden incompatibles deberán ser revalidados por las tareas de turno y compatibilidad correspondientes; esta tarea no define cancelación automática ni mutación retroactiva.

---

#### 11. Validación de una mutación administrativa

Una modificación de la matriz site-level solo puede considerarse válida cuando:

1. el `site_id` existe;
2. la sede está activa y es operativamente elegible;
3. la sede no es APP-REVIEW, punto exclusivo de marcación, superficie técnica aislada ni registro oculto para operación;
4. el rol pertenece a los doce `OperationalRoleCode`;
5. el rol está vigente;
6. no se usa `propietario_admin`;
7. no se usa un rol base ni oficio legacy;
8. no existe una relación duplicada para la misma pareja rol × sede;
9. el cambio no modifica permisos del rol;
10. el cambio no crea una relación de área;
11. el actor administrativo tiene autoridad explícita y territorio suficiente;
12. el servidor revalida la sede y el rol, sin confiar en valores del cliente;
13. la mutación puede conservar trazabilidad;
14. cualquier contradicción con el catálogo o el territorio falla cerrada.

No se habilitan roles por prefijo, familia, tipo de sede o coincidencia de etiquetas.

---

#### 12. Autoridad administrativa y territorio del administrador

La relación rol × sede es configuración de seguridad operacional.

Su administración debe cumplir simultáneamente:

```text
CAPACIDAD ADMINISTRATIVA EXPLÍCITA
+
ACTOR ADMINISTRATIVO VÁLIDO
+
SEDE OBJETIVO DENTRO DE SU COBERTURA
+
VALIDACIÓN EN SERVIDOR
→ MUTACIÓN POSIBLE
```

El rol base `gerente` no concede administración global por su nombre.

La cobertura del administrador y la sede objetivo deberán resolverse antes de escribir.

El catálogo vigente no contiene una clave específica dedicada a “administrar roles permitidos por sede”. Esta tarea no inventa una.

La vinculación definitiva de estas mutaciones a una capacidad administrativa canónica y a su segregación pertenece a `VISO-AUTH-019 — Restringir quién administra seguridad`.

Condición exacta de salida de ese carryover:

```text
la implementación física no podrá habilitar mutaciones site-role
hasta que cada escritura tenga
capacidad administrativa explícita
+
territorio del actor validado
+
autorización de servidor
+
auditoría
```

La ausencia de esa vinculación no bloquea la definición documental de la matriz, pero sí bloquea declarar conforme una futura superficie física de escritura.

---

#### 13. Consumo por planificación y turnos

La matriz por sede es un prerrequisito de elegibilidad para la programación operativa.

`VISO-AUTH-010` solo podrá asignar un rol operativo a un turno cuando:

1. la sede del turno sea operativa y válida;
2. exista una relación activa rol × sede;
3. si el rol requiere área, exista además compatibilidad de área definida por `VISO-AUTH-006`;
4. el trabajador sea elegible para la sede;
5. se satisfagan las demás condiciones de planificación.

La relación rol × sede no asigna el rol al trabajador.

`VISO-AUTH-011` y `VISO-AUTH-012` deberán detectar turnos sin rol o incompatibles con la configuración territorial vigente, sin reinterpretar esta matriz como permiso.

---

#### 14. Reconciliación AS-IS de Supabase

El corte remoto read-only observado contiene:

```text
public.site_operational_roles
filas activas = 16
filas inactivas = 0
pares site_id + role_code únicos = 16
roles cubiertos = 12
sedes operativas cubiertas = 5 de 5
filas fuera de sedes operativas = 0
```

La tabla física combina actualmente:

```text
site_id
area_id opcional
role_code
is_default
is_active
```

y posee índices de unicidad tanto para sede + área + rol como para sede + rol.

Esta tarea canonicaliza únicamente la relación site-level:

```text
site_id + operational_role_code
```

No convierte el shape físico actual, el índice site + role, el campo `area_id` ni la semántica de `is_default` en contrato de esta tarea.

La materialización de `VISO-AUTH-006` deberá reconciliar el nivel área sin depender de una restricción física accidental que impida representar el contrato aprobado.

---

#### 15. Reconciliación AS-IS de catálogo y RPC

El runtime observado todavía presenta una diferencia entre catálogo físico y catálogo canónico:

```text
vento_operational_roles_v1 = 13 roles activos
OperationalRoleCode canónico = 12 roles
diferencia legacy = propietario_admin
```

`propietario_admin` permanece excluido de esta tarea aunque la vista física lo muestre.

La RPC observada:

```text
upsert_site_operational_role(uuid, uuid, text, boolean, boolean)
```

valida que:

- exista `site_id`;
- el rol físico exista y esté activo;
- un `area_id` indicado pertenezca a la sede;
- el default sea único en la combinación física correspondiente.

Sin embargo, el corte observado no demuestra dentro de esa función:

- pertenencia al catálogo canónico de doce roles;
- elegibilidad operacional de la sede;
- exclusión de APP-REVIEW o puntos de marcación;
- capacidad administrativa exacta del actor;
- límite territorial del administrador.

Además, la función es `SECURITY DEFINER` y el rol `authenticated` conserva permiso de ejecución en el corte observado.

Por tanto, esa RPC es evidencia AS-IS y no autoridad TO-BE para esta tarea.

---

#### 16. Reconciliación AS-IS de seguridad y VISO

La política RLS observada para administrar `site_operational_roles` permite actualmente la operación a condiciones nominales de owner, global manager o manager.

Eso no demuestra todavía el requisito canónico de:

```text
capacidad administrativa explícita
+
territorio autorizado del actor
```

La superficie actual de VISO `/operations/site-roles`:

- carga `viso_operational_sites`;
- carga `vento_operational_roles_v1`;
- carga `vento_site_operational_role_matrix_v1`;
- crea mediante `upsert_site_operational_role`;
- actualiza y elimina directamente sobre `site_operational_roles`;
- usa `requireAppAccess` para acceso general a VISO.

La superficie es evidencia funcional existente.

No se declara conforme a este contrato por su sola existencia porque todavía deberá demostrar:

- exclusión contractual de `propietario_admin`;
- validación explícita de autoridad administrativa;
- límite territorial por escritura;
- separación entre nivel sede y nivel área;
- coherencia de create, update y delete;
- fallo cerrado equivalente entre UI, Server Action, RPC y RLS.

Los propietarios documentales de la restricción administrativa permanecen en `VISO-AUTH-019`; las protecciones de escritura y territorio permanecen además en las tareas canónicas de servidor y base de datos ya existentes.

---

#### 17. Fallo cerrado

La administración deberá rechazar o bloquear:

| Caso | Resultado |
| --- | --- |
| Sede inexistente | Rechazar |
| Sede inactiva | Rechazar |
| APP-REVIEW | Rechazar como sede operativa ordinaria |
| Punto exclusivo de check-in o checkout | Rechazar como sede operativa |
| Sede oculta o no operativa | Rechazar |
| Rol desconocido o inactivo | Rechazar |
| `propietario_admin` | Rechazar |
| Rol base u oficio legacy | Rechazar |
| Par rol × sede duplicado o ambiguo | Rechazar |
| Inferencia automática por familia o `site_type` | Rechazar |
| Área que intenta introducir un rol no permitido en la sede | Rechazar |
| Actor sin capacidad administrativa explícita | Rechazar |
| Sede objetivo fuera de la cobertura del administrador | Rechazar |
| Cliente que envía una sede o rol no revalidado | Rechazar |
| Auditoría o trazabilidad requerida no persistible | No guardar |
| Discrepancia entre UI y servidor | Prevalece servidor; no guardar |
| Versión contractual incompatible | Rechazar |

---

#### 18. Handoff contractual hacia VISO-AUTH-006

`VISO-AUTH-006` recibe un dominio padre cerrado:

```text
5 sedes operativas elegibles en el baseline
+
16 relaciones site-level activas y únicas
+
12 OperationalRoleCode cubiertos
+
0 pares inferidos
+
0 relaciones fuera del universo operativo
```

La tarea siguiente deberá administrar compatibilidad por área sin alterar la matriz site-level definida aquí.

Reglas de handoff:

1. toda relación de área debe tener una relación site-level padre válida;
2. un área no puede habilitar un rol que la sede no permite;
3. `area_id = null` no significa todas las áreas ni todas las sedes;
4. la existencia de un rol site-wide debe conservar una semántica explícita y no global;
5. los defaults físicos actuales no se interpretan como autorización;
6. la identidad de los doce roles permanece intacta;
7. los 240 grants de `VISO-AUTH-004` permanecen intactos.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea concreta en VISO reglas de elegibilidad territorial, administración explícita, compatibilidad de sede, catálogo operativo y fallo cerrado que ya están protegidas por requisitos vigentes. No introduce una nueva identidad de rol, una nueva identidad de sede, una modalidad de autorización, un scope contractual ni una regla empresarial adicional que requiera ampliar el registro.

---

#### 20. Cobertura de prueba vigente reutilizada

Sin modificar el registro, esta tarea reutiliza la cobertura vigente:

- `TREQ-AUTH-001` — un nombre o lista de roles no concede autorización final;
- `TREQ-AUTH-004` — todos los evaluadores deben producir decisiones coherentes para el mismo contexto;
- `TREQ-AUTH-007` — administración de roles operativos y disponibilidad por sede o área exige capacidad administrativa explícita y territorio autorizado;
- `TREQ-AUTH-008` — operación exige contexto válido y compatibilidad de sede y área;
- `TREQ-AUTH-009` — la sede y el área efectivas deben resolverse determinísticamente y los cruces territoriales se deniegan;
- `TREQ-AUTH-010` — las matrices operativas preservan segregación de funciones;
- `TREQ-SHELL-041` — el catálogo operativo conserva exactamente doce roles y excluye `propietario_admin`;
- `TREQ-VISO-001` — la configuración administrativa de VISO debe producir el mismo resultado consumido por las aplicaciones operativas.

Esta trazabilidad no cambia estado, contenido, paquete, evidencia ni secuencia de ningún requisito.

---

#### 21. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La definición documental no ejecutó build del checkout propietario. |
| LOCAL | NOT_EXECUTED | La tarea aún no fue insertada ni validada dentro de la rama documental local. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, topología, políticas, VISO-AUTH-002/004, modelo territorial, catálogo de roles, catálogo de permisos, VISO `/operations/site-roles` y el corte read-only de sedes, matriz site-role, RPC, RLS y catálogo operativo en Supabase. |
| OPERATIVA | NOT_APPLICABLE | No se modifican relaciones site-role, trabajadores, turnos, permisos efectivos ni operación real durante este cierre documental. |
| FÍSICA | NOT_EXECUTED | No se modificaron VISO, Supabase, `site_operational_roles`, RPC, RLS, contratos, migraciones ni datos. |

---

#### 22. Criterios de aceptación

- [ ] La relación site-level se identifica por `site_id + operational_role_code`.
- [ ] Se administran exclusivamente los doce `OperationalRoleCode` canónicos.
- [ ] `propietario_admin`, roles base y oficios legacy quedan excluidos.
- [ ] El baseline contiene exactamente cinco sedes operativas elegibles.
- [ ] APP-REVIEW y el punto de marcación observado quedan fuera del universo de sedes operativas ordinarias.
- [ ] El baseline contiene exactamente dieciséis pares activos y únicos rol × sede.
- [ ] Los dieciséis pares cubren los doce roles canónicos.
- [ ] Las cinco sedes operativas del baseline tienen al menos un rol permitido.
- [ ] No existe ninguna relación del baseline fuera del universo de sedes operativas.
- [ ] `CENTRO_PROD` conserva cinco roles; `MOLKA_PRINCIPAL` uno; `SAUDO` cuatro; `VENTO_CAFE` cinco; `VENTO_GROUP` uno.
- [ ] Ningún rol se habilita automáticamente por familia o `site_type`.
- [ ] `operador_integral_satelite` no se convierte en unión automática de roles.
- [ ] `gerencia_operativa` no se convierte en administrador global ni bypass.
- [ ] La relación de `conductor_logistica` no convierte un punto de check-in en sede operativa.
- [ ] Una relación site-level no concede permisos.
- [ ] Una relación site-level no asigna trabajadores.
- [ ] Una relación site-level no asigna el rol efectivo de un turno.
- [ ] Una relación de área futura exige una relación site-level padre válida.
- [ ] `is_default` no adquiere autoridad site-level en esta tarea.
- [ ] La mutación exige autoridad administrativa explícita y territorio suficiente.
- [ ] La ausencia actual de una clave dedicada a esta administración no produce una clave inventada.
- [ ] `VISO-AUTH-019` conserva la propiedad de vincular las mutaciones a la autoridad administrativa canónica antes de habilitar escritura conforme.
- [ ] La RPC y RLS AS-IS no se declaran conformes por su sola existencia.
- [ ] La pantalla `/operations/site-roles` no se declara implementación canónica completa por su sola existencia.
- [ ] `VISO-AUTH-006` recibe exactamente el dominio site-level y no puede ampliarlo por inferencia.
- [ ] La materialización física permanece detrás de `POST_E5_PACKAGE`.
- [ ] Se conservan cero cambios al Registro Canónico de Requisitos de Prueba.

---

#### 23. Límites

Esta tarea no:

- modifica código de VISO;
- modifica `/operations/site-roles`;
- modifica `/operations/preview`;
- modifica `@vento/contracts`;
- modifica `operational-roles.json`;
- modifica `operational-role-grants@1.0.0`;
- modifica `public.sites`;
- modifica `public.operational_roles`;
- modifica `public.site_operational_roles`;
- modifica `public.vento_operational_roles_v1`;
- modifica `public.vento_site_operational_role_matrix_v1`;
- modifica `public.upsert_site_operational_role`;
- modifica RLS, RPC, triggers o grants PostgreSQL;
- crea migraciones;
- ejecuta SQL de escritura;
- crea roles operativos;
- crea sedes;
- crea permisos;
- crea scopes;
- administra grants operativos;
- administra roles permitidos por área;
- administra perfiles operativos por trabajador;
- asigna sedes o áreas a trabajadores;
- asigna roles a turnos;
- crea excepciones individuales;
- crea denegaciones;
- ejecuta simulaciones;
- define quién administra seguridad fuera del carryover reservado a `VISO-AUTH-019`;
- selecciona package;
- prepara o aprueba package gate;
- autoriza ni ejecuta implementación física.

La identidad exacta de la futura unidad física se resolverá únicamente mediante el package y gate aplicables.

---

#### 24. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-AUTH-004 — Administrar permisos por rol operativo`

**TAREA ACTUAL APROBADA**
`VISO-AUTH-005 — Administrar roles permitidos por sede`

**SIGUIENTE TAREA RESERVADA**
`VISO-AUTH-006 — Administrar roles permitidos por área`


### [ ] VISO-AUTH-006 — Administrar roles permitidos por área
### [ ] VISO-AUTH-007 — Administrar perfiles operativos por trabajador
### [ ] VISO-AUTH-008 — Administrar sedes asignadas
### [ ] VISO-AUTH-009 — Administrar áreas asignadas
### [ ] VISO-AUTH-010 — Asignar rol operativo al turno
### [ ] VISO-AUTH-011 — Validar turnos sin rol operativo
### [ ] VISO-AUTH-012 — Validar turnos con área incompatible
### [ ] VISO-AUTH-013 — Crear vista previa trabajador × sede × área × turno
### [ ] VISO-AUTH-014 — Crear simulador de permisos efectivos
### [ ] VISO-AUTH-015 — Mostrar origen de cada permiso
### [ ] VISO-AUTH-016 — Mostrar conflictos de configuración
### [ ] VISO-AUTH-017 — Administrar excepciones individuales
### [ ] VISO-AUTH-018 — Auditar cambios de seguridad
### [ ] VISO-AUTH-019 — Restringir quién administra seguridad
### [ ] VISO-AUTH-020 — Crear exporte de matriz de acceso

SUBBLOQUE G2 — VISO Core

VISO Core deberá implementarse antes o en paralelo con las aplicaciones
operativas porque administra el modelo que estas consumen.

VISO Core no crea un segundo catálogo de funciones administrativas.

Su alcance funcional está compuesto por las tareas:

VISO-AUTH-001 a VISO-AUTH-020

Estas tareas cubren:

trabajadores;
roles base;
roles operativos;
sedes;
áreas;
perfiles operativos;
turnos;
permisos;
excepciones;
simulación;
conflictos;
auditoría.

Las tareas VISO-CORE controlan únicamente el corte mínimo,
la priorización y la aprobación del habilitador.
