### MINI-BLOQUE — NORMALIZACIÓN COMPARTIDA

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **normalización compartida** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-NORM-001` a `SHELL-NORM-009` — 9 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear `@vento/data-normalization`” y concluye con “Probar idempotencia y conservación semántica”.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-NORM-001 — Crear `@vento/data-normalization`

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación
**Tarea siguiente:** SHELL-NORM-002 — Centralizar tipos de campo normalizable
**Tipo de tarea:** Documental; definición de la identidad, responsabilidad, fronteras arquitectónicas, invariantes de pureza, determinismo, versionado y adopción del paquete compartido `@vento/data-normalization`, preservando el gobierno aprobado de normalización de BLOQUE E3 y sin materializar código, package físico, catálogos, algoritmos, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-001` establece la identidad y la frontera canónica del paquete compartido `@vento/data-normalization` para que las aplicaciones, servicios, procesos y capas autorizadas de Vento OS puedan converger sobre una misma implementación de normalización sin copiar reglas, diccionarios, excepciones, clasificadores o helpers locales.

La tarea parte del gobierno ya aprobado en BLOQUE E3 y no lo sustituye. Su función es trasladar esa semántica a una unidad distributiva compartida con límites explícitos:

```text
GOBIERNO CANÓNICO DE NORMALIZACIÓN EN E3
        ↓
CONTRATO DEL PAQUETE COMPARTIDO
        ↓
@vento/data-normalization
        ↓
IMPLEMENTACIÓN FÍSICA FUTURA BAJO GATES APROBADOS
```

La regla central es:

```text
@vento/data-normalization
=
FUNCIÓN COMPARTIDA DE EVALUACIÓN SEMÁNTICA
+
TIPOS COMPARTIDOS
+
REGLAS Y CATÁLOGOS VERSIONADOS
+
VALIDADORES COMPARTIDOS
+
RESULTADOS DETERMINISTAS Y REPRODUCIBLES
```

sin convertirse en:

```text
FUENTE DE VERDAD EMPRESARIAL
MOTOR DE PERSISTENCIA
FRONTERA DE AUTORIZACIÓN
RPC TRANSACCIONAL
TRIGGER DE BASE DE DATOS
CLIENTE SUPABASE
SERVICIO DE RED
SISTEMA DE IDENTIDAD O FUSIÓN DE REGISTROS
COLA DE REVISIÓN HUMANA
REGISTRY DE PACKAGES
```

---

#### 2. Resultado canónico

Queda definida documentalmente una nueva familia de paquete compartido denominada:

```text
@vento/data-normalization
```

con las siguientes decisiones vinculantes:

1. el package pertenece a la fundación compartida gobernada desde `vento-shell`;
2. su responsabilidad es alojar funciones puras, tipos, diccionarios y validadores compartidos de normalización conforme al gobierno canónico aprobado;
3. no constituye una segunda fuente de políticas frente a `DATA-NORM-ARC-001..012`;
4. no selecciona políticas por inferencia desde tipo SQL, schema, tabla, nombre de columna, aplicación consumidora o contenido heurístico;
5. no posee autoridad para persistir, confirmar, fusionar, desactivar, reasignar ni eliminar registros;
6. no posee autoridad empresarial sobre los datos que evalúa;
7. no posee autoridad de autenticación o autorización;
8. no accede por sí mismo a Supabase, proveedores externos, secret stores, filesystem, navegador, red ni variables runtime para decidir semántica;
9. todo comportamiento material deberá ser determinista para las mismas entradas, contexto y versiones explícitas;
10. las reglas específicas del paquete se incorporarán exclusivamente mediante `SHELL-NORM-002..009` y sus fuentes propietarias;
11. la distribución física heredará la política vigente de packages compartidos de `SHELL-PKG-001..008`;
12. esta tarea no crea `package.json`, archivos fuente, exports, versión publicada, tag, release, artefacto `.tgz`, registry ni consumidor físico;
13. no se asigna en esta tarea ningún `package_id` de implementación;
14. el estado físico permanece `NO MATERIALIZADO`.

---

#### 3. Fuentes y precedencia

`SHELL-NORM-001` conserva la siguiente precedencia:

| Fuente                     | Autoridad preservada                                                                                                          |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `DATA-NORM-AUD-001..007`   | evidencia del universo textual, reglas existentes, inconsistencias, colisiones, productores, consumidores e impacto observado |
| `DATA-NORM-ARC-001`        | política por dominio, entidad, campo, representación, fuente y versión; precedencia restrictiva y comportamiento cerrado      |
| `DATA-NORM-ARC-002`        | clasificación semántica, rol de representación, rol de fuente y tratamiento efectivo restrictivo                              |
| `DATA-NORM-ARC-003`        | capitalización empresarial cuando corresponda                                                                                 |
| `DATA-NORM-ARC-004`        | conectores y comportamiento posicional                                                                                        |
| `DATA-NORM-ARC-005`        | excepciones oficiales, marcas, siglas, unidades y nombres legales                                                             |
| `DATA-NORM-ARC-006`        | diccionario ortográfico canónico y gobierno de sus entradas                                                                   |
| `DATA-NORM-ARC-007`        | revisión humana de resultados ambiguos o conflictivos                                                                         |
| `DATA-NORM-ARC-008`        | representaciones de búsqueda y comparación                                                                                    |
| `DATA-NORM-ARC-009`        | versionado, auditoría, determinismo, idempotencia y reproducibilidad                                                          |
| `DATA-NORM-ARC-010`        | identidad, unicidad, colisiones y prohibición de fusionar por coincidencia normalizada                                        |
| `DATA-NORM-ARC-011`        | arquitectura de cuatro capas, servicio semántico, RPC transaccional y trigger defensivo                                       |
| `DATA-NORM-ARC-012`        | preservación y tratamiento de datos recibidos desde integraciones                                                             |
| `DATA-NORM-TRANS-001..009` | baseline, dry-run, colisiones, resolución, backfill, activación, validación, rollback y evidencia de transición               |
| `SHELL-PKG-001..008`       | distribución privada, SemVer, tags, compatibilidad, deprecación, rollback, actualización por PR y gates de adopción           |
| `SHELL-NORM-002..009`      | especialización progresiva de tipos, reglas, catálogos, búsqueda, preview, metadatos y pruebas del package                    |

Precedencia normativa:

```text
DOMINIO / ENTIDAD / CAMPO / REPRESENTACIÓN / FUENTE / VERSIÓN
        ↓
POLÍTICA CANÓNICA DATA-NORM-ARC
        ↓
CONTRATO COMPARTIDO @vento/data-normalization
        ↓
EVALUACIÓN PURA Y REPRODUCIBLE
        ↓
CAPA PROPIETARIA QUE DECIDE SI SOLO PREVISUALIZA O SOLICITA UNA MUTACIÓN
        ↓
RPC TRANSACCIONAL CUANDO EXISTA ESCRITURA AUTORIZADA
```

El package no invierte esa precedencia y no puede convertir una utilidad técnica en autoridad semántica superior a la política propietaria.

---

#### 4. Frontera exacta de la tarea

La tarea incluye únicamente:

- nombre e identidad lógica del package;
- ubicación conceptual dentro de la fundación compartida;
- responsabilidad funcional de alto nivel;
- relación con el gobierno canónico E3;
- invariantes de pureza y determinismo;
- restricciones de side effects y dependencias runtime;
- relación con las cuatro capas de ejecución de normalización;
- separación entre evaluación, preview y commit;
- separación frente a identidad, unicidad, fusión y persistencia;
- fronteras de datos externos y VITAL;
- gobierno de versión y compatibilidad heredado;
- handoff completo hacia `SHELL-NORM-002..009`;
- condiciones exactas para futura materialización física.

La tarea no incluye:

- definir el catálogo de tipos de campo normalizable;
- definir algoritmos concretos de espacios, Unicode o capitalización;
- materializar el catálogo de conectores;
- materializar excepciones oficiales;
- materializar el diccionario ortográfico;
- definir algoritmos físicos de búsqueda o comparación;
- implementar preview;
- definir físicamente metadata de auditoría o versionado;
- implementar corpus o tests;
- crear funciones SQL;
- crear columnas de búsqueda;
- ejecutar dry-runs físicos;
- ejecutar backfills;
- crear constraints o índices;
- crear triggers;
- crear `package.json`, archivos TypeScript o exports;
- seleccionar registry o credenciales de registry;
- publicar una versión;
- instalar el package en consumidores;
- modificar Supabase.

Esas responsabilidades permanecen en las tareas propietarias posteriores.

---

#### 5. Identidad del package

La identidad canónica es exactamente:

```text
@vento/data-normalization
```

Reglas:

1. el nombre no se abrevia ni se sustituye por un helper genérico local;
2. un archivo `normalize.ts`, `utils.ts`, `text.ts`, función SQL, trigger o helper de aplicación no constituye por sí mismo el package;
3. una copia local de reglas no adquiere autoridad por tener la misma salida observada;
4. un consumidor no podrá publicar otra implementación bajo el mismo nombre ni mantener una semántica divergente con el mismo contrato;
5. la identidad del package es distinta de la versión de las políticas y catálogos que pueda contener;
6. la identidad del package es distinta de un `package_id` de implementación E5;
7. esta tarea no define aún una versión física de npm ni un tag Git;
8. esta tarea no afirma que el package ya exista dentro de `packages/*`.

---

#### 6. Relación con las familias de packages compartidos existentes

`@vento/data-normalization` se incorpora como una familia adicional de package compartido bajo la política general ya aprobada para distribución desde `vento-shell`.

La enumeración histórica inicial de packages compartidos no se interpreta como un catálogo cerrado: `SHELL-NORM-001` agrega esta responsabilidad específica sin modificar la identidad ni el ownership de:

- `@vento/contracts`;
- `@vento/os-context`;
- `@vento/supabase`;
- `@vento/ui-web`.

Separación obligatoria:

```text
@vento/contracts
→ contratos estáticos y vocabularios compartidos de sus tareas propietarias

@vento/data-normalization
→ evaluación y utilidades semánticas compartidas de normalización

@vento/supabase
→ acceso compartido a Supabase y wrappers de datos cuando sus tareas los materialicen

@vento/os-context
→ contexto y autorización compartidos

@vento/ui-web
→ componentes e infraestructura visual compartida
```

`SHELL-NORM-001` no fija dependencias físicas entre esas familias. La futura implementación deberá conservar las fronteras de responsabilidad y evitar ciclos o importaciones que transfieran autoridad entre packages.

---

#### 7. Contenido permitido del package

La regla propietaria del mini-bloque permite cuatro familias de contenido:

1. **funciones puras**;
2. **tipos compartidos**;
3. **diccionarios y catálogos versionados**;
4. **validadores compartidos**.

Su incorporación material queda escalonada:

| Familia de contenido                             | Estado en esta tarea       | Propietario de especialización |
| ------------------------------------------------ | -------------------------- | ------------------------------ |
| identidad y envelope del package                 | `DEFINIDO_DOCUMENTALMENTE` | `SHELL-NORM-001`               |
| tipos de campo normalizable                      | `RESERVADO`                | `SHELL-NORM-002`               |
| espacios, Unicode y capitalización               | `RESERVADO`                | `SHELL-NORM-003`               |
| conectores y excepciones                         | `RESERVADO`                | `SHELL-NORM-004`               |
| diccionarios ortográficos versionados            | `RESERVADO`                | `SHELL-NORM-005`               |
| búsqueda y comparación                           | `RESERVADO`                | `SHELL-NORM-006`               |
| previsualización de transformaciones             | `RESERVADO`                | `SHELL-NORM-007`               |
| metadatos de versión y auditoría                 | `RESERVADO`                | `SHELL-NORM-008`               |
| pruebas de idempotencia y conservación semántica | `RESERVADO`                | `SHELL-NORM-009`               |

`RESERVADO` significa que esta tarea reconoce el destino exacto pero no anticipa su API, algoritmo, catálogo ni implementación.

---

#### 8. Contrato de pureza

Toda función de evaluación que llegue a formar parte del package deberá cumplir simultáneamente:

1. mismo input lógico + mismo contexto explícito + mismo conjunto de versiones → mismo resultado lógico;
2. no modificar los objetos de entrada propiedad del caller;
3. no persistir datos;
4. no ejecutar DDL, DML, RPC o consultas;
5. no hacer requests de red;
6. no leer secretos;
7. no decidir a partir de variables de entorno implícitas;
8. no depender de la hora actual si esa hora no forma parte explícita del contexto;
9. no depender de aleatoriedad;
10. no depender del locale del sistema operativo, navegador, proceso o base de datos de forma implícita;
11. no depender del orden físico de registros, catálogos o propiedades cuando ese orden no sea parte del contrato;
12. no usar un caché mutable como fuente de verdad semántica;
13. no escribir logs como sustituto de un resultado contractual o de la auditoría propietaria;
14. no producir un efecto empresarial por el simple hecho de evaluar una transformación;
15. conservar comportamiento cerrado cuando falte contexto o versión obligatorios.

La pureza se refiere al motor compartido. No elimina las responsabilidades transaccionales, de autorización y auditoría de las capas que consuman su resultado.

---

#### 9. Determinismo y dependencias explícitas

El package deberá tratar como entradas explícitas todas las dimensiones capaces de cambiar el resultado semántico, cuando apliquen, entre ellas:

- coordenada de política;
- clase semántica;
- rol de representación;
- rol de fuente;
- locale o perfil lingüístico;
- versión de política;
- versiones de catálogos o diccionarios;
- estado o vigencia de la regla cuando forme parte de la decisión;
- contexto estructurado requerido por la operación;
- fuente observada o su versión cuando sea necesaria para revalidación.

Queda prohibido resolver silenciosamente:

```text
latest
locale local
timezone local
versión local del consumidor
primer resultado disponible
catálogo privado de la aplicación
fallback legacy no declarado
```

Si el contrato requiere una dimensión y esta no es resoluble, la salida debe conservar el valor y producir el estado bloqueante o de revisión definido por la política especializada, no inventar un fallback.

---

#### 10. Posición dentro de la arquitectura de cuatro capas

El package se alinea con el modelo aprobado:

```text
APPLICATION_INTERACTION_LAYER
        ↓
DOMAIN_NORMALIZATION_SERVICE
        ↓
TRANSACTIONAL_RPC_BOUNDARY
        ↓
DEFENSIVE_DATABASE_TRIGGER
```

Su papel principal se encuentra en la evaluación semántica reutilizable por `DOMAIN_NORMALIZATION_SERVICE` y en contratos estáticos que permitan paridad entre las capas autorizadas.

Invariantes:

1. `APPLICATION_INTERACTION_LAYER` puede solicitar o mostrar una evaluación, pero no se convierte en autoridad por importar el package;
2. `DOMAIN_NORMALIZATION_SERVICE` conserva la autoridad semántica canónica y usa reglas versionadas de manera determinista;
3. `TRANSACTIONAL_RPC_BOUNDARY` conserva autenticación, autorización, idempotencia, concurrencia, revalidación y commit;
4. `DEFENSIVE_DATABASE_TRIGGER` conserva únicamente su función defensiva final;
5. importar `@vento/data-normalization` en una capa no transfiere a esa capa las autoridades que no posee;
6. el package no ejecuta la transición entre capas;
7. el package no sustituye el contrato transaccional de una mutación.

---

#### 11. Evaluación y commit permanecen separados

Una evaluación del package puede producir una representación candidata, una decisión, una clasificación, un bloqueo o un diagnóstico según los contratos especializados.

Nunca equivale automáticamente a:

```text
EVALUACIÓN = ESCRITURA
EVALUACIÓN = COMMIT
EVALUACIÓN = AUTORIZACIÓN
EVALUACIÓN = APROBACIÓN HUMANA
EVALUACIÓN = FUSIÓN DE IDENTIDAD
```

Secuencia para una futura escritura gobernada:

```text
INPUT + CONTEXTO + VERSIONES
        ↓
EVALUACIÓN SEMÁNTICA
        ↓
RESULTADO O PREVIEW
        ↓
COMANDO AUTORIZADO
        ↓
REEVALUACIÓN / REVALIDACIÓN TRANSACCIONAL
        ↓
COMMIT O RECHAZO
```

Una previsualización anterior no congela el resultado de una futura mutación. La capa transaccional deberá revalidar fuente, política, versiones, unicidad, estado y autoridad aplicables antes de confirmar.

---

#### 12. Frontera frente a políticas y catálogos

`@vento/data-normalization` distribuye y ejecuta semántica aprobada; no crea política por observación.

Queda prohibido que el package:

- derive políticas desde frecuencia de datos;
- agregue conectores porque aparezcan repetidamente;
- agregue diccionario por similitud ortográfica;
- cree aliases por normalización de caja o signos;
- adopte una marca como forma oficial por mayoría de registros;
- infiera autoridad desde el schema o aplicación que llama;
- amplíe un scope por compatibilidad técnica;
- reactive reglas suspendidas o retiradas como fallback;
- adopte configuración local del consumidor como catálogo global.

Todo catálogo ejecutable deberá poseer autoridad, versión, alcance y estado definidos por su tarea propietaria.

---

#### 13. Frontera frente a identidad, unicidad y consolidación

La normalización no constituye identidad.

Por tanto:

```text
VALOR NORMALIZADO IGUAL
≠ MISMA ENTIDAD

CLAVE DE BÚSQUEDA IGUAL
≠ DUPLICADO CONFIRMADO

FORMA ORTOGRÁFICA IGUAL
≠ AUTORIZACIÓN DE FUSIÓN
```

El package puede producir candidatos, representaciones o señales cuando las tareas especializadas lo autoricen, pero no puede:

- seleccionar un registro sobreviviente;
- fusionar registros;
- desactivar registros;
- reasignar relaciones;
- cambiar claves empresariales;
- activar constraints;
- declarar duplicidad confirmada;
- convertir fuzzy matching en identidad;
- sustituir identificadores estables por texto normalizado.

La autoridad sobre identidad, unicidad y resolución estructural permanece en los contratos de `DATA-NORM-ARC-010` y en las capas propietarias de datos.

---

#### 14. Separación de representaciones

El package deberá preservar la distinción entre representaciones aprobadas, incluyendo cuando apliquen:

```text
VALOR MOSTRADO
VALOR DE BÚSQUEDA
VALOR EXTERNO ORIGINAL
IDENTIFICADOR TÉCNICO
TEXTO LIBRE
SNAPSHOT PERSISTIDO
PROYECCIÓN DE SALIDA
ESTRUCTURA TEXTUAL COMPUESTA
```

Reglas:

1. una representación de búsqueda no sobrescribe la mostrada;
2. una proyección no retroalimenta la fuente por sí sola;
3. un snapshot histórico no se reinterpreta automáticamente con una versión nueva;
4. un identificador técnico no recibe normalización comercial salvo contrato técnico explícito;
5. texto libre no hereda correcciones destructivas genéricas;
6. una estructura compuesta se evalúa por componente y contrato;
7. una copia sincronizada no adquiere autoridad sobre la fuente;
8. la igualdad entre representaciones derivadas no crea identidad.

---

#### 15. Datos externos y preservación del original

Cuando el caller trate datos recibidos desde integraciones, imports o proveedores:

1. el original y su procedencia se preservan conforme al contrato de entrada;
2. `@vento/data-normalization` no modifica la evidencia fuente para simplificar procesamiento;
3. una representación interna derivada se mantiene separada del original cuando corresponda;
4. autenticidad, contrato, mapping y autoridad se resuelven en sus capas propietarias;
5. el package no usa una transformación para reparar una identidad externa ambigua;
6. códigos, tokens, IDs, firmas, hashes, números de proveedor y referencias externas conservan su contrato técnico;
7. un dato externo no clasificado se preserva y bloquea mutación automática;
8. secretos y material de autenticación no son entrada elegible para corrección lingüística.

Esta frontera conserva compatibilidad con los contratos `SHELL-CON-017..024` sin convertir el package en adaptador de integración.

---

#### 16. Frontera VITAL

VITAL permanece como producto separado de Vento OS para las políticas transversales de normalización auditadas en E3.

Por tanto:

1. instalar o importar el package no autoriza aplicar políticas Vento OS a VITAL;
2. una función genérica no convierte automáticamente una política Vento en política VITAL;
3. catálogos, diccionarios, excepciones o reglas Vento no se comparten con VITAL por proximidad física de datos;
4. cualquier integración futura con VITAL requiere contrato explícito de frontera, fuente, finalidad y tratamiento;
5. los corpus de conformidad deberán demostrar la no aplicación transversal cuando corresponda.

---

#### 17. Frontera de seguridad y privacidad

El package no debe requerir ni transportar para su semántica ordinaria:

- API keys;
- service-role keys;
- passwords;
- access tokens;
- refresh tokens;
- private keys;
- certificados privados;
- firmas reutilizables;
- credenciales de registry;
- cookies de sesión;
- secretos de proveedores.

Cuando una evaluación involucre datos sensibles, la representación contractual deberá minimizar lo necesario y permitir referencias protegidas en vez de duplicar evidencia completa cuando la política propietaria así lo exija.

El package no concede acceso adicional por el hecho de estar instalado.

---

#### 18. Errores, bloqueos y resultados

`SHELL-NORM-001` no crea un enum de resultados nuevo.

Las tareas E3 ya distinguen cambios aplicados, preservación, derivación, no aplicabilidad, bloqueo, conflicto, revisión, escalamiento estructural y fallo técnico. Las tareas `SHELL-NORM-002..009` deberán reutilizar o proyectar esa semántica sin colapsarla en un booleano universal como:

```text
true = normalizado
false = error
```

Reglas:

1. ausencia de cambio no equivale siempre a éxito;
2. preservación no equivale a fallo;
3. bloqueo de política no equivale a error técnico;
4. conflicto no equivale a revisión ordinaria;
5. revisión requerida no equivale a corrección automática;
6. fallo técnico no autoriza un fallback semántico permisivo;
7. una capa consumidora no puede reinterpretar localmente el resultado para ampliar operaciones.

---

#### 19. Versionado del package y versionado de reglas

Se mantienen dos planos distintos:

```text
VERSIÓN DEL PACKAGE
≠
VERSIÓN DE POLÍTICA / CATÁLOGO / DICCIONARIO
```

Reglas:

1. `@vento/data-normalization` heredará SemVer independiente conforme a `SHELL-PKG-002`;
2. una versión publicada será inmutable conforme a la política de packages;
3. esta tarea no declara una versión npm publicada;
4. cambiar código sin cambiar semántica se clasificará conforme a la política SemVer aplicable;
5. cambiar una regla, catálogo o contrato puede exigir nueva versión de ese artefacto y, cuando altere el package publicado, una release compatible del package;
6. una versión nueva del package no autoriza usar automáticamente la versión más reciente de una regla;
7. evaluaciones reproducibles deberán conservar el conjunto efectivo de versiones que determinó su resultado;
8. rollback de package y rollback lógico de reglas son operaciones distintas;
9. consumidores usarán la política exacta de versiones y compatibilidad definida por `SHELL-PKG-001..008` y BLOQUE T.

---

#### 20. Compatibilidad y adopción

La futura adopción deberá impedir que dos consumidores obtengan resultados semánticos diferentes para la misma entrada, contexto y versiones aprobadas.

Antes de adopción física deberán existir, como mínimo:

- pruebas propias del package;
- build independiente;
- release versionado;
- matriz de compatibilidad;
- actualización controlada de consumidores;
- evidencia de paridad para los contratos que cada consumidor utilice;
- rollback independiente;
- ausencia de nuevas copias legacy no autorizadas.

La existencia de `@vento/data-normalization` no obliga a una actualización simultánea de todos los repositorios. Cada adopción conserva su versión exacta, evidencia y rollback.

---

#### 21. Dependencias runtime prohibidas por responsabilidad

La implementación futura no podrá depender como requisito semántico del motor de evaluación de:

- cliente Supabase;
- React o componentes de interfaz;
- Next.js runtime;
- almacenamiento local del navegador;
- cookies de sesión;
- secreto o variable de entorno no declarada como input contractual;
- llamada HTTP;
- reloj global;
- aleatoriedad;
- filesystem mutable;
- estado global del consumidor;
- configuración privada de una aplicación que amplíe la política canónica.

