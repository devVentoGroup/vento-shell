### MINI-BLOQUE — ACCESO COMPARTIDO A DATOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **acceso compartido a datos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-DB-001` a `SHELL-DB-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-DB-001`: Crear @vento/supabase
- `SHELL-DB-002`: Centralizar tipos generados por cada paquete de base de datos aprobado
- `SHELL-DB-003`: Crear y actualizar wrappers tipados para RPC canónicas
- `SHELL-DB-004`: Normalizar errores de Supabase
- `SHELL-DB-005`: Separar cliente server, browser y native
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-DB-001 — Crear @vento/supabase

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-009 — Probar idempotencia y conservación semántica
**Tarea siguiente:** SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado
**Tipo de tarea:** Documental; definición canónica de identidad, responsabilidad, fronteras, distribución, seguridad, evolución e integración del package compartido `@vento/supabase`, sin materializar código, package físico, exports runtime, tipos generados, wrappers RPC, migraciones, DDL, DML, cambios de datos ni modificaciones en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/06_ACCESO_COMPARTIDO_A_DATOS.md`
**Estado físico resultante:** ESPECIFICADO; PACKAGE FÍSICO NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, configuración npm, registry, CI, despliegues, SQL, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos o configuración remota:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-DB-001` establece `@vento/supabase` como la frontera compartida de acceso técnico a Supabase para Vento OS.

La tarea fija qué responsabilidades pertenecen al package, cuáles permanecen fuera de él y cómo deberán especializarse en `SHELL-DB-002..005` sin convertir el package en una segunda base de datos, una capa de negocio, un motor de autorización o una fuente alternativa de contratos empresariales.

La relación canónica queda expresada como:

```text
CONTRATOS Y CATÁLOGOS CANÓNICOS
        ↓
@vento/supabase
→ factories de clientes
→ tipos de datos generados
→ wrappers tipados de RPC canónicas
→ errores normalizados de acceso a datos
        ↓
SERVICIOS / ADAPTERS / APLICACIONES
        ↓
SUPABASE AUTORITATIVO
```

Y nunca como:

```text
@vento/supabase
→ lógica empresarial
→ decisión de autorización
→ fuente de verdad de esquema
→ definición de RLS
→ definición de RPC
→ migraciones autónomas
→ secretos distribuidos al cliente
```

---

#### 2. Resultado material de la tarea

Queda definida documentalmente la identidad:

```text
@vento/supabase
```

como package compartido de Vento OS con exactamente cuatro familias de responsabilidad:

1. factories de clientes Supabase;
2. tipos de datos generados desde fuentes versionadas y aprobadas;
3. wrappers tipados de RPC canónicas;
4. errores normalizados de acceso a datos y Supabase.

Esta tarea no crea una quinta familia por inferencia y no materializa ninguna de las cuatro físicamente.

El package queda registrado como responsabilidad de la familia `SHELL-DB-*` dentro de la arquitectura de paquetes compartidos de Vento OS.

---

#### 3. Fuentes normativas consumidas

| Fuente                  | Decisión preservada por `SHELL-DB-001`                                                                                             |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-AUD-008`         | inventario y comparación de clientes browser, server, middleware, proxy, admin y helpers relacionados                              |
| `SHELL-AUD-009`         | ausencia de tipos `Database` generados y de clientes parametrizados; casts y contratos RPC manuales                                |
| `SHELL-AUD-010`         | disposición `COMPARTIR` para factories browser/server/admin y frontera explícita frente a entrypoints locales                      |
| `SHELL-AUD-011`         | conservación o cuarentena de artefactos legacy hasta gates de consumidores, pruebas y rollback                                     |
| `SHELL-PKG-001`         | distribución mediante paquetes npm privados, inmutables y publicados desde VENTO-SHELL                                             |
| `SHELL-PKG-002`         | SemVer independiente por package y propiedad de `@vento/supabase` en la familia `SHELL-DB-*`                                       |
| `SHELL-CON-001`         | frontera entre `@vento/contracts`, `@vento/os-context`, `@vento/supabase`, `@vento/ui-web`, aplicaciones y Supabase                |
| principios de BLOQUE E3 | Supabase como plataforma autoritativa de datos y ejecución; VENTO-SHELL como fuente versionada de migraciones, contratos y pruebas |
| `SHELL-NORM-001..009`   | prohibición de mezclar acceso técnico a datos con normalización textual o identidad empresarial                                    |
| `SHELL-DB-002..005`     | especialización reservada de tipos, RPC, errores y separación runtime                                                              |

La precedencia es:

```text
DECISIONES CANÓNICAS DE E3
        ↓
CLASIFICACIÓN SHELL-AUD
        ↓
GOBIERNO SHELL-PKG Y SHELL-CON
        ↓
IDENTIDAD SHELL-DB-001
        ↓
ESPECIALIZACIONES SHELL-DB-002..005
```

---

#### 4. Reconciliación de la frontera con `@vento/os-context`

La auditoría temprana agrupó bajo `@vento/os-context` guards, adapters, contexto, autorización, SSO, firma y clientes Supabase compartidos.

Las decisiones posteriores de distribución y contratos especializan esa agrupación y fijan una frontera más precisa:

```text
@vento/os-context
→ guards
→ adapters de contexto y autorización
→ scopes por solicitud
→ SSO
→ firma y atribución
→ compatibilidad runtime de contexto/autorización

@vento/supabase
→ factories Supabase
→ tipos Database generados
→ wrappers tipados de RPC
→ errores de acceso a datos
```

Esta especialización no duplica responsabilidades.

`@vento/os-context` podrá consumir capacidades de acceso a datos compartidas cuando su implementación lo requiera, pero no conservará una segunda implementación propietaria de factories Supabase.

`SHELL-DB-001` no fija todavía el grafo físico de dependencias entre packages; fija únicamente la propiedad semántica de las responsabilidades.

---

#### 5. Identidad y naturaleza del package

`@vento/supabase` será:

- privado;
- compartido entre consumidores Vento OS compatibles;
- independiente de una aplicación concreta;
- versionado de forma independiente;
- inmutable una vez publicada una versión;
- reproducible desde `vento-shell`;
- libre de reglas empresariales específicas de NEXO, VISO, FOGO, ORIGO, PULSO, NUMERA, ANIMA, PASS, TALENTO, AURA u otra aplicación;
- compatible con configuración explícita por consumidor;
- apto para separar capacidades browser, server, native y privilegiadas sin mezclarlas.

No será:

- ORM empresarial;
- repositorio de dominio universal;
- sustituto de Supabase;
- catálogo empresarial;
- fuente de identidad de aplicaciones, permisos, roles o scopes;
- motor de autorización;
- gestor de secretos cliente;
- ejecutor autónomo de migraciones;
- capa de UI;
- paquete de normalización textual.

---

#### 6. Ubicación física y estado de materialización

La identidad lógica del package queda aprobada en esta tarea.

La ubicación física concreta del package dentro del workspace no se asigna por inferencia en `SHELL-DB-001`.

Reglas:

1. el patrón de workspaces existente no autoriza inventar una ruta física;
2. la existencia de otros packages no define automáticamente el directorio del nuevo package;
3. el package físico solo podrá materializarse cuando la fase y el gate correspondientes lo autoricen;
4. hasta entonces, cualquier ruta propuesta será no canónica;
5. los helpers actuales permanecen como implementaciones legacy o evidencia de transición, no como estructura física del package futuro.

Estado:

```text
IDENTIDAD DOCUMENTAL = APROBADA
ROOT FÍSICO = NO ASIGNADO
PACKAGE RUNTIME = NO MATERIALIZADO
VERSIÓN NPM = NO ASIGNADA
CONSUMIDORES MIGRADOS = 0 POR ESTA TAREA
```

---

#### 7. Las cuatro familias exactas de responsabilidad

| Orden | Familia         | Responsabilidad de `@vento/supabase`                                         | Especialización propietaria                                                |
| ----: | --------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
|    01 | factories       | construcción controlada de clientes y capacidades Supabase por runtime       | `SHELL-DB-005`, con infraestructura inicial permitida desde `SHELL-DB-001` |
|    02 | tipos generados | tipos derivados de paquetes de base de datos y fuentes versionadas aprobadas | `SHELL-DB-002`                                                             |
|    03 | wrappers RPC    | frontera tipada sobre RPC canónicas aprobadas                                | `SHELL-DB-003`                                                             |
|    04 | errores         | vocabulario y normalización de fallos técnicos de acceso a datos             | `SHELL-DB-004`                                                             |

Conciliación:

```text
familias esperadas = 4
familias centralizadas = 4
faltantes = 0
duplicados = 0
```

---

#### 8. Matriz de propiedad frente a packages y capas vecinas

| Materia                                                                 | Propietario canónico             | Regla de frontera                                                        |
| ----------------------------------------------------------------------- | -------------------------------- | ------------------------------------------------------------------------ |
| catálogos, códigos, schemas estáticos, manifests y hashes contractuales | `@vento/contracts`               | `@vento/supabase` consume contratos; no los redefine                     |
| factories y capacidades Supabase                                        | `@vento/supabase`                | una implementación compartida; sin forks por aplicación                  |
| tipos `Database` y derivados de base                                    | `@vento/supabase`                | generados desde fuente versionada; no editados manualmente               |
| wrappers RPC                                                            | `@vento/supabase`                | tipan invocación y errores; no redefinen semántica empresarial de la RPC |
| errores de acceso a datos                                               | `@vento/supabase`                | distingue fallo técnico de decisiones de autorización o dominio          |
| contexto, guards, autorización, SSO y request scope                     | `@vento/os-context`              | consume acceso técnico sin apropiarse de factories                       |
| normalización textual                                                   | `@vento/data-normalization`      | no forma parte del acceso a datos                                        |
| componentes web                                                         | `@vento/ui-web`                  | no importa secretos ni capacidades privilegiadas por diseño              |
| lógica empresarial y orquestación                                       | aplicación o servicio de dominio | usa adapters y contratos; no se desplaza al package técnico              |
| tablas, funciones, RPC, RLS, triggers y datos                           | Supabase bajo gobierno E3        | su definición física no vive dentro del package runtime                  |
| migraciones y configuración Supabase versionada                         | `vento-shell`                    | fuente de cambio físico; el package no auto-migra                        |

---

#### 9. Frontera de factories

La familia de factories deberá permitir centralizar la construcción técnica de clientes sin centralizar reglas de negocio.

Invariantes:

1. la configuración entra de forma explícita y validada;
2. el package no selecciona una aplicación mediante constantes locales;
3. el package no incorpora URLs, dominios, permisos, sedes, áreas o políticas de negocio hardcodeadas;
4. el package no interpreta la existencia de una sesión como autorización empresarial;
5. el package no transforma automáticamente errores técnicos en denegaciones de negocio;
6. el package no ejecuta consultas empresariales como efecto lateral de crear un cliente;
7. los factories no contienen routing, navegación, lógica de kiosco, reglas de PDF, operaciones financieras ni reglas de dominio;
8. la política exacta de ciclo de vida por runtime se define en `SHELL-DB-005`.

---

#### 10. Factory browser

La superficie browser deberá especializarse posteriormente con estas fronteras mínimas:

- utilizar únicamente configuración segura para exposición cliente;
- no depender de secretos server-only;
- no exponer service role;
- no crear autoridad adicional por poseer un cliente autenticado;
- declarar su política de ciclo de vida en vez de depender de forks históricos;
- declarar la política de cookies aplicable cuando corresponda;
- conservar comportamiento determinista para igual configuración.

`SHELL-DB-001` no decide todavía:

- nombre del export;
- singleton frente a instancia por llamada;
- forma exacta del objeto de configuración;
- API específica de cookies;
- mecanismo de caché;
- tipos genéricos finales.

Esas decisiones pertenecen a `SHELL-DB-005` y a las pruebas de compatibilidad posteriores.

---

#### 11. Factory server

La superficie server deberá:

1. operar únicamente en runtime servidor compatible;
2. recibir configuración explícita;
3. integrar la política de cookies mediante un contrato único;
4. conservar la capacidad de representar comportamiento sensible al host cuando esté aprobado;
5. distinguir errores de lectura y escritura de cookies de una denegación empresarial;
6. no mezclar autenticación de sesión con routing o lógica de dominio;
7. poder parametrizarse con los tipos generados aplicables cuando estos existan;
8. permanecer compatible con los límites de Next y Supabase definidos por la matriz de versiones.

El comportamiento exacto de host, cookies y separación runtime pertenece a `SHELL-DB-005`; la normalización de fallos pertenece a `SHELL-DB-004`.

---

#### 12. Capacidad privilegiada / administrativa

La auditoría confirmó la necesidad de una frontera privilegiada server-only.

Por tanto:

```text
CLIENTE PRIVILEGIADO
≠ CLIENTE BROWSER
≠ CLIENTE DE SESIÓN ORDINARIA
```

Reglas:

1. ninguna credencial privilegiada podrá formar parte de una superficie browser o native pública;
2. el package no almacenará secretos en código ni en catálogos compartidos;
3. la creación de un cliente privilegiado no autoriza por sí misma una operación administrativa;
4. la aplicación o servicio propietario conserva la decisión de negocio y autorización previa;
5. los consumidores privilegiados deberán quedar identificados y gobernados;
6. el export físico, si existe, deberá quedar segregado de las superficies no privilegiadas;
7. la forma final pertenece a `SHELL-DB-005` y a la frontera de autorización aplicable.

---

#### 13. Superficie native

`SHELL-DB-005` reserva una separación explícita `server / browser / native`.

`SHELL-DB-001` reconoce `native` como clase de runtime que no podrá resolverse reutilizando ciegamente factories web.

Reglas:

1. native no heredará APIs de cookies de Next;
2. native no heredará secretos server-only;
3. su almacenamiento de sesión deberá usar el mecanismo permitido por su plataforma y contrato;
4. no se creará una implementación native hasta que la tarea propietaria la especifique;
5. la ausencia actual de una implementación física no autoriza a simularla mediante un factory browser renombrado.

---

#### 14. Middleware y proxy permanecen fuera de la identidad del package

Los entrypoints de framework y las reglas de routing permanecen locales.

En consecuencia:

- `middleware.ts` no se convierte en export de `@vento/supabase`;
- matchers y rutas públicas permanecen en la aplicación propietaria;
- lógica de kiosco NEXO permanece local;
- excepción PDF ORIGO permanece local;
- reglas de navegación o redirección propias de una aplicación permanecen locales;
- helpers proxy sin consumidor confirmado no se elevan al package para justificar su existencia;
- una aplicación podrá componer un adapter compartido dentro de su middleware sin convertir el entrypoint en código compartido.

La frontera compartida debe ser componible; no debe apropiarse del árbol de rutas de los consumidores.

---

#### 15. Tipos generados

Los tipos de datos pertenecen a `@vento/supabase` cuando derivan de una fuente física versionada de base de datos o de un paquete contractual aprobado.

Reglas:

1. `Database` y tipos equivalentes no se mantendrán manualmente;
2. la salida deberá declarar su fuente y corte de generación;
3. la generación deberá ser determinista;
4. una salida generada no se editará manualmente;
5. los tipos deberán poder evolucionar por paquete de base de datos aprobado;
6. una reubicación de schema no cambia por sí sola el significado empresarial de un campo;
7. el tipado compile-time no sustituye RLS, permisos, validación runtime ni autorización;
8. DTOs locales de dominio podrán existir cuando sean proyecciones explícitas y no fuentes paralelas del esquema.

La materialización incremental y su sincronización pertenecen a `SHELL-DB-002`.

---

#### 16. Wrappers tipados de RPC

La familia RPC tendrá como propósito eliminar strings, firmas y casts divergentes en consumidores sin convertir el wrapper en propietario de la regla empresarial.

Invariantes:

1. la RPC física y su semántica autoritativa permanecen gobernadas por E3/BLOQUE R;
2. el wrapper consume una RPC aprobada, no crea una RPC paralela;
3. input y output se tipan contra la fuente versionada aplicable;
4. los payloads que requieran validación runtime no se aceptarán únicamente mediante cast;
5. los nombres de RPC no se duplicarán manualmente en múltiples consumidores cuando exista wrapper canónico;
6. la capa podrá normalizar error técnico de transporte o contrato;
7. no convertirá un error técnico en `false`, `null`, lista vacía o éxito silencioso sin semántica explícita;
8. el wrapper no elimina RLS ni validaciones de servidor;
9. el wrapper no autoriza una mutación por existir una firma TypeScript válida.

La definición incremental pertenece a `SHELL-DB-003`.

---

#### 17. Errores normalizados de acceso a datos

`@vento/supabase` será propietario del vocabulario técnico común para fallos originados en la capa de acceso a datos.

La taxonomía final pertenece a `SHELL-DB-004`, pero `SHELL-DB-001` fija estas fronteras:

```text
ERROR DE ACCESO A DATOS
≠ DENEGACIÓN DE AUTORIZACIÓN
≠ BLOQUEO DE CONTEXTO
≠ VALIDACIÓN EMPRESARIAL
≠ MENSAJE HUMANO
```

Reglas:

1. un error deberá conservar causa técnica suficiente para diagnóstico seguro;
2. no se expondrán detalles sensibles indiscriminadamente al cliente;
3. los consumidores podrán traducir códigos técnicos a mensajes de interfaz sin redefinir el error base;
4. la capa no colapsará sistemáticamente error y ausencia de datos;
5. la capa no colapsará error y denegación;
6. los wrappers RPC deberán usar el mismo contrato de errores cuando corresponda;
7. la semántica de retry, compatibilidad y fallo cerrado deberá quedar explícita cuando aplique.

---

#### 18. Configuración y variables de entorno

`@vento/supabase` no será fuente de valores ambientales.

Reglas:

1. la aplicación o runtime propietario suministra configuración validada;
2. el package puede validar forma y consistencia de la configuración que recibe;
3. una variable server-only no se considerará disponible en browser por aparecer en el código fuente;
4. los fallbacks ambientales deberán ser explícitos, versionados y compatibles con la matriz aprobada;
5. secretos no se serializarán en manifests, bundles browser ni logs;
6. la ausencia de configuración necesaria falla de forma explícita;
7. no se seleccionará ambiente por heurística de hostname dentro de lógica de negocio.

La forma exacta del contrato ambiental se especializa en `SHELL-DB-005` y en los contratos de configuración aplicables.

---

#### 19. Cookies, sesión y host

La auditoría confirmó variantes reales de ciclo de vida y política de dominio de cookie.

Esta tarea conserva la necesidad sin elegir todavía una implementación única.

Reglas vinculantes:

1. la política de cookies será parte del contrato del factory, no un detalle copiado por aplicación;
2. dominio, path, secure, same-site, expiración, borrado y comportamiento local deberán ser explícitos cuando apliquen;
3. el comportamiento host-aware válido se representará como política configurable y no como fork de código;
4. escribir cookies desde un contexto que no lo permite deberá producir una conducta definida y observable;
5. refrescar sesión no podrá mezclar routing de negocio;
6. la sesión autenticada no implica permiso empresarial;
7. middleware local puede utilizar factories compartidos, pero conserva su propia cobertura de rutas.

La materialización pertenece a `SHELL-DB-005`, `SHELL-AUTH-002` y las tareas de adopción correspondientes.

---

#### 20. Seguridad y aislamiento de capacidades

`@vento/supabase` deberá aplicar separación de capacidades por runtime.

Mínimos:

- browser: sin secretos privilegiados;
- native: sin APIs de servidor o cookies web por defecto;
- server: capacidad de sesión y cookies del servidor, sin asumir privilegio administrativo;
- admin/privileged: server-only, segregado y con consumidores gobernados;
- tipos generados: sin credenciales;
- wrappers RPC: sin elevación implícita de privilegios;
- errores: sin filtración de secretos o detalles sensibles;
- manifests: sin material secreto.

Una importación válida de TypeScript no sustituye la protección de runtime.

---

#### 21. Relación con RLS y autorización

La existencia de `@vento/supabase` no modifica la arquitectura de seguridad.

Invariantes:

1. RLS permanece autoritativa donde aplique;
2. permisos, contexto y políticas de autorización permanecen en sus contratos y resolutores propietarios;
3. un wrapper exitoso no equivale a permiso concedido;
4. un cliente autenticado no equivale a actor autorizado;
5. un cliente service-role no podrá usarse como bypass general del modelo de autorización;
6. el package no agregará fallbacks por rol, aplicación o ambiente;
7. la capa de aplicación seguirá protegiendo rutas, acciones y endpoints según su arquitectura aprobada.

---

#### 22. API pública y exports

`SHELL-DB-001` no materializa nombres de funciones, archivos, módulos o exports.

La futura API pública deberá cumplir:

1. superficie mínima por capacidad;
2. separación entre browser, server, native y privileged;
3. tipos públicos derivados o compartidos únicamente desde fuentes canónicas;
4. compatibilidad documentada;
5. ausencia de imports de dominio;
6. ausencia de side effects al importar el package;
7. ausencia de conexión o llamada remota durante la mera importación;
8. ausencia de auto-migraciones;
9. errores consistentes;
10. deprecación y evolución mediante SemVer y política de package.

Nombrar exports físicos antes de `SHELL-DB-002..005` constituiría anticipar decisiones reservadas.

---

#### 23. Estado del código legacy auditado

Los clientes y helpers existentes en `vento-shell` y aplicaciones consumidoras se conservan como evidencia y compatibilidad hasta su migración.

Reglas:

1. ningún helper existente se convierte automáticamente en la implementación canónica;
2. ningún blob gana autoridad por ser el más repetido;
3. las variantes singleton, por llamada, host-aware, dominio estático y privileged se conservan como necesidades a reconciliar;
4. middleware local permanece local;
5. proxies y clientes alternos sujetos a retiro no se promueven al package;
6. no se modifican imports ni consumidores en esta tarea;
7. la futura migración deberá conservar paridad, gates y rollback por consumidor.

---

#### 24. Sincronización incremental con paquetes de base de datos

La familia `SHELL-DB` no se cierra como una fotografía única del esquema.

Reglas:

1. `SHELL-DB-001`, `SHELL-DB-004` y `SHELL-DB-005` pueden definir infraestructura compartida inicial;
2. `SHELL-DB-002` y `SHELL-DB-003` se ejecutan de forma incremental con `AUTH-DB-026` y después de cada package contractual de base de datos aprobado en BLOQUE R;
3. cada nuevo package de base de datos puede ampliar los tipos o wrappers aplicables sin redefinir la identidad de `@vento/supabase`;
4. `SHELL-DB-002` y `SHELL-DB-003` no se considerarán finalizadas mientras falte el último package de base de datos que deba certificar la ruta canónica;
5. una RPC o tipo no se incorporará por observación casual del estado remoto;
6. la fuente debe ser versionada y aprobada;
7. la generación o wrapper conservará procedencia suficiente para reproducirse.

---

#### 25. Distribución y versionado

Cuando exista físicamente, `@vento/supabase` seguirá el gobierno común de packages:

```text
PACKAGE PRIVADO
+ VERSIÓN INMUTABLE
+ SEMVER INDEPENDIENTE
+ REGISTRO PRIVADO COMPATIBLE CON NPM
+ VERSIÓN RESUELTA EXACTA EN CONSUMIDOR
+ LOCKFILE
+ PRUEBAS DE COMPATIBILIDAD
+ ROLLBACK
```

Reglas:

1. el workspace local sirve para autoría, integración y pruebas;
2. la distribución canónica entre repositorios no será copia manual de archivos;
3. cada consumidor resolverá una versión reproducible;
4. una publicación no actualizará automáticamente consumidores;
5. una versión incompatible requerirá migración explícita;
6. la primera versión estable no se asigna en esta tarea;
7. `1.0.0` no se presume por existir la especificación documental;
8. el package deberá cumplir API estable, pruebas, compatibilidad y gates antes de considerarse estable.

---

#### 26. Estado de materialización

| Elemento                                   | Estado después de `SHELL-DB-001`                       |
| ------------------------------------------ | ------------------------------------------------------ |
| identidad `@vento/supabase`                | `ESPECIFICADA`                                         |
| responsabilidad de factories               | `ESPECIFICADA`                                         |
| responsabilidad de tipos generados         | `ESPECIFICADA`; generación no materializada            |
| responsabilidad de wrappers RPC            | `ESPECIFICADA`; wrappers no materializados             |
| responsabilidad de errores                 | `ESPECIFICADA`; taxonomía final reservada              |
| separación browser/server/native           | `RESERVADA A SHELL-DB-005`                             |
| capacidad privileged/admin                 | `FRONTERA RECONOCIDA`; implementación no materializada |
| package físico                             | `NO MATERIALIZADO`                                     |
| root físico                                | `NO ASIGNADO`                                          |
| versión npm                                | `NO ASIGNADA`                                          |
| publicación                                | `NO REALIZADA`                                         |
| consumidores migrados                      | `0`                                                    |
| cambios Supabase                           | `0`                                                    |
| cambios de datos                           | `0`                                                    |
| requisitos de prueba creados o modificados | `0`                                                    |

`ESPECIFICADO` no equivale a `IMPLEMENTADO`, `PUBLICADO`, `ADOPTADO` ni `VALIDADO` en runtime.

---

#### 27. Handoffs exactos dentro de `SHELL-DB`

| Materia                                                  | Tarea propietaria | Condición de salida                                                         |
| -------------------------------------------------------- | ----------------- | --------------------------------------------------------------------------- |
| tipos generados por package de base de datos aprobado    | `SHELL-DB-002`    | generación determinista, procedencia y sincronización incremental definidas |
| wrappers tipados de RPC canónicas                        | `SHELL-DB-003`    | firma, tipos, validación y error alineados con RPC aprobadas                |
| normalización de errores Supabase                        | `SHELL-DB-004`    | taxonomía técnica compartida sin mezclar autorización o dominio             |
| separación de factory server/browser/native y privileged | `SHELL-DB-005`    | runtime, configuración, cookies, ciclo y aislamiento de secretos resueltos  |

`SHELL-DB-001` no desarrolla ninguna de estas tareas.

---

#### 28. Handoffs de implementación, distribución y adopción

| Materia posterior                                            | Propietario exacto                                                                  | Regla                                                                        |
| ------------------------------------------------------------ | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| distribución, SemVer, compatibilidad, deprecación y rollback | `SHELL-PKG-001..008`                                                                | aplicar el gobierno común de packages                                        |
| contratos estáticos compartidos                              | `SHELL-CON-*` aplicables                                                            | no redeclararlos dentro de `@vento/supabase`                                 |
| adapters de autenticación/contexto                           | `SHELL-AUTH-*`; `SHELL-CTX-*`                                                       | consumir factories y wrappers sin trasladar autoridad al package             |
| migración de consumidores legacy                             | `SHELL-MIG-*` y tareas de adopción propietarias                                     | conservar paridad, gates y rollback por repositorio                          |
| cambios físicos de Supabase                                  | tareas E3/BLOQUE R aplicables                                                       | exclusivamente mediante migraciones y contratos versionados en `vento-shell` |
| materialización física de package                            | `SHELL-CI-020::<package_id>` después del gate aplicable `E5-GATE-008::<package_id>` | no crear una instancia física sin `package_id` y gate explícitos             |

No se asigna `package_id` desde esta tarea.

---

#### 29. Cobertura de prueba vigente no modificada

Las reglas de esta tarea ya están protegidas por requisitos canónicos vigentes de:

- clasificación explícita entre compartir, generar y mantener local;
- paridad entre responsabilidades compartidas;
- compatibilidad de package y consumidor antes de adopción;
- rollback independiente;
- integridad del registro de pruebas;
- paquetes privados e inmutables;
- SemVer independiente;
- deprecación y retiro controlados;
- clasificación de `@vento/supabase` dentro de la arquitectura de packages;
- tipos generados y adapters Supabase pendientes de implementación;
- protección server-side y RLS independiente del tipado TypeScript.

`SHELL-DB-001` no cambia ninguna de esas obligaciones; las proyecta sobre la identidad del nuevo package.

---

#### 30. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-DB-001` define la identidad y las fronteras de `@vento/supabase` utilizando decisiones ya aprobadas de auditoría, distribución, contratos y arquitectura Supabase. No introduce una API ejecutable, factory física, tipo generado, wrapper RPC, taxonomía final de errores, persistencia, migración, configuración, secreto, cambio de datos ni comportamiento runtime nuevo o modificado. Las especializaciones verificables permanecen en las tareas propietarias ya existentes.

