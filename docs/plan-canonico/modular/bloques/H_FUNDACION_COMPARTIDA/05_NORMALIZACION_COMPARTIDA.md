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
- definir algoritmos concretos de espacios, Unicode, puntuación de prosa o capitalización;
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

| Familia de contenido                                    | Estado en esta tarea       | Propietario de especialización |
| ------------------------------------------------------- | -------------------------- | ------------------------------ |
| identidad y envelope del package                        | `DEFINIDO_DOCUMENTALMENTE` | `SHELL-NORM-001`               |
| tipos de campo normalizable                             | `RESERVADO`                | `SHELL-NORM-002`               |
| espacios, Unicode, puntuación de prosa y capitalización | `RESERVADO`                | `SHELL-NORM-003`               |
| conectores y excepciones                                | `RESERVADO`                | `SHELL-NORM-004`               |
| diccionarios ortográficos versionados                   | `RESERVADO`                | `SHELL-NORM-005`               |
| búsqueda y comparación                                  | `RESERVADO`                | `SHELL-NORM-006`               |
| previsualización de transformaciones                    | `RESERVADO`                | `SHELL-NORM-007`               |
| metadatos de versión y auditoría                        | `RESERVADO`                | `SHELL-NORM-008`               |
| pruebas de idempotencia y conservación semántica        | `RESERVADO`                | `SHELL-NORM-009`               |

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

| Trabajo                                                 | Propietario exacto | Condición de salida                                                                                                                         |
| ------------------------------------------------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| tipos de campo normalizable                             | `SHELL-NORM-002`   | tipos compartidos alineados con clasificación semántica, representación y fuente aprobadas                                                  |
| espacios, Unicode, puntuación de prosa y capitalización | `SHELL-NORM-003`   | reglas deterministas delimitadas, puntuación fail closed por política y ausencia de Title Case universal o corrección ortográfica implícita |
| conectores y excepciones                                | `SHELL-NORM-004`   | catálogos y precedencia coherentes con E3, sin extensiones locales no versionadas                                                           |
| diccionarios ortográficos                               | `SHELL-NORM-005`   | entradas cerradas, versionadas, direccionales y gobernadas                                                                                  |
| búsqueda y comparación                                  | `SHELL-NORM-006`   | derivaciones separadas de identidad, unicidad y valor mostrado                                                                              |
| previsualización                                        | `SHELL-NORM-007`   | preview reproducible y no vinculante, con divergencia revalidable antes de commit                                                           |
| metadatos de versión y auditoría                        | `SHELL-NORM-008`   | resultados atribuibles a versiones, contexto y evidencia sin convertir logs en fuente de verdad                                             |
| idempotencia y conservación semántica                   | `SHELL-NORM-009`   | corpus y pruebas demuestran repetición estable, paridad y ausencia de degradación semántica                                                 |

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

| Hallazgo                                                                                                         | Estado                                                                      | Destino exacto                                                                                         |
| ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| el mini-bloque exige un package compartido de normalización y el corte físico actual no acredita su existencia   | resuelto documentalmente en cuanto a identidad y frontera; físico pendiente | `SHELL-NORM-001`; futura ejecución mediante `E5-GATE-008::<package_id>` → `SHELL-CI-020::<package_id>` |
| los tipos de campo normalizable aún no están centralizados en la familia SHELL-NORM                              | reservado                                                                   | `SHELL-NORM-002`                                                                                       |
| las reglas de espacios, Unicode, puntuación de prosa y capitalización requieren superficie compartida específica | reservado                                                                   | `SHELL-NORM-003`                                                                                       |
| conectores y excepciones requieren materialización compartida sin catálogos locales                              | reservado                                                                   | `SHELL-NORM-004`                                                                                       |
| el diccionario ortográfico requiere materialización compartida versionada                                        | reservado                                                                   | `SHELL-NORM-005`                                                                                       |
| búsqueda y comparación requieren implementación compartida sin convertirse en identidad                          | reservado                                                                   | `SHELL-NORM-006`                                                                                       |
| preview debe materializarse sin adquirir autoridad de commit                                                     | reservado                                                                   | `SHELL-NORM-007`                                                                                       |
| versión y auditoría del motor compartido deben quedar atribuibles                                                | reservado                                                                   | `SHELL-NORM-008`                                                                                       |
| idempotencia, paridad y conservación semántica requieren certificación del package                               | reservado                                                                   | `SHELL-NORM-009`                                                                                       |
| almacenamiento, funciones SQL, derivaciones, backfills, constraints, índices y triggers pertenecen a BLOQUE R    | fuera del alcance                                                           | `DATA-NORM-DB-001..010`                                                                                |
| pruebas, build, release, compatibilidad y actualización de consumidores pertenecen a BLOQUE T                    | fuera del alcance                                                           | `SHELL-CI-001`; `SHELL-CI-002`; `SHELL-CI-003`; `SHELL-CI-005`; `SHELL-CI-006`                         |

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

- algoritmo de espacios, Unicode, puntuación de prosa o capitalización;
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

| Materia no desarrollada aquí                                                                         | Propietario exacto                                          | Condición de salida                                                                                           |
| ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| espacios, Unicode, puntuación de prosa y capitalización                                              | `SHELL-NORM-003`                                            | contratos compartidos respetan tipos, exclusiones, política de campo y fallo cerrado sin Title Case universal |
| conectores y excepciones                                                                             | `SHELL-NORM-004`                                            | catálogos compartidos consumen clase, representación y fuente sin extensiones locales                         |
| diccionarios ortográficos                                                                            | `SHELL-NORM-005`                                            | entradas versionadas operan solo sobre coordenadas tipadas elegibles                                          |
| búsqueda y comparación                                                                               | `SHELL-NORM-006`                                            | derivaciones tipadas permanecen separadas de identidad y valor mostrado                                       |
| previsualización                                                                                     | `SHELL-NORM-007`                                            | preview usa descriptores y modos compartidos sin adquirir autoridad de commit                                 |
| versión y auditoría                                                                                  | `SHELL-NORM-008`                                            | decisiones pueden atribuir tipos, versiones y contexto sin reinterpretación local                             |
| pruebas de idempotencia y conservación semántica                                                     | `SHELL-NORM-009`                                            | corpus certifica taxonomías, repetición estable y ausencia de degradación semántica                           |
| materialización física del package                                                                   | `SHELL-CI-020::<package_id>` después de la puerta aplicable | crear y desplegar únicamente el package aprobado                                                              |
| almacenamiento, SQL, búsqueda física, backfills, constraints, índices, triggers y auditoría de datos | `DATA-NORM-DB-001..010`                                     | ejecutar exclusivamente dentro del package autorizado cuando el alcance incluya BLOQUE R                      |

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
26. no se crea algoritmo de espacios, Unicode, puntuación de prosa o capitalización;
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
**Tipo de tarea:** Documental; centralización normativa de las reglas deterministas compartidas de composición Unicode, espacios, puntuación de prosa y capitalización empresarial dentro de `@vento/data-normalization`, preservando literalmente los tipos, perfiles, operaciones, exclusiones, precedencias, resultados y fronteras ya aprobados por BLOQUE E3, sin crear código, package físico, exports TypeScript, catálogos de conectores o excepciones, diccionarios, persistencia, migraciones ni cambios en Supabase
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
- espaciado alrededor de puntuación de prosa únicamente bajo política explícita del campo;
- capitalización empresarial de campos `COMMERCIAL_NAME` bajo el perfil `es-CO`.

La tarea no crea una política lingüística paralela. Su función es trasladar de forma consumible y sin pérdida semántica las decisiones de `DATA-NORM-ARC-001..003`, incluida la operación `PROSE_PUNCTUATION_SPACING` tipada por `DATA-NORM-ARC-002`, usando los tipos cerrados de `SHELL-NORM-002` y conservando las dependencias posteriores que siguen perteneciendo a `SHELL-NORM-004..009`.

Resultado conceptual:

```text
POLÍTICA DE CAMPO + TIPOS COMPARTIDOS
        ↓
OPERACIÓN EXPLÍCITA + VERSIONES EXPLÍCITAS
        ↓
UNICODE / ESPACIOS / PUNTUACIÓN DE PROSA / CAPITALIZACIÓN
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
4. `PROSE_PUNCTUATION_SPACING`;
5. `COMMERCIAL_CAPITALIZATION`;
6. `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`;
7. las nueve clases de token de capitalización;
8. los seis resultados de token permitidos;
9. las tres fronteras de segmento.

La tarea define para esas reglas:

- precondiciones de aplicación;
- conducta determinista;
- límites por clase, representación y fuente;
- separación entre operaciones;
- preservación de originales y separadores significativos;
- semántica Unicode explícita;
- tratamiento de espacios autorizado por política;
- contrato compartido de `PROSE_PUNCTUATION_SPACING`, restringido al delta de espaciado que una política de campo declare explícitamente;
- secuencia normativa de capitalización;
- clasificación y precedencia de tokens;
- conducta de caja ordinaria;
- relación con conectores y excepciones sin materializar sus catálogos;
- conducta ante ambigüedad, conflicto o contexto incompleto;
- invariantes de idempotencia, reproducibilidad y compatibilidad.

No se crean nuevos literales de operación, clases, resultados, fronteras, estados de negocio o identificadores de catálogo.

---

#### 3. Fuentes normativas y precedencia

| Fuente               | Decisión preservada por esta tarea                                                                                                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-NORM-001`     | identidad y frontera de `@vento/data-normalization`; funciones puras, determinismo, ausencia de I/O y separación frente a persistencia                                                |
| `SHELL-NORM-002`     | 14 clases semánticas, 7 roles de representación, 6 roles de fuente, 8 modos, 13 operaciones y descriptores lógicos compartidos                                                        |
| `DATA-NORM-ARC-001`  | política por dominio, entidad, campo, representación, fuente y versión; reglas de prosa solo por política explícita; ausencia de regla universal y comportamiento cerrado             |
| `DATA-NORM-ARC-002`  | operaciones `UNICODE_CANONICALIZATION`, `EDGE_WHITESPACE_TRIM`, `INTERNAL_WHITESPACE_COMPACTION`, `PROSE_PUNCTUATION_SPACING` y `COMMERCIAL_CAPITALIZATION`; intersección restrictiva |
| `DATA-NORM-ARC-003`  | perfil `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`, algoritmo de caja, tokenización, precedencia, fronteras, exclusiones e idempotencia                                             |
| `DATA-NORM-ARC-004`  | catálogo definitivo de conectores y su conducta posicional, consumido pero no materializado por esta tarea                                                                            |
| `DATA-NORM-ARC-005`  | excepciones oficiales y formas protegidas, consumidas como precedencia pero no materializadas por esta tarea                                                                          |
| `DATA-NORM-ARC-006`  | corrección ortográfica y tildes mediante diccionario; permanece estrictamente separada de capitalización                                                                              |
| `DATA-NORM-ARC-007`  | revisión humana de ambigüedades y conflictos; esta tarea solo conserva el resultado de revisión requerida                                                                             |
| `DATA-NORM-ARC-008`  | búsqueda y comparación; conserva separación entre normalización de valor mostrado y derivaciones de búsqueda                                                                          |
| `DATA-NORM-ARC-009`  | versiones explícitas, reproducibilidad, determinismo, idempotencia y prohibición de dependencias implícitas                                                                           |
| `DATA-NORM-ARC-010`  | identidad, unicidad y duplicidad separadas de cualquier equivalencia textual                                                                                                          |
| `DATA-NORM-ARC-011`  | servicio de dominio como autoridad semántica y RPC como frontera de commit; aplicación y trigger no sustituyen esas autoridades                                                       |
| `DATA-NORM-ARC-012`  | preservación de originales externos, encoding, Unicode, locale y semánticas de ausencia                                                                                               |
| `SHELL-PKG-001..008` | distribución, versionado, compatibilidad, deprecación, rollback y adopción del package cuando exista físicamente                                                                      |

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
- contrato compartido de `PROSE_PUNCTUATION_SPACING` para espaciado alrededor de puntuación de prosa únicamente cuando la política del campo lo autoriza;
- capitalización empresarial de `COMMERCIAL_NAME` bajo el perfil aprobado `es-CO`;
- tokenización y recomposición propias de capitalización;
- clases y resultados de token heredados de `DATA-NORM-ARC-003`;
- fronteras de segmento heredadas de `DATA-NORM-ARC-003`;
- reglas de preservación, bloqueo, ambigüedad y conflicto propias de esas operaciones;
- invariantes de determinismo, idempotencia y versión;
- relación exacta con los tipos centralizados por `SHELL-NORM-002`.

Esta tarea no centraliza ni decide:

- una gramática universal de puntuación, una lista global de signos transformables ni reglas de prosa no declaradas por la política del campo;
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
| operaciones deterministas de esta tarea |        5 |             5 |         0 |          0 |
| clases de token de capitalización       |        9 |             9 |         0 |          0 |
| resultados de token                     |        6 |             6 |         0 |          0 |
| fronteras de segmento                   |        3 |             3 |         0 |          0 |
| **Total de literales gobernados**       |   **23** |        **23** |     **0** |      **0** |

Las cinco operaciones son exactamente:

1. `UNICODE_CANONICALIZATION`;
2. `EDGE_WHITESPACE_TRIM`;
3. `INTERNAL_WHITESPACE_COMPACTION`;
4. `PROSE_PUNCTUATION_SPACING`;
5. `COMMERCIAL_CAPITALIZATION`.

`PROSE_PUNCTUATION_SPACING` conserva identidad propia frente a recorte, compactación y capitalización, pero su contrato compartido sí pertenece a `SHELL-NORM-003`.

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

Las cinco operaciones de esta tarea son independientes.

```text
UNICODE_CANONICALIZATION
≠ EDGE_WHITESPACE_TRIM
≠ INTERNAL_WHITESPACE_COMPACTION
≠ PROSE_PUNCTUATION_SPACING
≠ COMMERCIAL_CAPITALIZATION
```

Por tanto:

1. habilitar Unicode no habilita espacios ni puntuación;
2. habilitar recorte o compactación no habilita `PROSE_PUNCTUATION_SPACING`;
3. habilitar `PROSE_PUNCTUATION_SPACING` no habilita capitalización, Unicode, recorte ni compactación;
4. habilitar capitalización no autoriza tocar espacios, puntuación ni composición Unicode;
5. una sola función física futura podrá orquestar varias etapas únicamente si conserva resultados y versiones distinguibles;
6. el orden de etapas habilitadas deberá formar parte del perfil o política efectiva cuando más de una operación participe;
7. si el orden requerido no puede resolverse de manera explícita, la evaluación se bloquea;
8. la salida de una etapa puede ser entrada de otra solo como una transición explícita y trazable;
9. la capitalización nunca oculta que su entrada fue modificada previamente por otra etapa.

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

#### 15. `PROSE_PUNCTUATION_SPACING` y separación frente a espacios

`PROSE_PUNCTUATION_SPACING` queda centralizada por `SHELL-NORM-003` como la quinta operación determinista compartida de esta tarea. Su responsabilidad es estrictamente el **espaciado alrededor de puntuación de prosa** que una política de campo haya autorizado de forma explícita.

La propiedad documental queda cerrada así:

| Materia                                                                    | Propietario exacto                       | Responsabilidad                                                                                   |
| -------------------------------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------- |
| elegibilidad por dominio, entidad, campo, representación, fuente y versión | `DATA-NORM-ARC-001`; `DATA-NORM-ARC-002` | decidir si la coordenada puede usar la operación y con qué modo efectivo                          |
| contrato compartido de `PROSE_PUNCTUATION_SPACING`                         | `SHELL-NORM-003`                         | fijar delta permitido, preservaciones, fallo cerrado, determinismo e idempotencia                 |
| colocación de una mutación autorizada                                      | `DATA-NORM-ARC-011`                      | servicio de dominio decide; RPC confirma; aplicación solo previsualiza; trigger no inventa reglas |

La operación no crea una gramática universal ni un catálogo global de signos. Solo puede ejecutarse cuando la política efectiva declare suficientemente el tratamiento de prosa aplicable a la coordenada.

Reglas obligatorias:

1. `PROSE_PUNCTUATION_SPACING` no se fusiona con `EDGE_WHITESPACE_TRIM` ni con `INTERNAL_WHITESPACE_COMPACTION`;
2. el único delta textual permitido es el espaciado inmediatamente relacionado con la puntuación que la política de campo haya declarado elegible;
3. la operación no agrega, elimina, sustituye ni reordena signos de puntuación;
4. la operación no cambia palabras, tildes, caja, Unicode, conectores, ortografía, estructura o identidad;
5. `FREE_TEXT` solo resulta elegible cuando su política declara reglas de prosa y estas no alteran autoría, evidencia, plantillas, Markdown, saltos de línea ni formatos significativos;
6. `HUMAN_LABEL`, `ADDRESS_OR_LOCATION_TEXT`, identificadores técnicos, formatos numéricos, URLs, códigos y estructuras compuestas no heredan una regla de puntuación por semejanza visual;
7. `EXTERNAL_ORIGINAL`, `HISTORICAL_SNAPSHOT`, `AUDIT_EVIDENCE`, `EXTERNAL_EVIDENCE`, `IMMUTABLE_SNAPSHOT` y material firmado conservan sus restricciones de preservación;
8. si la política no declara de forma suficiente qué espaciado es transformable, el valor se preserva y la automatización queda bloqueada o en revisión según el modo efectivo;
9. una observación como espacio antes de un signo o ausencia de espacio posterior constituye evidencia de auditoría, no permiso de corrección;
10. una política local, helper, regex o preferencia visual del consumidor no puede sustituir la política propietaria;
11. la misma entrada, coordenada, política y versiones debe producir el mismo resultado lógico;
12. reaplicar la operación sobre su propia salida bajo el mismo contrato no produce un segundo cambio;
13. el resultado de esta operación no crea búsqueda, alias, identidad, unicidad, deduplicación, fusión ni autoridad de commit.

Separación exacta:

```text
EDGE_WHITESPACE_TRIM
→ bordes autorizados

INTERNAL_WHITESPACE_COMPACTION
→ separadores internos accidentales autorizados

PROSE_PUNCTUATION_SPACING
→ espaciado de puntuación de prosa autorizado por política explícita

COMMERCIAL_CAPITALIZATION
→ caja de tokens elegibles sin alterar puntuación ni espacios
```

No queda pendiente una tarea adicional para definir la propiedad compartida de `PROSE_PUNCTUATION_SPACING`: la operación pertenece a `SHELL-NORM-003`; su elegibilidad permanece gobernada por `DATA-NORM-ARC-001` y `DATA-NORM-ARC-002`, y su eventual confirmación física conserva la colocación de `DATA-NORM-ARC-011`.

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

Puntuación de prosa:

```text
punctuation_spacing_rule(punctuation_spacing_rule(value, policy), policy)
=
punctuation_spacing_rule(value, policy)
```

para la misma política de campo, alcance y versión; la operación no introduce ni retira signos y no actúa si el delta de espaciado no está explícitamente resuelto.

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
| `PROSE_PUNCTUATION_SPACING`                          | contrato compartido `ESPECIFICADO`; código no materializado          |
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
- `TREQ-DATA-203`: colocación autorizada de recorte, espacios, Unicode, capitalización y puntuación en la arquitectura de ejecución;
- `TREQ-DATA-232`: locale, Unicode y encoding explícitos y versionados;
- `TREQ-SHELL-002`: implementación compartida y paridad frente a copias locales;
- `TREQ-SHELL-006`: pruebas propias y compatibilidad del package antes de publicación o adopción.

La tarea no amplía ninguna de esas obligaciones. Las centraliza en la futura superficie compartida sin introducir comportamiento ejecutable nuevo.

---

#### 39. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-NORM-003` traslada al contrato compartido reglas de Unicode, espacios, puntuación de prosa y capitalización ya aprobadas y ya cubiertas por requisitos canónicos vigentes. No crea una operación nueva, un algoritmo lingüístico nuevo, una clase nueva, un perfil nuevo, un catálogo nuevo, una regla de búsqueda, una autorización, una persistencia, una migración ni un cambio de datos. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 40. Decisiones vinculantes

1. Las operaciones centralizadas son exactamente `UNICODE_CANONICALIZATION`, `EDGE_WHITESPACE_TRIM`, `INTERNAL_WHITESPACE_COMPACTION`, `PROSE_PUNCTUATION_SPACING` y `COMMERCIAL_CAPITALIZATION`.
2. Las cinco operaciones permanecen independientes.
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
13. `PROSE_PUNCTUATION_SPACING` queda centralizada por `SHELL-NORM-003` como operación separada, fail closed y sin gramática universal; su elegibilidad permanece en la política de campo de `DATA-NORM-ARC-001` y `DATA-NORM-ARC-002`.
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
26. El inventario total gobernado por esta tarea es de 23 literales, con 0 faltantes y 0 duplicados.
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

1. las cinco operaciones propietarias están identificadas sin aliases;
2. el inventario de cinco operaciones está completo;
3. las nueve clases de token están completas;
4. los seis resultados de token están completos;
5. las tres fronteras de segmento están completas;
6. el total conciliado es 23 literales;
7. faltantes = 0;
8. duplicados = 0;
9. cada operación exige política y versión explícitas;
10. Unicode, espacios, puntuación de prosa y capitalización permanecen como etapas separadas;
11. no existe orden implícito cuando varias etapas participan;
12. la composición Unicode autorizada se limita a NFC;
13. no se introducen formas de compatibilidad Unicode;
14. se conservan diacríticos y `ñ`;
15. no existe transliteración implícita;
16. edge trim se restringe a bordes declarados no significativos;
17. compaction se restringe a separadores declarados accidentales;
18. formato significativo permanece protegido por defecto;
19. `PROSE_PUNCTUATION_SPACING` tiene propietario exacto en `SHELL-NORM-003`, exige política explícita y nunca se sustituye por recorte, compactación o una regla universal;
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
34. Unicode, espacios y puntuación de prosa no crean identidad;
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
- crea una gramática universal de puntuación o una lista global de signos transformables;
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


### ✅ SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-004 — Centralizar conectores y excepciones
**Tarea siguiente:** SHELL-NORM-006 — Crear normalización de búsqueda y comparación
**Tipo de tarea:** Documental; centralización normativa del diccionario ortográfico canónico versionado dentro de `@vento/data-normalization`, preservando literalmente la identidad, entradas iniciales, contratos, alcances, precedencia, estados, resultados, gobierno y fronteras ya aprobados por `DATA-NORM-ARC-006`, sin crear código, package físico, APIs TypeScript definitivas, persistencia, migraciones, backfills ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** ESPECIFICADO; NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-005` centraliza dentro de la futura superficie compartida de `@vento/data-normalization` el diccionario ortográfico canónico ya aprobado para Vento OS, de modo que una corrección léxica autorizada no dependa de listas locales, autocorrectores, similitud, frecuencia, herramientas del runtime ni decisiones aisladas de una aplicación.

La tarea no redefine el gobierno de normalización. Proyecta de forma compartida el contrato aprobado en `DATA-NORM-ARC-006`:

```text
POLÍTICA CANÓNICA DE CAMPO
        ↓
TIPOS Y ELEGIBILIDAD SHELL-NORM-002
        ↓
FORMA / CAPITALIZACIÓN SHELL-NORM-003
        ↓
CONECTORES Y EXCEPCIONES SHELL-NORM-004
        ↓
DICCIONARIO ORTOGRÁFICO SHELL-NORM-005
        ↓
RESULTADO TEXTUAL DETERMINISTA O PRESERVACIÓN / REVISIÓN / BLOQUEO
```

Regla central:

```text
DICCIONARIO ORTOGRÁFICO
=
ENTRADAS APROBADAS
+ ALCANCE EXPLÍCITO
+ COINCIDENCIA DIRECCIONAL EXACTA
+ EVIDENCIA Y APROBACIÓN
+ VERSIONADO Y VIGENCIA
+ RESULTADOS CERRADOS

≠ AUTOCORRECCIÓN POR SIMILITUD
≠ CATÁLOGO DE MARCAS O EXCEPCIONES
≠ BÚSQUEDA TOLERANTE
≠ IDENTIDAD
≠ FUSIÓN
```

---

#### 2. Resultado material de la tarea

Queda centralizado documentalmente el artefacto canónico preexistente:

```text
VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0
```

La centralización materializa en esta tarea:

1. un perfil lingüístico explícito: `es-CO`;
2. 21 atributos mínimos del contrato lógico de una entrada;
3. 3 alcances cerrados de coincidencia;
4. la coincidencia direccional exacta y la prohibición de inferir reversibilidad;
5. el modo de proyección de caja `PRESERVE_RESOLVED_CASE_PATTERN`;
6. 3 modos cerrados de decisión;
7. 4 niveles explícitos de resolución de alcance;
8. la precedencia general de 8 niveles frente a excepciones, protecciones y otras entradas;
9. exactamente 3 correcciones iniciales activables por contrato;
10. la exclusión explícita de `expresso` de cualquier corrección automática;
11. 11 condiciones de activación;
12. 6 estados cerrados de ciclo de vida;
13. 7 resultados cerrados de evaluación;
14. gobierno de altas, cambios, suspensión, supersesión y retiro;
15. no retroactividad y rollback lógico;
16. reglas de procedencia, evidencia, autoridad, determinismo, paridad e idempotencia;
17. corpus mínimo de conformidad heredado;
18. fronteras frente a búsqueda, identidad, persistencia, integraciones y VITAL.

No se crea una versión nueva del diccionario ni una entrada adicional.

---

#### 3. Fuentes normativas y precedencia

| Fuente               | Decisión preservada por `SHELL-NORM-005`                                                                                                                                 |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `SHELL-NORM-001`     | identidad y frontera de `@vento/data-normalization`; pureza, determinismo, ausencia de I/O y separación frente a persistencia                                            |
| `SHELL-NORM-002`     | clases semánticas, representaciones, fuentes, modos y operación `APPROVED_DICTIONARY_CORRECTION`                                                                         |
| `SHELL-NORM-003`     | capitalización y proyección de caja separadas de la ortografía; el diccionario consume una caja ya resuelta                                                              |
| `SHELL-NORM-004`     | conectores y excepciones oficiales con precedencia superior al diccionario; prohibición de absorber marcas, siglas, unidades o nombres legales como corrección ordinaria |
| `DATA-NORM-ARC-001`  | política por dominio, entidad, campo, representación, fuente y versión; fallo cerrado                                                                                    |
| `DATA-NORM-ARC-002`  | elegibilidad tipada y exclusiones por clase, representación y fuente                                                                                                     |
| `DATA-NORM-ARC-003`  | separación estricta entre caja y ortografía                                                                                                                              |
| `DATA-NORM-ARC-004`  | conectores versionados sin sustituciones lingüísticas heurísticas                                                                                                        |
| `DATA-NORM-ARC-005`  | catálogo de excepciones oficiales y protecciones técnicas de mayor precedencia                                                                                           |
| `DATA-NORM-ARC-006`  | contenido completo de `VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0`                                                                                              |
| `DATA-NORM-ARC-007`  | revisión humana para `expresso`, ambigüedades y conflictos no resolubles automáticamente                                                                                 |
| `DATA-NORM-ARC-008`  | búsqueda, transliteración y comparación tolerante separadas del valor corregido                                                                                          |
| `DATA-NORM-ARC-009`  | persistencia futura de versiones, vigencias, trazas, evidencia y auditoría                                                                                               |
| `DATA-NORM-ARC-010`  | identidad, unicidad, duplicidad y fusión separadas de cualquier convergencia ortográfica                                                                                 |
| `DATA-NORM-ARC-011`  | capa ejecutora y paridad entre aplicación, servicio, RPC, procesos programados y trigger defensivo                                                                       |
| `DATA-NORM-ARC-012`  | preservación de originales externos y procedencia                                                                                                                        |
| `SHELL-PKG-001..008` | distribución, compatibilidad, versionado, deprecación, rollback y adopción cuando el package exista físicamente                                                          |

Precedencia normativa:

```text
GOBIERNO E3
        ↓
TIPOS SHELL-NORM-002
        ↓
FORMA SHELL-NORM-003
        ↓
EXCEPCIONES Y PROTECCIONES SHELL-NORM-004
        ↓
DICCIONARIO SHELL-NORM-005
        ↓
