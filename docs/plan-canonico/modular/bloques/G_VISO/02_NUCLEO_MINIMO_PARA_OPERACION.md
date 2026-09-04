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


### ✅ VISO-CORE-003 — Implementar dependencias administrativas mínimas

**Estado:** APROBADA
**Tarea anterior:** VISO-CORE-002 — Vincular núcleo con capacidades empresariales
**Tarea siguiente:** VISO-CORE-004 — Implementar autorización real del núcleo
**Tipo de tarea:** contrato documental de implementación física por unidad; define qué dependencias administrativas mínimas debe materializar o reutilizar cada unidad física válida del núcleo de VISO, sin crear una implementación global, sin inventar unidades y sin absorber la autorización real, la detección de conflictos ni la auditoría reservadas a tareas posteriores
**Bloque:** `G_VISO — NÚCLEO MÍNIMO PARA OPERACIÓN`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/02_NUCLEO_MINIMO_PARA_OPERACION.md`
**Estado físico resultante:** contrato de materialización por unidad definido; ninguna instancia física se crea ni se ejecuta por la aprobación documental de esta tarea
**Cambios físicos autorizados:** únicamente dentro de una instancia física válida derivada de un `implementation_unit_id` canónico y habilitada por `PER_IMPLEMENTATION_UNIT` + `POST_E5_PACKAGE`: reutilizar, adaptar o materializar las dependencias administrativas mínimas declaradas para esa unidad; fuera de una instancia válida no se autoriza cambio físico alguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato exacto que deberá cumplir cada futura instancia física de `VISO-CORE-003` para disponer de las dependencias administrativas mínimas del núcleo de VISO.

La tarea convierte el handoff de `VISO-CORE-001` y `VISO-CORE-002` en una regla de materialización reutilizable por unidad.

No ejecuta esa materialización desde el carril documental.

---

#### 2. Resultado esperado

Cada unidad física que posteriormente sea creada por un paquete E5 válido deberá poder demostrar:

1. qué dominios del núcleo necesita;
2. qué dependencias administrativas ya existen;
3. cuáles deben adaptarse;
4. cuáles deben materializarse;
5. cuáles son condicionadas;
6. cuál es la fuente canónica de cada dependencia;
7. qué propietario conserva cada hecho;
8. qué contratos y versiones consume;
9. qué rollback aplica;
10. qué evidencia demuestra que no se creó una fuente competidora.

---

#### 3. Entrada obligatoria de VISO-CORE-001

Se reciben exactamente seis dominios mínimos:

1. persona laboral;
2. organización y territorio;
3. roles, perfiles y asignaciones;
4. permisos y matrices;
5. contexto efectivo;
6. control y explicabilidad.

`VISO-CORE-003` no puede agregar un séptimo dominio.

---

#### 4. Entrada obligatoria de VISO-CORE-002

Se reciben:

- la vinculación de los seis dominios con capacidades empresariales;
- quince subcapacidades empresariales únicas;
- la matriz de propiedad y consumo;
- dependencias disponibles;
- dependencias condicionadas;
- dependencias pertenecientes a otros propietarios.

Esta tarea conserva esa frontera.

---

#### 5. Topología obligatoria

`VISO-CORE-003` usa:

```text
PER_IMPLEMENTATION_UNIT
POST_E5_PACKAGE
```

La tarea no admite una instancia global previa a E5.

---

#### 6. Identidad física de instancia

La identidad de una futura instancia se deriva del ID de tarea y del `implementation_unit_id` canónico creado por el paquete E5 aplicable.

El `implementation_unit_id` no se crea en esta tarea.

No puede elegirse manualmente para dividir trabajo técnico.

---

#### 7. Origen exclusivo de implementation_unit_id

Una unidad válida debe provenir de:

- un package canónico;
- el dossier E5 aplicable;
- el registro de readiness;
- la definición de unidades de implementación aprobada.

Una carpeta, archivo, repositorio, pantalla o tabla no crea por sí mismo una unidad física.

---

#### 8. Gate temporal

La ejecución física solo puede ocurrir después de E5.

Debe existir evidencia de que:

- el package aplicable alcanzó el estado requerido por el gate;
- la unidad física existe canónicamente;
- sus dependencias están disponibles;
- no hay bloqueadores físicos pendientes;
- el lifecycle de implementación autorizó la instancia.

La aprobación documental de esta tarea no sustituye esos gates.

---

#### 9. Regla de no implementación global

Está prohibido convertir la tarea en:

```text
IMPLEMENTAR TODO EL CORE DE VISO UNA SOLA VEZ
```

Cada unidad física materializa únicamente las dependencias que su package y su alcance requieren.

---

#### 10. Regla de no fragmentación arbitraria

También está prohibido crear unidades por comodidad técnica.

No constituyen unidades canónicas por sí mismas:

- una tabla;
- una migración;
- un helper;
- una pantalla;
- un endpoint;
- un componente;
- una función;
- una prueba.

La cardinalidad proviene de E5.

---

#### 11. Regla de reuso antes de creación

Antes de crear cualquier dependencia física, la instancia debe comprobar si ya existe una fuente canónica suficiente.

El orden es:

```text
REUSAR
→ ADAPTAR COMPATIBLEMENTE CUANDO SEA NECESARIO
→ MATERIALIZAR SOLO LO AUSENTE
```

No:

```text
COPIAR DENTRO DE VISO
→ SINCRONIZAR DESPUÉS
```

---

#### 12. Regla de fuente única

Para cada hecho administrativo debe existir una fuente propietaria reconocible.

Una instancia de VISO puede:

- leerla;
- proyectarla;
- administrarla cuando tenga ownership funcional;
- consumirla mediante contrato.

No puede duplicarla para simplificar la implementación.

---

#### 13. Regla de persistencia

Supabase actúa como infraestructura de persistencia y ejecución cuando corresponda.

No se convierte por ello en propietario empresarial del hecho.

Toda modificación VENTO de Supabase se versiona desde `vento-group-sas/vento-shell`.

---

#### 14. Regla de contratos compartidos

Cuando una dependencia ya tiene contrato compartido:

- se consume el contrato vigente;
- se conserva su versión;
- se conserva su semántica;
- no se crea una variante local de VISO;
- no se amplían campos o autoridad por conveniencia de interfaz.

---

#### 15. Regla de compatibilidad legacy

Una estructura legacy puede permanecer como mecanismo de compatibilidad únicamente cuando su uso siga autorizado y trazado.

La instancia debe distinguir:

- fuente canónica;
- alias o wrapper;
- estructura legacy todavía activa;
- consumidor;
- condición de retiro.

No puede declarar una estructura legacy como nuevo modelo canónico por simple reutilización.

---

#### 16. Matriz mínima de dependencias

| Dominio del núcleo | Dependencia mínima | Naturaleza | Propiedad preservada |
| --- | --- | --- | --- |
| Persona laboral | identidad laboral estable y episodio laboral vigente | obligatoria cuando la unidad opera sobre trabajadores | VISO administra vínculo laboral aplicable; identidad autenticada permanece compartida con SHELL |
| Organización y territorio | organización, sede, área y cobertura laboral | obligatoria cuando existe alcance territorial | modelo organizacional canónico |
| Roles, perfiles y asignaciones | rol base, rol operativo, elegibilidad territorial y perfil de planificación | obligatoria cuando la unidad administra función o contexto | contratos de autorización y trabajo |
| Permisos y matrices | catálogo de permisos y matrices aplicables | obligatoria cuando la unidad administra configuración de acceso | modelo de autorización canónico |
| Contexto efectivo | asignaciones + política de operación + hechos condicionados | condicionada al tipo de capacidad | fuentes propietarias de cada hecho |
| Control y explicabilidad | identidad de procedencia y referencias a evidencia | obligatoria como entrada; comportamiento final reservado | control transversal y tareas posteriores |

---

#### 17. Persona laboral

La dependencia mínima de persona laboral debe distinguir:

```text
PERSONA
≠ CUENTA DE AUTENTICACIÓN
≠ EPISODIO LABORAL
≠ ASIGNACIÓN
```

Una identidad estable no puede quedar acoplada destructivamente a un solo episodio laboral.

---

#### 18. employees

Cuando la unidad consuma `employees`, deberá tratarlo como proyección laboral existente, no como autorización.

La existencia de una fila no concede:

- aplicación;
- sede;
- área;
- rol operativo;
- permiso.

---

#### 19. Identidad autenticada

El vínculo con autenticación debe consumir la identidad canónica existente.

No se permite crear un usuario VISO independiente para representar al mismo humano.

SHELL y el contrato compartido de identidad conservan su papel.

---

#### 20. Episodio laboral

La unidad debe poder diferenciar el vínculo laboral actual de la identidad histórica del trabajador.

Cuando el esquema físico vigente no tenga una entidad separada para episodio laboral, la instancia deberá conservar la semántica mediante el contrato canónico disponible y no inventar una tabla paralela sin package y migración aprobados.

---

#### 21. Retiro laboral

Un retiro debe poder invalidar relaciones administrativas vigentes sin destruir la historia necesaria.

La materialización mínima debe permitir que `VISO-CORE-004` cierre autoridad posteriormente.

`VISO-CORE-003` no implementa la decisión final de acceso.

---

#### 22. Reingreso

Un reingreso debe poder distinguir un nuevo vínculo laboral del anterior.

No se autoriza reactivar automáticamente:

- grants;
- perfiles;
- turnos;
- permisos;
- contextos;
- excepciones;

de un episodio terminado.

---

#### 23. Organización y territorio

La dependencia territorial debe respetar la taxonomía organizacional canónica.

No se permite usar un único nombre de sede para fusionar:

- organización;
- titular jurídico;
- marca;
- establecimiento;
- instalación;
- sede operativa;
- área;
- zona;
- estación;
- canal.

---

#### 24. sites

`sites` puede actuar como estructura física vigente cuando el contrato canónico lo reconozca.

La instancia no debe interpretar `site_type`, nombre o dirección como permiso.

---

#### 25. areas

`areas` delimita área administrativa u operativa cuando el contrato lo requiere.

Un área no es:

- rol;
- perfil;
- permiso;
- grupo de usuarios.

---

#### 26. employee_sites

`employee_sites` expresa cobertura o relación del trabajador con sedes cuando aplica.

No concede acceso global.

No sustituye la evaluación de permiso.

---

#### 27. employee_areas

`employee_areas` expresa cobertura o relación con áreas cuando aplica.

La instancia debe respetar su vigencia y compatibilidad territorial.

No convierte el área en autoridad.

---

#### 28. Asignación territorial

La dependencia administrativa mínima debe poder resolver:

```text
TRABAJADOR
→ COBERTURA DE SEDE
→ COBERTURA DE ÁREA CUANDO APLIQUE
```

sin confundir cobertura con acceso.

---

#### 29. Historia territorial

Cambios de sede o área no deben borrar la historia necesaria para:

- auditoría;
- reconstrucción;
- decisiones temporales;
- investigación.

La estrategia concreta depende del contrato físico del package.

---

#### 30. Rol base

La dependencia de rol base representa responsabilidad administrativa o permanente.

No se permite deducir autoridad final de un nombre de rol.

---

#### 31. Rol operativo

`operational_roles` representa identidades canónicas de roles operativos cuando aplica.

La unidad debe conservar separación entre:

```text
ROL BASE
≠ ROL OPERATIVO
```

---

#### 32. site_operational_roles

`site_operational_roles` expresa elegibilidad estática de un rol operativo en una sede.

No asigna el rol a un trabajador.

No demuestra turno.

No demuestra check-in.

---

#### 33. employee_site_operational_profiles

`employee_site_operational_profiles` funciona como perfil o preferencia de planificación por trabajador y sede cuando el contrato vigente lo utiliza.

No constituye autoridad efectiva.

No sustituye `employee_shifts` cuando una operación exige turno.

---

#### 34. Perfil operativo y autoridad

El perfil operativo puede ayudar a:

- proponer;
- planificar;
- preseleccionar.

No puede autorizar una acción protegida.

---

#### 35. Asignación de rol operativo

Cuando una capacidad exige rol operativo efectivo, la dependencia debe provenir del mecanismo aprobado para el episodio operativo.

La instancia no puede convertir el perfil predeterminado en rol efectivo por ausencia de turno.

---

#### 36. Catálogo de permisos

La dependencia de permisos debe consumir el catálogo canónico vigente.

No se permite:

- inventar `PermissionKey`;
- crear strings locales;
- renombrar permisos para VISO;
- usar nombres de rol como sustituto.

---

#### 37. Matriz base

La matriz base de roles y permisos debe preservarse como fuente compartida.

La unidad puede materializar el soporte administrativo que el package requiera.

La decisión real queda reservada a `VISO-CORE-004`.

---

#### 38. Matriz operativa

La matriz operativa debe permanecer separada de la matriz base.

No se permite mezclar permisos permanentes y permisos dependientes de operación en una sola tabla local por simplificación.

---

#### 39. Concesiones individuales

Cuando una unidad necesite administrar concesiones individuales, debe reutilizar el contrato canónico vigente.

No se autoriza crear una colección VISO independiente.

---

#### 40. Denegaciones

Las denegaciones canónicas deben seguir siendo visibles como dependencia de configuración.

`VISO-CORE-003` no redefine precedencia ni evaluación.

Eso pertenece a autorización real.

---

#### 41. Catálogo versionado

Cuando el modelo canónico exponga versión de catálogo o contrato, la unidad debe conservarla en su evidencia física.

No se acepta una materialización que no pueda demostrar contra qué versión fue construida.

---

#### 42. Contexto efectivo

El contexto efectivo es una composición.

No es una tabla monolítica obligatoria.

Puede depender de:

- trabajador;
- sede;
- área;
- rol base;
- rol operativo;
- turno;
- check-in;
- dispositivo;
- permiso;
- recurso.

Cada hecho conserva su fuente.

---

#### 43. app_operation_policies

Cuando el contrato vigente use políticas de operación por aplicación o acción, la unidad debe consumirlas como definición de prerrequisitos.

La política puede indicar si una acción necesita:

- turno;
- check-in;
- dispositivo;
- otras condiciones.

No concede el permiso por sí sola.

---

#### 44. Contexto administrativo

Una capacidad administrativa puede no exigir turno ni check-in.

La unidad no debe fabricar un turno para completar contexto.

Debe respetar el carril administrativo definido por el contrato.

---

#### 45. Contexto operativo

Cuando una capacidad operativa sí exige prerrequisitos, todos deben provenir de fuentes reales y vigentes.

La ausencia de un dato requerido no se corrige con fallback permisivo.

---

#### 46. Programación laboral condicionada

`employee_shifts` entra en `VISO-CORE-003` únicamente cuando una unidad física requiera programación o turno como dependencia real.

No es una dependencia universal de todas las unidades.

---

#### 47. VISO-SCH-008

Una unidad que dependa de programación laboral solo puede materializar ese vínculo después de que el contrato aplicable de `VISO-SCH-008` esté cerrado y el package correspondiente lo permita.

`VISO-CORE-003` no adelanta ni completa `VISO-SCH-001` a `VISO-SCH-008`.

---

#### 48. Estado publicado del turno

Cuando el contrato operativo exige turno, un borrador no equivale a turno efectivo.

La unidad debe consumir la revisión publicada o el estado que el contrato vigente defina como operativo.

---

#### 49. Rol operativo del turno

Cuando el turno sea la fuente aprobada del rol operativo efectivo, la unidad debe conservar ese vínculo.

No puede reemplazarlo por:

- perfil predeterminado;
- último rol usado;
- rol base;
- selección del cliente.

---

#### 50. Asistencia condicionada

Los hechos de asistencia entran únicamente cuando la política de la capacidad evaluada exige presencia o check-in.

ANIMA conserva la captura de asistencia.

VISO consume el hecho necesario.

---

#### 51. attendance_logs y contratos vigentes

Si la unidad física usa `attendance_logs` u otra representación canónica vigente de asistencia, debe tratarla como fuente de presencia.

No puede inferir desde ella:

- permiso;
- rol operativo;
- autoridad administrativa.

---

#### 52. Dispositivo condicionado

El contexto de dispositivo se consume únicamente cuando el contrato de la capacidad lo exige.

`VISO-CORE-003` no implementa el ciclo integral de:

- enrolamiento;
- rotación;
- suspensión;
- revocación;
- retiro;

de dispositivos compartidos.

---

#### 53. Dispositivo compartido

Cuando una unidad dependa de un dispositivo compartido, debe consumir la identidad y límites canónicos del dispositivo.

No se permite heredar privilegios administrativos del principal técnico al trabajador efectivo.

---

#### 54. Procedencia mínima

Toda dependencia materializada debe poder identificar su procedencia suficiente para que las tareas posteriores expliquen una decisión.

Como mínimo, cuando aplique:

- fuente;
- versión;
- sujeto;
- territorio;
- rol;
- permiso;
- vigencia.

---

#### 55. Control y explicabilidad en esta tarea

`VISO-CORE-003` materializa únicamente las dependencias que permiten explicar posteriormente.

No implementa:

- motor de conflictos;
- bitácora final;
- investigación;
- exporte;
- decisión de autorización.

---

#### 56. Frontera con VISO-CORE-004

`VISO-CORE-004` recibe las dependencias administrativas ya disponibles por unidad.

`VISO-CORE-004` es responsable de:

- autorización real;
- permiso exacto;
- actor efectivo;
- territorio efectivo;
- contexto requerido;
- decisión fail-closed;
- protección de lecturas y mutaciones.

`VISO-CORE-003` no adelanta esos resultados.

---

#### 57. Frontera con VISO-CORE-005

`VISO-CORE-005` recibe dependencias y autorización real ya materializadas.

Es responsable de:

- detectar conflictos;
- conservar auditoría aplicable;
- correlacionar evidencia;
- soportar explicación de cambios.

`VISO-CORE-003` no absorbe ese control.

---

#### 58. Frontera con VISO-CORE-006

`VISO-CORE-006` certifica el núcleo.

No puede considerar una dependencia como cumplida solo porque esta tarea documental la describa.

Debe existir evidencia física por cada unidad aplicable.

---

#### 59. Frontera con TALENTO

TALENTO conserva el pre-vínculo laboral.

La unidad de core consume únicamente el resultado laboral aprobado que necesite para crear o mantener la relación administrativa correspondiente.

No duplica candidatura ni expediente de selección.

---

#### 60. Frontera con ANIMA

ANIMA conserva la experiencia del trabajador y la captura de asistencia.

La unidad del core puede consumir:

- trabajador;
- estado laboral;
- turno publicado cuando aplique;
- presencia cuando aplique.

No captura asistencia en paralelo.

---

#### 61. Frontera con SHELL

SHELL conserva contratos compartidos de identidad, autorización y contexto.

Una dependencia administrativa de VISO no puede crear:

- autenticación local paralela;
- permiso local equivalente;
- evaluador alterno.

---

#### 62. Frontera con aplicaciones operativas

NEXO, FOGO, ORIGO, PULSO y demás aplicaciones conservan sus procesos.

La unidad del core puede proveer hechos administrativos compartidos.

No absorbe la lógica operativa del consumidor.

---

#### 63. Frontera con Supabase

Toda migración, función, trigger, RLS, grant, RPC, Storage, Realtime, cron, cola o Edge Function de VENTO que resulte necesaria se gobierna desde `vento-group-sas/vento-shell`.

La existencia de una instancia de VISO no autoriza cambios manuales remotos.

---

#### 64. Inventario obligatorio por unidad

Antes de cambiar físicamente una dependencia, la instancia deberá inventariar:

| Elemento | Pregunta obligatoria |
| --- | --- |
| Necesidad | ¿qué dominio del core la necesita? |
| Propietario | ¿quién es fuente del hecho? |
| Representación actual | ¿qué objeto o contrato vigente lo representa? |
| Consumidores | ¿qué aplicaciones lo usan? |
| Estado | ¿ya satisface el contrato? |
| Cambio | ¿se reutiliza, adapta o materializa? |
| Compatibilidad | ¿qué consumidor legacy podría romperse? |
| Rollback | ¿cómo se revierte sin pérdida? |
| Validación | ¿qué prueba demuestra la equivalencia? |

---

#### 65. Resultado permitido cuando la dependencia ya existe

Si la dependencia ya existe y satisface el contrato, la unidad debe reutilizarla.

Un resultado físico válido puede ser:

```text
SIN CAMBIO DE ESQUEMA
+
BINDING VERIFICADO
+
EVIDENCIA DE COMPATIBILIDAD
```

No se exige una migración artificial para demostrar trabajo.

---

#### 66. Resultado permitido cuando existe parcialmente

Si la dependencia existe pero no satisface el contrato, la unidad puede adaptar únicamente la brecha autorizada por su package.

Debe preservar:

- consumidores actuales;
- datos históricos;
- rollback;
- compatibilidad;
- ownership.

---

#### 67. Resultado permitido cuando falta

Si la dependencia falta y la unidad la necesita, la materialización debe estar prevista por el package y por el alcance físico de la instancia.

La tarea no permite crear una dependencia no trazada por el package.

---

#### 68. Dependencia no aplicable

Si una dependencia condicionada no aplica a la unidad, la evidencia debe demostrar por qué.

No debe crearse "por si acaso".

Ejemplos típicos:

- turno en una unidad puramente administrativa;
- check-in en una capacidad administrativa;
- dispositivo en una acción que no lo exige.

---

#### 69. Dependencia bloqueada

Si una dependencia requerida pertenece a una tarea o package todavía no cerrado, la unidad permanece bloqueada.

No se permite sustituir la dependencia por:

- mock productivo;
- fallback permisivo;
- dato hardcoded;
- duplicado local.

---

#### 70. Compatibilidad con AS-IS de VISO

La existencia actual en `vento-viso` de consumidores de estructuras administrativas no convierte esas estructuras en contratos locales definitivos.

La instancia debe contrastarlas con el modelo canónico antes de conservarlas.

---

#### 71. Estructuras físicas existentes relevantes

Entre las estructuras que pueden aparecer en el AS-IS se encuentran:

- `employees`;
- `sites`;
- `areas`;
- `employee_sites`;
- `employee_areas`;
- `operational_roles`;
- `site_operational_roles`;
- `employee_site_operational_profiles`;
- `employee_shifts`;
- `attendance_logs`;
- matrices y asignaciones de permiso vigentes.

La lista no autoriza crear objetos faltantes por inferencia.

---

#### 72. Base role legacy

Si el AS-IS representa rol base mediante campos o matrices legacy, la unidad debe preservar compatibilidad hasta que el contrato de transición permita retirarlos.

No se crea un segundo rol base solo para alinear nombres.

---

#### 73. Matrices legacy

`role_permissions` y `employee_permissions`, cuando sigan activas en consumidores, deben tratarse bajo el contrato de compatibilidad vigente.

La unidad no puede eliminarlas o declararlas canónicas sin evidencia de propietario, consumidores y transición.

---

#### 74. operational_role_permissions

Cuando la matriz operativa vigente se represente mediante `operational_role_permissions`, la unidad debe verificar:

- catálogo;
- rol operativo;
- sede cuando aplique;
- compatibilidad con consumidores.

La evaluación final pertenece a `VISO-CORE-004`.

---

#### 75. Evitar fuentes competidoras

Queda prohibido materializar pares equivalentes como:

```text
FUENTE COMPARTIDA
+
COPIA VISO EDITABLE
```

si ambas pueden divergir.

Una proyección de lectura debe ser derivada o sincronizada bajo un contrato explícito, no una segunda fuente.

---

#### 76. Constraints e integridad

Cuando la unidad introduzca o endurezca constraints, debe verificar antes:

- duplicados;
- huérfanos;
- vigencias inválidas;
- referencias históricas;
- consumidores legacy.

No se impone un constraint que haga ilegible historia válida sin plan de transición.

---

#### 77. RLS y grants

Si la materialización toca RLS o grants, debe conservar mínimo privilegio.

Sin embargo, el hecho de que una policy o grant exista no completa `VISO-CORE-004`.

La autorización de negocio sigue siendo responsabilidad posterior.

---

#### 78. SECURITY DEFINER

Una función `SECURITY DEFINER` no puede introducirse como atajo administrativo.

Si una unidad autorizada requiere una función de ese tipo, debe cumplir el contrato de seguridad vigente:

- owner controlado;
- `search_path` seguro;
- grants mínimos;
- validación interna;
- prueba negativa.

---

#### 79. service_role

`service_role` es una credencial técnica.

No es autorización de negocio.

Su uso no permite omitir:

- actor;
- permiso;
- territorio;
- contexto;
- auditoría.

---

#### 80. Datos históricos

La adaptación de dependencias administrativas debe ser no destructiva por defecto.

No se permite eliminar:

- trabajador histórico;
- relación territorial histórica;
- rol histórico;
- turno histórico;
- evidencia requerida;

solo para simplificar el nuevo modelo.

---

#### 81. Migraciones

Cuando una unidad requiera migración Supabase:

1. pertenece a `vento-group-sas/vento-shell`;
2. debe estar versionada;
3. debe incluir estrategia de compatibilidad;
4. debe tener rollback;
5. debe pasar los validadores físicos definidos por su instancia.

Esta tarea documental no crea la migración.

---

#### 82. Tipos generados

Si un cambio físico autorizado altera contrato de datos consumido por aplicaciones, la instancia debe actualizar los tipos generados o contratos compartidos que correspondan.

No se permite drift silencioso entre esquema y consumidores.

---

#### 83. Consumidores

Antes de retirar o renombrar una dependencia, la instancia debe identificar consumidores actuales.

Como mínimo debe revisar los repositorios incluidos por su package.

Una búsqueda incompleta no autoriza un retiro.

---

#### 84. Compatibilidad de VISO

Cuando `vento-viso` ya consuma la dependencia, la materialización debe demostrar que:

- lectura sigue funcionando;
- escritura autorizada sigue siendo compatible;
- no aparece una fuente local paralela;
- los nombres legacy solo permanecen cuando exista contrato de transición.

---

#### 85. Compatibilidad de otras aplicaciones

Si una dependencia es compartida, la unidad no puede optimizarla exclusivamente para VISO.

Debe preservar consumidores operativos declarados por el package.

---

#### 86. Frescura

Una dependencia administrativa sensible a cambios debe poder invalidar resultados stale según su contrato.

Cambios relevantes pueden incluir:

- estado laboral;
- sede;
- área;
- rol;
- perfil;
- turno;
- grant;
- deny;
- dispositivo;
- catálogo.

La implementación exacta de decisión corresponde a `VISO-CORE-004`.

---

#### 87. Idempotencia

Reejecutar la materialización autorizada no debe crear duplicados semánticos.

La unidad debe distinguir entre:

- objeto ya conforme;
- cambio pendiente;
- cambio aplicado.

No debe insertar otra fila equivalente solo porque el proceso se repita.

---

#### 88. Concurrencia

Si la unidad modifica configuración administrativa mutable, deberá utilizar el control de concurrencia definido por el contrato propietario.

No se permite sobrescritura silenciosa de una revisión más reciente.

---

#### 89. Rollback

Cada cambio físico debe tener rollback proporcional.

El rollback no puede:

- destruir evidencia;
- reactivar autoridad revocada;
- perder relaciones históricas;
- restaurar una fuente legacy insegura sin gate.

---

#### 90. Seguridad de secretos

La materialización no puede mover al cliente:

- service role;
- secretos;
- claves privadas;
- credenciales de infraestructura.

Las dependencias administrativas deben exponerse mediante contratos seguros.

---

#### 91. Superficie administrativa

`VISO-CORE-003` no exige crear una pantalla para considerar una dependencia materializada.

La UI se desarrolla en sus tareas propietarias.

Una dependencia puede quedar físicamente lista antes de una superficie visual.

---

#### 92. Server Actions y endpoints

Esta tarea no crea por sí sola una Server Action o endpoint específico.

Si una unidad autorizada los necesita como adaptación de dependencia, deben permanecer dentro del alcance del package y no implementar todavía autorización real ajena a `VISO-CORE-004`.

---

#### 93. Exportes

No se materializa el exporte de matriz de acceso.

La ausencia de una capacidad canónica exacta de exportación continúa como bloqueo físico de ese comportamiento.

No se crea una `PermissionKey` desde esta tarea.

---

#### 94. Conflictos

No se implementa el motor de conflictos.

`VISO-CORE-003` solo debe evitar producir datos incompatibles con las reglas canónicas conocidas.

La detección y presentación sistemática pertenece a `VISO-CORE-005`.

---

#### 95. Auditoría

La instancia debe conservar las referencias necesarias para que la auditoría posterior sea posible.

No declara completada la auditoría del núcleo.

Ese resultado pertenece a `VISO-CORE-005`.

---

#### 96. Evidencia física mínima futura

Cada instancia física deberá poder demostrar:

1. package propietario;
2. `implementation_unit_id`;
3. repositorio y ambiente objetivo;
4. dominios de core afectados;
5. dependencias requeridas;
6. fuente canónica de cada dependencia;
7. objeto o contrato físico reutilizado o cambiado;
8. consumidores revisados;
9. cambios aplicados;
10. rollback;
11. validaciones físicas aplicables;
12. ausencia de fuente competidora.

La forma física de esa evidencia la gobierna el lifecycle vigente.

---

#### 97. Criterio de completitud por unidad

Una unidad puede declarar completado `VISO-CORE-003` únicamente cuando todas sus dependencias obligatorias:

- existen;
- están vinculadas a una fuente canónica;
- satisfacen el contrato;
- tienen compatibilidad demostrada;
- tienen rollback cuando hubo cambio.

Y todas las dependencias condicionadas:

- están materializadas porque aplican; o
- tienen evidencia de no aplicabilidad.

---

#### 98. Criterio de bloqueo

La unidad no puede cerrarse si:

- falta una dependencia obligatoria;
- una dependencia condicionada aplica pero no está disponible;
- se desconoce el owner;
- existe una fuente competidora no resuelta;
- no existe rollback de un cambio físico;
- el package no cubre el cambio;
- la unidad fue inventada fuera de E5.

---

#### 99. No equivalencia entre task aprobada e instancia implementada

Debe conservarse:

```text
VISO-CORE-003 DOCUMENTAL APROBADA
≠
INSTANCIA FÍSICA IMPLEMENTADA
```

La aprobación documental solo define el contrato reutilizable.

---

#### 100. Handoff físico a VISO-CORE-004

Por cada unidad implementada, `VISO-CORE-004` deberá recibir:

- identidad exacta de la unidad;
- dependencias administrativas materializadas;
- versiones de contratos;
- bindings físicos;
- territorio y asignaciones disponibles;
- catálogo y matrices disponibles;
- dependencias condicionadas aplicables;
- evidencia de compatibilidad.

No recibe una promesa narrativa.

---

#### 101. Handoff físico a VISO-CORE-005

`VISO-CORE-005` deberá recibir posteriormente:

- dependencias de `VISO-CORE-003`;
- autorización real de `VISO-CORE-004`;
- referencias de procedencia;
- puntos donde deben detectarse conflictos;
- puntos donde debe conservarse evidencia.

---

#### 102. Handoff documental a VISO-CORE-004

El siguiente contrato deberá desarrollar cómo cada unidad consume estas dependencias para producir autorización real fail-closed.

No deberá volver a redefinir la estructura administrativa mínima ya fijada aquí.

---

#### 103. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea organiza y delimita la materialización futura de dependencias ya gobernadas por requisitos vigentes. No introduce una nueva regla protegida independiente que requiera un identificador adicional.

---

#### 104. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, la tarea reutiliza la cobertura existente de:

- `TREQ-AUTH-001` — autorización mediante permisos, contexto y alcance canónicos;
- `TREQ-AUTH-004` — equivalencia entre evaluadores;
- `TREQ-AUTH-007` — administración explícita y territorial;
- `TREQ-AUTH-008` — separación de prerrequisitos administrativos y operativos;
- `TREQ-AUTH-009` — resolución territorial determinista;
- `TREQ-AUTH-015` — evidencia correlacionable;
- `TREQ-VISO-001` — coherencia entre configuración administrativa de VISO y resultado consumido por aplicaciones;
- `TREQ-SUPABASE-011` — estructura organizacional y territorial tipada, estable y no competidora.

Estas referencias son trazabilidad heredada.

No actualizan el registro.

---

#### 105. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería documental no se ha ejecutado todavía sobre el checkout local de la rama de `VISO-CORE-003`. |
| LOCAL | NOT_EXECUTED | El bloque aún no ha sido insertado, normalizado ni validado dentro de la rama documental local. |
| REMOTA | PASS | Se verificaron `main`, cierre de `VISO-CORE-002`, continuidad, owner, topología, gates, políticas de tarea, handoffs de `VISO-CORE-001` y `VISO-CORE-002`, contratos de identidad/roles/contexto, AS-IS administrativo relevante, Registro 04A y scripts documentales vigentes. |
| OPERATIVA | NOT_APPLICABLE | La entrega documental no cambia trabajadores, asignaciones, turnos, asistencia, permisos, contexto ni operación real. |
| FÍSICA | NOT_EXECUTED | La tarea define un contrato `PER_IMPLEMENTATION_UNIT`; ninguna instancia física de `VISO-CORE-003` existe o se ejecuta mediante esta aprobación documental. |

---

#### 106. Criterios de aceptación

- [ ] Se conservan exactamente seis dominios mínimos.
- [ ] Se conserva el handoff de quince subcapacidades aprobado en `VISO-CORE-002`.
- [ ] La topología es `PER_IMPLEMENTATION_UNIT`.
- [ ] El gate es `POST_E5_PACKAGE`.
- [ ] No existe implementación global previa a E5.
- [ ] El `implementation_unit_id` proviene del package E5.
- [ ] No se inventan unidades por archivo, tabla o pantalla.
- [ ] Cada unidad materializa solo dependencias de su alcance.
- [ ] Reuso precede a creación.
- [ ] No se crean fuentes VISO paralelas.
- [ ] La identidad laboral permanece separada de autenticación.
- [ ] La identidad laboral permanece separada del episodio laboral.
- [ ] `employees` no se interpreta como autorización.
- [ ] El retiro laboral puede cerrar relaciones sin destruir historia.
- [ ] El reingreso no reactiva autoridad antigua.
- [ ] La estructura organizacional conserva identidades tipadas.
- [ ] `sites` no se interpreta como permiso.
- [ ] `areas` no se interpreta como rol o permiso.
- [ ] `employee_sites` expresa cobertura y no autoridad.
- [ ] `employee_areas` expresa cobertura y no autoridad.
- [ ] Rol base y rol operativo permanecen separados.
- [ ] `operational_roles` conserva identidad operativa canónica.
- [ ] `site_operational_roles` expresa elegibilidad por sede.
- [ ] `employee_site_operational_profiles` se usa solo como perfil de planificación.
- [ ] El perfil predeterminado no se convierte en rol efectivo.
- [ ] El catálogo de permisos se consume sin inventar claves.
- [ ] Matriz base y matriz operativa permanecen separadas.
- [ ] Grants y denies reutilizan contratos canónicos.
- [ ] `VISO-CORE-003` no redefine precedencia de autorización.
- [ ] El contexto se compone sin crear una tabla monolítica obligatoria.
- [ ] Las políticas de operación definen prerrequisitos.
- [ ] Las capacidades administrativas no fabrican turno.
- [ ] Las capacidades operativas no omiten prerrequisitos.
- [ ] `employee_shifts` es dependencia condicionada.
- [ ] Programación laboral no se activa automáticamente.
- [ ] Una unidad que requiera programación respeta el cierre de `VISO-SCH-008`.
- [ ] Un turno borrador no se trata como operativo.
- [ ] El rol efectivo del turno no se reemplaza por perfil predeterminado.
- [ ] Asistencia es dependencia condicionada.
- [ ] ANIMA conserva captura de asistencia.
- [ ] Check-in no concede permiso.
- [ ] Dispositivo es dependencia condicionada.
- [ ] La tarea no absorbe ciclo integral de dispositivos.
- [ ] SHELL conserva identidad, autorización y contexto compartidos.
- [ ] TALENTO conserva pre-vínculo.
- [ ] Aplicaciones operativas conservan sus procesos.
- [ ] Supabase no se interpreta como owner empresarial.
- [ ] Cambios Supabase de VENTO permanecen versionados desde `vento-shell`.
- [ ] Cada unidad inventaría owner, fuente, consumidores y representación actual.
- [ ] Una dependencia conforme puede cerrar sin migración artificial.
- [ ] Una dependencia parcial solo adapta la brecha autorizada.
- [ ] Una dependencia ausente solo se crea si el package la requiere.
- [ ] Una dependencia condicionada no aplicable no se materializa.
- [ ] Una dependencia requerida bloqueada no usa fallback permisivo.
- [ ] El AS-IS de VISO se contrasta con contratos canónicos.
- [ ] Estructuras legacy no se elevan a canónicas por conveniencia.
- [ ] `role_permissions` legacy conserva transición cuando siga consumido.
- [ ] `employee_permissions` legacy conserva transición cuando siga consumido.
- [ ] `operational_role_permissions` se valida contra catálogo y rol.
- [ ] No se crea fuente compartida más copia editable VISO.
- [ ] Constraints verifican duplicados y huérfanos antes de endurecer.
- [ ] RLS y grants conservan mínimo privilegio.
- [ ] RLS no sustituye `VISO-CORE-004`.
- [ ] `SECURITY DEFINER` no se usa como bypass.
- [ ] `service_role` no se interpreta como autoridad de negocio.
- [ ] Cambios físicos son no destructivos por defecto.
- [ ] Toda migración VENTO de Supabase pertenece a `vento-shell`.
- [ ] Contratos y tipos consumidores se mantienen sincronizados.
- [ ] Los consumidores se identifican antes de retirar objetos.
- [ ] La compatibilidad de `vento-viso` se valida.
- [ ] Dependencias compartidas no se optimizan solo para VISO.
- [ ] Cambios relevantes pueden invalidar resultados stale.
- [ ] La materialización es idempotente.
- [ ] Configuración concurrente respeta el contrato propietario.
- [ ] Cada cambio tiene rollback proporcional.
- [ ] Secretos no se mueven al cliente.
- [ ] No se exige UI para completar esta tarea.
- [ ] Server Actions o endpoints solo existen si una unidad autorizada los necesita.
- [ ] No se materializa exporte de matriz.
- [ ] No se crea nueva `PermissionKey`.
- [ ] No se implementa motor de conflictos.
- [ ] No se declara auditoría completada.
- [ ] Cada instancia futura conserva evidencia física mínima.
- [ ] Toda dependencia obligatoria queda conforme antes de cerrar la unidad.
- [ ] Toda dependencia condicionada queda materializada o justificada como no aplicable.
- [ ] Una fuente competidora no resuelta bloquea el cierre.
- [ ] Una unidad inventada fuera de E5 bloquea el cierre.
- [ ] Aprobación documental no se trata como implementación física.
- [ ] `VISO-CORE-004` recibe bindings y versiones reales por unidad.
- [ ] `VISO-CORE-005` conserva conflicto y auditoría.
- [ ] `VISO-CORE-006` conserva certificación final.
- [ ] No se crean requisitos de prueba.
- [ ] No se modifican requisitos de prueba.
- [ ] No se modifica el Registro Canónico de Requisitos de Prueba.

---

#### 107. Límites

Esta tarea no:

- crea un package;
- selecciona un package;
- cambia el orden lineal de packages;
- crea manualmente un `implementation_unit_id`;
- crea una instancia global;
- ejecuta una instancia física desde el carril documental;
- autoriza una instancia física;
- modifica `implementation-control.json` por inferencia;
- implementa autorización real;
- crea un evaluador de permisos;
- redefine la precedencia de grants y denies;
- crea un catálogo local de permisos;
- crea `PermissionKey`;
- implementa detección de conflictos;
- implementa auditoría final del núcleo;
- implementa exporte de matriz;
- completa `VISO-SCH-001` a `VISO-SCH-008`;
- publica turnos;
- registra asistencia;
- reemplaza la captura de ANIMA;
- implementa el ciclo integral de dispositivos compartidos;
- absorbe procesos de NEXO, FOGO, ORIGO o PULSO;
- absorbe el dominio prelaboral de TALENTO;
- crea una fuente de identidad VISO;
- crea una fuente territorial competidora;
- crea una fuente de permisos competidora;
- crea una fuente de contexto competidora;
- elimina legacy sin gate de transición;
- ejecuta migraciones;
- modifica Supabase remoto;
- modifica Auth;
- modifica Storage;
- modifica Realtime;
- modifica Edge Functions;
- modifica cron;
- modifica colas;
- modifica secretos;
- modifica datos productivos;
- crea UI final;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica el Registro Canónico de Requisitos de Prueba.

---

#### 108. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-CORE-002 — Vincular núcleo con capacidades empresariales`