---

#### 31. Decisiones vinculantes

1. El package se denomina exactamente `@vento/supabase`.
2. Su responsabilidad se limita a cuatro familias: factories, tipos generados, wrappers RPC y errores de acceso a datos.
3. No se crea una quinta familia por conveniencia.
4. `@vento/contracts` conserva catálogos, schemas estáticos, códigos, manifests y hashes contractuales.
5. `@vento/os-context` conserva contexto, guards, autorización, SSO, firma y request scope.
6. `@vento/data-normalization` conserva normalización textual.
7. `@vento/ui-web` conserva UI compartida.
8. Supabase conserva datos, funciones, RLS, RPC físicas y persistencia autoritativa.
9. VENTO-SHELL conserva migraciones, contratos y pruebas versionadas de Supabase.
10. El package no contiene lógica empresarial de una aplicación concreta.
11. El package no es motor de autorización.
12. El package no sustituye RLS.
13. Los factories no ejecutan lógica de dominio al construirse.
14. Browser no expone service role ni secretos server-only.
15. Native no se implementa reutilizando ciegamente APIs web.
16. Server y privileged permanecen capacidades distintas.
17. El cliente privileged es server-only y no implica autorización administrativa automática.
18. Middleware permanece como entrypoint local por aplicación.
19. Proxy local no se convierte en parte canónica por mera existencia.
20. Los tipos `Database` y derivados se generan, no se mantienen manualmente.
21. Los wrappers RPC consumen RPC aprobadas; no las redefinen.
22. Los payloads RPC no se consideran válidos únicamente por cast TypeScript.
23. Error técnico, denegación, bloqueo contextual y error empresarial permanecen distintos.
24. Configuración y secretos provienen de la capa propietaria y se validan explícitamente.
25. Cookies y host se especializan en `SHELL-DB-005`.
26. La API pública física no se inventa en `SHELL-DB-001`.
27. El root físico del package permanece sin asignar.
28. No se asigna versión npm en esta tarea.
29. No se presume `1.0.0`.
30. La distribución canónica futura será mediante package npm privado e inmutable conforme a `SHELL-PKG-*`.
31. Los consumidores actuales no se migran en esta tarea.
32. El código legacy permanece como evidencia hasta migración o retiro gobernado.
33. `SHELL-DB-002` y `SHELL-DB-003` evolucionarán incrementalmente con packages de base de datos aprobados.
34. `SHELL-DB-004` conserva la taxonomía final de errores.
35. `SHELL-DB-005` conserva la separación runtime definitiva.
36. No se crea package físico.
37. No se modifica código.
38. No se modifica Supabase.
39. No se crean ni modifican requisitos de prueba.
40. `SHELL-DB-002` queda como única continuidad reservada.

---

#### 32. Hallazgos y destinos exactos

| Hallazgo                                                              | Resultado de `SHELL-DB-001`                                        | Destino exacto                                                        |
| --------------------------------------------------------------------- | ------------------------------------------------------------------ | --------------------------------------------------------------------- |
| las factories Supabase estaban duplicadas entre consumidores          | propiedad centralizada en `@vento/supabase`                        | `SHELL-DB-005` para forma runtime; migración posterior por consumidor |
| existían variantes válidas de ciclo, cookies y host                   | se conservan como necesidades, no como forks canónicos             | `SHELL-DB-005`                                                        |
| existe una capacidad privileged consumida                             | frontera server-only reconocida y segregada                        | `SHELL-DB-005`; adapters de autorización aplicables                   |
| no se localizaron tipos `Database` compartidos generados              | se define propiedad sin inventar salida                            | `SHELL-DB-002`                                                        |
| RPC se consumen mediante strings y casts locales                      | se define propiedad de wrappers sin anticipar firmas               | `SHELL-DB-003`                                                        |
| error técnico y denegación se mezclan en código legacy                | se fija separación conceptual                                      | `SHELL-DB-004`                                                        |
| middleware y proxies tienen responsabilidades distintas               | middleware permanece local y proxy no se promueve                  | `SHELL-AUTH-*`; `SHELL-AUD-011`; migración aplicable                  |
| la auditoría temprana agrupó clientes Supabase en `@vento/os-context` | especialización posterior reconciliada sin duplicar implementación | `SHELL-DB-001`; `SHELL-CON-001`; `SHELL-PKG-001`                      |
| el package aún no existe físicamente                                  | se conserva únicamente la identidad documental                     | gate de materialización aplicable                                     |
| tipos y RPC crecerán con BLOQUE R                                     | se obliga sincronización incremental                               | `SHELL-DB-002`; `SHELL-DB-003`                                        |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 33. Criterios de aceptación

`SHELL-DB-001` queda documentalmente completa cuando se cumplen simultáneamente:

1. se fija exactamente la identidad `@vento/supabase`;
2. se centralizan 4/4 familias de responsabilidad;
3. faltantes de familias = 0;
4. duplicados de familias = 0;
5. factories quedan separadas de lógica de dominio;
6. browser queda separado de privileged;
7. server queda separado de privileged;
8. native queda reconocido como runtime propio sin implementación anticipada;
9. middleware permanece local;
10. proxies legacy no se elevan al package;
11. tipos `Database` se asignan a generación y no a mantenimiento manual;
12. wrappers RPC quedan separados de la semántica autoritativa de las RPC;
13. errores técnicos quedan separados de autorización, contexto y dominio;
14. `@vento/contracts` conserva su frontera estática;
15. `@vento/os-context` conserva su frontera de contexto/autorización;
16. `@vento/data-normalization` conserva normalización;
17. `@vento/ui-web` conserva UI;
18. Supabase conserva persistencia y ejecución autoritativa;
19. RLS no se sustituye por tipos o factories;
20. configuración y secretos no quedan embebidos en el package;
21. no se inventan exports físicos;
22. no se inventa root físico;
23. no se inventa versión npm;
24. se preserva la distribución privada e inmutable posterior;
25. se preserva SemVer independiente;
26. se preserva la sincronización incremental con BLOQUE R;
27. legacy se conserva hasta migración o retiro gobernado;
28. no se crean consumidores nuevos;
29. no se crea código;
30. no se crea package físico;
31. no se ejecuta SQL;
32. no se modifica Supabase;
33. no se crean ni modifican requisitos de prueba;
34. todos los carryovers tienen propietario exacto;
35. la siguiente tarea permanece únicamente reservada.

---

#### 34. Límites

`SHELL-DB-001` no:

- crea físicamente `@vento/supabase`;
- asigna un directorio físico al package;
- crea `package.json` del package;
- crea archivos TypeScript;
- define exports físicos;
- define nombres de factories;
- define nombres de wrappers;
- genera `Database`;
- genera tipos de tabla, vista o RPC;
- crea schemas runtime;
- selecciona librería adicional de validación;
- implementa cliente browser;
- implementa cliente server;
- implementa cliente native;
- implementa cliente privileged;
- crea middleware;
- crea proxy;
- modifica helpers legacy;
- migra consumidores;
- define la taxonomía final de errores;
- ejecuta llamadas Supabase;
- crea o modifica tablas;
- crea o modifica vistas;
- crea o modifica funciones;
- crea o modifica RPC;
- crea o modifica RLS;
- crea o modifica triggers;
- crea o modifica índices;
- crea o modifica constraints;
- ejecuta DDL;
- ejecuta DML;
- ejecuta backfills;
- modifica datos;
- modifica secretos;
- modifica configuración remota;
- publica packages;
- asigna `package_id`;
- desarrolla `SHELL-DB-002`.

---

#### 35. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-009 — Probar idempotencia y conservación semántica

##### TAREA ACTUAL APROBADA

SHELL-DB-001 — Crear @vento/supabase

##### SIGUIENTE TAREA RESERVADA

SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado


### ✅ SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado

**Estado:** APROBADA
**Tarea anterior:** SHELL-DB-001 — Crear @vento/supabase
**Tarea siguiente:** SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas
**Tipo de tarea:** Documental; definición vinculante del gobierno, procedencia, generación determinista, recorte, versionado, compatibilidad y sincronización incremental de tipos generados de Supabase en `@vento/supabase`, sin ejecutar codegen, materializar el package físico, publicar versiones, modificar código, SQL, migraciones, datos, configuración remota ni Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/06_ACCESO_COMPARTIDO_A_DATOS.md`
**Estado físico resultante:** ESPECIFICADO; GENERACIÓN Y CENTRALIZACIÓN FÍSICA NO MATERIALIZADAS
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, exports runtime, configuración npm, registry, CI, SQL, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos o configuración remota:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-DB-002` define cómo Vento OS centralizará los tipos derivados de Supabase dentro de la responsabilidad lógica de `@vento/supabase`, sin convertir un snapshot de base de datos en contrato empresarial ni autorizar todavía generación, publicación o adopción física.

La tarea cierra documentalmente cuatro preguntas:

1. cuál es la fuente autorizada para generar tipos;
2. qué superficies pueden formar parte de cada recorte tipado;
3. cómo se conserva procedencia, determinismo, compatibilidad, seguridad y rollback;
4. cómo se actualiza el conjunto de tipos después de cada paquete de base de datos aprobado.

La relación canónica queda expresada como:

```text
PAQUETE DE BASE DE DATOS APROBADO Y VERSIONADO
        ↓
CANDIDATE / MANIFEST / PARIDAD APLICABLE
        ↓
GENERACIÓN OFICIAL DE TIPOS SUPABASE
        ↓
RECORTES Y ARTEFACTOS TIPADOS GOBERNADOS
        ↓
@vento/supabase
        ↓
CONSUMIDORES COMPATIBLES SEGÚN RUNTIME Y TIER
```

Y nunca como:

```text
PRODUCCIÓN OBSERVADA CASUALMENTE
        ↓
CODEGEN DIRECTO SIN CANDIDATE
        ↓
DATABASE UNIVERSAL
        ↓
CUALQUIER CONSUMIDOR
```

---

#### 2. Resultado material de la tarea

Queda definido el contrato documental de centralización de tipos generados para `@vento/supabase` con estas decisiones vinculantes:

- la generación parte exclusivamente de fuentes versionadas y aprobadas bajo gobierno de `vento-shell`;
- el estado remoto observado no sustituye un candidate ni un paquete aprobado;
- los tipos físicos se generan, no se editan manualmente;
- cada corte conserva procedencia suficiente para reproducirse;
- la selección de schemas y superficies es explícita;
- `public` no se trata como raíz universal del modelo `Database`;
- VITAL permanece fuera del bundle ordinario de Vento OS;
- los artefactos se clasifican por tier de consumo;
- los consumidores browser y mobile no reciben superficies internas o privilegiadas;
- los consumidores server y Edge usan recortes mínimos, no un `Database` privilegiado universal;
- los tipos físicos no sustituyen DTO de negocio, contratos empresariales, autorización, RLS ni validación runtime;
- los cambios se clasifican y prueban antes de promoverse;
- el rollback conserva versiones tipadas anteriores compatibles con el schema recuperado;
- `SHELL-DB-002` se sincroniza incrementalmente con `AUTH-DB-026` y con cada paquete contractual de base de datos aprobado en BLOQUE R;
- la generación y publicación física permanecen fuera de esta tarea documental.

