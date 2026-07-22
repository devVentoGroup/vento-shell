## DECISIÓN DE AUTORIZACIÓN

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

### ✅ AUTH-CTX-017 — Incluir `authorization_requirement`

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** AUTHORIZATION DECISION  
**Naturaleza:** Definición documental del requisito contractual de autorización del permiso solicitado  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-016 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-018 — Incluir recurso y territorio resueltos  
**Contrato afectado:** `AuthorizationDecision@1.0.0`  
**Campo principal afectado:** `authorization_requirement`  
**Fuente normativa:** `PermissionContractSnapshot` del permiso canónico solicitado  
**Catálogo de referencia:** `vento.authorization@1.0.0`  
**Permisos activos sujetos a clasificación:** 140  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AuthorizationDecision` incorpora y consume el
`authorization_requirement` del permiso canónico solicitado.

El campo determina exclusivamente:

```text
qué carril
o qué combinación de carriles
puede producir autorización
para la capacidad exacta solicitada
```

No determina por sí solo:

- quién posee un grant;
- cuál es el alcance del grant;
- si existe turno;
- si existe check-in;
- si existe área;
- si el dispositivo es compatible;
- si se requiere reautenticación fuerte;
- si el recurso está dentro del alcance;
- si existe una denegación;
- si la decisión final será `ALLOW`.

No modifica el catálogo, no cambia modalidades, no agrega campos al contrato,
no implementa SQL, RPC, RLS, migraciones, evaluadores, guards ni cambios
físicos en Supabase.

---

#### 1. Objetivo

Definir `authorization_requirement` de manera que Vento OS pueda responder
inequívocamente:

1. cuál de las cuatro modalidades contractuales posee el permiso;
2. qué carril o carriles son aplicables;
3. si los carriles actúan como alternativa o como conjunción;
4. qué carril debe quedar `NOT_APPLICABLE`;
5. cómo se deriva `is_operational`;
6. cómo se relaciona la modalidad con `N`, `T` y `T+C`;
7. cómo se relaciona con el requisito de área operativa;
8. cómo se relaciona con dispositivos compartidos;
9. cómo se relaciona con sensibilidad y reautenticación;
10. cómo se relaciona con simulación;
11. cómo se relaciona con el contrato de recurso;
12. cómo se relaciona con dependencias de permisos;
13. cómo se tratan modalidades ausentes o inválidas;
14. cómo se tratan contradicciones entre propiedades;
15. cómo se tratan grants ubicados en un carril incompatible;
16. cómo se tratan aliases y claves legacy;
17. cómo se aplican denegaciones en cada modalidad;
18. cómo se evita que una aplicación, matriz, rol o ruta reinterprete el
    permiso;
19. cómo se preservan versión, huella, determinismo y auditoría;
20. qué tareas posteriores completan la decisión.

---

#### 2. Base normativa

AUTH-CTX-017 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-CAT-006 — Definir `authorization_requirement` de cada permiso;
- AUTH-CAT-007 — Derivar clasificación operativa;
- AUTH-CAT-008 a AUTH-CAT-010 — Lectura, configuración y sensibilidad;
- AUTH-CAT-011 — Alcance permitido;
- AUTH-CAT-012 — Prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Requisito de área operativa;
- AUTH-CAT-014 — Compatibilidad con dispositivo compartido;
- AUTH-CAT-015 — Compatibilidad con simulación;
- AUTH-CAT-016 — Contratos de recurso;
- AUTH-CAT-017 — Dependencias entre permisos;
- AUTH-CAT-018 — Tipos TypeScript derivados;
- AUTH-CAT-019 — Prohibición de cadenas manuales;
- AUTH-CAT-020 a AUTH-CAT-024 — Brechas, descomposición, diff y publicación;
- AUTH-RBAC-001 a AUTH-RBAC-028 — Matrices, excepciones, dispositivos y
  datasets;
- AUTH-CTX-001 a AUTH-CTX-004 — Contratos y versionado;
- AUTH-CTX-005 a AUTH-CTX-015 — `AccessContext`;
- AUTH-CTX-016 — Aplicación y permiso solicitado.

Principios obligatorios:

```text
AUTHORIZATION_REQUIREMENT
→ SE OBTIENE DEL CATÁLOGO
```

```text
MATRIZ
→ ASIGNA UNA CAPACIDAD COMPATIBLE
→ NO DEFINE SU MODALIDAD
```

```text
CONTEXTO
→ DETERMINA SI EL CARRIL PUEDE UTILIZARSE
→ NO CAMBIA LA MODALIDAD
```

```text
MODALIDAD
≠
ALCANCE
≠
PRERREQUISITO
≠
SENSIBILIDAD
≠
COMPATIBILIDAD DE DISPOSITIVO
```

---

#### 3. Ubicación contractual y fuente única

La forma detallada aprobada de `AuthorizationDecision@1.0.0` contiene:

```ts
permission_contract: PermissionContractSnapshot;
```

Dentro de ese snapshot existe:

```ts
authorization_requirement:
  | "BASE_ONLY"
  | "OPERATIONAL_ONLY"
  | "BASE_OR_OPERATIONAL"
  | "BASE_AND_OPERATIONAL";
```

La representación resumida del roadmap puede mostrar:

```ts
authorization_requirement: AuthorizationRequirement;
```

Ambas representaciones refieren al mismo dato.

Queda prohibido mantener dos fuentes editables:

```text
AuthorizationDecision.authorization_requirement
≠
permission_contract.authorization_requirement
```

Regla canónica:

```text
authorization_requirement de la decisión
=
permission_contract.authorization_requirement
=
valor publicado del permiso canónico
```

---

#### 4. Enum cerrado

Los únicos valores admitidos son:

```ts
type AuthorizationRequirement =
  | "BASE_ONLY"
  | "OPERATIONAL_ONLY"
  | "BASE_OR_OPERATIONAL"
  | "BASE_AND_OPERATIONAL";
```

No existen:

- `AUTO`;
- `DEFAULT`;
- `BOTH`;
- `ANY`;
- `ADMIN`;
- `OPERATIONAL`;
- `GLOBAL`;
- `INHERITED`;
- `null` permisivo;
- valores personalizados por aplicación.

Un valor ausente o desconocido produce fail closed.

---

#### 5. Pregunta exclusiva que responde

`authorization_requirement` responde:

```text
¿qué carril o combinación de carriles
puede autorizar esta capacidad?
```

No responde:

```text
¿qué rol posee el permiso?
¿qué sede o área cubre?
¿el recurso coincide?
¿existe una denegación?
¿el permiso es sensible?
¿el permiso es de lectura?
¿el permiso exige check-in?
¿el dispositivo lo admite?
```

Esas dimensiones permanecen independientes.

---

#### 6. Matriz canónica de carriles

| Modalidad              | Carril base             | Carril operativo        | Regla de combinación |
| ---------------------- | ----------------------- | ----------------------- | -------------------- |
| `BASE_ONLY`            | Aplicable y obligatorio | `NOT_APPLICABLE`        | Solo base            |
| `OPERATIONAL_ONLY`     | `NOT_APPLICABLE`        | Aplicable y obligatorio | Solo operativo       |
| `BASE_OR_OPERATIONAL`  | Aplicable               | Aplicable               | Al menos uno         |
| `BASE_AND_OPERATIONAL` | Aplicable y obligatorio | Aplicable y obligatorio | Ambos                |

La modalidad no indica todavía si cada carril resultará `ALLOW` o `DENY`.

---

#### 7. `BASE_ONLY`

Significa:

```text
solo el carril base
puede producir autorización
```

Reglas:

1. el carril base deberá evaluarse;
2. el carril operativo será `NOT_APPLICABLE`;
3. no se exige turno;
4. no se exige check-in;
5. no se exige área operativa;
6. un rol operativo no puede autorizar;
7. un grant operativo almacenado para ese permiso es incompatible;
8. la ausencia de contexto operativo no bloquea;
9. una denegación base aplicable produce `DENY`;
10. un actor-wide deny aplicable produce `DENY`;
11. sin allow base coincidente se aplica default deny.

No significa:

- todos los roles base;
- acceso global;
- acceso administrativo automático;
- bypass de recurso;
- bypass por propietario.

---

#### 8. `OPERATIONAL_ONLY`

Significa:

```text
solo el carril operativo
puede producir autorización
```

Reglas:

1. el carril base será `NOT_APPLICABLE`;
2. el carril operativo deberá evaluarse;
3. requiere turno publicado y vigente;
4. requiere rol operativo efectivo;
5. requiere sede operativa válida;
6. requiere área cuando el contrato o el rol la exijan;
7. requiere check-in únicamente cuando el prerrequisito sea `T+C`;
8. un grant base almacenado para ese permiso es incompatible;
9. la jerarquía administrativa no sustituye el carril operativo;
10. sin allow operativo coincidente se aplica default deny.

No significa:

- cualquier trabajador con turno;
- cualquier rol operativo;
- cualquier sede;
- cualquier área;
- acceso desde dispositivo por estar configurado.

---

#### 9. `BASE_OR_OPERATIONAL`

Significa:

```text
el carril base
o
el carril operativo
pueden producir una autorización completa
de manera independiente
```

Reglas:

1. ambos carriles son aplicables;
2. cada carril conserva grants, alcance, contexto y denegaciones propios;
3. un `ALLOW` completo en cualquiera puede autorizar;
4. un carril `UNAVAILABLE`, `INVALID` o `DENY` no destruye automáticamente un
   `ALLOW` válido del otro;
5. un actor-wide deny o structural deny transversal sí bloquea ambos;
6. no se mezclan fragmentos incompletos de cada carril;
7. no se suman dos medias autorizaciones;
8. la decisión deberá registrar qué carril o carriles autorizaron.

Ejemplos:

```text
BASE ALLOW
OPERATIONAL DENY
→ ALLOW por BASE
```

```text
BASE DENY
OPERATIONAL ALLOW
→ ALLOW por OPERATIONAL
```

```text
BASE DENY
OPERATIONAL DENY
→ DENY
```

---

#### 10. `BASE_AND_OPERATIONAL`

Significa:

```text
el carril base
y
el carril operativo
deben producir autorización completa
para el mismo actor, permiso, solicitud y recurso
```

Reglas:

1. ambos carriles son obligatorios;
2. ambos deberán quedar `ALLOW`;
3. ambos corresponden al mismo actor efectivo;
4. ambos evalúan la misma clave canónica;
5. ambos evalúan el mismo recurso resuelto;
6. cada carril conserva sus propias fuentes;
7. no se exige que los allows provengan del mismo tipo de sujeto;
8. un allow de rol base y uno individual operativo pueden combinarse;
9. una denegación o ausencia de allow en cualquiera produce `DENY`;
10. un carril `UNAVAILABLE`, `INVALID` o `NOT_APPLICABLE` produce `DENY`.

Ejemplo válido:

```text
rol base
→ allow administrativo

excepción operativa individual
→ allow operativo

mismo actor
+
mismo recurso
+
ambos válidos
→ ALLOW
```

---

#### 11. `required_lanes`

`required_lanes` se deriva exclusivamente de la modalidad.

| Modalidad              | `required_lanes`          |
| ---------------------- | ------------------------- |
| `BASE_ONLY`            | `["BASE"]`                |
| `OPERATIONAL_ONLY`     | `["OPERATIONAL"]`         |
| `BASE_OR_OPERATIONAL`  | `["BASE", "OPERATIONAL"]` |
| `BASE_AND_OPERATIONAL` | `["BASE", "OPERATIONAL"]` |

Para las dos modalidades híbridas, la diferencia no está en la lista, sino
en la regla de combinación.

---

#### 12. `combination`

La combinación se deriva así:

| Modalidad              | Combinación conceptual |
| ---------------------- | ---------------------- |
| `BASE_ONLY`            | `BASE_ONLY`            |
| `OPERATIONAL_ONLY`     | `OPERATIONAL_ONLY`     |
| `BASE_OR_OPERATIONAL`  | `ANY_APPLICABLE_LANE`  |
| `BASE_AND_OPERATIONAL` | `ALL_REQUIRED_LANES`   |

`combination` no es una segunda fuente editable.

Regla:

```text
authorization_requirement
→ required_lanes
→ combination
```

Una contradicción entre estos valores produce:

```text
AUTHORIZATION_REQUIREMENT_DERIVATION_MISMATCH
```

y decisión final `DENY`.

---

#### 13. Derivación de `is_operational`

`is_operational` es una propiedad derivada.

| Modalidad              | `is_operational` |
| ---------------------- | ---------------: |
| `BASE_ONLY`            |          `false` |
| `OPERATIONAL_ONLY`     |           `true` |
| `BASE_OR_OPERATIONAL`  |           `true` |
| `BASE_AND_OPERATIONAL` |           `true` |

No podrá editarse de forma independiente.

Contradicciones como:

```text
BASE_ONLY + is_operational = true
```

o:

```text
OPERATIONAL_ONLY + is_operational = false
```

producen:

```text
OPERATIONAL_CLASSIFICATION_MISMATCH
```

y fail closed.

---

#### 14. Prerrequisito del carril base

La proyección contractual utiliza:

```ts
base_prerequisite: "N" | "NOT_APPLICABLE";
```

Reglas:

| Modalidad              | `base_prerequisite` |
| ---------------------- | ------------------- |
| `BASE_ONLY`            | `N`                 |
| `OPERATIONAL_ONLY`     | `NOT_APPLICABLE`    |
| `BASE_OR_OPERATIONAL`  | `N`                 |
| `BASE_AND_OPERATIONAL` | `N`                 |

`N` significa:

```text
el carril base
no depende de turno ni check-in
```

No significa:

- sin permiso;
- sin recurso;
- sin alcance;
- sin denegaciones;
- sin sensibilidad;
- sin restricciones de dispositivo.

---

#### 15. Prerrequisito del carril operativo

La proyección contractual utiliza:

```ts
operational_prerequisite:
  | "T"
  | "T+C"
  | "NOT_APPLICABLE";
```

Reglas:

1. `BASE_ONLY` exige `NOT_APPLICABLE`;
2. cualquier modalidad con carril operativo exige `T` o `T+C`;
3. `T` exige turno y no exige check-in;
4. `T+C` exige turno y check-in;
5. no existe `C` sin turno;
6. un check-in incompatible bloquea aunque el permiso sea `T`;
7. el valor procede de AUTH-CAT-012;
8. la modalidad no permite inferir `T` o `T+C`.

---

#### 16. Combinaciones inválidas de prerrequisito

Son inválidas:

```text
BASE_ONLY + operational_prerequisite = T
BASE_ONLY + operational_prerequisite = T+C
```

```text
OPERATIONAL_ONLY + operational_prerequisite = NOT_APPLICABLE
```

```text
BASE_OR_OPERATIONAL + operational_prerequisite = NOT_APPLICABLE
```

```text
BASE_AND_OPERATIONAL + operational_prerequisite = NOT_APPLICABLE
```

```text
requires_shift = false
requires_checkin = true
```

Resultado:

```text
WORK_PREREQUISITE_CONTRACT_INVALID
→ structural deny de la decisión
→ DENY
```

---

#### 17. Requisito de área operativa

La clasificación canónica es:

```ts
type OperationalAreaRequirement =
  | "REQUIRED"
  | "SITE_SUFFICIENT"
  | "NOT_APPLICABLE";
```

Reglas:

1. `BASE_ONLY` exige `NOT_APPLICABLE`;
2. las modalidades con carril operativo exigen `REQUIRED` o
   `SITE_SUFFICIENT`;
3. `REQUIRED` exige área activa y compatible;
4. `SITE_SUFFICIENT` permite evaluación a nivel de sede únicamente cuando el
   rol y el recurso también lo permiten;
5. `SITE_SUFFICIENT` no significa todas las áreas;
6. la restricción del rol puede exigir área aunque el permiso sea
   `SITE_SUFFICIENT`;
7. el área procede del turno;
8. el dispositivo y el cliente no crean área.

El booleano legacy o serializado:

```text
requires_active_area
```

deberá derivarse de esta clasificación y no sustituirla.

---

#### 18. Compatibilidad con dispositivo compartido

La clasificación canónica es:

```ts
type SharedDeviceRequirement =
  | "STANDARD_ACTOR_SESSION"
  | "STRONG_REAUTH_REQUIRED"
  | "NOT_ALLOWED";
```

Reglas:

- `STANDARD_ACTOR_SESSION` permite continuar con sesión válida y demás
  restricciones;
- `STRONG_REAUTH_REQUIRED` exige evidencia fuerte adicional;
- `NOT_ALLOWED` exige sesión personal;
- el PIN ligero no satisface reautenticación fuerte;
- el dispositivo solo restringe;
- el dispositivo no cambia la modalidad;
- un valor ausente o desconocido deniega desde dispositivo compartido.

La clasificación se proyecta mediante el campo contractual equivalente a:

```text
device_policy_code
```

No se infiere desde sensibilidad ni desde la aplicación.

---

#### 19. Sensibilidad

La proyección deberá conservar:

```text
is_sensitive
sensitivity_reason_codes
```

o su representación contractual equivalente.

Reglas:

1. sensibilidad no cambia la modalidad;
2. lectura puede ser sensible;
3. mutación puede no ser sensible;
4. un permiso sensible puede existir en cualquier modalidad;
5. sensibilidad puede exigir controles adicionales;
6. los controles no sustituyen grants;
7. los controles no eliminan denegaciones;
8. los controles no convierten un carril inválido en válido;
9. propietario y gerente general no reciben bypass;
10. un permiso sensible debe conservar al menos una razón documental.

Una contradicción entre `is_sensitive` y sus razones produce:

```text
SENSITIVITY_CONTRACT_INVALID
```

---

#### 20. Reautenticación fuerte

La exigencia de reautenticación fuerte puede derivarse de:

- `shared_device_requirement = STRONG_REAUTH_REQUIRED`;
- política sensible específica;
- contrato de la operación;
- política de recurso.

La modalidad no la determina.

Reglas:

```text
BASE_ONLY
```

puede exigir reautenticación fuerte.

```text
OPERATIONAL_ONLY
```

puede no exigirla.

La evidencia se evalúa por solicitud y no se conserva como autoridad
permanente.

---

#### 21. Compatibilidad con simulación

La clasificación canónica es:

```ts
type SimulationRequirement =
  | "FULL_PREVIEW"
  | "DECISION_ONLY"
  | "NOT_ALLOWED";
```

Reglas:

- no cambia la modalidad real;
- no crea grants;
- no crea turno;
- no crea check-in;
- no crea reautenticación fuerte;
- no permite mutaciones reales;
- `NOT_ALLOWED` impide utilizar el permiso como permiso simulado;
- un valor ausente o desconocido deniega la simulación;
- el resultado simulado nunca sustituye la decisión real.

---

#### 22. Contrato de recurso

Todo permiso activo deberá referenciar:

```text
resource_contract_id
```

El contrato define:

- forma de solicitud;
- tipo de recurso;
- territorio;
- lados requeridos;
- propiedad;
- estado;
- campos;
- concurrencia;
- idempotencia;
- reglas de colección, agregado o lote.

La modalidad no sustituye el contrato de recurso.

Un permiso sin contrato requerido produce:

```text
RESOURCE_CONTRACT_MISSING
→ structural deny
→ DENY
```

AUTH-CTX-018 resolverá el recurso concreto.

---

#### 23. Dependencias de permisos

El snapshot puede declarar:

```text
dependency_permission_keys: string[]
```

Reglas:

1. cada dependencia es una clave canónica exacta;
2. no se infiere por prefijo;
3. no se infiere `app.access` automáticamente;
4. no se crea dependencia por pertenecer al mismo módulo;
5. la dependencia conserva su propia modalidad;
6. aprobar una dependencia no autoriza el permiso principal;
7. fallar una dependencia obligatoria produce `DENY`;
8. ciclos o dependencias inexistentes invalidan el contrato;
9. el orden de evaluación debe ser determinista;
10. la decisión principal registra el resultado como prerrequisito.

---

#### 24. Fuente exclusiva del catálogo

`authorization_requirement` se obtiene exclusivamente de la versión publicada
del permiso.

No se obtiene de:

- `role_permissions`;
- `operational_role_permissions`;
- `employee_permissions`;
- nombre del rol;
- aplicación;
- módulo;
- recurso;
- acción;
- ruta;
- pantalla;
- dispositivo;
- turno;
- check-in;
- sede;
- área;
- método HTTP;
- código legacy.

La presencia de un grant en una tabla incompatible no cambia la modalidad.

---

#### 25. Asignaciones incompatibles

##### `BASE_ONLY`

Admite:

- grants base;
- denegaciones base;
- denegaciones transversales.

No admite como allow efectivo:

- grant operativo;
- excepción operativa.

##### `OPERATIONAL_ONLY`

Admite:

- grants operativos;
- denegaciones operativas;
- denegaciones transversales.

No admite como allow efectivo:

- grant base;
- excepción base.

##### `BASE_OR_OPERATIONAL`

Admite grants compatibles en ambos carriles.

##### `BASE_AND_OPERATIONAL`

Requiere grants compatibles en ambos carriles.

Una asignación en carril incompatible:

```text
INCOMPATIBLE_AUTHORIZATION_LANE
```

No funciona como fallback ni compatibilidad automática.

---

#### 26. Modalidad ausente

```text
authorization_requirement = null
```

significa:

```text
contrato incompleto
```

Resultado:

```text
AUTHORIZATION_REQUIREMENT_MISSING
→ structural deny
→ final_decision = DENY
```

No se utilizará como default:

```text
BASE_OR_OPERATIONAL
```

porque sería la opción más permisiva.

---

#### 27. Modalidad desconocida

Un valor distinto del enum produce:

```text
AUTHORIZATION_REQUIREMENT_INVALID
→ structural deny
→ final_decision = DENY
```

No se normaliza, traduce ni aproxima.

---

#### 28. Contradicción entre catálogo y dataset

El permiso publicado, el dataset TypeScript, las matrices y el evaluador
deberán concordar.

Ejemplos:

```text
catálogo = BASE_ONLY
dataset operativo = asignación allow
```

```text
catálogo = OPERATIONAL_ONLY
dataset base = asignación allow
```

```text
catálogo = BASE_AND_OPERATIONAL
evaluador utiliza OR
```

Resultado:

```text
PERMISSION_CONTRACT_INTEGRITY_INVALID
→ structural deny
→ DENY
```

No se elegirá la fuente más permisiva.

---

#### 29. Aliases

Un alias no posee modalidad independiente.

Regla:

```text
alias
→ adaptador aprobado
→ clave canónica
→ modalidad de la clave canónica
```

Queda prohibido:

- asignar modalidad al alias;
- cambiar modalidad mediante alias;
- mantener evaluación doble;
- usar el alias para evitar un carril;
- usar un alias uno-a-muchos como permiso único.

AUTH-CTX-028 diseñará la compatibilidad temporal.

---

#### 30. Claves legacy y retiradas

Una clave legacy no puede introducir una modalidad distinta.

Casos:

- mapping uno-a-uno aprobado: hereda la modalidad canónica;
- mapping uno-a-muchos: requiere descomposición;
- clave retirada: no se evalúa;
- clave técnica: no se asigna;
- clave amplia pendiente: no recibe modalidad permisiva por defecto.

La compatibilidad no se implementa dentro de AUTH-CTX-017.

---

#### 31. Permiso inactivo o inexistente

Si AUTH-CTX-016 determinó:

- aplicación inexistente;
- aplicación inactiva;
- permiso inexistente;
- permiso inactivo;
- permiso retirado;

AUTH-CTX-017 no proyectará una modalidad utilizable.

Resultado:

```text
final_decision = DENY
```

No se consultan matrices ni contexto para compensar una capacidad inválida.

---

#### 32. Relación con `lane_readiness`

`lane_readiness` describe si cada carril está estructuralmente disponible.

`authorization_requirement` describe si el permiso admite ese carril.

Composición:

```text
carril admitido por modalidad
+
carril estructuralmente READY
→ puede evaluarse
```

```text
carril no admitido por modalidad
→ NOT_APPLICABLE
```

```text
carril admitido pero UNAVAILABLE
→ no produce ALLOW
```

```text
carril admitido pero INVALID
→ no produce ALLOW
```

`BASE_OR_OPERATIONAL` puede continuar con el carril alternativo.

`BASE_AND_OPERATIONAL` no puede.

---

#### 33. Problemas de `AccessContext` y problemas de decisión

Los problemas definidos en AUTH-CTX-015 pertenecen a:

```text
AccessContext.structural_issues
```

Las incoherencias del contrato del permiso pertenecen a:

```text
AuthorizationDecision.structural_denies
```

No se modificarán retroactivamente los issues del contexto por una modalidad
inválida.

Códigos iniciales de decisión reservados:

```text
AUTHORIZATION_REQUIREMENT_MISSING
AUTHORIZATION_REQUIREMENT_INVALID
AUTHORIZATION_REQUIREMENT_DERIVATION_MISMATCH
OPERATIONAL_CLASSIFICATION_MISMATCH
WORK_PREREQUISITE_CONTRACT_INVALID
OPERATIONAL_AREA_REQUIREMENT_INVALID
SHARED_DEVICE_REQUIREMENT_INVALID
SENSITIVITY_CONTRACT_INVALID
SIMULATION_REQUIREMENT_INVALID
RESOURCE_CONTRACT_MISSING
PERMISSION_DEPENDENCY_INVALID
INCOMPATIBLE_AUTHORIZATION_LANE
PERMISSION_CONTRACT_INTEGRITY_INVALID
PERMISSION_CONTRACT_VERSION_MISMATCH
```

AUTH-CTX-023 congelará su exposición en `blocked_reasons`.

---

#### 34. Evaluación del carril base

AUTH-CTX-019 deberá:

1. confirmar que la modalidad admite base;
2. marcar `NOT_APPLICABLE` cuando no lo admite;
3. consumir `lane_readiness.base`;
4. validar actor laboral y empleado;
5. validar rol base y cobertura;
6. evaluar denegaciones transversales;
7. evaluar denegaciones base;
8. buscar allows base;
9. comparar alcance y recurso;
10. aplicar sensibilidad, dispositivo y dependencias;
11. producir `ALLOW` o `DENY`.

No tomará prestado contexto operativo.

---

#### 35. Evaluación del carril operativo

AUTH-CTX-020 deberá:

1. confirmar que la modalidad admite operación;
2. marcar `NOT_APPLICABLE` cuando no la admite;
3. consumir `lane_readiness.operational`;
4. exigir turno;
5. exigir check-in cuando sea `T+C`;
6. validar conflictos de check-in aunque sea `T`;
7. validar rol operativo;
8. validar sede;
9. validar área cuando aplique;
10. validar dispositivo;
11. evaluar denegaciones transversales;
12. evaluar denegaciones operativas;
13. buscar allows operativos;
14. comparar recurso y territorio;
15. aplicar sensibilidad y dependencias;
16. producir `ALLOW` o `DENY`.

Un allow operativo no crea ninguno de sus prerrequisitos.

---

#### 36. Denegaciones y precedencia

La modalidad selecciona qué carriles participan.

Después se aplica:

```text
STRUCTURAL DENY
>
ACTOR-WIDE DENY
>
MATCHING LANE DENY
>
MATCHING LANE ALLOW
>
DEFAULT DENY
```

Reglas:

- más allows no superan un deny aplicable;
- `BASE_OR_OPERATIONAL` conserva independencia entre denegaciones limitadas a
  carril;
- una denegación transversal bloquea ambos;
- `BASE_AND_OPERATIONAL` falla cuando cualquier carril falla;
- una denegación no cambia la modalidad.

---

#### 37. Actores no laborales

La modalidad pertenece al permiso, no al actor.

Por tanto, un permiso `BASE_ONLY` continúa siendo `BASE_ONLY` aunque el actor
sea cliente o sistema.

La decisión deberá:

- marcar carriles no aplicables según el tipo de actor y contrato;
- no convertir un cliente en empleado;
- no inventar carril base laboral;
- no inventar carril operativo;
- utilizar contratos de sistema o cliente cuando estén expresamente
  definidos.

La inclusión de `pass` en el catálogo no convierte la sesión normal de cliente
en RBAC laboral.

---

#### 38. Dispositivo compartido

La modalidad no cambia al ejecutarse desde dispositivo.

Ejemplo:

```text
BASE_ONLY
+
shared_device_requirement = STRONG_REAUTH_REQUIRED
```

continúa siendo `BASE_ONLY`.

El dispositivo añade restricciones:

- aplicación permitida;
- paquete permitido;
- actor válido;
- territorio compatible;
- reautenticación;
- exclusiones `NOT_ALLOWED`.

No añade un carril ni un grant.

---

#### 39. Sensibilidad y modalidad

Combinaciones válidas:

```text
BASE_ONLY + sensible
OPERATIONAL_ONLY + sensible
BASE_OR_OPERATIONAL + sensible
BASE_AND_OPERATIONAL + sensible
```

y las mismas modalidades no sensibles.

La sensibilidad:

- no convierte base en operación;
- no convierte operación en base;
- no convierte OR en AND;
- no convierte AND en OR;
- no amplía alcance;
- no elimina un permiso.

---

#### 40. Simulación y modalidad

La simulación utiliza la misma modalidad para calcular la decisión
hipotética.

Reglas:

- `BASE_ONLY` simulado evalúa base hipotética;
- `OPERATIONAL_ONLY` simulado evalúa operación hipotética;
- `BASE_OR_OPERATIONAL` simulado conserva alternativas;
- `BASE_AND_OPERATIONAL` simulado exige ambos;
- `simulation_requirement` puede impedir o limitar la vista;
- ningún resultado simulado es ejecutable.

---

#### 41. Recurso y territorio

La modalidad no indica:

- si el recurso es organizacional;
- si pertenece a una sede;
- si pertenece a un área;
- si tiene origen y destino;
- si es una colección;
- si es una operación masiva;
- si pertenece al actor;
- si está en estado editable.

AUTH-CTX-018 deberá resolver esas dimensiones.

Un carril solo puede autorizar cuando su grant y contexto coinciden con el
recurso resuelto.

---

#### 42. Una decisión por permiso

Cada `AuthorizationDecision` conserva una única modalidad correspondiente a
una única clave canónica.

No se admiten dentro del mismo campo:

- varias modalidades;
- modalidad condicional enviada por cliente;
- modalidad dependiente de ruta;
- modalidad dependiente de rol;
- modalidad dependiente de sede;
- lista de permisos;
- expresión booleana de permisos.

Las operaciones compuestas deberán evaluar cada capacidad o declarar un
contrato compuesto explícito en AUTH-CTX-026.

---

#### 43. Versionado

Cambiar la modalidad de un permiso activo es un cambio contractual.

Ejemplos:

```text
BASE_OR_OPERATIONAL
→ OPERATIONAL_ONLY
```

puede retirar autoridad base.

```text
OPERATIONAL_ONLY
→ BASE_OR_OPERATIONAL
```

puede ampliar autoridad sin turno.

Todo cambio requiere:

1. decisión documental;
2. análisis de impacto;
3. nueva versión del catálogo;
4. diff contractual;
5. revisión de matrices;
6. revisión de denegaciones;
7. revisión de dispositivo;
8. revisión de simulación;
9. migración versionada;
10. pruebas;
11. compatibilidad;
12. actualización documental.

---

#### 44. Snapshot e inmutabilidad

La decisión deberá capturar la modalidad exacta utilizada.

Una decisión histórica no cambia cuando se publica una versión posterior.

Regla:

```text
decisión
→ catálogo_versionado
→ modalidad_inmutable
```

No se volverá a interpretar una decisión histórica con la modalidad actual.

AUTH-CTX-024 conservará versión y hash.

---

#### 45. Catálogo o dataset obsoleto

Si el evaluador detecta que:

- catálogo;
- schema;
- hash;
- tipos generados;
- matrices;
- política de dispositivo;

pertenecen a versiones incompatibles:

```text
PERMISSION_CONTRACT_VERSION_MISMATCH
→ structural deny
→ DENY
```

No se mezclan snapshots de versiones distintas.

AUTH-CTX-029 definirá invalidación.

---

#### 46. Orden de resolución

```text
1. validar aplicación y permiso mediante AUTH-CTX-016
2. cargar PermissionContractSnapshot exacto
3. validar catálogo, versión y hash
4. validar authorization_requirement
5. derivar required_lanes
6. derivar combination
7. validar is_operational
8. validar base_prerequisite
9. validar operational_prerequisite
10. validar operational_area_requirement
11. validar shared_device_requirement
12. validar sensibilidad
13. validar simulation_requirement
14. validar resource_contract_id
15. validar dependencias
16. comprobar integridad del contrato
17. producir authorization_requirement
18. continuar a resolución de recurso
```

No se consultan allows antes de completar este orden.

---

#### 47. Determinismo

Para la misma:

- clave canónica;
- versión de catálogo;
- hash;
- definición de permiso;
- snapshot de configuración;

la proyección deberá ser idéntica.

No dependerá de:

- rol;
- actor;
- aplicación abierta;
- tabla donde existe un grant;
- turno;
- check-in;
- dispositivo;
- recurso;
- ruta;
- cliente;
- orden de filas;
- caché sin versión.

---

#### 48. Casos de ejemplo

##### Caso A — Consulta administrativa pura

```text
permission = viso.workforce.employees.view
authorization_requirement = BASE_ONLY
```

Resultado:

```text
required_lanes = [BASE]
operational_decision = NOT_APPLICABLE
```

Turno y check-in no se exigen por modalidad.

##### Caso B — Preparar una remisión

```text
permission = nexo.inventory.remissions.prepare
authorization_requirement = OPERATIONAL_ONLY
operational_prerequisite = T+C
```

Resultado:

```text
required_lanes = [OPERATIONAL]
turno requerido
check-in requerido
```

Un grant base no autoriza.

##### Caso C — Consultar remisiones

```text
permission = nexo.inventory.remissions.view
authorization_requirement = BASE_OR_OPERATIONAL
```

Resultado:

```text
gerencia puede autorizar por base
trabajador puede autorizar por operación
```

Cada carril conserva alcance y recurso.

##### Caso D — Entrada excepcional

```text
permission = nexo.inventory.entries.override
authorization_requirement = BASE_AND_OPERATIONAL
```

Resultado:

```text
base ALLOW
+
operational ALLOW
=
posible ALLOW final
```

Un solo carril es insuficiente.

##### Caso E — Base válida y operativo inválido en OR

```text
authorization_requirement = BASE_OR_OPERATIONAL
base = ALLOW
operational = INVALID
sin structural deny transversal
```

Resultado:

```text
ALLOW por base
```

##### Caso F — Base válida y operativo inválido en AND

```text
authorization_requirement = BASE_AND_OPERATIONAL
base = ALLOW
operational = INVALID
```

Resultado:

```text
DENY
```

##### Caso G — Modalidad ausente

```text
authorization_requirement = null
```

Resultado:

```text
AUTHORIZATION_REQUIREMENT_MISSING
DENY
```

##### Caso H — Matriz incompatible

```text
permission = OPERATIONAL_ONLY
allow almacenado en role_permissions
```

Resultado:

```text
INCOMPATIBLE_AUTHORIZATION_LANE
el allow no coincide
DENY si no existe allow operativo válido
```

##### Caso I — Permiso `T` sin check-in

```text
modalidad admite operación
operational_prerequisite = T
active_shift válido
active_checkin_session = null
```

Resultado:

```text
la evaluación operativa puede continuar
```

##### Caso J — Permiso `T+C` sin check-in

```text
operational_prerequisite = T+C
active_checkin_session = null
```

Resultado:

```text
prerrequisito FAIL
carril operativo DENY
```

En `BASE_OR_OPERATIONAL`, el base todavía puede autorizar.

##### Caso K — Área `SITE_SUFFICIENT`

```text
operational_area_requirement = SITE_SUFFICIENT
rol site-wide
recurso a nivel sede
```

Resultado:

```text
puede continuar sin área
```

No significa todas las áreas.

##### Caso L — Dispositivo `NOT_ALLOWED`

```text
permission válida
authorization_requirement = BASE_ONLY
shared_device_requirement = NOT_ALLOWED
principal = SHARED_DEVICE
```

Resultado:

```text
device_decision = FAIL
DENY
```

La modalidad base no crea bypass.

##### Caso M — Sensible sin reautenticación

```text
permiso sensible
política exige reautenticación
sin evidencia vigente
```

Resultado:

```text
sensitivity_decision = FAIL
DENY
```

La modalidad permanece sin cambios.

##### Caso N — Alias uno-a-uno

```text
alias legacy
→ adaptador versionado
→ clave canónica
```

Resultado:

```text
usar modalidad de la clave canónica
```

##### Caso O — Alias uno-a-muchos

```text
alias amplio
→ varias capacidades
```

Resultado:

```text
no existe una modalidad única evaluable
requiere descomposición
DENY
```

---

#### 49. Antipatrones prohibidos

```ts
const requirement =
  permission.authorization_requirement ??
  "BASE_OR_OPERATIONAL";

const requirement =
  operationalRolePermissions.has(permissionKey)
    ? "OPERATIONAL_ONLY"
    : "BASE_ONLY";

if (employee.role === "propietario") {
  requirement = "BASE_ONLY";
}

if (activeShift) {
  requirement = "OPERATIONAL_ONLY";
}

if (device.capabilities.includes(permissionKey)) {
  requirement = "BASE_OR_OPERATIONAL";
}
```

También queda prohibido:

```text
grant base → convertir permiso en BASE_ONLY
grant operativo → convertir permiso en OPERATIONAL_ONLY
permiso en ambas matrices → convertir en BASE_OR_OPERATIONAL
permiso sensible → convertir en BASE_AND_OPERATIONAL
falta de turno → degradar a BASE_ONLY
falta de check-in → degradar T+C a T
falta de área → degradar REQUIRED a SITE_SUFFICIENT
dispositivo compartido → cambiar modalidad
propietario → saltar carril operativo
alias → crear modalidad propia
```

---

#### 50. Relación con tareas posteriores

##### AUTH-CTX-018

Resolverá el recurso y territorio exigidos por `resource_contract_id`.

##### AUTH-CTX-019

Evaluará el carril base cuando la modalidad lo admita.

##### AUTH-CTX-020

Evaluará el carril operativo cuando la modalidad lo admita.

##### AUTH-CTX-021

Resolverá allows compatibles con el carril y la modalidad.

##### AUTH-CTX-022

Resolverá denegaciones estructurales, transversales y por carril.

##### AUTH-CTX-023

Aplicará:

- modalidad;
- combinación;
- prerrequisitos;
- dispositivo;
- sensibilidad;
- dependencias;
- razones;
- default deny;
- decisión final.

##### AUTH-CTX-024

Registrará:

- modalidad;
- versión;
- hash;
- carriles requeridos;
- combinación;
- prerrequisitos;
- resultado por carril;
- razones.

##### AUTH-CTX-025

Diseñará `get_access_context`; no decidirá la modalidad del permiso.

##### AUTH-CTX-026

Diseñará `evaluate_authorization` y la proyección canónica del contrato del
permiso.

##### AUTH-CTX-027

Impedirá que aplicaciones, rutas, guards, RPC o componentes reinterpreten la
modalidad.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- permisos legacy;
- aliases;
- asignaciones en carril incompatible;
- campos legacy de contexto;
- consumidores que infieren modalidad;
- funciones actuales separadas.

##### AUTH-CTX-029

Definirá invalidación por cambios del catálogo, modalidad y datasets.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- cuatro modalidades;
- derivaciones;
- `N`, `T`, `T+C`;
- área;
- dispositivo;
- sensibilidad;
- simulación;
- recurso;
- dependencias;
- aliases;
- versiones;
- fail closed.

##### AUTH-DB-006 a AUTH-DB-010

Implementarán consumo del contexto y permiso exactos en RPC sensibles.

##### AUTH-DB-020

Implementará compatibilidad temporal y migración de asignaciones
incompatibles.

##### AUTH-DB-027

Probará integridad del catálogo, matrices, RPC, RLS y migraciones.

##### AUTH-DB-030

Retirará inferencias y contratos legacy después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 51. Fuera del alcance

AUTH-CTX-017 no:

- cambia modalidades;
- agrega modalidades;
- reclasifica permisos;
- modifica 140 permisos;
- modifica matrices;
- crea grants;
- crea denegaciones;
- resuelve recursos;
- decide alcance;
- decide propiedad;
- decide territorio;
- evalúa carril base;
- evalúa carril operativo;
- resuelve allows;
- resuelve denegaciones coincidentes;
- produce decisión final completa;
- implementa reautenticación;
- implementa simulación;
- crea contratos de recurso;
- crea tipos físicos;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 50.

---

#### 52. Riesgos controlados

##### Riesgo 1 — Modalidad derivada de la matriz

Control:

```text
fuente única = catálogo del permiso
```

##### Riesgo 2 — Default permisivo

Control:

```text
modalidad ausente
→ DENY
```

##### Riesgo 3 — Carriles incompletos mezclados

Control:

```text
cada carril produce una decisión completa
```

##### Riesgo 4 — OR tratado como AND o AND tratado como OR

Control:

```text
combination derivada e inmutable
```

##### Riesgo 5 — Check-in exigido a todo permiso operativo

Control:

```text
T y T+C separados
```

##### Riesgo 6 — Área nula interpretada como wildcard

Control:

```text
REQUIRED / SITE_SUFFICIENT / NOT_APPLICABLE
```

##### Riesgo 7 — Dispositivo cambia modalidad

Control:

```text
dispositivo solo restringe
```

##### Riesgo 8 — Modalidad histórica reinterpretada

Control:

```text
snapshot versionado e inmutable
```

---

#### 53. Criterios de aprobación

AUTH-CTX-017 podrá aprobarse cuando se acepte que:

1. `authorization_requirement` conserva la forma contractual aprobada;
2. su fuente única es `PermissionContractSnapshot`;
3. la representación resumida no crea una segunda fuente;
4. solo existen cuatro modalidades;
5. no existe valor nulo permisivo;
6. la modalidad responde únicamente qué carriles pueden autorizar;
7. `BASE_ONLY` evalúa únicamente base;
8. `OPERATIONAL_ONLY` evalúa únicamente operación;
9. `BASE_OR_OPERATIONAL` acepta un carril completo válido;
10. `BASE_AND_OPERATIONAL` exige ambos carriles completos;
11. OR no mezcla medias autorizaciones;
12. AND usa el mismo actor, permiso, solicitud y recurso;
13. `required_lanes` se deriva;
14. `combination` se deriva;
15. `is_operational` se deriva;
16. contradicciones de derivación fallan cerrado;
17. el carril base usa `N`;
18. el carril operativo usa `T` o `T+C`;
19. check-in sin turno es combinación inválida;
20. `BASE_ONLY` no contiene prerrequisito operativo;
21. modalidades operativas no usan prerrequisito `NOT_APPLICABLE`;
22. el requisito de área permanece independiente;
23. solo existen `REQUIRED`, `SITE_SUFFICIENT` y `NOT_APPLICABLE`;
24. `SITE_SUFFICIENT` no significa todas las áreas;
25. la restricción del rol puede exigir área;
26. la compatibilidad con dispositivo permanece independiente;
27. solo existen `STANDARD_ACTOR_SESSION`,
    `STRONG_REAUTH_REQUIRED` y `NOT_ALLOWED`;
28. PIN ligero no satisface reautenticación fuerte;
29. sensibilidad no cambia modalidad;
30. simulación no cambia modalidad;
31. el contrato de recurso es obligatorio cuando corresponde;
32. dependencias usan claves exactas;
33. aprobar una dependencia no autoriza el permiso principal;
34. la matriz no define modalidad;
35. el rol no define modalidad;
36. el turno no define modalidad;
37. el dispositivo no define modalidad;
38. una asignación en carril incompatible no autoriza;
39. modalidad ausente produce structural deny;
40. modalidad desconocida produce structural deny;
41. no existe default `BASE_OR_OPERATIONAL`;
42. aliases heredan la modalidad canónica;
43. aliases one-to-many requieren descomposición;
44. permisos retirados no se evalúan;
45. permisos inactivos no proyectan modalidad utilizable;
46. `lane_readiness` y modalidad permanecen separados;
47. los issues de contexto y de decisión permanecen separados;
48. AUTH-CTX-019 evaluará el carril base;
49. AUTH-CTX-020 evaluará el carril operativo;
50. la precedencia de denegaciones se conserva;
51. un actor no cambia la modalidad;
52. `pass` no convierte clientes en trabajadores;
53. una decisión evalúa una sola capacidad;
54. cambiar modalidad exige nueva versión;
55. la decisión histórica conserva su modalidad;
56. versiones incompatibles fallan cerrado;
57. la proyección es determinista;
58. AUTH-CTX-018 a AUTH-CTX-024 completarán la decisión;
59. AUTH-CTX-026 diseñará el evaluador;
60. AUTH-CTX-027 eliminará inferencias locales;
61. AUTH-CTX-028 gobernará compatibilidad legacy;
62. AUTH-CTX-029 gobernará invalidación;
63. AUTH-CTX-030 gobernará pruebas;
64. las tareas AUTH-DB indicadas tienen destinos físicos explícitos;
65. no se implementa código, migraciones ni cambios en Supabase.

---

#### 54. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-016 | APROBADA    | Tarea anterior            |
| AUTH-CTX-017 | APROBADA    | Tarea actual              |
| AUTH-CTX-018 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-016 — APROBADA
        ↓
AUTH-CTX-017 — APROBADA
        ↓
AUTH-CTX-018 — NO INICIADA
```

No se avanza a AUTH-CTX-018 hasta recibir aprobación explícita de
AUTH-CTX-017.

### ✅ AUTH-CTX-018 — Incluir recurso y territorio resueltos

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** AUTHORIZATION DECISION  
**Naturaleza:** Definición documental de `ResolvedResourceContext` y `ResolvedTerritoryContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-017 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-019 — Incluir decisión del carril base  
**Contrato afectado:** `AuthorizationDecision@1.0.0`  
**Campo principal afectado:** `resource`  
**Tipos principales afectados:** `ResolvedResourceContext`, `ResolvedTerritoryContext`  
**Fuente normativa:** `resource_contract_id` del permiso canónico solicitado  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AuthorizationDecision` resuelve el recurso empresarial
exacto sobre el cual se intenta ejecutar una capacidad y cómo deriva su
territorio real, estado, propiedad, sujeto, lados obligatorios, campos
protegidos y condiciones de concurrencia.

La regla central es:

```text
EL CONTEXTO DEL ACTOR
LIMITA
EL RECURSO REAL

EL CONTEXTO DEL ACTOR
NO CREA
NI REEMPLAZA
EL RECURSO O SU TERRITORIO
```

La tarea impide autorizar únicamente contra:

- un `site_id` enviado por el cliente;
- un `area_id` enviado por el cliente;
- la sede seleccionada;
- la sede primaria;
- la sede del turno;
- el área del turno;
- la sede del dispositivo;
- el último recurso consultado;
- una ruta;
- un nombre humano;
- un payload no normalizado.

No modifica contratos de recursos aprobados, no crea fuentes físicas, no
implementa resolvers, SQL, RPC, RLS, migraciones, transacciones, locks,
consultas, filtros ni cambios en Supabase.

---

#### 1. Objetivo

Definir el campo `resource` de manera que Vento OS pueda responder
inequívocamente:

1. cuál tipo de recurso exige el permiso;
2. qué forma de solicitud fue recibida;
3. si se trata de un recurso existente, borrador, colección, agregado,
   operación masiva o capacidad sin recurso;
4. cuál contrato de recurso gobierna la resolución;
5. qué identificadores empresariales exactos fueron resueltos;
6. qué versión o snapshot del recurso fue evaluado;
7. cuál es el sujeto empresarial objetivo;
8. quién es propietario, custodio, responsable o tercero relacionado;
9. cuál es la organización y unidad de negocio;
10. qué sedes y áreas pertenecen realmente al recurso;
11. cuáles son los tipos de área;
12. si existen origen y destino;
13. si participan rutas o vehículos;
14. si el recurso pertenece a un entorno aislado;
15. qué lados del recurso son obligatorios;
16. qué estado empresarial fue observado;
17. qué campos fueron solicitados y cómo se clasifican;
18. qué control de concurrencia o idempotencia aplica;
19. cuándo la resolución puede continuar;
20. cuándo debe fallar cerrado;
21. cómo se evalúan lecturas, creaciones, transiciones, agregados y lotes;
22. cómo se evita que un contexto válido autorice un recurso distinto;
23. cómo se preservan determinismo, inmutabilidad y auditoría;
24. qué tareas posteriores consumen la resolución.

---

#### 2. Base normativa

AUTH-CTX-018 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-013 a AUTH-MOD-017 — Alcances globales, por sede, tipo de sede,
  área y tipo de área;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-011 — Alcance permitido de cada permiso;
- AUTH-CAT-016 — Contratos de recurso;
- AUTH-CAT-017 — Dependencias de permisos;
- AUTH-CAT-018 — Tipos derivados;
- AUTH-CAT-024 — Publicación contractual;
- AUTH-RBAC-001 a AUTH-RBAC-028 — Matrices, excepciones y restricciones;
- AUTH-CTX-001 — `AccessContext`;
- AUTH-CTX-002 — Diseño de `AuthorizationDecision`;
- AUTH-CTX-004 — Versionado contractual;
- AUTH-CTX-009 — Cobertura administrativa;
- AUTH-CTX-013 — Sede y área operativas;
- AUTH-CTX-014 — Dispositivo compartido;
- AUTH-CTX-015 — Razones estructuradas;
- AUTH-CTX-016 — Aplicación y permiso solicitado;
- AUTH-CTX-017 — `authorization_requirement`.

Principios obligatorios:

```text
PERMISO EXACTO
+
RECURSO EXACTO
+
CONTEXTO EXACTO
=
UNIDAD DE EVALUACIÓN
```

```text
PERMISO SOBRE UN TIPO DE RECURSO
≠
AUTORIZACIÓN SOBRE TODOS LOS RECURSOS DE ESE TIPO
```

```text
TERRITORIO DEL ACTOR
≠
TERRITORIO DEL RECURSO
```

```text
PAYLOAD DEL CLIENTE
≠
RECURSO AUTORITATIVO
```

```text
NULL
≠
GLOBAL
```

```text
LISTA VACÍA
≠
TODOS
```

```text
RECURSO NO RESUELTO
→
DENY
```

---

#### 3. Forma contractual principal conservada

```ts
type ResolvedResourceContext = {
  resource_type: string;
  request_shape:
    | "EXISTING"
    | "DRAFT"
    | "COLLECTION"
    | "AGGREGATE"
    | "BULK"
    | "NON_RESOURCE";

  resolution_status:
    | "RESOLVED"
    | "MULTI_RESOLVED"
    | "NOT_APPLICABLE"
    | "UNRESOLVED"
    | "CONFLICT"
    | "ISOLATED";

  resource_ids: string[];
  resource_version: string | null;

  subject: ResolvedSubjectContext | null;
  territory: ResolvedTerritoryContext;
  ownership: OwnershipContext;
  required_sides: ResolvedSideContext[];

  state_snapshot: Record<string, unknown>;
  field_classification: Record<string, string>;
  concurrency: ConcurrencyContext | null;
};
```

La forma no cambia.

AUTH-CTX-018 define la semántica y las invariantes de cada campo.

---

#### 4. Forma territorial conservada

```ts
type ResolvedTerritoryContext = {
  organization_id: string | null;
  business_unit_ids: string[];
  site_ids: string[];
  area_ids: string[];
  area_kinds: string[];
  origin: TerritorySide | null;
  destination: TerritorySide | null;
  route_ids: string[];
  vehicle_ids: string[];
  isolated_environment: boolean;
  source: string;
  coherent: boolean;
};
```

Reglas contractuales heredadas:

- `null` no significa organización completa;
- una lista vacía no significa todos;
- cada área debe pertenecer a una sede correspondiente;
- origen y destino se evalúan cuando el contrato los exige;
- el alcance global continúa limitado al recurso exacto;
- global no atraviesa entornos aislados;
- un filtro del cliente puede reducir, nunca ampliar;
- la sede seleccionada no sustituye territorio;
- la sede primaria no sustituye territorio;
- el dispositivo solo restringe.

---

#### 5. Formas subordinadas clarificadas

Las formas subordinadas deberán preservar, como mínimo, la siguiente
semántica documental.

```ts
type ResolvedSubjectContext = {
  subject_type: string;
  subject_id: string;
  relationship_to_actor:
    | "SELF"
    | "OWNED"
    | "ASSIGNED"
    | "RELATED"
    | "THIRD_PARTY"
    | "SYSTEM";
  coherent: boolean;
};
```

```ts
type OwnershipContext = {
  owner_type:
    | "ACTOR"
    | "EMPLOYEE"
    | "CUSTOMER"
    | "ORGANIZATION"
    | "SITE"
    | "AREA"
    | "OTHER"
    | "NONE"
    | "UNKNOWN";

  owner_id: string | null;

  actor_relation:
    | "SELF"
    | "OWNED"
    | "ASSIGNED"
    | "RELATED"
    | "THIRD_PARTY"
    | "NOT_APPLICABLE"
    | "UNRESOLVED";

  coherent: boolean;
};
```

```ts
type TerritorySide = {
  site_id: string | null;
  area_id: string | null;
  area_kind: string | null;
  route_id: string | null;
  vehicle_id: string | null;
  coherent: boolean;
};
```

```ts
type ResolvedSideContext = {
  side_code: string;
  required: boolean;
  resource_type: string;
  resource_ids: string[];
  territory: TerritorySide | null;
  resolution_status:
    | "RESOLVED"
    | "MULTI_RESOLVED"
    | "NOT_APPLICABLE"
    | "UNRESOLVED"
    | "CONFLICT"
    | "ISOLATED";
};
```

```ts
type ConcurrencyContext = {
  policy:
    | "NONE"
    | "EXPECTED_VERSION"
    | "UPDATED_AT"
    | "LOCK"
    | "SNAPSHOT"
    | "IDEMPOTENCY_KEY";

  expected_version: string | null;
  idempotency_key: string | null;
  validated: boolean;
};
```

Estas formas subordinadas no agregan campos a `ResolvedResourceContext`.

AUTH-CTX-026 deberá convertirlas en tipos físicos y schema compatibles.

AUTH-CTX-030 deberá probar sus invariantes.

---

#### 6. Fuente exclusiva: contrato de recurso

Toda resolución comienza en:

```text
permission_contract.resource_contract_id
```

El contrato de recurso deberá declarar, como mínimo:

- tipo de recurso esperado;
- forma o formas de solicitud admitidas;
- localizadores permitidos;
- fuente de verdad;
- relaciones necesarias;
- territorio requerido;
- sujeto requerido;
- propiedad requerida;
- lados obligatorios;
- estado relevante;
- campos protegidos;
- política de concurrencia;
- política de idempotencia;
- comportamiento de colección, agregado y lote;
- tratamiento de creación;
- tratamiento de entornos aislados.

No podrá inferirse el contrato desde:

- nombre del permiso;
- tabla consultada;
- aplicación;
- ruta;
- método HTTP;
- rol;
- contexto del actor;
- payload;
- primer recurso encontrado.

---

#### 7. Contrato ausente o incompatible

Si el permiso requiere recurso y:

```text
resource_contract_id = null
```

o el contrato no existe:

```text
resolution_status = UNRESOLVED
final_decision = DENY
```

Razón reservada:

```text
RESOURCE_CONTRACT_NOT_FOUND
```

Si la versión del contrato no es compatible:

```text
RESOURCE_CONTRACT_VERSION_MISMATCH
```

No se utilizará un contrato anterior, “latest” ni un contrato parecido.

---

#### 8. Resolución exclusiva en servidor

El cliente podrá aportar únicamente:

- localizadores;
- filtros permitidos;
- campos solicitados;
- borrador;
- intención de transición;
- clave de idempotencia;
- versión esperada;
- datos empresariales del comando.

El servidor deberá resolver:

- existencia;
- tipo;
- relaciones;
- sede;
- área;
- origen;
- destino;
- propietario;
- sujeto;
- estado;
- versión;
- campos;
- lados;
- entorno;
- coherencia.

No se aceptará como hecho autoritativo:

- `site_id`;
- `area_id`;
- `owner_id`;
- `created_by`;
- `employee_id`;
- `status`;
- `route_id`;
- `vehicle_id`;
- `business_unit_id`;
- `isolated_environment`;
- `resource_version`;

cuando procedan exclusivamente del cliente.

---

#### 9. `resource_type`

`resource_type` será el identificador canónico del tipo empresarial evaluado.

Ejemplos conceptuales:

```text
inventory_remission
inventory_movement
purchase_order
purchase_reception
production_batch
cash_session
sale_order
payment_transaction
employee
shift
permission_assignment
application_access
```

Reglas:

- no es el nombre de una tabla;
- no es una ruta;
- no es una clase de frontend;
- no es una aplicación;
- no es un nombre humano;
- no contiene un identificador concreto;
- debe coincidir con `resource_contract_id`;
- debe coincidir con la operación exigida por el permiso.

Una discrepancia produce:

```text
RESOURCE_TYPE_MISMATCH
→ resolution_status = CONFLICT
→ DENY
```

---

#### 10. Formas de solicitud

##### 10.1 `EXISTING`

Representa uno o varios recursos ya persistidos que deben resolverse desde su
fuente de verdad.

No basta con recibir su identificador.

##### 10.2 `DRAFT`

Representa un recurso normalizado antes de persistir.

Puede no tener `resource_id`.

Debe resolver sus relaciones y territorio propuestos.

##### 10.3 `COLLECTION`

Representa una colección delimitada y construida en servidor.

No representa “toda la tabla”.

##### 10.4 `AGGREGATE`

Representa un resultado derivado de varios miembros autorizables.

No puede revelar miembros excluidos mediante totales o conteos.

##### 10.5 `BULK`

Representa una mutación o transición sobre varios recursos exactos.

Requiere contrato masivo explícito o descomposición por miembro.

##### 10.6 `NON_RESOURCE`

Representa una capacidad cuyo contrato declara legítimamente que no existe un
recurso empresarial variable, por ejemplo un acceso de aplicación.

No se utiliza como fallback ante una resolución fallida.

---

#### 11. Coherencia entre permiso y `request_shape`

El contrato deberá declarar qué formas admite.

Ejemplos:

```text
permiso de creación
→ DRAFT
```

```text
permiso de actualización
→ EXISTING
```

```text
permiso de exportación agregada
→ AGGREGATE
```

```text
permiso masivo explícito
→ BULK
```

Una forma no admitida produce:

```text
RESOURCE_REQUEST_SHAPE_INVALID
→ resolution_status = CONFLICT
→ DENY
```

---

#### 12. Estados de resolución

##### 12.1 `RESOLVED`

Existe un recurso lógico exacto y coherente.

Puede aplicarse a:

- `EXISTING`;
- `DRAFT`;
- `NON_RESOURCE`, únicamente mediante `NOT_APPLICABLE`, no `RESOLVED`.

Para `RESOLVED`, normalmente existe un solo recurso lógico.

##### 12.2 `MULTI_RESOLVED`

Existe un conjunto exacto, finito, coherente y determinado en servidor.

Puede aplicarse a:

- `COLLECTION`;
- `AGGREGATE`;
- `BULK`;
- una relación compuesta aprobada.

##### 12.3 `NOT_APPLICABLE`

El contrato declara expresamente que la capacidad no requiere un recurso
variable.

No significa resolución omitida.

##### 12.4 `UNRESOLVED`

Falta información autoritativa necesaria.

##### 12.5 `CONFLICT`

Existen hechos contradictorios o incompatibles.

##### 12.6 `ISOLATED`

El recurso pertenece a un entorno aislado que no está cubierto por la
autorización organizacional ordinaria.

---

#### 13. Estados que permiten continuar

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
→ la evaluación puede continuar
```

Siempre que las demás invariantes sean válidas.

```text
UNRESOLVED
CONFLICT
ISOLATED
→ structural deny
→ final_decision = DENY
```

No se permite:

- ignorar el recurso;
- usar el contexto como reemplazo;
- degradar a `NON_RESOURCE`;
- utilizar sede primaria;
- elegir el primer candidato;
- retirar lados obligatorios.

---

#### 14. `resource_ids`

Reglas por forma:

| Forma          | Regla                                                |
| -------------- | ---------------------------------------------------- |
| `EXISTING`     | Uno o más identificadores exactos, según el contrato |
| `DRAFT`        | Puede estar vacío antes de persistir                 |
| `COLLECTION`   | Identificadores exactos del conjunto materializado   |
| `AGGREGATE`    | Identificadores de los miembros o entradas evaluadas |
| `BULK`         | Todos los recursos objetivo exactos                  |
| `NON_RESOURCE` | Vacío                                                |

Reglas generales:

- sin duplicados;
- orden determinista;
- sin wildcards;
- sin nombres humanos;
- sin IDs aportados pero no resueltos;
- una lista vacía no significa todos;
- un ID adicional exige reevaluar.

Para colecciones paginadas, cada decisión se aplica al conjunto exacto de la
página o lote resuelto, salvo que el contrato establezca un snapshot cerrado
de toda la consulta.

---

#### 15. `resource_version`

Representa la versión autoritativa del snapshot evaluado.

Puede corresponder a:

- contador de versión;
- `updated_at` normalizado;
- ETag;
- identificador de snapshot;
- versión de agregado;
- hash de borrador.

Reglas:

- `DRAFT` puede utilizar una versión o hash normalizado;
- `NON_RESOURCE` utiliza `null`;
- una mutación protegida no podrá omitirla cuando el contrato exige
  concurrencia;
- un cambio posterior vuelve obsoleta la decisión;
- no se acepta una versión declarada únicamente por el cliente.

Una versión obligatoria no resoluble produce:

```text
RESOURCE_VERSION_UNAVAILABLE
→ DENY
```

---

#### 16. Recurso existente

Para `EXISTING`:

```text
localizador del cliente
→ consulta autoritativa
→ recurso exacto
→ relaciones exactas
→ snapshot exacto
```

Casos:

```text
0 coincidencias
→ RESOURCE_NOT_FOUND
→ UNRESOLVED
```

```text
1 coincidencia
→ RESOLVED
```

```text
2 o más coincidencias cuando se esperaba una
→ RESOURCE_AMBIGUOUS
→ CONFLICT
```

No se revelará al cliente si el recurso existe cuando esa información sea
sensible.

---

#### 17. Recurso de creación

Un `DRAFT` se evalúa antes de escribir.

Flujo:

```text
payload no confiable
→ validación sintáctica
→ normalización
→ resolución de padres y relaciones
→ derivación territorial
→ derivación de sujeto y propiedad
→ validación de estado inicial
→ validación de campos
→ autorización
→ escritura
```

Reglas:

- el cliente no se autoasigna autoridad mediante IDs;
- una relación padre determina territorio cuando el contrato así lo declare;
- el estado inicial procede del contrato;
- los campos del sistema no se aceptan como ordinarios;
- la escritura debe usar el mismo borrador normalizado autorizado.

---

#### 18. Creación y territorio propuesto

Un borrador puede proponer:

- sede;
- área;
- origen;
- destino;
- propietario;
- sujeto.

Esos valores solo participan después de resolver:

- existencia;
- relación;
- compatibilidad;
- pertenencia;
- vigencia;
- fuente.

Ejemplo:

```text
payload.destination_site_id = VENTO_CAFE
```

no significa:

```text
destination = VENTO_CAFE autorizado
```

El servidor deberá confirmar la sede y el contrato deberá exigir autoridad
sobre ese lado.

---

#### 19. Colecciones

Una colección se construye en servidor desde un predicado autorizado.

Reglas:

1. el servidor limita el conjunto antes de devolverlo;
2. el frontend no recibe un conjunto amplio para filtrarlo;
3. cada miembro debe pertenecer al territorio autorizado;
4. el filtro solicitado solo puede reducir;
5. la ordenación no modifica alcance;
6. la paginación no amplía alcance;
7. un miembro fuera de alcance no se incluye;
8. una colección de mutación requiere decisiones por miembro o contrato
   masivo.

Razón reservada ante conjunto no delimitable:

```text
RESOURCE_COLLECTION_SCOPE_INVALID
```

---

#### 20. Agregados

Un agregado puede incluir:

- conteos;
- sumas;
- indicadores;
- reportes;
- diferencias;
- agrupaciones;
- tendencias.

Reglas:

1. todos los miembros contribuyentes deben estar dentro del alcance;
2. no se incluirán miembros ocultos;
3. no se revelará información excluida mediante inferencia;
4. un resultado agrupado conserva su territorio;
5. un agregado transversal requiere alcance explícito;
6. un `0` o mensaje de error no deberá confirmar la existencia de recursos
   ocultos.

Razón reservada:

```text
RESOURCE_AGGREGATE_SCOPE_INVALID
```

---

#### 21. Operaciones masivas

Un permiso ordinario sobre un recurso no autoriza una operación masiva.

Una operación `BULK` deberá:

- usar una capacidad masiva explícita; o
- descomponerse en decisiones individuales.

La política deberá ser una de:

```text
ALL_OR_NOTHING
PARTIAL_WITH_RESULTS
```

No se elegirá silenciosamente.

##### `ALL_OR_NOTHING`

Un solo miembro denegado bloquea toda la operación.

##### `PARTIAL_WITH_RESULTS`

Cada miembro obtiene decisión propia y resultado seguro.

La operación no podrá presentar el éxito parcial como éxito total.

Razón reservada cuando falta contrato masivo:

```text
RESOURCE_BULK_CONTRACT_REQUIRED
```

---

#### 22. `NON_RESOURCE`

Solo se utiliza cuando:

```text
resource_contract
→ declara NON_RESOURCE
```

Forma mínima:

```text
request_shape = NON_RESOURCE
resolution_status = NOT_APPLICABLE
resource_ids = []
resource_version = null
subject = null
required_sides = []
state_snapshot = {}
field_classification = {}
concurrency = null
```

El territorio deberá ser coherente con el contrato y no inventará una sede.

Un permiso de aplicación como `<app>.access` puede usar esta forma si su
contrato lo declara.

---

#### 23. Recurso organizacional no territorial

Un recurso organizacional no territorial no es `NON_RESOURCE`.

Ejemplos conceptuales:

- catálogo corporativo;
- configuración organizacional;
- política;
- plantilla global;
- reporte corporativo.

Debe producir:

```text
resolution_status = RESOLVED
organization_id = organización exacta
site_ids = []
area_ids = []
```

Las listas vacías significan que la dimensión no aplica, no que cubre todas
las sedes.

---

#### 24. `subject`

`subject` representa la entidad empresarial sobre la cual recae la operación
cuando es distinta o adicional al recurso principal.

Ejemplos:

- empleado objetivo;
- cliente;
- proveedor;
- usuario invitado;
- dispositivo;
- solicitante;
- responsable;
- beneficiario.

Reglas:

- sujeto no significa propietario;
- sujeto no significa actor;
- sujeto no significa recurso principal;
- el cliente no declara la relación autoritativamente;
- la relación con el actor procede del contrato;
- `SELF` exige coincidencia exacta;
- `THIRD_PARTY` exige autoridad explícita;
- una relación incoherente produce `RESOURCE_SUBJECT_CONFLICT`.

---

#### 25. Propiedad y relación con el actor

`ownership` responde:

```text
¿quién controla o posee el recurso
y qué relación tiene el actor con esa propiedad?
```

No deberá inferirse universalmente desde:

- `created_by`;
- `updated_by`;
- `requested_by`;
- último custodio;
- usuario autenticado;
- empleado asignado.

Cada contrato declara qué campo o relación significa:

- propiedad;
- creación;
- asignación;
- custodia;
- responsabilidad;
- pertenencia;
- tercero.

---

#### 26. Alcance `OWN`

`OWN` solo coincide cuando:

1. `ownership.coherent = true`;
2. la relación aceptada por el contrato coincide;
3. el actor exacto es el sujeto permitido;
4. el recurso y territorio permanecen dentro de cualquier límite adicional.

Regla:

```text
OWN
puede reducir territorio
pero nunca ampliarlo
```

Ejemplo:

```text
recurso propio
+
sede fuera del alcance territorial
→ no autorizado
```

Una propiedad no resoluble produce:

```text
RESOURCE_OWNERSHIP_UNRESOLVED
→ DENY cuando OWN es necesario
```

---

#### 27. Estado del recurso

`state_snapshot` contiene únicamente hechos necesarios para autorización.

Ejemplos:

- estado actual;
- estado propuesto;
- transición;
- fecha efectiva;
- cierre;
- cancelación;
- recepción;
- propiedad;
- clasificación;
- condición editable;
- bloqueo;
- aprobación.

Reglas:

- no contiene la fila completa;
- no contiene campos ajenos a la decisión;
- los campos se permiten por contrato;
- el orden es determinista;
- los timestamps se normalizan;
- una transición se evalúa contra el estado actual real;
- el payload no reemplaza el estado actual.

---

#### 28. Transiciones

Una transición deberá declarar:

```text
estado actual
+
transición solicitada
+
estado resultante permitido
```

Ejemplo:

```text
remisión requested
→ iniciar producción
```

No se autoriza únicamente porque el actor tenga la capacidad.

Si el estado actual cambió:

```text
RESOURCE_STATE_INVALID
→ DENY
→ reevaluar
```

Una capacidad de transición no autoriza otras transiciones del mismo recurso.

---

#### 29. Campos solicitados

`AuthorizationRequestContext.requested_fields` reduce o precisa la evaluación.

Reglas:

- lista vacía usa la proyección mínima del contrato;
- no concede campos adicionales;
- no se aceptan wildcards;
- no se aceptan rutas de objeto no definidas;
- un campo solicitado debe existir en la clasificación;
- el servidor puede retirar campos no autorizados en lecturas;
- una mutación con campos bloqueados debe denegarse o dividirse
  explícitamente.

---

#### 30. Clasificación de campos

`field_classification` utiliza inicialmente los siguientes códigos:

```text
PUBLIC
INTERNAL
SENSITIVE
RESTRICTED
IMMUTABLE
SYSTEM_MANAGED
```

Semántica:

| Código           | Regla                                                        |
| ---------------- | ------------------------------------------------------------ |
| `PUBLIC`         | Puede exponerse únicamente cuando el recurso está autorizado |
| `INTERNAL`       | Requiere permiso y proyección interna compatible             |
| `SENSITIVE`      | Exige política sensible y minimización                       |
| `RESTRICTED`     | Exige capacidad o control específico                         |
| `IMMUTABLE`      | No puede modificarse mediante la operación                   |
| `SYSTEM_MANAGED` | Solo puede ser escrito por procesos canónicos autorizados    |

Un valor desconocido produce:

```text
RESOURCE_FIELD_CLASSIFICATION_INVALID
→ DENY
```

AUTH-CTX-023 consolidará la decisión de campos.

---

#### 31. Concurrencia

La decisión y la ejecución deben protegerse contra cambios entre:

```text
leer
→ autorizar
→ escribir
```

Políticas:

##### `NONE`

Solo para operaciones donde el contrato declara que no existe riesgo de
concurrencia relevante.

##### `EXPECTED_VERSION`

Exige coincidencia con una versión explícita.

##### `UPDATED_AT`

Exige coincidencia con timestamp autoritativo.

##### `LOCK`

Exige lock dentro de la transacción.

##### `SNAPSHOT`

Exige un snapshot transaccional coherente.

##### `IDEMPOTENCY_KEY`

Exige una clave estable para evitar efectos duplicados.

---

#### 32. Resultado de concurrencia

Para una operación protegida:

```text
concurrency.validated = true
```

es obligatorio antes de ejecutar.

Una decisión previa no reserva el recurso.

Un conflicto produce:

```text
RESOURCE_CONCURRENCY_CONFLICT
→ DENY para la ejecución actual
→ nueva resolución
```

La acción no podrá reutilizar una decisión antigua.

---

#### 33. Idempotencia

La idempotencia:

- evita duplicados;
- no concede permiso;
- no amplía alcance;
- no sustituye actor;
- no sustituye recurso;
- no convierte un request fallido en autorizado.

El mismo `idempotency_key` con payload empresarial diferente produce
conflicto.

Las creaciones y transiciones con efectos no repetibles deberán declarar su
política mediante el contrato.

---

#### 34. Forma territorial: `organization_id`

`organization_id` identifica la organización propietaria del recurso.

Reglas:

- puede ser `null` únicamente cuando el contrato lo permita;
- `null` no significa Vento Group;
- no se obtiene por default global;
- no se obtiene del actor;
- un recurso de otra organización produce conflicto;
- futuras organizaciones o tenants permanecen separados.

Para recursos empresariales ordinarios de Vento:

```text
organization_id
→ organización canónica propietaria
```

---

#### 35. `business_unit_ids`

Representa unidades de negocio exactas relacionadas con el recurso.

No se inferirá desde:

- nombre de sede;
- aplicación;
- prefijo de código;
- repositorio;
- ruta.

Reglas:

- lista única;
- orden determinista;
- vacía cuando no aplica;
- vacía no significa todas;
- una unidad desconocida produce conflicto;
- una relación multinegocio requiere contrato explícito.

---

#### 36. `site_ids`

Representa todas las sedes reales obligatorias del recurso.

Ejemplos:

- sede propietaria;
- sede de almacenamiento;
- sede de venta;
- sede de recepción;
- sedes de origen y destino.

Reglas:

- se derivan de relaciones canónicas;
- sin duplicados;
- sedes activas cuando el contrato lo exige;
- una lista vacía no significa todas;
- el cliente no crea sedes;
- la sede del actor no se copia al recurso;
- una sede seleccionada no se copia al recurso.

---

#### 37. `area_ids`

Representa todas las áreas reales obligatorias del recurso.

Reglas:

- cada área pertenece a una sede incluida;
- el área procede de una relación canónica;
- no se deriva del nombre;
- no se deriva de `area_kind`;
- no se deriva del turno;
- no se deriva del dispositivo;
- una lista vacía no significa todas;
- una incompatibilidad produce `RESOURCE_TERRITORY_CONFLICT`.

---

#### 38. `area_kinds`

`area_kinds` se deriva de las áreas resueltas.

Regla:

```text
area_id
→ catálogo de áreas
→ area_kind
```

No se utilizará un `area_kind` enviado por cliente para reemplazar un área
concreta.

Una lista puede contener tipos repetidos conceptualmente, pero la
serialización los deduplicará.

---

#### 39. Origen y destino

`origin` y `destination` se utilizan cuando el contrato declara una operación
multilateral.

Ejemplos:

- remisión;
- traslado;
- transferencia;
- movimiento;
- despacho;
- ruta;
- devolución;
- recepción.

Cada lado puede contener:

- sede;
- área;
- ruta;
- vehículo.

Reglas:

- origen y destino se resuelven por separado;
- un lado no autoriza el otro;
- el actor puede tener autoridad distinta en cada lado;
- una denegación aplicable a cualquier lado obligatorio bloquea la operación;
- no se intercambian silenciosamente;
- no se completa un lado desde el contexto del actor.

---

#### 40. Lados obligatorios

`required_sides` expresa qué lados debe evaluar el permiso.

Ejemplos de códigos:

```text
RESOURCE
ORIGIN
DESTINATION
SOURCE
TARGET
PARENT
CHILD
SUBJECT
OWNER
CUSTODIAN
VEHICLE
ROUTE
```

Reglas:

1. cada código procede del contrato;
2. un lado obligatorio debe resolverse;
3. un lado opcional no se convierte en obligatorio por el cliente;
4. un lado obligatorio no puede eliminarse del request;
5. el mismo lado no se duplica;
6. el orden es determinista;
7. un lado no resuelto produce `RESOURCE_REQUIRED_SIDE_UNRESOLVED`;
8. un lado en conflicto produce `RESOURCE_REQUIRED_SIDE_CONFLICT`;
9. un lado aislado produce `ISOLATED`;
10. una mutación multilateral exige autorización sobre todos los lados
    declarados obligatorios, salvo contrato explícito diferente.

---

#### 41. Remisiones

Una remisión puede involucrar:

```text
origen
destino
solicitante
productor
transportador
receptor
estado
productos
```

La resolución mínima territorial deberá distinguir:

```text
origin.site_id
destination.site_id
```

y las áreas cuando sean relevantes.

Regla predeterminada:

```text
DENY APLICABLE EN CUALQUIER LADO OBLIGATORIO
→ DENY DE LA OPERACIÓN COMPLETA
```

Las excepciones de lectura o visibilidad parcial deberán estar declaradas en
el contrato específico del permiso.

---

#### 42. Movimientos de inventario

Un movimiento puede involucrar:

- sede;
- área;
- ubicación de origen;
- ubicación de destino;
- LPN;
- producto;
- custodio;
- tipo de movimiento;
- estado;
- cantidad.

El territorio no se reduce al `site_id` del movimiento.

La fuente y destino internos deberán resolverse cuando el permiso los
requiera.

Autorizar una ubicación no autoriza todas las ubicaciones de la sede.

---

#### 43. Compras y recepciones

Una orden de compra y una recepción pueden tener territorios distintos:

- unidad de negocio compradora;
- sede solicitante;
- sede receptora;
- ubicación de recepción;
- proveedor;
- centro de costo.

El contrato del permiso determinará qué relaciones son obligatorias.

Un proveedor no se modelará como sede.

Un centro de costo no se modelará automáticamente como área.

---

#### 44. Producción

Un recurso productivo puede involucrar:

- sede productora;
- área productora;
- receta;
- lote;
- orden;
- solicitud de origen;
- inventario consumido;
- inventario resultante.

La autorización de la orden no autoriza automáticamente:

- editar receta;
- ajustar inventario;
- cerrar lote;
- aprobar merma.

Cada capacidad conserva su recurso y contrato exactos.

---

#### 45. Ventas, caja y pagos

Una venta puede involucrar:

- sede comercial;
- área;
- sesión de caja;
- pedido;
- cliente;
- transacciones;
- reembolsos;
- reversos.

La autoridad sobre la venta no autoriza automáticamente:

- recaudar;
- reembolsar;
- reversar;
- cerrar caja;
- editar datos sensibles del cliente.

Cada acción usa permiso, recurso, estado y campos exactos.

---

#### 46. Trabajadores, turnos y autorización

Un recurso de VISO puede tener como sujeto:

- empleado;
- invitación;
- turno;
- rol;
- permiso;
- excepción;
- dispositivo.

La cobertura administrativa del actor no cambia el sujeto real.

Ejemplo:

```text
actor = gerente
subject = empleado E2
```

La operación no es `OWN` salvo que el contrato lo declare y la relación
coincida.

---

#### 47. Rutas y vehículos

`route_ids` y `vehicle_ids` representan relaciones exactas.

No significan:

- sedes;
- áreas;
- permisos;
- territorios globales.

Un vehículo puede estar:

- asignado a una sede;
- asociado a una ruta;
- en tránsito;
- custodiado por un actor.

La relación válida deberá proceder de fuente canónica.

Un conductor con turno no obtiene autoridad sobre todos los vehículos.

---

#### 48. Entornos aislados

Entornos aislados incluyen, cuando existan:

- APP-REVIEW;
- demo;
- pruebas;
- sandbox;
- datos de certificación;
- organizaciones o tenants segregados.

Reglas:

```text
isolated_environment = true
```

cuando el recurso pertenece a uno de estos entornos.

El alcance:

- organizacional;
- global;
- por tipo de sede;
- por tipo de área;

no los incluye automáticamente.

Sin contrato y autorización aislada explícita:

```text
resolution_status = ISOLATED
→ DENY
```

---

#### 49. Fuente territorial

`territory.source` utilizará inicialmente uno de estos valores:

```text
RESOURCE_DIRECT
RESOURCE_PARENT_CHAIN
DRAFT_RELATIONSHIP
COLLECTION_MEMBERS
AGGREGATE_INPUTS
BULK_MEMBERS
NON_RESOURCE_CONTRACT
```

Reglas:

- la fuente debe explicar cómo se obtuvo el territorio;
- no concede autoridad;
- no acepta texto libre;
- una fuente desconocida produce conflicto;
- un recurso puede requerir varias relaciones, pero la serialización utiliza
  el código que representa el resolver contractual principal.

AUTH-CTX-026 deberá congelar su enum físico.

---

#### 50. Coherencia territorial

```text
territory.coherent = true
```

requiere:

1. organización compatible;
2. unidades de negocio válidas;
3. sedes válidas;
4. áreas pertenecientes a sus sedes;
5. tipos derivados de las áreas;
6. origen y destino coherentes;
7. rutas y vehículos válidos;
8. ausencia de contradicciones;
9. fuente reconocida;
10. entorno correctamente clasificado.

Una incoherencia produce:

```text
RESOURCE_TERRITORY_CONFLICT
→ resolution_status = CONFLICT
→ DENY
```

---

#### 51. Territorio no resoluble

Cuando el contrato requiere territorio y no puede obtenerse:

```text
RESOURCE_TERRITORY_UNRESOLVED
→ resolution_status = UNRESOLVED
→ DENY
```

No se asumirá:

- recurso organizacional;
- sede del actor;
- sede primaria;
- sede seleccionada;
- sede del dispositivo;
- área del turno;
- ausencia de territorio.

---

#### 52. Comparación con carril base

AUTH-CTX-019 deberá comparar los grants base contra el territorio real.

Ejemplos:

```text
AS
→ resource.site_ids
deben pertenecer a assigned_sites utilizables
```

```text
SS
→ resource.site_ids
deben coincidir con la sede exacta
```

```text
AST
→ sedes del recurso
deben estar asignadas
y tener el tipo exacto
```

```text
AA / SA / AAT / ATW
→ áreas reales del recurso
```

```text
OWN
→ ownership + territorio
```

```text
G
→ organización ordinaria
→ excluye entornos aislados
```

---

#### 53. Comparación con carril operativo

AUTH-CTX-020 deberá comparar el recurso contra:

- `operational_site`;
- `operational_area`;
- rol operativo;
- lados requeridos;
- contrato del permiso.

`CTX` significa:

```text
territorio operativo efectivo
debe coincidir con los lados exigidos del recurso
```

No significa:

- cualquier recurso de la sede;
- recursos de otra área;
- cualquier origen o destino;
- acceso cross-site;
- wildcard territorial.

---

#### 54. Recursos multiterritoriales y carril operativo

Un turno aporta un territorio operativo principal.

Una operación puede exigir varios territorios.

Ejemplo:

```text
turno = CENTRO_PRODUCCION
remisión:
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

El carril operativo no obtiene automáticamente autoridad sobre
`VENTO_CAFE`.

El contrato puede exigir:

- coincidencia con origen;
- coincidencia con destino;
- ambos;
- permiso transversal específico;
- carril base adicional mediante `BASE_AND_OPERATIONAL`.

La regla debe ser explícita.

---

#### 55. Lectura transversal

Una lectura transversal podrá devolver la unión de recursos individualmente
autorizados.

Reglas:

- el servidor construye la unión;
- un recurso denegado no se devuelve;
- la ausencia de resultados no revela recursos ocultos;
- la paginación conserva el filtro;
- el conteo no incluye miembros denegados;
- la lectura no concede una mutación transversal.

---

#### 56. Mutación transversal

Una mutación multiterritorial exige autoridad sobre todos los lados
obligatorios.

Predeterminado:

```text
UN LADO OBLIGATORIO DENEGADO
→ OPERACIÓN COMPLETA DENEGADA
```

Una ejecución parcial exige:

- permiso explícito;
- contrato masivo;
- política `PARTIAL_WITH_RESULTS`;
- resultados por miembro;
- auditoría.

---

#### 57. Dispositivo compartido

El dispositivo puede restringir:

- aplicaciones;
- permisos;
- sede;
- área;
- ruta;
- vehículo;
- recurso.

Regla:

```text
recurso autorizado por actor
∩
recurso admitido por dispositivo
```

El dispositivo no:

- crea recurso;
- crea territorio;
- corrige territorio;
- cambia origen;
- cambia destino;
- convierte entorno aislado en ordinario;
- amplía un carril.

La incompatibilidad se consolidará en AUTH-CTX-023.

---

#### 58. Simulación

La simulación puede utilizar un recurso hipotético normalizado.

No podrá:

- fingir que un recurso inexistente fue resuelto;
- omitir lados obligatorios;
- convertir `ISOLATED` en ordinario;
- saltar conflictos;
- persistir;
- producir decisión ejecutable.

Un borrador simulado conserva el contrato de recurso real.

---

#### 59. Procesos de sistema

Un proceso `SYSTEM` también debe resolver:

- recurso;
- territorio;
- estado;
- lados;
- concurrencia;
- idempotencia.

El uso de `service_role` no permite:

- omitir recurso;
- omitir territorio;
- escribir en cualquier sede;
- ignorar organización;
- ignorar entornos aislados;
- ignorar estado.

Las integraciones deberán utilizar adaptadores y contratos empresariales
canónicos.

---

#### 60. Huella del recurso

AUTH-CTX-024 deberá registrar:

```text
resource_fingerprint
```

derivado de forma determinista de:

- `resource_contract_id`;
- `resource_type`;
- `request_shape`;
- `resolution_status`;
- `resource_ids`;
- `resource_version`;
- sujeto;
- propiedad;
- territorio;
- lados requeridos;
- estado relevante;
- clasificación de campos;
- concurrencia.

No deberá incluir secretos ni datos no necesarios.

---

#### 61. Snapshot e inmutabilidad

Una decisión captura un recurso exacto en un instante.

Cambios que obligan a reevaluar:

- estado;
- versión;
- propietario;
- sujeto;
- sede;
- área;
- origen;
- destino;
- ruta;
- vehículo;
- lados;
- campos solicitados;
- clasificación;
- idempotencia;
- relación padre;
- entorno;
- contrato de recurso.

Una decisión antigua no se actualiza.

---

#### 62. Orden determinista

La serialización deberá:

1. ordenar `resource_ids`;
2. ordenar `business_unit_ids`;
3. ordenar `site_ids`;
4. ordenar `area_ids`;
5. ordenar `area_kinds`;
6. ordenar `route_ids`;
7. ordenar `vehicle_ids`;
8. ordenar `required_sides` por `side_code`;
9. ordenar claves de `state_snapshot`;
10. ordenar claves de `field_classification`;
11. eliminar duplicados exactos;
12. conservar conflictos en lugar de resolverlos arbitrariamente.

---

#### 63. Razones de bloqueo reservadas

```text
RESOURCE_CONTRACT_NOT_FOUND
RESOURCE_CONTRACT_VERSION_MISMATCH
RESOURCE_REQUEST_SHAPE_INVALID
RESOURCE_TYPE_MISMATCH
RESOURCE_NOT_FOUND
RESOURCE_AMBIGUOUS
RESOURCE_RELATIONSHIP_CONFLICT
RESOURCE_SUBJECT_CONFLICT
RESOURCE_TERRITORY_UNRESOLVED
RESOURCE_TERRITORY_CONFLICT
RESOURCE_ISOLATED
RESOURCE_OWNERSHIP_UNRESOLVED
RESOURCE_REQUIRED_SIDE_UNRESOLVED
RESOURCE_REQUIRED_SIDE_CONFLICT
RESOURCE_STATE_INVALID
RESOURCE_FIELD_CLASSIFICATION_INVALID
RESOURCE_CONCURRENCY_CONFLICT
RESOURCE_BULK_CONTRACT_REQUIRED
RESOURCE_AGGREGATE_SCOPE_INVALID
RESOURCE_COLLECTION_SCOPE_INVALID
RESOURCE_VERSION_UNAVAILABLE
```

Estas razones:

- pertenecen a `AuthorizationDecision.structural_denies` o
  `blocked_reasons`;
- no se agregan retroactivamente a `AccessContext.structural_issues`;
- producen `DENY` cuando son bloqueantes;
- serán consolidadas y priorizadas en AUTH-CTX-023;
- serán auditadas mediante AUTH-CTX-024.

---

#### 64. Fail closed

Queda prohibido:

- autorizar sin resolver recurso;
- autorizar solo con `site_id`;
- copiar territorio desde el actor;
- usar sede primaria;
- usar sede seleccionada;
- usar el dispositivo como fuente;
- usar `created_by` universalmente como propietario;
- tratar lista vacía como todos;
- tratar `null` como global;
- omitir origen o destino;
- elegir el primer recurso;
- ignorar duplicados;
- ignorar cambio de versión;
- usar un permiso ordinario como masivo;
- filtrar únicamente en frontend;
- degradar recurso aislado;
- ejecutar con conflicto de concurrencia;
- reutilizar decisión obsoleta.

---

#### 65. Casos de ejemplo

##### Caso A — Recurso existente de una sede

```text
request_shape = EXISTING
resource_id = remisión R1
R1.destination_site_id = VENTO_CAFE
```

Resultado:

```text
resolution_status = RESOLVED
resource_ids = [R1]
territory.site_ids incluye VENTO_CAFE
```

El `site_id` se obtiene de R1, no del request.

##### Caso B — Recurso no encontrado

```text
localizador válido
0 coincidencias
```

Resultado:

```text
resolution_status = UNRESOLVED
RESOURCE_NOT_FOUND
DENY
```

##### Caso C — Creación de remisión

```text
request_shape = DRAFT
origin = CENTRO_PRODUCCION
destination = SAUDO
```

El servidor resuelve ambas sedes y sus relaciones antes de autorizar.

No se confía en los IDs aislados del payload.

##### Caso D — Recurso organizacional

```text
resource_type = authorization_catalog
organization_id = VENTO_GROUP
site_ids = []
area_ids = []
```

Resultado:

```text
RESOLVED
```

No es `NON_RESOURCE`.

##### Caso E — Acceso a aplicación

```text
resource_contract declara NON_RESOURCE
```

Resultado:

```text
request_shape = NON_RESOURCE
resolution_status = NOT_APPLICABLE
resource_ids = []
```

##### Caso F — Propiedad sin territorio

```text
actor creó el recurso
recurso pertenece a sede fuera de alcance
```

Resultado:

```text
OWN coincide
territorio no coincide
DENY
```

##### Caso G — Remisión multisitio

```text
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

Ambos lados se conservan.

Autoridad sobre el origen no autoriza automáticamente el destino.

##### Caso H — Área de otra sede

```text
site_id = SAUDO
area_id pertenece a VENTO_CAFE
```

Resultado:

```text
territory.coherent = false
resolution_status = CONFLICT
RESOURCE_TERRITORY_CONFLICT
```

##### Caso I — Colección filtrada por cliente

```text
cliente solicita site_id = VENTO_CAFE
```

El filtro puede reducir.

El servidor todavía debe limitar el conjunto a lo autorizado.

##### Caso J — Agregado

```text
reporte de ventas por sede
```

Solo contribuyen recursos individualmente autorizados.

Los totales no incluyen sedes excluidas.

##### Caso K — Operación masiva sin permiso masivo

```text
permission = editar un recurso
request_shape = BULK
```

Resultado:

```text
RESOURCE_BULK_CONTRACT_REQUIRED
DENY
```

##### Caso L — Estado cambió

```text
decisión evaluó version = 7
recurso actual = version 8
```

Resultado:

```text
RESOURCE_CONCURRENCY_CONFLICT
DENY
nueva evaluación
```

##### Caso M — Entorno APP-REVIEW

```text
isolated_environment = true
sin autorización aislada explícita
```

Resultado:

```text
resolution_status = ISOLATED
RESOURCE_ISOLATED
DENY
```

##### Caso N — Conductor y vehículo

```text
actor tiene rol conductor_logistica
vehicle_id = V1
```

El rol no demuestra relación con V1.

El vehículo deberá resolverse desde la operación o asignación canónica.

##### Caso O — Área nula

```text
recurso de nivel sede
area_ids = []
```

Puede ser válido cuando el contrato no exige área.

No significa todas las áreas.

---

#### 66. Antipatrones prohibidos

```ts
const siteId =
  request.site_id ??
  accessContext.operational_site?.site_id ??
  employee.site_id;

const areaId =
  request.area_id ??
  accessContext.operational_area?.area_id ??
  null;

const ownsResource =
  resource.created_by === actorId;

if (grant.scope === "global") {
  return true;
}

if (!resource) {
  return authorizeWithoutResource();
}
```

También queda prohibido:

```text
selectedSite → territorio real
selectedArea → territorio real
turno → territorio del recurso
check-in → territorio del recurso
dispositivo → territorio del recurso
resource_ids vacíos → todos
resource_version null → ignorar concurrencia
permiso individual → operación masiva
recurso propio → ignorar sede
global → incluir APP-REVIEW
cliente filtra después → seguridad
```

---

#### 67. Relación con tareas posteriores

##### AUTH-CTX-019

Evaluará el carril base contra:

- territorio;
- sujeto;
- propiedad;
- estado;
- lados;
- campos;
- concurrencia.

##### AUTH-CTX-020

Evaluará el carril operativo contra:

- sede y área operativas;
- rol;
- turno;
- check-in;
- lados del recurso;
- restricciones del dispositivo.

##### AUTH-CTX-021

Registrará únicamente allows cuyo alcance coincida con el recurso resuelto.

##### AUTH-CTX-022

Registrará denegaciones que coincidan con actor, recurso, territorio, lados y
vigencia.

##### AUTH-CTX-023

Consolidará estados, campos, dispositivo, sensibilidad, dependencias,
concurrencia, razones y decisión final.

##### AUTH-CTX-024

Registrará:

- `resource_type`;
- IDs;
- versión;
- huella;
- territorio;
- lados;
- estado;
- política de concurrencia;
- fuentes.

##### AUTH-CTX-025

Diseñará `get_access_context`; no resolverá recursos empresariales de una
acción concreta.

##### AUTH-CTX-026

Diseñará `evaluate_authorization`, resolvers de recursos, tipos físicos,
validación del contrato, frontera transaccional y respuesta.

##### AUTH-CTX-027

Obligará a rutas, acciones, RPC, API y jobs a declarar y resolver el recurso
mediante contratos centralizados.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `site_id` y `area_id` enviados por clientes actuales;
- funciones legacy que reciben territorio aislado;
- recursos sin contrato;
- `created_by` usado como propiedad universal;
- permisos amplios;
- operaciones masivas implícitas;
- consumidores que filtran en frontend;
- estados y relaciones actuales.

##### AUTH-CTX-029

Definirá:

- caché;
- expiración;
- invalidación;
- fingerprints;
- versiones;
- frescura;
- revalidación.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- seis formas de request;
- seis estados de resolución;
- recursos existentes;
- borradores;
- colecciones;
- agregados;
- lotes;
- non-resource;
- propiedad;
- sujeto;
- campos;
- estados;
- concurrencia;
- origen y destino;
- rutas;
- vehículos;
- territorios aislados;
- fail closed.

##### AUTH-DB-006 a AUTH-DB-010

Implementarán evaluación canónica dentro de RPC sensibles.

##### AUTH-DB-011

Aplicará constraints después de inventario, reconciliación y backfill.

##### AUTH-DB-020

Migrará contratos y consumidores legacy con compatibilidad temporal.

##### AUTH-DB-027

Probará integridad, RLS, RPC, recursos, territorios y migraciones.

##### AUTH-DB-030

Retirará parámetros territoriales y rutas legacy después de adopción
comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

##### BLOQUE E1

Deberá confrontar los contratos con recursos y procesos reales mediante:

- `PROC-DISC-001` a `PROC-DISC-008`;
- `CAP-MAP-001` a `CAP-MAP-005`;
- `GAP-CTRL-001` a `GAP-CTRL-006`.

##### BLOQUE E2

Deberá formalizar procesos, pantallas, estados y recursos mediante:

- `PROC-CAN-001` a `PROC-CAN-007`;
- `APP-OWN-001` a `APP-OWN-006`;
- `STATE-MAP-001` a `STATE-MAP-006`.

##### BLOQUE E3

Deberá formalizar fuentes y arquitectura física mediante:

- `DB-DOM-001` a `DB-DOM-005`;
- `DB-SCHEMA-001` a `DB-SCHEMA-007`;
- `DB-CONTRACT-001` a `DB-CONTRACT-006`;
- `DB-INTEGRITY-001` a `DB-INTEGRITY-006`;
- `DB-SEC-001` a `DB-SEC-006`.

##### BLOQUE E5

Deberá convertir cada contrato aprobado en paquetes mediante:

- `PKG-SCOPE-001` a `PKG-SCOPE-006`;
- `PKG-PLAN-001` a `PKG-PLAN-007`;
- `PKG-TEST-001` a `PKG-TEST-006`;
- `PKG-CUTOVER-001` a `PKG-CUTOVER-006`.

##### BLOQUE R

Implementará físicamente los paquetes aprobados mediante las tareas
`AUTH-DB-*` y los paquetes canónicos de implementación resultantes de E5.

---

#### 68. Fuera del alcance

AUTH-CTX-018 no:

- modifica contratos de recurso;
- inventa nuevos recursos;
- reclasifica los 140 permisos;
- modifica matrices;
- crea grants;
- crea denegaciones;
- evalúa el carril base;
- evalúa el carril operativo;
- resuelve allows;
- resuelve denegaciones coincidentes;
- produce decisión final completa;
- diseña pantallas;
- implementa filtros;
- implementa resolvers;
- crea tipos físicos;
- crea JSON Schema;
- crea Zod;
- crea SQL;
- crea RPC;
- crea RLS;
- crea tablas;
- crea migraciones;
- implementa locks;
- implementa idempotencia;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 67.

---

#### 69. Riesgos controlados

##### Riesgo 1 — Contexto usado como territorio del recurso

Control:

```text
recurso resuelto desde su fuente de verdad
```

##### Riesgo 2 — Cliente declara sede o área

Control:

```text
localizador no autoritativo
→ relaciones canónicas
```

##### Riesgo 3 — Recurso propio amplía territorio

Control:

```text
OWN reduce
no amplía
```

##### Riesgo 4 — Recurso multiterritorial se evalúa por un solo lado

Control:

```text
required_sides explícitos
```

##### Riesgo 5 — Colección filtrada únicamente en frontend

Control:

```text
conjunto delimitado en servidor
```

##### Riesgo 6 — Permiso ordinario ejecuta lote

Control:

```text
BULK exige contrato explícito
```

##### Riesgo 7 — Recurso cambia después de autorizar

Control:

```text
versión + concurrencia + revalidación
```

##### Riesgo 8 — Global atraviesa entornos aislados

Control:

```text
isolated_environment
→ autorización específica
```

---

#### 70. Criterios de aprobación

AUTH-CTX-018 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `ResolvedResourceContext`;
2. se conserva la forma de `ResolvedTerritoryContext`;
3. se clarifican los tipos subordinados sin cambiar la raíz;
4. el contrato de recurso es la fuente única;
5. un contrato ausente produce `DENY`;
6. la resolución ocurre exclusivamente en servidor;
7. el cliente solo aporta localizadores y borradores;
8. `resource_type` es empresarial y canónico;
9. no es nombre de tabla ni ruta;
10. existen seis formas de solicitud;
11. la forma debe coincidir con el contrato;
12. `RESOLVED` permite continuar;
13. `MULTI_RESOLVED` permite continuar;
14. `NOT_APPLICABLE` solo es legítimo por contrato;
15. `UNRESOLVED` produce `DENY`;
16. `CONFLICT` produce `DENY`;
17. `ISOLATED` produce `DENY` sin autorización aislada;
18. `resource_ids` son exactos y deterministas;
19. una lista vacía no significa todos;
20. `DRAFT` puede no tener identificador;
21. `resource_version` representa el snapshot evaluado;
22. recursos existentes se consultan en fuente autoritativa;
23. un borrador se normaliza antes de autorizar;
24. el payload no declara territorio autoritativo;
25. colecciones se delimitan en servidor;
26. agregados no revelan miembros excluidos;
27. lotes requieren capacidad o contrato explícitos;
28. `NON_RESOURCE` no es fallback;
29. recursos organizacionales no territoriales continúan siendo recursos;
30. sujeto, actor, propietario y recurso permanecen separados;
31. la propiedad se define por contrato;
32. `created_by` no es regla universal;
33. `OWN` no amplía territorio;
34. `state_snapshot` contiene solo hechos necesarios;
35. el estado actual se resuelve en servidor;
36. una transición incompatible produce `DENY`;
37. `requested_fields` solo reduce o precisa;
38. los campos tienen clasificación cerrada;
39. campos desconocidos fallan cerrado;
40. concurrencia no se omite cuando el contrato la exige;
41. una decisión no reserva el recurso;
42. idempotencia no concede permisos;
43. `organization_id = null` no significa Vento Group;
44. unidades de negocio no se infieren por nombre de sede;
45. sedes del recurso no se copian desde el actor;
46. áreas deben pertenecer a sedes resueltas;
47. `area_kind` se deriva de `area_id`;
48. origen y destino se resuelven por separado;
49. autoridad en un lado no autoriza el otro;
50. lados obligatorios proceden del contrato;
51. un lado obligatorio no puede omitirse;
52. remisiones conservan origen y destino;
53. movimientos conservan relaciones internas necesarias;
54. compras, producción, ventas y VISO conservan sus recursos propios;
55. rutas y vehículos no equivalen a sedes;
56. entornos aislados quedan fuera del alcance ordinario;
57. la fuente territorial usa valores canónicos;
58. territorio incoherente produce `CONFLICT`;
59. territorio no resoluble produce `UNRESOLVED`;
60. AUTH-CTX-019 comparará el carril base con el recurso;
61. AUTH-CTX-020 comparará el carril operativo con el recurso;
62. un turno no autoriza automáticamente todos los lados;
63. una lectura transversal devuelve solo recursos autorizados;
64. una mutación transversal exige todos los lados obligatorios;
65. el dispositivo solo restringe;
66. la simulación no convierte un recurso inválido en válido;
67. procesos de sistema resuelven recurso y territorio;
68. la huella del recurso será determinista;
69. un cambio obliga a reevaluar;
70. el orden de listas y mapas es determinista;
71. las razones de bloqueo quedan reservadas;
72. AUTH-CTX-023 las consolidará;
73. AUTH-CTX-024 las auditará;
74. AUTH-CTX-026 diseñará resolvers y frontera transaccional;
75. AUTH-CTX-027 eliminará resolución local;
76. AUTH-CTX-028 gobernará compatibilidad legacy;
77. AUTH-CTX-029 gobernará frescura;
78. AUTH-CTX-030 gobernará pruebas;
79. los destinos de E1, E2, E3, E5, BLOQUE R y AUTH-DB quedan explícitos;
80. no se implementa código, migraciones ni cambios en Supabase.

---

#### 71. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-017 | APROBADA    | Tarea anterior            |
| AUTH-CTX-018 | APROBADA    | Tarea actual              |
| AUTH-CTX-019 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-017 — APROBADA
        ↓
AUTH-CTX-018 — APROBADA
        ↓
AUTH-CTX-019 — NO INICIADA
```

No se avanza a AUTH-CTX-019 hasta recibir aprobación explícita de
AUTH-CTX-018.

### ✅ AUTH-CTX-019 — Incluir decisión del carril base

| Campo                          | Valor                                                                      |
| ------------------------------ | -------------------------------------------------------------------------- |
| **Estado**                     | APROBADA                                                                   |
| **Bloque**                     | BLOQUE E — Contexto y decisión de autorización unificados                  |
| **Subbloque**                  | `AUTHORIZATION DECISION`                                                   |
| **Naturaleza**                 | Definición documental de `base_decision` dentro de `AuthorizationDecision` |
| **Implementación física**      | No incluida                                                                |
| **Tarea anterior vigente**     | `AUTH-CTX-018` — APROBADA                                                  |
| **Tarea posterior reservada**  | `AUTH-CTX-020` — Incluir decisión del carril operativo                     |
| **Contrato afectado**          | `AuthorizationDecision@1.0.0`                                              |
| **Campo principal afectado**   | `base_decision`                                                            |
| **Tipo principal afectado**    | `LaneDecision`                                                             |
| **Dataset base**               | `vento.authorization.base-role-grants@1.0.0`                               |
| **Dataset de overrides**       | `vento.authorization.individual-overrides@1.0.0`                           |
| **Catálogo**                   | `vento.authorization@1.0.0`                                                |
| **Cambio contractual**         | Aclaración normativa compatible; no cambia la forma publicada              |
| **Cambios físicos permitidos** | No                                                                         |

Esta tarea define cómo Vento OS evalúa el carril base de autorización a partir de:

- actor efectivo;
- identidad laboral;
- estado del empleado;
- rol base vigente;
- cobertura administrativa;
- aplicación y permiso exactos;
- modalidad contractual;
- recurso y territorio resueltos;
- concesiones base de rol;
- concesiones individuales base;
- denegaciones transversales;
- denegaciones del carril base;
- alcance;
- propiedad;
- estado del recurso;
- dispositivo compartido;
- sensibilidad;
- dependencias;
- política de campos;
- `default deny`.

> **Regla central**
>
> ```text
> CARRIL BASE
> =
> AUTORIDAD ADMINISTRATIVA O FUNCIONAL PERMANENTE
> DEL ACTOR LABORAL
> SOBRE EL PERMISO EXACTO
> Y EL RECURSO EXACTO
> ```

El carril base:

- no depende de turno;
- no depende de check-in;
- no toma prestado el rol operativo;
- no toma prestada la sede operativa;
- no toma prestada el área operativa;
- no obtiene bypass por nombre de rol;
- no autoriza por jerarquía implícita;
- no convierte cobertura en permiso;
- no convierte un permiso en cobertura;
- no convierte un dispositivo en fuente de autoridad.

No implementa SQL, RPC, RLS, funciones, migraciones, guards, middlewares, caché ni cambios físicos en Supabase.

#### 1. Objetivo

Definir base_decision de manera que Vento OS pueda responder inequívocamente:

- cuándo el carril base es aplicable
- cuándo debe ser NOT_APPLICABLE
- cuándo está estructuralmente listo
- cuándo debe denegar por indisponibilidad
- cuándo debe denegar por invalidez
- qué fuentes pueden producir un allow base
- qué fuentes pueden producir un deny base
- cómo se consulta la matriz base
- cómo se consumen overrides individuales
- cómo se compara un grant con el recurso
- cómo se evalúa alcance no territorial
- cómo se evalúa alcance organizacional
- cómo se evalúan sedes asignadas
- cómo se evalúa una sede específica
- cómo se evalúan tipos de sede
- cómo se evalúan áreas asignadas
- cómo se evalúa un área específica
- cómo se evalúan tipos de área
- cómo se evalúa OWN
- cómo se evalúan recursos multiterritoriales
- cómo se evalúan colecciones, agregados y lotes
- cómo se preserva la independencia frente al carril operativo
- cómo se aplican actor-wide denies y lane denies
- cómo se aplica default deny
- cómo se serializa LaneDecision
- cómo se ordenan los identificadores coincidentes
- cómo se evita duplicar evidencia
- cómo se evita que un componente base de BASE_AND_OPERATIONAL autorice por sí solo
- cómo se relaciona con restricciones globales
- cómo se preservan determinismo, inmutabilidad y auditoría.

---

#### 2. Base normativa

AUTH-CTX-019 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — Actor efectivo;
- `AUTH-MOD-002` — Separación entre rol base y rol operativo;
- `AUTH-MOD-003` a `AUTH-MOD-006` — Roles administrativos, funcionales e híbridos;
- `AUTH-MOD-007` y `AUTH-MOD-008` — Sede y área;
- `AUTH-MOD-013` a `AUTH-MOD-017` — Alcances;
- `AUTH-MOD-018` — Combinación de carriles;
- `AUTH-MOD-019` — Denegación explícita;
- `AUTH-CAT-006` — Modalidad;
- `AUTH-CAT-011` — Alcance permitido;
- `AUTH-CAT-016` — Contrato de recurso;
- `AUTH-CAT-017` — Dependencias;
- `AUTH-RBAC-001` a `AUTH-RBAC-008` — Matrices base;
- `AUTH-RBAC-020` — Concesiones individuales base;
- `AUTH-RBAC-022` — Denegaciones individuales y transversales;
- `AUTH-RBAC-024` — Dataset canónico de matriz base;
- `AUTH-RBAC-026` — Dataset canónico de overrides;
- `AUTH-RBAC-028` — Independencia de la administración frente al check-in;
- `AUTH-CTX-001` a `AUTH-CTX-015` — `AccessContext`;
- `AUTH-CTX-016` — Aplicación y permiso solicitado;
- `AUTH-CTX-017` — `authorization_requirement`;
- `AUTH-CTX-018` — Recurso y territorio resueltos.

Principios obligatorios:

```text
ROL BASE
≠
PERMISO

COBERTURA ADMINISTRATIVA
≠
ALLOW

PERMISO BASE
≠
BYPASS

SIN TURNO
≠
SIN ADMINISTRACIÓN

CHECK-IN ACTIVO
≠
GANAR ADMINISTRACIÓN

ROL OPERATIVO
≠
HEREDAR MATRIZ BASE

ALLOW BASE APLICABLE
=
PERMISO EXACTO
∩
ACTOR EXACTO
∩
ROL O EXCEPCIÓN COMPATIBLE
∩
VIGENCIA
∩
ALCANCE
∩
RECURSO
∩
AUSENCIA DE DENY APLICABLE
```

---

#### 3. Forma contractual conservada

```ts
type LaneDecision = {
  lane: "BASE" | "OPERATIONAL";

  outcome:
    | "ALLOW"
    | "DENY"
    | "NOT_APPLICABLE";

  readiness:
    | "READY"
    | "UNAVAILABLE"
    | "INVALID"
    | "NOT_APPLICABLE";

  evaluated: boolean;
  matched_allow_ids: string[];
  matched_deny_ids: string[];
  reason_codes: string[];
};
```

Para esta tarea:

```ts
base_decision: LaneDecision;
```

deberá cumplir siempre:

```text
lane = BASE
```

No se agregan campos.

---

#### 4. Aplicabilidad por modalidad

| `authorization_requirement` | Carril base             | Regla                            |
| --------------------------- | ----------------------- | -------------------------------- |
| `BASE_ONLY`                 | Aplicable               | Debe producir `ALLOW` o `DENY`   |
| `OPERATIONAL_ONLY`          | No aplicable            | Produce `NOT_APPLICABLE`         |
| `BASE_OR_OPERATIONAL`       | Aplicable               | Se evalúa de forma independiente |
| `BASE_AND_OPERATIONAL`      | Aplicable y obligatorio | Debe aportar el componente base  |

```text
OPERATIONAL_ONLY
→ base_decision.outcome = NOT_APPLICABLE
```

No se consulta la matriz base para intentar rescatar un permiso `OPERATIONAL_ONLY`.

---

#### 5. Forma de NOT_APPLICABLE

Cuando la modalidad es `OPERATIONAL_ONLY`:

```ts
base_decision = {
  lane: "BASE",
  outcome: "NOT_APPLICABLE",
  readiness: "NOT_APPLICABLE",
  evaluated: false,
  matched_allow_ids: [],
  matched_deny_ids: [],
  reason_codes: ["BASE_LANE_NOT_REQUIRED"]
};
```

Reglas:

- no significa `DENY`;
- no significa error;
- no significa ausencia de rol;
- no consulta allows base;
- no consulta lane denies base;
- los actor-wide denies y structural denies continúan siendo evaluables a nivel global en `AUTH-CTX-022` y `AUTH-CTX-023`;
- un grant base almacenado para un permiso `OPERATIONAL_ONLY` se clasifica como incompatibilidad contractual, no como allow.

---

#### 6. Cuándo evaluated = true

Para las modalidades:

- `BASE_ONLY`;
- `BASE_OR_OPERATIONAL`;
- `BASE_AND_OPERATIONAL`;

se utilizará:

```text
evaluated = true
```

Esto se conserva aunque el carril termine tempranamente en `DENY` por:

- contexto inválido;
- empleado inactivo;
- rol base inválido;
- cobertura inválida;
- recurso no resoluble;
- deny aplicable;
- falta de allow.

```text
evaluated = false
```

se reserva exclusivamente para `NOT_APPLICABLE`.

---

#### 7. readiness

Para modalidades que admiten base:

```text
base_decision.readiness
=
AccessContext.lane_readiness.base.status
```

El evaluador no podrá:

- convertir `INVALID` en `READY`;
- convertir `UNAVAILABLE` en `READY`;
- ocultar un código estructural;
- recalcular parcialmente el contexto;
- reemplazar el rol base;
- completar cobertura.

Si el contexto quedó obsoleto:

```text
readiness = INVALID
outcome = DENY
```

---

#### 8. Relación entre readiness y outcome

| `readiness`      | Resultado máximo posible |
| ---------------- | ------------------------ |
| `READY`          | `ALLOW` o `DENY`         |
| `UNAVAILABLE`    | `DENY`                   |
| `INVALID`        | `DENY`                   |
| `NOT_APPLICABLE` | `NOT_APPLICABLE`         |

`READY` no concede autoridad. Solo habilita la consulta y evaluación de fuentes base compatibles.

---

#### 9. Actor laboral obligatorio

El carril base laboral requiere:

- actor efectivo de tipo `EMPLOYEE`;
- identidad laboral resoluble;
- empleado exacto;
- empleado activo;
- coincidencia entre actor y empleado;
- snapshot vigente.

Para actores de tipo:

- `CUSTOMER`;
- `SYSTEM` autónomo;
- `DEVICE` sin actor humano;
- `UNRESOLVED`;

el carril base será `NOT_APPLICABLE` o `DENY` según el contrato del actor y la modalidad.

No se inventará una identidad laboral para evaluar una matriz base.

---

#### 10. Empleado inactivo

Un empleado inactivo conserva atribución histórica, pero no autoridad.

Resultado:

```text
readiness = UNAVAILABLE
outcome = DENY
reason_codes incluye BASE_EMPLOYEE_INACTIVE
```

No se consultan grants como mecanismo de reactivación.

Una concesión individual activa no reactiva al empleado.

---

#### 11. Rol base vigente

Para evaluar el carril base deberá existir:

```text
base_role != null
base_role.role_status = ACTIVE
```

Reglas:

- el rol debe pertenecer al actor;
- debe existir en el catálogo canónico;
- debe estar activo;
- debe ser único;
- no puede proceder del turno;
- no puede proceder del dispositivo;
- no puede proceder de `navigation_role`;
- no puede proceder de una cadena enviada por cliente.

Un grant individual no repara:

- rol ausente;
- rol ambiguo;
- rol inactivo;
- rol legacy no mapeado;
- actor incompatible.

---

#### 12. Roles canónicos base

El dataset canónico base contiene exactamente siete roles:

| Rol base canónico         |
| ------------------------- |
| `propietario`             |
| `gerente_general`         |
| `gerente`                 |
| `supervisor`              |
| `auxiliar_administrativa` |
| `contador`                |
| `marketing`               |

Los oficios base legacy no participan como fuente canónica del carril base.

Su transición deberá resolverse mediante:

- `AUTH-MOD-021`;
- `AUTH-CTX-028`;
- `AUTH-DB-020`;
- `AUTH-DB-030`.

Hasta entonces, un oficio legacy no se utilizará como bypass.

---

#### 13. Sin bypass por rol

Queda prohibido:

- propietario → ALLOW automático
- gerente_general → ALLOW automático
- gerente → todos los permisos de su sede
- supervisor → todos los permisos operativos

Todo actor requiere:

```text
permiso exacto
+
grant exacto
+
alcance compatible
+
recurso compatible
+
ausencia de deny
```

---

#### 14. Fuentes de allow base

Solo pueden producir candidatos de allow base:

```text
BASE_ROLE
INDIVIDUAL_BASE
```

Fuentes normativas:

- `vento.authorization.base-role-grants@1.0.0`;
- `vento.authorization.individual-overrides@1.0.0`.

No producen allows base:

- matriz operativa;
- rol operativo;
- turno;
- check-in;
- sede operativa;
- área operativa;
- dispositivo;
- `navigation_role`;
- rutas;
- menús;
- frontend;
- service role;
- nombre del cargo.

---

#### 15. Dataset base canónico

La matriz base vigente es:

```text
vento.authorization.base-role-grants@1.0.0
```

| Característica              | Valor |
| --------------------------- | ----: |
| Registros lógicos           |   499 |
| Roles base                  |     7 |
| Concesiones directas        |   463 |
| Componentes base            |    36 |
| Permisos `OPERATIONAL_ONLY` |     0 |
| Claves legacy               |     0 |
| Roles operativos            |     0 |

Reglas adicionales:

- orden determinista;
- ausencia de fila = `default deny`;
- el evaluador consume el snapshot exacto y su hash aprobado;
- el evaluador no reconstruye la matriz desde tablas legacy.

---

#### 16. Grants DIRECT

Un grant base directo puede producir ALLOW completo cuando:

- el permiso admite base
- el rol coincide
- la clave coincide exactamente
- el grant está activo
- el scope coincide
- el recurso coincide
- la vigencia coincide
- no existe deny aplicable
- las restricciones globales no fallan.

---

#### 17. Grants BASE_COMPONENT

Un registro `BASE_COMPONENT` pertenece a un permiso `BASE_AND_OPERATIONAL` y representa únicamente el componente base.

```text
BASE_COMPONENT
→ puede producir base_decision = ALLOW
```

Pero:

```text
BASE_COMPONENT
≠ final_decision = ALLOW
```

La decisión final exige además:

```text
operational_decision = ALLOW
```

`AUTH-CTX-023` aplicará la conjunción.

---

#### 18. Overrides individuales base

Un override individual base podrá:

- conceder una capacidad adicional compatible;
- limitarla mediante alcance;
- tener vigencia;
- referenciar el empleado exacto.

No podrá:

- reparar un actor inválido;
- reparar un rol base inválido;
- convertir un permiso `OPERATIONAL_ONLY`;
- ampliar un permiso más allá de su contrato;
- anular una denegación;
- conceder por wildcard;
- conceder por prefijo;
- conceder a un dispositivo.

El seed canónico inicial contiene cero overrides automáticos.

---

#### 19. Clave exacta

Todo candidato deberá cumplir:

```text
grant.permission_key
=
requested.permission_key
```

No se admite:

- prefijo;
- sufijo;
- wildcard;
- módulo;
- aplicación completa;
- coincidencia semántica;
- alias no adaptado;
- permiso legacy;
- ruta;
- nombre humano.

---

#### 20. Modalidad compatible

Un grant base solo es compatible con:

```text
BASE_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

Un grant base sobre permiso OPERATIONAL_ONLY:

- no se incluye en matched_allow_ids
- no produce allow
- genera incompatibilidad contractual
- se audita
- se corrige en datasets o transición.

---

#### 21. Vigencia

Un grant deberá estar activo en `decided_at`.

La vigencia puede depender de:

- estado activo;
- fecha de inicio;
- fecha de fin;
- revocación;
- versión de dataset;
- estado del rol;
- estado del empleado.

Regla de inicio:

```text
starts_at <= decided_at
```

Cuando exista fin:

```text
decided_at < ends_at
```

Un grant futuro, expirado o revocado no coincide.

---

#### 22. Alcances permitidos

La evaluación base podrá consumir los siguientes códigos:

| Código | Alcance                             |
| ------ | ----------------------------------- |
| `NT`   | No territorial                      |
| `ORG`  | Recurso organizacional exacto       |
| `G`    | Global organizacional ordinario     |
| `AS`   | Sedes asignadas                     |
| `SS`   | Sede específica                     |
| `AST`  | Tipo de sede dentro de asignaciones |
| `TST`  | Todas las sedes de un tipo          |
| `AA`   | Áreas asignadas                     |
| `SA`   | Área específica                     |
| `AAT`  | Tipo de área dentro de asignaciones |
| `ATW`  | Todas las áreas de un tipo          |
| `OWN`  | Propiedad o atribución              |

`CTX` es incompatible con el carril base.

```text
scope_code = CTX
→ incompatibilidad contractual
```

---

#### 23. NT — No territorial

NT coincide únicamente cuando el contrato del permiso y del recurso declara que la capacidad no utiliza una dimensión territorial variable.

Reglas:

- no inventa organización
- no inventa sede
- no inventa área
- no autoriza recursos territoriales
- no convierte listas vacías en global.

---

#### 24. ORG — Recurso organizacional exacto

ORG coincide cuando:

- el recurso pertenece a la organización exacta
- el permiso declara alcance organizacional
- el recurso no requiere una sede o área adicional
- no pertenece a entorno aislado
- la unidad de negocio, canal o dominio requerido coincide.
- ORG no equivale a G.
- No cubre automáticamente todos los recursos territoriales de la organización.

---

#### 25. G — Global organizacional ordinario

`G` permite evaluar recursos ordinarios de la organización cuando el grant lo declara expresamente.

Reglas:

- solo aplica al permiso exacto;
- no concede otros permisos;
- no atraviesa organizaciones;
- no atraviesa tenants futuros;
- no incluye `APP-REVIEW`;
- no incluye demo;
- no incluye sandbox;
- no incluye pruebas;
- no incluye recursos aislados;
- no omite sujeto, propiedad, estado, lados o campos;
- no convierte `propietario` en bypass.

Un rol con `administrative_coverage.mode = NONE` puede utilizar un grant `G` específico cuando el grant exacto lo concede y el recurso es compatible.

La cobertura del actor no se transforma por ello en `ORGANIZATION`.

---

#### 26. AS — Sedes asignadas

AS exige que todos los territorios de sede obligatorios del recurso estén incluidos en las asignaciones utilizables del actor.

Fuente:

AccessContext.assigned_sites

Una sede utilizable exige:

- asignación activa
- sede activa
- assignable = true.

Reglas:

- la sede primaria no es suficiente por sí sola
- la sede seleccionada no participa
- varias sedes no significan global
- un recurso multisitio exige coincidencia en todos los lados obligatorios
- una lista vacía no coincide.

---

#### 27. SS — Sede específica

SS exige coincidencia exacta entre:

- grant.site_id
- y la sede o lado del recurso exigido por el contrato.

Reglas:

- no utiliza la sede seleccionada
- no utiliza la sede del turno
- no utiliza la sede primaria como fallback
- la sede debe existir y estar activa
- la coincidencia con un lado no cubre otro lado obligatorio
- un grant sin site_id es inválido.

---

#### 28. AST — Tipo de sede dentro de asignaciones

AST exige:

- sede del recurso dentro de assigned_sites
- sede activa
- tipo de sede exacto
- tipo declarado en el grant
- ausencia de territorio aislado.

Regla:

```text
AS
∩
site_type exacto
```

No equivale a todas las sedes de ese tipo.

---

#### 29. TST — Todas las sedes de un tipo

TST es transversal y exige una concesión explícita.

Reglas:

- no se infiere desde AST
- no se infiere por tener varias sedes
- no se infiere por rol
- cubre únicamente sedes ordinarias del tipo exacto
- excluye entornos aislados
- conserva límites de organización
- conserva recurso y campos
- una sede de tipo desconocido no coincide.

---

#### 30. AA — Áreas asignadas

`AA` exige que todas las áreas obligatorias del recurso estén incluidas en:

```text
AccessContext.assigned_areas
```

y que:

- la asignación esté activa;
- el área esté activa;
- pertenezca a una sede autorizada;
- el área coincida exactamente.

Una lista vacía no coincide.

`AA` no podrá utilizarse como sustituto del área operativa.

---

#### 31. SA — Área específica

SA exige coincidencia exacta entre:

- grant.area_id
- y el área del recurso.

Además:

- el área debe existir
- debe estar activa
- debe pertenecer a la sede correspondiente
- el grant deberá conservar o derivar la sede necesaria
- no se aceptan áreas de otra sede
- un area_id nulo invalida el grant.

---

#### 32. AAT — Tipo de área dentro de asignaciones

`AAT` exige:

```text
área del recurso
∈
assigned_areas utilizables
```

y:

```text
area_kind del recurso
=
area_kind del grant
```

No cubre todas las áreas del mismo tipo.

---

#### 33. ATW — Todas las áreas de un tipo

`ATW` exige:

- tipo de área exacto;
- límite superior de sedes autorizado;
- organización compatible;
- recurso ordinario;
- concesión transversal explícita.

Nunca existe sin un límite de sede.

`ATW` no atraviesa entornos aislados.

---

#### 34. OWN — Propiedad o atribución

`OWN` coincide cuando:

- el contrato define qué significa propiedad;
- `resource.ownership.coherent = true`;
- la relación con el actor coincide;
- el actor exacto es el permitido;
- el recurso está vigente;
- cualquier límite territorial adicional también coincide.

Regla:

```text
OWN
→ puede reducir el conjunto
→ nunca amplía territorio
```

No se utiliza universalmente la regla:

```text
created_by = actor
```

Cada recurso define su relación canónica.

---

#### 35. Composición de alcance

Un permiso puede requerir más de una condición.

Ejemplo:

```text
OWN
+
AS
```

significa:

```text
recurso propio
Y
recurso dentro de sedes asignadas
```

No significa:

```text
recurso propio
O
recurso dentro de sedes asignadas
```

La semántica `AND` u `OR` deberá proceder del perfil de alcance publicado del permiso.

No se elegirá la combinación más permisiva.

---

#### 36. Cobertura administrativa

administrative_coverage es evidencia contextual, no grant.

Modos:

```text
NONE
ASSIGNED_SITES
SPECIFIC_SITE
ASSIGNED_AREAS
SPECIFIC_AREA
ORGANIZATION
```

Uso:

- AS, AST, AA, AAT consumen asignaciones y cobertura coherente
- SS y SA consumen dimensiones exactas del grant
- G y ORG dependen del grant exacto, no de convertir artificialmente la cobertura
- NONE no bloquea permisos NT, ORG, G u OWN cuando el contrato y grant los permiten
- valid = false bloquea el carril base.

---

#### 37. Recursos sin sede

Un recurso con:

```text
site_ids = []
```

puede ser válido cuando el contrato lo clasifica como:

- no territorial;
- organizacional;
- de dominio;
- propio sin dimensión territorial;
- `NON_RESOURCE`.

No será válido para un grant que exija `AS`, `SS`, `AST` o `TST`.

No se asignará una sede por fallback.

---

#### 38. Recursos sin área

Un recurso con:

```text
area_ids = []
```

puede ser válido a nivel de organización, sede, recurso no territorial o recurso site-wide.

No será válido para un grant que exija `AA`, `SA`, `AAT` o `ATW`.

Una lista vacía no significa todas las áreas.

---

#### 39. Recursos multiterritoriales

Cuando resource.required_sides contiene varios lados, el grant deberá cubrir todos los lados obligatorios según su contrato.

Ejemplo:

```text
remisión
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

Un grant SS para CENTRO_PRODUCCION no cubre automáticamente el destino.

La composición deberá estar declarada por el contrato del permiso y del recurso.

---

#### 40. Colecciones

Para `COLLECTION`:

- cada miembro debe quedar dentro del alcance;
- el conjunto se construye en servidor;
- los IDs se evalúan contra el mismo permiso;
- un miembro no autorizado se excluye en lecturas;
- una colección no puede incluir miembros ocultos y filtrar después;
- el conteo y la paginación conservan el alcance.

La decisión de una colección autorizada no autoriza mutaciones sobre todos sus miembros.

---

#### 41. Agregados

Para AGGREGATE:

- cada dato contribuyente debe estar autorizado
- no se incluyen territorios denegados
- no se revelan datos por inferencia
- el resultado conserva el alcance exacto
- un grant global continúa limitado al permiso de agregado
- un agregado transversal requiere scope explícito.

---

#### 42. Operaciones masivas

Para `BULK`:

```text
permiso ordinario
≠
permiso masivo
```

La evaluación seguirá la política declarada:

| Política               | Regla                                                                            |
| ---------------------- | -------------------------------------------------------------------------------- |
| `ALL_OR_NOTHING`       | Todos los miembros deben producir base allow cuando el carril base sea requerido |
| `PARTIAL_WITH_RESULTS` | Cada miembro obtiene una decisión base independiente                             |

No se resumirá una operación parcialmente denegada como allow total.

---

#### 43. Estado del recurso

Un grant válido no autoriza estados incompatibles.

El carril base deberá consumir:

```text
resource.state_snapshot
```

y verificar el estado actual, la transición solicitada y las condiciones empresariales del permiso.

Si el contrato no admite el estado:

```text
outcome = DENY
reason_codes incluye BASE_RESOURCE_STATE_MISMATCH
```

---

#### 44. Campos protegidos

El allow del carril base no concede automáticamente todos los campos.

La decisión deberá respetar:

```text
resource.field_classification
requested_fields
field_policy_decision
```

Una lectura parcial puede conservar `base_decision.outcome = ALLOW` sobre la proyección autorizada.

Una mutación con un campo bloqueado produce `DENY` o requiere separación explícita.

---

#### 45. Concurrencia

Para una operación que exige concurrencia deberá cumplirse antes de ejecutar:

```text
resource.concurrency.validated = true
```

El carril base puede demostrar autoridad sobre el recurso, pero una concurrencia fallida impide la ejecución.

`AUTH-CTX-023` consolidará el bloqueo final.

---

#### 46. Dispositivo compartido

El dispositivo no produce allow base.

Una acción desde dispositivo exige además:

- dispositivo válido
- sesión de actor válida
- aplicación permitida
- clave incluida
- territorio compatible
- política de actor satisfecha
- reautenticación cuando aplique.

La relación es:

```text
BASE AUTHORITY
∩
DEVICE LIMIT
```

Nunca unión.

---

#### 47. Turno y check-in

El carril base no consulta:

- active_shift
- active_checkin_session
- operational_role
- operational_site
- operational_area.

Reglas:

- sin turno → base puede continuar
- sin check-in → base puede continuar
- fin del turno → no revoca base
- check-in activo → no amplía base

---

#### 48. Carril operativo separado

El carril base no utilizará:

- `operational-role-grants`;
- grants individuales operativos;
- rol del turno;
- scope `CTX`;
- área del turno;
- permisos operativos legacy.

Un actor híbrido puede obtener decisiones independientes en ambos carriles.

---

#### 49. Actor-wide deny

Un actor-wide deny aplicable a la clave exacta bloquea el carril base aunque existan múltiples allows.

Regla:

```text
ACTOR_WIDE_DENY
>
BASE ALLOW
```

AUTH-CTX-022 definirá y poblará la evidencia.

---

#### 50. Base lane deny

Una denegación del carril base bloquea únicamente el base cuando coincide.

En BASE_OR_OPERATIONAL:

```text
base deny
→ base_decision = DENY
→ operativo puede continuar
```

En BASE_AND_OPERATIONAL:

```text
base deny
→ base_decision = DENY
→ final_decision = DENY
```

Una concesión más específica no vence la denegación aplicable.

---

#### 51. Structural deny

Un problema estructural aplicable puede bloquear solo el carril base o ambos carriles.

Ejemplos:

- rol base ambiguo;
- rol base inactivo;
- cobertura administrativa inválida;
- asignaciones contradictorias;
- snapshot obsoleto;
- recurso no resoluble;
- contrato incompatible.

Un structural deny no es una fila administrable de overrides.

---

#### 52. Default deny

Si el carril es aplicable y no existe deny, pero tampoco existe un allow base completo:

```text
outcome = DENY
reason_codes incluye BASE_NO_MATCHING_ALLOW
```

No se materializa una denegación explícita.

No se inventa un grant.

---

#### 53. Varios allows coincidentes

Pueden coincidir varios allows de rol o individuales.

Reglas:

- uno solo completo es suficiente para base_decision = ALLOW
- los grants no se suman para crear un alcance no declarado
- un grant incompleto no completa otro salvo composición explícita
- se registran todos los allows realmente coincidentes
- los IDs se deduplican
- el orden es determinista
- un deny aplicable prevalece.

---

#### 54. matched_allow_ids

Solo incluye grants base que:

- pertenecen al actor o rol exacto;
- usan la clave exacta;
- son compatibles con la modalidad;
- están vigentes;
- coinciden territorialmente;
- coinciden con el recurso;
- cumplen estado y condiciones;
- pueden contribuir al carril.

No incluye candidatos descartados, grants operativos, grants inactivos, fuera de alcance, legacy o incompatibles.

`AUTH-CTX-021` definirá el objeto completo `MatchedGrant`.

---

#### 55. matched_deny_ids

Incluye únicamente IDs de denegaciones administrables que bloquean el carril base:

- actor-wide deny;
- base lane deny.

No incluye:

- structural issues sin `deny_id`;
- default deny;
- falta de allow;
- códigos de razón sin registro administrable.

`AUTH-CTX-022` definirá el objeto completo `MatchedDeny`.

---

#### 56. reason_codes

Códigos iniciales reservados para base_decision:

```text
BASE_LANE_NOT_REQUIRED
BASE_CONTEXT_NOT_APPLICABLE
BASE_CONTEXT_UNAVAILABLE
BASE_CONTEXT_INVALID
BASE_EMPLOYEE_INACTIVE
BASE_ROLE_NOT_AVAILABLE
BASE_ROLE_INVALID
BASE_ADMINISTRATIVE_COVERAGE_INVALID
BASE_RESOURCE_UNRESOLVED
BASE_RESOURCE_CONFLICT
BASE_RESOURCE_ISOLATED
BASE_RESOURCE_STATE_MISMATCH
BASE_SCOPE_NOT_MATCHED
BASE_REQUIRED_SIDE_NOT_COVERED
BASE_OWNERSHIP_NOT_MATCHED
BASE_FIELD_POLICY_FAILED
BASE_CONCURRENCY_FAILED
BASE_ACTOR_WIDE_DENY
BASE_LANE_DENY
BASE_NO_MATCHING_ALLOW
BASE_ALLOW_MATCHED
BASE_COMPONENT_MATCHED
BASE_DATASET_VERSION_MISMATCH
BASE_GRANT_CONFIGURATION_INVALID
BASE_INCOMPATIBLE_GRANT
```

AUTH-CTX-023 decidirá cuáles se exponen al cliente y su prioridad.

---

#### 57. Truth table principal

| Condición                                     | Resultado del carril base                                   |
| --------------------------------------------- | ----------------------------------------------------------- |
| Modalidad `OPERATIONAL_ONLY`                  | `NOT_APPLICABLE`                                            |
| Contexto base `INVALID`                       | `DENY`                                                      |
| Contexto base `UNAVAILABLE`                   | `DENY`                                                      |
| Recurso `UNRESOLVED`, `CONFLICT` o `ISOLATED` | `DENY`                                                      |
| `actor-wide deny` coincidente                 | `DENY`                                                      |
| `base lane deny` coincidente                  | `DENY`                                                      |
| Sin allow base completo                       | `DENY`                                                      |
| Allow base completo sin deny                  | `ALLOW`                                                     |
| `BASE_COMPONENT` completo                     | `ALLOW` del carril; no de la decisión final                 |
| Restricción global fallida                    | El carril conserva evidencia; la decisión final será `DENY` |

---

#### 58. Restricciones globales y outcome del carril

`base_decision` expresa la autoridad producida por el carril base.

Las decisiones separadas:

- `device_decision`;
- `sensitivity_decision`;
- `field_policy_decision`;
- `prerequisite_decisions`;

no se convierten en grants base.

Cuando una restricción global falla:

```text
base_decision puede conservar ALLOW
final_decision = DENY
```

Esto permite explicar que el actor posee la capacidad base, pero la solicitud concreta fue bloqueada por una restricción adicional.

---

#### 59. Dependencias

Una dependencia de permiso se evalúa mediante una decisión separada.

Reglas:

- no se infiere por módulo
- no se infiere app.access
- cada dependencia conserva su modalidad
- una dependencia fallida bloquea la solicitud principal cuando el contrato la declara obligatoria
- aprobar la dependencia no crea el grant principal
- la evidencia no se incluye como matched_allow_ids del permiso principal.

---

#### 60. Simulación

La simulación puede calcular un base_decision hipotético.

Reglas:

- utiliza el mismo algoritmo
- no modifica el contexto real
- no ejecuta mutaciones
- no crea grants
- no elimina denies
- no convierte WOULD_ALLOW en ALLOW
- el actor real conserva la autorización para iniciar y consultar la simulación.

---

#### 61. Procesos de sistema

Un proceso SYSTEM autónomo no utiliza el carril base laboral salvo que un contrato explícito de sistema lo represente.

No se convertirá service role, API key, cron, Edge Function o cola en rol base.

Los procesos delegados conservan al empleado actor cuando exista delegación válida.

---

#### 62. Inmutabilidad y snapshot

`base_decision` queda asociado a:

- actor;
- empleado;
- rol base;
- cobertura;
- permiso;
- recurso;
- versión;
- datasets;
- denies;
- instante;
- restricciones.

Un cambio en cualquiera de estos hechos obliga a una nueva decisión.

---

#### 63. Orden determinista

La serialización deberá:

- ordenar matched_allow_ids alfabéticamente
- ordenar matched_deny_ids alfabéticamente
- eliminar duplicados
- ordenar reason_codes por prioridad y luego alfabéticamente
- conservar el mismo resultado para el mismo snapshot
- no depender del orden físico de filas
- no elegir el primer grant
- no elegir el grant más amplio
- no elegir el grant más permisivo.

---

#### 64. Casos de ejemplo

##### Caso A — Permiso `BASE_ONLY` con grant de rol

```text
permission = viso.workforce.employees.view
requirement = BASE_ONLY
base_role = gerente
grant = AS
resource.site_ids = [VENTO_CAFE]
assigned_sites = [VENTO_CAFE]
```

Resultado:

```text
base_decision.outcome = ALLOW
operational_decision = NOT_APPLICABLE
```

##### Caso B — `OPERATIONAL_ONLY`

```text
permission = nexo.inventory.remissions.prepare
requirement = OPERATIONAL_ONLY
```

Resultado:

```text
base_decision = NOT_APPLICABLE
```

Aunque exista una fila base legacy, no autoriza.

##### Caso C — `BASE_OR_OPERATIONAL` sin turno

```text
base allow válido
active_shift = null
```

Resultado:

```text
base_decision = ALLOW
```

##### Caso D — `BASE_AND_OPERATIONAL`

```text
base component válido
operational component pendiente
```

Resultado:

```text
base_decision = ALLOW
final_decision todavía no es ALLOW
```

##### Caso E — Propietario sin grant

```text
base_role = propietario
sin grant exacto
```

Resultado:

```text
base_decision = DENY
BASE_NO_MATCHING_ALLOW
```

##### Caso F — Contador con cobertura `NONE` y grant global exacto

```text
base_role = contador
administrative_coverage.mode = NONE
grant.scope = G
resource organizacional ordinario
```

Resultado:

```text
base_decision puede ser ALLOW
```

##### Caso G — Recurso fuera de sedes asignadas

```text
grant = AS
assigned_sites = [VENTO_CAFE]
resource.site = SAUDO
```

Resultado:

```text
DENY
BASE_SCOPE_NOT_MATCHED
```

##### Caso H — Recurso propio fuera del territorio

```text
grant = OWN + AS
ownership = SELF
resource.site = SAUDO
assigned_sites = [VENTO_CAFE]
```

Resultado:

```text
DENY
```

##### Caso I — Remisión con dos lados

```text
grant cubre origin
no cubre destination
ambos lados son obligatorios
```

Resultado:

```text
DENY
BASE_REQUIRED_SIDE_NOT_COVERED
```

##### Caso J — Actor-wide deny

```text
dos allows base válidos
un actor-wide deny coincidente
```

Resultado:

```text
base_decision = DENY
```

##### Caso K — `APP-REVIEW`

```text
grant = G
resource.isolated_environment = true
```

Resultado:

```text
DENY
BASE_RESOURCE_ISOLATED
```

---

#### 65. Antipatrones prohibidos

```ts
if (employee.role === "propietario") {
  return true;
}
```

```ts
if (!activeShift) {
  return false;
}
```

```ts
const allowed = rolePermissions.some((permission) =>
  permission.startsWith(`${appCode}.`)
);
```

```ts
const siteId = selectedSiteId ?? employee.site_id;
```

```ts
if (resource.created_by === actorId) {
  return true;
}
```

También queda prohibido:

```text
rol base → todos los permisos
check-in activo → ampliar administración
sin turno → perder administración
grant operativo → allow base
grant base legacy → rescatar OPERATIONAL_ONLY
sede primaria → todas las sedes
lista vacía → todos
OWN → ignorar territorio
G → incluir APP-REVIEW
allow más específico → vencer deny
varios allows incompletos → construir uno nuevo
BASE_COMPONENT → final allow
```

---

#### 66. Relación con tareas posteriores

| Tarea                         | Responsabilidad posterior                                                                                                                                                                         |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTH-CTX-020`                | Definir el carril operativo de forma independiente                                                                                                                                                |
| `AUTH-CTX-021`                | Definir y serializar `MatchedGrant`, incluyendo los grants base realmente coincidentes                                                                                                            |
| `AUTH-CTX-022`                | Definir structural denies, actor-wide denies, base lane denies, operational lane denies y evidencia coincidente                                                                                   |
| `AUTH-CTX-023`                | Combinar base, operación, modalidad, restricciones, dependencias, campos, denies, default deny y decisión final                                                                                   |
| `AUTH-CTX-024`                | Registrar evidencia auditable de rol, grant, override, scope, recurso, territorio, razones, datasets, hash y outcome                                                                              |
| `AUTH-CTX-025`                | Diseñar `get_access_context`, incluyendo los hechos base necesarios                                                                                                                               |
| `AUTH-CTX-026`                | Diseñar `evaluate_authorization`, la consulta de datasets, el scope matcher, la frontera transaccional y `LaneDecision`                                                                           |
| `AUTH-CTX-027`                | Eliminar evaluaciones locales de permisos base en aplicaciones                                                                                                                                    |
| `AUTH-CTX-028`                | Diseñar compatibilidad con `has_permission`, `role_permissions`, `employee_permissions`, oficios base legacy, territorios legacy, scopes, duplicados y aliases                                    |
| `AUTH-CTX-029`                | Definir caché e invalidación por cambios de rol, asignación, grant, deny, recurso, estado, dataset y catálogo                                                                                     |
| `AUTH-CTX-030`                | Definir pruebas contractuales de modalidad, readiness, roles, overrides, scopes, recursos, multiterritorio, colecciones, agregados, bulk, denies, dispositivo, campos, concurrencia y aislamiento |
| `AUTH-MOD-021`                | Definir el rol base mínimo de trabajadores puramente operativos antes de `AUTH-CTX-028`                                                                                                           |
| `AUTH-DB-006` a `AUTH-DB-010` | Implementar validación del contexto, permiso, recurso, actor y territorio dentro de RPC sensibles                                                                                                 |
| `AUTH-DB-020`                 | Migrar grants y consumidores legacy con compatibilidad temporal                                                                                                                                   |
| `AUTH-DB-027`                 | Probar matriz base, overrides, RLS, RPC, recursos y migraciones                                                                                                                                   |
| `AUTH-DB-030`                 | Retirar `has_permission` y rutas legacy después de adopción comprobada                                                                                                                            |
| `AUTH-DB-031`                 | Certificar paridad documental, técnica y operativa                                                                                                                                                |

---

#### 67. Fuera del alcance

AUTH-CTX-019 no:

- modifica la matriz base;
- modifica sus 499 registros;
- modifica sus hashes;
- crea grants;
- crea overrides;
- crea denegaciones;
- define el carril operativo;
- define objetos completos de matched allows;
- define objetos completos de matched denies;
- produce la combinación final;
- modifica contratos de recurso;
- reclasifica permisos;
- implementa campos protegidos;
- implementa MFA;
- implementa dispositivos;
- crea tipos físicos;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 66.

---

#### 68. Riesgos controlados

| Riesgo                                        | Control canónico                                                       |
| --------------------------------------------- | ---------------------------------------------------------------------- |
| Rol jerárquico funciona como bypass           | Rol + grant exacto + recurso exacto                                    |
| Administración depende de presencia operativa | El carril base no consume turno ni check-in                            |
| Scope global concede todos los permisos       | `G` limita territorio; no crea capacidades                             |
| `OWN` amplía sedes                            | Propiedad ∩ territorio                                                 |
| Grant individual repara identidad inválida    | Contexto base válido obligatorio                                       |
| Deny se vence con allow más específico        | Deny aplicable > allow                                                 |
| Componente base ejecuta acción doble          | `BASE_COMPONENT` autoriza el carril; la decisión final exige operación |
| Recursos aislados entran en `G`               | `isolated_environment` produce `DENY` sin autorización específica      |

---

#### 69. Criterios de aprobación

AUTH-CTX-019 podrá aprobarse cuando se acepte que:

1. se conserva la forma de LaneDecision.
2. base_decision.lane siempre es BASE.
3. OPERATIONAL_ONLY produce NOT_APPLICABLE.
4. evaluated = false solo para carril no aplicable.
5. las demás modalidades evalúan base.
6. readiness procede del AccessContext.
7. el evaluador no mejora readiness.
8. READY no significa allow.
9. un actor laboral exacto es obligatorio.
10. empleado inactivo no posee autoridad.
11. rol base activo y único es obligatorio.
12. un override no repara rol inválido.
13. solo siete roles base son canónicos.
14. los oficios legacy no son fuente final.
15. propietario no tiene bypass.
16. gerente general no tiene bypass.
17. las únicas fuentes de allow son BASE_ROLE e INDIVIDUAL_BASE.
18. el dataset base es @1.0.0.
19. contiene 499 registros.
20. los grants directos pueden autorizar el carril.
21. los componentes base solo autorizan su carril.
22. un componente base no autoriza la acción final.
23. los overrides individuales permanecen restrictivos.
24. la clave debe coincidir exactamente.
25. la modalidad debe admitir base.
26. el grant debe estar vigente.
27. CTX es incompatible con base.
28. NT no inventa territorio.
29. ORG no equivale a global territorial.
30. G es organizacional ordinario.
31. G excluye entornos aislados.
32. AS usa sedes asignadas utilizables.
33. SS exige sede exacta.
34. AST combina asignación y tipo.
35. TST exige transversalidad explícita.
36. AA usa áreas asignadas.
37. SA exige área exacta.
38. AAT combina asignación y tipo.
39. ATW exige límite superior de sede.
40. OWN no amplía territorio.
41. scopes compuestos respetan su lógica publicada.
42. cobertura administrativa no es grant.
43. cobertura NONE puede coexistir con grants NT, ORG, G u OWN.
44. recursos sin sede no usan fallback.
45. recursos sin área no significan todas.
46. todos los lados obligatorios deben estar cubiertos.
47. colecciones se limitan en servidor.
48. agregados excluyen miembros no autorizados.
49. operaciones masivas requieren contrato.
50. estado del recurso participa.
51. campos protegidos permanecen separados.
52. concurrencia permanece obligatoria cuando aplica.
53. el dispositivo solo restringe.
54. el turno no participa.
55. el check-in no participa.
56. el carril operativo permanece separado.
57. actor-wide deny prevalece.
58. base lane deny prevalece en base.
59. structural deny puede bloquear el carril.
60. ausencia de allow produce default deny.
61. varios allows no crean alcance nuevo.
62. matched_allow_ids solo contiene grants realmente coincidentes.
63. matched_deny_ids excluye default deny.
64. reason_codes queda normalizado.
65. restricciones globales pueden negar la decisión final sin reescribir la evidencia del carril.
66. dependencias no crean grants.
67. simulación no ejecuta autoridad.
68. procesos de sistema no inventan rol base.
69. la decisión es inmutable.
70. el orden es determinista.
71. AUTH-CTX-020 definirá operación.
72. AUTH-CTX-021 definirá allows coincidentes.
73. AUTH-CTX-022 definirá denies.
74. AUTH-CTX-023 definirá decisión final.
75. AUTH-CTX-024 definirá auditoría.
76. AUTH-CTX-026 diseñará el evaluador.
77. AUTH-CTX-027 eliminará lógica local.
78. AUTH-CTX-028 gobernará compatibilidad legacy.
79. AUTH-CTX-029 gobernará invalidación.
80. AUTH-CTX-030 gobernará pruebas.
81. AUTH-MOD-021 permanece como puerta antes de AUTH-CTX-028.
82. las tareas AUTH-DB indicadas tienen destinos físicos explícitos.
83. no se implementa código, migraciones ni cambios en Supabase.

---

#### 70. Cierre y continuidad

| Relación       | Tarea          | Estado        |
| -------------- | -------------- | ------------- |
| Tarea anterior | `AUTH-CTX-018` | ✅ APROBADA    |
| Tarea cerrada  | `AUTH-CTX-019` | ✅ APROBADA    |
| Tarea actual   | `AUTH-CTX-020` | ⬜ NO INICIADA |

```text
AUTH-CTX-018 — APROBADA
        ↓
AUTH-CTX-019 — APROBADA
        ↓
AUTH-CTX-020 — NO INICIADA
```

`AUTH-CTX-020` permanece reservada hasta que se inicie formalmente su propuesta.

### ✅ AUTH-CTX-020 — Incluir decisión del carril operativo

| Campo                          | Valor                                                                             |
| ------------------------------ | --------------------------------------------------------------------------------- |
| **Estado**                     | APROBADA                                                                          |
| **Bloque**                     | BLOQUE E — Contexto y decisión de autorización unificados                         |
| **Subbloque**                  | `AUTHORIZATION DECISION`                                                          |
| **Naturaleza**                 | Definición documental de `operational_decision` dentro de `AuthorizationDecision` |
| **Implementación física**      | No incluida                                                                       |
| **Tarea anterior vigente**     | `AUTH-CTX-019` — APROBADA                                                         |
| **Tarea posterior reservada**  | `AUTH-CTX-021` — Incluir allows coincidentes                                      |
| **Contrato afectado**          | `AuthorizationDecision@1.0.0`                                                     |
| **Campo principal afectado**   | `operational_decision`                                                            |
| **Tipo principal afectado**    | `LaneDecision`                                                                    |
| **Dataset operativo**          | `vento.authorization.operational-role-grants@1.0.0`                               |
| **Dataset de overrides**       | `vento.authorization.individual-overrides@1.0.0`                                  |
| **Catálogo**                   | `vento.authorization@1.0.0`                                                       |
| **Cambio contractual**         | Aclaración normativa compatible; no cambia la forma publicada                     |
| **Cambios físicos permitidos** | No                                                                                |

Esta tarea define cómo Vento OS evalúa el carril operativo de autorización a partir de:

- actor efectivo;
- identidad laboral;
- estado del empleado;
- turno publicado y vigente;
- sesión de check-in activa cuando corresponda;
- rol operativo efectivo;
- sede operativa;
- área operativa;
- aplicación y permiso exactos;
- modalidad contractual;
- prerrequisito operativo `T` o `T+C`;
- requisito de área operativa;
- recurso y territorio resueltos;
- concesiones de matriz operativa;
- concesiones individuales operativas;
- denegaciones transversales;
- denegaciones del carril operativo;
- estado del recurso;
- lados obligatorios;
- dispositivo compartido;
- sensibilidad;
- dependencias;
- política de campos;
- concurrencia;
- `default deny`.

> **Regla central**
>
> ```text
> CARRIL OPERATIVO
> =
> AUTORIDAD TEMPORAL Y CONTEXTUAL
> DEL ACTOR LABORAL
> DURANTE UN TURNO PUBLICADO Y VIGENTE
> BAJO UN ROL OPERATIVO EXACTO
> SOBRE EL PERMISO EXACTO
> Y EL RECURSO EXACTO
> ```

La autoridad operativa exige, como mínimo:

```text
ACTOR HUMANO EFECTIVO
+
EMPLEADO ACTIVO
+
TURNO PUBLICADO Y VIGENTE
+
ROL OPERATIVO CANÓNICO
+
SEDE Y ÁREA COMPATIBLES
+
CHECK-IN CUANDO EL CONTRATO EXIGE T+C
+
GRANT OPERATIVO EXACTO
+
RECURSO Y LADOS COMPATIBLES
+
AUSENCIA DE DENY APLICABLE
```

El carril operativo:

- no se obtiene del rol base;
- no se obtiene de la cobertura administrativa;
- no se obtiene de la sede primaria;
- no se obtiene de la sede seleccionada;
- no se obtiene de un perfil operativo predeterminado;
- no se obtiene del dispositivo;
- no se obtiene de `navigation_role`;
- no se obtiene de una ruta visible;
- no se obtiene de una aplicación abierta;
- no se obtiene de un check-in aislado;
- no se obtiene por jerarquía implícita;
- no sobrevive al fin del contexto operativo que lo sustenta;
- no concede autoridad sobre sedes, áreas o lados distintos del recurso.

No implementa SQL, RPC, RLS, funciones, migraciones, guards, middlewares, caché ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir `operational_decision` de manera que Vento OS pueda responder inequívocamente:

1. cuándo el carril operativo es aplicable;
2. cuándo debe ser `NOT_APPLICABLE`;
3. cuándo debe evaluarse;
4. cuándo está estructuralmente listo;
5. cuándo debe denegar por indisponibilidad;
6. cuándo debe denegar por invalidez;
7. cómo consume `T` y `T+C`;
8. cómo consume el requisito de área;
9. qué turno puede sustentar el carril;
10. qué sesión de check-in puede sustentar una capacidad `T+C`;
11. qué rol operativo participa;
12. cómo se valida la habilitación territorial del rol;
13. cómo se resuelven sede y área operativas;
14. qué fuentes pueden producir un allow operativo;
15. qué fuentes pueden producir un deny operativo;
16. cómo se consulta la matriz operativa;
17. cómo se consumen overrides individuales operativos;
18. cómo se compara un grant con el recurso;
19. cómo se comparan origen, destino y demás lados obligatorios;
20. cómo se evalúan recursos de nivel sede;
21. cómo se evalúan recursos de nivel área;
22. cómo se evalúan recursos multiterritoriales;
23. cómo se evalúan colecciones, agregados y operaciones masivas;
24. cómo se preserva la independencia frente al carril base;
25. cómo se aplican actor-wide denies y operational lane denies;
26. cómo se aplica `default deny`;
27. cómo se serializa `LaneDecision`;
28. cómo se ordenan los identificadores coincidentes;
29. cómo se evita duplicar evidencia;
30. cómo se evita que un componente operativo de `BASE_AND_OPERATIONAL` autorice por sí solo;
31. cómo interactúa el carril con dispositivos compartidos;
32. cómo se preservan determinismo, inmutabilidad y auditoría.

---

#### 2. Base normativa

AUTH-CTX-020 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — Actor efectivo;
- `AUTH-MOD-002` — Separación entre rol base y rol operativo;
- `AUTH-MOD-005` — Roles operativos;
- `AUTH-MOD-006` — Casos híbridos administrativo-operativos;
- `AUTH-MOD-007` y `AUTH-MOD-008` — Sede y área;
- `AUTH-MOD-009` — Turno publicado;
- `AUTH-MOD-010` — Check-in activo;
- `AUTH-MOD-011` — Sesión en dispositivo compartido;
- `AUTH-MOD-013` a `AUTH-MOD-017` — Alcances;
- `AUTH-MOD-018` — Combinación de carriles;
- `AUTH-MOD-019` — Denegación explícita;
- `AUTH-CAT-006` — Modalidad;
- `AUTH-CAT-007` — Clasificación de permisos operativos;
- `AUTH-CAT-011` — Alcance permitido;
- `AUTH-CAT-012` — Prerrequisitos de turno y check-in;
- `AUTH-CAT-013` — Requisito de área operativa;
- `AUTH-CAT-014` — Compatibilidad con dispositivo compartido;
- `AUTH-CAT-016` — Contrato de recurso;
- `AUTH-CAT-017` — Dependencias;
- `AUTH-RBAC-009` a `AUTH-RBAC-019` — Matrices operativas;
- `AUTH-RBAC-021` — Concesiones individuales operativas;
- `AUTH-RBAC-022` — Denegaciones individuales y transversales;
- `AUTH-RBAC-025` — Dataset canónico de matriz operativa;
- `AUTH-RBAC-026` — Dataset canónico de overrides;
- `AUTH-RBAC-027` — Ausencia de acceso operativo global accidental;
- `AUTH-RBAC-028` — Independencia de la administración frente al check-in;
- `AUTH-CTX-001` a `AUTH-CTX-015` — `AccessContext`;
- `AUTH-CTX-016` — Aplicación y permiso solicitado;
- `AUTH-CTX-017` — `authorization_requirement`;
- `AUTH-CTX-018` — Recurso y territorio resueltos;
- `AUTH-CTX-019` — Decisión del carril base.

Principios obligatorios:

```text
TURNO
≠
PERMISO
```

```text
CHECK-IN
≠
PERMISO
```

```text
ROL OPERATIVO
≠
PERMISO
```

```text
DISPOSITIVO
≠
AUTORIDAD
```

```text
SEDE OPERATIVA
≠
TODAS LAS SEDES
```

```text
ÁREA OPERATIVA
≠
TODAS LAS ÁREAS
```

```text
ROL BASE
≠
ROL OPERATIVO
```

```text
COBERTURA ADMINISTRATIVA
≠
TERRITORIO OPERATIVO
```

```text
ALLOW OPERATIVO APLICABLE
=
PERMISO EXACTO
∩
ACTOR EXACTO
∩
TURNO EXACTO
∩
ROL OPERATIVO EXACTO
∩
PRERREQUISITOS
∩
SEDE Y ÁREA
∩
RECURSO Y LADOS
∩
GRANT VIGENTE
∩
AUSENCIA DE DENY APLICABLE
```

---

#### 3. Forma contractual conservada

```ts
type LaneDecision = {
  lane: "BASE" | "OPERATIONAL";

  outcome:
    | "ALLOW"
    | "DENY"
    | "NOT_APPLICABLE";

  readiness:
    | "READY"
    | "UNAVAILABLE"
    | "INVALID"
    | "NOT_APPLICABLE";

  evaluated: boolean;
  matched_allow_ids: string[];
  matched_deny_ids: string[];
  reason_codes: string[];
};
```

Para esta tarea:

```ts
operational_decision: LaneDecision;
```

deberá cumplir siempre:

```text
lane = OPERATIONAL
```

No se agregan campos.

---

#### 4. Aplicabilidad por modalidad

| `authorization_requirement` | Carril operativo        | Regla                                |
| --------------------------- | ----------------------- | ------------------------------------ |
| `BASE_ONLY`                 | No aplicable            | Produce `NOT_APPLICABLE`             |
| `OPERATIONAL_ONLY`          | Aplicable y obligatorio | Debe producir `ALLOW` o `DENY`       |
| `BASE_OR_OPERATIONAL`       | Aplicable               | Se evalúa de forma independiente     |
| `BASE_AND_OPERATIONAL`      | Aplicable y obligatorio | Debe aportar el componente operativo |

```text
BASE_ONLY
→ operational_decision.outcome = NOT_APPLICABLE
```

No se consulta la matriz operativa para intentar ampliar un permiso `BASE_ONLY`.

---

#### 5. Forma de NOT_APPLICABLE

Cuando la modalidad es `BASE_ONLY`:

```ts
operational_decision = {
  lane: "OPERATIONAL",
  outcome: "NOT_APPLICABLE",
  readiness: "NOT_APPLICABLE",
  evaluated: false,
  matched_allow_ids: [],
  matched_deny_ids: [],
  reason_codes: ["OPERATIONAL_LANE_NOT_REQUIRED"]
};
```

Reglas:

- no significa `DENY`;
- no significa error;
- no significa ausencia de turno;
- no significa ausencia de rol operativo;
- no consulta grants operativos;
- no consulta lane denies operativos;
- los actor-wide denies y structural denies continúan siendo evaluables a nivel global en `AUTH-CTX-022` y `AUTH-CTX-023`;
- una fila operativa almacenada para un permiso `BASE_ONLY` se clasifica como incompatibilidad contractual, no como allow.

---

#### 6. Cuándo evaluated = true

Para las modalidades:

- `OPERATIONAL_ONLY`;
- `BASE_OR_OPERATIONAL`;
- `BASE_AND_OPERATIONAL`;

se utilizará:

```text
evaluated = true
```

Esto se conserva aunque el carril termine tempranamente en `DENY` por:

- contexto operativo inexistente;
- contexto operativo inválido;
- empleado inactivo;
- turno ausente;
- turno vencido;
- turno ambiguo;
- check-in ausente cuando se exige;
- check-in incompatible;
- rol operativo inválido;
- sede operativa incompatible;
- área obligatoria ausente;
- recurso no resoluble;
- deny aplicable;
- falta de allow.

```text
evaluated = false
```

se reserva exclusivamente para `NOT_APPLICABLE`.

---

#### 7. readiness

Para modalidades que admiten operación:

```text
operational_decision.readiness
=
AccessContext.lane_readiness.operational.status
```

El evaluador no podrá:

- convertir `INVALID` en `READY`;
- convertir `UNAVAILABLE` en `READY`;
- crear un turno;
- extender la vigencia de un turno;
- crear un check-in;
- reabrir una sesión cerrada;
- reemplazar el rol operativo;
- completar una sede;
- completar un área;
- seleccionar el primer contexto disponible;
- ocultar un código estructural;
- recalcular parcialmente el contexto con reglas locales.

Si el contexto quedó obsoleto:

```text
readiness = INVALID
outcome = DENY
```

---

#### 8. Relación entre readiness y outcome

| `readiness`      | Resultado máximo posible |
| ---------------- | ------------------------ |
| `READY`          | `ALLOW` o `DENY`         |
| `UNAVAILABLE`    | `DENY`                   |
| `INVALID`        | `DENY`                   |
| `NOT_APPLICABLE` | `NOT_APPLICABLE`         |

`READY` no concede autoridad.

Solo indica que el contexto operativo puede compararse con grants, denies y recurso.

---

#### 9. Actor laboral obligatorio

El carril operativo laboral requiere:

- actor efectivo de tipo `EMPLOYEE`;
- identidad laboral resoluble;
- empleado exacto;
- empleado activo;
- coincidencia entre actor y empleado;
- snapshot vigente.

Para actores de tipo:

- `CUSTOMER`;
- `SYSTEM` autónomo;
- `DEVICE` sin actor humano;
- `UNRESOLVED`;

el carril operativo será `NOT_APPLICABLE` o `DENY` según la modalidad y el contrato del actor.

No se inventará una identidad laboral para evaluar una matriz operativa.

---

#### 10. Empleado inactivo

Un empleado inactivo conserva atribución histórica, pero no autoridad operativa.

Resultado:

```text
readiness = UNAVAILABLE
outcome = DENY
reason_codes incluye OPERATIONAL_EMPLOYEE_INACTIVE
```

No se consultan grants como mecanismo de reactivación.

Un turno residual, una sesión de check-in abierta o una concesión individual activa no reactivan al empleado.

---

#### 11. Turno publicado y vigente

Para evaluar el carril operativo deberá existir:

```text
active_shift != null
active_shift.published = true
active_shift.currently_valid = true
```

El turno deberá:

- pertenecer al actor efectivo;
- pertenecer al empleado exacto;
- tener una revisión autoritativa;
- estar dentro de su ventana temporal;
- no estar cancelado;
- no estar retirado;
- no estar completado de forma terminal;
- contener sede resoluble;
- contener rol operativo resoluble;
- no ser ambiguo.

El carril no utiliza:

- turno futuro;
- turno expirado;
- turno borrador;
- turno no publicado;
- turno de otro trabajador;
- turno enviado por cliente;
- turno elegido por dispositivo;
- turno seleccionado por frontend.

---

#### 12. Ausencia de turno

Cuando el permiso admite operación y no existe un turno vigente:

```text
readiness = UNAVAILABLE
outcome = DENY
reason_codes incluye OPERATIONAL_SHIFT_UNAVAILABLE
```

La ausencia de turno:

- no invalida el carril base;
- no elimina permisos administrativos;
- no se repara mediante check-in aislado;
- no se repara mediante rol base;
- no se repara mediante dispositivo;
- no se repara mediante override individual operativo;
- no se repara mediante perfil predeterminado.

---

#### 13. Turno inválido o ambiguo

Cuando existe evidencia contradictoria o varios candidatos incompatibles:

```text
readiness = INVALID
outcome = DENY
reason_codes incluye OPERATIONAL_SHIFT_INVALID
```

Casos:

- dos turnos simultáneos sin regla determinista;
- turno de otro empleado;
- sede inexistente;
- área perteneciente a otra sede;
- rol ausente;
- rol desconocido;
- revisión no autoritativa;
- timestamps no resolubles;
- estado desconocido;
- contexto antiguo reutilizado después de una modificación.

No se elegirá el primer turno.

---

#### 14. Prerrequisito operativo

La decisión consume:

```ts
operational_prerequisite:
  | "T"
  | "T+C"
  | "NOT_APPLICABLE";
```

| Valor            | Requisito                                                          |
| ---------------- | ------------------------------------------------------------------ |
| `T`              | Turno publicado y vigente                                          |
| `T+C`            | Turno publicado y vigente + sesión de check-in activa y compatible |
| `NOT_APPLICABLE` | El carril operativo no participa                                   |

Reglas:

- no existe `C` sin turno;
- la modalidad no permite inferir `T` o `T+C`;
- el valor procede del contrato canónico del permiso;
- el dispositivo no reduce `T+C` a `T`;
- la simulación no reduce `T+C` a `T`;
- un override no cambia el prerrequisito;
- un rol no cambia el prerrequisito.

---

#### 15. Permisos T

Para un permiso `T`:

```text
active_shift válido
→ requisito temporal satisfecho
```

No se exige una sesión de check-in activa.

Sin embargo, si existe una sesión de check-in presentada como parte del contexto y resulta incompatible, inválida, cerrada de forma contradictoria o perteneciente a otro turno:

```text
outcome = DENY
```

El evaluador no podrá ignorar evidencia operativa contradictoria para obtener un allow.

---

#### 16. Permisos T+C

Para un permiso `T+C` deberá existir:

```text
active_checkin_session != null
```

y la sesión deberá:

- pertenecer al actor efectivo;
- pertenecer al empleado exacto;
- corresponder al `active_shift`;
- estar abierta;
- estar vigente;
- no estar reemplazada;
- no estar revocada;
- no estar expirada;
- coincidir con la sede operativa;
- ser compatible con el área cuando el contrato la utiliza;
- proceder de evidencia confirmada por servidor.

Resultado ante ausencia:

```text
readiness = UNAVAILABLE
outcome = DENY
reason_codes incluye OPERATIONAL_CHECKIN_REQUIRED
```

---

#### 17. Check-in incompatible

Un check-in incompatible produce:

```text
readiness = INVALID
outcome = DENY
reason_codes incluye OPERATIONAL_CHECKIN_MISMATCH
```

Ejemplos:

- sesión de otro turno;
- sesión de otra sede;
- sesión de otro empleado;
- sesión cerrada;
- sesión expirada;
- sesión duplicada sin resolución determinista;
- evento offline todavía no confirmado;
- sesión corregida o reemplazada;
- check-in residual de un turno cancelado.

El check-in no elige el turno.

---

#### 18. Fin del turno

Cuando termina la vigencia del turno:

```text
operational_decision
→ debe reevaluarse
```

La autoridad operativa no sobrevive por:

- mantener abierta la aplicación;
- conservar una cookie;
- conservar un objeto en memoria;
- conservar un check-in residual;
- mantener una sesión de dispositivo;
- conservar una decisión anterior;
- mantener una ruta abierta.

Una decisión emitida antes del fin no autoriza una ejecución posterior sin revalidación.

---

#### 19. Cierre del check-in

El cierre del check-in:

- revoca la posibilidad de producir allow para permisos `T+C`;
- no revoca por sí solo permisos `T`;
- no modifica el rol base;
- no modifica la cobertura administrativa;
- no convierte el turno en inválido;
- obliga a reevaluar decisiones operativas dependientes de check-in.

---

#### 20. Rol operativo efectivo

Para evaluar el carril deberá existir:

```text
operational_role != null
operational_role.active = true
```

El rol deberá:

- proceder del turno vigente;
- pertenecer al catálogo operativo canónico;
- coincidir exactamente con el código publicado;
- estar activo;
- no estar deprecado;
- estar habilitado en la sede del turno;
- ser compatible con el área;
- conservar el `shift_id` exacto;
- conservar la sede exacta;
- conservar el área exacta o `null`.

No se resuelve desde:

- rol base;
- cargo humano;
- perfil predeterminado;
- `navigation_role`;
- plantilla de dispositivo;
- aplicación;
- ruta;
- permiso;
- cookie;
- cliente.

---

#### 21. Roles canónicos operativos

El dataset canónico operativo contiene exactamente doce roles:

| Rol operativo canónico       |
| ---------------------------- |
| `cajero_satelite`            |
| `barista_satelite`           |
| `cocinero_satelite`          |
| `servicio_salon`             |
| `mostrador_satelite`         |
| `operador_integral_satelite` |
| `produccion_cocina`          |
| `produccion_panaderia`       |
| `produccion_reposteria`      |
| `bodeguero`                  |
| `conductor_logistica`        |
| `gerencia_operativa`         |

No participan como fuente canónica:

- `propietario_admin`;
- oficios base legacy;
- aliases no resueltos;
- roles de navegación;
- nombres humanos;
- roles de aplicaciones externas.

La compatibilidad temporal se diseñará en `AUTH-CTX-028`.

---

#### 22. Sin bypass por rol operativo

Queda prohibido:

- `gerencia_operativa` → ALLOW automático;
- `operador_integral_satelite` → todas las capacidades del satélite;
- `bodeguero` → todo NEXO;
- `conductor_logistica` → todos los vehículos o remisiones;
- `cajero_satelite` → todas las operaciones de venta;
- `produccion_*` → todas las operaciones de FOGO.

Todo actor requiere:

```text
permiso exacto
+
grant exacto
+
turno exacto
+
rol exacto
+
territorio compatible
+
recurso compatible
+
ausencia de deny
```

---

#### 23. Rol base y jerarquía administrativa

El rol base no sustituye el rol operativo.

Reglas:

- propietario requiere rol operativo real cuando pretende autorizar por el carril operativo;
- gerente general requiere rol operativo real cuando pretende autorizar por el carril operativo;
- gerente no obtiene operación por cobertura administrativa;
- supervisor no obtiene operación por jerarquía;
- un allow base no repara un carril operativo inválido;
- un `BASE_COMPONENT` no sustituye un componente operativo;
- un usuario híbrido conserva ambos carriles separados.

---

#### 24. Habilitación territorial del rol

El rol operativo deberá declarar coherencia con:

- sede del turno;
- área del turno;
- configuración site-wide;
- configuración por área;
- vigencia de la habilitación.

Si el rol es canónico pero:

```text
valid_for_site = false
```

o:

```text
valid_for_area = false
```

el carril produce:

```text
outcome = DENY
```

El evaluador no reemplaza el rol por otro habilitado en la sede.

---

#### 25. Sede operativa

La sede operativa procede del turno vigente y deberá ser:

- resoluble;
- activa;
- operable;
- coherente con el rol;
- coherente con el check-in cuando exista;
- coherente con el dispositivo cuando se usa un terminal compartido;
- comparable con el recurso.

No se toma de:

- sede seleccionada;
- sede primaria;
- cobertura administrativa;
- última sede utilizada;
- dispositivo como fuente;
- localizador del request;
- primer `site_id` del recurso.

---

#### 26. Área operativa

El área operativa procede del turno.

Cuando existe deberá:

- ser resoluble;
- estar activa;
- pertenecer a la sede operativa;
- ser coherente con el rol;
- ser coherente con el recurso;
- ser coherente con el dispositivo cuando corresponda.

No se completa mediante:

- área asignada administrativa;
- área seleccionada;
- tipo de área enviado por cliente;
- dispositivo;
- perfil predeterminado;
- primera área habilitada para el rol.

---

#### 27. Requisito de área

La decisión consume:

```ts
type OperationalAreaRequirement =
  | "REQUIRED"
  | "SITE_SUFFICIENT"
  | "NOT_APPLICABLE";
```

| Requisito         | Regla                                                          |
| ----------------- | -------------------------------------------------------------- |
| `REQUIRED`        | Exige área operativa activa y compatible                       |
| `SITE_SUFFICIENT` | Permite evaluación a nivel de sede si rol y recurso lo admiten |
| `NOT_APPLICABLE`  | El carril operativo no participa                               |

Reglas:

- `SITE_SUFFICIENT` no significa todas las áreas;
- una restricción del rol puede exigir área aunque el permiso sea `SITE_SUFFICIENT`;
- un recurso de área exige coincidencia aunque el permiso admita nivel de sede;
- un área `null` nunca es wildcard;
- un dispositivo no crea área;
- un override no elimina el requisito.

---

#### 28. Área obligatoria ausente

Cuando el contrato o el rol exige área y no existe:

```text
readiness = UNAVAILABLE
outcome = DENY
reason_codes incluye OPERATIONAL_AREA_REQUIRED
```

Cuando existe área, pero es incoherente:

```text
readiness = INVALID
outcome = DENY
reason_codes incluye OPERATIONAL_AREA_MISMATCH
```

---

#### 29. Territorio operativo exacto

El territorio operativo efectivo es:

```text
operational_site
+
operational_area cuando aplica
+
rol operativo
+
turno
+
check-in cuando aplica
```

No es:

- cobertura administrativa;
- conjunto de sedes asignadas;
- conjunto de áreas asignadas;
- territorio global;
- territorio del dispositivo;
- territorio declarado por el cliente.

---

#### 30. Comparación con el recurso

El carril operativo deberá comparar el contexto contra:

- `resource.territory.site_ids`;
- `resource.territory.area_ids`;
- `resource.required_sides`;
- origen;
- destino;
- sujeto;
- custodio;
- ruta;
- vehículo;
- propiedad cuando el contrato lo exige;
- estado;
- campos solicitados;
- política de concurrencia.

Regla:

```text
CONTEXTO OPERATIVO
LIMITA
EL RECURSO REAL
```

No:

```text
CONTEXTO OPERATIVO
CREA
EL TERRITORIO DEL RECURSO
```

---

#### 31. Lados obligatorios

El contrato del recurso deberá declarar qué lado o lados debe cubrir el carril operativo.

Ejemplos:

```text
RESOURCE
ORIGIN
DESTINATION
SOURCE
TARGET
CUSTODIAN
VEHICLE
ROUTE
```

Reglas:

- un lado obligatorio debe resolverse;
- el contexto debe coincidir con el lado declarado;
- coincidencia con origen no autoriza destino;
- coincidencia con destino no autoriza origen;
- un lado no se intercambia silenciosamente;
- un turno no obtiene autoridad sobre todos los lados;
- un grant no amplía los lados declarados.

---

#### 32. Recursos multiterritoriales

Un turno aporta un territorio operativo principal.

Una operación puede exigir varios territorios.

Ejemplo:

```text
turno = CENTRO_PRODUCCION
remisión:
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

El carril operativo no obtiene automáticamente autoridad sobre `VENTO_CAFE`.

El contrato deberá exigir una de estas formas:

- coincidencia con origen;
- coincidencia con destino;
- coincidencia con ambos;
- componente base adicional;
- capacidad transversal explícita;
- decisión separada por lado;
- política masiva explícita.

Sin regla contractual exacta:

```text
outcome = DENY
```

---

#### 33. Permisos operativos no son cross-site

Una concesión operativa sin IDs territoriales físicos no significa:

```text
todas las sedes
```

Significa:

```text
capacidad disponible
únicamente dentro del contexto operativo válido
y contra el recurso compatible
```

Queda prohibido interpretar:

```text
grant operativo presente
+
site_id null
=
global
```

---

#### 34. Fuentes de allow operativo

Solo pueden producir candidatos de allow operativo:

```text
OPERATIONAL_ROLE
INDIVIDUAL_OPERATIONAL
```

Fuentes normativas:

- `vento.authorization.operational-role-grants@1.0.0`;
- `vento.authorization.individual-overrides@1.0.0`.

No producen allows operativos:

- matriz base;
- rol base;
- cobertura administrativa;
- turno por sí solo;
- check-in por sí solo;
- sede;
- área;
- dispositivo;
- `navigation_role`;
- rutas;
- menús;
- frontend;
- service role;
- nombre del cargo;
- perfil predeterminado.

---

#### 35. Dataset operativo canónico

La matriz operativa vigente es:

```text
vento.authorization.operational-role-grants@1.0.0
```

| Característica         |        Valor |
| ---------------------- | -----------: |
| Registros lógicos      |          240 |
| Roles operativos       |           12 |
| Concesiones directas   |          218 |
| Componentes operativos |           22 |
| Permisos `BASE_ONLY`   |            0 |
| Claves legacy          |            0 |
| Wildcards              |            0 |
| Efecto                 | `ALLOW_ONLY` |

Hash contractual:

```text
sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

Reglas adicionales:

- orden determinista;
- ausencia de fila = `default deny`;
- el evaluador consume el snapshot exacto y su hash aprobado;
- el evaluador no reconstruye la matriz desde tablas legacy;
- no se expande por aplicación;
- no se expande por prefijo;
- no se expande por dispositivo;
- una fila no sobrevive al fin del contexto operativo.

---

#### 36. Grants DIRECT_OPERATIONAL

Un grant operativo directo puede producir allow completo del carril cuando:

- el permiso admite operación;
- el rol operativo coincide;
- la clave coincide exactamente;
- el grant está vigente;
- el turno está vigente;
- el prerrequisito se cumple;
- la sede coincide;
- el área coincide cuando aplica;
- el recurso coincide;
- los lados exigidos coinciden;
- no existe deny aplicable;
- el contexto no está obsoleto.

---

#### 37. Grants OPERATIONAL_COMPONENT

Un registro `OPERATIONAL_COMPONENT` pertenece a un permiso `BASE_AND_OPERATIONAL` y representa únicamente el componente operativo.

```text
OPERATIONAL_COMPONENT
→ puede producir operational_decision = ALLOW
```

Pero:

```text
OPERATIONAL_COMPONENT
≠ final_decision = ALLOW
```

La decisión final exige además:

```text
base_decision = ALLOW
```

`AUTH-CTX-023` aplicará la conjunción.

---

#### 38. Overrides individuales operativos

Un override individual operativo podrá:

- conceder una capacidad operativa adicional compatible;
- limitarla mediante contexto;
- tener vigencia;
- referenciar el empleado exacto;
- requerir rol operativo exacto;
- requerir sede o área exacta;
- exigir turno y check-in según el permiso.

No podrá:

- crear turno;
- crear check-in;
- reparar empleado inactivo;
- reparar rol inválido;
- reparar sede incompatible;
- reparar área incompatible;
- convertir un permiso `BASE_ONLY`;
- cambiar `T+C` por `T`;
- ampliar el permiso más allá de su contrato;
- anular una denegación;
- conceder por wildcard;
- conceder por prefijo;
- conceder a un dispositivo.

El seed canónico inicial contiene cero overrides automáticos.

---

#### 39. Clave exacta

Todo candidato deberá cumplir:

```text
grant.permission_key
=
request.permission_key
```

No se admite:

- prefijo;
- sufijo;
- wildcard;
- módulo;
- aplicación completa;
- coincidencia semántica;
- alias no adaptado;
- permiso legacy;
- ruta;
- nombre humano.

---

#### 40. Modalidad compatible

Un grant operativo solo es compatible con:

```text
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

Un grant operativo sobre permiso `BASE_ONLY`:

- no se incluye en `matched_allow_ids`;
- no produce allow;
- genera incompatibilidad contractual;
- se audita;
- se corrige en datasets o transición.

---

#### 41. Vigencia del grant

Un grant deberá estar activo en `decided_at`.

La vigencia puede depender de:

- estado activo;
- fecha de inicio;
- fecha de fin;
- revocación;
- versión de dataset;
- estado del rol;
- estado del empleado;
- contexto operativo vigente.

Regla de inicio:

```text
starts_at <= decided_at
```

Cuando exista fin:

```text
decided_at < ends_at
```

Un grant futuro, expirado, suspendido o revocado no coincide.

---

#### 42. Estado del recurso

Un grant operativo válido no autoriza estados incompatibles.

El carril deberá consumir:

```text
resource.state_snapshot
```

y verificar:

- estado actual;
- transición solicitada;
- relación del actor;
- condición de custodia;
- condiciones empresariales del permiso.

Si el contrato no admite el estado:

```text
outcome = DENY
reason_codes incluye OPERATIONAL_RESOURCE_STATE_MISMATCH
```

---

#### 43. Propiedad, custodia y responsabilidad

La autoridad operativa puede depender de relaciones como:

- actor asignado;
- custodio;
- productor;
- solicitante;
- transportador;
- receptor;
- cajero de la sesión;
- responsable del lote;
- responsable del área.

Estas relaciones:

- proceden del contrato del recurso;
- no se infieren del rol;
- no se infieren del turno;
- no se infieren de `created_by` universalmente;
- no amplían territorio.

---

#### 44. Remisiones

Una remisión puede exigir lados distintos según la acción:

| Acción conceptual | Lado operativo esperado               |
| ----------------- | ------------------------------------- |
| Solicitar         | Destino o solicitante, según contrato |
| Preparar          | Origen                                |
| Despachar         | Origen y handoff                      |
| Transportar       | Ruta, vehículo y custodia             |
| Entregar          | Destino o handoff                     |
| Recibir           | Destino                               |
| Cancelar          | Autoridad declarada por estado y lado |

La tabla es conceptual.

La definición exacta de cada permiso procede de su contrato canónico.

Regla:

```text
ROL O CONTEXTO EN UN LADO
≠
AUTORIDAD EN TODOS LOS LADOS
```

---

#### 45. Inventario y ubicaciones

Una operación de inventario puede involucrar:

- sede;
- área;
- ubicación;
- ubicación de origen;
- ubicación de destino;
- LPN;
- contenedor;
- producto;
- custodio;
- estado;
- tipo de movimiento.

El carril operativo deberá coincidir con todas las dimensiones exigidas por el contrato.

Autorizar una sede no autoriza todas sus ubicaciones.

Autorizar un área no autoriza ubicaciones de otra área.

---

#### 46. Producción

Un recurso productivo puede involucrar:

- sede productora;
- área productora;
- receta;
- orden;
- lote;
- solicitud;
- inventario consumido;
- inventario resultante;
- estado de producción.

El rol operativo de producción no autoriza automáticamente:

- editar recetas;
- aprobar mermas;
- ajustar inventario;
- cerrar lotes;
- aprobar variaciones;
- modificar costos.

Cada capacidad conserva permiso, modalidad, recurso y lado exactos.

---

#### 47. Compras y recepciones

Una recepción puede separar:

- recepción comercial en ORIGO;
- ingreso físico y custodia en NEXO;
- sede receptora;
- área;
- ubicación interna;
- proveedor;
- orden de compra;
- documento;
- movimiento de inventario.

El carril operativo solo autoriza el efecto exacto que corresponde a su permiso.

No fusiona automáticamente recepción comercial e inventario.

---

#### 48. Ventas, caja y pagos

Una operación comercial puede involucrar:

- sede;
- área;
- sesión de caja;
- terminal;
- pedido;
- venta;
- pago;
- reverso;
- reembolso;
- cierre.

El rol `cajero_satelite` no autoriza automáticamente:

- cancelar ventas;
- reembolsar;
- reversar pagos;
- cerrar caja ajena;
- modificar precios;
- usar overrides;
- editar datos sensibles.

Cada acción requiere su permiso exacto.

---

#### 49. Rutas y vehículos

Un conductor con turno no obtiene autoridad sobre todos los vehículos ni todas las rutas.

El carril deberá verificar:

- vehículo relacionado con la operación;
- ruta relacionada;
- asignación o custodia válida;
- ventana temporal;
- origen;
- destino;
- handoff;
- estado.

Una relación inválida produce `DENY`.

---

#### 50. Colecciones

Para `COLLECTION`:

- cada miembro debe pertenecer al contexto permitido;
- el conjunto se construye en servidor;
- los IDs se evalúan contra el mismo permiso;
- un miembro no autorizado se excluye en lecturas;
- una colección no puede incluir miembros ocultos y filtrar después;
- el conteo y la paginación conservan el contexto.

La decisión de una colección autorizada no concede mutaciones sobre todos sus miembros.

---

#### 51. Agregados

Para `AGGREGATE`:

- cada dato contribuyente debe estar autorizado;
- no se incluyen territorios fuera del contexto;
- no se revelan datos por inferencia;
- el resultado conserva el alcance exacto;
- un agregado multisede requiere capacidad transversal explícita o carril base compatible.

Un turno en una sede no genera un agregado operativo sobre todas las sedes.

---

#### 52. Operaciones masivas

Para `BULK`:

```text
permiso ordinario
≠
permiso masivo
```

La evaluación seguirá la política declarada:

| Política               | Regla                                                                            |
| ---------------------- | -------------------------------------------------------------------------------- |
| `ALL_OR_NOTHING`       | Todos los miembros deben producir allow operativo cuando el carril sea requerido |
| `PARTIAL_WITH_RESULTS` | Cada miembro obtiene una decisión operativa independiente                        |

No se resumirá una operación parcialmente denegada como allow total.

---

#### 53. Campos protegidos

El allow del carril operativo no concede automáticamente todos los campos.

La decisión deberá respetar:

```text
resource.field_classification
requested_fields
field_policy_decision
```

Una lectura parcial puede conservar `operational_decision.outcome = ALLOW` sobre la proyección autorizada.

Una mutación con un campo bloqueado produce `DENY` o requiere separación explícita.

---

#### 54. Concurrencia

Para una operación que exige concurrencia deberá cumplirse antes de ejecutar:

```text
resource.concurrency.validated = true
```

El carril operativo puede demostrar autoridad contextual, pero una concurrencia fallida impide la ejecución.

`AUTH-CTX-023` consolidará el bloqueo final.

---

#### 55. Dispositivo compartido

Un dispositivo compartido no produce allow operativo.

Cuando el contexto procede de un terminal compartido deberá existir:

- dispositivo autenticado;
- instancia activa;
- sesión de actor activa;
- actor humano efectivo;
- sesión no expirada;
- aplicación admitida;
- sede compatible;
- área compatible;
- política de actor satisfecha.

La sesión del dispositivo:

- no es check-in laboral;
- no crea turno;
- no crea rol operativo;
- no crea sede;
- no crea área;
- no transfiere autoridad entre trabajadores.

---

#### 56. Paquete de capacidades del dispositivo

La lista o paquete del dispositivo actúa como techo restrictivo.

```text
OPERATIONAL AUTHORITY
∩
DEVICE CAPABILITY PACKAGE
```

Nunca:

```text
OPERATIONAL AUTHORITY
∪
DEVICE CAPABILITY PACKAGE
```

Si el permiso no está permitido por el paquete:

- el grant operativo puede continuar registrado como evidencia;
- `device_decision` produce bloqueo;
- `final_decision` será `DENY`;
- el dispositivo no recibe el grant.

---

#### 57. Incoherencia territorial del dispositivo

Cuando un dispositivo compartido declara una sede o área incompatible con el actor, turno o recurso:

```text
readiness = INVALID
outcome = DENY
reason_codes incluye OPERATIONAL_DEVICE_CONTEXT_MISMATCH
```

No se utilizará el territorio del dispositivo para corregir el turno.

---

#### 58. Carril base separado

El carril operativo no utiliza:

- `base-role-grants`;
- concesiones individuales base;
- rol base;
- cobertura administrativa;
- scopes base;
- asignaciones administrativas como sustituto del turno.

En `BASE_OR_OPERATIONAL`:

```text
base_decision
y
operational_decision
se evalúan independientemente
```

En `BASE_AND_OPERATIONAL`:

```text
ambos deben producir ALLOW
```

---

#### 59. Actor-wide deny

Un actor-wide deny aplicable a la clave exacta bloquea el carril operativo aunque existan múltiples allows.

Regla:

```text
ACTOR_WIDE_DENY
>
OPERATIONAL ALLOW
```

`AUTH-CTX-022` definirá y poblará la evidencia.

---

#### 60. Operational lane deny

Una denegación del carril operativo bloquea únicamente el carril operativo cuando coincide.

En `BASE_OR_OPERATIONAL`:

```text
operational deny
→ operational_decision = DENY
→ base puede continuar
```

En `BASE_AND_OPERATIONAL`:

```text
operational deny
→ operational_decision = DENY
→ final_decision = DENY
```

Una concesión más específica no vence la denegación aplicable.

---

#### 61. Structural deny

Un problema estructural aplicable puede bloquear solo el carril operativo o ambos carriles.

Ejemplos:

- actor laboral inválido;
- empleado inactivo;
- turno ambiguo;
- turno obsoleto;
- check-in contradictorio;
- rol operativo desconocido;
- rol inactivo;
- sede incompatible;
- área incompatible;
- dispositivo con sesión inválida;
- recurso no resoluble;
- contrato incompatible;
- dataset incompatible.

Un structural deny no es una fila administrable de overrides.

---

#### 62. Default deny

Si el carril es aplicable y no existe deny, pero tampoco existe un allow operativo completo:

```text
outcome = DENY
reason_codes incluye OPERATIONAL_NO_MATCHING_ALLOW
```

No se materializa una denegación explícita.

No se inventa un grant.

Una matriz incompleta no autoriza mediante fallback base.

---

#### 63. Varios allows coincidentes

Pueden coincidir varios allows de rol o individuales.

Reglas:

- uno solo completo es suficiente para `operational_decision = ALLOW`;
- los grants no se suman para crear un alcance no declarado;
- un grant incompleto no completa otro salvo composición explícita;
- se registran todos los allows realmente coincidentes;
- los IDs se deduplican;
- el orden es determinista;
- un deny aplicable prevalece;
- un grant no extiende el turno;
- un grant no amplía territorio.

---

#### 64. matched_allow_ids

Solo incluye grants operativos que:

- pertenecen al rol o actor exacto;
- usan la clave exacta;
- son compatibles con la modalidad;
- están vigentes;
- coinciden con turno y prerrequisitos;
- coinciden territorialmente;
- coinciden con el recurso;
- cumplen estado y condiciones;
- pueden contribuir al carril.

No incluye:

- candidatos descartados;
- grants base;
- grants inactivos;
- grants fuera de contexto;
- grants legacy;
- grants incompatibles;
- paquete de dispositivo;
- turno;
- check-in.

`AUTH-CTX-021` definirá el objeto completo `MatchedGrant`.

---

#### 65. matched_deny_ids

Incluye únicamente IDs de denegaciones administrables que bloquean el carril operativo:

- actor-wide deny;
- operational lane deny.

No incluye:

- structural issues sin `deny_id`;
- `default deny`;
- falta de allow;
- códigos de razón sin registro administrable;
- bloqueos del dispositivo sin deny administrable.

`AUTH-CTX-022` definirá el objeto completo `MatchedDeny`.

---

#### 66. reason_codes

Códigos iniciales reservados para `operational_decision`:

```text
OPERATIONAL_LANE_NOT_REQUIRED
OPERATIONAL_CONTEXT_NOT_APPLICABLE
OPERATIONAL_CONTEXT_UNAVAILABLE
OPERATIONAL_CONTEXT_INVALID
OPERATIONAL_EMPLOYEE_INACTIVE
OPERATIONAL_SHIFT_UNAVAILABLE
OPERATIONAL_SHIFT_INVALID
OPERATIONAL_SHIFT_EXPIRED
OPERATIONAL_SHIFT_CANCELLED
OPERATIONAL_CHECKIN_REQUIRED
OPERATIONAL_CHECKIN_MISMATCH
OPERATIONAL_CHECKIN_INVALID
OPERATIONAL_ROLE_NOT_AVAILABLE
OPERATIONAL_ROLE_INVALID
OPERATIONAL_ROLE_SITE_MISMATCH
OPERATIONAL_ROLE_AREA_MISMATCH
OPERATIONAL_SITE_UNAVAILABLE
OPERATIONAL_SITE_MISMATCH
OPERATIONAL_AREA_REQUIRED
OPERATIONAL_AREA_MISMATCH
OPERATIONAL_RESOURCE_UNRESOLVED
OPERATIONAL_RESOURCE_CONFLICT
OPERATIONAL_RESOURCE_ISOLATED
OPERATIONAL_RESOURCE_STATE_MISMATCH
OPERATIONAL_REQUIRED_SIDE_NOT_COVERED
OPERATIONAL_RELATIONSHIP_NOT_MATCHED
OPERATIONAL_FIELD_POLICY_FAILED
OPERATIONAL_CONCURRENCY_FAILED
OPERATIONAL_DEVICE_CONTEXT_MISMATCH
OPERATIONAL_ACTOR_WIDE_DENY
OPERATIONAL_LANE_DENY
OPERATIONAL_NO_MATCHING_ALLOW
OPERATIONAL_ALLOW_MATCHED
OPERATIONAL_COMPONENT_MATCHED
OPERATIONAL_DATASET_VERSION_MISMATCH
OPERATIONAL_GRANT_CONFIGURATION_INVALID
OPERATIONAL_INCOMPATIBLE_GRANT
```

`AUTH-CTX-023` decidirá cuáles se exponen al cliente y su prioridad.

---

#### 67. Truth table principal

| Condición                                     | Resultado del carril operativo                              |
| --------------------------------------------- | ----------------------------------------------------------- |
| Modalidad `BASE_ONLY`                         | `NOT_APPLICABLE`                                            |
| Contexto operativo `INVALID`                  | `DENY`                                                      |
| Contexto operativo `UNAVAILABLE`              | `DENY`                                                      |
| Turno ausente                                 | `DENY`                                                      |
| Turno vencido o cancelado                     | `DENY`                                                      |
| `T+C` sin check-in                            | `DENY`                                                      |
| Check-in incompatible                         | `DENY`                                                      |
| Rol operativo inválido                        | `DENY`                                                      |
| Sede o área incompatible                      | `DENY`                                                      |
| Recurso `UNRESOLVED`, `CONFLICT` o `ISOLATED` | `DENY`                                                      |
| `actor-wide deny` coincidente                 | `DENY`                                                      |
| `operational lane deny` coincidente           | `DENY`                                                      |
| Sin allow operativo completo                  | `DENY`                                                      |
| Allow operativo completo sin deny             | `ALLOW`                                                     |
| `OPERATIONAL_COMPONENT` completo              | `ALLOW` del carril; no de la decisión final                 |
| Restricción global fallida                    | El carril conserva evidencia; la decisión final será `DENY` |

---

#### 68. Restricciones globales y outcome del carril

`operational_decision` expresa la autoridad producida por el carril operativo.

Las decisiones separadas:

- `device_decision`;
- `sensitivity_decision`;
- `field_policy_decision`;
- `prerequisite_decisions`;

no se convierten en grants operativos.

Cuando una restricción global falla después de que el carril haya demostrado autoridad:

```text
operational_decision puede conservar ALLOW
final_decision = DENY
```

Sin embargo, cuando la incompatibilidad invalida el propio contexto operativo —por ejemplo, sesión de actor de dispositivo incoherente, turno incompatible o área contradictoria— el carril produce `DENY`.

---

#### 69. Dependencias

Una dependencia de permiso se evalúa mediante una decisión separada.

Reglas:

- no se infiere por módulo;
- no se infiere desde `app.access`;
- cada dependencia conserva su modalidad;
- una dependencia fallida bloquea la solicitud principal cuando el contrato la declara obligatoria;
- aprobar la dependencia no crea el grant principal;
- la evidencia no se incluye como `matched_allow_ids` del permiso principal;
- una dependencia operativa exige su propio contexto compatible.

---

#### 70. Simulación

La simulación puede calcular un `operational_decision` hipotético.

Reglas:

- utiliza el mismo algoritmo;
- declara contexto simulado;
- no crea turno real;
- no crea check-in real;
- no crea sesión de dispositivo;
- no modifica el contexto real;
- no ejecuta mutaciones;
- no crea grants;
- no elimina denies;
- no convierte `WOULD_ALLOW` en `ALLOW`;
- el actor real conserva la autorización para iniciar y consultar la simulación.

---

#### 71. Procesos de sistema

Un proceso `SYSTEM` autónomo no utiliza el carril operativo laboral.

No se convertirá:

- service role;
- API key;
- cron;
- Edge Function;
- webhook;
- cola;
- worker;

en empleado, turno, check-in o rol operativo.

Los procesos delegados conservan al actor humano cuando existe delegación válida.

Las automatizaciones sin actor deberán utilizar contratos de sistema separados, definidos y autorizados explícitamente.

---

#### 72. Inmutabilidad y snapshot

`operational_decision` queda asociado a:

- actor;
- empleado;
- turno;
- check-in cuando aplica;
- rol operativo;
- sede;
- área;
- permiso;
- recurso;
- lados;
- estado;
- datasets;
- grants;
- denies;
- dispositivo;
- instante.

Un cambio en cualquiera de estos hechos obliga a una nueva decisión.

Una decisión emitida no se modifica.

---

#### 73. Orden determinista

La serialización deberá:

- ordenar `matched_allow_ids` alfabéticamente;
- ordenar `matched_deny_ids` alfabéticamente;
- eliminar duplicados;
- ordenar `reason_codes` por prioridad y luego alfabéticamente;
- conservar el mismo resultado para el mismo snapshot;
- no depender del orden físico de filas;
- no elegir el primer grant;
- no elegir el grant más amplio;
- no elegir el grant más permisivo;
- no elegir el primer turno;
- no elegir la primera área;
- conservar conflictos en vez de resolverlos arbitrariamente.

---

#### 74. Casos de ejemplo

##### Caso A — Permiso OPERATIONAL_ONLY con T+C

```text
permission = nexo.inventory.remissions.prepare
requirement = OPERATIONAL_ONLY
prerequisite = T+C
turno vigente = sí
check-in compatible = sí
operational_role = bodeguero
recurso.origin = CENTRO_PRODUCCION
operational_site = CENTRO_PRODUCCION
grant exacto = sí
```

Resultado:

```text
operational_decision.outcome = ALLOW
base_decision = NOT_APPLICABLE
```

##### Caso B — BASE_ONLY

```text
permission = viso.workforce.employees.view
requirement = BASE_ONLY
```

Resultado:

```text
operational_decision = NOT_APPLICABLE
```

##### Caso C — T sin check-in

```text
permission operativo de entrada
prerequisite = T
turno vigente = sí
check-in = null
```

Resultado posible:

```text
operational_decision = ALLOW
```

si rol, grant, territorio, recurso y denies son compatibles.

##### Caso D — T+C sin check-in

```text
prerequisite = T+C
turno vigente = sí
check-in = null
```

Resultado:

```text
DENY
OPERATIONAL_CHECKIN_REQUIRED
```

##### Caso E — Propietario sin turno

```text
base_role = propietario
requirement = OPERATIONAL_ONLY
active_shift = null
```

Resultado:

```text
operational_decision = DENY
OPERATIONAL_SHIFT_UNAVAILABLE
```

##### Caso F — Rol operativo sin grant

```text
operational_role = servicio_salon
contexto válido
sin grant exacto
```

Resultado:

```text
DENY
OPERATIONAL_NO_MATCHING_ALLOW
```

##### Caso G — Rol habilitado en otra área

```text
turno.area = COCINA
rol habilitado únicamente en BARRA
```

Resultado:

```text
DENY
OPERATIONAL_ROLE_AREA_MISMATCH
```

##### Caso H — Remisión con lado incorrecto

```text
turno = CENTRO_PRODUCCION
acción = receive
resource.destination = VENTO_CAFE
```

Resultado:

```text
DENY
OPERATIONAL_REQUIRED_SIDE_NOT_COVERED
```

salvo que el contrato exacto declare otra autoridad compatible.

##### Caso I — BASE_AND_OPERATIONAL

```text
base component = ALLOW
operational component = ALLOW
```

Resultado del carril:

```text
operational_decision = ALLOW
```

La decisión final será resuelta por `AUTH-CTX-023`.

##### Caso J — Dispositivo restringido

```text
actor posee allow operativo
permiso no incluido en capability_package
```

Resultado:

```text
operational_decision puede conservar ALLOW
device_decision = DENY
final_decision = DENY
```

##### Caso K — Check-in de otro turno

```text
active_shift = S2
active_checkin_session.shift_id = S1
```

Resultado:

```text
DENY
OPERATIONAL_CHECKIN_MISMATCH
```

##### Caso L — Recurso de otra sede

```text
operational_site = SAUDO
resource.site = VENTO_CAFE
contrato exige coincidencia de sede
```

Resultado:

```text
DENY
OPERATIONAL_SITE_MISMATCH
```

##### Caso M — Grant individual sin contexto

```text
individual operational grant vigente
active_shift = null
```

Resultado:

```text
DENY
```

El override no crea contexto.

##### Caso N — Turno terminado

```text
decisión previa = ALLOW
resolved_at actual >= shift.ends_at
```

Resultado:

```text
nueva evaluación obligatoria
operational_decision = DENY
```

---

#### 75. Antipatrones prohibidos

```ts
if (employee.role === "propietario") {
  return true;
}
```

```ts
if (activeShift) {
  return true;
}
```

```ts
if (activeCheckin) {
  return true;
}
```

```ts
if (operationalRole === "gerencia_operativa") {
  return true;
}
```

```ts
const siteId =
  selectedSiteId ??
  deviceSiteId ??
  employee.site_id;
```

```ts
const role =
  shift.operational_role ??
  profile.default_operational_role ??
  device.navigation_role;
```

```ts
const allowed =
  operationalGrants.some((grant) =>
    permission.startsWith(grant.permission_key)
  );
```

También queda prohibido:

```text
turno → todos los permisos
check-in → todos los permisos
rol operativo → todas las sedes
rol base → sustituir operación
sede seleccionada → sede operativa
dispositivo → fuente de territorio
navigation_role → autoridad
perfil predeterminado → rol vigente
grant con null → global
área null → todas las áreas
allow más específico → vencer deny
varios allows incompletos → construir uno nuevo
OPERATIONAL_COMPONENT → final allow
sesión de dispositivo → check-in
decisión antigua → ejecutar después del turno
```

---

#### 76. Relación con tareas posteriores

| Tarea                           | Responsabilidad posterior                                                                                                                                                                          |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTH-CTX-021`                  | Definir y serializar `MatchedGrant`, incluyendo los grants operativos realmente coincidentes                                                                                                       |
| `AUTH-CTX-022`                  | Definir structural denies, actor-wide denies, base lane denies, operational lane denies y evidencia coincidente                                                                                    |
| `AUTH-CTX-023`                  | Combinar base, operación, modalidad, restricciones, dependencias, campos, denies, default deny y decisión final                                                                                    |
| `AUTH-CTX-024`                  | Registrar evidencia auditable de turno, check-in, rol, grant, override, recurso, territorio, razones, datasets, hash y outcome                                                                     |
| `AUTH-CTX-025`                  | Diseñar `get_access_context`, incluyendo los hechos operativos necesarios                                                                                                                          |
| `AUTH-CTX-026`                  | Diseñar `evaluate_authorization`, consulta de datasets, comparación contextual, frontera transaccional y `LaneDecision`                                                                            |
| `AUTH-CTX-027`                  | Eliminar evaluaciones locales y fallbacks de operación en aplicaciones                                                                                                                             |
| `AUTH-CTX-028`                  | Diseñar compatibilidad con `get_operational_context`, `has_operational_permission`, roles legacy, perfiles, `navigation_role`, `propietario_admin`, `bodeguero` duplicado y consumidores booleanos |
| `AUTH-CTX-029`                  | Definir caché e invalidación por cambios de turno, check-in, rol, habilitación, grant, deny, recurso, dispositivo, dataset y catálogo                                                              |
| `AUTH-CTX-030`                  | Definir pruebas contractuales de modalidad, T, T+C, rol, sede, área, recurso, lados, dispositivo, denies, concurrencia y aislamiento                                                               |
| `AUTH-DB-006` a `AUTH-DB-010`   | Implementar validación canónica del contexto, permiso, recurso, actor y territorio dentro de RPC sensibles                                                                                         |
| `AUTH-DB-011`                   | Aplicar constraints después de inventario, backfill y reconciliación                                                                                                                               |
| `AUTH-DB-020`                   | Migrar matrices y consumidores legacy con compatibilidad temporal                                                                                                                                  |
| `AUTH-DB-027`                   | Probar matriz operativa, overrides, RLS, RPC, contexto, recursos y migraciones                                                                                                                     |
| `AUTH-DB-030`                   | Retirar funciones y rutas legacy después de adopción comprobada                                                                                                                                    |
| `AUTH-DB-031`                   | Certificar paridad documental, técnica y operativa                                                                                                                                                 |
| `AUTH-DEV-001` a `AUTH-DEV-016` | Materializar sesiones, políticas y consumo de dispositivos compartidos                                                                                                                             |
| `GAP-CTRL-001`                  | Consolidar retrospectivamente brechas operativas detectadas y no resueltas en implementación                                                                                                       |
| `GAP-CTRL-006`                  | Vincular cada brecha con tarea y paquete de implementación concreto                                                                                                                                |

---

#### 77. Fuera del alcance

AUTH-CTX-020 no:

- modifica la matriz operativa;
- modifica sus 240 registros;
- modifica su hash;
- agrega roles operativos;
- elimina roles operativos;
- crea turnos;
- crea check-ins;
- crea sesiones de dispositivo;
- crea grants;
- crea overrides;
- crea denegaciones;
- define objetos completos de matched allows;
- define objetos completos de matched denies;
- produce la combinación final;
- modifica contratos de recurso;
- reclasifica permisos;
- cambia `T` o `T+C`;
- cambia requisitos de área;
- implementa campos protegidos;
- implementa MFA;
- crea tipos físicos;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 76.

---

#### 78. Riesgos controlados

| Riesgo                                               | Control canónico                                                         |
| ---------------------------------------------------- | ------------------------------------------------------------------------ |
| Turno funciona como permiso                          | Turno + rol + grant exacto + recurso exacto                              |
| Check-in concede autoridad                           | Check-in solo satisface `T+C`                                            |
| Propietario opera sin contexto                       | El carril operativo exige turno y rol reales                             |
| Rol operativo funciona como superusuario             | No existe bypass por nombre de rol                                       |
| Grant sin territorio se interpreta como global       | Todo grant operativo queda limitado por contexto y recurso               |
| Perfil predeterminado reemplaza el turno             | El perfil solo ayuda a planificar                                        |
| Dispositivo concede capacidad                        | Paquete de dispositivo solo restringe                                    |
| Sede seleccionada reemplaza la sede del turno        | La sede operativa procede del turno                                      |
| Área nula equivale a todas                           | `null` nunca es wildcard                                                 |
| Componente operativo ejecuta acción doble            | `OPERATIONAL_COMPONENT` autoriza el carril; la decisión final exige base |
| Turno terminado conserva autoridad                   | Toda ejecución requiere revalidación                                     |
| Un lado de la remisión autoriza el otro              | Cada lado obligatorio se evalúa por contrato                             |
| Matriz operativa incompleta se compensa con rol base | No existe fallback entre carriles                                        |
| Sesión de dispositivo se trata como check-in         | Las dos sesiones permanecen separadas                                    |
| Servicio técnico se convierte en trabajador          | Procesos de sistema usan contrato separado                               |

---

#### 79. Criterios de aprobación

AUTH-CTX-020 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `LaneDecision`;
2. `operational_decision.lane` siempre es `OPERATIONAL`;
3. `BASE_ONLY` produce `NOT_APPLICABLE`;
4. `evaluated = false` solo para carril no aplicable;
5. las demás modalidades evalúan operación;
6. readiness procede del `AccessContext`;
7. el evaluador no mejora readiness;
8. `READY` no significa allow;
9. un actor laboral exacto es obligatorio;
10. empleado inactivo no posee autoridad operativa;
11. el turno publicado y vigente es obligatorio;
12. el turno debe pertenecer al actor;
13. un turno futuro no autoriza;
14. un turno vencido no autoriza;
15. un turno cancelado no autoriza;
16. un turno ambiguo falla cerrado;
17. el check-in no crea turno;
18. `T` exige turno;
19. `T` no exige check-in;
20. un check-in incompatible bloquea incluso en permisos `T`;
21. `T+C` exige turno y check-in;
22. no existe `C` sin turno;
23. el check-in debe coincidir con el turno;
24. el check-in debe pertenecer al actor;
25. una sesión offline no confirmada no autoriza;
26. el cierre del check-in revoca capacidades `T+C`;
27. el fin del turno revoca el carril operativo;
28. un rol operativo canónico es obligatorio;
29. el rol procede exclusivamente del turno;
30. el rol base no sustituye el rol operativo;
31. el perfil predeterminado no sustituye el rol;
32. `navigation_role` no sustituye el rol;
33. el dispositivo no sustituye el rol;
34. existen doce roles operativos canónicos;
35. `propietario_admin` no participa en el dataset canónico;
36. `gerencia_operativa` no es bypass;
37. `operador_integral_satelite` no es superusuario;
38. propietario requiere contexto real para el carril operativo;
39. gerente general requiere contexto real para el carril operativo;
40. la habilitación del rol por sede es obligatoria;
41. la habilitación del rol por área se respeta;
42. la sede operativa procede del turno;
43. la sede seleccionada no participa como fuente;
44. la sede primaria no participa como fallback;
45. el área operativa procede del turno;
46. el dispositivo no crea área;
47. `REQUIRED` exige área;
48. `SITE_SUFFICIENT` no significa todas las áreas;
49. una restricción del rol puede exigir área;
50. `null` nunca significa wildcard;
51. el contexto operativo no sustituye territorio del recurso;
52. el recurso se resuelve antes de evaluar;
53. el territorio debe ser coherente;
54. los lados obligatorios proceden del contrato;
55. origen no autoriza destino;
56. destino no autoriza origen;
57. un turno no autoriza múltiples sedes automáticamente;
58. los grants operativos no son cross-site;
59. solo `OPERATIONAL_ROLE` e `INDIVIDUAL_OPERATIONAL` producen candidatos;
60. el dataset operativo es `@1.0.0`;
61. contiene 240 registros;
62. contiene doce roles;
63. contiene 218 concesiones directas;
64. contiene 22 componentes operativos;
65. no contiene permisos `BASE_ONLY`;
66. no contiene claves legacy;
67. no contiene wildcards;
68. su hash permanece congelado;
69. un grant directo puede autorizar el carril;
70. un componente operativo solo autoriza su carril;
71. un componente operativo no autoriza la acción final;
72. un override no crea contexto;
73. un override no cambia `T+C`;
74. la clave debe coincidir exactamente;
75. la modalidad debe admitir operación;
76. el grant debe estar vigente;
77. el estado del recurso participa;
78. propiedad y custodia proceden del contrato;
79. colecciones se limitan en servidor;
80. agregados excluyen miembros fuera de contexto;
81. operaciones masivas requieren contrato;
82. campos protegidos permanecen separados;
83. concurrencia permanece obligatoria cuando aplica;
84. el dispositivo solo restringe;
85. la sesión de dispositivo no es check-in;
86. el paquete de dispositivo no es RBAC allow;
87. la incoherencia del dispositivo puede invalidar contexto;
88. el carril base permanece separado;
89. actor-wide deny prevalece;
90. operational lane deny prevalece en operación;
91. structural deny puede bloquear el carril;
92. ausencia de allow produce default deny;
93. varios allows no crean alcance nuevo;
94. `matched_allow_ids` solo contiene grants realmente coincidentes;
95. `matched_deny_ids` excluye default deny;
96. `reason_codes` queda normalizado;
97. restricciones globales pueden negar la decisión final sin reescribir evidencia válida del carril;
98. dependencias no crean grants;
99. simulación no ejecuta autoridad;
100. procesos de sistema no inventan contexto laboral;
101. la decisión es inmutable;
102. el orden es determinista;
103. `AUTH-CTX-021` definirá allows coincidentes;
104. `AUTH-CTX-022` definirá denies;
105. `AUTH-CTX-023` definirá decisión final;
106. `AUTH-CTX-024` definirá auditoría;
107. `AUTH-CTX-026` diseñará el evaluador;
108. `AUTH-CTX-027` eliminará lógica local;
109. `AUTH-CTX-028` gobernará compatibilidad legacy;
110. `AUTH-CTX-029` gobernará invalidación;
111. `AUTH-CTX-030` gobernará pruebas;
112. las tareas físicas tienen destinos explícitos;
113. no se implementa código, migraciones ni cambios en Supabase.

---

#### 80. Cierre y continuidad de la propuesta

| Relación        | Tarea          | Estado        |
| --------------- | -------------- | ------------- |
| Tarea anterior  | `AUTH-CTX-019` | ✅ APROBADA    |
| Tarea propuesta | `AUTH-CTX-020` | ✅ APROBADA    |
| Tarea siguiente | `AUTH-CTX-021` | ⬜ NO INICIADA |

```text
AUTH-CTX-019 — APROBADA
        ↓
AUTH-CTX-020 — APROBADA
        ↓
AUTH-CTX-021 — NO INICIADA
```

No se avanza a `AUTH-CTX-021` hasta recibir aprobación explícita de `AUTH-CTX-020`.

### ✅ AUTH-CTX-021 — Incluir allows coincidentes

| Campo                          | Valor                                                                                             |
| ------------------------------ | ------------------------------------------------------------------------------------------------- |
| **Estado**                     | APROBADA                                                                                          |
| **Bloque**                     | BLOQUE E — Contexto y decisión de autorización unificados                                         |
| **Subbloque**                  | `AUTHORIZATION DECISION`                                                                          |
| **Naturaleza**                 | Definición documental de `matched_allows` y `MatchedGrant` dentro de `AuthorizationDecision`      |
| **Implementación física**      | No incluida                                                                                       |
| **Tarea anterior vigente**     | `AUTH-CTX-020` — APROBADA                                                                         |
| **Tarea posterior reservada**  | `AUTH-CTX-022` — Incluir denegaciones coincidentes                                                |
| **Contrato afectado**          | `AuthorizationDecision@1.0.0`                                                                     |
| **Campo principal afectado**   | `matched_allows`                                                                                  |
| **Tipo principal afectado**    | `MatchedGrant`                                                                                    |
| **Datasets de grants**         | `vento.authorization.base-role-grants@1.0.0`, `vento.authorization.operational-role-grants@1.0.0` |
| **Dataset de overrides**       | `vento.authorization.individual-overrides@1.0.0`                                                  |
| **Catálogo**                   | `vento.authorization@1.0.0`                                                                       |
| **Cambio contractual**         | Aclaración normativa compatible; no cambia la forma publicada                                     |
| **Cambios físicos permitidos** | No                                                                                                |

Esta tarea define cuándo una concesión candidata se convierte en un allow
realmente coincidente y cómo se registra dentro de:

```ts
AuthorizationDecision.matched_allows: MatchedGrant[];
```

La regla central es:

```text
GRANT ALMACENADO
≠
GRANT COINCIDENTE
```

```text
GRANT COINCIDENTE
=
FUENTE CANÓNICA VÁLIDA
∩
SUJETO EXACTO
∩
PERMISO EXACTO
∩
CARRIL COMPATIBLE
∩
MODALIDAD COMPATIBLE
∩
VIGENCIA ACTIVA
∩
ALCANCE COMPLETO
∩
TERRITORIO COINCIDENTE
∩
RECURSO COINCIDENTE
∩
CONDICIONES DEL GRANT SATISFECHAS
```

Un allow coincidente:

- demuestra que una concesión canónica concreta puede contribuir a un carril;
- no elimina denegaciones;
- no decide por sí solo la autorización final;
- no amplía el permiso;
- no amplía el territorio;
- no crea recurso;
- no crea turno;
- no crea check-in;
- no crea rol;
- no crea relación de propiedad;
- no crea una capacidad para el dispositivo;
- no se reutiliza para otra solicitud.

No implementa SQL, RPC, RLS, funciones, migraciones, índices, caché,
adaptadores, guards ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir `matched_allows` de manera que Vento OS pueda responder
inequívocamente:

1. qué concesiones fueron candidatas;
2. cuáles cumplieron todas las condiciones;
3. cuáles pueden contribuir al carril base;
4. cuáles pueden contribuir al carril operativo;
5. qué fuente produjo cada allow;
6. qué sujeto originó la concesión;
7. qué permiso exacto fue evaluado;
8. qué alcance canónico se utilizó;
9. si el territorio coincidió;
10. si el recurso coincidió;
11. si la concesión estaba vigente;
12. qué dataset y versión se consultaron;
13. cómo se representan grants directos;
14. cómo se representan componentes de `BASE_AND_OPERATIONAL`;
15. cómo se representan overrides individuales;
16. cómo se conservan múltiples allows coincidentes;
17. cómo se evita combinar grants incompletos;
18. cómo se deduplican resultados;
19. cómo se relacionan con `matched_allow_ids`;
20. cómo se preserva la evidencia cuando un deny termina prevaleciendo;
21. cómo se evita revelar matrices completas al cliente;
22. cómo se preservan determinismo, inmutabilidad y auditoría.

---

#### 2. Base normativa

AUTH-CTX-021 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — Actor efectivo;
- `AUTH-MOD-002` — Separación entre rol base y rol operativo;
- `AUTH-MOD-013` a `AUTH-MOD-017` — Alcances;
- `AUTH-MOD-018` — Combinación de carriles;
- `AUTH-MOD-019` — Denegación explícita;
- `AUTH-CAT-001` a `AUTH-CAT-024` — Catálogo canónico;
- `AUTH-RBAC-001` a `AUTH-RBAC-021` — Matrices y concesiones;
- `AUTH-RBAC-022` — Denegaciones individuales y transversales;
- `AUTH-RBAC-024` — Dataset canónico de matriz base;
- `AUTH-RBAC-025` — Dataset canónico de matriz operativa;
- `AUTH-RBAC-026` — Dataset canónico de overrides;
- `AUTH-RBAC-027` — Ausencia de acceso operativo global accidental;
- `AUTH-CTX-001` a `AUTH-CTX-015` — `AccessContext`;
- `AUTH-CTX-016` — Aplicación y permiso exactos;
- `AUTH-CTX-017` — Modalidad y prerrequisitos;
- `AUTH-CTX-018` — Recurso y territorio resueltos;
- `AUTH-CTX-019` — Decisión del carril base;
- `AUTH-CTX-020` — Decisión del carril operativo.

Principios obligatorios:

```text
EXISTIR EN UNA MATRIZ
≠
COINCIDIR
```

```text
ALLOW
≠
DECISIÓN FINAL
```

```text
ALLOW INDIVIDUAL
≠
BYPASS
```

```text
MÁS ALLOWS
≠
MÁS ALCANCE
```

```text
ALLOW EN UN CARRIL
≠
ALLOW EN EL OTRO
```

```text
ALLOW
<
DENY APLICABLE
```

---

#### 3. Forma contractual conservada

```ts
type MatchedGrant = {
  grant_id: string;
  lane: "BASE" | "OPERATIONAL";
  source_kind:
    | "BASE_ROLE"
    | "OPERATIONAL_ROLE"
    | "INDIVIDUAL_BASE"
    | "INDIVIDUAL_OPERATIONAL";

  source_subject_id: string;
  permission_key: string;
  effect: "ALLOW";
  scope_code: string;
  matched_territory: boolean;
  matched_resource: boolean;
  validity_status: "ACTIVE";
  source_dataset_id: string;
  source_dataset_version: string;
};
```

La colección se conserva como:

```ts
matched_allows: MatchedGrant[];
```

No se agregan, eliminan ni renombran campos.

Las precisiones de esta tarea son semánticas y compatibles con
`AuthorizationDecision@1.0.0`.

---

#### 4. Invariantes de MatchedGrant

Todo objeto serializado en `matched_allows` deberá cumplir:

```text
effect = ALLOW
validity_status = ACTIVE
matched_territory = true
matched_resource = true
permission_key = permiso solicitado exacto
```

Además:

- `grant_id` deberá ser resoluble;
- `lane` deberá ser compatible con `source_kind`;
- `source_subject_id` deberá coincidir con el actor o rol efectivo;
- `scope_code` deberá ser canónico;
- el dataset deberá estar reconocido;
- la versión deberá estar vigente para la decisión;
- el grant deberá haber sido realmente evaluado.

Si alguna condición es falsa, el candidato no se serializa como
`MatchedGrant`.

---

#### 5. Candidato frente a allow coincidente

El evaluador podrá manejar internamente candidatos descartados.

Ejemplos:

- grant de otro rol;
- grant de otro empleado;
- clave distinta;
- carril incompatible;
- modalidad incompatible;
- grant futuro;
- grant expirado;
- scope insuficiente;
- territorio distinto;
- recurso distinto;
- condición empresarial incumplida;
- dataset incompatible.

Estos candidatos:

- no aparecen en `matched_allows`;
- no aparecen en `matched_allow_ids`;
- no se convierten en denegaciones;
- pueden producir diagnóstico interno o auditoría de configuración;
- no se exponen al cliente.

`matched_allows` contiene exclusivamente coincidencias completas.

---

#### 6. Secuencia canónica de resolución

La resolución deberá seguir, conceptualmente, este orden:

```text
1. permiso canónico exacto
2. modalidad y carriles requeridos
3. snapshot de datasets compatibles
4. candidatos por permission_key
5. fuente y sujeto
6. carril
7. vigencia
8. alcance
9. territorio
10. recurso y condiciones
11. inclusión como MatchedGrant
12. deduplicación y orden
13. proyección de matched_allow_ids
```

El orden no autoriza por sí mismo.

Cada etapa reduce candidatos.

Ninguna etapa amplía el conjunto.

---

#### 7. Permiso exacto obligatorio

Todo grant coincidente deberá cumplir:

```text
grant.permission_key
=
AuthorizationDecision.request.permission_key
```

La comparación es exacta y sensible a la forma canónica publicada.

No se admiten:

- prefijos;
- wildcards;
- sufijos;
- claves relativas;
- nombres de aplicación;
- nombres humanos;
- nombres de rutas;
- aliases sin adaptar;
- similitud semántica;
- permiso padre;
- permiso hijo;
- fallback a `<app>.access`.

Un grant de `app.access` solo coincide con `app.access`.

---

#### 8. Catálogo y estado del permiso

Antes de resolver allows deberá existir:

- aplicación canónica;
- aplicación activa;
- permiso canónico;
- permiso activo;
- versión compatible;
- modalidad definida;
- contrato de recurso compatible.

Un grant no reactiva:

- una aplicación inactiva;
- un permiso inactivo;
- un permiso retirado;
- una clave inexistente;
- un contrato ausente.

Ante incompatibilidad estructural no se registran allows coincidentes.

---

#### 9. Carriles admitidos

`MatchedGrant.lane` solo admite:

```text
BASE
OPERATIONAL
```

No existe:

```text
BOTH
ALL
GLOBAL
REQUEST
```

Un permiso híbrido se representa mediante grants separados por carril.

Un único `MatchedGrant` nunca ocupa dos carriles.

---

#### 10. Compatibilidad entre lane y source_kind

| `source_kind`            | `lane` obligatorio |
| ------------------------ | ------------------ |
| `BASE_ROLE`              | `BASE`             |
| `INDIVIDUAL_BASE`        | `BASE`             |
| `OPERATIONAL_ROLE`       | `OPERATIONAL`      |
| `INDIVIDUAL_OPERATIONAL` | `OPERATIONAL`      |

Cualquier combinación distinta:

```text
→ configuración inválida
→ candidato descartado
→ no MatchedGrant
```

No se corrige cambiando el carril en tiempo de ejecución.

---

#### 11. Compatibilidad con la modalidad

| Modalidad              | Allows base | Allows operativos |
| ---------------------- | ----------: | ----------------: |
| `BASE_ONLY`            |          Sí |                No |
| `OPERATIONAL_ONLY`     |          No |                Sí |
| `BASE_OR_OPERATIONAL`  |          Sí |                Sí |
| `BASE_AND_OPERATIONAL` |          Sí |                Sí |

Un grant ubicado en un carril incompatible:

- no coincide;
- no se mueve al otro carril;
- no cambia la modalidad;
- no rescata la solicitud;
- se trata como incompatibilidad contractual.

---

#### 12. Lane NOT_APPLICABLE

Cuando un carril es `NOT_APPLICABLE`:

```text
matched_allow_ids = []
```

y no podrá existir en `matched_allows` ningún registro para ese carril.

Ejemplos:

```text
BASE_ONLY
→ cero MatchedGrant OPERATIONAL
```

```text
OPERATIONAL_ONLY
→ cero MatchedGrant BASE
```

---

#### 13. BASE_OR_OPERATIONAL

Para `BASE_OR_OPERATIONAL` pueden existir:

- solo allows base;
- solo allows operativos;
- allows en ambos carriles;
- ningún allow.

Los allows se evalúan independientemente.

La presencia de un allow base:

- no impide evaluar el carril operativo;
- no elimina su evidencia;
- no convierte grants operativos en redundantes.

La combinación final se resolverá en `AUTH-CTX-023`.

---

#### 14. BASE_AND_OPERATIONAL

Para `BASE_AND_OPERATIONAL` se requieren contribuciones separadas:

```text
MatchedGrant BASE compatible
+
MatchedGrant OPERATIONAL compatible
```

Un componente base no completa el componente operativo.

Un componente operativo no completa el componente base.

La unión se realizará únicamente mediante la combinación canónica de
`AUTH-CTX-023`.

---

#### 15. Grants directos y componentes

Los datasets distinguen conceptualmente:

- grants directos;
- componentes base;
- componentes operativos.

`MatchedGrant` no duplica el campo `grant_type`.

La naturaleza directa o de componente se conserva en la fila fuente
identificada por:

```text
source_dataset_id
+
source_dataset_version
+
grant_id
```

Reglas:

- un componente completo para su carril sí puede ser `MatchedGrant`;
- un componente no implica allow final;
- el evaluador no transforma componentes en grants directos;
- la auditoría podrá recuperar la fila fuente exacta;
- una proyección cliente no necesita revelar el tipo interno.

---

#### 16. Fuente BASE_ROLE

Un allow `BASE_ROLE` exige:

- actor laboral válido;
- empleado activo;
- rol base canónico activo;
- coincidencia exacta entre el rol del contexto y el sujeto del grant;
- permiso exacto;
- modalidad compatible;
- alcance y recurso coincidentes;
- vigencia activa.

No coincide un grant de:

- otro rol;
- rol legacy no adaptado;
- nombre de cargo;
- rol operativo;
- rol simulado no autorizado;
- rol enviado por cliente.

---

#### 17. Fuente OPERATIONAL_ROLE

Un allow `OPERATIONAL_ROLE` exige:

- actor laboral válido;
- empleado activo;
- carril operativo aplicable;
- turno válido;
- rol operativo efectivo;
- coincidencia exacta con el rol del grant;
- sede y área compatibles;
- prerrequisitos satisfechos;
- permiso exacto;
- recurso coincidente;
- vigencia activa.

El rol operativo no se obtiene de:

- rol base;
- perfil predeterminado;
- `navigation_role`;
- dispositivo;
- área seleccionada;
- nombre humano.

---

#### 18. Fuente INDIVIDUAL_BASE

Un allow `INDIVIDUAL_BASE` exige:

- empleado exacto;
- override base activo;
- modalidad compatible;
- carril base evaluable;
- contexto base válido;
- permiso exacto;
- alcance permitido por el contrato;
- recurso y territorio coincidentes.

El override no:

- repara empleado inactivo;
- repara rol base inválido;
- cambia la modalidad;
- anula un deny;
- crea cobertura administrativa;
- amplía el permiso.

---

#### 19. Fuente INDIVIDUAL_OPERATIONAL

Un allow `INDIVIDUAL_OPERATIONAL` exige:

- empleado exacto;
- override operativo activo;
- modalidad compatible;
- carril operativo evaluable;
- turno y check-in cuando aplican;
- rol operativo y territorio compatibles;
- permiso exacto;
- recurso coincidente.

El override no:

- crea turno;
- crea check-in;
- crea rol;
- repara sede o área incompatibles;
- reduce `T+C` a `T`;
- anula un deny;
- convierte un permiso base en operativo.

---

#### 20. Semántica de source_subject_id

`source_subject_id` utiliza el identificador canónico de la fuente:

| `source_kind`            | `source_subject_id`               |
| ------------------------ | --------------------------------- |
| `BASE_ROLE`              | Código canónico del rol base      |
| `OPERATIONAL_ROLE`       | Código canónico del rol operativo |
| `INDIVIDUAL_BASE`        | `employee_id` exacto              |
| `INDIVIDUAL_OPERATIONAL` | `employee_id` exacto              |

No se utiliza:

- nombre del rol;
- nombre del trabajador;
- correo;
- documento;
- `auth.uid()` técnico del dispositivo;
- ID de turno;
- ID de check-in;
- ID de dispositivo;
- ID de sesión compartida.

---

#### 21. Coincidencia del sujeto

La coincidencia exige igualdad exacta entre:

```text
source_subject_id
y
sujeto canónico correspondiente del AccessContext
```

No se admite:

- herencia implícita de roles;
- jerarquía de roles;
- equivalencia por familia;
- alias no adaptado;
- coincidencia parcial;
- rol “superior”;
- sustitución por otro trabajador;
- dispositivo como sujeto humano.

---

#### 22. Identidad de grant_id

`grant_id` deberá ser:

- estable;
- canónico;
- no vacío;
- resoluble dentro del snapshot;
- inmutable para la misma concesión;
- globalmente no ambiguo dentro de la familia de datasets de autorización.

No deberá utilizarse como `grant_id`:

- posición de la fila;
- índice de arreglo;
- nombre humano;
- hash temporal no estable;
- clave de React;
- ID físico que cambie durante una migración;
- combinación generada localmente por una aplicación.

Cuando una fuente física legacy utilice otro nombre —por ejemplo,
`override_id`— el adaptador deberá proyectar su identificador estable como
`grant_id` sin alterar su identidad.

---

#### 23. Unicidad global

Dentro de una decisión:

```text
grant_id
→ una única concesión canónica
```

Si dos datasets exponen el mismo `grant_id` para concesiones distintas:

```text
GRANT_ID_COLLISION
→ configuración inválida
→ fail closed
```

No se resolverá utilizando:

- primer dataset;
- dataset más reciente;
- carril base;
- carril operativo;
- fuente “más específica”.

---

#### 24. Dataset de grants base

Para `BASE_ROLE`:

```text
source_dataset_id =
vento.authorization.base-role-grants

source_dataset_version =
1.0.0
```

La decisión deberá consumir el snapshot canónico aprobado.

No utilizará directamente como fuente normativa final:

- `role_permissions`;
- matrices reconstruidas desde frontend;
- permisos cacheados sin versión;
- datos legacy sin adaptar.

---

#### 25. Dataset de grants operativos

Para `OPERATIONAL_ROLE`:

```text
source_dataset_id =
vento.authorization.operational-role-grants

source_dataset_version =
1.0.0
```

La ausencia de dimensiones físicas en una fila operativa no significa
alcance global.

El grant continúa limitado por:

- turno;
- rol;
- sede;
- área;
- recurso;
- lados;
- contrato.

---

#### 26. Dataset de overrides

Para:

- `INDIVIDUAL_BASE`;
- `INDIVIDUAL_OPERATIONAL`;

se utilizará:

```text
source_dataset_id =
vento.authorization.individual-overrides

source_dataset_version =
1.0.0
```

La lane del override deberá estar declarada y ser compatible.

No se infiere desde el permiso, el rol o el contexto.

---

#### 27. Versiones de datasets

Una decisión podrá consultar varios datasets, pero cada dataset deberá
utilizar un único snapshot congelado.

Queda prohibido:

- mezclar dos versiones de la matriz base;
- mezclar dos versiones de la matriz operativa;
- combinar overrides de versiones distintas;
- cambiar de versión durante la evaluación;
- usar una fila nueva con un hash antiguo;
- omitir la versión.

Una incompatibilidad de versión impide registrar grants provenientes del
dataset afectado.

---

#### 28. Hash e integridad

`MatchedGrant` conserva ID y versión del dataset, no su hash.

El hash exacto del snapshot se registrará en:

```text
AuthorizationDecision.audit
```

mediante `AUTH-CTX-024`.

El evaluador deberá verificar la integridad antes de resolver allows.

Un hash incompatible:

```text
→ no usar filas parciales
→ no MatchedGrant
→ structural/configuration deny posterior
```

---

#### 29. effect

Todo `MatchedGrant` deberá declarar:

```text
effect = ALLOW
```

No se admiten en `matched_allows`:

- `DENY`;
- `REVOKE`;
- `BLOCK`;
- `AUDIT_ONLY`;
- `INHERIT`;
- `UNKNOWN`.

Las denegaciones se resolverán exclusivamente en `AUTH-CTX-022`.

---

#### 30. validity_status

Todo objeto serializado deberá declarar:

```text
validity_status = ACTIVE
```

Estados candidatos no coincidentes incluyen:

- futuro;
- expirado;
- revocado;
- suspendido;
- desactivado;
- reemplazado;
- versión incompatible;
- sujeto inactivo.

Estos estados no se serializan como `MatchedGrant`.

---

#### 31. Instante de vigencia

La vigencia se evalúa contra:

```text
AuthorizationDecision.decided_at
```

Regla de inicio:

```text
starts_at <= decided_at
```

Regla de fin cuando existe:

```text
decided_at < ends_at
```

No se utiliza:

- hora del cliente;
- hora del dispositivo;
- hora de render;
- hora de caché;
- hora de creación del recurso como sustituto.

---

#### 32. scope_code

`scope_code` identifica el alcance canónico utilizado para comprobar el
grant.

Podrá representar:

- un alcance primitivo aprobado;
- un perfil compuesto canónico y versionado;
- `CTX` para el carril operativo;
- una combinación publicada por el contrato.

No será:

- descripción humana;
- SQL;
- JSON libre;
- `scope_expression` sin normalizar;
- nombre de pantalla;
- nombre de sede;
- ID de recurso;
- texto generado por cliente.

---

#### 33. Alcances base

Los grants base podrán utilizar los códigos o perfiles aprobados derivados
de:

```text
NT
ORG
G
AS
SS
AST
TST
AA
SA
AAT
ATW
OWN
```

Un scope compuesto deberá conservar su identificador canónico.

No se reconstruye analizando texto descriptivo.

---

#### 34. Alcance operativo CTX

Para el carril operativo:

```text
scope_code = CTX
```

o el perfil operativo canónico que lo incluya.

`CTX` significa:

```text
contexto operativo efectivo
∩
recurso exacto
∩
lados exigidos
```

No significa:

- cualquier sede;
- cualquier área;
- cualquier recurso del rol;
- cualquier operación de la aplicación;
- acceso cross-site;
- acceso permanente.

---

#### 35. Alcance individual

Un override individual puede reducir o precisar el alcance compatible.

No podrá:

- superar el alcance máximo del permiso;
- eliminar restricciones de recurso;
- eliminar lados obligatorios;
- transformar `OWN` en global;
- transformar `CTX` en cross-site;
- conceder un scope incompatible con la modalidad.

La coincidencia se evalúa contra la intersección completa aplicable.

---

#### 36. matched_territory

`matched_territory = true` significa que el grant cubre todas las
dimensiones territoriales exigidas para su contribución.

Incluye, cuando correspondan:

- organización;
- unidad de negocio;
- sede;
- área;
- tipo de sede;
- tipo de área;
- origen;
- destino;
- ruta;
- vehículo;
- lados territoriales obligatorios;
- exclusión de entornos aislados.

No significa únicamente que “alguna sede coincide”.

---

#### 37. Territorio no aplicable

Para un permiso o recurso contractualmente no territorial:

```text
matched_territory = true
```

solo cuando:

- el contrato declara territorio no aplicable;
- el scope del grant admite esa forma;
- no existe una dimensión obligatoria omitida.

No se utiliza una lista territorial vacía como prueba automática.

---

#### 38. Todos los lados obligatorios

Cuando el recurso declara varios lados:

```text
matched_territory = true
```

exige que el grant cubra los lados que corresponden a su carril y contrato.

Ejemplo:

```text
required_sides = [ORIGIN, DESTINATION]
```

Un grant que solo cubre origen no se serializa como match completo cuando
ambos lados son obligatorios para esa contribución.

---

#### 39. Entornos aislados

Un grant ordinario no coincide con un recurso:

```text
isolated_environment = true
```

salvo autorización aislada explícita y compatible.

No producen coincidencia aislada por sí solos:

- `G`;
- `ORG`;
- `CTX`;
- rol propietario;
- rol gerencial;
- dispositivo de revisión.

---

#### 40. matched_resource

`matched_resource = true` significa que la concesión coincide con la forma
empresarial exacta resuelta por el contrato.

Incluye, cuando correspondan:

- `resource_contract_id`;
- tipo de recurso;
- forma de solicitud;
- IDs exactos;
- versión;
- sujeto;
- propiedad;
- custodia;
- relaciones;
- estado;
- transición;
- lados resueltos;
- política de colección;
- política de agregado;
- política de lote.

---

#### 41. Separación entre territorio y recurso

La división será:

```text
matched_territory
→ cobertura territorial
```

```text
matched_resource
→ identidad y condiciones empresariales del recurso
```

Ejemplo:

```text
misma sede
pero estado incompatible
```

produce:

```text
territorio coincide
recurso no coincide
→ no MatchedGrant
```

---

#### 42. Propiedad y OWN

Para un grant `OWN`:

```text
matched_resource = true
```

exige que la relación de propiedad o atribución definida por el contrato
coincida.

No se utiliza universalmente:

```text
created_by = actor
```

La propiedad no elimina la comprobación territorial.

---

#### 43. Estado del recurso

Cuando el grant o contrato exige un estado:

```text
matched_resource = true
```

requiere que el snapshot actual sea compatible.

Ejemplos:

- remisión pendiente;
- lote abierto;
- caja activa;
- orden aprobada;
- recepción no cerrada.

Un estado incompatible descarta el candidato.

No crea automáticamente un deny administrable.

---

#### 44. Campos y MatchedGrant

La coincidencia de grant no autoriza por sí sola todos los campos.

`matched_resource` no sustituye:

```text
field_policy_decision
```

Un grant puede coincidir con el recurso mientras:

```text
field_policy_decision = PARTIAL
```

o mientras una mutación termine bloqueada por campos protegidos.

La evidencia del grant se conserva.

---

#### 45. Concurrencia y MatchedGrant

La concurrencia no forma parte del grant almacenado.

Un grant puede coincidir y registrarse mientras:

```text
resource.concurrency.validated = false
```

La ejecución será bloqueada por la decisión correspondiente.

`MatchedGrant` demuestra autoridad potencial del carril, no disponibilidad
transaccional definitiva.

---

#### 46. Dispositivo y MatchedGrant

El paquete de capacidades del dispositivo no produce `MatchedGrant`.

Cuando el actor posee un grant coincidente, pero el dispositivo restringe la
capacidad:

```text
matched_allows conserva el grant
device_decision = FAIL
final_decision = DENY
```

El dispositivo no se registra como `source_kind`.

---

#### 47. Sensibilidad y reautenticación

Una concesión puede coincidir aunque una exigencia sensible adicional falle.

Ejemplo:

```text
grant base coincidente
reautenticación requerida ausente
```

Resultado:

```text
MatchedGrant conservado
sensitivity_decision = FAIL
final_decision = DENY
```

La restricción no borra la evidencia de la concesión.

---

#### 48. Dependencias

Un allow de una dependencia no se agrega a `matched_allows` del permiso
principal.

Cada dependencia produce su propia decisión.

El permiso principal contiene exclusivamente grants cuya:

```text
permission_key
=
permission_key principal
```

Aprobar una dependencia no crea un allow principal.

---

#### 49. Grants incompletos

Un candidato que falla una condición no entra parcialmente.

Queda prohibido serializar:

```ts
{
  matched_territory: false,
  matched_resource: true
}
```

dentro de `matched_allows`.

Los booleanos del contrato son invariantes de evidencia positiva.

No son un informe de todos los candidatos descartados.

---

#### 50. No composición accidental

Dos grants incompletos no se combinan para crear uno completo.

Ejemplo prohibido:

```text
grant A cubre sede
grant B cubre propiedad
→ allow completo
```

La combinación solo es válida cuando un contrato de grant compuesto,
publicado y versionado, define explícitamente todas sus condiciones como una
única concesión.

---

#### 51. Múltiples allows coincidentes

Pueden coincidir simultáneamente:

- grant de rol;
- override individual;
- varios grants de rol con alcances diferentes;
- grants en ambos carriles de un permiso híbrido.

Todos los allows completos se conservan.

No se elige únicamente:

- el más específico;
- el más amplio;
- el individual;
- el de rol;
- el primero;
- el más reciente.

La multiplicidad no amplía la autoridad.

---

#### 52. Redundancia de rol e individual

Cuando un rol y un override individual conceden exactamente la misma
capacidad y ambos coinciden:

```text
matched_allows
→ contiene ambas concesiones
```

Esto preserva la evidencia real.

No obstante:

- no produce doble autoridad;
- no cambia el resultado;
- puede generar una observación de redundancia administrativa;
- no autoriza eliminar automáticamente el override.

La limpieza física corresponde a tareas de implementación y migración.

---

#### 53. Grants distintos con el mismo efecto

Dos grants con IDs distintos permanecen separados cuando representan
concesiones canónicas distintas.

Ejemplos:

- rol base + override base;
- rol operativo + override operativo;
- grant de alcance limitado + grant global;
- componente base + grant directo de otra fuente.

El orden no implica precedencia.

---

#### 54. Duplicado exacto por grant_id

Si la misma concesión aparece repetida de forma byte-equivalente dentro del
mismo snapshot:

```text
→ deduplicar por grant_id
→ conservar una sola entrada
→ registrar problema de dataset
```

Si el contenido difiere:

```text
→ conflicto
→ no elegir una fila
→ fail closed
```

---

#### 55. Relación con matched_allow_ids

La consistencia obligatoria es:

```text
base_decision.matched_allow_ids
=
grant_id de matched_allows donde lane = BASE
```

```text
operational_decision.matched_allow_ids
=
grant_id de matched_allows donde lane = OPERATIONAL
```

Ambas listas deberán:

- estar deduplicadas;
- usar el mismo identificador;
- conservar orden determinista;
- no incluir grants descartados;
- no incluir denies;
- no incluir dependencias.

---

#### 56. Outcome ALLOW

Cuando un carril produce:

```text
outcome = ALLOW
```

deberá existir al menos un `MatchedGrant` capaz de satisfacer la contribución
requerida de ese carril.

Queda prohibido:

```text
outcome = ALLOW
matched_allow_ids = []
```

Un resultado así es una incoherencia estructural.

---

#### 57. Outcome DENY con allows existentes

Un carril puede terminar en `DENY` aunque existan allows coincidentes.

Ejemplos:

- actor-wide deny;
- lane deny;
- restricción bloqueante;
- combinación obligatoria fallida;
- condición final separada.

En ese caso:

- los grants no se eliminan;
- `matched_allows` conserva la evidencia;
- el deny prevalece;
- la explicación distingue autoridad concedida y bloqueo aplicable.

---

#### 58. Outcome DENY sin allows

Cuando no existe ningún allow completo:

```text
matched_allow_ids = []
matched_allows no contiene entradas del carril
```

El resultado posterior será `DENY` por ausencia de allow.

`default deny` no se representa como `MatchedGrant`.

---

#### 59. Outcome NOT_APPLICABLE

Cuando un carril es `NOT_APPLICABLE`:

- no se consultan sus datasets para conceder;
- no se registran allows del carril;
- no se incluyen IDs;
- no se interpreta la ausencia como error.

Una fila incompatible localizada durante validación administrativa no se
convierte en match.

---

#### 60. Denies no borran allows

`AUTH-CTX-021` registra evidencia positiva.

`AUTH-CTX-022` registrará evidencia negativa.

Regla:

```text
DENY APLICABLE
>
ALLOW COINCIDENTE
```

Pero:

```text
DENY APLICABLE
≠
BORRAR EVIDENCIA DEL ALLOW
```

Esto permite auditoría y explicación correcta.

---

#### 61. Orden determinista

`matched_allows` deberá ordenarse por:

1. `lane`: `BASE`, luego `OPERATIONAL`;
2. `source_kind` en orden canónico;
3. `source_dataset_id`;
4. `source_dataset_version`;
5. `grant_id`.

Orden canónico de `source_kind`:

```text
BASE_ROLE
INDIVIDUAL_BASE
OPERATIONAL_ROLE
INDIVIDUAL_OPERATIONAL
```

El orden no concede precedencia.

---

#### 62. Inmutabilidad

Una vez emitida la decisión:

- no se agregan grants;
- no se eliminan grants;
- no se cambia la lane;
- no se cambia el sujeto;
- no se cambia el dataset;
- no se actualiza la vigencia;
- no se reemplaza el recurso.

Un cambio de realidad produce una nueva `AuthorizationDecision`.

---

#### 63. Frescura

La coincidencia deberá basarse en snapshots vigentes de:

- contexto;
- catálogo;
- datasets;
- recurso;
- grants;
- overrides.

Un grant revocado después de una decisión no modifica retroactivamente la
evidencia histórica.

Pero una ejecución posterior deberá reevaluar cuando corresponda.

La estrategia de invalidación se definirá en `AUTH-CTX-029`.

---

#### 64. Colecciones

Para una lectura `COLLECTION`, un grant solo coincide sobre el conjunto
delimitado por el servidor.

Reglas:

- no autoriza miembros fuera de alcance;
- no autoriza filtros aplicados únicamente en frontend;
- no autoriza conteos que incluyan miembros ocultos;
- no autoriza una mutación sobre toda la colección;
- la paginación conserva el mismo scope.

`matched_resource = true` se refiere al conjunto autorizado resultante.

---

#### 65. Agregados

Para `AGGREGATE`:

- solo contribuyen miembros individualmente autorizados;
- el grant deberá ser compatible con la dimensión agregada;
- no se incluyen territorios ocultos;
- no se infieren totales excluidos;
- un grant local no produce agregado global.

La coincidencia corresponde al agregado autorizado exacto.

---

#### 66. Operaciones masivas

Para `BULK`, el grant deberá ser compatible con la política masiva del
contrato.

En `ALL_OR_NOTHING`:

```text
todos los miembros obligatorios deben coincidir
```

En `PARTIAL_WITH_RESULTS`:

```text
cada miembro obtiene evaluación separada
```

Un permiso individual ordinario no se convierte en grant masivo.

---

#### 67. NON_RESOURCE

Para una solicitud `NON_RESOURCE`:

```text
matched_resource = true
```

solo cuando:

- el contrato declara `NON_RESOURCE`;
- el permiso y grant admiten esa forma;
- no existe un recurso empresarial omitido;
- no se usa como fallback.

Ejemplo:

```text
app.access
```

puede ser `NON_RESOURCE`.

Esto no concede las capacidades internas de la aplicación.

---

#### 68. Simulación

La simulación puede calcular grants que coincidirían bajo un contexto
hipotético.

Sin embargo:

- no produce autoridad ejecutable;
- no reutiliza la decisión real;
- no crea grants;
- no altera datasets;
- no elimina denies;
- no expone matrices completas;
- debe marcarse dentro del contrato separado de simulación.

Un `MatchedGrant` simulado no podrá presentarse como evidencia de una
ejecución real.

---

#### 69. Procesos SYSTEM

Los cuatro valores actuales de `source_kind` pertenecen al modelo laboral.

Un proceso `SYSTEM` autónomo no se proyecta silenciosamente como:

- rol base;
- rol operativo;
- override individual;
- dispositivo.

`AUTH-CTX-026` deberá diseñar la rama contractual de procesos de sistema.

Si esa rama requiere ampliar `MatchedGrant`, deberá versionarse el contrato
antes de implementación.

---

#### 70. Compatibilidad legacy

Las estructuras físicas actuales:

- `role_permissions`;
- `operational_role_permissions`;
- `employee_permissions`;
- funciones booleanas actuales;

no se serializan directamente como fuente canónica final.

`AUTH-CTX-028` diseñará adaptadores que deberán:

- mapear claves legacy;
- resolver lane;
- normalizar scope;
- eliminar ambigüedad;
- controlar duplicados;
- proyectar IDs estables;
- vincular dataset y versión;
- fallar cerrado cuando no exista equivalencia uno-a-uno.

---

#### 71. Proyección interna

La forma completa de `MatchedGrant` pertenece a la decisión interna y a la
auditoría autorizada.

Puede ser utilizada por:

- evaluador;
- auditoría;
- diagnóstico administrativo;
- pruebas contractuales;
- simulación autorizada.

No deberá ser enviada indiscriminadamente a todos los clientes.

---

#### 72. Proyección segura al cliente

La respuesta cliente ordinaria podrá omitir:

- `grant_id`;
- `source_subject_id`;
- `source_dataset_id`;
- `source_dataset_version`;
- cantidad de grants;
- estructura de la matriz;
- existencia de overrides sensibles.

La proyección segura podrá limitarse a:

- decisión;
- razón pública;
- acción de recuperación;
- campos visibles;
- requisito pendiente permitido.

La forma exacta se consolidará en `AUTH-CTX-023`.

---

#### 73. Auditoría

`AUTH-CTX-024` deberá registrar, de forma autorizada:

- `grant_id`;
- lane;
- source kind;
- source subject;
- permission key;
- scope code;
- dataset;
- versión;
- hash del snapshot;
- recurso;
- territorio;
- instante;
- resultado.

No deberá registrar secretos ni payloads empresariales innecesarios.

---

#### 74. Casos de ejemplo

##### Caso A — Grant base de rol

```text
source_kind = BASE_ROLE
source_subject_id = gerente
permission_key exacto
scope = AS
recurso dentro de sede asignada
grant activo
```

Resultado:

```text
MatchedGrant BASE
```

##### Caso B — Grant base fuera de territorio

```text
scope = AS
recurso en sede no asignada
```

Resultado:

```text
no MatchedGrant
```

##### Caso C — Override individual redundante

```text
grant de rol coincide
override individual base coincide
```

Resultado:

```text
dos MatchedGrant
misma autoridad efectiva
```

##### Caso D — Grant operativo

```text
source_kind = OPERATIONAL_ROLE
rol del turno coincide
CTX coincide
recurso y lado coinciden
```

Resultado:

```text
MatchedGrant OPERATIONAL
```

##### Caso E — Rol operativo distinto

```text
turno = bodeguero
grant = conductor_logistica
```

Resultado:

```text
no MatchedGrant
```

##### Caso F — BASE_AND_OPERATIONAL

```text
componente base coincide
componente operativo coincide
```

Resultado:

```text
dos MatchedGrant
uno por carril
```

La decisión final se combina después.

##### Caso G — Allow y deny

```text
grant base coincide
actor-wide deny coincide
```

Resultado:

```text
MatchedGrant conservado
MatchedDeny posterior
final DENY
```

##### Caso H — Grant expirado

```text
ends_at <= decided_at
```

Resultado:

```text
no MatchedGrant
```

##### Caso I — Dataset incompatible

```text
source_dataset_version no compatible
```

Resultado:

```text
no usar filas parciales
no MatchedGrant
```

##### Caso J — Recurso no territorial

```text
contrato = NON_RESOURCE
grant compatible
```

Resultado:

```text
matched_territory = true
matched_resource = true
```

##### Caso K — Entorno aislado

```text
grant G ordinario
resource.isolated_environment = true
```

Resultado:

```text
no MatchedGrant
```

##### Caso L — Misma sede, estado incorrecto

```text
territorio compatible
estado del recurso incompatible
```

Resultado:

```text
no MatchedGrant
```

##### Caso M — Restricción de dispositivo

```text
grant operativo coincide
dispositivo no admite permiso
```

Resultado:

```text
MatchedGrant conservado
device_decision = FAIL
final DENY
```

##### Caso N — Colisión de grant_id

```text
mismo grant_id
dos concesiones diferentes
```

Resultado:

```text
configuración inválida
fail closed
```

##### Caso O — Lane no aplicable

```text
permission = BASE_ONLY
grant operativo almacenado
```

Resultado:

```text
no MatchedGrant OPERATIONAL
incompatibilidad contractual
```

---

#### 75. Antipatrones prohibidos

```ts
const matched = grants.filter(
  (grant) => grant.permission_key.startsWith(permissionKey)
);
```

```ts
const bestGrant = grants[0];
```

```ts
const matched = [
  ...roleGrants,
  ...individualGrants,
].filter((grant) => grant.is_active);
```

```ts
if (grant.scope === "global") {
  return true;
}
```

```ts
return {
  ...grant,
  matched_territory: false,
  matched_resource: true,
};
```

```ts
if (device.capabilities.includes(permissionKey)) {
  matchedAllows.push(device);
}
```

También queda prohibido:

```text
grant almacenado → grant coincidente
rol superior → sujeto coincidente
override individual → bypass
grant base → allow operativo
grant operativo → allow base
dos grants incompletos → uno completo
más específico → vencer deny
lista vacía → todos
scope null → global
recurso propio → omitir territorio
misma sede → recurso coincidente
allow → decisión final
deny → borrar evidencia del allow
```

---

#### 76. Relación con tareas posteriores

| Tarea                         | Responsabilidad posterior                                                                          |
| ----------------------------- | -------------------------------------------------------------------------------------------------- |
| `AUTH-CTX-022`                | Definir `MatchedDeny`, structural denies, actor-wide denies y lane denies                          |
| `AUTH-CTX-023`                | Aplicar precedencia, combinación, default deny, restricciones y decisión final                     |
| `AUTH-CTX-024`                | Registrar grants, datasets, hashes, recurso, territorio y resultados de auditoría                  |
| `AUTH-CTX-025`                | Diseñar la producción física del contexto; no resolver grants por sí solo                          |
| `AUTH-CTX-026`                | Diseñar consulta de datasets, matchers, tipos físicos, procesos SYSTEM y frontera transaccional    |
| `AUTH-CTX-027`                | Obligar a aplicaciones y RPC a consumir matched allows centralizados                               |
| `AUTH-CTX-028`                | Diseñar adaptadores para matrices legacy, IDs, scopes, aliases, duplicados y funciones booleanas   |
| `AUTH-CTX-029`                | Definir caché e invalidación de grants, datasets, contexto y recurso                               |
| `AUTH-CTX-030`                | Definir pruebas contractuales de matching, multiplicidad, componentes, deduplicación y fail closed |
| `AUTH-DB-006` a `AUTH-DB-010` | Implementar autorización canónica dentro de RPC sensibles                                          |
| `AUTH-DB-011`                 | Aplicar constraints después de inventario, reconciliación y backfill                               |
| `AUTH-DB-020`                 | Migrar matrices y overrides legacy a fuentes canónicas                                             |
| `AUTH-DB-027`                 | Probar integridad, RLS, RPC, datasets y migraciones                                                |
| `AUTH-DB-030`                 | Retirar funciones legacy después de adopción comprobada                                            |
| `AUTH-DB-031`                 | Certificar paridad documental, técnica y operativa                                                 |
| `GAP-CTRL-001`                | Consolidar brechas de grants y consumidores detectadas antes de implementación                     |
| `GAP-CTRL-006`                | Vincular cada brecha con tarea documental y paquete implementable                                  |

---

#### 77. Fuera del alcance

AUTH-CTX-021 no:

- modifica el catálogo;
- modifica modalidades;
- modifica alcances;
- modifica matrices;
- modifica datasets;
- cambia sus versiones;
- crea grants;
- crea overrides;
- elimina redundancias;
- crea denies;
- define `MatchedDeny`;
- aplica precedencia final;
- decide mensajes cliente;
- crea ramas SYSTEM físicas;
- crea tipos TypeScript;
- crea JSON Schema;
- crea Zod;
- crea SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 76.

---

#### 78. Riesgos controlados

| Riesgo                                      | Control canónico                                     |
| ------------------------------------------- | ---------------------------------------------------- |
| Toda fila activa se considera allow         | Matching completo obligatorio                        |
| Prefijo concede capacidades relacionadas    | `permission_key` exacto                              |
| Grant de otro rol coincide                  | `source_subject_id` exacto                           |
| Override individual funciona como bypass    | Contexto, scope y recurso siguen siendo obligatorios |
| Grant operativo se vuelve global            | `CTX` siempre limita por contexto y recurso          |
| Scope descriptivo se interpreta libremente  | `scope_code` canónico y versionado                   |
| Dos grants incompletos se combinan          | Cada `MatchedGrant` debe ser completo                |
| Deny borra evidencia                        | Grants y denies permanecen separados                 |
| Más grants amplían alcance                  | Multiplicidad no crea scope nuevo                    |
| Colisión de IDs se resuelve arbitrariamente | `GRANT_ID_COLLISION` y fail closed                   |
| Dataset cambia durante la decisión          | Snapshot único por dataset                           |
| Cliente recibe matrices internas            | Proyección segura separada                           |
| Componente híbrido autoriza solo            | Combinación reservada a `AUTH-CTX-023`               |
| Legacy se usa como fuente normativa         | Adaptación explícita en `AUTH-CTX-028`               |
| Dispositivo se registra como grant          | El dispositivo solo restringe                        |

---

#### 79. Criterios de aprobación

AUTH-CTX-021 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `MatchedGrant`;
2. se conserva `matched_allows: MatchedGrant[]`;
3. no se agregan campos;
4. grant almacenado no significa grant coincidente;
5. solo se serializan coincidencias completas;
6. `effect` siempre es `ALLOW`;
7. `validity_status` siempre es `ACTIVE`;
8. `matched_territory` siempre es `true`;
9. `matched_resource` siempre es `true`;
10. los candidatos descartados no aparecen en `matched_allows`;
11. el permiso debe coincidir exactamente;
12. no existen prefijos ni wildcards;
13. una aplicación o permiso inactivo no se reactiva mediante grant;
14. cada grant pertenece a un solo carril;
15. no existe lane `BOTH`;
16. `BASE_ROLE` pertenece a BASE;
17. `INDIVIDUAL_BASE` pertenece a BASE;
18. `OPERATIONAL_ROLE` pertenece a OPERATIONAL;
19. `INDIVIDUAL_OPERATIONAL` pertenece a OPERATIONAL;
20. la modalidad limita los carriles compatibles;
21. un carril `NOT_APPLICABLE` no registra grants;
22. `BASE_OR_OPERATIONAL` conserva evidencia independiente;
23. `BASE_AND_OPERATIONAL` exige contribuciones separadas;
24. un solo MatchedGrant no ocupa dos carriles;
25. grant directo y componente permanecen diferenciados en la fuente;
26. un componente puede coincidir para su carril;
27. un componente no autoriza la decisión final;
28. BASE_ROLE exige rol base exacto;
29. OPERATIONAL_ROLE exige rol operativo exacto;
30. INDIVIDUAL_BASE exige empleado exacto;
31. INDIVIDUAL_OPERATIONAL exige empleado exacto;
32. source_subject_id usa códigos de rol o employee_id;
33. no usa nombres, correos ni documentos;
34. grant_id es estable;
35. grant_id es resoluble;
36. grant_id no es un índice local;
37. los IDs deben ser globalmente no ambiguos;
38. una colisión produce fail closed;
39. grants base proceden del dataset base canónico;
40. grants operativos proceden del dataset operativo canónico;
41. overrides proceden del dataset de overrides;
42. no se usan tablas legacy como fuente final;
43. cada dataset usa un snapshot único;
44. no se mezclan versiones;
45. el hash se registra posteriormente en auditoría;
46. un hash incompatible impide usar filas parciales;
47. effect no admite DENY;
48. grants futuros no coinciden;
49. grants expirados no coinciden;
50. grants revocados no coinciden;
51. la vigencia usa decided_at;
52. scope_code es canónico;
53. scope_code no es texto humano;
54. los scopes base conservan códigos aprobados;
55. CTX limita por contexto y recurso;
56. un override no supera el alcance máximo;
57. matched_territory cubre todas las dimensiones obligatorias;
58. territorio no aplicable requiere contrato explícito;
59. todos los lados obligatorios deben estar cubiertos;
60. grants ordinarios no incluyen entornos aislados;
61. matched_resource exige recurso y condiciones empresariales;
62. territorio y recurso permanecen separados;
63. OWN exige relación contractual real;
64. el estado del recurso participa;
65. fields permanecen en decisión separada;
66. concurrencia permanece en decisión separada;
67. el dispositivo no produce MatchedGrant;
68. sensibilidad no borra evidencia de grant;
69. dependencias no se mezclan con el permiso principal;
70. no se serializan booleans falsos en matched_allows;
71. dos grants incompletos no se combinan;
72. pueden existir varios allows coincidentes;
73. rol e individual pueden coexistir;
74. multiplicidad no crea doble autoridad;
75. grants distintos conservan IDs distintos;
76. duplicados exactos se deduplican por grant_id;
77. contenido divergente con mismo ID produce conflicto;
78. LaneDecision y matched_allows deben coincidir;
79. outcome ALLOW exige al menos un grant;
80. outcome DENY puede conservar grants;
81. default deny no es MatchedGrant;
82. NOT_APPLICABLE exige cero grants del carril;
83. un deny no borra evidencia positiva;
84. el orden es determinista;
85. el orden no implica precedencia;
86. la decisión es inmutable;
87. la frescura se evalúa por snapshots;
88. colecciones se delimitan en servidor;
89. agregados excluyen miembros no autorizados;
90. bulk requiere contrato compatible;
91. NON_RESOURCE no es fallback;
92. simulación no produce autoridad ejecutable;
93. SYSTEM no se adapta silenciosamente a source_kind laboral;
94. una ampliación para SYSTEM exige versionado;
95. legacy se adapta en AUTH-CTX-028;
96. la forma completa es interna;
97. la proyección cliente protege datos de grants;
98. AUTH-CTX-024 registrará evidencia auditable;
99. AUTH-CTX-022 definirá denegaciones coincidentes;
100. AUTH-CTX-023 aplicará precedencia y decisión final;
101. AUTH-CTX-026 diseñará la implementación contractual;
102. AUTH-CTX-027 eliminará matching local;
103. AUTH-CTX-029 gobernará invalidación;
104. AUTH-CTX-030 gobernará pruebas;
105. no se implementa código, migraciones ni cambios en Supabase.

---

#### 80. Cierre y continuidad de la propuesta

| Relación        | Tarea          | Estado        |
| --------------- | -------------- | ------------- |
| Tarea anterior  | `AUTH-CTX-020` | ✅ APROBADA    |
| Tarea propuesta | `AUTH-CTX-021` | ✅ APROBADA    |
| Tarea siguiente | `AUTH-CTX-022` | ⬜ NO INICIADA |

```text
AUTH-CTX-020 — APROBADA
        ↓
AUTH-CTX-021 — APROBADA
        ↓
AUTH-CTX-022 — NO INICIADA
```

No se avanza a `AUTH-CTX-022` hasta recibir aprobación explícita de
`AUTH-CTX-021`.

### ✅ AUTH-CTX-022 — Incluir denegaciones coincidentes

| Campo                            | Valor                                                                                               |
| -------------------------------- | --------------------------------------------------------------------------------------------------- |
| **Estado**                       | APROBADA                                                                                            |
| **Bloque**                       | BLOQUE E — Contexto y decisión de autorización unificados                                           |
| **Subbloque**                    | `AUTHORIZATION DECISION`                                                                            |
| **Naturaleza**                   | Definición documental de `matched_denies`, `structural_denies`, `actor_wide_denies` y `lane_denies` |
| **Implementación física**        | No incluida                                                                                         |
| **Tarea anterior vigente**       | `AUTH-CTX-021` — APROBADA                                                                           |
| **Tarea posterior reservada**    | `AUTH-CTX-023` — Incluir decisión final y razones                                                   |
| **Contrato afectado**            | `AuthorizationDecision@1.0.0`                                                                       |
| **Campos principales afectados** | `matched_denies`, `structural_denies`, `actor_wide_denies`, `lane_denies`, `blocked_reasons`        |
| **Tipos principales afectados**  | `MatchedDeny`, `DecisionReason`                                                                     |
| **Dataset administrable**        | `vento.authorization.individual-overrides@1.0.0`                                                    |
| **Catálogo**                     | `vento.authorization@1.0.0`                                                                         |
| **Cambio contractual**           | Aclaración normativa compatible; no cambia la forma publicada                                       |
| **Cambios físicos permitidos**   | No                                                                                                  |

Esta tarea define cómo Vento OS identifica, clasifica, conserva y serializa
las denegaciones que realmente coinciden con una solicitud de autorización.

La regla central es:

```text
DENEGACIÓN ALMACENADA
≠
DENEGACIÓN COINCIDENTE
```

```text
DENEGACIÓN COINCIDENTE
=
CLASE CANÓNICA
∩
PERMISO EXACTO
∩
ACTOR COMPATIBLE
∩
CARRIL COMPATIBLE
∩
VIGENCIA ACTIVA
∩
ALCANCE COINCIDENTE
∩
TERRITORIO COINCIDENTE
∩
RECURSO COINCIDENTE
```

La precedencia canónica permanece:

```text
STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
LANE_DENY
>
ALLOW
>
DEFAULT_DENY
```

Una denegación coincidente:

- no crea un permiso negativo por prefijo;
- no bloquea permisos distintos;
- no se expande a toda una aplicación;
- no se transfiere entre trabajadores;
- no se transfiere entre carriles;
- no se transfiere entre territorios;
- no desaparece porque exista un allow más específico;
- no reemplaza la resolución del recurso;
- no sustituye la auditoría;
- no convierte la revocación del deny en un allow.

No implementa SQL, RPC, RLS, funciones, migraciones, tablas, índices,
interfaces, guards, caché ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir las denegaciones coincidentes de manera que Vento OS pueda responder
inequívocamente:

1. qué clases de resultado negativo existen;
2. cuáles son estructurales;
3. cuáles son administrables;
4. cuáles son transversales al actor;
5. cuáles pertenecen a un carril;
6. cuándo existe `DEFAULT_DENY`;
7. qué denegaciones se serializan como `MatchedDeny`;
8. qué razones se serializan como `DecisionReason`;
9. cómo se relacionan ambas representaciones;
10. qué sujeto debe coincidir;
11. qué permiso debe coincidir;
12. qué carril debe coincidir;
13. qué vigencia debe cumplirse;
14. qué alcance debe coincidir;
15. qué territorio debe coincidir;
16. qué recurso debe coincidir;
17. cómo se comparan origen y destino;
18. cómo se tratan colecciones, agregados y lotes;
19. cómo se preservan múltiples denies simultáneos;
20. cómo se deduplican;
21. cómo se relacionan con `matched_deny_ids`;
22. cómo se preservan allows coincidentes;
23. cómo se determina la precedencia;
24. cómo se revoca una denegación;
25. cómo se evita que la revocación conceda autoridad;
26. cómo se conserva evidencia sin revelar información sensible;
27. cómo se preservan determinismo, inmutabilidad y auditoría.

---

#### 2. Base normativa

AUTH-CTX-022 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — Actor efectivo;
- `AUTH-MOD-002` — Separación entre rol base y rol operativo;
- `AUTH-MOD-007` y `AUTH-MOD-008` — Sede y área;
- `AUTH-MOD-009` y `AUTH-MOD-010` — Turno y check-in;
- `AUTH-MOD-011` — Dispositivo compartido;
- `AUTH-MOD-018` — Combinación de carriles;
- `AUTH-MOD-019` — Denegación explícita;
- `AUTH-CAT-001` a `AUTH-CAT-024` — Catálogo canónico;
- `AUTH-RBAC-001` a `AUTH-RBAC-021` — Matrices y concesiones;
- `AUTH-RBAC-022` — Denegaciones individuales y transversales;
- `AUTH-RBAC-024` — Dataset canónico base;
- `AUTH-RBAC-025` — Dataset canónico operativo;
- `AUTH-RBAC-026` — Dataset canónico de excepciones y denegaciones;
- `AUTH-RBAC-027` y `AUTH-RBAC-028` — Validaciones transversales;
- `AUTH-CTX-001` a `AUTH-CTX-015` — `AccessContext`;
- `AUTH-CTX-016` — Aplicación y permiso solicitados;
- `AUTH-CTX-017` — Modalidad y prerrequisitos;
- `AUTH-CTX-018` — Recurso y territorio resueltos;
- `AUTH-CTX-019` — Carril base;
- `AUTH-CTX-020` — Carril operativo;
- `AUTH-CTX-021` — Allows coincidentes.

Principios obligatorios:

```text
SIN ALLOW
→ DEFAULT_DENY
```

```text
DENY EXPLÍCITO
≠
AUSENCIA DE ALLOW
```

```text
DENY APLICABLE
>
ALLOW APLICABLE
```

```text
ALLOW MÁS ESPECÍFICO
≠
VENCER DENY
```

```text
REVOCAR DENY
≠
CREAR ALLOW
```

```text
DENY EN BASE
≠
DENY EN OPERACIÓN
```

```text
DENY TRANSVERSAL
=
BLOQUEO DE TODOS LOS CARRILES COMPATIBLES
PARA EL PERMISO EXACTO
```

---

#### 3. Causas canónicas de resultado negativo

Vento OS distinguirá:

| Causa                               | Naturaleza                                             | Persistida como deny administrable |
| ----------------------------------- | ------------------------------------------------------ | ---------------------------------: |
| `STRUCTURAL_DENY`                   | Invalidez obligatoria del contrato, contexto o recurso |                                 No |
| `ACTOR_WIDE_DENY`                   | Bloqueo individual transversal para el permiso exacto  |                                 Sí |
| `BASE_LANE_DENY`                    | Bloqueo individual del carril base                     |                                 Sí |
| `OPERATIONAL_LANE_DENY`             | Bloqueo individual del carril operativo                |                                 Sí |
| `DEFAULT_DENY`                      | Ausencia de allow completo                             |                                 No |
| Restricción o prerrequisito fallido | Decisión separada que puede bloquear                   |         No como deny administrable |

No se mezclan estas causas.

Cada una conserva su origen y semántica.

---

#### 4. Forma contractual de MatchedDeny

```ts
type MatchedDeny = {
  deny_id: string;
  deny_class:
    | "STRUCTURAL"
    | "ACTOR_WIDE"
    | "BASE_LANE"
    | "OPERATIONAL_LANE"
    | "DEFAULT";

  lane: "BASE" | "OPERATIONAL" | "ALL" | null;
  permission_key: string;
  source_kind: string;
  matched_actor: boolean;
  matched_resource: boolean;
  matched_territory: boolean;
  matched_validity: boolean;
  reason_code: string;
};
```

La colección se conserva como:

```ts
matched_denies: MatchedDeny[];
```

No se agregan, eliminan ni renombran campos.

---

#### 5. Forma contractual de DecisionReason

```ts
type DecisionReason = {
  reason_code: string;
  category: string;
  severity: "BLOCKING" | "INFORMATIONAL";
  lane: "BASE" | "OPERATIONAL" | "ALL" | null;
  source: string;
  safe_to_expose: boolean;
};
```

Las colecciones se conservan como:

```ts
structural_denies: DecisionReason[];
actor_wide_denies: DecisionReason[];
lane_denies: DecisionReason[];
blocked_reasons: DecisionReason[];
```

AUTH-CTX-023 consolidará el orden final y la razón primaria.

---

#### 6. Invariantes de MatchedDeny

Todo objeto serializado en `matched_denies` deberá cumplir:

```text
matched_actor = true
matched_resource = true
matched_territory = true
matched_validity = true
```

Estos booleanos significan:

- coincidencia completa; o
- dimensión declarada explícitamente como no aplicable por el contrato.

No se serializan candidatos parciales.

Queda prohibido incluir:

```ts
{
  matched_actor: true,
  matched_resource: false,
  matched_territory: true,
  matched_validity: true
}
```

como una denegación coincidente.

---

#### 7. Candidato frente a denegación coincidente

Podrán existir candidatos descartados, por ejemplo:

- deny de otro empleado;
- deny de otra clave;
- deny de otro carril;
- deny futuro;
- deny expirado;
- deny revocado;
- deny fuera del territorio;
- deny fuera del recurso;
- deny legacy sin equivalencia;
- deny con scope inválido.

Estos candidatos:

- no aparecen en `matched_denies`;
- no aparecen en `matched_deny_ids`;
- no bloquean la decisión;
- pueden producir diagnóstico administrativo;
- no se exponen al cliente.

---

#### 8. Secuencia canónica de resolución

La resolución deberá seguir, conceptualmente:

```text
1. permiso canónico exacto
2. modalidad y carriles aplicables
3. structural conditions
4. snapshot del dataset de overrides
5. candidatos por employee_id y permission_key
6. clase de deny
7. carril
8. vigencia
9. alcance
10. territorio
11. recurso
12. inclusión como MatchedDeny
13. creación de DecisionReason
14. deduplicación y orden
15. proyección de matched_deny_ids
```

Cada etapa reduce candidatos.

Ninguna etapa amplía el bloqueo.

---

#### 9. Permiso exacto obligatorio

Toda denegación administrable deberá cumplir:

```text
deny.permission_key
=
AuthorizationDecision.request.permission_key
```

No se admiten:

- prefijos;
- wildcards;
- aplicaciones completas;
- módulos;
- permisos padres;
- permisos hijos;
- claves similares;
- rutas;
- nombres humanos;
- aliases no adaptados;
- patrones regulares.

Un deny para `nexo.inventory.remissions.prepare` no bloquea
`nexo.inventory.remissions.receive`.

---

#### 10. Denegaciones por aplicación o módulo

Queda prohibido crear administrativamente:

```text
nexo.*
fogo.production.*
*.manage
```

Si Vento requiere bloquear varias capacidades:

- cada permiso exacto deberá denegarse; o
- deberá existir una suspensión estructural del actor mediante el mecanismo
  empresarial correspondiente.

La denegación no se convierte en un sistema paralelo de roles negativos.

---

#### 11. Actor exacto

Las denegaciones administrables de AUTH-RBAC-022 pertenecen a un trabajador
humano exacto.

La coincidencia exige:

```text
deny.employee_id
=
AccessContext.domain_identity.employee_id
=
effective_actor.employee_id
```

No coincide por:

- correo;
- documento;
- nombre;
- rol;
- cargo;
- dispositivo;
- turno;
- sesión técnica;
- sede;
- semejanza.

---

#### 12. Empleado activo y trazabilidad histórica

Una denegación puede conservarse históricamente aunque el empleado esté
inactivo.

Sin embargo, el empleado inactivo ya produce bloqueo estructural laboral.

Reglas:

- no se elimina automáticamente el deny;
- no se usa el deny para justificar la inactividad;
- no se reactiva al empleado al revocar el deny;
- la auditoría conserva ambos hechos por separado.

---

#### 13. STRUCTURAL_DENY

Un `STRUCTURAL_DENY` procede de una condición obligatoria inválida.

Ejemplos:

- principal ausente;
- actor no resoluble;
- identidad ambigua;
- empleado inactivo;
- aplicación inexistente;
- permiso inexistente;
- contrato incompatible;
- contexto obsoleto;
- recurso no resoluble;
- territorio contradictorio;
- turno ambiguo;
- rol inválido;
- dataset incompatible;
- colisión de IDs;
- evaluación incompleta.

No es una excepción administrable.

No se crea desde VISO como una fila de deny.

---

#### 14. Structural deny administrable prohibido

Queda prohibido almacenar en el dataset:

```text
deny_class = STRUCTURAL
```

como una decisión discrecional de usuario.

El dataset `individual-overrides@1.0.0` contiene únicamente:

- actor-wide denies;
- base lane denies;
- operational lane denies;
- grants individuales.

Una condición estructural procede del evaluador y de sus fuentes
autoritativas.

---

#### 15. Representación structural en MatchedDeny

Un structural deny podrá aparecer en `matched_denies` únicamente cuando:

- existe una `permission_key` canónica;
- la condición estructural es determinista;
- el evaluador produce un `deny_id` sintético y trazable;
- todas las dimensiones aplicables se consideran coincidentes;
- se crea además su `DecisionReason`.

Formato conceptual del ID sintético:

```text
structural:<reason_code>:<evidence_fingerprint>
```

Este ID:

- no corresponde a una fila administrable;
- no se incluye en `LaneDecision.matched_deny_ids`;
- no puede revocarse;
- no puede editarse desde VISO;
- solo identifica evidencia dentro de la decisión y auditoría.

Si no existe una clave canónica resoluble, la condición se registra solo en
`structural_denies` y `blocked_reasons`, no como `MatchedDeny`.

---

#### 16. Lane de structural deny

Un structural deny podrá utilizar:

| Alcance estructural                                | `lane`        |
| -------------------------------------------------- | ------------- |
| Bloquea toda evaluación                            | `ALL`         |
| Bloquea únicamente base                            | `BASE`        |
| Bloquea únicamente operación                       | `OPERATIONAL` |
| Ocurre antes de resolver carriles o no aplica lane | `null`        |

Ejemplos:

```text
EMPLOYEE_ACTOR_MISMATCH
→ ALL
```

```text
BASE_ROLE_AMBIGUOUS
→ BASE
```

```text
SHIFT_OVERLAP
→ OPERATIONAL
```

```text
PERMISSION_NOT_FOUND
→ null
```

---

#### 17. ACTOR_WIDE_DENY

Un `ACTOR_WIDE_DENY` es una denegación individual transversal para:

```text
empleado exacto
+
permission_key exacta
+
alcance exacto
+
vigencia exacta
```

Bloquea todos los carriles compatibles con la modalidad.

No bloquea:

- otros permisos;
- otros trabajadores;
- recursos fuera de su alcance;
- periodos fuera de su vigencia;
- actores no laborales.

---

#### 18. Lane de actor-wide deny

Todo actor-wide deny coincidente utiliza:

```text
deny_class = ACTOR_WIDE
lane = ALL
```

`ALL` significa:

```text
todos los carriles aplicables al permiso solicitado
```

No significa:

- todas las aplicaciones;
- todos los permisos;
- todos los recursos;
- todos los actores;
- todos los contextos futuros fuera de vigencia.

---

#### 19. Efecto por modalidad de actor-wide deny

| Modalidad              | Efecto                   |
| ---------------------- | ------------------------ |
| `BASE_ONLY`            | Bloquea base             |
| `OPERATIONAL_ONLY`     | Bloquea operación        |
| `BASE_OR_OPERATIONAL`  | Bloquea base y operación |
| `BASE_AND_OPERATIONAL` | Bloquea base y operación |

En todos los casos aplicables:

```text
final_decision será DENY
```

La consolidación formal corresponde a `AUTH-CTX-023`.

---

#### 20. BASE_LANE_DENY

Un `BASE_LANE_DENY` bloquea únicamente el carril base.

Debe cumplir:

```text
deny_class = BASE_LANE
lane = BASE
```

No bloquea el carril operativo.

No elimina grants operativos.

No cambia la modalidad del permiso.

---

#### 21. Efecto de BASE_LANE_DENY por modalidad

| Modalidad              | Resultado conceptual                      |
| ---------------------- | ----------------------------------------- |
| `BASE_ONLY`            | Decisión final bloqueada                  |
| `OPERATIONAL_ONLY`     | Deny incompatible; no coincide            |
| `BASE_OR_OPERATIONAL`  | Base bloqueado; operación puede autorizar |
| `BASE_AND_OPERATIONAL` | Decisión final bloqueada                  |

Una fila base para un permiso `OPERATIONAL_ONLY` es una incompatibilidad de
configuración y no un deny coincidente.

---

#### 22. OPERATIONAL_LANE_DENY

Un `OPERATIONAL_LANE_DENY` bloquea únicamente el carril operativo.

Debe cumplir:

```text
deny_class = OPERATIONAL_LANE
lane = OPERATIONAL
```

No bloquea el carril base.

No elimina grants base.

No cambia los prerrequisitos.

---

#### 23. Efecto de OPERATIONAL_LANE_DENY por modalidad

| Modalidad              | Resultado conceptual                      |
| ---------------------- | ----------------------------------------- |
| `BASE_ONLY`            | Deny incompatible; no coincide            |
| `OPERATIONAL_ONLY`     | Decisión final bloqueada                  |
| `BASE_OR_OPERATIONAL`  | Operación bloqueada; base puede autorizar |
| `BASE_AND_OPERATIONAL` | Decisión final bloqueada                  |

Una fila operativa para un permiso `BASE_ONLY` es una incompatibilidad
contractual.

---

#### 24. DEFAULT_DENY

`DEFAULT_DENY` ocurre cuando:

- el carril es aplicable;
- el contexto requerido es evaluable;
- no existe una denegación explícita que explique el resultado;
- no existe un allow completo.

Regla:

```text
SIN ALLOW COMPLETO
→ DEFAULT_DENY
```

No requiere una fila almacenada.

No es una sanción.

No es una excepción individual.

---

#### 25. Default deny no administrable

Queda prohibido insertar:

```text
deny_class = DEFAULT
```

en el dataset de overrides.

`DEFAULT_DENY` es una política del evaluador.

Revocar un `DEFAULT_DENY` solo es posible creando una concesión válida,
corrigiendo el contexto o corrigiendo el contrato correspondiente.

---

#### 26. Representación default en MatchedDeny

Cuando `DEFAULT_DENY` deba conservarse dentro de `matched_denies`, el
evaluador podrá producir un ID sintético determinista:

```text
default:<lane>:<permission_key>:<decision_fingerprint>
```

Reglas:

- no corresponde a una fila administrable;
- no se incluye en `LaneDecision.matched_deny_ids`;
- no puede editarse;
- no puede revocarse;
- no sustituye `DecisionReason`;
- se utiliza únicamente para evidencia estructurada.

Si la implementación decide no proyectarlo como `MatchedDeny`, deberá
conservarlo obligatoriamente como `DecisionReason` en `blocked_reasons`.

`AUTH-CTX-026` congelará una de las dos representaciones físicas sin cambiar
la semántica.

---

#### 27. Context deny y prerrequisitos

Las fallas de:

- turno;
- check-in;
- área;
- dispositivo;
- sensibilidad;
- dependencia;
- campos;
- concurrencia;

se representan mediante sus decisiones y `DecisionReason`.

No se materializan como denegaciones individuales.

Podrán clasificarse como structural o prerequisite blocking según su origen.

`AUTH-CTX-023` consolidará la categoría final.

---

#### 28. Dataset administrable

Las denegaciones administrables proceden de:

```text
vento.authorization.individual-overrides@1.0.0
```

El dataset inicial aprobado contiene:

```text
0 denegaciones base confirmadas
0 denegaciones operativas confirmadas
0 bloqueos transversales confirmados
```

Hash del seed inicial:

```text
sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10
```

El seed vacío es intencional.

No significa que el contrato esté incompleto.

---

#### 29. Dataset vacío y evaluación real

Con cero denies administrables:

- structural denies continúan aplicando;
- prerequisite failures continúan aplicando;
- resource failures continúan aplicando;
- device restrictions continúan aplicando;
- default deny continúa aplicando;
- allows no se convierten en bypass.

La ausencia de filas solo significa:

```text
no existe deny individual administrable confirmado
```

---

#### 30. source_kind de MatchedDeny

Valores normativos iniciales de `source_kind`:

| `deny_class`       | `source_kind`                 |
| ------------------ | ----------------------------- |
| `STRUCTURAL`       | `STRUCTURAL_RULE`             |
| `ACTOR_WIDE`       | `INDIVIDUAL_ACTOR_WIDE_DENY`  |
| `BASE_LANE`        | `INDIVIDUAL_BASE_DENY`        |
| `OPERATIONAL_LANE` | `INDIVIDUAL_OPERATIONAL_DENY` |
| `DEFAULT`          | `DEFAULT_POLICY`              |

No se utilizará como `source_kind`:

- nombre de tabla;
- ruta;
- componente;
- pantalla;
- rol;
- dispositivo;
- texto humano libre.

---

#### 31. Identidad de deny_id

Para denies administrables, `deny_id` deberá ser:

- estable;
- no vacío;
- resoluble;
- inmutable;
- único dentro del dataset;
- trazable a la aprobación correspondiente.

No podrá ser:

- índice de arreglo;
- posición de fila;
- nombre humano;
- permiso;
- employee_id;
- hash temporal no estable;
- ID generado por frontend.

---

#### 32. Unicidad global

Dentro de una decisión:

```text
deny_id
→ una única evidencia de deny
```

Si dos filas distintas comparten `deny_id`:

```text
DENY_ID_COLLISION
→ structural deny
→ fail closed
```

No se elegirá:

- la primera;
- la más nueva;
- la más específica;
- la transversal;
- la de carril.

---

#### 33. permission_key en structural deny

Cuando un structural deny ocurre después de resolver el permiso:

```text
permission_key = clave canónica solicitada
```

Cuando ocurre antes de resolver una clave válida:

- no se inventa una clave;
- no se usa la cadena desconocida como clave canónica;
- no se crea `MatchedDeny`;
- se registra `DecisionReason`.

Esto evita violar el contrato de `MatchedDeny`.

---

#### 34. reason_code

Todo `MatchedDeny` deberá contener un `reason_code` canónico.

El código:

- identifica la causa;
- no contiene PII;
- no contiene texto libre;
- no contiene nombres;
- no contiene secretos;
- no sustituye la evidencia;
- no sustituye el mensaje seguro de UI.

La prioridad de razones se definirá en `AUTH-CTX-023`.

---

#### 35. Motivo humano administrable

Una denegación administrable podrá conservar internamente:

- motivo;
- evidencia aprobatoria;
- persona aprobadora;
- vigencia;
- referencia administrativa.

Estos datos no forman parte de `MatchedDeny@1.0.0`.

Se conservarán en la fuente y en auditoría autorizada.

No deberán exponerse al cliente ordinario.

---

#### 36. Vigencia

Una denegación administrable coincide únicamente cuando está activa en:

```text
AuthorizationDecision.decided_at
```

Regla de inicio:

```text
starts_at <= decided_at
```

Regla de fin cuando existe:

```text
decided_at < ends_at
```

Una denegación:

- futura;
- expirada;
- revocada;
- suspendida;
- reemplazada;

no coincide.

---

#### 37. matched_validity

`matched_validity = true` exige:

- estado activo;
- periodo vigente;
- dataset compatible;
- revisión válida;
- no revocada;
- no reemplazada;
- sujeto todavía identificable.

No basta con:

```text
is_active = true
```

si la fecha o versión no coincide.

---

#### 38. Revocación

Revocar una denegación significa:

```text
la denegación deja de coincidir
```

No significa:

```text
crear allow
```

Después de revocar:

1. se reevalúa el permiso;
2. se buscan allows;
3. se aplican otros denies;
4. se aplican prerrequisitos;
5. se aplica default deny si no existe allow.

---

#### 39. Revocación retroactiva prohibida

La revocación actual no modifica una decisión histórica.

Una decisión emitida conserva:

- denies que coincidieron;
- vigencia evaluada;
- razón;
- snapshot;
- resultado.

La nueva realidad produce una nueva decisión.

---

#### 40. Alcance de la denegación

Una denegación administrable deberá declarar un alcance compatible con el
permiso.

Podrá utilizar:

- alcance global ordinario;
- organización;
- sedes;
- sede específica;
- tipo de sede;
- áreas;
- área específica;
- tipo de área;
- propiedad;
- contexto operativo;
- perfil compuesto canónico.

No podrá utilizar texto libre como regla de autorización.

---

#### 41. Deny sin alcance

Un deny sin scope explícito no se interpretará automáticamente como global.

El contrato físico deberá distinguir entre:

```text
scope global explícito
```

y:

```text
scope ausente o inválido
```

Un scope ausente produce configuración inválida y fail closed de forma
controlada.

No se ampliará silenciosamente el bloqueo.

---

#### 42. matched_territory

`matched_territory = true` significa que la denegación cubre todas las
dimensiones territoriales exigidas.

Puede incluir:

- organización;
- sede;
- área;
- tipo de sede;
- tipo de área;
- origen;
- destino;
- ruta;
- vehículo;
- entorno aislado;
- lados obligatorios.

Una coincidencia parcial no es deny coincidente.

---

#### 43. Denegación no territorial

Para un permiso contractualmente no territorial:

```text
matched_territory = true
```

solo cuando:

- el permiso admite scope no territorial;
- el deny declara ese alcance;
- no se está omitiendo una dimensión obligatoria.

Una lista vacía no demuestra no territorialidad.

---

#### 44. matched_resource

`matched_resource = true` exige que la denegación coincida con:

- tipo de recurso;
- recurso exacto o conjunto permitido;
- relación empresarial;
- propiedad cuando aplica;
- custodia cuando aplica;
- estado cuando forma parte del scope;
- transición;
- lados obligatorios;
- forma de solicitud.

No basta con que la sede coincida.

---

#### 45. Deny por propiedad

Una denegación `OWN` podrá bloquear únicamente recursos cuya relación de
propiedad o atribución coincida con el contrato.

No se utiliza universalmente:

```text
created_by = employee_id
```

La propiedad no elimina la comprobación territorial.

---

#### 46. Estado del recurso

Una denegación puede estar limitada a un estado cuando su contrato lo
permite.

Ejemplo:

```text
bloquear cancelación
solo para remisiones en tránsito
```

La coincidencia exige el estado exacto.

Un deny sin condición de estado no deberá inventarla.

---

#### 47. Lados obligatorios

Cuando el recurso tiene varios lados, la denegación deberá declarar qué lado
cubre.

Ejemplo:

```text
deny de recepción en VENTO_CAFE
```

no bloquea automáticamente:

```text
preparación en CENTRO_PRODUCCION
```

La coincidencia con destino no implica coincidencia con origen.

---

#### 48. Recursos multiterritoriales

Para un recurso con varios territorios:

- la denegación puede cubrir un lado;
- puede cubrir varios lados;
- puede ser transversal si el contrato lo permite;
- no se amplía por inferencia.

La decisión final utilizará la relación entre:

- acción;
- permiso;
- lado requerido;
- deny coincidente.

---

#### 49. Colecciones

Para `COLLECTION`, una denegación puede:

- excluir miembros coincidentes en lecturas parciales cuando el contrato lo
  permita;
- bloquear la colección completa si la operación exige `ALL_OR_NOTHING`;
- generar resultados por miembro si el contrato admite parcialidad.

No se recuperan miembros denegados para filtrarlos únicamente en frontend.

---

#### 50. Agregados

Un deny aplicable impide que los datos correspondientes contribuyan al
agregado.

Reglas:

- no se incluyen valores denegados;
- no se revelan por diferencias;
- no se muestran conteos que permitan inferencia;
- un deny local no bloquea territorios no coincidentes;
- un actor-wide deny transversal sí bloquea la capacidad exacta completa.

---

#### 51. Operaciones masivas

Para `BULK`:

| Política               | Efecto de un deny en un miembro                   |
| ---------------------- | ------------------------------------------------- |
| `ALL_OR_NOTHING`       | Bloquea la operación completa                     |
| `PARTIAL_WITH_RESULTS` | Bloquea ese miembro y conserva resultado separado |

La política procede del contrato.

No se elige la alternativa más permisiva.

---

#### 52. Campos protegidos

Una política de campos no se convierte automáticamente en `MatchedDeny`.

Los campos bloqueados se representan en:

```text
field_policy_decision
```

Cuando el bloqueo de campo invalida la operación completa:

- se crea `DecisionReason`;
- `AUTH-CTX-023` produce `DENY`;
- no se crea un deny individual administrable.

---

#### 53. Dispositivo compartido

Una restricción de dispositivo no se convierte en actor-wide deny ni lane
deny.

Se representa en:

```text
device_decision
```

El dispositivo:

- no es sujeto de un deny individual laboral;
- no transfiere denies;
- no elimina denies;
- no reduce la vigencia;
- no modifica el alcance.

Una sesión de actor inválida puede producir structural deny.

---

#### 54. Sensibilidad y reautenticación

Una exigencia de reautenticación fallida no es un deny individual.

Se registra en:

```text
sensitivity_decision
```

Puede bloquear la decisión final sin alterar:

- grants coincidentes;
- denies administrables;
- matrices;
- contexto laboral.

---

#### 55. Dependencias

Una dependencia denegada produce su propia decisión.

No se copia su `MatchedDeny` dentro de la colección del permiso principal.

El permiso principal recibe una razón de dependencia fallida.

Esto evita mezclar:

```text
deny de dependencia
con
deny del permiso principal
```

---

#### 56. Deny y allows coincidentes

Un deny aplicable no elimina los allows que coincidieron.

Ejemplo:

```text
matched_allows = [grant_A, grant_B]
matched_denies = [deny_X]
```

Resultado posterior:

```text
DENY
```

La evidencia positiva permanece para explicar:

```text
existía autoridad concedida
pero fue bloqueada
```

---

#### 57. Specificity no altera precedencia

La especificidad determina si un deny coincide.

No determina si puede ser vencido.

Queda prohibido:

```text
allow de área
>
deny de sede
```

si ambos coinciden con el recurso.

Una vez coincidente:

```text
DENY
>
ALLOW
```

---

#### 58. Múltiples denegaciones coincidentes

Pueden coincidir simultáneamente:

- structural deny;
- actor-wide deny;
- base lane deny;
- operational lane deny;
- default deny en otro carril;
- restricciones separadas.

Todas las razones relevantes se conservan.

No se elige únicamente la “más fuerte” para borrar las demás.

AUTH-CTX-023 elegirá una razón primaria.

---

#### 59. Actor-wide y lane deny simultáneos

Si coinciden:

```text
ACTOR_WIDE_DENY
+
LANE_DENY
```

se conservan ambos.

La precedencia determina que actor-wide es la categoría primaria superior.

El lane deny continúa siendo evidencia válida.

---

#### 60. Structural y actor-wide simultáneos

Si el contexto permite identificar el actor y el deny antes de detectar una
invalidez posterior, podrán conservarse ambas evidencias.

Si la invalidez estructural impide resolver de forma confiable:

- actor;
- permiso;
- recurso;

no se buscarán denies administrables con datos ambiguos.

Fail closed no significa inventar coincidencias.

---

#### 61. Default deny y explicit deny

Cuando existe un explicit deny aplicable, no se utiliza `DEFAULT_DENY` como
explicación principal del mismo carril.

Regla:

```text
EXPLICIT DENY
→ causa suficiente
```

`DEFAULT_DENY` se reserva para ausencia de allow sin explicit deny
coincidente.

---

#### 62. Relación con matched_deny_ids

La consistencia obligatoria es:

```text
base_decision.matched_deny_ids
=
deny_id administrables de matched_denies
donde lane = BASE o lane = ALL
y que bloquean base
```

```text
operational_decision.matched_deny_ids
=
deny_id administrables de matched_denies
donde lane = OPERATIONAL o lane = ALL
y que bloquean operación
```

No se incluyen:

- IDs sintéticos structural;
- IDs sintéticos default;
- `DecisionReason`;
- restricciones de dispositivo;
- fallas de campos;
- fallas de sensibilidad.

---

#### 63. Outcome de carril con lane deny

Cuando un lane deny coincide con un carril aplicable:

```text
lane.outcome = DENY
```

aunque existan allows completos.

El carril no aplicable permanece:

```text
NOT_APPLICABLE
```

No se convierte a `DENY` por una fila incompatible.

---

#### 64. Outcome con actor-wide deny

Cuando coincide un actor-wide deny:

- cada carril compatible evaluado produce bloqueo;
- los allows se conservan;
- los matched deny IDs se proyectan en los carriles compatibles;
- la decisión final será `DENY`.

La composición definitiva corresponde a `AUTH-CTX-023`.

---

#### 65. blocked_reasons

`blocked_reasons` será la colección consolidada de razones bloqueantes.

AUTH-CTX-022 aporta:

- razones estructurales;
- razones de actor-wide deny;
- razones de lane deny;
- razón de default deny cuando corresponda.

AUTH-CTX-023 agregará y ordenará:

- prerrequisitos;
- recurso;
- dispositivo;
- sensibilidad;
- campos;
- dependencias;
- concurrencia;
- combinación.

---

#### 66. structural_denies

`structural_denies` contiene exclusivamente razones de categoría estructural
bloqueante.

Todo elemento deberá declarar:

```text
severity = BLOCKING
```

No contiene:

- actor-wide denies administrables;
- lane denies administrables;
- default deny;
- advertencias meramente informativas.

---

#### 67. actor_wide_denies

`actor_wide_denies` contiene un `DecisionReason` por cada actor-wide deny
coincidente.

Reglas:

- `lane = ALL`;
- `severity = BLOCKING`;
- `source` identifica la fuente canónica sin revelar secretos;
- `safe_to_expose` depende del catálogo de mensajes;
- no se agregan denies descartados.

---

#### 68. lane_denies

`lane_denies` contiene razones de:

- `BASE_LANE_DENY`;
- `OPERATIONAL_LANE_DENY`.

Cada razón conserva:

- lane exacta;
- código;
- severidad;
- fuente;
- política de exposición.

No se fusionan ambos carriles en una sola razón.

---

#### 69. Reason codes iniciales

Códigos iniciales reservados:

```text
STRUCTURAL_AUTHENTICATION_INVALID
STRUCTURAL_ACTOR_UNRESOLVED
STRUCTURAL_ACTOR_AMBIGUOUS
STRUCTURAL_EMPLOYEE_INACTIVE
STRUCTURAL_APPLICATION_INVALID
STRUCTURAL_PERMISSION_INVALID
STRUCTURAL_CONTRACT_INVALID
STRUCTURAL_CONTEXT_STALE
STRUCTURAL_RESOURCE_UNRESOLVED
STRUCTURAL_RESOURCE_CONFLICT
STRUCTURAL_TERRITORY_CONFLICT
STRUCTURAL_DATASET_VERSION_MISMATCH
STRUCTURAL_DENY_ID_COLLISION
ACTOR_WIDE_DENY_MATCHED
BASE_LANE_DENY_MATCHED
OPERATIONAL_LANE_DENY_MATCHED
DEFAULT_DENY_NO_MATCHING_ALLOW
DENY_CONFIGURATION_INVALID
DENY_PERMISSION_MISMATCH
DENY_ACTOR_MISMATCH
DENY_LANE_MISMATCH
DENY_SCOPE_MISMATCH
DENY_TERRITORY_MISMATCH
DENY_RESOURCE_MISMATCH
DENY_NOT_YET_ACTIVE
DENY_EXPIRED
DENY_REVOKED
```

AUTH-CTX-023 congelará prioridad y razón primaria.

BLOQUE S definirá mensajes de UI.

---

#### 70. Proyección segura al cliente

La proyección cliente ordinaria no deberá revelar:

- `deny_id`;
- motivo disciplinario;
- aprobador;
- evidencia interna;
- alcance completo;
- vigencia exacta;
- estructura de matrices;
- existencia de otros grants;
- detalles de seguridad.

Podrá exponer únicamente:

- código seguro;
- mensaje permitido;
- acción de recuperación;
- contacto o flujo autorizado;
- carácter temporal cuando sea seguro.

---

#### 71. VISO y administración

La futura interfaz administrativa deberá diferenciar:

```text
● Bloquear en todos los carriles
○ Bloquear solo carril base
○ Bloquear solo carril operativo
```

Y deberá exigir:

- trabajador exacto;
- permiso exacto;
- alcance;
- vigencia;
- motivo;
- aprobación;
- vista previa del efecto;
- confirmación;
- auditoría.

La interfaz no se implementa en esta tarea.

Su diseño físico corresponde a los roadmaps funcionales y paquetes
posteriores.

---

#### 72. Simulación

La simulación podrá mostrar:

- qué denegaciones coincidirían;
- qué carriles bloquearían;
- qué allows quedarían neutralizados;
- cuál sería el resultado hipotético.

No podrá:

- crear denies;
- revocar denies;
- modificar vigencia;
- ejecutar autoridad;
- revelar motivos sensibles a actores no autorizados.

Los resultados simulados no se registran como decisiones reales de
ejecución.

---

#### 73. Procesos SYSTEM

Las denegaciones individuales definidas aquí pertenecen a trabajadores.

Un proceso `SYSTEM` autónomo no se proyecta como empleado para consumir:

- actor-wide deny;
- base lane deny;
- operational lane deny.

Las restricciones de procesos de sistema deberán diseñarse en
`AUTH-CTX-026`.

Si requieren una nueva clase contractual, deberá versionarse el contrato.

---

#### 74. Compatibilidad legacy

Las filas legacy con `is_allowed = false` no se aceptan automáticamente.

AUTH-CTX-028 deberá:

- identificar sujeto;
- resolver permiso canónico;
- clasificar carril;
- resolver alcance;
- resolver vigencia;
- eliminar duplicados;
- verificar motivo;
- detectar aliases;
- impedir expansión uno-a-muchos;
- producir IDs estables;
- someter el resultado a revisión humana.

Cero expansión automática.

---

#### 75. Casos de ejemplo

##### Caso A — Actor-wide deny

```text
empleado exacto
permission_key exacta
deny_class = ACTOR_WIDE
scope coincide
vigencia activa
```

Resultado:

```text
MatchedDeny ACTOR_WIDE
lane = ALL
```

##### Caso B — Deny de otro trabajador

```text
deny.employee_id != actor.employee_id
```

Resultado:

```text
no MatchedDeny
```

##### Caso C — Base lane deny en BASE_OR_OPERATIONAL

```text
base deny coincide
operational allow coincide
```

Resultado conceptual:

```text
base = DENY
operational = ALLOW
final puede ser ALLOW
```

##### Caso D — Operational lane deny en BASE_AND_OPERATIONAL

```text
base allow
operational deny
```

Resultado:

```text
final DENY
```

##### Caso E — Allow más específico

```text
deny de sede coincide
allow de área coincide
```

Resultado:

```text
DENY prevalece
```

##### Caso F — Deny expirado

```text
ends_at <= decided_at
```

Resultado:

```text
no MatchedDeny
```

##### Caso G — Revocar deny

```text
deny revocado
sin allow aplicable
```

Resultado:

```text
DEFAULT_DENY
```

##### Caso H — Structural deny de actor

```text
EMPLOYEE_ACTOR_MISMATCH
```

Resultado:

```text
structural_denies incluye razón
lane = ALL
```

##### Caso I — Default deny

```text
contexto válido
sin explicit deny
sin allow
```

Resultado:

```text
DEFAULT_DENY
```

##### Caso J — Recurso fuera del scope del deny

```text
deny = VENTO_CAFE
resource = SAUDO
```

Resultado:

```text
no MatchedDeny
```

##### Caso K — Remisión con lado distinto

```text
deny cubre destination
acción exige origin
```

Resultado:

```text
no coincidencia salvo contrato explícito
```

##### Caso L — Dos denies coincidentes

```text
actor-wide deny
base lane deny
```

Resultado:

```text
ambos se conservan
actor-wide tiene mayor precedencia
```

##### Caso M — Dispositivo bloquea

```text
sin deny individual
device_decision = FAIL
```

Resultado:

```text
no MatchedDeny administrable
blocked_reason de dispositivo
```

##### Caso N — Deny legacy one-to-many

```text
legacy_permission amplio
→ tres permisos canónicos
```

Resultado:

```text
no expansión automática
revisión humana
```

##### Caso O — Permission key inválida

```text
permission no canónica
```

Resultado:

```text
DecisionReason estructural
no MatchedDeny con clave inventada
```

---

#### 76. Antipatrones prohibidos

```ts
if (deny.permission_key.startsWith(request.permission_key)) {
  return false;
}
```

```ts
const denied = denies.some(
  (deny) => deny.employee_id === employeeId
);
```

```ts
if (allow.scope_is_more_specific) {
  ignoreDeny();
}
```

```ts
if (!deny.is_active) {
  return true;
}
```

```ts
const deny = {
  permission_key: `${appCode}.*`,
  lane: "ALL",
};
```

```ts
const deviceDeny = {
  deny_class: "ACTOR_WIDE",
  employee_id: device.auth_user_id,
};
```

También queda prohibido:

```text
deny almacenado → deny coincidente
deny de app → bloquear todo
deny de rol → bloquear trabajadores
deny base → bloquear operación
deny operativo → bloquear base
deny expirado → continuar bloqueando
revocar deny → conceder
allow específico → vencer deny
lista vacía → global
scope ausente → global
misma sede → mismo recurso
default deny → fila administrable
restricción de dispositivo → deny individual
motivo sensible → mensaje cliente
```

---

#### 77. Relación con tareas posteriores

| Tarea                         | Responsabilidad posterior                                                                                  |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `AUTH-CTX-023`                | Consolidar precedencia, blocked reasons, combinación, razón primaria y decisión final                      |
| `AUTH-CTX-024`                | Registrar denies, fuentes, IDs, datasets, hashes, vigencias, recurso y resultado                           |
| `AUTH-CTX-025`                | Diseñar `get_access_context`; no consultar denies como fuente de identidad                                 |
| `AUTH-CTX-026`                | Diseñar matchers físicos, IDs sintéticos, representación default, procesos SYSTEM y frontera transaccional |
| `AUTH-CTX-027`                | Eliminar denegaciones locales, fallbacks y precedencias reinterpretadas por aplicaciones                   |
| `AUTH-CTX-028`                | Adaptar `is_allowed = false`, aliases, duplicados, scopes legacy y consumidores booleanos                  |
| `AUTH-CTX-029`                | Invalidar decisiones por creación, modificación, revocación o expiración de denies                         |
| `AUTH-CTX-030`                | Probar precedencia, matching, vigencia, territorio, recurso, múltiples denies y exposición segura          |
| `AUTH-DB-006` a `AUTH-DB-010` | Aplicar la decisión canónica dentro de RPC sensibles                                                       |
| `AUTH-DB-011`                 | Crear constraints después de inventario, backfill y reconciliación                                         |
| `AUTH-DB-020`                 | Migrar y clasificar denegaciones legacy                                                                    |
| `AUTH-DB-027`                 | Probar integridad, RLS, RPC, datasets y migraciones                                                        |
| `AUTH-DB-030`                 | Retirar precedencias y funciones legacy                                                                    |
| `AUTH-DB-031`                 | Certificar paridad documental, técnica y operativa                                                         |
| `GAP-CTRL-001`                | Consolidar brechas de denegaciones y consumidores antes de implementación                                  |
| `GAP-CTRL-006`                | Vincular brechas con tareas y paquetes implementables                                                      |
| BLOQUE S                      | Diseñar mensajes seguros y experiencia de bloqueo                                                          |

---

#### 78. Fuera del alcance

AUTH-CTX-022 no:

- crea denegaciones;
- modifica denegaciones;
- revoca denegaciones;
- cambia matrices;
- cambia grants;
- cambia modalidades;
- cambia scopes;
- modifica datasets;
- modifica hashes;
- crea tablas;
- crea funciones;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- implementa VISO;
- define mensajes finales;
- decide retención física;
- resuelve procesos disciplinarios;
- produce todavía la decisión final completa.

Cada responsabilidad posterior tiene destino explícito en la sección 77.

---

#### 79. Riesgos controlados

| Riesgo                                               | Control canónico                                           |
| ---------------------------------------------------- | ---------------------------------------------------------- |
| Deny por prefijo bloquea capacidades no relacionadas | Permiso exacto obligatorio                                 |
| Deny de otro trabajador coincide                     | Actor exacto obligatorio                                   |
| Deny de carril bloquea ambos                         | Lane explícita y modalidad compatible                      |
| Allow más específico vence deny                      | Deny coincidente siempre prevalece                         |
| Scope ausente se interpreta como global              | Scope ausente es inválido                                  |
| Revocar deny concede permiso                         | Reevaluación completa y default deny                       |
| Structural deny se administra desde VISO             | Structural permanece fuera del dataset                     |
| Default deny se materializa como fila                | Política del evaluador, no override                        |
| Dispositivo se convierte en sujeto                   | Denies administrables pertenecen al empleado               |
| Motivo disciplinario llega al cliente                | Proyección segura separada                                 |
| Deny legacy amplio se expande                        | Cero expansión uno-a-muchos                                |
| Colisión de IDs se resuelve arbitrariamente          | Structural deny y fail closed                              |
| Múltiples denies pierden evidencia                   | Todas las coincidencias se conservan                       |
| Deny borra allows                                    | Evidencias positivas y negativas permanecen separadas      |
| Seed vacío desactiva seguridad                       | Structural, restricciones y default deny continúan activos |

---

#### 80. Criterios de aprobación

AUTH-CTX-022 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `MatchedDeny`;
2. se conserva la forma de `DecisionReason`;
3. se conservan las cinco colecciones afectadas;
4. no se agregan campos;
5. deny almacenado no significa deny coincidente;
6. solo se serializan coincidencias completas;
7. los cuatro booleanos de matching son true en `MatchedDeny`;
8. candidatos parciales no aparecen;
9. existen structural, actor-wide, base lane, operational lane y default;
10. las clases no se mezclan;
11. structural tiene mayor precedencia;
12. actor-wide precede a lane deny;
13. lane deny precede a allow;
14. allow precede a default deny;
15. el permiso debe coincidir exactamente;
16. no existen prefijos;
17. no existen wildcards;
18. no existen denies por módulo;
19. los denies administrables pertenecen a un empleado exacto;
20. no coinciden por nombre, correo o documento;
21. empleado inactivo conserva trazabilidad, pero ya está bloqueado estructuralmente;
22. structural deny no es administrable;
23. structural deny no se crea desde VISO;
24. el dataset no contiene structural denies;
25. un structural puede afectar ALL, BASE, OPERATIONAL o null;
26. un structural con clave canónica puede producir MatchedDeny sintético;
27. su ID sintético no es administrable;
28. su ID sintético no entra en matched_deny_ids;
29. sin clave canónica se usa únicamente DecisionReason;
30. actor-wide deny usa lane ALL;
31. actor-wide bloquea todos los carriles compatibles;
32. actor-wide no bloquea otros permisos;
33. base lane deny solo bloquea base;
34. base lane deny no bloquea operación;
35. base deny en OPERATIONAL_ONLY es incompatible;
36. operational lane deny solo bloquea operación;
37. operational lane deny no bloquea base;
38. operational deny en BASE_ONLY es incompatible;
39. en BASE_OR_OPERATIONAL el otro carril puede autorizar;
40. en BASE_AND_OPERATIONAL un lane deny bloquea el resultado final;
41. default deny significa ausencia de allow;
42. default deny no es sanción;
43. default deny no es fila administrable;
44. revocar default deny requiere crear autoridad válida o corregir contexto;
45. default puede usar ID sintético solo como evidencia;
46. el ID default no entra en matched_deny_ids;
47. AUTH-CTX-026 congelará su representación física;
48. prerrequisitos fallidos permanecen en decisiones separadas;
49. restricciones no se convierten en denies individuales;
50. el dataset administrable es `individual-overrides@1.0.0`;
51. su seed inicial contiene cero denies;
52. el seed vacío es intencional;
53. structural y default continúan activos con dataset vacío;
54. source_kind queda normalizado;
55. deny_id administrable es estable;
56. deny_id no es índice local;
57. una colisión produce fail closed;
58. no se elige una fila en conflicto;
59. permission_key estructural solo se usa si es canónica;
60. no se inventa permission_key;
61. reason_code es canónico;
62. reason_code no contiene PII;
63. motivo humano permanece fuera de MatchedDeny;
64. la vigencia usa decided_at;
65. deny futuro no coincide;
66. deny expirado no coincide;
67. deny revocado no coincide;
68. matched_validity exige más que is_active;
69. revocar deny no crea allow;
70. la revocación no modifica decisiones históricas;
71. una nueva realidad produce una nueva decisión;
72. todo deny administrable exige scope compatible;
73. scope ausente no significa global;
74. scope inválido falla cerrado sin ampliar bloqueo;
75. matched_territory cubre todas las dimensiones obligatorias;
76. listas vacías no prueban no territorialidad;
77. matched_resource exige recurso y condiciones exactas;
78. misma sede no basta;
79. OWN usa relación contractual;
80. el estado del recurso puede limitar el deny;
81. los lados obligatorios permanecen separados;
82. origen no equivale a destino;
83. multiterritorio no se amplía por inferencia;
84. colecciones respetan parcialidad contractual;
85. agregados excluyen datos denegados;
86. bulk respeta ALL_OR_NOTHING o PARTIAL_WITH_RESULTS;
87. campos protegidos permanecen en field_policy_decision;
88. dispositivo permanece en device_decision;
89. sensibilidad permanece en sensitivity_decision;
90. dependencias producen decisiones separadas;
91. deny no borra allows;
92. especificidad no altera precedencia;
93. pueden coincidir varios denies;
94. todas las evidencias relevantes se conservan;
95. actor-wide y lane deny pueden coexistir;
96. structural puede coexistir cuando la resolución es confiable;
97. fail closed no inventa coincidencias;
98. explicit deny desplaza default deny como explicación del carril;
99. matched_deny_ids solo contiene denies administrables;
100. IDs sintéticos no entran en LaneDecision;
101. un lane deny convierte el carril aplicable en DENY;
102. una fila incompatible no cambia NOT_APPLICABLE;
103. actor-wide bloquea los carriles compatibles;
104. blocked_reasons se consolidará en AUTH-CTX-023;
105. structural_denies solo contiene razones estructurales;
106. actor_wide_denies solo contiene razones transversales coincidentes;
107. lane_denies conserva cada lane exacta;
108. reason codes quedan normalizados;
109. prioridad final se define en AUTH-CTX-023;
110. la proyección cliente no revela deny_id;
111. la proyección cliente no revela motivos sensibles;
112. VISO deberá exigir trabajador, permiso, alcance, vigencia, motivo y aprobación;
113. simulación no crea ni revoca denies;
114. procesos SYSTEM no se convierten en empleados;
115. una nueva clase SYSTEM exigiría versionado;
116. legacy requiere adaptación explícita;
117. legacy one-to-many no se expande;
118. la decisión es inmutable;
119. la auditoría conservará evidencia completa autorizada;
120. AUTH-CTX-023 definirá decisión final y razón primaria;
121. AUTH-CTX-024 definirá auditoría;
122. AUTH-CTX-026 diseñará matchers físicos;
123. AUTH-CTX-027 eliminará precedencia local;
124. AUTH-CTX-028 gobernará compatibilidad legacy;
125. AUTH-CTX-029 gobernará invalidación;
126. AUTH-CTX-030 gobernará pruebas;
127. no se implementa código, migraciones ni cambios en Supabase.

---

#### 81. Cierre y continuidad de la propuesta

| Relación        | Tarea          | Estado        |
| --------------- | -------------- | ------------- |
| Tarea anterior  | `AUTH-CTX-021` | ✅ APROBADA    |
| Tarea propuesta | `AUTH-CTX-022` | ✅ APROBADA    |
| Tarea siguiente | `AUTH-CTX-023` | ⬜ NO INICIADA |

```text
AUTH-CTX-021 — APROBADA
        ↓
AUTH-CTX-022 — APROBADA
        ↓
AUTH-CTX-023 — NO INICIADA
```

No se avanza a `AUTH-CTX-023` hasta recibir aprobación explícita de
`AUTH-CTX-022`.

### ✅ AUTH-CTX-023 — Incluir decisión final y razones

| Campo                            | Valor                                                                               |
| -------------------------------- | ----------------------------------------------------------------------------------- |
| **Estado**                       | APROBADA                                                                            |
| **Bloque**                       | BLOQUE E — Contexto y decisión de autorización unificados                           |
| **Subbloque**                    | `AUTHORIZATION DECISION`                                                            |
| **Naturaleza**                   | Definición documental de `combination`, `final_decision` y razones estructuradas    |
| **Implementación física**        | No incluida                                                                         |
| **Tarea anterior vigente**       | `AUTH-CTX-022` — APROBADA                                                           |
| **Tarea posterior reservada**    | `AUTH-CTX-024` — Incluir datos de auditoría                                         |
| **Contrato afectado**            | `AuthorizationDecision@1.0.0`                                                       |
| **Campos principales afectados** | `combination`, `final_decision`, `blocked_reasons` y `reason_codes` de los carriles |
| **Tipos principales afectados**  | `DecisionCombination`, `FinalDecision`, `DecisionReason`                            |
| **Cambio contractual**           | Aclaración normativa compatible; no cambia la forma publicada                       |
| **Cambios físicos permitidos**   | No                                                                                  |

Esta tarea define cómo Vento OS transforma:

```text
CARRIL BASE
+
CARRIL OPERATIVO
+
ALLOWS COINCIDENTES
+
DENIES COINCIDENTES
+
PRERREQUISITOS
+
RECURSO
+
RESTRICCIONES
```

en una única decisión final determinista, explicable y segura.

La regla central es:

```text
COMBINATION_RESULT = ALLOW
NO IMPLICA POR SÍ SOLO
FINAL_DECISION = ALLOW
```

```text
FINAL ALLOW
=
CONTRATO VÁLIDO
∩
CONTEXTO VÁLIDO
∩
RECURSO VÁLIDO
∩
SIN STRUCTURAL DENY
∩
SIN ACTOR-WIDE DENY
∩
COMBINACIÓN DE CARRILES SATISFECHA
∩
PRERREQUISITOS BLOQUEANTES SUPERADOS
∩
RESTRICCIONES BLOQUEANTES SUPERADAS
∩
POLÍTICA DE CAMPOS COMPATIBLE
∩
CONCURRENCIA E IDEMPOTENCIA VÁLIDAS CUANDO APLIQUEN
```

```text
CUALQUIER BLOQUEO APLICABLE
→ FINAL DENY
```

No implementa SQL, RPC, RLS, funciones, migraciones, tipos TypeScript,
JSON Schema, Zod, caché, interfaces ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir la decisión final de forma que Vento OS pueda responder
inequívocamente:

1. qué carriles eran aplicables;
2. qué resultado produjo cada carril;
3. qué regla de combinación correspondía;
4. qué carriles aportaron autoridad positiva;
5. qué carriles quedaron bloqueados;
6. si la combinación de carriles fue suficiente;
7. qué restricciones finales bloquearon la solicitud;
8. cuál fue el resultado final;
9. cuál es la categoría técnica primaria;
10. cuál es el código técnico primario;
11. qué razones adicionales se conservaron;
12. qué mensaje seguro puede recibir el cliente;
13. cómo se evita revelar denies sensibles;
14. cómo se representa `BASE_ONLY`;
15. cómo se representa `OPERATIONAL_ONLY`;
16. cómo se representa `BASE_OR_OPERATIONAL`;
17. cómo se representa `BASE_AND_OPERATIONAL`;
18. cómo se tratan dependencias;
19. cómo se tratan dispositivo y sensibilidad;
20. cómo se tratan campos parciales;
21. cómo se tratan estado, concurrencia e idempotencia;
22. cómo se tratan colecciones, agregados y operaciones masivas;
23. cómo se deduplican razones;
24. cómo se determina la razón primaria;
25. cómo se preservan determinismo, inmutabilidad y auditoría.

---

#### 2. Base normativa

AUTH-CTX-023 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` a `AUTH-MOD-020`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` — Contrato de `AccessContext`;
- `AUTH-CTX-002` — Contrato de `AuthorizationDecision`;
- `AUTH-CTX-004` — Versionado contractual;
- `AUTH-CTX-016` — Aplicación y permiso exactos;
- `AUTH-CTX-017` — Modalidad y prerrequisitos;
- `AUTH-CTX-018` — Recurso y territorio resueltos;
- `AUTH-CTX-019` — Decisión del carril base;
- `AUTH-CTX-020` — Decisión del carril operativo;
- `AUTH-CTX-021` — Allows coincidentes;
- `AUTH-CTX-022` — Denegaciones coincidentes.

Principios obligatorios:

```text
ALLOW DE CARRIL
≠
ALLOW FINAL
```

```text
DENY APLICABLE
>
ALLOW APLICABLE
```

```text
RAZÓN PRIMARIA
≠
ÚNICA RAZÓN
```

```text
RAZÓN TÉCNICA
≠
MENSAJE SEGURO PARA CLIENTE
```

```text
FINAL DECISION
≠
EJECUCIÓN DE LA ACCIÓN
```

```text
FINAL ALLOW
NO ES TOKEN
NO ES SESIÓN
NO ES CACHÉ PERMANENTE
```

---

#### 3. Forma contractual conservada

```ts
type DecisionCombination = {
  authorization_requirement:
    | "BASE_ONLY"
    | "OPERATIONAL_ONLY"
    | "BASE_OR_OPERATIONAL"
    | "BASE_AND_OPERATIONAL";

  base_outcome: "ALLOW" | "DENY" | "NOT_APPLICABLE";
  operational_outcome: "ALLOW" | "DENY" | "NOT_APPLICABLE";

  authorizing_lanes: AuthorizationLane[];
  blocked_lanes: AuthorizationLane[];

  combination_rule:
    | "BASE"
    | "OPERATIONAL"
    | "BASE_OR_OPERATIONAL"
    | "BASE_AND_OPERATIONAL";

  combination_result: "ALLOW" | "DENY";
};
```

```ts
type FinalDecision = {
  outcome: "ALLOW" | "DENY";

  reason_category:
    | "AUTHORIZED"
    | "STRUCTURAL_DENY"
    | "ACTOR_WIDE_DENY"
    | "LANE_DENY"
    | "PREREQUISITE_DENY"
    | "RESOURCE_DENY"
    | "DEVICE_DENY"
    | "SENSITIVITY_DENY"
    | "FIELD_POLICY_DENY"
    | "DEFAULT_DENY"
    | "CONTRACT_INVALID";

  primary_reason_code: string;
  authorizing_lanes: AuthorizationLane[];
  safe_message_code: string;
};
```

```ts
type DecisionReason = {
  reason_code: string;
  category: string;
  severity: "BLOCKING" | "INFORMATIONAL";
  lane: "BASE" | "OPERATIONAL" | "ALL" | null;
  source: string;
  safe_to_expose: boolean;
};
```

No se agregan, eliminan ni renombran campos.

---

#### 4. Campos afectados de AuthorizationDecision

```ts
combination: DecisionCombination;
final_decision: FinalDecision;
blocked_reasons: DecisionReason[];
```

Además se exige consistencia con:

```ts
base_decision.reason_codes: string[];
operational_decision.reason_codes: string[];
structural_denies: DecisionReason[];
actor_wide_denies: DecisionReason[];
lane_denies: DecisionReason[];
matched_allows: MatchedGrant[];
matched_denies: MatchedDeny[];
```

---

#### 5. Capas de decisión

La decisión completa se divide en cinco capas:

```text
CAPA 1 — VALIDEZ ESTRUCTURAL
CAPA 2 — RESULTADO DE CADA CARRIL
CAPA 3 — COMBINACIÓN POR MODALIDAD
CAPA 4 — RESTRICCIONES FINALES DE SOLICITUD
CAPA 5 — RESULTADO FINAL Y PROYECCIÓN SEGURA
```

Cada capa consume resultados anteriores.

Ninguna capa puede convertir una invalidez previa en allow.

---

#### 6. Secuencia canónica de consolidación

```text
1. Validar contrato, catálogo, contexto y recurso.
2. Consolidar structural_denies.
3. Consolidar actor_wide_denies.
4. Consolidar base_decision.
5. Consolidar operational_decision.
6. Construir combination según authorization_requirement.
7. Consolidar prerrequisitos y dependencias.
8. Consolidar device_decision.
9. Consolidar sensitivity_decision.
10. Consolidar field_policy_decision.
11. Consolidar estado, concurrencia e idempotencia.
12. Construir blocked_reasons.
13. Seleccionar primary_reason_code.
14. Derivar reason_category.
15. Derivar safe_message_code.
16. Emitir final_decision.
17. Congelar la decisión.
```

El orden es normativo para la explicación y el determinismo.

No autoriza por simple posición en la secuencia.

---

#### 7. Resultado de carril como entrada

AUTH-CTX-023 no recalcula grants ni denies.

Consume:

```text
base_decision.outcome
operational_decision.outcome
```

Los valores permitidos son:

```text
ALLOW
DENY
NOT_APPLICABLE
```

Cualquier valor desconocido produce:

```text
CONTRACT_INVALID
→ FINAL DENY
```

---

#### 8. Consistencia de carriles con modalidad

| Modalidad              | Base             | Operativo        |
| ---------------------- | ---------------- | ---------------- |
| `BASE_ONLY`            | Aplicable        | `NOT_APPLICABLE` |
| `OPERATIONAL_ONLY`     | `NOT_APPLICABLE` | Aplicable        |
| `BASE_OR_OPERATIONAL`  | Aplicable        | Aplicable        |
| `BASE_AND_OPERATIONAL` | Aplicable        | Aplicable        |

Una combinación incompatible es estructuralmente inválida.

Ejemplos:

```text
BASE_ONLY + operational = ALLOW
→ CONTRACT_INVALID
```

```text
BASE_AND_OPERATIONAL + base = NOT_APPLICABLE
→ CONTRACT_INVALID
```

---

#### 9. Construcción de DecisionCombination

`DecisionCombination` deberá ser una proyección determinista de:

```text
authorization_requirement
+
base_decision.outcome
+
operational_decision.outcome
```

No deberá consultar de nuevo:

- matrices;
- grants;
- roles;
- turnos;
- check-ins;
- dispositivo;
- recurso;
- datos del cliente.

La evidencia ya deberá estar consolidada en las decisiones previas.

---

#### 10. Regla BASE_ONLY

```text
authorization_requirement = BASE_ONLY
combination_rule = BASE
```

Resultado:

| Base    | Operativo        | combination_result |
| ------- | ---------------- | ------------------ |
| `ALLOW` | `NOT_APPLICABLE` | `ALLOW`            |
| `DENY`  | `NOT_APPLICABLE` | `DENY`             |

Invariantes:

```text
authorizing_lanes = [BASE]
solo cuando base = ALLOW
```

```text
blocked_lanes = [BASE]
solo cuando base = DENY
```

---

#### 11. Regla OPERATIONAL_ONLY

```text
authorization_requirement = OPERATIONAL_ONLY
combination_rule = OPERATIONAL
```

Resultado:

| Base             | Operativo | combination_result |
| ---------------- | --------- | ------------------ |
| `NOT_APPLICABLE` | `ALLOW`   | `ALLOW`            |
| `NOT_APPLICABLE` | `DENY`    | `DENY`             |

Invariantes:

```text
authorizing_lanes = [OPERATIONAL]
solo cuando operational = ALLOW
```

```text
blocked_lanes = [OPERATIONAL]
solo cuando operational = DENY
```

---

#### 12. Regla BASE_OR_OPERATIONAL

```text
authorization_requirement = BASE_OR_OPERATIONAL
combination_rule = BASE_OR_OPERATIONAL
```

Resultado:

| Base    | Operativo | combination_result | authorizing_lanes     |
| ------- | --------- | ------------------ | --------------------- |
| `ALLOW` | `ALLOW`   | `ALLOW`            | `[BASE, OPERATIONAL]` |
| `ALLOW` | `DENY`    | `ALLOW`            | `[BASE]`              |
| `DENY`  | `ALLOW`   | `ALLOW`            | `[OPERATIONAL]`       |
| `DENY`  | `DENY`    | `DENY`             | `[]`                  |

Los carriles no prestan fragmentos incompletos entre sí.

Un deny de carril no bloquea el otro carril en esta modalidad.

---

#### 13. Regla BASE_AND_OPERATIONAL

```text
authorization_requirement = BASE_AND_OPERATIONAL
combination_rule = BASE_AND_OPERATIONAL
```

Resultado:

| Base    | Operativo | combination_result |
| ------- | --------- | ------------------ |
| `ALLOW` | `ALLOW`   | `ALLOW`            |
| `ALLOW` | `DENY`    | `DENY`             |
| `DENY`  | `ALLOW`   | `DENY`             |
| `DENY`  | `DENY`    | `DENY`             |

Solo el caso `ALLOW + ALLOW` produce:

```text
authorizing_lanes = [BASE, OPERATIONAL]
```

Cualquier carril denegado queda en `blocked_lanes`.

---

#### 14. authorizing_lanes de la combinación

`combination.authorizing_lanes` contiene los carriles cuyo outcome fue
`ALLOW` y que participan positivamente en la regla de combinación.

Reglas:

- no contiene `NOT_APPLICABLE`;
- no contiene carriles `DENY`;
- no contiene duplicados;
- se ordena `BASE`, luego `OPERATIONAL`;
- puede contener ambos en `BASE_OR_OPERATIONAL`;
- no implica todavía que la decisión final sea allow.

---

#### 15. blocked_lanes de la combinación

`combination.blocked_lanes` contiene los carriles aplicables cuyo outcome fue
`DENY`.

No contiene:

- carriles no aplicables;
- restricciones de solicitud;
- fallas de campos;
- fallas de dispositivo que no pertenezcan al carril;
- razones informativas.

En `BASE_OR_OPERATIONAL` puede existir simultáneamente:

```text
authorizing_lanes = [OPERATIONAL]
blocked_lanes = [BASE]
combination_result = ALLOW
```

---

#### 16. combination_result

`combination_result` responde exclusivamente:

```text
¿LOS OUTCOMES DE CARRIL SATISFACEN LA MODALIDAD?
```

No responde todavía:

```text
¿LA SOLICITUD COMPLETA PUEDE EJECUTARSE?
```

Por tanto es válido:

```text
combination_result = ALLOW
final_decision.outcome = DENY
```

cuando una restricción final bloquea la solicitud.

---

#### 17. Bloqueos anteriores a la combinación

Los siguientes bloqueos impiden que la combinación produzca autoridad
utilizable:

- contrato incompatible;
- contexto inválido;
- actor no resoluble;
- aplicación o permiso inválidos;
- recurso no resoluble;
- structural deny global;
- actor-wide deny.

Cuando alguno impide evaluar de forma fiable los carriles:

```text
carriles aplicables = DENY
combination_result = DENY
final_decision = DENY
```

No se inventan resultados de carril.

---

#### 18. Bloqueos posteriores o transversales

Pueden bloquear una combinación positiva:

- dependencia obligatoria fallida;
- estado incompatible;
- required side fallido;
- dispositivo incompatible;
- reautenticación ausente;
- política de campos `FAIL`;
- concurrencia no validada;
- idempotencia inválida;
- restricción común de solicitud.

Estos bloqueos:

- no borran los allows;
- no alteran el historial de los carriles;
- se agregan a `blocked_reasons`;
- producen `final_decision.outcome = DENY`.

---

#### 19. Invariantes de FinalDecision

Todo `FinalDecision` deberá cumplir:

```text
outcome = ALLOW o DENY
```

Nunca:

```text
null
UNKNOWN
INDETERMINATE
PARTIAL
WOULD_ALLOW
```

Además:

- `primary_reason_code` siempre existe;
- `safe_message_code` siempre existe;
- `reason_category` siempre corresponde a la razón primaria;
- `authorizing_lanes` está deduplicado;
- la decisión final es inmutable.

---

#### 20. Invariantes de ALLOW final

Cuando:

```text
final_decision.outcome = ALLOW
```

se exige:

```text
combination.combination_result = ALLOW
blocked_reasons = []
final_decision.reason_category = AUTHORIZED
final_decision.primary_reason_code = AUTHORIZED
final_decision.safe_message_code = AUTHORIZATION_GRANTED
final_decision.authorizing_lanes = combination.authorizing_lanes
```

Además deberá existir al menos un `MatchedGrant` consistente con cada carril
autorizante.

---

#### 21. Invariantes de DENY final

Cuando:

```text
final_decision.outcome = DENY
```

se exige:

```text
blocked_reasons.length >= 1
final_decision.authorizing_lanes = []
final_decision.reason_category != AUTHORIZED
final_decision.primary_reason_code != AUTHORIZED
final_decision.safe_message_code != AUTHORIZATION_GRANTED
```

La evidencia positiva puede permanecer en:

```text
combination.authorizing_lanes
matched_allows
LaneDecision.matched_allow_ids
```

pero no se proyecta como autoridad final.

---

#### 22. Razón primaria frente a razones adicionales

`primary_reason_code` identifica una sola razón técnica principal.

`blocked_reasons` conserva todas las razones bloqueantes relevantes.

Regla:

```text
SELECCIONAR RAZÓN PRIMARIA
≠
ELIMINAR RAZONES SECUNDARIAS
```

La razón primaria se usa para:

- clasificación final;
- mensaje seguro;
- telemetría agregada;
- diagnóstico inicial.

La auditoría conserva el conjunto completo.

---

#### 23. Precedencia técnica para la razón primaria

Orden inicial de categorías:

```text
1. CONTRACT_INVALID
2. STRUCTURAL_DENY
3. ACTOR_WIDE_DENY
4. RESOURCE_DENY
5. PREREQUISITE_DENY
6. LANE_DENY
7. DEVICE_DENY
8. SENSITIVITY_DENY
9. FIELD_POLICY_DENY
10. DEFAULT_DENY
```

`AUTHORIZED` solo aplica cuando no existe bloqueo.

Esta precedencia selecciona explicación primaria.

No altera la precedencia de grants y denies definida previamente.

---

#### 24. Desempate determinista de razones

Cuando varias razones pertenecen a la misma prioridad:

1. razón `lane = ALL`;
2. razón `lane = null` de solicitud completa;
3. razón `lane = BASE`;
4. razón `lane = OPERATIONAL`;
5. `reason_code` en orden lexicográfico;
6. `source` en orden lexicográfico.

No se usa:

- orden de consulta;
- orden de inserción;
- primera fila física;
- mensaje humano;
- gravedad inferida por el frontend.

---

#### 25. CONTRACT_INVALID

`reason_category = CONTRACT_INVALID` aplica cuando la evaluación no puede
interpretarse conforme al contrato vigente.

Ejemplos:

- versión mayor incompatible;
- campo obligatorio ausente;
- enum crítico desconocido;
- modalidad incompatible con outcomes;
- dataset o hash incompatible;
- colisión de IDs;
- ciclo contractual de dependencias;
- decisión de carril internamente contradictoria.

Resultado:

```text
FINAL DENY
safe_message_code = ACCESS_NOT_AVAILABLE
```

---

#### 26. STRUCTURAL_DENY

Aplica a invalideces autoritativas del contexto o solicitud.

Ejemplos:

- autenticación inválida;
- actor no resoluble;
- empleado inactivo;
- aplicación inexistente;
- permiso inexistente;
- contexto obsoleto;
- territorio contradictorio;
- recurso no resoluble;
- entorno aislado no autorizado.

No puede superarse mediante grants.

---

#### 27. ACTOR_WIDE_DENY

Aplica cuando existe un bloqueo transversal coincidente para el actor y
permiso exactos.

Reglas:

```text
combination_result = DENY
final_decision.outcome = DENY
final_decision.reason_category = ACTOR_WIDE_DENY
```

El mensaje seguro no revela:

- motivo disciplinario;
- aprobador;
- vigencia exacta;
- deny_id;
- alcance administrativo interno.

---

#### 28. RESOURCE_DENY

Agrupa bloqueos cuya causa principal pertenece al recurso o a la ejecución
sobre ese recurso.

Incluye:

- recurso no disponible;
- estado incompatible;
- transición inválida;
- ownership inválido;
- required side ausente;
- conflicto de versión;
- concurrencia fallida;
- idempotencia inválida;
- miembro bulk no autorizable bajo política atómica.

No se usa para ocultar una falla de contrato.

---

#### 29. PREREQUISITE_DENY

Agrupa prerrequisitos obligatorios fallidos.

Incluye:

- turno requerido;
- check-in requerido;
- área activa requerida;
- dependencia de permiso;
- aprobación adicional contractual;
- requisito común de solicitud.

La razón deberá conservar el carril cuando sea específica.

---

#### 30. LANE_DENY

Aplica cuando la causa primaria es una denegación explícita o ausencia de
capacidad dentro de un carril, y la modalidad no queda satisfecha.

Incluye:

- base lane deny;
- operational lane deny;
- combinación `BASE_AND_OPERATIONAL` incompleta por deny de carril;
- `BASE_ONLY` con base denegado;
- `OPERATIONAL_ONLY` con operación denegada.

No se usa cuando la única causa es `DEFAULT_DENY`.

---

#### 31. DEVICE_DENY

Aplica cuando:

```text
device_decision.status = FAIL
```

y no existe una categoría superior aplicable.

El dispositivo restringe.

Nunca concede.

El mensaje seguro podrá indicar incompatibilidad del dispositivo sin revelar
capacidades internas completas.

---

#### 32. SENSITIVITY_DENY

Aplica cuando una capacidad sensible exige un control adicional no cumplido.

Ejemplos:

- reautenticación reciente;
- segundo factor;
- confirmación reforzada;
- motivo obligatorio;
- separación de funciones;
- aprobación adicional.

No elimina grants ni denies.

---

#### 33. FIELD_POLICY_DENY

Aplica cuando:

```text
field_policy_decision.status = FAIL
```

Una política `PARTIAL` no produce deny final cuando la operación puede
reducirse legítimamente a la proyección autorizada.

Una mutación inseparable con campos bloqueados produce deny.

---

#### 34. DEFAULT_DENY

Aplica únicamente cuando:

- el contrato es válido;
- el contexto es evaluable;
- no existe explicit deny superior;
- no existe allow completo suficiente;
- la modalidad no queda satisfecha.

Código primario inicial:

```text
DEFAULT_DENY_NO_MATCHING_ALLOW
```

No es una sanción ni una excepción administrable.

---

#### 35. blocked_reasons

`blocked_reasons` contiene exclusivamente razones con:

```text
severity = BLOCKING
```

Reglas:

- no contiene `AUTHORIZED`;
- no contiene razones meramente informativas;
- no contiene duplicados semánticos;
- conserva razones de todas las capas;
- usa orden determinista;
- permanece disponible para auditoría interna;
- se proyecta parcialmente al cliente según `safe_to_expose`.

---

#### 36. Fuentes que alimentan blocked_reasons

Como mínimo:

- `structural_denies`;
- `actor_wide_denies`;
- `lane_denies`;
- `base_decision.reason_codes` cuando bloquean;
- `operational_decision.reason_codes` cuando bloquean;
- `prerequisite_decisions` con `FAIL`;
- `device_decision.reason_codes` con `FAIL`;
- `sensitivity_decision.reason_codes` con `FAIL`;
- `field_policy_decision.reason_codes` con `FAIL`;
- razones de estado, concurrencia e idempotencia;
- default deny derivado.

No se copian cadenas sin normalizar.

---

#### 37. Normalización de DecisionReason

Toda razón consolidada deberá tener:

```text
reason_code no vacío
category no vacía
severity = BLOCKING
lane canónica
source canónica
safe_to_expose explícito
```

No se admiten:

- texto humano como `reason_code`;
- PII dentro del código;
- nombres de tablas como categoría;
- mensajes UI dentro de `source`;
- lane inferida por el cliente.

---

#### 38. Formato de reason_code

Forma recomendada:

```text
^[A-Z][A-Z0-9_]*$
```

Ejemplos:

```text
STRUCTURAL_ACTOR_UNRESOLVED
ACTIVE_SHIFT_REQUIRED
ACTIVE_CHECKIN_REQUIRED
RESOURCE_STATE_INVALID
BASE_LANE_DENY_MATCHED
DEFAULT_DENY_NO_MATCHING_ALLOW
```

No se utilizan espacios, puntos, guiones ni texto localizado.

---

#### 39. Familias iniciales de razones

```text
CONTRACT_*
STRUCTURAL_*
AUTHENTICATION_*
ACTOR_*
EMPLOYMENT_*
APPLICATION_*
PERMISSION_*
RESOURCE_*
TERRITORY_*
OWNERSHIP_*
STATE_*
BASE_*
OPERATIONAL_*
SHIFT_*
CHECKIN_*
AREA_*
DEVICE_*
SENSITIVITY_*
FIELD_POLICY_*
DEPENDENCY_*
CONCURRENCY_*
IDEMPOTENCY_*
DEFAULT_DENY_*
```

Las familias no sustituyen categorías contractuales.

---

#### 40. Catálogo técnico inicial de razones

Códigos iniciales mínimos:

```text
AUTHORIZED
CONTRACT_VERSION_INCOMPATIBLE
CONTRACT_REQUIRED_FIELD_MISSING
CONTRACT_CRITICAL_ENUM_UNKNOWN
CONTRACT_LANE_COMBINATION_INVALID
CONTRACT_DEPENDENCY_CYCLE
STRUCTURAL_AUTHENTICATION_INVALID
STRUCTURAL_ACTOR_UNRESOLVED
STRUCTURAL_ACTOR_AMBIGUOUS
STRUCTURAL_EMPLOYEE_INACTIVE
STRUCTURAL_APPLICATION_INVALID
STRUCTURAL_PERMISSION_INVALID
STRUCTURAL_CONTEXT_STALE
STRUCTURAL_RESOURCE_UNRESOLVED
STRUCTURAL_RESOURCE_CONFLICT
STRUCTURAL_TERRITORY_CONFLICT
STRUCTURAL_DATASET_VERSION_MISMATCH
STRUCTURAL_GRANT_ID_COLLISION
STRUCTURAL_DENY_ID_COLLISION
ACTOR_WIDE_DENY_MATCHED
BASE_LANE_DENY_MATCHED
OPERATIONAL_LANE_DENY_MATCHED
BASE_NO_MATCHING_ALLOW
OPERATIONAL_NO_MATCHING_ALLOW
ACTIVE_SHIFT_REQUIRED
ACTIVE_CHECKIN_REQUIRED
ACTIVE_AREA_REQUIRED
PERMISSION_DEPENDENCY_DENIED
RESOURCE_STATE_INVALID
RESOURCE_OWNERSHIP_MISMATCH
RESOURCE_REQUIRED_SIDE_MISMATCH
RESOURCE_VERSION_CONFLICT
RESOURCE_ISOLATED
DEVICE_NOT_ALLOWED
DEVICE_SESSION_INVALID
REAUTHENTICATION_REQUIRED
SECOND_FACTOR_REQUIRED
FIELD_POLICY_BLOCKED
CONCURRENCY_VALIDATION_FAILED
IDEMPOTENCY_VALIDATION_FAILED
DEFAULT_DENY_NO_MATCHING_ALLOW
```

Agregar un código no debe cambiar silenciosamente la precedencia.

---

#### 41. Deduplificación de razones

Dos razones son el mismo hecho cuando coinciden:

```text
reason_code
+
category
+
lane
+
source
```

En ese caso se conserva una sola entrada.

Si el mismo `reason_code` aparece con categorías incompatibles:

```text
CONTRACT_INVALID
→ FINAL DENY
```

No se elige una categoría arbitrariamente.

---

#### 42. Orden de blocked_reasons

Orden canónico:

1. prioridad de `reason_category`;
2. lane `ALL`;
3. lane `null`;
4. lane `BASE`;
5. lane `OPERATIONAL`;
6. `reason_code`;
7. `source`.

El primer elemento deberá coincidir con `primary_reason_code` después de
aplicar la tabla normativa de prioridad.

---

#### 43. Consistencia con structural_denies

Cada razón de `structural_denies` que permanezca aplicable deberá aparecer en
`blocked_reasons`.

No toda razón estructural exige un `MatchedDeny`.

Pero toda razón estructural bloqueante exige:

```text
final_decision.outcome = DENY
```

---

#### 44. Consistencia con actor_wide_denies

Cada actor-wide deny coincidente deberá producir:

- un `MatchedDeny` administrable;
- una razón en `actor_wide_denies`;
- una razón en `blocked_reasons`;
- IDs en los carriles compatibles;
- resultado final deny.

La razón primaria será actor-wide salvo que exista contrato o structural deny
superior.

---

#### 45. Consistencia con lane_denies

Cada lane deny coincidente deberá:

- permanecer en `lane_denies`;
- aparecer en `blocked_reasons` cuando contribuya al bloqueo final;
- aparecer en `LaneDecision.reason_codes` del carril;
- conservar su lane exacta.

En `BASE_OR_OPERATIONAL`, un lane deny del carril no autorizante puede quedar
como evidencia sin bloquear el resultado final.

En ese caso no entra en `blocked_reasons` de la solicitud completa, pero sí
permanece en `lane_denies` y en el carril.

---

#### 46. Razones de carril no bloqueantes para el resultado final

Ejemplo:

```text
BASE_OR_OPERATIONAL
base = DENY por BASE_LANE_DENY
operational = ALLOW
combination_result = ALLOW
sin restricciones adicionales
```

Resultado:

```text
final = ALLOW
lane_denies conserva BASE_LANE_DENY
blocked_reasons = []
```

La razón bloqueó un carril, no la solicitud completa.

---

#### 47. reason_codes dentro de LaneDecision

`base_decision.reason_codes` contiene razones propias del carril base.

`operational_decision.reason_codes` contiene razones propias del carril
operativo.

Reglas:

- no mezclan reasons del otro carril;
- no contienen razones de solicitud puramente transversales salvo cuando
  efectivamente bloquean ese carril;
- no sustituyen `blocked_reasons`;
- conservan orden determinista;
- pueden contener razones aunque el resultado final sea allow por el otro
  carril.

---

#### 48. primary_reason_code y reason_category

La relación deberá ser uno-a-uno dentro de la decisión.

Ejemplos:

| primary_reason_code              | reason_category     |
| -------------------------------- | ------------------- |
| `AUTHORIZED`                     | `AUTHORIZED`        |
| `CONTRACT_VERSION_INCOMPATIBLE`  | `CONTRACT_INVALID`  |
| `STRUCTURAL_ACTOR_UNRESOLVED`    | `STRUCTURAL_DENY`   |
| `ACTOR_WIDE_DENY_MATCHED`        | `ACTOR_WIDE_DENY`   |
| `RESOURCE_STATE_INVALID`         | `RESOURCE_DENY`     |
| `ACTIVE_SHIFT_REQUIRED`          | `PREREQUISITE_DENY` |
| `BASE_LANE_DENY_MATCHED`         | `LANE_DENY`         |
| `DEVICE_NOT_ALLOWED`             | `DEVICE_DENY`       |
| `REAUTHENTICATION_REQUIRED`      | `SENSITIVITY_DENY`  |
| `FIELD_POLICY_BLOCKED`           | `FIELD_POLICY_DENY` |
| `DEFAULT_DENY_NO_MATCHING_ALLOW` | `DEFAULT_DENY`      |

---

#### 49. safe_to_expose

`DecisionReason.safe_to_expose` controla si una razón técnica puede aparecer
en una proyección cliente.

No controla si la razón participa en la decisión.

Una razón sensible puede ser:

```text
safe_to_expose = false
severity = BLOCKING
```

y seguir siendo la razón técnica primaria.

---

#### 50. safe_message_code

`safe_message_code` siempre deberá ser seguro para el consumidor autorizado.

No será:

- texto libre;
- motivo disciplinario;
- nombre del grant;
- deny_id;
- estructura interna;
- consulta SQL;
- mensaje de excepción.

El cliente traducirá el código mediante su catálogo de experiencia.

---

#### 51. Catálogo inicial de mensajes seguros

```text
AUTHORIZATION_GRANTED
ACCESS_NOT_AVAILABLE
AUTHENTICATION_REQUIRED
WORK_CONTEXT_REQUIRED
ACTIVE_SHIFT_REQUIRED
ACTIVE_CHECKIN_REQUIRED
RESOURCE_NOT_AVAILABLE
RESOURCE_CHANGED_RETRY
DEVICE_NOT_SUPPORTED
REAUTHENTICATION_REQUIRED
REQUESTED_FIELDS_NOT_ALLOWED
CONTACT_AUTHORIZED_ADMINISTRATOR
```

BLOQUE S definirá redacción, localización y acciones de recuperación.

---

#### 52. Mapeo seguro inicial

| Categoría final     | safe_message_code predeterminado       |
| ------------------- | -------------------------------------- |
| `AUTHORIZED`        | `AUTHORIZATION_GRANTED`                |
| `CONTRACT_INVALID`  | `ACCESS_NOT_AVAILABLE`                 |
| `STRUCTURAL_DENY`   | `ACCESS_NOT_AVAILABLE`                 |
| `ACTOR_WIDE_DENY`   | `ACCESS_NOT_AVAILABLE`                 |
| `LANE_DENY`         | `ACCESS_NOT_AVAILABLE`                 |
| `DEFAULT_DENY`      | `ACCESS_NOT_AVAILABLE`                 |
| `RESOURCE_DENY`     | `RESOURCE_NOT_AVAILABLE`               |
| `PREREQUISITE_DENY` | Código seguro específico cuando exista |
| `DEVICE_DENY`       | `DEVICE_NOT_SUPPORTED`                 |
| `SENSITIVITY_DENY`  | `REAUTHENTICATION_REQUIRED`            |
| `FIELD_POLICY_DENY` | `REQUESTED_FIELDS_NOT_ALLOWED`         |

El mapeo específico nunca podrá revelar una razón marcada como no exponible.

---

#### 53. Reason técnico sensible y mensaje genérico

Ejemplo:

```text
primary_reason_code = ACTOR_WIDE_DENY_MATCHED
reason_category = ACTOR_WIDE_DENY
safe_message_code = ACCESS_NOT_AVAILABLE
```

El cliente no recibe:

- “bloqueo disciplinario”;
- motivo;
- aprobador;
- alcance;
- fecha final;
- ID de la denegación.

---

#### 54. Dependencias de permisos

Una dependencia fallida produce:

```text
reason_category = PREREQUISITE_DENY
primary_reason_code = PERMISSION_DEPENDENCY_DENIED
```

cuando no existe una categoría superior.

La decisión de la dependencia:

- conserva su propio contrato;
- no copia sus grants al permiso principal;
- no copia sus matched denies;
- aporta una razón resumida al permiso principal.

---

#### 55. Ciclos de dependencias

Un ciclo produce:

```text
reason_category = CONTRACT_INVALID
primary_reason_code = CONTRACT_DEPENDENCY_CYCLE
final = DENY
```

No se rompe el ciclo autorizando parcialmente.

No se elige una dependencia “principal”.

---

#### 56. Estado y transición del recurso

Una autoridad válida no supera un estado incompatible.

Ejemplo:

```text
combination_result = ALLOW
resource state = incompatible
```

Resultado:

```text
final = DENY
reason_category = RESOURCE_DENY
primary_reason_code = RESOURCE_STATE_INVALID
```

---

#### 57. Concurrencia

Cuando la política exige versión, timestamp, lock o snapshot:

```text
concurrency.validated = false
→ final DENY
```

Código inicial:

```text
CONCURRENCY_VALIDATION_FAILED
```

El cliente deberá reevaluar sobre el recurso actualizado.

---

#### 58. Idempotencia

Una clave de idempotencia:

- no concede permiso;
- no sustituye el contexto;
- no reutiliza una decisión sobre otro payload;
- no permite repetir una transición incompatible.

Una validación fallida produce:

```text
IDEMPOTENCY_VALIDATION_FAILED
→ RESOURCE_DENY
```

---

#### 59. FieldPolicy PASS

Cuando:

```text
field_policy_decision.status = PASS
```

la política de campos no agrega bloqueo.

Esto no autoriza el recurso por sí solo.

---

#### 60. FieldPolicy PARTIAL

`PARTIAL` puede coexistir con final allow únicamente cuando:

- la operación admite proyección reducida;
- `visible_fields` y `mutable_fields` quedan explícitos;
- los campos bloqueados no son indispensables para la operación;
- el servidor aplica la proyección;
- el cliente no puede recuperar los campos excluidos.

En este caso:

```text
final = ALLOW
reason_category = AUTHORIZED
```

La limitación permanece en `field_policy_decision`.

---

#### 61. FieldPolicy FAIL

`FAIL` produce:

```text
final = DENY
reason_category = FIELD_POLICY_DENY
primary_reason_code = FIELD_POLICY_BLOCKED
```

salvo que exista una categoría superior.

No se ejecuta una mutación parcial no declarada.

---

#### 62. Colecciones

Para `COLLECTION`:

- el servidor construye el conjunto autorizado;
- miembros denegados no se recuperan para filtrado cliente;
- la decisión puede autorizar una colección reducida;
- el mensaje no revela miembros excluidos;
- la paginación conserva el mismo contrato y scope.

Una colección vacía autorizada no es igual a una colección denegada.

---

#### 63. Agregados

Un agregado final allow exige que todas sus contribuciones estén dentro del
conjunto autorizado.

No se permite inferencia mediante:

- conteos;
- diferencias;
- totales;
- agrupaciones;
- errores diferenciados.

Una contribución bloqueada deberá excluirse o bloquear el agregado según el
contrato.

---

#### 64. BULK ALL_OR_NOTHING

Cuando la política es:

```text
ALL_OR_NOTHING
```

un miembro bloqueado produce:

```text
final = DENY para la operación masiva completa
```

La razón primaria se selecciona con la misma precedencia normativa.

---

#### 65. BULK PARTIAL_WITH_RESULTS

Cuando la política es:

```text
PARTIAL_WITH_RESULTS
```

cada miembro obtiene su propia decisión.

La decisión contenedora no podrá presentarse como allow irrestricto sobre
todos los miembros.

Los resultados denegados usarán mensajes seguros individuales.

---

#### 66. NON_RESOURCE

Una solicitud `NON_RESOURCE` puede autorizarse cuando:

- el contrato declara legítimamente esa forma;
- el permiso exacto admite la operación;
- no existe un recurso empresarial omitido;
- los carriles y restricciones quedan satisfechos.

`NON_RESOURCE` no es fallback para una resolución fallida.

---

#### 67. Dispositivo compartido

En dispositivo compartido:

```text
principal = dispositivo
actor efectivo = empleado
```

La decisión final deberá atribuirse al actor efectivo y conservar la
referencia del dispositivo en auditoría.

Una sesión de actor inválida produce structural deny.

Un paquete de dispositivo incompatible produce device deny.

---

#### 68. Entornos aislados

Un entorno aislado sin autorización específica produce:

```text
final = DENY
reason_category = STRUCTURAL_DENY o RESOURCE_DENY
```

La categoría dependerá de si la incompatibilidad invalida el contrato de
resolución o bloquea un recurso correctamente resuelto.

Un grant global ordinario no modifica esta regla.

---

#### 69. Contexto obsoleto

Cuando el contexto supera su política de frescura o contradice la realidad
autoritativa:

```text
primary_reason_code = STRUCTURAL_CONTEXT_STALE
reason_category = STRUCTURAL_DENY
safe_message_code = WORK_CONTEXT_REQUIRED o ACCESS_NOT_AVAILABLE
```

Se deberá resolver un nuevo contexto.

---

#### 70. Procesos SYSTEM

Los procesos de sistema no deberán recibir `AUTHORIZED` por usar
`service_role`.

La rama SYSTEM deberá validar identidad técnica, permiso, recurso, alcance y
auditoría conforme a `AUTH-CTX-026`.

Mientras la rama no esté publicada:

```text
contrato no compatible
→ FINAL DENY
```

---

#### 71. Simulación

Una decisión simulada no utiliza `FinalDecision` real para ejecutar.

No podrá proyectar:

```text
outcome = ALLOW
```

como autoridad ejecutable.

La simulación conserva contratos y estados separados.

---

#### 72. Proyección interna

La proyección interna autorizada puede incluir:

- `DecisionCombination` completo;
- `FinalDecision` completo;
- `blocked_reasons` completo;
- matched grants y denies;
- fuentes y IDs;
- hashes y versiones;
- datos de auditoría permitidos.

No significa que todo consumidor de frontend pueda verla.

---

#### 73. Proyección segura al cliente

La respuesta cliente ordinaria podrá incluir:

- `final_decision.outcome`;
- `safe_message_code`;
- razones con `safe_to_expose = true`;
- acción de recuperación permitida;
- `correlation_id` seguro;
- campos autorizados.

No deberá incluir:

- `deny_id`;
- `grant_id`;
- motivo disciplinario;
- matrices;
- fuente sensible;
- evidencia interna;
- existencia de recursos ocultos.

---

#### 74. Determinismo

Mismos inputs congelados deberán producir:

```text
misma combination
misma final_decision
mismo primary_reason_code
mismo orden de blocked_reasons
mismo safe_message_code
```

Se excluyen identificadores únicos y timestamps que por contrato deban ser
nuevos.

---

#### 75. Inmutabilidad

Una vez emitida:

- no se cambia el outcome;
- no se cambia la razón primaria;
- no se agregan o eliminan razones;
- no se cambian authorizing lanes;
- no se cambia el mensaje seguro;
- no se actualiza el recurso.

Una nueva realidad produce una nueva decisión.

---

#### 76. Ejecución vinculada

`final_decision.outcome = ALLOW` no ejecuta la acción.

Para mutaciones se exige:

```text
resolver
→ autorizar
→ validar estado y concurrencia
→ ejecutar
```

en una frontera segura o con revalidación inmediata.

`decision_id` no se utiliza como bypass.

---

#### 77. Casos canónicos

##### Caso A — BASE_ONLY autorizado

```text
base = ALLOW
operational = NOT_APPLICABLE
sin bloqueos
```

Resultado:

```text
combination_result = ALLOW
final = ALLOW
authorizing_lanes = [BASE]
primary_reason_code = AUTHORIZED
```

##### Caso B — OPERATIONAL_ONLY sin turno

```text
operational = DENY
reason = ACTIVE_SHIFT_REQUIRED
```

Resultado:

```text
final = DENY
reason_category = PREREQUISITE_DENY
```

##### Caso C — BASE_OR_OPERATIONAL

```text
base = DENY por lane deny
operational = ALLOW
```

Resultado:

```text
combination_result = ALLOW
final = ALLOW
combination.blocked_lanes = [BASE]
final.authorizing_lanes = [OPERATIONAL]
blocked_reasons = []
```

##### Caso D — BASE_AND_OPERATIONAL incompleto

```text
base = ALLOW
operational = DENY
```

Resultado:

```text
combination_result = DENY
final = DENY
```

##### Caso E — Actor-wide deny

```text
allows base y operativo coinciden
actor-wide deny coincide
```

Resultado:

```text
final = DENY
reason_category = ACTOR_WIDE_DENY
```

##### Caso F — Combinación positiva, dispositivo bloqueado

```text
combination_result = ALLOW
device_decision = FAIL
```

Resultado:

```text
final = DENY
combination.authorizing_lanes conserva evidencia
final.authorizing_lanes = []
```

##### Caso G — Reautenticación requerida

```text
combination_result = ALLOW
sensitivity_decision = FAIL
```

Resultado:

```text
final = DENY
safe_message_code = REAUTHENTICATION_REQUIRED
```

##### Caso H — Lectura parcial de campos

```text
combination_result = ALLOW
field_policy = PARTIAL
proyección reducida válida
```

Resultado:

```text
final = ALLOW
```

##### Caso I — Mutación con campo bloqueado

```text
field_policy = FAIL
```

Resultado:

```text
final = DENY
reason_category = FIELD_POLICY_DENY
```

##### Caso J — Recurso cambió

```text
combination_result = ALLOW
concurrency.validated = false
```

Resultado:

```text
final = DENY
safe_message_code = RESOURCE_CHANGED_RETRY
```

##### Caso K — Default deny

```text
contexto válido
sin explicit deny
sin allow suficiente
```

Resultado:

```text
final = DENY
primary_reason_code = DEFAULT_DENY_NO_MATCHING_ALLOW
```

##### Caso L — Contrato incompatible

```text
modalidad = BASE_ONLY
operational_outcome = ALLOW
```

Resultado:

```text
final = DENY
reason_category = CONTRACT_INVALID
```

##### Caso M — Razón sensible

```text
actor-wide deny
safe_to_expose = false
```

Resultado cliente:

```text
ACCESS_NOT_AVAILABLE
```

##### Caso N — Bulk atómico

```text
99 miembros allow
1 miembro deny
policy = ALL_OR_NOTHING
```

Resultado:

```text
final = DENY
```

##### Caso O — Dependencia fallida

```text
permiso principal tiene allows
dependencia = DENY
```

Resultado:

```text
final = DENY
primary_reason_code = PERMISSION_DEPENDENCY_DENIED
```

---

#### 78. Antipatrones prohibidos

```ts
const finalDecision =
  baseDecision.outcome === "ALLOW" ||
  operationalDecision.outcome === "ALLOW";
```

```ts
if (matchedAllows.length > 0) {
  return "ALLOW";
}
```

```ts
const primaryReason = blockedReasons[0];
```

```ts
return {
  outcome: combination.combination_result,
  authorizing_lanes: combination.authorizing_lanes,
};
```

```ts
if (fieldPolicy.status === "PARTIAL") {
  return "DENY";
}
```

```ts
safe_message_code = primary_reason_code;
```

También queda prohibido:

```text
allow de carril → allow final automático
combination allow → ejecutar sin restricciones
primer error físico → razón primaria
razón primaria → única razón
lane deny en OR → bloquear el otro carril
partial fields → deny universal
actor-wide deny → mensaje disciplinario
service_role → authorized
final allow → token reutilizable
```

---

#### 79. Relación con tareas posteriores

| Tarea                         | Responsabilidad posterior                                                       |
| ----------------------------- | ------------------------------------------------------------------------------- |
| `AUTH-CTX-024`                | Definir auditoría, hashes, versiones, evidencias, correlation y retención       |
| `AUTH-CTX-025`                | Diseñar producción física de `AccessContext`                                    |
| `AUTH-CTX-026`                | Diseñar evaluador físico, catálogo de prioridades, tipos, schemas y rama SYSTEM |
| `AUTH-CTX-027`                | Obligar a consumidores a usar la decisión centralizada                          |
| `AUTH-CTX-028`                | Adaptar funciones booleanas, mensajes y precedencias legacy                     |
| `AUTH-CTX-029`                | Definir caché, expiración, invalidación y reevaluación                          |
| `AUTH-CTX-030`                | Probar modalidades, precedencia, razones, mensajes y determinismo               |
| `AUTH-DB-006` a `AUTH-DB-010` | Aplicar la decisión dentro de RPC sensibles                                     |
| `AUTH-DB-020`                 | Migrar grants, denies y precedencias legacy                                     |
| `AUTH-DB-027`                 | Probar integridad, RLS, RPC y migraciones                                       |
| `AUTH-DB-030`                 | Retirar evaluadores y fallbacks legacy                                          |
| `AUTH-DB-031`                 | Certificar paridad documental, técnica y operativa                              |
| BLOQUE S                      | Diseñar mensajes, recuperación y UX de autorización                             |
| `GAP-CTRL-001`                | Consolidar brechas detectadas                                                   |
| `GAP-CTRL-006`                | Vincular cada brecha con tarea y paquete implementable                          |

---

#### 80. Fuera del alcance

AUTH-CTX-023 no:

- modifica modalidades;
- modifica grants;
- modifica denies;
- crea reason rows físicas;
- crea mensajes de interfaz;
- implementa traducciones;
- crea tipos TypeScript;
- crea JSON Schema;
- crea Zod;
- crea SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- implementa caché;
- ejecuta acciones;
- define retención de auditoría;
- implementa procesos SYSTEM.

Cada responsabilidad posterior tiene destino explícito en la sección 79.

---

#### 81. Riesgos controlados

| Riesgo                                              | Control canónico                             |
| --------------------------------------------------- | -------------------------------------------- |
| Un allow de carril se vuelve allow final            | Capas separadas y restricciones finales      |
| OR se interpreta como AND                           | Tabla de combinación explícita               |
| AND acepta un solo carril                           | Ambos outcomes deben ser allow               |
| Lane deny en OR bloquea toda la solicitud           | Solo bloquea su carril                       |
| Combination allow oculta dispositivo o sensibilidad | FinalDecision se calcula después             |
| Razón primaria borra evidencia                      | blocked_reasons conserva todas               |
| Orden de consulta cambia explicación                | Prioridad y desempate deterministas          |
| Deny sensible se revela                             | safe_to_expose y safe_message_code separados |
| Field PARTIAL se deniega siempre                    | Allow sobre proyección reducida válida       |
| Concurrencia se ignora                              | Revalidación bloqueante                      |
| Default deny se confunde con explicit deny          | Categorías y códigos separados               |
| service_role concede negocio                        | Rama SYSTEM contractual obligatoria          |
| Decisión positiva se reutiliza indefinidamente      | Inmutabilidad y reevaluación                 |
| Cliente ejecuta por UI allow                        | Servidor debe reevaluar y vincular ejecución |

---

#### 82. Criterios de aprobación

AUTH-CTX-023 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `DecisionCombination`;
2. se conserva la forma de `FinalDecision`;
3. se conserva la forma de `DecisionReason`;
4. no se agregan campos;
5. no se eliminan campos;
6. la decisión usa cinco capas;
7. un allow de carril no implica allow final;
8. combination_result no implica final allow;
9. la consolidación tiene orden normativo;
10. los outcomes de carril son entradas, no se recalculan;
11. un enum desconocido falla cerrado;
12. la modalidad debe ser compatible con ambos outcomes;
13. BASE_ONLY exige base aplicable;
14. BASE_ONLY exige operativo no aplicable;
15. OPERATIONAL_ONLY exige operativo aplicable;
16. OPERATIONAL_ONLY exige base no aplicable;
17. BASE_OR_OPERATIONAL evalúa ambos carriles;
18. BASE_AND_OPERATIONAL evalúa ambos carriles;
19. combinaciones incompatibles producen CONTRACT_INVALID;
20. DecisionCombination es determinista;
21. BASE_ONLY autoriza solo con base allow;
22. OPERATIONAL_ONLY autoriza solo con operativo allow;
23. BASE_OR_OPERATIONAL autoriza con cualquiera de los dos;
24. BASE_OR_OPERATIONAL conserva ambos si ambos permiten;
25. BASE_AND_OPERATIONAL exige ambos allows;
26. authorizing_lanes no contiene denies;
27. authorizing_lanes no contiene no aplicables;
28. authorizing_lanes se ordena base antes de operativo;
29. blocked_lanes contiene carriles aplicables denegados;
30. blocked_lanes no contiene restricciones transversales;
31. OR puede tener un carril autorizante y otro bloqueado;
32. combination_result responde solo por modalidad;
33. final_decision responde por solicitud completa;
34. structural deny bloquea;
35. actor-wide deny bloquea;
36. dependencia fallida bloquea;
37. estado incompatible bloquea;
38. dispositivo incompatible bloquea;
39. sensibilidad fallida bloquea;
40. field policy FAIL bloquea;
41. concurrencia fallida bloquea;
42. idempotencia inválida bloquea;
43. los bloqueos no borran allows;
44. final outcome solo admite ALLOW o DENY;
45. no existe resultado null;
46. primary_reason_code siempre existe;
47. safe_message_code siempre existe;
48. reason_category corresponde a la razón primaria;
49. final ALLOW exige combination ALLOW;
50. final ALLOW exige blocked_reasons vacío;
51. final ALLOW usa category AUTHORIZED;
52. final ALLOW usa code AUTHORIZED;
53. final ALLOW usa AUTHORIZATION_GRANTED;
54. final ALLOW proyecta authorizing lanes de la combinación;
55. final DENY exige al menos una razón bloqueante;
56. final DENY proyecta authorizing_lanes vacío;
57. final DENY no usa category AUTHORIZED;
58. final DENY conserva evidencia positiva interna;
59. razón primaria no elimina razones adicionales;
60. blocked_reasons conserva evidencia completa;
61. existe prioridad técnica explícita;
62. CONTRACT_INVALID tiene mayor prioridad;
63. STRUCTURAL_DENY sigue a contrato inválido;
64. ACTOR_WIDE_DENY sigue a structural;
65. DEFAULT_DENY tiene menor prioridad bloqueante;
66. el desempate es determinista;
67. el orden físico no determina la razón primaria;
68. CONTRACT_INVALID cubre incompatibilidades contractuales;
69. STRUCTURAL_DENY cubre invalideces autoritativas;
70. ACTOR_WIDE_DENY no revela motivo sensible;
71. RESOURCE_DENY cubre estado y ejecución del recurso;
72. PREREQUISITE_DENY cubre turno, check-in y dependencias;
73. LANE_DENY cubre denegaciones de carril que bloquean la modalidad;
74. DEVICE_DENY procede de device FAIL;
75. SENSITIVITY_DENY procede de controles sensibles fallidos;
76. FIELD_POLICY_DENY procede de field FAIL;
77. DEFAULT_DENY solo aplica por ausencia de allow suficiente;
78. blocked_reasons solo contiene severity BLOCKING;
79. blocked_reasons no contiene AUTHORIZED;
80. las fuentes de razones quedan enumeradas;
81. toda razón queda normalizada;
82. reason_code no contiene texto localizado;
83. reason_code no contiene PII;
84. reason_code usa forma canónica;
85. existen familias iniciales;
86. existe catálogo técnico inicial;
87. agregar un código no cambia precedencia implícitamente;
88. razones duplicadas se deduplican semánticamente;
89. categorías incompatibles producen contract invalid;
90. blocked_reasons tiene orden canónico;
91. structural_denies se refleja en blocked_reasons;
92. actor_wide_denies se refleja en blocked_reasons;
93. lane_denies se refleja cuando bloquea la solicitud completa;
94. lane deny no bloqueante en OR permanece solo como evidencia de carril;
95. reason_codes de base no mezclan operativo;
96. reason_codes operativos no mezclan base;
97. LaneDecision reasons no sustituyen blocked_reasons;
98. primary_reason_code y reason_category son consistentes;
99. safe_to_expose no altera el resultado;
100. una razón no exponible sigue bloqueando;
101. safe_message_code es siempre seguro;
102. safe_message_code no es texto libre;
103. existe catálogo inicial de mensajes seguros;
104. actor-wide deny usa mensaje genérico;
105. dependencias conservan decisión separada;
106. dependencia fallida aporta una razón resumida;
107. ciclos producen contract invalid;
108. estado incompatible supera autoridad válida;
109. concurrencia requiere validación;
110. idempotencia no concede permiso;
111. FieldPolicy PASS no agrega bloqueo;
112. FieldPolicy PARTIAL puede permitir proyección reducida;
113. FieldPolicy PARTIAL no permite mutación parcial no declarada;
114. FieldPolicy FAIL deniega;
115. colecciones se delimitan en servidor;
116. colección vacía autorizada no equivale a deny;
117. agregados evitan inferencias;
118. bulk all-or-nothing bloquea completo;
119. bulk partial produce decisiones por miembro;
120. NON_RESOURCE no es fallback;
121. dispositivo compartido conserva actor y principal;
122. sesión de actor inválida es structural;
123. paquete de dispositivo incompatible es device deny;
124. entornos aislados requieren autorización específica;
125. contexto obsoleto exige nueva resolución;
126. service_role no produce authorized;
127. simulación no produce autoridad ejecutable;
128. la proyección interna puede contener evidencia completa autorizada;
129. la proyección cliente protege grants, denies y recursos ocultos;
130. mismos inputs producen mismo resultado semántico;
131. la decisión es inmutable;
132. una nueva realidad produce nueva decisión;
133. final allow no ejecuta la acción;
134. las mutaciones requieren frontera segura o revalidación;
135. decision_id no funciona como bypass;
136. AUTH-CTX-024 definirá auditoría;
137. AUTH-CTX-026 definirá implementación contractual;
138. AUTH-CTX-027 eliminará decisiones locales;
139. AUTH-CTX-028 gobernará compatibilidad legacy;
140. AUTH-CTX-029 gobernará caché e invalidación;
141. AUTH-CTX-030 gobernará pruebas;
142. BLOQUE S gobernará mensajes y UX;
143. no se implementa código, migraciones ni cambios en Supabase.

---

#### 83. Cierre y continuidad de la propuesta

| Relación        | Tarea          | Estado        |
| --------------- | -------------- | ------------- |
| Tarea anterior  | `AUTH-CTX-022` | ✅ APROBADA    |
| Tarea propuesta | `AUTH-CTX-023` | ✅ APROBADA    |
| Tarea siguiente | `AUTH-CTX-024` | ⬜ NO INICIADA |

```text
AUTH-CTX-022 — APROBADA
        ↓
AUTH-CTX-023 — APROBADA
        ↓
AUTH-CTX-024 — NO INICIADA
```

No se avanza a `AUTH-CTX-024` hasta recibir aprobación explícita de
`AUTH-CTX-023`.

### ✅ AUTH-CTX-024 — Incluir datos de auditoría

| Campo                          | Valor                                                                                         |
| ------------------------------ | --------------------------------------------------------------------------------------------- |
| **Estado**                     | APROBADA                                                                                      |
| **Bloque**                     | BLOQUE E — Contexto y decisión de autorización unificados                                     |
| **Subbloque**                  | `AUTHORIZATION DECISION`                                                                      |
| **Naturaleza**                 | Definición documental de `AuthorizationAuditContext`                                          |
| **Implementación física**      | No incluida                                                                                   |
| **Tarea anterior vigente**     | `AUTH-CTX-023` — APROBADA                                                                     |
| **Tarea posterior reservada**  | `AUTH-CTX-025` — Diseñar contrato SQL de `get_access_context`                                 |
| **Contrato afectado**          | `AuthorizationDecision@1.0.0`                                                                 |
| **Campo principal afectado**   | `audit`                                                                                       |
| **Tipo principal afectado**    | `AuthorizationAuditContext`                                                                   |
| **Perfil de serialización**    | `vento.canonical-json@1.0.0`                                                                  |
| **Cambio contractual**         | Aclaración normativa compatible; no cambia la forma publicada                                 |
| **Cambios físicos permitidos** | No                                                                                            |
| **Brecha física detectada**    | Falta tarea específica de persistencia de decisiones                                          |
| **Nueva tarea requerida**      | `AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización` |

Esta tarea define qué evidencia mínima debe acompañar a cada
`AuthorizationDecision`, cómo se relaciona con la evidencia detallada de la
decisión y cómo deberá permitir trazabilidad, reproducción y vinculación con
la ejecución sin convertir la decisión en un token de capacidad.

La regla central es:

```text
DECISIÓN AUTORIZATIVA
=
RESULTADO
+
EVIDENCIA
+
PROCEDENCIA
+
HUELLAS
+
VERSIONES
+
ATRIBUCIÓN
```

```text
AUDITORÍA
≠
LOG DE TEXTO
```

```text
AUDITORÍA
≠
RESPUESTA SEGURA PARA CLIENTE
```

```text
DECISION_ID
≠
TOKEN DE AUTORIZACIÓN
```

No implementa tablas, columnas, índices, particiones, RLS, RPC, funciones,
triggers, migraciones, retención, archivado, dashboards, exportaciones ni
cambios físicos en Supabase.

---

#### 1. Objetivo

Definir `AuthorizationAuditContext` para que Vento OS pueda demostrar:

1. qué decisión fue emitida;
2. cuándo fue emitida;
3. qué solicitud originó la evaluación;
4. qué actor efectivo fue evaluado;
5. qué principal presentó la credencial;
6. qué dispositivo intervino;
7. qué aplicación y permiso exactos se evaluaron;
8. qué recurso o conjunto se resolvió;
9. cuál fue el resultado final;
10. qué carriles autorizaron;
11. qué snapshot de contexto se utilizó;
12. qué snapshot de recurso se utilizó;
13. qué catálogo se utilizó;
14. qué datasets se utilizaron;
15. qué evaluador produjo el resultado;
16. qué versión del evaluador participó;
17. cómo se vincula la decisión con la ejecución;
18. cómo se preserva la trazabilidad sin filtrar secretos;
19. cómo se conserva la inmutabilidad histórica;
20. cómo se reproduce una investigación posterior.

---

#### 2. Base normativa

AUTH-CTX-024 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-CTX-001` — `AccessContext`;
- `AUTH-CTX-002` — `AuthorizationDecision`;
- `AUTH-CTX-003` — `SimulationContext`;
- `AUTH-CTX-004` — Versionado y serialización;
- `AUTH-CTX-005` a `AUTH-CTX-015` — Identidad, actor, empleo, contexto y dispositivo;
- `AUTH-CTX-016` — Aplicación y permiso;
- `AUTH-CTX-017` — Modalidad y prerrequisitos;
- `AUTH-CTX-018` — Recurso y territorio;
- `AUTH-CTX-019` — Carril base;
- `AUTH-CTX-020` — Carril operativo;
- `AUTH-CTX-021` — Allows coincidentes;
- `AUTH-CTX-022` — Denegaciones coincidentes;
- `AUTH-CTX-023` — Decisión final y razones;
- `AUTH-RBAC-024` a `AUTH-RBAC-026` — Datasets canónicos;
- `SUPA-ARC-007` — Esquema transversal futuro de auditoría y eventos;
- `SUPA-ARC-022` — Retención, archivado, respaldo y recuperación;
- `AUTH-DB-012` — Auditoría futura de cambios de permisos;
- `AUTH-DB-013` — Auditoría futura de simulación;
- `AUTH-DB-014` — Auditoría futura de dispositivos;
- `AUTH-DB-025` — Índices, retención y controles de crecimiento;
- `AUTH-DB-027` — Harness de pruebas de Supabase;
- `AUTH-DB-031` — Certificación de paridad.

Principios obligatorios:

```text
MISMO decision_id
→ MISMA DECISIÓN INMUTABLE
```

```text
MISMA DECISIÓN
→ MISMO CONTEXTO
→ MISMO RECURSO
→ MISMO CATÁLOGO
→ MISMOS DATASETS
→ MISMO EVALUADOR
```

```text
NUEVA REALIDAD
→ NUEVA DECISIÓN
→ NUEVO decision_id
```

---

#### 3. Alcance

AUTH-CTX-024 precisa exclusivamente:

- forma y semántica de `AuthorizationAuditContext`;
- atribución de actor, principal y dispositivo;
- identidad de aplicación, permiso y recurso;
- resultado y carriles autorizantes;
- huellas de contexto y recurso;
- hash de catálogo;
- hashes de datasets;
- identidad y versión del evaluador;
- correlación con solicitud y ejecución;
- proyección segura;
- invariantes de integridad;
- responsabilidades físicas posteriores.

No modifica la precedencia, la modalidad, los grants, los denies ni el
resultado aprobado en AUTH-CTX-023.

---

#### 4. Forma contractual conservada

La forma publicada se conserva:

```ts
type AuthorizationAuditContext = {
  decision_id: string;
  correlation_id: string | null;

  actor_id: string | null;
  principal_id: string | null;
  device_id: string | null;

  app_code: string;
  permission_key: string;
  resource_type: string;
  resource_ids: string[];

  outcome: "ALLOW" | "DENY";
  authorizing_lanes: AuthorizationLane[];

  context_fingerprint: string;
  resource_fingerprint: string;
  catalog_hash: string;
  dataset_hashes: Record<string, string>;

  evaluator_name: string;
  evaluator_version: string;
};
```

La raíz conserva:

```ts
audit: AuthorizationAuditContext;
```

No se agregan, eliminan ni renombran campos en `AuthorizationDecision@1.0.0`.

---

#### 5. Función del audit context

`AuthorizationAuditContext` será el índice de trazabilidad de la decisión.

No duplicará indiscriminadamente:

- solicitud completa;
- contexto completo;
- recurso completo;
- grants completos;
- denegaciones completas;
- razones completas;
- estado completo;
- campos protegidos completos.

La evidencia detallada permanece en el resto de `AuthorizationDecision`.

El objeto `audit` identifica y enlaza esa evidencia.

---

#### 6. Audit context frente a decisión completa

```text
AuthorizationDecision
→ evidencia semántica completa

AuthorizationAuditContext
→ índice compacto, estable y verificable
```

Una auditoría autorizada deberá poder partir del objeto `audit` y localizar:

- la decisión exacta;
- el contexto exacto;
- la solicitud exacta;
- el recurso exacto;
- las fuentes exactas;
- la ejecución relacionada cuando exista.

---

#### 7. Presencia obligatoria

Toda `AuthorizationDecision` válida deberá contener:

```text
audit != null
```

No se admiten:

- decisiones sin auditoría;
- auditoría opcional para `ALLOW`;
- auditoría opcional para `DENY`;
- auditoría únicamente en errores;
- auditoría únicamente en capacidades sensibles.

La persistencia durable podrá depender de políticas posteriores, pero el
contrato emitido siempre contendrá `audit`.

---

#### 8. Consistencia de decision_id

La igualdad obligatoria es:

```text
AuthorizationDecision.decision_id
=
AuthorizationDecision.audit.decision_id
```

`decision_id` deberá ser:

- único;
- estable;
- no vacío;
- generado por servidor;
- no predecible cuando la implementación lo requiera;
- inmutable;
- no reutilizado.

No podrá ser:

- índice incremental expuesto;
- permiso;
- employee_id;
- resource_id;
- idempotency key;
- correlation ID;
- token de acceso.

---

#### 9. decided_at

`decided_at` permanece en la raíz de la decisión.

El objeto `audit` no agrega otro timestamp redundante.

Regla:

```text
audit
se interpreta dentro de la decisión emitida en decided_at
```

La persistencia futura deberá conservar `decided_at` junto al audit context.

---

#### 10. correlation_id

`correlation_id` vincula eventos pertenecientes a una misma operación lógica.

Podrá conectar:

```text
solicitud
→ resolución de contexto
→ decisión
→ ejecución
→ evento de dominio
→ error o compensación
```

No concede autoridad.

No reemplaza `decision_id`.

No se reutiliza para operaciones empresariales no relacionadas.

---

#### 11. correlation_id nulo

`correlation_id = null` será válido únicamente cuando el origen todavía no
disponga de correlación.

No significa:

- que la decisión no sea auditable;
- que `decision_id` pueda omitirse;
- que la ejecución quede sin atribución;
- que pueda inventarse una correlación retrospectiva distinta.

AUTH-CTX-026 deberá definir en qué fronteras el evaluador crea o propaga la
correlación.

---

#### 12. actor_id

`actor_id` representa el actor efectivo evaluado.

Debe coincidir con:

```text
access_context_ref.actor_id
```

y con la proyección autoritativa del `AccessContext`.

Puede representar:

- empleado;
- cliente;
- actor de sistema.

Será `null` únicamente cuando el actor permanezca legítimamente no resuelto.

---

#### 13. principal_id

`principal_id` representa el principal técnico que presentó la credencial.

Debe coincidir con:

```text
access_context_ref.principal_id
```

Puede corresponder a:

- usuario autenticado;
- principal técnico de dispositivo compartido;
- identidad de servicio;
- otro principal canónico futuro.

No equivale automáticamente a `actor_id`.

---

#### 14. device_id

`device_id` identifica el dispositivo compartido o dispositivo administrado
que intervino en la solicitud.

Será:

```text
device_id = null
```

cuando no exista un dispositivo canónico involucrado.

No se rellenará con:

- browser session ID;
- user agent;
- dirección IP;
- hostname no registrado;
- auth_user_id;
- employee_id.

---

#### 15. Matriz de atribución

| Escenario                   | `actor_id`                        | `principal_id`                    | `device_id`                               |
| --------------------------- | --------------------------------- | --------------------------------- | ----------------------------------------- |
| Sesión personal de empleado | Empleado                          | Usuario autenticado               | `null` o dispositivo administrado real    |
| Dispositivo compartido      | Empleado activo en el dispositivo | Principal técnico del dispositivo | Dispositivo exacto                        |
| Cliente autenticado         | Cliente                           | Usuario autenticado               | `null` o dispositivo administrado real    |
| Servicio de sistema         | Actor de sistema                  | Principal técnico del servicio    | `null`                                    |
| Actor no resuelto           | `null`                            | Principal disponible o `null`     | Dispositivo disponible o `null`           |
| Anónimo                     | `null`                            | `null`                            | `null` salvo dispositivo público canónico |

La fila de atribución no cambia el outcome por sí misma.

---

#### 16. Atribución en dispositivo compartido

En un dispositivo compartido:

```text
principal_id
≠ actor_id
```

La auditoría deberá conservar simultáneamente:

- principal técnico del dispositivo;
- empleado efectivo;
- dispositivo exacto.

Queda prohibido atribuir la acción únicamente al usuario técnico compartido.

---

#### 17. app_code

`app_code` deberá coincidir exactamente con:

```text
AuthorizationDecision.request.app_code
```

y con la aplicación propietaria del permiso según el catálogo.

No se utilizan:

- alias de UI;
- ruta;
- nombre comercial libre;
- módulo;
- repositorio;
- hostname.

---

#### 18. permission_key

`permission_key` deberá coincidir exactamente con:

```text
AuthorizationDecision.request.permission_key
```

y con:

```text
permission_contract.permission_key
```

No se registran prefijos, wildcards ni nombres humanos.

---

#### 19. resource_type

`resource_type` deberá coincidir con:

```text
AuthorizationDecision.resource.resource_type
```

No será el nombre de una tabla salvo coincidencia contractual explícita.

No se utilizará un tipo genérico para ocultar errores de resolución.

---

#### 20. resource_ids

`resource_ids` contendrá los identificadores canónicos efectivamente
resueltos.

Reglas:

- lista explícita;
- sin duplicados;
- orden determinista;
- misma representación entre evaluaciones equivalentes;
- sin identificadores inventados;
- sin IDs enviados por cliente que no hayan sido verificados.

---

#### 21. Recurso existente

Para `request_shape = EXISTING`:

```text
resource_ids.length >= 1
```

salvo que la resolución haya fallado antes de confirmar un recurso.

Una decisión `ALLOW` sobre recurso existente exige al menos un ID resuelto.

---

#### 22. Borrador de creación

Para `request_shape = DRAFT`, el recurso puede todavía no poseer ID persistido.

Regla:

```text
resource_ids = []
```

puede ser válido cuando:

- el borrador está normalizado;
- el recurso todavía no existe;
- `resource_fingerprint` identifica el borrador exacto;
- el tipo y territorio están resueltos;
- la decisión conserva su forma de solicitud.

No se crea un ID falso para llenar la lista.

---

#### 23. Colecciones

Para `COLLECTION`:

- `resource_ids` podrá contener los miembros materializados evaluados;
- podrá permanecer vacía cuando el contrato utilice un descriptor de consulta
  reproducible dentro del recurso completo;
- una colección autorizada no se resume únicamente con el primer ID;
- la auditoría durable deberá conservar la estrategia aprobada por
  `SUPA-ARC-007` y `AUTH-DB-032`.

La proyección cliente no expone miembros ocultos.

---

#### 24. Agregados

Para `AGGREGATE`:

- `resource_type` identifica el agregado contractual;
- `resource_ids` podrá contener IDs de particiones o fuentes explícitas;
- no deberán registrarse IDs que permitan inferir datos denegados en una
  proyección no autorizada;
- `resource_fingerprint` deberá identificar la definición exacta del agregado.

---

#### 25. Operaciones masivas

Para `BULK`:

- `resource_ids` será determinista y deduplicado;
- la política `ALL_OR_NOTHING` o `PARTIAL_WITH_RESULTS` permanece en la
  decisión completa;
- el audit context no oculta miembros fallidos;
- la persistencia podrá almacenar detalle por miembro mediante el diseño
  aprobado en `SUPA-ARC-007` y `AUTH-DB-032`.

---

#### 26. NON_RESOURCE

Para `NON_RESOURCE`:

```text
resource_ids = []
```

será obligatorio.

`resource_type` deberá conservar el tipo contractual no materializado.

`resource_fingerprint` seguirá siendo obligatorio y representará la solicitud
no territorial o no materializada exacta.

---

#### 27. outcome

La igualdad obligatoria es:

```text
audit.outcome
=
final_decision.outcome
```

Valores permitidos:

```text
ALLOW
DENY
```

No existen:

- `UNKNOWN`;
- `ERROR`;
- `PARTIAL`;
- `NOT_APPLICABLE`;
- `WOULD_ALLOW`;
- `INDETERMINATE`.

---

#### 28. authorizing_lanes

La igualdad obligatoria es:

```text
audit.authorizing_lanes
=
final_decision.authorizing_lanes
```

Orden canónico:

```text
BASE
OPERATIONAL
```

No se duplica un carril.

---

#### 29. authorizing_lanes en ALLOW

Todo `ALLOW` deberá cumplir:

```text
authorizing_lanes.length >= 1
```

y cada carril deberá:

- estar admitido por la modalidad;
- haber producido `ALLOW`;
- pertenecer al mismo actor;
- corresponder al mismo permiso;
- corresponder al mismo recurso;
- usar la misma decisión.

---

#### 30. authorizing_lanes en DENY

Todo `DENY` deberá cumplir:

```text
authorizing_lanes = []
```

Aunque uno de los carriles haya producido `ALLOW` antes de una restricción
transversal, el outcome final denegado no tendrá carriles autorizantes en el
audit context.

La evidencia del carril positivo permanece en `combination` y en las
decisiones de carril.

---

#### 31. context_fingerprint

`context_fingerprint` identifica el snapshot exacto de `AccessContext`
utilizado.

Debe coincidir con:

```text
access_context_ref.context_fingerprint
```

No se recalcula desde una versión posterior del contexto.

---

#### 32. Preimagen del context fingerprint

La preimagen canónica deberá representar, como mínimo, los hechos
autoritativos que puedan modificar la decisión:

- versión contractual del contexto;
- `context_id`;
- `resolved_at`;
- principal;
- actor efectivo;
- identidad de dominio relevante;
- empleado;
- rol base;
- cobertura administrativa;
- turno;
- check-in;
- rol operativo;
- sede operativa;
- área operativa;
- dispositivo;
- readiness de carriles;
- problemas estructurales;
- versiones autoritativas de resolución.

AUTH-CTX-025 y AUTH-CTX-026 definirán la producción física de esta preimagen.

---

#### 33. Exclusiones del context fingerprint

No deberán participar por defecto:

- textos de UI;
- nombres decorativos;
- mensajes traducidos;
- orden no semántico de propiedades;
- metadata de presentación;
- información no consultada;
- secretos de autenticación;
- tokens;
- payload JWT completo.

La exclusión no podrá eliminar un hecho que afecte la autorización.

---

#### 34. resource_fingerprint

`resource_fingerprint` identifica el recurso, borrador, conjunto o solicitud
no materializada exactos evaluados.

Debe cambiar cuando cambie un hecho autoritativo relevante.

---

#### 35. Preimagen del resource fingerprint

La preimagen deberá representar, según aplique:

- `resource_type`;
- `request_shape`;
- `resolution_status`;
- IDs resueltos;
- versión del recurso;
- sujeto;
- territorio;
- propiedad;
- custodia;
- lados obligatorios;
- estado relevante;
- clasificación de campos;
- política de concurrencia;
- versión esperada;
- forma de colección, agregado o bulk;
- borrador normalizado;
- transición solicitada.

---

#### 36. Estado completo frente a estado relevante

No será obligatorio hashear indiscriminadamente todas las columnas físicas.

Se incluirán:

```text
hechos que participan
o pueden invalidar
la decisión exacta
```

La selección de hechos deberá proceder del contrato del recurso.

No se permite que cada aplicación elija libremente qué excluir.

---

#### 37. Serialización de fingerprints

Las huellas deberán utilizar:

```text
vento.canonical-json@1.0.0
```

Reglas:

- propiedades en orden canónico;
- arrays con semántica de conjunto ordenados canónicamente;
- arrays con semántica secuencial conservan orden;
- Unicode normalizado según el perfil;
- timestamps normalizados;
- `null` explícito;
- listas vacías explícitas;
- números sin representación ambigua;
- ausencia de campos obligatorios produce contrato inválido.

---

#### 38. Formato de fingerprints

Formato inicial recomendado:

```text
sha256:<64 caracteres hexadecimales minúsculos>
```

AUTH-CTX-026 congelará el algoritmo físico.

Si se adopta otro algoritmo, deberá:

- identificarse en la cadena;
- ser determinista;
- ser criptográficamente adecuado;
- conservar compatibilidad histórica;
- no reinterpretar fingerprints existentes.

---

#### 39. Fingerprint no reversible

Una huella:

- no sustituye el snapshot;
- no debe permitir reconstruir secretos;
- no debe utilizar claves secretas como preimagen;
- no prueba por sí sola que la fuente era correcta;
- prueba identidad del contenido bajo el perfil utilizado.

La auditoría autorizada necesita además procedencia y versiones.

---

#### 40. catalog_hash

La igualdad obligatoria es:

```text
audit.catalog_hash
=
permission_contract.catalog_hash
```

El hash identifica el catálogo exacto utilizado.

No se utiliza:

- versión declarada sin hash;
- hash de otro ambiente;
- hash calculado después de la decisión;
- hash del documento compilado completo;
- commit de una aplicación consumidora.

---

#### 41. Catálogo incompatible

Si el catálogo no puede validarse:

```text
final_decision = DENY
reason_category = CONTRACT_INVALID
```

La decisión emitida deberá conservar el hash disponible únicamente cuando
sea confiable.

Si no puede producirse un audit context completo y coherente, no se emite una
`AuthorizationDecision` válida; la operación falla cerrada como error de
infraestructura.

---

#### 42. dataset_hashes

`dataset_hashes` identifica cada dataset autoritativo que participó
materialmente en la evaluación.

Forma semántica:

```text
clave
=
dataset_id@dataset_version

valor
=
dataset_hash exacto
```

Ejemplo conceptual:

```json
{
  "vento.authorization.base-role-grants@1.0.0": "sha256:...",
  "vento.authorization.operational-role-grants@1.0.0": "sha256:...",
  "vento.authorization.individual-overrides@1.0.0": "sha256:..."
}
```

---

#### 43. Datasets consultados sin coincidencias

Un dataset consultado deberá registrarse aunque produzca:

```text
0 matches
```

Esto permite distinguir:

```text
dataset consultado sin coincidencias
```

de:

```text
dataset omitido
```

La ausencia de coincidencias no elimina su participación en la decisión.

---

#### 44. Dataset no aplicable

Un dataset que contractualmente no aplica al permiso o modalidad:

- no se inventa como consultado;
- no se agrega con hash vacío;
- no se agrega con `null`;
- queda fuera de `dataset_hashes`.

La decisión completa explica la modalidad y carriles no aplicables.

---

#### 45. Orden de dataset_hashes

Aunque JSON no debe interpretarse por orden, la serialización canónica deberá
ordenar las claves lexicográficamente.

Esto garantiza:

- reproducibilidad;
- comparación;
- hashing estable;
- diffs consistentes.

---

#### 46. Hash faltante

Un dataset autoritativo sin hash publicable produce:

```text
DATASET_HASH_MISSING
→ CONTRACT_INVALID
→ DENY
```

No se aceptan:

- `latest`;
- `unknown`;
- cadena vacía;
- fecha como sustituto;
- versión sin hash.

---

#### 47. evaluator_name

`evaluator_name` identifica el componente lógico que produjo la decisión.

Deberá ser:

- estable;
- no vacío;
- independiente del hostname;
- independiente del pod;
- independiente del usuario;
- independiente de la aplicación cliente.

No se utilizará:

- nombre aleatorio de proceso;
- ruta de archivo local;
- nombre de desarrollador;
- nombre de máquina;
- `unknown`.

AUTH-CTX-026 congelará el identificador lógico inicial.

---

#### 48. evaluator_version

`evaluator_version` identifica la versión exacta de implementación del
evaluador.

Deberá permitir distinguir despliegues con lógica diferente.

No se aceptan:

```text
latest
current
production
main
unknown
```

Podrá utilizar:

- versión semántica;
- identificador inmutable de build;
- combinación canónica aprobada.

El formato final corresponde a AUTH-CTX-026.

---

#### 49. Versiones independientes

```text
contract_version
≠ schema_version
≠ catalog_version
≠ dataset_version
≠ evaluator_version
```

Actualizar el evaluador no modifica automáticamente el contrato.

Actualizar el contrato exige evaluación de compatibilidad según
AUTH-CTX-004.

---

#### 50. Inmutabilidad

Una vez emitida la decisión:

- `audit` no se modifica;
- hashes no se recalculan;
- IDs no se reemplazan;
- outcome no se corrige in place;
- razones no se reordenan in place;
- ejecución posterior no altera la decisión.

Una corrección produce:

```text
nueva decisión
+
nuevo decision_id
```

---

#### 51. Completitud

Una `AuthorizationDecision` no será válida si falta cualquiera de los campos
obligatorios de `audit`.

No se completará posteriormente mediante:

- trigger tardío;
- job de reparación;
- frontend;
- fallback;
- consulta a estado actual.

La evidencia debe quedar determinada en el momento de decisión.

---

#### 52. Reproducibilidad

La auditoría deberá permitir responder:

```text
con estos mismos snapshots
y estas mismas versiones,
¿el evaluador produjo coherentemente este resultado?
```

No promete que el estado actual siga siendo igual.

No reevalúa contra datos actuales para reinterpretar el pasado.

---

#### 53. Cadena de evidencia

La cadena mínima será:

```text
decision_id
→ AuthorizationDecision
→ access_context_ref
→ context_fingerprint
→ request
→ permission_contract
→ catalog_hash
→ resource
→ resource_fingerprint
→ matched evidence
→ dataset_hashes
→ evaluator_name/version
→ final_decision
```

Toda ruptura deberá ser detectable.

---

#### 54. Relación con matched_allows

El audit context no duplica `matched_allows`.

La decisión completa conserva:

- grant IDs;
- carril;
- fuente;
- sujeto;
- scope;
- coincidencia territorial;
- coincidencia de recurso;
- dataset y versión.

`dataset_hashes` verifica la fuente publicada utilizada.

---

#### 55. Relación con matched_denies

El audit context no duplica `matched_denies`.

La decisión completa conserva:

- deny IDs;
- clase;
- carril;
- permiso;
- fuente;
- actor;
- recurso;
- territorio;
- vigencia;
- razón.

Los IDs sintéticos estructurales o default permanecen en la decisión y no se
convierten en filas físicas administrables.

---

#### 56. Relación con razones

El audit context no agrega:

- `primary_reason_code`;
- `safe_message_code`;
- `blocked_reasons`.

Esos datos ya pertenecen a:

```text
final_decision
+
blocked_reasons
```

La auditoría completa debe persistirlos junto con el audit context mediante
la tarea física correspondiente.

---

#### 57. No duplicación

Queda prohibido mantener dos copias divergentes de:

- outcome;
- actor;
- permiso;
- recurso;
- hashes;
- carriles;
- razones.

Cuando el campo existe tanto en la raíz como en `audit`, debe existir una
invariante explícita de igualdad.

---

#### 58. Vinculación con ejecución

Cuando una decisión se utilice para una mutación, la ejecución deberá
registrar:

- `decision_id`;
- `correlation_id`;
- resultado de ejecución;
- recurso final;
- versión final;
- timestamp de ejecución;
- error o compensación cuando corresponda.

Estos campos pertenecen al registro de ejecución, no amplían
`AuthorizationAuditContext@1.0.0`.

---

#### 59. Brecha física identificada

El roadmap no contiene actualmente una tarea específica para persistir
decisiones reales de autorización y vincularlas con su ejecución.

Se crea explícitamente:

```text
AUTH-DB-032
— Implementar persistencia canónica y vinculación
  de decisiones de autorización
```

Ubicación obligatoria:

```text
BLOQUE R1 — Fundación física canónica
después de SUPA-ARC-007
antes de la adopción completa en AUTH-DB-006 a AUTH-DB-010
```

---

#### 60. Alcance futuro de AUTH-DB-032

`AUTH-DB-032` deberá implementar, una vez aprobada la arquitectura:

- almacenamiento inmutable de decisiones;
- almacenamiento de evidencia autorizada;
- vínculo decisión–ejecución;
- búsqueda por `decision_id`;
- búsqueda por `correlation_id`;
- búsqueda por actor, principal y dispositivo bajo autorización;
- búsqueda por permiso y recurso;
- RLS y grants de auditoría;
- integridad entre decisión y audit context;
- política de redacción de datos sensibles;
- compatibilidad con partición y archivado;
- integración con eventos transversales;
- pruebas y rollback.

No se implementa dentro de AUTH-CTX-024.

---

#### 61. Frontera transaccional

Para mutaciones sensibles:

```text
resolver
→ decidir
→ registrar decisión
→ validar concurrencia
→ ejecutar
→ registrar resultado
```

deberá ocurrir:

- dentro de una frontera transaccional; o
- mediante un protocolo explícito de revalidación e idempotencia.

AUTH-CTX-026 definirá el contrato del evaluador.

`AUTH-DB-032` implementará el vínculo durable.

---

#### 62. Decisiones de lectura

Las decisiones de lectura también deberán producir `audit`.

La política de persistencia durable podrá diferenciar:

- navegación;
- UI guard;
- lectura ordinaria;
- lectura sensible;
- exportación;
- agregado;
- soporte;
- mutación.

Esa política será definida en `SUPA-ARC-007` e implementada en
`AUTH-DB-032`.

No se permite que la diferencia de retención cambie el contrato emitido.

---

#### 63. UI guards

Un UI guard puede consumir una proyección segura.

No deberá recibir:

- hashes de datasets;
- grants;
- denies;
- IDs disciplinarios;
- fingerprint completo si no es necesario;
- evaluator version interna.

La decisión de servidor conserva la auditoría completa.

---

#### 64. RPC y RLS

RPC y políticas sensibles deberán:

- consumir el mismo evaluador o semántica canónica;
- propagar `decision_id`;
- no crear audit contexts incompatibles;
- no registrar únicamente texto libre;
- no omitir actor efectivo en dispositivo compartido.

La adopción corresponde a `AUTH-DB-006` a `AUTH-DB-010`.

---

#### 65. Cambios de permisos

La auditoría de una decisión no sustituye:

```text
AUTH-DB-012
— auditoría de cambios de permisos
```

Relación:

```text
cambio de grant o deny
→ evento de configuración

decisión posterior
→ evento de evaluación
```

Ambos pueden compartir correlación administrativa, pero son hechos distintos.

---

#### 66. Simulación

La simulación utiliza:

```text
SimulationAuditContext
```

No utiliza `AuthorizationAuditContext` como si fuera una decisión real.

`AUTH-DB-013` implementará la auditoría física de simulación.

Un `WOULD_ALLOW` nunca se registra como `ALLOW`.

---

#### 67. Dispositivos

La auditoría de decisiones conserva `device_id` cuando participa un
dispositivo.

`AUTH-DB-014` implementará el historial y cambios propios del dispositivo.

Relación:

```text
cambio del dispositivo
≠
decisión emitida usando el dispositivo
```

---

#### 68. Procesos SYSTEM

Un actor de sistema deberá conservar:

- actor de sistema exacto;
- principal técnico exacto;
- aplicación;
- permiso;
- recurso;
- delegación cuando exista;
- hashes;
- evaluador.

`service_role` no se registra como explicación suficiente de autoridad.

---

#### 69. Actor anónimo o no resuelto

Una decisión emitida para actor anónimo o no resuelto:

- tendrá `actor_id = null`;
- conservará el principal disponible;
- normalmente terminará en `DENY`;
- conservará fingerprints coherentes;
- no inventará employee_id;
- no omitirá audit.

---

#### 70. Proyección segura al cliente

La proyección ordinaria podrá incluir como máximo:

- outcome;
- permiso seguro;
- código de mensaje;
- razones seguras;
- `correlation_id` o identificador de soporte cuando se permita.

No deberá incluir por defecto:

- `dataset_hashes`;
- `catalog_hash`;
- `context_fingerprint`;
- `resource_fingerprint`;
- `evaluator_name`;
- `evaluator_version`;
- IDs internos sensibles;
- grants o denies.

---

#### 71. Identificador de soporte

El identificador presentado a soporte podrá ser:

- `correlation_id`; o
- un identificador opaco que resuelva internamente a la correlación.

No deberá ser:

- bearer token;
- `decision_id` reutilizable para ejecutar;
- ID que revele volumen;
- secuencia incremental pública.

BLOQUE S definirá la experiencia de soporte.

---

#### 72. Datos personales

El audit context utiliza IDs canónicos, no atributos humanos descriptivos.

No incluirá directamente:

- nombre;
- documento;
- correo;
- teléfono;
- cargo textual;
- motivo disciplinario;
- comentario libre.

Una consulta autorizada podrá resolver esos datos desde sus fuentes vigentes
sin modificar la decisión histórica.

---

#### 73. Secretos y credenciales

Queda prohibido registrar dentro del audit context:

- JWT;
- refresh token;
- API key;
- password;
- cookie;
- secreto de webhook;
- credencial de base;
- headers completos;
- payload de autenticación;
- código OTP.

Las necesidades de seguridad técnica deberán usar telemetría separada y
redactada.

---

#### 74. Audit log frente a observabilidad

```text
AUDITORÍA EMPRESARIAL
→ evidencia durable e interpretable

OBSERVABILIDAD
→ métricas, trazas y logs operativos
```

Pueden compartir `correlation_id`.

No deberán compartir indiscriminadamente:

- retención;
- exposición;
- sensibilidad;
- estructura;
- audiencia.

`SUPA-ARC-007` definirá la frontera transversal.

---

#### 75. Fallo del evaluador

Un error interno nunca produce `ALLOW`.

Si el evaluador puede construir una decisión coherente:

```text
DENY
+
CONTRACT_INVALID o razón estructural
+
audit completo
```

Si no puede construir el contrato mínimo:

```text
no se emite AuthorizationDecision válida
+
operación falla cerrada
+
telemetría de infraestructura
```

No se emite un objeto parcialmente auditable.

---

#### 76. Contexto obsoleto

Cuando el contexto queda obsoleto antes de ejecutar:

- la decisión histórica permanece;
- la ejecución se rechaza;
- se genera una nueva decisión si se reintenta;
- ambas decisiones conservan IDs distintos;
- la correlación podrá conservarse si pertenece al mismo intento lógico.

AUTH-CTX-029 definirá invalidación y caché.

---

#### 77. Concurrencia

Una decisión sobre una versión de recurso no se reutiliza después de un
conflicto.

El audit context conserva `resource_fingerprint`.

El registro de ejecución deberá conservar:

- versión esperada;
- versión observada;
- resultado del conflicto.

La estructura física corresponde a `AUTH-DB-032`.

---

#### 78. Idempotencia

Una idempotency key:

- no sustituye `decision_id`;
- no sustituye `correlation_id`;
- no concede permiso;
- podrá vincular varios reintentos controlados;
- no permitirá reutilizar una decisión obsoleta.

La clave permanece en el contexto de concurrencia o ejecución, no se agrega
al audit context v1.

---

#### 79. Drift y ambientes

La misma versión declarada del evaluador no deberá representar lógica
distinta entre:

- local;
- pruebas;
- staging;
- producción.

`AUTH-DB-028` verificará baseline y drift.

`AUTH-DB-031` certificará paridad final.

Los hashes permiten detectar fuentes distintas, pero no sustituyen control de
drift.

---

#### 80. Retención, archivado y crecimiento

La política de retención no se decide aquí.

Responsabilidades explícitas:

| Responsabilidad                                    | Tarea          |
| -------------------------------------------------- | -------------- |
| Arquitectura de auditoría y eventos                | `SUPA-ARC-007` |
| Retención, archivado, respaldo y recuperación      | `SUPA-ARC-022` |
| Persistencia de decisiones y vínculo con ejecución | `AUTH-DB-032`  |
| Índices, partición, retención y crecimiento        | `AUTH-DB-025`  |
| Pruebas físicas                                    | `AUTH-DB-027`  |
| Certificación final                                | `AUTH-DB-031`  |

No queda pendiente narrativo sin dueño.

---

#### 81. Acceso a auditoría

La futura consulta de auditoría deberá aplicar:

- permiso exacto;
- propósito legítimo;
- alcance territorial cuando aplique;
- separación entre soporte, seguridad, gerencia y auditoría;
- redacción de campos sensibles;
- trazabilidad de la propia consulta;
- ausencia de acceso por simple rol textual.

La arquitectura corresponde a `SUPA-ARC-007`.

La implementación corresponde a `AUTH-DB-032`.

---

#### 82. Compatibilidad legacy

AUTH-CTX-028 deberá identificar:

- decisiones booleanas sin evidencia;
- logs de texto sin actor efectivo;
- registros sin principal;
- auditorías sin dispositivo;
- decisiones sin hashes;
- IDs reutilizados;
- permisos legacy;
- recursos no resueltos;
- registros sin correlación;
- fuentes incompatibles.

No se declararán reproducibles si carecen de evidencia.

Podrán conservarse como historial legacy claramente clasificado.

---

#### 83. Pruebas obligatorias posteriores

AUTH-CTX-030 deberá probar contractualmente:

- igualdad de IDs;
- igualdad de outcome;
- igualdad de carriles;
- actor, principal y dispositivo;
- recursos existentes;
- borradores;
- colecciones;
- agregados;
- bulk;
- non-resource;
- fingerprints deterministas;
- cambio de fingerprint ante cambio autoritativo;
- catálogo;
- datasets consultados sin match;
- datasets no aplicables;
- evaluator version;
- proyección segura;
- inmutabilidad;
- errores fail closed.

AUTH-DB-027 deberá probar la implementación física.

---

#### 84. Casos canónicos

##### Caso A — Sesión personal autorizada

```text
actor_id = employee_id
principal_id = auth_user_id
device_id = null
outcome = ALLOW
authorizing_lanes = [BASE]
```

##### Caso B — Dispositivo compartido

```text
actor_id = employee_id
principal_id = shared_device_auth_principal
device_id = shared_device_id
```

##### Caso C — Denegación

```text
outcome = DENY
authorizing_lanes = []
primary reason permanece en final_decision
```

##### Caso D — Borrador

```text
resource_ids = []
resource_fingerprint = fingerprint del borrador normalizado
```

##### Caso E — Dataset sin coincidencias

```text
individual-overrides consultado
0 matches
→ su hash permanece en dataset_hashes
```

##### Caso F — Dataset no aplicable

```text
carril operativo NOT_APPLICABLE
dataset operativo no consultado
→ no se agrega hash falso
```

##### Caso G — Recurso cambia

```text
resource_fingerprint anterior
≠ resource_fingerprint nuevo
→ nueva decisión
```

##### Caso H — Error crítico antes de construir audit

```text
no AuthorizationDecision válida
→ fail closed
→ telemetría de infraestructura
```

##### Caso I — Proyección cliente

```text
cliente recibe safe_message_code
no recibe dataset_hashes
```

##### Caso J — Ejecución

```text
execution_record.decision_id
=
AuthorizationDecision.decision_id
```

---

#### 85. Antipatrones prohibidos

```ts
audit.actor_id = request.employee_id;
```

```ts
audit.principal_id = audit.actor_id;
```

```ts
audit.device_id = request.userAgent;
```

```ts
audit.dataset_hashes = {};
```

cuando sí se consultaron datasets.

```ts
audit.evaluator_version = "latest";
```

```ts
if (decision.outcome === "ALLOW") {
  skipAudit();
}
```

```ts
executeWithDecisionId(decisionId);
```

También queda prohibido:

```text
decision_id → bearer token
correlation_id → permiso
resource_ids del cliente → recurso auditado
hash actual → reinterpretar decisión histórica
logs de texto → auditoría canónica
correo → actor_id
auth_user_id → employee_id
service_role → autoridad
dataset sin match → dataset omitido
DENY con authorizing_lanes
ALLOW sin authorizing_lanes
fingerprint sin perfil canónico
auditoría sensible → respuesta cliente
```

---

#### 86. Relación con tareas posteriores

| Tarea                         | Responsabilidad                                                  |
| ----------------------------- | ---------------------------------------------------------------- |
| `AUTH-CTX-025`                | Producir `AccessContext` y su referencia coherente               |
| `AUTH-CTX-026`                | Diseñar evaluador, fingerprints, correlación y versiones físicas |
| `AUTH-CTX-027`                | Eliminar decisiones y logs locales incompatibles                 |
| `AUTH-CTX-028`                | Adaptar historial y consumidores legacy                          |
| `AUTH-CTX-029`                | Definir caché, obsolescencia e invalidación                      |
| `AUTH-CTX-030`                | Probar contrato completo                                         |
| `SUPA-ARC-007`                | Diseñar esquema transversal de auditoría y eventos               |
| `SUPA-ARC-022`                | Definir retención, archivado, respaldo y recuperación            |
| `AUTH-DB-006` a `AUTH-DB-010` | Adoptar contexto y decisión en RPC sensibles                     |
| `AUTH-DB-012`                 | Auditar cambios de permisos                                      |
| `AUTH-DB-013`                 | Auditar simulaciones                                             |
| `AUTH-DB-014`                 | Auditar dispositivos                                             |
| `AUTH-DB-025`                 | Implementar índices, retención y crecimiento                     |
| `AUTH-DB-027`                 | Probar esquema, RLS, RPC y migraciones                           |
| `AUTH-DB-031`                 | Certificar paridad final                                         |
| `AUTH-DB-032`                 | Persistir decisiones y vincularlas con ejecución                 |
| BLOQUE S                      | Diseñar exposición segura y soporte                              |

---

#### 87. Fuera del alcance

AUTH-CTX-024 no:

- crea tablas;
- crea esquema de auditoría;
- crea migraciones;
- crea índices;
- define particiones;
- establece días de retención;
- crea políticas RLS;
- crea permisos de consulta;
- implementa el evaluador;
- implementa fingerprints;
- implementa correlación;
- implementa logs;
- implementa dashboards;
- migra datos legacy;
- modifica Supabase;
- cambia el resultado final;
- agrega campos a `AuthorizationAuditContext@1.0.0`.

Toda responsabilidad diferida tiene tarea explícita en las secciones 80 y
86.

---

#### 88. Riesgos controlados

| Riesgo                          | Control                             |
| ------------------------------- | ----------------------------------- |
| Decisión sin evidencia          | `audit` obligatorio                 |
| Actor confundido con principal  | Campos y matriz separados           |
| Dispositivo oculto              | `device_id` explícito               |
| ID de cliente aceptado          | Resolución autoritativa en servidor |
| Hash calculado después          | Snapshot e inmutabilidad            |
| Dataset sin match omitido       | Dataset consultado conserva hash    |
| Dataset no aplicable inventado  | Solo fuentes realmente consultadas  |
| `latest` como versión           | Versión exacta obligatoria          |
| DENY con carril autorizante     | Lista vacía obligatoria             |
| ALLOW sin evidencia             | Carril autorizante obligatorio      |
| Auditoría filtrada al cliente   | Proyección segura separada          |
| Logs usados como auditoría      | Contrato estructurado               |
| Decisión reutilizada como token | Prohibición contractual             |
| Falta persistencia física       | Nueva tarea `AUTH-DB-032`           |
| Retención sin dueño             | `SUPA-ARC-022` y `AUTH-DB-025`      |
| Consulta sin control            | `SUPA-ARC-007` y `AUTH-DB-032`      |
| Divergencia entre ambientes     | `AUTH-DB-028` y `AUTH-DB-031`       |

---

#### 89. Criterios de aprobación

AUTH-CTX-024 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `AuthorizationAuditContext`;
2. no se agregan campos;
3. `audit` es obligatorio;
4. ALLOW y DENY incluyen audit;
5. audit no es log de texto;
6. audit no es proyección cliente;
7. audit es índice compacto de trazabilidad;
8. la decisión completa conserva la evidencia detallada;
9. audit no duplica indiscriminadamente la decisión;
10. `audit.decision_id` iguala al `decision_id` raíz;
11. decision_id es único;
12. decision_id es inmutable;
13. decision_id no es token;
14. decision_id no es idempotency key;
15. decided_at permanece en la raíz;
16. correlation_id vincula una operación lógica;
17. correlation_id no concede autoridad;
18. correlation_id puede ser null de forma controlada;
19. AUTH-CTX-026 define creación y propagación;
20. actor_id representa actor efectivo;
21. actor_id coincide con AccessContext;
22. actor_id puede ser null solo en actor no resuelto;
23. principal_id representa principal técnico;
24. principal_id no equivale al actor;
25. device_id representa dispositivo canónico;
26. device_id no es user agent;
27. dispositivo compartido conserva actor, principal y dispositivo;
28. sesión personal conserva empleado y usuario;
29. servicio conserva actor y principal técnicos;
30. app_code coincide con request;
31. app_code coincide con propietario del permiso;
32. permission_key coincide exactamente;
33. no existen prefijos ni wildcards;
34. resource_type coincide con recurso resuelto;
35. resource_ids son autoritativos;
36. resource_ids no contienen duplicados;
37. resource_ids tienen orden determinista;
38. IDs del cliente no se aceptan sin validación;
39. recurso existente autorizado exige ID;
40. borrador puede tener lista vacía;
41. borrador usa fingerprint exacto;
42. no se inventa ID para borrador;
43. colecciones requieren estrategia reproducible;
44. agregados conservan definición exacta;
45. bulk conserva miembros o descriptor aprobado;
46. non-resource usa lista vacía;
47. audit.outcome iguala final_decision.outcome;
48. outcome solo admite ALLOW o DENY;
49. audit.authorizing_lanes iguala final_decision;
50. carriles se ordenan canónicamente;
51. ALLOW exige al menos un carril autorizante;
52. DENY exige lista vacía;
53. un carril positivo previo no queda como autorizante de DENY;
54. context_fingerprint coincide con AccessContextReference;
55. fingerprint representa snapshot exacto;
56. nueva realidad produce nueva huella;
57. preimagen incluye hechos autoritativos;
58. secretos quedan excluidos;
59. exclusión no elimina hechos relevantes;
60. resource_fingerprint es obligatorio;
61. fingerprint cambia con recurso relevante;
62. preimagen incluye territorio y estado;
63. preimagen incluye concurrencia cuando aplica;
64. no se hashean columnas irrelevantes indiscriminadamente;
65. contrato del recurso define hechos relevantes;
66. serialización usa canonical JSON;
67. conjuntos se ordenan;
68. secuencias conservan orden;
69. null y listas vacías son explícitos;
70. algoritmo identifica su nombre;
71. huella no sustituye snapshot;
72. huella no prueba corrección de fuente;
73. catalog_hash iguala permission_contract;
74. versión sin hash no basta;
75. catálogo incompatible falla cerrado;
76. decisión incompleta no se emite;
77. dataset_hashes registra fuentes participantes;
78. clave incluye dataset ID y versión;
79. valor incluye hash exacto;
80. dataset consultado sin match se registra;
81. dataset no aplicable no se inventa;
82. claves se ordenan canónicamente;
83. hash faltante produce contract invalid;
84. no se acepta latest ni unknown;
85. evaluator_name es lógico y estable;
86. evaluator_name no es hostname;
87. evaluator_version identifica implementación exacta;
88. evaluator_version no usa latest;
89. versiones contractuales permanecen separadas;
90. actualizar evaluador no cambia contrato;
91. decisión emitida es inmutable;
92. audit no se reescribe;
93. corrección produce nueva decisión;
94. todos los campos obligatorios se completan al emitir;
95. no existe reparación tardía silenciosa;
96. la auditoría permite reproducibilidad histórica;
97. no reinterpreta pasado con datos actuales;
98. existe cadena verificable de evidencia;
99. audit no duplica matched_allows;
100. matched_allows conserva fuente y dataset;
101. audit no duplica matched_denies;
102. matched_denies conserva su evidencia;
103. audit no duplica razones;
104. razones permanecen en final_decision y blocked_reasons;
105. campos duplicados tienen igualdad explícita;
106. ejecución registra decision_id;
107. ejecución registra correlation_id;
108. ejecución registra resultado;
109. esos campos no amplían audit v1;
110. existe una brecha física real;
111. se crea `AUTH-DB-032`;
112. AUTH-DB-032 pertenece a BLOQUE R1;
113. AUTH-DB-032 ocurre después de SUPA-ARC-007;
114. AUTH-DB-032 precede adopción completa en RPC;
115. AUTH-DB-032 implementará persistencia inmutable;
116. AUTH-DB-032 implementará vínculo con ejecución;
117. AUTH-DB-032 implementará consulta protegida;
118. frontera transaccional o revalidación es obligatoria;
119. decisiones de lectura también producen audit;
120. persistencia durable puede variar por política;
121. variación de retención no cambia el contrato;
122. UI guard recibe proyección segura;
123. RPC y RLS comparten semántica;
124. cambios de permisos se auditan aparte;
125. simulación se audita aparte;
126. dispositivo se audita aparte;
127. SYSTEM no se autoriza por service role;
128. anónimo no inventa actor;
129. cliente no recibe hashes internos;
130. soporte usa correlación segura;
131. audit no almacena PII descriptiva;
132. audit no almacena secretos;
133. observabilidad y auditoría son distintas;
134. error interno nunca permite;
135. decisión parcial no se emite;
136. contexto obsoleto produce nueva decisión;
137. concurrencia invalida reutilización;
138. idempotencia no sustituye decisión;
139. drift se controla por tareas explícitas;
140. retención pertenece a SUPA-ARC-022 y AUTH-DB-025;
141. acceso pertenece a SUPA-ARC-007 y AUTH-DB-032;
142. legacy se clasifica sin fingir reproducibilidad;
143. AUTH-CTX-030 prueba el contrato;
144. AUTH-DB-027 prueba la implementación;
145. no se implementa código, migraciones ni cambios en Supabase.

---

#### 90. Cierre y continuidad de la propuesta

| Relación        | Tarea          | Estado                      |
| --------------- | -------------- | --------------------------- |
| Tarea anterior  | `AUTH-CTX-023` | ✅ APROBADA                  |
| Tarea propuesta | `AUTH-CTX-024` | ✅ APROBADA |
| Tarea siguiente | `AUTH-CTX-025` | ⬜ NO INICIADA               |

```text
AUTH-CTX-023 — APROBADA
        ↓
AUTH-CTX-024 — APROBADA
        ↓
AUTH-CTX-025 — NO INICIADA
```

No se avanza a `AUTH-CTX-025` hasta recibir aprobación explícita de
`AUTH-CTX-024`.


DISEÑO DE IMPLEMENTACIÓN CANÓNICA
