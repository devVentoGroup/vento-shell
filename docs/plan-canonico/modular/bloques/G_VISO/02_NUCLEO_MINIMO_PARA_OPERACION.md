### MINI-BLOQUE — NÚCLEO MÍNIMO PARA OPERACIÓN

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `VISO-CORE-001` a `VISO-CORE-006` — 6 tareas.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B601-800:VISO-CORE -->
### Reconciliación topológica de VISO-CORE-001 a VISO-CORE-006

La familia es mixta: `VISO-CORE-001`, `VISO-CORE-002` y `VISO-CORE-006` definen, vinculan y aprueban el corte mínimo; `VISO-CORE-003..005` materializan dependencias, autorización, conflictos y auditoría.

| Tareas | Modalidad | Gate |
| --- | --- | --- |
| `VISO-CORE-001`, `VISO-CORE-002`, `VISO-CORE-006` | `DEFINE_ONCE` | `NO_PHYSICAL_INSTANCE` |
| `VISO-CORE-003..005` | `PER_IMPLEMENTATION_UNIT` | `POST_E5_PACKAGE` |

### ✅ VISO-CORE-001 — Definir núcleo mínimo de VISO

**Estado:** APROBADA
**Tarea anterior:** VISO-AUTH-020 — Crear exporte de matriz de acceso
**Tarea siguiente:** VISO-CORE-002 — Vincular núcleo con capacidades empresariales
**Tipo de tarea:** documental; definición única del corte funcional mínimo de VISO necesario para gobernar hechos administrativos transversales consumidos por las aplicaciones operativas, preservando fuentes canónicas, autorización, territorio, contexto y trazabilidad sin convertir VISO en propietario de la operación ajena ni materializar todavía dependencias, controles o superficies físicas
**Bloque:** `G_VISO — NÚCLEO MÍNIMO PARA OPERACIÓN`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/02_NUCLEO_MINIMO_PARA_OPERACION.md`
**Estado físico resultante:** corte funcional mínimo definido una sola vez; sin instancia física propia
**Cambios físicos autorizados:** ninguno; `VISO-CORE-001` es `DEFINE_ONCE` con `NO_PHYSICAL_INSTANCE` y reserva toda materialización a `VISO-CORE-003`, `VISO-CORE-004` y `VISO-CORE-005` bajo sus gates aplicables
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir qué debe pertenecer obligatoriamente al núcleo mínimo de VISO para que el ecosistema Vento OS pueda administrar personas, territorio, roles, permisos y contexto de forma coherente antes de ampliar VISO hacia dominios administrativos secundarios.

La tarea fija el corte.

No implementa ese corte.

La regla raíz queda:

```text
HECHOS ADMINISTRATIVOS TRANSVERSALES
+
FUENTES CANÓNICAS YA DEFINIDAS
+
CONTEXTO Y AUTORIZACIÓN COHERENTES
+
CAPACIDAD DE SER CONSUMIDOS POR APLICACIONES OPERATIVAS
→
NÚCLEO MÍNIMO DE VISO
```

Y nunca:

```text
TODO LO QUE HOY EXISTE EN VISO
→
NÚCLEO MÍNIMO
```

---

#### 2. Naturaleza del núcleo

El núcleo mínimo es una frontera funcional.

Define el conjunto más pequeño de capacidades administrativas que debe existir de manera coherente para que las aplicaciones consumidoras no necesiten mantener copias locales de:

- trabajadores;
- sedes;
- áreas;
- roles;
- asignaciones;
- perfiles;
- permisos;
- contexto efectivo;
- explicación de autoridad;
- controles administrativos de seguridad.

No define todavía rutas, componentes, tablas, RPC, RLS, migraciones ni despliegues.

---

#### 3. Principio de minimización

Una capacidad entra al núcleo solo cuando su ausencia obligaría a una aplicación consumidora a:

- inventar autoridad;
- mantener un catálogo competidor;
- inferir territorio;
- inferir rol;
- inferir contexto;
- duplicar una configuración transversal;
- operar sin trazabilidad suficiente.

Una función administrativa útil pero no necesaria para esas condiciones queda fuera del corte mínimo.

---

#### 4. Prueba de inclusión

Una responsabilidad pertenece al núcleo mínimo cuando cumple simultáneamente:

1. gobierna un hecho transversal consumido por más de una superficie o aplicación, o necesario para la autorización transversal;
2. tiene una fuente o contrato canónico reconocido;
3. su ausencia produciría ambigüedad de identidad, territorio, rol, permiso o contexto;
4. VISO puede administrarla sin apropiarse del proceso operativo de otra aplicación;
5. puede vincularse posteriormente con capacidades empresariales en `VISO-CORE-002`;
6. su materialización puede asignarse sin ambigüedad a `VISO-CORE-003`, `VISO-CORE-004` o `VISO-CORE-005`.

Si una condición falla, la responsabilidad no se incorpora automáticamente al núcleo.

---

#### 5. Prueba de exclusión

Una responsabilidad queda fuera del núcleo cuando:

- pertenece a la operación propietaria de otra aplicación;
- es una conveniencia de navegación;
- es una función comercial o de contenido específica;
- es analítica no indispensable para decidir autoridad;
- es una experiencia avanzada reservada a `VISO-UX-*`;
- pertenece a un servicio transversal con propietario propio;
- depende de una decisión todavía no aprobada y puede diferirse sin romper identidad, territorio o autorización;
- existe únicamente porque una pantalla AS-IS la contiene.

---

#### 6. Frontera de VISO

VISO administra el modelo.

No reemplaza la ejecución propietaria de:

- NEXO;
- FOGO;
- ORIGO;
- PULSO;
- NUMERA;
- PASS;
- ANIMA;
- SHELL;
- TALENTO;
- AURA.

El núcleo puede gobernar datos o reglas transversales que esas aplicaciones consumen.

No replica sus procesos operativos.

---

#### 7. Entrada recibida del gobierno de acceso

`VISO-AUTH-001` a `VISO-AUTH-020` dejan definido documentalmente el plano administrativo de acceso y seguridad.

Ese plano constituye una entrada del núcleo.

El núcleo no reabre sus decisiones.

---

#### 8. Entrada recibida de VISO-AUTH-020

El exporte de matriz de acceso tiene contrato documental definido.

Su capacidad canónica exacta de exportación no está disponible todavía en el catálogo activo verificado por la tarea precedente.

Por tanto:

```text
CONTRATO DE EXPORTE
→ PUEDE FORMAR PARTE DEL PLANO DE SEGURIDAD DEL NÚCLEO

