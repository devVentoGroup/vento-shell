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


### [ ] SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado
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