**TAREA ACTUAL APROBADA**
`VISO-CORE-003 — Implementar dependencias administrativas mínimas`

**SIGUIENTE TAREA RESERVADA**
`VISO-CORE-004 — Implementar autorización real del núcleo`


### ✅ VISO-CORE-004 — Implementar autorización real del núcleo

**Estado:** APROBADA
**Tarea anterior:** VISO-CORE-003 — Implementar dependencias administrativas mínimas
**Tarea siguiente:** VISO-CORE-005 — Implementar validación de conflictos y auditoría
**Tipo de tarea:** contrato documental de autorización real por unidad de implementación; define cómo cada unidad física válida del núcleo de VISO debe consumir la fundación canónica compartida de contexto, evaluación, frescura y persistencia para proteger lecturas y mutaciones con permiso exacto, actor efectivo, territorio, recurso y contexto real, cerrando evaluadores locales y bypasses dentro del alcance de la unidad sin ejecutar ahora ninguna instancia física
**Bloque:** `G_VISO — NÚCLEO MÍNIMO PARA OPERACIÓN`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/02_NUCLEO_MINIMO_PARA_OPERACION.md`
**Estado físico resultante:** contrato de autorización real por `implementation_unit_id` definido; ninguna instancia física de `VISO-CORE-004` se crea, autoriza, ejecuta ni certifica por la aprobación documental de esta tarea
**Cambios físicos autorizados:** únicamente dentro de una futura instancia válida `VISO-CORE-004::implementation_unit_id` habilitada por `PER_IMPLEMENTATION_UNIT` y `POST_E5_PACKAGE`: enlazar consumidores aplicables con la fundación canónica de autorización, retirar o bloquear evaluadores locales como autoridad final dentro del alcance aprobado, proteger lecturas y mutaciones en servidor y añadir las pruebas y adaptaciones estrictamente previstas por el package; ningún cambio físico se autoriza fuera de la unidad, package, repositorios y gates que la creen
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo una unidad física válida del núcleo de VISO debe producir autorización real y fail-closed utilizando exclusivamente las fuentes, contratos y evaluadores canónicos compartidos.

La tarea no crea un nuevo modelo de autorización ni un evaluador propio de VISO.

Su resultado es el contrato reutilizable que gobierna cada futura materialización física de `VISO-CORE-004`.

---

#### 2. Regla raíz

La autorización real del núcleo se resuelve así:

```text
OPERACIÓN PROTEGIDA
+
PERMISO CANÓNICO EXACTO
+
PRINCIPAL REAL
+
ACTOR EFECTIVO REAL
+
RECURSO RESUELTO
+
TERRITORIO EFECTIVO
+
CONTEXTO EXIGIDO POR EL CONTRATO
+
CONTRATO Y DATASETS VIGENTES
+
FRESCURA VÁLIDA
→
EVALUADOR CANÓNICO COMPARTIDO
→
ALLOW O DENY
```

Nunca:

```text
ROL VISIBLE
+
PANTALLA VISIBLE
+
COOKIE
+
HELPER LOCAL
→
AUTORIZACIÓN REAL
```

---

#### 3. Entrada obligatoria de VISO-CORE-003

Cada futura unidad recibe de `VISO-CORE-003`:

- identidad exacta de la unidad;
- dependencias administrativas materializadas;
- versiones de contratos;
- bindings físicos;
- territorio y asignaciones disponibles;
- catálogo y matrices disponibles;
- dependencias condicionadas aplicables;
- evidencia de compatibilidad.

Una unidad de autorización no puede inventar una dependencia faltante para continuar.

---

#### 4. Continuidad física por unidad

La autorización debe corresponder al mismo `implementation_unit_id` que gobierna las dependencias administrativas aplicables.

La autorización no puede trasladarse a otra unidad por conveniencia técnica.

Si varias unidades consumen una fundación compartida, cada una demuestra su binding y cobertura sin duplicar la fundación.

---

#### 5. Topología obligatoria

`VISO-CORE-004` usa:

```text
PER_IMPLEMENTATION_UNIT
POST_E5_PACKAGE
```

No existe instancia física global ni ejecución previa a E5.

---

#### 6. Identidad de instancia

Una futura instancia válida deriva su identidad de:

```text
VISO-CORE-004
+
implementation_unit_id canónico
```

El `implementation_unit_id` proviene del package E5 aplicable y no se crea manualmente desde esta tarea.

---

#### 7. Gate temporal

La materialización física requiere:

- package aplicable existente;
- unidad definida canónicamente;
- dependencias físicas disponibles;
- gate `POST_E5_PACKAGE` satisfecho;
- lifecycle físico autorizado para la instancia exacta.

La aprobación documental no satisface esos gates.

---

#### 8. Fundación compartida obligatoria

La autorización real debe reutilizar la fundación transversal ya materializada por el modelo de autorización.

La unidad no crea:

- otro `AccessContext`;
- otro evaluador final;
- otra taxonomía de decisión;
- otra política de frescura;
- otra persistencia de decisión;
- otra fuente de catálogo.

---

#### 9. Resolver canónico de contexto

La unidad consume el resolver canónico de contexto o la proyección segura aprobada que corresponda.

No reconstruye manualmente un contexto equivalente desde tablas sueltas para decidir autoridad.

---

#### 10. Evaluador canónico

La decisión final procede del evaluador canónico compartido o del entrypoint seguro vigente que lo encapsule.

La unidad no implementa evaluadores paralelos en:

- React;
- Server Components;
- Server Actions;
- Route Handlers;
- middleware;
- helpers locales;
- RPC ad hoc;
- políticas improvisadas;
- código cliente.

---

#### 11. Persistencia de decisión

Cuando el contrato vigente exige persistencia, la unidad utiliza el coordinador y la persistencia canónicos ya materializados.

No crea un log alterno de decisiones para sustituir esa evidencia.

---

#### 12. Frescura de contexto

La unidad consume el mecanismo compartido de frescura e invalidación.

Un `ALLOW` anterior no sobrevive como autoridad cuando cambia un hecho invalidante.

---

#### 13. Contrato activo, no cardinalidad histórica

La unidad consume la versión activa del contrato y su evidencia de release.

No codifica como verdad eterna:

- una cantidad fija de permisos;
- una cantidad fija de recursos;
- una versión histórica concreta;
- un hash histórico concreto.

Versiones y huellas observadas se registran como evidencia de ejecución.

---

#### 14. Catálogo exacto

Toda acción protegida se vincula a una capacidad existente en el catálogo canónico activo.

No se permite:

- inventar claves;
- usar wildcards;
- aceptar aliases no aprobados;
- derivar permisos desde rutas;
- derivar permisos desde nombres de componentes;
- derivar permisos desde nombres de roles;
- elegir un permiso más débil desde el cliente.

---

#### 15. Identidad de aplicación

Las capacidades del núcleo utilizan la aplicación canónica:

```text
viso
```

La existencia de la aplicación no concede acceso.

---

#### 16. Acceso a VISO

`viso.access` representa acceso a la aplicación cuando el contrato lo exige.

No sustituye el permiso de una acción administrativa.

---

#### 17. Permiso por acción

Cada operación protegida declara exactamente qué permiso exige.

La relación queda trazable como:

```text
OPERACIÓN
→ PERMISO EXACTO
→ RECURSO
→ REQUISITO DE AUTORIZACIÓN
→ DECISIÓN
```

Una pantalla con varias mutaciones puede exigir permisos distintos.

---

#### 18. Permiso común

Un permiso común solo puede proteger varias acciones cuando el contrato canónico vigente define expresamente que comparten la misma capacidad sin ampliar autoridad.

La conveniencia técnica no justifica un permiso común.

---

#### 19. Registro de bindings por unidad

Cada unidad debe conservar una fila por operación protegida con:

| Campo | Contenido obligatorio |
| --- | --- |
| operación | identidad estable de la acción o lectura |
| canal | página, Server Action, Route Handler, RPC, Data API u otro canal aplicable |
| permiso | clave canónica exacta |
| recurso | contrato de recurso aplicable |
| carril | requisito de autorización vigente |
| territorio | fuente y regla de alcance |
| mutación | sí o no |
| binding actual | entrypoint de autorización utilizado |
| resultado de migración | canónico, bloqueado o fuera de alcance |
| evidencia | prueba positiva y negativa aplicable |

No se cierra la unidad con operaciones protegidas sin decisión explícita.

---

#### 20. Concesiones base

La administración de concesiones base conserva exactamente:

```text
viso.authorization.base_grants.view
viso.authorization.base_grants.create
viso.authorization.base_grants.approve
viso.authorization.base_grants.suspend
viso.authorization.base_grants.revoke
```

No se fusionan bajo un permiso genérico.

---

#### 21. Concesiones operativas

La administración de concesiones operativas conserva:

```text
viso.authorization.operational_grants.view
viso.authorization.operational_grants.create
viso.authorization.operational_grants.approve
viso.authorization.operational_grants.suspend
viso.authorization.operational_grants.revoke
```

Una capacidad base no sustituye su equivalente operacional.

---

#### 22. Denegaciones

La administración de denegaciones conserva:

```text
viso.authorization.denials.view
viso.authorization.denials.create
viso.authorization.denials.approve
viso.authorization.denials.revoke
```

No existe una capacidad de suspensión de denegaciones y la unidad no puede crearla.

---

#### 23. Prohibición de manage genérico

La unidad no sustituye las catorce capacidades anteriores por:

```text
viso.authorization.manage
```

ni por otro permiso genérico local.

---

#### 24. Lectura de auditoría

Cuando una unidad consulte historial de seguridad conforme al contrato aprobado, la capacidad exacta de lectura permanece:

```text
viso.authorization.audit_logs.view
```

No concede mutaciones.

---

#### 25. Simulación

La simulación conserva su permiso y contrato separados de la autoridad real.

Una decisión simulada nunca autoriza una mutación empresarial.

---

#### 26. Exportación de matriz

La exportación de matriz continúa bloqueada físicamente mientras no exista la capacidad canónica exacta aprobada para exportar.

La unidad no reutiliza auditoría, simulación, `viso.access` ni lectura de grants como permiso de exportación.

---

#### 27. Otras operaciones del núcleo

Para personas, sedes, áreas, perfiles, asignaciones, catálogos u otras operaciones no enumeradas aquí, la unidad resuelve la clave exacta desde el catálogo activo y el package aplicable.

Si no existe capacidad exacta suficiente:

```text
OPERACIÓN FÍSICA
→ BLOQUEADA
```

No se inventa una clave desde una pantalla o tabla.

---

#### 28. Principal real

El principal procede de autenticación real y contexto canónico.

No se acepta como autoridad un principal enviado en body, query string, formulario o cookie de conveniencia.

---

#### 29. Actor efectivo

El actor efectivo se resuelve desde el contexto canónico.

Un `employee_id` enviado por cliente no sustituye la resolución de actor.

---

#### 30. Separación principal y actor

Cuando principal y actor sean distintos, ambos se conservan.

El principal técnico o administrativo no transfiere su autoridad al actor operativo.

---

#### 31. Sesión válida no equivale a autorización

Una sesión válida demuestra autenticación.

No demuestra relación laboral vigente, permiso, territorio, rol operativo, turno, check-in ni autorización final.

---

#### 32. Estado laboral

Cuando el contrato exige vínculo laboral válido, una relación finalizada, suspendida o incompatible falla cerrado.

Un reingreso no reutiliza automáticamente autoridad del episodio anterior.

---

#### 33. Rol base

El rol base es contexto y fuente potencial de grants explícitos.

No es condición suficiente de `ALLOW`.

---

#### 34. Rol operativo

El rol operativo efectivo participa solo cuando el requisito lo exige.

Un perfil predeterminado no sustituye el rol operativo efectivo.

---

#### 35. Perfil operativo

El perfil puede facilitar planificación o selección administrativa.

No puede fabricar autoridad efectiva.

---

#### 36. Territorio

Toda operación territorial resuelve sede y área desde fuentes canónicas y desde el recurso cuando corresponda.

Una selección visual no constituye territorio autorizado.

---

#### 37. Sede solicitada

Una sede enviada por interfaz expresa un objetivo de solicitud.

No se convierte en sede efectiva hasta ser validada por el contrato de contexto y recurso.

---

#### 38. Área solicitada

Un área enviada por interfaz expresa un objetivo de solicitud.

No amplía cobertura ni corrige una asignación ausente.

---

#### 39. Capacidades no territoriales

Si una capacidad administrativa es no territorial, la unidad no fabrica sede o área para completar la evaluación.

---

#### 40. Capacidades territoriales

Si el contrato exige territorio, ausencia, incompatibilidad o inactividad de sede o área bloquea la operación.

No existe fallback a la última sede usada.

---

#### 41. Cobertura administrativa

Las asignaciones de sede y área delimitan cobertura.

No conceden por sí mismas el permiso solicitado.

---

#### 42. Recurso

Toda operación sobre recurso utiliza el contrato de recurso canónico.

El identificador recibido del cliente es candidato de resolución, no evidencia de acceso.

---

#### 43. Estado actual del recurso

Una mutación revalida el estado actual del recurso inmediatamente antes del efecto cuando ese estado condicione la operación.

Un estado mostrado previamente en UI no es suficiente.

---

#### 44. Columnas permitidas

Una mutación restringe en servidor las columnas modificables conforme al contrato.

Un formulario alterado no amplía el conjunto autorizado.

---

#### 45. Colecciones

Una autorización sobre colección no implica acceso irrestricto a cada fila si el contrato conserva alcance por elemento.

La unidad impide filtraciones por consultas amplias.

---

#### 46. Operaciones multirrecurso

Cuando una operación exige varios recursos o territorios, todos los elementos obligatorios deben resolverse y autorizarse según su contrato.

Una autorización parcial no oculta un extremo denegado.

---

#### 47. Carril base

Una capacidad administrativa de carril base se resuelve por el carril definido por el contrato.

No exige turno ni check-in por costumbre de la aplicación.

---

#### 48. Carril operativo

Una capacidad operacional cumple todos los prerrequisitos declarados.

No se degrada a carril base para evitar turno, check-in o rol operativo.

---

#### 49. Turno condicionado

El turno se incorpora solo cuando el requisito de autorización lo exige y debe provenir de la fuente canónica vigente.

---

#### 50. Programación laboral

`VISO-CORE-004` no activa el delta de programación laboral.

Una unidad que dependa de programación afectada por ese delta solo la consume cuando package y contrato aplicable lo permitan.

---

#### 51. Check-in condicionado

El check-in se exige solo cuando el contrato lo requiere.

No se infiere desde presencia visual, último evento o selección del trabajador.

---

#### 52. Dispositivo condicionado

El dispositivo participa cuando el contrato lo exige.

La identidad de dispositivo no sustituye al actor humano.

---

#### 53. Dispositivo compartido

En dispositivo compartido, la autoridad efectiva respeta simultáneamente actor, límites del dispositivo, aplicaciones efectivas, territorio, permiso, contexto y denegaciones.

La identidad técnica nunca concede el carril del trabajador.

---

#### 54. service_role

`service_role` es credencial técnica, no autorización de negocio.

Un backend privilegiado resuelve y autoriza actor, recurso, territorio y permiso antes de efectuar una operación protegida.

---

#### 55. SECURITY DEFINER

Una función `SECURITY DEFINER` no puede convertirse en bypass.

La unidad solo utiliza funciones aprobadas bajo el gobierno de owners, grants, `search_path` y validación interna vigente.

---

#### 56. RLS

RLS es barrera de datos y no sustituye la autorización de negocio cuando la operación exige permiso, contexto y recurso.

La unidad demuestra equivalencia entre capas aplicables.

---

#### 57. Server Actions

Toda Server Action protegida reautoriza en servidor.

Una comprobación previa en el componente no sustituye esa evaluación.

---

#### 58. Route Handlers

Todo Route Handler protegido valida sesión, actor, permiso, recurso y contexto en servidor según el contrato.

Una URL secreta no es control de acceso.

---

#### 59. RPC

Una RPC protegida no confía en que la UI ya autorizó.

Debe quedar dentro del grafo autorizado o detrás del binding servidor que garantice evaluación real.

---

#### 60. Data API

Una operación por Data API no puede ampliar lo permitido por el evaluador canónico.

Policies y grants permanecen consistentes con el alcance de la unidad.

---

#### 61. Realtime

Una suscripción no expone filas que una lectura equivalente no podría autorizar.

La invalidación impide continuidad con autoridad obsoleta.

---

#### 62. Cliente

El cliente puede solicitar una acción.

No decide principal, actor efectivo, permiso exigido, carril, scope final ni resultado.

---

#### 63. UI

Ocultar o deshabilitar una acción mejora experiencia, pero no protege backend.

La operación debe fallar de forma segura al invocarse directamente.

---

#### 64. Middleware

El middleware puede proteger navegación y sesión.

No sustituye autorización de una mutación o lectura sensible.

---

#### 65. Acceso directo

Una URL directa produce la misma decisión contractual que la navegación normal.

No crea un carril alterno.

---

#### 66. Formulario manipulado

Agregar campos o cambiar identificadores no amplía autoridad.

El servidor conserva el contrato de recurso y columnas.

---

#### 67. API manipulada

Una llamada manual a API o RPC produce la misma decisión que la UI para el mismo actor, permiso, recurso y contexto.

---

#### 68. Resultado final

La autoridad real se representa mediante:

```text
ALLOW
o
DENY
```

Solo `ALLOW` vigente habilita el efecto protegido.

---

#### 69. Fail closed

Toda condición obligatoria ausente, inválida, conflictiva, no resoluble, incompatible o técnicamente no evaluable bloquea el efecto.

No se convierte en `ALLOW` por fallback.

---

#### 70. Deny y error técnico

Una denegación de negocio y un fallo técnico permanecen distinguibles en razones y observabilidad.

Ambos impiden el efecto cuando no existe decisión positiva válida.

---

#### 71. Razones canónicas

La unidad consume las razones estructuradas de la fundación compartida.

No crea una taxonomía local alternativa para cambiar semántica de autorización.

---

#### 72. Evidencia de decisión

Cada autorización conserva, conforme al contrato, evidencia correlacionable suficiente de principal, actor efectivo, aplicación, permiso, recurso, territorio, carril, decisión, razones, versiones y timestamp.

---

#### 73. Fingerprints

La unidad conserva o propaga las huellas emitidas por la fundación compartida cuando formen parte de la decisión.

No fabrica fingerprints incompatibles para aparentar equivalencia.

---

#### 74. Catálogo y datasets

La evidencia identifica qué versión contractual y datasets participaron.

La unidad no decide con un snapshot local no gobernado.

---

#### 75. Frescura antes del efecto

Una mutación comprueba que decisión y contexto siguen vigentes inmediatamente antes del efecto cuando el contrato lo exige.

Un `ALLOW` obtenido al cargar una página no autoriza indefinidamente una escritura posterior.

---

#### 76. Eventos invalidantes

Cambios en estado laboral, sede, área, rol, perfil, turno, grant, deny, dispositivo o catálogo pueden invalidar autoridad.

La unidad respeta el mecanismo canónico de invalidación.

---

#### 77. Caché

Una caché de autorización no sobrevive a invalidación contractual.

La unidad no crea una caché local de `ALLOW` fuera del mecanismo aprobado.

---

#### 78. Offline

Una operación encolada no conserva automáticamente autoridad del momento de creación.

Debe reautorizarse al sincronizar cuando el contrato lo exige.

---

#### 79. Reintentos

Un reintento no salta la evaluación porque una solicitud anterior fue permitida.

Respeta estado actual, frescura e idempotencia.

---

#### 80. Concurrencia

La autorización real no sustituye el control de concurrencia del recurso.

La unidad revalida autoridad sin absorber los conflictos de edición del propietario o de `VISO-CORE-005`.

---

#### 81. Segregación de funciones

La unidad respeta matrices canónicas y restricciones de segregación.

Una concesión individual no neutraliza una denegación estructural prohibida.

---

#### 82. Autoaprobación

Tener capacidad para crear y aprobar no permite autoaprobar cuando el contrato exige separación entre proponente, beneficiario y aprobador.

---

#### 83. Autoafectación

Ningún actor modifica directamente su propia autoridad mediante una ruta administrativa ordinaria cuando el contrato lo prohíbe.

La recuperación permanece gobernada.

---

#### 84. Suspensión

Suspender una concesión exige el permiso exacto de suspensión de la familia correspondiente y las condiciones contractuales aplicables.

No se representa borrando la concesión.

---

#### 85. Revocación

Revocar exige capacidad exacta, recurso resoluble, estado compatible, territorio y condiciones de seguridad aplicables.

La revocación conserva historia.

---

#### 86. Revocar un deny

Revocar una denegación elimina esa denegación según su lifecycle.

No crea un `ALLOW`.

---

#### 87. Reingreso

Un nuevo episodio laboral se autoriza desde su estado actual.

No recupera automáticamente grants, excepciones, sesiones, dispositivos, contexto ni decisiones del episodio anterior.

---

#### 88. Propietario

`propietario` no es wildcard.

Su autoridad deriva de grants y contratos exactos.

---

#### 89. Gerente general

`gerente_general` tampoco constituye bypass.

La matriz puede conceder capacidades concretas, pero siguen siendo explícitas.

---

#### 90. Gerente

El nombre `gerente` no concede administración global.

Toda capacidad local respeta territorio y permiso exacto.

---

#### 91. Role override AS-IS

El `role override` observado en VISO no puede actuar como autoridad real dentro de una unidad certificada por `VISO-CORE-004`.

Una cookie que seleccione otro rol no puede producir `ALLOW` real.

---

#### 92. Destino permitido del role override

Si una experiencia de override se conserva, queda separada de autoridad real, sujeta al contrato de simulación cuando corresponda e incapaz de ejecutar mutaciones o alterar actor efectivo.

Si no puede cumplir esas condiciones, la unidad la bloquea o retira dentro de su alcance autorizado.

---

#### 93. has_permission AS-IS

El helper o RPC legacy `has_permission` puede existir mientras una transición gobernada lo requiera.

No puede ser evaluador final de una operación perteneciente a una unidad cerrada de `VISO-CORE-004`.

---

#### 94. has_operational_role_permission AS-IS

La comprobación de permiso por rol operativo aislado no equivale a autorización real.

Una unidad aplicable migra, encapsula de forma canónica o bloquea ese consumidor conforme al package.

---

#### 95. Lectura directa de role_permissions

Consultar `role_permissions` puede ser válido para administración, explicación o compatibilidad.

No sustituye la decisión final para un actor real.

---

#### 96. Lectura directa de app_permissions

Consultar catálogo puede ser válido para presentar opciones.

La presencia de una fila no demuestra autorización.

---

#### 97. Inventario de consumidores legacy

Antes de cerrar una unidad se identifica todo consumidor aplicable que todavía decida autoridad mediante:

- `has_permission`;
- `has_operational_role_permission`;
- lectura directa de matrices;
- comparación de nombres de rol;
- role override;
- permiso hardcoded fuera del catálogo vigente;
- guard exclusivamente de cliente.

Cada consumidor recibe una decisión de transición.

---

#### 98. Clasificación de consumidores

Cada consumidor aplicable queda en uno de estos estados conceptuales:

```text
MIGRADO_A_AUTORIZACIÓN_CANÓNICA
COMPATIBILIDAD_CONTROLADA_SIN_AUTORIDAD_FINAL
BLOQUEADO
FUERA_DEL_ALCANCE_DE_LA_UNIDAD
```

No queda como pendiente narrativo sin propietario.

---

#### 99. Compatibilidad controlada

Un helper legacy puede permanecer cuando tenga consumidores fuera del alcance, no conceda autoridad final a la unidad cerrada, exista propietario de transición y condición de retiro.

---

#### 100. No retiro global por inferencia

`VISO-CORE-004` no autoriza borrar globalmente helpers legacy solo porque una unidad dejó de usarlos.

El retiro espera consumidores y gates correspondientes.

---

#### 101. Superficies fuera del núcleo

El uso legacy de autorización en productos, menús, CMS u otro dominio excluido no amplía automáticamente el alcance.

Solo se migra si esa superficie pertenece al package y unidad aplicable.

---

#### 102. Binding de lectura

Toda lectura sensible del núcleo queda protegida por permiso y alcance contractual.

La autorización no se limita a escrituras.

---

#### 103. Binding de mutación

Toda mutación del núcleo debe:

1. autenticar;
2. resolver principal y actor;
3. identificar permiso exacto;
4. resolver recurso;
5. resolver contexto y territorio;
6. evaluar autorización;
7. verificar frescura y estado requerido;
8. ejecutar solo con `ALLOW`;
9. conservar evidencia.

---

#### 104. Orden de seguridad

La unidad no efectúa una mutación empresarial antes de obtener una decisión válida.

Una escritura parcial seguida de denegación no es correcta.

---

#### 105. Atomicidad de autorización y efecto

Cuando exista riesgo material de carrera entre decisión y escritura, la implementación física usa el mecanismo transaccional o de revalidación definido por package y propietario técnico.

Esta tarea no inventa una transacción genérica ajena al recurso.

---

#### 106. Respuesta segura

Las denegaciones conservan la razón canónica necesaria sin revelar grants ajenos, sedes no autorizadas, permisos ocultos, datos sensibles, secretos ni detalles internos innecesarios.

---

#### 107. Idempotencia

Reintentar una operación autorizada no debe duplicar efectos.

La autorización no elimina la obligación de idempotencia del proceso propietario.

---

#### 108. Mínimo privilegio

Los bindings físicos exponen solo entrypoints necesarios.

No se concede acceso directo de roles cliente al grafo privado de autorización.

---

#### 109. Proyección segura

Cuando una UI necesite conocer el resultado, consume la proyección segura autorizada.

No recibe datasets privados completos para reevaluar en cliente.

---

#### 110. Fallo del evaluador

Si la fundación canónica no está disponible y la operación exige evaluación:

```text
EFECTO PROTEGIDO
→ NO EJECUTAR
```

No existe fallback a `has_permission`, rol, cookie o matriz local.

---

#### 111. Incompatibilidad contractual

Una versión contractual desconocida o incompatible bloquea el binding.

No se interpreta como compatibilidad por defecto.

---

#### 112. Versionado del consumidor

Cuando el package cambie contratos o tipos consumidos por VISO, la unidad actualiza consumidores afectados y demuestra compatibilidad con la versión activa.

No se permite drift silencioso.

---

#### 113. Tests positivos

Cada binding protegido incluye el caso positivo necesario para demostrar que un actor autorizado completa la operación dentro de su alcance.

---

#### 114. Tests negativos

Cada unidad cubre, según aplique:

- sesión ausente;
- actor inválido;
- permiso ausente;
- permiso distinto;
- recurso ajeno;
- sede ajena;
- área ajena;
- contexto requerido ausente;
- turno inválido;
- check-in ausente;
- dispositivo incompatible;
- deny vigente;
- contexto stale;
- llamada directa;
- payload manipulado;
- helper legacy;
- role override;
- fallo del evaluador.

---

#### 115. Prueba de equivalencia

Para el mismo actor, permiso, recurso, territorio y contexto, los canales aplicables producen resultado equivalente.

Una UI que deniega y una RPC que permite constituye fallo.

---

#### 116. Prueba de mínimo privilegio

La unidad demuestra que lectura no obtiene mutación y que creación no implica aprobación, suspensión o revocación cuando el catálogo las separa.

---

#### 117. Prueba territorial

Existe al menos un caso de denegación fuera del territorio autorizado cuando la operación es territorial.

No se fabrica territorio para probar una capacidad no territorial.

---

#### 118. Prueba de role override

Si el role override permanece dentro del alcance, debe demostrarse que no produce mutación real ni `ALLOW` alternativo.

---

#### 119. Prueba de legado

Si permanece un helper legacy, se demuestra que ninguna operación migrada puede alcanzarlo como autoridad final.

---

#### 120. Prueba de frescura

Cuando cambia un hecho relevante, una decisión anterior no continúa habilitando la operación.

La prueba usa invalidación canónica.

---

#### 121. Prueba de acceso directo

La operación protegida deniega de forma equivalente al invocarse fuera del flujo visual normal.

---

#### 122. Prueba de columnas

Una mutación con campos fuera del contrato permitido impide el efecto conforme al contrato de servidor.

---

#### 123. Prueba de service_role

Cuando exista backend privilegiado, se demuestra que la credencial técnica no sustituye la evaluación del actor de negocio.

---

#### 124. Prueba de decisión persistida

Cuando el contrato exige persistencia, se demuestra que decisión y correlación se conservan mediante la fundación compartida.

No se crea un log VISO alterno.

---

#### 125. Evidencia por unidad

El expediente físico futuro conserva como mínimo:

1. `implementation_unit_id`;
2. package propietario;
3. repositorios afectados;
4. commit o candidato validado;
5. operaciones protegidas;
6. permisos exactos;
7. contratos de recurso;
8. requisito de autorización;
9. entrypoint canónico utilizado;
10. consumidores legacy clasificados;
11. pruebas positivas;
12. pruebas negativas;
13. versiones y fingerprints;
14. rollback;
15. bloqueadores restantes.

---

#### 126. Rollback

El rollback de una unidad no restaura silenciosamente un bypass inseguro.

Si requiere volver temporalmente a un consumidor legacy, debe existir gate explícito que preserve fail-closed y trazabilidad.

---

#### 127. Frontera con VISO-CORE-005

`VISO-CORE-004` produce autorización real y evidencia de decisión.

`VISO-CORE-005` conserva la responsabilidad de materializar y certificar conflictos de configuración, límites administrativos, concurrencia de configuración, auditoría de cambios del núcleo, corrección y notificación aplicable.

---

#### 128. Persistencia de decisión versus auditoría de cambios

Usar persistencia canónica de `AuthorizationDecision` no absorbe la auditoría de cambios de `VISO-CORE-005`.

```text
EVIDENCIA DE POR QUÉ SE AUTORIZÓ O DENEGÓ UNA OPERACIÓN
≠
HISTORIAL COMPLETO DE CAMBIOS ADMINISTRATIVOS DEL NÚCLEO
```

---

#### 129. Conflictos

La autorización puede recibir una condición de configuración inconsistente y fallar cerrado.

La detección, clasificación, UX y lifecycle completo de conflictos permanecen en `VISO-CORE-005`.

---

#### 130. Frontera con VISO-CORE-006

`VISO-CORE-006` no puede aprobar el núcleo basándose únicamente en este contrato.

Debe existir evidencia física de unidades aplicables y controles posteriores.

---

#### 131. Frontera con VISO-AUTH

`VISO-AUTH-001` a `VISO-AUTH-020` conservan los contratos administrativos definidos.

`VISO-CORE-004` los materializa solo cuando una unidad y package lo requieren, sin reabrir matrices ni inventar capacidades.

---

#### 132. Frontera con SHELL

La fundación compartida de identidad, contexto y autorización permanece transversal.

VISO es consumidor y administrador de hechos autorizados, no propietario de un motor paralelo.

---

#### 133. Frontera con Supabase

Toda modificación VENTO de Supabase que una futura unidad requiera pertenece a `vento-group-sas/vento-shell`.

No se realizan cambios manuales directos en remoto desde esta tarea documental.

---

#### 134. Frontera con vento-viso

`vento-viso` puede requerir adaptaciones de consumidores cuando package y unidad lo incluyan.

La existencia de código AS-IS no autoriza modificación global fuera de ese alcance.

---

#### 135. Frontera con aplicaciones operativas

NEXO, FOGO, ORIGO, PULSO y demás aplicaciones conservan sus bindings de autorización.

Esta tarea no los migra salvo que el package de la unidad lo declare expresamente.

---

#### 136. Resultado permitido sin nuevo esquema

Una unidad puede completar binding sin crear migración si toda la fundación ya existe y solo debe adaptar consumidores.

No se exige cambio de base de datos artificial.

---

#### 137. Resultado permitido con cambio físico

Si el package demuestra una brecha real, la unidad introduce solo el cambio autorizado con compatibilidad, rollback, pruebas y owner.

---

#### 138. Resultado bloqueado

La unidad permanece bloqueada cuando:

- falta capacidad exacta;
- falta contrato de recurso;
- el contexto no puede resolverse;
- la dependencia de `VISO-CORE-003` no está disponible;
- el package no cubre el cambio;
- existe evaluador local capaz de conceder autoridad alternativa;
- no hay rollback seguro;
- no pueden ejecutarse pruebas negativas;
- el gate temporal no está satisfecho.

---

#### 139. No equivalencia entre tarea e implementación

Debe conservarse:

```text
VISO-CORE-004 DOCUMENTAL APROBADA
≠
VISO-CORE-004::implementation_unit_id IMPLEMENTADA
```

El marcador canónico define el contrato.

La instancia física demuestra materialización.

---

#### 140. Handoff a VISO-CORE-005

Por cada unidad materializada, `VISO-CORE-005` recibe:

- identidad exacta de la unidad;
- inventario operación-permiso-recurso;
- entrypoints canónicos utilizados;
- evidencia de decisión;
- consumidores legacy restantes;
- razones de bloqueo relevantes;
- puntos donde existen conflictos de configuración;
- puntos donde deben auditarse cambios;
- contratos y versiones;
- evidencia de frescura;
- pruebas de bypass y territorio.

No recibe una declaración genérica de “autorizado”.

---

#### 141. Handoff documental a VISO-CORE-005

El siguiente contrato desarrollará validación de conflictos y auditoría sobre un núcleo cuya autorización real ya está definida aquí.

No deberá crear otro evaluador ni reabrir la matriz de permisos.

---

#### 142. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

Las obligaciones de autorización real, equivalencia entre capas, territorio, mutaciones server-side, frescura, revocación y trazabilidad ya están protegidas por requisitos vigentes. Esta tarea asigna su materialización al núcleo de VISO por unidad sin crear una regla protegida independiente.

---

#### 143. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, esta tarea reutiliza la cobertura existente de:

- `TREQ-AUTH-001` — autorización mediante permisos, contexto y alcance canónicos;
- `TREQ-AUTH-004` — equivalencia entre evaluadores y ausencia de excepciones locales;
- `TREQ-AUTH-007` — administración de seguridad con capacidad explícita y territorio;
- `TREQ-AUTH-008` — separación entre carril administrativo y operacional;
- `TREQ-AUTH-009` — resolución territorial determinista;
- `TREQ-AUTH-013` — protección server-side de mutaciones, recurso y columnas;
- `TREQ-AUTH-014` — invalidación de contexto y decisiones stale;
- `TREQ-AUTH-015` — evidencia correlacionable de decisiones y acciones;
- `TREQ-AUTH-016` — revocación coordinada ante retiro, suspensión o finalización;
- `TREQ-VISO-001` — coherencia entre configuración administrativa VISO y resultado consumido por aplicaciones.

Estas referencias constituyen trazabilidad heredada y no actualizan el registro.

---

#### 144. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería documental no se ha ejecutado todavía sobre el checkout local de la rama de `VISO-CORE-004`. |
| LOCAL | NOT_EXECUTED | El bloque aún no ha sido insertado, normalizado ni validado dentro de la rama documental local. |
| REMOTA | PASS | Se verificaron `main`, cierre de `VISO-CORE-003`, continuidad, owner, topología, gate, políticas documentales, handoffs de `VISO-CORE-001..003`, contratos de `VISO-AUTH`, Registro 04A, fundaciones `AUTH-DB-032..035`, migraciones del evaluador, scripts documentales vigentes y el AS-IS de autorización de `vento-viso`. |
| OPERATIVA | NOT_APPLICABLE | La entrega documental no cambia autoridad, grants, denegaciones, sesiones, trabajadores, territorios, dispositivos ni datos reales. |
| FÍSICA | NOT_EXECUTED | La tarea define un contrato `PER_IMPLEMENTATION_UNIT`; no existe materialización física de `VISO-CORE-004` mediante esta aprobación documental. |

---

#### 145. Criterios de aceptación

- [ ] La tarea permanece `PER_IMPLEMENTATION_UNIT`.
- [ ] El gate permanece `POST_E5_PACKAGE`.
- [ ] No se crea una instancia global.
- [ ] No se inventa un `implementation_unit_id`.
- [ ] La unidad recibe dependencias reales de `VISO-CORE-003`.
- [ ] No se redefine la estructura administrativa mínima.
- [ ] Se reutiliza el resolver canónico de contexto.
- [ ] Se reutiliza el evaluador canónico compartido.
- [ ] Se reutiliza persistencia de decisión cuando aplica.
- [ ] Se reutiliza frescura canónica.
- [ ] No se crea motor de autorización local VISO.
- [ ] Cada operación protegida tiene permiso exacto.
- [ ] Un permiso común exige justificación contractual sin exceso.
- [ ] `viso.access` no sustituye permisos de acción.
- [ ] Las cinco capacidades de grants base permanecen separadas.
- [ ] Las cinco capacidades de grants operativos permanecen separadas.
- [ ] Las cuatro capacidades de denegaciones permanecen separadas.
- [ ] No se inventa `viso.authorization.manage`.
- [ ] No se inventa capacidad de suspensión de denegaciones.
- [ ] `viso.authorization.audit_logs.view` no concede mutaciones.
- [ ] Simulación permanece separada de autoridad real.
- [ ] Exportación permanece bloqueada sin permiso canónico exacto.
- [ ] Otras operaciones resuelven permisos desde catálogo activo.
- [ ] Una capacidad ausente bloquea en vez de crear una clave.
- [ ] Principal procede de autenticación real.
- [ ] Actor efectivo procede del contexto canónico.
- [ ] Principal y actor permanecen separados cuando corresponde.
- [ ] Sesión válida no equivale a autorización.
- [ ] Estado laboral incompatible falla cerrado cuando aplica.
- [ ] Rol base no es `ALLOW`.
- [ ] Rol operativo no se fabrica desde perfil.
- [ ] Perfil operativo no es autoridad.
- [ ] Sede solicitada no es territorio autorizado.
- [ ] Área solicitada no amplía cobertura.
- [ ] Capacidades no territoriales no fabrican sede.
- [ ] Capacidades territoriales fallan cerrado sin territorio válido.
- [ ] Cobertura no concede permiso.
- [ ] Recurso se resuelve mediante contrato canónico.
- [ ] Estado actual del recurso se revalida cuando aplica.
- [ ] Columnas permitidas se restringen en servidor.
- [ ] Lecturas de colección no filtran información fuera de alcance.
- [ ] Operaciones multirrecurso no ocultan denegaciones parciales.
- [ ] Carril administrativo no exige turno por defecto.
- [ ] Carril operacional no omite prerrequisitos.
- [ ] Turno solo se exige cuando el contrato lo exige.
- [ ] `VISO-CORE-004` no activa el delta de programación.
- [ ] Check-in solo se exige cuando corresponde.
- [ ] Dispositivo solo participa cuando corresponde.
- [ ] Dispositivo compartido no transfiere autoridad técnica.
- [ ] `service_role` no actúa como autorización de negocio.
- [ ] `SECURITY DEFINER` no es bypass.
- [ ] RLS no sustituye decisión de negocio.
- [ ] Server Actions reautorizan en servidor.
- [ ] Route Handlers reautorizan en servidor.
- [ ] RPC no confía en autorización previa de UI.
- [ ] Data API no amplía alcance.
- [ ] Realtime no expone filas fuera de alcance.
- [ ] Cliente no elige permiso, actor ni resultado.
- [ ] UI no es barrera suficiente.
- [ ] Middleware no sustituye autorización de acción.
- [ ] URL directa produce decisión equivalente.
- [ ] Formulario manipulado no amplía columnas ni recurso.
- [ ] API directa produce decisión equivalente.
- [ ] Solo `ALLOW` vigente habilita efecto.
- [ ] Toda condición obligatoria ausente falla cerrado.
- [ ] Deny y error técnico permanecen distinguibles.
- [ ] Reasons canónicos no se reemplazan por taxonomía local.
- [ ] Evidencia conserva correlación suficiente.
- [ ] Versiones y fingerprints se preservan.
- [ ] No se hardcodea cardinalidad histórica como eterna.
- [ ] Una mutación revalida frescura antes del efecto.
- [ ] Eventos invalidantes invalidan autoridad.
- [ ] No existe caché local de `ALLOW` fuera del contrato.
- [ ] Operación offline se reautoriza cuando corresponde.
- [ ] Reintentos no omiten autorización.
- [ ] Autorización no sustituye concurrencia del recurso.
- [ ] Segregación de funciones permanece vigente.
- [ ] Tener create y approve no habilita autoaprobación.
- [ ] Autoafectación prohibida permanece bloqueada.
- [ ] Suspensión usa capacidad exacta.
- [ ] Revocación usa capacidad exacta y conserva historia.
- [ ] Revocar un deny no crea un allow.
- [ ] Reingreso no recupera autoridad anterior.
- [ ] `propietario` no es wildcard.
- [ ] `gerente_general` no es bypass.
- [ ] `gerente` no es administrador global por nombre.
- [ ] Role override no produce autoridad real.
- [ ] `has_permission` no es autoridad final de una unidad cerrada.
- [ ] `has_operational_role_permission` no es autoridad final.
- [ ] Lectura directa de `role_permissions` no decide actor real.
- [ ] Lectura directa de `app_permissions` no concede permiso.
- [ ] Todos los consumidores legacy aplicables están inventariados.
- [ ] Cada consumidor legacy tiene clasificación de transición.
- [ ] Compatibilidad legacy no crea autoridad paralela.
- [ ] No se retiran helpers globalmente por inferencia.
- [ ] Superficies fuera del núcleo no amplían alcance.
- [ ] Lecturas sensibles quedan protegidas.
- [ ] Mutaciones siguen el orden de seguridad definido.
- [ ] Ningún efecto protegido ocurre antes del `ALLOW`.
- [ ] Mínimo privilegio se conserva.
- [ ] Grafo privado no se expone a roles cliente.
- [ ] UI recibe solo proyección segura.
- [ ] Caída del evaluador falla cerrado.
- [ ] Versión incompatible bloquea.
- [ ] Consumidores se sincronizan con contrato vigente.
- [ ] Cada binding tiene prueba positiva.
- [ ] Cada binding tiene pruebas negativas proporcionales.
- [ ] Existe prueba de equivalencia entre canales aplicables.
- [ ] Existe prueba de mínimo privilegio.
- [ ] Existe prueba territorial cuando aplica.
- [ ] Role override tiene prueba negativa cuando permanece.
- [ ] Helper legacy tiene prueba de no autoridad final cuando permanece.
- [ ] Existe prueba de frescura cuando aplica.
- [ ] Existe prueba de acceso directo.
- [ ] Existe prueba de columnas cuando aplica.
- [ ] Backend privilegiado prueba que `service_role` no sustituye actor.
- [ ] Persistencia de decisión usa fundación compartida.
- [ ] Cada unidad conserva evidencia física mínima.
- [ ] Rollback no restaura bypass inseguro.
- [ ] `VISO-CORE-005` conserva conflictos y auditoría de cambios.
- [ ] Persistencia de decisión no se confunde con auditoría completa del núcleo.
- [ ] `VISO-CORE-006` conserva certificación final.
- [ ] `VISO-AUTH-001..020` no se reabren.
- [ ] Supabase de VENTO permanece gobernado desde `vento-shell`.
- [ ] `vento-viso` solo se modifica cuando una unidad y package lo incluyan.
- [ ] No se exige migración artificial cuando basta adaptar consumidores.
- [ ] Una brecha real solo se materializa dentro del alcance autorizado.
- [ ] Una unidad bloqueada no usa fallback permisivo.
- [ ] Aprobación documental no equivale a instancia implementada.
- [ ] `VISO-CORE-005` recibe handoff físico verificable.
- [ ] No se crean requisitos de prueba.
- [ ] No se modifican requisitos de prueba.
- [ ] No se modifica el Registro Canónico de Requisitos de Prueba.

---

#### 146. Límites

Esta tarea no:

- crea un package;
- selecciona un package;
- modifica la línea de packages;
- crea un `implementation_unit_id`;
- crea una instancia global;
- autoriza una instancia física;
- ejecuta una instancia física;
- modifica `implementation-control.json` por inferencia;
- cambia Supabase;
- cambia Supabase remoto;
- crea migraciones;
- crea RPC;
- crea RLS;
- crea grants;
- crea funciones;
- crea triggers;
- crea Storage;
- crea Realtime;
- crea Edge Functions;
- crea cron;
- crea colas;
- cambia secretos;
- cambia Auth;
- cambia datos productivos;
- cambia código de `vento-viso`;
- cambia código de otra aplicación;
- crea nuevo `AccessContext`;
- crea nuevo evaluador de autorización;
- crea nueva taxonomía de decisión;
- crea nuevo catálogo de permisos;
- inventa `PermissionKey`;
- inventa `viso.authorization.manage`;
- inventa permiso de exportación;
- materializa exportación de matriz;
- activa simulación como autoridad real;
- activa el delta de programación laboral;
- completa `VISO-SCH-001..008`;
- implementa ciclo de dispositivos compartidos;
- implementa conflictos de configuración;
- implementa auditoría completa de cambios del núcleo;
- implementa notificaciones de seguridad;
- implementa UX final;
- retira helpers legacy fuera del package;
- absorbe autorización de otras aplicaciones;
- modifica requisitos de prueba;
- crea requisitos de prueba;
- modifica el Registro Canónico de Requisitos de Prueba.

---

#### 147. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-CORE-003 — Implementar dependencias administrativas mínimas`