Esta prohibición no impide que una aplicación o servicio consumidor use esas tecnologías alrededor del package. Impide que ellas se conviertan en fuente implícita de la decisión semántica compartida.

---

#### 22. Relación con persistencia y BLOQUE R

El package no materializa persistencia.

Las responsabilidades físicas de normalización en base de datos permanecen exactamente en:

| Tarea              | Responsabilidad física reservada                                 |
| ------------------ | ---------------------------------------------------------------- |
| `DATA-NORM-DB-001` | implementar almacenamiento de versiones de reglas y diccionarios |
| `DATA-NORM-DB-002` | implementar funciones SQL deterministas cuando sean necesarias   |
| `DATA-NORM-DB-003` | implementar columnas o expresiones normalizadas de búsqueda      |
| `DATA-NORM-DB-004` | ejecutar dry-runs y reportes de colisiones                       |
| `DATA-NORM-DB-005` | ejecutar backfills aprobados por dominio                         |
| `DATA-NORM-DB-006` | implementar constraints después de reconciliar datos             |
| `DATA-NORM-DB-007` | implementar índices de búsqueda y unicidad normalizada           |
| `DATA-NORM-DB-008` | implementar triggers únicamente como barrera defensiva final     |
| `DATA-NORM-DB-009` | registrar valor previo, valor resultante y versión de regla      |
| `DATA-NORM-DB-010` | probar idempotencia, rollback y ausencia de cambios semánticos   |

El package compartido no reemplaza ninguna de estas tareas y ninguna de estas tareas podrá redefinir semántica distinta de la aprobada por el gobierno E3 y la familia `SHELL-NORM`.

---

#### 23. Materialización física y gates exactos

En el corte actual:

```text
@vento/data-normalization
→ definido documentalmente por SHELL-NORM-001
→ package físico inexistente en esta tarea
→ versión publicada inexistente en esta tarea
→ consumidores migrados = 0 por esta tarea
→ cambios Supabase = 0
```

La implementación física queda sujeta al flujo canónico por package:

```text
DELIV-PKG-001..025::<package_id>
        ↓
READY-GATE-001..015
        ↓
CUTOVER-OPS-001..010
        ↓
HYPERCARE-OPS-001..010
        ↓
SHELL-CI-001..019
        ↓
E5-GATE-001..007::<package_id>
        ↓
E5-GATE-008::<package_id>
        ↓
SHELL-CI-020::<package_id>
        ↓
DATA-NORM-DB-001..010, únicamente si el alcance del mismo package incluye implementación física de normalización
        ↓
SHELL-CI-021::<package_id>
        ↓
SHELL-CI-022::<package_id>
        ↓
SHELL-CI-023::<package_id>
        ↓
SHELL-CI-024::<package_id>
```

`SHELL-NORM-001` no crea ni selecciona ese `package_id` y no abre ninguna de esas puertas.

---

#### 24. Handoffs exactos dentro de `SHELL-NORM`

| Trabajo                               | Propietario exacto | Condición de salida                                                                             |
| ------------------------------------- | ------------------ | ----------------------------------------------------------------------------------------------- |
| tipos de campo normalizable           | `SHELL-NORM-002`   | tipos compartidos alineados con clasificación semántica, representación y fuente aprobadas      |
| espacios, Unicode y capitalización    | `SHELL-NORM-003`   | reglas deterministas delimitadas sin Title Case universal ni corrección ortográfica implícita   |
| conectores y excepciones              | `SHELL-NORM-004`   | catálogos y precedencia coherentes con E3, sin extensiones locales no versionadas               |
| diccionarios ortográficos             | `SHELL-NORM-005`   | entradas cerradas, versionadas, direccionales y gobernadas                                      |
| búsqueda y comparación                | `SHELL-NORM-006`   | derivaciones separadas de identidad, unicidad y valor mostrado                                  |
| previsualización                      | `SHELL-NORM-007`   | preview reproducible y no vinculante, con divergencia revalidable antes de commit               |
| metadatos de versión y auditoría      | `SHELL-NORM-008`   | resultados atribuibles a versiones, contexto y evidencia sin convertir logs en fuente de verdad |
| idempotencia y conservación semántica | `SHELL-NORM-009`   | corpus y pruebas demuestran repetición estable, paridad y ausencia de degradación semántica     |

No se adelanta el contenido sustantivo de estas ocho tareas.

---

#### 25. Handoffs exactos fuera de `SHELL-NORM`

| Trabajo posterior                                | Propietario exacto           | Regla                                                                                |
| ------------------------------------------------ | ---------------------------- | ------------------------------------------------------------------------------------ |
| pruebas propias de packages compartidos          | `SHELL-CI-001`               | demostrar contrato y regresión antes de release                                      |
| build independiente                              | `SHELL-CI-002`               | producir artefacto reproducible del package autorizado                               |
| release versionado                               | `SHELL-CI-003`               | publicar únicamente tras gates aplicables                                            |
| matriz de compatibilidad                         | `SHELL-CI-005`               | verificar versiones soportadas y consumidores                                        |
| actualización de consumidores mediante PR        | `SHELL-CI-006`               | adopción controlada sin mutación directa de repositorios consumidores                |
| implementación y despliegue del package aprobado | `SHELL-CI-020::<package_id>` | solo después de `E5-GATE-008::<package_id>`                                          |
| readiness del package                            | `SHELL-CI-021::<package_id>` | ejecutar checklist aprobado                                                          |
| cutover y piloto                                 | `SHELL-CI-022::<package_id>` | aplicar el plan de rollout del mismo package                                         |
| hypercare y estabilización                       | `SHELL-CI-023::<package_id>` | conciliar resultados y estabilizar                                                   |
| cierre y transferencia                           | `SHELL-CI-024::<package_id>` | certificar cierre del package                                                        |
| persistencia y enforcement de normalización      | `DATA-NORM-DB-001..010`      | ejecutar únicamente dentro del package autorizado cuando el alcance incluya BLOQUE R |

---

#### 26. Cobertura de prueba vigente no modificada

La obligación que `SHELL-NORM-001` centraliza ya está protegida por requisitos vigentes, entre ellos:

- `TREQ-SHELL-002`, sobre implementación compartida y paridad frente a copias manuales;
- `TREQ-SHELL-006`, sobre pruebas propias y matriz de compatibilidad de packages antes de publicación o adopción;
- `TREQ-SHELL-007`, sobre rollback independiente;
- `TREQ-DATA-006`, sobre resolución exacta de política por coordenada;
- `TREQ-DATA-007`, sobre precedencia restrictiva y fallo cerrado;
- `TREQ-DATA-008`, sobre prohibición de Title Case universal;
- `TREQ-DATA-014`, sobre separación de representaciones;
- `TREQ-DATA-015`, sobre separación de niveles de decisión;
- `TREQ-DATA-016`, sobre idempotencia para la misma versión y contexto;
- `TREQ-DATA-018`, sobre clase semántica, representación y fuente;
- `TREQ-DATA-020`, sobre intersección restrictiva del tratamiento efectivo;
- `TREQ-DATA-021`, sobre modos cerrados y ausencia de permiso implícito;
- `TREQ-DATA-158`, sobre eliminación de dependencias implícitas no deterministas;
- `TREQ-DATA-191`, sobre la arquitectura exacta de cuatro capas;
- `TREQ-DATA-192`, sobre los límites de autoridad de la aplicación;
- `TREQ-DATA-193`, sobre autoridad semántica, determinismo e idempotencia del servicio de dominio;
- `TREQ-DATA-194`, sobre la frontera transaccional para mutaciones;
- `TREQ-DATA-195`, sobre el alcance defensivo del trigger;
- `TREQ-DATA-199`, sobre conjunto de versiones fijo y ausencia de `latest` implícito;
- `TREQ-DATA-201`, sobre preview no vinculante y reevaluación antes de persistir;
- `TREQ-DATA-203`, sobre colocación de normalización determinista;
- `TREQ-DATA-204`, sobre reglas léxicas y versiones fijadas;
- `TREQ-DATA-205`, sobre autoridad servidor en búsqueda.

La tarea no amplía esas obligaciones; define la unidad compartida que deberá implementarlas cuando sus tareas especializadas y gates físicos lo autoricen.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-NORM-001` define la identidad y frontera documental de un package compartido cuya pureza, determinismo, versionado, separación de representaciones, arquitectura por capas, paridad, idempotencia y adopción ya están protegidos por requisitos canónicos vigentes. No introduce un algoritmo nuevo, una regla lingüística nueva, un catálogo nuevo, un comportamiento de búsqueda nuevo, una persistencia, una autorización, una operación empresarial, una migración ni un cambio Supabase. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 28. Estado de materialización

Al cierre documental de esta tarea:

| Elemento                                   | Estado                        |
| ------------------------------------------ | ----------------------------- |
| identidad `@vento/data-normalization`      | definida                      |
| responsabilidad del package                | definida                      |
| frontera frente a E3                       | definida                      |
| pureza y determinismo                      | definidos como invariantes    |
| relación con cuatro capas                  | definida                      |
| separación evaluación / commit             | definida                      |
| frontera frente a identidad y fusión       | definida                      |
| frontera VITAL                             | definida                      |
| package físico                             | no materializado              |
| `package.json` del package                 | no creado                     |
| archivos TypeScript                        | no creados                    |
| exports físicos                            | no creados                    |
| versión npm                                | no publicada                  |
| tag Git                                    | no creado por esta tarea      |
| release                                    | no creado por esta tarea      |
| registry                                   | no configurado por esta tarea |
| consumidores migrados                      | 0 por esta tarea              |
| cambios Supabase                           | 0                             |
| requisitos de prueba creados o modificados | 0                             |

---

#### 29. Decisiones vinculantes

1. El package compartido se denomina exactamente `@vento/data-normalization`.
2. Su repositorio propietario es `devVentoGroup/vento-shell`.
3. Su propósito es centralizar funciones puras, tipos, diccionarios y validadores compartidos de normalización.
4. El package consume el gobierno aprobado de `DATA-NORM-ARC-001..012`; no lo reemplaza.
5. La política se resuelve por contexto explícito y nunca por schema, tipo SQL, tabla, nombre de campo o aplicación consumidora como sustitutos.
6. El package no define una política global de Title Case.
7. El package no usa coincidencia normalizada como identidad.
8. El package no fusiona registros.
9. El package no confirma duplicados empresariales.
10. El package no persiste datos.
11. El package no ejecuta RPC.
12. El package no accede a Supabase como parte de la decisión semántica.
13. El package no realiza I/O de red para resolver reglas.
14. El package no lee secretos.
15. El package no depende de locale implícito.
16. El package no depende de hora actual implícita.
17. El package no depende de aleatoriedad.
18. El package no usa `latest` implícito para reglas o catálogos.
19. Las mismas entradas, contexto y versiones producen el mismo resultado lógico.
20. La repetición de una evaluación pura no produce efectos adicionales.
21. Una previsualización no es un commit.
22. Importar el package no concede autoridad semántica a la capa cliente.
23. El servicio de dominio conserva la autoridad semántica.
24. La RPC transaccional conserva autenticación, autorización, concurrencia, idempotencia y commit.
25. El trigger conserva función defensiva y no se convierte en motor lingüístico.
26. Valor mostrado, búsqueda, original externo, identificador técnico, texto libre, snapshot, proyección y estructura compuesta permanecen separados.
27. VITAL no hereda las políticas transversales de Vento OS por instalar o compartir infraestructura con el package.
28. `SHELL-NORM-002..009` especializan el contenido del package y no son desarrolladas por esta tarea.
29. El package hereda distribución, SemVer, compatibilidad, deprecación, rollback y adopción de `SHELL-PKG-001..008`.
30. La versión del package y las versiones de reglas o catálogos son planos distintos.
31. No se declara una versión npm, tag o release físico en esta tarea.
32. No se crea un `package_id` de implementación en esta tarea.
33. La creación física requiere `E5-GATE-008::<package_id>` y `SHELL-CI-020::<package_id>` dentro del flujo canónico aplicable.
34. La persistencia de normalización permanece en `DATA-NORM-DB-001..010` cuando corresponda.
35. Esta tarea no crea código, package físico, configuración de registry, migraciones ni cambios en Supabase.
36. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
37. `SHELL-NORM-002` permanece como única continuidad reservada.

---

#### 30. Hallazgos y destinos exactos

| Hallazgo                                                                                                       | Estado                                                                      | Destino exacto                                                                                         |
| -------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| el mini-bloque exige un package compartido de normalización y el corte físico actual no acredita su existencia | resuelto documentalmente en cuanto a identidad y frontera; físico pendiente | `SHELL-NORM-001`; futura ejecución mediante `E5-GATE-008::<package_id>` → `SHELL-CI-020::<package_id>` |
| los tipos de campo normalizable aún no están centralizados en la familia SHELL-NORM                            | reservado                                                                   | `SHELL-NORM-002`                                                                                       |
| las reglas de espacios, Unicode y capitalización requieren superficie compartida específica                    | reservado                                                                   | `SHELL-NORM-003`                                                                                       |
| conectores y excepciones requieren materialización compartida sin catálogos locales                            | reservado                                                                   | `SHELL-NORM-004`                                                                                       |
| el diccionario ortográfico requiere materialización compartida versionada                                      | reservado                                                                   | `SHELL-NORM-005`                                                                                       |
| búsqueda y comparación requieren implementación compartida sin convertirse en identidad                        | reservado                                                                   | `SHELL-NORM-006`                                                                                       |
| preview debe materializarse sin adquirir autoridad de commit                                                   | reservado                                                                   | `SHELL-NORM-007`                                                                                       |
| versión y auditoría del motor compartido deben quedar atribuibles                                              | reservado                                                                   | `SHELL-NORM-008`                                                                                       |
| idempotencia, paridad y conservación semántica requieren certificación del package                             | reservado                                                                   | `SHELL-NORM-009`                                                                                       |
| almacenamiento, funciones SQL, derivaciones, backfills, constraints, índices y triggers pertenecen a BLOQUE R  | fuera del alcance                                                           | `DATA-NORM-DB-001..010`                                                                                |
| pruebas, build, release, compatibilidad y actualización de consumidores pertenecen a BLOQUE T                  | fuera del alcance                                                           | `SHELL-CI-001`; `SHELL-CI-002`; `SHELL-CI-003`; `SHELL-CI-005`; `SHELL-CI-006`                         |

Todos los pendientes quedan vinculados a una tarea o instancia canónica exacta; no se crea un identificador adicional.

---

#### 31. Criterios de aceptación

`SHELL-NORM-001` queda documentalmente completa cuando se cumplen simultáneamente los siguientes criterios:

1. existe una única identidad lógica `@vento/data-normalization`;
2. se reconoce como package compartido propietario de `vento-shell`;
3. su responsabilidad se limita a funciones puras, tipos, diccionarios y validadores compartidos;
4. no se crea una segunda fuente de políticas frente a E3;
5. se conserva la precedencia por dominio, entidad, campo, representación, fuente y versión;
6. la ausencia de política o contexto suficiente falla cerrada;
7. se prohíbe el locale implícito;
8. se prohíbe la hora actual implícita como fuente de semántica;
9. se prohíbe aleatoriedad semántica;
10. se prohíbe I/O de red dentro de la evaluación pura;
11. se prohíbe acceso a Supabase dentro de la evaluación pura;
12. se prohíbe leer secretos para decidir normalización;
13. se preserva determinismo para mismas entradas, contexto y versiones;
14. la evaluación repetida es idempotente en su resultado lógico;
15. el package no muta inputs del caller como mecanismo de efecto empresarial;
16. se conserva la arquitectura de cuatro capas;
17. la aplicación no adquiere autoridad semántica por importar el package;
18. el servicio de dominio conserva autoridad semántica;
19. la RPC conserva autoridad transaccional;
20. el trigger conserva función defensiva;
21. preview y commit permanecen separados;
22. identidad y normalización permanecen separadas;
23. búsqueda y valor mostrado permanecen separados;
24. originales externos y representaciones derivadas permanecen separados;
25. snapshots históricos no se reinterpretan silenciosamente;
26. VITAL permanece fuera de la política transversal Vento OS;
27. `SHELL-NORM-002..009` quedan materializadas como ocho handoffs exactos sin desarrollar su contenido;
28. el package hereda el gobierno de distribución de `SHELL-PKG-001..008`;
29. no se declara versión npm, tag o release inexistente;
30. no se inventa `package_id`;
31. la materialización física queda condicionada a `E5-GATE-008::<package_id>` y `SHELL-CI-020::<package_id>`;
32. las responsabilidades de base de datos permanecen en `DATA-NORM-DB-001..010`;
33. no se crea `package.json` ni archivo TypeScript;
34. no se modifica configuración npm ni registry;
35. no se implementa código;
36. no se modifica Supabase;
37. no se crean requisitos de prueba;
38. no se modifican requisitos de prueba;
39. la continuidad reserva exclusivamente `SHELL-NORM-002`.

---

#### 32. Límites de la tarea

`SHELL-NORM-001` no:

- crea físicamente `@vento/data-normalization`;
- crea carpetas o archivos del package;
- define exports físicos;
- define un API TypeScript definitivo;
- declara una versión npm;
- crea tags o releases;
- selecciona un registry definitivo;
- crea credenciales de publicación;
- instala dependencias en consumidores;
- implementa reglas de normalización;
- implementa tipos de campo;
- implementa capitalización;
- implementa conectores;
- implementa excepciones;
- implementa diccionarios;
- implementa búsqueda;
- implementa preview;
- implementa auditoría física;
- implementa tests físicos;
- crea funciones SQL;
- crea columnas o expresiones;
- ejecuta backfills;
- crea constraints;
- crea índices;
- crea triggers;
- modifica datos;
- modifica Supabase;
- cambia la ruta canónica;
- desarrolla `SHELL-NORM-002`.

---

#### 33. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación

##### TAREA ACTUAL APROBADA

SHELL-NORM-001 — Crear `@vento/data-normalization`

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-002 — Centralizar tipos de campo normalizable


### ✅ SHELL-NORM-002 — Centralizar tipos de campo normalizable

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-001 — Crear `@vento/data-normalization`
**Tarea siguiente:** SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización
**Tipo de tarea:** Documental; centralización normativa del sistema de tipos compartido para campos normalizables dentro de `@vento/data-normalization`, materializando las clases semánticas, roles de representación, roles de fuente, modos de tratamiento, familias de operación y descriptores lógicos ya aprobados por BLOQUE E3, sin crear código, package físico, exports TypeScript, algoritmos, catálogos nuevos, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico resultante:** ESPECIFICADO; NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-002` centraliza el contrato lógico de tipos que deberá compartir `@vento/data-normalization` para representar de forma inequívoca qué clase de campo se evalúa, qué representación contiene el valor, qué autoridad posee su fuente, qué operación se solicita y qué modo de tratamiento puede resultar aplicable.

La tarea no crea una taxonomía paralela. Materializa en la frontera compartida de BLOQUE H los vocabularios cerrados y las relaciones aprobadas en `DATA-NORM-ARC-001` y `DATA-NORM-ARC-002` para impedir que cada aplicación, helper, servicio, job, integración o capa de base de datos invente tipos locales equivalentes o incompatibles.

Resultado conceptual:

```text
DATA-NORM-ARC-001
+ DATA-NORM-ARC-002
        ↓
TIPOS LÓGICOS COMPARTIDOS Y CERRADOS
        ↓
@vento/data-normalization
        ↓
MISMAS IDENTIDADES DE CLASE, REPRESENTACIÓN, FUENTE, OPERACIÓN Y MODO
EN TODA CAPA AUTORIZADA
```

La centralización tipada no autoriza ninguna transformación. Un tipo expresa contrato y elegibilidad; la política, versiones, excepciones, autoridad y capa transaccional siguen determinando si una operación puede ejecutarse.

---

#### 2. Resultado material de la tarea

Quedan definidos documentalmente nueve artefactos lógicos compartidos para futura materialización dentro de `@vento/data-normalization`:

1. `NormalizableFieldSemanticClass`;
2. `NormalizationRepresentationRole`;
3. `NormalizationSourceRole`;
4. `NormalizationTreatmentMode`;
5. `NormalizationOperationKind`;
6. `NormalizableFieldCoordinate`;
7. `NormalizableFieldDescriptor`;
8. `NormalizableStructuredComponentDescriptor`;
9. `NormalizablePolymorphicVariantDescriptor`.

Los cinco primeros son vocabularios cerrados. Los cuatro últimos son estructuras lógicas que vinculan esos vocabularios con la coordenada de política aprobada.

No se define todavía:

- sintaxis física TypeScript;
- ubicación de archivos fuente;
- exports del package;
- nombres de módulos internos;
- serialización JSON;
- validadores runtime concretos;
- schemas Zod, JSON Schema u otra librería;
- algoritmos de transformación;
- API de preview;
- metadata física de auditoría;
- persistencia o integración con Supabase.

---

#### 3. Fuentes normativas y precedencia

| Fuente               | Decisión preservada por esta tarea                                                                                                                           |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `SHELL-NORM-001`     | identidad de `@vento/data-normalization`, pureza, determinismo, separación frente a persistencia y handoff exacto de tipos hacia `SHELL-NORM-002`            |
| `DATA-NORM-ARC-001`  | coordenada de política por dominio, entidad, campo semántico, representación, fuente y versión; preservación y fallo cerrado                                 |
| `DATA-NORM-ARC-002`  | catálogo cerrado de 14 clases, 7 roles de representación, 6 roles de fuente, 8 modos y 13 operaciones; intersección restrictiva y tratamiento por componente |
| `DATA-NORM-ARC-009`  | versionado, determinismo, idempotencia y atribución de decisiones, sin redefinirlos en esta tarea                                                            |
| `DATA-NORM-ARC-010`  | separación entre clasificación textual, identidad, unicidad, duplicidad y consolidación                                                                      |
| `DATA-NORM-ARC-011`  | arquitectura por capas; servicio de dominio como autoridad semántica y frontera transaccional separada                                                       |
| `DATA-NORM-ARC-012`  | clasificación previa y preservación de originales externos, sin convertir evidencia externa en fuente interna automática                                     |
| `SHELL-PKG-001..008` | distribución, versionado, compatibilidad, deprecación, rollback y adopción del package cuando exista físicamente                                             |

Precedencia obligatoria:

```text
GOBIERNO E3
→ VOCABULARIOS CERRADOS APROBADOS
→ TIPOS LÓGICOS COMPARTIDOS DE SHELL-NORM-002
→ REGLAS ESPECIALIZADAS SHELL-NORM-003..008
→ IMPLEMENTACIÓN Y PRUEBAS BAJO GATES CANÓNICOS
```

Un consumidor no puede ampliar un literal, reinterpretar un rol ni introducir un alias porque el lenguaje de programación lo permita.

---

#### 4. Frontera exacta

Esta tarea centraliza exclusivamente:

- identidad de los tipos compartidos de clasificación;
- catálogo exhaustivo de clases semánticas;
- catálogo exhaustivo de roles de representación;
- catálogo exhaustivo de roles de fuente;
- catálogo exhaustivo de modos de tratamiento;
- catálogo exhaustivo de familias de operación;
- coordenada mínima de identificación semántica del campo;
- descriptor completo de campo normalizable;
- reglas tipadas para componentes estructurados;
- reglas tipadas para variantes polimórficas;
- comportamiento tipado ante clasificación incompleta;
- separación entre etiquetas auxiliares y dimensiones primarias;
- invariantes de compatibilidad y evolución de los tipos.

Esta tarea no centraliza ni decide:

- algoritmo de espacios, Unicode o capitalización;
- tokens o reglas de conectores;
- catálogo de excepciones;
- entradas de diccionario;
- algoritmo de búsqueda o ranking;
- experiencia de preview;
- estructura física de auditoría;
- corpus ejecutable o tests;
- persistencia, columnas, índices, constraints o triggers;
- identidad empresarial, fusión o sobreviviente;
- contratos técnicos particulares de SKU, email, teléfono, URL u otros identificadores;
- tratamiento físico de integraciones externas.