MATERIALIZACIÓN DEL EXPORTE
→ NO PUEDE DECLARARSE DISPONIBLE
```

La falta de esa capacidad no bloquea la definición del resto del núcleo.

---

#### 9. Entrada de organización y territorio

La estructura organizacional canónica distingue conceptos empresariales, legales y territoriales.

Para el núcleo mínimo, VISO necesita como mínimo las referencias administrativas necesarias para:

- organización;
- sede operativa;
- área organizacional;
- estado y vigencia;
- relaciones territoriales aplicables.

No necesita absorber toda la gestión jurídica, comercial o registral de la organización.

---

#### 10. Entrada de personas y trabajo

El núcleo necesita identificar al trabajador y su relación laboral vigente cuando esa identidad participa en:

- asignaciones;
- roles;
- perfiles;
- permisos;
- contexto;
- auditoría.

No convierte VISO en sistema propietario de selección, candidatura o expediente integral de TALENTO.

---

#### 11. Identidad del trabajador

La identidad laboral utilizada por el núcleo debe ser canónica y estable.

No se identifica a un trabajador mediante:

- nombre visible;
- alias;
- correo;
- rol;
- sede;
- dispositivo.

Esos valores pueden ser atributos o relaciones.

No son la identidad raíz.

---

#### 12. Estado laboral

El núcleo debe poder distinguir si la relación necesaria para administrar autoridad está vigente o no.

Una persona existente no implica una relación laboral autorizable vigente.

Un vínculo terminado no conserva autoridad por inercia.

---

#### 13. Organización

La referencia organizacional delimita el paraguas administrativo aplicable.

No equivale automáticamente a:

- titular jurídico;
- marca;
- sede;
- centro de costo;
- alcance de permiso.

---

#### 14. Sede

La sede operativa es una dimensión territorial fundamental del núcleo.

Debe poder utilizarse para:

- asignación laboral;
- cobertura administrativa;
- elegibilidad de rol operativo;
- contexto;
- autorización;
- auditoría.

El nombre de la sede no concede capacidades.

---

#### 15. Área

El área es una dimensión territorial y funcional subordinada al modelo aprobado.

No puede convertirse por sí sola en permiso, rol o capacidad.

Valores agregados o legacy no adquieren semántica empresarial por conveniencia.

---

#### 16. Rol base

El núcleo incluye la proyección administrativa del catálogo de roles base ya aprobado.

La existencia de un rol base permite describir responsabilidad permanente.

No concede autoridad final por nombre.

---

#### 17. Rol operativo

El núcleo incluye la proyección administrativa del catálogo de roles operativos.

El rol operativo permanece separado de:

- rol base;
- perfil;
- sede;
- área;
- turno;
- permiso;
- autorización efectiva.

---

#### 18. Matriz de permisos base

El núcleo incluye la capacidad contractual de consultar y gobernar la relación entre rol base y permisos base según el catálogo vigente.

No crea un catálogo local de permisos.

No admite wildcards por nombre de rol.

---

#### 19. Matriz de permisos operativos

El núcleo incluye la capacidad contractual de consultar y gobernar la relación entre rol operativo y permisos operativos.

BASE y OPERATIONAL permanecen separados.

---

#### 20. Elegibilidad de rol por sede

El núcleo incluye la matriz de elegibilidad entre roles operativos y sedes.

Elegibilidad significa que el rol puede utilizarse en esa sede cuando el resto del contexto lo permite.

No equivale a asignación de trabajador ni a autorización efectiva.

---

#### 21. Elegibilidad de rol por área

El núcleo incluye la matriz de elegibilidad entre roles operativos y áreas.

Debe permanecer coherente con la sede correspondiente.

No amplía cobertura por sí sola.

---

#### 22. Asignaciones de sede

El núcleo incluye las asignaciones trabajador × sede necesarias para determinar cobertura laboral y administrativa.

Una selección visual no sustituye una asignación válida.

---

#### 23. Asignaciones de área

El núcleo incluye las asignaciones trabajador × área necesarias para delimitar contexto y compatibilidad funcional.

Área primaria, área habitual o propósito no se convierten automáticamente en autoridad.

---

#### 24. Perfil operativo

El núcleo incluye los perfiles operativos predeterminados de un trabajador cuando sirven para planificación administrativa.

El perfil permanece como configuración.

No es rol efectivo.

No es permiso.

---

#### 25. Contexto efectivo

El núcleo debe poder consumir un contexto real suficiente para que una capacidad protegida pueda resolver:

- principal;
- actor efectivo;
- rol base;
- rol operativo cuando aplique;
- sede;
- área;
- turno cuando aplique;
- check-in cuando aplique;
- dispositivo cuando aplique;
- permiso;
- recurso.

La composición exacta depende del contrato de la capacidad evaluada.

---

#### 26. Administración versus operación

Las capacidades administrativas que no requieren turno ni check-in no deben fabricarlos.

Las capacidades operativas que sí los requieren no pueden omitirlos.

El núcleo debe conservar esa diferencia.

---

#### 27. Turno como dependencia de contexto

Un turno puede ser necesario para resolver contexto operativo.

Eso no convierte todo el módulo de programación laboral en parte obligatoria del corte mínimo.

El núcleo requiere una fuente de turno compatible cuando la autorización lo necesite.

---

#### 28. Fuente actual de programación

Mientras la transición correspondiente no cambie la autoridad, `employee_shifts` permanece como fuente actual declarada por el bloque G.

Esta tarea no cambia su esquema, lifecycle ni semántica.

---

#### 29. Delta de programación laboral

`VISO-SCH-001` a `VISO-SCH-008` permanecen en su carril contractual propio.

El núcleo mínimo no decide:

- horizonte mensual;
- límite mensual;
- bloques;
- publicación;
- correcciones;
- excepciones;
- UX de programación.

---

#### 30. Dependencia condicionada de VISO-SCH-008

`VISO-CORE-003` consume `VISO-SCH-008` cuando la materialización del núcleo incluya la programación laboral afectada por ese delta.

`VISO-CORE-001` no activa ese delta.

Tampoco declara cumplida esa dependencia.

---

#### 31. Vista previa

El núcleo incluye el contrato de vista previa trabajador × sede × área × turno ya aprobado.

La vista previa permite inspeccionar una configuración propuesta.

No persiste autoridad.

---

#### 32. Simulación fuera del piso mínimo

El contrato de simulación aprobado se conserva disponible para diagnóstico y administración avanzada.

No forma parte del piso mínimo requerido para que VISO administre identidad, territorio, roles, permisos y contexto real.

Su exclusión del piso mínimo no permite mezclar resultados simulados con autoridad real ni reabre `VISO-AUTH-014`.

---

#### 33. Procedencia

El núcleo incluye la capacidad de explicar el origen de una decisión de acceso.

La explicación debe conservar las fuentes canónicas de concesión y denegación.

No crea un evaluador alterno.

---

#### 34. Conflictos de configuración

El núcleo requiere detectar configuraciones contradictorias que impidan determinar un estado administrativo confiable.

La taxonomía y materialización de esos controles quedan reservadas a `VISO-CORE-005`.

Esta tarea únicamente determina que la capacidad es parte necesaria del corte.

---

#### 35. Excepciones individuales

El núcleo incluye el contrato de excepciones individuales ya aprobado.

Una excepción permanece:

- explícita;
- acotada;
- vigente;
- auditable;
- subordinada a denegaciones superiores aplicables.

---

#### 36. Auditoría de seguridad

El núcleo incluye consulta administrativa de la evidencia necesaria para reconstruir cambios de seguridad.

No confunde auditoría de seguridad con auditoría operativa genérica.

La materialización pertenece a `VISO-CORE-005` cuando corresponda a la unidad aprobada.

---

#### 37. Gobierno de quién administra seguridad

El núcleo incluye las restricciones aprobadas sobre quién puede administrar grants, denies y demás acciones sensibles.

No existe administrador universal derivado del nombre del rol.

---

#### 38. Exporte fuera del piso mínimo

El contrato de exporte de matriz de acceso se conserva como handoff válido del minibloque anterior, pero no forma parte del piso mínimo requerido para poner en servicio el núcleo administrativo.

Su materialización permanece fail closed mientras falte la capacidad canónica exacta de exportación.

El núcleo no inventa una clave para resolver ese bloqueo y puede avanzar sin declarar el exporte disponible.

---

#### 39. Plano mínimo resultante

El corte funcional mínimo queda compuesto por seis dominios inseparables:

| Dominio mínimo | Contenido obligatorio | Motivo de inclusión |
| --- | --- | --- |
| Persona laboral | identidad laboral y vigencia necesaria para administración | sin sujeto canónico no existe asignación ni autoridad atribuible |
| Organización y territorio | organización, sede, área y relaciones aplicables | sin territorio no puede determinarse cobertura ni compatibilidad |
| Roles, perfiles y asignaciones | rol base, rol operativo, elegibilidad territorial, perfiles y asignaciones | evita configuraciones locales divergentes por aplicación |
| Permisos y matrices | catálogo consumido, matrices base y operativas, grants y denies gobernados | evita autoridad inferida por rol o UI |
| Contexto efectivo | composición real de actor, territorio, turno y demás prerrequisitos aplicables | conecta configuración administrativa con autorización real |
| Control y explicabilidad | preview, procedencia, conflictos, excepciones, auditoría y gobierno administrativo | permite administrar seguridad sin operar como caja negra |

Los seis dominios son obligatorios como contrato.

Su materialización física no pertenece a esta tarea.

---

#### 40. Dependencia transversal mínima

El núcleo no puede mantener copias manuales independientes de los hechos anteriores dentro de cada aplicación.

La regla es:

```text
FUENTE CANÓNICA
→ PROYECCIÓN ADMINISTRATIVA VISO
→ CONTRATO COMPARTIDO
→ CONSUMIDORES
```

No:

```text
VISO LOCAL
+
NEXO LOCAL
+
FOGO LOCAL
+
PULSO LOCAL
→
RECONCILIACIÓN MANUAL
```

---

#### 41. Fuente de verdad

Que VISO administre una configuración no significa que una pantalla de VISO sea la fuente de verdad.

La fuente pertenece al contrato o almacenamiento canónico definido para el hecho.

VISO es superficie administrativa y orquestadora dentro de sus límites.

---

#### 42. Consumo por aplicaciones operativas

Las aplicaciones consumidoras deben recibir el mismo modelo que VISO presenta para:

- identidad;
- rol;
- permiso;
- territorio;
- contexto.

No se admite un resultado administrativo que difiera del resultado operativo para las mismas entradas reales.

---

#### 43. Fallo cerrado

Si una dimensión obligatoria no puede resolverse de forma confiable, el núcleo no fabrica un valor.

Ejemplos:

```text
SIN SEDE REQUERIDA RESUELTA
→ NO INVENTAR SEDE

SIN ÁREA REQUERIDA RESUELTA
→ NO INVENTAR ÁREA

SIN ROL OPERATIVO REQUERIDO
→ NO USAR PERFIL COMO ROL

