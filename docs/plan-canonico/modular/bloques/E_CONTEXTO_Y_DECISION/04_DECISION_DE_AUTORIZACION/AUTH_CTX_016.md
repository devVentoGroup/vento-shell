### ✅ AUTH-CTX-016 — Incluir aplicación y permiso solicitado

**Estado:** APROBADA
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** AUTHORIZATION DECISION  
**Naturaleza:** Definición documental de `app_code` y `permission_code` dentro de `AuthorizationDecision`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-015 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-017 — Incluir `authorization_requirement`  
**Contrato afectado:** `AuthorizationDecision@1.0.0`  
**Campos afectados:** `app_code`, `permission_code`  
**Catálogo de referencia:** `vento.authorization@1.0.0`  
**Schema del catálogo:** `1.0.0`  
**Aplicaciones registradas:** 10  
**Permisos activos congelados:** 140  
**Huella contractual:** `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea inicia la definición interna de `AuthorizationDecision`.

Su responsabilidad es identificar de forma exacta:

- qué aplicación empresarial recibe la solicitud;
- qué capacidad empresarial concreta se intenta ejecutar;
- qué clave canónica resulta de ambos campos;
- si la aplicación existe y está activa;
- si el permiso existe, está activo y pertenece a la aplicación;
- si la solicitud utiliza la convención canónica;
- si existe una clave legacy, alias o permiso retirado;
- si el consumidor intenta elegir un permiso diferente al exigido por la
  operación;
- si la versión del catálogo utilizada es la correcta.

No resuelve todavía:

- modalidad de autorización;
- turno o check-in requerido;
- área requerida;
- compatibilidad con dispositivo compartido;
- sensibilidad;
- reautenticación fuerte;
- recurso real;
- carril base;
- carril operativo;
- allows;
- denegaciones;
- decisión final.

Estas responsabilidades se asignan expresamente a AUTH-CTX-017 a
AUTH-CTX-024.

No modifica el catálogo, no agrega permisos, no crea aliases, no implementa
SQL, RPC, RLS, migraciones, guards, middlewares, aplicaciones ni cambios
físicos en Supabase.

---

#### 1. Objetivo

Definir `app_code` y `permission_code` de manera que Vento OS pueda responder
inequívocamente:

1. cuál aplicación es propietaria de la capacidad solicitada;
2. cuál es el código relativo exacto del permiso;
3. cuál es la clave completa resultante;
4. si los valores tienen una forma sintáctica válida;
5. si la aplicación existe en el catálogo canónico;
6. si la aplicación está activa;
7. si el permiso existe dentro de esa aplicación;
8. si el permiso está activo;
9. si el permiso fue retirado o deprecado;
10. si la solicitud contiene una clave legacy;
11. si existe un alias explícito y versionado;
12. si el alias puede adaptarse de forma unívoca;
13. si la clave representa una capacidad empresarial y no una ruta;
14. quién es responsable de declarar el permiso exigido por una operación;
15. cómo impedir que el cliente escoja una capacidad menos restrictiva;
16. cómo evaluar `app.access`;
17. cómo tratar solicitudes de varias capacidades;
18. cómo preservar determinismo, auditoría y fail closed;
19. cómo mantener separado el dominio laboral del dominio cliente;
20. qué elementos deberán completar las tareas posteriores.

---

#### 2. Base normativa

AUTH-CTX-016 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-CAT-001 — Definir aplicaciones canónicas;
- AUTH-CAT-002 — Definir convención
  `app.modulo.recurso.accion`;
- AUTH-CAT-003 a AUTH-CAT-005 — Normalización, consolidación y descripción;
- AUTH-CAT-006 — Modalidad de autorización;
- AUTH-CAT-007 a AUTH-CAT-019 — Clasificaciones contractuales;
- AUTH-CAT-020 a AUTH-CAT-024 — Brechas, descomposición, diff y publicación;
- AUTH-RBAC-024 a AUTH-RBAC-026 — Datasets canónicos;
- AUTH-CTX-001 a AUTH-CTX-004 — Contratos y versionado;
- AUTH-CTX-005 a AUTH-CTX-015 — Resolución de `AccessContext`.

Principios obligatorios:

```text
APP_CODE
→ IDENTIFICA UNA APLICACIÓN ESTABLE
```

```text
PERMISSION_CODE
→ IDENTIFICA UNA CAPACIDAD RELATIVA DENTRO DE LA APLICACIÓN
```

```text
PERMISSION_KEY
=
APP_CODE
+
"."
+
PERMISSION_CODE
```

```text
PERMISO SOLICITADO
≠
RUTA
≠
PANTALLA
≠
MÉTODO HTTP
≠
COMPONENTE
```

```text
PERMISO VÁLIDO
≠
PERMISO CONCEDIDO
```

```text
APLICACIÓN VÁLIDA
≠
APLICACIÓN AUTORIZADA PARA EL ACTOR
```

---

#### 3. Forma contractual conservada

`AuthorizationDecision@1.0.0` conserva los campos:

```ts
type AuthorizationDecision = {
  app_code: string;
  permission_code: string;
  authorization_requirement: unknown;
  resource: unknown;
  base_decision: unknown;
  operational_decision: unknown;
  matched_allows: unknown[];
  structural_denies: unknown[];
  actor_wide_denies: unknown[];
  lane_denies: unknown[];
  blocked_reasons: string[];
  final_decision: "ALLOW" | "DENY";
};
```

AUTH-CTX-016 define exclusivamente:

```ts
app_code: string;
permission_code: string;
```

No agrega un campo `permission_key`.

La clave completa se deriva de forma determinista:

```ts
const permissionKey = `${app_code}.${permission_code}`;
```

---

#### 4. Aplicaciones canónicas

El catálogo contractual contiene diez aplicaciones:

```text
NÚCLEO LABORAL
├── shell
├── anima
├── viso
├── nexo
├── fogo
├── origo
├── pulso
└── numera