---

#### 5. Conciliación del inventario cerrado

| Familia tipada                       | Esperado por E3 | Materializado aquí | Faltantes | Duplicados dentro de la familia |
| ------------------------------------ | --------------: | -----------------: | --------: | ------------------------------: |
| clases semánticas primarias          |              14 |                 14 |         0 |                               0 |
| roles de representación              |               7 |                  7 |         0 |                               0 |
| roles de fuente                      |               6 |                  6 |         0 |                               0 |
| modos de tratamiento                 |               8 |                  8 |         0 |                               0 |
| familias de operación                |              13 |                 13 |         0 |                               0 |
| **Total de literales contractuales** |          **48** |             **48** |     **0** |                           **0** |

Los 48 literales son identidades contractuales. No se normalizan, traducen, abrevian ni reemplazan por equivalentes locales.

---

#### 6. `NormalizableFieldSemanticClass`

`NormalizableFieldSemanticClass` representa exactamente una clase semántica primaria activa para cada campo o componente textual gobernado.

Catálogo cerrado:

| Orden | Literal                        | Significado tipado                                                                                | Restricción basal                                                                                          |
| ----: | ------------------------------ | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
|    01 | `COMMERCIAL_NAME`              | nombre empresarial visible gobernado                                                              | única clase elegible para normalización comercial cuando la política y las reglas posteriores la habiliten |
|    02 | `STRUCTURED_PRESENTATION_NAME` | etiqueta visible dependiente de cantidad, unidad, multiplicador, empaque, contexto o equivalencia | exige preservar y resolver estructura antes de alterar la etiqueta                                         |
|    03 | `HUMAN_LABEL`                  | etiqueta o título visible no comercial, legal, personal ni técnico                                | no hereda normalización comercial por visibilidad                                                          |
|    04 | `OFFICIAL_LEGAL_NAME`          | razón social o denominación oficial                                                               | conserva forma autorizada y procedencia                                                                    |
|    05 | `OFFICIAL_BRAND_FORM`          | marca o forma comercial oficial protegida                                                         | conserva grafía oficial y solo admite excepciones aprobadas                                                |
|    06 | `PERSON_OR_ACTOR_NAME`         | nombre declarado de persona o actor                                                               | preserva identidad declarada y requiere política propia para cualquier corrección                          |
|    07 | `ADDRESS_OR_LOCATION_TEXT`     | dirección o descriptor físico con estructura significativa                                        | preserva números, orden, abreviaturas y signos                                                             |
|    08 | `FREE_TEXT`                    | descripción, nota, mensaje, motivo, observación o instrucción                                     | solo reglas propias de texto libre y protección de autoría, historia o evidencia                           |
|    09 | `CONTROLLED_VOCABULARY_CODE`   | valor perteneciente a catálogo contractual cerrado                                                | validación de catálogo; sin corrección comercial                                                           |
|    10 | `MEASUREMENT_OR_UNIT_CODE`     | símbolo, código o familia de unidad                                                               | validación por catálogo de unidades y preservación de significado técnico                                  |
|    11 | `TECHNICAL_IDENTIFIER`         | identificador, clave o referencia estable técnica                                                 | solo canonicalización definida por contrato técnico propio                                                 |
|    12 | `CONTACT_IDENTIFIER`           | identificador de contacto                                                                         | solo validación o canonicalización del estándar específico                                                 |
|    13 | `SECRET_OR_SIGNATURE_MATERIAL` | secreto, token, hash, firma, checksum o material criptográfico                                    | preservación exacta; transformación textual prohibida                                                      |
|    14 | `UNCLASSIFIED_PRESERVE`        | significado o tratamiento aún insuficientemente resuelto                                          | preservar y bloquear automatización hasta clasificación explícita                                          |

Invariantes:

1. un campo o trayectoria estructurada resuelve exactamente una clase primaria activa;
2. la clase se asigna por significado empresarial y contrato;
3. tipo SQL, schema, tabla, columna, aplicación, frecuencia, caja observada o contenido heurístico no sustituyen el contrato;
4. el mismo texto puede pertenecer a clases distintas en campos distintos;
5. una columna semánticamente mezclada no cambia de clase por fila mediante heurística;
6. una clase no autoriza por sí sola una mutación;
7. una nueva clase requiere evolución canónica explícita y no puede aparecer como extensión local del package.

---

#### 7. `NormalizationRepresentationRole`

`NormalizationRepresentationRole` declara qué función cumple el valor representado. Cada valor persistido o derivado deberá resolver exactamente uno de estos roles:

| Orden | Literal               | Propósito                                                             | Restricción                                                                     |
| ----: | --------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
|    01 | `PRIMARY_VALUE`       | contenido semántico principal de la entidad                           | su mutación depende de clase, fuente y política autorizadas                     |
|    02 | `DISPLAY_OVERRIDE`    | forma visible deliberadamente distinta para un canal o contexto       | no se convierte en fuente ni altera implícitamente el principal                 |
|    03 | `SEARCH_DERIVATION`   | representación tolerante para búsqueda o comparación                  | no se muestra como sustituto, no crea identidad y no autoriza unicidad o fusión |
|    04 | `EXTERNAL_ORIGINAL`   | valor recibido desde integración, importación o proveedor             | conserva forma, procedencia, versión y payload cuando corresponda               |
|    05 | `HISTORICAL_SNAPSHOT` | copia congelada válida en un momento o transacción                    | no se resincroniza ni corrige por defecto                                       |
|    06 | `OUTPUT_PROJECTION`   | forma adaptada para reporte, archivo, API, push, billetera o interfaz | no retroalimenta la fuente y mantiene vínculo con ella                          |
|    07 | `AUDIT_EVIDENCE`      | valor o huella para reconstruir decisión, cambio o evento             | permanece inmutable; una rectificación es aditiva                               |

`SEARCH_DERIVATION`, `OUTPUT_PROJECTION` y `AUDIT_EVIDENCE` son roles de representación, no clases semánticas. Un consumidor no puede intercambiar ambas dimensiones.

---

#### 8. `NormalizationSourceRole`

`NormalizationSourceRole` tipa la autoridad y la relación de propagación de la implementación que contiene o produce el valor.

Catálogo cerrado:

| Orden | Literal                | Autoridad                                                  | Regla de mutabilidad                                                                                             |
| ----: | ---------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
|    01 | `AUTHORITATIVE_SOURCE` | fuente que gobierna el valor para la entidad               | única fuente ordinaria capaz de originar una corrección canónica cuando todas las demás condiciones la autorizan |
|    02 | `APPROVED_OVERRIDE`    | variación explícita y acotada frente a la fuente principal | no amplía permisos de clase y conserva alcance propio                                                            |
|    03 | `SYNCHRONIZED_COPY`    | réplica gobernada de otra fuente                           | recibe cambios mediante propagación definida; no corrige como autoridad independiente                            |
|    04 | `IMMUTABLE_SNAPSHOT`   | fuente histórica congelada                                 | no cambia por correcciones posteriores de la fuente                                                              |
|    05 | `EXTERNAL_EVIDENCE`    | dato recibido con procedencia externa                      | conserva original; mapping o forma interna se mantiene separada                                                  |
|    06 | `OUTPUT_ONLY`          | valor que existe solo para un consumidor o canal           | no posee autoridad de escritura sobre la fuente                                                                  |

Reglas:

1. un rol de fuente nunca amplía el tratamiento permitido por la clase;
2. todos los roles distintos de `AUTHORITATIVE_SOURCE` mantienen o restringen autoridad;
3. `APPROVED_OVERRIDE` no equivale a fuente principal;
4. `SYNCHRONIZED_COPY` no mantiene política propietaria paralela;
5. `EXTERNAL_EVIDENCE` no se convierte en autoridad interna por ser auténtica o frecuente;
6. `OUTPUT_ONLY` no retroalimenta el origen.

---

#### 9. `NormalizationTreatmentMode`

`NormalizationTreatmentMode` tipa el resultado normativo de la intersección entre clase, representación, fuente, operación, excepciones y versión. No representa el resultado de ejecución ni un estado de persistencia.

| Orden | Literal                          | Significado contractual                                                                                            |
| ----: | -------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
|    01 | `DETERMINISTIC_MUTATION_ALLOWED` | una regla de forma explícita, idempotente y versionada puede modificar el valor                                    |
|    02 | `DICTIONARY_MUTATION_ALLOWED`    | una entrada de diccionario aprobada, acotada, auditable y reversible puede modificar el valor                      |
|    03 | `DERIVATION_ONLY`                | puede generarse otra representación sin modificar el valor origen                                                  |
|    04 | `VALIDATION_ONLY`                | puede aceptarse, rechazarse o compararse por contrato sin reescritura                                              |
|    05 | `HUMAN_REVIEW_REQUIRED`          | el valor se conserva y la decisión requiere evidencia y actor revisor                                              |
|    06 | `PRESERVE_EXACT`                 | el valor debe mantenerse sin transformación textual                                                                |
|    07 | `STRUCTURAL_RESOLUTION_REQUIRED` | el problema pertenece a estructura, identidad, relaciones, ciclo de vida o fuente y no se resuelve cambiando texto |
|    08 | `PROHIBITED`                     | la operación no puede ejecutarse para la coordenada                                                                |

La ausencia de un modo explícito equivale a `PROHIBITED`. No se crea un modo `UNKNOWN`, `DEFAULT`, `AUTO` o equivalente.

Precedencia tipada preservada:

```text
PRESERVE_EXACT / PROHIBITED
        ↓
STRUCTURAL_RESOLUTION_REQUIRED
        ↓
HUMAN_REVIEW_REQUIRED
        ↓
DERIVATION_ONLY / VALIDATION_ONLY
        ↓
MUTACIÓN, SOLO SI TODAS LAS DIMENSIONES LA PERMITEN
```

---

#### 10. `NormalizationOperationKind`

`NormalizationOperationKind` centraliza las trece familias de operación ya aprobadas. El tipo identifica la intención; no implementa el algoritmo.

| Orden | Literal                          | Frontera contractual                                                                                                           |
| ----: | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
|    01 | `UNICODE_CANONICALIZATION`       | composición Unicode autorizada sin alterar significado ni material firmado                                                     |
|    02 | `EDGE_WHITESPACE_TRIM`           | recorte de bordes cuando no formen parte del contrato                                                                          |
|    03 | `INTERNAL_WHITESPACE_COMPACTION` | compactación de separadores internos accidentales                                                                              |
|    04 | `PROSE_PUNCTUATION_SPACING`      | espaciado de puntuación de prosa bajo política propia                                                                          |
|    05 | `COMMERCIAL_CAPITALIZATION`      | capitalización empresarial reservada a la política especializada                                                               |
|    06 | `CONNECTOR_CASE_POLICY`          | tratamiento posicional de conectores                                                                                           |
|    07 | `APPROVED_DICTIONARY_CORRECTION` | corrección léxica mediante diccionario aprobado                                                                                |
|    08 | `OFFICIAL_EXCEPTION_APPLICATION` | preservación o emisión de forma desde catálogo oficial aprobado                                                                |
|    09 | `TECHNICAL_CANONICALIZATION`     | formato o validación técnica definida por contrato específico                                                                  |
|    10 | `SEARCH_KEY_DERIVATION`          | producción de representación de búsqueda separada                                                                              |
|    11 | `STRUCTURED_PARSE_OR_RENDER`     | interpretación o composición de cantidades, unidades, multiplicadores y etiquetas estructuradas                                |
|    12 | `SOURCE_PROPAGATION_OR_RESYNC`   | propagación gobernada entre fuente, override, copia o snapshot según contrato aplicable                                        |
|    13 | `IDENTITY_OR_RECORD_ACTION`      | acción sobre identidad, unicidad, fusión, desactivación, reasignación o sobreviviente; nunca se resuelve como mutación textual |

`IDENTITY_OR_RECORD_ACTION` solo puede terminar en `STRUCTURAL_RESOLUTION_REQUIRED` o `PROHIBITED` dentro de la normalización textual.

---

#### 11. `NormalizableFieldCoordinate`

La identidad semántica mínima del campo se centraliza como:

```text
NormalizableFieldCoordinate = {
  owner_domain_ref
  owner_entity_ref
  semantic_field_ref
}
```

Significado:

| Atributo             | Obligación                                                             |
| -------------------- | ---------------------------------------------------------------------- |
| `owner_domain_ref`   | identifica el dominio empresarial que gobierna el significado          |
| `owner_entity_ref`   | identifica la entidad o agregado propietario                           |
| `semantic_field_ref` | identifica el campo semántico independiente de su nombre físico legacy |

La coordenada no incorpora como autoridad:

- schema;
- tabla;
- columna física;
- aplicación consumidora;
- ruta de interfaz;
- nombre de componente;
- repositorio consumidor.

Esos elementos pueden existir como bindings de implementación, pero no sustituyen la identidad semántica.

---

#### 12. `NormalizableFieldDescriptor`

El descriptor lógico completo queda definido como:

```text
NormalizableFieldDescriptor = {
  coordinate: NormalizableFieldCoordinate
  semantic_class: NormalizableFieldSemanticClass
  representation_role: NormalizationRepresentationRole
  source_role: NormalizationSourceRole
  policy_version_ref
  implementation_binding_ref?
  auxiliary_context?
}
```

Obligatoriedad:

| Atributo                     | Cardinalidad lógica            | Regla                                                                                                   |
| ---------------------------- | ------------------------------ | ------------------------------------------------------------------------------------------------------- |
| `coordinate`                 | exactamente 1                  | debe resolver dominio, entidad y campo semántico                                                        |
| `semantic_class`             | exactamente 1                  | uno de los 14 literales cerrados                                                                        |
| `representation_role`        | exactamente 1                  | uno de los 7 literales cerrados                                                                         |
| `source_role`                | exactamente 1                  | uno de los 6 literales cerrados                                                                         |
| `policy_version_ref`         | exactamente 1                  | versión explícita; nunca `latest` implícito                                                             |
| `implementation_binding_ref` | 0 o más referencias gobernadas | permite vincular implementación física sin convertirla en semántica                                     |
| `auxiliary_context`          | opcional y acotado             | idioma, sensibilidad, territorio o canal pueden complementar, nunca sustituir las dimensiones primarias |

El descriptor es un contrato de clasificación, no un permiso de ejecución.

---

#### 13. Completitud y fallo cerrado del descriptor

Un `NormalizableFieldDescriptor` es utilizable por una evaluación automática solo si están resueltas las dimensiones obligatorias.

Reglas:

1. ausencia de clase semántica → no existe descriptor ejecutable;
2. ausencia de rol de representación → no existe descriptor ejecutable;
3. ausencia de rol de fuente → no existe descriptor ejecutable;
4. ausencia de versión → no existe descriptor reproducible;
5. conflicto entre dimensiones → se preserva el valor y se bloquea automatización;
6. `UNCLASSIFIED_PRESERVE` es una clase semántica, no un alias de rol de representación o rol de fuente faltante;
7. no se crean sentinels inventados como `UNKNOWN_SOURCE`, `UNKNOWN_REPRESENTATION` o `AUTO_DETECT`;
8. un consumidor no puede completar dimensiones faltantes desde nomenclatura física o contenido observado;
9. una clasificación incompleta no habilita búsqueda contractual, unicidad normalizada, propagación corregida ni mutación;
10. el error de clasificación no se repara escogiendo el primer literal compatible.

---

#### 14. Resolución tipada del tratamiento efectivo

La centralización preserva esta intersección cerrada:

```text
semantic_class
∩ representation_role
∩ source_role
∩ operation_kind
∩ applicable_exceptions
∩ policy_version
=
treatment_mode
```

Los tipos compartidos deben impedir conceptualmente dos errores:

1. sumar permisos de dimensiones distintas como si fueran acumulativos;
2. interpretar ausencia de restricción como autorización.

Una capa local puede restringir aún más por autorización, estado o capacidad técnica, pero no puede convertir un modo más restrictivo en uno permisivo.

---

#### 15. Matriz materializada de las 14 clases

La decisión por identidad se centraliza completamente:

| Clase                          | Forma determinista                       | Reglas comerciales                         | Diccionario                            | Técnica                                          | Búsqueda                                     | Conducta base de escritura                              |
| ------------------------------ | ---------------------------------------- | ------------------------------------------ | -------------------------------------- | ------------------------------------------------ | -------------------------------------------- | ------------------------------------------------------- |
| `COMMERCIAL_NAME`              | elegible por política                    | elegible solo con reglas aprobadas         | elegible solo con diccionario aprobado | no aplica como contrato general                  | `DERIVATION_ONLY`                            | bloqueada hasta resolver todas las reglas y excepciones |
| `STRUCTURED_PRESENTATION_NAME` | elegible después de preservar estructura | condicionada por etiqueta y excepciones    | condicionada                           | no sobre cantidad ni unidad                      | `DERIVATION_ONLY`                            | bloqueada si la estructura no está resuelta             |
| `HUMAN_LABEL`                  | elegible de forma acotada                | no hereda política comercial               | solo por política explícita            | no aplica                                        | `DERIVATION_ONLY` cuando sea buscable        | bloqueada por defecto                                   |
| `OFFICIAL_LEGAL_NAME`          | revisión o derivación                    | prohibida como estilo genérico             | prohibido sin fuente oficial           | no aplica                                        | `DERIVATION_ONLY`                            | `PRESERVE_EXACT` o revisión autorizada                  |
| `OFFICIAL_BRAND_FORM`          | revisión o derivación                    | prohibida como estilo genérico             | prohibido sin fuente oficial           | no aplica                                        | `DERIVATION_ONLY`                            | `PRESERVE_EXACT` o excepción oficial                    |
| `PERSON_OR_ACTOR_NAME`         | revisión condicionada                    | prohibida como regla empresarial universal | prohibido sin política de identidad    | no aplica                                        | `DERIVATION_ONLY` si la finalidad lo permite | revisión humana o fuente de identidad                   |
| `ADDRESS_OR_LOCATION_TEXT`     | revisión condicionada                    | prohibida como regla comercial             | prohibido por defecto                  | contrato específico de dirección                 | `DERIVATION_ONLY`                            | revisión humana o fuente autorizada                     |
| `FREE_TEXT`                    | solo reglas de prosa aprobadas           | no usa capitalización comercial            | condicionado por reglas propias        | no aplica                                        | `DERIVATION_ONLY` si procede                 | bloqueada cuando altere autoría, evidencia o historia   |
| `CONTROLLED_VOCABULARY_CODE`   | no aplica                                | prohibida                                  | prohibida                              | `VALIDATION_ONLY` o canonicalización contractual | solo si está documentada                     | únicamente por contrato de catálogo                     |
| `MEASUREMENT_OR_UNIT_CODE`     | no aplica como prosa                     | prohibida                                  | prohibida                              | `VALIDATION_ONLY` o mapping de catálogo          | derivación separada                          | únicamente por contrato de unidad                       |
| `TECHNICAL_IDENTIFIER`         | prohibida salvo contrato                 | prohibida                                  | prohibida                              | `VALIDATION_ONLY` o regla técnica versionada     | derivación separada cuando corresponda       | únicamente por contrato técnico                         |
| `CONTACT_IDENTIFIER`           | prohibida como prosa                     | prohibida                                  | prohibida                              | `VALIDATION_ONLY` o estándar específico          | derivación separada                          | únicamente por contrato de contacto                     |
| `SECRET_OR_SIGNATURE_MATERIAL` | prohibida                                | prohibida                                  | prohibida                              | validación no destructiva                        | prohibida                                    | `PRESERVE_EXACT`                                        |
| `UNCLASSIFIED_PRESERVE`        | prohibida                                | prohibida                                  | prohibida                              | prohibida                                        | prohibida hasta clasificación                | `PRESERVE_EXACT`                                        |

Conciliación de la matriz:

```text
clases esperadas = 14
filas materializadas = 14
faltantes = 0
duplicados = 0
```

---

#### 16. `NormalizableStructuredComponentDescriptor`

JSON, arreglos, presentaciones y otras estructuras compuestas no se tipan como una única cadena normalizable por el tipo del contenedor.

Contrato lógico:

```text
NormalizableStructuredComponentDescriptor = {
  parent_field: NormalizableFieldCoordinate
  component_path_ref
  descriptor: NormalizableFieldDescriptor
  order_semantics_ref?
  duplicate_semantics_ref?
}
```

Reglas:

1. cada trayectoria textual JSON resuelve su propio descriptor;
2. cada elemento de arreglo resuelve clase y contrato del elemento;
3. orden, duplicados y posición deben declararse cuando sean significativos;
4. enums y arreglos de enum parten como `CONTROLLED_VOCABULARY_CODE` salvo decisión expresa distinta;
5. una vista hereda clase, representación y fuente de los campos proyectados y no adquiere autoridad propia;
6. un campo calculado o concatenado declara entradas, salida, algoritmo y versión en su contrato propietario;
7. una estructura mezclada sin descomposición suficiente permanece bloqueada.

---

#### 17. `NormalizablePolymorphicVariantDescriptor`

Una estructura polimórfica puede contener clases distintas únicamente mediante discriminador explícito, cerrado y versionado.

Contrato lógico:

```text
NormalizablePolymorphicVariantDescriptor = {
  parent_field: NormalizableFieldCoordinate
  discriminator_ref
  discriminator_version_ref
  variant_ref
  descriptor: NormalizableFieldDescriptor
}
```

Reglas:

1. el discriminador debe existir antes de decidir la clase;
2. el contenido del texto no puede actuar como discriminador heurístico;
3. una variante desconocida no se asigna a la variante más parecida;
4. una variante desconocida preserva el valor y bloquea automatización;
5. la versión del discriminador forma parte de la reproducibilidad;
6. cambiar el significado de una variante requiere evolución contractual y no una modificación silenciosa del tipo.

---

#### 18. Etiquetas auxiliares

Idioma, sensibilidad, territorio, canal y finalidad pueden complementar la clasificación, pero no son sustitutos de:

```text
semantic_class
representation_role
source_role
```

Una futura implementación puede modelar estas dimensiones como metadata separada, siempre que:

- no determine clase por locale;
- no determine fuente por canal;
- no determine representación por sensibilidad;
- no convierta territorio en owner semántico;
- no permita que una etiqueta auxiliar amplíe el modo de tratamiento.

---

#### 19. Separación entre clasificación y algoritmo

Los tipos de esta tarea permiten expresar que una operación pertenece a una familia, pero no determinan cómo se ejecuta.

Ejemplos:

```text
COMMERCIAL_NAME
+ PRIMARY_VALUE
+ AUTHORITATIVE_SOURCE
+ COMMERCIAL_CAPITALIZATION
```

no equivale a una regla de capitalización implementada.

```text
TECHNICAL_IDENTIFIER
+ PRIMARY_VALUE
+ AUTHORITATIVE_SOURCE
+ TECHNICAL_CANONICALIZATION
```

no autoriza un algoritmo universal de SKU, slug, URL o código.

```text
SEARCH_DERIVATION
+ SEARCH_KEY_DERIVATION
```

no define ranking, transliteración, aliases o similitud.

Los algoritmos concretos permanecen en sus tareas propietarias.

---

#### 20. Separación frente a identidad y unicidad

Los tipos compartidos no contienen un literal que signifique “misma entidad” ni “duplicado confirmado”.

Invariantes:

```text
semantic_class = semantic_class
≠ identidad empresarial

SEARCH_DERIVATION igual
≠ unicidad empresarial

treatment_mode permisivo
≠ autorización de fusión
```

`IDENTITY_OR_RECORD_ACTION` existe únicamente para representar que la solicitud ha cruzado la frontera textual. El modo permitido dentro de normalización será estructural o prohibido.

El package no selecciona sobreviviente, no desactiva registros, no reasigna relaciones y no activa constraints mediante estos tipos.

---

#### 21. Representaciones derivadas y fuentes no autoritativas

La combinación de tipos debe conservar estas incompatibilidades:

| Combinación                                    | Conducta obligatoria                                                         |
| ---------------------------------------------- | ---------------------------------------------------------------------------- |
| `SEARCH_DERIVATION` + cualquier fuente         | derivación separada; nunca identidad o fuente principal                      |
| `EXTERNAL_ORIGINAL` + `EXTERNAL_EVIDENCE`      | preservar original y procedencia; forma interna separada                     |
| `HISTORICAL_SNAPSHOT` + `IMMUTABLE_SNAPSHOT`   | no resincronizar por nueva política                                          |
| `OUTPUT_PROJECTION` + `OUTPUT_ONLY`            | no retroalimentar origen                                                     |
| `AUDIT_EVIDENCE` + cualquier fuente compatible | preservar evidencia; rectificación aditiva                                   |
| cualquier representación + `SYNCHRONIZED_COPY` | no originar corrección canónica independiente                                |
| `DISPLAY_OVERRIDE` + `APPROVED_OVERRIDE`       | conservar scope y precedencia explícitos; no convertirlo en fuente universal |

---

#### 22. Datos externos y VITAL

Para datos externos, el tipo compartido no elimina la frontera de procedencia:

1. `EXTERNAL_ORIGINAL` expresa representación;
2. `EXTERNAL_EVIDENCE` expresa rol de fuente;
3. la clase semántica expresa el significado del componente recibido;
4. autenticidad, mapping, autoridad empresarial y commit siguen fuera de este contrato de tipos;
5. una entrada externa no clasificada conserva `UNCLASSIFIED_PRESERVE` y no se corrige por inferencia;
6. secretos y firmas permanecen `SECRET_OR_SIGNATURE_MATERIAL` y `PRESERVE_EXACT`.

VITAL permanece fuera de las reglas transversales de Vento OS. Compartir los tipos no autoriza compartir las políticas ni convertir una clasificación Vento en clasificación VITAL.

---

#### 23. Evolución y compatibilidad de tipos

Las cinco taxonomías cerradas son API contractual del futuro package.

Reglas:

1. agregar, retirar, renombrar o cambiar semántica de un literal no es un refactor neutral;
2. una nueva clase semántica requiere decisión canónica que justifique su frontera;
3. un nuevo rol de representación o fuente requiere demostrar que no duplica uno existente;
4. un nuevo modo de tratamiento modifica la máquina normativa y requiere análisis de compatibilidad;
5. una nueva familia de operación requiere propietario y frontera frente a las trece existentes;
6. los aliases locales de literals están prohibidos como sustituto del contrato compartido;
7. una reclasificación de un campo es un cambio de significado versionado, aunque el tipo físico no cambie;
8. mover una columna entre schemas o tablas no cambia su clase semántica por sí solo;
9. los consumidores deberán conservar compatibilidad temporal durante una transición de versiones;
10. la versión del package y la versión de la política siguen siendo planos distintos.

---

#### 24. Estado de materialización física

Al cierre de esta tarea:

| Elemento                                          | Estado                              |
| ------------------------------------------------- | ----------------------------------- |
| identidad del package `@vento/data-normalization` | `ESPECIFICADO` por `SHELL-NORM-001` |
| sistema lógico de tipos de campo                  | `ESPECIFICADO` por esta tarea       |
| 14 clases semánticas                              | `ESPECIFICADO`                      |
| 7 roles de representación                         | `ESPECIFICADO`                      |
| 6 roles de fuente                                 | `ESPECIFICADO`                      |
| 8 modos de tratamiento                            | `ESPECIFICADO`                      |
| 13 familias de operación                          | `ESPECIFICADO`                      |
| descriptores lógicos                              | `ESPECIFICADO`                      |
| package físico                                    | `NO IMPLEMENTADO`                   |
| archivos TypeScript                               | `NO IMPLEMENTADOS`                  |
| exports runtime                                   | `NO IMPLEMENTADOS`                  |
| validadores runtime                               | `NO IMPLEMENTADOS`                  |
| consumidores migrados                             | `0` por esta tarea                  |
| cambios Supabase                                  | `0`                                 |
| requisitos creados o modificados                  | `0`                                 |

`ESPECIFICADO` no se interpreta como `IMPLEMENTADO` ni como `VALIDADO` en runtime.

---

#### 25. Handoffs exactos

| Materia no desarrollada aquí                                                                         | Propietario exacto                                          | Condición de salida                                                                      |
| ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| espacios, Unicode y capitalización                                                                   | `SHELL-NORM-003`                                            | algoritmos compartidos respetan los tipos y las exclusiones sin Title Case universal     |
| conectores y excepciones                                                                             | `SHELL-NORM-004`                                            | catálogos compartidos consumen clase, representación y fuente sin extensiones locales    |
| diccionarios ortográficos                                                                            | `SHELL-NORM-005`                                            | entradas versionadas operan solo sobre coordenadas tipadas elegibles                     |
| búsqueda y comparación                                                                               | `SHELL-NORM-006`                                            | derivaciones tipadas permanecen separadas de identidad y valor mostrado                  |
| previsualización                                                                                     | `SHELL-NORM-007`                                            | preview usa descriptores y modos compartidos sin adquirir autoridad de commit            |
| versión y auditoría                                                                                  | `SHELL-NORM-008`                                            | decisiones pueden atribuir tipos, versiones y contexto sin reinterpretación local        |
| pruebas de idempotencia y conservación semántica                                                     | `SHELL-NORM-009`                                            | corpus certifica taxonomías, repetición estable y ausencia de degradación semántica      |
| materialización física del package                                                                   | `SHELL-CI-020::<package_id>` después de la puerta aplicable | crear y desplegar únicamente el package aprobado                                         |
| almacenamiento, SQL, búsqueda física, backfills, constraints, índices, triggers y auditoría de datos | `DATA-NORM-DB-001..010`                                     | ejecutar exclusivamente dentro del package autorizado cuando el alcance incluya BLOQUE R |

No se crea una tarea nueva ni se modifica el alcance de las tareas listadas.

---

#### 26. Cobertura de prueba vigente no modificada

La centralización tipada ya está protegida por requisitos canónicos existentes.

Cobertura principal:

- `TREQ-DATA-006` y `TREQ-DATA-007`: coordenada de política, precedencia y fallo cerrado;
- `TREQ-DATA-014` a `TREQ-DATA-017`: separación de representaciones, niveles de decisión, idempotencia y estructuras compuestas;
- `TREQ-DATA-018` a `TREQ-DATA-036`: taxonomía tridimensional completa, modos cerrados, clases protegidas, roles, estructuras, `UNCLASSIFIED_PRESERVE`, reclasificación e identidad;
- `TREQ-SHELL-002`: implementación compartida y paridad frente a copias locales;
- `TREQ-SHELL-006`: pruebas propias y compatibilidad de packages antes de publicación o adopción.

Esta tarea no agrega una regla semántica, una clase, un rol, un modo, una operación ni un efecto nuevo. Solo fija la proyección compartida que deberá conservar literalmente esas obligaciones al materializar el package.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea centraliza como contrato compartido tipos y vocabularios ya aprobados y ya protegidos por requisitos canónicos. No introduce comportamiento ejecutable, regla lingüística, algoritmo, transición, catálogo adicional, autorización, persistencia, migración ni cambio de datos. Por tanto, el Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 28. Decisiones vinculantes

1. `NormalizableFieldSemanticClass` contiene exactamente 14 literales.
2. `NormalizationRepresentationRole` contiene exactamente 7 literales.
3. `NormalizationSourceRole` contiene exactamente 6 literales.
4. `NormalizationTreatmentMode` contiene exactamente 8 literales.
5. `NormalizationOperationKind` contiene exactamente 13 literales.
6. El total reconciliado es 48 literales, sin faltantes ni duplicados dentro de sus familias.
7. Los literals preservan exactamente los identificadores aprobados en E3.
8. Un campo gobernado resuelve exactamente una clase semántica primaria activa.
9. Un valor persistido o derivado resuelve exactamente un rol de representación activo.
10. Una implementación resuelve exactamente un rol de fuente activo.
11. La clase se determina por significado y contrato, no por SQL, schema, tabla, columna, aplicación o heurística.
12. `UNCLASSIFIED_PRESERVE` es una clase semántica y no sustituye roles faltantes.
13. La falta de representación, fuente o versión impide construir un descriptor ejecutable.
14. La ausencia de modo explícito equivale a `PROHIBITED`.
15. El tratamiento efectivo se resuelve por intersección restrictiva.
16. Una excepción puede restringir pero no ampliar una clase incompatible.
17. Solo `COMMERCIAL_NAME` puede resultar elegible para la secuencia comercial aprobada.
18. `HUMAN_LABEL` permanece separado de `COMMERCIAL_NAME`.
19. Presentaciones y unidades permanecen estructuralmente separadas.
20. Nombres legales, marcas, personas, direcciones y texto libre no reciben reglas comerciales universales.
21. Vocabularios, unidades, identificadores y contactos solo consumen contratos especializados.
22. Secretos y material firmado se preservan exactamente.
23. JSON, arreglos, vistas y estructuras polimórficas se clasifican por componente o variante explícita.
24. Una vista no adquiere autoridad por proyectar un valor.
25. Una reclasificación es un cambio contractual versionado.
26. Una reubicación física no cambia la clase por sí sola.
27. La clasificación textual no crea identidad ni confirma duplicados.
28. `IDENTITY_OR_RECORD_ACTION` nunca se resuelve como mutación textual.
29. Las representaciones derivadas no retroalimentan automáticamente la fuente.
30. Las fuentes no autoritativas no amplían permisos.
31. `EXTERNAL_ORIGINAL` y `EXTERNAL_EVIDENCE` preservan la frontera externa.
32. VITAL no hereda políticas Vento por compartir los tipos.
33. Esta tarea no define algoritmos de `SHELL-NORM-003..009`.
34. Esta tarea no crea código, package físico, exports TypeScript ni validadores runtime.
35. Esta tarea no modifica Supabase.
36. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
37. `SHELL-NORM-003` queda como única continuidad reservada.

---

#### 29. Criterios de aceptación

`SHELL-NORM-002` queda documentalmente completa cuando se cumplen simultáneamente:

1. existen exactamente las cinco taxonomías cerradas definidas por E3;
2. las 14 clases semánticas están materializadas una vez cada una;
3. los 7 roles de representación están materializados una vez cada uno;
4. los 6 roles de fuente están materializados una vez cada uno;
5. los 8 modos de tratamiento están materializados una vez cada uno;
6. las 13 familias de operación están materializadas una vez cada una;
7. el total conciliado es 48 literales;
8. no existe alias local para ningún literal;
9. la coordenada distingue dominio, entidad y campo semántico;
10. el descriptor exige clase, representación, fuente y versión;
11. implementación física y significado semántico permanecen separados;
12. las etiquetas auxiliares no sustituyen dimensiones primarias;
13. la clasificación incompleta falla cerrada;
14. no existe detección heurística de clase en runtime;
15. campos mixtos permanecen bloqueados hasta descomposición o clasificación explícita;
16. JSON y arreglos se clasifican por componente;
17. polimorfismo exige discriminador explícito y versionado;
18. vistas no adquieren autoridad;
19. `UNCLASSIFIED_PRESERVE` bloquea automatización;
20. `PRESERVE_EXACT` y `PROHIBITED` conservan precedencia restrictiva;
21. búsqueda no crea identidad;
22. clasificación no crea unicidad;
23. ninguna clase autoriza fusión;
24. fuentes externas preservan original y procedencia;
25. VITAL permanece separado;
26. no se crea algoritmo de espacios, Unicode o capitalización;
27. no se crean conectores, excepciones ni diccionario;
28. no se define búsqueda física ni preview;
29. no se define persistencia ni auditoría física;
30. no se crea package físico ni archivo TypeScript;
31. no se modifica Supabase;
32. no se crean ni modifican requisitos de prueba;
33. la siguiente tarea permanece únicamente reservada.

---

#### 30. Límites

`SHELL-NORM-002` no:

- implementa `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts` o `.tsx`;
- define exports físicos;
- selecciona librería de validación runtime;
- crea schemas serializados;
- implementa algoritmos lingüísticos;
- transforma datos;
- ejecuta normalización;
- corrige valores;
- crea búsquedas;
- crea índices;
- crea constraints;
- crea triggers;
- crea funciones SQL;
- crea RPC;
- ejecuta backfills;
- modifica RLS;
- modifica Supabase;
- migra consumidores;
- redefine `DATA-NORM-ARC-001..012`;
- desarrolla `SHELL-NORM-003`.

---

#### 31. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-001 — Crear `@vento/data-normalization`

##### TAREA ACTUAL APROBADA

SHELL-NORM-002 — Centralizar tipos de campo normalizable

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización


### ✅ SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-002 — Centralizar tipos de campo normalizable
**Tarea siguiente:** SHELL-NORM-004 — Centralizar conectores y excepciones
**Tipo de tarea:** Documental; centralización normativa de las reglas deterministas compartidas de composición Unicode, espacios y capitalización empresarial dentro de `@vento/data-normalization`, preservando literalmente los tipos, perfiles, operaciones, exclusiones, precedencias, resultados y fronteras ya aprobados por BLOQUE E3, sin crear código, package físico, exports TypeScript, catálogos de conectores o excepciones, diccionarios, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** ESPECIFICADO; NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-003` centraliza dentro de la futura superficie compartida de `@vento/data-normalization` las reglas deterministas ya aprobadas para:

- composición Unicode;
- recorte de espacios de borde;
- compactación de espacios internos accidentales;
- capitalización empresarial de campos `COMMERCIAL_NAME` bajo el perfil `es-CO`.

La tarea no crea una política lingüística paralela. Su función es trasladar de forma consumible y sin pérdida semántica las decisiones de `DATA-NORM-ARC-001..003`, usando los tipos cerrados de `SHELL-NORM-002` y conservando las dependencias posteriores que siguen perteneciendo a `SHELL-NORM-004..009`.

Resultado conceptual:

```text
POLÍTICA DE CAMPO + TIPOS COMPARTIDOS
        ↓
OPERACIÓN EXPLÍCITA + VERSIONES EXPLÍCITAS
        ↓
UNICODE / ESPACIOS / CAPITALIZACIÓN
COMO ETAPAS SEPARADAS Y TRAZABLES
        ↓
RESULTADO DETERMINISTA O PRESERVACIÓN / BLOQUEO
        ↓
SIN IDENTIDAD, SIN FUSIÓN, SIN COMMIT IMPLÍCITO
```

La regla central es:

```text
MISMA ENTRADA LÓGICA
+ MISMO DESCRIPTOR
+ MISMA POLÍTICA
+ MISMO ORDEN DE ETAPAS AUTORIZADAS
+ MISMAS VERSIONES
=
MISMO RESULTADO LÓGICO
```

Ninguna de estas reglas se activa por el simple hecho de recibir un `string`.

---

#### 2. Resultado material de la tarea

Queda centralizada documentalmente una superficie compartida de reglas que reutiliza, sin renombrarlos, los siguientes identificadores canónicos ya aprobados:

1. `UNICODE_CANONICALIZATION`;
2. `EDGE_WHITESPACE_TRIM`;
3. `INTERNAL_WHITESPACE_COMPACTION`;
4. `COMMERCIAL_CAPITALIZATION`;
5. `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`;
6. las nueve clases de token de capitalización;
7. los seis resultados de token permitidos;
8. las tres fronteras de segmento.

La tarea define para esas reglas:

- precondiciones de aplicación;
- conducta determinista;
- límites por clase, representación y fuente;
- separación entre operaciones;
- preservación de originales y separadores significativos;
- semántica Unicode explícita;
- tratamiento de espacios autorizado por política;
- secuencia normativa de capitalización;
- clasificación y precedencia de tokens;
- conducta de caja ordinaria;
- relación con conectores y excepciones sin materializar sus catálogos;
- conducta ante ambigüedad, conflicto o contexto incompleto;
- invariantes de idempotencia, reproducibilidad y compatibilidad.

No se crean nuevos literales de operación, clases, resultados, fronteras, estados de negocio o identificadores de catálogo.

---

#### 3. Fuentes normativas y precedencia

| Fuente               | Decisión preservada por esta tarea                                                                                                                       |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-NORM-001`     | identidad y frontera de `@vento/data-normalization`; funciones puras, determinismo, ausencia de I/O y separación frente a persistencia                   |
| `SHELL-NORM-002`     | 14 clases semánticas, 7 roles de representación, 6 roles de fuente, 8 modos, 13 operaciones y descriptores lógicos compartidos                           |
| `DATA-NORM-ARC-001`  | política por dominio, entidad, campo, representación, fuente y versión; ausencia de regla universal y comportamiento cerrado                             |
| `DATA-NORM-ARC-002`  | operaciones `UNICODE_CANONICALIZATION`, `EDGE_WHITESPACE_TRIM`, `INTERNAL_WHITESPACE_COMPACTION` y `COMMERCIAL_CAPITALIZATION`; intersección restrictiva |
| `DATA-NORM-ARC-003`  | perfil `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`, algoritmo de caja, tokenización, precedencia, fronteras, exclusiones e idempotencia                |
| `DATA-NORM-ARC-004`  | catálogo definitivo de conectores y su conducta posicional, consumido pero no materializado por esta tarea                                               |
| `DATA-NORM-ARC-005`  | excepciones oficiales y formas protegidas, consumidas como precedencia pero no materializadas por esta tarea                                             |
| `DATA-NORM-ARC-006`  | corrección ortográfica y tildes mediante diccionario; permanece estrictamente separada de capitalización                                                 |
| `DATA-NORM-ARC-007`  | revisión humana de ambigüedades y conflictos; esta tarea solo conserva el resultado de revisión requerida                                                |
| `DATA-NORM-ARC-008`  | búsqueda y comparación; conserva separación entre normalización de valor mostrado y derivaciones de búsqueda                                             |
| `DATA-NORM-ARC-009`  | versiones explícitas, reproducibilidad, determinismo, idempotencia y prohibición de dependencias implícitas                                              |
| `DATA-NORM-ARC-010`  | identidad, unicidad y duplicidad separadas de cualquier equivalencia textual                                                                             |
| `DATA-NORM-ARC-011`  | servicio de dominio como autoridad semántica y RPC como frontera de commit; aplicación y trigger no sustituyen esas autoridades                          |
| `DATA-NORM-ARC-012`  | preservación de originales externos, encoding, Unicode, locale y semánticas de ausencia                                                                  |
| `SHELL-PKG-001..008` | distribución, versionado, compatibilidad, deprecación, rollback y adopción del package cuando exista físicamente                                         |

Precedencia:

```text
GOBIERNO E3
        ↓
TIPOS SHELL-NORM-002
        ↓
REGLAS SHELL-NORM-003
        ↓
CATÁLOGOS SHELL-NORM-004 / 005 CUANDO APLIQUEN
        ↓
BÚSQUEDA / PREVIEW / AUDITORÍA / PRUEBAS EN SUS TAREAS PROPIETARIAS
```

`SHELL-NORM-003` no puede ampliar una política de campo, convertir una clase excluida en elegible ni sustituir una versión faltante por comportamiento local.

---

#### 4. Frontera exacta

Esta tarea centraliza exclusivamente:

- composición Unicode canónica cuando la política la autoriza;
- recorte de espacios de borde cuando la política los declara no significativos;
- compactación de separadores internos clasificados como espacios accidentales;
- capitalización empresarial de `COMMERCIAL_NAME` bajo el perfil aprobado `es-CO`;
- tokenización y recomposición propias de capitalización;
- clases y resultados de token heredados de `DATA-NORM-ARC-003`;
- fronteras de segmento heredadas de `DATA-NORM-ARC-003`;
- reglas de preservación, bloqueo, ambigüedad y conflicto propias de esas operaciones;
- invariantes de determinismo, idempotencia y versión;
- relación exacta con los tipos centralizados por `SHELL-NORM-002`.

Esta tarea no centraliza ni decide:

- `PROSE_PUNCTUATION_SPACING` como algoritmo de puntuación;
- el listado de conectores;
- el catálogo de excepciones oficiales;
- entradas de diccionario;
- correcciones ortográficas;
- adición o retiro de tildes;
- transliteración;
- traducción;
- singularización o pluralización;
- unión o división de palabras;
- búsqueda, ranking, aliases o similitud;
- identidad, unicidad, deduplicación o fusión;
- experiencia de preview;
- estructura física de auditoría;
- persistencia o propagación física;
- código, SQL, RPC, trigger, migración o backfill.

---

#### 5. Conciliación del inventario cerrado

La tarea consume un conjunto finito de identidades ya aprobado y lo materializa completamente.

| Familia                                 | Esperado | Materializado | Faltantes | Duplicados |
| --------------------------------------- | -------: | ------------: | --------: | ---------: |
| operaciones deterministas de esta tarea |        4 |             4 |         0 |          0 |
| clases de token de capitalización       |        9 |             9 |         0 |          0 |
| resultados de token                     |        6 |             6 |         0 |          0 |
| fronteras de segmento                   |        3 |             3 |         0 |          0 |
| **Total de literales gobernados**       |   **22** |        **22** |     **0** |      **0** |

Las cuatro operaciones son exactamente:

1. `UNICODE_CANONICALIZATION`;
2. `EDGE_WHITESPACE_TRIM`;
3. `INTERNAL_WHITESPACE_COMPACTION`;
4. `COMMERCIAL_CAPITALIZATION`.

`PROSE_PUNCTUATION_SPACING` permanece como familia separada de operación y no se agrega al conteo de esta tarea.

---

#### 6. Regla común de activación

Ninguna operación de esta tarea se ejecuta automáticamente por tipo físico, nombre de columna, ubicación, aplicación o apariencia del valor.

Toda evaluación requiere como mínimo:

```text
NormalizableFieldDescriptor completo
+ operation_kind explícito
+ política del campo
+ versión de política
+ versiones específicas requeridas por la operación
+ entrada lógica
```

Reglas:

1. el descriptor debe resolver clase semántica, representación, fuente y versión;
2. la operación solicitada debe estar permitida por la política efectiva;
3. la intersección de clase, representación, fuente, operación, excepciones y versión no puede resolverse de forma más permisiva que `SHELL-NORM-002`;
4. la ausencia de una condición obligatoria conserva el valor y bloquea automatización;
5. una capa consumidora puede restringir más, nunca ampliar el modo resuelto;
6. no existe fallback a una regla local;
7. no existe selección implícita de `latest`;
8. no existe locale implícito;
9. no existe reparación silenciosa de una entrada no interpretable bajo el contrato declarado;
10. cada etapa autorizada conserva su identidad, versión, entrada y resultado lógico por separado.

---

#### 7. Separación obligatoria entre etapas

Las cuatro operaciones de esta tarea son independientes.

```text
UNICODE_CANONICALIZATION
≠ EDGE_WHITESPACE_TRIM
≠ INTERNAL_WHITESPACE_COMPACTION
≠ COMMERCIAL_CAPITALIZATION
```

Por tanto:

1. habilitar Unicode no habilita espacios;
2. habilitar espacios no habilita capitalización;
3. habilitar capitalización no autoriza tocar espacios ni composición Unicode;
4. una sola función física futura podrá orquestar varias etapas únicamente si conserva resultados y versiones distinguibles;
5. el orden de etapas habilitadas deberá formar parte del perfil o política efectiva cuando más de una operación participe;
6. si el orden requerido no puede resolverse de manera explícita, la evaluación se bloquea;
7. la salida de una etapa puede ser entrada de otra solo como una transición explícita y trazable;
8. la capitalización nunca oculta que su entrada fue modificada previamente por otra etapa.

No se impone una cadena universal sobre todos los campos. Cada campo ejecuta únicamente las operaciones que su política autoriza.

---

#### 8. `UNICODE_CANONICALIZATION`

La operación `UNICODE_CANONICALIZATION` centraliza composición Unicode canónica sin corrección lingüística ni equivalencia empresarial.

Regla aprobada cuando la operación está habilitada:

```text
entrada Unicode válida
+ política que permite canonicalización
+ semántica Unicode versionada
        ↓
composición canónica NFC
        ↓
misma secuencia semántica bajo la composición aprobada
```

Decisiones vinculantes:

1. la forma de composición aprobada para esta operación es **NFC**;
2. no se introduce NFKC, NFKD ni otra forma de compatibilidad como sustituto;
3. NFC no elimina tildes;
4. NFC no convierte `ñ` en `n`;
5. NFC no translitera alfabetos;
6. NFC no cambia palabras, conectores, signos o estructura por intención lingüística;
7. NFC no aplica casefold;
8. NFC no ejecuta capitalización;
9. NFC no ejecuta diccionario;
10. NFC no crea aliases ni claves de identidad;
11. cambiar la semántica o versión Unicode utilizada constituye un cambio versionado de política;
12. una entrada que no pueda evaluarse bajo la semántica declarada no se repara mediante reemplazos heurísticos.

---

#### 9. Unicode, grafemas y conservación semántica

Las reglas compartidas deberán operar de forma compatible con el modelo aprobado de grafemas.

Invariantes:

1. capitalización y segmentación razonan sobre caracteres Unicode y fronteras de grafema, no sobre bytes;
2. no se parte deliberadamente un grafema para decidir caja;
3. las marcas combinantes se conservan;
4. los grafemas sin caja permanecen sin transformación de caja;
5. las letras acentuadas conservan su diacrítico durante la operación de caja;
6. `ñ` permanece distinta de `n`;
7. un cambio de representación canónicamente equivalente no constituye corrección ortográfica;
8. la igualdad canónica Unicode no constituye identidad empresarial;
9. la normalización Unicode de una derivación no autoriza sobrescribir el original que deba preservarse.

---

#### 10. Representaciones que preservan el original frente a Unicode

La composición Unicode no convierte una representación protegida en una fuente mutable.

| Representación / fuente                  | Conducta                                                                                  |
| ---------------------------------------- | ----------------------------------------------------------------------------------------- |
| `PRIMARY_VALUE` + `AUTHORITATIVE_SOURCE` | puede recibir canonicalización solo si la política del campo la autoriza                  |
| `DISPLAY_OVERRIDE` + `APPROVED_OVERRIDE` | puede recibir canonicalización dentro de su alcance aprobado                              |
| `EXTERNAL_ORIGINAL`                      | preservar la forma original; cualquier representación canónica interna permanece separada |
| `HISTORICAL_SNAPSHOT`                    | preservar la forma histórica salvo contrato explícito distinto que no reescriba historia  |
| `AUDIT_EVIDENCE`                         | preservar evidencia; rectificaciones son aditivas                                         |
| `EXTERNAL_EVIDENCE`                      | preservar procedencia y forma recibida                                                    |
| `IMMUTABLE_SNAPSHOT`                     | no reinterpretar ni resincronizar por una versión nueva                                   |
| `OUTPUT_PROJECTION` + `OUTPUT_ONLY`      | puede derivar una forma autorizada sin retroalimentar la fuente                           |

Material firmado, secretos, hashes, firmas, checksums y valores cuya integridad depende de bytes o representación contractual permanecen protegidos por `SECRET_OR_SIGNATURE_MATERIAL` y `PRESERVE_EXACT`.

---

#### 11. `EDGE_WHITESPACE_TRIM`

`EDGE_WHITESPACE_TRIM` elimina únicamente separadores de borde que la política del campo haya declarado no significativos y elegibles para recorte.

Reglas:

1. no existe `trim` universal para todos los campos textuales;
2. la política debe autorizar la operación para la coordenada concreta;
3. los caracteres de borde solo se retiran cuando pertenecen a la clase de separadores permitida por esa política;
4. una representación externa, histórica, probatoria o firmada no se modifica por conveniencia;
5. un secreto o material de firma no admite recorte;
6. recortar no capitaliza;
7. recortar no normaliza Unicode por sí mismo;
8. recortar no corrige puntuación;
9. recortar no convierte un valor en identidad, alias o clave de búsqueda;
10. si la política no puede determinar si el borde es significativo, el valor se conserva;
11. la operación deberá ser idempotente para la misma política y versión;
12. el resultado debe seguir distinguiéndose de la entrada original cuando la trazabilidad lo requiera.

---

#### 12. Semántica de vacío y espacios de borde

`EDGE_WHITESPACE_TRIM` no puede utilizarse para borrar diferencias contractuales entre ausencia y contenido.

Deben permanecer conceptualmente distinguibles cuando el contrato propietario las distinga:

```text
campo ausente
null explícito
cadena vacía
cadena compuesta solo por espacios
clear explícito
desconocido
no aplicable
valor parcial
```

Por tanto:

1. una regla de recorte no convierte por sí sola una ausencia en cadena vacía;
2. una regla de recorte no convierte `null` en texto;
3. una cadena compuesta solo por separadores no se interpreta automáticamente como dato ausente;
4. si el resultado de recorte cruzaría una frontera semántica definida por el contrato del campo, prevalece la política propietaria y no una utilidad genérica;
5. los imports e integraciones conservan la semántica de ausencia definida por sus contratos.

---

#### 13. `INTERNAL_WHITESPACE_COMPACTION`

`INTERNAL_WHITESPACE_COMPACTION` compacta únicamente separadores internos clasificados como **espacios accidentales** por la política del campo.

Reglas:

1. no existe una sustitución universal equivalente a “todo whitespace → un espacio”;
2. la política debe identificar qué clase de separador es accidental;
3. la política debe declarar la forma canónica de salida para esa clase cuando autorice la compactación;
4. el orden de los tokens no cambia;
5. no se eliminan palabras;
6. no se unen palabras que el contrato mantiene separadas;
7. no se dividen palabras;
8. la compactación no ejecuta puntuación de prosa;
9. la compactación no ejecuta Unicode por sí sola;
10. la compactación no capitaliza;
11. la compactación no corrige ortografía;
12. la compactación debe ser idempotente para la misma política y versión.

Ejemplo condicionado:

```text
"Harina   de maiz"
```

puede compactar los espacios ASCII internos solo cuando la política del campo los clasifique expresamente como accidentales. La existencia de espacios repetidos no es por sí sola permiso suficiente.

---

#### 14. Separadores preservados por defecto

La compactación interna no debe destruir estructura o formato significativo.

Se preservan por defecto, salvo contrato específico explícito que autorice otra operación:

- saltos de línea;
- tabulaciones;
- espacios no separables;
- separación significativa de plantillas;
- Markdown;
- formatos preformateados;
- delimitadores estructurales;
- separación usada como evidencia;
- espaciado incluido en material firmado o protegido;
- cualquier separador cuya función no esté resuelta por la política.

Una política de `FREE_TEXT`, `HUMAN_LABEL`, dirección, identificador técnico o estructura compuesta no hereda compactación comercial por semejanza visual.

---

#### 15. Puntuación y espacios permanecen separados

`PROSE_PUNCTUATION_SPACING` no se fusiona con las dos operaciones de espacios de esta tarea.

```text
EDGE_WHITESPACE_TRIM
→ bordes autorizados

INTERNAL_WHITESPACE_COMPACTION
→ separadores internos accidentales autorizados

PROSE_PUNCTUATION_SPACING
→ regla propia de espaciado alrededor de puntuación
```

En consecuencia:

1. compactar espacios internos no mueve signos;
2. recortar bordes no reescribe puntuación;
3. capitalización preserva signos y separadores recibidos;
4. una corrección de espacios alrededor de coma, punto u otro signo requiere la operación y política propietarias correspondientes;
5. la existencia de una salida visualmente más limpia no autoriza combinar etapas.

---

#### 16. Perfil compartido de capitalización

La capitalización empresarial centralizada conserva exactamente la identidad lógica aprobada:

```text
VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0
```

No se crea otra versión, alias o perfil equivalente.

El perfil aplica únicamente a la operación:

```text
COMMERCIAL_CAPITALIZATION
```

Y su finalidad es exclusivamente producir la caja empresarial autorizada de palabras ordinarias elegibles dentro de un valor `COMMERCIAL_NAME`, sin corregir ortografía, tildes, puntuación, espacios, estructura, identidad o búsqueda.

---

#### 17. Puerta de activación de `COMMERCIAL_CAPITALIZATION`

La mutación determinista solo puede resultar elegible cuando se cumplen simultáneamente estas diez condiciones:

1. `semantic_class = COMMERCIAL_NAME`;
2. `representation_role = PRIMARY_VALUE` o `DISPLAY_OVERRIDE` expresamente autorizado;
3. `source_role = AUTHORITATIVE_SOURCE` o `APPROVED_OVERRIDE` según corresponda;
4. la política del campo permite `COMMERCIAL_CAPITALIZATION`;
5. el perfil lingüístico está declarado explícitamente;
6. existe una versión activa del catálogo de conectores propietario de `SHELL-NORM-004`;
7. existe una versión activa del catálogo de excepciones propietario de `SHELL-NORM-004`;
8. no existe conflicto entre política, excepción, fuente o representación;
9. la entrada no contiene un caso que obligue revisión humana sin resolución;
10. puede atribuirse el resultado a las versiones exactas utilizadas.

La falta de una sola condición conserva el valor y evita una mutación automática.

---

#### 18. Entrada y salida lógica de capitalización

La evaluación consume como mínimo:

```text
valor de entrada
NormalizableFieldDescriptor
perfil lingüístico
versión de capitalización
versión de conectores
versión de excepciones
política efectiva del campo
```

El resultado lógico debe poder distinguir:

```text
valor resultante o preservado
decisión global
clasificación de cada token
resultado de cada token
posición o frontera aplicable
versiones utilizadas
bloqueos o revisión requerida
```

Esta definición es lógica. No prescribe una interfaz TypeScript, tabla, RPC, payload, schema serializado ni formato físico.

---

#### 19. Secuencia normativa de capitalización

La evaluación de `COMMERCIAL_CAPITALIZATION` conserva exactamente esta secuencia:

```text
1. resolver la coordenada y política del campo
        ↓
2. conservar la entrada lógica evaluada
        ↓
3. comprobar clase, representación, fuente y versiones requeridas
        ↓
4. segmentar sin perder separadores ni posiciones
        ↓
5. aplicar excepciones oficiales por frase y token
        ↓
6. clasificar conectores usando el catálogo vigente
        ↓
7. clasificar tokens ordinarios, técnicos, numéricos o ambiguos
        ↓
8. aplicar caja solo a tokens elegibles
        ↓
9. recomponer preservando separadores y estructura
        ↓
10. comprobar idempotencia y producir un resultado atribuible a versiones
```

Si una operación previa autorizada de Unicode o espacios produjo la entrada de capitalización, dicha entrada se considera una etapa distinta y trazable. La capitalización no vuelve a ejecutar esas operaciones de forma implícita.

---

#### 20. Clases de token de capitalización

Las nueve clases quedan centralizadas una vez cada una:

| Orden | Literal                       | Definición                                                                      | Conducta basal                                                     |
| ----: | ----------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
|    01 | `ORDINARY_LEXICAL_TOKEN`      | palabra formada por letras y marcas combinantes sin forma protegida             | candidata a regla ordinaria de caja                                |
|    02 | `CONNECTOR_TOKEN`             | token reconocido por el catálogo versionado de conectores                       | consume conducta posicional; catálogo pertenece a `SHELL-NORM-004` |
|    03 | `OFFICIAL_EXCEPTION_TOKEN`    | token o frase cubierta por excepción oficial                                    | preservar o emitir exactamente la forma oficial aprobada           |
|    04 | `CONTROLLED_ACRONYM_TOKEN`    | sigla o abreviatura confirmada por catálogo                                     | preservar forma contractual                                        |
|    05 | `MEASUREMENT_OR_UNIT_TOKEN`   | símbolo, código o denominación de unidad confirmada                             | preservar forma aprobada; no tratar como palabra ordinaria         |
|    06 | `NUMERIC_TOKEN`               | número entero, decimal, fracción, rango o cantidad                              | preservar exactamente durante capitalización                       |
|    07 | `ALPHANUMERIC_OR_MODEL_TOKEN` | combinación de letras, números o signos con función posible técnica o comercial | preservar y revisar salvo contrato explícito                       |
|    08 | `PUNCTUATION_OR_SEPARATOR`    | signo, espacio o separador entre tokens                                         | preservar exactamente dentro de capitalización                     |
|    09 | `AMBIGUOUS_TOKEN`             | token cuya clase o forma oficial no puede resolverse                            | preservar y producir revisión requerida                            |

Conciliación:

```text
esperadas = 9
materializadas = 9
faltantes = 0
duplicados = 0
```

---

#### 21. Resultados de token permitidos

Los seis resultados quedan centralizados sin aliases:

| Orden | Literal                        | Significado                                                                |
| ----: | ------------------------------ | -------------------------------------------------------------------------- |
|    01 | `CAPITALIZED_ORDINARY`         | se aplicó la regla ordinaria de caja                                       |
|    02 | `LOWERCASED_CONNECTOR`         | se emitió un conector interno según el catálogo vigente                    |
|    03 | `PRESERVED_OFFICIAL_EXCEPTION` | se conservó o emitió la forma oficial aprobada                             |
|    04 | `PRESERVED_NON_CASED`          | se conservó número, signo, separador, unidad u otro token no sujeto a caja |
|    05 | `PRESERVED_AMBIGUOUS`          | se conservó el token y el resultado global requiere revisión humana        |
|    06 | `BLOCKED_CONFLICT`             | no se produjo mutación por conflicto de política, catálogo o versión       |

Conciliación:

```text
esperados = 6
materializados = 6
faltantes = 0
duplicados = 0
```

Los resultados describen la evaluación de capitalización; no son estados de persistencia, aprobación empresarial o commit.

---

#### 22. Precedencia de clasificación de tokens

La precedencia es estricta:

```text
1. excepción oficial de frase — coincidencia válida más larga
2. excepción oficial de token
3. sigla, unidad, código o forma técnica protegida
4. conector aprobado
5. palabra ordinaria elegible
6. token ambiguo
```

Reglas:

1. una excepción de frase prevalece sobre reglas palabra por palabra;
2. una excepción no se infiere por frecuencia, caja observada o apariencia;
3. una coincidencia parcial no permite modificar el resto del token;
4. una excepción aplica solo dentro de su alcance y vigencia;
5. dos reglas incompatibles de igual precedencia bloquean la mutación;
6. la ausencia de una excepción no demuestra que un token técnico o mixto sea palabra ordinaria;
7. el consumidor no puede alterar el orden de precedencia.

---

#### 23. Algoritmo ordinario de caja

Un `ORDINARY_LEXICAL_TOKEN` elegible se transforma únicamente en caja:

```text
primer grafema con caja
→ mayúscula según el perfil lingüístico explícito

restantes grafemas con caja
→ minúscula según el mismo perfil

marcas, tildes y grafemas sin caja
→ se conservan
```

Ejemplos exclusivos de esta operación:

```text
americano → Americano
CAFÉ → Café
árbol → Árbol
ÑAME → Ñame
FRIO → Frio
maiz → Maiz
```

`Frio` y `Maiz` son resultados correctos de **caja solamente**. Las formas `Frío` y `Maíz` requieren una decisión distinta de diccionario o revisión y no pueden producirse por `COMMERCIAL_CAPITALIZATION`.

---

#### 24. Formas ordinarias, protegidas y ambiguas

| Forma observada                       | Ejemplo                          | Conducta                                                                   |
| ------------------------------------- | -------------------------------- | -------------------------------------------------------------------------- |
| minúsculas completas                  | `americano`                      | regla ordinaria si no existe protección                                    |
| mayúsculas completas                  | `LATTE`                          | regla ordinaria solo después de descartar sigla, marca, unidad o código    |
| primera mayúscula y resto minúscula   | `Americano`                      | conservar; ya satisface la regla ordinaria                                 |
| capitalización interna                | `iPhone`, `eCommerce`            | preservar por excepción o revisar; no aplanar por defecto                  |
| letras y números                      | `3M`, `T26`, `REF7071`           | preservar y clasificar por catálogo o contrato técnico                     |
| puntos, guiones o apóstrofos internos | `S.A.S.`, `Coca-Cola`, `O'Neill` | no descomponer por defecto; excepción o revisión                           |
| una letra                             | `A`, `x`                         | resolver como conector, sigla o ambigüedad antes de aplicar caja ordinaria |
| forma no resoluble                    | cualquier token conflictivo      | preservar y producir revisión requerida                                    |

Mayúsculas completas no equivalen a sigla y minúsculas completas no equivalen automáticamente a palabra ordinaria.

---

#### 25. Fronteras de segmento

Las tres fronteras aprobadas quedan centralizadas:

| Orden | Literal                  | Efecto                                                                               |
| ----: | ------------------------ | ------------------------------------------------------------------------------------ |
|    01 | `NAME_START`             | inicia el valor; la primera palabra lexical o conector elegible recibe regla inicial |
|    02 | `DECLARED_SEGMENT_START` | reinicia la regla posicional únicamente por una frontera habilitada y versionada     |
|    03 | `NO_SEGMENT_RESET`       | conserva la posición interna                                                         |

Conciliación:

```text
esperadas = 3
materializadas = 3
faltantes = 0
duplicados = 0
```

Reglas predeterminadas heredadas:

1. el inicio del valor es `NAME_START`;
2. dos puntos y raya larga o corta rodeada por espacios pueden actuar como `DECLARED_SEGMENT_START` cuando la política del campo lo habilite;
3. coma, punto, ampersand, signo más, barra, paréntesis, guion interno y apóstrofo no reinician segmentos por defecto;
4. los signos se conservan exactamente durante capitalización;
5. una frontera no declarada se trata como `NO_SEGMENT_RESET`;
6. una abreviatura con puntos no se interpreta como varias palabras.

---

#### 26. Dependencia de conectores sin anticipar `SHELL-NORM-004`

`SHELL-NORM-003` centraliza la conducta de consumo del catálogo, pero no su contenido.

Reglas:

1. un conector solo existe para esta operación cuando el catálogo versionado de `SHELL-NORM-004` lo reconoce;
2. un conector en `NAME_START` recibe la regla inicial correspondiente;
3. un conector en `DECLARED_SEGMENT_START` recibe la regla inicial correspondiente;
4. un conector en posición interna usa la forma definida por el catálogo;
5. una excepción oficial de frase prevalece sobre la regla de conector;
6. no se permite una lista local;
7. no se permite coincidencia aproximada;
8. no se permite inferencia por idioma observado;
9. no se materializa en esta tarea ninguna entrada concreta del catálogo;
10. la versión del catálogo utilizada debe formar parte de la reproducibilidad del resultado.

La lista definitiva de conectores y las excepciones oficiales permanecen íntegramente en `SHELL-NORM-004`.

---

#### 27. Compuestos, guiones, apóstrofos y puntuación

La capitalización no utiliza puntuación como excusa para reestructurar el valor.

Reglas:

1. un token con guion o apóstrofo interno no se divide automáticamente;
2. una forma oficial compuesta se resuelve mediante excepción aprobada;
3. una gramática de compuesto solo puede operar si su contrato declara delimitador, idioma, alcance, excepciones y versión;
4. sin contrato suficiente, el token se preserva y pasa a revisión cuando corresponda;
5. capitalización no une palabras separadas;
6. capitalización no divide una palabra existente;
7. capitalización no inserta ni retira espacios alrededor de signos;
8. `Choco Bites` y `Chocobites` permanecen como cadenas distintas;
9. la coincidencia de su salida visual no establece identidad ni duplicidad.

---

#### 28. Clases excluidas de `COMMERCIAL_CAPITALIZATION`

La matriz completa conserva una sola clase elegible y trece clases excluidas por defecto.

| Clase semántica                | Capitalización empresarial | Regla                                                                             |
| ------------------------------ | -------------------------- | --------------------------------------------------------------------------------- |
| `COMMERCIAL_NAME`              | condicionadamente elegible | solo tras superar política, representación, fuente, perfil y versiones requeridas |
| `STRUCTURED_PRESENTATION_NAME` | excluida                   | preservar estructura, cantidad, unidad, multiplicador y contexto                  |
| `HUMAN_LABEL`                  | excluida                   | no hereda política comercial por ser visible                                      |
| `OFFICIAL_LEGAL_NAME`          | excluida                   | preservar forma legal u oficial                                                   |
| `OFFICIAL_BRAND_FORM`          | excluida                   | preservar grafía oficial mediante catálogo o fuente autorizada                    |
| `PERSON_OR_ACTOR_NAME`         | excluida                   | preservar identidad declarada; política propia                                    |
| `ADDRESS_OR_LOCATION_TEXT`     | excluida                   | preservar números, orden, abreviaturas y signos                                   |
| `FREE_TEXT`                    | excluida                   | solo reglas propias de prosa libre                                                |
| `CONTROLLED_VOCABULARY_CODE`   | excluida                   | validar por catálogo contractual                                                  |
| `MEASUREMENT_OR_UNIT_CODE`     | excluida                   | validar por catálogo técnico de unidades                                          |
| `TECHNICAL_IDENTIFIER`         | excluida                   | solo canonicalización técnica específica                                          |
| `CONTACT_IDENTIFIER`           | excluida                   | solo contrato específico del canal o estándar                                     |
| `SECRET_OR_SIGNATURE_MATERIAL` | excluida                   | `PRESERVE_EXACT`                                                                  |
| `UNCLASSIFIED_PRESERVE`        | excluida                   | preservar y bloquear automatización                                               |

Conciliación:

```text
clases esperadas = 14
filas materializadas = 14
COMMERCIAL_NAME elegible = 1
clases excluidas por defecto = 13
faltantes = 0
duplicados = 0
```

---

#### 29. Fuentes y representaciones autorizadas

La mutación directa de capitalización queda limitada a:

```text
PRIMARY_VALUE + AUTHORITATIVE_SOURCE
```

o, dentro de alcance explícito:

```text
DISPLAY_OVERRIDE + APPROVED_OVERRIDE
```

Las demás combinaciones conservan las restricciones de `SHELL-NORM-002`.

| Caso                                | Conducta                                                                   |
| ----------------------------------- | -------------------------------------------------------------------------- |
| `EXTERNAL_ORIGINAL`                 | preservar original; una forma interna se deriva por separado               |
| `HISTORICAL_SNAPSHOT`               | no reinterpretar por una política nueva                                    |
| `AUDIT_EVIDENCE`                    | preservar evidencia                                                        |
| `SEARCH_DERIVATION`                 | no usar capitalización como identidad ni como sustituto del valor mostrado |
| `OUTPUT_PROJECTION` + `OUTPUT_ONLY` | puede derivar una forma autorizada sin retroalimentar origen               |
| `SYNCHRONIZED_COPY`                 | no corregir independientemente; recibe propagación gobernada               |
| `IMMUTABLE_SNAPSHOT`                | no resincronizar por corrección posterior                                  |
| `EXTERNAL_EVIDENCE`                 | preservar forma y procedencia externa                                      |

Un `APPROVED_OVERRIDE` conserva su alcance propio y no se convierte en fuente universal.

---

#### 30. Perfil lingüístico y determinismo

El perfil de capitalización es explícitamente:

```text
es-CO
```

Reglas:

1. no se usa el locale del sistema operativo;
2. no se usa el locale del navegador;
3. no se usa el locale del proceso;
4. no se usa el locale de la base de datos;
5. la semántica Unicode y de caja debe quedar fijada por versión;
6. una versión de runtime no puede cambiar silenciosamente el resultado contractual;
7. las letras acentuadas y `ñ` conservan diacríticos bajo el mapeo de caja;
8. no se transliteran caracteres;
9. un valor de otro perfil lingüístico se preserva o requiere revisión hasta existir política explícita;
10. cambiar versión lingüística o Unicode requiere análisis de compatibilidad y una nueva decisión versionada.

---

#### 31. Ejemplos canónicos de comportamiento

La centralización conserva los ejemplos de `DATA-NORM-ARC-003` sin convertirlos en reglas adicionales.