SIN PERMISO EXACTO
→ NO AUTORIZAR POR NOMBRE DE ROL
```

---

#### 44. Separación de ausencia, invalidez y conflicto

El núcleo debe preservar la diferencia entre:

- dato no aplicable;
- dato ausente;
- dato inválido;
- conflicto;
- deny;
- fallo técnico.

Esas categorías no pueden normalizarse todas a “sin acceso”.

---

#### 45. Frescura

Cambios en:

- vínculo laboral;
- rol;
- sede;
- área;
- perfil;
- turno;
- grant;
- deny;
- dispositivo;
- catálogo;

pueden cambiar autoridad.

La futura implementación deberá impedir decisiones stale según los contratos de contexto.

---

#### 46. Concurrencia

La definición del núcleo exige que las mutaciones de configuración sensibles no se diseñen como sobrescrituras silenciosas.

La implementación de concurrencia, detección de conflicto y recuperación pertenece a las tareas físicas posteriores.

---

#### 47. Auditoría proporcional

Las mutaciones y decisiones sensibles del núcleo deben ser atribuibles y correlacionables conforme a los contratos aprobados.

Esta tarea no crea tablas ni eventos.

Determina que la trazabilidad es condición de pertenencia al núcleo seguro.

---

#### 48. Seguridad server-side

Una superficie administrativa visible no constituye autorización.

Las futuras mutaciones del núcleo deberán validarse en frontera server-side.

La implementación concreta se reserva a `VISO-CORE-004`.

---

#### 49. No wildcard administrativo

Ningún rol, incluida una identidad jerárquica alta, produce permiso universal.

Toda acción protegida debe resolver la capacidad exacta y su contexto aplicable.

---

#### 50. Inventario de responsabilidades y propietario posterior

| Responsabilidad del corte | Propietario posterior dentro de VISO-CORE |
| --- | --- |
| vincular el corte con capacidades empresariales | `VISO-CORE-002` |
| materializar dependencias administrativas mínimas | `VISO-CORE-003` |
| proteger lectura y mutaciones con autorización real | `VISO-CORE-004` |
| materializar conflictos, límites y auditoría | `VISO-CORE-005` |
| aprobar el núcleo completo antes de ampliar alcance | `VISO-CORE-006` |

`VISO-CORE-001` no absorbe ninguna de esas responsabilidades.

---

#### 51. Handoff a VISO-CORE-002

`VISO-CORE-002` recibe exactamente los seis dominios mínimos definidos en esta tarea.

Debe vincularlos con capacidades empresariales canónicas.

No debe añadir una función al núcleo únicamente porque exista una pantalla AS-IS.

Tampoco debe eliminar una función obligatoria por no tener todavía una superficie física final.

---

#### 52. Handoff a VISO-CORE-003

`VISO-CORE-003` recibirá, después del vínculo funcional correspondiente, las dependencias administrativas necesarias para materializar el núcleo.

Entre ellas deberá distinguir:

- dependencias disponibles;
- dependencias condicionadas;
- dependencias bloqueadas;
- dependencias propietarias de otra fase.

La relación con `VISO-SCH-008` permanece condicionada por la topología y activación aplicables.

---

#### 53. Handoff a VISO-CORE-004

`VISO-CORE-004` será responsable de demostrar autorización real del núcleo.

Deberá proteger cada acción mediante permisos exactos o justificar documentalmente cualquier permiso común sin exceso.

Esta tarea no escoge permisos nuevos ni crea aliases.

---

#### 54. Handoff a VISO-CORE-005

`VISO-CORE-005` recibirá como condición mínima:

- conflictos;
- límites;
- concurrencia;
- auditoría;
- corrección;
- borrado de borradores cuando aplique;
- notificación cuando aplique.

`VISO-CORE-001` define que esos controles son necesarios.

No los implementa.

---

#### 55. Handoff a VISO-CORE-006

`VISO-CORE-006` solo podrá aprobar el núcleo cuando:

- el corte siga intacto;
- los vínculos de capacidades estén resueltos;
- las dependencias requeridas estén satisfechas;
- la autorización real esté demostrada;
- conflictos y auditoría estén cubiertos;
- cualquier delta incorporado al núcleo haya cerrado sus gates;
- el package aplicable esté cerrado cuando forme parte de la materialización.

---

#### 56. Funciones fuera del núcleo mínimo

Quedan fuera del corte de `VISO-CORE-001`:

- administración comercial de productos;
- menús;
- CMS;
- contenido web;
- tarifas de entrega;
- personalizaciones comerciales;
- gestión de clientes PASS;
- contabilidad propietaria de NUMERA;
- inventario propietario de NEXO;
- compras propietarias de ORIGO;
- producción propietaria de FOGO;
- operación POS propietaria de PULSO;
- ejecución de asistencia propietaria de ANIMA;
- reclutamiento y expediente integral propietario de TALENTO;
- marketing propietario de AURA;
- soporte tecnológico completo;
- gobierno de información completo;
- analítica no necesaria para resolver autoridad.

La existencia actual de superficies VISO para alguno de esos dominios no los convierte en core.

---

#### 57. VISO AS-IS no define el corte

El repositorio VISO actual contiene superficies de:

- personal;
- programación;
- permisos;
- sedes;
- operación;
- productos;
- comercio;
- contenido;
- clientes;
- auditoría.

Ese inventario sirve como evidencia de implementación existente.

No constituye la taxonomía canónica del núcleo.

---

#### 58. Superficies AS-IS relevantes

Son evidencia relevante para futuras tareas del core las superficies actuales relacionadas con:

- personal;
- permisos;
- sedes;
- perfiles operativos;
- roles por sede;
- vista previa;
- programación;
- auditoría;
- dispositivos compartidos.

Su existencia no certifica que cumplan el contrato futuro.

---

#### 59. Superficies AS-IS excluidas por propiedad

Las superficies actuales de productos, menús, CMS, categorías comerciales, colecciones, tarifas y otros dominios propietarios no se incorporan al núcleo mínimo por mera proximidad dentro del repositorio VISO.

La futura experiencia puede enlazarlas o reubicarlas según su propietario.

No forman parte de esta decisión.

---

#### 60. Dispositivos compartidos

La identidad y límites de dispositivos pueden condicionar autorización.

El ciclo físico detallado de dispositivo continúa gobernado por sus tareas específicas.

El núcleo consume el contexto cuando una decisión lo requiere.

No absorbe la implementación integral de enrolamiento, rotación o retiro.

---

#### 61. Exportación como carryover no bloqueante

El núcleo conserva la trazabilidad del contrato de exporte para gobierno y revisión, pero lo mantiene fuera del piso mínimo obligatorio.

La imposibilidad física actual de exportar no debe impedir que el núcleo:

- identifique sujetos;
- resuelva territorio;
- gestione roles;
- gestione matrices;
- determine contexto;
- aplique autorización;
- detecte conflictos;
- preserve auditoría.

El bloqueo del exporte continúa vigente como carryover y deberá resolverse por su evolución canónica antes de materializar esa capacidad.

---

#### 62. Programación no esencial para toda administración

La programación laboral no es prerrequisito para capacidades administrativas `BASE_ONLY` o no territoriales que no requieran turno.

Sí es dependencia para capacidades operativas cuyo contrato exige turno o contexto de trabajo.

El núcleo preserva ambas situaciones sin imponer una regla uniforme.

---

#### 63. No tabla paralela

Esta tarea no autoriza una tabla mensual, tabla de núcleo ni repositorio paralelo de configuración.

Las fuentes existentes y futuras deberán mantenerse bajo sus propietarios canónicos.

---

#### 64. No migración implícita

Definir que una responsabilidad pertenece al núcleo no autoriza:

- backfill;
- migración;
- normalización destructiva;
- renombrada física;
- retiro de legacy;
- cambio de RLS.

Cada cambio físico requiere su tarea y gate correspondiente.

---

#### 65. No ruta implícita

La inclusión de una responsabilidad no crea automáticamente:

- una página;
- una sección;
- una URL;
- una API;
- un endpoint.

La experiencia final pertenece a las tareas VISO-UX y la materialización física aplicable.

---

#### 66. No permiso implícito

La inclusión de una responsabilidad tampoco crea una `PermissionKey`.

Si falta una capacidad atómica necesaria, la implementación permanece bloqueada hasta la evolución canónica correspondiente.

---

#### 67. No autoridad por ownership

Que VISO sea administrador del modelo no concede a todo usuario de VISO autoridad sobre ese modelo.

La autorización administrativa sigue siendo explícita.

---

#### 68. No fusión de dominios

Los seis dominios mínimos están relacionados.

No se fusionan en una entidad única.

En particular:

```text
TRABAJADOR
≠ ROL
≠ SEDE
≠ ÁREA
≠ PERFIL
≠ PERMISO
≠ CONTEXTO
```

---

#### 69. Criterio de completitud documental

`VISO-CORE-001` queda documentalmente completo cuando:

1. existe un corte mínimo explícito;
2. cada dominio del corte tiene justificación;
3. los dominios excluidos quedan delimitados;
4. las dependencias condicionadas quedan declaradas;
5. el handoff hacia `VISO-CORE-002..006` no tiene solapamientos;
6. no se materializa infraestructura;
7. no se crea una fuente paralela;
8. no se cambian requisitos de prueba.

---

#### 70. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea define un corte funcional y no introduce una nueva regla física, de autorización, integración o experiencia que requiera alterar el Registro Canónico de Requisitos de Prueba.

---

#### 71. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, el corte reutiliza la cobertura existente de:

- `TREQ-AUTH-001` — autorización mediante permisos, contexto y alcance canónicos;
- `TREQ-AUTH-004` — equivalencia entre evaluadores;
- `TREQ-AUTH-007` — capacidad administrativa explícita y territorio;
- `TREQ-AUTH-008` — separación de prerrequisitos administrativos y operativos;
- `TREQ-AUTH-009` — resolución territorial determinista;
- `TREQ-AUTH-015` — trazabilidad correlacionable;
- `TREQ-VISO-001` — coherencia administrativa de roles, permisos, sedes, áreas, perfiles, conflictos, origen y auditoría;
- `TREQ-INTEGRATION-007` — frontera de programación y asistencia entre VISO y ANIMA;
- `TREQ-SUPABASE-011` — estructura organizacional y territorial tipada.

Estas referencias son trazabilidad.

No alteran filas, estados, relaciones, paquetes, evidencias ni secuencias del registro.

---

#### 72. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó la batería documental sobre el checkout local de la rama de `VISO-CORE-001`. |
| LOCAL | NOT_EXECUTED | El bloque todavía no fue insertado, normalizado ni validado dentro de la rama documental local. |
| REMOTA | PASS | Se verificaron continuidad vigente, cierre de `VISO-AUTH-020`, ruta normal, topología `DEFINE_ONCE`, gate `NO_PHYSICAL_INSTANCE`, archivo propietario, frontera general de VISO, handoff de acceso y seguridad, dependencia de programación, cobertura E1, registro 04A aplicable, políticas de formato y desarrollo, scripts documentales y el AS-IS remoto de VISO. |
| OPERATIVA | NOT_APPLICABLE | La tarea define el corte funcional y no ejecuta trabajo empresarial, programación, permisos, asignaciones ni cambios de acceso. |
| FÍSICA | NOT_APPLICABLE | `VISO-CORE-001` no posee instancia física propia y no autoriza cambios en VISO, Supabase, contratos, datos, infraestructura ni despliegues. |

---

#### 73. Criterios de aceptación

- [ ] El núcleo se define como frontera funcional y no como inventario de páginas.
- [ ] La prueba de inclusión exige transversalidad, fuente canónica y necesidad operativa.
- [ ] La prueba de exclusión evita absorber operación propietaria.
- [ ] VISO administra el modelo sin replicar NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS, ANIMA, TALENTO, AURA o SHELL.
- [ ] El minibloque de acceso y seguridad se consume sin reabrir decisiones.
- [ ] El bloqueo del exporte se conserva.
- [ ] La falta de capacidad de exportación no bloquea el resto del núcleo.
- [ ] Identidad laboral y vigencia forman parte del corte.
- [ ] Organización, sede y área forman parte del corte.
- [ ] Rol base y rol operativo permanecen separados.
- [ ] Matriz base y matriz operacional permanecen separadas.
- [ ] Elegibilidad de rol por sede forma parte del corte.
- [ ] Elegibilidad de rol por área forma parte del corte.
- [ ] Asignaciones de sede forman parte del corte.
- [ ] Asignaciones de área forman parte del corte.
- [ ] Perfil operativo forma parte del corte sin convertirse en rol efectivo.
- [ ] El contexto efectivo forma parte del corte.
- [ ] Capacidades administrativas no fabrican turno o check-in.
- [ ] Capacidades operativas no omiten turno o check-in cuando los requieren.
- [ ] Programación laboral completa no se absorbe en esta tarea.
- [ ] `VISO-SCH-008` permanece como dependencia condicionada para la materialización aplicable.
- [ ] Vista previa forma parte del plano de control.
- [ ] Simulación se conserva fuera del piso mínimo sin perder su separación respecto de autoridad real.
- [ ] Procedencia forma parte del plano de explicabilidad.
- [ ] Conflictos forman parte de la condición de núcleo seguro.
- [ ] Excepciones individuales conservan sus contratos.
- [ ] Auditoría de seguridad forma parte del plano de control.
- [ ] Gobierno de administradores de seguridad permanece explícito.
- [ ] El contrato de exporte se conserva como carryover fuera del piso mínimo obligatorio.
- [ ] Los seis dominios mínimos están definidos.
- [ ] Ningún dominio mínimo depende de una lista local de roles.
- [ ] No se crean catálogos competidores.
- [ ] Fuente canónica y proyección administrativa permanecen separadas.
- [ ] Las aplicaciones consumidoras deben obtener resultados equivalentes.
- [ ] Ausencia no se convierte en valor inventado.
- [ ] Invalidez, conflicto, deny y fallo técnico permanecen distintos.
- [ ] Frescura se reconoce como propiedad necesaria.
- [ ] Concurrencia se reconoce como control necesario para implementación posterior.
- [ ] Auditoría proporcional se reconoce como condición del núcleo.
- [ ] Seguridad server-side se reserva a `VISO-CORE-004`.
- [ ] No existe wildcard administrativo.
- [ ] `VISO-CORE-002` conserva el vínculo con capacidades empresariales.
- [ ] `VISO-CORE-003` conserva la materialización de dependencias.
- [ ] `VISO-CORE-004` conserva la autorización real.
- [ ] `VISO-CORE-005` conserva conflictos, límites, concurrencia y auditoría.
- [ ] `VISO-CORE-006` conserva la aprobación final.
- [ ] Productos y menús quedan fuera del núcleo.
- [ ] CMS y contenido quedan fuera del núcleo.
- [ ] Operación comercial propietaria queda fuera del núcleo.
- [ ] Inventario, compras, producción, POS y contabilidad propietaria quedan fuera del núcleo.
- [ ] Ejecución de asistencia queda en ANIMA.
- [ ] Reclutamiento y expediente integral quedan en TALENTO.
- [ ] El AS-IS de VISO no determina la frontera canónica.
- [ ] Las superficies AS-IS solo funcionan como evidencia.
- [ ] Dispositivos compartidos se consumen como contexto sin absorber su ciclo físico.
- [ ] Programación no se vuelve prerrequisito de toda administración.
- [ ] No se autoriza tabla paralela.
- [ ] No se autoriza migración.
- [ ] No se crea ruta.
- [ ] No se crea `PermissionKey`.
- [ ] Ownership de VISO no concede autoridad al usuario.
- [ ] Trabajador, rol, sede, área, perfil, permiso y contexto permanecen entidades distintas.
- [ ] El corte no genera cambios en 04A.
- [ ] La tarea permanece `DEFINE_ONCE`.
- [ ] La tarea permanece `NO_PHYSICAL_INSTANCE`.
- [ ] No existe implementación física propia de `VISO-CORE-001`.

---

#### 74. Límites

Esta tarea no:

- modifica VISO;
- modifica ANIMA;
- modifica SHELL;
- modifica otra aplicación;
- modifica Supabase;
- crea tablas;
- crea vistas;
- crea migraciones;
- crea RLS;
- crea RPC;
- crea funciones;
- crea triggers;
- crea Edge Functions;
- crea Storage;
- crea Realtime;
- crea colas;
- crea cron;
- modifica datos;
- crea roles;
- crea permisos;
- crea `PermissionKey`;
- crea scopes;
- crea grants;
- crea denies;
- crea asignaciones;
- crea perfiles;
- crea turnos;
- publica horarios;
- modifica `employee_shifts`;
- ejecuta el delta mensual;
- aprueba `VISO-SCH-008`;
- desarrolla `VISO-CORE-002`;
- materializa `VISO-CORE-003`;
- materializa `VISO-CORE-004`;
- materializa `VISO-CORE-005`;
- aprueba `VISO-CORE-006`;
- diseña la UX final;
- reorganiza navegación;
- crea endpoints;
- crea Server Actions;
- crea exportes físicos;
- elimina legacy;
- mueve ownership funcional;
- selecciona package;
- prepara package gate;
- aprueba package gate;
- autoriza una instancia física;
- ejecuta implementación física;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica el Registro Canónico de Requisitos de Prueba.

---

#### 75. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-AUTH-020 — Crear exporte de matriz de acceso`