LABORAL DIFERIDA
└── aura

DOMINIO CLIENTE ADYACENTE
└── pass
```

Reglas:

1. `app_code` identifica una frontera funcional estable;
2. el nombre visible de la aplicación puede cambiar;
3. el repositorio no sustituye `app_code`;
4. una ruta no crea una aplicación;
5. una aplicación diferida continúa siendo identificable;
6. una aplicación del dominio cliente no se convierte en laboral;
7. la existencia de la aplicación no concede acceso;
8. la aplicación deberá estar activa para continuar la evaluación.

---

#### 5. Semántica de `app_code`

`app_code` será el código canónico exacto solicitado.

Ejemplos válidos:

```text
shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass
```

No se aceptarán como equivalentes:

```text
VENTO-SHELL
vento-shell
Vento OS
NEXO App
vento_nexo
Nexo
```

La comparación será exacta y sensible a la forma canónica.

No se aplicará:

- conversión automática a minúsculas;
- eliminación silenciosa de espacios;
- corrección ortográfica;
- normalización por nombre humano;
- inferencia desde URL;
- inferencia desde repositorio;
- inferencia desde host;
- inferencia desde el permiso;
- inferencia desde el dispositivo.

---

#### 6. Forma sintáctica de `app_code`

La forma contractual será:

```text
^[a-z][a-z0-9_]*$
```

Adicionalmente:

- no puede estar vacío;
- no puede contener puntos;
- no puede contener guiones;
- no puede contener espacios;
- no puede contener wildcards;
- no puede contener barras;
- no puede exceder la longitud máxima definida por el schema físico futuro;
- debe existir exactamente en el catálogo de aplicaciones.

La longitud física se definirá en AUTH-CTX-026 y se implementará mediante los
paquetes correspondientes de BLOQUE R.

---

#### 7. Aplicación inexistente

Una solicitud sintácticamente válida cuya aplicación no exista producirá:

```text
final_decision = DENY
blocked_reasons incluye APPLICATION_NOT_FOUND
```

No se buscará una aplicación parecida.

No se utilizará:

- la aplicación actual del navegador;
- el prefijo del permiso;
- la ruta;
- la plantilla del dispositivo;
- el repositorio;
- `shell` como fallback.

---

#### 8. Aplicación inactiva

Una aplicación existente pero inactiva producirá:

```text
final_decision = DENY
blocked_reasons incluye APPLICATION_INACTIVE
```

La inactividad no se corrige mediante:

- rol propietario;
- rol gerente general;
- dispositivo autorizado;
- permiso individual;
- grant global;
- simulación;
- acceso directo a una ruta.

La aplicación inactiva continúa siendo identificable para auditoría, pero no
puede producir una decisión positiva.

---

#### 9. AURA

`aura` conserva su identidad canónica como aplicación laboral diferida.

Reglas:

- puede aparecer en el catálogo;
- no se considera implementada por estar registrada;
- no obtiene permisos por inferencia;
- no se habilita mediante rutas existentes;
- toda acción exige un permiso canónico activo;
- su auditoría funcional continúa en las tareas específicas del BLOQUE W;
- AUTH-CTX-016 únicamente valida identidad de aplicación y permiso.

---

#### 10. PASS

`pass` pertenece al dominio cliente adyacente.

La autenticación normal del cliente final no se convierte en autorización
laboral por aparecer `pass` en el catálogo.

AUTH-CTX-016 podrá evaluar una solicitud `pass.*` únicamente cuando la
operación esté expresamente modelada dentro del contrato
`vento.authorization@1.0.0`, por ejemplo una capacidad interna o
administrativa.

Reglas:

```text
cliente final de Vento Pass
≠
empleado laboral
```

```text
pass registrado en el catálogo
≠
toda operación de cliente usa RBAC laboral
```

Las fronteras definitivas entre autorización laboral, administrativa y de
cliente se validarán en AUTH-CTX-017, AUTH-CTX-019, AUTH-CTX-020 y
AUTH-CTX-023.

---

#### 11. Semántica de `permission_code`

`permission_code` será el código relativo del permiso dentro de la aplicación.

Ejemplo:

```text
app_code = nexo
permission_code = inventory.remissions.request
```

La clave completa será:

```text
nexo.inventory.remissions.request
```

`permission_code` no deberá contener el prefijo de aplicación.

Por tanto, es inválido enviar:

```text
app_code = nexo
permission_code = nexo.inventory.remissions.request
```

El código correcto será:

```text
permission_code = inventory.remissions.request
```

---

#### 12. Formas canónicas del permiso

Solo existen dos formas laborales canónicas:

```text
<app>.access
```

y:

```text
<app>.<module>.<resource>.<action>
```

Dentro de `AuthorizationDecision` se representan como:

```text
app_code = nexo
permission_code = access
```

o:

```text
app_code = nexo
permission_code = inventory.remissions.request
```

No se aceptan capacidades parciales como:

```text
inventory
inventory.remissions
inventory.remissions.*
*.request
```

---

#### 13. Forma sintáctica de `permission_code`

La forma relativa será una de estas:

```text
^access$
```

o:

```text
^[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*$
```

Reglas:

- exactamente un segmento para `access`;
- exactamente tres segmentos para una capacidad ordinaria;
- ningún segmento vacío;
- ningún wildcard;
- ningún espacio;
- ningún prefijo de aplicación;
- ningún slash;
- ningún guion;
- ninguna mayúscula;
- ningún parámetro de ruta;
- ningún identificador de recurso real;
- ningún identificador de sede o área;
- ningún rol;
- ninguna modalidad.

---

#### 14. Identidad completa del permiso

La identidad canónica se obtiene mediante:

```text
permission_key
=
app_code
+
"."
+
permission_code
```

Ejemplos:

```text
shell + access
→ shell.access
```

```text
nexo + inventory.remissions.request
→ nexo.inventory.remissions.request
```

```text
viso + authorization.permissions.assign
→ viso.authorization.permissions.assign
```

La búsqueda se realizará por la clave completa exacta.

No se buscará `permission_code` globalmente sin `app_code`.

---

#### 15. Duplicidad de códigos relativos

Dos aplicaciones pueden contener el mismo código relativo.

Ejemplos conceptuales:

```text
nexo.finance.cost_centers.view
numera.finance.cost_centers.view
```

Por tanto:

```text
permission_code
```

no identifica por sí solo una capacidad global.

La identidad mínima siempre será:

```text
app_code + permission_code
```

---

#### 16. Catálogo canónico de referencia

La resolución deberá utilizar exclusivamente:

```text
catalog_id = vento.authorization
catalog_version = 1.0.0
catalog_schema_version = 1.0.0
contract_release_hash =
sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

El catálogo contiene:

```text
10 aplicaciones
140 permisos activos
```

La versión, schema y huella no se serializan como campos nuevos dentro de
`AuthorizationDecision@1.0.0`, pero deberán formar parte de:

- configuración del evaluador;
- evidencia auditable;
- pruebas;
- despliegue;
- fingerprint de decisión.

AUTH-CTX-024 y AUTH-CTX-026 completarán esas responsabilidades.

---

#### 17. Permiso inexistente

Si la clave completa no existe:

```text
final_decision = DENY
blocked_reasons incluye PERMISSION_NOT_FOUND
```

No se buscará:

- coincidencia parcial;
- prefijo;
- sufijo;
- acción parecida;
- recurso parecido;
- permiso del mismo módulo;
- permiso `access`;
- permiso más amplio;
- permiso del rol;
- permiso de otra aplicación.

---

#### 18. Permiso inactivo

Si la clave existe pero está inactiva:

```text
final_decision = DENY
blocked_reasons incluye PERMISSION_INACTIVE
```

Un grant histórico o una fila en una matriz no reactiva el permiso.

La inconsistencia entre catálogo y dataset deberá auditarse y fallará cerrado
en AUTH-CTX-021 a AUTH-CTX-023.

---

#### 19. Permiso retirado

Una clave clasificada como retirada o técnica no podrá solicitarse como
capacidad empresarial.

Resultado:

```text
final_decision = DENY
blocked_reasons incluye PERMISSION_RETIRED
```

Ejemplos de categorías retiradas:

- permisos generados desde rutas;
- permisos de páginas técnicas;
- alias de navegación;
- claves sustituidas por una capacidad canónica;
- claves one-to-many que requieren descomposición.

El retiro documental no se revierte porque un consumidor legacy todavía use
la cadena.

---

#### 20. Alias y claves legacy

Un alias deprecado:

- no constituye una capacidad independiente;
- no recibe matrices nuevas;
- no recibe permisos nuevos;
- no amplía modalidad;
- no amplía alcance;
- no aparece como resultado canónico.

El evaluador canónico directo exigirá claves canónicas.

Regla:

```text
alias enviado directamente
→ DENY
→ PERMISSION_ALIAS_REQUIRES_ADAPTER
```

AUTH-CTX-028 diseñará adaptadores temporales explícitos.

Cuando un adaptador permitido traduzca una clave legacy uno-a-uno:

- la evaluación utilizará la clave canónica;
- `app_code` y `permission_code` de la decisión serán canónicos;
- la clave original permanecerá en auditoría;
- el adaptador tendrá versión;
- no se realizará traducción silenciosa dentro del evaluador.

---

#### 21. Alias uno-a-muchos

Una clave legacy que deba dividirse en varias capacidades no podrá adaptarse
automáticamente a una sola.

Ejemplo conceptual:

```text
permiso amplio legacy
→ capacidad A
+ capacidad B
+ capacidad C
```

Resultado:

```text
DENY
blocked_reasons incluye PERMISSION_LEGACY_REQUIRES_DECOMPOSITION
```

El consumidor deberá declarar la capacidad exacta que realmente ejecuta.

AUTH-CTX-028 diseñará la transición.

AUTH-CTX-027 obligará a corregir consumidores.

---

#### 22. Aplicación y permiso deben coincidir

La fila canónica del permiso deberá declarar el mismo `app_code` solicitado.

Regla:

```text
requested.app_code
=
catalog_permission.app_code
```

Una inconsistencia interna del catálogo producirá:

```text
DENY
blocked_reasons incluye CATALOG_PERMISSION_IDENTITY_INVALID
```

No se reasignará el permiso a otra aplicación.

No se utilizará el primer permiso con el mismo código relativo.

---

#### 23. La operación es propietaria del permiso

El cliente no decide libremente qué permiso protege una mutación.

El permiso exigido deberá proceder de:

- contrato de la acción de servidor;
- RPC canónica;
- comando empresarial;
- handler autorizado;
- registro centralizado de capacidades.

Flujo:

```text
SOLICITUD EMPRESARIAL
→ OPERACIÓN DE SERVIDOR
→ PERMISO EXIGIDO POR LA OPERACIÓN
→ EVALUADOR CANÓNICO
```

No:

```text
CLIENTE
→ ENVÍA EL PERMISO MÁS CONVENIENTE
→ OPERACIÓN LO ACEPTA
```

---

#### 24. Entrada declarada por el cliente

Una interfaz podrá enviar:

- intención de operación;
- identificador del recurso;
- parámetros empresariales.

No deberá poder reducir la protección enviando otro permiso.

Ejemplo prohibido:

```text
operación real = cancelar venta
cliente envía permission_code = sales.orders.view
```

La acción de servidor deberá exigir:

```text
pulso.sales.orders.cancel
```

independientemente del valor enviado por el cliente.

---

#### 25. Evaluador genérico

Un evaluador genérico podrá recibir `app_code` y `permission_code` únicamente
desde un consumidor de servidor confiable.

Cuando se exponga una consulta pública de evaluación:

- los campos deberán validarse;
- la respuesta será informativa para esa clave;
- no ejecutará la acción empresarial;
- no sustituirá la validación dentro de la mutación;
- un resultado previo no se reutilizará como autorización.

Regla:

```text
consultar si podría ejecutar
≠
ejecutar de forma autorizada
```

---

#### 26. Una decisión por capacidad

Cada `AuthorizationDecision` evalúa exactamente una clave.

No se admitirán:

- arrays de permisos dentro de `permission_code`;
- listas separadas por comas;
- expresiones booleanas;
- prefijos;
- wildcards;
- “cualquiera de estos”;
- “todos estos”;
- permisos alternativos dentro del mismo campo.

Una operación que necesite varias capacidades deberá definir un contrato
compuesto explícito.

AUTH-CTX-026 deberá diseñar la evaluación compuesta sin alterar la semántica
unitaria.

---

#### 27. Evaluación por lotes

Una API futura podrá evaluar varias solicitudes en un lote.

Cada elemento deberá:

- tener su propio `app_code`;
- tener su propio `permission_code`;
- producir su propia decisión;
- conservar su recurso;
- conservar su auditoría;
- fallar de forma independiente, salvo que la operación empresarial sea
  atómica.

No se fusionarán decisiones para producir una autorización más amplia.

El contrato físico de lote, si se implementa, deberá definirse en
AUTH-CTX-026 y probarse en AUTH-CTX-030.

---

#### 28. `app.access`

`<app>.access` autoriza únicamente la capacidad de ingresar o presentar la
aplicación según su contrato.

No autoriza:

- todas las rutas;
- todos los módulos;
- todas las acciones;
- todas las consultas;
- todas las mutaciones;
- administración;
- operación;
- configuración;
- acceso a cualquier recurso.

Regla:

```text
nexo.access
≠
nexo.inventory.remissions.request
```

---

#### 29. Relación entre acceso y acción específica

Una operación puede requerir dos evaluaciones independientes:

```text
1. <app>.access
2. <app>.<module>.<resource>.<action>
```

La necesidad de ambas dependerá del contrato del consumidor.

Reglas:

- `app.access` no implica la capacidad específica;
- una capacidad específica no sintetiza automáticamente `app.access`;
- una interfaz puede ocultarse si falta `app.access`;
- una mutación siempre deberá validar su capacidad específica;
- el servidor no confiará únicamente en que la aplicación ya se abrió.

AUTH-CTX-027 definirá el consumo centralizado por rutas y acciones.

---

#### 30. Permisos de lectura y mutación

La acción HTTP no determina el permiso.

Ejemplos:

```text
GET
→ puede requerir una capacidad sensible
```

```text
POST
→ puede ejecutar una consulta compleja sin mutar estado empresarial
```

La clasificación de lectura procede del catálogo.

Una capacidad `.view` no podrá utilizarse para autorizar una mutación.

Una capacidad mutadora deberá ser exacta.

---

#### 31. Rutas, pantallas y componentes

No podrán solicitarse como permisos:

```text
page_tsx.view
login.view
no_access.view
inventory_catalog_id.view
slug.view
```

Una ruta consume capacidades empresariales.

No se convierte en una capacidad por existir técnicamente.

AUTH-CTX-027 deberá eliminar mapas locales basados exclusivamente en carpetas,
rutas o componentes.

---

#### 32. Alcance y filtros fuera del código

No se admitirán dentro de `permission_code` expresiones como:

```text
view_all
all_sites
edit_own
edit_own_pending
for_area
for_site
```

cuando representen alcance y no una acción empresarial distinta.

El alcance se resuelve mediante:

- contrato del permiso;
- grants;
- contexto;
- recurso;
- territorio.

Las claves legacy que todavía contienen alcance se tratarán mediante
AUTH-CTX-028 y no se reinterpretarán silenciosamente.

---

#### 33. Estado del recurso fuera del código

El estado empresarial del recurso no se utilizará como permiso cuando solo
actúe como condición.

Ejemplo:

```text
editar una remisión propia pendiente
```

deberá resolverse como:

```text
capacidad exacta
+
propiedad del recurso
+
estado del recurso
```

No como una clave dinámica construida desde el estado.

AUTH-CTX-018 resolverá el recurso.

AUTH-CTX-019 y AUTH-CTX-020 evaluarán las condiciones del grant.

---

#### 34. Modalidad no se infiere

AUTH-CTX-016 no decide si la capacidad es:

- `BASE_ONLY`;
- `OPERATIONAL_ONLY`;
- `BASE_OR_OPERATIONAL`;
- `BASE_AND_OPERATIONAL`.

La modalidad procede del registro canónico y será proyectada en
AUTH-CTX-017.

Queda prohibido inferirla desde:

- aplicación;
- rol;
- nombre del permiso;
- matriz;
- turno;
- dispositivo;
- prefijo;
- módulo.

---

#### 35. Prerrequisitos no se infieren

AUTH-CTX-016 no decide si el permiso exige:

- turno;
- check-in;
- área;
- dispositivo personal;
- dispositivo compartido;
- reautenticación fuerte;
- simulación permitida;
- recurso;
- auditoría reforzada.

Estas clasificaciones proceden del permiso y se incluirán en
AUTH-CTX-017.

---

#### 36. Recurso no se infiere desde la clave

El permiso identifica la capacidad.

No identifica necesariamente:

- el recurso concreto;
- sede del recurso;
- área del recurso;
- origen;
- destino;
- propietario;
- estado;
- relaciones empresariales.

AUTH-CTX-018 deberá resolver esas dimensiones desde la operación real.

---

#### 37. Dispositivo compartido

AUTH-CTX-016 valida la identidad canónica de la aplicación y del permiso.

No decide todavía si:

```text
app_code ∈ allowed_application_codes
```

ni si:

```text
permission_key ∈ capability_package
```

Estas restricciones se proyectarán en AUTH-CTX-017 y se aplicarán en
AUTH-CTX-019, AUTH-CTX-020 y AUTH-CTX-023.

La aplicación o permiso siguen siendo canónicos aunque el dispositivo no los
admita.

---

#### 38. Aplicación abierta no es autoridad

El hecho de que:

- una ruta cargue;
- un menú esté visible;
- el bundle exista;
- el dispositivo permita la app;
- la aplicación esté instalada;
- el usuario llegue por URL directa;

no sustituye la evaluación.

Regla:

```text
APLICACIÓN PRESENTE
≠
APLICACIÓN AUTORIZADA
```

---

#### 39. Simulación

La simulación puede solicitar una aplicación y permiso hipotéticos.

Reglas:

- deberá usar claves canónicas;
- no podrá crear una capacidad inexistente;
- no podrá reactivar una clave retirada;
- no podrá usar un alias uno-a-muchos;
- no podrá convertir `WOULD_ALLOW` en `ALLOW`;
- el actor real conserva atribución;
- el resultado se publica mediante el contrato simulado.

Una clave inválida produce `INDETERMINATE` o `WOULD_DENY` según el contrato de
simulación, nunca `WOULD_ALLOW`.

AUTH-CTX-023 y las tareas del BLOQUE Q completarán la decisión simulada.

---

#### 40. Procesos de sistema e integraciones

Un proceso técnico también deberá declarar una clave empresarial canónica.

No podrá utilizar:

- `service_role`;
- API key;
- nombre de integración;
- nombre de cola;
- nombre de función;
- evento técnico;

como sustituto del permiso.

Las credenciales autentican el proceso.

El permiso autoriza la capacidad empresarial.

Las integraciones y procesos asíncronos deberán conservar la aplicación
propietaria y la capacidad exacta.

---

#### 41. Errores de contrato de entrada

Los siguientes casos son errores del contrato de invocación y no deberán
producir una decisión empresarial ordinaria:

- `app_code` ausente;
- `permission_code` ausente;
- tipo diferente de string;
- cadena vacía;
- espacios iniciales o finales;
- forma sintáctica inválida;
- wildcard;
- varios permisos en el mismo campo;
- clave completa enviada dentro de `permission_code`;
- versión de request no soportada.

AUTH-CTX-026 deberá definir la respuesta técnica exacta.

La mutación empresarial deberá permanecer sin ejecutar.

---

#### 42. Razones de bloqueo de resolución

Para solicitudes sintácticamente válidas que no puedan vincularse con el
catálogo, se reservan estas razones:

```text
APPLICATION_NOT_FOUND
APPLICATION_INACTIVE
PERMISSION_NOT_FOUND
PERMISSION_INACTIVE
PERMISSION_RETIRED
PERMISSION_ALIAS_REQUIRES_ADAPTER
PERMISSION_LEGACY_REQUIRES_DECOMPOSITION
CATALOG_PERMISSION_IDENTITY_INVALID
CATALOG_VERSION_UNAVAILABLE
CATALOG_INTEGRITY_INVALID
```

Estas razones:

- pertenecerán a `blocked_reasons`;
- no se agregarán a `AccessContext.structural_issues`;
- no modificarán retroactivamente `lane_readiness`;
- producirán `DENY`;
- serán consolidadas en AUTH-CTX-023;
- serán auditadas mediante AUTH-CTX-024.

---

#### 43. Integridad del catálogo

Antes de evaluar, el consumidor canónico deberá comprobar que:

1. el catálogo es el esperado;
2. la versión es compatible;
3. el schema es compatible;
4. la huella o artefacto desplegado corresponde a la publicación;
5. las aplicaciones son únicas;
6. las claves son únicas;
7. cada clave coincide con su `app_code`;
8. cada permiso activo tiene clasificaciones obligatorias;
9. no existen aliases activos como capacidades independientes;
10. no existen wildcards.

Una contradicción producirá:

```text
DENY
blocked_reasons incluye CATALOG_INTEGRITY_INVALID
```

No se utilizará parcialmente un catálogo corrupto.

---

#### 44. Versión no disponible

Si el evaluador no puede cargar una versión compatible del catálogo:

```text
DENY
blocked_reasons incluye CATALOG_VERSION_UNAVAILABLE
```

Queda prohibido:

- usar “latest”;
- usar una versión anterior sin adaptador;
- consultar directamente tablas legacy;
- completar campos con defaults;
- omitir clasificaciones desconocidas;
- degradar la decisión.

---

#### 45. Resultado canónico válido

Una solicitud queda canónicamente identificada cuando:

```text
app_code tiene forma válida
AND aplicación existe
AND aplicación está activa
AND permission_code tiene forma válida
AND permission_key existe
AND permiso está activo
AND permiso pertenece a app_code
AND catálogo y versión son válidos
```

Resultado:

```text
app_code = código canónico exacto
permission_code = código relativo canónico exacto
```

Esto solo permite continuar a AUTH-CTX-017.

No produce `ALLOW`.

---

#### 46. Resultado inválido

Si la solicitud supera validación sintáctica pero falla la resolución
canónica:

```text
app_code = valor solicitado seguro
permission_code = valor solicitado seguro
final_decision = DENY
blocked_reasons = razones aplicables
```

No se consultan:

- matrices;
- grants;
- turnos;
- check-ins;
- recursos;
- denegaciones individuales;

cuando la capacidad no es canónica.

La auditoría conservará la solicitud sin exponer datos sensibles.

---

#### 47. Orden canónico de resolución

```text
1. validar contrato de entrada
2. validar forma de app_code
3. validar aplicación exacta
4. validar estado de aplicación
5. validar forma de permission_code
6. construir permission_key
7. validar versión y huella del catálogo
8. buscar clave exacta
9. validar estado del permiso
10. validar pertenencia a la aplicación
11. clasificar alias, retiro o legado
12. producir app_code y permission_code canónicos
13. continuar a authorization_requirement
```

No se consultan grants antes de validar la capacidad.

---

#### 48. Determinismo

Para el mismo:

- request válido;
- catálogo;
- versión;
- schema;
- huella;
- estado de aplicaciones;
- estado de permisos;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- aplicación abierta;
- route segment;
- host;
- frontend;
- usuario;
- rol;
- dispositivo;
- primer permiso parecido;
- caché sin versión;
- alias implícito.

---

#### 49. Casos de ejemplo

##### Caso A — Acceso a NEXO

```text
app_code = nexo
permission_code = access
```

Clave:

```text
nexo.access
```

Resultado:

```text
identidad canónica válida
continuar a AUTH-CTX-017
```

No concede todas las capacidades de NEXO.

##### Caso B — Solicitar una remisión

```text
app_code = nexo
permission_code = inventory.remissions.request
```

Resultado:

```text
permission_key = nexo.inventory.remissions.request
```

La modalidad y prerrequisitos se resolverán después.

##### Caso C — Clave completa en `permission_code`

```text
app_code = nexo
permission_code = nexo.inventory.remissions.request
```

Resultado:

```text
error de contrato de entrada
no ejecutar operación
```

##### Caso D — Aplicación con mayúscula

```text
app_code = NEXO
```

Resultado:

```text
error de contrato de entrada
```

No se convierte automáticamente.

##### Caso E — Aplicación inexistente

```text
app_code = inventario
permission_code = access
```

Resultado:

```text
DENY
APPLICATION_NOT_FOUND
```

##### Caso F — Permiso inexistente

```text
app_code = nexo
permission_code = inventory.remissions.approve_everything
```

Resultado:

```text
DENY
PERMISSION_NOT_FOUND
```

##### Caso G — Permiso de otra aplicación

```text
app_code = nexo
permission_code = staff.employees.read
```

Si no existe esa clave completa en NEXO:

```text
DENY
PERMISSION_NOT_FOUND
```

No se busca automáticamente en VISO.

##### Caso H — `app.access`

```text
nexo.access = ALLOW
nexo.inventory.stock.view = no evaluado
```

Resultado:

```text
puede ingresar a NEXO según contrato
no implica consultar stock
```

##### Caso I — Ruta técnica legacy

```text
app_code = nexo
permission_code = inventory_catalog_id.view
```

Resultado:

```text
DENY
PERMISSION_RETIRED
```

##### Caso J — Alias uno-a-uno

```text
consumidor legacy envía alias
```

Evaluador directo:

```text
DENY
PERMISSION_ALIAS_REQUIRES_ADAPTER
```

Adaptador aprobado:

```text
alias
→ clave canónica exacta
→ evaluar
→ decisión publica clave canónica
```

##### Caso K — Alias uno-a-muchos

```text
permiso legacy amplio
→ tres capacidades canónicas
```

Resultado:

```text
DENY
PERMISSION_LEGACY_REQUIRES_DECOMPOSITION
```

##### Caso L — Aplicación permitida por dispositivo

```text
app válida
permission válida
app incluida en allowed_application_codes
```

Resultado de AUTH-CTX-016:

```text
identidad canónica válida
```

La compatibilidad del dispositivo todavía no concede acceso.

##### Caso M — Aplicación no permitida por dispositivo

```text
app válida
permission válida
app no incluida por dispositivo
```

Resultado de AUTH-CTX-016:

```text
identidad canónica válida
```

AUTH-CTX-017 y AUTH-CTX-023 producirán el bloqueo del dispositivo.

##### Caso N — Cliente elige permiso de lectura para mutar

```text
acción real = cancelar venta
cliente envía sales.orders.view
```

Resultado:

```text
la acción de servidor ignora la clave elegida
y exige pulso.sales.orders.cancel
```

##### Caso O — Permiso válido sin grants

```text
app y permiso canónicos
ningún allow coincide
```

Resultado de AUTH-CTX-016:

```text
identidad válida
```

Resultado posterior:

```text
DENY por default deny
```

No es un error de catálogo.

---

#### 50. Antipatrones prohibidos

```ts
const appCode = request.app ?? pathname.split("/")[1];

const permission =
  request.permission ??
  `${appCode}.${routeName}.view`;

const allowed =
  userPermissions.some((key) => key.startsWith(`${appCode}.`));

const canonical =
  permission.toLowerCase().trim();

const fallback =
  requestedPermission ?? `${appCode}.access`;
```

También queda prohibido:

```text
app desconocida → shell
permiso desconocido → app.access
alias → permiso más parecido
varios permisos → elegir cualquiera
permiso de lectura → proteger mutación
ruta visible → permiso concedido
app instalada → app autorizada
grant existente → permiso activo
rol propietario → ignorar catálogo
```

---

#### 51. Relación con tareas posteriores

##### AUTH-CTX-017

Proyectará desde el permiso canónico:

- modalidad;
- turno requerido;
- check-in requerido;
- área requerida;
- compatibilidad con dispositivo;
- reautenticación;
- sensibilidad;
- recurso requerido;
- simulación.

##### AUTH-CTX-018

Resolverá el recurso empresarial y sus territorios.

##### AUTH-CTX-019

Evaluará el carril base únicamente cuando la modalidad lo permita.

##### AUTH-CTX-020

Evaluará el carril operativo únicamente cuando la modalidad lo permita.

##### AUTH-CTX-021

Resolverá allows coincidentes para la clave completa canónica.

##### AUTH-CTX-022

Resolverá denegaciones coincidentes para la misma clave.

##### AUTH-CTX-023

Consolidará:

- razones de aplicación;
- razones de permiso;
- razones de catálogo;
- denegación por defecto;
- decisión final.

##### AUTH-CTX-024

Registrará:

- aplicación;
- permiso relativo;
- clave completa;
- versión y hash;
- consumidor;
- operación;
- resultado.

##### AUTH-CTX-025

Diseñará `get_access_context`; no recibirá permisos como fuente de identidad
laboral.

##### AUTH-CTX-026

Diseñará el contrato canónico de `evaluate_authorization`, incluyendo:

- request;
- errores de entrada;
- validación de catálogo;
- evaluación unitaria;
- posibles lotes;
- atomicidad;
- respuesta.

##### AUTH-CTX-027

Definirá mapas centralizados de rutas, acciones, RPC y permisos, evitando que
cada aplicación invente claves.

##### AUTH-CTX-028

Diseñará adaptadores temporales para:

- aliases;
- claves legacy;
- permisos retirados todavía consumidos;
- consumidores que envían clave completa en un solo campo;
- funciones actuales separadas.

##### AUTH-CTX-029

Definirá caché e invalidación por cambios de aplicación, permiso, catálogo y
versión.

##### AUTH-CTX-030

Definirá pruebas contractuales de sintaxis, identidad, alias, retiro,
versionado y fail closed.

##### AUTH-DB-006

Incorporará la decisión canónica en RPC sensibles.

##### AUTH-DB-009

Implementará validación del permiso exacto en RPC sensibles.

##### AUTH-DB-010

Impedirá que un principal o actor incompatible ejecute la capacidad.

##### AUTH-DB-020

Implementará compatibilidad temporal con claves legacy después de aprobar
AUTH-CTX-028.

##### AUTH-DB-027

Probará integridad de catálogo, RPC, RLS y migraciones.

##### AUTH-DB-030

Retirará consumidores y objetos legacy después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 52. Fuera del alcance

AUTH-CTX-016 no:

- agrega aplicaciones;
- activa o desactiva aplicaciones;
- agrega permisos;
- renombra permisos;
- modifica el catálogo;
- modifica la versión;
- modifica el hash;
- crea aliases;
- decide mappings legacy;
- define modalidad;
- define turno o check-in;
- define área requerida;
- define compatibilidad de dispositivo;
- define sensibilidad;
- define reautenticación;
- resuelve recursos;
- consulta matrices;
- consulta grants;
- consulta denegaciones;
- decide carriles;
- produce decisión final completa;
- crea tipos físicos;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 51.

---

#### 53. Riesgos controlados

##### Riesgo 1 — El cliente escoge un permiso más débil

Control:

```text
la operación de servidor es propietaria del permiso
```

##### Riesgo 2 — `app.access` funciona como wildcard

Control:

```text
app.access
≠
capacidades internas
```

##### Riesgo 3 — Código relativo se busca sin aplicación

Control:

```text
identidad = app_code + permission_code
```

##### Riesgo 4 — Alias amplía autoridad

Control:

```text
evaluador directo exige clave canónica
```

##### Riesgo 5 — Clave one-to-many se traduce arbitrariamente

Control:

```text
descomposición obligatoria
```

##### Riesgo 6 — Ruta técnica se convierte en capacidad

Control:

```text
catálogo canónico de capacidades empresariales
```

##### Riesgo 7 — Catálogo incompatible se usa parcialmente

Control:

```text
versión + schema + integridad
→ fail closed
```

##### Riesgo 8 — Aplicación válida se confunde con acceso autorizado

Control:

```text
identidad canónica
≠
ALLOW
```

---

#### 54. Criterios de aprobación

AUTH-CTX-016 podrá aprobarse cuando se acepte que:

1. `AuthorizationDecision@1.0.0` conserva `app_code`;
2. conserva `permission_code`;
3. no se agrega `permission_key` como campo;
4. la clave completa se deriva;
5. existen diez aplicaciones canónicas;
6. `aura` permanece laboral diferida;
7. `pass` permanece en el dominio cliente adyacente;
8. la existencia de una app no concede acceso;
9. `app_code` debe ser exacto;
10. no se normaliza silenciosamente;
11. una aplicación desconocida produce `DENY`;
12. una aplicación inactiva produce `DENY`;
13. `permission_code` es relativo;
14. no incluye el prefijo de aplicación;
15. solo admite `access` o tres segmentos;
16. no admite wildcards;
17. no admite rutas ni parámetros;
18. la identidad completa usa ambos campos;
19. códigos relativos repetidos entre apps son válidos;
20. el catálogo de referencia es `vento.authorization@1.0.0`;
21. el schema es `1.0.0`;
22. la huella queda fijada;
23. el catálogo contiene 140 permisos activos;
24. una clave inexistente produce `DENY`;
25. una clave inactiva produce `DENY`;
26. una clave retirada produce `DENY`;
27. un alias no se evalúa directamente;
28. AUTH-CTX-028 diseñará adaptadores;
29. un alias one-to-many no se traduce automáticamente;
30. aplicación y permiso deben coincidir;
31. el cliente no elige la protección de una mutación;
32. la operación de servidor declara la capacidad;
33. una consulta previa no autoriza la ejecución;
34. cada decisión evalúa una sola capacidad;
35. una API por lotes conserva decisiones independientes;
36. `app.access` no concede las capacidades internas;
37. una acción específica no sintetiza automáticamente `app.access`;
38. el método HTTP no determina la capacidad;
39. una ruta no es un permiso;
40. el alcance no se infiere desde el código;
41. el estado del recurso no se convierte en permiso;
42. la modalidad se reserva para AUTH-CTX-017;
43. los prerrequisitos se reservan para AUTH-CTX-017;
44. el recurso se reserva para AUTH-CTX-018;
45. la compatibilidad del dispositivo no altera identidad canónica;
46. una aplicación abierta no concede autoridad;
47. simulación exige claves canónicas;
48. un proceso técnico también declara permiso empresarial;
49. credencial técnica no es permiso;
50. errores de forma no ejecutan la operación;
51. razones de resolución van a `blocked_reasons`;
52. no se agregan a `AccessContext.structural_issues`;
53. catálogo inválido produce fail closed;
54. versión no disponible produce fail closed;
55. una identidad válida solo permite continuar;
56. no produce `ALLOW`;
57. la resolución es determinista;
58. AUTH-CTX-017 a AUTH-CTX-024 completarán la decisión;
59. AUTH-CTX-026 diseñará el evaluador;
60. AUTH-CTX-027 eliminará mapas locales inconsistentes;
61. AUTH-CTX-028 gobernará aliases y legado;
62. AUTH-CTX-029 gobernará caché;
63. AUTH-CTX-030 gobernará pruebas;
64. AUTH-DB-006, AUTH-DB-009, AUTH-DB-010, AUTH-DB-020,
    AUTH-DB-027, AUTH-DB-030 y AUTH-DB-031 tienen destinos físicos exactos;
65. no se implementa código, migraciones ni cambios en Supabase.

---

#### 55. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-015 | APROBADA    | Tarea anterior            |
| AUTH-CTX-016 | APROBADA    | Tarea actual              |
| AUTH-CTX-017 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-015 — APROBADA
        ↓
AUTH-CTX-016 — APROBADA
        ↓
AUTH-CTX-017 — NO INICIADA
```

No se avanza a AUTH-CTX-017 hasta recibir aprobación explícita de
AUTH-CTX-016.