| Entrada y contexto                 | Resultado de capitalización                | Conducta posterior separada                     |
| ---------------------------------- | ------------------------------------------ | ----------------------------------------------- |
| `americano` como `COMMERCIAL_NAME` | `Americano`                                | ninguna corrección ortográfica adicional        |
| `pan masa madre clasico`           | `Pan Masa Madre Clasico`                   | `Clásico` solo mediante diccionario aprobado    |
| `harina de maiz`                   | `Harina de Maiz`                           | `Maíz` solo mediante diccionario aprobado       |
| `jugo de naranja y mango`          | `Jugo de Naranja y Mango`                  | conectores según catálogo vigente               |
| `LATTE FRIO`                       | `Latte Frio`                               | `Frío` solo mediante diccionario aprobado       |
| `Bebidas calientes`                | `Bebidas Calientes`                        | conservar si ya satisface la regla              |
| `3M` dentro de nombre              | `3M`                                       | forma protegida                                 |
| `iPhone` dentro de nombre          | `iPhone`                                   | forma protegida                                 |
| `Coca-Cola` dentro de nombre       | `Coca-Cola`                                | excepción oficial de token o frase              |
| `BBQ` dentro de nombre             | preservar o revisar                        | no producir `Bbq` sin catálogo                  |
| `expresso` con ambigüedad activa   | conservar `expresso`                       | revisión humana; no corregir ortografía         |
| `500 g` como presentación          | conservar                                  | clase excluida y estructura preservada          |
| `COMERCIALIZADORA ABC S.A.S.`      | conservar                                  | `OFFICIAL_LEGAL_NAME` excluido                  |
| `Carlos Ibarra`                    | conservar                                  | `PERSON_OR_ACTOR_NAME` excluido                 |
| `NEXO`                             | conservar                                  | vocabulario o identificador controlado excluido |
| `Choco Bites` / `Chocobites`       | capitalizar cada forma solo si es elegible | no unir, dividir ni fusionar registros          |

Los ejemplos no autorizan a inferir marcas, conectores, excepciones o correcciones no registradas por sus catálogos propietarios.

---

#### 32. Idempotencia y estabilidad por operación

Cada operación deberá ser idempotente para la misma entrada lógica, contexto y versiones.

Unicode:

```text
NFC(NFC(value)) = NFC(value)
```

cuando `UNICODE_CANONICALIZATION` está autorizada bajo la misma semántica versionada.

Espacios:

```text
trim_rule(trim_rule(value)) = trim_rule(value)
compact_rule(compact_rule(value)) = compact_rule(value)
```

para la misma clasificación de separadores y versión.

Capitalización:

```text
capitalize(capitalize(value, context), context)
=
capitalize(value, context)
```

La estabilidad de capitalización cubre:

- valor resultante;
- decisión global;
- clasificación de tokens;
- resultados de token;
- precedencia;
- fronteras de segmento;
- conectores y excepciones resueltos por sus versiones;
- casos de revisión;
- conjunto de versiones.

Un retry no crea una nueva corrección lingüística, no cambia el orden de etapas y no autoriza efectos empresariales adicionales.

---

#### 33. Prohibiciones de transformación implícita

Las reglas compartidas no pueden ejecutar silenciosamente:

- casefold sobre el valor mostrado como sustituto de capitalización;
- unaccent;
- eliminación de diacríticos;
- `ñ → n`;
- NFKC o NFKD;
- transliteración;
- traducción;
- corrección ortográfica;
- adición o retiro de tildes;
- singularización;
- pluralización;
- stemming;
- lematización;
- stopwords;
- aliases automáticos;
- similitud;
- unión de palabras;
- división de palabras;
- cambio de puntuación;
- conversión de unidades;
- cambio de cantidades;
- generación de slug, SKU o identificador;
- deduplicación;
- fusión;
- selección de sobreviviente.

Cada responsabilidad permanece en su contrato propietario o está expresamente prohibida.

---

#### 34. Relación con búsqueda

La normalización de esta tarea no sustituye `SHELL-NORM-006`.

En particular:

1. una forma capitalizada es una representación mostrada, no una clave de búsqueda;
2. `SEARCH_FORM_KEY` pertenece al contrato de búsqueda y puede usar NFC, casefold y tratamiento de espacios autorizado sin cambiar el original;
3. casefold de búsqueda no autoriza persistir el valor fuente en minúsculas;
4. `SEARCH_ACCENT_KEY` es una derivación separada y no autoriza retirar diacríticos del valor mostrado;
5. una coincidencia de búsqueda no confirma identidad;
6. los helpers de búsqueda futuros deberán consumir las mismas versiones y tipos, pero no modificar las reglas de esta tarea.

---

#### 35. Relación con identidad y unicidad

Ninguna salida de esta tarea crea identidad.

```text
NFC igual
≠ misma entidad

espacios normalizados iguales
≠ misma entidad

capitalización igual
≠ misma entidad
```

Por tanto:

1. no se activan constraints por equivalencia textual;
2. no se selecciona registro sobreviviente;
3. no se desactiva ningún registro;
4. no se reasignan relaciones;
5. no se modifican claves empresariales;
6. no se interpretan dos nombres visualmente iguales como duplicado confirmado;
7. toda acción estructural sigue perteneciendo a `DATA-NORM-ARC-010` y sus transiciones.

---

#### 36. Estado de materialización física

Al cierre documental de esta tarea:

| Elemento                                             | Estado                                                               |
| ---------------------------------------------------- | -------------------------------------------------------------------- |
| `@vento/data-normalization`                          | `ESPECIFICADO`; package físico no materializado                      |
| tipos de `SHELL-NORM-002`                            | `ESPECIFICADOS`                                                      |
| `UNICODE_CANONICALIZATION`                           | regla compartida `ESPECIFICADA`; código no materializado             |
| `EDGE_WHITESPACE_TRIM`                               | regla compartida `ESPECIFICADA`; código no materializado             |
| `INTERNAL_WHITESPACE_COMPACTION`                     | regla compartida `ESPECIFICADA`; código no materializado             |
| `COMMERCIAL_CAPITALIZATION`                          | regla compartida `ESPECIFICADA`; código no materializado             |
| perfil `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0` | centralizado documentalmente; sin implementación runtime             |
| 9 clases de token                                    | centralizadas documentalmente                                        |
| 6 resultados de token                                | centralizados documentalmente                                        |
| 3 fronteras de segmento                              | centralizadas documentalmente                                        |
| catálogo de conectores                               | no desarrollado aquí; `SHELL-NORM-004`                               |
| catálogo de excepciones                              | no desarrollado aquí; `SHELL-NORM-004`                               |
| diccionario ortográfico                              | no desarrollado aquí; `SHELL-NORM-005`                               |
| búsqueda                                             | no desarrollada aquí; `SHELL-NORM-006`                               |
| preview                                              | no desarrollado aquí; `SHELL-NORM-007`                               |
| metadata de versión y auditoría                      | no desarrollada aquí; `SHELL-NORM-008`                               |
| pruebas físicas                                      | no desarrolladas aquí; `SHELL-NORM-009` y BLOQUE T según corresponda |
| archivos TypeScript                                  | `NO IMPLEMENTADOS`                                                   |
| consumidores migrados                                | `0` por esta tarea                                                   |
| cambios Supabase                                     | `0`                                                                  |
| requisitos de prueba creados o modificados           | `0`                                                                  |

`ESPECIFICADO` no equivale a `IMPLEMENTADO` ni a `VALIDADO` en runtime.

---

#### 37. Handoffs exactos

| Materia fuera de esta tarea                                                        | Propietario exacto                                          | Condición de salida                                                                              |
| ---------------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| conectores y excepciones                                                           | `SHELL-NORM-004`                                            | catálogos compartidos consumen clase, representación, fuente y versiones sin extensiones locales |
| diccionario ortográfico                                                            | `SHELL-NORM-005`                                            | correcciones cerradas y versionadas permanecen separadas de caja                                 |
| búsqueda y comparación                                                             | `SHELL-NORM-006`                                            | derivaciones de búsqueda usan sus perfiles sin alterar valor mostrado ni identidad               |
| previsualización                                                                   | `SHELL-NORM-007`                                            | preview reproduce las reglas sin adquirir autoridad de commit                                    |
| metadatos de versión y auditoría                                                   | `SHELL-NORM-008`                                            | cada evaluación queda atribuible a política, reglas y versiones exactas                          |
| pruebas de idempotencia y conservación semántica                                   | `SHELL-NORM-009`                                            | corpus certifica repetición estable y ausencia de degradación semántica                          |
| materialización física del package                                                 | `SHELL-CI-020::<package_id>` después de la puerta aplicable | crear y desplegar únicamente el package aprobado                                                 |
| persistencia, funciones SQL, backfills, constraints, índices y triggers defensivos | `DATA-NORM-DB-001..010`                                     | ejecutar únicamente dentro del package autorizado cuando su alcance incluya BLOQUE R             |

No se crea una tarea nueva ni se modifica el alcance de los handoffs existentes.

---

#### 38. Cobertura de prueba vigente no modificada

Las reglas centralizadas por esta tarea ya están protegidas por requisitos canónicos vigentes.

Cobertura principal:

- `TREQ-DATA-037` y `TREQ-DATA-038`: puerta de capitalización y prohibición de Title Case universal;
- `TREQ-DATA-039`: separación de capitalización frente a espacios, Unicode, puntuación, diccionario y otras transformaciones;
- `TREQ-DATA-040` y `TREQ-DATA-041`: segmentación Unicode, preservación de separadores y algoritmo ordinario de caja;
- `TREQ-DATA-042`: perfil `es-CO` y semántica Unicode explícita;
- `TREQ-DATA-043` y `TREQ-DATA-044`: dependencia de conectores y precedencia de excepciones;
- `TREQ-DATA-045` y `TREQ-DATA-046`: ambigüedad, compuestos, puntuación y fronteras;
- `TREQ-DATA-047` y `TREQ-DATA-048`: exclusiones por clase y preservación de cantidades, unidades y estructura;
- `TREQ-DATA-049`: caja separada de ortografía y tildes;
- `TREQ-DATA-050`: fuentes, representaciones y propagación;
- `TREQ-DATA-051`: determinismo e idempotencia;
- `TREQ-DATA-052`: separación frente a búsqueda, identidad y unicidad;
- `TREQ-DATA-053`: corpus de conformidad;
- `TREQ-DATA-126`: NFC y espacios gobernados dentro de la derivación de forma de búsqueda, sin convertirlos en corrección del original;
- `TREQ-DATA-158`: eliminación de dependencias implícitas de locale, Unicode, runtime, tiempo, orden o configuración;
- `TREQ-DATA-203`: colocación autorizada de recorte, espacios, Unicode y capitalización en la arquitectura de ejecución;
- `TREQ-DATA-232`: locale, Unicode y encoding explícitos y versionados;
- `TREQ-SHELL-002`: implementación compartida y paridad frente a copias locales;
- `TREQ-SHELL-006`: pruebas propias y compatibilidad del package antes de publicación o adopción.

La tarea no amplía ninguna de esas obligaciones. Las centraliza en la futura superficie compartida sin introducir comportamiento ejecutable nuevo.

---

#### 39. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-NORM-003` traslada al contrato compartido reglas de Unicode, espacios y capitalización ya aprobadas y ya cubiertas por requisitos canónicos vigentes. No crea una operación nueva, un algoritmo lingüístico nuevo, una clase nueva, un perfil nuevo, un catálogo nuevo, una regla de búsqueda, una autorización, una persistencia, una migración ni un cambio de datos. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 40. Decisiones vinculantes

1. Las operaciones centralizadas son exactamente `UNICODE_CANONICALIZATION`, `EDGE_WHITESPACE_TRIM`, `INTERNAL_WHITESPACE_COMPACTION` y `COMMERCIAL_CAPITALIZATION`.
2. Las cuatro operaciones permanecen independientes.
3. No existe pipeline universal para todos los campos.
4. Más de una etapa solo puede combinarse con orden explícito y versionado.
5. La composición Unicode aprobada cuando se habilita es NFC.
6. No se introduce NFKC ni NFKD.
7. Unicode no retira diacríticos ni translitera.
8. Unicode no aplica casefold sobre el valor mostrado.
9. `EDGE_WHITESPACE_TRIM` solo actúa sobre bordes declarados no significativos por política.
10. `INTERNAL_WHITESPACE_COMPACTION` solo actúa sobre separadores declarados accidentales por política.
11. No existe una regla universal `\s+` sobre todos los textos.
12. Saltos de línea, tabulaciones, NBSP, Markdown, plantillas y formato significativo se preservan por defecto.
13. `PROSE_PUNCTUATION_SPACING` permanece como operación separada.
14. El perfil de capitalización es exactamente `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`.
15. El perfil lingüístico es `es-CO` explícito.
16. Solo `COMMERCIAL_NAME` puede resultar elegible para `COMMERCIAL_CAPITALIZATION`.
17. Las otras trece clases quedan excluidas por defecto.
18. La mutación de capitalización exige representación y fuente autorizadas.
19. La capitalización no ejecuta espacios ni Unicode implícitamente.
20. La capitalización no corrige ortografía ni tildes.
21. La capitalización no modifica puntuación.
22. La capitalización no une ni divide palabras.
23. La capitalización centraliza exactamente nueve clases de token.
24. La capitalización centraliza exactamente seis resultados de token.
25. La capitalización centraliza exactamente tres fronteras de segmento.
26. El inventario total gobernado por esta tarea es de 22 literales, con 0 faltantes y 0 duplicados.
27. La precedencia de token conserva frase oficial, token oficial, protección técnica, conector, palabra ordinaria y ambigüedad en ese orden.
28. Una palabra ordinaria mayusculiza el primer grafema con caja y minúsculiza los restantes bajo el perfil explícito.
29. Tildes, `ñ`, marcas combinantes y grafemas sin caja se conservan.
30. Una capitalización interna desconocida no se aplana automáticamente.
31. Los conectores y excepciones se consumen por versión pero su contenido pertenece a `SHELL-NORM-004`.
32. El diccionario pertenece a `SHELL-NORM-005`.
33. La búsqueda pertenece a `SHELL-NORM-006`.
34. Preview, auditoría y corpus físico permanecen en sus tareas propietarias.
35. Una salida textual equivalente no crea identidad, unicidad ni duplicidad confirmada.
36. Originales externos, snapshots, evidencia y material firmado conservan su frontera de preservación.
37. VITAL no hereda estas reglas por compartir infraestructura o tipos.
38. No se crea package físico, archivo TypeScript, export, función SQL, RPC, trigger o migración.
39. No se modifica Supabase.
40. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
41. `SHELL-NORM-004` queda como única continuidad reservada.

---

#### 41. Criterios de aceptación

`SHELL-NORM-003` queda documentalmente completa cuando se cumplen simultáneamente:

1. las cuatro operaciones propietarias están identificadas sin aliases;
2. el inventario de cuatro operaciones está completo;
3. las nueve clases de token están completas;
4. los seis resultados de token están completos;
5. las tres fronteras de segmento están completas;
6. el total conciliado es 22 literales;
7. faltantes = 0;
8. duplicados = 0;
9. cada operación exige política y versión explícitas;
10. Unicode, espacios y capitalización permanecen como etapas separadas;
11. no existe orden implícito cuando varias etapas participan;
12. la composición Unicode autorizada se limita a NFC;
13. no se introducen formas de compatibilidad Unicode;
14. se conservan diacríticos y `ñ`;
15. no existe transliteración implícita;
16. edge trim se restringe a bordes declarados no significativos;
17. compaction se restringe a separadores declarados accidentales;
18. formato significativo permanece protegido por defecto;
19. puntuación no se corrige mediante las operaciones de espacios;
20. `COMMERCIAL_CAPITALIZATION` usa exclusivamente `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`;
21. `COMMERCIAL_NAME` es la única clase condicionalmente elegible;
22. las trece clases restantes están materializadas como excluidas;
23. representación y fuente se revalidan antes de permitir capitalización;
24. las diez condiciones de activación están preservadas;
25. la tokenización conserva grafemas, signos y separadores;
26. la precedencia de tokens está materializada en orden exacto;
27. el algoritmo de palabra ordinaria solo cambia caja;
28. `Frio` y `Maiz` permanecen ejemplos de caja, no corrección ortográfica;
29. conectores y excepciones no se materializan dentro de esta tarea;
30. compuestos no se dividen por heurística;
31. una forma ambigua se preserva y requiere revisión;
32. `NAME_START`, `DECLARED_SEGMENT_START` y `NO_SEGMENT_RESET` conservan su significado;
33. capitalización no cambia búsqueda, slug, SKU, código o identidad;
34. Unicode y espacios no crean identidad;
35. la misma entrada, contexto y versiones producen el mismo resultado lógico;
36. cada operación es idempotente bajo la misma versión;
37. no existe locale implícito;
38. no existe dependencia de runtime como fuente silenciosa de semántica;
39. no se crea código ni package físico;
40. no se modifica Supabase;
41. no se crean ni modifican requisitos de prueba;
42. todos los pendientes quedan vinculados con propietario exacto;
43. la continuidad reserva exclusivamente `SHELL-NORM-004`.

---

#### 42. Límites

`SHELL-NORM-003` no:

- crea físicamente `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts` o `.tsx`;
- define exports físicos;
- selecciona una librería Unicode;
- selecciona una librería de segmentación;
- selecciona una librería de validación runtime;
- crea un catálogo local de conectores;
- crea excepciones de marcas, siglas, unidades o nombres legales;
- crea entradas de diccionario;
- corrige `maiz`, `frio`, `clasico` u otra palabra ortográficamente;
- aplica unaccent;
- aplica transliteración;
- implementa búsqueda;
- implementa similitud;
- genera aliases;
- implementa preview;
- implementa auditoría física;
- ejecuta normalización sobre datos;
- modifica valores persistidos;
- crea funciones SQL;
- crea RPC;
- crea triggers;
- crea índices;
- crea constraints;
- ejecuta backfills;
- modifica RLS;
- modifica Supabase;
- migra consumidores;
- redefine `DATA-NORM-ARC-001..012`;
- desarrolla `SHELL-NORM-004`.

---

#### 43. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-002 — Centralizar tipos de campo normalizable

##### TAREA ACTUAL APROBADA

SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-004 — Centralizar conectores y excepciones


### ✅ SHELL-NORM-004 — Centralizar conectores y excepciones

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización
**Tarea siguiente:** SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados
**Tipo de tarea:** Documental; centralización normativa de los catálogos compartidos de conectores y excepciones oficiales dentro de `@vento/data-normalization`, materializando sin reinterpretación `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0` y `VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0`, su precedencia, alcance, versiones, resultados, formas aprobadas y candidatos no activables, sin crear código, package físico, exports TypeScript, entradas de diccionario, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** ESPECIFICADO; NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-004` centraliza dentro de la frontera documental de `@vento/data-normalization` los dos catálogos ya aprobados que gobiernan la clasificación de conectores y la protección o emisión de formas oficiales:

```text
VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0
+
VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0
        ↓
SUPERFICIE COMPARTIDA DE CATÁLOGOS VERSIONADOS
        ↓
MISMAS ENTRADAS
+ MISMA PRECEDENCIA
+ MISMO ALCANCE
+ MISMAS VERSIONES
+ MISMOS BLOQUEOS
EN TODA CAPA AUTORIZADA
```

La tarea no crea un catálogo alternativo ni amplía los catálogos de BLOQUE E3. Su función es fijar qué contenido deberá compartir el futuro package y qué decisiones quedan prohibidas para consumidores locales.

La regla central es:

```text
CENTRALIZAR
≠ REINTERPRETAR
≠ AMPLIAR
≠ APRENDER
≠ INFERIR
≠ CORREGIR ORTOGRAFÍA
≠ CREAR IDENTIDAD
```

---

#### 2. Resultado material de la tarea

Quedan centralizados documentalmente dos artefactos canónicos preexistentes:

1. `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0`;
2. `VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0`.

La centralización materializa en esta tarea:

- las 18 entradas definitivas del catálogo de conectores;
- sus 3 familias lingüísticas descriptivas;
- sus 3 posiciones normativas;
- sus 5 resultados cerrados de evaluación;
- las 4 familias canónicas de excepción;
- los 23 atributos mínimos del contrato lógico de una excepción;
- los 4 alcances cerrados de coincidencia;
- los 3 modos cerrados de coincidencia;
- los 4 modos cerrados de aplicación;
- los 7 resultados cerrados de evaluación de excepciones;
- los 5 tipos de autoridad aprobados;
- los 3 estados de ciclo de vida del catálogo de excepciones;
- las 28 formas normativas iniciales del catálogo de excepciones, reconciliadas como 22 formas con emisión canónica o validación técnica y 6 protecciones contextuales de sufijo legal;
- la precedencia conjunta entre excepciones, protecciones técnicas, conectores, palabras ordinarias y ambigüedad;
- las formas observadas que permanecen fuera de las entradas activas por falta de autoridad, contexto o resolución suficiente;
- las fronteras frente a diccionario, búsqueda, identidad, persistencia y datos externos.

No se crea una versión nueva de ninguno de los dos catálogos.

---

#### 3. Fuentes normativas y precedencia

| Fuente               | Decisión preservada por `SHELL-NORM-004`                                                                                                                           |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `SHELL-NORM-001`     | identidad de `@vento/data-normalization`, pureza, determinismo, ausencia de I/O y prohibición de convertir el package en fuente empresarial o capa de persistencia |
| `SHELL-NORM-002`     | clases semánticas, representaciones, fuentes, modos y operaciones compartidas que delimitan la elegibilidad de conectores y excepciones                            |
| `SHELL-NORM-003`     | perfil `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`, tokenización, fronteras, precedencia y handoff exacto de conectores y excepciones                            |
| `DATA-NORM-ARC-001`  | política por dominio, entidad, campo, representación, fuente y versión; ausencia de transformación universal y fallo cerrado                                       |
| `DATA-NORM-ARC-002`  | tipos cerrados y operaciones `CONNECTOR_CASE_POLICY` y `OFFICIAL_EXCEPTION_APPLICATION` dentro del sistema de normalización                                        |
| `DATA-NORM-ARC-003`  | capitalización empresarial, precedencia de tokens y dependencia obligatoria de conectores y excepciones versionados                                                |
| `DATA-NORM-ARC-004`  | contenido completo de `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0`                                                                                             |
| `DATA-NORM-ARC-005`  | contenido completo de `VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0`                                                                                                |
| `DATA-NORM-ARC-006`  | corrección ortográfica y tildes mediante diccionario, expresamente fuera de esta tarea                                                                             |
| `DATA-NORM-ARC-007`  | revisión humana de candidatos y ambigüedades que no pueden activarse por inferencia                                                                                |
| `DATA-NORM-ARC-008`  | búsqueda y comparación separadas de los catálogos de forma visible                                                                                                 |
| `DATA-NORM-ARC-009`  | versiones explícitas, vigencia, reproducibilidad, determinismo, idempotencia e historia aditiva                                                                    |
| `DATA-NORM-ARC-010`  | identidad, unicidad, colisiones y fusiones separadas de coincidencias textuales                                                                                    |
| `DATA-NORM-ARC-011`  | servicio de dominio como autoridad semántica y RPC como frontera de commit; ninguna lista local adquiere autoridad                                                 |
| `DATA-NORM-ARC-012`  | preservación de originales externos, evidencia, encoding y procedencia                                                                                             |
| `SHELL-PKG-001..008` | distribución, compatibilidad, versionado, deprecación, rollback y adopción cuando el package exista físicamente                                                    |

Precedencia normativa:

```text
POLÍTICA DEL CAMPO
        ↓
TIPOS Y ELEGIBILIDAD SHELL-NORM-002
        ↓
REGLAS DE FORMA SHELL-NORM-003
        ↓
EXCEPCIONES OFICIALES SHELL-NORM-004
        ↓
PROTECCIONES TÉCNICAS SHELL-NORM-004
        ↓
CONECTORES SHELL-NORM-004
        ↓
PALABRA ORDINARIA ELEGIBLE
        ↓