BÚSQUEDA / PREVIEW / AUDITORÍA / PRUEBAS EN SUS TAREAS PROPIETARIAS
```

Una entrada de diccionario nunca amplía una clase, representación, fuente o política bloqueada.

---

#### 4. Frontera exacta

Esta tarea centraliza exclusivamente:

- identidad y versión del diccionario `es-CO`;
- contrato lógico de entradas;
- formas de origen y formas canónicas aprobadas;
- coincidencia exacta, direccional y por fronteras completas;
- preservación del patrón de caja ya resuelto;
- alcances y precedencias;
- modos de decisión;
- estados y vigencia;
- resultados cerrados;
- condiciones de activación;
- reglas de conflicto y fallo cerrado;
- evidencia, autoridad, aprobación y procedencia;
- supersesión, no retroactividad y rollback lógico;
- determinismo, paridad e idempotencia;
- corpus de conformidad heredado;
- exclusiones y handoffs exactos.

Esta tarea no centraliza ni decide:

- nuevas palabras o correcciones no aprobadas por E3;
- la resolución de `expresso`;
- marcas, siglas, unidades o nombres legales como entradas ortográficas ordinarias;
- catálogo de conectores;
- búsqueda tolerante, transliteración, stemming, lematización o similitud;
- identidad, unicidad, deduplicación, fusión o selección de sobreviviente;
- cola física o interfaz de revisión humana;
- persistencia de entradas, trazas o evidencia;
- API TypeScript definitiva;
- schemas runtime concretos;
- SQL, RPC, trigger, índice, constraint, migración o backfill;
- adopción por consumidores;
- cambios en Supabase.

---

#### 5. Conciliación del inventario heredado

| Familia contractual                         | Esperado por E3 | Materializado aquí | Faltantes | Duplicados |
| ------------------------------------------- | --------------: | -----------------: | --------: | ---------: |
| perfil lingüístico                          |               1 |                  1 |         0 |          0 |
| atributos mínimos de entrada                |              21 |                 21 |         0 |          0 |
| alcances de coincidencia                    |               3 |                  3 |         0 |          0 |
| modos de decisión                           |               3 |                  3 |         0 |          0 |
| niveles explícitos de resolución de alcance |               4 |                  4 |         0 |          0 |
| correcciones iniciales                      |               3 |                  3 |         0 |          0 |
| estados de ciclo de vida                    |               6 |                  6 |         0 |          0 |
| resultados cerrados                         |               7 |                  7 |         0 |          0 |
| condiciones de activación                   |              11 |                 11 |         0 |          0 |
| niveles de precedencia general              |               8 |                  8 |         0 |          0 |

`PRESERVE_RESOLVED_CASE_PATTERN` se conserva como regla explícita de proyección de caja del contrato; no se cuenta como una familia adicional de modos de decisión.

---

#### 6. Identidad, perfil y versión

La identidad compartida es exactamente:

```text
VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0
```

Invariantes:

1. el perfil es `es-CO` explícito;
2. el perfil no se infiere desde sistema operativo, navegador, proceso o base de datos;
3. la versión fija entradas, alcances, precedencia, segmentación compatible, proyección de caja y resultados cerrados;
4. modificar forma de origen, forma canónica, alcance, estado, evidencia o precedencia exige evolución versionada;
5. no existe diccionario paralelo por aplicación, capa o consumidor;
6. una librería lingüística genérica no sustituye el catálogo canónico;
7. otro idioma o producto requiere identidad, alcance, pruebas y aprobación propios;
8. VITAL no participa en este diccionario transversal.

---

#### 7. Contrato lógico de una entrada

Toda entrada conserva exactamente estos 21 atributos mínimos:

```text
dictionary_entry_key
locale
source_form
canonical_form
match_scope
semantic_class
domain_scope
entity_scope
field_scope
representation_role
source_role
case_projection_mode
decision_mode
status
valid_from
valid_to
dictionary_version
supersedes
evidence_reference
approval_reference
reason
```

Conciliación:

```text
atributos esperados = 21
atributos materializados = 21
faltantes = 0
duplicados = 0
```

Reglas:

1. `dictionary_entry_key` es estable y no depende del texto visible;
2. `source_form` y `canonical_form` preservan Unicode, signos, separación y estructura aprobados;
3. `source_form` no puede ser vacío ni equivaler a `canonical_form` bajo la comparación propia de la entrada;
4. `match_scope` pertenece al catálogo cerrado de esta tarea;
5. clase, representación y fuente deben ser compatibles con `SHELL-NORM-002`;
6. `case_projection_mode` preserva la caja resuelta; no ejecuta capitalización nueva;
7. `evidence_reference` y `approval_reference` son obligatorios para activar una entrada;
8. una entrada incompleta no es ejecutable;
9. persistencia física y auditoría no se definen en esta tarea.

---

#### 8. Alcances cerrados de coincidencia

| Alcance      | Definición                                                    | Uso permitido                                                                      |
| ------------ | ------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `FULL_VALUE` | cubre todo el valor textual                                   | corrección aprobada del valor completo dentro de coordenada y contexto específicos |
| `PHRASE`     | secuencia contigua y exacta de tokens con fronteras completas | locución cuya corrección no puede resolverse token por token                       |
| `TOKEN`      | token lexical completo                                        | palabra ordinaria con corrección aprobada                                          |

Reglas:

1. los tres alcances son cerrados;
2. toda coincidencia exige fronteras completas;
3. una entrada `TOKEN` no coincide como subcadena;
4. una entrada `PHRASE` no atraviesa valor, componente estructurado, campo, representación o fuente;
5. una frase parcial o un solapamiento sin resolución única produce conflicto;
6. no existe matching difuso dentro del diccionario.

---

#### 9. Coincidencia direccional exacta

La evaluación preserva simultáneamente:

1. comparación de la forma de origen mediante casefold Unicode compatible con `es-CO`;
2. conservación de diacríticos, signos, separación y fronteras durante el matching;
3. coincidencia exacta del alcance declarado;
4. dirección exclusiva `source_form` → `canonical_form`;
5. prohibición de inferir la corrección inversa;
6. prohibición de retirar tildes para ampliar coincidencias;
7. prohibición de compactar espacios, cambiar Unicode, sustituir signos o unir/dividir palabras durante el matching.

No son fuentes de coincidencia:

- distancia de edición;
- similitud;
- fonética;
- autocorrección del navegador, sistema operativo o teclado;
- stemming;
- lematización;
- frecuencia;
- popularidad;
- forma mayoritaria;
- modelo lingüístico;
- aliases automáticos.

---

#### 10. Proyección de caja

El modo preservado es exactamente:

```text
PRESERVE_RESOLVED_CASE_PATTERN
```

La entrada ortográfica no vuelve a capitalizar. Proyecta la corrección sobre el patrón de caja ya resuelto por la etapa anterior.

Ejemplos contractuales:

```text
maiz → maíz
Maiz → Maíz
MAIZ → MAÍZ
```

Reglas:

1. la proyección de caja no modifica la política de capitalización;
2. un patrón no resoluble bloquea la mutación;
3. una entrada no inventa capitalización interna;
4. la misma entrada, caja resuelta y versiones deben producir la misma salida;
5. `Maíz` ya canónico se distingue de una mutación nueva mediante resultado cerrado propio.

---

#### 11. Modos cerrados de decisión

| Modo                   | Conducta                                                                                                    |
| ---------------------- | ----------------------------------------------------------------------------------------------------------- |
| `REPLACE_ORTHOGRAPHY`  | emite la forma canónica cuando entrada, autoridad, política, clase, representación y fuente son compatibles |
| `PRESERVE_AS_APPROVED` | conserva una forma válida dentro de un alcance específico e impide que una regla más amplia la reescriba    |
| `REVIEW_REQUIRED`      | conserva el valor y declara que la decisión necesita revisión humana                                        |

Conciliación:

```text
modos esperados = 3
modos materializados = 3
faltantes = 0
duplicados = 0
```

Una entrada de preservación o revisión conserva la misma exigencia de alcance, evidencia, aprobación, vigencia y versión que una entrada de reemplazo.

---

#### 12. Catálogo inicial aprobado

La versión `1.0.0` contiene exactamente tres correcciones iniciales:

| Clave lógica                  | Origen    | Forma canónica | Alcance | Modo                  | Restricción                                                      |
| ----------------------------- | --------- | -------------- | ------- | --------------------- | ---------------------------------------------------------------- |
| `ORTHO_ES_CO_MAIZ_MAIZ`       | `maiz`    | `maíz`         | `TOKEN` | `REPLACE_ORTHOGRAPHY` | palabra ordinaria no protegida dentro de clase y campo elegibles |
| `ORTHO_ES_CO_CLASICO_CLASICO` | `clasico` | `clásico`      | `TOKEN` | `REPLACE_ORTHOGRAPHY` | palabra ordinaria no protegida dentro de clase y campo elegibles |
| `ORTHO_ES_CO_FRIO_FRIO`       | `frio`    | `frío`         | `TOKEN` | `REPLACE_ORTHOGRAPHY` | palabra ordinaria no protegida dentro de clase y campo elegibles |

Conciliación:

```text
entradas iniciales esperadas = 3
entradas iniciales materializadas = 3
faltantes = 0
duplicados = 0
```

La versión no contiene ninguna cuarta corrección por analogía.

---

#### 13. Exclusión explícita de `expresso`

`expresso` no pertenece a las correcciones automáticas de `1.0.0`.

Cuando no exista una decisión contextual suficiente, se conserva el valor y se produce:

```text
DICTIONARY_AMBIGUOUS_REVIEW
```

La ambigüedad puede corresponder a:

- error ortográfico;
- denominación comercial;
- nombre histórico;
- marca;
- producto externo;
- término extranjero;
- variante deliberada.

Quedan prohibidas las sustituciones automáticas hacia `espresso`, `expreso` o cualquier otra forma. La resolución humana pertenece a `DATA-NORM-ARC-007`.

---

#### 14. Puerta de activación

El diccionario solo interviene cuando se cumplen simultáneamente estas 11 condiciones:

1. existe una política activa para dominio, entidad y campo;
2. la clase semántica admite corrección mediante diccionario;
3. representación y rol de fuente permiten mutación o derivación;
4. el perfil lingüístico es `es-CO`;
5. la versión del diccionario es compatible con capitalización, conectores y excepciones;
6. la entrada está `APPROVED_ACTIVE` y dentro de vigencia;
7. coincidencia exacta y fronteras pueden resolverse;
8. no existe excepción oficial o protección de mayor precedencia;
9. no existe conflicto entre entradas activas aplicables;
10. la proyección de caja puede resolverse determinísticamente;
11. decisión, entrada y versiones pueden quedar trazadas.

La ausencia de cualquiera de estas condiciones preserva el valor y produce un resultado de bloqueo, no aplicación o revisión según corresponda.

---

#### 15. Clases, representaciones y fuentes elegibles

| Dimensión             | Elegible                                                                     | Conducta                                                              |
| --------------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| clase semántica       | `COMMERCIAL_NAME` y otra clase expresamente autorizada por política de campo | aplicar únicamente entradas compatibles con la clase declarada        |
| representación        | `PRIMARY_VALUE` mutable o `DISPLAY_OVERRIDE` aprobado                        | corregir dentro del alcance autorizado                                |
| fuente                | `AUTHORITATIVE_SOURCE` o `APPROVED_OVERRIDE`                                 | permitir mutación trazable                                            |
| proyección            | `OUTPUT_PROJECTION`                                                          | derivar sin retroalimentar la fuente                                  |
| copia sincronizada    | `SYNCHRONIZED_COPY`                                                          | recibir resultado por propagación gobernada; no corregirse localmente |
| original externo      | `EXTERNAL_ORIGINAL`                                                          | preservar exactamente                                                 |
| histórico o evidencia | `HISTORICAL_SNAPSHOT`, `IMMUTABLE_SNAPSHOT`, `AUDIT_EVIDENCE`                | preservar exactamente                                                 |

Bloqueos predeterminados:

- `OFFICIAL_BRAND_FORM`;
- `OFFICIAL_LEGAL_NAME`;
- `MEASUREMENT_OR_UNIT_CODE`;
- `TECHNICAL_IDENTIFIER`;
- `CONTACT_IDENTIFIER`;
- `SECRET_OR_SIGNATURE_MATERIAL`;
- `UNCLASSIFIED_PRESERVE`;
- texto libre sin política propia explícita;
- valores de VITAL.

Una coincidencia textual no elimina ninguno de estos bloqueos.

---

#### 16. Resolución de alcance

La especificidad se conserva exactamente en este orden:

```text
1. FIELD_SCOPE
2. ENTITY_SCOPE
3. DOMAIN_SCOPE
4. VENTO_OS_TRANSVERSAL_SCOPE
5. conservación por ausencia de política
```

Los cuatro primeros son niveles explícitos de alcance; la quinta salida es la conducta cerrada por ausencia de resolución.

Reglas:

1. una entrada más específica prevalece solo dentro de un alcance compatible;
2. una entrada específica no amplía clase, representación o fuente bloqueada;
3. dos entradas activas incompatibles con la misma especificidad producen conflicto;
4. no se elige por fecha, orden físico, frecuencia o consumidor;
5. el alcance transversal debe estar aprobado expresamente;
6. VITAL queda fuera de `VENTO_OS_TRANSVERSAL_SCOPE`.

---

#### 17. Precedencia general

La precedencia completa se centraliza sin alteración:

```text
1. excepción oficial de frase válida más larga
2. excepción oficial de token o componente estructurado
3. protección técnica por clase, representación o fuente
4. entrada de diccionario más específica
5. entrada de frase más larga dentro de la misma especificidad
6. entrada de token exacto
7. token sin entrada
8. forma ambigua o conflictiva
```

Consecuencias:

- `3M`, `iPhone`, `Coca-Cola`, siglas, unidades y nombres legales no se reescriben por una entrada ortográfica ordinaria;
- una entrada de diccionario no altera la posición de conectores;
- una forma repetida no adquiere autoridad por frecuencia;
- un conflicto no se resuelve por orden de carga.

---

#### 18. Frases, tokens y fronteras

1. `PHRASE` precede a `TOKEN` dentro del mismo alcance y versión;
2. entre frases compatibles prevalece la coincidencia válida más larga;
3. cada frase declara exactamente tokens y separadores relevantes;
4. una coincidencia no atraviesa valor, componente, campo, representación o fuente;
5. `TOKEN` no coincide como subcadena;
6. una frase parcial o solapada sin resolución única produce conflicto;
7. el diccionario no agrega, retira ni mueve conectores, signos o palabras.

---

#### 19. Prohibiciones de inferencia

El diccionario compartido no puede utilizar como autoridad:

- Levenshtein u otra distancia de edición;
- matching difuso;
- algoritmos fonéticos;
- autocorrector del navegador, sistema operativo o teclado;
- stemming o lematización;
- singularización o pluralización;
- traducción o transliteración;
- frecuencia, popularidad o mayoría;
- aprendizaje automático no aprobado como autoridad;
- eliminación de tildes para ampliar coincidencias;
- aliases automáticos;
- sustituciones `y`/`e` u `o`/`u`;
- contracciones o expansiones `a el`/`al` o `de el`/`del`;
- unión o división de palabras;
- nombre físico de tabla, columna, aplicación o consumidor.

Una herramienta externa o modelo puede originar un candidato de revisión, nunca una entrada automática.

---

#### 20. Separación de operaciones

| Operación                                  | Pertenece al diccionario | Conducta                                               |
| ------------------------------------------ | ------------------------ | ------------------------------------------------------ |
| reemplazo ortográfico aprobado             | sí                       | aplica una entrada exacta, vigente y trazable          |
| preservación contextual aprobada           | sí                       | bloquea una corrección más amplia dentro de su alcance |
| clasificación como ambigua                 | sí, como resultado       | conserva y deriva a revisión                           |
| recorte o compactación de espacios         | no                       | `SHELL-NORM-003`                                       |
| composición Unicode NFC                    | no                       | `SHELL-NORM-003`                                       |
| capitalización empresarial                 | no                       | `SHELL-NORM-003`                                       |
| conectores                                 | no                       | `SHELL-NORM-004`                                       |
| marcas, siglas, unidades y nombres legales | no                       | `SHELL-NORM-004`                                       |
| búsqueda o comparación tolerante           | no                       | `SHELL-NORM-006`                                       |
| identidad, unicidad o fusión               | no                       | `DATA-NORM-ARC-010`                                    |

Cada operación conserva versión, entrada, salida y traza lógicas propias.

---

#### 21. Estados de ciclo de vida

| Estado            | Ejecutable | Conducta                                                              |
| ----------------- | ---------- | --------------------------------------------------------------------- |
| `DRAFT`           | no         | propuesta incompleta o pendiente de evaluación                        |
| `APPROVED_ACTIVE` | sí         | entrada aprobada, vigente y compatible                                |
| `SUSPENDED`       | no         | entrada temporalmente bloqueada por riesgo, conflicto o investigación |
| `SUPERSEDED`      | no         | reemplazada por otra entrada o versión explícita                      |
| `RETIRED`         | no         | retirada sin sustitución ejecutable                                   |
| `REJECTED`        | no         | propuesta descartada con justificación preservada                     |

Conciliación:

```text
estados esperados = 6
estados materializados = 6
estados ejecutables = 1
faltantes = 0
duplicados = 0
```

Solo `APPROVED_ACTIVE` puede ejecutar `REPLACE_ORTHOGRAPHY` o `PRESERVE_AS_APPROVED`.

---

#### 22. Gobierno de altas y cambios

Toda propuesta de entrada deberá incorporar:

1. forma de origen y forma canónica;
2. locale, alcance y clase;
3. representación y fuente autorizadas;
4. evidencia reproducible;
5. riesgo de falso positivo;
6. consumidores afectados;
7. colisiones con excepciones, conectores y entradas existentes;
8. corpus positivo, negativo y ambiguo;
9. responsable empresarial del dominio afectado;
10. responsable canónico de normalización;
11. decisión y justificación aprobadas.

Reglas:

- una entrada activa no se edita silenciosamente;
- una corrección transversal exige revisión de dominios consumidores identificados;
- una entrada específica no crea precedentes implícitos fuera de su alcance;
- una propuesta ambigua permanece no ejecutable;
- una corrección observada sin entrada activa es desviación, no regla;
- toda brecha conserva propietario documental exacto.

---

#### 23. Versionado, supersesión y rollback lógico

1. todo cambio ejecutable origina una nueva versión o una nueva entrada con `supersedes`;
2. la entrada reemplazada conserva historia y estado `SUPERSEDED`;
3. el cambio no es retroactivo por defecto;
4. corregir datos existentes requiere transición, análisis de impacto, pruebas y rollback propios;
5. revertir exige activar explícitamente una versión anterior compatible o una versión correctiva nueva;
6. rollback no elimina decisiones, evidencia, entradas ni resultados históricos;
7. una versión retirada no reaparece por caché, fallback o consumidor local;
8. artefactos históricos conservan la versión aplicada al momento de su creación.

---

#### 24. Conflictos y fallo cerrado

Se considera conflicto cuando:

- dos entradas activas aplicables producen formas canónicas distintas;
- reemplazo y preservación compiten con la misma especificidad;
- frases aplicables se solapan sin resolución única;
- una entrada contradice una excepción oficial vigente;
- falta compatibilidad de versión entre diccionario y pipeline;
- evidencia o aprobación fue retirada;
- clase, representación, fuente o locale no pueden determinarse;
- la proyección de caja no es determinista.

Ante conflicto:

1. se conserva el valor;
2. no se selecciona por orden físico, fecha o frecuencia;
3. se produce `DICTIONARY_CONFLICT_BLOCKED` o `DICTIONARY_AMBIGUOUS_REVIEW`;
4. se conserva la coordenada y las entradas involucradas;
5. la resolución queda fuera de la mutación automática y mantiene destino en `DATA-NORM-ARC-007` cuando requiere decisión humana.

---

#### 25. Resultados cerrados de evaluación

| Resultado                        | Significado                                                                                  |
| -------------------------------- | -------------------------------------------------------------------------------------------- |
| `DICTIONARY_CANONICAL_EMITTED`   | una entrada activa y compatible produjo la forma canónica                                    |
| `DICTIONARY_ALREADY_CANONICAL`   | el valor ya satisface la entrada aplicable y no requiere cambio                              |
| `DICTIONARY_PRESERVED_PROTECTED` | una excepción, clase, representación, fuente o entrada de preservación bloqueó la corrección |
| `DICTIONARY_NOT_APPLICABLE`      | no existe entrada compatible con la coordenada evaluada                                      |
| `DICTIONARY_AMBIGUOUS_REVIEW`    | la forma requiere decisión humana y se conserva                                              |
| `DICTIONARY_CONFLICT_BLOCKED`    | dos o más decisiones aplicables son incompatibles                                            |
| `DICTIONARY_POLICY_BLOCKED`      | falta política, versión, evidencia, aprobación o contexto obligatorio                        |

Conciliación:

```text
resultados esperados = 7
resultados materializados = 7
faltantes = 0
duplicados = 0
```

Ausencia de cambio, protección, no aplicabilidad, ambigüedad, conflicto y bloqueo permanecen resultados distintos.

---

#### 26. Representaciones, fuentes y propagación

1. `PRIMARY_VALUE` de `AUTHORITATIVE_SOURCE` o `DISPLAY_OVERRIDE` con `APPROVED_OVERRIDE` puede recibir corrección directa si la política lo autoriza;
2. `EXTERNAL_ORIGINAL`, `HISTORICAL_SNAPSHOT`, `IMMUTABLE_SNAPSHOT` y `AUDIT_EVIDENCE` se preservan exactamente;
3. `OUTPUT_PROJECTION` puede derivar una forma corregida sin retroalimentar la fuente;
4. `SEARCH_DERIVATION` conserva su contrato propio y no convierte la forma corregida en identidad;
5. `SYNCHRONIZED_COPY` no ejecuta el diccionario como autoridad independiente;
6. una versión nueva no resincroniza snapshots ni historia;
7. un override conserva su alcance;
8. propagación técnica y eventos permanecen bajo `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

---

#### 27. Procedencia, evidencia y autoridad

Toda decisión ejecutada deberá poder atribuirse lógicamente a:

```text
entrada de diccionario
versión del diccionario
forma de origen
forma canónica
alcance resuelto
clase semántica
representación
rol de fuente
perfil lingüístico
modo de decisión
evidencia
aprobación
fecha de vigencia
```

No constituyen autoridad suficiente por sí solos:

- frecuencia en base de datos;
- forma más reciente;
- preferencia de una interfaz o desarrollador;
- autocorrector o sugerencia de herramienta;
- búsqueda externa no incorporada como evidencia aprobada;
- coincidencia sin tildes;
- salida de un modelo lingüístico;
- nombre de tabla, columna o función.

La persistencia física de esta traza pertenece a `DATA-NORM-ARC-009` y su futura centralización compartida a `SHELL-NORM-008`.

---

#### 28. Determinismo, paridad e idempotencia

Para la misma entrada, coordenada y conjunto de versiones:

```text
apply_dictionary(apply_dictionary(value, context), context)
=
apply_dictionary(value, context)
```

La igualdad lógica cubre:

- valor resultante;
- entrada seleccionada;
- alcance resuelto;
- forma de origen y forma canónica;
- proyección de caja;
- precedencia aplicada;
- resultado cerrado;
- bloqueo o revisión;
- versiones y evidencia referenciadas;
- ausencia de efectos duplicados.

Aplicación, servicio de dominio, RPC, proceso programado y trigger defensivo deberán producir la misma decisión al consumir la misma entrada, coordenada y versiones. La implementación compartida no podrá convertir una revisión en corrección.

---

#### 29. Corpus mínimo de conformidad

La futura materialización deberá conservar como mínimo estos casos aprobados:

| Entrada y contexto                                 | Resultado esperado             | Regla demostrada                                 |
| -------------------------------------------------- | ------------------------------ | ------------------------------------------------ |
| `harina de maiz` después de capitalización         | `Harina de Maíz`               | corrección token y preservación de caja resuelta |
| `pan masa madre clasico` después de capitalización | `Pan Masa Madre Clásico`       | corrección exacta de token                       |
| `latte frio` después de capitalización             | `Latte Frío`                   | corrección de tilde sin cambiar palabras         |
| `MAIZ` en token elegible                           | `MAÍZ`                         | proyección de caja estable                       |
| `Maíz`                                             | `DICTIONARY_ALREADY_CANONICAL` | idempotencia y ausencia de mutación              |
| `expresso` sin decisión contextual                 | conservar y revisar            | ambigüedad no automática                         |
| `Coca-Cola`                                        | conservar                      | precedencia de excepción oficial                 |
| `COMERCIALIZADORA ABC S.A.S.`                      | conservar                      | nombre legal excluido                            |
| `500 g`                                            | conservar                      | cantidad y unidad protegidas                     |
| `product_sku=FRIO`                                 | conservar                      | identificador técnico excluido                   |
| `EXTERNAL_ORIGINAL=maiz`                           | conservar exactamente          | representación externa protegida                 |
| `maizena`                                          | no aplicar                     | subcadena prohibida                              |
| dos entradas con destinos incompatibles            | conservar y bloquear           | conflicto de igual especificidad                 |
| entrada de campo y transversal compatibles         | aplicar la de campo            | precedencia de alcance                           |
| versión retirada en caché                          | bloquear                       | ausencia de fallback                             |

Además deberá cubrir Unicode compuesto, signos, guiones, apóstrofos, frases, fronteras, cajas, clases excluidas, fuentes, overrides, snapshots, conflictos, versiones, múltiples capas e idempotencia.

---

#### 30. Frontera frente a búsqueda

`SHELL-NORM-005` no desarrolla `SHELL-NORM-006`.

Invariantes:

1. la forma corregida no es una clave de búsqueda por sí sola;
2. el diccionario no ejecuta `unaccent`, transliteración, stemming, ranking ni similitud;
3. una forma sin tilde no se convierte en alias de búsqueda por existir como `source_form`;
4. `SEARCH_DERIVATION` se construye bajo su contrato propietario;
5. una coincidencia de búsqueda futura no puede activar una entrada ortográfica no coincidente;
6. búsqueda e identidad permanecen separadas.

---

#### 31. Frontera frente a identidad, unicidad y fusión

La corrección ortográfica no define estructura empresarial.

```text
maiz → maíz

texto corregido igual
≠ misma entidad
```

Por tanto:

1. no crea ni modifica SKU, slug, código, barcode, URL, email, referencia o clave externa;
2. no activa constraints de unicidad;
3. no selecciona registro sobreviviente;
4. no desactiva filas;
5. no reasigna relaciones;
6. no autoriza fusión;
7. una convergencia después de corregir es solo una señal textual;
8. toda identidad o duplicidad continúa bajo `DATA-NORM-ARC-010` y las transiciones propietarias.

---

#### 32. VITAL

VITAL permanece excluido del diccionario transversal de Vento OS.

Compartir infraestructura, tipos o un futuro package no autoriza:

- aplicar `maiz` → `maíz` en VITAL;
- aplicar `clasico` → `clásico` en VITAL;
- aplicar `frio` → `frío` en VITAL;
- reutilizar `VENTO_OS_TRANSVERSAL_SCOPE` dentro de VITAL;
- convertir decisiones de Vento OS en autoridad lingüística de VITAL.

Una eventual adopción requerirá contrato propio y aprobación explícita.

---

#### 33. Estado de materialización física

| Elemento                                                   | Estado                                                 |
| ---------------------------------------------------------- | ------------------------------------------------------ |
| `@vento/data-normalization`                                | `ESPECIFICADO`; package físico no materializado        |
| tipos de `SHELL-NORM-002`                                  | `ESPECIFICADOS`                                        |
| reglas de `SHELL-NORM-003`                                 | `ESPECIFICADAS`                                        |
| catálogos de `SHELL-NORM-004`                              | `ESPECIFICADOS`                                        |
| `VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0`      | centralizado documentalmente; runtime no materializado |
| 21 atributos de entrada                                    | `ESPECIFICADOS`                                        |
| 3 alcances de coincidencia                                 | `ESPECIFICADOS`                                        |
| 3 modos de decisión                                        | `ESPECIFICADOS`                                        |
| 4 niveles explícitos de resolución de alcance              | `ESPECIFICADOS`                                        |
| 3 correcciones iniciales                                   | `ESPECIFICADAS`                                        |
| exclusión automática de `expresso`                         | `ESPECIFICADA`                                         |
| 6 estados de ciclo de vida                                 | `ESPECIFICADOS`                                        |
| 7 resultados cerrados                                      | `ESPECIFICADOS`                                        |
| API TypeScript definitiva                                  | `NO IMPLEMENTADA`                                      |
| schemas runtime                                            | `NO IMPLEMENTADOS`                                     |
| persistencia de entradas, versiones, evidencia y auditoría | `NO IMPLEMENTADA`                                      |
| consumidores migrados                                      | `0` por esta tarea                                     |
| cambios Supabase                                           | `0`                                                    |
| requisitos de prueba creados o modificados                 | `0`                                                    |

`ESPECIFICADO` no equivale a `IMPLEMENTADO` ni a `VALIDADO` en runtime.

---

#### 34. Handoffs exactos

| Materia fuera de esta tarea                                               | Propietario exacto                                          | Condición de salida                                                                        |
| ------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| resolución humana de `expresso` y otras ambigüedades                      | `DATA-NORM-ARC-007`                                         | conservar valor hasta decisión contextual, evidencia y aprobación suficientes              |
| búsqueda, transliteración y comparación tolerante                         | `SHELL-NORM-006`                                            | derivaciones no alteran valor mostrado ni convierten una variante ortográfica en identidad |
| previsualización                                                          | `SHELL-NORM-007`                                            | preview reproduce entrada, salida, decisión y versiones sin autoridad de commit            |
| metadatos de versión y auditoría                                          | `SHELL-NORM-008`                                            | cada evaluación queda atribuible a entrada, versión, alcance, evidencia y resultado        |
| pruebas de idempotencia y conservación semántica                          | `SHELL-NORM-009`                                            | corpus demuestra paridad, repetición estable y ausencia de falsos positivos                |
| materialización física del package                                        | `SHELL-CI-020::<package_id>` después de la puerta aplicable | crear y desplegar únicamente el package autorizado                                         |
| persistencia, backfills, constraints, índices y triggers de normalización | `DATA-NORM-DB-001..010`                                     | ejecutar solo dentro del package autorizado cuando el alcance incluya BLOQUE R             |
| identidad, unicidad, duplicidad o fusión asociadas a convergencia textual | `DATA-NORM-ARC-010`                                         | resolver estructura y relaciones sin inferir identidad desde ortografía                    |

No se crea un identificador de tarea adicional.

---

#### 35. Cobertura de prueba vigente no modificada

La conducta centralizada ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-087` a `TREQ-DATA-104`: identidad y cierre del diccionario, contrato de entrada, matching exacto, scopes, tres correcciones iniciales, exclusión de `expresso`, precedencia, clases/fuentes, separación de operaciones, frases, conflictos, estados, supersesión, procedencia, paridad, corpus y frontera frente a identidad;
- `TREQ-DATA-049`: separación entre capitalización y ortografía;
- `TREQ-DATA-053`: corpus lingüístico de conformidad;
- `TREQ-DATA-069` a `TREQ-DATA-086`: precedencia y protección de excepciones oficiales frente a correcciones ordinarias;
- `TREQ-SHELL-002`: implementación compartida y paridad frente a copias locales;
- `TREQ-SHELL-006`: pruebas propias y compatibilidad de packages antes de publicación o adopción.

`SHELL-NORM-005` no cambia ninguna de esas reglas protegidas; fija su proyección compartida dentro de la futura superficie de `@vento/data-normalization`.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-NORM-005` centraliza sin ampliar el diccionario ortográfico, sus tres entradas iniciales, contratos, estados, resultados, precedencias, bloqueos y reglas de gobierno ya aprobados en `DATA-NORM-ARC-006` y ya protegidos por requisitos canónicos vigentes. No introduce una corrección nueva, un alias nuevo, un scope nuevo, un modo nuevo, un estado nuevo, un resultado nuevo, un algoritmo de similitud, una autorización, una persistencia, una migración, un cambio de datos ni un cambio en Supabase. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 37. Decisiones vinculantes

1. El diccionario compartido es exactamente `VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0`.
2. El perfil lingüístico es exactamente `es-CO`.
3. El perfil nunca se infiere desde el runtime.
4. El contrato lógico de una entrada conserva exactamente 21 atributos mínimos.
5. Los alcances de coincidencia son exactamente `FULL_VALUE`, `PHRASE` y `TOKEN`.
6. El matching es direccional y exacto.
7. No se infiere la dirección inversa.
8. No existe matching por subcadena.
9. No existe matching difuso.
10. No existe matching fonético.
11. No existe matching por distancia de edición.
12. No se eliminan tildes para ampliar coincidencias.
13. `PRESERVE_RESOLVED_CASE_PATTERN` preserva la caja previamente resuelta.
14. El diccionario no vuelve a ejecutar capitalización.
15. Los modos de decisión son exactamente `REPLACE_ORTHOGRAPHY`, `PRESERVE_AS_APPROVED` y `REVIEW_REQUIRED`.
16. Los niveles explícitos de alcance son `FIELD_SCOPE`, `ENTITY_SCOPE`, `DOMAIN_SCOPE` y `VENTO_OS_TRANSVERSAL_SCOPE`.
17. La ausencia de resolución produce preservación, no un quinto scope permisivo.
18. Las correcciones iniciales son exactamente `maiz` → `maíz`, `clasico` → `clásico` y `frio` → `frío`.
19. Las claves de esas entradas son exactamente `ORTHO_ES_CO_MAIZ_MAIZ`, `ORTHO_ES_CO_CLASICO_CLASICO` y `ORTHO_ES_CO_FRIO_FRIO`.
20. No se agrega una cuarta corrección por analogía.
21. `expresso` queda excluido de corrección automática.
22. No se convierte `expresso` automáticamente en `espresso`, `expreso` u otra forma.
23. La puerta de activación conserva exactamente 11 condiciones.
24. Las excepciones oficiales y protecciones técnicas prevalecen sobre el diccionario.
25. Dentro del diccionario, una entrada más específica prevalece únicamente dentro de un alcance compatible.
26. `PHRASE` precede a `TOKEN` dentro de la misma especificidad.
27. La coincidencia válida de frase más larga prevalece entre frases compatibles.
28. Los estados son exactamente `DRAFT`, `APPROVED_ACTIVE`, `SUSPENDED`, `SUPERSEDED`, `RETIRED` y `REJECTED`.
29. Solo `APPROVED_ACTIVE` es ejecutable.
30. Los resultados son exactamente siete y permanecen semánticamente distintos.
31. Un conflicto conserva el valor y falla cerrado.
32. Un cambio ejecutable crea nueva versión o nueva entrada con `supersedes`.
33. El cambio no es retroactivo por defecto.
34. Rollback no elimina historia, evidencia ni decisiones.
35. Frecuencia, forma reciente, autocorrector, búsqueda externa no aprobada, modelo lingüístico o preferencia local no constituyen autoridad.
36. `PRIMARY_VALUE` y `DISPLAY_OVERRIDE` solo pueden mutar bajo las fuentes y políticas autorizadas.
37. Originales externos, snapshots y evidencia permanecen protegidos.
38. `SYNCHRONIZED_COPY` no ejecuta una autoridad ortográfica independiente.
39. La misma entrada, coordenada y versiones producen el mismo resultado lógico en todas las capas.
40. La evaluación es idempotente bajo las mismas versiones.
41. El diccionario no ejecuta espacios, Unicode, puntuación de prosa, capitalización, conectores, excepciones, búsqueda, transliteración, identidad o fusión como efectos implícitos.
42. Una convergencia ortográfica no crea identidad ni unicidad.
43. VITAL no hereda el diccionario transversal.
44. No se crea package físico, TypeScript, SQL, RPC, trigger, índice, constraint, migración o backfill.
45. No se modifica Supabase.
46. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
47. `SHELL-NORM-006` queda como única continuidad reservada.

---

#### 38. Hallazgos y destinos exactos