**TAREA ACTUAL APROBADA**
`VISO-CORE-001 — Definir núcleo mínimo de VISO`

**SIGUIENTE TAREA RESERVADA**
`VISO-CORE-002 — Vincular núcleo con capacidades empresariales`


### ✅ VISO-CORE-002 — Vincular núcleo con capacidades empresariales

**Estado:** APROBADA
**Tarea anterior:** VISO-CORE-001 — Definir núcleo mínimo de VISO
**Tarea siguiente:** VISO-CORE-003 — Implementar dependencias administrativas mínimas
**Tipo de tarea:** documental; vinculación única del núcleo mínimo de VISO con las capacidades empresariales canónicas que justifican cada dominio, preservando propietarios, fuentes de verdad, custodios, consumidores y dependencias condicionadas sin convertir a VISO en dueño universal ni autorizar materialización física
**Bloque:** `G_VISO — NÚCLEO MÍNIMO PARA OPERACIÓN`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/02_NUCLEO_MINIMO_PARA_OPERACION.md`
**Estado físico resultante:** vínculo funcional núcleo-capacidades definido una sola vez; sin instancia física propia
**Cambios físicos autorizados:** ninguno; `VISO-CORE-002` es `DEFINE_ONCE` con `NO_PHYSICAL_INSTANCE` y toda materialización continúa reservada a `VISO-CORE-003`, `VISO-CORE-004` y `VISO-CORE-005`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Vincular los seis dominios del núcleo mínimo aprobados en `VISO-CORE-001` con las capacidades empresariales canónicas que explican por qué ese núcleo debe existir, qué parte administra VISO, qué hechos pertenecen a otra fuente y qué aplicaciones los consumen.

La tarea responde:

```text
¿QUÉ CAPACIDADES EMPRESARIALES
JUSTIFICAN CADA DOMINIO DEL NÚCLEO MÍNIMO DE VISO
Y CUÁL ES LA FRONTERA DE PROPIEDAD
ENTRE VISO Y EL RESTO DEL ECOSISTEMA?
```

La respuesta no modifica la taxonomía empresarial.

No crea una taxonomía específica de VISO.

---

#### 2. Entrada obligatoria de VISO-CORE-001

El núcleo recibido contiene exactamente seis dominios:

1. persona laboral;
2. organización y territorio;
3. roles, perfiles y asignaciones;
4. permisos y matrices;
5. contexto efectivo;
6. control y explicabilidad.

`VISO-CORE-002` no puede agregar un séptimo dominio ni eliminar uno de los seis.

---

#### 3. Fuente empresarial de la vinculación

La vinculación usa la taxonomía empresarial canónica `CAP-*`.

Una capacidad empresarial representa un resultado estable que la organización necesita producir.

Una subcapacidad representa una parte específica y separable de ese resultado.

El núcleo de VISO no reemplaza esas identidades.

---

#### 4. Regla de identidad de capacidades

Toda referencia empresarial de esta tarea conserva el identificador canónico existente.

La relación es:

```text
CAPACIDAD CANÓNICA
→ PROPÓSITO EMPRESARIAL