---

#### 3. Naturaleza incremental de `SHELL-DB-002`

`SHELL-DB-002` no representa una fotografía única y definitiva del esquema.

Su resultado documental queda aprobado como regla permanente de centralización, pero la cobertura material de tipos se ampliará de forma incremental cuando BLOQUE R apruebe nuevos paquetes contractuales de base de datos.

Reglas:

1. cada paquete de base de datos aprobado puede introducir una nueva versión o ampliación de tipos;
2. ninguna ampliación se incorpora por observación casual de producción, staging u otro remoto;
3. la unidad de incorporación es un paquete o candidate versionado y aprobado;
4. `AUTH-DB-026` es la tarea que genera y publica físicamente los tipos después de cada paquete aprobado;
5. `SHELL-DB-002` conserva el contrato de gobierno que cada ejecución de `AUTH-DB-026` deberá obedecer;
6. la especificación documental puede cerrarse ahora, pero la cobertura operativa completa no se considera final mientras falte el último paquete de base de datos exigido por la ruta canónica;
7. una nueva ejecución no reinterpreta silenciosamente las versiones anteriores.

---

#### 4. Propiedad y fronteras

La familia de tipos generados pertenece lógicamente a `@vento/supabase`.

La propiedad no transfiere autoridad sobre el esquema, el negocio ni la autorización.

| Materia                                                | Propietario canónico                 | Regla                                                        |
| ------------------------------------------------------ | ------------------------------------ | ------------------------------------------------------------ |
| migraciones y candidate versionado                     | `vento-shell`                        | fuente de cambio físico y de reproducción                    |
| tablas, vistas, funciones, enums, RLS y persistencia   | Supabase bajo gobierno E3/BLOQUE R   | autoridad física                                             |
| tipos físicos generados                                | `@vento/supabase`                    | proyección tipada derivada, no fuente de verdad              |
| wrappers RPC                                           | `SHELL-DB-003` / `@vento/supabase`   | semántica de invocación y errores separada del codegen crudo |
| errores normalizados                                   | `SHELL-DB-004` / `@vento/supabase`   | taxonomía técnica separada                                   |
| factories por runtime                                  | `SHELL-DB-005` / `@vento/supabase`   | creación y aislamiento de clientes                           |
| DTO, commands, queries, events y errores empresariales | contratos empresariales propietarios | no se derivan únicamente del schema físico                   |
| autorización, permisos, scopes y contexto              | contratos y resolutores propietarios | un tipo no concede acceso                                    |
| validación de entradas no confiables                   | contrato runtime propietario         | TypeScript no valida payloads externos                       |

---

#### 5. Capas contractuales y alcance de `SHELL-DB-002`

Se preserva la separación de capas definida por la arquitectura de transición:

| Capa | Contenido                                          | Relación con esta tarea                                                     |
| ---- | -------------------------------------------------- | --------------------------------------------------------------------------- |
| L0   | schema y migration manifest                        | fuente autorizada                                                           |
| L1   | tipos físicos generados                            | alcance principal de `SHELL-DB-002`                                         |
| L2   | adapters de persistencia                           | fuera de alcance                                                            |
| L3   | DTO, commands, queries, events y errors de negocio | fuera de alcance                                                            |
| L4   | REST, RPC, Edge, Storage y job contracts           | fuera de alcance salvo que aporten una fuente aprobada para derivar un tipo |
| L5   | documentación y changelog                          | evidencia y trazabilidad de la evolución, no sustituto del artefacto tipado |

`Row`, `Insert`, `Update`, `Args`, `Returns`, enums o composites generados pertenecen a L1. Su existencia no los convierte automáticamente en lenguaje empresarial público.

---

#### 6. Fuente autorizada de generación

Un artefacto tipado solo podrá generarse desde una fuente que cumpla simultáneamente:

1. pertenecer al repositorio o flujo versionado gobernado por `vento-shell`;
2. corresponder a un paquete de base de datos aprobado o a un candidate explícitamente asociado a ese paquete;
3. conservar identidad de commit o revisión reproducible;
4. conservar la referencia de migraciones y manifests que componen el candidate cuando aplique;
5. haber alcanzado la paridad o certificación exigida por la fase correspondiente antes de promoción;
6. declarar de forma explícita qué schemas o superficies entran en la generación;
7. utilizar una versión exacta y registrable de la herramienta de generación;
8. impedir que una conexión incidental a producción se convierta en fuente contractual.

Queda prohibido usar como autoridad suficiente:

- un remoto no identificado;
- el estado más reciente por conveniencia;
- un dump sin procedencia;
- un archivo generado antiguo sin candidate asociado;
- la forma que compile en una sola aplicación;
- un snapshot `public` asumido como base completa;
- una copia manual mantenida por un consumidor.

---

#### 7. Procedencia mínima por corte de generación

Cada corte tipado deberá poder reconstruirse sin adivinación.

La evidencia de procedencia deberá identificar, como mínimo:

1. el paquete de base de datos aprobado o candidate que origina el corte;
2. la revisión o commit fuente;
3. el digest del schema o candidate aplicable;
4. el conjunto explícito de schemas y superficies incluidas;
5. la versión exacta de la herramienta de generación;
6. la instrucción reproducible utilizada para generar;
7. el artefacto o bundle resultante;
8. el digest del resultado;
9. las referencias de migraciones o manifests aplicables;
10. la clasificación de compatibilidad del cambio;
11. la versión de package o release que incorpore el artefacto cuando exista físicamente;
12. la relación con consumidores registrados cuando se promueva.

No se fijan en esta tarea nombres físicos de archivos, carpetas, exports o campos de manifest que no estén ya aprobados por una fuente propietaria.

---

#### 8. Determinismo

La generación será determinista respecto de sus entradas declaradas.

Invariante:

```text
MISMO CANDIDATE
+ MISMO CONJUNTO DE SCHEMAS
+ MISMA VERSIÓN DE HERRAMIENTA
+ MISMAS OPCIONES DECLARADAS
= MISMO RESULTADO LÓGICO Y MISMO DIGEST
```

Reglas:

1. dos ejecuciones equivalentes no pueden producir diferencias no explicadas;
2. el orden incidental de descubrimiento no puede cambiar la semántica del resultado;
3. timestamps, rutas locales u otros datos ambientales no podrán introducir drift innecesario en el artefacto;
4. un cambio de digest con entradas equivalentes es bloqueo de reproducibilidad;
5. cualquier transformación posterior al codegen deberá ser declarada, determinista y verificable;
6. una edición manual del resultado invalida la procedencia.

---

#### 9. Inmutabilidad del artefacto generado

Los tipos generados son artefactos derivados de solo lectura.

Reglas vinculantes:

- no se corrige una discrepancia editando manualmente el resultado generado;
- no se agrega un campo faltante mediante una modificación directa del archivo derivado;
- no se cambia nullability por conveniencia del consumidor;
- no se elimina una función del tipo porque un consumidor no la use;
- no se renombra un enum localmente;
- no se modifica una firma RPC generada para hacerla compilar;
- no se usa un cast como sustituto de corregir la fuente o de registrar un override legítimo.

Si la fuente física es incorrecta, se corrige mediante el paquete de base de datos propietario. Si el codegen es insuficiente para expresar semántica legítima, se utiliza una capa separada y gobernada.

---

#### 10. Selección explícita de schemas

La generación no asumirá que `public` contiene toda la superficie de Vento OS.

Cada corte deberá declarar qué schemas participan y con qué finalidad.

Reglas:

1. un schema no entra por existir;
2. un schema no sale por no ser visible desde una aplicación concreta;
3. la inclusión no concede `USAGE`, `SELECT`, `EXECUTE`, DML, RLS ni autorización;
4. la disposición arquitectónica del schema gobierna el tier de consumo posible;
5. `public` puede contener compatibilidad temporal y no se considera raíz universal del modelo `Database`;
6. `app_private`, `audit`, owner schemas y otras superficies internas no se distribuyen a cliente por estar presentes en el candidate;
7. schemas administrados por PostgreSQL, Supabase o extensiones se consumen mediante superficies soportadas, salvo decisión canónica específica;
8. VITAL no se incorpora al bundle ordinario de Vento OS.

---

#### 11. Separación entre superficie física y contrato empresarial

La centralización distingue dos conceptos:

```text
DATABASE_PHYSICAL
≠
API_BUSINESS_CONTRACTS
```

`DATABASE_PHYSICAL` representa la forma generada de la base y puede incluir relaciones, vistas, funciones, enums, composites y metadata tipable de schemas aprobados para tooling o servidor.

`API_BUSINESS_CONTRACTS` representa únicamente contratos empresariales aprobados para consumo, derivados de superficies canónicas como vistas de lectura, consultas y comandos versionados.

Reglas:

1. un `Row` físico no es un DTO empresarial por defecto;
2. una tabla no se convierte en API pública porque aparezca en `Database`;
3. una función no se convierte en RPC aprobada por ser generable;
4. una columna no se convierte en campo público por aparecer en TypeScript;
5. los tipos de consumidor se recortan desde contratos y superficies autorizadas;
6. los owner schemas no se publican como modelo empresarial universal.

---

#### 12. Tiers de distribución tipada

Todo artefacto o recorte generado deberá pertenecer a exactamente uno de estos tiers canónicos:

1. `CONSUMER_SAFE`
2. `SERVER_ONLY`
3. `PRIVILEGED_TOOLING`

No se crea un cuarto tier por conveniencia.

##### `CONSUMER_SAFE`

Puede ser consumido por superficies browser o mobile únicamente cuando contiene contratos aprobados y no expone internals, owner schemas, `app_private`, `audit`, service-role ni estructura privilegiada.

##### `SERVER_ONLY`

Puede contener superficies necesarias para servicios, Edge o servidores, siempre con recorte mínimo por aplicación, contrato o función.

##### `PRIVILEGED_TOOLING`

Puede contener superficie física más amplia para generación, migración, clean-room, recuperación o herramientas segregadas. No puede convertirse en dependencia ordinaria de runtime.

---

#### 13. Regla de mínimo privilegio tipado

El tipado también aplica mínimo privilegio.

Reglas:

1. browser y mobile no importarán owner schemas, `app_private`, `audit` ni tipos de clientes privilegiados;
2. server y Edge no recibirán un `Database` universal privilegiado solo por conveniencia;
3. cada consumidor usará el recorte mínimo compatible con su responsabilidad;
4. un recorte más amplio requiere una justificación canónica, no solo una necesidad de compilación;
5. la capacidad de importar un tipo no demuestra derecho de acceso al objeto correspondiente;
6. la separación de tipos complementa, pero nunca sustituye, grants, RLS y autorización runtime.

---

#### 14. Relaciones y helpers físicos

Para relaciones físicas autorizadas en el corte, la generación deberá conservar la semántica estructural que la fuente expresa.

El modelo incluye, cuando corresponda:

- `Row`;
- `Insert`;
- `Update`;
- enums;
- composite types;
- relaciones y claves tipables;
- columnas generadas;
- defaults;
- identity;
- nullability física;
- vistas y su shape generado;
- funciones y sus firmas tipables.

La capa generada deberá permitir helpers equivalentes a selección por tabla, inserción, actualización, enums, composites y funciones por schema allowlisted, sin exigir shapes manuales duplicados.

---

#### 15. Diferencia entre `Row`, `Insert` y `Update`

`Row`, `Insert` y `Update` no son aliases intercambiables.

Reglas:

1. `Row` representa la forma legible resultante;
2. `Insert` respeta campos generados, defaults, identity y obligatoriedad real de creación;
3. `Update` respeta mutabilidad y opcionalidad de cambio;
4. una columna server-owned no se hace escribible por conveniencia;
5. una columna generada no se exige artificialmente al insertar;
6. nullability física se conserva en la capa generada;
7. nullability de negocio, cuando difiera, se resuelve fuera de L1 mediante contrato o adapter explícito;
8. las pruebas de tipo deberán incluir casos negativos para impedir asignaciones inválidas.

---

#### 16. Vistas

Las vistas generadas deberán conservar la forma que la fuente certificada exponga, incluyendo cuando sea derivable:

- columnas;
- tipos;
- nullability;
- relaciones;
- cardinalidad;
- procedencia estructural relevante.

Un override sobre una vista requiere una razón explícita y una prueba que demuestre por qué el codegen no expresa correctamente la semántica necesaria.

Un tipo de vista no demuestra por sí mismo que la vista respete RLS, seguridad invoker, security definer, grants o exposición correcta.

---

#### 17. Enums y vocabularios

Los enums físicos se derivan de la fuente física aprobada.

Reglas:

1. no se mantiene un enum TypeScript paralelo como segunda fuente;
2. no se inventa un literal adicional para hacer compilar un consumidor;
3. agregar un valor puede ser compatible según el contrato, pero debe clasificarse;
4. retirar o reinterpretar un valor es un cambio gobernado;
5. un vocabulario empresarial que no sea un enum físico conserva su fuente contractual propia;
6. el codegen no absorbe catálogos empresariales ajenos.

---

#### 18. JSON, dominios y tipos no suficientemente expresivos

El tipo físico generado puede ser insuficiente para expresar semántica empresarial de:

- JSONB estructurado;
- metadata;
- dominios PostgreSQL;
- fechas con restricciones adicionales;
- dinero;
- unidades;
- identificadores nominales;
- payloads externos;
- vistas con inferencia incompleta.

Cuando ocurra:

1. no se modifica manualmente el resultado generado;
2. se crea una capa separada de override, adapter o contrato derivado;
3. la capa declara por qué el codegen es insuficiente;
4. la capa tiene owner y lifecycle;
5. la capa tiene prueba;
6. la capa no contradice silenciosamente la fuente física;
7. si representa entrada no confiable, deberá existir validación runtime.

---

#### 19. Funciones y firmas generadas

La capa L1 puede incluir tipos crudos generados para funciones cuando la fuente y el schema allowlisted los incluyan.

Deben conservarse:

- schema exacto;
- nombre exacto;
- argumentos;
- tipos de argumentos;
- retorno;
- nullability tipable;
- firma suficiente para distinguir variantes cuando exista legado sobrecargado.

Reglas:

1. los `Args` y `Returns` generados se derivan de la firma física;
2. una sobrecarga legacy no se colapsa en un nombre ambiguo;
3. una firma generada no autoriza invocación;
4. una firma generada no expresa por sí sola errores, efectos, idempotencia, autorización o retry;
5. la centralización de wrappers de invocación pertenece a `SHELL-DB-003`;
6. `SHELL-DB-002` no crea wrappers ni decide nombres públicos de funciones TypeScript.

---

#### 20. Frontera con `SHELL-DB-003`

La frontera exacta es:

```text
SHELL-DB-002
→ tipos físicos generados
→ Args / Returns crudos derivados de firma
→ recortes y helpers tipados

SHELL-DB-003
→ wrappers canónicos
→ contrato de llamada
→ traducción de argumentos
→ manejo de retorno
→ errores normalizados aplicables
→ política de compatibilidad de invocación
```

`SHELL-DB-002` no anticipa la API pública de los wrappers.

---

#### 21. DTO y contratos de negocio

La capa generada no debe convertirse en segunda fuente de semántica empresarial.

Reglas:

1. DTO, commands, queries, events y errors conservan su contrato propietario;
2. un DTO puede derivarse o mapearse desde tipos físicos sin duplicarlos ciegamente;
3. un DTO de interfaz puede existir únicamente si no replica sin razón un `Row`, `Insert`, `Update`, enum, RPC o contrato ya gobernado;
4. cualquier solapamiento se reconcilia explícitamente;
5. nombres físicos de columnas no se convierten automáticamente en lenguaje de dominio externo;
6. contratos externos no exponen internals solo porque el codegen los conozca.

---

#### 22. Autorización, grants y RLS

El tipado no concede autoridad.

Invariantes:

1. incluir un objeto en `Database` no concede `USAGE`;
2. incluir una tabla no concede `SELECT`, `INSERT`, `UPDATE` ni `DELETE`;
3. incluir una función no concede `EXECUTE`;
4. compilar un query no demuestra que RLS lo permita;
5. compilar un wrapper no demuestra autorización empresarial;
6. los tipos de autorización no se duplican dentro del bundle de Supabase si ya existe un contrato compartido propietario;
7. pruebas de tipos y pruebas de seguridad son capas distintas y ambas pueden ser obligatorias.

---

#### 23. Validación runtime

TypeScript no sustituye validación runtime de datos no confiables.

Requieren contrato y validación runtime cuando corresponda:

- JSONB empresarial;
- webhooks;
- callbacks de proveedores;
- payloads de Edge Functions;
- eventos externos;
- Realtime;
- metadata de Storage;
- archivos;
- datos importados;
- cuerpos HTTP;
- cualquier fuente no controlada por el compilador del consumidor.

Un cast, `unknown` coercionado o `overrideTypes` no transforma un dato no confiable en dato validado.

---

#### 24. Escapes y overrides

Todo escape del sistema de tipos deberá permanecer visible y gobernado.

Se consideran escapes, entre otros:

- `any`;
- `as any`;
- coerciones de `unknown` sin validación suficiente;
- `overrideTypes` usados para contradecir la forma generada;
- casts masivos;
- shapes manuales que sustituyen el tipo generado.

Cada escape legítimo deberá tener, como mínimo:

- objeto o contrato afectado;
- motivo;
- owner;
- prueba;
- riesgo;
- condición de retiro.

La evolución de CI deberá reducir, no normalizar, estos escapes y bloquear ampliaciones no registradas.

---

#### 25. Versionado de tipos y package

Los artefactos tipados evolucionan bajo el gobierno de package compartido y del contrato de datos.

Clasificación semántica mínima:

- `PATCH`: corrección documental o metadata que no cambia el consumo;
- `MINOR`: adición compatible y opcional;
- `MAJOR`: eliminación o cambio incompatible de significado, autorización, nullability, enum cerrado, ruta, firma, error u otra frontera de consumo.

Reglas:

1. cada versión publicada es inmutable;
2. cada versión conserva digest;
3. una versión nueva no reinterpreta una versión histórica;
4. los consumidores registran la versión realmente resuelta;
5. un rango de compatibilidad no sustituye la identidad exacta desplegada;
6. el lockfile forma parte de la reproducibilidad del consumidor;
7. la primera versión física de `@vento/supabase` no se asigna en esta tarea.

---

#### 26. Clasificación de diffs

Todo cambio de tipos deberá clasificarse antes de promoción en una de estas cuatro clases:

1. `NON_BREAKING`
2. `REVIEW_REQUIRED`
3. `BREAKING`
4. `INVALID`

La clasificación considera conjuntamente:

- shape físico;
- contrato empresarial;
- runtime;
- consumidores registrados;
- seguridad;
- compatibilidad de toolchain;
- rollout y rollback.

Un diff de TypeScript no puede clasificarse únicamente por si `tsc` termina correctamente.

---

#### 27. Ejemplos de cambios que requieren revisión o bloqueo

Sin convertir esta lista en una taxonomía exhaustiva:

| Cambio                                    | Tratamiento mínimo                                                    |
| ----------------------------------------- | --------------------------------------------------------------------- |
| columna aditiva nullable                  | verificar contrato y consumidores antes de clasificar como compatible |
| columna nueva obligatoria sin default     | potencialmente breaking                                               |
| cambio de nullability                     | revisión obligatoria y posible breaking                               |
| retirada de columna                       | breaking y sujeta a gate de cero uso                                  |
| enum con valor retirado o reinterpretado  | breaking                                                              |
| nueva función aprobada                    | aditiva si su introducción no altera contratos existentes             |
| cambio de argumentos o retorno de función | revisión obligatoria y normalmente breaking si afecta consumidores    |
| cambio de schema de un objeto             | transición contractual, no simple rename de tipos                     |
| override sin evidencia                    | invalid                                                               |
| drift de digest con entradas equivalentes | invalid                                                               |
| exposición de owner schema a browser      | invalid                                                               |
| inclusión accidental de VITAL             | invalid                                                               |