| Hallazgo                                                                   | Resultado de `SHELL-NORM-005`                     | Destino exacto                                              |
| -------------------------------------------------------------------------- | ------------------------------------------------- | ----------------------------------------------------------- |
| el diccionario ya estaba definido en E3 pero no centralizado en SHELL-NORM | diccionario completo centralizado documentalmente | `SHELL-NORM-005`                                            |
| existen solo tres correcciones iniciales aprobadas                         | las tres se preservan sin expansión por analogía  | `SHELL-NORM-005`                                            |
| `expresso` permanece ambiguo                                               | no se activa corrección automática                | `DATA-NORM-ARC-007`                                         |
| una convergencia ortográfica puede revelar una posible duplicidad          | no produce identidad ni fusión                    | `DATA-NORM-ARC-010`                                         |
| búsqueda tolerante y variantes de búsqueda permanecen separadas            | no se generan desde el diccionario                | `SHELL-NORM-006`                                            |
| el package compartido aún no está materializado físicamente                | especificación completa; ejecución no iniciada    | `SHELL-CI-020::<package_id>` después de la puerta aplicable |
| persistencia y enforcement de normalización pertenecen a BLOQUE R          | sin cambio físico                                 | `DATA-NORM-DB-001..010`                                     |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 39. Criterios de aceptación

`SHELL-NORM-005` queda documentalmente completa cuando se cumplen simultáneamente:

1. se centraliza exactamente `VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0`;
2. no se crea una segunda fuente de diccionario;
3. el perfil `es-CO` permanece explícito;
4. los 21 atributos de entrada aparecen completos;
5. faltantes de atributos = 0;
6. duplicados de atributos = 0;
7. los tres alcances de coincidencia permanecen cerrados;
8. el matching es exacto y direccional;
9. no se infiere reversibilidad;
10. no se admiten subcadenas;
11. no se admite similitud, fonética ni distancia de edición;
12. la proyección de caja conserva `PRESERVE_RESOLVED_CASE_PATTERN`;
13. el diccionario no capitaliza nuevamente;
14. se preservan los tres modos de decisión;
15. se preservan los cuatro niveles explícitos de alcance;
16. la ausencia de policy conserva el valor;
17. se preservan exactamente las tres entradas iniciales;
18. faltantes de entradas iniciales = 0;
19. duplicados de entradas iniciales = 0;
20. no se agrega una entrada adicional por analogía;
21. `expresso` no es una entrada automática;
22. se preservan las 11 condiciones de activación;
23. se preserva la precedencia de 8 niveles;
24. excepciones y protecciones técnicas preceden al diccionario;
25. frases más largas preceden a tokens dentro de la misma especificidad;
26. se preservan los seis estados de ciclo de vida;
27. solo `APPROVED_ACTIVE` es ejecutable;
28. se preservan los siete resultados cerrados;
29. faltantes de resultados = 0;
30. duplicados de resultados = 0;
31. conflictos fallan cerrados;
32. entradas incompletas no son ejecutables;
33. evidencia y aprobación son obligatorias para activar;
34. supersesión y no retroactividad permanecen explícitas;
35. rollback lógico no destruye historia;
36. originales externos, snapshots y evidencia no se reescriben;
37. `SYNCHRONIZED_COPY` no corrige independientemente;
38. la misma entrada, coordenada y versiones produce el mismo resultado lógico;
39. la evaluación repetida es idempotente;
40. el corpus mínimo conserva positivos, negativos, ambigüedad, conflictos y versiones;
41. búsqueda permanece separada;
42. identidad y unicidad permanecen separadas;
43. VITAL permanece separado;
44. no se crea código ni package físico;
45. no se modifica Supabase;
46. no se crean ni modifican requisitos de prueba;
47. todos los carryovers tienen propietario exacto;
48. la siguiente tarea permanece únicamente reservada.

---

#### 40. Límites

`SHELL-NORM-005` no:

- crea físicamente `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts` o `.tsx`;
- define exports físicos;
- selecciona una librería de diccionario, Unicode, tokenización o validación runtime;
- crea schemas Zod, JSON Schema u otros schemas serializados;
- modifica `VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0`;
- agrega palabras al diccionario;
- activa `expresso`;
- resuelve `Oster`, `Wellmix`, `Welmix`, `BBQ` u otros candidatos de excepción;
- infiere aliases;
- ejecuta similitud;
- ejecuta fonética;
- ejecuta autocorrección externa;
- ejecuta stemming;
- ejecuta lematización;
- traduce;
- translitera;
- singulariza;
- pluraliza;
- corrige espacios;
- corrige Unicode;
- capitaliza;
- modifica conectores;
- modifica excepciones oficiales;
- implementa búsqueda;
- implementa ranking;
- genera slug, SKU o identificadores;
- decide identidad, unicidad, deduplicación o fusión;
- implementa preview;
- implementa auditoría física;
- persiste entradas o evidencias;
- modifica datos existentes;
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
- desarrolla `SHELL-NORM-006`.

---

#### 41. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-004 — Centralizar conectores y excepciones

##### TAREA ACTUAL APROBADA

SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-006 — Crear normalización de búsqueda y comparación


### ✅ SHELL-NORM-006 — Crear normalización de búsqueda y comparación

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados
**Tarea siguiente:** SHELL-NORM-007 — Crear previsualización de transformaciones
**Tipo de tarea:** Documental; centralización dentro de `@vento/data-normalization` de la política canónica de búsqueda y comparación textual ya aprobada, preservando representaciones derivadas, perfiles, modos, precedencia, ranking, explicación, privacidad, scopes, versionado y fronteras frente a corrección, identidad, unicidad y fusión, sin materializar código, package físico, índices, SQL, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-006` centraliza para la futura superficie compartida de `@vento/data-normalization` la política de búsqueda y comparación textual aprobada en `DATA-NORM-ARC-008`.

La tarea no redefine esa política ni crea una segunda fuente semántica. Su resultado es fijar, dentro de la familia SHELL-NORM, qué representaciones, perfiles, modos, precedencias y contratos deberá consumir una implementación compartida para recuperar candidatos de manera determinista sin transformar el valor empresarial ni convertir una coincidencia textual en identidad.

La regla central es:

```text
VALOR FUENTE
        ↓
POLÍTICA DEL CAMPO + CLASE + REPRESENTACIÓN + FUENTE + FINALIDAD + SCOPE + VERSIÓN
        ↓
DERIVACIONES DE BÚSQUEDA SEPARADAS
        ↓
MATCHING POR PRECEDENCIA CANÓNICA
        ↓
RANKING DETERMINISTA
        ↓
VALOR MOSTRADO AUTORIZADO + EXPLICACIÓN
```

y nunca:

```text
CLAVE DE BÚSQUEDA
→ VALOR EMPRESARIAL
→ IDENTIDAD
→ UNICIDAD
→ SELECCIÓN AUTOMÁTICA
→ FUSIÓN
```

---

#### 2. Resultado material de la tarea

Queda centralizada documentalmente, sin cambio de identidad ni versión, la proyección compartida del artefacto:

```text
VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0
```

dentro de la futura responsabilidad de:

```text
@vento/data-normalization
```

La centralización materializa documentalmente:

- 7 representaciones derivadas aprobadas;
- 7 clases mínimas de token o frontera;
- 15 atributos del contrato lógico de alias de búsqueda;
- 6 perfiles cerrados de búsqueda;
- 9 modos cerrados de coincidencia;
- 9 niveles de ranking derivados directamente de esos modos;
- 15 pasos de precedencia del pipeline de búsqueda;
- 13 atributos mínimos del contrato lógico de respuesta;
- 14 decisiones explícitas, una por cada clase semántica heredada;
- 11 componentes mínimos para búsqueda estructurada de presentaciones;
- 17 ejemplos normativos de comportamiento;
- 20 dimensiones mínimas del corpus de conformidad;
- separación explícita entre derivación, recuperación, comparación, revisión humana, identidad, unicidad y fusión.

No se crea una versión nueva de `VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0`.

---

#### 3. Fuentes normativas y precedencia

| Fuente               | Decisión preservada por `SHELL-NORM-006`                                                                                                                           |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `SHELL-NORM-001`     | identidad de `@vento/data-normalization`, pureza, determinismo, ausencia de I/O y prohibición de convertir el package en fuente empresarial o capa de persistencia |
| `SHELL-NORM-002`     | 14 clases semánticas, roles de representación, roles de fuente, modos de tratamiento y operación `SEARCH_KEY_DERIVATION`                                           |
| `SHELL-NORM-003`     | NFC, tratamiento gobernado de espacios, perfil lingüístico explícito, tokenización y preservación de signos y fronteras                                            |
| `SHELL-NORM-004`     | conectores, excepciones oficiales, aliases explícitos y formas protegidas que no pueden degradarse por búsqueda                                                    |
| `SHELL-NORM-005`     | diccionario ortográfico separado de la búsqueda; las correcciones ortográficas no se convierten en aliases ni equivalencias                                        |
| `DATA-NORM-ARC-007`  | revisión humana de aliases, conflictos y candidatos que no pueden activarse por telemetría, frecuencia o similitud                                                 |
| `DATA-NORM-ARC-008`  | autoridad semántica completa sobre representaciones, perfiles, modos, ranking, scopes y fronteras de búsqueda y comparación                                        |
| `DATA-NORM-ARC-009`  | versión, auditoría, vigencia, reproducibilidad, procedencia algorítmica e idempotencia                                                                             |
| `DATA-NORM-ARC-010`  | identidad, scopes de unicidad, colisiones, duplicados y prohibición de fusionar por coincidencia textual                                                           |
| `DATA-NORM-ARC-011`  | arquitectura ejecutora, servicio de dominio, RPC, defensa de base, APIs e implementación técnica                                                                   |
| `DATA-NORM-ARC-012`  | originales externos, procedencia, mapeos, evidencia y fronteras de integración                                                                                     |
| `SHELL-PKG-001..008` | distribución, compatibilidad, versionado, deprecación, rollback y adopción de packages compartidos                                                                 |

Precedencia normativa:

```text
POLÍTICA DEL CAMPO
        ↓
CLASIFICACIÓN SHELL-NORM-002
        ↓
REGLAS DETERMINISTAS SHELL-NORM-003
        ↓
EXCEPCIONES Y FORMAS PROTEGIDAS SHELL-NORM-004
        ↓
DICCIONARIO ORTOGRÁFICO SHELL-NORM-005, SOLO CUANDO CORRESPONDA A LA REPRESENTACIÓN MOSTRADA
        ↓
DERIVACIONES DE BÚSQUEDA SHELL-NORM-006
        ↓
MATCHING Y RANKING SIN EFECTOS ESTRUCTURALES
```

La búsqueda consume contexto y versiones; no adquiere autoridad para reescribir ninguna decisión precedente.

---

#### 4. Frontera exacta

Esta tarea centraliza exclusivamente:

- relación entre valor fuente, valor mostrado y representaciones derivadas;
- siete representaciones canónicas de búsqueda;
- reglas lógicas de `SEARCH_FORM_KEY` y `SEARCH_ACCENT_KEY`;
- tokenización y fronteras para `SEARCH_TOKEN_STREAM`;
- consumo gobernado de `SEARCH_APPROVED_ALIAS_SET`;
- estado deshabilitado por defecto de transliteración y similitud;
- seis perfiles cerrados de búsqueda;
- nueve modos de coincidencia;
- precedencia de filtros, matching y ranking;
- contrato lógico de respuesta y explicación;
- reglas de minimización y privacidad;
- decisión por las 14 clases semánticas;
- tratamiento estructurado de presentaciones;
- fronteras para códigos, slugs, contactos e identificadores;
- tratamiento de fuentes, overrides, copias, snapshots y originales externos;
- compatibilidad de versión;
- paridad entre capas;
- corpus mínimo de conformidad;
- handoffs exactos hacia preview, auditoría, pruebas e implementación física.

Esta tarea no:

- crea funciones de búsqueda ejecutables;
- define exports TypeScript;
- selecciona librerías de Unicode, tokenización, fuzzy matching o ranking;
- selecciona `citext`, trigramas, full-text search ni otra extensión;
- crea columnas derivadas;
- crea índices;
- crea constraints;
- define RLS;
- crea RPC;
- crea triggers;
- crea migraciones;
- ejecuta backfills;
- modifica datos;
- activa similitud;
- activa transliteración;
- define un umbral de similitud;
- define longitud mínima de prefijo;
- crea aliases nuevos;
- corrige ortografía;
- decide identidad o unicidad;
- selecciona registros sobrevivientes;
- modifica Supabase.

---

#### 5. Conciliación de inventarios heredados

| Inventario                         | Esperado | Centralizado | Faltantes | Duplicados |
| ---------------------------------- | -------: | -----------: | --------: | ---------: |
| representaciones derivadas         |        7 |            7 |         0 |          0 |
| clases mínimas de token o frontera |        7 |            7 |         0 |          0 |
| atributos de alias                 |       15 |           15 |         0 |          0 |
| perfiles cerrados de búsqueda      |        6 |            6 |         0 |          0 |
| modos cerrados de coincidencia     |        9 |            9 |         0 |          0 |
| niveles de ranking                 |        9 |            9 |         0 |          0 |
| pasos del pipeline                 |       15 |           15 |         0 |          0 |
| atributos mínimos de respuesta     |       13 |           13 |         0 |          0 |
| clases semánticas gobernadas       |       14 |           14 |         0 |          0 |
| componentes estructurados mínimos  |       11 |           11 |         0 |          0 |
| ejemplos normativos                |       17 |           17 |         0 |          0 |
| dimensiones mínimas de corpus      |       20 |           20 |         0 |          0 |

Ningún inventario se amplía por inferencia.

---

#### 6. Identidad, perfil y versión

La política centralizada conserva exactamente:

```text
VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0
```

Reglas:

1. `@vento/data-normalization` no reemplaza la identidad de la política;
2. la versión de la política es distinta de la futura versión npm del package;
3. cada evaluación deberá declarar perfil, locale y versión compatibles;
4. consulta y valor buscado deberán usar el mismo algoritmo y versión;
5. no existe `latest` implícito;
6. una incompatibilidad de versión bloquea o produce un resultado explícitamente degradado; nunca activa un fallback silencioso;
7. una versión histórica conserva significado histórico y no vuelve a ser activa por ausencia de una versión más reciente;
8. una nueva política de búsqueda requerirá evolución canónica propia y no una edición silenciosa de `1.0.0`.

---

#### 7. Las siete representaciones derivadas

| Orden | Representación                    | Propósito                                                                       | Frontera obligatoria                                              |
| ----: | --------------------------------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
|    01 | `SEARCH_FORM_KEY`                 | comparar forma estable sin distinguir caja ni espacios accidentales autorizados | conserva tildes, `ñ`, signos, palabras y fronteras                |
|    02 | `SEARCH_ACCENT_KEY`               | recuperar de forma tolerante a tildes españolas en campos elegibles             | preserva `ñ`, signos y caracteres no autorizados para plegado     |
|    03 | `SEARCH_TOKEN_STREAM`             | comparar frases, tokens completos, cobertura y prefijo controlado               | no usa subcadenas, stemming, lematización ni stopwords implícitas |
|    04 | `SEARCH_APPROVED_ALIAS_SET`       | recuperar mediante aliases explícitos y aprobados                               | no aprende aliases por uso, frecuencia, clics o similitud         |
|    05 | `SEARCH_TRANSLITERATION_KEY`      | fallback opcional entre escrituras bajo perfil explícito                        | deshabilitada por defecto; nunca igualdad                         |
|    06 | `SEARCH_STRUCTURED_COMPONENT_SET` | buscar estructuras mediante componentes ya interpretados                        | no aplana estructura como identidad textual                       |
|    07 | `SEARCH_FREE_TEXT_TERMS`          | descubrir términos y frases en texto libre elegible                             | no corrige autoría ni crea identidad                              |

Una política de campo puede habilitar un subconjunto. No puede inventar una octava representación local ni combinar varias en una clave opaca sin explicación.

---

#### 8. `SEARCH_FORM_KEY`

La derivación base `es-CO` conserva este orden:

```text
valor fuente o consulta
        ↓
validar clase, representación, fuente, perfil y scope
        ↓
NFC
        ↓
casefold Unicode del perfil
        ↓
recorte de bordes solo si el campo lo permite
        ↓
compactación de espacios solo si el campo lo permite
        ↓
conservar tildes, ñ, signos, guiones, apóstrofos y fronteras
        ↓
SEARCH_FORM_KEY versionada
```

Reglas:

1. NFC se aplica a la derivación y no obliga a reescribir el original;
2. casefold no autoriza guardar el valor fuente en minúsculas;
3. solo se compactan separadores declarados accidentales por la política;
4. saltos de línea, tabulaciones, espacios no separables y formatos significativos no se compactan por defecto;
5. los signos permanecen en la clave;
6. esta etapa no ejecuta diccionario, capitalización, conectores, aliases, transliteración ni corrección;
7. si el campo no permite trim o compactación, esos caracteres también se conservan en la clave.

---

#### 9. `SEARCH_ACCENT_KEY` y preservación de `ñ`

La versión `1.0.0` conserva exactamente:

1. `á → a`;
2. `é → e`;
3. `í → i`;
4. `ó → o`;
5. `ú → u`;
6. `ü → u` únicamente cuando el campo habilite esa tolerancia `es-CO`;
7. `ñ` y `n` permanecen distintos;
8. otros diacríticos o alfabetos no se eliminan por analogía;
9. signos, guiones, apóstrofos y espacios no se eliminan;
10. la salida solo participa en recuperación y ranking;
11. `Maiz`/`Maíz` puede ser una coincidencia tolerante, pero no una autorización de corrección;
12. `ano`/`año` no coincide por esta representación.

`unaccent` genérico no se adopta como semántica transversal.

---

#### 10. Las siete clases mínimas de token o frontera

| Orden | Clase                          | Conducta                                                                       |
| ----: | ------------------------------ | ------------------------------------------------------------------------------ |
|    01 | `LEXICAL_TOKEN`                | letras y marcas combinantes como token completo                                |
|    02 | `NUMERIC_TOKEN`                | número, decimal, rango o fracción sin cambiar magnitud                         |
|    03 | `TECHNICAL_TOKEN`              | código, modelo, unidad, referencia o combinación protegida                     |
|    04 | `INTERNAL_COMPOUND_TOKEN`      | token con guion, apóstrofo o signo interno conservado salvo gramática aprobada |
|    05 | `PUNCTUATION_BOUNDARY`         | signo delimitador cuya presencia sigue disponible para coincidencia precisa    |
|    06 | `WHITESPACE_BOUNDARY`          | separador autorizado que delimita tokens                                       |
|    07 | `UNRESOLVED_TOKEN_OR_BOUNDARY` | forma no clasificable que bloquea modos más amplios                            |

Reglas:

- no existe coincidencia por subcadena dentro de otro token;
- los conectores permanecen presentes;
- `al`, `del`, `e`, `o`, `u` y `y` conservan forma y posición;
- `Coca-Cola` y `Coca Cola` no son equivalentes por forma;
- `S.A.S.` y `SAS` permanecen distintos salvo alias oficial explícito;
- `Choco Bites` y `Chocobites` no se unen ni dividen;
- una gramática de compuesto requiere delimitadores, alcance, locale, versión y corpus propios.

---

#### 11. `SEARCH_APPROVED_ALIAS_SET`

Cada alias de búsqueda deberá conservar exactamente estos 15 atributos lógicos:

```text
alias_key
canonical_target_reference
alias_form
match_scope
semantic_class
domain_scope
entity_scope
field_scope
language_profile
source_authority
approval_reference
status
valid_from
valid_to
alias_version
```

Reglas:

1. un alias referencia una entidad o forma canónica explícita;
2. la coincidencia del alias no modifica consulta ni valor mostrado;
3. una forma oficial exige autoridad compatible con su familia;
4. una entrada ortográfica no se vuelve alias bidireccional;
5. tolerancia de tildes no crea alias persistido;
6. frecuencia o telemetría no activan aliases;
7. aliases suspendidos, retirados o rechazados no participan en decisiones nuevas;
8. un conflicto bloquea ese nivel y conserva las alternativas;
9. una propuesta explícita de resolución puede remitirse a `DATA-NORM-ARC-007`;
10. ningún alias crea identidad ni autoriza unicidad.

---

#### 12. Transliteración

`SEARCH_TRANSLITERATION_KEY` permanece:

```text
DESHABILITADA_POR_DEFECTO
```

en el perfil estándar `es-CO`.

No existe en `1.0.0` una tabla transversal de transliteración ni una regla `ñ → n`.

Una eventual activación no forma parte de esta tarea ni constituye un pendiente de implementación: el comportamiento vigente es permanecer deshabilitada. Cualquier cambio semántico posterior deberá pasar por una nueva decisión canónica antes de poder materializarse.

---

#### 13. Similitud

`SIMILARITY_CANDIDATE_ONLY` permanece:

```text
DESHABILITADO_POR_DEFECTO
```

y no forma parte de la igualdad canónica.

Invariantes:

1. una coincidencia difusa nunca se presenta como igualdad;
2. nunca selecciona automáticamente un registro;
3. nunca escribe, relaciona, corrige, fusiona ni autoriza;
4. nunca crea entradas de diccionario, excepción o alias;
5. no existe fallback oculto a distancia de edición, fonética o modelo lingüístico;
6. `expresso`/`espresso`, `Wellmix`/`Welmix` y `Choco Bites`/`Chocobites` permanecen separados bajo la política activa;
7. el comportamiento vigente no requiere seleccionar algoritmo, umbral ni longitud mínima porque la capacidad está deshabilitada.

---

#### 14. Los seis perfiles cerrados de búsqueda

| Orden | Perfil                           | Clases principales                                              | Restricción                                                                        |
| ----: | -------------------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
|    01 | `STRICT_TECHNICAL_LOOKUP`        | códigos, SKU, unidades, estados, slugs, referencias y contactos | no usa tildes, aliases comerciales, transliteración ni similitud                   |
|    02 | `STANDARD_COMMERCIAL_NAME`       | `COMMERCIAL_NAME`                                               | no corrige el nombre ni convierte resultado en identidad                           |
|    03 | `OFFICIAL_FORM_LOOKUP`           | marcas, nombres legales, siglas y formas oficiales              | conserva signos y forma oficial; tolerancias mayores requieren autoridad explícita |
|    04 | `STRUCTURED_PRESENTATION_LOOKUP` | presentaciones, cantidades, unidades y etiquetas estructuradas  | cantidad, unidad, multiplicador, contexto y fuente son filtros separados           |
|    05 | `FREE_TEXT_DISCOVERY`            | `FREE_TEXT` y descripciones elegibles                           | sin stemming, lematización, stopwords ni reescritura automática en `1.0.0`         |
|    06 | `RESTRICTED_HUMAN_OR_LOCATION`   | personas, actores, direcciones y ubicaciones                    | exige finalidad, scope, privacidad y autorización; no resuelve identidad           |

`UNCLASSIFIED_PRESERVE`, secretos, firmas y material criptográfico no reciben búsqueda derivada general.

---

#### 15. Los nueve modos cerrados de coincidencia

| Nivel | Modo                             | Confianza relativa |
| ----: | -------------------------------- | ------------------ |
|     1 | `EXACT_VALUE_MATCH`              | máxima             |
|     2 | `FORM_EQUIVALENT_MATCH`          | muy alta           |
|     3 | `ACCENT_TOLERANT_MATCH`          | alta               |
|     4 | `APPROVED_ALIAS_MATCH`           | alta contextual    |
|     5 | `ORDERED_PHRASE_MATCH`           | media alta         |
|     6 | `ALL_TOKEN_MATCH`                | media              |
|     7 | `LAST_TOKEN_PREFIX_MATCH`        | media baja         |
|     8 | `TRANSLITERATION_FALLBACK_MATCH` | baja               |
|     9 | `SIMILARITY_CANDIDATE_ONLY`      | mínima             |

Reglas:

1. el orden es absoluto;
2. un resultado que satisfaga varios modos se clasifica por el más preciso;
3. motivos secundarios pueden conservarse únicamente como explicación;
4. un modo deshabilitado no participa por ausencia de resultados en modos superiores;
5. ningún nivel representa identidad empresarial.

---

#### 16. Pipeline canónico de quince pasos

```text
1. autorización y finalidad
2. dominio, entidad, campo y scope
3. estado, vigencia y filtros estructurales
4. perfil, locale y versión
5. derivación de consulta con la misma versión activa
6. EXACT_VALUE_MATCH
7. FORM_EQUIVALENT_MATCH
8. ACCENT_TOLERANT_MATCH
9. APPROVED_ALIAS_MATCH
10. ORDERED_PHRASE_MATCH
11. ALL_TOKEN_MATCH
12. LAST_TOKEN_PREFIX_MATCH
13. TRANSLITERATION_FALLBACK_MATCH
14. SIMILARITY_CANDIDATE_ONLY, únicamente si estuviera habilitado por una política futura
15. orden estable, explicación y paginación
```

Un registro fuera de scope o autorización queda excluido antes del ranking aunque su texto coincida exactamente.

---

#### 17. Ranking determinista

La tupla canónica permanece:

```text
match_level ascendente
+ scope_specificity descendente
+ matched_token_coverage descendente
+ approved_business_priority, solo si el dominio la declara
+ stable_domain_sort_key
+ immutable_entity_id
```

Invariantes:

1. `match_level` domina los demás factores;
2. una prioridad empresarial no eleva una coincidencia menos precisa sobre una más precisa;
3. popularidad, frecuencia, uso reciente y telemetría no participan sin política versionada;
4. un empate conserva todos los registros;
5. el primer resultado no se considera selección segura para mutar;
6. la paginación utiliza la tupla completa;
7. un cambio de ranking es un cambio versionado;
8. consumidores no reordenan silenciosamente los niveles canónicos.

---

#### 18. Contrato lógico mínimo de respuesta

La respuesta gobernada deberá poder expresar estos 13 atributos, según autorización:

```text
entity_id
entity_type
display_value
matched_field
match_mode
match_level
matched_terms_or_components
search_profile
language_profile
algorithm_version
scope_summary
source_value_version_or_hash
is_historical_or_inactive
```

Reglas:

1. `display_value` procede de la representación mostrada autorizada;
2. las claves derivadas no se exponen por defecto;
3. la explicación minimiza datos;
4. resaltado y explicación no reescriben el valor mostrado;
5. degradación por versión o dependencia se declara;
6. una respuesta vacía diferencia ausencia de resultados, bloqueo de perfil, scope inválido y dependencia no disponible;
7. la futura API física deberá preservar estas semánticas.

---

#### 19. Consulta, privacidad y minimización

1. la consulta original es transitoria y no se persiste por defecto;
2. logs y métricas conservan únicamente lo necesario para rendimiento, error o explicación;
3. personas, direcciones, contactos y datos sensibles exigen finalidad y permiso;
4. secretos, firmas, tokens, hashes y credenciales no usan búsqueda derivada general;
5. consulta vacía o compuesta solo por separadores no abre una búsqueda amplia;
6. prefijo y similitud no se habilitan sin límites explícitos;
7. no se permite reconstruir masivamente el corpus de claves por paginación o errores;
8. autorización, RLS y protección de servidor siguen siendo obligatorias.

---

#### 20. Matriz completa de las catorce clases semánticas

| Clase                          | Perfil o conducta                                      | Permitido por defecto                                            | Bloqueado por defecto                                              |
| ------------------------------ | ------------------------------------------------------ | ---------------------------------------------------------------- | ------------------------------------------------------------------ |
| `COMMERCIAL_NAME`              | `STANDARD_COMMERCIAL_NAME`                             | exacta, forma, tildes `es-CO`, frase, tokens, aliases aprobados  | transliteración y similitud                                        |
| `STRUCTURED_PRESENTATION_NAME` | `STRUCTURED_PRESENTATION_LOOKUP`                       | etiqueta y componentes estructurados                             | identidad por etiqueta o eliminación genérica de signos            |
| `HUMAN_LABEL`                  | política específica                                    | exacta y forma                                                   | heredar búsqueda comercial                                         |
| `OFFICIAL_LEGAL_NAME`          | `OFFICIAL_FORM_LOOKUP`                                 | exacta, casefold autorizado, aliases legales explícitos          | tildes genéricas, eliminación de signos, similitud, reconstrucción |
| `OFFICIAL_BRAND_FORM`          | `OFFICIAL_FORM_LOOKUP`                                 | exacta, casefold autorizado, aliases de marca explícitos         | tokenización destructiva, transliteración y similitud global       |
| `PERSON_OR_ACTOR_NAME`         | `RESTRICTED_HUMAN_OR_LOCATION`                         | forma y tildes cuando estén aprobadas                            | identidad, fusión, corrección o exposición transversal             |
| `ADDRESS_OR_LOCATION_TEXT`     | `RESTRICTED_HUMAN_OR_LOCATION` o búsqueda estructurada | forma y componentes aprobados                                    | eliminación universal de números, signos, orden o abreviaturas     |
| `FREE_TEXT`                    | `FREE_TEXT_DISCOVERY`                                  | términos, frases y último prefijo autorizado                     | identidad, corrección silenciosa, stemming y sinónimos automáticos |
| `CONTROLLED_VOCABULARY_CODE`   | `STRICT_TECHNICAL_LOOKUP`                              | exacta y equivalencias de catálogo                               | búsqueda comercial, tildes, transliteración o similitud            |
| `MEASUREMENT_OR_UNIT_CODE`     | `STRICT_TECHNICAL_LOOKUP` en componente estructurado   | exacta, casefold o alias técnico si el catálogo lo declara       | subcadena o equivalencia con etiqueta                              |
| `TECHNICAL_IDENTIFIER`         | contrato técnico propietario                           | exacta y casefold o prefijo técnico explícito cuando corresponda | diccionario, alias comercial, eliminación de signos y similitud    |
| `CONTACT_IDENTIFIER`           | contrato propio del canal                              | canonicalización y comparación del estándar                      | búsqueda comercial o exposición fuera de finalidad                 |
| `SECRET_OR_SIGNATURE_MATERIAL` | sin representación general                             | validación exacta por mecanismo de seguridad                     | derivación textual, prefijo, similitud, logging y exposición       |
| `UNCLASSIFIED_PRESERVE`        | bloqueado                                              | ninguna                                                          | todos los modos                                                    |

Conciliación:

```text
clases esperadas = 14
filas materializadas = 14
faltantes = 0
duplicados = 0
```

---

#### 21. Búsqueda estructurada de presentaciones

`SEARCH_STRUCTURED_COMPONENT_SET` conserva como mínimo:

```text
product_id
quantity
input_unit_code
stock_quantity
stock_unit_code
multiplier
package_kind
usage_context
supplier_or_source_scope
validity_or_status
visible_label
```

Reglas:

1. `500 g`, `Pote x 2`, `Bolsa 1 kg`, `Six Pack` y `six_pack` no son claves intercambiables;
2. cantidades y unidades se comparan por contratos numéricos y de catálogo;
3. la etiqueta visible participa después de filtros estructurales;
4. etiquetas iguales con estructura distinta permanecen como resultados distintos;
5. equivalencia cuantitativa no demuestra igualdad operacional;
6. búsqueda no altera conversiones, defaults, fuente ni vigencia;
7. una posible duplicidad se remite a `DATA-NORM-ARC-010`.

---

#### 22. Códigos, slugs, contactos e identificadores

1. `_vento_slugify` y `_navigation_slugify` no se adoptan como representación universal;
2. un slug continúa siendo ruta o identificador técnico según su contrato;
3. cambiar algoritmo de slug o código requiere transición propia;
4. SKU, códigos de barras, referencias, modelos y series usan contratos exactos;
5. emails y teléfonos usan canonicalización propia del estándar;
6. signos o tildes no se eliminan de un identificador para hacerlo coincidir con un nombre comercial;
7. una entidad puede buscarse por código y por nombre como coincidencias distintas;
8. un mismo string en dos campos no crea aliases entre representaciones.

---

#### 23. Fuentes, overrides, copias, snapshots y externos

| Caso                   | Conducta                                                                |
| ---------------------- | ----------------------------------------------------------------------- |
| `AUTHORITATIVE_SOURCE` | derivación vinculada a la versión de la fuente                          |
| `APPROVED_OVERRIDE`    | derivación propia, acotada a canal y scope                              |
| `SYNCHRONIZED_COPY`    | misma versión y contrato; ninguna política local                        |
| `IMMUTABLE_SNAPSHOT`   | derivación histórica vinculada al valor histórico; sin resincronización |
| `EXTERNAL_ORIGINAL`    | original preservado; derivación interna separada                        |
| `OUTPUT_PROJECTION`    | no adquiere autoridad de búsqueda sobre la fuente                       |

La política del dominio decide qué representaciones pueden participar según finalidad y vigencia.

---

#### 24. Relación con revisión humana

La búsqueda ordinaria no abre casos de revisión por cada consulta o resultado de baja confianza.

`DATA-NORM-ARC-007` conserva propiedad únicamente cuando exista una propuesta explícita para:

- aprobar un alias;
- resolver conflicto de aliases o fuentes;
- clasificar un campo o token;
- convertir un candidato en corrección, excepción o preservación;
- resolver una divergencia que afecte forma oficial, estructura o autoridad.

Telemetría, clics, frecuencia o selección repetida no constituyen autoridad.

---

#### 25. Frontera frente a identidad, unicidad y duplicidad

Invariantes:

```text
misma SEARCH_FORM_KEY
≠ misma entidad