DOMINIO DEL NÚCLEO
→ SOPORTE ADMINISTRATIVO NECESARIO

VÍNCULO
→ TRAZABILIDAD ENTRE AMBOS
```

No:

```text
DOMINIO VISO
→ NUEVA CAPACIDAD EMPRESARIAL
```

---

#### 5. Regla de propiedad

La presencia de una capacidad dentro de VISO no convierte a VISO en dueño universal del resultado.

Deben distinguirse:

- dueño accountable del resultado empresarial;
- propietario funcional o de proceso;
- propietario del dato o registro;
- steward;
- custodio técnico;
- operador;
- aplicación administradora;
- aplicación consumidora.

Una misma interfaz no puede colapsar esos roles.

---

#### 6. Regla de fuente única

Para un mismo hecho, etapa y atributo debe existir una fuente propietaria reconocible.

VISO puede administrar una proyección sin convertirse en una fuente paralela.

La regla es:

```text
FUENTE PROPIETARIA
→ CONTRATO CANÓNICO
→ ADMINISTRACIÓN VISO CUANDO APLIQUE
→ CONSUMIDORES
```

---

#### 7. Regla contra ownership por interfaz

No se permite inferir propiedad porque una pantalla exista en `vento-viso`.

Tampoco se permite inferir propiedad porque:

- VISO pueda editar el dato;
- VISO pueda consultarlo;
- VISO tenga una tabla administrativa;
- VISO participe en el proceso;
- VISO muestre auditoría.

---

#### 8. Regla contra ownership por persistencia

Supabase, Storage, un repositorio o una tabla pueden ser custodios técnicos.

Su existencia no determina por sí sola el propietario empresarial del hecho.

---

#### 9. Naturaleza de los vínculos

Esta tarea distingue tres usos de una capacidad empresarial:

| Uso | Significado |
| --- | --- |
| Primario | La capacidad explica directamente por qué el dominio debe existir dentro del núcleo mínimo. |
| De soporte | La capacidad necesita o gobierna parte del dominio, pero no define por sí sola toda su frontera. |
| Condicionado | El dominio consume el resultado solo cuando una acción o contexto concreto lo requiere. |

Estas categorías describen trazabilidad documental.

No crean estados técnicos.

---

#### 10. Universo materialmente vinculado

El núcleo mínimo queda vinculado de forma material con quince subcapacidades empresariales únicas:

- seis de `CAP-01`;
- seis de `CAP-02`;
- una de `CAP-15`;
- dos de `CAP-16`.

No se vinculan las 217 subcapacidades empresariales indiscriminadamente.

---

#### 11. Subcapacidades de CAP-01 vinculadas

El vínculo con dirección y gobierno se limita a:

1. `CAP-01.03` — Gobernar empresas, marcas y establecimientos;
2. `CAP-01.04` — Gobernar sedes, oficinas y áreas;
3. `CAP-01.05` — Definir responsabilidades y límites de decisión;
4. `CAP-01.06` — Gestionar políticas y reglas internas;
5. `CAP-01.08` — Coordinar operación entre negocios y sedes;
6. `CAP-01.10` — Verificar cumplimiento de decisiones.

No se incorpora al núcleo toda la familia `CAP-01`.

---

#### 12. Subcapacidades de CAP-02 vinculadas

El vínculo con personas y trabajo se limita a:

1. `CAP-02.03` — Vincular e incorporar trabajadores;
2. `CAP-02.04` — Mantener información laboral;
3. `CAP-02.05` — Asignar sedes, áreas y funciones;
4. `CAP-02.06` — Programar turnos;
5. `CAP-02.07` — Registrar asistencia y tiempo trabajado;
6. `CAP-02.13` — Gestionar retiro y cierre de accesos.

La selección conserva las fronteras ya aprobadas entre TALENTO, VISO, ANIMA y SHELL.

---

#### 13. Subcapacidad de CAP-15 vinculada

El núcleo usa:

`CAP-15.01` — Gestionar cuentas y accesos.

Este vínculo no transfiere a VISO la fuente de decisión de autorización.

SHELL y el modelo canónico de autorización conservan esa responsabilidad.

---

#### 14. Subcapacidades de CAP-16 vinculadas

El plano de control usa:

- `CAP-16.07` — Conservar registros y evidencia;
- `CAP-16.11` — Investigar accesos o cambios indebidos.

Estas capacidades justifican trazabilidad, conservación e investigación.

No convierten el núcleo en sistema integral de gobierno de información.

---

#### 15. Matriz consolidada de vínculo

| Dominio del núcleo | Vínculos primarios | Vínculos de soporte o condicionados | Frontera |
| --- | --- | --- | --- |
| Persona laboral | `CAP-02.03`, `CAP-02.04`, `CAP-02.13` | `CAP-02.05` | VISO administra el episodio laboral y sus relaciones administrativas; TALENTO conserva el pre-vínculo, ANIMA la experiencia del trabajador y SHELL identidad/acceso. |
| Organización y territorio | `CAP-01.03`, `CAP-01.04` | `CAP-01.08`, `CAP-02.05` | VISO administra la proyección organizacional y territorial necesaria; no sustituye hechos jurídicos ni propietarios de otras capacidades. |
| Roles, perfiles y asignaciones | `CAP-01.05`, `CAP-02.05` | `CAP-02.06` | VISO administra configuración; el turno puede determinar rol efectivo cuando el contrato lo exige. |
| Permisos y matrices | `CAP-15.01`, `CAP-01.05` | `CAP-01.06` | SHELL/modelo de autorización decide; VISO administra la proyección y configuración permitida. |
| Contexto efectivo | `CAP-02.05`, `CAP-15.01` | `CAP-01.04`, `CAP-02.06`, `CAP-02.07` | El contexto se compone con hechos de varias fuentes; VISO no inventa turno, check-in ni territorio. |
| Control y explicabilidad | `CAP-01.10`, `CAP-16.07`, `CAP-16.11` | `CAP-01.06`, `CAP-15.01` | VISO presenta y administra controles dentro de su alcance; evidencia, autorización e investigación conservan sus propietarios y custodios canónicos. |

---

#### 16. Cobertura de la matriz

La matriz cubre:

```text
DOMINIOS DEL NÚCLEO ESPERADOS = 6
DOMINIOS VINCULADOS = 6
DOMINIOS SIN VÍNCULO = 0