---

#### 28. Pipeline lógico de generación

La materialización posterior deberá respetar un pipeline cerrado que, como mínimo, cubra estas etapas lógicas:

1. resolver la fuente aprobada;
2. verificar identidad y procedencia;
3. resolver schemas y superficies allowlisted;
4. fijar toolchain;
5. generar tipos;
6. verificar determinismo e integridad;
7. aplicar o validar capas derivadas separadas cuando estén aprobadas;
8. clasificar el diff;
9. probar consumidores y contratos aplicables;
10. promover o bloquear con evidencia.

No se asignan aquí nombres de scripts, workflows o archivos físicos no materializados.

---

#### 29. Compatibilidad transversal de consumidores

Una versión candidata de tipos no se considera promovible únicamente porque compile dentro de `vento-shell`.

Antes de promoción física deberán comprobarse los consumidores registrados aplicables.

La matriz de compatibilidad deberá considerar, según el consumidor:

- versión del package tipado;
- versión de Supabase JS;
- versión de `@supabase/ssr` cuando aplique;
- versión de Supabase CLI utilizada en generación;
- TypeScript;
- Next.js;
- Expo;
- runtime server, browser, native o Edge;
- contracts consumidos;
- release efectivo;
- ambiente.

La validación transversal incluye typecheck y contract tests de los consumidores registrados, además de las pruebas semánticas y de seguridad que correspondan.

---

#### 30. Registro de consumidores

Un consumidor no se incorpora por inferencia.

Antes de adoptar tipos deberá registrarse, como mínimo:

- repositorio;
- aplicación o responsabilidad;
- runtime;
- tier o bundle consumido;
- versión exacta resuelta;
- contratos utilizados;
- owner;
- release o corte aplicable.

La ausencia de un consumidor observado no autoriza automáticamente retirar un tipo. La existencia potencial de un consumidor futuro tampoco autoriza ampliar la superficie.

---

#### 31. Secuencia de rollout compatible

Los cambios aditivos seguirán, cuando aplique, la secuencia:

```text
PUBLICAR TIPOS COMPATIBLES
        ↓
ADOPTAR EN CONSUMIDORES COMPATIBLES
        ↓
DESPLEGAR CAMBIO DE SCHEMA
        ↓
OBSERVAR Y CERTIFICAR
```

Los cambios destructivos o incompatibles utilizarán:

```text
SUCESOR COMPATIBLE
        ↓
MIGRACIÓN DE CONSUMIDORES
        ↓
DEPRECACIÓN
        ↓
OBSERVACIÓN DE CERO USO O SUSTITUCIÓN DESPLEGADA
        ↓
RETIRO
```

No se permite retirar una tabla, columna, enum, vista, RPC, función o alias tipado basándose únicamente en búsqueda de código incompleta.

---

#### 32. Rollback

El rollback de schema y el rollback de tipos deben ser compatibles.

Reglas:

1. la versión anterior del package tipado permanece identificable;
2. sus manifests y digests permanecen disponibles como evidencia;
3. un rollback no regenera historia desde el estado `current`;
4. la versión restaurada debe compilar contra el schema recuperado según su contrato;
5. el rollback no introduce un bundle más privilegiado para solucionar una incompatibilidad;
6. cambios empresariales confirmados no se revierten de forma destructiva por conveniencia de tipos;
7. forward-fix puede ser la estrategia correcta cuando rollback físico no sea seguro, pero deberá estar gobernado por la tarea propietaria.

---

#### 33. Relación con migraciones

Toda migración que altere un objeto tipado deberá mantener sincronía con el contrato de tipos.

Cuando la fase de implementación lo exija, el mismo cambio gobernado deberá conectar:

- fuente o migración;
- candidate;
- generación tipada candidata;
- manifest;
- pruebas;
- clasificación de compatibilidad;
- consumidores afectados;
- rollout;
- rollback.

Queda prohibido promover schema y dejar la actualización tipada como ajuste manual posterior sin dueño.

---

#### 34. VITAL

VITAL permanece separado de Vento OS para esta familia.

Reglas:

1. sus tipos no se mezclan en el bundle ordinario de `@vento/supabase` para Vento OS;
2. su presencia física en una fuente o inventario no autoriza absorción;
3. si requiere artefactos tipados, tendrá el recorte o package separado que corresponda a su arquitectura propietaria;
4. un consumidor Vento OS no obtiene acceso tipado a VITAL por conveniencia;
5. los validadores deberán detectar incorporación accidental.

---

#### 35. Estado técnico verificado y significado documental

El estado técnico actual no demuestra todavía una implementación física de `@vento/supabase` ni una capa canónica compartida de tipos `Database` materializada en el repositorio propietario.

Por tanto, el resultado de esta tarea es:

```text
GOBIERNO DE TIPOS = ESPECIFICADO
FUENTE Y PROCEDENCIA = ESPECIFICADAS
REGLA DE GENERACIÓN = ESPECIFICADA
TIERS Y RECORTES = ESPECIFICADOS
SINCRONIZACIÓN INCREMENTAL = ESPECIFICADA
CODEGEN EJECUTADO = NO
ARTEFACTO DATABASE CENTRALIZADO = NO MATERIALIZADO
PACKAGE @vento/supabase FÍSICO = NO MATERIALIZADO
PUBLICACIÓN = NO REALIZADA
CONSUMIDORES MIGRADOS POR ESTA TAREA = 0
CAMBIOS SUPABASE = 0
```

`ESPECIFICADO` no equivale a `IMPLEMENTADO`, `GENERATED_TYPES_PASS`, `PUBLICADO`, `ADOPTADO` ni `VALIDADO` en consumidores.

---

#### 36. Outcomes aplicables a la futura materialización

La futura ejecución utilizará estados que permitan distinguir al menos:

- generación o confirmación planificada todavía no implementada;
- transición contractual planificada todavía no implementada;
- tipos generados con verificación satisfactoria;
- consumidores compatibles;
- documentación vigente;
- actualización contractual cerrada;
- actualización incompleta;
- cambio incompatible sin gobierno;
- bloqueo de seguridad contractual;
- rollback ejecutado.

Esta tarea no atribuye ninguno de los outcomes de ejecución positiva porque no se ejecutó codegen ni se validaron consumidores.

---

#### 37. Handoff a `AUTH-DB-026`

`AUTH-DB-026 — Generar y publicar tipos después de cada paquete aprobado` es el punto de ejecución incremental que materializará esta especificación conforme avance BLOQUE R.

Cada ejecución deberá:

1. recibir un paquete de base de datos aprobado;
2. resolver la fuente versionada correspondiente;
3. generar los artefactos aplicables siguiendo este gobierno;
4. conservar procedencia y digest;
5. clasificar el cambio;
6. probar consumidores aplicables;
7. publicar únicamente cuando las puertas correspondientes estén satisfechas;
8. mantener la versión anterior disponible para rollback;
9. actualizar la evidencia de sincronización del package compartido.

`SHELL-DB-002` no ejecuta ninguna de estas acciones físicas.

---

#### 38. Handoffs exactos

| Materia                                             | Tarea propietaria                 | Condición de salida                                                     |
| --------------------------------------------------- | --------------------------------- | ----------------------------------------------------------------------- |
| generación y publicación después de cada paquete DB | `AUTH-DB-026`                     | artefacto generado, procedencia, pruebas y publicación conforme a gates |
| wrappers tipados de RPC                             | `SHELL-DB-003`                    | invocación tipada reconciliada con las RPC canónicas aprobadas          |
| errores normalizados de Supabase                    | `SHELL-DB-004`                    | taxonomía técnica compartida sin mezclar dominio o autorización         |
| separación server/browser/native/privileged         | `SHELL-DB-005`                    | factories y superficies runtime aisladas                                |
| migraciones y cambios de schema                     | tareas E3/BLOQUE R propietarias   | cambio físico versionado desde `vento-shell`                            |
| gates y validadores automáticos                     | tareas CI y de calidad aplicables | pruebas y evidencia automatizadas según la fase                         |
| migración de consumidores                           | tareas de adopción propietarias   | paridad, compatibilidad y rollback por repositorio                      |

---

#### 39. Reglas de prohibición

`SHELL-DB-002` no autoriza:

- ejecutar Supabase codegen;
- conectarse a producción para regenerar tipos;
- crear el package físico `@vento/supabase`;
- asignar una ruta física al package;
- asignar versión npm;
- definir exports públicos físicos;
- publicar al registry;
- modificar clientes Supabase existentes;
- modificar `Database` manualmente;
- crear wrappers RPC;
- modificar RPC;
- crear o modificar tablas;
- crear o modificar vistas;
- crear o modificar funciones;
- crear o modificar enums;
- crear o modificar RLS;
- ejecutar DDL;
- ejecutar DML;
- ejecutar backfills;
- cambiar datos;
- migrar consumidores;
- introducir VITAL en el bundle de Vento OS;
- declarar seguridad satisfecha porque TypeScript compile;
- declarar consumidores compatibles sin pruebas reales;
- iniciar `SHELL-DB-003`.

---

#### 40. Cobertura de prueba vigente no modificada

La arquitectura vigente de requisitos ya cubre las obligaciones sustantivas necesarias para esta tarea, entre ellas:

- compilación transversal de tipos, firmas, enums, vistas, JSON y SDK antes de promover schema;
- separación entre `public`, fuentes canónicas y contratos;
- generación de tipos de consumidores únicamente desde superficies aprobadas;
- exclusión de VITAL del bundle ordinario;
- separación entre tipos físicos y contratos empresariales;
- helpers generados para relaciones, inserts, updates, enums, composites y funciones;
- conservación de generated columns, defaults, identity y nullability;
- Args y Returns derivados por firma exacta;
- tratamiento inequívoco de overloads;
- gobernanza de vistas, enums, JSONB, IDs y DTOs;
- tiers `CONSUMER_SAFE`, `SERVER_ONLY` y `PRIVILEGED_TOOLING`;
- factories parametrizadas con `Database` o recortes compatibles;
- prohibición de internals en browser/mobile;
- mínimo privilegio de tipos server-side;
- registro de consumidores y toolchain;
- pinning exacto y lockfile;
- ledger y presupuesto de escapes;
- validación runtime independiente de TypeScript;
- pipeline de generación;
- pruebas transversales de consumidores;
- clasificación de diffs;
- sincronización migración-tipos;
- rollout compatible;
- retiro con cero uso o sustitución desplegada;
- rollback versionado;
- gate ambiental de contratos, tipos y consumidores.

`SHELL-DB-002` centraliza esas obligaciones dentro de la responsabilidad documental de `@vento/supabase` y no introduce una obligación verificable nueva que requiera otro identificador.

---

#### 41. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea consolida para `@vento/supabase` reglas de generación, procedencia, aislamiento, compatibilidad, rollout, rollback y sincronización incremental que ya están cubiertas por requisitos canónicos vigentes de Supabase, datos, packages y consumidores. No crea un comportamiento runtime, un artefacto físico, un nuevo gate, una nueva superficie de acceso ni una nueva operación que carezca de requisito existente.

---

#### 42. Decisiones vinculantes

1. Los tipos generados de Supabase pertenecen lógicamente a `@vento/supabase`.
2. El schema y las migraciones permanecen como fuente física autoritativa bajo gobierno de `vento-shell`.
3. Los tipos son derivados y nunca fuente alternativa de verdad.
4. La generación parte de un paquete o candidate versionado y aprobado.
5. El remoto observado no sustituye la fuente aprobada.
6. La generación declara schemas y superficies explícitamente.
7. `public` no es raíz universal del modelo `Database`.
8. VITAL permanece fuera del bundle ordinario de Vento OS.
9. Cada corte conserva procedencia reproducible.
10. La versión de herramienta se fija por corte.
11. La generación debe ser determinista.
12. El resultado generado es de solo lectura.
13. Las correcciones se realizan en la fuente o en capas separadas gobernadas, no editando el artefacto derivado.
14. `DATABASE_PHYSICAL` y `API_BUSINESS_CONTRACTS` permanecen separados.
15. `Row` no es DTO empresarial por defecto.
16. `Insert` y `Update` conservan semánticas distintas.
17. Los helpers físicos se derivan de schemas allowlisted.
18. Las vistas conservan shape y nullability derivados; overrides requieren evidencia.
19. Los enums se derivan de su fuente y no tienen catálogos TypeScript paralelos.
20. JSONB y entradas no confiables requieren validación runtime cuando corresponda.
21. La capa L1 puede contener `Args` y `Returns` crudos generados de funciones.
22. Los wrappers RPC pertenecen a `SHELL-DB-003`.
23. Las sobrecargas legacy se distinguen por firma y no por nombre ambiguo.
24. Un tipo no concede permisos, grants, RLS ni autorización.
25. Los artefactos se clasifican exactamente como `CONSUMER_SAFE`, `SERVER_ONLY` o `PRIVILEGED_TOOLING`.
26. Browser y mobile no importan internals ni superficies privilegiadas.
27. Server y Edge usan recortes mínimos.
28. Los escapes del tipado permanecen registrados, probados y con retiro previsto.
29. Cada versión publicada será inmutable y reproducible.
30. Los consumidores registran versión exacta y lockfile.
31. Todo diff se clasifica como `NON_BREAKING`, `REVIEW_REQUIRED`, `BREAKING` o `INVALID`.
32. Compilar no basta para declarar compatibilidad.
33. Cada candidato deberá probar consumidores registrados aplicables antes de promoción.
34. Cambios aditivos siguen rollout compatible.
35. Cambios destructivos requieren sucesor, migración, deprecación y evidencia de cero uso o sustitución desplegada.
36. Rollback conserva la versión tipada anterior y sus manifests.
37. No se regenera historia desde `current` durante rollback.
38. Las migraciones que alteran objetos tipados mantienen sincronía con tipos y contratos.
39. `SHELL-DB-002` se actualiza incrementalmente después de cada paquete contractual aprobado de BLOQUE R.
40. `AUTH-DB-026` materializa la generación y publicación incremental.
41. No se asigna root físico del package en esta tarea.
42. No se asigna versión npm en esta tarea.
43. No se inventan exports físicos en esta tarea.
44. No se crea código en esta tarea.
45. No se modifica Supabase en esta tarea.
46. No se modifican datos en esta tarea.
47. No se migran consumidores en esta tarea.
48. No se crean ni modifican requisitos de prueba.
49. `SHELL-DB-003` queda únicamente reservado.

---

#### 43. Criterios de aceptación documental

`SHELL-DB-002` queda documentalmente satisfecha cuando:

1. existe una única regla de autoridad para la fuente de generación;
2. se define procedencia reproducible por corte;
3. se define determinismo;
4. se prohíbe edición manual del artefacto derivado;
5. se separan tipos físicos de contratos empresariales;
6. se define selección explícita de schemas;
7. `public` no se trata como raíz universal;
8. VITAL queda excluido del bundle ordinario;
9. se definen los tres tiers de consumo;
10. se define mínimo privilegio tipado por runtime;
11. se definen `Row`, `Insert`, `Update`, enums, composites y firmas crudas dentro de la frontera L1;
12. wrappers RPC quedan fuera de esta tarea;
13. se define tratamiento de JSON, overrides y escapes;
14. se define clasificación de cambios;
15. se define compatibilidad transversal de consumidores;
16. se define rollout y rollback;
17. se vincula la actualización incremental con `AUTH-DB-026` y los paquetes aprobados de BLOQUE R;
18. se declara correctamente el estado no materializado;
19. se reconcilia que existen cero cambios de requisitos;
20. `SHELL-DB-003` permanece sin iniciar.

---

#### 44. Estado de cierre documental

| Elemento                        | Estado                           |
| ------------------------------- | -------------------------------- |
| gobierno de tipos               | `ESPECIFICADO`                   |
| autoridad de fuente             | `ESPECIFICADA`                   |
| procedencia                     | `ESPECIFICADA`                   |
| determinismo                    | `ESPECIFICADO`                   |
| selección de schemas            | `ESPECIFICADA`                   |
| tiers de distribución           | `ESPECIFICADOS`                  |
| mínimo privilegio tipado        | `ESPECIFICADO`                   |
| frontera L1/L2/L3               | `ESPECIFICADA`                   |
| tratamiento de funciones crudas | `ESPECIFICADO`                   |
| frontera con wrappers RPC       | `ESPECIFICADA`                   |
| clasificación de diffs          | `ESPECIFICADA`                   |
| compatibilidad de consumidores  | `ESPECIFICADA`                   |
| rollout                         | `ESPECIFICADO`                   |
| rollback                        | `ESPECIFICADO`                   |
| sincronización incremental      | `ESPECIFICADA`                   |
| codegen físico                  | `NO IMPLEMENTADO POR ESTA TAREA` |
| package físico                  | `NO MATERIALIZADO`               |
| publicación                     | `NO REALIZADA`                   |
| consumidores migrados           | `0`                              |
| cambios Supabase                | `0`                              |
| cambios de datos                | `0`                              |
| requisitos creados              | `0`                              |
| requisitos modificados          | `0`                              |

---

#### 45. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-DB-001 — Crear @vento/supabase

##### TAREA ACTUAL APROBADA

SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado

##### SIGUIENTE TAREA RESERVADA

SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas


### ✅ SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas

**Estado:** APROBADA
**Tarea anterior:** SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado
**Tarea siguiente:** SHELL-DB-004 — Normalizar errores de Supabase
**Tipo de tarea:** Documental; definición y centralización canónica de la frontera de wrappers tipados de RPC dentro de `@vento/supabase`, alineada con firmas PostgreSQL exactas, contratos `QUERY_RPC` y `COMMAND_RPC`, tipos `Args`/`Returns`, autorización, idempotencia, concurrencia, errores, compatibilidad, versionado, consumidores y transición aprobados, sin materializar código, package físico, exports, RPC, migraciones, DDL, DML, cambios de datos ni modificaciones en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/06_ACCESO_COMPARTIDO_A_DATOS.md`
**Estado físico resultante:** ESPECIFICADO; WRAPPERS Y PACKAGE FÍSICO NO MATERIALIZADOS
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, configuración npm, registry, CI, despliegues, SQL, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos o configuración remota:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-DB-003` define cómo `@vento/supabase` deberá centralizar los wrappers tipados de las RPC canónicas aprobadas sin convertir esa capa en una segunda fuente de semántica empresarial, autorización, persistencia o contratos físicos.

La relación obligatoria queda:

```text
CONTRATO CANÓNICO DE DOMINIO
        +
RPC CANÓNICA APROBADA
        +
FIRMA POSTGRESQL EXACTA
        +
TIPOS GENERADOS Args / Returns
        +
CONTRATO DE SEGURIDAD, EFECTO Y COMPATIBILIDAD
        ↓
WRAPPER TIPADO @vento/supabase
        ↓
CONSUMIDOR AUTORIZADO
        ↓
RPC AUTORITATIVA EN SUPABASE
```

Nunca:

```text
WRAPPER
→ inventa RPC
→ redefine semántica
→ concede autorización
→ elige una sobrecarga por conveniencia
→ oculta error como null
→ crea idempotencia que la RPC no posee
→ sustituye RLS
→ llama trigger functions como RPC
→ accede a VITAL por coexistencia
```

---

#### 2. Resultado material

Queda definida documentalmente una única política de wrappers RPC para `@vento/supabase`.

La política fija:

- elegibilidad cerrada de una RPC para wrapper;
- identidad inequívoca por firma y versión;
- relación entre `Args`/`Returns` físicos y contrato empresarial;
- separación `QUERY_RPC` / `COMMAND_RPC`;
- traducción explícita de argumentos;
- tratamiento de nullability, defaults y payloads;
- tratamiento de retorno;
- errores y resultados no ambiguos;
- autorización y RLS como autoridades externas al wrapper;
- idempotencia, concurrencia, timeout y retry según contrato;
- compatibilidad, deprecación y retiro;
- separación de overloads;
- exclusión de funciones trigger e internas sin contrato expuesto;
- actualización incremental por package de base de datos aprobado;
- pruebas y adopción posteriores por consumidores.

No se fija un número de wrappers por inferencia desde el número total de funciones existentes.

---

#### 3. Fuentes normativas consumidas

| Fuente               | Decisión preservada                                                                                                       |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-DB-001`       | `@vento/supabase` posee wrappers RPC como una de sus cuatro familias exactas de responsabilidad                           |
| `SHELL-DB-002`       | `Args` y `Returns` crudos provienen de firmas generadas; wrappers pertenecen exclusivamente a `SHELL-DB-003`              |
| `SHELL-CON-001`      | inputs y outputs RPC se coordinan con `@vento/contracts` sin mover el acceso a datos fuera de `@vento/supabase`           |
| `SUPA-ARC-005`       | la capa expuesta admite `READ_VIEW`, `QUERY_RPC` y `COMMAND_RPC`, siendo las dos últimas las clases RPC                   |
| `SUPA-ARC-013`       | clasificación, identidad de rutina, firma, tipos, seguridad, error, idempotencia, concurrencia, triggers y compatibilidad |
| `SUPA-ARC-014`       | excepciones `SECURITY DEFINER` y sus gates                                                                                |
| `SUPA-ARC-015`       | exposición, grants, RLS y mínimo privilegio                                                                               |
| `SUPA-ARC-016`       | contratos de lectura y mutación por dominio, request, response, efectos y errores                                         |
| `SUPA-ARC-017`       | coordinación explícita cuando una operación requiere más de un owner                                                      |
| `SUPA-ARC-023`       | tipos generados para consumidores, tiers, runtime validation, compatibilidad y retiro                                     |
| `SUPA-TRANS-014`     | contrato material de tipos, RPC, consumidores, errores, versiones, deprecación, rollback y documentación                  |
| registro 04A vigente | cobertura verificable existente de firmas, RPC, tipos, seguridad, idempotencia y compatibilidad                           |
| `AUTH-DB-026`        | generación/publicación incremental después de cada package de base de datos aprobado                                      |
| `SHELL-CI-*`         | materialización, contract tests, compatibilidad, publicación y evidencia posteriores                                      |

Precedencia:

```text
SEMÁNTICA EMPRESARIAL
        ↓
CONTRATO RPC APROBADO
        ↓
FIRMA FÍSICA CERTIFICADA
        ↓
TIPOS GENERADOS
        ↓
WRAPPER TIPADO
        ↓
CONSUMIDOR
```

El wrapper no puede invertir esta precedencia.

---

#### 4. Reconciliación del universo actual

El corte vigente, ya reconciliado con el delta mensual de VISO, distingue:

```text
FUNCIONES VENTO TOTALES = 348
FUNCIONES DIRECTAS = 274
FUNCIONES TRIGGER = 74
TRIGGERS VENTO EXPLÍCITOS = 197
RELACIONES OBJETIVO DE TRIGGERS = 155
```

La suma se conserva:

```text
274 directas
+ 74 funciones trigger
= 348 funciones Vento
```

Estas cifras son inventario técnico, no cardinalidad de wrappers.

Reglas:

1. una función directa no obtiene wrapper solo por ser invocable;
2. una función trigger no obtiene wrapper de cliente;
3. una función interna no obtiene wrapper por aparecer en tipos generados;
4. una función legacy no obtiene wrapper por tener consumidores actuales;
5. una función de VITAL permanece fuera del registro contractual ordinario de Vento OS;
6. solo una RPC aprobada y versionada puede entrar al registro de wrappers.

---

#### 5. Elegibilidad exacta para wrapper RPC

Una rutina es elegible únicamente cuando cumple simultáneamente:

1. tiene identidad técnica inequívoca;
2. pertenece a una superficie RPC aprobada;
3. está clasificada como `QUERY_RPC` o `COMMAND_RPC`;
4. posee contrato empresarial aprobado;
5. posee request y response definidos;
6. posee política de autorización identificada;
7. posee contrato de error identificable;
8. posee política de compatibilidad;
9. posee owner;
10. posee consumidores o condición explícita de adopción;
11. su firma física corresponde a una fuente versionada aprobada;
12. los tipos `Args` y `Returns` aplicables pueden derivarse o adaptarse de forma gobernada;
13. no pertenece a VITAL;
14. no está bloqueada por incompatibilidad, seguridad o transición pendiente que impida consumo.

La elegibilidad no se infiere por:

- nombre;
- presencia en `Database`;
- grant actual;
- existencia en `public`;
- uso histórico;
- llamada desde una aplicación;
- `SECURITY DEFINER`;
- aparición en búsquedas de código.

---

#### 6. Clases RPC que reciben wrapper

Las únicas clases de rutina expuesta que reciben wrapper RPC son:

```text
QUERY_RPC
COMMAND_RPC
```

`READ_VIEW` pertenece a la capa expuesta, pero no es una RPC y no se incorpora a la familia de wrappers definida aquí.

Tampoco reciben wrapper RPC directo:

```text
DOMAIN_QUERY_FUNCTION
DOMAIN_COMMAND_FUNCTION
DOMAIN_RULE_FUNCTION
INTERNAL_QUERY_HELPER
INTERNAL_COMMAND_HELPER
PLATFORM_ADAPTER
SECURITY_PRIMITIVE
INTERNAL_COORDINATOR
AUDIT_QUERY_FUNCTION
AUDIT_APPEND_FUNCTION
TRIGGER_FUNCTION
```

Una función interna podrá ser consumida por otra capa autorizada, pero no se promueve al API compartido por conveniencia.

---

#### 7. Identidad canónica del wrapper

Todo wrapper conserva como fuente la identidad completa de rutina:

```text
<schema>.<routine_name>(<identity_argument_types>)
```

y la relaciona con:

```text
contract_id
contract_version
routine_class
qualified_signature
owner_schema
process_ids
input_contract
return_contract
error_contract
authorization_contract
idempotency_contract
concurrency_contract
compatibility_status
replacement_signature
lifecycle_state
definition_hash
```

Reglas:

1. nombre sin schema no basta;
2. nombre sin tipos de argumentos no basta;
3. `specific_name` generado no reemplaza la firma;
4. una sobrecarga no se elige por orden;
5. no se usa `latest`;
6. no se usa la primera coincidencia;
7. misma identidad contractual no puede apuntar silenciosamente a otra semántica;
8. una nueva firma incompatible requiere nueva versión o transición explícita.

---

#### 8. Separación entre wrapper y RPC física

El wrapper es un adapter de invocación tipado.

Puede:

- recibir un input tipado;
- validar estructura cuando el contrato lo exija;
- mapear el input del consumidor a `Args`;
- seleccionar una identidad RPC previamente fijada por contrato;
- invocar mediante el cliente Supabase autorizado;
- interpretar `Returns`;
- proyectar un resultado contractual;
- conservar error, retryability y metadata aprobada;
- transportar correlación o idempotency key cuando el contrato la defina.

No puede:

- crear lógica de negocio inexistente en el contrato;
- decidir un owner;
- cambiar el efecto primario;
- ejecutar una segunda RPC para completar silenciosamente una operación;
- convertir varias RPC en una transacción;
- escribir directamente tablas para completar un fallo;
- corregir un error de schema con un cast;
- suplantar una RPC retirada;
- alterar grants, RLS o autorización.

---

#### 9. Frontera L1 → wrapper

`SHELL-DB-002` entrega la capa física:

```text
L1
→ Database
→ Functions
→ Args
→ Returns
→ enums / composites / shapes físicos
```

`SHELL-DB-003` consume esa capa sin editarla.

El wrapper agrega únicamente la capa de acceso contractual:

```text
Args físicos
        +
contrato request
        ↓
mapeo explícito
        ↓
invocación RPC

Returns físicos
        +
contrato response
        ↓
mapeo explícito
        ↓
resultado contractual
```

Si el tipo generado es insuficiente, se usa una capa separada y gobernada. Nunca se modifica manualmente el artefacto generado.

---

#### 10. Contrato mínimo por wrapper

Cada wrapper deberá poder resolver, cuando aplique, al menos:

| Dimensión                         | Fuente                        |
| --------------------------------- | ----------------------------- |
| schema                            | firma certificada             |
| nombre                            | firma certificada             |
| tipos de argumentos               | firma certificada             |
| `Args`                            | tipos generados               |
| retorno                           | firma + tipos generados       |
| filas/conjunto                    | contrato RPC                  |
| nullability                       | firma + contrato              |
| orden                             | contrato cuando sea semántico |
| clase RPC                         | arquitectura                  |
| versión                           | contrato                      |
| owner                             | registro de dominio           |
| proceso                           | contrato de dominio           |
| roles con EXECUTE                 | seguridad                     |
| autorización interna              | contrato de autorización      |
| error codes                       | contrato de error             |
| retryability                      | contrato RPC                  |
| efecto primario                   | contrato de comando           |
| transacción                       | contrato RPC                  |
| locks                             | contrato RPC                  |
| idempotencia                      | contrato RPC                  |
| timeout                           | contrato RPC                  |
| compatibilidad anterior/siguiente | registro de transición        |
| consumidores                      | registro de consumidores      |
| lifecycle                         | registro contractual          |
| replacement                       | transición o deprecación      |
| evidencia de origen               | candidate / digest / manifest |

Un campo desconocido no se inventa.

---

#### 11. Request: campos requeridos y opcionales

Todo request contractual distingue:

- campos requeridos;
- campos opcionales;
- nullability;
- límites;
- normalización permitida;
- campos desconocidos;
- precondiciones;
- idempotencia.

Reglas:

1. ausencia y `null` no son equivalentes por defecto;
2. `null` no puede significar simultáneamente omitir, borrar, default, todos, ninguno o desconocido;
3. el wrapper no agrega un default no aprobado;
4. el wrapper no elimina un campo porque un consumidor no lo use;
5. un campo server-owned no se completa con dato arbitrario de cliente;
6. precondiciones se transportan de forma explícita;
7. un cambio del request incompatible requiere transición contractual.

---

#### 12. Traducción de argumentos

El mapeo request → `Args` es explícito y determinista.

Invariantes:

```text
MISMO REQUEST CONTRACTUAL
+ MISMA VERSIÓN
+ MISMA FIRMA RPC
=
MISMOS Args LÓGICOS
```

Queda prohibido:

- construir argumentos por orden incidental de propiedades;
- eliminar argumentos requeridos;
- renombrar un argumento sin contrato;
- rellenar con `undefined`, `null` o default por conveniencia;
- aceptar propiedades desconocidas cuando el contrato las prohíbe;
- usar `as any` como estrategia canónica;
- seleccionar overload a partir de heurística del payload;
- serializar arbitrariamente un objeto a JSON para eludir una firma.

---

#### 13. Tipos RPC prohibidos o condicionados

El wrapper no convierte en contrato válido una RPC que use una forma no autorizada.

Se mantienen bloqueados, salvo contrato canónico que resuelva la restricción aplicable:

```text
VARIADIC
record sin shape
anyelement
anyarray
tipos polimórficos
JSON genérico sin schema/version/límites/validación
```

Un wrapper TypeScript no sanea estas ambigüedades.

---

#### 14. Payloads no confiables

TypeScript no sustituye validación runtime.

Cuando el request incorpore:

- JSONB;
- payload externo;
- metadata;
- cuerpo HTTP;
- input de webhook;
- contenido procedente de cache no confiable;
- dato importado;
- estructura que el compilador no controla;

el wrapper deberá consumir el runtime validator aprobado por el contrato correspondiente.

Un cast no constituye validación.

---

#### 15. Autoridad de actor y contexto

Ningún wrapper tratará como autoridad final valores aportados libremente por cliente para:

```text
actor_id
rol
permiso
sede activa
área activa
sesión
estado autorizado
claims editables
owner
schema
tabla
función
```

El wrapper puede transportar datos declarados por el contrato, pero la autoridad final se resuelve server-side en la capa propietaria.

Por tanto:

```text
PARÁMETRO TIPADO
≠ ACTOR AUTORIZADO
≠ PERMISO
≠ SCOPE
≠ RLS APROBADA
```

---

#### 16. `QUERY_RPC`

Un wrapper de `QUERY_RPC` conserva:

1. request inequívoco;
2. respuesta explícita;
3. ausencia de DML;
4. ausencia de DDL;
5. ausencia de side effects externos;
6. ausencia de cambios de sesión;
7. ausencia de colas, webhooks o automatismos como efecto oculto;
8. autorización de lectura;
9. sensibilidad y minimización;
10. paginación y orden cuando correspondan;
11. compatibilidad y error.

Un wrapper no puede promover una función mutante a query porque su nombre use `get`, `list`, `find` o equivalente.

---

#### 17. `COMMAND_RPC`

Un wrapper de `COMMAND_RPC` conserva:

1. una semántica empresarial;
2. exactamente un efecto empresarial primario;
3. un owner primario;
4. autorización explícita;
5. request y response;
6. errores;
7. idempotencia cuando sea reintentable;
8. concurrencia y precondiciones;
9. transacción y locks;
10. auditabilidad;
11. compatibilidad;
12. resultado verificable.

El wrapper no puede agregar un segundo efecto empresarial.

---

#### 18. Operaciones multi-owner

Si una operación requiere efectos en dos o más owner schemas:

```text
CROSS_DOMAIN_COORDINATION_REQUIRED
```

Consecuencias:

1. el wrapper no encadena RPC para aparentar atomicidad;
2. el wrapper no usa DML lateral;
3. el wrapper no crea una saga local en el cliente;
4. la coordinación consume contratos propietarios aprobados;
5. cada owner confirma su propio efecto;
6. una falla parcial conserva estado explícito;
7. compensación pertenece al contrato de coordinación, no al wrapper básico.

---

#### 19. Idempotencia

Un wrapper no inventa idempotencia.

Cuando el contrato declare una operación reintentable, deberá transportar y preservar:

- clave idempotente;
- scope;
- equivalencia o digest del payload;
- referencia del resultado;
- conflicto por reutilización incompatible;
- estado de resultado cuando aplique.

Invariantes:

```text
MISMA CLAVE + MISMO PAYLOAD COMPATIBLE
→ mismo resultado lógico previo cuando la capa autoritativa lo soporte

MISMA CLAVE + PAYLOAD INCOMPATIBLE
→ conflicto explícito
```

La memoria local del cliente no sustituye el registro autoritativo de idempotencia.

---

#### 20. Concurrencia y versión esperada

Cuando el comando afecte un agregado versionado, el wrapper transportará:

```text
expected_version
```

o el mecanismo equivalente aprobado.

Reglas:

1. no elimina la precondición para reducir errores;
2. no reintenta automáticamente con una versión nueva sin reevaluar intención;
3. no usa last-writer-wins como corrección;
4. un conflicto de versión se conserva como conflicto;
5. el wrapper no lee de nuevo y sobrescribe sin contrato;
6. locks y timeouts pertenecen a la semántica RPC, no a heurísticas del cliente.

---

#### 21. Locks y timeouts

Cuando correspondan, el contrato RPC conserva:

- recurso bloqueado;
- scope;
- orden;
- timeout;
- conducta ante conflicto;
- relación con retry;
- resultado desconocido cuando aplique.

El wrapper:

- no amplía locks;
- no crea advisory locks;
- no supone éxito por timeout;
- no supone fallo definitivo por timeout;
- no repite una mutación desconocida salvo política segura;
- no cambia el timeout contractual unilateralmente.

---

#### 22. Manejo de retorno

El retorno de una RPC debe ser explícito.

Se conserva:

- tipo;
- shape;
- colección o fila;
- nullability;
- orden cuando sea contractual;
- estado;
- referencias;
- versión;
- errores separados.

Queda prohibido que el wrapper:

- dependa de `record` sin shape;
- use `SELECT *` como contrato estable;
- exponga tipos internos administrados por conveniencia;
- acepte JSON genérico sin contrato;
- interprete ausencia de fila como éxito si el contrato no lo dice;
- transforme un error en `null`;
- transforme resultado parcial en éxito completo.

---

#### 23. Resultado empresarial y transporte

El wrapper distingue:

```text
RPC INVOCADA
≠ RPC ACEPTADA
≠ EFECTO EMPRESARIAL CONFIRMADO
```

Cuando el contrato utilice estados intermedios o receipts, se preservan sin colapsarlos.

Una respuesta técnica 2xx o una invocación sin excepción no es evidencia suficiente de efecto empresarial si el contrato define confirmación separada.

---

#### 24. Errores

`SHELL-DB-003` preserva la información contractual de error necesaria para invocación:

- código estable;
- categoría fuente;
- retryability;
- contexto mínimo;
- mapping contractual de cliente;
- resultado desconocido cuando corresponda;
- conflicto;
- denegación;
- fallo técnico.

Esta tarea no crea la taxonomía transversal final de errores de acceso a datos.

Esa normalización pertenece a:

```text
SHELL-DB-004 — Normalizar errores de Supabase
```

Por tanto:

1. no se inventan códigos aquí;
2. no se fusionan errores de negocio y técnicos;
3. no se reetiqueta una denegación como fallo de red;
4. no se transforma un conflicto en `null`;
5. no se oculta un error para mantener una API aparentemente simple.

---

#### 25. Seguridad y `EXECUTE`

Compilar un wrapper no concede `EXECUTE`.

El wrapper no modifica ni sustituye:

- grants;
- RLS;
- `USAGE`;
- política Data API;
- resolución de actor;
- autorización empresarial;
- `SECURITY INVOKER`;
- `SECURITY DEFINER`;
- `search_path`;
- owner PostgreSQL;
- controles de schema.

La existencia de una RPC en tipos generados tampoco constituye aprobación de exposición.

---

#### 26. `SECURITY DEFINER`

Una RPC `SECURITY DEFINER` solo puede tener wrapper cuando la función haya superado sus gates propietarios.

El wrapper no puede certificar por sí mismo:

- necesidad de elevación;
- owner;
- search path;
- referencias calificadas;
- autorización interna;
- grants mínimos;
- auditabilidad;
- ausencia de bypass;
- pruebas negativas.

Una función privilegiada observada pero no aprobada permanece fuera del consumo canónico.

---

#### 27. `search_path` y resolución de objetos

El wrapper no compensa un `search_path` inseguro.

Cada RPC aprobada conserva su contrato de resolución y la infraestructura propietaria verifica:

- `search_path` explícito y mínimo;
- referencias empresariales calificadas;
- ausencia de resolución manipulable por caller;
- dependencias inventariadas;
- SQL dinámico gobernado cuando exista.

El wrapper nunca suministra un schema arbitrario para cambiar la resolución interna.

---

#### 28. Overloads

Las sobrecargas se tratan como firmas distintas.

Reglas:

1. cada firma tiene identidad propia;
2. la API pública no usa un nombre ambiguo para decidir overload;
3. el wrapper se liga a una firma certificada;
4. un cambio de argumentos no se absorbe silenciosamente;
5. una sobrecarga legacy conserva transición independiente;
6. la retirada exige consumidor cero o sustitución desplegada;
7. una nueva versión puede coexistir durante la migración según su contrato.

---

#### 29. Triggers y funciones trigger

Las 74 funciones trigger vigentes no forman automáticamente parte de wrappers RPC.

Invariantes:

```text
TRIGGER_FUNCTION
→ asociada a relación y evento
→ ejecutada por PostgreSQL
→ sin invocación directa como RPC por defecto
```

Los 197 triggers vigentes se documentan mediante su contrato de trigger, no mediante wrappers de consumidor.

Si una capacidad equivalente necesita una RPC directa, deberá existir un contrato RPC separado y aprobado.

---

#### 30. Funciones internas

Una función en owner schema, `app_private` o `audit` no se expone mediante wrapper público por existir en `Database`.

Los consumers ordinarios no reciben wrappers para:

- helpers privados;
- primitivas de seguridad;
- coordinadores internos;
- append de auditoría;
- reglas internas;
- adapters de plataforma;
- funciones de trigger.

La exposición debe provenir de una RPC canónica aprobada.

---

#### 31. Frontera VITAL

Las funciones y relaciones de VITAL permanecen fuera del bundle ordinario de Vento OS.

El wrapper no:

- importa firmas VITAL;
- genera adapters VITAL;
- reexporta tipos VITAL;
- crea aliases VITAL;
- utiliza coexistencia física como permiso;
- permite que un consumidor Vento OS invoque VITAL mediante el package compartido.

Una integración futura requerirá contrato explícito de la arquitectura propietaria correspondiente.

---

#### 32. Compatibilidad de versiones

Cada wrapper evoluciona de acuerdo con la clasificación contractual.

```text
PATCH
→ metadata o documentación sin cambiar consumo

