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


### [ ] SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas
### [ ] SHELL-DB-004 — Normalizar errores de Supabase
### [ ] SHELL-DB-005 — Separar cliente server, browser y native

Regla de sincronización con BLOQUE R

SHELL-DB-001, SHELL-DB-004 y SHELL-DB-005
→ pueden establecer la infraestructura inicial del paquete compartido

SHELL-DB-002 y SHELL-DB-003
→ se ejecutan incrementalmente con AUTH-DB-026
→ se actualizan después de cada paquete contractual del BLOQUE R
→ no se consideran terminadas hasta completar la certificación final
