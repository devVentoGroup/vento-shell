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


### [ ] SHELL-NORM-002 — Centralizar tipos de campo normalizable
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
