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


### [ ] SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización
### [ ] SHELL-NORM-004 — Centralizar conectores y excepciones
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