PRESERVACIÓN / REVISIÓN / BLOQUEO
```

Esta secuencia no autoriza ejecutar una operación si clase, representación, fuente, política o versiones la prohíben.

---

#### 4. Frontera exacta

Esta tarea centraliza exclusivamente:

- las entradas y reglas del catálogo de conectores aprobado;
- las familias, entradas iniciales, protecciones, modos y reglas del catálogo de excepciones aprobado;
- la relación de ambos catálogos con `COMMERCIAL_CAPITALIZATION`;
- la operación tipada `CONNECTOR_CASE_POLICY` como decisión posicional de conectores;
- la operación tipada `OFFICIAL_EXCEPTION_APPLICATION` como aplicación contractual de formas oficiales;
- la precedencia entre excepciones, formas técnicas protegidas, conectores y palabras ordinarias;
- los límites de coincidencia exacta y de aliases explícitos;
- las restricciones de fuente y representación;
- los estados de vigencia del catálogo de excepciones;
- la conducta ante versiones faltantes, retiradas, suspendidas, ambiguas o conflictivas;
- el inventario de candidatos que no forman parte de entradas activas;
- los handoffs hacia diccionario, búsqueda, preview, auditoría, pruebas e implementación física.

Esta tarea no centraliza ni decide:

- entradas del diccionario ortográfico;
- correcciones de `maiz`, `frio`, `clasico`, `Botellla` u otras formas léxicas;
- inferencia de nuevas marcas, siglas, códigos, unidades o aliases;
- traducción, transliteración, stemming o lematización;
- búsqueda, ranking, similitud o generación de slug;
- identidad, unicidad, deduplicación, fusión o selección de sobreviviente;
- workflow físico de revisión humana;
- persistencia de catálogos;
- API TypeScript definitiva;
- schemas runtime;
- SQL, RPC, trigger, índice, constraint, migración o backfill;
- adopción por consumidores;
- cambios en Supabase.

---

#### 5. Conciliación de inventarios heredados

##### 5.1 Catálogo de conectores

| Familia               | Esperado por E3 | Materializado aquí | Faltantes | Duplicados |
| --------------------- | --------------: | -----------------: | --------: | ---------: |
| entradas definitivas  |              18 |                 18 |         0 |          0 |
| familias descriptivas |               3 |                  3 |         0 |          0 |
| posiciones normativas |               3 |                  3 |         0 |          0 |
| resultados cerrados   |               5 |                  5 |         0 |          0 |

Las familias descriptivas no crean gramática ni añaden entradas; solo agrupan las 18 identidades existentes.

##### 5.2 Catálogo de excepciones

| Familia                                   | Esperado por E3 | Materializado aquí | Faltantes | Duplicados |
| ----------------------------------------- | --------------: | -----------------: | --------: | ---------: |
| familias de excepción                     |               4 |                  4 |         0 |          0 |
| atributos mínimos de entrada              |              23 |                 23 |         0 |          0 |
| alcances de coincidencia                  |               4 |                  4 |         0 |          0 |
| modos de coincidencia                     |               3 |                  3 |         0 |          0 |
| modos de aplicación                       |               4 |                  4 |         0 |          0 |
| resultados cerrados                       |               7 |                  7 |         0 |          0 |
| tipos de autoridad                        |               5 |                  5 |         0 |          0 |
| estados de ciclo de vida                  |               3 |                  3 |         0 |          0 |
| formas normativas iniciales               |              28 |                 28 |         0 |          0 |
| formas con emisión o validación           |              22 |                 22 |         0 |          0 |
| protecciones contextuales de sufijo legal |               6 |                  6 |         0 |          0 |

Relación de las formas iniciales:

```text
3 marcas
+ 10 siglas o códigos controlados
+ 9 unidades o familias técnicas
= 22 formas con emisión canónica o validación técnica

22
+ 6 protecciones contextuales de sufijo legal
= 28 formas normativas iniciales
```

Las 6 protecciones legales no se interpretan como aliases entre sí ni como nombres legales completos.

---

#### 6. Identidad del catálogo de conectores

La identidad se conserva exactamente:

```text
VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0
```

Invariantes:

1. el catálogo es cerrado;
2. aplica exclusivamente bajo el perfil `es-CO` declarado;
3. no se activa por detección automática de idioma;
4. no se extiende por frecuencia, semejanza o gramática inferida;
5. no contiene aliases implícitos;
6. su versión forma parte de la reproducibilidad;
7. una lista local no puede complementar ni reemplazar la versión canónica;
8. una versión posterior deberá ser una decisión explícita y no una mutación silenciosa de `1.0.0`.

---

#### 7. Las 18 entradas definitivas de conectores

| Orden | Entrada | Familia descriptiva           | Regla base                           |
| ----: | ------- | ----------------------------- | ------------------------------------ |
|    01 | `a`     | preposiciones y contracciones | forma exacta del catálogo            |
|    02 | `al`    | preposiciones y contracciones | entrada atómica; no expandir         |
|    03 | `con`   | preposiciones y contracciones | forma exacta del catálogo            |
|    04 | `de`    | preposiciones y contracciones | forma exacta del catálogo            |
|    05 | `del`   | preposiciones y contracciones | entrada atómica; no expandir         |
|    06 | `e`     | conjunciones coordinantes     | no sustituir automáticamente por `y` |
|    07 | `el`    | artículos                     | forma exacta del catálogo            |
|    08 | `en`    | preposiciones y contracciones | forma exacta del catálogo            |
|    09 | `la`    | artículos                     | forma exacta del catálogo            |
|    10 | `las`   | artículos                     | forma exacta del catálogo            |
|    11 | `lo`    | artículos                     | forma exacta del catálogo            |
|    12 | `los`   | artículos                     | forma exacta del catálogo            |
|    13 | `o`     | conjunciones coordinantes     | no sustituir automáticamente por `u` |
|    14 | `para`  | preposiciones y contracciones | forma exacta del catálogo            |
|    15 | `por`   | preposiciones y contracciones | forma exacta del catálogo            |
|    16 | `sin`   | preposiciones y contracciones | forma exacta del catálogo            |
|    17 | `u`     | conjunciones coordinantes     | no sustituir automáticamente por `o` |
|    18 | `y`     | conjunciones coordinantes     | no sustituir automáticamente por `e` |

Conciliación:

```text
entradas esperadas = 18
entradas materializadas = 18
faltantes = 0
duplicados = 0
```

No se incorporan otras preposiciones, artículos, conjunciones, contracciones, abreviaturas o variantes.

---

#### 8. Familias descriptivas de conectores

| Familia descriptiva           | Entradas                                                  |
| ----------------------------- | --------------------------------------------------------- |
| preposiciones y contracciones | `a`, `al`, `con`, `de`, `del`, `en`, `para`, `por`, `sin` |
| artículos                     | `el`, `la`, `las`, `lo`, `los`                            |
| conjunciones coordinantes     | `e`, `o`, `u`, `y`                                        |

Estas familias no autorizan:

- concordancia gramatical;
- sustitución fonológica;
- contracción automática;
- expansión automática;
- traducción;
- análisis sintáctico completo;
- incorporación de palabras equivalentes.

---

#### 9. Puerta de activación del catálogo de conectores

Un conector solo participa en una evaluación cuando se cumplen simultáneamente:

1. la clase semántica es `COMMERCIAL_NAME`;
2. la evaluación forma parte de `COMMERCIAL_CAPITALIZATION` y su decisión de conector corresponde a `CONNECTOR_CASE_POLICY`;
3. la representación y el rol de fuente permiten la operación;
4. el perfil lingüístico es `es-CO` explícito;
5. la versión de capitalización es compatible;
6. `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0` está activa para la evaluación;
7. la segmentación produjo un token lexical completo y no ambiguo;
8. no existe una excepción oficial o protección de mayor precedencia;
9. la posición normativa puede resolverse sin heurística;
10. las versiones y la decisión pueden atribuirse en la traza lógica.

La falta o conflicto de cualquiera de estas condiciones impide usar el catálogo como fallback permisivo.

---

#### 10. Reconocimiento exacto de conectores

Un token coincide con una entrada solo si:

- es un token lexical completo;
- la comparación de caja del perfil `es-CO` produce coincidencia exacta con una entrada activa;
- no contiene caracteres adicionales;
- no pertenece a una excepción oficial de frase o token;
- no fue clasificado como sigla, unidad, código, marca, modelo, referencia o token ambiguo.

Matriz de conformidad:

| Token recibido | Entrada resuelta | Decisión                                   |
| -------------- | ---------------- | ------------------------------------------ |
| `DE`           | `de`             | coincide por caja bajo el perfil explícito |
| `Del`          | `del`            | coincide por caja bajo el perfil explícito |
| `de`           | `de`             | coincide exactamente                       |
| `deluxe`       | ninguna          | `del` es subcadena y no aplica             |
| `paraíso`      | ninguna          | `para` es subcadena y no aplica            |
| `y/o`          | ninguna          | forma compuesta no catalogada              |
| `de-la`        | ninguna          | forma con signo no es una entrada exacta   |
| `eCommerce`    | ninguna          | capitalización interna protegida o ambigua |

La comparación no elimina tildes, signos, guiones, apóstrofos ni caracteres.

---

#### 11. Posiciones normativas de conectores

Las posiciones del catálogo son exactamente:

| Posición                 | Significado                                                           | Resultado de forma                       |
| ------------------------ | --------------------------------------------------------------------- | ---------------------------------------- |
| `NAME_START`             | primer token lexical del valor                                        | aplicar regla inicial del perfil         |
| `DECLARED_SEGMENT_START` | primer token lexical tras frontera que reinicia posición por política | aplicar regla inicial del perfil         |
| `INTERNAL`               | cualquier posición lexical restante                                   | emitir la entrada minúscula del catálogo |

Estas posiciones se concilian con las fronteras de `SHELL-NORM-003` así:

```text
frontera NAME_START
→ posición de conector NAME_START

frontera DECLARED_SEGMENT_START
→ posición de conector DECLARED_SEGMENT_START

frontera NO_SEGMENT_RESET
→ no reinicia la posición;
  el conector posterior permanece INTERNAL cuando ya existe token lexical previo
```

`INTERNAL` es una posición de conector; no sustituye ni renombra la frontera `NO_SEGMENT_RESET`.

---

#### 12. Resultados cerrados del catálogo de conectores

| Resultado                          | Significado                                                                              |
| ---------------------------------- | ---------------------------------------------------------------------------------------- |
| `CONNECTOR_INITIAL_CAPITALIZED`    | conector reconocido al inicio de nombre o segmento y emitido con inicial según perfil    |
| `CONNECTOR_INTERNAL_LOWERCASED`    | conector reconocido en posición interna y emitido en su forma minúscula aprobada         |
| `CONNECTOR_PRESERVED_BY_EXCEPTION` | una excepción oficial de mayor precedencia determinó la forma                            |
| `CONNECTOR_PRESERVED_AMBIGUOUS`    | el valor se conserva porque el contexto no permite resolución automática                 |
| `CONNECTOR_POLICY_BLOCKED`         | no existe mutación por falta, retiro, incompatibilidad o conflicto de política o versión |

Un token que ya presenta la forma esperada no se confunde con un resultado bloqueado o ambiguo.

---

#### 13. Reglas especiales de conectores

1. `al` y `del` son entradas atómicas.
2. La política no expande `al` a `a el`.
3. La política no expande `del` a `de el`.
4. La política no contrae `a el` a `al`.
5. La política no contrae `de el` a `del`.
6. `e` y `y` permanecen entradas independientes.
7. `o` y `u` permanecen entradas independientes.
8. La política no sustituye `y` por `e` según sonido o palabra siguiente.
9. La política no sustituye `o` por `u` según sonido o palabra siguiente.
10. `y/o` no se interpreta automáticamente como dos conectores.
11. Espacios, comillas, paréntesis y signos de apertura anteriores al primer token lexical no consumen `NAME_START`.
12. Un código o token protegido previo sí participa en la posición lexical y puede hacer que el conector siguiente sea `INTERNAL`.
13. La puntuación no se modifica mediante el catálogo.
14. La lista no se extiende desde una biblioteca lingüística general.

---

#### 14. Precedencia antes de aplicar un conector

La clasificación conjunta conserva este orden estricto:

```text
1. excepción oficial FULL_VALUE compatible
2. excepción oficial PHRASE compatible más larga
3. excepción oficial TOKEN compatible
4. protección STRUCTURED_COMPONENT o técnica compatible
5. conector exacto del catálogo
6. palabra ordinaria elegible
7. preservación ambigua o bloqueo
```

Consecuencias:

- una forma oficial de marca puede contener una palabra del catálogo sin ser reescrita por la regla de conector;
- una sigla o unidad de una letra no se convierte en conector por coincidencia textual;
- una excepción suspendida o retirada no participa como regla vigente;
- un conflicto no se resuelve escogiendo la primera coincidencia;
- el orden físico de un catálogo no modifica la precedencia.

---

#### 15. Identidad del catálogo de excepciones

La identidad se conserva exactamente:

```text
VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0
```

El catálogo protege o emite formas oficiales de marcas, siglas, unidades y nombres legales sin convertir apariencia, frecuencia o coincidencia parcial en autoridad.

Invariantes:

1. toda excepción es explícita, versionada y acotada;
2. una forma observada no se vuelve oficial por frecuencia;
3. una entrada exige autoridad, evidencia, owner y alcance;
4. una excepción no amplía una clase, representación o fuente incompatible;
5. una coincidencia no crea identidad ni duplicidad;
6. los originales protegidos no se sobrescriben;
7. los aliases se declaran explícitamente;
8. las entradas candidatas no son ejecutables hasta una decisión canónica aprobada.

---

#### 16. Familias canónicas de excepción

| Familia                         | Contexto primario                                                             | Propósito                                    | Frontera                                   |
| ------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------- | ------------------------------------------ |
| `OFFICIAL_BRAND_EXCEPTION`      | `OFFICIAL_BRAND_FORM` o fragmento protegido de `COMMERCIAL_NAME`              | preservar o emitir forma oficial de marca    | forma exacta, alcance y frase completa     |
| `CONTROLLED_ACRONYM_EXCEPTION`  | vocabulario, aplicación, código empresarial, moneda o abreviatura contractual | preservar o emitir sigla o código controlado | token completo y contexto                  |
| `MEASUREMENT_UNIT_EXCEPTION`    | `MEASUREMENT_OR_UNIT_CODE` o componente estructurado                          | validar o emitir código técnico de unidad    | contexto dimensional y componente resuelto |
| `OFFICIAL_LEGAL_NAME_EXCEPTION` | `OFFICIAL_LEGAL_NAME`                                                         | preservar nombre legal completo respaldado   | valor completo, procedencia y vigencia     |

Las cuatro familias son cerradas para la versión `1.0.0`.

---

#### 17. Contrato lógico mínimo de una excepción

Toda entrada deberá poder expresar como mínimo:

```text
exception_key
family
canonical_form
scope_kind
domain_scope
entity_scope
field_scope
semantic_class
representation_role
source_role
language_profile
match_mode
accepted_variants
application_mode
authority_type
authority_owner
evidence_reference
status
valid_from
valid_to
catalog_version
supersedes
reason
```

Conciliación:

```text
atributos mínimos esperados = 23
atributos materializados = 23
faltantes = 0
duplicados = 0
```

Reglas:

1. `exception_key` es estable y no depende de la forma visible.
2. `canonical_form` preserva Unicode, caja, tildes, signos, separación y puntuación aprobados.
3. `accepted_variants` vacío no habilita comparación flexible.
4. clase, representación y fuente deben ser compatibles con el descriptor del campo.
5. `catalog_version` es explícita.
6. una entrada incompleta no es ejecutable.
7. un consumidor no rellena atributos ausentes mediante heurística.

---

#### 18. Alcances cerrados de coincidencia

| Alcance                | Definición                                 | Uso principal                                      |
| ---------------------- | ------------------------------------------ | -------------------------------------------------- |
| `FULL_VALUE`           | la entrada cubre todo el valor             | nombres legales y formas oficiales completas       |
| `PHRASE`               | secuencia contigua con fronteras completas | marcas compuestas y denominaciones embebidas       |
| `TOKEN`                | token lexical completo                     | siglas, códigos y marcas de un token               |
| `STRUCTURED_COMPONENT` | componente previamente interpretado        | unidades, monedas y códigos técnicos estructurados |

`PHRASE` y `TOKEN` nunca coinciden como subcadena de otra palabra, código, URL, correo, ruta o identificador.

---

#### 19. Modos cerrados de coincidencia

| Modo             | Regla                                                                                 | Prohibiciones                                                  |
| ---------------- | ------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| `EXACT`          | coincidencia exacta con forma o variante registrada                                   | no modificar caja, tildes, signos o espacios para forzar match |
| `CASEFOLD_EXACT` | comparar caja conservando caracteres, diacríticos, puntuación, separación y fronteras | no `unaccent`, transliteración, compactación ni similitud      |
| `EXPLICIT_ALIAS` | coincidencia exacta con alias expresamente aprobado                                   | no generar aliases automáticamente                             |

No existen matchers de distancia de edición, fonética, prefijo, sufijo, subcadena, token parcial o búsqueda tolerante dentro de este catálogo.

---

#### 20. Modos cerrados de aplicación

| Modo                    | Conducta                                                                        |
| ----------------------- | ------------------------------------------------------------------------------- |
| `PRESERVE_MATCHED_FORM` | conservar exactamente la forma recibida cuando no se permite reescritura        |
| `EMIT_CANONICAL_FORM`   | emitir la forma oficial desde una variante autorizada en una coordenada mutable |
| `VALIDATE_ONLY`         | validar pertenencia al catálogo sin reescribir                                  |
| `DERIVE_ONLY`           | producir una representación separada sin modificar el origen                    |

`EMIT_CANONICAL_FORM` solo puede modificar:

```text
PRIMARY_VALUE + AUTHORITATIVE_SOURCE
```

o, dentro de alcance explícito:

```text
DISPLAY_OVERRIDE + APPROVED_OVERRIDE
```

Una representación externa, histórica, probatoria o una copia no autoritativa conserva sus restricciones.

---

#### 21. Resultados cerrados de evaluación de excepciones

| Resultado                        | Significado                                                                                    |
| -------------------------------- | ---------------------------------------------------------------------------------------------- |
| `EXCEPTION_CANONICAL_EMITTED`    | una variante aprobada produjo la forma canónica dentro de un alcance mutable                   |
| `EXCEPTION_PRESERVED_OFFICIAL`   | se conservó una forma oficial u original protegido                                             |
| `EXCEPTION_VALIDATED_NO_REWRITE` | se validó un código o componente sin reescribirlo                                              |
| `EXCEPTION_DERIVATION_ONLY`      | se produjo una representación separada y vinculada                                             |
| `EXCEPTION_NOT_APPLICABLE`       | no existe entrada compatible con la coordenada                                                 |
| `EXCEPTION_AMBIGUOUS_REVIEW`     | existe evidencia insuficiente o más de una interpretación válida                               |
| `EXCEPTION_POLICY_BLOCKED`       | falta o entra en conflicto una versión, fuente, clase, alcance, estado o evidencia obligatoria |

Los siete resultados no son estados de commit ni de persistencia.

---

#### 22. Tipos de autoridad

| Tipo de autoridad                       | Puede respaldar                                                  | Restricción                                              |
| --------------------------------------- | ---------------------------------------------------------------- | -------------------------------------------------------- |
| `INTERNAL_CANONICAL_OWNER`              | marcas propias, aplicaciones, códigos y vocabularios de Vento OS | owner empresarial y alcance explícitos                   |
| `BRAND_OWNER_OR_MANUFACTURER`           | grafía de marca externa y aliases aceptados                      | no mezclar marca con descripción o modelo                |
| `LEGAL_OR_REGULATORY_SOURCE`            | nombre legal completo y vigencia                                 | conservar jurisdicción, fecha y procedencia              |
| `CONTROLLED_STANDARD_OR_DOMAIN_CATALOG` | unidades, monedas y códigos técnicos                             | declarar significado, contexto y versión                 |
| `APPROVED_EXTERNAL_EVIDENCE`            | original recibido y posible mapping interno                      | no convierte el original en autoridad empresarial global |

No constituyen autoridad suficiente por sí solos:

- frecuencia de una forma;
- valor más reciente;
- caja observada;
- uso en una interfaz;
- nombre de tabla o columna;
- resultado de búsqueda no incorporado como evidencia aprobada;
- inferencia del desarrollador o consumidor.

---

#### 23. Ciclo de vida de entradas de excepción

Los estados de ejecución se conservan exactamente:

| Estado      | Conducta                                                                                         |
| ----------- | ------------------------------------------------------------------------------------------------ |
| `ACTIVE`    | participa en decisiones nuevas dentro de su versión y alcance                                    |
| `SUSPENDED` | no participa en decisiones nuevas; conserva historia y provoca bloqueo o revisión según contexto |
| `RETIRED`   | no participa en decisiones nuevas; permanece para reconstrucción histórica                       |

Una versión nueva no reactiva silenciosamente una entrada retirada ni reinterpreta decisiones históricas.

---

#### 24. Precedencia y especificidad de excepciones

Precedencia por tipo de coincidencia:

```text
FULL_VALUE compatible
        ↓
PHRASE compatible más larga
        ↓
TOKEN compatible
        ↓
STRUCTURED_COMPONENT compatible
        ↓
conector exacto
        ↓
palabra ordinaria
        ↓