**TAREA ACTUAL APROBADA**
`VISO-CORE-004 — Implementar autorización real del núcleo`

**SIGUIENTE TAREA RESERVADA**
`VISO-CORE-005 — Implementar validación de conflictos y auditoría`


### ✅ VISO-CORE-005 — Implementar validación de conflictos y auditoría

**Estado:** APROBADA
**Tarea anterior:** VISO-CORE-004 — Implementar autorización real del núcleo
**Tarea siguiente:** VISO-CORE-006 — Aprobar núcleo antes de ampliar alcance
**Tipo de tarea:** contrato documental de implementación física por unidad; define cómo cada unidad válida del núcleo de VISO materializa validación prospectiva de conflictos, límites administrativos, concurrencia, corrección y evidencia auditable, reutilizando la autorización real y los contratos canónicos de configuración inconsistente y auditoría sin crear motores paralelos ni ejecutar ahora una instancia física
**Bloque:** `G_VISO — NÚCLEO MÍNIMO PARA OPERACIÓN`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/G_VISO/02_NUCLEO_MINIMO_PARA_OPERACION.md`
**Estado físico resultante:** contrato de conflictos, concurrencia y auditoría por `implementation_unit_id` definido; ninguna instancia física de `VISO-CORE-005` se crea, autoriza, ejecuta ni certifica por la aprobación documental de esta tarea
**Cambios físicos autorizados:** únicamente dentro de una futura instancia válida `VISO-CORE-005::implementation_unit_id` habilitada por `PER_IMPLEMENTATION_UNIT` y `POST_E5_PACKAGE`: materializar o adaptar validadores prospectivos, bindings de evidencia y auditoría, controles de concurrencia y corrección, proyecciones seguras y pruebas previstas por el package y los contratos propietarios; ningún cambio físico queda autorizado fuera de esa unidad y su alcance aprobado
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato reutilizable que debe cumplir cada unidad física del núcleo de VISO para impedir que una configuración administrativa contradictoria, obsoleta, no reproducible o concurrentemente desactualizada se convierta en autoridad vigente, y para conservar evidencia suficiente de cada cambio, intento, rechazo, corrección y rollback aplicable.

La tarea no crea una segunda semántica de autorización ni una segunda semántica de auditoría.

---

#### 2. Regla raíz

```text
ESTADO ACTUAL
+
CAMBIO PROPUESTO
+
CONTRATOS VIGENTES
+
AUTORIZACIÓN REAL
+
ALCANCE
→
SNAPSHOT PROSPECTIVO
→
CONFLICTOS Y LÍMITES
→
CONCURRENCIA
→
EFECTO O CERO EFECTOS
→
EVIDENCIA APPEND-ONLY
```

Nunca se guarda primero para validar después.

---

#### 3. Topología

`VISO-CORE-005` conserva:

```text
PER_IMPLEMENTATION_UNIT
POST_E5_PACKAGE
```

No existe implementación global previa ni instancia física única de todo VISO.

---

#### 4. Identidad futura

Cada materialización física deriva de:

```text
VISO-CORE-005
+
implementation_unit_id canónico
```

El `implementation_unit_id` procede del package E5 aplicable. No se inventa desde una pantalla, tabla, dominio o repositorio.

---

#### 5. Gate temporal

La materialización requiere package aplicable, unidad canónica, handoffs físicos, autorización real disponible, gate `POST_E5_PACKAGE`, alcance físico autorizado y lifecycle de implementación habilitado.

La aprobación documental no satisface esos gates.

---

#### 6. Handoff recibido de VISO-CORE-003

Cada unidad recibe:

- dependencias administrativas materializadas;
- bindings físicos;
- contratos y versiones;
- territorio y asignaciones aplicables;
- catálogos y matrices;
- dependencias condicionadas;
- referencias necesarias para auditoría;
- puntos de incompatibilidad conocidos.

Una dependencia ausente no se fabrica.

---

#### 7. Handoff recibido de VISO-CORE-004

Cada unidad recibe:

- identidad exacta;
- inventario operación–permiso–recurso;
- entrypoints canónicos;
- evidencia de decisión;
- consumidores legacy restantes;
- razones de bloqueo;
- puntos de conflicto;
- puntos de auditoría;
- contratos y versiones;
- evidencia de frescura;
- pruebas de bypass y territorio.

No recibe una declaración genérica de “autorizado”.

---

#### 8. Tres planos distintos

Debe conservarse:

```text
CONFLICTO PROSPECTIVO
≠
INCONSISTENCIA ESTRUCTURAL DE RUNTIME
≠
HISTORIAL AUDITABLE
```

Los tres pueden correlacionarse, pero no colapsarse.

---

#### 9. Conflicto prospectivo

Es la contradicción detectada sobre el estado que resultaría si una mutación administrativa propuesta se aplicara.

Se evalúa antes del efecto y puede bloquear sin alterar el estado vigente.

---

#### 10. Inconsistencia estructural de runtime

Es una contradicción concluyente dentro de configuración requerida por autorización.

Cuando corresponde al contrato transversal, conserva la identidad pública aprobada por `AUTH-ERR-017`.

---

#### 11. Historial auditable

Es evidencia histórica de cambios, intentos, rechazos, conflictos, correcciones, fallos técnicos, rollbacks y relaciones causales.

No es el estado vigente.

---

#### 12. Fuentes normativas

La unidad reutiliza:

- `VISO-AUTH-016` para conflictos de configuración;
- `VISO-AUTH-018` para auditoría de cambios de seguridad;
- `AUTH-ERR-017` para inconsistencia administrativa concluyente;
- `VISO-CORE-004` para autorización real;
- `AUTH-DB-012` cuando el cambio corresponda a auditoría de permisos;
- `AUTH-DB-020` cuando la adopción física de writers u objetos dependa de su transición.

No reabre esos contratos.

---

#### 13. Identidad pública de inconsistencia

Cuando aplica exactamente `AUTH-ERR-017`, permanece:

```text
reason_code = AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
state = ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
category = CONFIGURATION_CONFLICT
http = 409
executable = false
```

La sesión se preserva y los efectos empresariales permanecen en cero.

---

#### 14. Conflicto prospectivo no equivale a error runtime

Una propuesta administrativa puede ser rechazada antes de persistirse. Esa detección prospectiva se explica dentro de la superficie autorizada sin fingir que ya existe una configuración runtime inconsistente.

---

#### 15. DENY coherente

```text
CONFIGURACIÓN COHERENTE + DENY
≠
CONFIGURACIÓN INCONSISTENTE
```

Carecer de un grant válido no es, por sí solo, conflicto.

---

#### 16. Ausencia ordinaria

La ausencia normal de asignación, turno, check-in, grant o contexto opcional conserva su razón propietaria.

No se convierte automáticamente en `StructuralIssue`.

---

#### 17. Permiso no registrado

Una búsqueda concluyente de una capacidad exacta inexistente conserva `AUTH-ERR-018`.

No se clasifica como `AUTH-ERR-017` para ocultar una brecha de catálogo.

---

#### 18. Indisponibilidad técnica

Una fuente obligatoria no disponible conserva `AUTH-ERR-019`.

No se declara conflicto sin lectura concluyente.

---

#### 19. Precedencia causal

```text
CONFLICTO CONCLUYENTE
→ AUTH-ERR-017 cuando aplique

