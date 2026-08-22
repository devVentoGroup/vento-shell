# @vento/contracts/ownership

Contrato estático interno de propiedad funcional de Vento OS.

## Estado

Esta materialización corresponde a `SHELL-CON-016::GLOBAL`.

Es una fundación `PRE_E5_FOUNDATION`.

El namespace lógico reservado es:

```text
@vento/contracts/ownership
```

La materialización es interna al workspace `@vento/contracts`; no añade `exports` públicos, no publica una release y no adopta consumidores.

## Autoridades

La proyección se deriva y reconcilia desde:

- `SHELL-CON-016`, autoridad contractual de centralización;
- `SHELL-CON-002`, autoridad de `AppCode`;
- `SHELL-CON-009`, autoridad de `ProcessId`;
- `PROC-CAT-005` y `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`, autoridad de propietaria para los 69 procesos;
- `CAP-MAP-008`, autoridad de fuente objetivo para las 217 subcapacidades mediante el modelo familia más excepción;
- `CAP-MAP-013`, autoridad del caso AS-IS de propiedad competidora;
- `SHELL-CON-012`, `SHELL-CON-013`, `SHELL-CON-014` y `SHELL-CON-015`, que conservan separadas las identidades y responsabilidades de acciones, eventos, handoffs e ítems de trabajo.

La proyección compartida nunca sustituye esas autoridades.

## Resultado materializado

El corte vigente representa:

```text
69 asignaciones de propietaria de proceso
10 AppCode en el universo canónico
9 AppCode efectivamente usados como propietaria de proceso
217 decisiones de fuente cubiertas por CAP-MAP-008
18 familias con proyección base
5 estados de fuente objetivo
5 clases conceptuales de representación
1 caso AS-IS confirmado de propiedad competidora
0 ownership_id
0 registro plano paralelo de 217 subcapacidades
```

La diferencia `10` frente a `9` es deliberada: `shell` pertenece al universo de 10 `AppCode`, pero `PROC-CAT-005` le asigna 0 procesos en el corte vigente. Pertenecer al catálogo no concede propiedad sobre un resultado.

## Propiedad de procesos

Las 69 asignaciones se proyectan directamente desde `PROC-CAT-005`.

La distribución vigente es:

```text
shell   0
anima   1
viso   20
nexo   16
fogo    6
origo   4
pulso  12
numera  7
aura    2
pass    1
TOTAL  69
```

Cada proyección conserva:

```text
process_id
owner_app_code
authority_ref
ownership_scope
effective_version
compatibility_status
```

`resolveProcessOwner()` consulta únicamente esa proyección reconciliada.

## Propiedad de capacidades e información

`CAP-MAP-008` cubre 217 decisiones mediante:

```text
fuente base de la familia
+ excepción de la subcapacidad
= fuente actual y fuente objetivo de la subcapacidad
```

Por tanto, este módulo no fabrica una tabla plana de 217 filas.

Materializa exactamente las 18 proyecciones base de familia y conserva los cinco estados:

```text
OBJETIVO_FUERTE
OBJETIVO_CON_FRONTERA
OBJETIVO_DIVIDIDO
OBJETIVO_DIFERIDO
SIN_FUENTE_ADECUADA
```

`resolveCapabilitySource()` opera con fallo cerrado:

- una referencia exacta `CAP-01` a `CAP-18` puede devolver la base familiar;
- una referencia específica como `CAP-06.04` exige consultar el detalle canónico de `CAP-MAP-008`;
- una referencia no reconocida queda `UNRESOLVED`.

La base familiar no se presenta como si fuera una decisión específica cuando puede existir una excepción.

## Identidad

No existe un identificador serial universal de propiedad.

```text
ownership_id = NO CREADO
```

La decisión se identifica mediante el sujeto canónico y la autoridad que la gobierna.

No se concatenan `AppCode`, tabla, repositorio, módulo o dominio para fabricar otra identidad.

## Dimensiones conceptuales

La superficie conserva las nueve dimensiones conceptuales de `SHELL-CON-016`:

```text
subject_kind
subject_ref
owner_app_code
authority_ref
ownership_scope
source_status
boundary_ref
effective_version
supersedes_ref
```

No todos los sujetos utilizan todas las dimensiones y el contrato no inventa valores para aparentar completitud.

## Representaciones no propietarias

Las cinco clases conceptuales admitidas son `REFERENCE`, `PROJECTION`, `CONTROLLED_CACHE`, `DERIVED_RESULT` y `EVIDENCE_COPY`.