SUBCAPACIDADES ÚNICAS VINCULADAS = 15
SUBCAPACIDADES EMPRESARIALES RECLASIFICADAS = 0
NUEVAS SUBCAPACIDADES CREADAS = 0
```

---

#### 17. Persona laboral y CAP-02.03

`CAP-02.03` justifica la incorporación de una persona al estado laboral necesario para administrar Vento OS.

El núcleo requiere conocer la identidad laboral y el vínculo habilitante.

No requiere absorber candidatura ni selección.

---

#### 18. Frontera TALENTO hacia persona laboral

TALENTO conserva el dominio prelaboral.

La entrega hacia VISO puede proyectar el resultado aprobado necesario para iniciar el episodio laboral.

El núcleo no convierte:

- candidato;
- postulación;
- evaluación;
- oferta;

en entidades administrativas equivalentes a trabajador activo.

---

#### 19. Persona laboral y CAP-02.04

`CAP-02.04` justifica mantener la información laboral necesaria para administrar el vínculo.

El núcleo consume únicamente atributos necesarios para:

- asignación;
- contexto;
- autorización;
- trazabilidad.

No convierte todo expediente laboral en dato del core.

---

#### 20. Minimización de información laboral

La condición de formar parte del vínculo laboral no autoriza exposición total.

Cada consumidor debe recibir el mínimo necesario.

El core no usa conveniencia administrativa como fundamento para ampliar datos personales.

---

#### 21. Persona laboral y CAP-02.13

`CAP-02.13` justifica que el cierre de un episodio laboral tenga efecto coordinado sobre autoridad.

VISO puede orquestar el cierre administrativo.

Los servicios propietarios ejecutan las revocaciones que les corresponden.

---

#### 22. Retiro no destructivo

El retiro no elimina la persona ni la historia necesaria.

Debe permitir diferenciar:

- persona;
- episodio laboral terminado;
- nuevo episodio laboral posterior.

Un reingreso no reactiva automáticamente autoridad anterior.

---

#### 23. Persona laboral y CAP-02.05

`CAP-02.05` vincula a la persona con sedes, áreas y funciones.

Dentro del dominio persona laboral es un vínculo de soporte.

Su contenido principal se desarrolla en roles, perfiles y asignaciones.

---

#### 24. Organización y CAP-01.03

`CAP-01.03` aporta la identidad organizacional necesaria para ubicar la operación dentro de la estructura empresarial.

El núcleo toma solo la proyección administrativa requerida para relacionar territorio, trabajador y autoridad.

No absorbe gestión societaria, registral, tributaria o contractual.

---

#### 25. Organización y CAP-01.04

`CAP-01.04` es el vínculo principal para sedes, oficinas y áreas.

El núcleo necesita identidades territoriales estables para:

- asignaciones;
- elegibilidad;
- contexto;
- autorización;
- auditoría.

---

#### 26. Sede como capacidad administrativa

La sede puede participar en múltiples capacidades empresariales.

Dentro del núcleo, su finalidad es delimitar territorio administrativo y operativo.

No se usa el nombre de sede como permiso.

---

#### 27. Área como capacidad administrativa

El área permite delimitar función y territorio cuando el contrato lo exige.

No se confunde con:

- rol;
- grupo;
- permiso;
- capacidad;
- aplicación.

---

#### 28. CAP-01.08 como soporte territorial

`CAP-01.08` justifica coordinación entre negocios y sedes.

Su vínculo con el núcleo es de soporte.

El núcleo provee identidades y contexto.

No ejecuta la operación coordinada de NEXO, FOGO, ORIGO, PULSO u otras aplicaciones.

---

#### 29. CAP-02.05 como vínculo laboral-territorial

`CAP-02.05` une el dominio persona con el dominio territorio.

La asignación laboral no cambia la identidad de la sede.

La sede no cambia la identidad del trabajador.

La relación tiene vigencia propia.

---

#### 30. Roles y CAP-01.05

`CAP-01.05` justifica definir responsabilidades y límites de decisión.

Dentro del núcleo esto se expresa mediante:

- roles base;
- roles operativos;
- límites administrativos;
- segregación de responsabilidades.

El nombre de un rol no constituye una decisión final de autorización.

---

#### 31. Roles y CAP-02.05

`CAP-02.05` justifica asignar funciones a trabajadores dentro de sedes y áreas.

El núcleo administra esa configuración sin fusionar:

```text
ROL
+
SEDE
+
ÁREA
+
TRABAJADOR
```

en una identidad única.

---

#### 32. Perfil operativo

El perfil operativo es una configuración administrativa útil para planificar y proponer contexto.

Su vínculo empresarial deriva de asignar funciones.

No reemplaza el rol efectivo cuando la operación requiere un turno válido.

---

#### 33. Elegibilidad territorial

La elegibilidad de un rol por sede o área expresa dónde una función puede resultar válida.

No asigna el rol a una persona.

No concede permiso.

No crea contexto efectivo por sí sola.

---

#### 34. Asignación laboral

Una asignación trabajador × sede o trabajador × área expresa una relación laboral vigente.

No autoriza cualquier acción en ese territorio.

La autorización sigue necesitando permiso y contexto aplicable.

---

#### 35. CAP-02.06 como vínculo condicionado

`CAP-02.06` participa cuando la capacidad evaluada requiere un turno.

El turno puede aportar:

- vigencia temporal;
- sede;
- área;
- rol operativo efectivo.

No toda administración del núcleo requiere turno.

---

#### 36. Frontera del bloque VISO-SCH

La vinculación con `CAP-02.06` no activa `VISO-SCH-001` a `VISO-SCH-008`.

La programación laboral conserva su contrato y gate propios.

`VISO-CORE-003` podrá consumir `VISO-SCH-008` únicamente cuando la materialización aplicable lo requiera y la dependencia esté cerrada.

---

#### 37. Permisos y CAP-15.01

`CAP-15.01` justifica el gobierno de cuentas y accesos.

Dentro del núcleo se refleja en:

- catálogo de permisos consumido;
- matrices;
- grants;
- denies;
- restricciones administrativas;
- cierre de autoridad.

---

#### 38. Fuente de decisión para CAP-15.01

SHELL y el modelo canónico de autorización conservan la fuente de decisión.

VISO no decide mediante una lista local quién tiene acceso.

VISO administra la configuración autorizada y muestra su resultado.

---

#### 39. CAP-01.05 y límites de decisión

La matriz de permisos también implementa límites organizacionales de decisión.

Por eso `CAP-01.05` participa junto a `CAP-15.01`.

El límite empresarial no sustituye el permiso técnico.

El permiso técnico no sustituye la responsabilidad empresarial.

---

#### 40. CAP-01.06 y políticas internas

`CAP-01.06` funciona como soporte para reglas administrativas que condicionan la configuración.

No autoriza crear políticas ad hoc dentro de VISO.

Las reglas deben provenir de contratos canónicos vigentes.

---

#### 41. Matriz base

La matriz de rol base × permiso base pertenece al plano administrativo del núcleo.

Su propósito empresarial es expresar responsabilidad permanente permitida.

No expresa operación efectiva de una jornada.

---

#### 42. Matriz operativa

La matriz de rol operativo × permiso operativo expresa capacidades asociadas al rol operacional.

Permanece separada de la matriz base.

No se deriva de una etiqueta de oficio.

---

#### 43. Grants y denies

Las concesiones y denegaciones individuales forman parte del gobierno de acceso.

No constituyen una taxonomía empresarial nueva.

Su efecto está subordinado al modelo de autorización.

---

#### 44. Contexto efectivo como composición

El contexto efectivo no corresponde a una sola capacidad empresarial.

Se compone con hechos provenientes de varias capacidades y propietarios.

Su finalidad es producir una entrada consistente para autorización y operación.

---

#### 45. Contexto y CAP-02.05

Las asignaciones de sede, área y función son entradas estructurales del contexto.

Si una dimensión requerida no está asignada válidamente, el núcleo no debe inventarla.

---

#### 46. Contexto y CAP-01.04

La estructura territorial define cuáles sedes y áreas existen y cómo se relacionan.

Eso no determina automáticamente cuáles están asignadas a cada trabajador.

---

#### 47. Contexto y CAP-02.06

Cuando una operación exige turno, la revisión vigente del turno participa en el contexto.

Una programación borrador no equivale a turno operativo efectivo.

---

#### 48. Contexto y CAP-02.07

`CAP-02.07` aporta hechos de asistencia y tiempo trabajado cuando el contrato exige check-in u otro estado operativo.

ANIMA conserva la captura y experiencia de asistencia.

VISO no se convierte en capturador primario por consumir ese hecho.

---

#### 49. Contexto y CAP-15.01

La autorización usa el contexto para resolver acceso.

El contexto no concede por sí mismo un permiso.

La ausencia de permiso exacto no se corrige con una sede, área o turno válidos.

---

#### 50. Contexto administrativo

Una capacidad administrativa puede resolverse sin turno ni check-in cuando su contrato así lo define.

El núcleo debe permitir ese carril.

No se fabrica contexto operativo para completar una evaluación administrativa.

---

#### 51. Contexto operativo

Una capacidad operativa conserva sus prerrequisitos.

Cuando el contrato exige turno, check-in, rol operativo o territorio compatible, ninguno puede omitirse por conveniencia de VISO.

---

#### 52. Consumidores del contexto

SHELL y las aplicaciones operativas pueden consumir contexto efectivo.

Cada consumidor debe recibir el mismo significado para las mismas entradas reales.

No se permiten reglas locales que amplíen alcance.

---

#### 53. Control y CAP-01.10

`CAP-01.10` justifica verificar que las decisiones administrativas produzcan el efecto esperado.

En el núcleo esto exige capacidad de:

- revisar configuración;
- identificar conflicto;
- comprobar procedencia;
- reconstruir cambios.

---

#### 54. CAP-01.10 no crea analítica general

Verificar una decisión no convierte el núcleo en plataforma de BI.

Los indicadores y análisis empresariales amplios conservan sus dominios y propietarios.

El core solo necesita evidencia suficiente para verificar su propia configuración y autoridad.

---

#### 55. Control y CAP-16.07

`CAP-16.07` justifica conservar la evidencia necesaria para reconstruir hechos administrativos sensibles.

La evidencia debe permanecer asociada a su propietario funcional y custodia aprobada.

VISO puede consultarla o administrarla dentro de su alcance.

---

#### 56. Control y CAP-16.11

`CAP-16.11` justifica investigar accesos o cambios indebidos.

La investigación puede requerir:

- actor;
- principal;
- recurso;
- permiso;
- territorio;
- fecha;
- cambio;
- evidencia;
- decisión.

No concede a VISO autoridad para alterar la evidencia investigada.

---

#### 57. Frontera de gobierno de información

`CAP-16.07` y `CAP-16.11` no incorporan toda `CAP-16` al núcleo mínimo.

Solicitudes de titulares, retención general, legal holds, firmas y demás capacidades de información conservan sus bloques y owners correspondientes.

---

#### 58. Procedencia

La procedencia de una decisión de acceso pertenece al plano de control.

Debe permitir distinguir, cuando corresponda:

- rol base;
- rol operativo;
- grant;
- deny;
- asignación;
- territorio;
- turno;
- check-in;
- dispositivo;
- excepción.

La procedencia explica.

No autoriza.

---

#### 59. Preview

La vista previa administrativa permite inspeccionar el efecto prospectivo de una configuración.

Su vínculo empresarial es de verificación y control.

No reemplaza la decisión real de autorización.

---

#### 60. Simulación

La simulación permanece fuera del piso obligatorio de disponibilidad básica definido en `VISO-CORE-001`.

Cuando exista, su resultado es explicativo.

Nunca se trata como autoridad real.

---

#### 61. Conflictos

Los conflictos de configuración forman parte del plano mínimo de control.

Esta tarea solo vincula su propósito con gobierno, reglas y verificación empresarial.

La detección material se reserva a `VISO-CORE-005`.

---

#### 62. Excepciones

Las excepciones individuales aprobadas en el bloque de acceso siguen formando parte del plano administrativo.

No constituyen una nueva capacidad empresarial.

Se subordinan a los límites, políticas y denies canónicos.

---

#### 63. Auditoría

La auditoría de cambios del núcleo se vincula con:

- verificación de decisiones;
- conservación de evidencia;
- investigación de cambios indebidos.

La implementación se reserva a `VISO-CORE-005`.

---

#### 64. Exporte de matriz

El contrato documental del exporte continúa dentro del plano de control.

La falta de capacidad canónica exacta de exportación sigue bloqueando su materialización.

`VISO-CORE-002` no agrega una capacidad empresarial ni una `PermissionKey` para resolverlo.

---

#### 65. Propiedad de CAP-01

Dentro de `CAP-01`, VISO participa como superficie administrativa de estructura, decisiones y gobierno aplicable.

La responsabilidad accountable permanece en dirección, gerencia general u owner empresarial definido por cada proceso.

VISO no sustituye esa responsabilidad.

---

#### 66. Propiedad de CAP-02

Dentro de `CAP-02` se conserva la frontera:

```text
TALENTO
→ PREVÍNCULO