preservación / revisión / bloqueo
```

Dentro del mismo nivel, la especificidad se resuelve:

```text
campo
→ entidad
→ dominio
→ política transversal
```

Reglas:

1. una coordenada más específica no atraviesa una clase incompatible;
2. una frase válida más larga prevalece sobre sus tokens internos;
3. dos entradas activas incompatibles con igual especificidad bloquean la mutación;
4. un alias no prevalece sobre una forma oficial más específica;
5. `SUSPENDED` y `RETIRED` no participan en decisiones nuevas;
6. la resolución no depende de fecha de inserción, orden de consulta o primer resultado.

---

#### 25. Formas normativas iniciales de marca

Las formas aprobadas son exactamente:

| Forma canónica | Alcance compatible      | Coincidencia     | Regla principal                                                            |
| -------------- | ----------------------- | ---------------- | -------------------------------------------------------------------------- |
| `3M`           | `TOKEN` o `FULL_VALUE`  | `CASEFOLD_EXACT` | preservar o emitir forma oficial; no coincidir dentro de modelos o códigos |
| `iPhone`       | `TOKEN` o `PHRASE`      | `CASEFOLD_EXACT` | conservar capitalización interna                                           |
| `Coca-Cola`    | `PHRASE` o `FULL_VALUE` | `CASEFOLD_EXACT` | conservar guion; `Coca Cola` no es alias implícito                         |

Conciliación:

```text
marcas esperadas = 3
marcas materializadas = 3
faltantes = 0
duplicados = 0
```

Estas entradas demuestran forma contractual; no afirman por sí mismas existencia actual de producto, proveedor o relación comercial.

---

#### 26. Formas normativas iniciales de siglas y códigos controlados

| Grupo                 | Formas canónicas                                   | Alcance principal                                             |
| --------------------- | -------------------------------------------------- | ------------------------------------------------------------- |
| aplicaciones Vento OS | `NEXO`, `VISO`, `ORIGO`, `NUMERA`, `FOGO`, `PULSO` | token contextual; preservar o emitir forma contractual        |
| códigos empresariales | `VGR`, `SAU`, `VCF`                                | token contextual; validación o emisión técnica según campo    |
| moneda                | `COP`                                              | token o componente estructurado; validación o emisión técnica |

Conciliación:

```text
formas esperadas = 10
formas materializadas = 10
faltantes = 0
duplicados = 0
```

Una secuencia en mayúsculas no se convierte en sigla por apariencia.

---

#### 27. Formas normativas iniciales de unidades y familias técnicas

| Grupo              | Formas canónicas          | Regla                                                         |
| ------------------ | ------------------------- | ------------------------------------------------------------- |
| símbolos de medida | `g`, `kg`, `ml`, `l`      | evaluar solo como unidad o componente estructurado compatible |
| códigos de conteo  | `un`, `dz`                | evaluar solo como unidad o componente estructurado compatible |
| familias técnicas  | `count`, `mass`, `volume` | `VALIDATE_ONLY` salvo contrato técnico posterior              |

Conciliación:

```text
formas esperadas = 9
formas materializadas = 9
faltantes = 0
duplicados = 0
```

La aplicación del catálogo no cambia magnitudes, factores de conversión, dimensiones o cantidades.

---

#### 28. Protecciones contextuales de sufijo legal

Dentro de `OFFICIAL_LEGAL_NAME` se protegen exactamente:

```text
SAS
S.A.S.
SA
S.A.
LTDA
CIA
```

Reglas:

1. cada forma se conserva como token exacto dentro del nombre legal completo;
2. las seis formas no son aliases entre sí;
3. no se agregan ni eliminan puntos;
4. no se expanden ni contraen;
5. no se inserta un sufijo ausente;
6. el sufijo aislado no determina identidad ni naturaleza jurídica;
7. conectores, ampersands, guiones y demás signos del nombre legal se preservan según su fuente autorizada;
8. una forma distinta requiere evidencia propia y no se infiere por equivalencia visual.

Conciliación:

```text
protecciones esperadas = 6
protecciones materializadas = 6
faltantes = 0
duplicados = 0
```

---

#### 29. Reconciliación exacta de las 28 formas iniciales

| Grupo                              | Cantidad | Formas                                                                         |
| ---------------------------------- | -------: | ------------------------------------------------------------------------------ |
| marcas                             |        3 | `3M`, `iPhone`, `Coca-Cola`                                                    |
| aplicaciones y códigos controlados |       10 | `NEXO`, `VISO`, `ORIGO`, `NUMERA`, `FOGO`, `PULSO`, `VGR`, `SAU`, `VCF`, `COP` |
| unidades y familias técnicas       |        9 | `g`, `kg`, `ml`, `l`, `un`, `dz`, `count`, `mass`, `volume`                    |
| protecciones contextuales legales  |        6 | `SAS`, `S.A.S.`, `SA`, `S.A.`, `LTDA`, `CIA`                                   |
| **Total**                          |   **28** | **28 formas normativas iniciales**                                             |

Verificación documental:

```text
formas esperadas = 28
formas materializadas = 28
faltantes = 0
duplicados = 0
```

La pertenencia a este inventario no elimina los requisitos de alcance, fuente, representación, estado, evidencia y versión de cada entrada.

---

#### 30. Candidatos que no se activan por esta tarea

Los siguientes casos permanecen fuera de las entradas `ACTIVE` porque la evidencia aprobada no permite promoverlos por inferencia:

##### 30.1 Marcas, grafías o mezclas ambiguas

- `Oster` / `oster`;
- `Wellmix` / `Welmix`;
- `Volnic` / `VOLNIC PALLOMARO`;
- `Daza` / `acero daza`;
- `MODELO DUC 72 R`;
- `TORNADO MODELO (TH33M.110.)`;
- `Hatsu`;
- `Vento`;
- `Molka`;
- `Saudo`;
- `Nutella`;
- `Klim`;
- `Kraft`;
- `Kinder Bueno`.

Decisión conservada: preservar o someter a la decisión de revisión ya gobernada por `DATA-NORM-ARC-007`; cuando afecte identidad o duplicidad, se conserva además la frontera de `DATA-NORM-ARC-010`.

##### 30.2 Siglas y códigos contextuales no activados

- `BBQ`;
- `HIT`;
- `AA`;
- `CMS`;
- `PAM`;
- `REF`;
- `T26`;
- `WIP`;
- `AVSA`;
- `FC`;
- `SVV`.

Decisión conservada: mayúsculas, longitud o frecuencia no bastan para clasificarlos como sigla ejecutable.

##### 30.3 Formas estructurales o léxicas fuera del catálogo de excepciones

- `Botellla`;
- `Costo`;
- `1`;
- `presentacion`;
- `piezas`;
- `bolsas`;
- `Six Pack`;
- `six_pack`;
- `Bolsa 1 kg`.

Decisión conservada: no se convierten en aliases, unidades o correcciones por similitud. La ortografía pertenece a `SHELL-NORM-005`; la estructura, identidad o revisión permanecen en sus contratos propietarios cuando correspondan.

Ningún candidato anterior se añade a las 28 formas normativas iniciales.

---

#### 31. Aliases explícitos y prohibición de extensiones locales

1. Un alias pertenece a una sola entrada compatible dentro de una coordenada resoluble.
2. Todo alias requiere motivo, fuente, alcance, vigencia y versión.
3. `CASEFOLD_EXACT` no crea aliases persistidos.
4. Caja, `unaccent`, eliminación de signos, compactación, frecuencia o similitud no generan aliases.
5. Una variante de puntuación o separación requiere `EXPLICIT_ALIAS` si llega a aprobarse.
6. Una variante ortográfica que cambia letras no se absorbe como alias por conveniencia.
7. Un consumidor no mantiene un suplemento local del catálogo.
8. Un cliente no puede convertir un candidato de revisión en entrada activa.
9. Una nueva forma oficial exige evolución canónica del catálogo correspondiente.

---

#### 32. Separación frente al diccionario ortográfico

`SHELL-NORM-004` no resuelve correcciones ortográficas ordinarias.

```text
EXCEPCIÓN OFICIAL
≠ CORRECCIÓN ORTOGRÁFICA
```

Por tanto:

- `3M`, `iPhone` y `Coca-Cola` se gobiernan como formas oficiales;
- una sigla o unidad se gobierna por catálogo contextual;
- un nombre legal se preserva por autoridad documental;
- una falta ortográfica aprobada para corrección pertenece al diccionario de `SHELL-NORM-005`;
- un término ambiguo se conserva hasta revisión;
- una excepción oficial tiene precedencia sobre una corrección ortográfica ordinaria cuando ambas pudieran coincidir.

`SHELL-NORM-005` permanece como único propietario de la centralización del diccionario ortográfico versionado.

---

#### 33. Representaciones, fuentes y preservación

| Coordenada                                   | Conducta                                                                      |
| -------------------------------------------- | ----------------------------------------------------------------------------- |
| `PRIMARY_VALUE` + `AUTHORITATIVE_SOURCE`     | puede emitir forma oficial si política, clase, alcance y versión lo autorizan |
| `DISPLAY_OVERRIDE` + `APPROVED_OVERRIDE`     | puede emitir forma oficial dentro del alcance del override                    |
| `EXTERNAL_ORIGINAL` + `EXTERNAL_EVIDENCE`    | preservar forma y procedencia; derivación interna separada                    |
| `HISTORICAL_SNAPSHOT` + `IMMUTABLE_SNAPSHOT` | no reinterpretar ni resincronizar por nueva versión                           |
| `AUDIT_EVIDENCE`                             | preservar evidencia; correcciones posteriores son aditivas                    |
| `OUTPUT_PROJECTION` + `OUTPUT_ONLY`          | puede derivar forma autorizada sin retroalimentar la fuente                   |
| cualquier `SYNCHRONIZED_COPY`                | no mantener catálogo propio ni originar corrección independiente              |

Material firmado, secretos, checksums y firmas permanecen bajo `PRESERVE_EXACT`; un catálogo textual no autoriza alterarlos.

---

#### 34. Determinismo, versionado e idempotencia

Para conectores, la misma entrada, coordenada y conjunto de versiones debe resolver:

- el mismo token reconocido;
- la misma posición;
- la misma entrada de catálogo;
- la misma forma emitida;
- la misma precedencia;
- la misma ambigüedad o bloqueo.

Para excepciones, debe resolver:

- la misma entrada compatible;
- el mismo alcance;
- el mismo modo de coincidencia;
- la misma forma emitida o preservada;
- el mismo resultado;
- el mismo conflicto o bloqueo.

Invariantes:

```text
apply_connectors(apply_connectors(value, context), context)
=
apply_connectors(value, context)

apply_exception(apply_exception(value, context), context)
=
apply_exception(value, context)
```

si entrada, contexto y versiones son los mismos.

No se permite:

- `latest` implícito;
- locale implícito;
- catálogo mutable no versionado;
- prioridad por orden físico;
- fallback a lista local;
- selección por primer resultado;
- reinterpretación silenciosa de snapshots o evidencia histórica.

---

#### 35. Frontera frente a búsqueda, identidad y unicidad

Los dos catálogos permanecen fuera de la autoridad estructural.

```text
misma forma oficial
≠ misma entidad

mismo resultado de conector
≠ misma entidad

misma excepción
≠ duplicado confirmado
```

Por tanto:

1. no crean claves empresariales;
2. no activan constraints de unicidad;
3. no seleccionan sobrevivientes;
4. no desactivan registros;
5. no reasignan relaciones;
6. no convierten `SEARCH_DERIVATION` en identidad;
7. no usan similitud o ranking para elegir una forma oficial;
8. cualquier decisión de identidad continúa bajo `DATA-NORM-ARC-010`.

---

#### 36. VITAL

VITAL permanece fuera de los catálogos transversales de Vento OS.

Compartir infraestructura, tipos o un futuro package no autoriza:

- aplicar los 18 conectores a campos de VITAL;
- aplicar las 28 formas normativas iniciales a VITAL;
- importar excepciones de Vento como autoridad de VITAL;
- asumir que una coincidencia de forma entre productos transfiere semántica.

Una eventual adopción requerirá contrato propio y aprobación explícita de su frontera.

---

#### 37. Estado de materialización física

| Elemento                                              | Estado                                                 |
| ----------------------------------------------------- | ------------------------------------------------------ |
| `@vento/data-normalization`                           | `ESPECIFICADO`; package físico no materializado        |
| tipos compartidos de `SHELL-NORM-002`                 | `ESPECIFICADOS`                                        |
| reglas de `SHELL-NORM-003`                            | `ESPECIFICADAS`                                        |
| `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0`      | centralizado documentalmente; runtime no materializado |
| 18 conectores                                         | `ESPECIFICADOS`                                        |
| 3 posiciones y 5 resultados de conectores             | `ESPECIFICADOS`                                        |
| `VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0`         | centralizado documentalmente; runtime no materializado |
| 4 familias de excepción                               | `ESPECIFICADAS`                                        |
| 4 alcances, 3 matchers, 4 aplicaciones y 7 resultados | `ESPECIFICADOS`                                        |
| 28 formas normativas iniciales                        | `ESPECIFICADAS`                                        |
| candidatos no activables                              | preservados fuera de entradas activas                  |
| diccionario ortográfico                               | no desarrollado aquí; `SHELL-NORM-005`                 |
| archivos TypeScript                                   | `NO IMPLEMENTADOS`                                     |
| schemas runtime                                       | `NO IMPLEMENTADOS`                                     |
| consumidores migrados                                 | `0` por esta tarea                                     |
| cambios Supabase                                      | `0`                                                    |
| requisitos de prueba creados o modificados            | `0`                                                    |

`ESPECIFICADO` no equivale a `IMPLEMENTADO` ni a `VALIDADO` en runtime.

---

#### 38. Handoffs exactos

| Materia fuera de esta tarea                                               | Propietario exacto                                          | Condición de salida                                                                  |
| ------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| diccionario ortográfico versionado                                        | `SHELL-NORM-005`                                            | correcciones léxicas cerradas permanecen separadas de excepciones oficiales          |
| búsqueda y comparación                                                    | `SHELL-NORM-006`                                            | derivaciones tolerantes no modifican el valor mostrado ni definen identidad          |
| previsualización                                                          | `SHELL-NORM-007`                                            | preview consume versiones exactas sin adquirir autoridad de commit                   |
| metadata de versión y auditoría                                           | `SHELL-NORM-008`                                            | cada evaluación queda atribuible a versiones, entrada, resultado y contexto          |
| pruebas de idempotencia y conservación semántica                          | `SHELL-NORM-009`                                            | corpus demuestra paridad, repetición estable y protección de formas                  |
| materialización física del package                                        | `SHELL-CI-020::<package_id>` después de la puerta aplicable | crear y desplegar únicamente el package autorizado                                   |
| persistencia, backfills, constraints, índices y triggers de normalización | `DATA-NORM-DB-001..010`                                     | ejecutar solo dentro del package autorizado cuando el alcance incluya BLOQUE R       |
| candidatos ambiguos de marca, sigla, unidad o forma oficial               | `DATA-NORM-ARC-007`                                         | conservar la decisión de revisión y evidencia aprobada antes de cualquier activación |
| identidad o duplicidad asociada a candidatos                              | `DATA-NORM-ARC-010`                                         | resolver estructura y relaciones sin inferir identidad desde texto                   |

No se crea un identificador de tarea adicional.

---

#### 39. Cobertura de prueba vigente no modificada

La conducta centralizada ya está protegida por requisitos canónicos vigentes.

Cobertura principal:

- `TREQ-DATA-054` a `TREQ-DATA-068`: catálogo cerrado de 18 conectores, matching lexical, posición, fronteras, secuencias, atomicidad, conjunciones, precedencia, separación de operaciones, fuentes, paridad, idempotencia y corpus;
- `TREQ-DATA-069` a `TREQ-DATA-086`: cuatro familias de excepción, contrato de entrada, scopes y matchers cerrados, precedencia, marcas, candidatos, siglas, unidades, nombres legales, sufijos, aliases, vigencia, fuentes, paridad, separación de operaciones y corpus;
- `TREQ-DATA-037` a `TREQ-DATA-053`: perfil de capitalización, tokenización, precedencia y fronteras que consumen ambos catálogos;
- `TREQ-DATA-158`: prohibición de dependencias semánticas implícitas;
- `TREQ-DATA-203` y `TREQ-DATA-204`: colocación autorizada de normalización determinista y reglas léxicas;
- `TREQ-SHELL-002`: implementación compartida frente a copias locales;
- `TREQ-SHELL-006`: pruebas propias y compatibilidad de packages antes de adopción.

`SHELL-NORM-004` no cambia ninguna regla protegida por esos requisitos; fija su proyección compartida dentro de la futura superficie de `@vento/data-normalization`.

---

#### 40. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-NORM-004` centraliza sin ampliar dos catálogos, sus entradas, modos, precedencias, protecciones, candidatos y reglas ya aprobados y ya protegidos por requisitos canónicos vigentes. No introduce una entrada nueva, un alias nuevo, una familia nueva, un modo nuevo, un algoritmo nuevo, una regla de negocio nueva, una autorización, una persistencia, una migración, un cambio de datos ni un cambio en Supabase. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 41. Decisiones vinculantes

1. El catálogo de conectores compartido es exactamente `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0`.
2. El catálogo contiene exactamente 18 entradas.
3. Las 18 entradas son `a`, `al`, `con`, `de`, `del`, `e`, `el`, `en`, `la`, `las`, `lo`, `los`, `o`, `para`, `por`, `sin`, `u` y `y`.
4. Las tres familias de conectores son descriptivas y no constituyen gramática ejecutable.
5. Los conectores se reconocen únicamente como tokens lexicales completos.
6. No existe coincidencia por subcadena.
7. `al` y `del` son atómicos.
8. No se contraen ni expanden expresiones.
9. No se ejecutan sustituciones `y`/`e` ni `o`/`u`.
10. Las posiciones de conector son `NAME_START`, `DECLARED_SEGMENT_START` e `INTERNAL`.
11. `INTERNAL` es posición de conector y no renombra `NO_SEGMENT_RESET`.
12. Existen exactamente cinco resultados cerrados de conector.
13. El catálogo de excepciones compartido es exactamente `VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0`.
14. Las familias de excepción son exactamente cuatro.
15. El contrato lógico de entrada conserva 23 atributos mínimos.
16. Los alcances de coincidencia son exactamente `FULL_VALUE`, `PHRASE`, `TOKEN` y `STRUCTURED_COMPONENT`.
17. Los matchers son exactamente `EXACT`, `CASEFOLD_EXACT` y `EXPLICIT_ALIAS`.
18. No existe matching difuso dentro del catálogo de excepciones.
19. Los modos de aplicación son exactamente cuatro.
20. Los resultados cerrados de excepción son exactamente siete.
21. Los tipos de autoridad materializados son exactamente cinco.
22. Los estados ejecutables del catálogo de excepciones son `ACTIVE`, `SUSPENDED` y `RETIRED`.
23. Solo `ACTIVE` participa en decisiones nuevas.
24. La precedencia es `FULL_VALUE` → frase compatible más larga → `TOKEN` → `STRUCTURED_COMPONENT` → conector → palabra ordinaria → preservación o bloqueo.
25. La especificidad dentro de un nivel es campo → entidad → dominio → política transversal.
26. Un conflicto de igual especificidad bloquea la mutación.
27. Las formas iniciales de marca son exactamente `3M`, `iPhone` y `Coca-Cola`.
28. Las formas iniciales de aplicaciones y códigos son exactamente `NEXO`, `VISO`, `ORIGO`, `NUMERA`, `FOGO`, `PULSO`, `VGR`, `SAU`, `VCF` y `COP`.
29. Las formas iniciales de unidades y familias técnicas son exactamente `g`, `kg`, `ml`, `l`, `un`, `dz`, `count`, `mass` y `volume`.
30. Las protecciones contextuales de sufijo legal son exactamente `SAS`, `S.A.S.`, `SA`, `S.A.`, `LTDA` y `CIA`.
31. Las seis protecciones legales no son aliases entre sí.
32. El total de formas normativas iniciales es 28: 22 de emisión o validación y 6 protecciones legales contextuales.
33. Los candidatos sin autoridad suficiente permanecen fuera de entradas activas.
34. Una palabra en mayúsculas no se clasifica automáticamente como sigla.
35. Una unidad solo se evalúa en contexto unitario o componente estructurado resuelto.
36. Un nombre legal se preserva como valor completo respaldado, no se reconstruye desde tokens.
37. Todo alias es explícito, acotado, versionado y respaldado.
38. Las excepciones oficiales no ejecutan corrección ortográfica.
39. El diccionario ortográfico pertenece a `SHELL-NORM-005`.
40. La búsqueda pertenece a `SHELL-NORM-006`.
41. Los originales externos, snapshots y evidencia conservan su frontera de preservación.
42. Los catálogos no crean identidad, unicidad, deduplicación ni fusión.
43. VITAL no hereda estos catálogos.
44. No se crea package físico, TypeScript, SQL, RPC, trigger, índice, constraint, migración o backfill.
45. No se modifica Supabase.
46. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
47. `SHELL-NORM-005` queda como única continuidad reservada.

---

#### 42. Hallazgos y destinos exactos

| Hallazgo                                                                                  | Resultado de `SHELL-NORM-004`                  | Destino exacto                                              |
| ----------------------------------------------------------------------------------------- | ---------------------------------------------- | ----------------------------------------------------------- |
| los conectores ya estaban definidos en E3 pero no centralizados en la familia SHELL-NORM  | catálogo completo centralizado documentalmente | `SHELL-NORM-004`                                            |
| las excepciones ya estaban definidas en E3 pero no centralizadas en la familia SHELL-NORM | catálogo completo centralizado documentalmente | `SHELL-NORM-004`                                            |
| existen candidatos de marca, sigla y forma oficial sin autoridad suficiente               | permanecen sin activación automática           | `DATA-NORM-ARC-007`                                         |
| algunos candidatos pueden implicar identidad o duplicidad                                 | ninguna coincidencia textual decide estructura | `DATA-NORM-ARC-010`                                         |
| las correcciones ortográficas no pertenecen al catálogo de excepciones                    | frontera preservada                            | `SHELL-NORM-005`                                            |
| búsqueda tolerante, aliases de búsqueda y similitud permanecen separados                  | frontera preservada                            | `SHELL-NORM-006`                                            |
| el package compartido aún no está materializado físicamente                               | especificación completa; ejecución no iniciada | `SHELL-CI-020::<package_id>` después de la puerta aplicable |
| persistencia y enforcement de normalización pertenecen a BLOQUE R                         | sin cambio físico                              | `DATA-NORM-DB-001..010`                                     |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 43. Criterios de aceptación

`SHELL-NORM-004` queda documentalmente completa cuando se cumplen simultáneamente:

1. se centralizan exactamente los dos catálogos aprobados por E3;
2. no se crea una tercera fuente de catálogos;
3. el catálogo de conectores conserva identidad y versión exactas;
4. las 18 entradas aparecen exactamente una vez;
5. faltantes de conectores = 0;
6. duplicados de conectores = 0;
7. las tres familias descriptivas no amplían el catálogo;
8. se preservan las tres posiciones normativas;
9. `INTERNAL` no se confunde con `NO_SEGMENT_RESET`;
10. se preservan los cinco resultados cerrados de conectores;
11. el reconocimiento se limita a token lexical completo;
12. subcadenas y formas con signos no se aceptan como conectores;
13. `al` y `del` permanecen atómicos;
14. no existen contracciones ni expansiones automáticas;
15. no existen sustituciones automáticas entre conjunciones;
16. las excepciones preceden a los conectores;
17. el catálogo de excepciones conserva identidad y versión exactas;
18. se materializan las cuatro familias de excepción;
19. se materializan los 23 atributos mínimos de entrada;
20. se materializan los cuatro alcances de coincidencia;
21. se materializan los tres matchers;
22. se materializan los cuatro modos de aplicación;
23. se materializan los siete resultados de excepción;
24. se materializan los cinco tipos de autoridad;
25. se materializan los tres estados de ciclo de vida;
26. solo `ACTIVE` participa en decisiones nuevas;
27. la precedencia de excepciones está completa y ordenada;
28. la especificidad campo-entidad-dominio-transversal está preservada;
29. conflictos de igual especificidad fallan cerrados;
30. las 3 formas de marca están completas;
31. las 10 formas de siglas y códigos están completas;
32. las 9 formas de unidades y familias técnicas están completas;
33. las 6 protecciones legales están completas;
34. el total de formas normativas iniciales es 28;
35. faltantes de formas iniciales = 0;
36. duplicados de formas iniciales = 0;
37. las 6 protecciones legales no son aliases entre sí;
38. los candidatos sin autoridad no son promovidos;
39. no se crean aliases implícitos;
40. no se usa frecuencia, caja o similitud como autoridad;
41. no se introduce corrección ortográfica;
42. no se introduce búsqueda tolerante;
43. no se introduce identidad, unicidad ni fusión;
44. representaciones y fuentes protegidas no se reescriben;
45. mismas entradas, contexto y versiones producen mismo resultado lógico;
46. las evaluaciones son idempotentes bajo las mismas versiones;
47. no existe `latest` implícito;
48. no existe fallback a lista local;
49. VITAL permanece separado;
50. no se crea código ni package físico;
51. no se modifica Supabase;
52. no se crean ni modifican requisitos de prueba;
53. todos los carryovers tienen propietario exacto;
54. la siguiente tarea permanece únicamente reservada.

---

#### 44. Límites

`SHELL-NORM-004` no:

- crea físicamente `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts` o `.tsx`;
- define exports físicos;
- selecciona librerías runtime;
- crea schemas Zod, JSON Schema u otros schemas serializados;
- modifica `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0`;
- modifica `VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0`;
- agrega conectores;
- agrega familias de excepción;
- agrega formas oficiales;
- activa candidatos ambiguos;
- genera aliases desde heurísticas;
- corrige ortografía;
- agrega tildes;
- traduce;
- translitera;
- expande siglas;
- convierte unidades;
- modifica cantidades o factores;
- reconstruye nombres legales;
- implementa búsqueda;
- implementa similitud;
- implementa preview;
- implementa auditoría física;
- persiste catálogos;
- transforma datos existentes;
- crea SQL;
- crea RPC;
- crea triggers;
- crea índices;
- crea constraints;
- ejecuta backfills;
- modifica RLS;
- modifica Supabase;
- migra consumidores;
- redefine `DATA-NORM-ARC-001..012`;
- desarrolla `SHELL-NORM-005`.

---

#### 45. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización

##### TAREA ACTUAL APROBADA

SHELL-NORM-004 — Centralizar conectores y excepciones

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados


### [ ] SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados
### [ ] SHELL-NORM-006 — Crear normalización de búsqueda y comparación
### [ ] SHELL-NORM-007 — Crear previsualización de transformaciones
### [ ] SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas
### [ ] SHELL-NORM-009 — Probar idempotencia y conservación semántica

Regla:

`@vento/data-normalization`
→ contiene funciones puras, tipos, diccionarios y validadores compartidos

BLOQUE R
→ implementa únicamente persistencia, backfills, funciones SQL,
  constraints, índices y triggers defensivos