La enumeración contractual es:

```text
REFERENCE
PROJECTION
CONTROLLED_CACHE
DERIVED_RESULT
EVIDENCE_COPY
```

Una referencia, proyección, caché o copia de evidencia no adquiere autoridad sobre el original.

Un `DERIVED_RESULT` puede poseer autoridad sobre su derivación sin reescribir el hecho fuente.

## Consultas estáticas

La superficie expone:

```text
resolveProcessOwner()
resolveCapabilitySource()
isCanonicalOwner()
assertOwnershipProjectionFresh()
```

Estas funciones son consultas o comprobaciones estáticas.

`isCanonicalOwner()` devuelve una decisión booleana solo cuando la proyección exacta disponible permite resolverla. Para sujetos no materializados con suficiente granularidad devuelve `null`; no infiere desde nombres, repositorios, tablas, pantallas, permisos o último escritor.

`assertOwnershipProjectionFresh()` comprueba la versión de la proyección. No ejecuta autorización runtime.

## Escritura cross-app

Una consumidora no escribe directamente el estado privado de la propietaria.

La secuencia conceptual permanece:

```text
consumidor
-> solicita una acción por contrato autorizado
-> propietaria revalida autoridad, estado, versión y contexto
-> aplica o rechaza
-> confirma el hecho resultante
```

Este módulo no implementa comandos, APIs, RPC, Server Actions, workers, inbox, outbox ni persistencia.

## Eventos, handoffs e ítems de trabajo

`SHELL-CON-013` conserva autoridad sobre `BusinessEventId`.

`SHELL-CON-014` conserva autoridad sobre `ApplicationHandoffRelation`.

`SHELL-CON-015` conserva la semántica de `owner_app_code` de un ítem de trabajo existente.

Un evento no transfiere propiedad.

Un handoff puede transferir trabajo o custodia sin transferir automáticamente la propiedad del hecho.

La aplicación que muestra un ítem de trabajo no se convierte por ello en propietaria de la obligación.

## SHELL

`shell` permanece como `AppCode` canónico y coordinador transversal, pero no es propietaria universal.

Puede descubrir, proyectar contexto permitido, mostrar referencias y navegar al destino autorizado. No adquiere por ello propiedad sobre ventas, compras, inventario, producción, talento, finanzas o incidentes de otras aplicaciones.

## Conflicto AS-IS preservado

`CAP-MAP-013` confirma un caso de propiedad competidora:

```text
public.employee_shifts
AS-IS: VISO + ANIMA pueden editar
objetivo: VISO publica o corrige
consumidora: ANIMA consulta
```

La constante documental correspondiente conserva esta deuda como `PREEXISTING_DEBT_NOT_REMEDIATED`.

`SHELL-CON-016::GLOBAL` no modifica `public.employee_shifts`, permisos, RLS, endpoints, datos ni consumidoras.

## Frescura y cambio de propietaria

La proyección usa una versión efectiva ligada al contrato autorizado de `SHELL-CON-016`.

Si cambia `PROC-CAT-005`, `CAP-MAP-008` o la decisión canónica aplicable, la proyección debe reconciliarse antes de presentarse como vigente.

Mover una tabla, repositorio, publicador o UI no modifica propiedad funcional.

## Cobertura de prueba

La materialización reutiliza la cobertura canónica vigente de propiedad, fuente de verdad, captura única, integración y UX.

No crea ni modifica TREQ.

## Fronteras

Esta instancia no:

- modifica `packages/contracts/package.json`;
- añade `exports` públicos;
- cambia la versión `1.0.0-alpha.1`;
- reasigna procesos o subcapacidades;
- materializa una tabla plana de 217 decisiones;
- crea `ownership_id`;
- crea tablas, vistas, columnas o migraciones;
- modifica `public.employee_shifts`;
- crea RLS, RPC, funciones o triggers;
- crea permisos o autorización runtime;
- crea APIs, Server Actions, endpoints o rutas;
- crea productores, consumidores, workers, inbox, outbox, topics, colas, brokers o webhooks;
- implementa caché, persistencia o sincronización;
- toca Supabase o datos empresariales;
- modifica 04A/TREQ;
- publica registry, tag, release o despliegue.

## Siguiente responsabilidad reservada

`SHELL-CON-017` permanece reservada para el contrato de principal técnico de integración y no forma parte de `SHELL-CON-016::GLOBAL`.