MINOR
→ adición compatible y opcional

MAJOR
→ eliminación o cambio incompatible de firma, significado,
   autorización, nullability, enum cerrado, ruta o error
```

Reglas:

1. una versión publicada es inmutable;
2. un wrapper no cambia de RPC objetivo dentro de la misma versión;
3. una versión nueva no reinterpreta historia;
4. el consumidor registra la versión exacta resuelta;
5. lockfile forma parte de reproducibilidad;
6. un rango compatible no sustituye la identidad exacta desplegada;
7. no existe fallback automático a `latest`.

---

#### 33. Compatibilidad entre firma anterior y siguiente

Cuando una RPC cambie, la unidad de wrapper conserva:

- firma anterior;
- firma siguiente;
- clase de cambio;
- consumidores;
- deadline;
- compatibilidad;
- mapper cuando sea legítimo;
- rollback;
- condición de retiro;
- telemetría o evidencia de uso;
- replacement explícito.

No se realiza una traducción silenciosa incompatible para conservar compilación.

---

#### 34. Deprecación y retiro

Un wrapper no se retira únicamente porque una búsqueda de código no encuentre imports.

El retiro exige, según contrato:

1. replacement cuando corresponda;
2. consumidores inventariados;
3. migración o evidencia de no consumo;
4. periodo de deprecación;
5. compatibilidad;
6. rollback;
7. condición de cero uso o sustitución desplegada;
8. retiro coordinado de firma física cuando aplique.

El wrapper legacy puede permanecer temporalmente sin ser considerado arquitectura objetivo.

---

#### 35. Registro de consumidores

Todo consumidor que adopte un wrapper deberá registrar como mínimo:

- repositorio;
- aplicación o responsabilidad;
- runtime;
- versión exacta de `@vento/supabase`;
- contrato RPC;
- versión del contrato;
- owner;
- release o corte;
- compatibilidad;
- evidencia de pruebas.

La mera instalación del package no prueba compatibilidad.

---

#### 36. Pruebas de wrapper

La futura implementación deberá cubrir por cada wrapper aplicable:

1. input válido;
2. input inválido;
3. requerido ausente;
4. `null` permitido;
5. `null` prohibido;
6. unknown field;
7. límite inválido;
8. retorno válido;
9. retorno incompatible;
10. código de error estable;
11. denegación;
12. conflicto;
13. timeout;
14. resultado desconocido cuando aplique;
15. retry seguro cuando aplique;
16. retry no permitido;
17. idempotencia cuando aplique;
18. payload conflictivo con la misma clave;
19. expected version correcto;
20. expected version obsoleto;
21. overload exacto;
22. firma retirada;
23. versión incompatible;
24. ausencia de side effect para `QUERY_RPC`;
25. efecto primario único para `COMMAND_RPC`;
26. cross-domain bloqueado o coordinado por contrato;
27. grants/RLS/authorization negativos en la capa propietaria;
28. paridad con consumidor.

Esta sección especifica cobertura futura; no afirma ejecución física.

---

#### 37. Reproducibilidad

Cada wrapper materializado deberá poder vincularse con:

```text
candidate
schema digest
qualified signature
definition hash
generated Args
generated Returns
contract id
contract version
package version
consumer version
```

Dos builds de la misma versión y mismas fuentes no pueden seleccionar firmas distintas.

Una diferencia obliga a bloquear o clasificar drift.

---

#### 38. Sincronización incremental con BLOQUE R

`SHELL-DB-003` no es una fotografía única.

Después de cada package contractual de base de datos aprobado que modifique RPC:

1. se resuelve el candidate aprobado;
2. se verifica la firma;
3. se actualizan tipos mediante la tarea propietaria;
4. se reconcilia el contrato RPC;
5. se crea, actualiza, depreca o retira el wrapper según disposición;
6. se clasifica compatibilidad;
7. se prueban consumidores;
8. se publica únicamente tras gates;
9. se conserva rollback;
10. se actualiza evidencia.

`AUTH-DB-026` conserva el handoff incremental de generación/publicación.

---

#### 39. Estado de materialización física

| Elemento                         | Estado                                        |
| -------------------------------- | --------------------------------------------- |
| identidad de la familia wrappers | `ESPECIFICADA`                                |
| elegibilidad                     | `ESPECIFICADA`                                |
| `QUERY_RPC`                      | `ESPECIFICADA`                                |
| `COMMAND_RPC`                    | `ESPECIFICADA`                                |
| firma inequívoca                 | `ESPECIFICADA`                                |
| mapeo request → Args             | `ESPECIFICADO`                                |
| mapeo Returns → response         | `ESPECIFICADO`                                |
| nullability                      | `ESPECIFICADA`                                |
| runtime validation               | `ESPECIFICADA` como obligación cuando aplique |
| idempotencia                     | `ESPECIFICADA` por contrato                   |
| concurrencia                     | `ESPECIFICADA` por contrato                   |
| compatibilidad                   | `ESPECIFICADA`                                |
| deprecación                      | `ESPECIFICADA`                                |
| VITAL                            | `EXCLUIDO`                                    |
| wrappers físicos                 | `NO MATERIALIZADOS`                           |
| exports                          | `NO ASIGNADOS`                                |
| nombres TypeScript públicos      | `NO ASIGNADOS`                                |
| package físico                   | `NO MATERIALIZADO`                            |
| versión npm                      | `NO ASIGNADA`                                 |
| consumidores migrados            | `0`                                           |
| cambios Supabase                 | `0`                                           |
| cambios de datos                 | `0`                                           |
| requisitos creados               | `0`                                           |
| requisitos modificados           | `0`                                           |

---

#### 40. Handoffs exactos

| Materia                                                              | Tarea propietaria                                                   | Condición de salida                                                        |
| -------------------------------------------------------------------- | ------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| taxonomía transversal final de errores Supabase                      | `SHELL-DB-004`                                                      | errores técnicos normalizados sin mezclar dominio, autorización o contexto |
| separación de clientes server/browser/native/privileged              | `SHELL-DB-005`                                                      | runtime y secretos aislados                                                |
| generación/publicación incremental de tipos tras package DB aprobado | `AUTH-DB-026`                                                       | artefactos generados y publicados bajo gates                               |
| gates de contratos, tipos, wrappers y consumidores                   | `SHELL-CI-017` y tareas CI aplicables                               | automatización y evidencia reproducible                                    |
| materialización física de `@vento/supabase`                          | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` | implementación solo para package autorizado                                |
| migración de consumidores legacy                                     | `SHELL-MIG-*` y tareas de adopción propietarias                     | paridad, compatibilidad y rollback por consumidor                          |
| cambios de RPC físicas                                               | tareas E3/BLOQUE R propietarias                                     | migración versionada y contrato aprobado                                   |
| coordinación multi-owner                                             | `SUPA-ARC-017` y tareas de transición/implementación aplicables     | owner local, saga o patrón aprobado                                        |
| seguridad `SECURITY DEFINER`, grants y RLS                           | `SUPA-ARC-014`; `SUPA-ARC-015`; BLOQUE R                            | gates de seguridad y pruebas negativas                                     |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 41. Cobertura de prueba vigente no modificada

La conducta centralizada ya se encuentra protegida por requisitos canónicos vigentes que cubren, entre otros:

- firma PostgreSQL exacta y rechazo de identidad abreviada;
- clasificación previa de una función antes de presentarla como RPC;
- clases `QUERY_RPC` y `COMMAND_RPC`;
- nullability y semántica inequívoca de parámetros;
- prohibición de formas RPC no tipables o ambiguas;
- resolución server-side de actor y contexto;
- pureza de `QUERY_RPC`;
- efecto primario único de `COMMAND_RPC`;
- separación multi-owner;
- `Args` y `Returns` derivados por firma;
- overloads inequívocos;
- retorno explícito;
- idempotencia;
- expected version;
- locks, timeout y concurrencia;
- errores no silenciados;
- `SECURITY INVOKER` como predeterminado;
- gate separado de `SECURITY DEFINER`;
- search path y referencias calificadas;
- mínimo privilegio;
- tipos por tiers;
- exclusión VITAL;
- compatibilidad, deprecación, retiro y rollback;
- pruebas de consumidores;
- actualización contractual de `SUPA-TRANS-014`;
- paridad entre package compartido y consumidores.

`SHELL-DB-003` no cambia esas reglas. Las proyecta como una única frontera documental de wrappers dentro de `@vento/supabase`.

---

#### 42. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-DB-003` centraliza dentro de `@vento/supabase` obligaciones de firma, request, response, autorización, idempotencia, concurrencia, error, compatibilidad, overloads, consumidores, deprecación y retiro ya protegidas por la arquitectura E3, la transición contractual y el registro vigente. No introduce una nueva clase RPC, un nuevo resultado, un nuevo error, una nueva regla de autorización, una nueva estrategia de retry, una nueva operación de base de datos ni un efecto runtime adicional.

---

#### 43. Decisiones vinculantes

1. Los wrappers RPC pertenecen a `@vento/supabase`.
2. Solo RPC canónicas aprobadas son elegibles.
3. `QUERY_RPC` y `COMMAND_RPC` son las dos clases RPC expuestas.
4. `READ_VIEW` no entra a la familia de wrappers RPC.
5. Funciones trigger no reciben wrapper RPC por defecto.
6. Helpers internos no reciben wrapper público por aparecer en tipos.
7. El universo actual es 348 funciones Vento.
8. Se distinguen 274 funciones directas y 74 funciones trigger.
9. Existen 197 triggers Vento explícitos sobre 155 relaciones objetivo.
10. Estas cifras no significan que existan 274 wrappers.
11. No se inventa una cardinalidad de wrappers.
12. La identidad de rutina usa schema, nombre y tipos de argumentos.
13. Nombre abreviado no basta.
14. No existe selección por `latest`.
15. No existe selección por primera coincidencia.
16. Overloads son identidades distintas.
17. `Args` y `Returns` físicos provienen de la capa generada.
18. El artefacto generado no se edita para adaptarlo al wrapper.
19. Request empresarial y `Args` físicos permanecen capas distintas.
20. Response empresarial y `Returns` físicos permanecen capas distintas.
21. Ausencia y `null` no se confunden.
22. El wrapper no inventa defaults.
23. El wrapper no convierte JSON arbitrario en contrato.
24. Payload no confiable requiere validación runtime cuando aplique.
25. Cast TypeScript no constituye validación.
26. Parámetro cliente no constituye autoridad.
27. El wrapper no decide actor, permiso, scope u owner.
28. `QUERY_RPC` no puede tener efectos mutantes.
29. `COMMAND_RPC` conserva exactamente un efecto primario.
30. Un wrapper no compone una transacción multi-owner.
31. Operaciones multi-owner usan coordinación aprobada.
32. El wrapper no inventa idempotencia.
33. Idempotency key se transporta únicamente cuando el contrato la define.
34. Reutilización incompatible produce conflicto explícito.
35. Expected version se conserva cuando el contrato lo exige.
36. El wrapper no implementa last-writer-wins.
37. Timeout no se convierte automáticamente en fallo final o éxito.
38. El retorno tiene shape explícito.
39. Un error no se convierte en `null` sin contrato.
40. Error técnico y error empresarial permanecen distinguibles.
41. La taxonomía final de errores pertenece a `SHELL-DB-004`.
42. Un wrapper no concede `EXECUTE`.
43. Un wrapper no sustituye RLS.
44. Un wrapper no sustituye autorización empresarial.
45. `SECURITY DEFINER` conserva gate independiente.
46. Search path inseguro no se corrige desde el wrapper.
47. Funciones internas no se promocionan por conveniencia.
48. VITAL permanece excluido.
49. Cada versión publicada del wrapper será inmutable.
50. Una versión incompatible requiere transición explícita.
51. Retiro exige evidencia de consumidores y rollback.
52. La ausencia de import observado no demuestra cero uso.
53. Consumidores registran versión exacta.
54. El wrapper conserva procedencia reproducible.
55. La familia se actualiza incrementalmente con packages DB aprobados.
56. Observación casual del remoto no crea wrapper.
57. `AUTH-DB-026` conserva el handoff incremental.
58. La materialización física queda para gates y tareas ejecutables.
59. No se asignan nombres TypeScript públicos.
60. No se asignan exports físicos.
61. No se asigna root físico.
62. No se asigna versión npm.
63. No se crea código.
64. No se modifica Supabase.
65. No se modifican datos.
66. No se crean ni modifican requisitos de prueba.
67. `SHELL-DB-004` queda únicamente reservada.

---

#### 44. Criterios de aceptación documental

`SHELL-DB-003` queda documentalmente satisfecha cuando:

1. define una única frontera de wrappers RPC;
2. preserva `@vento/supabase` como owner de la familia;
3. limita elegibilidad a RPC aprobadas;
4. distingue `QUERY_RPC` y `COMMAND_RPC`;
5. excluye `READ_VIEW` de wrappers RPC;
6. excluye funciones trigger de invocación cliente directa;
7. excluye helpers internos sin contrato expuesto;
8. conserva el baseline vigente 348/274/74/197/155 sin convertirlo en cantidad de wrappers;
9. usa firma PostgreSQL completa como identidad;
10. prohíbe nombre ambiguo;
11. prohíbe `latest`;
12. conserva overloads separados;
13. consume `Args` y `Returns` de la capa generada;
14. no edita tipos generados;
15. define mapping request → Args;
16. define mapping Returns → response;
17. conserva nullability inequívoca;
18. prohíbe defaults inventados;
19. exige runtime validation cuando aplique;
20. impide usar cast como validación;
21. impide autoridad por parámetros de cliente;
22. mantiene `QUERY_RPC` libre de efectos;
23. mantiene un efecto primario por `COMMAND_RPC`;
24. bloquea composición multi-owner implícita;
25. conserva idempotencia contractual;
26. conserva concurrencia y expected version;
27. conserva timeout y resultado desconocido cuando aplique;
28. conserva retorno explícito;
29. conserva errores sin convertirlos a null;
30. reserva taxonomía final de errores a `SHELL-DB-004`;
31. no interpreta tipado como grant;
32. no interpreta tipado como RLS;
33. no interpreta tipado como autorización;
34. conserva gate de `SECURITY DEFINER`;
35. conserva search path como responsabilidad de la RPC;
36. excluye VITAL;
37. define compatibilidad;
38. define deprecación;
39. define retiro;
40. define registro de consumidores;
41. define cobertura futura de pruebas;
42. define reproducibilidad;
43. define sincronización incremental con BLOQUE R;
44. asigna handoffs exactos;
45. no crea código;
46. no crea package físico;
47. no crea exports;
48. no modifica Supabase;
49. no modifica datos;
50. no crea ni modifica requisitos;
51. la siguiente tarea permanece únicamente reservada.

---

#### 45. Límites

`SHELL-DB-003` no:

- crea físicamente `@vento/supabase`;
- crea wrappers TypeScript;
- crea funciones helper;
- crea factories;
- crea exports;
- asigna nombres públicos de funciones;
- asigna subpaths;
- asigna root físico;
- asigna versión npm;
- publica package;
- genera tipos;
- ejecuta codegen;
- modifica `Database`;
- modifica `Args`;
- modifica `Returns`;
- crea DTO;
- crea runtime validators;
- crea códigos de error;
- normaliza la taxonomía final de errores;
- modifica RPC;
- crea RPC;
- crea funciones PostgreSQL;
- crea triggers;
- modifica triggers;
- modifica `SECURITY DEFINER`;
- cambia `search_path`;
- cambia grants;
- cambia RLS;
- cambia Data API;
- ejecuta DDL;
- ejecuta DML;
- ejecuta migraciones;
- ejecuta backfills;
- modifica datos;
- invoca mutaciones operativas;
- migra consumidores;
- modifica VITAL;
- crea contratos multi-owner;
- inicia `SHELL-DB-004`.

---

#### 46. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado

##### TAREA ACTUAL APROBADA

SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas

##### SIGUIENTE TAREA RESERVADA

SHELL-DB-004 — Normalizar errores de Supabase


### ✅ SHELL-DB-004 — Normalizar errores de Supabase

**Estado:** APROBADA
**Tarea anterior:** SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas
**Tarea siguiente:** SHELL-DB-005 — Separar cliente server, browser y native
**Tipo de tarea:** Documental; definición y centralización canónica de la normalización de errores técnicos de acceso a datos y de proveedor dentro de `@vento/supabase`, preservando los códigos y outcomes empresariales, de autorización y de contrato de sus propietarios, con semántica determinista de retry, resultado desconocido, redacción, correlación y diagnóstico protegido, sin materializar código, package físico, exports, clientes, wrappers, RPC, migraciones, DDL, DML, cambios de datos ni modificaciones en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/06_ACCESO_COMPARTIDO_A_DATOS.md`
**Estado físico resultante:** ESPECIFICADO; NORMALIZADOR Y PACKAGE FÍSICO NO MATERIALIZADOS
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, configuración npm, registry, CI, despliegues, SQL, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos o configuración remota:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-DB-004` define la frontera compartida con la que `@vento/supabase` deberá normalizar fallos técnicos provenientes de Supabase, PostgreSQL, PostgREST, transporte y adaptadores de acceso a datos sin crear una segunda taxonomía empresarial ni permitir que detalles nativos de infraestructura gobiernen el comportamiento de los consumidores.

La cadena canónica queda:

```text
ERROR / OUTCOME DE CONTRATO, SI EXISTE
        +
DIAGNÓSTICO TÉCNICO DEL PROVEEDOR
        +
OPERACIÓN Y VERSIÓN
        +
CERTEZA DEL EFECTO
        +
POLÍTICA DE RETRY / RECONCILIACIÓN
        ↓
NORMALIZACIÓN TÉCNICA @vento/supabase
        ↓
RESULTADO CONTRACTUAL PRESERVADO
        +
DIAGNÓSTICO SEGURO
        +
METADATA OPERATIVA MÍNIMA
        ↓
CONSUMIDOR AUTORIZADO
```

Nunca:

```text
Error.message
→ lógica de cliente

SQLSTATE
→ código empresarial público

HTTP status
→ razón de autorización por inferencia

error nativo
→ null / [] / false / éxito

timeout de comando
→ retry ciego

detalle de constraint
→ mensaje público

fallo de proveedor
→ cambio de semántica del contrato
```

---

#### 2. Resultado material

Queda definida documentalmente una política única de normalización técnica de errores para la futura superficie de `@vento/supabase`.

La política materializa:

- separación estricta entre diagnóstico técnico, outcome contractual, autorización y mensaje público;
- preservación de códigos empresariales canónicos cuando ya existen;
- once familias semánticas mínimas de error/outcome heredadas de E3;
- reglas de clasificación por fuente técnica;
- reglas para red, timeout, desconexión y resultado desconocido;
- reglas para PostgreSQL y detalles de constraints;
- reglas para PostgREST y códigos nativos de proveedor;
- reglas para Auth, Storage, Realtime y Edge únicamente cuando una superficie aprobada de `@vento/supabase` los consuma;
- relación entre HTTP y semántica contractual;
- tratamiento de consultas y comandos;
- retry, backoff, idempotencia y reconciliación;
- concurrencia, deadlock, serialización y lock timeout;
- redacción y minimización;
- correlación y diagnóstico protegido;
- fallback cerrado para errores desconocidos;
- paridad semántica entre runtimes;
- versionado del mapping;
- compatibilidad, observabilidad y pruebas posteriores.

No se crea un `ErrorCode` universal ni un catálogo paralelo de errores de dominio.

---

#### 3. Fuentes normativas y precedencia

| Fuente               | Decisión preservada                                                                                                                       |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-DB-001`       | `@vento/supabase` posee la normalización de errores de acceso a datos como una de sus cuatro responsabilidades exactas                    |
| `SHELL-DB-002`       | tipos físicos generados no definen errores empresariales ni autorización                                                                  |
| `SHELL-DB-003`       | wrappers preservan código, categoría, retryability y contexto contractual; la taxonomía técnica transversal pertenece a `SHELL-DB-004`    |
| `SHELL-CON-008`      | los códigos compartidos de autorización/contexto no incluyen SQLSTATE, códigos nativos de Supabase, exception names ni `Error.message`    |
| `SUPA-ARC-013`       | un error no puede convertirse en éxito y la propagación/códigos se gobiernan en la capa contractual                                       |
| `SUPA-ARC-014`       | errores de superficies `SECURITY DEFINER` deben conservar seguridad, redacción y pruebas negativas                                        |
| `SUPA-ARC-015`       | grants, RLS, exposición y mínimo privilegio permanecen fuera de la normalización técnica                                                  |
| `SUPA-ARC-016`       | catálogo cerrado de códigos machine-readable, once familias semánticas mínimas, retry, idempotencia, concurrencia y resultado desconocido |
| `SUPA-ARC-017`       | coordinación multi-owner preserva fallos parciales, compensación y reconciliación                                                         |
| `SUPA-ARC-023`       | consumers no derivan lógica de mensajes humanos, SQLSTATE ni stack traces                                                                 |
| `SUPA-TRANS-014`     | tipos, contracts, errors, consumers, compatibilidad y documentación evolucionan de manera coordinada                                      |
| `AUTH-ERR-*`         | copy y experiencia de bloqueo o indisponibilidad técnica pertenecen a su capa propietaria                                                 |
| registro 04A vigente | requisitos existentes sobre error codes, redacción, retry, outcome, tipos y contratos                                                     |
| `SHELL-DB-005`       | separación física posterior de clientes server, browser y native                                                                          |
| `SHELL-CI-*`         | materialización de pruebas, compatibilidad, publicación y evidencia posteriores                                                           |

Precedencia obligatoria:

```text
CONTRATO EMPRESARIAL / AUTORIZACIÓN
        ↓
OUTCOME O CÓDIGO CANÓNICO
        ↓
NORMALIZACIÓN TÉCNICA DE ACCESO
        ↓
ADAPTACIÓN DEL CONSUMIDOR
        ↓
COPY / EXPERIENCIA DE USUARIO
```

Un detalle técnico nunca asciende de forma implícita para convertirse en autoridad empresarial.

---

#### 4. Las cuatro capas semánticas que no se mezclan

Toda falla se interpreta manteniendo separadas estas cuatro capas:

| Capa                  | Contenido                                                                       | Propietario                    |
| --------------------- | ------------------------------------------------------------------------------- | ------------------------------ |
| diagnóstico nativo    | error de proveedor, transporte, runtime o base de datos                         | infraestructura/proveedor      |
| normalización técnica | clasificación estable de acceso, certeza, retry, redacción y diagnóstico seguro | `@vento/supabase`              |
| outcome contractual   | código estable de dominio, autorización, conflicto, invariantes o resultado     | contrato propietario           |
| mensaje público       | copy, instrucción, recuperación y experiencia                                   | capa UX/Auth/Error propietaria |

Invariantes:

1. la normalización técnica no reemplaza un outcome contractual ya resuelto;
2. un outcome contractual no necesita exponer el diagnóstico nativo;
3. un mensaje público no sirve como identificador técnico;
4. un diagnóstico nativo no sirve como código empresarial;
5. el mismo incidente puede conservar información en varias capas sin colapsarlas;
6. cada capa puede aplicar redacción distinta según autorización.

---

#### 5. No existe un `ErrorCode` universal

`SHELL-DB-004` no crea un enum transversal capaz de mezclar:

- autorización;
- contexto;
- negocio;
- HTTP;
- SQLSTATE;
- PostgREST;
- Supabase Auth;
- Storage;
- Realtime;
- Edge Functions;
- errores de red;
- excepciones JavaScript;
- códigos de dominio.

Los vocabularios canónicos existentes conservan sus propietarios.

En particular:

```text
AuthorizationReasonCode
≠ código nativo Supabase
≠ SQLSTATE
≠ HTTP status
≠ clase técnica normalizada
```

La normalización compartida trabaja como adapter técnico, no como catálogo empresarial universal.

---

#### 6. Once familias semánticas mínimas heredadas

Los contratos de E3 deben poder distinguir al menos estas once familias semánticas:

|    # | Familia semántica                     | Lectura contractual                                               |
| ---: | ------------------------------------- | ----------------------------------------------------------------- |
|    1 | validación de request                 | input incumple el contrato antes de producir el efecto solicitado |
|    2 | autenticación ausente o inválida      | no existe identidad autenticada utilizable según contrato         |
|    3 | autorización denegada                 | identidad conocida carece de autorización efectiva                |
|    4 | recurso inexistente o no visible      | el contrato no expone un recurso al caller                        |
|    5 | conflicto de versión o estado         | precondición, versión o estado esperado no coincide               |
|    6 | idempotencia duplicada o incompatible | la clave representa resultado previo o payload incompatible       |
|    7 | invariante de negocio                 | una regla empresarial impide la operación                         |
|    8 | límite, tasa o capacidad              | una cuota, límite o capacidad contractual impide continuar        |
|    9 | dependencia pendiente o fallida       | una dependencia necesaria no está disponible o confirmada         |
|   10 | resultado desconocido                 | no puede determinarse con seguridad si un efecto fue confirmado   |
|   11 | error interno no divulgado            | fallo técnico que no debe revelar internals al consumidor         |

Reglas:

1. la tabla define familias semánticas, no nuevos literales públicos;
2. el código machine-readable concreto pertenece al contrato propietario;
3. un proveedor no selecciona por sí mismo una de estas familias;
4. un mapping explícito y versionado puede relacionar un diagnóstico técnico con un outcome;
5. ante ambigüedad se conserva la semántica más segura y no se adivina un outcome empresarial.

---

#### 7. Preservación prioritaria del outcome contractual

Si la RPC, endpoint o capa autoritativa ya devolvió un outcome contractual válido:

```text
OUTCOME CONTRACTUAL VÁLIDO
        ↓
SE PRESERVA
        ↓
LA NORMALIZACIÓN SOLO ADJUNTA O REDACTA METADATA TÉCNICA
```

Queda prohibido:

- sustituirlo por un HTTP status;
- sustituirlo por SQLSTATE;
- sustituirlo por `PGRST*`;
- sustituirlo por un nombre de excepción;
- sustituirlo por una cadena humana;
- degradarlo a “unknown error” si el contrato ya es inequívoco;
- elevar un error técnico por encima del outcome autoritativo.

---

#### 8. Orden determinista de decisión

La normalización seguirá este orden lógico:

1. identificar operación y contrato;
2. comprobar si existe outcome contractual machine-readable válido;
3. preservar ese outcome;
4. determinar si existe certeza sobre el efecto;
5. clasificar la fuente técnica;
6. aplicar únicamente mappings aprobados y versionados;
7. resolver retry/reconciliación según el contrato de la operación;
8. redactar información no autorizada;
9. adjuntar correlación y diagnóstico técnico seguro;
10. devolver una representación estable al consumidor.

Cuando no exista un mapping aprobado:

```text
NO MAPPING
→ NO INFERENCIA EMPRESARIAL
→ ERROR TÉCNICO CERRADO
→ DIAGNÓSTICO PROTEGIDO
→ RETRY / RECONCILIACIÓN SOLO SI EL CONTRATO LO PERMITE
```

---

#### 9. Determinismo

Para la misma combinación de:

```text
fuente técnica relevante
+ operación
+ contrato y versión
+ mapping de normalización y versión
+ certeza del efecto
+ contexto explícito requerido
```

debe obtenerse la misma clasificación lógica.

No son dependencias válidas:

- idioma de `Error.message`;
- texto humano del proveedor;
- stack trace;
- orden incidental de propiedades;
- heurística de nombre;
- timestamp local;
- primer match;
- status HTTP aislado;
- comportamiento de un runtime no declarado.

---

#### 10. Mensajes humanos no gobiernan lógica

`Error.message`, `hint`, `details` o texto equivalente pueden conservar valor diagnóstico protegido, pero no son la fuente primaria de branching.

Queda prohibido:

```text
message.includes(...)
regex sobre texto humano
prefijo textual no versionado
traducción del mensaje
copy visible
```

como mecanismo canónico para decidir:

- autorización;
- conflicto;
- retry;
- idempotencia;
- inexistencia;
- invariante;
- rate limit;
- resultado desconocido.

Una excepción solo puede existir si el contrato propietario define expresamente un parser versionado y probado; esa excepción no se presume aquí.

---

#### 11. HTTP no es semántica empresarial

Un status HTTP se conserva como metadata técnica cuando sea útil, pero no decide por sí solo el outcome.

Ejemplos de prohibición:

| Señal | Inferencia prohibida                                                           |
| ----- | ------------------------------------------------------------------------------ |
| `401` | seleccionar automáticamente un reason code de autorización                     |
| `403` | asumir la causa empresarial exacta de la denegación                            |
| `404` | afirmar existencia física o inexistencia cuando el contrato oculta visibilidad |
| `409` | asumir conflicto de versión sin contrato                                       |
| `429` | asumir qué cuota o capacidad fue excedida                                      |
| `5xx` | inventar un código de dominio                                                  |

El contrato autoritativo define la semántica; HTTP es transporte.

---

#### 12. PostgreSQL y SQLSTATE

SQLSTATE y metadata PostgreSQL son diagnósticos técnicos protegidos.

La normalización puede usarlos internamente cuando exista mapping aprobado, pero:

1. no se exponen como código empresarial público;
2. no se usan directamente para copy de UI;
3. no se publican nombres de schema, tabla, función o constraint;
4. una violación de constraint no se transforma automáticamente en una invariante empresarial específica;
5. un conflicto de concurrencia se interpreta conforme al contrato de retry;
6. una falla de privilegio no reemplaza el sistema canónico de autorización;
7. el SQL original no se propaga al consumer;
8. stack, context y detalles del servidor se mantienen fuera de superficies no privilegiadas.

---

#### 13. Constraints y datos estructurales

Una señal de:

- unicidad;
- foreign key;
- check;
- not-null;
- exclusión;
- constraint deferrable;
- constraint interna;

solo puede convertirse en outcome contractual específico cuando exista mapping aprobado entre:

```text
IDENTIDAD TÉCNICA PROTEGIDA
→ CONTRATO Y VERSIÓN
→ CÓDIGO EMPRESARIAL ESTABLE
```

Sin mapping:

```text
CONSTRAINT ERROR
→ FALLO TÉCNICO / CONTRACTUAL NO ESPECIFICADO
→ SIN FILTRAR NOMBRE DEL CONSTRAINT
```

No se deriva semántica empresarial del nombre del constraint.

---

#### 14. PostgREST

Los códigos y estructuras nativas de PostgREST pertenecen a la capa técnica.

Reglas:

1. un código nativo no se convierte automáticamente en código público;
2. mappings utilizados por `@vento/supabase` deberán ser explícitos, versionados y probados;
3. un cambio del proveedor que deje un código sin mapping utiliza fallback cerrado;
4. error nativo y outcome contractual pueden coexistir en diagnóstico protegido;
5. el consumidor no ramifica directamente sobre el código nativo salvo que su contrato propietario lo autorice expresamente;
6. detalles de SQL o schema no pasan a superficies de cliente.

---

#### 15. Supabase Auth

Los fallos de Supabase Auth conservan frontera separada.

`SHELL-DB-004` puede normalizar forma técnica de transporte únicamente cuando una superficie aprobada de `@vento/supabase` consuma ese proveedor, pero no:

- crea `AuthorizationReasonCode`;
- decide permisos;
- decide contexto;
- reinterpreta una denegación;
- transforma automáticamente un error nativo de Auth en una razón pública;
- crea copy de login o sesión;
- sustituye la arquitectura de autenticación.

La semántica de autenticación y autorización permanece en sus contratos propietarios.

---

#### 16. Storage, Realtime y Edge Functions

Cuando una superficie aprobada de acceso utilice Storage, Realtime o Edge Functions, podrá aplicar la misma disciplina técnica:

```text
diagnóstico nativo
→ normalización técnica
→ outcome contractual propietario
```

Esto no amplía la autoridad de `@vento/supabase`.

En particular:

1. Storage conserva contratos de archivo y autorización propios;
2. Realtime conserva semántica de conexión, evento y consistencia propia;
3. Edge Functions conservan contratos HTTP/RPC/worker propietarios;
4. una falla técnica no inventa un outcome empresarial;
5. no se unifican todos los proveedores en un código público universal.

---

#### 17. Fallos de red antes de despacho

Cuando exista evidencia suficiente de que la solicitud no alcanzó la frontera autoritativa:

- se clasifica como falla técnica de disponibilidad/transporte;
- no se afirma un efecto empresarial;
- una query podrá reintentarse solo según su contrato;
- un command podrá reintentarse únicamente si su contrato lo permite;
- se preservan correlación, intento y diagnóstico técnico cuando existan.

La ausencia de respuesta no constituye por sí sola prueba de no despacho.

---

#### 18. Desconexión o timeout después de despacho

Para una operación mutante:

```text
SOLICITUD DESPACHADA
+ SIN CONFIRMACIÓN SUFICIENTE DEL RESULTADO
=
POSIBLE RESULTADO DESCONOCIDO
```

Consecuencias:

1. no se declara éxito;
2. no se declara fallo empresarial definitivo por inferencia;
3. no se repite ciegamente;
4. si existe idempotencia contractual, se consulta o recupera el resultado previo según contrato;
5. si existe query de reconciliación, se utiliza en la capa propietaria;
6. una nueva clave idempotente no se crea para repetir el mismo intent sin comprobar el estado anterior;
7. el consumidor recibe una representación estable de incertidumbre cuando el contrato así lo defina.

---

#### 19. Resultado desconocido

`resultado desconocido` es una familia semántica explícita y no una excepción genérica.

Debe preservarse cuando no sea posible afirmar con seguridad si:

- la transacción confirmó;
- el job fue aceptado;
- la mutación produjo efecto;
- una dependencia terminó;
- la respuesta se perdió después del commit.

No debe traducirse a:

- éxito;
- fallo final;
- null;
- arreglo vacío;
- “intenta otra vez” sin política;
- duplicación de operación.

La salida operativa es reconciliar o recuperar un resultado idempotente cuando el contrato lo permita.

---

#### 20. Queries

Para `QUERY_RPC` y consultas equivalentes:

1. un fallo técnico no se convierte en colección vacía;
2. un `not found/not visible` contractual no se confunde con fallo de red;
3. retry puede ser seguro solo cuando el contrato y la sensibilidad lo permiten;
4. cursor, versión y consistency contract se conservan;
5. un timeout no autoriza cambiar filtros o scope;
6. una query reintentada mantiene correlación cuando corresponda;
7. una respuesta parcial no se presenta como completa.

---

#### 21. Commands

Para `COMMAND_RPC` y mutaciones equivalentes:

1. error técnico no implica cero efectos;
2. timeout después de despacho puede requerir outcome desconocido;
3. retry requiere política explícita;
4. si existe idempotency key, se conserva para el mismo intent;
5. conflicto de payload con la misma clave no se reintenta como operación nueva;
6. expected version se conserva;
7. un conflicto no se traduce a éxito;
8. una denegación no se traduce a fallo de transporte;
9. una invariante empresarial no se oculta con un error técnico genérico;
10. la confirmación del efecto pertenece a la capa autoritativa.

---

#### 22. Idempotencia y retry

La normalización no crea idempotencia.

Cuando el contrato la defina:

```text
mismo intent
+ misma clave
+ payload compatible
→ recuperar resultado anterior o continuar conforme al contrato
```

y:

```text
misma clave
+ payload incompatible
→ conflicto explícito
```

Retry:

- nunca es una propiedad inferida del texto del error;
- nunca usa un nuevo identificador para ocultar un resultado incierto;
- nunca cambia versión esperada silenciosamente;
- nunca altera el payload para “hacer que funcione”;
- puede ser bounded únicamente cuando el contrato lo autorice.

---

#### 23. Concurrencia, deadlock, serialización y locks

Los fallos de concurrencia no se colapsan en error interno genérico cuando el contrato define recuperación.

La normalización deberá conservar:

- operación;
- precondición;
- expected version cuando exista;
- retryability;
- número o identidad de intento cuando corresponda;
- necesidad de reevaluación;
- estado de resultado desconocido si aplica.

Una política bounded de retry podrá aplicarse únicamente desde la capa autorizada y con el mismo intent contractual.

No existe last-writer-wins implícito.

---

#### 24. Rate limit, capacidad y dependencia

Una señal técnica de throttling o saturación no identifica automáticamente la regla empresarial afectada.

Se distingue:

```text
RATE / CAPACITY CONTRACTUAL
```

de:

```text
SATURACIÓN / DISPONIBILIDAD TÉCNICA
```

Cuando exista información segura de espera o recuperación:

- puede conservarse como metadata;
- no se convierte en política de negocio;
- no obliga a retry automático;
- no se expone si revela infraestructura sensible.

Dependencias pendientes/fallidas conservan el owner y contrato de la dependencia.

---

#### 25. Autenticación, autorización y fallo técnico

Estas tres situaciones permanecen separadas:

| Situación                                          | Lectura                                   |
| -------------------------------------------------- | ----------------------------------------- |
| autenticación inválida                             | identidad no utilizable según contrato    |
| autorización denegada                              | identidad conocida sin permiso efectivo   |
| evaluación/autorización técnicamente no disponible | no existe una decisión de política válida |

Regla central:

```text
FALLO TÉCNICO DE AUTORIZACIÓN
≠ DENEGACIÓN DE POLÍTICA
```

La normalización no fabrica una denegación para fallar cerrado en UX; la capa propietaria decide cómo bloquear sin falsificar el reason code.

---

#### 26. Recurso inexistente o no visible

La familia contractual `recurso inexistente o no visible` protege contra filtración de existencia.

El normalizador:

1. conserva el outcome contractual emitido por la capa autoritativa;
2. no inspecciona internals para decir al cliente si el registro sí existe;
3. no cambia el resultado según permisos locales;
4. no traduce automáticamente un `404` a inexistencia física;
5. no expone IDs alternos, nombres internos o relaciones que revelen el objeto;
6. no usa diferencia de mensajes como side channel.

---

#### 27. Error convertido a éxito: prohibido

Quedan prohibidas transformaciones como:

```text
error → null
error → []
error → false
error → objeto vacío
error → "ok"
timeout → éxito asumido
denegación → resultado inexistente no contractual
conflicto → no-op silencioso
```

Solo un contrato que defina explícitamente un outcome negativo como dato puede representarlo como tal.

Un fallback técnico no puede aparentar éxito.

---

#### 28. Información lógica mínima preservada

La representación normalizada deberá conservar, cuando aplique y exista autoridad para ello:

- fuente técnica;
- operación;
- contrato y versión;
- código contractual machine-readable si fue emitido;
- familia semántica;
- certeza o incertidumbre del efecto;
- política de retry aplicable;
- necesidad de reconciliación;
- correlación;
- referencia de operación o intento;
- contexto seguro mínimo;
- diagnóstico público redactado;
- referencia protegida al diagnóstico técnico;
- causa técnica encadenada cuando el runtime la soporte;
- estado de redacción/minimización.

Estos son atributos lógicos. Esta tarea no asigna nombres de propiedades TypeScript, interfaces, clases ni exports físicos.

---

#### 29. Diagnóstico protegido

La implementación futura deberá permitir investigación técnica sin ampliar exposición.

El diagnóstico protegido puede conservar, según política:

- código nativo;
- status;
- SQLSTATE;
- detalles de proveedor;
- stack;
- causa;
- endpoint lógico;
- runtime;
- versión de SDK;
- correlation ID;
- attempt ID;
- timestamps operativos;
- metadata necesaria para soporte.

Pero esa información no es automáticamente consumible por browser/mobile ni se incorpora completa a logs generales.

---

#### 30. Redacción obligatoria

Las superficies no privilegiadas no expondrán, salvo contrato explícito y seguro:

- SQLSTATE;
- stack traces;
- SQL;
- nombres físicos de tablas;
- nombres de schemas internos;
- nombres de constraints;
- nombres de funciones internas;
- `search_path`;
- ACL;
- roles PostgreSQL;
- owners;
- service-role;
- tokens;
- secrets;
- firmas;
- credenciales;
- URLs privadas;
- payloads sensibles completos;
- PII innecesaria;
- existencia de registros no autorizados.

El normalizador debe poder perder detalle público sin perder trazabilidad protegida.

---

#### 31. Correlación

Una falla normalizada conserva correlación suficiente para enlazar, cuando exista:

```text
request
→ wrapper
→ RPC / adapter
→ operación lógica
→ intento
→ efecto o outcome
→ diagnóstico
```

La correlación:

- no sustituye auditoría;
- no sustituye idempotencia;
- no contiene secretos;
- no se reutiliza como autorización;
- puede exponerse de forma segura como referencia de soporte cuando el contrato lo permita.

---

#### 32. Cause y errores encadenados

Cuando el runtime soporte causa:

1. la cadena técnica puede preservarse server-side;
2. la causa no se serializa completa hacia cliente por defecto;
3. una causa nativa no reemplaza el código contractual;
4. múltiples causas no autorizan a elegir arbitrariamente la primera;
5. la clasificación se realiza sobre la fuente y contrato relevantes;
6. el stack no forma parte del contrato público.

---

#### 33. Error desconocido o no mapeado

Un error no reconocido no se clasifica por semejanza textual.

Regla:

```text
UNKNOWN NATIVE FAILURE
→ FAIL CLOSED
→ INTERNAL / TECHNICAL UNDISCLOSED SEMANTICS
→ PROTECTED DIAGNOSTIC
→ NO BUSINESS GUESS
```

Si la operación puede haber producido efecto:

```text
UNKNOWN NATIVE FAILURE
+ UNCERTAIN MUTATION
→ resultado desconocido / reconciliación según contrato
```

Un nuevo código del proveedor debe provocar revisión del mapping, no adaptación silenciosa basada en mensajes.

---

#### 34. Versionado del mapping

Todo mapping entre fuente técnica y representación normalizada deberá ser reproducible.

Debe poder conocerse:

- proveedor;
- versión relevante;
- contrato;
- versión contractual;
- mapping aplicable;
- versión del mapping;
- comportamiento de redacción;
- política de retry;
- compatibilidad.

La identidad física de esa versión se asignará durante materialización; esta tarea no inventa un número de versión ni nombre de export.

Cambiar un mapping que altera comportamiento visible requiere clasificación de compatibilidad y pruebas de consumidores.

---

#### 35. Paridad entre runtimes

`SHELL-DB-004` define semántica runtime-neutral.

Para una misma falla contractual:

```text
server diagnostic
browser diagnostic
native diagnostic
```

pueden contener señales nativas distintas, pero deberán converger en la misma semántica normalizada cuando consuman el mismo contrato y mapping.

Reglas:

1. browser no recibe detalle server-only;
2. native no recibe credenciales o internals privilegiados;
3. server puede conservar diagnóstico adicional protegido;
4. la diferencia de runtime no cambia el código empresarial;
5. la separación física de factories y clientes pertenece a `SHELL-DB-005`.

---

#### 36. Compatibilidad con consumers

Una actualización del normalizador se clasifica junto con:

- versión de `@vento/supabase`;
- versión del SDK de Supabase;
- runtimes consumidores;
- contratos consumidos;
- mappings;
- errores/outcomes visibles;
- retryability;
- redacción;
- observabilidad.

Una modificación es incompatible si obliga al consumer a reinterpretar un outcome, cambia branching contractual o expone/retira una señal sin transición.

Compilar TypeScript no basta para declarar compatibilidad.

---

#### 37. Observabilidad

La normalización deberá permitir medir, sin ampliar exposición:

- volumen por familia técnica;
- outcome contractual cuando sea seguro;
- operación;
- runtime;
- retry;
- resultado desconocido;
- reconciliaciones;
- latency bucket o duración permitida;
- errores no mapeados;
- mapping version;
- correlación;
- degradaciones.

No se registran por defecto payloads completos, secrets, tokens, SQL ni PII innecesaria.

Métrica agregada no sustituye evidencia individual cuando el contrato exige trazabilidad.

---

#### 38. Pruebas futuras obligatorias

La futura implementación deberá cubrir, como mínimo:

1. preservación de un código contractual ya válido;
2. las once familias semánticas;
3. error técnico sin mapping;
4. código nativo desconocido;
5. ausencia de branching por `Error.message`;
6. SQLSTATE no expuesto;
7. constraint name no expuesto;
8. stack no expuesto;
9. SQL no expuesto;
10. 401/403 sin inferencia automática de reason code;
11. 404 sin filtración de existencia;
12. 409 sin inferencia automática de versión;
13. 429 sin inferencia automática de cuota empresarial;
14. query fallida que no se convierte en arreglo vacío;
15. command fallido que no se convierte en éxito;
16. timeout antes de certeza de despacho;
17. timeout después de despacho;
18. resultado desconocido;
19. retry permitido;
20. retry prohibido;
21. idempotency key preservada;
22. idempotency payload conflictivo;
23. expected version obsoleto;
24. deadlock/serialización/lock timeout con política bounded aprobada;
25. autenticación inválida;
26. autorización denegada;
27. autorización técnicamente no disponible;
28. resource not visible;
29. rate/capacity contractual frente a saturación técnica;
30. redacción de diagnóstico;
31. correlación;
32. cause protegida;
33. paridad server/browser/native;
34. consumer compatibility;
35. exclusión VITAL;
36. cero error-to-success silencioso.

Esta sección especifica cobertura posterior; no declara pruebas runtime ejecutadas.

---

#### 39. Frontera VITAL

VITAL permanece separado.

`SHELL-DB-004` no:

- absorbe códigos VITAL;
- crea mappings VITAL;
- traduce errores VITAL al catálogo de Vento OS;
- registra diagnósticos VITAL dentro de observabilidad ordinaria de Vento OS;
- expone internals VITAL;
- usa coexistencia física como autorización.

Una integración futura deberá usar contratos explícitos de la arquitectura propietaria de VITAL.

---

#### 40. Estado de materialización física

| Elemento                            | Estado                       |
| ----------------------------------- | ---------------------------- |
| separación diagnóstico/outcome/copy | `ESPECIFICADA`               |
| once familias semánticas            | `PRESERVADAS`                |
| preservación de código contractual  | `ESPECIFICADA`               |
| normalización de HTTP               | `ESPECIFICADA`               |
| normalización PostgreSQL/SQLSTATE   | `ESPECIFICADA`               |
| normalización PostgREST             | `ESPECIFICADA`               |
| frontera Auth                       | `ESPECIFICADA`               |
| frontera Storage/Realtime/Edge      | `ESPECIFICADA`               |
| red/timeout                         | `ESPECIFICADOS`              |
| resultado desconocido               | `ESPECIFICADO`               |
| retry/idempotencia                  | `ESPECIFICADOS` por contrato |
| concurrencia                        | `ESPECIFICADA` por contrato  |
| redacción                           | `ESPECIFICADA`               |
| diagnóstico protegido               | `ESPECIFICADO`               |
| correlación                         | `ESPECIFICADA`               |
| fallback cerrado                    | `ESPECIFICADO`               |
| versionado de mapping               | `ESPECIFICADO`               |
| paridad runtime                     | `ESPECIFICADA`               |
| VITAL                               | `EXCLUIDO`                   |
| normalizador físico                 | `NO MATERIALIZADO`           |
| interfaces TypeScript               | `NO ASIGNADAS`               |
| exports                             | `NO ASIGNADOS`               |
| versión npm                         | `NO ASIGNADA`                |
| consumers migrados                  | `0`                          |
| cambios Supabase                    | `0`                          |
| cambios de datos                    | `0`                          |
| requisitos creados                  | `0`                          |
| requisitos modificados              | `0`                          |

---

#### 41. Handoffs exactos

| Materia fuera de esta tarea                                             | Propietario exacto                                                  | Condición de salida                                 |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------- |
| separación física de cliente server, browser y native                   | `SHELL-DB-005`                                                      | factories, secretos y superficies runtime aislados  |
| códigos compartidos de autorización/contexto                            | `SHELL-CON-008`                                                     | vocabularios estáticos separados de códigos nativos |
| experiencia y copy de denegación/indisponibilidad                       | tareas `AUTH-ERR-*` propietarias                                    | mensaje público desde outcome estable               |
| generación/publicación incremental del package tras package DB aprobado | `AUTH-DB-026`                                                       | artefacto generado bajo gates y compatibilidad      |
| materialización física de `@vento/supabase`                             | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` | implementación únicamente para package autorizado   |
| pruebas del package y contract tests                                    | `SHELL-CI-001` y tareas CI aplicables                               | suite ejecutable y evidencia                        |
| compatibilidad de consumidores                                          | `SHELL-CI-005` y tareas de adopción aplicables                      | matriz real por consumer                            |
| seguridad `SECURITY DEFINER`                                            | `SUPA-ARC-014` y tareas BLOQUE R aplicables                         | gates y pruebas negativas                           |
| grants, RLS y exposición                                                | `SUPA-ARC-015` y tareas BLOQUE R aplicables                         | autoridad y mínimo privilegio verificados           |
| contratos de dominio y códigos empresariales                            | `SUPA-ARC-016` y tareas propietarias por dominio                    | machine codes y outcomes versionados                |
| coordinación multi-owner                                                | `SUPA-ARC-017` y tareas de transición aplicables                    | compensación, reconciliación y ownership definidos  |
| evolución conjunta de tipos, errores y consumers                        | `SUPA-TRANS-014`                                                    | cambio contractual sincronizado                     |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 42. Cobertura de prueba vigente no modificada