PERMISO EXACTO NO REGISTRADO
→ AUTH-ERR-018

FUENTE O EVALUADOR NO DISPONIBLE
→ AUTH-ERR-019
```

No existe fallback local que cambie esta precedencia.

---

#### 20. Severidades estructurales

La unidad conserva exclusivamente las severidades canónicas:

```text
BLOCKING_ALL
BLOCKING_BASE
BLOCKING_OPERATIONAL
```

---

#### 21. Efecto de severidad

| Severidad | Efecto |
| --- | --- |
| `BLOCKING_ALL` | invalida base y operacional |
| `BLOCKING_BASE` | invalida solo base |
| `BLOCKING_OPERATIONAL` | invalida solo operacional |

Un warning o una observación no se convierten en bloqueo ni en `ALLOW` por inferencia.

---

#### 22. Modalidad

| Modalidad | Regla |
| --- | --- |
| `BASE_ONLY` | el carril base requerido debe ser válido |
| `OPERATIONAL_ONLY` | el carril operacional requerido debe ser válido |
| `BASE_OR_OPERATIONAL` | un carril completo independiente puede autorizar aunque el otro sea inválido |
| `BASE_AND_OPERATIONAL` | ambos carriles deben ser válidos |

No se mezclan fragmentos incompletos para fabricar autoridad.

---

#### 23. Snapshot actual

Antes de evaluar una mutación, el estado actual se resuelve desde fuentes canónicas y versiones compatibles.

No se acepta como estado actual una copia de UI, estado React, `localStorage`, selección previa o caché sin fingerprint vigente.

---

#### 24. Snapshot prospectivo

La unidad representa el estado resultante antes de persistir.

El snapshot prospectivo no es autoridad vigente.

---

#### 25. Orden de seguridad

```text
RESOLVER ESTADO ACTUAL
→
VALIDAR INPUT
→
CALCULAR SNAPSHOT PROSPECTIVO
→
VALIDAR CONFLICTOS
→
VALIDAR LÍMITES
→
REVALIDAR AUTORIZACIÓN
→
VALIDAR CONCURRENCIA
→
PERSISTIR O BLOQUEAR
→
REGISTRAR EVIDENCIA
```

---

#### 26. Conflicto bloqueante

Si el cambio crea o agrava un conflicto bloqueante dentro de su alcance, la mutación no se ejecuta.

No existe guardado parcial silencioso.

---

#### 27. Conflicto ajeno

Un conflicto preexistente fuera del alcance del cambio no congela automáticamente toda la administración.

Permanece como deuda o revisión con owner y condición de salida.

---

#### 28. No propagación de legacy

La deuda legacy histórica no habilita copiar, reactivar o extender una configuración incompatible a nueva vigencia.

---

#### 29. No reparación automática

La detección de conflicto no puede reparar mediante:

- agregar grants;
- retirar denies;
- escoger primera fila;
- cambiar rol por inferencia;
- convertir `null` en global;
- eliminar silenciosamente territorio;
- ocultar la fuente contradictoria.

La corrección requiere una mutación explícita autorizada.

---

#### 30. Matriz de casos de conflicto

| Caso | Clasificación |
| --- | --- |
| ALLOW + DENY exactos y simultáneamente aplicables | bloqueante |
| regla `BASE_ONLY` usada como operacional | bloqueante |
| regla `OPERATIONAL_ONLY` usada como base | bloqueante |
| modalidad faltante usada para conceder | bloqueante |
| deny con carril o sujeto incompatible | bloqueante |
| scope exacto sin dimensión obligatoria | bloqueante |
| área incompatible con sede | bloqueante |
| rol inválido para sede | bloqueante |
| rol inválido para área | bloqueante |
| turno laboral que requiere rol y no puede resolverlo | bloqueante |
| varios turnos efectivos incompatibles | bloqueante |
| binding de área no resuelto usado site-wide | bloqueante |
| identidad legacy reactivada como canónica | bloqueante |
| fuente simulada persistida como real | bloqueante |
| contratos o snapshots incompatibles | bloqueante |
| dos allows compatibles | no conflicto |
| dos denies compatibles | no conflicto |
| default deny | no conflicto por sí solo |
| perfil distinto del rol efectivo | no conflicto por sí solo |
| varias sedes asignadas válidas | no conflicto por sí solo |
| duplicado exacto del mismo efecto | redundancia o revisión |
| deuda antigua fuera de vigencia | revisión |
| conflicto fuera del alcance del cambio | revisión; no bloqueo global |

---

#### 31. Scope y territorio

Una dimensión territorial obligatoria no se fabrica desde la UI.

Sede y área deben pertenecer al contrato y al alcance autorizado del actor.

---

#### 32. Roles y turnos

Un perfil no sustituye el rol operativo efectivo.

Un turno ambiguo o incompatible no se resuelve escogiendo la primera fila.

---

#### 33. Versionado

La unidad no mezcla versiones contractuales o snapshots incompatibles.

Una incompatibilidad material bloquea hasta obtener una resolución reproducible.

---

#### 34. StructuralIssue

La unidad no crea un catálogo local.

Cuando consuma `StructuralIssue`, conserva código, severidad, sujeto, fuente, metadata autorizada, versión y procedencia.

---

#### 35. Disponibilidad no estructural

Códigos de ausencia ordinaria o disponibilidad no se reclasifican como `StructuralIssue` solo para reutilizar un flujo de errores.

---

#### 36. Determinismo

Las mismas fuentes, versiones y propuesta deben producir la misma clasificación.

El orden de retorno de filas no puede cambiar la conclusión.

---

#### 37. Owner de conflicto

Cada conflicto material debe conservar un propietario de resolución.

Un owner desconocido bloquea la certificación de la unidad.

---

#### 38. Evidencia mínima de conflicto

Sin imponer una tabla nueva, la unidad debe poder conservar o reconstruir:

- código o tipo;
- severidad;
- sujeto o recurso;
- fuentes;
- dimensión conflictiva;
- alcance;
- versiones;
- fingerprints;
- momento de detección;
- owner;
- resultado;
- referencia de corrección.

---

#### 39. Proyección segura de conflicto

La superficie administrativa recibe solo la información necesaria para comprender y corregir dentro del alcance autorizado.

No expone secretos, grants ajenos, PII innecesaria ni infraestructura interna.

---

#### 40. UX final

La tarea puede exigir una proyección estructurada de conflictos.

No define navegación, composición visual ni experiencia final de VISO.

---

#### 41. Límites administrativos

Los límites proceden de contratos canónicos de territorio, cardinalidad, lifecycle, modalidad, sensibilidad, segregación, versión, recurso, vigencia y concurrencia.

No son cuotas inventadas por una pantalla.

---

#### 42. Cardinalidad y lifecycle

Cuando existe unicidad o cardinalidad máxima, se valida el estado prospectivo completo.

Una transición imposible desde el estado actual se bloquea.

---

#### 43. Segregación

Crear, aprobar, suspender y revocar permanecen separados cuando el catálogo los separa.

Tener varias capacidades no elimina restricciones de autoaprobación o autoafectación.

---

#### 44. Sensibilidad

Una operación sensible conserva reautenticación, motivo, aprobación y controles adicionales cuando su contrato los exige.

---

#### 45. Concurrencia

Una configuración mutable crítica debe impedir sobrescritura silenciosa de un estado más reciente.

La estrategia física pertenece al owner del recurso y al package.

---

#### 46. No imponer locking universal

Esta tarea no obliga a usar un mecanismo específico como `updated_at`, número de versión, ETag, lock o fingerprint.

La unidad debe demostrar que evita lost update según su contrato.

---

#### 47. Escritura stale

Si la precondición de concurrencia falla:

- no se sobrescribe;
- no se reintenta como éxito;
- se conserva evidencia cuando aplica;
- se exige resolución fresca.

---

#### 48. Carrera validación–persistencia

Una validación de conflicto sobre snapshot obsoleto no habilita la escritura.

La implementación controla la carrera mediante la frontera transaccional o de revalidación aprobada.

---

#### 49. Carrera autorización–persistencia

Si cambia una condición material de recurso, contexto o alcance después de autorizar, la operación debe reautorizarse o bloquearse.

---

#### 50. Idempotencia y reintento

Un reintento no duplica efectos ni reutiliza automáticamente un `ALLOW`, snapshot, conflicto o fingerprint obsoleto.

La solicitud vuelve a resolver el estado requerido.

---

#### 51. Corrección

Una corrección administrativa es una mutación nueva.

No reescribe silenciosamente la evidencia original.

---

#### 52. Corrección semántica

Si cambia autoridad, territorio, rol, scope o vigencia, la corrección vuelve a pasar autorización, conflictos, límites y concurrencia.

---

#### 53. Rollback

Un rollback conserva referencia al cambio original y motivo.

No borra la historia ni restaura una fuente insegura fuera de un gate aprobado.

---

#### 54. Borrado de borradores

Solo aplica a objetos que su contrato propietario considere borradores eliminables.

Eliminar un borrador no autoriza borrar evidencia obligatoria de creación, edición, rechazo o conflicto.

---

#### 55. Notificación

La unidad solo notifica cuando una regla propietaria lo exige.

No notifica éxito antes del commit ni convierte un rechazo por conflicto en una publicación exitosa.

---

#### 56. Fallo de notificación

Si una notificación obligatoria falla después de un cambio ya comprometido, el estado del negocio no se reescribe como si nunca hubiera ocurrido.

Se conserva evidencia e incidente o retry según el owner.

---

#### 57. Auditoría como condición del núcleo

Cada unidad identifica qué mutaciones requieren evidencia auditable.

No puede cerrar con “auditoría pendiente” sin owner y condición de salida.

---

#### 58. Historial versus estado

La auditoría describe lo ocurrido.

No se reconstruye sustituyendo valores históricos por el estado vigente.

---

#### 59. Append-only

La evidencia relevante es append-only.

Una corrección crea evidencia nueva y vinculada.

---

#### 60. Before/after

Cuando el contrato lo exige, la evidencia permite reconstruir el estado anterior y posterior o fingerprints/referencias equivalentes.

---

#### 61. Intentos

La auditoría puede conservar, según el contrato:

- exitosos;
- denegados;
- inválidos;
- conflictivos;
- fallos técnicos;
- no-cambio;
- rollback.

No se limita a escrituras exitosas.

---

#### 62. Correlación y causalidad

La evidencia puede enlazar solicitud, decisión, cambio, aprobación, conflicto, corrección, incidente y rollback.

Una acción compensatoria conserva su antecedente.

---

#### 63. Identidad histórica

La evidencia distingue principal, actor efectivo, principal técnico, sesión y dispositivo cuando aplican.

No atribuye toda la acción al usuario técnico de la transacción.

---

#### 64. Territorio histórico

Una reasignación futura no reescribe el territorio del evento histórico.

---

#### 65. Permiso, recurso y versiones

La evidencia debe poder identificar permiso, recurso, versiones y fingerprints necesarios para explicar el cambio.

No se recalcula una huella histórica con estado actual.

---

#### 66. Sensibilidad y retención

La proyección de auditoría respeta sensibilidad y la clase de retención de su contrato.

No existe un plazo único inventado para todo VISO.

---

#### 67. Preservación

Cuando el owner o contrato exija preservación, limpieza, corrección o rollback no pueden destruir la evidencia retenida.

---

#### 68. Fundación AUTH-DB-012

La infraestructura append-only de `AUTH-DB-012` es la fundación canónica específica para cambios de permisos.

`VISO-CORE-005` la reutiliza cuando la unidad afecte ese dominio.

---

#### 69. Forma de AUTH-DB-012

La fundación separa:

- change sets;
- changes;
- attempts;
- links.

La unidad no crea una segunda familia equivalente solo para VISO.

---

#### 70. Fuentes y cambios de permisos

La fundación de permisos reconoce fuentes canónicas como release de catálogo, grant base, grant operacional, override individual y deny explícito.

Distingue creación, activación, scope, vigencia, suspensión, revocación, expiración, rechazo, supersesión, migración y corrección de metadata.

La unidad no colapsa todo en “update”.

---

#### 71. Writer adoption

La existencia de la fundación no demuestra que todos los writers concretos registren evidencia.

Cada unidad debe verificar los writers de su alcance antes de declararse completa.

---

#### 72. Frontera AUTH-DB-020

Cuando adopción o compatibilidad temporal de writers dependa de `AUTH-DB-020`, la unidad consume ese resultado dentro del package aplicable.

No reimplementa esa transición global.

---

#### 73. Cambios no-permiso

Los cambios del núcleo que no sean cambios de permisos no se fuerzan dentro de las tablas específicas de auditoría de permisos.

Se usa el contrato de evidencia del owner correspondiente.

---

#### 74. Ausencia de fundación

Si una mutación obligatoria requiere auditoría y no existe representación física conforme ni owner de salida:

```text
UNIDAD
→ BLOQUEADA
```

Un `console.log` no es sustituto.

---

#### 75. AuthorizationDecision no sustituye Change Audit

La persistencia recibida de `VISO-CORE-004` explica por qué una operación se autorizó o denegó.

No sustituye el historial de lo que la mutación cambió.

---

#### 76. Vínculo decisión–cambio

Cuando aplica, la evidencia de cambio se correlaciona con la decisión de autorización utilizada.

No se reevalúa históricamente con el estado actual.

---

#### 77. Lectura de auditoría de seguridad

La capacidad exacta aprobada permanece:

```text
viso.authorization.audit_logs.view
```

y el recurso protegido:

```text
AUDIT_EVENT
```

La capacidad no concede mutación ni exportación.

---

#### 78. Scope de lectura

Una consulta directa de auditoría reautoriza actor, permiso, recurso, territorio o alcance y sensibilidad.

Los filtros reducen el conjunto visible; nunca lo amplían.

---

#### 79. Paginación estable

El historial append-only puede crecer durante la consulta.

La unidad usa cursor estable o mecanismo equivalente y orden determinista para evitar saltos, duplicados o mezcla temporal engañosa.

---

#### 80. Proyección mínima de auditoría

Ver un evento no autoriza ver secretos, credenciales, payloads internos completos o PII innecesaria.

---

#### 81. Exportación de auditoría

Una capacidad de lectura no implica exportación masiva.

Sin permiso exacto, la exportación se bloquea.

---

#### 82. Evidencia de rechazo

Un intento rechazado por conflicto conserva, cuando aplica, actor, operación, objetivo, clasificación, alcance, versiones, correlación y cero efectos sin persistir la configuración inválida.

---

#### 83. Concurrencia no es conflicto estructural

Un rechazo stale se distingue de una contradicción administrativa.

La causa real permanece trazable.

---

#### 84. Fallo técnico no es DENY

Un fallo técnico no se registra como denegación empresarial ni como conflicto si no hubo lectura concluyente.

---

#### 85. Rollback y corrección

Rollback y corrección generan evidencia nueva y links a su antecedente.

No sustituyen el registro previo.

---

#### 86. Inmutabilidad

Roles cliente no reciben capacidad para editar evidencia append-only por conveniencia administrativa.

---

#### 87. Credenciales privilegiadas

`service_role` y funciones `SECURITY DEFINER` no sustituyen actor, autorización, conflictos, concurrencia ni evidencia.

Los grants permanecen mínimos y la frontera server-side conserva su owner seguro.

---

#### 88. RLS y capas

RLS protege acceso a filas, pero no sustituye validación de conflicto ni historial de auditoría.

Server Actions, Route Handlers, RPC, jobs y procesos asíncronos deben aplicar los controles que correspondan antes del efecto.

---

#### 89. Offline y Realtime

Una mutación encolada revalida al sincronizar cuando el contrato lo exige.

Realtime puede invalidar o refrescar una superficie, pero no sustituye la validación server-side de escritura.

---

#### 90. Eventos invalidantes

Cambios de catálogo, asignación, rol, perfil, turno, grant, deny, dispositivo o contrato pueden invalidar snapshots prospectivos.

Solo las dependencias aplicables a la unidad producen invalidación.

---

#### 91. Inventario de writers

Cada unidad identifica los writers físicos que modifican su configuración.

No basta inventariar páginas.

---

#### 92. Clasificación de writers

Cada writer aplicable queda en uno de estos estados:

```text
ADOPTADO_CON_EVIDENCIA_CANÓNICA
COMPATIBILIDAD_CONTROLADA
BLOQUEADO
FUERA_DEL_ALCANCE_DE_LA_UNIDAD
```

No queda sin decisión.

---

#### 93. Compatibilidad controlada

Un writer legacy solo permanece si no evita los controles, tiene owner de transición, condición de retiro, evidencia suficiente y cobertura del package.

---

#### 94. No retiro global

Una unidad no elimina globalmente un writer porque ya no lo utilice localmente.

El retiro exige comprobar consumidores y alcance.

---

#### 95. AS-IS de conflictos

Comprobaciones físicas de solapamiento en programación o `upsert` con `onConflict` pueden resolver reglas locales o unicidad técnica.

No equivalen por sí solas al motor transversal de conflictos definido aquí.

---

#### 96. No segunda fuente VISO

VISO puede presentar proyecciones seguras, pero no crea una copia editable de la auditoría canónica.

Logs, Git y métricas tampoco sustituyen runtime evidence contractual.

---

#### 97. Cero efectos

Un bloqueo pre-commit debe demostrar cero efectos empresariales.

Si un fallo ocurre después de iniciar una operación cuya atomicidad no está demostrada, no se afirma rollback completo sin evidencia.

---

#### 98. Frontera de atomicidad

Cada unidad documenta qué mecanismo mantiene consistentes validación, concurrencia, efecto y evidencia obligatoria.

No se impone una única transacción cuando el proceso legítimamente cruza sistemas.

---

#### 99. Efectos externos

Notificaciones, integraciones u otros efectos externos se distinguen del commit interno.

Su fallo no reescribe el evento interno ya confirmado.

---

#### 100. Pendientes con owner

Toda deuda no bloqueante conserva:

- qué falta;
- por qué no bloquea;
- owner;
- condición exacta de salida.

Un conflicto material sin owner bloquea.

---

#### 101. Bloqueadores de cierre por unidad

Bloquean el cierre:

- evidencia insuficiente;
- writer capaz de bypass;
- concurrencia crítica ausente;
- conflicto no reproducible;
- mutación obligatoria sin audit trail;
- proyección de auditoría insegura;
- rollback destructivo;
- dependencia física obligatoria ausente;
- package sin cobertura del cambio.

---

#### 102. Evidencia física mínima futura

Cada instancia física deberá conservar, como mínimo:

1. package propietario;
2. `implementation_unit_id`;
3. repositorios y ambientes;
4. handoffs recibidos;
5. configuración mutable incluida;
6. matriz de conflictos aplicables;
7. límites aplicables;
8. writers inventariados;
9. mecanismo de concurrencia;
10. fundación de auditoría;
11. adopción de writers;
12. proyecciones seguras;
13. pruebas positivas;
14. pruebas negativas;
15. pruebas de concurrencia;
16. pruebas append-only;
17. pruebas territoriales;
18. rollback;
19. deudas no bloqueantes;
20. bloqueadores;
21. versiones;
22. fingerprints.

---

#### 103. Pruebas de conflicto

La suite física de una unidad cubre los casos bloqueantes aplicables y también casos válidos para evitar falsos positivos.

Debe demostrar, cuando corresponda:

- ALLOW + DENY exactos;
- severidad por carril;
- versión incompatible;
- legacy reactivado;
- simulación persistida;
- conflicto ajeno que no congela globalmente;
- ausencia de reparación automática.

---

#### 104. Pruebas de concurrencia

Debe existir un escenario donde una lectura A queda obsoleta por una escritura B y la escritura posterior basada en A se rechaza sin perder B.

Si el cambio altera autorización, la decisión anterior no habilita el efecto.

---

#### 105. Pruebas de auditoría

La unidad demuestra, según aplique:

- append-only;
- before/after o fingerprints;
- intento rechazado con cero efecto;
- corrección vinculada;
- rollback vinculado;
- alcance territorial;
- mínimo privilegio;
- paginación estable;
- privacidad;
- causalidad;
- writer adoption.

---

#### 106. Prueba de bypass de writers

Ningún writer dentro del alcance puede modificar configuración protegida evitando autorización, conflictos, límites, concurrencia o evidencia cuando correspondan.

---

#### 107. Criterio de completitud

Una unidad es conforme únicamente cuando:

- conflictos aplicables están materializados;
- ningún writer puede persistir conflicto bloqueante;
- límites obligatorios están aplicados;
- concurrencia crítica está controlada;
- autorización real sigue siendo la de `VISO-CORE-004`;
- evidencia obligatoria se registra;
- readers respetan permiso y alcance;
- corrección y rollback preservan historia;
- writers legacy tienen decisión;
- pruebas aplicables pasan;
- deudas restantes son no bloqueantes y tienen owner.

---

#### 108. No equivalencia tarea–instancia

```text
VISO-CORE-005 DOCUMENTAL APROBADA
≠
VISO-CORE-005::implementation_unit_id IMPLEMENTADA
```

La tarea define el contrato. La instancia física demuestra cumplimiento.

---

#### 109. Fronteras de responsabilidad

| Fuente o tarea | Responsabilidad preservada |
| --- | --- |
| `VISO-CORE-004` | autorización real y evidencia de decisión |
| `VISO-AUTH-016` | semántica de conflictos administrativos |
| `VISO-AUTH-018` | contrato de auditoría de cambios de seguridad |
| `AUTH-ERR-017` | inconsistencia administrativa transversal |
| `AUTH-DB-012` | fundación física de auditoría de cambios de permisos |
| `AUTH-DB-020` | transición física de objetos y writers cuando aplique |
| VISO-UX | experiencia final |
| `VISO-CORE-006` | aprobación final del núcleo |

---

#### 110. Supabase

Toda modificación VENTO de Supabase que una futura unidad requiera se crea, versiona, valida y ejecuta desde `vento-group-sas/vento-shell`.

Esta tarea documental no modifica un entorno Supabase.

---

#### 111. vento-viso

Una futura unidad puede requerir cambios en `vento-viso` si el package los autoriza.

El AS-IS no amplía el alcance físico por sí solo.

---

#### 112. Programación laboral y otros dominios

Esta tarea no activa el delta mensual de programación ni absorbe conflictos propios de inventario, producción, POS, logística u otros procesos.

Cada owner conserva su contrato.

---

#### 113. Resultado permitido sin migración

Una unidad puede completar el contrato sin crear tablas o migraciones nuevas si la fundación existente, los writers adoptados, la concurrencia y las pruebas ya son conformes.

No se exige cambio artificial.

---

#### 114. Handoff físico a VISO-CORE-006

Por cada unidad materializada, `VISO-CORE-006` recibe:

- identidad exacta;
- package;
- alcance implementado;
- dependencias verificadas;
- autorización real verificada;
- inventario de conflictos;
- resultado de conflictos bloqueantes;
- deudas de revisión;
- límites;
- concurrencia;
- writers y adopción;
- fundación de auditoría;
- bindings de evidencia;
- readers y alcance;
- correcciones y rollback;
- pruebas;
- versiones;
- fingerprints;
- bloqueadores;
- evidencia de cero bypass.

No recibe una declaración genérica de “conflictos y auditoría listos”.

---

#### 115. Handoff documental a VISO-CORE-006

La siguiente tarea deberá decidir si el núcleo mínimo completo puede aprobarse antes de ampliar alcance.

Consumirá evidencia de `VISO-CORE-001` a `VISO-CORE-005` y no reabrirá decisiones correctas sin contradicción verificable.

---

#### 116. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

Los contratos vigentes ya protegen detección de conflictos, consistencia de configuración, alcance territorial, evidencia, invalidación, auditoría y equivalencia entre VISO y consumidores. Esta tarea asigna su materialización por unidad sin crear una regla protegida independiente.

---

#### 117. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, esta tarea reutiliza:

- `TREQ-VISO-001` — efecto prospectivo, conflictos, procedencia, territorio, auditoría y equivalencia;
- `TREQ-AUTH-007` — administración explícita y territorial;
- `TREQ-AUTH-009` — territorio determinista;
- `TREQ-AUTH-013` — mutaciones server-side;
- `TREQ-AUTH-014` — invalidación y frescura;
- `TREQ-AUTH-015` — evidencia correlacionable;
- `TREQ-AUTH-016` — revocación sin destruir historia;
- `TREQ-AUTH-289` a `TREQ-AUTH-298` — configuración inconsistente, carriles, precedencia causal, equivalencia multicanal, experiencia segura y reconciliación física.

Estas referencias son trazabilidad heredada. No actualizan el registro.

---

#### 118. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería documental no se ha ejecutado todavía sobre el checkout local de la rama de `VISO-CORE-005`. |
| LOCAL | NOT_EXECUTED | El bloque todavía no ha sido insertado, normalizado ni validado dentro de la rama documental local. |
| REMOTA | PASS | Se verificaron el `main` vigente después del cierre de `VISO-CORE-004`, continuidad, owner, topología, gate, políticas documentales, handoffs de `VISO-CORE-003` y `VISO-CORE-004`, contratos `VISO-AUTH-016`, `VISO-AUTH-018` y `AUTH-ERR-017`, Registro 04A de VISO y AUTH, fundación física de `AUTH-DB-012`, migración de auditoría de permisos, scripts documentales y AS-IS relevante de conflictos en `vento-viso`. |
| OPERATIVA | NOT_APPLICABLE | La entrega documental no cambia configuración real, permisos, asignaciones, turnos, auditoría runtime, datos productivos ni comportamiento operativo. |
| FÍSICA | NOT_EXECUTED | La tarea define un contrato `PER_IMPLEMENTATION_UNIT`; ninguna instancia física de `VISO-CORE-005` se crea ni ejecuta mediante esta aprobación documental. |

---

#### 119. Criterios de aceptación

- [ ] Se conserva `PER_IMPLEMENTATION_UNIT`.
- [ ] Se conserva `POST_E5_PACKAGE`.
- [ ] No existe instancia global.
- [ ] No se inventa un `implementation_unit_id`.
- [ ] Se reciben los handoffs reales de `VISO-CORE-003` y `VISO-CORE-004`.
- [ ] Conflicto prospectivo, inconsistencia runtime y auditoría permanecen separados.
- [ ] `VISO-AUTH-016` sigue siendo fuente de conflictos administrativos.
- [ ] `AUTH-ERR-017` sigue siendo fuente de inconsistencia transversal.
- [ ] No se crea otro reason code público equivalente.
- [ ] DENY coherente no se convierte en conflicto.
- [ ] Ausencia ordinaria no se convierte en StructuralIssue.
- [ ] `AUTH-ERR-018` permanece para permiso no registrado.
- [ ] `AUTH-ERR-019` permanece para indisponibilidad.
- [ ] Se conservan las tres severidades estructurales.
- [ ] La composición por modalidad respeta carriles.
- [ ] El snapshot prospectivo se calcula antes de guardar.
- [ ] Conflicto bloqueante impide efecto.
- [ ] Conflicto ajeno no congela globalmente.
- [ ] Legacy no se propaga.
- [ ] No existe reparación automática.
- [ ] La matriz de casos bloqueantes y no bloqueantes se preserva.
- [ ] Scope, sede, área, rol y turno no se infieren.
- [ ] Versiones incompatibles bloquean.
- [ ] Detección es determinista.
- [ ] Cada conflicto tiene owner.
- [ ] La proyección de conflicto minimiza información.
- [ ] Límites provienen de contratos.
- [ ] Segregación, autoaprobación y autoafectación se preservan.
- [ ] Sensibilidad no se degrada.
- [ ] Concurrencia evita lost update.
- [ ] Escrituras stale se rechazan.
- [ ] Carreras relevantes se controlan.
- [ ] Idempotencia no duplica efectos.
- [ ] Reintentos usan estado fresco.
- [ ] Correcciones crean nueva evidencia.
- [ ] Rollback conserva historia.
- [ ] Borrado de borrador no borra evidencia obligatoria.
- [ ] Notificaciones solo se emiten cuando corresponden.
- [ ] Historial y estado actual permanecen separados.
- [ ] Evidencia es append-only.
- [ ] Before/after o fingerprints son reconstruibles cuando aplica.
- [ ] Intentos rechazados se conservan cuando corresponde.
- [ ] Se conserva correlación y causalidad.
- [ ] Principal, actor y principal técnico permanecen separados.
- [ ] Territorio histórico no se reescribe.
- [ ] Versiones y fingerprints históricos se preservan.
- [ ] Sensibilidad y retención se respetan.
- [ ] `AUTH-DB-012` se reutiliza para cambios de permisos.
- [ ] No se duplica la fundación de auditoría de permisos.
- [ ] Writer adoption se verifica y no se presume.
- [ ] `AUTH-DB-020` conserva su transición física.
- [ ] Cambios no-permiso usan su owner de evidencia.
- [ ] Ausencia de audit trail obligatorio bloquea.
- [ ] AuthorizationDecision no sustituye Change Audit.
- [ ] `viso.authorization.audit_logs.view` permanece capacidad exacta de lectura de auditoría de seguridad.
- [ ] `AUDIT_EVENT` permanece recurso de esa lectura.
- [ ] Filtros no amplían scope.
- [ ] Paginación y orden son estables.
- [ ] Proyección de auditoría es mínima.
- [ ] Lectura no implica exportación.
- [ ] Rechazos conservan cero efecto.
- [ ] Concurrencia stale se distingue de conflicto.
- [ ] Fallo técnico no se registra como DENY.
- [ ] Rollback y corrección quedan vinculados.
- [ ] Roles cliente no editan evidencia append-only.
- [ ] `service_role` y `SECURITY DEFINER` no son bypass.
- [ ] RLS no sustituye conflicto ni auditoría.
- [ ] Todos los writers aplicables están inventariados.
- [ ] Cada writer tiene clasificación de transición.
- [ ] Compatibilidad legacy no crea bypass.
- [ ] No se retiran writers globalmente por inferencia.
- [ ] Conflictos AS-IS locales no se confunden con motor transversal.
- [ ] `onConflict` técnico no se confunde con conflicto empresarial.
- [ ] Logs, Git y métricas no sustituyen runtime evidence.
- [ ] Bloqueos pre-commit demuestran cero efectos.
- [ ] Fallos post-efecto no afirman rollback sin evidencia.
- [ ] La frontera de atomicidad queda documentada.
- [ ] Todo pendiente tiene owner y condición de salida.
- [ ] Bypass, concurrencia ausente, audit gap o proyección insegura bloquean.
- [ ] Se ejecutan pruebas de conflicto y no-conflicto.
- [ ] Se ejecutan pruebas de concurrencia.
- [ ] Se ejecutan pruebas append-only, corrección y rollback.
- [ ] Se ejecutan pruebas territoriales y de privacidad.
- [ ] Se ejecuta prueba de writer adoption.
- [ ] Ningún writer evita los controles.
- [ ] `VISO-CORE-004` conserva autorización real.
- [ ] VISO-UX conserva experiencia final.
- [ ] Toda modificación VENTO de Supabase permanece en `vento-shell`.
- [ ] `vento-viso` solo cambia dentro de package y unidad autorizados.
- [ ] El delta mensual no se activa por esta tarea.
- [ ] No se absorben conflictos de otros procesos.
- [ ] No se exige migración artificial.
- [ ] `VISO-CORE-006` recibe handoff verificable.
- [ ] No se crean requisitos de prueba.
- [ ] No se modifican requisitos de prueba.
- [ ] No se modifica el Registro Canónico de Requisitos de Prueba.

---

#### 120. Límites

Esta tarea no:

- crea o selecciona packages;
- cambia la línea de packages;
- crea manualmente una unidad;
- crea una instancia global;
- autoriza o ejecuta implementación física;
- modifica Supabase ni datos reales;
- crea migraciones, tablas, RPC, RLS, grants, funciones, triggers, Storage, Realtime, Edge Functions, cron o colas;
- cambia secretos o Auth;
- cambia código de `vento-viso` o de otra aplicación;
- crea otro evaluador de autorización;
- crea un catálogo local de StructuralIssue;
- crea reason codes alternativos a `AUTH-ERR-017`;
- reabre `AUTH-ERR-018` o `AUTH-ERR-019`;
- redefine modalidades, precedencia, recursos o matrices;
- crea un motor transversal nuevo de auditoría;
- duplica `AUTH-DB-012`;
- presume writer adoption;
- fuerza cambios no-permiso en tablas de auditoría de permisos;
- inventa una estrategia universal de locking;
- crea hard delete universal;
- borra evidencia histórica;
- define un plazo único de retención para todo VISO;
- define UX final;
- activa el delta mensual;
- absorbe conflictos operativos ajenos;
- certifica el núcleo completo;
- desarrolla `VISO-CORE-006`;
- modifica o crea requisitos de prueba;
- modifica el Registro Canónico de Requisitos de Prueba.

---

#### 121. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-CORE-004 — Implementar autorización real del núcleo`

**TAREA ACTUAL APROBADA**
`VISO-CORE-005 — Implementar validación de conflictos y auditoría`

**SIGUIENTE TAREA RESERVADA**
`VISO-CORE-006 — Aprobar núcleo antes de ampliar alcance`


### [ ] VISO-CORE-006 — Aprobar núcleo antes de ampliar alcance

### Dependencias del delta mensual

- `VISO-CORE-003` consume `VISO-SCH-008`.
- `VISO-CORE-004` debe demostrar permisos por acción o justificar un permiso común sin exceso.
- `VISO-CORE-005` incluye conflictos, límites, concurrencia, auditoría, corrección, borrado de borradores y notificación.
- `VISO-CORE-006` no cierra con el delta abierto ni sin cierre del package cuando este forme parte del núcleo.