ACCENT_TOLERANT_MATCH
≠ equivalencia empresarial

APPROVED_ALIAS_MATCH
≠ autorización de fusión

primer resultado
≠ registro sobreviviente
```

Por tanto:

1. ninguna de las siete representaciones constituye identidad;
2. ningún modo de coincidencia crea unicidad;
3. homónimos y scopes distintos permanecen separados;
4. una clave de búsqueda no se usa como constraint;
5. la búsqueda no selecciona sobreviviente;
6. no desactiva registros;
7. no reasigna relaciones;
8. el ranking no decide fusión;
9. toda acción posterior revalida identificador estable, autorización, versión y contexto;
10. toda estrategia estructural permanece en `DATA-NORM-ARC-010`.

---

#### 26. Compatibilidad de versión e índices

1. consulta y representación indexada usan el mismo algoritmo y versión;
2. `lower(trim(value))` no equivale automáticamente a ninguna representación canónica;
3. una versión nueva exige medir cobertura, colisiones, tamaño, latencia, plan y paginación antes de activarse;
4. coexistencia de versiones declara cuál atiende cada función;
5. no existe fallback silencioso a helper legacy;
6. los 13 índices locales auditados no constituyen estrategia transversal;
7. esta tarea no selecciona `citext`, trigramas, full-text search ni otra tecnología de índice;
8. rendimiento y seguridad bajo carga permanecen asignados a `SUPA-TRANS-010`;
9. compatibilidad temporal de consumidores permanece asignada a `SUPA-TRANS-006`, `SUPA-TRANS-007`, `SUPA-TRANS-013` y `SUPA-TRANS-014`.

---

#### 27. Paridad entre capas

Para la misma consulta, corpus, scope, perfil y versiones, las capas autorizadas deberán producir:

- las mismas derivaciones lógicas;
- el mismo conjunto elegible;
- el mismo modo principal;
- el mismo nivel;
- el mismo orden;
- la misma explicación;
- la misma conducta ante bloqueo o incompatibilidad.

Se prohíbe que un consumidor mantenga por separado:

- tokenizer;
- lista de stopwords;
- alias;
- transliteración;
- normalización de tildes;
- ranking;
- fallback;
- semántica de `lower`, `trim`, `unaccent` o similitud.

La futura distribución física deberá preservar esta paridad.

---

#### 28. Diecisiete ejemplos normativos

| Caso                                     | Permitido                                                           | Prohibido                                  |
| ---------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------ |
| `Harina de Maíz` / `harina de maiz`      | `ACCENT_TOLERANT_MATCH`; mostrar `Harina de Maíz`                   | sobrescribir o declarar identidad          |
| `Maiz Dulce` / `maíz dulce`              | candidato tolerante con motivo y scope                              | corregir o fusionar automáticamente        |
| `año` / `ano`                            | no coincidir por `SEARCH_ACCENT_KEY`                                | plegar `ñ` a `n`                           |
| `Coca-Cola` / `coca-cola`                | forma equivalente si la excepción autoriza casefold                 | eliminar el guion                          |
| `Coca-Cola` / `coca cola`                | menor coincidencia por tokens solo si la política lo autoriza       | alias implícito                            |
| `S.A.S.` / `sas`                         | no coincidir sin alias legal explícito                              | eliminar puntos globalmente                |
| `iPhone` / `iphone`                      | casefold oficial cuando la excepción lo permita                     | cambiar la grafía mostrada                 |
| `expresso` / `espresso`                  | sin coincidencia estándar                                           | autocorrección o alias implícito           |
| `Wellmix` / `Welmix`                     | resultados separados                                                | seleccionar uno por frecuencia             |
| `Choco Bites` / `Chocobites`             | resultados separados                                                | unir o dividir palabras                    |
| presentación `500 g`                     | componentes de cantidad y unidad                                    | comparar solo cadena sin contexto          |
| `Bolsa de 1.100 ml` / `Bolsa de 1100 ml` | candidatos separados hasta resolver convención                      | retirar punto y declarar equivalencia      |
| `Carlos Ibarra`                          | búsqueda restringida y retorno por identificador estable autorizado | identificar o fusionar personas por nombre |
| SKU `FRIO` / comercial `frío`            | búsquedas independientes                                            | aplicar tolerancia comercial al código     |
| externo `MAIZ` / interno `Maíz`          | preservar original y buscar derivación interna                      | sobrescribir original externo              |
| dos `VÍVERES & BODEGA PRINCIPAL`         | dos resultados con IDs distintos                                    | devolver uno por orden físico              |
| doce `Nivel 1` bajo padres distintos     | filtrar por jerarquía                                               | colapsar por nombre                        |

---

#### 29. Corpus mínimo de veinte dimensiones

El corpus futuro deberá cubrir exactamente estas dimensiones heredadas:

1. Unicode precompuesto y descompuesto;
2. múltiples cajas;
3. espacios de borde, repetidos, no separables, saltos y formatos preservados;
4. tildes, diéresis y `ñ` frente a `n`;
5. guiones, apóstrofos, puntos, ampersands, barras, paréntesis y signos;
6. conectores sin stopwords globales;
7. marcas, siglas, unidades, nombres legales, personas y direcciones;
8. términos extranjeros y perfiles no soportados;
9. aliases activos, suspendidos, retirados, conflictivos y fuera de scope;
10. transliteración deshabilitada, incompatible y explícitamente habilitada en un perfil futuro aprobado;
11. similitud deshabilitada y candidatos de baja confianza en un perfil futuro aprobado;
12. frases, todos los tokens y prefijo únicamente en el último token;
13. scopes de sede, dominio, padre, contexto, vigencia e historial;
14. UOM con etiqueta igual y estructura distinta;
15. productos homónimos entre insumo, preparación y venta;
16. personas con mismo nombre e identificadores distintos;
17. versiones compatibles e incompatibles;
18. ranking y paginación estables;
19. autorización, masking y consultas sensibles;
20. paridad entre capas sin efectos de escritura.

La referencia a perfiles futuros no autoriza su activación en `1.0.0`; el corpus deberá demostrar también su bloqueo cuando no estén aprobados.

---

#### 30. Estado de materialización física

| Elemento                                        | Estado                                                 |
| ----------------------------------------------- | ------------------------------------------------------ |
| `@vento/data-normalization`                     | `ESPECIFICADO`; package físico no materializado        |
| `VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0` | centralizada documentalmente; runtime no materializado |
| 7 representaciones derivadas                    | `ESPECIFICADAS`                                        |
| 7 clases de token o frontera                    | `ESPECIFICADAS`                                        |
| 15 atributos de alias                           | `ESPECIFICADOS`                                        |
| 6 perfiles cerrados                             | `ESPECIFICADOS`                                        |
| 9 modos y niveles                               | `ESPECIFICADOS`                                        |
| pipeline de 15 pasos                            | `ESPECIFICADO`                                         |
| ranking determinista                            | `ESPECIFICADO`                                         |
| contrato de respuesta                           | `ESPECIFICADO`                                         |
| matriz de 14 clases                             | `ESPECIFICADA`                                         |
| 11 componentes estructurados                    | `ESPECIFICADOS`                                        |
| transliteración                                 | deshabilitada por defecto                              |
| similitud                                       | deshabilitada por defecto                              |
| API TypeScript                                  | `NO IMPLEMENTADA`                                      |
| tokenizers y helpers físicos                    | `NO IMPLEMENTADOS`                                     |
| columnas o derivaciones persistidas             | `NO IMPLEMENTADAS`                                     |
| índices                                         | `NO IMPLEMENTADOS` por esta tarea                      |
| consumidores migrados                           | `0` por esta tarea                                     |
| cambios Supabase                                | `0`                                                    |
| requisitos de prueba creados o modificados      | `0`                                                    |

`ESPECIFICADO` no equivale a `IMPLEMENTADO` ni a `VALIDADO` en runtime.

---

#### 31. Handoffs exactos

| Materia fuera de esta tarea                                    | Propietario exacto                                                  | Condición de salida                                                                                        |
| -------------------------------------------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| previsualización de transformaciones                           | `SHELL-NORM-007`                                                    | preview debe mostrar entrada, derivaciones, coincidencias, explicación y versiones sin autoridad de commit |
| metadata compartida de versión y auditoría                     | `SHELL-NORM-008`                                                    | toda evaluación del package debe quedar atribuible a política, algoritmo, entrada y versión                |
| pruebas de idempotencia y conservación semántica               | `SHELL-NORM-009`                                                    | corpus compartido debe demostrar paridad, estabilidad y ausencia de efectos estructurales                  |
| aliases, conflictos y candidatos que requieran decisión humana | `DATA-NORM-ARC-007`                                                 | ninguna propuesta se activa por telemetría o frecuencia                                                    |
| vigencia, trazas y procedencia                                 | `DATA-NORM-ARC-009`                                                 | derivaciones y resultados deben ser reproducibles por conjunto de versiones                                |
| identidad, unicidad, duplicidad y fusión                       | `DATA-NORM-ARC-010`                                                 | ninguna coincidencia se transforma en estructura sin evaluación propietaria                                |
| API, RPC, defensa de base e implementación ejecutora           | `DATA-NORM-ARC-011`                                                 | las capas físicas deben conservar la misma semántica y precedencia                                         |
| originales y mappings externos                                 | `DATA-NORM-ARC-012`                                                 | cualquier derivación interna conserva payload y procedencia externos                                       |
| compatibilidad de versiones                                    | `SUPA-TRANS-006`                                                    | coexistencia y consumidores incompatibles resueltos antes de cutover                                       |
| adaptación de consumidores                                     | `SUPA-TRANS-007`                                                    | consumidores usan contratos compatibles sin helpers locales divergentes                                    |
| paridad y pruebas transversales                                | `SUPA-TRANS-009`                                                    | mismas entradas y versiones producen resultados equivalentes entre capas                                   |
| rendimiento y seguridad bajo carga                             | `SUPA-TRANS-010`                                                    | representación e índices candidatos medidos antes de activación                                            |
| rollback de transición                                         | `SUPA-TRANS-011`                                                    | cambios físicos reversibles sin reinterpretar historia                                                     |
| paridad de ambientes                                           | `SUPA-TRANS-013`                                                    | artefactos compatibles entre ambientes                                                                     |
| artefactos y consumidores desplegados                          | `SUPA-TRANS-014`                                                    | versiones desplegadas y consumidores reconciliados                                                         |
| materialización física del package                             | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` | solo el package autorizado puede crearse y desplegarse                                                     |
| análisis estructural de duplicidad durante transición          | `DATA-NORM-TRANS-003`                                               | colisiones se evalúan con relaciones y scope, nunca solo con texto                                         |
| coexistencia y materialización de versiones                    | `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005`                        | cambios físicos mantienen compatibilidad y trazabilidad                                                    |
| restauración y rollback de normalización                       | `DATA-NORM-TRANS-008`                                               | historia y derivaciones anteriores permanecen reconstruibles                                               |
| certificación final de paridad                                 | `DATA-NORM-TRANS-009`                                               | corpus y capas físicas deben producir resultados compatibles                                               |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 32. Cobertura de prueba vigente no modificada

La conducta centralizada ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-123` a `TREQ-DATA-142`: separación de representaciones, compatibilidad de versión, derivaciones, tildes y `ñ`, tokenización, aliases, transliteración, similitud, nueve modos, ranking, perfiles por clase, presentaciones, identificadores, privacidad, respuesta, paridad, índices, frontera de identidad y corpus;
- requisitos previos de `DATA-NORM-ARC-001..007` que gobiernan clasificación, forma, excepciones, diccionario y revisión humana;
- `TREQ-SHELL-002`: implementación compartida frente a copias locales;
- `TREQ-SHELL-006`: pruebas y compatibilidad de packages antes de publicación y adopción.

`SHELL-NORM-006` no altera esas reglas; fija su proyección compartida dentro de `@vento/data-normalization`.

---

#### 33. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-NORM-006` centraliza sin ampliar la política de búsqueda y comparación ya aprobada en `DATA-NORM-ARC-008` y protegida por requisitos canónicos existentes. No introduce una representación, perfil, modo, ranking, algoritmo, alias, scope, regla lingüística, autorización, persistencia, índice, migración, cambio de datos ni comportamiento ejecutable nuevo o modificado. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 34. Decisiones vinculantes

1. La política compartida es exactamente `VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0`.
2. Existen exactamente siete representaciones derivadas.
3. Las siete son `SEARCH_FORM_KEY`, `SEARCH_ACCENT_KEY`, `SEARCH_TOKEN_STREAM`, `SEARCH_APPROVED_ALIAS_SET`, `SEARCH_TRANSLITERATION_KEY`, `SEARCH_STRUCTURED_COMPONENT_SET` y `SEARCH_FREE_TEXT_TERMS`.
4. Ninguna representación sustituye el valor mostrado.
5. Ninguna representación crea identidad.
6. `SEARCH_FORM_KEY` usa NFC, casefold y espacios únicamente cuando la política lo autoriza.
7. `SEARCH_FORM_KEY` conserva tildes, `ñ`, signos, palabras y fronteras.
8. `SEARCH_ACCENT_KEY` pliega únicamente las vocales autorizadas por el perfil `es-CO`.
9. `ñ` y `n` permanecen distintos.
10. `unaccent` genérico no define la semántica transversal.
11. Existen exactamente siete clases mínimas de token o frontera.
12. No existe matching por subcadena dentro de tokens.
13. Los conectores no se eliminan como stopwords.
14. Los compuestos no se unen ni dividen por inferencia.
15. El contrato de alias conserva 15 atributos.
16. Los aliases son explícitos, acotados, versionados y respaldados.
17. El diccionario ortográfico no crea aliases de búsqueda automáticamente.
18. Transliteración permanece deshabilitada por defecto.
19. No existe regla transversal `ñ → n`.
20. Similitud permanece deshabilitada por defecto.
21. Similitud, si alguna vez se aprueba mediante una nueva decisión canónica, solo podrá producir candidatos.
22. Existen exactamente seis perfiles cerrados de búsqueda.
23. `UNCLASSIFIED_PRESERVE`, secretos y firmas no reciben búsqueda derivada general.
24. Existen exactamente nueve modos de coincidencia.
25. El orden de los nueve modos es absoluto.
26. `EXACT_VALUE_MATCH` es el nivel más preciso.
27. `SIMILARITY_CANDIDATE_ONLY` es el nivel de menor confianza.
28. El pipeline conserva exactamente quince pasos.
29. Autorización, finalidad, scope, estado y filtros estructurales se resuelven antes de matching y ranking.
30. El ranking usa la tupla canónica aprobada.
31. Popularidad y frecuencia no forman parte del ranking por defecto.
32. Un empate conserva todos los registros.
33. El primer resultado no es selección segura para mutar.
34. La respuesta lógica conserva 13 atributos mínimos.
35. La respuesta presenta `display_value`, no la clave derivada.
36. Una respuesta degradada debe declararlo.
37. La consulta se minimiza y no se persiste por defecto.
38. Secretos, firmas y credenciales no son buscables por derivación general.
39. Las 14 clases semánticas conservan decisión explícita.
40. Presentaciones se buscan por componentes y no por etiqueta como identidad.
41. SKU, slugs, códigos, contactos y referencias mantienen contratos propios.
42. Fuentes, overrides, copias, snapshots y externos conservan vínculo temporal y de autoridad.
43. La búsqueda ordinaria no auto-crea decisiones de revisión.
44. Ningún matching activa unicidad.
45. Ningún ranking selecciona sobreviviente.
46. Consulta, derivación e índice físico deberán ser compatibles por algoritmo y versión.
47. Los índices legacy no se presumen equivalentes a la política canónica.
48. Las capas deben mantener paridad.
49. VITAL permanece fuera de la política transversal de Vento OS.
50. No se crea package físico, TypeScript, SQL, RPC, trigger, índice, constraint, migración o backfill.
51. No se modifica Supabase.
52. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
53. `SHELL-NORM-007` queda como única continuidad reservada.

---

#### 35. Hallazgos y destinos exactos

| Hallazgo                                                                            | Resultado de `SHELL-NORM-006`                  | Destino exacto                                                      |
| ----------------------------------------------------------------------------------- | ---------------------------------------------- | ------------------------------------------------------------------- |
| la política de búsqueda ya estaba definida en E3 pero no centralizada en SHELL-NORM | política completa centralizada documentalmente | `SHELL-NORM-006`                                                    |
| los helpers legacy pueden divergir                                                  | ninguno se adopta como semántica transversal   | `DATA-NORM-ARC-011`; `SUPA-TRANS-006`; `SUPA-TRANS-009`             |
| la búsqueda sin tildes aumenta recall y puede introducir colisiones                 | tolerancia `es-CO` acotada con `ñ` preservada  | `DATA-NORM-ARC-009`; `SUPA-TRANS-009`; `SUPA-TRANS-010`             |
| transliteración no tiene perfil transversal aprobado                                | permanece deshabilitada                        | `SHELL-NORM-006`                                                    |
| similitud no tiene algoritmo transversal aprobado                                   | permanece deshabilitada                        | `SHELL-NORM-006`                                                    |
| aliases pueden crear equivalencias falsas                                           | solo aliases explícitos y gobernados           | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-009`                            |
| presentaciones y UOM pueden colisionar por etiqueta                                 | comparación estructurada obligatoria           | `DATA-NORM-ARC-010`; `DATA-NORM-TRANS-003`                          |
| búsqueda puede confundirse con identidad o fusión                                   | frontera estructural absoluta                  | `DATA-NORM-ARC-010`                                                 |
| package compartido aún no está materializado                                        | especificación documental completa             | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` |
| metadata y auditoría compartidas todavía pertenecen a la siguiente especialización  | no se anticipan aquí                           | `SHELL-NORM-008`                                                    |
| corpus y pruebas compartidas todavía pertenecen a su especialización                | no se implementan aquí                         | `SHELL-NORM-009`                                                    |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 36. Criterios de aceptación

`SHELL-NORM-006` queda documentalmente completa cuando se cumplen simultáneamente:

1. se centraliza exactamente `VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0`;
2. no se crea una segunda fuente de política;
3. se materializan documentalmente las siete representaciones;
4. faltantes de representaciones = 0;
5. duplicados de representaciones = 0;
6. `SEARCH_FORM_KEY` conserva su algoritmo lógico y exclusiones;
7. `SEARCH_ACCENT_KEY` preserva `ñ`;
8. no se adopta `unaccent` genérico como política;
9. se materializan las siete clases de token o frontera;
10. faltantes de clases de token = 0;
11. duplicados de clases de token = 0;
12. se conservan los 15 atributos de alias;
13. no se generan aliases por telemetría o diccionario;
14. transliteración permanece deshabilitada;
15. similitud permanece deshabilitada;
16. se materializan los seis perfiles;
17. faltantes de perfiles = 0;
18. duplicados de perfiles = 0;
19. se materializan los nueve modos;
20. faltantes de modos = 0;
21. duplicados de modos = 0;
22. se conserva el orden absoluto de los nueve niveles;
23. se conserva el pipeline de quince pasos;
24. se conserva el ranking determinista;
25. empates y paginación tienen orden estable;
26. se conservan los 13 atributos de respuesta;
27. se aplica minimización de consulta y explicación;
28. las catorce clases aparecen exactamente una vez;
29. faltantes de clases = 0;
30. duplicados de clases = 0;
31. se conservan los 11 componentes estructurados;
32. códigos, slugs, contactos e identificadores permanecen separados;
33. fuentes, snapshots y externos conservan su frontera;
34. búsqueda no sustituye revisión humana;
35. búsqueda no crea identidad ni unicidad;
36. versiones incompatibles no usan fallback silencioso;
37. índices legacy no se consideran equivalentes;
38. todas las capas quedan obligadas a paridad;
39. se conservan los 17 ejemplos normativos;
40. se conservan las 20 dimensiones de corpus;
41. VITAL permanece separado;
42. no se crea código;
43. no se crea package físico;
44. no se crean índices;
45. no se modifica Supabase;
46. no se crean ni modifican requisitos de prueba;
47. todos los carryovers tienen propietario exacto;
48. la siguiente tarea permanece únicamente reservada.

---

#### 37. Límites

`SHELL-NORM-006` no:

- crea físicamente `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts` o `.tsx`;
- define exports físicos;
- selecciona librerías runtime;
- crea schemas Zod o JSON Schema;
- crea tokenizer ejecutable;
- crea motor de matching;
- crea motor de ranking;
- crea API;
- crea RPC;
- crea SQL;
- crea triggers;
- crea índices;
- crea constraints;
- modifica RLS;
- ejecuta DDL;
- ejecuta DML;
- ejecuta backfills;
- modifica datos existentes;
- activa transliteración;
- activa similitud;
- selecciona umbrales de similitud;
- selecciona algoritmos fuzzy;
- agrega aliases;
- modifica diccionario;
- modifica excepciones;
- corrige valores;
- decide identidad;
- activa unicidad;
- fusiona registros;
- selecciona sobrevivientes;
- migra consumidores;
- modifica Supabase;
- redefine `DATA-NORM-ARC-001..012`;
- desarrolla `SHELL-NORM-007`.

---

#### 38. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados

##### TAREA ACTUAL APROBADA

SHELL-NORM-006 — Crear normalización de búsqueda y comparación

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-007 — Crear previsualización de transformaciones


### ✅ SHELL-NORM-007 — Crear previsualización de transformaciones

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-006 — Crear normalización de búsqueda y comparación
**Tarea siguiente:** SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas
**Tipo de tarea:** Documental; centralización dentro de `@vento/data-normalization` del contrato canónico de previsualización no vinculante de transformaciones y evaluaciones de normalización, preservando la autoridad única del servicio de dominio, las versiones efectivas, la fuente observada, la explicación, la divergencia previa al commit y la separación absoluta entre preview y mutación, sin materializar código, package físico, API, RPC, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-007` centraliza para la futura superficie compartida de `@vento/data-normalization` la conducta de previsualización ya aprobada por el gobierno de normalización de BLOQUE E3 y por las tareas `SHELL-NORM-001..006`.

La previsualización permite observar qué decidiría el motor semántico para una entrada y contexto concretos, con sus versiones, derivaciones, coincidencias, explicación, bloqueos o necesidad de revisión, sin convertir esa observación en una escritura, una reserva de estado, una confirmación de unicidad ni una autorización de commit.

La regla central es:

```text
ENTRADA OBSERVADA + CONTEXTO + VERSIONES
        ↓
MISMA AUTORIDAD SEMÁNTICA DEL SERVICIO
        ↓
EVALUACIÓN NO MUTANTE
        ↓
PREVISUALIZACIÓN EXPLICABLE
        ↓
SIN RESERVA
SIN COMMIT
SIN EFECTO EMPRESARIAL
```

Toda mutación posterior vuelve a atravesar la frontera transaccional y reevalúa el estado actual.

---

#### 2. Resultado material de la tarea

Queda definido documentalmente el contrato compartido de previsualización que deberá exponer `@vento/data-normalization` cuando se materialice físicamente.

El resultado centraliza, sin crear una política semántica nueva:

- las 4 funciones cerradas de autoridad ya aprobadas y la ubicación de `PREVIEW_AND_GUIDANCE`;
- las 4 capas lógicas y su frontera frente a la previsualización;
- la familia `NORMALIZATION_EVALUATION_QUERY` como consulta no mutante;
- el vínculo obligatorio entre preview y `AUTHORITATIVE_SEMANTIC_EVALUATION`;
- los 21 atributos del descriptor de colocación que gobierna una operación textual;
- las 10 etapas del flujo transaccional canónico, manteniendo el preview únicamente como etapa opcional previa al comando;
- las 6 dimensiones cuya modificación obliga a revalidar la previsualización antes del commit: valor, scope, política, versiones, unicidad y relaciones;
- la separación entre valor observado, salida propuesta, derivaciones, coincidencias, explicación y resultado cerrado de la operación evaluada;
- el tratamiento de previews iguales o divergentes respecto del commit;
- la conducta para resultados sin cambio, bloqueados, conflictivos, ambiguos, estructurales y fallidos técnicamente;
- las fronteras de privacidad, autorización, caché, offline, timeout, reintento e idempotencia;
- el handoff exacto hacia metadatos/auditoría y certificación del package.

No se crea un identificador nuevo de política, catálogo, tarea, estado o requisito de prueba.

---

#### 3. Fuentes normativas consumidas

| Fuente                | Decisión preservada por `SHELL-NORM-007`                                                                                                |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-NORM-001`      | identidad de `@vento/data-normalization`, pureza, determinismo, ausencia de I/O y separación entre evaluación, preview y commit         |
| `SHELL-NORM-002`      | clase semántica, representación, fuente, tratamiento y descriptor tipado de la entrada                                                  |
| `SHELL-NORM-003`      | operaciones deterministas de espacios, Unicode, puntuación de prosa y capitalización, con orden, política y exclusiones explícitas      |
| `SHELL-NORM-004`      | conectores, excepciones oficiales, precedencia, fuentes y formas protegidas                                                             |
| `SHELL-NORM-005`      | diccionario ortográfico versionado, resultados cerrados y separación frente a revisión                                                  |
| `SHELL-NORM-006`      | entrada, derivaciones, coincidencias, explicación, perfiles y versiones de búsqueda/comparación                                         |
| `DATA-NORM-ARC-009`   | conjunto efectivo de versiones, `version_set_digest`, procedencia y reproducibilidad                                                    |
| `DATA-NORM-ARC-011`   | cuatro capas, cuatro funciones de autoridad, consulta de evaluación, preview no vinculante, divergencia y revalidación previa al commit |
| `DATA-NORM-ARC-010`   | unicidad y duplicidad no se confirman desde una previsualización                                                                        |
| `DATA-NORM-ARC-012`   | originales externos y evidencia no se sobrescriben mediante una proyección previa                                                       |
| `SUPA-TRANS-007`      | adaptación de consumidores y presentación de divergencias                                                                               |
| `DATA-NORM-TRANS-005` | materialización transaccional posterior y reevaluación antes de persistir                                                               |

`SHELL-NORM-007` no sustituye ninguna de estas autoridades; únicamente fija su proyección compartida para preview.

---

#### 4. Frontera exacta

Esta tarea define documentalmente:

- qué es y qué no es una previsualización;
- qué autoridad produce el resultado semántico;
- qué información mínima deberá conservarse para interpretar la salida;
- cómo se relaciona el preview con las operaciones `SHELL-NORM-002..006`;
- cómo debe presentarse una transformación propuesta sin afirmar que fue aplicada;
- cómo se exponen derivaciones y coincidencias de búsqueda sin convertirlas en identidad;
- cómo se trata una entrada ya canónica;
- cómo se exponen bloqueos, conflictos, revisión y fallos técnicos;
- cómo se detecta divergencia entre preview y commit;
- qué debe revalidarse al escribir;
- qué responsabilidades permanecen en la aplicación, servicio de dominio, RPC y trigger;
- qué datos no pueden exponerse;
- qué estado físico permanece pendiente y cuál es su propietario exacto.

Esta tarea no:

- crea una API física de preview;
- define endpoint, ruta HTTP, RPC o función SQL;
- crea tipos o schemas runtime;
- selecciona framework, librería, transporte o serialización;
- persiste previews;
- crea una tabla o ledger de previews;
- crea auditoría física;
- reserva filas o locks;
- confirma una mutación;
- crea aliases, reglas, diccionarios o catálogos nuevos;
- cambia algoritmos de búsqueda o normalización;
- activa similitud o transliteración;
- modifica Supabase.

---

#### 5. Función de autoridad aplicable

La previsualización conserva exactamente la función aprobada:

```text
PREVIEW_AND_GUIDANCE
```

Su significado permanece:

```text
producir sugerencia, explicación o validación no vinculante
para interacción humana
```

La aplicación presenta el resultado, pero no decide la semántica. La decisión semántica pertenece a:

```text
AUTHORITATIVE_SEMANTIC_EVALUATION
```

producida por el servicio de dominio.

La previsualización nunca asume:

```text
TRANSACTIONAL_REVALIDATION_AND_COMMIT
```

ni:

```text
DEFENSIVE_INVARIANT_ENFORCEMENT
```

---

#### 6. Modelo de las cuatro capas

| Capa                            | Responsabilidad frente al preview                                                                             | Autoridad que no posee                                             |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `APPLICATION_INTERACTION_LAYER` | captura intención, solicita preview servidor, muestra original, propuesta, explicación, bloqueos y candidatos | no define política, no selecciona versiones y no confirma mutación |
| `DOMAIN_NORMALIZATION_SERVICE`  | produce la evaluación semántica autoritativa consumida por preview                                            | no confirma escritura ni sustituye autorización o transacción      |
| `TRANSACTIONAL_RPC_BOUNDARY`    | reevalúa al existir intención de escritura y confirma únicamente el resultado vigente autorizado              | no reutiliza ciegamente un preview ni inventa reglas               |
| `DEFENSIVE_DATABASE_TRIGGER`    | participa únicamente en la defensa de una escritura posterior cuando el descriptor lo autoriza                | no produce preview, no decide semántica y no corrige ambigüedades  |

La previsualización no crea una quinta capa.

---

#### 7. Familia de consulta

El preview pertenece a la familia canónica:

```text
NORMALIZATION_EVALUATION_QUERY
```

Su finalidad es:

```text
obtener previsualización o evaluación sin mutar
```

La frontera obligatoria es el servicio de dominio mediante una superficie servidor futura.

Consecuencias:

1. el cliente no ejecuta un normalizador local como autoridad;
2. un resultado local puramente visual no sustituye el preview canónico;
3. una consulta de evaluación no se convierte en comando de escritura;
4. una respuesta favorable no prueba que una mutación posterior vaya a poder confirmarse;
5. el preview no crea un evento raíz de commit.

---

#### 8. Descriptor de colocación heredado

Toda operación que pueda previsualizarse permanece gobernada por el descriptor de 21 atributos ya aprobado:

```text
execution_policy_key
operation_kind
policy_coordinate
semantic_class
representation_role
source_role
primary_semantic_authority
transactional_boundary
application_preview_mode
trigger_mode
allowed_callers
required_authorization_context
resolved_version_dependencies
idempotency_class
concurrency_expectations
mutation_target
synchronous_derivations
audit_owner
failure_mode
bypass_policy
propagation_policy
```

Reglas:

1. `SHELL-NORM-007` no crea un descriptor alternativo;
2. `application_preview_mode` se consume desde el descriptor efectivo y no se infiere por UI;
3. `primary_semantic_authority` continúa siendo el servicio de dominio;
4. una operación sin descriptor compatible no adquiere preview ejecutable por estar visible en una aplicación;
5. el preview no amplía `allowed_callers`, autorización, bypass ni destino de mutación;
6. el descriptor pertenece al conjunto de versiones efectivo.

Conciliación:

```text
atributos esperados = 21
atributos centralizados = 21
faltantes = 0
duplicados = 0
```

---

#### 9. Entrada lógica mínima de una previsualización

La solicitud deberá poder aportar o resolver, conforme al descriptor y a la autorización aplicable:

- intención u operación solicitada;
- coordenada de política;
- clase semántica;
- representación;
- rol de fuente;
- valor o estructura observada que corresponda a la operación;
- scope y finalidad aplicables;
- versión o hash de la fuente observada cuando exista estado persistido;
- dependencias de versión necesarias para evaluar;
- contexto de autorización requerido por la operación;
- parámetros estructurados propios de la operación, cuando existan.

Reglas:

1. el cliente no sustituye el valor fuente por el resultado de un helper local antes de solicitar la evaluación;
2. un campo, scope, fuente o versión faltante que impida resolver la política produce bloqueo o fallo conforme al contrato vigente;
3. secretos, firmas y material criptográfico permanecen fuera del pipeline general;
4. un original externo se preserva y cualquier propuesta interna se mantiene separada;
5. una previsualización no exige que exista todavía una mutación futura.

---

#### 10. Salida lógica mínima

Toda previsualización deberá permitir distinguir, según la operación y autorización:

- entrada o fuente observada;
- salida propuesta o valor preservado;
- resultado cerrado producido por la operación canónica correspondiente;
- explicación o motivo suficiente para interpretar el resultado;
- operaciones, reglas, catálogos o decisiones efectivamente consumidos cuando formen parte de la explicación autorizada;
- bloqueos, conflictos, necesidad de revisión o escalamiento estructural cuando correspondan;
- derivaciones producidas por la evaluación;
- coincidencias y explicación de búsqueda/comparación cuando la operación las incluya;
- conjunto efectivo de versiones y `version_set_digest`;
- versión o hash de la fuente observada cuando aplique;
- momento de observación necesario para interpretar vigencia;
- scope relevante para la decisión;
- indicación inequívoca de que el resultado es no vinculante.

La previsualización no crea una taxonomía paralela de resultados. Reutiliza el resultado cerrado de la operación evaluada.

---

#### 11. Original, propuesta y diferencia visible

Cuando exista una transformación candidata, la experiencia deberá permitir reconocer sin ambigüedad:

```text
VALOR OBSERVADO
        ↓
EVALUACIÓN CANÓNICA
        ↓
VALOR PROPUESTO O PRESERVADO
```

Reglas:

1. el original no se reemplaza visualmente de forma que parezca ya persistido;
2. la propuesta no se marca como aplicada;
3. una transformación puramente visual de la interfaz no altera el payload canónico;
4. un valor ya canónico se distingue de una operación bloqueada;
5. una propuesta ambigua se distingue de una corrección determinista;
6. una salida protegida o preservada no se presenta como fallo técnico;
7. un fallo técnico no se presenta como ausencia de cambio.

Esta tarea no prescribe un componente visual, formato de diff ni diseño de pantalla concreto.

---

#### 12. Integración con `SHELL-NORM-002`

El preview deberá conservar la clasificación resuelta por `SHELL-NORM-002`.

No podrá:

- recategorizar un campo por apariencia del valor;
- convertir `UNCLASSIFIED_PRESERVE` en una operación permisiva;
- tratar un identificador técnico como nombre comercial;
- cambiar representación o rol de fuente para obtener un resultado más conveniente;
- omitir la política de un campo porque la propuesta parezca segura.

La clase, representación y fuente mostradas o explicadas deberán corresponder a la evaluación servidor.

---

#### 13. Integración con `SHELL-NORM-003`

Para espacios, Unicode, puntuación de prosa y capitalización, la previsualización deberá:

- consumir exactamente el orden y las operaciones autorizadas;
- mostrar la salida producida sin volver a ejecutar una variante local;
- conservar exclusiones, límites de segmento y reglas de preservación;
- mantener las operaciones separadas cuando el contrato las distinga;
- evidenciar cuando una operación no aplica o queda bloqueada.

No existe una previsualización basada en `trim`, `lower`, `initcap`, `unaccent` u otro helper genérico por conveniencia del cliente.

---

#### 14. Integración con `SHELL-NORM-004`

Para conectores y excepciones, la previsualización deberá conservar:

- precedencia aprobada;
- forma oficial o preservada;
- alcance de la coincidencia;
- fuente o autoridad aplicable cuando sea visible por autorización;
- resultado de evaluación correspondiente;
- bloqueo ante conflicto.

No podrá inferir aliases, ampliar scopes, elegir por frecuencia ni convertir un candidato sin autoridad en una excepción activa.

---

#### 15. Integración con `SHELL-NORM-005`

Para diccionario ortográfico, la previsualización deberá:

- consumir la versión exacta del diccionario;
- aplicar únicamente entradas activas y compatibles;
- conservar la caja resuelta por las etapas anteriores;
- diferenciar corrección, preservación, ambigüedad, conflicto y bloqueo;
- mantener `expresso` fuera de corrección automática mientras no exista una decisión contextual aprobada;
- conservar originales externos, snapshots y evidencia.

La previsualización de una corrección no autoriza su persistencia.

---

#### 16. Integración con `SHELL-NORM-006`

Para búsqueda y comparación, el preview deberá poder mostrar, según autorización:

- consulta o entrada observada;
- representación o derivaciones utilizadas;
- coincidencias obtenidas;
- modo y nivel de coincidencia;
- scope y filtros efectivos;
- valor mostrado autorizado;
- explicación de ranking cuando corresponda;
- versiones y algoritmo aplicables;
- bloqueos o degradación explícita.

Invariantes:

1. una coincidencia no es una transformación aplicada;
2. el primer resultado no es selección segura;
3. una derivación no sustituye el valor mostrado;
4. una coincidencia exacta no demuestra identidad;
5. una similitud deshabilitada no se activa para mejorar el preview;
6. un resultado de búsqueda utilizado después en una mutación deberá revalidarse por identificador estable.

---

#### 17. Conjunto de versiones y reproducibilidad

Toda previsualización consume un conjunto efectivo de versiones y conserva:

```text
resolved_version_set
version_set_digest
```

cuando apliquen al resultado.

Reglas:

1. no existe `latest` implícito;
2. la misma entrada lógica, contexto y conjunto de versiones debe producir el mismo resultado lógico;
3. una dependencia ausente, suspendida, retirada o incompatible bloquea la evaluación correspondiente;
4. el cliente no reemplaza una dependencia por otra local;
5. una nueva versión produce una nueva evaluación y no reinterpreta silenciosamente el preview anterior;
6. la procedencia detallada de algoritmo y auditoría compartida se centralizará en `SHELL-NORM-008` sin cambiar estas obligaciones.

---

#### 18. Preview no vinculante

Toda previsualización es, por definición:

```text
NO VINCULANTE
```

Por tanto:

- no reserva la fila;
- no crea lock empresarial;
- no garantiza que la fuente permanezca igual;
- no garantiza que la política permanezca igual;
- no garantiza que la versión siga vigente;
- no garantiza unicidad;
- no garantiza que relaciones o contexto sigan iguales;
- no constituye commit;
- no constituye evidencia de que una mutación fue persistida;
- no puede reutilizarse como autorización para otro registro, scope o versión.

Una previsualización puede ser reproducible respecto de su corte observado y aun así quedar obsoleta antes de una escritura futura.

---

#### 19. Las seis dimensiones de divergencia previa al commit

Antes de persistir, la frontera transaccional vuelve a evaluar el estado actual y no reutiliza ciegamente un preview cuando cambie cualquiera de estas dimensiones:

| Dimensión  | Regla                                                                      |
| ---------- | -------------------------------------------------------------------------- |
| valor      | la fuente actual debe ser revalidada frente a la observada                 |
| scope      | el alcance actual debe seguir siendo compatible                            |
| política   | la decisión efectiva no puede asumirse desde el preview anterior           |
| versiones  | el conjunto vigente debe revalidarse                                       |
| unicidad   | cualquier señal o protección aplicable se vuelve a evaluar                 |
| relaciones | dependencias estructurales relevantes se comprueban sobre el estado actual |

Conciliación:

```text
dimensiones esperadas = 6
dimensiones centralizadas = 6
faltantes = 0
duplicados = 0
```

---

#### 20. Conducta cuando preview y commit divergen

Si una reevaluación posterior produce una diferencia material:

1. no se aplica silenciosamente una salida distinta a la mostrada;
2. la RPC devuelve el resultado actual, conflicto, bloqueo o revisión que corresponda;
3. la aplicación muestra la diferencia cuando cambie el valor resultante o la decisión humana requerida;
4. una confirmación previa no se reutiliza para otra salida;
5. una versión nueva no se incorpora dentro de un reintento de una operación anterior;
6. un conflicto de concurrencia no se resuelve mediante último escritor;
7. el usuario o proceso deberá continuar desde el resultado vigente conforme al contrato de la operación.

La forma física de la respuesta de divergencia pertenece a la futura implementación de `DATA-NORM-ARC-011` y a la adaptación de consumidores en `SUPA-TRANS-007`.

---

#### 21. Relación con el flujo transaccional de diez etapas

La previsualización ocupa únicamente la etapa opcional 2:

```text
1. capturar intención, valor, contexto y versión observada
2. solicitar opcionalmente preview servidor no vinculante
3. enviar comando con client_command_id y expectativa de fuente
4. autenticar, autorizar y construir operación idempotente
5. resolver coordenada, versiones y resultado en servicio de dominio
6. revalidar estado, concurrencia, unicidad y precondiciones
7. persistir fuente, derivaciones sincrónicas y auditoría raíz
8. comprobar invariantes defensivos autorizados
9. confirmar commit y devolver resultado
10. continuar propagaciones o destinos asincrónicos como comandos hijos
```

Reglas:

- el preview es opcional para el flujo transaccional salvo que una experiencia o política específica lo exija;
- si existe, no permite omitir ninguna etapa posterior;
- un administrador no puede saltar revalidación por haber visto un preview;
- un trigger no puede convertir un preview en commit;
- la futura API compartida debe conservar la separación entre consulta y comando.

---

#### 22. Resultados de fallo y bloqueo heredados

La previsualización conserva los resultados o conductas ya definidos por la arquitectura cuando correspondan:

| Condición                               | Conducta visible y contractual                                 |
| --------------------------------------- | -------------------------------------------------------------- |
| servicio de dominio no disponible       | conservar entrada y devolver fallo técnico; sin fallback local |
| política, versión o dependencia ausente | `BLOCKED_POLICY`                                               |
| dos reglas o resultados incompatibles   | `BLOCKED_CONFLICT`                                             |
| valor, scope o estado obsoleto          | conflicto de concurrencia y reevaluación                       |
| corrección ambigua                      | `REVIEW_REQUIRED`                                              |
| problema estructural o de identidad     | `ESCALATED_STRUCTURAL`                                         |
| mismatch entre artefacto y versión      | bloquear ejecución e iniciar reconciliación propietaria        |

La aplicación no traduce un bloqueo en éxito, una revisión en corrección ni un fallo técnico en “sin cambios”.

---

#### 23. Revisión humana

Un preview puede mostrar que una decisión requiere revisión, pero no puede:

- aprobar el candidato;
- asignar autoridad por sí mismo;
- activar una entrada;
- materializar una corrección;
- cerrar un expediente;
- convertir una sugerencia en forma canónica.

Las decisiones humanas permanecen en `DATA-NORM-ARC-007` y sus mecanismos de materialización posteriores.

---

#### 24. Unicidad y duplicidad

La previsualización puede presentar candidatos, advertencias o bloqueos devueltos por la autoridad servidor, pero no demuestra unicidad ni decide identidad.

Invariantes:

```text
PREVIEW SIN CANDIDATOS
≠ UNICIDAD CERTIFICADA

PREVIEW CON CANDIDATO
≠ DUPLICADO CONFIRMADO

CONFIRMACIÓN VISUAL
≠ PROTECCIÓN ATÓMICA
```

La RPC y la base revalidan cualquier protección certificada antes del commit conforme a `DATA-NORM-ARC-010` y `DATA-NORM-ARC-011`.

---

#### 25. Offline, caché, timeout y reintentos

1. una caché de preview conserva scope, versiones y vigencia; no se convierte en fuente de verdad;
2. un cliente offline no ejecuta una versión local como autoridad semántica;
3. si el servicio no está disponible, se conserva la entrada y se muestra el fallo o bloqueo correspondiente;
4. después de timeout de una mutación, se consulta el resultado de la operación antes de crear otra;
5. una previsualización no sustituye `expected_source_version_or_hash` ni `expected_version_set_digest` del commit;
6. un retry de una mutación no adopta silenciosamente una versión nueva;
7. volver online obliga a revalidar contexto, fuente y versiones antes de una nueva mutación.

---

#### 26. Seguridad, privacidad y minimización

1. lectura, preview, mutación, aprobación, activación, búsqueda sensible y exportación permanecen capacidades diferenciadas;
2. la aplicación no es frontera de seguridad;
3. el servidor aplica la autorización necesaria antes de exponer datos protegidos;
4. el preview no amplía la visibilidad respecto del actor y finalidad autorizados;
5. secretos, firmas, tokens y material criptográfico no ingresan al pipeline general;
6. valores sensibles, evidencia y metadatos se minimizan en explicación y telemetría;
7. la existencia de una propuesta no autoriza revelar fuentes o evidencias que el actor no puede consultar;
8. VITAL permanece fuera del contrato transversal de Vento OS.

---

#### 27. Estado de materialización física

| Elemento                                   | Estado                                           |
| ------------------------------------------ | ------------------------------------------------ |
| `@vento/data-normalization`                | `ESPECIFICADO`; package físico no materializado  |
| contrato compartido de preview             | `ESPECIFICADO`                                   |
| `PREVIEW_AND_GUIDANCE`                     | `ESPECIFICADO`                                   |
| `NORMALIZATION_EVALUATION_QUERY`           | `ESPECIFICADA`                                   |
| descriptor de colocación de 21 atributos   | `ESPECIFICADO`                                   |
| 6 dimensiones de divergencia               | `ESPECIFICADAS`                                  |
| separación preview/commit                  | `ESPECIFICADA`                                   |
| revalidación previa al commit              | `ESPECIFICADA`; ejecución no materializada       |
| API TypeScript                             | `NO IMPLEMENTADA`                                |
| endpoint o RPC de preview                  | `NO IMPLEMENTADO`                                |
| persistencia de previews                   | `FUERA_DE_ALCANCE`; no autorizada por esta tarea |
| auditoría física                           | `NO IMPLEMENTADA`                                |
| consumidores migrados                      | `0` por esta tarea                               |
| cambios Supabase                           | `0`                                              |
| requisitos de prueba creados o modificados | `0`                                              |

`ESPECIFICADO_DOCUMENTALMENTE` no equivale a `IMPLEMENTADO`, `VALIDADO` ni a una respuesta real de preview.

---

#### 28. Handoffs exactos

| Materia fuera de esta tarea                                  | Propietario exacto                                                  | Condición de salida                                                                                                |
| ------------------------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| metadatos compartidos de versión y auditoría                 | `SHELL-NORM-008`                                                    | cada evaluación compartida debe poder atribuirse a entrada, conjunto de versiones, algoritmo, resultado y contexto |
| pruebas de idempotencia y conservación semántica del package | `SHELL-NORM-009`                                                    | corpus debe cubrir preview estable, divergente, bloqueado y sin efectos de escritura                               |
| decisión humana sobre candidatos ambiguos                    | `DATA-NORM-ARC-007`                                                 | preview puede mostrar revisión requerida, pero no aprobarla                                                        |
| identidad, unicidad y duplicidad                             | `DATA-NORM-ARC-010`                                                 | preview no certifica identidad ni protección concurrente                                                           |
| API servidor, servicio, RPC y contrato físico de commit      | `DATA-NORM-ARC-011`                                                 | preview y commit deben consumir la misma autoridad semántica con fronteras separadas                               |
| originales y evidencia externa                               | `DATA-NORM-ARC-012`                                                 | una propuesta interna nunca sustituye el valor externo recibido                                                    |
| adaptación de consumidores y experiencia de divergencia      | `SUPA-TRANS-007`                                                    | cliente muestra resultado vigente y diferencias sin fallback local                                                 |
| pruebas de paridad entre capas                               | `SUPA-TRANS-009`                                                    | misma entrada y versiones producen evaluación equivalente entre capas autorizadas                                  |
| rendimiento y seguridad de la futura superficie servidor     | `SUPA-TRANS-010`                                                    | capacidad se certifica bajo carga sin relajar semántica ni seguridad                                               |
| rollback de transición                                       | `SUPA-TRANS-011`                                                    | una reversión no convierte previews históricos en commits ni reinterpreta evidencia                                |
| materialización transaccional de cambios                     | `DATA-NORM-TRANS-005`                                               | toda escritura vuelve a evaluar estado actual antes de persistir                                                   |
| certificación final de paridad                               | `DATA-NORM-TRANS-009`                                               | corpus demuestra preview/commit, versiones, concurrencia y ausencia de efectos no autorizados                      |
| materialización física del package                           | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` | crear y desplegar únicamente el package autorizado                                                                 |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 29. Cobertura de prueba vigente no modificada

La conducta centralizada ya está protegida por requisitos canónicos vigentes, entre ellos:

- `TREQ-DATA-191`: cuatro capas y cuatro funciones de autoridad;
- `TREQ-DATA-192`: aplicación limitada a captura, preview y explicación, sin autoridad de commit;
- `TREQ-DATA-193`: misma autoridad semántica para preview, RPC, jobs y replay;
- `TREQ-DATA-196`: descriptor obligatorio de colocación y `application_preview_mode`;
- `TREQ-DATA-197`: flujo transaccional completo sin omitir etapas por existir preview;
- `TREQ-DATA-201`: preview no vinculante, fuente observada, `version_set_digest`, reevaluación y divergencia previa al commit;
- `TREQ-DATA-203`: la aplicación solo previsualiza normalización determinista; servicio y RPC conservan autoridad;
- `TREQ-DATA-205`: búsqueda del lado servidor y revalidación por identificador estable;
- `TREQ-DATA-211`: lectura, preview, mutación, aprobación, activación, búsqueda sensible y exportación como capacidades distintas;
- `TREQ-DATA-214`: corpus integral que incluye preview igual y divergente frente al commit;
- `TREQ-SHELL-002`: responsabilidades compartidas no pueden divergir mediante copias locales;
- `TREQ-SHELL-006`: packages compartidos requieren pruebas propias y compatibilidad con consumidores antes de adopción.

`SHELL-NORM-007` no modifica esas reglas protegidas; centraliza su proyección dentro del futuro `@vento/data-normalization`.

---

#### 30. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-NORM-007` centraliza sin ampliar el comportamiento de previsualización, autoridad, revalidación y divergencia ya aprobado en `DATA-NORM-ARC-011` y protegido por requisitos canónicos existentes. No introduce una operación nueva, un estado nuevo, un resultado nuevo, una política, un algoritmo, un scope, una autorización, una persistencia, una API, una migración, una mutación de datos ni un cambio en Supabase. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 31. Decisiones vinculantes

1. Toda previsualización es no vinculante.
2. `PREVIEW_AND_GUIDANCE` permanece como función de interacción y no de commit.
3. La autoridad semántica sigue siendo `AUTHORITATIVE_SEMANTIC_EVALUATION` del servicio de dominio.
4. La previsualización pertenece a `NORMALIZATION_EVALUATION_QUERY`.
5. El preview no crea una quinta capa.
6. El descriptor de colocación conserva exactamente 21 atributos.
7. `application_preview_mode` se resuelve desde el descriptor efectivo.
8. El preview no amplía callers, permisos, bypass ni target de mutación.
9. El cliente conserva la entrada original y no sustituye la fuente por un helper local.
10. La salida distingue fuente observada, propuesta o preservación, resultado y explicación.
11. La salida puede incluir derivaciones y coincidencias únicamente conforme a la operación y autorización.
12. El preview conserva el conjunto efectivo de versiones y `version_set_digest`.
13. No existe `latest` implícito.
14. El resultado de preview no reserva fila ni estado.
15. El preview no garantiza commit.
16. El preview no garantiza unicidad.
17. El preview no constituye auditoría raíz de mutación.
18. El preview no permite omitir autenticación, autorización, idempotencia o concurrencia de una escritura posterior.
19. Una mutación posterior vuelve a evaluar el estado actual.
20. Las seis dimensiones de divergencia son valor, scope, política, versiones, unicidad y relaciones.
21. Si existe divergencia material, no se persiste silenciosamente una salida distinta.
22. Una propuesta ambigua continúa siendo revisión requerida.
23. Un resultado ya canónico se distingue de un bloqueo.
24. Un fallo técnico se distingue de ausencia de cambio.
25. `SHELL-NORM-003` no se reemplaza por helpers locales durante preview.
26. `SHELL-NORM-004` conserva precedencia y autoridad de excepciones durante preview.
27. `SHELL-NORM-005` conserva entradas, versiones y ambigüedad durante preview.
28. `SHELL-NORM-006` conserva derivaciones, coincidencias, ranking y frontera frente a identidad.
29. Una coincidencia de búsqueda no se convierte en selección automática.
30. Un preview sin candidatos no certifica unicidad.
31. Una confirmación visual no sustituye protección atómica.
32. Un cliente offline no se convierte en autoridad semántica.
33. Una caché no se convierte en fuente de verdad.
34. Una previsualización no sustituye expectativas de fuente y versiones del commit.
35. Lectura, preview y mutación permanecen capacidades distintas.
36. Secretos, firmas, tokens y material criptográfico permanecen fuera del pipeline general.
37. VITAL permanece fuera del contrato transversal.
38. No se crea API física, endpoint, RPC, tabla, ledger, TypeScript, SQL, trigger, índice, constraint, migración o backfill.
39. No se modifica Supabase.
40. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
41. `SHELL-NORM-008` queda como única continuidad reservada.

---

#### 32. Hallazgos y destinos exactos

| Hallazgo                                                                            | Resultado de `SHELL-NORM-007`                                          | Destino exacto                                                      |
| ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------- |
| la semántica de preview ya estaba aprobada en E3 pero no centralizada en SHELL-NORM | contrato completo centralizado documentalmente                         | `SHELL-NORM-007`                                                    |
| el preview podía confundirse con resultado confirmado                               | separación absoluta preview/commit preservada                          | `SHELL-NORM-007`; `DATA-NORM-ARC-011`                               |
| una versión puede cambiar entre preview y commit                                    | `version_set_digest` se conserva y el commit reevalúa                  | `SHELL-NORM-008`; `DATA-NORM-TRANS-005`                             |
| valor, scope, política, versiones, unicidad o relaciones pueden cambiar             | seis dimensiones de divergencia centralizadas                          | `DATA-NORM-ARC-011`; `SUPA-TRANS-007`                               |
| clientes offline o con caché podrían usar resultados obsoletos                      | fallback semántico local prohibido                                     | `SUPA-TRANS-007`; `SUPA-TRANS-009`                                  |
| una advertencia de duplicidad podría confundirse con protección concurrente         | preview no certifica unicidad                                          | `DATA-NORM-ARC-010`; `DATA-NORM-TRANS-005`                          |
| búsqueda y comparación pueden producir candidatos sin autoridad de mutación         | derivaciones y coincidencias se muestran sin convertirlas en identidad | `SHELL-NORM-006`; `DATA-NORM-ARC-011`                               |
| metadata detallada y auditoría compartida todavía requieren especialización         | no se anticipa su contrato físico                                      | `SHELL-NORM-008`                                                    |
| corpus de idempotencia y conservación semántica requiere certificación específica   | no se implementan pruebas aquí                                         | `SHELL-NORM-009`                                                    |
| package compartido aún no está materializado físicamente                            | especificación completa; ejecución no iniciada                         | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 33. Criterios de aceptación

`SHELL-NORM-007` queda documentalmente completa cuando se cumplen simultáneamente:

1. `PREVIEW_AND_GUIDANCE` permanece separado de autoridad semántica y commit;
2. se preservan las cuatro capas sin crear una quinta;
3. `NORMALIZATION_EVALUATION_QUERY` queda centralizada como consulta no mutante;
4. se preservan exactamente los 21 atributos del descriptor;
5. faltantes de atributos = 0;
6. duplicados de atributos = 0;
7. la entrada de preview conserva operación, política, clase, representación, fuente, scope y versiones aplicables;
8. la salida conserva fuente observada, propuesta o preservación, resultado y explicación;
9. la salida puede representar bloqueos, conflictos, revisión y fallos sin colapsarlos;
10. derivaciones y coincidencias de búsqueda permanecen explicables y no vinculantes;
11. el preview conserva `version_set_digest` cuando aplica;
12. no existe selección `latest` implícita;
13. un preview no reserva estado;
14. un preview no garantiza commit;
15. un preview no certifica unicidad;
16. un preview no se usa como auditoría de commit;
17. la mutación posterior reevalúa estado actual;
18. se preservan exactamente las seis dimensiones de divergencia;
19. faltantes de dimensiones = 0;
20. duplicados de dimensiones = 0;
21. una divergencia material no se aplica silenciosamente;
22. un valor ya canónico se distingue de un bloqueo;
23. un fallo técnico se distingue de una no operación;
24. preview de espacios, Unicode, puntuación de prosa y capitalización conserva `SHELL-NORM-003`;
25. preview de conectores y excepciones conserva `SHELL-NORM-004`;
26. preview de diccionario conserva `SHELL-NORM-005`;
27. preview de búsqueda conserva `SHELL-NORM-006`;
28. revisión humana permanece separada;
29. identidad y unicidad permanecen separadas;
30. cliente offline y caché no adquieren autoridad;
31. timeout y reintento no convierten preview en operación confirmada;
32. autorización y minimización permanecen obligatorias;
33. VITAL permanece separado;
34. no se crea código;
35. no se crea package físico;
36. no se crea API, endpoint o RPC;
37. no se persisten previews;
38. no se modifica Supabase;
39. no se crean ni modifican requisitos de prueba;
40. todos los carryovers tienen propietario exacto;
41. la siguiente tarea permanece únicamente reservada.

---

#### 34. Límites

`SHELL-NORM-007` no:

- crea físicamente `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts` o `.tsx`;
- define exports físicos;
- crea schemas runtime;
- define endpoint HTTP;
- crea RPC;
- crea función SQL;
- crea tablas de preview;
- persiste previsualizaciones;
- crea locks;
- confirma commits;
- crea auditoría raíz;
- crea triggers;
- crea índices;
- crea constraints;
- modifica RLS;
- ejecuta DDL;
- ejecuta DML;
- ejecuta backfills;
- modifica datos existentes;
- crea aliases;
- modifica conectores o excepciones;
- modifica diccionario;
- cambia algoritmos de búsqueda;
- activa similitud;
- activa transliteración;
- decide identidad;
- activa unicidad;
- fusiona registros;
- selecciona sobrevivientes;
- migra consumidores;
- modifica Supabase;
- redefine `DATA-NORM-ARC-001..012`;
- desarrolla `SHELL-NORM-008`.

---

#### 35. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-006 — Crear normalización de búsqueda y comparación

##### TAREA ACTUAL APROBADA

SHELL-NORM-007 — Crear previsualización de transformaciones

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas


### ✅ SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-007 — Crear previsualización de transformaciones
**Tarea siguiente:** SHELL-NORM-009 — Probar idempotencia y conservación semántica
**Tipo de tarea:** Documental; centralización dentro de `@vento/data-normalization` de los metadatos canónicos de versión, procedencia, auditoría lógica, correlación, idempotencia y reproducibilidad ya aprobados, preservando la inmutabilidad de reglas, el conjunto efectivo de versiones, la separación entre evaluación y efecto persistido y las fronteras de autoridad de BLOQUE E3, sin materializar código, package físico, almacenamiento, API, RPC, SQL, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** NO MATERIALIZADO
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-008` centraliza para la futura superficie compartida de `@vento/data-normalization` los metadatos de versión, procedencia, auditoría lógica, correlación, idempotencia y reproducibilidad definidos por `DATA-NORM-ARC-009`, sin convertir el package en almacén de auditoría, sistema de identidad, frontera transaccional ni fuente alternativa de gobierno.

La tarea hace consumible la siguiente relación documental:

```text
REGLA / CATÁLOGO / POLÍTICA VERSIONADA
        ↓
CONJUNTO EFECTIVO DE VERSIONES
        ↓
EVALUACIÓN SEMÁNTICA PURA
        ↓
METADATOS REPRODUCIBLES
        ↓
REGISTRO LÓGICO CORRESPONDIENTE
        ↓
PERSISTENCIA O EFECTO SOLO EN LA CAPA PROPIETARIA
```

La regla central es:

```text
METADATOS COMPARTIDOS
≠ AUDITORÍA PERSISTIDA
≠ AUTORIZACIÓN
≠ COMMIT
≠ EFECTO EMPRESARIAL
```

El package podrá producir o validar información lógica determinista a partir de entradas explícitas, pero no inventará actor, tiempo, autorización, identidad de evento, estado persistido ni evidencia externa ausente.

---

#### 2. Resultado material de la tarea

Queda centralizada documentalmente, sin cambiar identidad ni versión, la proyección compartida de:

```text
VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0
```

La centralización materializa exactamente:

- 6 familias cerradas de registro lógico;
- 13 atributos de identidad estable de regla y versión;
- 11 dependencias posibles del `resolved_version_set`;
- 8 estados unificados de ciclo de vida;
- 7 metadatos de aprobación, vigencia y activación;
- 5 modos cerrados de compatibilidad y coexistencia;
- 11 atributos de procedencia de algoritmo;
- 12 clases cerradas de evento de auditoría;
- 30 atributos del contrato lógico mínimo de auditoría;
- 10 resultados cerrados de evaluación;
- 5 clases de retención lógica;
- 3 niveles de reproducibilidad;
- 7 tiempos semánticamente distintos;
- 9 componentes de la clave lógica de idempotencia;
- 6 clases de operación idempotente;
- 4 expectativas de concurrencia y estado;
- 9 atributos del contrato de replay controlado.

No se crea un contrato semántico alternativo ni una versión nueva de la política E3.

---

#### 3. Fuentes normativas y precedencia

| Fuente                     | Decisión preservada por `SHELL-NORM-008`                                                                                                   |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `SHELL-NORM-001`           | identidad de `@vento/data-normalization`, pureza, determinismo, ausencia de I/O y separación frente a persistencia y auditoría propietaria |
| `SHELL-NORM-002`           | clases semánticas, representaciones, fuentes y operaciones que forman parte de la coordenada evaluada                                      |
| `SHELL-NORM-003`           | reglas deterministas y dependencias lingüísticas explícitas                                                                                |
| `SHELL-NORM-004`           | catálogos de conectores y excepciones con identidad, versión, estado y autoridad                                                           |
| `SHELL-NORM-005`           | diccionario ortográfico versionado, ciclo de vida, evidencia y resultados cerrados                                                         |
| `SHELL-NORM-006`           | política de búsqueda y comparación, algoritmos, ranking y versiones compatibles                                                            |
| `SHELL-NORM-007`           | preview no vinculante, `resolved_version_set`, `version_set_digest` y separación absoluta frente al commit                                 |
| `DATA-NORM-ARC-009`        | autoridad completa sobre auditoría, versionado, procedencia, idempotencia, replay y reproducibilidad                                       |
| `DATA-NORM-ARC-010`        | frontera frente a identidad, unicidad, duplicidad y fusión                                                                                 |
| `DATA-NORM-ARC-011`        | distribución de autoridad entre aplicación, servicio, RPC y trigger, incluida la propiedad del registro raíz de una mutación               |
| `DATA-NORM-ARC-012`        | preservación, procedencia y minimización de originales externos                                                                            |
| `DATA-NORM-TRANS-004..009` | coexistencia, materialización, activación, validación, rollback y evidencia de transición                                                  |
| `SUPA-TRANS-006..014`      | compatibilidad, consumidores, paridad, rendimiento, rollback, ambientes y artefactos desplegados                                           |

Precedencia obligatoria:

```text
POLÍTICA Y CATÁLOGOS CANÓNICOS
        ↓
IDENTIDADES Y VERSIONES INMUTABLES
        ↓
RESOLVED_VERSION_SET + VERSION_SET_DIGEST
        ↓
EVALUACIÓN SEMÁNTICA
        ↓
METADATOS LÓGICOS COMPARTIDOS
        ↓
