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


### [ ] VISO-AUTH-002 — Crear catálogo administrativo de roles operativos
### [ ] VISO-AUTH-003 — Administrar permisos por rol base
### [ ] VISO-AUTH-004 — Administrar permisos por rol operativo
### [ ] VISO-AUTH-005 — Administrar roles permitidos por sede
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