VISO
→ VÍNCULO LABORAL + ASIGNACIONES + PROGRAMACIÓN ADMINISTRATIVA

ANIMA
→ EXPERIENCIA DEL TRABAJADOR + ASISTENCIA

SHELL
→ IDENTIDAD + ACCESO + CONTEXTO COMPARTIDO
```

---

#### 67. Propiedad de CAP-15.01

Para cuentas y accesos:

```text
SHELL / MODELO DE AUTORIZACIÓN
→ DECISIÓN

VISO
→ ADMINISTRACIÓN DE CONFIGURACIÓN PERMITIDA

TI
→ EJECUCIÓN TÉCNICA CUANDO CORRESPONDA
```

La ejecución técnica no concede autoridad para decidir acceso.

---

#### 68. Propiedad de CAP-16.07

Cada dominio conserva propiedad sobre sus registros funcionales.

La infraestructura de evidencia conserva su papel transversal.

VISO no duplica el registro fuente para obtener trazabilidad.

---

#### 69. Propiedad de CAP-16.11

La investigación de accesos o cambios indebidos requiere coordinación entre VISO, SHELL y gobierno de información.

Ningún participante puede convertir investigación en autorización retrospectiva.

---

#### 70. Aplicaciones operativas como consumidoras

NEXO, FOGO, ORIGO, PULSO y demás aplicaciones operativas pueden consumir:

- trabajador;
- territorio;
- rol;
- permiso;
- contexto.

Ese consumo no convierte sus procesos en parte de VISO.

---

#### 71. Propiedad operativa preservada

El núcleo no adquiere propiedad sobre:

- inventario;
- producción;
- compras;
- POS;
- contabilidad;
- fidelización;
- contenido;
- marketing;
- mantenimiento;
- operación logística.

Cada dominio conserva su owner canónico.

---

#### 72. Familias empresariales no incorporadas

No se incorporan al núcleo mínimo por esta tarea:

- `CAP-03` a `CAP-14`;
- la parte de `CAP-15` distinta de `CAP-15.01`;
- la parte de `CAP-16` distinta de `CAP-16.07` y `CAP-16.11`;
- `CAP-17`;
- `CAP-18`.

Pueden existir dependencias o consumos transversales.

Eso no las convierte en core.

---

#### 73. CAP-17 fuera del core mínimo

Medición, análisis y mejora permanecen fuera del núcleo mínimo salvo la evidencia estrictamente necesaria para verificar configuración y autoridad.

No se incorpora un dashboard ejecutivo o analítica amplia mediante esta tarea.

---

#### 74. CAP-18 fuera del core mínimo

Continuidad y recuperación son transversales.

El núcleo deberá respetar sus contratos cuando se materialice.

`VISO-CORE-002` no convierte continuidad empresarial en una capacidad propia del core.

---

#### 75. Reglas de consistencia entre dominios

La vinculación debe preservar:

```text
PERSONA
≠ ORGANIZACIÓN
≠ SEDE
≠ ÁREA
≠ ROL
≠ PERFIL
≠ PERMISO
≠ CONTEXTO
≠ EVIDENCIA
```

Un vínculo empresarial no fusiona entidades.

---

#### 76. Cardinalidad del vínculo

Una subcapacidad puede justificar más de un dominio del núcleo.

Eso no crea duplicados de la subcapacidad.

Por ejemplo:

- `CAP-02.05` participa en persona, territorio, asignaciones y contexto;
- `CAP-15.01` participa en permisos, contexto y control.

La identidad canónica permanece única.

---

#### 77. Dependencias disponibles

Las capacidades empresariales ya clasificadas proporcionan el propósito documental necesario para el vínculo.

Su existencia no significa que todas las superficies físicas del core estén disponibles.

La disponibilidad técnica se analiza en `VISO-CORE-003`.

---

#### 78. Dependencias condicionadas

Quedan explícitamente condicionadas:

- programación laboral cuando una materialización requiera el contrato de `VISO-SCH-008`;
- hechos de asistencia cuando una capacidad requiera check-in o estado operativo;
- exporte de matriz mientras falte su capacidad canónica exacta.

---

#### 79. Dependencias ajenas

Una dependencia puede ser necesaria sin ser propiedad de VISO.

Ejemplos:

- identidad y autorización compartida de SHELL;
- captura de asistencia de ANIMA;
- pre-vínculo de TALENTO;
- evidencia transversal;
- almacenamiento canónico de Supabase.

`VISO-CORE-003` deberá respetar esa propiedad.

---

#### 80. No materialización por inferencia

Que una capacidad quede vinculada no autoriza:

- crear tabla;
- crear RPC;
- crear permiso;
- crear página;
- migrar datos;
- cambiar RLS;
- desplegar VISO;
- activar un package.

La materialización conserva su gate propio.

---

#### 81. Handoff a VISO-CORE-003

`VISO-CORE-003` recibe:

1. los seis dominios mínimos;
2. las quince subcapacidades empresariales vinculadas;
3. la matriz de propiedad y consumo;
4. las dependencias disponibles;
5. las dependencias condicionadas;
6. las dependencias pertenecientes a otros propietarios.

Su responsabilidad será materializar únicamente las dependencias administrativas mínimas que estén habilitadas por su topología y gate.

---

#### 82. Handoff a VISO-CORE-004

La matriz deja establecido que autorización real no pertenece a una lista local de VISO.

`VISO-CORE-004` deberá consumir la fuente canónica de decisión y proteger cada lectura o mutación aplicable.

---

#### 83. Handoff a VISO-CORE-005

La matriz deja establecido que conflicto, evidencia, verificación e investigación forman parte del plano de control.

`VISO-CORE-005` deberá materializar esos controles sin crear registros competidores ni alterar ownership.

---

#### 84. Handoff a VISO-CORE-006

El cierre del núcleo deberá demostrar que:

- cada dominio mínimo mantiene vínculo empresarial válido;
- ninguna capacidad ajena fue absorbida;
- las dependencias condicionadas fueron tratadas según su gate;
- los propietarios y fuentes permanecen intactos;
- la autorización y el control producen resultados coherentes.

---

#### 85. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea establece trazabilidad documental entre un núcleo ya aprobado y capacidades empresariales ya clasificadas. No introduce una nueva regla física, cálculo, transición, permiso, integración ni comportamiento ejecutable.

---

#### 86. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, la vinculación reutiliza la cobertura existente de:

- `TREQ-AUTH-001` — autorización mediante permisos, contexto y alcance canónicos;
- `TREQ-AUTH-004` — equivalencia entre evaluadores de autorización;
- `TREQ-AUTH-007` — administración explícita y territorial;
- `TREQ-AUTH-008` — separación entre prerrequisitos administrativos y operativos;
- `TREQ-AUTH-009` — resolución territorial determinista;
- `TREQ-AUTH-015` — trazabilidad correlacionable;
- `TREQ-VISO-001` — coherencia de la administración VISO con el resultado consumido por aplicaciones operativas;
- `TREQ-INTEGRATION-007` — contrato compartido entre programación y asistencia;
- `TREQ-SUPABASE-011` — estructura organizacional y territorial canónica.

Las referencias anteriores son trazabilidad.

No cambian el registro.

---

#### 87. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó la batería documental sobre el checkout local de la rama de `VISO-CORE-002`. |
| LOCAL | NOT_EXECUTED | El bloque todavía no fue insertado, normalizado ni validado dentro de la rama documental local. |
| REMOTA | PASS | Se verificaron `main`, continuidad, topología, contrato de entrega, archivo propietario, handoff de `VISO-CORE-001`, taxonomía empresarial, decisiones de `CAP-SCOPE-001`, `CAP-SCOPE-002`, `CAP-SCOPE-015`, `CAP-SCOPE-016`, cierre transversal de `CAP-SCOPE-019`, Registro Canónico aplicable, comandos y validadores vigentes. |
| OPERATIVA | NOT_APPLICABLE | La tarea vincula contratos documentales y no ejecuta procesos de negocio, asignaciones, turnos, asistencia, accesos ni investigaciones reales. |
| FÍSICA | NOT_APPLICABLE | `VISO-CORE-002` es `DEFINE_ONCE`, no tiene instancia física propia y no autoriza cambios en aplicaciones, Supabase, contratos, datos, infraestructura o despliegues. |

---

#### 88. Criterios de aceptación

- [ ] Se conservan exactamente seis dominios del núcleo.
- [ ] Los seis dominios tienen al menos un vínculo empresarial material.
- [ ] Se usan únicamente subcapacidades canónicas existentes.
- [ ] No se crea una nueva taxonomía de VISO.
- [ ] Se distinguen vínculos primarios, de soporte y condicionados.
- [ ] La matriz contiene quince subcapacidades únicas.
- [ ] No se reclasifica ninguna subcapacidad empresarial.
- [ ] Persona laboral vincula `CAP-02.03`.
- [ ] Persona laboral vincula `CAP-02.04`.
- [ ] Persona laboral vincula `CAP-02.13`.
- [ ] `CAP-02.05` se conserva como soporte laboral-territorial.
- [ ] TALENTO conserva el pre-vínculo.
- [ ] VISO conserva administración del episodio laboral aplicable.
- [ ] ANIMA conserva experiencia del trabajador y captura de asistencia.
- [ ] SHELL conserva identidad, autorización y contexto compartido.
- [ ] Organización y territorio vinculan `CAP-01.03`.
- [ ] Organización y territorio vinculan `CAP-01.04`.
- [ ] `CAP-01.08` permanece como soporte y no como transferencia de operación.
- [ ] Roles, perfiles y asignaciones vinculan `CAP-01.05`.
- [ ] Roles, perfiles y asignaciones vinculan `CAP-02.05`.
- [ ] `CAP-02.06` permanece condicionado al contrato de turno.
- [ ] La vinculación con programación no activa `VISO-SCH`.
- [ ] Permisos y matrices vinculan `CAP-15.01`.
- [ ] Permisos y matrices conservan `CAP-01.05` y `CAP-01.06` como soporte de límites y reglas.
- [ ] SHELL/modelo de autorización sigue siendo fuente de decisión.
- [ ] VISO no autoriza mediante lista local de roles.
- [ ] Contexto efectivo vincula asignaciones, territorio, turno, asistencia y autorización sin fusionarlos.
- [ ] `CAP-02.07` se consume solo cuando el contrato operativo lo exige.
- [ ] Capacidades administrativas no fabrican turno o check-in.
- [ ] Capacidades operativas no omiten sus prerrequisitos.
- [ ] Control y explicabilidad vinculan `CAP-01.10`.
- [ ] Control y explicabilidad vinculan `CAP-16.07`.
- [ ] Control y explicabilidad vinculan `CAP-16.11`.
- [ ] Verificación no se transforma en BI general.
- [ ] Evidencia no se duplica para crear una fuente VISO competidora.
- [ ] Investigación no concede autorización retrospectiva.
- [ ] Procedencia explica sin autorizar.
- [ ] Preview permanece prospectivo.
- [ ] Simulación permanece separada de autoridad real.
- [ ] Conflictos se reservan a `VISO-CORE-005`.
- [ ] Auditoría se reserva a `VISO-CORE-005`.
- [ ] El bloqueo físico del exporte se conserva.
- [ ] `CAP-03` a `CAP-14` no se absorben.
- [ ] El resto de `CAP-15` no se absorbe.
- [ ] El resto de `CAP-16` no se absorbe.
- [ ] `CAP-17` no se incorpora como analítica del núcleo.
- [ ] `CAP-18` no se incorpora como propiedad del núcleo.
- [ ] Ninguna aplicación operativa cede su proceso propietario a VISO.
- [ ] VISO no se declara dueño universal.
- [ ] Persistencia técnica no se interpreta como ownership empresarial.
- [ ] Interfaz administrativa no se interpreta como ownership empresarial.
- [ ] Una subcapacidad repetida en varios dominios conserva una sola identidad.
- [ ] Se identifican dependencias disponibles.
- [ ] Se identifican dependencias condicionadas.
- [ ] Se identifican dependencias ajenas.
- [ ] `VISO-CORE-003` recibe un handoff de dependencias sin materialización anticipada.
- [ ] `VISO-CORE-004` conserva responsabilidad de autorización real.
- [ ] `VISO-CORE-005` conserva responsabilidad de conflicto y auditoría.
- [ ] `VISO-CORE-006` conserva la aprobación final.
- [ ] No se crean requisitos de prueba.
- [ ] No se modifican requisitos de prueba.
- [ ] No se modifica el Registro Canónico de Requisitos de Prueba.
- [ ] La tarea conserva `DEFINE_ONCE`.
- [ ] La tarea conserva `NO_PHYSICAL_INSTANCE`.
- [ ] No existe implementación física propia de `VISO-CORE-002`.

---

#### 89. Límites

Esta tarea no:

- modifica la taxonomía `CAP-*`;
- crea nuevas capacidades;
- cambia owners empresariales;
- cambia owners funcionales;
- cambia custodios técnicos;
- cambia consumidores;
- modifica VISO;
- modifica SHELL;
- modifica ANIMA;
- modifica TALENTO;
- modifica aplicaciones operativas;
- modifica Supabase;
- crea tablas;
- crea vistas;
- crea migraciones;
- crea RLS;
- crea RPC;
- crea funciones;
- crea triggers;
- crea Edge Functions;
- crea Storage;
- crea Realtime;
- crea colas;
- crea cron;
- modifica datos;
- crea roles;
- crea permisos;
- crea `PermissionKey`;
- crea scopes;
- crea grants;
- crea denies;
- crea asignaciones;
- crea perfiles;
- crea turnos;
- registra asistencia;
- publica horarios;
- modifica `employee_shifts`;
- activa `VISO-SCH-001` a `VISO-SCH-008`;
- materializa `VISO-CORE-003`;
- materializa `VISO-CORE-004`;
- materializa `VISO-CORE-005`;
- aprueba `VISO-CORE-006`;
- diseña UX final;
- crea páginas;
- crea endpoints;
- crea Server Actions;
- crea exportes físicos;
- elimina legacy;
- selecciona package;
- autoriza package;
- autoriza implementación física;
- ejecuta implementación física;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica el Registro Canónico de Requisitos de Prueba.

---

#### 90. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-CORE-001 — Definir núcleo mínimo de VISO`

**TAREA ACTUAL APROBADA**
`VISO-CORE-002 — Vincular núcleo con capacidades empresariales`

**SIGUIENTE TAREA RESERVADA**
`VISO-CORE-003 — Implementar dependencias administrativas mínimas`


### [ ] VISO-CORE-003 — Implementar dependencias administrativas mínimas
### [ ] VISO-CORE-004 — Implementar autorización real del núcleo
### [ ] VISO-CORE-005 — Implementar validación de conflictos y auditoría
### [ ] VISO-CORE-006 — Aprobar núcleo antes de ampliar alcance

### Dependencias del delta mensual

- `VISO-CORE-003` consume `VISO-SCH-008`.
- `VISO-CORE-004` debe demostrar permisos por acción o justificar un permiso común sin exceso.
- `VISO-CORE-005` incluye conflictos, límites, concurrencia, auditoría, corrección, borrado de borradores y notificación.
- `VISO-CORE-006` no cierra con el delta abierto ni sin cierre del package cuando este forme parte del núcleo.