CAPA PROPIETARIA DE PERSISTENCIA, COMMIT O EVIDENCIA
```

`SHELL-NORM-008` no puede utilizar metadata para reinterpretar una decisión semántica ya resuelta.

---

#### 4. Frontera exacta

Esta tarea centraliza documentalmente:

- identidad estable de regla y versión;
- digest de contenido;
- conjunto efectivo de versiones;
- estados y transición de ciclo de vida;
- aprobación, vigencia y activación;
- compatibilidad y coexistencia;
- procedencia de algoritmo y artefacto;
- familias lógicas de registro;
- clases de evento;
- contrato mínimo de auditoría;
- resultados cerrados;
- retención lógica;
- reproducibilidad;
- tiempos semánticos;
- correlación y causación;
- metadata de idempotencia;
- expectativas de concurrencia;
- metadata de replay;
- minimización de evidencia sensible;
- paridad de metadata entre capas;
- relación entre preview, evaluación y commit.

Esta tarea no:

- crea tablas o columnas de auditoría;
- crea un ledger físico;
- crea funciones SQL;
- crea RPC;
- crea triggers;
- crea endpoints;
- define formato de serialización físico;
- define schemas runtime;
- genera UUID, timestamps o identidades usando aleatoriedad o reloj implícitos;
- decide quién está autorizado;
- persiste eventos;
- activa versiones;
- modifica reglas;
- ejecuta transiciones;
- ejecuta replay;
- aplica rollback;
- ejecuta compensaciones;
- modifica datos;
- modifica Supabase.

---

#### 5. Identidad canónica de la política

La política compartida es exactamente:

```text
VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0
```

Invariantes:

1. el nombre y versión no se renombran dentro del package;
2. la versión de esta política es distinta de la futura versión npm de `@vento/data-normalization`;
3. una actualización del package no cambia por sí sola la versión normativa;
4. una nueva versión normativa exige decisión canónica propia;
5. el package no selecciona una versión mediante `latest`;
6. el package no considera equivalente una versión por nombre humano, número visible o posición en una lista;
7. la misma identidad normativa debe corresponder al mismo contenido verificable en todos los ambientes.

---

#### 6. Las seis familias cerradas de registro lógico

| Orden | Familia                             | Finalidad                                                                                   |
| ----: | ----------------------------------- | ------------------------------------------------------------------------------------------- |
|    01 | `RULE_GOVERNANCE_RECORD`            | representar identidad, contenido, aprobación, estado, vigencia y supersesión de una versión |
|    02 | `RULE_EVALUATION_RECORD`            | representar una decisión semántica producida por evaluación sin afirmar persistencia        |
|    03 | `PERSISTED_MUTATION_RECORD`         | representar un efecto confirmado sobre un valor persistido                                  |
|    04 | `DERIVATION_MATERIALIZATION_RECORD` | representar creación o renovación confirmada de una derivación                              |
|    05 | `REVIEW_DECISION_RECORD`            | representar una decisión humana inmutable sobre ambigüedad o conflicto                      |
|    06 | `PROPAGATION_OR_TRANSITION_RECORD`  | representar propagación, transición, compensación o resultado parcial posterior             |

Reglas:

1. las seis familias conservan significado distinto;
2. `RULE_EVALUATION_RECORD` puede existir sin mutación;
3. una evaluación exitosa no se promociona a `PERSISTED_MUTATION_RECORD` sin confirmación de la capa transaccional;
4. una decisión de revisión no equivale a activación ni materialización;
5. una propagación hija no sustituye el registro raíz de una mutación;
6. una implementación física podrá compartir almacenamiento, pero no fusionar semánticas.

Conciliación:

```text
familias esperadas = 6
familias centralizadas = 6
faltantes = 0
duplicados = 0
```

---

#### 7. Identidad estable de regla y versión

Cada regla conserva exactamente estos 13 atributos lógicos:

```text
rule_key
rule_version_id
rule_family
policy_coordinate
semantic_class
operation_kind
language_profile
version_number
content_digest
status
effective_from
effective_to
supersedes_rule_version_id
```

Reglas:

1. `rule_key` identifica el concepto estable;
2. `rule_version_id` identifica una definición inmutable;
3. `version_number` no sustituye `rule_version_id`;
4. un número de versión no se reutiliza con contenido distinto;
5. `content_digest` cubre definición normativa ejecutable, scope, precedencia, exclusiones y dependencias;
6. una edición que cambie el digest crea otra versión;
7. una rectificación administrativa no destructiva es aditiva;
8. el mismo identificador no puede representar contenidos diferentes entre ambientes;
9. un nombre visible no se usa como identidad técnica.

Conciliación:

```text
atributos esperados = 13
atributos centralizados = 13
faltantes = 0
duplicados = 0
```

---

#### 8. Conjunto efectivo de versiones

Toda evaluación deberá conservar:

```text
resolved_version_set
version_set_digest
```

El conjunto puede incluir exactamente estas 11 dependencias cuando correspondan:

```text
field_policy_version
field_class_catalog_version
capitalization_policy_version
connector_catalog_version
official_exception_catalog_version
orthographic_dictionary_version
review_decision_version
search_policy_version
language_and_unicode_profile_version
algorithm_artifact_version
external_mapping_version
```

Reglas:

1. solo se incluyen dependencias realmente consumidas;
2. una dependencia no aplicable se declara `NOT_APPLICABLE`;
3. no se selecciona por hora actual, caché, orden de carga o configuración local no registrada;
4. el mismo `version_set_digest` representa el mismo conjunto compatible;
5. una dependencia ausente, suspendida, incompatible o fuera de vigencia bloquea la evaluación correspondiente;
6. no existe fallback silencioso;
7. la traza histórica conserva el conjunto utilizado;
8. una capa no reemplaza una dependencia por otra parecida;
9. preview, evaluación autoritativa y operaciones posteriores conservan el digest requerido por sus contratos.

Conciliación:

```text
dependencias esperadas = 11
dependencias centralizadas = 11
faltantes = 0
duplicados = 0
```

---

#### 9. Los ocho estados unificados de ciclo de vida

| Estado                        | Ejecutable para decisiones nuevas | Significado                                                         |
| ----------------------------- | --------------------------------- | ------------------------------------------------------------------- |
| `DRAFT`                       | no                                | definición incompleta o pendiente de revisión                       |
| `APPROVED_PENDING_ACTIVATION` | no                                | contenido aprobado todavía sin vigencia operativa                   |
| `ACTIVE`                      | sí                                | versión vigente dentro de coordenada, ambiente y ventana declarados |
| `SUSPENDED`                   | no                                | versión temporalmente bloqueada                                     |
| `SUPERSEDED`                  | no                                | versión reemplazada por otra explícita para decisiones nuevas       |
| `RETIRED`                     | no                                | versión retirada, conservada para interpretación histórica          |
| `REJECTED`                    | no                                | propuesta descartada con motivo y evidencia                         |
| `INVALIDATED`                 | no                                | versión cuya integridad, autoridad o contenido quedó comprometido   |

Reglas:

1. únicamente `ACTIVE` participa en decisiones nuevas;
2. los nombres específicos de estado ya aprobados en catálogos conservan su semántica histórica;
3. un mapeo hacia el estado unificado no reescribe la evidencia original;
4. ausencia de una versión en caché no cambia su estado;
5. un estado no se infiere por ausencia de fecha.

---

#### 10. Transiciones cerradas de ciclo de vida

```text
DRAFT
→ APPROVED_PENDING_ACTIVATION | REJECTED

APPROVED_PENDING_ACTIVATION
→ ACTIVE | SUSPENDED | REJECTED

ACTIVE
→ SUSPENDED | SUPERSEDED | RETIRED | INVALIDATED

SUSPENDED
→ ACTIVE | SUPERSEDED | RETIRED | INVALIDATED
```

Reglas:

1. `SUPERSEDED`, `RETIRED`, `REJECTED` e `INVALIDATED` son terminales para esa versión;
2. una definición terminal solo puede volver a uso mediante otra versión con procedencia;
3. toda transición valida estado esperado y autoridad;
4. la repetición idempotente de la misma transición devuelve el resultado registrado;
5. una transición incompatible no se corrige por orden de llegada;
6. activar una versión no modifica registros históricos;
7. invalidar bloquea nuevas decisiones pero no borra efectos previos.

---

#### 11. Metadatos de aprobación, vigencia y activación

Toda versión ejecutable conserva exactamente:

```text
approved_at
approved_by_authority
effective_from
effective_to
activation_scope
activation_environment
activation_event_id
```

Reglas:

1. aprobación y activación son decisiones distintas;
2. una fecha futura no activa por sí sola una versión;
3. activación debe cambiar atómicamente el conjunto efectivo de una coordenada;
4. no se mezclan dependencias del conjunto anterior y del nuevo;
5. operaciones en curso conservan el conjunto fijado o son canceladas y reevaluadas por la capa propietaria;
6. `effective_to` no reinterpreta historia;
7. la vigencia normativa usa UTC;
8. el package no consulta el reloj para decidir activación: recibe contexto temporal explícito y validado.

Conciliación:

```text
atributos esperados = 7
atributos centralizados = 7
faltantes = 0
duplicados = 0
```

---

#### 12. Los cinco modos de compatibilidad y coexistencia

| Modo                     | Conducta                                                           |
| ------------------------ | ------------------------------------------------------------------ |
| `ACTIVE_ONLY`            | una sola versión atiende decisiones nuevas y derivaciones vigentes |
| `DUAL_EVALUATION_SHADOW` | una candidata evalúa en sombra sin mutar ni alterar respuestas     |
| `HISTORICAL_READ_ONLY`   | una versión anterior interpreta resultados o snapshots históricos  |
| `REPLAY_ONLY`            | una versión se usa únicamente en replay controlado                 |
| `INCOMPATIBLE_BLOCKED`   | mezcla o continuación bloqueada hasta resolver compatibilidad      |

Invariantes:

1. no existe dual write implícito;
2. shadow no emite efecto empresarial;
3. shadow no cambia la respuesta activa;
4. una versión histórica no recupera autoridad por disponibilidad accidental;
5. coexistencia debe conservar inicio, fin, owner, corpus, métricas y puerta de salida;
6. el package valida el modo recibido, pero no decide el cutover físico.

Conciliación:

```text
modos esperados = 5
modos centralizados = 5
faltantes = 0
duplicados = 0
```

---

#### 13. Procedencia del algoritmo

Toda evaluación deberá poder atribuirse mediante estos 11 atributos:

```text
algorithm_key
algorithm_version
artifact_identity
artifact_digest
source_revision_or_commit
runtime_contract_version
language_profile
unicode_version
tokenizer_version
catalog_version_set
configuration_digest
```

Reglas:

1. un mismo `algorithm_version` no representa artefactos con digests distintos;
2. locale, Unicode, tokenizer, catálogos, ranking y configuración forman parte de la procedencia cuando afecten el resultado;
3. defaults ambientales no cambian semántica;
4. una dependencia externa mutable requiere versión o evidencia inmutable;
5. una salida no determinista sin contrato versionado no se presenta como algoritmo canónico;
6. la metadata deberá permitir demostrar qué artefacto produjo el resultado;
7. el package no consulta Git, registry, entorno o despliegue para completar estos datos: los recibe o deriva de entradas canónicas explícitas.

Conciliación:

```text
atributos esperados = 11
atributos centralizados = 11
faltantes = 0
duplicados = 0
```

---

#### 14. Las doce clases cerradas de evento de auditoría

| Orden | Evento                                   |
| ----: | ---------------------------------------- |
|    01 | `RULE_VERSION_PROPOSED`                  |
|    02 | `RULE_VERSION_APPROVED`                  |
|    03 | `RULE_VERSION_ACTIVATED`                 |
|    04 | `RULE_VERSION_SUSPENDED`                 |
|    05 | `RULE_VERSION_SUPERSEDED`                |
|    06 | `RULE_VERSION_RETIRED`                   |
|    07 | `RULE_EVALUATED`                         |
|    08 | `RULE_MUTATION_COMMITTED`                |
|    09 | `RULE_DERIVATION_MATERIALIZED`           |
|    10 | `RULE_BLOCK_OR_REVIEW_EMITTED`           |
|    11 | `RULE_REPLAY_OR_RECONCILIATION_RECORDED` |
|    12 | `RULE_COMPENSATION_OR_ROLLBACK_RECORDED` |

Reglas:

1. cada evento conserva su semántica;
2. varios eventos pueden pertenecer a una misma operación lógica;
3. una implementación puede persistirlos dentro de una transacción común sin colapsarlos;
4. `RULE_EVALUATED` no afirma commit;
5. `RULE_MUTATION_COMMITTED` requiere confirmación transaccional;
6. `RULE_BLOCK_OR_REVIEW_EMITTED` no representa una corrección aplicada;
7. compensación y rollback conservan el evento y efecto originales.

Conciliación:

```text
eventos esperados = 12
eventos centralizados = 12
faltantes = 0
duplicados = 0
```

---

#### 15. Contrato lógico mínimo de auditoría

Se conservan exactamente estos 30 atributos:

```text
audit_event_id
logical_operation_id
attempt_id
correlation_id
causation_id
event_kind
event_time
recorded_at
actor_or_service_identity
authorization_context
reason_code
policy_coordinate
entity_type
entity_id
source_field_coordinate
source_value_version_or_hash
before_value_reference_or_hash
after_value_reference_or_hash
requested_operation
resolved_version_set
version_set_digest
algorithm_provenance
idempotency_key
idempotency_payload_digest
expected_source_version_or_hash
outcome
outcome_reason
review_case_or_decision_reference
propagation_or_transition_reference
environment
```

Reglas:

1. los atributos no aplicables se declaran explícitamente;
2. `logical_operation_id` permanece estable entre reintentos;
3. `attempt_id` distingue intentos técnicos;
4. `correlation_id` agrupa el proceso de extremo a extremo;
5. `causation_id` conserva la causa inmediata;
6. `recorded_at` no reemplaza el momento efectivo del hecho;
7. una mutación conserva la expectativa de fuente usada para concurrencia;
8. evidencia sensible se representa mediante referencias protegidas o huellas cuando corresponda;
9. el package puede validar y proyectar este contrato lógico, pero no genera por sí mismo identidad de evento, actor, tiempo o autorización;
10. la ausencia de metadata obligatoria no se rellena mediante defaults ambientales.

Conciliación:

```text
atributos esperados = 30
atributos centralizados = 30
faltantes = 0
duplicados = 0
```

---

#### 16. Los diez resultados cerrados de evaluación

| Resultado                     | Significado                                                                             |
| ----------------------------- | --------------------------------------------------------------------------------------- |
| `APPLIED_CHANGE`              | una operación autorizada produjo y confirmó un cambio                                   |
| `NO_CHANGE_ALREADY_CANONICAL` | la entrada ya satisfacía la versión efectiva                                            |
| `DERIVED`                     | se produjo una representación separada sin modificar la fuente                          |
| `PRESERVED`                   | la política ordenó conservar el valor                                                   |
| `NOT_APPLICABLE`              | la regla no corresponde a la coordenada                                                 |
| `BLOCKED_POLICY`              | falta política, versión, autoridad, vigencia, clase, fuente o representación compatible |
| `BLOCKED_CONFLICT`            | existen decisiones o dependencias incompatibles                                         |
| `REVIEW_REQUIRED`             | el valor se conserva y requiere revisión humana                                         |
| `ESCALATED_STRUCTURAL`        | el problema pertenece a estructura, identidad, unicidad, integración o transición       |
| `FAILED_TECHNICAL`            | la ejecución no pudo completar el efecto                                                |

Reglas:

1. la ausencia de cambio no colapsa resultados distintos;
2. un preview puede portar el resultado de evaluación sin convertirlo en efecto confirmado;
3. `APPLIED_CHANGE` solo se usa cuando la capa propietaria confirmó el cambio;
4. `FAILED_TECHNICAL` no se presenta como éxito empresarial;
5. reintentar un fallo no autoriza cambiar versiones.

Conciliación:

```text
resultados esperados = 10
resultados centralizados = 10
faltantes = 0
duplicados = 0
```

---

#### 17. Las cinco clases de retención lógica

| Clase                        | Contenido                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------ |
| `GOVERNANCE_IMMUTABLE`       | versiones, aprobaciones, estados, supersesiones, invalidaciones y decisiones humanas       |
| `MUTATION_EVIDENCE`          | antes, después, motivo, actor, expectativa, resultado y reversibilidad                     |
| `DERIVATION_REPRODUCIBILITY` | fuente o hash, versión, algoritmo y huella de una derivación                               |
| `OPERATIONAL_DIAGNOSTIC`     | intentos, latencia, error, retry y metadata técnica                                        |
| `SENSITIVE_REFERENCE`        | referencias protegidas a datos personales, legales, externos, secretos, firmas o evidencia |

Reglas:

1. la clase es lógica y no define todavía almacenamiento físico;
2. la duración final, archivo y eliminación física quedan fuera del package;
3. `OPERATIONAL_DIAGNOSTIC` no se convierte en autoridad canónica;
4. `SENSITIVE_REFERENCE` exige minimización y acceso restringido;
5. ausencia de plazo físico no autoriza eliminación de evidencia necesaria ni retención indefinida de datos sensibles.

---

#### 18. Los tres niveles de reproducibilidad

| Nivel                      | Condición                                                                                           |
| -------------------------- | --------------------------------------------------------------------------------------------------- |
| `FULL_REPLAYABLE`          | entrada, contexto, versiones, algoritmo y dependencias pueden reproducirse en un entorno controlado |
| `REFERENCE_REPLAYABLE`     | entrada completa preservada mediante referencia protegida e inmutable                               |
| `DECISION_RECONSTRUCTABLE` | hashes, contexto y versiones permiten explicar la decisión sin conservar la entrada completa        |

Reglas:

1. cada familia aplicable declara su nivel;
2. `DECISION_RECONSTRUCTABLE` no se presenta como replay exacto;
3. una mutación crítica debe alcanzar `FULL_REPLAYABLE` o `REFERENCE_REPLAYABLE` salvo prohibición documentada;
4. secretos no se exponen para hacerlos replayables;
5. un hash sin contexto y algoritmo no demuestra reproducibilidad;
6. una degradación de nivel conserva motivo, autoridad y fecha.

---

#### 19. Los siete tiempos semánticos

Se preservan exactamente:

```text
observed_at
requested_at
evaluated_at
effect_committed_at
effective_from
effective_to
recorded_at
```

Semántica:

| Tiempo                | Significado                                                        |
| --------------------- | ------------------------------------------------------------------ |
| `observed_at`         | momento en que se observó entrada o señal                          |
| `requested_at`        | inicio de la operación lógica                                      |
| `evaluated_at`        | momento en que se resolvió el conjunto de versiones                |
| `effect_committed_at` | momento de confirmación del efecto; solo existe cuando hubo commit |
| `effective_from`      | inicio de vigencia normativa                                       |
| `effective_to`        | fin de vigencia normativa para nuevas decisiones                   |
| `recorded_at`         | momento de incorporación de la evidencia al registro               |

Reglas:

1. no se colapsan en una única fecha;
2. vigencia se expresa en UTC;
3. zona original se conserva cuando sea relevante;
4. una evidencia tardía no cambia la hora efectiva del hecho;
5. el motor puro no obtiene estos tiempos desde el reloj del runtime: se proporcionan como contexto cuando son necesarios.

Conciliación:

```text
tiempos esperados = 7
tiempos centralizados = 7
faltantes = 0
duplicados = 0
```

---

#### 20. Modelo de idempotencia

La metadata compartida conserva dos garantías distintas:

```text
same logical input
+ same policy coordinate
+ same resolved version set
+ same requested operation
=
same logical outcome
```

y:

```text
reapply an already committed logical operation
=
return prior committed outcome without a second business effect
```

La primera garantía pertenece al determinismo de la evaluación. La segunda requiere estado de operación y confirmación de efecto en la capa propietaria.

`@vento/data-normalization` podrá producir resultados puros que satisfagan la primera, pero no podrá declarar por sí solo que un efecto persistido ya ocurrió.

---

#### 21. Los nueve componentes de la clave lógica de idempotencia

La clave conserva o vincula:

```text
operation_kind
actor_or_service_scope
target_entity_type
target_entity_id
source_field_coordinate
source_value_version_or_hash
requested_operation
version_set_digest
business_correlation_or_command_id
```

Reglas:

1. la clave no se deriva únicamente del valor textual;
2. payload y precondiciones producen un `idempotency_payload_digest` independiente;
3. misma clave y mismo digest reutilizan el resultado previo cuando la capa propietaria dispone de ese estado;
4. misma clave con digest distinto produce `BLOCKED_CONFLICT`;
5. el motivo canónico es `IDEMPOTENCY_PAYLOAD_CONFLICT`;
6. una nueva fuente o conjunto de versiones exige reevaluación;
7. una clave no mezcla entidades o scopes;
8. la expiración física de una clave no elimina la obligación de detectar un efecto empresarial ya confirmado;
9. el package no persiste ni consulta el estado de claves.

Conciliación:

```text
componentes esperados = 9
componentes centralizados = 9
faltantes = 0
duplicados = 0
```

---

#### 22. Las seis clases de operación idempotente

| Clase                               | Garantía                                                                              |
| ----------------------------------- | ------------------------------------------------------------------------------------- |
| `PURE_EVALUATION`                   | misma entrada y versiones producen mismo resultado y huella sin efectos               |
| `PERSISTED_MUTATION`                | un solo cambio confirmado; retry devuelve resultado previo o no operación verificable |
| `DERIVATION_MATERIALIZATION`        | una derivación vigente por fuente, representación y versión                           |
| `RULE_LIFECYCLE_TRANSITION`         | una transición ocurre una vez sobre el estado esperado                                |
| `REVIEW_DECISION_RECORDING`         | una resolución lógica inmutable no se duplica                                         |
| `PROPAGATION_OR_TRANSITION_COMMAND` | cada destino conserva efecto individual y reanudable                                  |

Reglas:

1. una operación compuesta conserva una raíz y efectos hijos;
2. éxito parcial es explícito;
3. reanudación omite efectos confirmados;
4. `PURE_EVALUATION` es la única clase cuyo cumplimiento puede demostrarse exclusivamente dentro del motor puro;
5. las demás necesitan evidencia de la capa que posee estado o commit.

Conciliación:

```text
clases esperadas = 6
clases centralizadas = 6
faltantes = 0
duplicados = 0
```

---

#### 23. Las cuatro expectativas de concurrencia y estado

Toda mutación o materialización futura deberá conservar:

```text
expected_source_version_or_hash
expected_policy_coordinate
expected_version_set_digest
expected_current_state
```

Reglas:

1. una fuente cambiada bloquea el efecto y exige reevaluación;
2. un conjunto de versiones cambiado exige nueva evaluación;
3. dos operaciones concurrentes no se resuelven por último escritor;
4. una transición de regla valida el estado esperado;
5. un caso de revisión obsoleto no se cierra con otra versión por conveniencia;
6. una derivación vieja no sobrescribe otra de fuente más reciente;
7. el package puede validar coherencia interna de estas expectativas, pero no puede comprobar estado persistido sin la capa propietaria.

Conciliación:

```text
expectativas esperadas = 4
expectativas centralizadas = 4
faltantes = 0
duplicados = 0
```

---

#### 24. Fuentes de no determinismo prohibidas

No pueden actuar como dependencias implícitas:

- locale del sistema operativo, navegador, proceso o base de datos;
- versión Unicode no declarada;
- orden físico de filas o catálogos;
- hora actual para seleccionar una regla sin vigencia registrada;
- aleatoriedad no fijada;
- respuesta mutable de proveedor sin versión o evidencia;
- caché no identificada;
- configuración local fuera del digest;
- orden de concurrencia para resolver conflictos;
- modelo lingüístico o heurística sin contrato y versión;
- primer resultado de búsqueda usado como verdad.

Cuando una dependencia necesaria no puede fijarse, la evaluación falla de forma cerrada según el contrato aplicable.

---

#### 25. Contrato de replay controlado

Se conservan exactamente estos 9 atributos:

```text
replay_id
source_event_or_decision_set
source_snapshot_or_reference
version_set_digest
algorithm_provenance
replay_environment
expected_outcomes
actual_outcomes
difference_classification
```

Reglas:

1. replay no modifica producción;
2. una versión `REPLAY_ONLY` no participa en decisiones nuevas;
3. las diferencias se clasifican, no se ocultan;
4. igualdad de salida con procedencia distinta no demuestra paridad completa;
5. reconciliación no sobrescribe evidencia;
6. la ejecución de replay pertenece a los propietarios de transición y pruebas;
7. `@vento/data-normalization` podrá evaluar determinísticamente fixtures suministrados, pero no seleccionará fuentes ni ambientes de replay por sí mismo.

Conciliación:

```text
atributos esperados = 9
atributos centralizados = 9
faltantes = 0
duplicados = 0
```

---

#### 26. Integridad aditiva y rectificación

1. versiones, aprobaciones, decisiones y efectos no se editan para ocultar errores;
2. suspensión, retiro, supersesión e invalidación son eventos adicionales;
3. una rectificación administrativa conserva antes, después, actor, motivo y relación con el registro rectificado;
4. compensación conserva efecto original y efecto compensatorio;
5. rollback normativo y rollback de código son conceptos distintos;
6. un digest discrepante produce bloqueo, invalidación o reconciliación propietaria;
7. métricas agregadas no sustituyen evidencia individual cuando el contrato exige esta última;
8. el package no elimina evidencia ni decide retención física.

---

#### 27. Minimización y evidencia sensible

1. valores personales, legales, externos, secretos, firmas, tokens y consultas sensibles no se incluyen completos por defecto;
2. referencias protegidas, hashes contextualizados o metadata mínima se usan cuando el contenido completo no es necesario;
3. una huella declara algoritmo y tratamiento previo permitido;
4. no se crea una huella enumerable de secretos de baja entropía;
5. consultas sensibles no se registran completas por defecto;
6. masking no debe impedir distinguir eventos;
7. la auditoría no amplía visibilidad frente a la autorización;
8. el package no lee secretos para producir metadata;
9. VITAL conserva política y almacenamiento propios.

---

#### 28. Autoridad por capa

| Capa                        | Metadata que puede producir u observar                                                                      | Autoridad que no adquiere                               |
| --------------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| aplicación                  | intención, referencia observada, correlación cliente, presentación de preview                               | no crea auditoría de commit ni selecciona versiones     |
| servicio de dominio         | evaluación semántica, versiones, digest, resultado, procedencia lógica y `RULE_EVALUATION_RECORD`           | no confirma persistencia                                |
| RPC                         | operación lógica, autorización revalidada, idempotencia, concurrencia y registro raíz del efecto confirmado | no redefine semántica                                   |
| trigger defensivo           | evidencia hija cuando interviene, rechaza o materializa una derivación acotada                              | no crea otra auditoría raíz                             |
| job o adaptador             | correlación, causación, intentos y efectos hijos bajo contrato                                              | no mantiene política paralela                           |
| `@vento/data-normalization` | constructores y validadores lógicos puros de metadata y resultados                                          | no persiste, autoriza, consulta estado ni afirma commit |

Reglas:

1. una mutación tiene una sola auditoría raíz;
2. telemetría cliente no sustituye esa raíz;
3. logs técnicos no sustituyen evidencia contractual;
4. el mismo `logical_operation_id` se conserva entre capas;
5. intentos técnicos se distinguen mediante `attempt_id`;
6. efectos hijos conservan `causation_id`;
7. una capa no rellena metadata desconocida inventando defaults.

---

#### 29. Relación con `SHELL-NORM-007`

Una previsualización conserva, cuando corresponda:

```text
resolved_version_set
version_set_digest
source_value_version_or_hash
algorithm_provenance
outcome
outcome_reason
```

pero continúa siendo:

```text
NO VINCULANTE
```

Por tanto:

1. metadata de preview no es metadata de commit;
2. `RULE_EVALUATION_RECORD` no se convierte en `PERSISTED_MUTATION_RECORD`;
3. el momento de preview no es `effect_committed_at`;
4. una propuesta no constituye evidencia de persistencia;
5. la RPC reevalúa fuente, versiones, scope y estado antes de confirmar;
6. una divergencia produce nueva evidencia de evaluación o conflicto conforme al contrato propietario;
7. una respuesta de preview no se reutiliza para otro registro, scope o versión.

---

#### 30. Auditoría de búsqueda y comparación

La metadata compartida conserva, según finalidad y minimización:

- consulta protegida o huella compatible;
- perfil y locale;
- versión;
- scope y filtros;
- representaciones consultadas;
- modo principal de coincidencia;
- motivos secundarios;
- tupla y versión de ranking;
- fuente o snapshot del resultado;
- condición histórica;
- versión del corpus o índice;
- degradación o bloqueo declarado.

Reglas:

1. la clave de búsqueda completa no se registra si permite reconstruir datos protegidos;
2. cambio de ranking exige otra versión;
3. cursor conserva el mismo conjunto de versiones;
4. cursor obsoleto falla o reinicia explícitamente;
5. auditoría de búsqueda no crea identidad, unicidad ni corrección;
6. la capa servidor sigue siendo autoridad sobre búsqueda.

---

#### 31. Auditoría de revisión humana

1. cada revisión conserva caso, evidencia, asignaciones, estados, SLA, decisión y relaciones de supersesión;
2. la resolución cerrada es inmutable;
3. decisión humana no activa una entrada por sí sola;
4. incorporación a catálogo crea versión y evento separados;
5. materialización sobre datos crea otra operación;
6. rechazo, preservación, solicitud de evidencia y escalamiento también son auditablemente distinguibles;
7. retry del mismo cierre reutiliza decisión compatible;
8. un cierre distinto produce conflicto;
9. actores se identifican por identidad estable y función ejercida.

---

#### 32. Fuentes, copias, snapshots y externos

1. fuente y copia conservan versiones de valor distintas;
2. mutación de fuente no se confunde con propagación;
3. cada destino conserva estado, entrada esperada, resultado, intento y causalidad;
4. snapshot inmutable no recibe propagación retroactiva;
5. copia sincronizable no ejecuta una versión local distinta;
6. override conserva vigencia y versión;
7. propagación parcial no se presenta como completada;
8. original externo conserva payload o referencia, procedencia, emisor, momento y versión contractual;
9. mapping externo conserva versión propia;
10. metadata interna no sobrescribe el original.

---

#### 33. Paridad entre capas

Para la misma operación lógica, entrada, coordenada y versiones, las capas autorizadas deberán coincidir en:

- regla y versión seleccionadas;
- conjunto efectivo y digest;
- clasificación aplicable;
- resultado cerrado;
- valor o huella de salida;
- bloqueo, revisión o escalamiento;
- clave idempotente y payload digest cuando correspondan;
- expectativa de concurrencia;
- correlación y causación;
- ausencia de efectos duplicados.

Queda prohibido:

- fallback local de versión;
- crear otra operación lógica por retry;
- ocultar una falta de commit como éxito;
- duplicar auditoría raíz;
- reconstruir datos sensibles desde logs;
- editar evidencia para ocultar deriva;
- aplicar metadata o reglas de Vento OS a VITAL.

---

#### 34. Estado de materialización física

| Elemento                                                              | Estado                                          |
| --------------------------------------------------------------------- | ----------------------------------------------- |
| `@vento/data-normalization`                                           | `ESPECIFICADO`; package físico no materializado |
| política `VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0` | centralizada documentalmente                    |
| 6 familias de registro                                                | `ESPECIFICADAS`                                 |
| 13 atributos de regla/versión                                         | `ESPECIFICADOS`                                 |
| 11 dependencias de versión                                            | `ESPECIFICADAS`                                 |
| 8 estados de ciclo de vida                                            | `ESPECIFICADOS`                                 |
| 5 modos de compatibilidad                                             | `ESPECIFICADOS`                                 |
| 11 atributos de procedencia                                           | `ESPECIFICADOS`                                 |
| 12 eventos de auditoría                                               | `ESPECIFICADOS`                                 |
| 30 atributos de auditoría                                             | `ESPECIFICADOS`                                 |
| 10 resultados                                                         | `ESPECIFICADOS`                                 |
| 5 clases de retención                                                 | `ESPECIFICADAS`                                 |
| 3 niveles de reproducibilidad                                         | `ESPECIFICADOS`                                 |
| 6 clases idempotentes                                                 | `ESPECIFICADAS`                                 |
| almacenamiento de versiones                                           | `NO IMPLEMENTADO`                               |
| persistencia de auditoría                                             | `NO IMPLEMENTADA`                               |
| API o schemas runtime                                                 | `NO IMPLEMENTADOS`                              |
| cambios Supabase                                                      | `0`                                             |
| requisitos de prueba creados o modificados                            | `0`                                             |

`ESPECIFICADO` no equivale a `IMPLEMENTADO`, `PERSISTIDO` ni `VERIFICADO`.

---

#### 35. Handoffs exactos

| Materia fuera de esta tarea                                              | Propietario exacto                                                  | Condición de salida                                                                      |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| corpus y pruebas compartidas de idempotencia y conservación semántica    | `SHELL-NORM-009`                                                    | demostrar determinismo, idempotencia y conservación sobre los contratos ya centralizados |
| almacenamiento físico de versiones de reglas y diccionarios              | `DATA-NORM-DB-001`                                                  | persistir versiones únicamente dentro de un package autorizado                           |
| registro físico de valor previo, resultado y versión de regla            | `DATA-NORM-DB-009`                                                  | conservar evidencia de efectos confirmados bajo la arquitectura autorizada               |
| prueba física de idempotencia, rollback y ausencia de cambios semánticos | `DATA-NORM-DB-010`                                                  | certificar el comportamiento del almacenamiento y efectos físicos                        |
| coexistencia técnica de versiones                                        | `SUPA-TRANS-006`; `DATA-NORM-TRANS-004`                             | mantener compatibilidad explícita y no mezclar conjuntos                                 |
| activación y materialización de cambios                                  | `DATA-NORM-TRANS-005`                                               | revalidar estado y aplicar únicamente dentro de la transición autorizada                 |
| pruebas de paridad, concurrencia e idempotencia                          | `SUPA-TRANS-009`; `DATA-NORM-TRANS-009`                             | producir evidencia reproducible antes del cierre aplicable                               |
| rollback operativo y restauración                                        | `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`                             | conservar historia y efecto compensatorio                                                |
| paridad ambiental y procedencia del artefacto desplegado                 | `SUPA-TRANS-013`; `SUPA-TRANS-014`                                  | demostrar que identidad, digest, configuración y consumidores corresponden al despliegue |
| materialización física de `@vento/data-normalization`                    | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` | abrir implementación únicamente para el package explícitamente autorizado                |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 36. Cobertura de prueba vigente no modificada