La conducta centralizada ya está protegida por requisitos canónicos vigentes que cubren, entre otros:

- códigos estables de error en RPC;
- prohibición de exponer SQLSTATE, stack, SQL, objetos físicos y secretos;
- correlación y señal de fallo segura;
- redacción de errores `SECURITY DEFINER`;
- minimización de secretos y payloads;
- outcomes, estado, versión y correlación;
- catálogo cerrado de errores machine-readable;
- distinción de validación, autenticación, autorización, inexistencia/no visibilidad, conflicto, idempotencia, invariantes, límites, dependencia, resultado desconocido e interno;
- bounded retry para deadlock, serialización, lock timeout y desconexión;
- tipos estables para outcome codes;
- responses discriminadas y versionadas;
- prohibición de lógica de consumer basada en mensajes humanos, SQLSTATE o stacks;
- compatibilidad, consumers y gates transversales.

`SHELL-DB-004` consolida esas obligaciones en la responsabilidad documental de normalización técnica de `@vento/supabase`; no crea un comportamiento verificable nuevo sin cobertura.

---

#### 43. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea centraliza dentro de `@vento/supabase` reglas ya aprobadas sobre errores machine-readable, redacción, preservación de outcomes, retry, resultado desconocido, concurrencia, idempotencia, correlación y separación frente a autorización y mensajes públicos. No introduce un nuevo código empresarial, una nueva familia de outcome, una nueva política de autorización, un nuevo mecanismo de retry, una nueva operación de datos ni un efecto runtime adicional.

---

#### 44. Decisiones vinculantes

1. `@vento/supabase` normaliza errores técnicos de acceso, no errores empresariales universales.
2. Diagnóstico nativo, normalización técnica, outcome contractual y mensaje público permanecen separados.
3. No se crea un `ErrorCode` universal.
4. `AuthorizationReasonCode` no absorbe SQLSTATE ni códigos nativos de Supabase.
5. Se preservan las once familias semánticas mínimas de E3.
6. Esta tarea no inventa literales públicos para esas once familias.
7. El código machine-readable concreto pertenece al contrato propietario.
8. Un outcome contractual válido tiene precedencia sobre el diagnóstico técnico.
9. HTTP status no decide semántica empresarial por sí solo.
10. SQLSTATE no es código empresarial público.
11. Nombres de constraints no son API.
12. `PGRST*` o códigos equivalentes permanecen metadata técnica salvo mapping aprobado.
13. Errores de Auth no se convierten automáticamente en reason codes de autorización.
14. Storage, Realtime y Edge conservan contratos propietarios.
15. `Error.message` no gobierna branching.
16. Stack trace no gobierna branching.
17. Texto humano del proveedor no gobierna branching.
18. Mapping técnico debe ser explícito y versionado.
19. Error desconocido utiliza fallback cerrado.
20. No se adivina un outcome empresarial ante código nuevo del proveedor.
21. Error no se convierte silenciosamente en `null`.
22. Error no se convierte silenciosamente en arreglo vacío.
23. Error no se convierte silenciosamente en `false`.
24. Error no se convierte silenciosamente en éxito.
25. Query fallida no aparenta cero resultados.
26. Command fallido no implica cero efectos.
27. Timeout después de despacho puede requerir resultado desconocido.
28. Resultado desconocido no equivale a fallo definitivo.
29. Resultado desconocido no equivale a éxito.
30. Retry requiere contrato.
31. Retry de un mismo intent conserva idempotency key cuando corresponda.
32. Idempotencia no se crea en el cliente.
33. Expected version no se elimina para facilitar retry.
34. No existe last-writer-wins implícito.
35. Deadlock, serialización y lock timeout siguen política bounded solo cuando está aprobada.
36. Rate limit contractual y saturación técnica permanecen distinguibles.
37. Fallo técnico de autorización no se presenta como denegación de política.
38. Resource not visible no revela existencia física.
39. Diagnóstico público se redacta.
40. Diagnóstico protegido puede conservar detalle adicional bajo autorización.
41. SQL no se expone.
42. `search_path` no se expone.
43. ACL, owner y roles PostgreSQL no se exponen.
44. Tokens, secretos y service-role no se exponen.
45. PII innecesaria no se registra ni expone.
46. Correlación no sustituye auditoría.
47. Correlación no sustituye idempotencia.
48. Cause técnica no sustituye código contractual.
49. El mapping debe ser determinista.
50. El mapping debe ser reproducible.
51. Cambiar semántica visible requiere clasificación de compatibilidad.
52. Paridad semántica debe mantenerse entre server, browser y native.
53. Detalle privilegiado server-side no fluye a browser/native.
54. La separación física de runtimes pertenece a `SHELL-DB-005`.
55. VITAL permanece separado.
56. La futura implementación debe probar redacción, fallback, retry y resultado desconocido.
57. No se crean interfaces TypeScript en esta tarea.
58. No se asignan exports.
59. No se asigna versión npm.
60. No se crea package físico.
61. No se modifica Supabase.
62. No se modifican datos.
63. No se crean ni modifican requisitos de prueba.
64. `SHELL-DB-005` queda únicamente reservada.

---

#### 45. Criterios de aceptación documental

`SHELL-DB-004` queda documentalmente satisfecha cuando:

1. existe una frontera única de normalización técnica;
2. no crea un catálogo empresarial universal;
3. separa cuatro capas semánticas;
4. preserva las once familias de E3;
5. preserva códigos contractuales emitidos;
6. prohíbe branching por mensajes humanos;
7. prohíbe SQLSTATE como código público;
8. prohíbe inferir negocio desde HTTP aislado;
9. define tratamiento PostgreSQL;
10. define tratamiento de constraints;
11. define tratamiento PostgREST;
12. conserva frontera Auth;
13. conserva frontera Storage/Realtime/Edge;
14. define fallo de red;
15. define timeout posterior a despacho;
16. conserva resultado desconocido;
17. diferencia query y command;
18. define relación con idempotencia;
19. define relación con retry;
20. define relación con concurrencia;
21. diferencia rate contractual de saturación técnica;
22. diferencia denegación de fallo técnico de autorización;
23. protege existencia de recursos no visibles;
24. prohíbe error-to-success;
25. materializa información lógica mínima;
26. define diagnóstico protegido;
27. define redacción;
28. define correlación;
29. define cause;
30. define fallback de errores desconocidos;
31. define versionado del mapping;
32. define paridad entre runtimes;
33. define compatibilidad de consumers;
34. define observabilidad segura;
35. define cobertura futura de pruebas;
36. excluye VITAL;
37. declara correctamente el estado no materializado;
38. asigna handoffs exactos;
39. no crea código;
40. no crea package físico;
41. no crea interfaces ni exports;
42. no modifica Supabase;
43. no modifica datos;
44. no crea ni modifica requisitos de prueba;
45. la siguiente tarea permanece únicamente reservada.

---

#### 46. Límites

`SHELL-DB-004` no:

- crea físicamente `@vento/supabase`;
- crea clases de error TypeScript;
- crea interfaces;
- crea enums;
- crea códigos empresariales;
- crea códigos de autorización;
- crea exports;
- asigna subpaths;
- asigna root físico;
- asigna versión npm;
- publica package;
- modifica wrappers;
- modifica tipos generados;
- ejecuta codegen;
- cambia `Database`;
- crea runtime validators;
- crea copy de UI;
- crea mensajes de bloqueo;
- cambia grants;
- cambia RLS;
- cambia `SECURITY DEFINER`;
- cambia `search_path`;
- crea RPC;
- modifica RPC;
- crea funciones PostgreSQL;
- crea triggers;
- modifica triggers;
- crea tablas;
- crea columnas;
- crea constraints;
- ejecuta DDL;
- ejecuta DML;
- ejecuta migraciones;
- ejecuta backfills;
- modifica datos;
- ejecuta mutaciones remotas;
- rota secretos;
- cambia Storage;
- cambia Realtime;
- despliega Edge Functions;
- modifica VITAL;
- desarrolla `SHELL-DB-005`.

---

#### 47. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas

##### TAREA ACTUAL APROBADA

SHELL-DB-004 — Normalizar errores de Supabase

##### SIGUIENTE TAREA RESERVADA

SHELL-DB-005 — Separar cliente server, browser y native


### [ ] SHELL-DB-005 — Separar cliente server, browser y native

Regla de sincronización con BLOQUE R

SHELL-DB-001, SHELL-DB-004 y SHELL-DB-005
→ pueden establecer la infraestructura inicial del paquete compartido

SHELL-DB-002 y SHELL-DB-003
→ se ejecutan incrementalmente con AUTH-DB-026
→ se actualizan después de cada paquete contractual del BLOQUE R
→ no se consideran terminadas hasta completar la certificación final