La conducta centralizada ya se encuentra protegida por los requisitos canónicos creados por `DATA-NORM-ARC-009`, incluidos los que cubren:

- identidad estable de regla y versión;
- conjunto efectivo y digest;
- ciclo de vida y activación;
- compatibilidad;
- procedencia;
- familias y eventos de auditoría;
- integridad aditiva;
- resultados cerrados;
- minimización de datos;
- semántica temporal;
- idempotencia;
- concurrencia;
- determinismo;
- replay;
- rollback;
- auditoría de búsqueda y revisión;
- correlación y paridad;
- corpus integral.

`SHELL-NORM-008` no agrega una conducta verificable distinta: hace consumible esa misma semántica dentro de la futura superficie compartida.

---

#### 37. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea centraliza en `@vento/data-normalization` metadatos y contratos lógicos ya aprobados y protegidos por el gobierno canónico de normalización. No introduce un estado, transición, evento, resultado, algoritmo, versión, política de retención, regla de idempotencia, comportamiento de concurrencia, mecanismo de persistencia ni efecto ejecutable nuevo o modificado.

---

#### 38. Decisiones vinculantes

1. La política centralizada es exactamente `VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0`.
2. Existen exactamente seis familias cerradas de registro lógico.
3. Una evaluación lógica no afirma persistencia.
4. Una mutación confirmada se distingue de evaluación y preview.
5. Cada regla tiene `rule_key` estable.
6. Cada definición tiene `rule_version_id` inmutable.
7. El contrato de identidad de versión conserva 13 atributos.
8. Un cambio de contenido que altera digest crea otra versión.
9. No existe `latest` implícito.
10. `resolved_version_set` conserva 11 dependencias posibles y explicita las no aplicables.
11. `version_set_digest` identifica el conjunto compatible realmente usado.
12. Existen exactamente ocho estados unificados.
13. Solo `ACTIVE` ejecuta decisiones nuevas.
14. Los cuatro estados terminales no se reactivan como la misma versión.
15. Aprobación y activación permanecen separadas.
16. Los metadatos de activación conservan siete atributos.
17. Existen exactamente cinco modos de compatibilidad.
18. `DUAL_EVALUATION_SHADOW` no implica dual write.
19. Una versión histórica no recupera autoridad por disponibilidad accidental.
20. Procedencia de algoritmo conserva 11 atributos.
21. Un mismo algoritmo y versión no representan artefactos con digests distintos.
22. Existen exactamente doce eventos de auditoría.
23. El contrato mínimo de auditoría conserva 30 atributos.
24. `logical_operation_id`, `attempt_id`, `correlation_id` y `causation_id` permanecen conceptos distintos.
25. Existen exactamente diez resultados de evaluación.
26. Ausencia de cambio, preservación, bloqueo, revisión y fallo técnico no se colapsan.
27. Existen exactamente cinco clases de retención lógica.
28. Existen exactamente tres niveles de reproducibilidad.
29. Existen exactamente siete tiempos semánticos.
30. El motor puro no obtiene tiempo desde reloj implícito.
31. La idempotencia conserva determinismo y efecto único como garantías distintas.
32. La clave lógica de idempotencia conserva nueve componentes.
33. Misma clave con payload incompatible produce `BLOCKED_CONFLICT` y `IDEMPOTENCY_PAYLOAD_CONFLICT`.
34. Existen exactamente seis clases de operación idempotente.
35. Solo `PURE_EVALUATION` puede demostrarse exclusivamente dentro del motor puro.
36. Las cuatro expectativas de concurrencia permanecen explícitas.
37. No existe last-writer-wins como resolución semántica.
38. El replay conserva nueve atributos.
39. Replay no modifica producción.
40. La integridad es aditiva.
41. Rectificación y compensación no borran historia.
42. Evidencia sensible se minimiza.
43. El package no genera por sí solo actor, autorización, identidad de evento o timestamp.
44. El package no persiste auditoría.
45. La RPC conserva propiedad del registro raíz de una mutación futura.
46. El preview conserva metadata de evaluación, nunca metadata falsa de commit.
47. Búsqueda y revisión conservan auditoría específica sin convertirse en identidad.
48. Copias, snapshots y externos conservan procedencia y versiones independientes.
49. Todas las capas deben conservar paridad.
50. VITAL permanece separado.
51. No se crea código, package físico, SQL, API, RPC, trigger, tabla, índice, constraint, migración o backfill.
52. No se modifica Supabase.
53. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
54. `SHELL-NORM-009` queda como única continuidad reservada.

---

#### 39. Hallazgos y destinos exactos

| Hallazgo                                                                                     | Resultado de `SHELL-NORM-008`                                              | Destino exacto                                                      |
| -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| metadatos de versión y auditoría estaban definidos en E3 pero no centralizados en SHELL-NORM | contrato completo centralizado documentalmente                             | `SHELL-NORM-008`                                                    |
| preview necesita versionado y procedencia sin convertirse en commit                          | metadata de evaluación separada de efecto persistido                       | `SHELL-NORM-007`; `SHELL-NORM-008`                                  |
| package puro no puede crear actor, tiempo, autorización o evidencia persistida               | esos datos deben recibirse de contexto propietario                         | `DATA-NORM-ARC-011`; `DATA-NORM-DB-009`                             |
| almacenamiento físico de versiones aún no existe                                             | metadata lógica no se confunde con persistencia                            | `DATA-NORM-DB-001`                                                  |
| registro físico de antes, después y versión aún no existe                                    | responsabilidad preservada fuera del package puro                          | `DATA-NORM-DB-009`                                                  |
| coexistencia y activación requieren estado y evidencia operacional                           | cinco modos y metadatos de activación quedan especificados sin ejecutarlos | `SUPA-TRANS-006`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005`      |
| paridad, idempotencia y replay requieren certificación                                       | contratos quedan listos para corpus y pruebas                              | `SHELL-NORM-009`; `SUPA-TRANS-009`; `DATA-NORM-TRANS-009`           |
| rollback físico no puede inferirse desde rollback normativo                                  | ambos permanecen separados                                                 | `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`                             |
| procedencia desplegada requiere demostrar ambiente y artefacto                               | metadata define identidad y digest; evidencia queda en transición          | `SUPA-TRANS-013`; `SUPA-TRANS-014`                                  |
| package compartido todavía no está materializado                                             | especificación documental completa                                         | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 40. Criterios de aceptación

`SHELL-NORM-008` queda documentalmente completa cuando se cumplen simultáneamente:

1. centraliza exactamente `VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0`;
2. no crea una segunda autoridad normativa;
3. centraliza 6/6 familias de registro;
4. centraliza 13/13 atributos de regla y versión;
5. centraliza 11/11 dependencias del conjunto efectivo;
6. conserva `resolved_version_set` y `version_set_digest`;
7. prohíbe `latest` y fallback implícitos;
8. centraliza 8/8 estados;
9. conserva las transiciones cerradas;
10. mantiene terminalidad de versiones;
11. centraliza 7/7 atributos de activación;
12. mantiene aprobación separada de activación;
13. centraliza 5/5 modos de compatibilidad;
14. shadow no implica dual write;
15. centraliza 11/11 atributos de procedencia;
16. centraliza 12/12 eventos;
17. centraliza 30/30 atributos del contrato de auditoría;
18. distingue operación, intento, correlación y causación;
19. centraliza 10/10 resultados;
20. distingue no cambio, preservación, bloqueo, revisión y fallo técnico;
21. centraliza 5/5 clases de retención;
22. centraliza 3/3 niveles de reproducibilidad;
23. centraliza 7/7 tiempos semánticos;
24. no usa reloj implícito;
25. centraliza 9/9 componentes de idempotencia;
26. centraliza 6/6 clases idempotentes;
27. centraliza 4/4 expectativas de concurrencia;
28. centraliza 9/9 atributos de replay;
29. replay no muta producción;
30. conserva integridad aditiva;
31. conserva minimización de evidencia sensible;
32. mantiene preview separado de commit;
33. mantiene auditoría de búsqueda separada de identidad;
34. mantiene revisión separada de activación y materialización;
35. mantiene copias, snapshots y externos con procedencia separada;
36. exige paridad entre capas;
37. VITAL permanece separado;
38. no crea código;
39. no crea package físico;
40. no crea almacenamiento de auditoría;
41. no crea API o schemas runtime;
42. no crea SQL, RPC o triggers;
43. no ejecuta DDL, DML o backfills;
44. no modifica Supabase;
45. no crea ni modifica requisitos de prueba;
46. todos los carryovers tienen propietario exacto;
47. la siguiente tarea permanece únicamente reservada.

---

#### 41. Límites

`SHELL-NORM-008` no:

- crea físicamente `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts` o `.tsx`;
- define exports físicos;
- crea schemas Zod o JSON Schema;
- crea tablas de reglas o auditoría;
- crea ledger;
- crea índices;
- crea constraints;
- crea funciones SQL;
- crea RPC;
- crea triggers;
- modifica RLS;
- ejecuta DDL;
- ejecuta DML;
- ejecuta backfills;
- modifica datos existentes;
- genera timestamps desde el reloj del runtime;
- genera identificadores aleatorios como parte de la decisión semántica;
- resuelve autorización;
- persiste eventos;
- activa reglas;
- suspende reglas;
- supersede reglas;
- retira reglas;
- invalida reglas;
- ejecuta replay;
- aplica compensaciones;
- ejecuta rollback;
- selecciona retención física;
- modifica diccionarios o catálogos;
- cambia búsqueda;
- decide identidad;
- activa unicidad;
- fusiona registros;
- migra consumidores;
- modifica Supabase;
- redefine `DATA-NORM-ARC-001..012`;
- desarrolla `SHELL-NORM-009`.

---

#### 42. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-007 — Crear previsualización de transformaciones

##### TAREA ACTUAL APROBADA

SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-009 — Probar idempotencia y conservación semántica


### ✅ SHELL-NORM-009 — Probar idempotencia y conservación semántica

**Estado:** APROBADA
**Tarea anterior:** SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas
**Tarea siguiente:** SHELL-DB-001 — Crear @vento/supabase
**Tipo de tarea:** Documental; materialización y reconciliación del corpus, oráculos, matrices y criterios de conformidad que deberán demostrar idempotencia, determinismo y conservación semántica de `@vento/data-normalization`, reutilizando la evidencia contractual aprobada y los requisitos de prueba vigentes, sin materializar código, package físico, tests runtime, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md`
**Estado físico resultante:** ESPECIFICADO; PACKAGE Y SUITE EJECUTABLE NO MATERIALIZADOS
**Implementación física autorizada:** ninguna
**Cambios de código, packages físicos, archivos TypeScript, configuración npm, registry, workflows, DDL, DML, migraciones, RLS, RPC, triggers, índices, constraints, datos, secretos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-NORM-009` cierra documentalmente el mini-bloque `SHELL-NORM-001..009` mediante una definición material y verificable de cómo deberá demostrarse que la futura implementación de `@vento/data-normalization`:

1. produce el mismo resultado lógico para la misma entrada, coordenada, contexto y conjunto efectivo de versiones;
2. no deriva progresivamente cuando su propia salida vuelve a evaluarse bajo el mismo contrato;
3. conserva significado, estructura, procedencia, identidad y fronteras que la operación solicitada no está autorizada a cambiar;
4. permanece fail closed ante contexto, política, versión, autoridad o evidencia insuficientes;
5. no introduce efectos empresariales desde funciones puras;
6. no convierte búsqueda, preview, auditoría, clasificación o coincidencia en identidad, unicidad, fusión o commit;
7. conserva la frontera independiente de VITAL;
8. puede ser certificada posteriormente mediante pruebas ejecutables sin reinterpretar los contratos documentales de `SHELL-NORM-001..008`.

La tarea no sustituye la ejecución futura de pruebas del package. Materializa el corpus y los oráculos que esa ejecución deberá implementar y enlaza la evidencia documental ya existente sin presentarla como prueba de un motor que todavía no existe.

---

#### 2. Resultado material

Queda definido el **corpus canónico compartido de idempotencia y conservación semántica de `@vento/data-normalization`**, compuesto por cuatro piezas inseparables:

1. **corpus base heredado:** 89 escenarios explícitos ya reconciliados documentalmente por `DATA-NORM-TRANS-002`;
2. **oráculo de repetición:** protocolo uniforme para verificar determinismo e idempotencia sin confundirlos con efecto único transaccional;
3. **oráculo de conservación semántica:** matriz que limita exactamente qué dimensiones puede alterar cada operación y cuáles debe preservar;
4. **matriz de evidencia y handoff:** separación entre evidencia documental disponible, pruebas ejecutables pendientes y pruebas físicas de base de datos o integración que pertenecen a otras tareas.

Conciliación del corpus base heredado:

| Familia propietaria                | Escenarios explícitos | Resultado documental heredado        |
| ---------------------------------- | --------------------: | ------------------------------------ |
| capitalización `DATA-NORM-ARC-003` |                    16 | 16 reconciliados                     |
| conectores `DATA-NORM-ARC-004`     |                    20 | 20 reconciliados                     |
| excepciones `DATA-NORM-ARC-005`    |                    21 | 21 reconciliados                     |
| diccionario `DATA-NORM-ARC-006`    |                    15 | 15 reconciliados                     |
| búsqueda `DATA-NORM-ARC-008`       |                    17 | 17 reconciliados                     |
| **Total**                          |                **89** | **89 reconciliados documentalmente** |

Estos 89 escenarios no se renombran, no se duplican y no se declaran ejecutados contra `@vento/data-normalization`. Constituyen el baseline contractual que deberá reutilizar la futura suite del package.

---

#### 3. Fuentes normativas y precedencia

| Fuente                   | Decisión consumida                                                                                                                       |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-NORM-001`         | identidad del package, pureza, determinismo, ausencia de I/O, side effects y autoridad empresarial                                       |
| `SHELL-NORM-002`         | 14 clases, 7 roles de representación, 6 roles de fuente, 8 modos de tratamiento, 13 operaciones y descriptores                           |
| `SHELL-NORM-003`         | Unicode, espacios, puntuación de prosa, capitalización, perfil `es-CO`, tokenización, fronteras, exclusiones y separación de operaciones |
| `SHELL-NORM-004`         | 18 conectores, excepciones oficiales, scopes, matchers, precedencia, resultados y formas protegidas                                      |
| `SHELL-NORM-005`         | diccionario ortográfico versionado, tres entradas iniciales, `expresso` fuera de corrección automática y fallo cerrado                   |
| `SHELL-NORM-006`         | siete representaciones de búsqueda, seis perfiles, nueve modos, ranking, explicación, privacidad e identidad separada                    |
| `SHELL-NORM-007`         | preview no vinculante, 21 atributos de descriptor, seis dimensiones de divergencia y reevaluación previa al commit                       |
| `SHELL-NORM-008`         | versiones, digests, estados, auditoría lógica, idempotencia, concurrencia, replay y procedencia                                          |
| `DATA-NORM-ARC-001..012` | autoridad semántica original y requisitos de conformidad ya aprobados                                                                    |
| `DATA-NORM-TRANS-002`    | replay documental de 89 escenarios y 25 unidades analíticas sin motor físico                                                             |
| `DATA-NORM-TRANS-009`    | separación entre `PASS_DOCUMENTAL` y evidencia operacional por ambiente                                                                  |
| registro 04A vigente     | requisitos existentes que ya protegen idempotencia, paridad, corpus y conservación                                                       |
| `SHELL-CI-001`           | futura materialización de pruebas de packages compartidos                                                                                |
| `SHELL-CI-005`           | futura matriz de compatibilidad entre package y consumidores                                                                             |
| `DATA-NORM-DB-010`       | prueba física de idempotencia, rollback y ausencia de cambios semánticos en la capa de datos                                             |

Precedencia obligatoria:

```text
CONTRATOS DATA-NORM-ARC
        ↓
CENTRALIZACIÓN SHELL-NORM-001..008
        ↓
CORPUS + ORÁCULOS SHELL-NORM-009
        ↓
PRUEBAS EJECUTABLES DEL PACKAGE EN SHELL-CI-001
        ↓
PARIDAD / COMPATIBILIDAD / TRANSICIÓN
        ↓
PRUEBAS FÍSICAS DE BLOQUE R CUANDO APLIQUEN
```

Una prueba futura podrá implementar este contrato, pero no cambiar sus resultados esperados para hacer pasar una implementación divergente.

---

#### 4. Estado verificable y frontera de la tarea

Estado observado al desarrollar esta tarea:

| Elemento                             | Estado                                              |
| ------------------------------------ | --------------------------------------------------- |
| especificación `SHELL-NORM-001..008` | aprobada documentalmente                            |
| `SHELL-NORM-009`                     | tarea documental actual                             |
| `@vento/data-normalization` físico   | no materializado                                    |
| suite runtime del package            | no materializada                                    |
| ejecución contra package físico      | no disponible                                       |
| corpus contractual E3                | disponible                                          |
| replay documental de 89 escenarios   | disponible y reconciliado por `DATA-NORM-TRANS-002` |
| cambios de datos                     | no autorizados                                      |
| cambios Supabase                     | no autorizados                                      |
| cambios de código                    | no autorizados                                      |
| siguiente tarea                      | reservada; no iniciada                              |

Por tanto, `SHELL-NORM-009` **prueba documentalmente la completitud y coherencia de los oráculos**, pero no afirma que exista una implementación runtime certificada.

---

#### 5. Las cuatro dimensiones de prueba

Toda futura ejecución deberá distinguir exactamente estas cuatro dimensiones:

| Dimensión                          | Pregunta que responde                                                    | Criterio de conformidad                                     |
| ---------------------------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------- |
| determinismo                       | ¿la misma entrada lógica y mismas versiones producen el mismo resultado? | resultado, salida, bloqueo y huellas lógicas equivalentes   |
| idempotencia de evaluación         | ¿reevaluar la salida bajo el mismo contrato evita deriva?                | segunda aplicación no introduce otro cambio semántico       |
| conservación semántica             | ¿solo cambió aquello que la operación permite cambiar?                   | todas las dimensiones protegidas permanecen invariantes     |
| ausencia de efectos no autorizados | ¿la evaluación pura evitó persistencia, identidad y side effects?        | cero efectos empresariales fuera de la frontera propietaria |

Ninguna dimensión sustituye a otra. Dos ejecuciones con la misma cadena visible pueden fallar conservación si cambian procedencia, estructura, autoridad o representación.

---

#### 6. Protocolo de repetición A/B/C

Cada caso determinista deberá poder ejecutarse mediante tres observaciones lógicas:

```text
A = evaluate(source, descriptor, operation, resolved_version_set, explicit_context)

B = evaluate(source, descriptor, operation, resolved_version_set, explicit_context)

C = evaluate(output_of_A_when_reapplicable,
             descriptor,
             operation,
             resolved_version_set,
             explicit_context)
```

Oráculos:

1. **A = B en resultado lógico.**
2. A y B seleccionan la misma política, regla, catálogo, entrada, precedencia y versión.
3. A y B producen la misma salida o la misma preservación.
4. A y B producen el mismo conjunto de derivaciones deterministas.
5. A y B producen el mismo bloqueo, revisión o escalamiento cuando corresponda.
6. C no introduce un segundo cambio semántico.
7. C no crea otra corrección cuando A ya produjo forma canónica.
8. C no convierte `PRESERVED` en mutación.
9. C no convierte `REVIEW_REQUIRED` en corrección automática.
10. C no convierte `BLOCKED_POLICY` o `BLOCKED_CONFLICT` en éxito.
11. C no convierte una derivación de búsqueda en valor fuente.
12. A/B/C no producen persistencia, red, DDL, DML, RPC, identidad, fusión ni side effects desde el motor puro.

La comparación debe usar resultados lógicos y metadata determinista. Identificadores de intento, timestamps de infraestructura u otros valores generados por capas propietarias no forman parte del oráculo de igualdad del motor puro salvo que se suministren explícitamente como entrada contractual.

---

#### 7. Dos garantías de idempotencia que no se confunden

Se conservan las dos garantías aprobadas:

```text
MISMA ENTRADA LÓGICA
+ MISMA COORDENADA
+ MISMO CONJUNTO DE VERSIONES
+ MISMA OPERACIÓN
=
MISMO RESULTADO LÓGICO
```

y:

```text
REAPLICAR UNA OPERACIÓN EMPRESARIAL YA CONFIRMADA
=
RECUPERAR EL RESULTADO PREVIO
SIN SEGUNDO EFECTO EMPRESARIAL
```

`SHELL-NORM-009` puede especificar y certificar documentalmente la primera para el motor puro.

La segunda requiere estado persistido, idempotency keys, concurrencia y confirmación de commit; su ejecución física permanece en la RPC, CI, transición y BLOQUE R correspondientes.

---

#### 8. Oráculo de conservación semántica

Toda prueba deberá evaluar, cuando aplique, estas diez dimensiones:

| Dimensión protegida  | Regla                                                                                          |
| -------------------- | ---------------------------------------------------------------------------------------------- |
| coordenada           | dominio, entidad y campo semántico no cambian por transformación textual                       |
| clase semántica      | la operación no reclasifica el campo por apariencia del valor                                  |
| representación       | una derivación no se convierte en fuente ni sustituye el valor mostrado                        |
| rol de fuente        | una copia, snapshot, externo u output no adquiere autoridad por transformación                 |
| estructura           | cantidades, unidades, multiplicadores, componentes, signos y fronteras protegidas permanecen   |
| forma protegida      | marcas, siglas, nombres legales, identificadores, secretos y excepciones conservan su contrato |
| procedencia          | original, versión, evidencia y vínculo con la fuente no se pierden                             |
| identidad            | ninguna coincidencia o corrección crea identidad, unicidad, sobreviviente o fusión             |
| historia             | snapshots, auditoría y resultados históricos no se reinterpretan retroactivamente              |
| frontera de producto | VITAL no recibe reglas transversales de Vento OS                                               |

Una operación es no conforme si obtiene la cadena visual esperada pero viola cualquiera de estas dimensiones.

---

#### 9. Matriz de conformidad de las 13 operaciones

| Operación                        | Delta permitido                                     | Invariantes obligatorios                                              | Resultado ante falta de contrato                |
| -------------------------------- | --------------------------------------------------- | --------------------------------------------------------------------- | ----------------------------------------------- |
| `UNICODE_CANONICALIZATION`       | composición Unicode autorizada                      | significado, grafemas, signos, tildes, `ñ`, identidad y fuente        | preservar o bloquear                            |
| `EDGE_WHITESPACE_TRIM`           | retirar bordes declarados no significativos         | contenido interno y formato significativo                             | preservar o bloquear                            |
| `INTERNAL_WHITESPACE_COMPACTION` | compactar separadores declarados accidentales       | palabras, saltos, tabs, NBSP y estructura protegida                   | preservar o bloquear                            |
| `PROSE_PUNCTUATION_SPACING`      | solo lo permitido por política específica           | puntuación, contenido y autoría fuera del delta                       | preservar o bloquear                            |
| `COMMERCIAL_CAPITALIZATION`      | caja de tokens elegibles                            | ortografía, tildes, signos, fronteras, estructura y formas protegidas | bloquear                                        |
| `CONNECTOR_CASE_POLICY`          | caja posicional de conector exacto                  | token, léxico, signos, contracciones y significado                    | preservar o bloquear                            |
| `APPROVED_DICTIONARY_CORRECTION` | reemplazo exacto y direccional aprobado             | scope, fronteras, estructura, identidad y original cuando aplique     | preservar, revisar o bloquear                   |
| `OFFICIAL_EXCEPTION_APPLICATION` | preservar o emitir forma oficial autorizada         | scope, evidencia, clase, fuente y significado                         | preservar, revisar o bloquear                   |
| `TECHNICAL_CANONICALIZATION`     | únicamente formato técnico del contrato aportado    | semántica técnica, checksum, identidad y material protegido           | bloquear                                        |
| `SEARCH_KEY_DERIVATION`          | crear representación derivada                       | valor fuente, valor mostrado, identidad y persistencia                | bloquear o no aplicar                           |
| `STRUCTURED_PARSE_OR_RENDER`     | interpretar o renderizar componentes declarados     | cantidad, unidad, multiplicador, orden y relaciones estructurales     | resolución estructural o bloqueo                |
| `SOURCE_PROPAGATION_OR_RESYNC`   | ninguna propagación como side effect del motor puro | fuente, autoridad, causalidad y snapshot                              | resolución estructural; sin efecto              |
| `IDENTITY_OR_RECORD_ACTION`      | ningún cambio textual autorizante                   | identidad, relaciones, unicidad y registros                           | `STRUCTURAL_RESOLUTION_REQUIRED` o `PROHIBITED` |

Conciliación:

```text
operaciones esperadas = 13
operaciones cubiertas = 13
faltantes = 0
duplicados = 0
```

---

#### 10. Matriz de las 14 clases semánticas

| Clase                          | Prueba mínima de conservación                                             | Operación que nunca se infiere     |
| ------------------------------ | ------------------------------------------------------------------------- | ---------------------------------- |
| `COMMERCIAL_NAME`              | conservar ortografía, estructura y excepciones fuera del delta autorizado | identidad o fusión                 |
| `STRUCTURED_PRESENTATION_NAME` | conservar cantidad, unidad, multiplicador, empaque y contexto             | equivalencia por etiqueta          |
| `HUMAN_LABEL`                  | no heredar estilo comercial por visibilidad                               | capitalización comercial universal |
| `OFFICIAL_LEGAL_NAME`          | preservar forma oficial completa y procedencia                            | reconstrucción por tokens          |
| `OFFICIAL_BRAND_FORM`          | preservar grafía oficial, signos y capitalización interna                 | Title Case genérico                |
| `PERSON_OR_ACTOR_NAME`         | conservar identidad declarada y no inferir corrección                     | deduplicación por nombre           |
| `ADDRESS_OR_LOCATION_TEXT`     | conservar números, orden, abreviaturas y signos bajo contrato             | corrección comercial               |
| `FREE_TEXT`                    | conservar autoría, historia y contenido fuera de reglas explícitas        | corrección destructiva silenciosa  |
| `CONTROLLED_VOCABULARY_CODE`   | conservar código salvo contrato técnico                                   | diccionario ortográfico            |
| `MEASUREMENT_OR_UNIT_CODE`     | conservar código y significado dimensional                                | expansión o traducción implícita   |
| `TECHNICAL_IDENTIFIER`         | conservar estabilidad y formato contractual                               | capitalización comercial           |
| `CONTACT_IDENTIFIER`           | aplicar solo estándar o contrato específico                               | regla de nombre comercial          |
| `SECRET_OR_SIGNATURE_MATERIAL` | preservación exacta y ausencia de derivación general                      | cualquier normalización textual    |
| `UNCLASSIFIED_PRESERVE`        | preservación exacta y automatización bloqueada                            | auto-detección de política         |

Conciliación:

```text
clases esperadas = 14
clases cubiertas = 14
faltantes = 0
duplicados = 0
```

---

#### 11. Matriz de los siete roles de representación

| Rol                   | Invariante de prueba                                                            |
| --------------------- | ------------------------------------------------------------------------------- |
| `PRIMARY_VALUE`       | solo cambia si clase, fuente, operación, política y versiones permiten mutación |
| `DISPLAY_OVERRIDE`    | no retroalimenta automáticamente el principal                                   |
| `SEARCH_DERIVATION`   | nunca sustituye el valor mostrado ni crea identidad                             |
| `EXTERNAL_ORIGINAL`   | conserva forma y procedencia; una forma interna permanece separada              |
| `HISTORICAL_SNAPSHOT` | no se resincroniza ni reinterpreta con reglas nuevas                            |
| `OUTPUT_PROJECTION`   | adapta salida sin adquirir autoridad sobre la fuente                            |
| `AUDIT_EVIDENCE`      | permanece inmutable; rectificación es aditiva                                   |

Conciliación:

```text
roles esperados = 7
roles cubiertos = 7
faltantes = 0
duplicados = 0
```

---

#### 12. Matriz de los seis roles de fuente

| Rol                    | Invariante de prueba                                                           |
| ---------------------- | ------------------------------------------------------------------------------ |
| `AUTHORITATIVE_SOURCE` | puede originar una corrección solo si todas las otras dimensiones la autorizan |
| `APPROVED_OVERRIDE`    | conserva scope propio y nunca amplía permisos de clase                         |
| `SYNCHRONIZED_COPY`    | no decide una corrección canónica de manera independiente                      |
| `IMMUTABLE_SNAPSHOT`   | no cambia por una nueva versión de la fuente                                   |
| `EXTERNAL_EVIDENCE`    | preserva original y no se convierte en autoridad interna automática            |
| `OUTPUT_ONLY`          | no retroalimenta ni modifica la fuente                                         |

Conciliación:

```text
roles esperados = 6
roles cubiertos = 6
faltantes = 0
duplicados = 0
```

---

#### 13. Matriz de los ocho modos de tratamiento

| Modo                             | Oráculo idempotente                                                                |
| -------------------------------- | ---------------------------------------------------------------------------------- |
| `DETERMINISTIC_MUTATION_ALLOWED` | la primera transformación produce forma estable; reaplicación no cambia            |
| `DICTIONARY_MUTATION_ALLOWED`    | el reemplazo aprobado no vuelve a reemplazarse ni crea otra entrada                |
| `DERIVATION_ONLY`                | la derivación es estable y la fuente permanece idéntica                            |
| `VALIDATION_ONLY`                | revalidar no altera el valor                                                       |
| `HUMAN_REVIEW_REQUIRED`          | repetir conserva el original y el estado de necesidad de revisión                  |
| `PRESERVE_EXACT`                 | salida equivale exactamente a entrada dentro del contrato                          |
| `STRUCTURAL_RESOLUTION_REQUIRED` | repetir no introduce corrección textual ni efecto estructural                      |
| `PROHIBITED`                     | repetir continúa bloqueado; ausencia de permiso nunca se convierte en autorización |

Conciliación:

```text
modos esperados = 8
modos cubiertos = 8
faltantes = 0
duplicados = 0
```

---

#### 14. Unicode, espacios y puntuación de prosa

La suite deberá cubrir como mínimo:

| Caso | Entrada o condición                                                                                           | Oráculo                                                                                                                                   |
| ---: | ------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | forma descompuesta equivalente y operación NFC autorizada                                                     | salida NFC; segunda aplicación idéntica                                                                                                   |
|    2 | valor ya NFC                                                                                                  | `NO_CHANGE_ALREADY_CANONICAL` o resultado equivalente sin mutación                                                                        |
|    3 | tilde, diéresis o `ñ` significativas                                                                          | no se eliminan por canonicalización                                                                                                       |
|    4 | espacio de borde declarado no significativo                                                                   | se recorta una vez; segunda aplicación estable                                                                                            |
|    5 | espacio de borde significativo                                                                                | se preserva                                                                                                                               |
|    6 | separadores internos accidentales autorizados                                                                 | compactación estable                                                                                                                      |
|    7 | salto de línea significativo                                                                                  | se preserva                                                                                                                               |
|    8 | tabulación significativa                                                                                      | se preserva                                                                                                                               |
|    9 | NBSP o espacio especial con semántica no resuelta                                                             | se preserva o bloquea; no se convierte por conveniencia                                                                                   |
|   10 | descriptor incompleto                                                                                         | fail closed; sin transformación                                                                                                           |
|   11 | `PROSE_PUNCTUATION_SPACING` solicitado sin política de prosa suficiente                                       | preservar o bloquear; no aplicar regex o preferencia visual local                                                                         |
|   12 | política explícita autoriza un delta de espaciado alrededor de puntuación                                     | cambia únicamente el espaciado declarado; signos, palabras, caja, Unicode y estructura permanecen invariantes; segunda aplicación estable |
|   13 | Markdown, plantilla, salto de línea, formato técnico, numérico o estructura cuyo espaciado no está autorizado | preservar; no inferir una regla de prosa por apariencia                                                                                   |

La propiedad de la operación queda probada contra la misma separación aprobada:

```text
DATA-NORM-ARC-001 / DATA-NORM-ARC-002
→ elegibilidad y tratamiento efectivo por coordenada

SHELL-NORM-003
→ contrato compartido de PROSE_PUNCTUATION_SPACING

DATA-NORM-ARC-011
→ servicio decide y RPC confirma una mutación autorizada
```

Los oráculos de puntuación se aplican sobre el corpus y las unidades analíticas ya heredadas; no crean un segundo corpus ni alteran el conteo contractual de 89 escenarios. La evidencia de auditoría sobre espacios alrededor de signos se utiliza como señal de conformidad, nunca como permiso universal de corrección.

No existe un oráculo transversal que autorice `trim`, `\s+`, `lower`, `unaccent`, transliteración o una regla universal de puntuación sobre todo texto.

---

#### 15. Capitalización empresarial

La prueba de `COMMERCIAL_CAPITALIZATION` conserva:

1. perfil exacto `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`;
2. locale `es-CO` explícito;
3. elegibilidad exclusiva de `COMMERCIAL_NAME`;
4. representación y fuente autorizadas;
5. nueve clases de token;
6. seis resultados de token;
7. tres fronteras de segmento;
8. separación frente a Unicode, espacios, diccionario y puntuación;
9. precedencia de conectores y excepciones;
10. idempotencia de la forma final.

Casos negativos obligatorios:

| Condición                       | Resultado esperado                      |
| ------------------------------- | --------------------------------------- |
| `OFFICIAL_BRAND_FORM`           | no aplicar estilo comercial genérico    |
| `OFFICIAL_LEGAL_NAME`           | preservar forma oficial                 |
| `PERSON_OR_ACTOR_NAME`          | no aplicar política comercial universal |
| identificador técnico           | no capitalizar comercialmente           |
| secreto o firma                 | preservar exactamente                   |
| `UNCLASSIFIED_PRESERVE`         | bloquear automatización                 |
| locale ausente o incompatible   | bloquear                                |
| versión faltante o incompatible | bloquear                                |
| VITAL                           | fuera de la política transversal        |

---

#### 16. Conectores

Se conserva el catálogo exacto de 18 entradas:

```text
a
al
con
de
del
e
el
en
la
las
lo
los
o
para
por
sin
u
y
```

Cada entrada deberá ser cubierta en los contextos normativos `NAME_START`, `DECLARED_SEGMENT_START` e `INTERNAL` según el corpus propietario.

Oráculos obligatorios:

1. coincidencia únicamente por token lexical completo;
2. `al` y `del` permanecen atómicos;
3. no se expande `al` a `a el`;
4. no se expande `del` a `de el`;
5. no se contrae `a el` ni `de el`;
6. `e`, `u`, `o` y `y` conservan el lexema recibido; solo cambia caja posicional;
7. no existe sustitución fonológica automática `y ↔ e` ni `o ↔ u`;
8. `y/o`, `o/u`, `de-la` u otras formas compuestas no se infieren como entradas;
9. una excepción oficial de mayor precedencia prevalece;
10. repetir el resultado no altera token, posición ni forma.

---

#### 17. Excepciones oficiales

La suite consume sin ampliar:

- 4 familias de excepción;
- 4 scopes;
- 3 matchers;
- 4 modos de aplicación;
- 7 resultados;
- 28 formas activas de conformidad presentes en el corpus aprobado.

Anclas explícitas de preservación incluyen, cuando el scope sea compatible:

```text
3M
iPhone
Coca-Cola
NEXO
VISO
ORIGO
NUMERA
FOGO
PULSO
VGR
SAU
VCF
COP
g
kg
ml
l
un
dz
SAS
S.A.S.
SA
S.A.
LTDA
CIA
```

Las formas se evalúan bajo su familia, alcance, matcher, fuente, versión y evidencia; la lista visible no autoriza tratarlas todas como equivalentes ni como tokens intercambiables.

Oráculos:

1. una forma oficial ya correcta permanece estable;
2. emitir una forma oficial autorizada y reevaluarla no produce otro cambio;
3. la coincidencia no escapa de su scope;
4. no se activa matching difuso;
5. no se elimina puntuación para forzar coincidencia;
6. no se crean aliases por frecuencia;
7. sufijos legales puntuados y no puntuados no se declaran equivalentes por inferencia;
8. una excepción no crea identidad ni unicidad;
9. candidatos sin autoridad permanecen preservados, bloqueados o en revisión.

---

#### 18. Diccionario ortográfico

La suite conserva exactamente las tres correcciones iniciales:

| Forma de origen | Forma canónica | Oráculo                                                                 |
| --------------- | -------------- | ----------------------------------------------------------------------- |
| `maiz`          | `maíz`         | corrección exacta en scope elegible; `maíz` reaplicado permanece `maíz` |
| `clasico`       | `clásico`      | corrección exacta; segunda aplicación sin cambio                        |
| `frio`          | `frío`         | corrección exacta; segunda aplicación sin cambio                        |

`expresso` permanece fuera de las correcciones automáticas de la versión vigente.

Oráculos obligatorios:

1. matching direccional y exacto;
2. fronteras completas de valor, frase o token;
3. no se usa similitud, distancia de edición, fonética ni inferencia;
4. la forma canónica no se vuelve origen de una corrección inversa implícita;
5. la proyección de caja no ejecuta capitalización completa;
6. excepción oficial de mayor precedencia se conserva;
7. conflicto de igual especificidad bloquea;
8. entrada inactiva no actúa como fallback;
9. original externo o snapshot permanece separado;
10. corrección textual no crea alias de búsqueda, identidad ni fusión.

---

#### 19. Búsqueda y comparación

La prueba de búsqueda cubre las siete representaciones aprobadas y conserva las siguientes fronteras:

1. `SEARCH_FORM_KEY` aplica únicamente las transformaciones aprobadas para esa derivación;
2. `SEARCH_ACCENT_KEY` bajo `es-CO` conserva `ñ` frente a `n`;
3. `SEARCH_TOKEN_STREAM` respeta grafemas y fronteras;
4. aliases solo participan si son explícitos, activos, acotados y versionados;
5. transliteración permanece deshabilitada por defecto;
6. similitud permanece deshabilitada por defecto;
7. existen seis perfiles cerrados;
8. existen nueve modos de coincidencia con precedencia absoluta;
9. ranking y desempate deben ser deterministas;
10. fuente y valor mostrado permanecen separados;
11. una coincidencia no autoriza identidad, selección, unicidad o fusión.

Casos de conservación obligatorios:

| Caso                                          | Oráculo                                              |
| --------------------------------------------- | ---------------------------------------------------- |
| `año` frente a `ano`                          | no convergen por regla transversal                   |
| valor con tilde frente a derivación tolerante | la derivación no modifica el valor mostrado          |
| alias ausente                                 | no se inventa por frecuencia o similitud             |
| transliteración deshabilitada                 | no produce salida alternativa                        |
| similitud deshabilitada                       | no produce candidato fuzzy                           |
| misma consulta, scope, corpus y versiones     | mismo orden y explicación                            |
| versión de ranking distinta                   | no se mezcla silenciosamente dentro del mismo cursor |

---

#### 20. Previsualización

El corpus de preview deberá demostrar:

1. `PREVIEW_AND_GUIDANCE` continúa separado de `AUTHORITATIVE_SEMANTIC_EVALUATION`;
2. `NORMALIZATION_EVALUATION_QUERY` no muta;
3. los 21 atributos del descriptor permanecen coherentes;
4. el preview devuelve la misma evaluación semántica para la misma entrada y versiones;
5. la repetición del preview no reserva filas ni crea locks;
6. la repetición no crea auditoría falsa de commit;
7. la propuesta no se convierte en `APPLIED_CHANGE` por ser mostrada;
8. la fuente observada permanece distinguible de la propuesta;
9. una coincidencia de búsqueda continúa siendo no vinculante;
10. un resultado de revisión continúa siendo revisión.

Las seis dimensiones de divergencia que obligan a reevaluar antes de un commit posterior permanecen:

```text
valor
scope
política
versiones
unicidad
relaciones
```

Una previsualización solo es reutilizable como evidencia de lo observado; nunca como permiso de commit.

---

#### 21. Versionado y metadata

La suite deberá comprobar coherencia lógica de:

- 6 familias de registro;
- 13 atributos de identidad de regla y versión;
- 11 dependencias posibles del `resolved_version_set`;
- 8 estados de ciclo de vida;
- 7 atributos de activación;
- 5 modos de compatibilidad;
- 11 atributos de procedencia de algoritmo;
- 12 eventos de auditoría;
- 30 atributos del contrato lógico mínimo;
- 10 resultados de evaluación;
- 5 clases de retención;
- 3 niveles de reproducibilidad;
- 7 tiempos semánticos;
- 9 componentes de clave lógica de idempotencia;
- 6 clases de operación idempotente;
- 4 expectativas de concurrencia;
- 9 atributos de replay.

El oráculo de igualdad del motor puro incluye únicamente metadata derivable de entradas explícitas y versiones fijadas. Actor, autorización, timestamp, identidad de evento, estado persistido o resultado de commit no pueden inventarse para completar una prueba.

---

#### 22. Estados, versiones y compatibilidad

Casos mínimos:

| Condición                                       | Resultado esperado                                                  |
| ----------------------------------------------- | ------------------------------------------------------------------- |
| misma regla, misma versión y mismo digest       | misma evaluación                                                    |
| mismo `rule_version_id` con digest distinto     | inconsistencia bloqueante                                           |
| versión `ACTIVE` compatible                     | elegible según coordenada y demás reglas                            |
| versión `DRAFT`                                 | no ejecutable para decisión nueva                                   |
| `SUSPENDED`                                     | bloqueada                                                           |
| `SUPERSEDED`                                    | solo interpretación histórica donde corresponda                     |
| `RETIRED`                                       | no ejecutable para decisión nueva                                   |
| `REJECTED`                                      | no ejecutable                                                       |
| `INVALIDATED`                                   | bloqueo inmediato para nuevas decisiones                            |
| dependencia faltante del `resolved_version_set` | `BLOCKED_POLICY` o bloqueo equivalente                              |
| dependencia incompatible                        | bloqueo; sin fallback                                               |
| `DUAL_EVALUATION_SHADOW`                        | evaluación candidata sin mutación ni alteración de respuesta activa |
| `HISTORICAL_READ_ONLY`                          | interpretación histórica, sin autoridad nueva                       |
| `REPLAY_ONLY`                                   | replay aislado                                                      |
| `INCOMPATIBLE_BLOCKED`                          | no mezclar ni continuar                                             |

No existe `latest` implícito.

---

#### 23. Propiedades de pureza y ausencia de side effects

La futura suite del package deberá poder detectar y fallar si una función semántica:

- muta el objeto de entrada;
- escribe archivo o almacenamiento;
- ejecuta DDL o DML;
- ejecuta RPC o consulta;
- hace requests de red;
- lee secretos;
- usa variable de entorno para decidir semántica;
- usa reloj actual no suministrado;
- usa aleatoriedad no fijada;
- usa locale del runtime;
- depende del orden físico de objetos o catálogos;
- utiliza caché mutable como fuente de verdad;
- usa logs como auditoría canónica;
- confirma efectos empresariales;
- asigna identidad o fusiona registros.

Oráculo:

```text
same explicit input
→ same explicit output
→ zero hidden semantic dependencies
→ zero unauthorized side effects
```

---

#### 24. Cambios de versión no se tratan como fallo de idempotencia

La idempotencia se evalúa dentro del mismo conjunto efectivo de versiones.

Si una versión cambia:

1. la evaluación nueva pertenece a otro corte contractual;
2. la diferencia esperada se atribuye a la nueva versión;
3. el resultado anterior conserva su interpretación histórica;
4. no se reevalúa retrospectivamente un snapshot para hacerlo coincidir;
5. un retry de una operación anterior no adopta silenciosamente la versión nueva;
6. un replay declara explícitamente la versión que intenta reproducir;
7. igualdad de salida con procedencia distinta no demuestra paridad completa.

Así se evita exigir falsamente que dos versiones distintas produzcan siempre la misma salida.

---

#### 25. Fallo cerrado

La suite debe producir casos negativos para:

- descriptor incompleto;
- clase faltante;
- representación faltante;
- fuente faltante;
- versión faltante;
- política ausente;
- dependencia suspendida;
- versiones incompatibles;
- conflicto entre reglas de igual precedencia;
- excepción ambigua;
- diccionario ambiguo;
- scope incompleto;
- fuente obsoleta;
- estado esperado distinto;
- contexto de autorización no aportado por la capa propietaria;
- estructura no resuelta;
- operación de identidad solicitada dentro del motor textual.

Regla:

```text
FALTA DE INFORMACIÓN
≠ DEFAULT PERMISIVO

CONFLICTO
≠ PRIMERA REGLA QUE COINCIDA

FALLO TÉCNICO
≠ SIN CAMBIOS
```

---

#### 26. Conservación de estructura

Para `STRUCTURED_PRESENTATION_NAME` y `STRUCTURED_PARSE_OR_RENDER`, la prueba deberá conservar individualmente:

```text
cantidad
unidad
multiplicador
empaque
etiqueta
código
factor de conversión
contexto de uso
orden cuando sea semántico
procedencia
versión
```

Casos como `Six Pack`, `six_pack`, `Pote x 2`, `pote`, `Unidad`, `UNIDAD` o `Bolsa 1 kg` no se convierten en aliases ni identidades por similitud textual.

Un cambio de caja o etiqueta no puede modificar cantidad, unidad, multiplicador o factor de conversión.

---

#### 27. Conservación de originales, snapshots y evidencia

Oráculos:

1. `EXTERNAL_ORIGINAL` conserva el valor recibido y su procedencia;
2. una derivación interna se mantiene separada;
3. `HISTORICAL_SNAPSHOT` no se resincroniza por una nueva regla;
4. `AUDIT_EVIDENCE` no se modifica para reflejar el valor actual;
5. una rectificación de evidencia es aditiva;
6. una nueva versión no reinterpreta silenciosamente historia;
7. una firma, token, hash o material protegido no ingresa a transformaciones generales;
8. una búsqueda o preview no sobrescribe originales.

---

#### 28. Frontera frente a identidad, unicidad y fusión

Cada caso de corpus deberá comprobar que ninguna de estas señales produce efectos estructurales:

```text
mismo valor visible
misma forma normalizada
misma clave de búsqueda
misma clave tolerante
mismo alias
misma corrección ortográfica
mismo ranking
mismo primer resultado
misma excepción oficial
mismo nombre después de capitalización
```

Todos ellos pueden producir, según contrato:

- igualdad textual;
- coincidencia;
- candidato;
- derivación;
- corrección visible;
- preservación;
- revisión.

Ninguno autoriza por sí mismo:

- crear identidad;
- confirmar duplicado;
- activar constraint;
- seleccionar sobreviviente;
- desactivar registro;
- reasignar relaciones;
- fusionar registros.

---

#### 29. Frontera VITAL

Toda prueba transversal deberá incluir un negativo de producto:

```text
product_boundary = VITAL
→ política transversal Vento OS no aplicable
→ no transformación
→ no búsqueda derivada transversal
→ no diccionario transversal
→ no catálogo transversal
→ no propagación
```

La coexistencia física dentro del mismo proyecto no altera esta regla.

---

#### 30. Reconciliación con las 25 unidades analíticas de `DATA-NORM-TRANS-002`

Las 25 unidades del dry-run se consumen como evidencia histórica y contractual, no como test runtime del package.

| Grupo             | Cobertura heredada                                          | Uso en esta tarea                                      |
| ----------------- | ----------------------------------------------------------- | ------------------------------------------------------ |
| forma y espacios  | recorte, compactación, NFC, espacios Unicode, puntuación    | fijar oráculos de cambio permitido y preservación      |
| capitalización    | perfil comercial y corpus                                   | fijar idempotencia de caja y exclusiones               |
| conectores        | 18 entradas y posiciones                                    | fijar token, posición, precedencia e idempotencia      |
| excepciones       | formas activas y candidatos                                 | fijar preservación, emisión, bloqueo y revisión        |
| diccionario       | tres correcciones y `expresso`                              | fijar reemplazo direccional y fallo cerrado            |
| búsqueda          | claves, tokens, aliases, transliteración y similitud        | fijar derivación separada y capacidades deshabilitadas |
| estructura        | perfiles y candidatos estructurales                         | fijar conservación de componentes                      |
| clases protegidas | texto libre, personas, identificadores, externos y secretos | fijar ausencia de transformación indebida              |

No se suman las poblaciones históricas de workloads porque se solapan.

---

#### 31. Cobertura de requisitos de prueba vigente

`SHELL-NORM-009` consume requisitos ya existentes sin modificarlos.

Cobertura principal de idempotencia, determinismo y paridad:

- `TREQ-DATA-016`;
- `TREQ-DATA-067`;
- `TREQ-DATA-084`;
- `TREQ-DATA-102`;
- `TREQ-DATA-120`;
- `TREQ-DATA-124`;
- `TREQ-DATA-139`;
- `TREQ-DATA-154` a `TREQ-DATA-159`;
- `TREQ-DATA-163`;
- `TREQ-DATA-193`.

Cobertura de corpus y conservación semántica:

- `TREQ-DATA-053`;
- `TREQ-DATA-068`;
- `TREQ-DATA-086`;
- `TREQ-DATA-103`;
- `TREQ-DATA-142`;
- `TREQ-DATA-164`;
- `TREQ-DATA-190`;
- `TREQ-DATA-214`;
- `TREQ-DATA-240`.

Cobertura transversal de packages compartidos:

- `TREQ-SHELL-002`;
- `TREQ-SHELL-005`;
- `TREQ-SHELL-006`;
- `TREQ-SHELL-007`;
- `TREQ-SHELL-008`.

La tarea no cambia regla protegida, riesgo, tipo, responsable, paquete, estado ni relación de ninguna de estas filas.

---

#### 32. Matriz de evidencia

| Evidencia                                 | Estado en esta tarea         | Lectura permitida                                 |
| ----------------------------------------- | ---------------------------- | ------------------------------------------------- |
| contratos `SHELL-NORM-001..008`           | `ESPECIFICADO`               | base normativa completa                           |
| 89 escenarios E3                          | replay contractual heredado  | coherencia documental demostrada; no motor físico |
| 25 unidades analíticas                    | evidencia histórica heredada | señal y baseline; no test runtime del package     |
| oráculo A/B/C                             | `ESPECIFICADO`               | listo para materialización futura                 |
| oráculo de conservación de 10 dimensiones | `ESPECIFICADO`               | listo para materialización futura                 |
| cobertura 13 operaciones                  | `ESPECIFICADO`               | 13/13                                             |
| cobertura 14 clases                       | `ESPECIFICADO`               | 14/14                                             |
| cobertura 7 representaciones              | `ESPECIFICADO`               | 7/7                                               |
| cobertura 6 fuentes                       | `ESPECIFICADO`               | 6/6                                               |
| cobertura 8 modos                         | `ESPECIFICADO`               | 8/8                                               |
| suite ejecutable del package              | `PENDIENTE_DE_EVIDENCIA`     | requiere materialización física                   |
| ejecución CI del package                  | `PENDIENTE_DE_EVIDENCIA`     | pertenece a `SHELL-CI-001`                        |
| matriz de compatibilidad de consumidores  | `PENDIENTE_DE_EVIDENCIA`     | pertenece a `SHELL-CI-005`                        |
| idempotencia transaccional                | `PENDIENTE_DE_EVIDENCIA`     | requiere RPC y estado                             |
| idempotencia/rollback en datos            | `PENDIENTE_DE_EVIDENCIA`     | pertenece a `DATA-NORM-DB-010`                    |
| evidencia por ambiente                    | `PENDIENTE_DE_EVIDENCIA`     | pertenece a transición y gates autorizados        |

No se declara evidencia operacional inexistente.

---

#### 33. Handoffs exactos

| Trabajo posterior                                                        | Propietario exacto                                                  | Condición de salida                                                         |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| crear pruebas ejecutables del package compartido                         | `SHELL-CI-001`                                                      | materializar los oráculos y corpus definidos aquí sobre el package real     |
| comprobar build aislado del package                                      | `SHELL-CI-002`                                                      | demostrar que la suite y el package no dependen de un consumidor accidental |
| certificar compatibilidad por consumidor                                 | `SHELL-CI-005`                                                      | ejecutar matriz contra versiones consumidoras soportadas                    |
| adaptación de consumidores                                               | `SHELL-CI-006`                                                      | adoptar mediante PR después de pruebas y compatibilidad                     |
| almacenamiento de reglas y versiones                                     | `DATA-NORM-DB-001`                                                  | persistir únicamente dentro de un package autorizado                        |
| pruebas físicas de idempotencia, rollback y ausencia de cambio semántico | `DATA-NORM-DB-010`                                                  | ejecutar sobre almacenamiento y efectos físicos autorizados                 |
| paridad, concurrencia e idempotencia de transición                       | `SUPA-TRANS-009`; `DATA-NORM-TRANS-009`                             | producir evidencia reproducible por ambiente                                |
| materialización física de `@vento/data-normalization`                    | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>` | abrir implementación para una instancia explícitamente autorizada           |

No se asigna `package_id` desde esta tarea documental.

---

#### 34. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea no introduce comportamiento ejecutable nuevo ni modifica una regla protegida. Materializa el corpus y los oráculos de conformidad para comportamientos de idempotencia, determinismo, paridad, preservación, Unicode, espacios, `PROSE_PUNCTUATION_SPACING`, fallo cerrado, búsqueda, preview, versionado y frontera de identidad ya registrados por tareas `DATA-NORM-ARC-*` y por los requisitos vigentes del registro canónico. La implementación de esas pruebas permanece en sus tareas propietarias ya existentes.

---

#### 35. Decisiones vinculantes

1. `SHELL-NORM-009` cierra documentalmente la especificación de pruebas del mini-bloque `SHELL-NORM`.
2. El package físico continúa no materializado.
3. Esta tarea no declara ejecución runtime inexistente.
4. Se reutilizan exactamente 89 escenarios explícitos del corpus contractual E3.
5. Los 89 escenarios se distribuyen 16 + 20 + 21 + 15 + 17.
6. No se crean escenarios canónicos alternativos que compitan con esos 89.
7. El protocolo A/B/C es obligatorio para operaciones deterministas re-aplicables.
8. A y B deben producir el mismo resultado lógico para la misma entrada y versiones.
9. C no puede introducir deriva sobre la salida canónica de A.
10. Bloqueo, revisión, preservación y no aplicabilidad también deben ser estables.
11. Idempotencia de evaluación y efecto único transaccional permanecen garantías distintas.
12. La conservación semántica se evalúa en diez dimensiones.
13. Se cubren 13/13 familias de operación.
14. Se cubren 14/14 clases semánticas.
15. Se cubren 7/7 roles de representación.
16. Se cubren 6/6 roles de fuente.
17. Se cubren 8/8 modos de tratamiento.
18. Unicode no elimina tildes, `ñ` ni significado.
19. Espacios no se normalizan mediante regla universal.
20. `PROSE_PUNCTUATION_SPACING` pertenece a `SHELL-NORM-003`, exige política explícita por coordenada, cambia únicamente el espaciado autorizado y falla cerrada ante alcance insuficiente.
21. Capitalización no corrige ortografía ni estructura.
22. Solo `COMMERCIAL_NAME` puede usar la capitalización comercial vigente.
23. Conectores se reconocen como tokens completos.
24. `al` y `del` permanecen atómicos.
25. `e`, `u`, `o` y `y` no se sustituyen por heurística fonológica.
26. Excepciones no usan fuzzy matching ni aliases inferidos.
27. El diccionario conserva exactamente tres correcciones iniciales.
28. `expresso` no se corrige automáticamente.
29. Una corrección de diccionario no crea identidad ni alias de búsqueda.
30. `SEARCH_DERIVATION` nunca sustituye el valor mostrado.
31. `ñ` no se pliega globalmente a `n`.
32. Transliteración continúa deshabilitada por defecto.
33. Similitud continúa deshabilitada por defecto.
34. Preview continúa no vinculante.
35. Preview repetido no crea lock, reserva ni commit.
36. Una divergencia en valor, scope, política, versiones, unicidad o relaciones exige reevaluación.
37. `resolved_version_set` y `version_set_digest` permanecen explícitos.
38. No existe `latest` implícito.
39. Una versión no activa no adquiere autoridad por fallback.
40. Un cambio de versión no reinterpreta historia.
41. El motor puro no inventa actor, autorización, timestamp ni identidad de evento.
42. El motor puro no consulta red, base de datos, secretos, filesystem ni estado mutable para decidir semántica.
43. Un resultado visual correcto no basta si viola estructura, procedencia o autoridad.
44. Una coincidencia no crea identidad.
45. Una coincidencia no activa unicidad.
46. Una coincidencia no selecciona sobreviviente.
47. Una coincidencia no fusiona registros.
48. Originales externos permanecen separados.
49. Snapshots históricos permanecen inmutables.
50. Evidencia de auditoría no se reescribe.
51. Secretos y material firmado permanecen fuera de normalización general.
52. VITAL permanece fuera de la política transversal.
53. La suite futura del package pertenece a `SHELL-CI-001`.
54. La compatibilidad futura pertenece a `SHELL-CI-005`.
55. La prueba física de datos pertenece a `DATA-NORM-DB-010`.
56. No se crea código.
57. No se crea package físico.
58. No se modifica Supabase.
59. No se crean ni modifican requisitos de prueba.
60. Todos los elementos pendientes tienen propietario exacto.
61. `SHELL-DB-001` queda únicamente reservada.

---

#### 36. Hallazgos y destinos exactos

| Hallazgo                                                                                               | Resultado de `SHELL-NORM-009`                                                                                                      | Destino exacto                                                                  |
| ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| el package todavía no existe físicamente                                                               | no se simula ejecución runtime                                                                                                     | `SHELL-CI-020::<package_id>` después de `E5-GATE-008::<package_id>`             |
| existían 89 escenarios contractuales ya reconciliados                                                  | se fijan como corpus base heredado de la suite                                                                                     | `SHELL-CI-001`                                                                  |
| idempotencia podía confundirse con efecto único                                                        | se separan determinismo/reaplicación de deduplicación transaccional                                                                | `SHELL-CI-001`; `DATA-NORM-DB-010`                                              |
| una salida textual igual podía ocultar cambio semántico                                                | se materializa oráculo de conservación de diez dimensiones                                                                         | `SHELL-CI-001`; `SUPA-TRANS-009`                                                |
| operaciones stateful no pueden certificarse desde un motor puro                                        | se limita la prueba pura y se conserva su handoff                                                                                  | `DATA-NORM-DB-010`; `DATA-NORM-TRANS-009`                                       |
| consumidores pueden divergir aun con package correcto                                                  | paridad por consumidor queda fuera de la prueba aislada                                                                            | `SHELL-CI-005`; `SHELL-CI-006`                                                  |
| evidencia documental no equivale a evidencia operacional                                               | estados quedan separados explícitamente                                                                                            | `DATA-NORM-TRANS-009`                                                           |
| `PROSE_PUNCTUATION_SPACING` estaba tipada pero sin propiedad compartida explícita dentro de SHELL-NORM | se concilia su contrato en `SHELL-NORM-003`; la elegibilidad sigue gobernada por política de campo y la ejecución por servicio/RPC | `SHELL-NORM-003`; `DATA-NORM-ARC-001`; `DATA-NORM-ARC-002`; `DATA-NORM-ARC-011` |
| cierre de SHELL-NORM no autoriza implementación                                                        | siguiente continuidad documental permanece independiente                                                                           | `SHELL-DB-001`                                                                  |

No queda un pendiente narrativo sin propietario documental exacto.

---

#### 37. Criterios de aceptación

`SHELL-NORM-009` queda documentalmente completa cuando se cumplen simultáneamente:

1. identifica correctamente que el package físico no existe todavía;
2. no declara pruebas runtime como ejecutadas;
3. reconcilia 89/89 escenarios contractuales heredados;
4. preserva la distribución 16/20/21/15/17;
5. define protocolo A/B/C;
6. distingue determinismo de efecto único transaccional;
7. materializa diez dimensiones de conservación semántica;
8. cubre 13/13 familias de operación;
9. faltantes de operaciones = 0;
10. duplicados de operaciones = 0;
11. cubre 14/14 clases semánticas;
12. faltantes de clases = 0;
13. duplicados de clases = 0;
14. cubre 7/7 roles de representación;
15. cubre 6/6 roles de fuente;
16. cubre 8/8 modos de tratamiento;
17. conserva Unicode y tildes bajo las reglas aprobadas;
18. conserva espacios significativos;
19. cubre `PROSE_PUNCTUATION_SPACING` con propietario exacto, política explícita, delta acotado, preservación de signos y oráculo idempotente;
20. prohíbe Title Case universal;
21. preserva las nueve clases de token y tres fronteras de capitalización;
22. cubre las 18 entradas de conectores por su corpus propietario;
23. conserva atomicidad de `al` y `del`;
24. prohíbe sustitución fonológica de conjunciones;
25. conserva las excepciones oficiales sin fuzzy matching;
26. conserva las tres entradas de diccionario;
27. mantiene `expresso` fuera de corrección automática;
28. preserva búsqueda como derivación;
29. preserva `ñ` frente a `n`;
30. mantiene transliteración y similitud deshabilitadas;
31. conserva los seis perfiles y nueve modos de búsqueda;
32. preserva preview no vinculante;
33. cubre seis dimensiones de divergencia pre-commit;
34. conserva versionado explícito y ausencia de `latest`;
35. prueba documentalmente fallo cerrado;
36. prueba documentalmente ausencia de side effects autorizados en el motor puro;
37. preserva estructura de presentaciones;
38. preserva originales, snapshots y evidencia;
39. preserva frontera frente a identidad, unicidad y fusión;
40. preserva frontera VITAL;
41. distingue evidencia contractual heredada de evidencia runtime;
42. asigna suite ejecutable a `SHELL-CI-001`;
43. asigna compatibilidad a `SHELL-CI-005`;
44. asigna pruebas físicas a `DATA-NORM-DB-010`;
45. no inventa `package_id`;
46. no crea código;
47. no crea package físico;
48. no modifica Supabase;
49. no crea ni modifica requisitos de prueba;
50. todos los handoffs tienen propietario exacto;
51. la siguiente tarea permanece únicamente reservada.

---

#### 38. Límites

`SHELL-NORM-009` no:

- crea físicamente `@vento/data-normalization`;
- crea `package.json`;
- crea archivos `.ts`, `.tsx`, `.js` o `.mjs`;
- crea fixtures físicos;
- crea tests ejecutables;
- selecciona framework de pruebas;
- define rutas de archivos fuente;
- define exports físicos;
- instala dependencias;
- ejecuta npm tests del package inexistente;
- ejecuta pruebas de consumidores;
- ejecuta pruebas de base de datos;
- crea tablas;
- crea columnas;
- crea índices;
- crea constraints;
- crea funciones SQL;
- crea RPC;
- crea triggers;
- modifica RLS;
- ejecuta DDL;
- ejecuta DML;
- ejecuta backfills;
- modifica datos;
- ejecuta replay contra producción;
- crea auditoría persistida;
- crea idempotency store;
- activa reglas;
- activa transliteración;
- activa similitud;
- agrega conectores;
- agrega excepciones;
- agrega entradas de diccionario;
- crea aliases;
- cambia ranking;
- decide identidad;
- activa unicidad;
- fusiona registros;
- selecciona sobrevivientes;
- migra consumidores;
- modifica VITAL;
- modifica Supabase;
- redefine `DATA-NORM-ARC-001..012`;
- desarrolla `SHELL-DB-001`.

---

#### 39. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas

##### TAREA ACTUAL APROBADA

SHELL-NORM-009 — Probar idempotencia y conservación semántica

##### SIGUIENTE TAREA RESERVADA

SHELL-DB-001 — Crear @vento/supabase


Regla:

`@vento/data-normalization`
→ contiene funciones puras, tipos, diccionarios y validadores compartidos

BLOQUE R
→ implementa únicamente persistencia, backfills, funciones SQL,
  constraints, índices y triggers defensivos
