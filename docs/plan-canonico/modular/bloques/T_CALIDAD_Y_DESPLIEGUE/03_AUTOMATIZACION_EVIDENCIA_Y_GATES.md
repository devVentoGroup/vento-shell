### MINI-BLOQUE — AUTOMATIZACION EVIDENCIA Y GATES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **automatizacion evidencia y gates** dentro de **T CALIDAD Y DESPLIEGUE**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-CI-016` a `SHELL-CI-019` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-CI-016`: Estandarizar un comando de pruebas automatizadas por repositorio
- `SHELL-CI-017`: Crear verificador automático del Registro Canónico de Requisitos de Prueba
- `SHELL-CI-018`: Bloquear merge o despliegue cuando fallen pruebas obligatorias
- `SHELL-CI-019`: Publicar evidencia de pruebas por paquete y repositorio
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-CI-016 — Estandarizar un comando de pruebas automatizadas por repositorio

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-015 — Evitar despliegue simultáneo obligatorio
**Tarea siguiente:** SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba
**Tipo de tarea:** Habilitador global único — contrato documental de interfaz homogénea de pruebas automatizadas por repositorio
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/03_AUTOMATIZACION_EVIDENCIA_Y_GATES.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada la interfaz única con la que cualquier automatización transversal de Vento OS deberá solicitar las **pruebas automatizadas propias de un repositorio**, sin conocer el nombre del runner, la tarea histórica que creó la suite, la tecnología de la aplicación ni los scripts internos que el repositorio utilice para organizarla.

La interfaz pública obligatoria queda:

```text
npm test
```

La regla vinculante es:

```text
REPOSITORIO IDENTIFICADO
+ MANIFEST VIGENTE
+ ENTRYPOINT RAÍZ `test`
+ SUITES OBLIGATORIAS RESUELTAS
+ EJECUCIÓN NO INTERACTIVA
+ AL MENOS UNA PRUEBA OBLIGATORIA EJECUTADA
+ CERO FALLOS OBLIGATORIOS
+ CERO OMISIONES OBLIGATORIAS
+ CÓDIGO DE SALIDA COHERENTE
+ ENTORNO AISLADO Y SIN MUTACIONES REMOTAS
= `npm test` VÁLIDO PARA CONSUMO AUTOMATIZADO
```

Y, de forma fail-closed:

```text
SCRIPT AUSENTE
O SCRIPT VACÍO
O COMANDO QUE NO EJECUTA PRUEBAS
O CERO PRUEBAS OBLIGATORIAS
O FALLO OCULTO
O WATCH MODE
O PROMPT INTERACTIVO
O SUITE OBLIGATORIA OMITIDA
O RESULTADO DE OTRO REPOSITORIO O COMMIT
O MUTACIÓN REMOTA
≠ COMANDO DE PRUEBAS ESTANDARIZADO
```

CI016 estandariza **cómo se invocan** las pruebas automatizadas de cada repositorio. No redefine qué comportamiento funcional debe probar cada aplicación, no reemplaza las suites especializadas de CI001 o CI007..CI013, no bloquea merge o despliegue por sí sola y no publica la evidencia final de CI019.

#### 2. Resultado canónico

`SHELL-CI-016` establece un único habilitador reutilizable para:

1. fijar `npm test` como interfaz pública raíz de pruebas automatizadas en los repositorios Vento OS gobernados;
2. permitir que cada repositorio conserve runners, suites y aliases internos diferentes detrás de esa interfaz;
3. impedir que CI018, CI019 o gates posteriores dependan de nombres históricos como `test:ci007` o `test:ci013`;
4. exigir ejecución no interactiva y reproducible desde la raíz del repositorio;
5. exigir que el comando ejecute realmente las suites obligatorias aplicables;
6. impedir falsos verdes por cero tests, filtros, suites ausentes, errores ignorados o códigos de salida normalizados artificialmente;
7. conservar semántica de fallo mediante código de salida distinto de cero;
8. distinguir suites obligatorias de comprobaciones condicionales realmente no aplicables;
9. soportar repositorios Next.js y ANIMA React Native/Expo sin obligarlos a usar el mismo runner interno;
10. soportar `vento-shell` como repositorio raíz con npm workspaces sin confundir pruebas del repositorio con la autoridad específica de CI001 sobre packages;
11. mantener separados `test`, `lint`, `typecheck` y `build` o `export`;
12. impedir que la normalización introduzca mutaciones de Supabase, despliegues, PR, merge, releases o cambios productivos;
13. conservar una descripción machine-readable de la ejecución para que CI019 pueda publicar evidencia sin reinterpretar el resultado;
14. invalidar una certificación cuando cambia el manifest, la suite, el runner, el entorno o el commit;
15. producir una señal consumible por CI018 sin otorgar a CI016 autoridad de merge o despliegue;
16. autocertificar una sola vez `SHELL-CI-016::GLOBAL`;
17. permitir que repositorios futuros entren al estándar únicamente después de tener identidad y ownership canónicos;
18. no crear ni modificar requisitos de prueba porque la obligación empresarial ya existe en el registro canónico.

#### 3. Frontera de responsabilidad

| Responsabilidad                                                     | Propietario         |
| ------------------------------------------------------------------- | ------------------- |
| pruebas propias de packages compartidos                             | `SHELL-CI-001`      |
| build independiente de package                                      | `SHELL-CI-002`      |
| release inmutable                                                   | `SHELL-CI-003`      |
| changelog y release notes                                           | `SHELL-CI-004`      |
| compatibilidad package–consumidor                                   | `SHELL-CI-005`      |
| propuesta de actualización de consumidor                            | `SHELL-CI-006`      |
| líneas base y suites especializadas de consumidores                 | `SHELL-CI-007..013` |
| rollback independiente                                              | `SHELL-CI-014`      |
| independencia de despliegue                                         | `SHELL-CI-015`      |
| interfaz raíz homogénea de pruebas                                  | `SHELL-CI-016`      |
| validación automática del Registro Canónico de Requisitos de Prueba | `SHELL-CI-017`      |
| decisión de bloqueo por pruebas obligatorias                        | `SHELL-CI-018`      |
| publicación y trazabilidad de evidencia                             | `SHELL-CI-019`      |
| ejecución por package, cutover, hypercare y cierre                  | `SHELL-CI-020..024` |

CI016 no absorbe la cobertura funcional de las suites. Una prueba puede seguir perteneciendo a CI007, CI013, CI001 o a otro owner; CI016 únicamente exige que el repositorio exponga una fachada estable capaz de ejecutar el conjunto obligatorio que le corresponda.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-016`.

```text
MARCADOR CANÓNICO
SHELL-CI-016
→ define una sola vez la interfaz y su semántica

INSTANCIA FÍSICA FUTURA
SHELL-CI-016::GLOBAL
→ materializa y autocertifica una sola vez el estándar

REPOSITORIOS Y GATES POSTERIORES
→ reutilizan `npm test`
→ no vuelven a implementar CI016
```

La futura instancia deberá certificar el estándar contra los repositorios reales vigentes. La existencia de un script `test` antes de CI016 no equivale por sí sola a certificación.

#### 5. Comando público canónico

La interfaz pública obligatoria es exactamente:

```text
npm test
```

Reglas:

1. se invoca desde la raíz del repositorio;
2. no requiere argumentos adicionales para ejecutar la suite obligatoria predeterminada;
3. no requiere conocer un identificador de tarea histórica;
4. no requiere seleccionar manualmente un runner;
5. puede delegar internamente a uno o más scripts del manifest;
6. puede delegar a Node Test Runner u otra herramienta aprobada por el repositorio;
7. el nombre público permanece estable aunque cambie la implementación interna;
8. un script especializado como `test:ci007` puede conservarse, pero no sustituye la fachada pública para consumidores transversales;
9. `npm run test:ci007`, `npm run test:ci013` u otros aliases históricos no podrán convertirse en dependencias obligatorias de CI018 o CI019;
10. la ejecución predeterminada no puede entrar en modo watch ni abrir una interfaz interactiva.

#### 6. Contrato mínimo del entrypoint `test`

El manifest raíz deberá declarar una entrada `scripts.test`:

- presente;
- no vacía;
- resoluble;
- no recursiva;
- no interactiva;
- compatible con el runtime aprobado del repositorio;
- capaz de propagar el código de salida de las pruebas;
- incapaz de transformar un fallo requerido en éxito;
- incapaz de terminar con éxito sin ejecutar las suites obligatorias;
- independiente de una terminal específica;
- libre de rutas locales de una estación de trabajo;
- libre de credenciales embebidas.

Un alias que únicamente imprime un mensaje, ejecuta `echo`, devuelve éxito constante o delega a un script inexistente no satisface CI016.

#### 7. Universo inicial gobernado

La certificación inicial de CI016 cubre exactamente estos ocho repositorios ya gobernados por el BLOQUE T:

1. `devVentoGroup/vento-shell`;
2. `devVentoGroup/vento-nexo`;
3. `devVentoGroup/vento-fogo`;
4. `devVentoGroup/vento-origo`;
5. `devVentoGroup/vento-pulso`;
6. `devVentoGroup/vento-viso`;
7. `devVentoGroup/vento-numera`;
8. `devVentoGroup/vento-anima`.

La incorporación posterior de otro repositorio requiere identidad y ownership canónicos. No entra al estándar por semejanza de nombre ni por existir bajo la organización.

#### 8. Línea base física observada

La lectura remota vigente de los manifests raíz produce:

| Repositorio                  | `scripts.test` observado | Delegación observada | Estado de interfaz antes de CI016          |
| ---------------------------- | ------------------------ | -------------------- | ------------------------------------------ |
| `devVentoGroup/vento-shell`  | ausente                  | —                    | interfaz raíz ausente                      |
| `devVentoGroup/vento-nexo`   | presente                 | `test:ci007`         | presente, pendiente de certificación CI016 |
| `devVentoGroup/vento-fogo`   | presente                 | `test:ci008`         | presente, pendiente de certificación CI016 |
| `devVentoGroup/vento-origo`  | presente                 | `test:ci009`         | presente, pendiente de certificación CI016 |
| `devVentoGroup/vento-pulso`  | presente                 | `test:ci010`         | presente, pendiente de certificación CI016 |
| `devVentoGroup/vento-viso`   | presente                 | `test:ci011`         | presente, pendiente de certificación CI016 |
| `devVentoGroup/vento-numera` | presente                 | `test:ci012`         | presente, pendiente de certificación CI016 |
| `devVentoGroup/vento-anima`  | presente                 | `test:ci013`         | presente, pendiente de certificación CI016 |

Conciliación:

- repositorios gobernados: **8**;
- repositorios que ya exponen `scripts.test`: **7/8**;
- repositorios sin `scripts.test`: **1/8**, `devVentoGroup/vento-shell`;
- aliases especializados existentes detrás de `test`: **7**;
- los siete aliases observados ejecutan Node Test Runner sobre las suites materializadas por CI007..CI013;
- `vento-shell` ya contiene múltiples suites automatizadas y comandos especializados, pero su manifest raíz no expone `scripts.test`.

Esta línea base no autoriza modificar manifests durante el marcador documental.

#### 9. Presencia no equivale a conformidad

CI016 distingue:

```text
SCRIPT `test` PRESENTE
≠
COMANDO ESTANDARIZADO CERTIFICADO
```

La futura instancia debe evaluar también:

- suites obligatorias realmente alcanzadas;
- número de pruebas ejecutadas;
- código de salida;
- ausencia de filtros silenciosos;
- ausencia de watch mode;
- ausencia de prompts;
- entorno utilizado;
- efectos laterales;
- frescura frente al commit y manifest.

Por tanto, los siete repositorios con `scripts.test` observado no se declaran físicamente conformes hasta completar `SHELL-CI-016::GLOBAL`.

#### 10. Directorio de ejecución

La raíz del repositorio es la única base de resolución del comando público.

El estándar no permite que un gate transversal necesite conocer:

- una subcarpeta interna;
- una ubicación particular de tests;
- una ruta absoluta;
- el nombre de un archivo de runner;
- el número de la tarea que creó la suite.

La delegación interna puede cambiar mientras `npm test` conserve el contrato.

#### 11. Suites obligatorias

Cada repositorio deberá resolver un conjunto explícito de suites obligatorias aplicables al snapshot evaluado.

Ese conjunto puede incluir:

- pruebas unitarias;
- pruebas contractuales;
- pruebas negativas o adversariales;
- regresiones;
- pruebas de autorización;
- pruebas de serialización;
- pruebas de integración local;
- autocertificaciones de gates;
- pruebas de comportamiento específicas del repositorio.

CI016 no inventa suites nuevas para sustituir las aprobadas. El conjunto se deriva de contratos propietarios y habilitadores ya materializados.

Un `PASS` requiere que todas las suites obligatorias resolubles por la fachada hayan sido consideradas.

#### 12. Separación entre pruebas y otros controles

`npm test` no sustituye:

```text
instalación bloqueada
lint
typecheck
build o export
matriz de compatibilidad
rollback
```

Cada control conserva su comando y owner.

CI018 podrá combinar varios controles en una puerta compuesta, pero CI016 solo normaliza la interfaz de pruebas automatizadas.

No es válido convertir `npm test` en un alias a `npm run build`, `npm run lint` o `npm run typecheck` y declarar que existen pruebas.

#### 13. Semántica de éxito

`npm test` solo puede finalizar con éxito cuando:

```text
required_suites > 0
AND executed_required_suites = required_suites
AND executed_required_tests > 0
AND failed_required_tests = 0
AND unresolved_required_skips = 0
AND runner_error = false
AND timed_out = false
```

El resultado de la fachada no puede quedar verde cuando una suite requerida no fue encontrada.

Una comprobación condicional puede quedar no aplicable únicamente si el contrato propietario permite esa clasificación y existe una razón verificable.

#### 14. Semántica de código de salida

La interfaz debe conservar:

- código `0`: ejecución completa satisfactoria;
- código distinto de `0`: fallo de prueba, suite obligatoria ausente, error de carga, error del runner, timeout o cualquier condición que impida certificar.

CI016 no obliga a todos los runners a usar la misma numeración para errores internos. La única frontera transversal obligatoria es:

```text
0 = PASS ELEGIBLE
NO CERO = NO PASS
```

Un wrapper no puede capturar un código de fallo y devolver `0`.

#### 15. Prohibición de cero tests

Cero pruebas obligatorias ejecutadas no es `PASS`.

Quedan bloqueados:

- runner sin archivos;
- patrón que no encuentra tests;
- filtro que excluye todos los casos;
- suite deshabilitada;
- import fallido que el runner degrada a vacío;
- comando que solo comprueba que el runner puede iniciar;
- autocertificación del wrapper que omite las pruebas que debía despachar.

La futura implementación deberá disponer de un oráculo para detectar este falso verde.

#### 16. Aliases especializados existentes

Los aliases actuales de CI007..CI013 son compatibles con CI016 como implementación interna.

La relación válida es:

```text
npm test
→ alias especializado interno
→ runner
→ suite obligatoria
```

No se exige renombrar los aliases históricos correctos.

Tampoco se exige eliminar comandos como:

- `test:ci007`;
- `test:ci008`;
- `test:ci009`;
- `test:ci010`;
- `test:ci011`;
- `test:ci012`;
- `test:ci013`.

Su estabilidad pública deja de ser necesaria para gates transversales porque la fachada estable es `npm test`.

#### 17. `vento-shell` como workspace

`devVentoGroup/vento-shell` requiere tratamiento explícito porque:

- es el repositorio propietario del BLOQUE T;
- su manifest raíz usa npm workspaces;
- contiene múltiples suites documentales y de calidad;
- contiene habilitadores de packages y CI;
- actualmente no expone `scripts.test`.

La futura `SHELL-CI-016::GLOBAL` deberá materializar en la raíz una fachada que ejecute el conjunto de pruebas automatizadas obligatorio del repositorio sin reducir su cobertura a la autocertificación de CI016.

Un `PASS` del `npm test` raíz de SHELL no sustituye la evidencia especializada de CI001, CI005, CI014, CI015 ni otros gates cuando estos sean exigidos de forma independiente.

#### 18. Repositorios web

NEXO, FOGO, ORIGO, PULSO, VISO y NUMERA ya exponen `npm test` mediante sus aliases de línea base.

CI016 deberá comprobar que:

1. el alias existe en el mismo manifest observado;
2. la cadena de delegación termina en una suite real;
3. el runner propaga fallos;
4. la suite ejecuta casos obligatorios;
5. cero tests no produce éxito;
6. no se requiere una mutación de aplicación o infraestructura para probar;
7. el resultado pertenece al commit actual;
8. las suites especializadas aprobadas siguen siendo alcanzables.

La normalización no exige que los seis repositorios web tengan exactamente los mismos tests.

#### 19. ANIMA

ANIMA conserva su stack React Native/Expo.

Su `npm test` podrá utilizar un runner headless y no deberá exigir:

- abrir Metro en modo interactivo;
- iniciar un emulador;
- conectar un dispositivo físico;
- publicar una build;
- ejecutar Expo Web como sustituto de pruebas nativas.

Los builds o bundles específicos permanecen fuera de CI016.

La interfaz pública es igual; la tecnología interna no.

#### 20. Entorno y aislamiento

La ejecución estandarizada debe ser apta para local aislado y CI.

Queda prohibido que el comando predeterminado:

- requiera producción;
- use datos productivos;
- dependa de secretos reales no entregados por un entorno de prueba autorizado;
- modifique recursos remotos;
- use una cuenta humana interactiva;
- dependa de estado mutable de otra estación.

Si una suite necesita infraestructura, deberá utilizar fixtures, dobles o un entorno de prueba explícitamente aprobado por su owner.

#### 21. Supabase y efectos laterales

`npm test` no autoriza mutaciones de Supabase.

Durante la autocertificación de CI016 quedan fuera:

- migraciones;
- schema;
- RLS;
- RPC;
- triggers;
- grants;
- Storage;
- Realtime;
- Edge Functions;
- datos;
- configuración remota;
- secretos.

Toda modificación Vento de Supabase continúa originándose, versionándose, documentándose y ejecutándose desde `devVentoGroup/vento-shell` bajo su tarea propietaria.

Una suite que requiera mutación remota no puede ocultarla detrás de `npm test`.

#### 22. No interactividad

La ejecución debe finalizar sin intervención humana.

No se consideran válidos como comportamiento predeterminado:

- watch mode;
- selección interactiva de tests;
- confirmaciones;
- menú de dispositivo;
- prompt de navegador;
- autenticación manual;
- espera indefinida por input.

Un modo interactivo puede existir como herramienta de desarrollo adicional, pero no como implementación de la fachada canónica.

#### 23. Determinismo

Sobre el mismo snapshot lógico y las mismas entradas controladas:

- se resuelven las mismas suites obligatorias;
- la clasificación de aplicabilidad es la misma;
- el resultado funcional no depende del orden accidental del filesystem;
- la selección de tests no depende de la hora;
- no se generan snapshots nuevos automáticamente para forzar verde;
- los reintentos no borran el fallo previo.

La evidencia publicada más adelante por CI019 deberá poder distinguir una nueva ejecución de una reutilización inválida.

#### 24. Timeout, cancelación y error del runner

CI016 conserva semántica fail-closed:

- timeout → no `PASS`;
- cancelación → no `PASS`;
- excepción del runner → no `PASS`;
- módulo de test que no carga → no `PASS`;
- fixture requerido ausente → no `PASS`.

El wrapper no normaliza estas condiciones a éxito.

#### 25. Unidad de certificación

Cada certificación futura de la interfaz se atribuirá, como mínimo, a:

```text
repository
source_commit
manifest_identity
lockfile_identity
runtime_identity
test_command
test_command_identity
runner_identity
required_suite_set_identity
test_configuration_identity
fixture_set_identity
environment_identity
execution_identity
started_at
completed_at
exit_code
executed_required_suites
executed_required_tests
failed_required_tests
unresolved_required_skips
result
invalidation_reason
```

Cambiar una entrada material invalida la reutilización de la certificación.

#### 26. Estados del habilitador

La capa de certificación podrá utilizar:

```text
PENDING
RUNNING
PASS
FAIL
BLOCKED
CANCELLED
TIMED_OUT
STALE
```

`NOT_APPLICABLE` solo se admite para comprobaciones condicionales internas, no para la obligación universal de exponer el comando.

El repositorio completo solo queda conforme con `PASS`.

#### 27. Relación con CI001 y CI007..CI013

CI016 consume, sin reabrir:

- la existencia de pruebas propias de packages definida por CI001;
- las suites de línea base de NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA y ANIMA materializadas por CI007..CI013.

CI016 no sustituye sus oráculos.

La estandarización permite que un consumidor transversal deje de codificar:

```text
si NEXO → test:ci007
si FOGO → test:ci008
si ANIMA → test:ci013
```

y utilice únicamente:

```text
npm test
```

#### 28. Relación con CI015

CI015 demuestra que un despliegue no necesita simultaneidad obligatoria.

CI016 aporta una interfaz homogénea para ejecutar pruebas antes o durante la evaluación de una unidad, pero:

- no decide compatibilidad;
- no decide el orden de despliegue;
- no ejecuta deploy;
- no ejecuta rollback.

Un `PASS` de `npm test` es una evidencia de prueba, no una certificación de independencia.

#### 29. Handoff a CI017

CI016 no valida la integridad global del Registro Canónico de Requisitos de Prueba.

Entrega a CI017 una frontera limpia:

```text
REPOSITORIOS
→ ya tienen interfaz uniforme de pruebas

CI017
→ valida estructura, relaciones, estados y consistencia del registro
```

CI017 no deberá modificar la semántica de `npm test`.

#### 30. Handoff a CI018

CI018 podrá exigir:

```text
npm test
```

sin ramificar por repositorio.

CI018 seguirá siendo responsable de:

- decidir cuándo el fallo bloquea merge;
- decidir cuándo el fallo bloquea despliegue;
- combinar pruebas con lint, typecheck, build, compatibilidad y otros gates;
- impedir bypass de checks obligatorios.

CI016 solo garantiza que la llamada a pruebas sea uniforme y fail-closed.

#### 31. Handoff a CI019

CI019 podrá registrar, como mínimo:

- repositorio;
- commit;
- manifest;
- comando `npm test`;
- identidad del runner;
- suites;
- número de tests;
- duración;
- código de salida;
- resultado;
- invalidación.

CI016 no publica por sí sola el expediente final de evidencia.

#### 32. Relación con `SHELL-CI-020..024`

Las instancias posteriores por package podrán invocar `npm test` en cada repositorio aplicable sin conocer sus aliases internos.

La existencia del estándar no convierte una suite genérica en sustituto de:

- compatibilidad CI005;
- línea base específica;
- rollback CI014;
- independencia CI015;
- gates de readiness;
- cutover;
- hypercare.

#### 33. Casos positivos obligatorios

La futura `SHELL-CI-016::GLOBAL` deberá demostrar, como mínimo, estos diez escenarios:

1. repositorio web con `npm test` que delega a un alias especializado y ejecuta pruebas reales;
2. otro repositorio web con alias distinto y la misma interfaz pública;
3. ANIMA ejecutando su suite headless mediante la misma interfaz;
4. SHELL ejecutando desde la raíz más de una suite obligatoria mediante una sola fachada;
5. un runner interno cambiado sin modificar el comando público;
6. una suite condicional realmente no aplicable sin omitir ninguna suite universal;
7. dos ejecuciones del mismo snapshot resolviendo el mismo conjunto obligatorio;
8. fallo corregido que genera una nueva ejecución sin borrar el intento anterior;
9. suite con múltiples archivos que propaga correctamente el resultado agregado;
10. resultado consumible por una capa posterior sin conocer el runner interno.

#### 34. Casos negativos obligatorios

La futura instancia deberá bloquear, como mínimo, estos veinte escenarios:

1. manifest sin `scripts.test`;
2. `scripts.test` vacío;
3. alias interno inexistente;
4. recursión `test` → `test`;
5. comando que termina en éxito sin ejecutar tests;
6. cero pruebas obligatorias;
7. filtro que excluye todas las pruebas requeridas;
8. fallo requerido convertido en código `0`;
9. uso de `|| true`, equivalente lógico o wrapper que neutraliza el fallo;
10. watch mode como comportamiento predeterminado;
11. prompt interactivo;
12. timeout;
13. error de carga del runner;
14. fixture obligatorio ausente;
15. suite obligatoria omitida;
16. skip obligatorio no resuelto;
17. ejecución atribuida a otro commit;
18. ejecución atribuida a otro repositorio;
19. entorno productivo o mutación remota requerida por la suite;
20. secreto o credencial real incluido en configuración o evidencia de prueba.

#### 35. Regresiones obligatorias

El harness deberá conservar protección contra estas quince regresiones:

1. volver a exigir `test:ci007` desde un gate transversal;
2. volver a exigir `test:ci013` desde un gate transversal;
3. confundir build verde con pruebas verdes;
4. confundir lint verde con pruebas verdes;
5. permitir `npm test` con cero tests;
6. aceptar script `test` porque existe sin ejecutarlo;
7. perder una suite obligatoria al cambiar de runner;
8. introducir watch mode en CI;
9. añadir un prompt que cuelga la automatización;
10. normalizar un fallo a exit `0`;
11. usar evidencia de otro commit;
12. exigir Expo Web para certificar ANIMA nativa;
13. ejecutar una mutación Supabase desde una prueba de consumidor;
14. reducir el `npm test` de SHELL a la autocertificación del propio CI016;
15. introducir rutas absolutas o dependencias de una estación local en la fachada.

La cobertura contractual mínima futura comprende **45 escenarios**: 10 positivos, 20 negativos y 15 regresiones.

#### 36. Materialización futura de `SHELL-CI-016::GLOBAL`

La instancia global podrá declararse materializada únicamente cuando:

1. los ocho repositorios sean auditados contra su manifest real;
2. `npm test` exista en los ocho;
3. la interfaz sea invocable desde la raíz;
4. ningún repositorio requiera argumentos adicionales obligatorios;
5. los aliases especializados correctos puedan conservarse detrás de la fachada;
6. SHELL disponga de una fachada raíz que no reduzca cobertura;
7. se certifique al menos una prueba obligatoria ejecutada por repositorio;
8. se pruebe la propagación de fallos;
9. se pruebe el bloqueo con cero tests;
10. se pruebe el bloqueo con suite ausente;
11. se pruebe no interactividad;
12. se pruebe timeout fail-closed;
13. se pruebe aislamiento;
14. se pruebe ausencia de mutaciones remotas;
15. se pruebe ausencia de secretos reales;
16. se cubran los 45 escenarios contractuales mínimos;
17. se produzca evidencia machine-readable de autocertificación;
18. los cambios físicos se limiten a los repositorios y archivos expresamente autorizados;
19. no se modifiquen dependencias por la sola estandarización si no son necesarias;
20. no se modifique Supabase;
21. no se cree auto-merge;
22. no se cree auto-deploy;
23. no se desarrollen CI017..CI019 por anticipado;
24. la implementación y su commit sean reproducibles.

Los nombres concretos de scripts auxiliares, adapters o archivos de autocertificación se resolverán contra los checkouts vigentes durante la instancia física.

#### 37. Estado documental conciliado

| Métrica                                                              |                     Resultado |
| -------------------------------------------------------------------- | ----------------------------: |
| Topología CI016                                                      |        **GLOBAL_ENABLE_ONCE** |
| Instancias físicas globales CI001..CI015 verificadas en el iniciador |                        **15** |
| Repositorios iniciales gobernados por CI016                          |                         **8** |
| Repositorios con `scripts.test` observado                            |                       **7/8** |
| Repositorios sin `scripts.test` observado                            |                       **1/8** |
| Repositorio sin interfaz raíz observada                              | **devVentoGroup/vento-shell** |
| Aliases especializados `test:ci007..013` observados                  |                         **7** |
| Comando público canónico                                             |                **`npm test`** |
| Casos positivos mínimos futuros                                      |                        **10** |
| Casos negativos mínimos futuros                                      |                        **20** |
| Regresiones mínimas futuras                                          |                        **15** |
| Escenarios contractuales mínimos futuros                             |                        **45** |
| Cambios físicos autorizados durante el marcador                      |                         **0** |
| Cambios Supabase autorizados durante el marcador                     |                         **0** |
| Requisitos de prueba creados o modificados                           |                         **0** |

#### 38. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** la obligación empresarial de que cada repositorio exponga comandos reproducibles y no ambiguos para sus pruebas automatizadas ya existe en el Registro Canónico de Requisitos de Prueba y ya asigna responsabilidad a CI016. Esta tarea concreta la interfaz técnica `npm test`, sus invariantes y su futura autocertificación sin crear una obligación empresarial adicional ni modificar requisitos históricos.

#### 39. Cobertura de prueba vigente reutilizada

Sin modificar el registro, CI016 reutiliza:

- `TREQ-SHELL-004`, que exige pruebas aplicables antes de retiros de código;
- `TREQ-SHELL-005`, que exige comandos reproducibles y no ambiguos para pruebas automatizadas y asigna responsabilidad a CI016;
- `TREQ-SHELL-006`, que exige pruebas propias y compatibilidad antes de publicar o adoptar packages;
- `TREQ-SHELL-008`, que exige trazabilidad y resultados reproducibles;
- `TREQ-SHELL-009`, que exige identidad verificable de repositorio, commit y ambiente;
- `TREQ-SHELL-044`, que vincula CI016 con controles de namespaces de autorización/contexto.

Estas referencias documentan cobertura vigente y no modifican 04A.

#### 40. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                             |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no implementa ni ejecuta la fachada de pruebas.                                                                                                                                                                                                                                                                                                                                |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado contra el checkout local del usuario.                                                                                                                                                                                                                                                                                                         |
| REMOTA    | PASS           | Se verificaron protocolo, contrato de entrega, manifest, ruta, secuencia activa, topología, políticas de formato y desarrollo, archivo propietario, registro 04A aplicable, manifests raíz de los ocho repositorios, la implementación física previa de CI007 y el registro VERIFIED de CI015. La auditoría confirma siete `scripts.test` existentes y ausencia del entrypoint raíz en `vento-shell`. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron pruebas, builds, merge, deploy, releases, rollback ni mutaciones de infraestructura.                                                                                                                                                                                                                                                                                                 |
| FÍSICA    | NOT_APPLICABLE | La materialización corresponde a la futura `SHELL-CI-016::GLOBAL` después de aprobación documental y autorización física separada.                                                                                                                                                                                                                                                                    |

#### 41. Criterios de aceptación

`SHELL-CI-016` queda documentalmente completa cuando:

- fija exactamente `npm test` como interfaz pública transversal;
- conserva runners y aliases internos específicos por repositorio;
- no exige a CI018 o CI019 conocer aliases históricos;
- exige ejecución desde la raíz;
- no requiere argumentos adicionales;
- exige al menos una prueba obligatoria ejecutada;
- bloquea cero tests;
- bloquea suites obligatorias omitidas;
- propaga fallos mediante código distinto de cero;
- prohíbe neutralización de fallos;
- prohíbe watch mode y prompts en la ruta canónica;
- separa test de lint, typecheck y build;
- cubre SHELL como workspace;
- cubre NEXO, FOGO, ORIGO, PULSO, VISO y NUMERA como repositorios web;
- cubre ANIMA sin convertirla en aplicación web;
- exige aislamiento de entorno;
- prohíbe mutaciones remotas;
- mantiene Supabase bajo su owner;
- define invalidación por cambios materiales;
- entrega a CI017 una frontera sin solapamiento;
- entrega a CI018 una interfaz uniforme de ejecución;
- entrega a CI019 datos normalizados para evidencia;
- define casos positivos, negativos y regresiones;
- no desarrolla CI017..CI019;
- no ejecuta CI020..024;
- no crea ni modifica requisitos de prueba.

#### 42. Límites

Esta tarea no:

- implementa `SHELL-CI-016::GLOBAL`;
- modifica manifests durante el marcador;
- modifica package-locks;
- instala runners;
- cambia dependencias;
- elimina aliases históricos correctos;
- redefine las suites de CI001;
- redefine las suites de CI007..CI013;
- ejecuta pruebas reales;
- ejecuta lint;
- ejecuta typecheck;
- ejecuta build;
- crea workflows;
- configura branch protection;
- bloquea merge;
- bloquea deploy;
- publica evidencia definitiva;
- crea releases;
- crea tags;
- abre pull requests;
- fusiona pull requests;
- despliega;
- ejecuta rollback;
- crea migraciones;
- ejecuta migraciones;
- modifica schema;
- modifica RLS;
- modifica RPC;
- modifica triggers;
- modifica grants;
- modifica Storage;
- modifica Realtime;
- modifica Edge Functions;
- modifica datos;
- modifica secretos;
- modifica configuración productiva;
- crea, modifica, difiere, descarta ni vuelve obsoletos requisitos 04A.

#### 43. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-015 — Evitar despliegue simultáneo obligatorio`

**TAREA ACTUAL APROBADA**
`SHELL-CI-016 — Estandarizar un comando de pruebas automatizadas por repositorio`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba`


### ✅ SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-016 — Estandarizar un comando de pruebas automatizadas por repositorio
**Tarea siguiente:** SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias
**Tipo de tarea:** Habilitador global único — contrato documental de verificador automático de integridad del Registro Canónico de Requisitos de Prueba
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/03_AUTOMATIZACION_EVIDENCIA_Y_GATES.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el verificador automático que certificará la **integridad estructural, referencial, semántica e histórica** del Registro Canónico de Requisitos de Prueba antes de que tareas posteriores utilicen sus filas para bloquear merge o despliegue y para publicar evidencia.

La interfaz pública canónica ya existente permanece:

```text
npm run docs:treq:check
```

La regla vinculante es:

```text
FUENTE MODULAR 04A RESUELTA DESDE manifest.json
+ FRAGMENTOS ESPERADOS Y ORDENADOS
+ IDENTIFICADORES ÚNICOS Y SECUENCIALES
+ CATORCE COLUMNAS CANÓNICAS
+ DOMINIOS, ESTADOS Y TIPOS PERMITIDOS
+ ORIGEN Y RESPONSABLES CANÓNICOS
+ RELACIONES TREQ RESOLUBLES
+ RESUMEN Y DISTRIBUCIÓN COHERENTES
+ EVIDENCIA SUFICIENTE PARA VERIFICADO
+ REANUDACIÓN DETERMINISTA PARA DIFERIDO
+ PRESERVACIÓN HISTÓRICA CONTRA LÍNEA BASE CUANDO APLIQUE
= REGISTRO ELEGIBLE PARA CONSUMO POR GATES POSTERIORES
```

Y, de forma fail-closed:

```text
FRAGMENTO FALTANTE O DUPLICADO
O FILA MAL FORMADA
O ID DUPLICADO
O SALTO DE SECUENCIA
O ESTADO INVÁLIDO
O RESPONSABLE INEXISTENTE
O RELACIÓN NO RESOLUBLE
O VERIFICADO SIN EVIDENCIA REPRODUCIBLE
O DIFERIDO SIN PUERTA Y MOMENTO DE REANUDACIÓN
O REQUISITO HISTÓRICO ELIMINADO
O RESUMEN INCOHERENTE
≠ REGISTRO VÁLIDO
```

CI017 valida el registro. No decide por sí sola si un fallo bloquea merge o despliegue y no publica el expediente final de evidencia.

#### 2. Resultado canónico

`SHELL-CI-017` establece un único habilitador reutilizable para:

1. conservar `docs:treq:check` como punto de entrada público del verificador;
2. consolidar el verificador existente en vez de crear un segundo sistema paralelo;
3. reconstruir el registro lógico exclusivamente desde la familia modular 04A registrada en `manifest.json`;
4. validar la presencia y el orden de todos los fragmentos canónicos;
5. validar exactamente las catorce columnas de cada tabla de dominio;
6. validar identificadores, dominio y secuencia;
7. detectar identificadores duplicados;
8. validar estados y tipos permitidos;
9. exigir `Origen` y `Tarea responsable` resolubles contra tareas canónicas;
10. validar relaciones `TREQ-*`, incluida prohibición de autorreferencia;
11. validar resumen, distribución y última tarea incorporada;
12. exigir evidencia reproducible antes de aceptar `VERIFICADO`;
13. exigir justificación, riesgo, tarea y momento o puerta de resolución para `DIFERIDO`;
14. impedir la eliminación silenciosa de requisitos históricos cuando exista una línea base comparable;
15. preservar `DESCARTADO` y `OBSOLETO` como historial en vez de eliminarlos;
16. diferenciar validación de reparación o reconciliación automática;
17. producir diagnóstico determinista y consumible por automatización;
18. exponer el resultado a CI018 sin asumir autoridad de bloqueo;
19. exponer datos verificables a CI019 sin publicar evidencia final;
20. autocertificar una sola vez `SHELL-CI-017::GLOBAL`;
21. no crear ni modificar requisitos de prueba porque la obligación ya existe en el propio registro.

#### 3. Estado físico auditado

La implementación actual ya contiene:

- `scripts/docs/validate-treq-registry.mjs`;
- `scripts/docs/validate-treq-registry.test.mjs`;
- `scripts/docs/treq-registry-files.mjs`;
- `scripts/docs/treq-safe-reconcile.mjs`;
- `scripts/docs/treq-safe-reconcile.test.mjs`;
- el script raíz `docs:treq:check`;
- el script raíz `docs:treq:test`;
- integración del registro dentro de `docs:plan:build`.

El verificador existente ya cubre, entre otros controles:

- encabezado principal y sección única de registro;
- dominios, estados y tipos declarados;
- catorce columnas;
- celdas no vacías;
- formato `TREQ-*`;
- dominio coherente con el identificador;
- unicidad;
- secuencia;
- estados permitidos;
- tipo y modalidad;
- existencia de tareas en `Origen` y `Tarea responsable`;
- relaciones resolubles;
- autorreferencias;
- lenguaje residual de propuesta;
- resumen vigente;
- distribución;
- última tarea que incorporó requisitos.

CI017 no descarta esa implementación. La convierte en el habilitador físicamente certificado y cierra las brechas restantes.

#### 4. Brechas que CI017 debe cerrar

La auditoría del código vigente identifica tres brechas materiales frente al contrato ya registrado:

1. `VERIFICADO` no tiene todavía una validación semántica específica que demuestre evidencia reproducible; hoy una celda no vacía puede superar la comprobación general.
2. `DIFERIDO` tiene una comprobación parcial de lenguaje de justificación o puerta, pero debe quedar cerrada la exigencia de tarea exacta y momento o condición verificable de reanudación.
3. la validación intrínseca del snapshot actual no compara por sí sola el conjunto de identificadores contra una línea base; por ello una eliminación histórica que deje el snapshot nuevamente coherente podría no ser detectada por ese chequeo aislado.

Estas brechas pertenecen a CI017. No se trasladan a CI018 ni CI019.

#### 5. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-017`.

```text
MARCADOR CANÓNICO
SHELL-CI-017
→ define una sola vez el contrato del verificador

INSTANCIA FÍSICA FUTURA
SHELL-CI-017::GLOBAL
→ endurece y autocertifica una sola vez el verificador existente

CONSUMIDORES POSTERIORES
→ reutilizan el mismo resultado
→ no vuelven a implementar CI017
```

La futura instancia no podrá iniciarse por inferencia durante este marcador documental.

#### 6. Autoridad física del registro

La fuente física canónica es exclusivamente la familia modular registrada por `manifest.json`.

En el estado vigente comprende:

```text
04A_00_CABECERA_Y_GOBIERNO_DEL_REGISTRO.md
04A_01_AUTH.md
04A_02_GAP.md
04A_03_PROC.md
04A_04_SHELL.md
04A_05_SUPABASE.md
04A_06_ANIMA.md
04A_07_AURA.md
04A_08_VISO.md
04A_09_NEXO.md
04A_10_FOGO.md
04A_11_ORIGO.md
04A_12_PULSO.md
04A_13_NUMERA.md
04A_14_DATA.md
04A_15_CONT.md
04A_16_PASS.md
04A_17_TALENTO.md
04A_18_INTEGRATION.md
04A_19_UX.md
04A_20_REGLAS_OBLIGATORIAS.md
```

Total vigente: **21 fragmentos**, formados por una cabecera, diecinueve dominios y un fragmento final de reglas obligatorias.

El archivo monolítico legacy no recupera autoridad por conveniencia de implementación.

#### 7. Reconstrucción lógica

El verificador deberá reconstruir una vista lógica completa en el orden de `manifest.json`.

Reglas:

1. no recorrer el filesystem para inferir orden;
2. no ordenar fragmentos alfabéticamente como sustituto del manifest;
3. no aceptar un fragmento 04A no registrado como parte de la fuente canónica;
4. no omitir silenciosamente un fragmento registrado;
5. no duplicar un dominio entre fragmentos;
6. no utilizar derivados bajo `.generated/` como fuente primaria;
7. la reconstrucción será determinista para el mismo conjunto de bytes canónicos.

#### 8. Integridad de fragmentos

La validación deberá detectar como mínimo:

- cabecera 04A ausente;
- dominio registrado ausente;
- reglas obligatorias ausentes;
- fragmento duplicado en la composición;
- dominio físico distinto del esperado;
- orden físico o lógico incompatible con `manifest.json`;
- fragmento no UTF-8;
- estructura que impida reconstruir el registro lógico.

La existencia de los archivos no equivale a integridad de sus tablas.

#### 9. Contrato de columnas

Cada fila de dominio conserva exactamente estas catorce columnas y este orden:

```text
ID
Dominio
Regla protegida
Origen
Riesgo / prioridad
Tipo / modalidad
Tarea responsable
Paquete
Repositorio / ambiente
Estado
Artefacto
Último resultado
Evidencia
Relación
```

Queda bloqueado:

- cualquier columna ausente;
- cualquier columna adicional;
- encabezado renombrado;
- orden distinto;
- fila con menos o más de catorce celdas;
- celda obligatoria vacía.

#### 10. Identificadores y dominios

Todo identificador deberá:

- cumplir `TREQ-DOMINIO-SECUENCIA`;
- usar un dominio declarado;
- coincidir con la columna `Dominio`;
- ser único globalmente;
- conservar mínimo tres dígitos;
- continuar sin truncamiento después de `999`;
- no reutilizar un identificador retirado para otro comportamiento.

La presentación con backticks puede normalizarse; la identidad lógica no.

#### 11. Secuencia por dominio

Dentro de cada dominio la secuencia es ascendente, continua y empieza en `001`.

Ejemplos válidos:

```text
TREQ-PROC-998
TREQ-PROC-999
TREQ-PROC-1000
TREQ-PROC-1001
```

Un salto, inversión o reutilización es error.

Añadir un requisito nuevo no permite renumerar requisitos históricos.

#### 12. Estados permitidos

Los únicos estados son:

```text
IDENTIFICADO
ESPECIFICADO
PLANIFICADO
IMPLEMENTADO
VERIFICADO
DIFERIDO
DESCARTADO
OBSOLETO
```

El verificador no inventa equivalencias ni normaliza un estado desconocido hacia uno permitido.

#### 13. Tipos y modalidad

`Tipo / modalidad` debe conservar dos componentes separados.

El componente de tipo deberá resolver al menos uno de los tipos declarados por la cabecera 04A.

El componente de modalidad deberá existir y no puede quedar vacío.

CI017 no convierte por inferencia una validación manual en automatizada ni una prueba automatizada en manual.

#### 14. Origen y tarea responsable

Cada requisito deberá conservar trazabilidad hacia tareas canónicas reales.

`Origen` y `Tarea responsable` deberán:

- contener al menos una tarea canónica resoluble cuando el contrato vigente así lo exige;
- rechazar identificadores de tareas inexistentes dentro de familias canónicas conocidas;
- aceptar referencias múltiples o rangos únicamente cuando sus extremos y miembros aplicables sean resolubles;
- no usar texto genérico como sustituto de ownership.

Un paquete pendiente no elimina la obligación de tener tarea propietaria.

#### 15. Relaciones TREQ

La columna `Relación` podrá expresar referencias individuales o rangos.

El verificador deberá:

- expandir rangos válidos;
- rechazar extremos invertidos;
- rechazar referencias inexistentes;
- rechazar autorreferencias;
- conservar cero relaciones no resolubles como condición de éxito global.

Una relación narrativa que contiene un identificador sigue estando sujeta a resolución.

#### 16. Resumen vigente

La cabecera deberá concordar con las filas reales.

Se verifican al menos:

- requisitos vigentes;
- dominios con requisitos;
- filas con catorce columnas;
- identificadores duplicados;
- relaciones no resolubles;
- última tarea incorporada;
- distribución por dominio.

Una cifra desactualizada bloquea la validación aunque las filas sean individualmente correctas.

#### 17. Distribución por dominio

Para cada dominio se valida:

```text
dominio
primer identificador
último identificador
cantidad
```

El orden debe coincidir con la lista de dominios de la cabecera.

Un dominio sin filas no puede presentarse con un rango inventado.

#### 18. Última tarea incorporada

La última tarea TREQ no se obtiene por una fecha manual ni por el último archivo editado.

Se deriva desde:

```text
continuity-route
+ inventario real de tareas
+ estado aprobado
+ sección de requisitos derivados realmente incorporados
```

Una tarea aprobada que declara cero requisitos no desplaza por sí sola la última tarea que sí incorporó TREQ.

#### 19. Contrato de `VERIFICADO`

Una fila en `VERIFICADO` solo será válida cuando exista evidencia reproducible.

Como mínimo deberán estar resueltos y no contener valores equivalentes a pendiente:

- `Repositorio / ambiente`;
- `Artefacto`;
- `Último resultado`;
- `Evidencia`.

Además:

- `Último resultado` debe representar una ejecución o decisión concluida;
- `Evidencia` debe contener una referencia reproducible al artefacto, ejecución, resultado, reporte o identidad que permita revisar el cierre;
- una afirmación genérica como “probado”, “correcto” o “listo” sin referencia reproducible no satisface el estado;
- un requisito no puede pasar a `VERIFICADO` únicamente porque la tarea propietaria esté aprobada.

La futura instancia deberá autocertificar falsos verdes de esta regla.

#### 20. Contrato de `DIFERIDO`

Una fila `DIFERIDO` deberá conservar explícitamente:

1. justificación;
2. riesgo aceptado o explicado;
3. tarea responsable exacta;
4. puerta, condición o evento de reanudación;
5. momento determinable de resolución mediante tarea, etapa, gate o condición canónica.

No basta con escribir “después”, “más adelante”, “pendiente” o “cuando corresponda”.

La reanudación debe poder ser interpretada por un revisor sin depender de memoria del chat.

#### 21. `DESCARTADO` y `OBSOLETO`

Estos estados no eliminan historial.

Para ambos:

- el identificador permanece;
- la fila permanece;
- la justificación permanece trazable;
- relaciones históricas no se borran para ocultar el requisito;
- el resumen continúa contabilizando la fila mientras el modelo vigente la considere parte del registro.

CI017 no reabre la decisión empresarial que llevó al descarte u obsolescencia.

#### 22. Preservación histórica

La protección contra eliminación silenciosa utiliza dos niveles:

```text
INTEGRIDAD DEL SNAPSHOT
→ valida que el registro actual sea internamente coherente

INTEGRIDAD HISTÓRICA
→ compara los identificadores actuales contra una línea base explícita
```

En integridad histórica:

- todo identificador presente en la línea base debe seguir existiendo;
- una fila nueva puede añadirse si respeta secuencia y reglas;
- una fila histórica puede evolucionar en campos permitidos sin ser eliminada;
- la desaparición de cualquier identificador base es error bloqueante.

La línea base nunca se inventa ni se infiere desde un archivo generado no confiable.

#### 23. Contrato de línea base

La implementación deberá aceptar una fuente base explícita cuando el caller solicite comprobación histórica.

La línea base puede provenir de un snapshot confiable o de una revisión Git resuelta por el caller, pero:

- el verificador recibe la fuente; no adivina ramas;
- no hace fetch remoto;
- no modifica Git;
- no escribe el registro;
- no considera un snapshot local ignorado como única autoridad para CI;
- una línea base ausente se reporta como no disponible para la comprobación histórica, no como `PASS` histórico.

CI018 podrá resolver posteriormente qué baseline de PR o merge debe utilizar.

#### 24. Separación entre verificar y reconciliar

`docs:treq:check` es fail-closed y de solo lectura.

No deberá:

- restaurar filas;
- corregir el resumen;
- normalizar estados;
- reescribir evidencia;
- distribuir fragmentos;
- aceptar automáticamente una recuperación.

La reconciliación preventiva de `docs:plan:build` continúa siendo una capacidad separada.

Una reconciliación automática nunca convierte por sí misma un registro entrante inválido en evidencia de que la entrega original era correcta.

#### 25. Relación con `docs:plan:build`

El build canónico puede:

- construir contexto;
- detectar inconsistencias;
- conservar snapshot válido;
- producir copia de recuperación;
- aplicar reconciliaciones seguras dentro de su contrato.

CI017 exige que el verificador independiente pueda diagnosticar el registro sin depender de que el build lo repare primero.

El resultado de `docs:treq:check` conserva significado propio.

#### 26. Declaraciones de TREQ afectados

CI017 deberá proporcionar una base de resolución para que una lista de requisitos declarados por package o PR pueda validarse contra el registro:

- cada identificador declarado debe existir;
- duplicados en la declaración deben detectarse;
- identificadores mal formados deben rechazarse;
- una lista vacía solo podrá aceptarse cuando el caller permita explícitamente cero requisitos afectados.

CI017 no decide si la declaración es obligatoria para un PR concreto. Esa política de bloqueo pertenece a CI018.

#### 27. Salida machine-readable

La futura implementación deberá poder producir una representación consumible por automatización con, como mínimo:

```text
result
requirements
domains
fragments
duplicates
unresolved_relations
invalid_rows
verified_evidence_errors
deferred_resolution_errors
historical_missing_ids
latest_task
distribution
errors
```

La salida humana y la machine-readable deben derivarse del mismo resultado lógico.

No puede existir un `PASS` humano y un `FAIL` machine-readable para el mismo snapshot.

#### 28. Taxonomía mínima de error

El verificador deberá distinguir al menos estas familias:

```text
SOURCE
FRAGMENT
SCHEMA
IDENTITY
SEQUENCE
DOMAIN
STATE
TYPE
TASK_REFERENCE
TREQ_RELATION
SUMMARY
DISTRIBUTION
VERIFIED_EVIDENCE
DEFERRED_RESOLUTION
HISTORICAL_RETENTION
LATEST_TASK
```

La implementación puede usar códigos internos más específicos, pero no debe reducir todos los fallos a un único mensaje genérico.

#### 29. Determinismo y fail-closed

Para los mismos bytes de entrada, contexto canónico y baseline:

- se obtiene el mismo conjunto de errores;
- el orden de errores es estable;
- los conteos son iguales;
- el resultado no depende de la hora;
- el resultado no depende del orden accidental del filesystem;
- un error de lectura no se convierte en `PASS`;
- un parseo incompleto no se convierte en registro vacío válido;
- una lectura truncada no equivale a ausencia de filas.

#### 30. Relación con CI016

CI016 ya dejó disponible una interfaz uniforme para ejecutar pruebas por repositorio.

CI017 no modifica:

```text
npm test
```

La relación es:

```text
CI016
→ garantiza cómo pedir pruebas del repositorio

CI017
→ garantiza que el catálogo canónico de obligaciones de prueba sea íntegro
```

Un `PASS` de `npm test` no valida por sí solo 04A.

#### 31. Handoff a CI018

CI018 recibirá de CI017:

- un comando de validación canónico;
- resultado fail-closed;
- diagnóstico estructurado;
- resolución de identificadores declarados;
- capacidad de comparación histórica cuando reciba baseline.

CI018 será responsable de:

- ejecutar el verificador en los puntos obligatorios;
- decidir cuándo el fallo bloquea merge;
- decidir cuándo el fallo bloquea despliegue;
- impedir bypass de checks obligatorios;
- resolver la baseline correspondiente al contexto de integración.

CI017 no configura branch protection ni workflows durante su marcador documental.

#### 32. Handoff a CI019

CI019 podrá publicar:

- identidad del registro;
- commit;
- resultado de `docs:treq:check`;
- conteos;
- errores;
- TREQ afectados;
- baseline utilizada cuando aplique;
- referencias de ejecución.

CI017 produce el resultado verificable; CI019 conserva y publica la evidencia.

#### 33. Relación con `SHELL-CI-020..024`

Las instancias por package deberán consumir un registro ya verificable.

CI017 no sustituye:

- readiness del package;
- ejecución de pruebas funcionales;
- compatibilidad;
- rollback;
- cutover;
- hypercare.

Su obligación es impedir que esos procesos operen sobre un registro TREQ estructural o históricamente inválido.

#### 34. Casos positivos obligatorios

La futura `SHELL-CI-017::GLOBAL` deberá demostrar, como mínimo, estos doce escenarios:

1. registro modular completo y coherente;
2. identificadores de cuatro dígitos;
3. múltiples dominios en el orden canónico;
4. relación individual resoluble;
5. rango TREQ resoluble;
6. tarea responsable canónica válida;
7. `VERIFICADO` con artefacto, resultado y evidencia reproducible;
8. `DIFERIDO` con justificación, riesgo, tarea y puerta de reanudación;
9. baseline histórica con todas las filas preservadas y filas nuevas válidas;
10. tarea aprobada con cero TREQ sin desplazar `Última tarea incorporada`;
11. declaración de TREQ afectados sin duplicados y completamente resoluble;
12. reconstrucción modular con salida humana y machine-readable equivalentes.

#### 35. Casos negativos obligatorios

La futura instancia deberá bloquear, como mínimo, estos veinticuatro escenarios:

1. fragmento registrado ausente;
2. dominio físico duplicado;
3. tabla con trece columnas;
4. tabla con quince columnas;
5. celda obligatoria vacía;
6. identificador mal formado;
7. dominio de fila distinto al identificador;
8. identificador duplicado;
9. salto de secuencia;
10. estado no permitido;
11. tipo no permitido;
12. modalidad ausente;
13. `Origen` sin tarea canónica;
14. `Tarea responsable` inexistente;
15. autorreferencia TREQ;
16. relación TREQ inexistente;
17. rango TREQ invertido o no resoluble;
18. resumen de requisitos desactualizado;
19. distribución incoherente;
20. última tarea TREQ incoherente;
21. `VERIFICADO` con artefacto pendiente;
22. `VERIFICADO` con evidencia genérica no reproducible;
23. `DIFERIDO` sin momento o puerta de reanudación;
24. identificador histórico ausente frente a baseline.

#### 36. Regresiones obligatorias

El harness deberá conservar protección contra estas doce regresiones:

1. volver a leer el monolito legacy como autoridad preferente;
2. depender del orden del filesystem en vez de `manifest.json`;
3. aceptar backticks como parte de la identidad lógica;
4. truncar secuencias al superar `999`;
5. considerar una tarea con cero TREQ como última tarea incorporada;
6. aceptar lenguaje de propuesta para una tarea ya aprobada;
7. reparar el registro durante `docs:treq:check`;
8. usar un snapshot ignorado como única baseline de CI;
9. convertir ausencia de baseline en `PASS` histórico;
10. permitir eliminación de una fila `DESCARTADO`;
11. permitir eliminación de una fila `OBSOLETO`;
12. devolver código de éxito cuando existe cualquier error bloqueante.

La autocertificación contractual mínima futura comprende **48 escenarios**: 12 positivos, 24 negativos y 12 regresiones.

#### 37. Materialización futura de `SHELL-CI-017::GLOBAL`

La instancia global podrá declararse materializada únicamente cuando:

1. se audite el verificador vigente contra el registro modular real;
2. se preserve `docs:treq:check` como interfaz pública;
3. no se cree un verificador paralelo con semántica divergente;
4. se validen los 21 fragmentos vigentes;
5. se validen las catorce columnas;
6. se validen IDs, dominio, unicidad y secuencia;
7. se validen estados y tipos;
8. se validen tareas propietarias y orígenes;
9. se validen relaciones;
10. se validen resumen y distribución;
11. se valide `Última tarea incorporada`;
12. se endurezca `VERIFICADO`;
13. se endurezca `DIFERIDO`;
14. se implemente comparación histórica con baseline explícita;
15. se preserve separación entre check y reconciliación;
16. se disponga de salida estructurada consumible;
17. se cubran los 48 escenarios contractuales mínimos;
18. se ejecute el verificador contra el 04A canónico completo;
19. no se modifique ningún TREQ para hacer pasar la autocertificación;
20. no se cambie Supabase;
21. no se creen workflows ni branch protection;
22. no se desarrolle CI018 ni CI019 por anticipado;
23. la implementación sea reproducible;
24. la evidencia quede consolidada en `SHELL-CI-017::GLOBAL`.

Los cambios físicos concretos se resolverán contra el checkout vigente, priorizando el endurecimiento de la implementación existente bajo `scripts/docs/` y evitando archivos paralelos innecesarios.

#### 38. Estado documental conciliado

| Métrica                                          |                     Resultado |
| ------------------------------------------------ | ----------------------------: |
| Topología CI017                                  |        **GLOBAL_ENABLE_ONCE** |
| Instancias físicas CI001..CI016 verificadas      |                        **16** |
| Fuente física 04A                                |                   **modular** |
| Fragmentos 04A vigentes                          |                        **21** |
| Dominios con requisitos                          |                        **19** |
| Requisitos vigentes observados                   |                      **7066** |
| Filas con catorce columnas observadas            |              **7066 de 7066** |
| Identificadores duplicados observados            |                         **0** |
| Relaciones no resolubles observadas              |                         **0** |
| Verificador público existente                    | **`npm run docs:treq:check`** |
| Suite pública existente                          |  **`npm run docs:treq:test`** |
| Brechas materiales asignadas a CI017             |                         **3** |
| Casos positivos mínimos futuros                  |                        **12** |
| Casos negativos mínimos futuros                  |                        **24** |
| Regresiones mínimas futuras                      |                        **12** |
| Escenarios contractuales mínimos futuros         |                        **48** |
| Cambios físicos autorizados durante el marcador  |                         **0** |
| Cambios Supabase autorizados durante el marcador |                         **0** |
| Requisitos creados o modificados                 |                         **0** |

#### 39. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** la obligación empresarial de validar automáticamente el Registro Canónico de Requisitos de Prueba ya existe y asigna responsabilidad expresa a CI017. Esta tarea concreta el contrato técnico del verificador y sus brechas de implementación sin añadir una nueva obligación empresarial ni alterar filas históricas.

#### 40. Cobertura de prueba vigente reutilizada

Sin modificar 04A, CI017 reutiliza la cobertura vigente que exige:

- validación automática del registro;
- identificadores únicos;
- catorce columnas;
- estados permitidos;
- relaciones resolubles;
- responsables existentes;
- evidencia reproducible para `VERIFICADO`;
- reanudación para `DIFERIDO`;
- ausencia de eliminación silenciosa;
- conservación histórica de requisitos cerrados;
- declaración trazable de requisitos afectados.

Estas referencias son cobertura heredada y no constituyen una actualización del registro.

#### 41. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                             |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no modifica ni ejecuta el verificador.                                                                                                                                                                                                                                                                                         |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado contra el checkout local del usuario.                                                                                                                                                                                                                                                         |
| REMOTA    | PASS           | Se verificaron protocolo, contrato de entrega, manifest, ruta normal, secuencia activa, topología, políticas, archivo propietario, familia modular 04A, reglas obligatorias, requisito que asigna CI017, `package.json`, el verificador TREQ vigente, sus pruebas, la reconciliación segura, el build seguro y la instancia CI016 en estado VERIFIED. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron checks, tests, build, merge, deploy, releases ni mutaciones remotas.                                                                                                                                                                                                                                                                 |
| FÍSICA    | NOT_APPLICABLE | La materialización corresponde a la futura `SHELL-CI-017::GLOBAL` después de aprobación documental y autorización física separada.                                                                                                                                                                                                                    |

#### 42. Criterios de aceptación

`SHELL-CI-017` queda documentalmente completa cuando:

- conserva `docs:treq:check` como interfaz pública;
- usa la fuente modular de `manifest.json`;
- define los 21 fragmentos vigentes sin convertir esa cifra en una autoridad distinta del manifest;
- valida las catorce columnas;
- valida identificadores, dominio, unicidad y secuencia;
- soporta secuencias superiores a tres dígitos;
- valida estados y tipos;
- valida `Origen` y `Tarea responsable`;
- valida relaciones y autorreferencias;
- valida resumen y distribución;
- deriva correctamente la última tarea TREQ;
- endurece el contrato de `VERIFICADO`;
- endurece el contrato de `DIFERIDO`;
- preserva `DESCARTADO` y `OBSOLETO`;
- define comparación histórica con baseline explícita;
- no confunde ausencia de baseline con éxito histórico;
- mantiene `docs:treq:check` como operación de solo lectura;
- mantiene reconciliación separada;
- define salida consumible por automatización;
- entrega a CI018 un resultado fail-closed sin asumir su autoridad;
- entrega a CI019 datos verificables sin publicar evidencia final;
- define casos positivos, negativos y regresiones;
- no desarrolla CI018 ni CI019;
- no modifica requisitos de prueba;
- no modifica Supabase.

#### 43. Límites

Esta tarea no:

- implementa `SHELL-CI-017::GLOBAL`;
- modifica `validate-treq-registry.mjs`;
- modifica pruebas existentes;
- modifica `treq-safe-reconcile.mjs`;
- modifica `treq-registry-files.mjs`;
- modifica `package.json`;
- modifica fragmentos 04A;
- crea requisitos;
- modifica requisitos;
- cambia estados TREQ;
- corrige filas históricas;
- ejecuta reconciliación;
- crea snapshots;
- crea copias de recuperación;
- ejecuta `docs:treq:check`;
- ejecuta `docs:treq:test`;
- ejecuta build;
- crea workflows;
- configura branch protection;
- bloquea merge;
- bloquea deploy;
- publica evidencia;
- crea releases;
- crea tags;
- abre pull requests;
- fusiona pull requests;
- despliega;
- ejecuta rollback;
- crea o ejecuta migraciones;
- modifica schema;
- modifica RLS;
- modifica RPC;
- modifica triggers;
- modifica grants;
- modifica Storage;
- modifica Realtime;
- modifica Edge Functions;
- modifica datos;
- modifica secretos;
- modifica configuración productiva;
- desarrolla `SHELL-CI-018`;
- desarrolla `SHELL-CI-019`.

#### 44. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-016 — Estandarizar un comando de pruebas automatizadas por repositorio`

**TAREA ACTUAL APROBADA**
`SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias`


### ✅ SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba
**Tarea siguiente:** SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio
**Tipo de tarea:** Habilitador global único — contrato documental de puerta fail-closed para merge y despliegue condicionada por pruebas obligatorias
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/03_AUTOMATIZACION_EVIDENCIA_Y_GATES.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada la puerta global que impedirá que un cambio sea **fusionado** o que un commit sea **desplegado hacia un ambiente gobernado** cuando alguna prueba o control obligatorio aplicable no haya terminado satisfactoriamente para el mismo repositorio, commit, contexto y conjunto de obligaciones.

La regla vinculante queda:

```text
REPOSITORIO GOBERNADO
+ COMMIT EXACTO
+ CONTEXTO DE GATE RESUELTO
+ CONJUNTO OBLIGATORIO DE CHECKS RESUELTO
+ `npm test` CI016 PASS
+ REGISTRO TREQ CI017 VÁLIDO
+ TREQ AFECTADOS DECLARADOS Y RESOLUBLES CUANDO APLIQUE
+ CONTROLES CONDICIONALES OBLIGATORIOS PASS
+ CERO CHECKS OBLIGATORIOS AUSENTES
+ CERO RESULTADOS STALE
+ PROTECCIÓN SIN BYPASS
= CAMBIO ELEGIBLE PARA MERGE O DESPLIEGUE
```

Y, de forma fail-closed:

```text
FAIL
O ERROR
O CANCELLED
O TIMED_OUT
O STALE
O CHECK OBLIGATORIO AUSENTE
O TREQ INVÁLIDO
O COMMIT DISTINTO
O REPOSITORIO DISTINTO
O BASELINE REQUERIDA AUSENTE
O DIRECT PUSH QUE ELUDA EL GATE
O AUTOMATIZACIÓN QUE ESCRIBA EN LA RAMA GOBERNADA SIN PASAR EL GATE
≠ MERGE O DESPLIEGUE AUTORIZABLE
```

CI018 decide **admisión**. No redefine las pruebas de CI016, no repara 04A, no publica el expediente final de CI019, no ejecuta despliegues y no ejecuta rollback.

#### 2. Resultado canónico

`SHELL-CI-018` establece un único habilitador reutilizable para:

1. crear una decisión global y determinista de admisión para merge;
2. crear una decisión global y determinista de admisión para despliegues gobernados;
3. consumir `npm test` como interfaz pública de pruebas de repositorio;
4. consumir el verificador TREQ de CI017 sin reimplementar su semántica;
5. resolver un conjunto de controles obligatorios por repositorio, cambio y contexto;
6. bloquear cuando cualquier control obligatorio falle o no pueda demostrarse;
7. impedir que un check ausente se convierta en éxito;
8. impedir reutilizar resultados de otro commit, repositorio o ambiente;
9. impedir que path filters silencien el contexto final requerido;
10. impedir direct push, force push o automatizaciones que permitan saltarse la puerta de integración;
11. impedir que una automatización con permisos de escritura convierta un cambio no validado en commit gobernado;
12. exigir una señal estable de gate que pueda configurarse como required status check;
13. permitir subchecks condicionales únicamente con una clasificación `NOT_APPLICABLE` verificable;
14. separar preview diagnóstico de staging, piloto y producción;
15. impedir que un preview no certificado se presente como despliegue apto;
16. exigir identidad del commit exacto a cualquier despliegue gobernado;
17. soportar providers de despliegue externos sin asumir que GitHub Actions es el único ejecutor;
18. soportar reintentos sin borrar fallos históricos ni aceptar resultados stale;
19. bloquear mientras el gate esté pendiente, cancelado, con timeout o técnicamente indisponible;
20. entregar a CI019 un resultado estructurado publicable sin publicar evidencia por sí misma;
21. autocertificar una sola vez `SHELL-CI-018::GLOBAL`;
22. no crear ni modificar requisitos de prueba porque las obligaciones empresariales aplicables ya existen en 04A.

#### 3. Frontera de responsabilidad

| Responsabilidad                                                    | Propietario    |
| ------------------------------------------------------------------ | -------------- |
| fachada uniforme `npm test` y semántica de ejecución               | `SHELL-CI-016` |
| integridad estructural, semántica e histórica de 04A               | `SHELL-CI-017` |
| decisión de admisión de merge y deploy                             | `SHELL-CI-018` |
| publicación, conservación y trazabilidad del expediente de pruebas | `SHELL-CI-019` |
| rollback independiente de repositorio                              | `SHELL-CI-014` |
| independencia y orden de despliegue                                | `SHELL-CI-015` |
| implementación por paquete                                         | `SHELL-CI-020` |
| readiness por paquete                                              | `SHELL-CI-021` |
| cutover y piloto                                                   | `SHELL-CI-022` |
| hypercare                                                          | `SHELL-CI-023` |
| cierre del paquete                                                 | `SHELL-CI-024` |

CI018 puede **consumir** resultados de otras puertas, pero no absorbe sus oráculos ni se convierte en su owner.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-018`.

```text
MARCADOR CANÓNICO
SHELL-CI-018
→ define una sola vez la política de admisión y anti-bypass

INSTANCIA FÍSICA FUTURA
SHELL-CI-018::GLOBAL
→ materializa y autocertifica una sola vez la puerta global

REPOSITORIOS Y PAQUETES POSTERIORES
→ reutilizan la misma semántica
→ no vuelven a implementar CI018
```

La instancia global deberá quedar `VERIFIED` antes de cualquier `E5-GATE-008::<package_id>` que pretenda habilitar implementación física.

#### 5. Universo inicial gobernado

El universo inicial heredado de CI016 comprende exactamente:

1. `vento-group-sas/vento-shell`;
2. `vento-group-sas/vento-nexo`;
3. `vento-group-sas/vento-fogo`;
4. `vento-group-sas/vento-origo`;
5. `vento-group-sas/vento-pulso`;
6. `vento-group-sas/vento-viso`;
7. `vento-group-sas/vento-numera`;
8. `vento-group-sas/vento-anima`.

Un repositorio futuro solo entra a CI018 después de tener identidad y ownership canónicos y de cumplir la fachada de CI016.

#### 6. Línea base remota observada

La auditoría remota del corte actual muestra:

| Repositorio                  | Rama `main` observada | Protección observada | Required status checks observados | Automatización relevante observada                                       |
| ---------------------------- | --------------------- | -------------------- | --------------------------------- | ------------------------------------------------------------------------ |
| `vento-group-sas/vento-shell`  | sí                    | deshabilitada        | ninguno                           | `validate-canonical-plan.yml`, especializada y con filtros de paths      |
| `vento-group-sas/vento-nexo`   | sí                    | deshabilitada        | ninguno                           | workflow temporal que escribe en `preview`; no constituye gate universal |
| `vento-group-sas/vento-fogo`   | sí                    | deshabilitada        | ninguno                           | no se observó workflow de gate                                           |
| `vento-group-sas/vento-origo`  | sí                    | deshabilitada        | ninguno                           | no se observó workflow de gate                                           |
| `vento-group-sas/vento-pulso`  | sí                    | deshabilitada        | ninguno                           | workflow manual deshabilitado para aplicación de cambio                  |
| `vento-group-sas/vento-viso`   | sí                    | deshabilitada        | ninguno                           | workflow que puede escribir y hacer push directo a `main`                |
| `vento-group-sas/vento-numera` | sí                    | deshabilitada        | ninguno                           | no se observó workflow de gate                                           |
| `vento-group-sas/vento-anima`  | sí                    | deshabilitada        | ninguno                           | no se observó workflow de gate                                           |

Conciliación del corte:

- repositorios gobernados: **8**;
- ramas `main` observadas: **8/8**;
- ramas `main` con protección observada: **0/8**;
- ramas `main` con required status checks observados: **0/8**;
- repositorios con una puerta universal de pruebas requerida para `main`: **0/8**;
- existe al menos una automatización observada capaz de escribir directamente en `main`, por lo que la futura materialización deberá cerrar ese bypass antes de certificar CI018.

Esta línea base describe el estado observado; no autoriza cambios remotos durante el marcador documental.

#### 7. Modelo de puerta

CI018 define dos contextos lógicos:

```text
MERGE
DEPLOY
```

Ambos consumen el mismo motor de decisión, pero resuelven entradas distintas.

```text
MERGE
→ protege la incorporación de un commit a la rama de integración gobernada

DEPLOY
→ protege el uso de un commit como fuente de un ambiente gobernado
```

Una ejecución `PASS` de MERGE no puede reutilizarse automáticamente como PASS de DEPLOY cuando el despliegue exige controles adicionales de ambiente, readiness, compatibilidad, independencia o rollback.

#### 8. Identidad estable del gate

Cada repositorio gobernado deberá exponer una señal final estable de admisión.

La identidad lógica de la señal será:

```text
VENTO Required Gate
```

Reglas:

1. la rama gobernada deberá requerir exactamente una señal final estable de CI018;
2. la señal puede agregar múltiples subchecks;
3. los nombres internos de suites o runners no forman parte de la interfaz pública;
4. renombrar un subcheck no deberá desactivar accidentalmente la protección;
5. cambiar la identidad final requerida exige migración coordinada sin ventana sin protección;
6. un check homónimo producido por un workflow no autorizado no puede sustituir el resultado del gate canónico.

Para despliegue, la misma lógica se ejecutará en contexto `DEPLOY` y conservará identidad de commit y ambiente aunque el provider externo represente la aprobación con otra interfaz técnica.

#### 9. Gate de merge

Un cambio solo queda elegible para merge cuando:

```text
gate_context = MERGE
AND repository = repositorio del PR
AND source_commit = HEAD exacto validado
AND target_branch = rama gobernada
AND required_check_set_resolved = true
AND all_required_checks = PASS
AND gate_result = PASS
```

El resultado debe pertenecer al commit exacto que se incorporará.

Si la rama base avanza y la estrategia de integración puede cambiar el resultado, deberá ocurrir una de estas dos condiciones:

- la rama del cambio se actualiza y el gate se vuelve a ejecutar;
- una merge queue o mecanismo equivalente valida el commit sintetizado final.

Un PASS del head antiguo no certifica un merge candidate materialmente distinto.

#### 10. Gate de despliegue

Un despliegue gobernado solo queda elegible cuando:

```text
gate_context = DEPLOY
AND repository = repositorio desplegado
AND source_commit = commit exacto desplegable
AND environment = ambiente destino exacto
AND required_check_set_resolved = true
AND all_required_checks = PASS
AND gate_result = PASS
```

Además:

- el deploy no puede cambiar el commit después del gate;
- una nueva build desde otro commit exige nueva evaluación;
- una promoción entre ambientes puede reutilizar artefacto inmutable únicamente si conserva identidad y no cambian controles obligatorios del ambiente destino;
- producción, piloto o staging no pueden depender de un estado de PR que ya sea stale;
- un provider externo deberá consumir o respetar una señal equivalente para el mismo SHA.

CI018 no ejecuta el deploy; únicamente entrega la decisión de admisión.

#### 11. Preview diagnóstico

Un preview podrá existir sin gate completo únicamente cuando sea:

```text
PREVIEW_DIAGNOSTIC
```

y cumpla simultáneamente:

- no sea producción;
- no sea staging de certificación;
- no sea piloto;
- no use datos productivos;
- no tenga secretos productivos;
- no ejecute migraciones productivas;
- no se presente como evidencia de readiness;
- no habilite cutover;
- esté claramente separado de un ambiente gobernado.

Un preview diagnóstico fallido puede ayudar a investigar un cambio, pero nunca convierte ese cambio en elegible para merge o despliegue gobernado.

#### 12. Resolución del conjunto obligatorio

CI018 no utiliza una lista universal rígida de comandos ajena al repositorio.

Para cada ejecución deberá resolver:

```text
repository
+ gate_context
+ change_scope
+ package_id cuando aplique
+ environment cuando aplique
+ contratos propietarios
= required_check_set
```

Cada subcheck queda clasificado como:

```text
REQUIRED
CONDITIONAL
NOT_APPLICABLE
```

`NOT_APPLICABLE` exige una razón verificable del contrato propietario.

Un control `REQUIRED` no puede degradarse a `CONDITIONAL` porque falle.

#### 13. Controles universales

Para todo repositorio gobernado, la puerta exige como mínimo:

1. checkout del commit exacto;
2. instalación reproducible mediante lockfile cuando el repositorio la requiera;
3. `npm test` conforme a CI016;
4. identidad de repositorio y commit;
5. ausencia de resultado stale;
6. resolución completa del conjunto obligatorio;
7. código de salida coherente;
8. ausencia de neutralización de fallos;
9. ausencia de mutaciones remotas dentro de la ruta de pruebas;
10. una decisión final fail-closed.

Cuando el cambio consuma o modifique obligaciones de prueba, se añaden los controles CI017 indicados en las secciones siguientes.

#### 14. Controles condicionales

CI018 podrá declarar obligatorios, según el contrato del cambio:

- lint;
- typecheck;
- build o export;
- pruebas de packages compartidos;
- compatibilidad package–consumidor;
- checks de actualización de consumidores;
- rollback;
- independencia de despliegue;
- checks documentales;
- validación de TREQ;
- seguridad;
- migración;
- base de datos;
- RLS;
- RPC;
- integración;
- pruebas nativas;
- otros gates canónicos ya propietarios.

La condición deberá estar resuelta antes de ejecutar la puerta.

La ausencia de un comando requerido por un contrato aplicable es `FAIL` o `BLOCKED`; nunca `PASS`.

#### 15. Consumo de CI016

CI018 invoca pruebas únicamente mediante:

```text
npm test
```

No podrá codificar lógica transversal como:

```text
si NEXO → test:ci007
si FOGO → test:ci008
si ANIMA → test:ci013
```

CI016 conserva la responsabilidad de:

- resolver la cadena interna;
- impedir cero tests;
- propagar fallos;
- impedir watch mode;
- impedir prompts;
- detectar suites ausentes;
- identificar commit y repositorio;
- impedir mutaciones remotas de la suite.

CI018 consume su resultado y decide admisión.

#### 16. Consumo de CI017

Cuando el gate deba validar 04A, utilizará el verificador canónico de CI017.

La puerta podrá exigir:

```text
docs:treq:check
```

con:

- salida machine-readable;
- baseline explícita cuando el contexto la requiera;
- declaración de TREQ afectados;
- cero TREQ afectados únicamente cuando el caller lo permita de forma explícita y justificada.

CI018 no reparará el registro para obtener verde.

#### 17. Declaración de TREQ afectados

Todo PR o paquete sujeto a trazabilidad TREQ deberá suministrar a CI018 un conjunto explícito de requisitos afectados.

La puerta deberá distinguir:

```text
LISTA NO VACÍA
→ validar formato, unicidad y existencia

CERO AFECTADOS EXPLÍCITO
→ solo admisible cuando el contrato permita una modificación sin obligación TREQ
→ debe conservar razón verificable

DECLARACIÓN AUSENTE
→ no equivale a cero
→ bloquea cuando la declaración sea obligatoria
```

La implementación física resolverá un único canal machine-readable para transportar esta declaración sin duplicar la semántica de CI017.

#### 18. Línea base histórica TREQ

En pull request o integración que pueda eliminar o reescribir requisitos, CI018 deberá suministrar a CI017 una baseline explícita.

Reglas:

- la baseline corresponde a la base real de comparación;
- no se adivina una rama;
- no se toma de un snapshot ignorado como autoridad única de CI;
- si la baseline es obligatoria y no puede resolverse, la puerta queda bloqueada;
- un requisito histórico ausente bloquea la admisión;
- cambiar la base del PR invalida una comparación histórica anterior.

CI018 resuelve el contexto; CI017 conserva el oráculo de integridad histórica.

#### 19. Identidad de commit

Toda decisión queda ligada como mínimo a:

```text
repository
source_commit
target_branch o environment
gate_context
required_check_set_identity
execution_identity
```

Queda prohibido reutilizar:

- un PASS de otro SHA;
- un PASS de otro repositorio;
- un PASS de otra rama cuando el merge candidate cambió;
- un PASS de preview como PASS de producción;
- un PASS anterior a un cambio material del conjunto obligatorio.

#### 20. Protección de rama

La futura instancia deberá aplicar una protección equivalente sobre la rama de integración gobernada de cada repositorio.

La protección deberá impedir:

- incorporar un cambio sin `VENTO Required Gate = PASS`;
- direct push que evite el gate;
- force push;
- borrado de la rama gobernada;
- bypass administrativo ordinario;
- bypass de bots o GitHub Actions no expresamente gobernados;
- omitir el gate porque otro check tenga un nombre parecido.

CI018 no fija política de número de revisores, ownership de CODEOWNERS ni gobierno funcional de aprobación humana salvo lo necesario para impedir bypass técnico de la puerta.

#### 21. Orden seguro de activación

La protección no se habilitará antes de que exista una señal funcional y verificable.

La secuencia física obligatoria será conceptualmente:

```text
MATERIALIZAR GATE
→ EJECUTAR AUTOCERTIFICACIÓN
→ EJECUTAR GATE REAL SIN HACERLO REQUIRED
→ CONFIRMAR CHECK ESTABLE EN CADA REPOSITORIO
→ CONFIGURAR PROTECCIÓN
→ DEMOSTRAR QUE PASS PERMITE Y FAIL BLOQUEA
→ CERTIFICAR CI018
```

No se permite crear una regla requerida que apunte a un contexto inexistente y deje la rama en deadlock.

Tampoco se permite una ventana en la que se retire el check anterior antes de que el nuevo esté activo.

#### 22. Triggers sin path-filter de bypass

La señal final requerida deberá ejecutarse para todo cambio que pueda llegar a la rama gobernada.

Por tanto:

- el workflow final de CI018 no podrá depender de `paths` o `paths-ignore` para decidir si existe;
- un subcheck interno sí puede ser condicional;
- un cambio sin impacto en un subcheck recibirá `NOT_APPLICABLE` con razón;
- la señal agregada final siempre deberá producir un resultado.

Un workflow especializado con path filters puede mantenerse, pero no puede ser la única señal required de CI018.

#### 23. Merge queue

Si un repositorio usa merge queue:

- CI018 deberá soportar el evento o mecanismo equivalente que valida el merge candidate;
- el resultado del PR previo no reemplaza la validación del commit sintetizado cuando este difiera;
- el required gate conserva la misma semántica de subchecks;
- un merge group cancelado no deja un PASS reutilizable.

Si merge queue no está habilitada, esta capacidad permanece inactiva y no se simula.

#### 24. Permisos mínimos

La ejecución del gate de pull request deberá usar permisos mínimos.

Por defecto:

```text
contents: read
```

Cualquier permiso adicional exige justificación del subcheck propietario.

Queda prohibido que la ruta que ejecuta código no confiable de un PR:

- tenga token con escritura innecesaria;
- exponga secretos productivos;
- use `pull_request_target` para ejecutar código del fork o branch no confiable con credenciales privilegiadas;
- haga commit o push;
- cree releases;
- despliegue;
- modifique infraestructura.

La puerta observa y decide; no muta el producto.

#### 25. Secretos y ambientes

Una prueba obligatoria que requiera secretos deberá usar únicamente secretos de entorno de prueba explícitamente autorizados.

CI018 deberá distinguir:

```text
SECRET REQUIRED AND AVAILABLE IN SAFE TEST CONTEXT
→ ejecución permitida

SECRET REQUIRED BUT UNAVAILABLE
→ BLOCKED

SECRET PRODUCTION ONLY
→ no se expone al PR
→ el check deberá disponer de estrategia propietaria distinta
```

La ausencia de un secreto requerido no se convierte en `PASS`.

#### 26. Semántica fail-closed

La decisión global solo puede quedar `PASS` cuando todos los controles `REQUIRED` hayan terminado en `PASS`.

Estados globales permitidos:

```text
PENDING
RUNNING
PASS
FAIL
BLOCKED
CANCELLED
TIMED_OUT
STALE
```

Solo:

```text
PASS
```

habilita admisión.

Los demás estados equivalen a:

```text
DENY
```

para merge o despliegue gobernado.

#### 27. Reintentos

Un reintento puede producir un nuevo PASS únicamente si:

- corresponde al mismo commit;
- corresponde al mismo repositorio;
- conserva el mismo conjunto obligatorio;
- no existe una entrada material nueva;
- vuelve a ejecutar realmente los checks requeridos.

Los fallos anteriores permanecen como historial para CI019.

Un rerun no puede reetiquetar un fallo anterior como si nunca hubiese ocurrido.

#### 28. Concurrencia y stale

Cuando llega un commit nuevo al mismo PR:

1. la ejecución anterior pasa a ser no elegible;
2. el nuevo commit requiere su propia evaluación;
3. una ejecución cancelada por concurrencia no es PASS;
4. un resultado tardío del commit anterior no puede reabrir el gate;
5. el gate final debe apuntar siempre al SHA actual.

La misma regla aplica a un despliegue cuyo artefacto o fuente cambia mientras la evaluación está en curso.

#### 29. Checks neutralizados

Queda prohibido construir el gate mediante:

- `|| true`;
- captura de error seguida de código `0`;
- `continue-on-error` para un control obligatorio;
- ignorar un job fallido en la agregación;
- convertir `cancelled()` o `failure()` en éxito;
- ejecutar un placeholder que no corre el control;
- declarar manualmente un status verde sin la ejecución correspondiente.

Un control opcional puede continuar después de fallar, pero no puede formar parte del conjunto `REQUIRED`.

#### 30. Automatizaciones que escriben ramas gobernadas

Toda automatización existente o futura que pueda escribir en una rama gobernada deberá clasificarse durante la futura instancia física.

Una automatización que:

```text
modifica archivos
→ hace commit
→ hace push directo a `main`
```

es incompatible con CI018 mientras pueda eludir la puerta.

Las salidas válidas son:

- convertirla en productora de una rama y PR que pase CI018;
- convertirla en generadora de artefacto sin escritura en la rama protegida;
- retirarla si su propósito ya no aplica.

CI018 no absorbe la funcionalidad empresarial de esa automatización; únicamente elimina su capacidad de bypass.

#### 31. Automatizaciones sobre ramas no gobernadas

Una automatización podrá escribir en una rama no gobernada solo cuando:

- esa rama no sea fuente directa de staging, piloto o producción;
- no pueda fusionarse automáticamente a la rama gobernada;
- su cambio posterior deba pasar por CI018;
- no manipule datos o infraestructura productiva;
- no se presente como release aprobado.

Si una rama como `preview` alimenta un ambiente gobernado, CI018 deberá proteger también el camino de despliegue correspondiente.

#### 32. Despliegues externos a GitHub Actions

CI018 no presupone que el deploy sea ejecutado por GitHub Actions.

Para Vercel, EAS, CLI, plataforma administrada u otro provider, deberá existir una de estas garantías equivalentes:

1. el provider solo despliega automáticamente commits que pueden llegar a la rama gobernada después de CI018;
2. el workflow de deploy verifica explícitamente el gate del mismo SHA antes de iniciar;
3. un environment gate o mecanismo equivalente exige la admisión previa.

Un webhook o integración externa que despliegue cualquier commit sin consultar la puerta es un bypass.

#### 33. Relación con build, lint y typecheck

CI018 no redefine la interfaz de estos controles.

Cuando sean `REQUIRED`, deberá ejecutar el comando que el repositorio o contrato propietario haya declarado y verificar su código de salida.

Reglas:

- build verde no sustituye tests;
- lint verde no sustituye tests;
- typecheck verde no sustituye tests;
- tests verdes no sustituyen un build requerido;
- un comando inexistente cuando es requerido bloquea;
- warnings solo bloquean cuando la política propietaria los clasifique como bloqueantes.

CI018 agrega decisiones; no inventa semántica de herramientas.

#### 34. Relación con compatibilidad, rollback e independencia

Cuando el cambio afecte packages compartidos, contratos o despliegue coordinado, el conjunto obligatorio podrá consumir evidencia de:

- CI005 para compatibilidad;
- CI014 para rollback;
- CI015 para independencia de despliegue.

Un resultado stale de estas puertas no puede reutilizarse.

CI018 no ejecuta rollback y no decide por sí sola el orden de despliegue; bloquea cuando una dependencia obligatoria no está certificada.

#### 35. Recuperación del propio gate

Una falla técnica de CI018 no se convierte en bypass.

Si la infraestructura de gate queda dañada:

```text
GATE NO DISPONIBLE
→ BLOCKED
→ no PASS
```

Una intervención de recuperación deberá:

- quedar autorizada explícitamente;
- limitarse a restaurar la capacidad del gate;
- conservar evidencia de la interrupción;
- restaurar la protección inmediatamente después;
- no declarar como aprobado ningún merge o deploy ocurrido sin evidencia válida.

Una suspensión temporal de protección, si fuese imprescindible para reparar el propio gate, no equivale a certificación del código que atraviese durante esa ventana.

#### 36. Contrato machine-readable

La futura implementación deberá producir un resultado estructurado con, como mínimo:

```text
schema_version
gate_context
repository
source_commit
base_commit
target_branch
environment
package_id
required_check_set_identity
checks
treq_registry_identity
treq_baseline_identity
affected_treq_ids
started_at
completed_at
execution_identity
result
block_reasons
```

Cada elemento de `checks` deberá identificar:

```text
check_id
owner
classification
applicability_reason
source_identity
result
started_at
completed_at
invalidation_reason
```

CI019 podrá publicar este resultado sin reinterpretarlo.

#### 37. Handoff a CI019

CI018 entrega a CI019:

- identidad del gate;
- contexto MERGE o DEPLOY;
- repositorio;
- commit;
- ambiente cuando aplique;
- conjunto obligatorio;
- resultado de cada subcheck;
- TREQ afectados;
- baseline utilizada;
- fallos y bloqueos;
- intentos y reintentos;
- decisión global.

CI019 será responsable de conservar y publicar el expediente.

CI018 no sube artefactos como evidencia definitiva ni define retención histórica de reportes publicados.

#### 38. Relación con `SHELL-CI-020` a `SHELL-CI-024`

Las futuras instancias por paquete deberán consumir CI018 así:

```text
SHELL-CI-020::<package_id>
→ implementación
→ gate de cambio aplicable

SHELL-CI-021::<package_id>
→ readiness

SHELL-CI-022::<package_id>
→ despliegue/cutover solo con DEPLOY gate elegible

SHELL-CI-023::<package_id>
→ hypercare

SHELL-CI-024::<package_id>
→ cierre
```

CI018 no inicia paquetes ni sustituye readiness, cutover o hypercare.

#### 39. Casos positivos obligatorios

La futura `SHELL-CI-018::GLOBAL` deberá demostrar, como mínimo, estos catorce escenarios:

1. PR de SHELL con `npm test` y controles documentales obligatorios en PASS;
2. PR de NEXO con `npm test` en PASS mediante la misma señal final;
3. PR de otro consumidor con alias interno distinto y la misma identidad pública del gate;
4. cambio cuyo subcheck condicional queda `NOT_APPLICABLE` con razón verificable;
5. declaración no vacía de TREQ afectados válida;
6. cero TREQ afectados explícitamente autorizado por un contrato que realmente permite cero;
7. baseline histórica válida con cero eliminaciones;
8. commit corregido después de un FAIL y nueva ejecución PASS;
9. rerun válido sobre el mismo SHA y conjunto obligatorio;
10. staging gobernado del mismo SHA previamente evaluado;
11. producción gobernada desde un SHA exacto con controles de deploy adicionales en PASS;
12. merge candidate actualizado y revalidado después de avanzar la base;
13. merge queue validando el commit sintetizado cuando la capacidad esté habilitada;
14. provider externo que respeta la decisión de DEPLOY para el mismo SHA.

#### 40. Casos negativos obligatorios

La futura instancia deberá bloquear, como mínimo, estos veintiocho escenarios:

1. señal final requerida ausente;
2. `npm test` en FAIL;
3. cero pruebas obligatorias detectadas por CI016;
4. pruebas canceladas;
5. timeout;
6. PASS de otro commit;
7. PASS de otro repositorio;
8. registro TREQ inválido;
9. declaración TREQ obligatoria ausente;
10. TREQ afectado inexistente;
11. TREQ afectado duplicado;
12. baseline histórica obligatoria ausente;
13. requisito histórico eliminado;
14. lint, typecheck, build o gate condicional marcado REQUIRED en FAIL;
15. check REQUIRED omitido como si fuese opcional;
16. path filter que impide producir la señal final;
17. direct push que evite el gate;
18. bypass administrativo ordinario habilitado;
19. force push sobre rama gobernada;
20. workflow con permisos de escritura que haga push directo a `main`;
21. deploy gobernado desde rama sin admisión;
22. deploy de un SHA distinto al certificado;
23. preview diagnóstico presentado como staging, piloto o producción;
24. ejecución privilegiada de código no confiable con secretos productivos;
25. fallo neutralizado mediante código de éxito;
26. PASS reutilizado después de cambiar el conjunto obligatorio;
27. protección configurada contra un contexto inexistente;
28. provider de deploy que ignora el resultado del gate.

#### 41. Regresiones obligatorias

El harness deberá conservar protección contra estas dieciocho regresiones:

1. volver a codificar `test:ci007` en CI018;
2. volver a codificar `test:ci013` en CI018;
3. aceptar build verde cuando `npm test` falla;
4. usar un workflow con path filters como única señal required;
5. reutilizar un PASS después de un commit nuevo;
6. aceptar lista TREQ sin validarla con CI017;
7. permitir cero TREQ afectados por defecto;
8. permitir merge mientras el gate está pendiente;
9. permitir deploy después de FAIL de MERGE sin nueva admisión válida;
10. tratar una rama temporalmente desprotegida como estado certificado;
11. reintroducir una automatización que haga push directo a `main`;
12. reintroducir bypass administrativo ordinario;
13. reintroducir force push;
14. permitir que CI018 mutile producción o Supabase;
15. convertir CI018 en publicador definitivo de evidencia reservado a CI019;
16. ejecutar rollback desde CI018;
17. implementar cutover o hypercare desde CI018;
18. cambiar el nombre final requerido sin transición segura y dejar una ventana de bypass o deadlock.

La autocertificación contractual mínima futura comprende **60 escenarios**: 14 positivos, 28 negativos y 18 regresiones.

#### 42. Materialización futura de `SHELL-CI-018::GLOBAL`

La instancia global podrá declararse materializada únicamente cuando:

1. se auditen los ocho repositorios gobernados y sus ramas de integración;
2. se auditen workflows y providers que puedan integrar o desplegar cambios;
3. se materialice un motor de decisión fail-closed reutilizable;
4. la señal final estable exista en los ocho repositorios;
5. la señal final se produzca para todo PR gobernado sin path-filter de bypass;
6. `npm test` sea obligatorio mediante CI016;
7. la integración con CI017 valide TREQ y baseline cuando corresponda;
8. los subchecks condicionales tengan reglas de aplicabilidad explícitas;
9. se demuestre que un fallo obligatorio produce DENY;
10. se demuestre que un check ausente produce DENY;
11. se demuestre que un resultado stale produce DENY;
12. se eliminen o rediseñen caminos de escritura directa que eludan el gate;
13. las ramas gobernadas queden protegidas contra bypass técnico ordinario;
14. las reglas de protección apunten a un contexto real y estable;
15. se demuestre PASS→merge elegible y FAIL→merge bloqueado;
16. se demuestre PASS→deploy elegible y FAIL→deploy bloqueado para ambientes gobernados;
17. preview diagnóstico permanezca separado;
18. los providers externos no puedan promover un SHA no admitido;
19. se cubran los 60 escenarios contractuales mínimos;
20. se genere resultado machine-readable para CI019;
21. no se modifiquen TREQ para hacer pasar el gate;
22. no se modifique Supabase;
23. no se ejecute deploy real durante la autocertificación salvo una prueba explícitamente aislada y autorizada;
24. no se ejecute rollback productivo;
25. no se publique evidencia final reservada a CI019;
26. no se desarrolle CI019 por anticipado;
27. la instancia y su evidencia queden consolidadas en `SHELL-CI-018::GLOBAL`.

Los archivos, workflows, rulesets o configuraciones exactas de la materialización se resolverán contra el estado vigente durante la instancia física. No se infieren durante este marcador documental.

#### 43. Estado documental conciliado

| Métrica                                          |               Resultado |
| ------------------------------------------------ | ----------------------: |
| Topología CI018                                  |  **GLOBAL_ENABLE_ONCE** |
| Instancias físicas CI001..CI017 verificadas      |                  **17** |
| Repositorios iniciales gobernados                |                   **8** |
| Ramas `main` observadas                          |                 **8/8** |
| Ramas `main` protegidas observadas               |                 **0/8** |
| Required status checks observados en `main`      |                 **0/8** |
| Puerta universal CI018 observada                 |                 **0/8** |
| Contextos lógicos definidos                      |  **2 — MERGE / DEPLOY** |
| Señal final lógica                               | **VENTO Required Gate** |
| Casos positivos mínimos futuros                  |                  **14** |
| Casos negativos mínimos futuros                  |                  **28** |
| Regresiones mínimas futuras                      |                  **18** |
| Escenarios contractuales mínimos futuros         |                  **60** |
| Cambios físicos autorizados durante el marcador  |                   **0** |
| Cambios Supabase autorizados durante el marcador |                   **0** |
| Requisitos creados o modificados                 |                   **0** |

#### 44. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** el Registro Canónico de Requisitos de Prueba ya exige que los comandos y pruebas aplicables bloqueen merge o despliegue según su criticidad, que cada PR y paquete declare requisitos afectados, que la evidencia sea reproducible y que los ambientes tengan identidad verificable. CI018 concreta la política técnica de admisión y anti-bypass sin introducir una obligación empresarial nueva.

#### 45. Cobertura de prueba vigente reutilizada

Sin modificar 04A, CI018 reutiliza cobertura vigente que exige:

- comandos reproducibles y bloqueo ante fallos de controles obligatorios;
- validación automática del registro TREQ;
- declaración de requisitos afectados;
- resultados reproducibles;
- identidad de repositorio, commit y ambiente;
- gates proporcionales a fase y exposición;
- trazabilidad de compatibilidad, rollback e independencia de despliegue cuando sean aplicables.

Estas referencias constituyen cobertura heredada y no una actualización del registro.

#### 46. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                                      |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED   | El marcador documental no materializa workflows, rulesets, required checks ni puertas de despliegue.                                                                                                                                                                                                                                                                                                                           |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado contra el checkout local del usuario.                                                                                                                                                                                                                                                                                                                                  |
| REMOTA    | PASS           | Se verificaron protocolo, contrato de entrega, manifest, ruta normal, secuencia activa, topología, políticas, archivo propietario, CI016 y CI017 materializados, verificador TREQ vigente, workflow de SHELL, workflows observados en NEXO, PULSO y VISO, y el estado remoto de la rama `main` de los ocho repositorios gobernados. Las ocho ramas observadas reportan protección deshabilitada y cero required status checks. |
| OPERATIVA | NOT_EXECUTED   | No se intentaron merge, push protegido, deploy, branch protection, rulesets, environments ni proveedores externos.                                                                                                                                                                                                                                                                                                             |
| FÍSICA    | NOT_APPLICABLE | La configuración real de workflows, protección de ramas y admisión de despliegue corresponde a la futura `SHELL-CI-018::GLOBAL` después de aprobación documental y autorización física separada.                                                                                                                                                                                                                               |

#### 47. Criterios de aceptación

`SHELL-CI-018` queda documentalmente completa cuando:

- define MERGE y DEPLOY como contextos separados;
- conserva `VENTO Required Gate` como señal lógica final estable;
- consume `npm test` sin conocer aliases internos;
- consume CI017 para integridad TREQ;
- exige TREQ afectados cuando corresponda;
- diferencia cero afectados explícito de declaración ausente;
- resuelve baseline histórica cuando sea obligatoria;
- liga cada PASS al repositorio y SHA exactos;
- define required, conditional y not applicable sin degradar fallos;
- bloquea FAIL, BLOCKED, CANCELLED, TIMED_OUT, STALE y ausencia de check;
- evita path-filter de bypass en la señal final;
- evita direct push, force push y bypass técnico ordinario;
- clasifica automatizaciones que escriben ramas gobernadas;
- define activación segura de branch protection sin deadlock;
- define preview diagnóstico separado de ambientes gobernados;
- define una frontera provider-agnostic para despliegues;
- conserva permisos mínimos y seguridad de secretos;
- define reintentos y concurrencia sin reutilizar evidencia stale;
- mantiene CI014, CI015, CI016 y CI017 como owners de sus propios oráculos;
- entrega a CI019 un resultado estructurado publicable;
- define 60 escenarios mínimos de autocertificación;
- no crea ni modifica TREQ;
- no modifica Supabase;
- no desarrolla CI019.

#### 48. Límites

Esta tarea no:

- implementa `SHELL-CI-018::GLOBAL`;
- crea workflows durante el marcador;
- modifica workflows existentes;
- modifica branch protection;
- crea rulesets;
- cambia permisos GitHub;
- cambia repositorios consumidores;
- modifica `package.json`;
- modifica package-locks;
- modifica dependencias;
- cambia `npm test`;
- cambia suites de CI016;
- cambia el verificador CI017;
- modifica 04A;
- crea requisitos;
- modifica requisitos;
- ejecuta pruebas;
- ejecuta lint;
- ejecuta typecheck;
- ejecuta build;
- abre pull requests;
- fusiona pull requests;
- hace push;
- hace force push;
- crea tags;
- crea releases;
- publica packages;
- despliega;
- ejecuta cutover;
- ejecuta hypercare;
- ejecuta rollback;
- crea o ejecuta migraciones;
- modifica schema;
- modifica RLS;
- modifica RPC;
- modifica triggers;
- modifica grants;
- modifica Storage;
- modifica Realtime;
- modifica Edge Functions;
- modifica datos;
- modifica secretos;
- modifica configuración productiva;
- modifica ambientes externos;
- publica evidencia final de CI019;
- desarrolla `SHELL-CI-019`.

#### 49. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba`

**TAREA ACTUAL APROBADA**
`SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio`


### ✅ SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias
**Tarea siguiente:** SHELL-CI-020 — Implementar y desplegar cada paquete aprobado por E5
**Tipo de tarea:** Habilitador global único — contrato documental de publicación, integridad, conservación y trazabilidad de evidencia de pruebas por repositorio y paquete
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/03_AUTOMATIZACION_EVIDENCIA_Y_GATES.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo Vento OS deberá **materializar, publicar, identificar, conservar y recuperar evidencia reproducible de pruebas y gates** para cada ejecución gobernada, de manera que un resultado pueda demostrarse posteriormente por repositorio, commit, contexto, intento y paquete sin reinterpretar logs, sin depender de un estado mutable y sin ocultar fallos previos.

La regla vinculante queda:

```text
EJECUCIÓN IDENTIFICADA
+ REPOSITORIO EXACTO
+ COMMIT EXACTO
+ CONTEXTO MERGE O DEPLOY
+ RESULTADOS ESTRUCTURADOS DE LOS OWNERS
+ IDENTIDADES TREQ CUANDO APLIQUE
+ DECISIÓN CI018
+ MANIFIESTO DE EVIDENCIA
+ IDENTIDADES CRIPTOGRÁFICAS
+ PUBLICACIÓN RECUPERABLE
+ TRAZABILIDAD DE INTENTO
= EXPEDIENTE DE PRUEBAS PUBLICADO Y REPRODUCIBLE
```

Y, de forma fail-closed:

```text
EVIDENCIA AUSENTE
O ARTEFACTO NO RECUPERABLE
O IDENTIDAD QUE NO COINCIDE
O SHA DISTINTO
O REPOSITORIO DISTINTO
O INTENTO SOBRESCRITO
O BUNDLE ALTERADO
O PACKAGE_ID INFERIDO SIN CONTRATO
O RESULTADO STALE
O PUBLICACIÓN QUE EXPONE SECRETOS
≠ EVIDENCIA VÁLIDA PARA ADMISIÓN, READINESS, CUTOVER O CIERRE
```

CI019 **publica evidencia**. No redefine cómo se ejecutan las pruebas de CI016, no valida 04A en lugar de CI017, no decide admisión en lugar de CI018, no ejecuta implementación por paquete, no despliega y no sustituye el gobierno transversal de documentos y evidencia de E4.

#### 2. Resultado canónico

`SHELL-CI-019` establece un único habilitador reutilizable para:

1. publicar un expediente machine-readable por ejecución de repositorio;
2. correlacionar ese expediente con uno o más paquetes canónicos cuando exista contexto de paquete;
3. conservar resultados PASS y DENY sin sobrescribir intentos anteriores;
4. ligar cada evidencia al repositorio y commit exactos;
5. conservar el contexto `MERGE` o `DEPLOY`;
6. conservar ambiente exacto cuando el contexto sea `DEPLOY`;
7. conservar la identidad de la decisión producida por CI018;
8. conservar la identidad del conjunto obligatorio de checks;
9. conservar las identidades de registro y baseline TREQ cuando apliquen;
10. conservar la declaración de requisitos afectados;
11. publicar referencias a resultados de checks sin reejecutarlos ni reinterpretarlos;
12. distinguir evidencia de repositorio de expediente agregado de paquete;
13. permitir que un mismo bundle de repositorio sea referenciado por varios expedientes de paquete sin duplicar payload;
14. impedir que una evidencia de otro SHA o repositorio satisfaga una ejecución distinta;
15. impedir que un rerun borre o reemplace evidencia histórica;
16. detectar bundles alterados mediante identidad criptográfica;
17. impedir que logs o variables sensibles se publiquen como payload por defecto;
18. permitir publicación de resultados fallidos o bloqueados cuando técnicamente sea posible;
19. hacer que una publicación obligatoria fallida impida declarar evidencia completa;
20. conservar referencias provider-agnostic para GitHub Actions, Vercel u otros ejecutores;
21. exponer un contrato consumible por `SHELL-CI-020` a `SHELL-CI-024`;
22. no crear una segunda fuente de verdad para TREQ;
23. no utilizar Git como almacenamiento de runtime evidence;
24. autocertificar una sola vez `SHELL-CI-019::GLOBAL`;
25. no crear ni modificar requisitos de prueba porque la obligación de publicar resultados reproducibles ya existe.

#### 3. Frontera de responsabilidad

| Responsabilidad | Propietario |
| --- | --- |
| fachada homogénea `npm test` y semántica de ejecución | `SHELL-CI-016` |
| integridad estructural, semántica e histórica de 04A | `SHELL-CI-017` |
| decisión de admisión de merge y deploy | `SHELL-CI-018` |
| publicación, integridad y trazabilidad del expediente CI | `SHELL-CI-019` |
| arquitectura empresarial de documentos, evidencia, retención y acceso | `EVID-ARC-001..010` |
| implementación por paquete | `SHELL-CI-020` |
| readiness por paquete | `SHELL-CI-021` |
| cutover y piloto | `SHELL-CI-022` |
| hypercare y estabilización | `SHELL-CI-023` |
| cierre y transferencia a soporte | `SHELL-CI-024` |

CI019 puede **referenciar** evidencia de otros owners, pero no cambia el significado de sus resultados.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-019`.

```text
MARCADOR CANÓNICO
SHELL-CI-019
→ define una sola vez el contrato de evidencia publicada

INSTANCIA FÍSICA FUTURA
SHELL-CI-019::GLOBAL
→ materializa y autocertifica una sola vez el publicador

PAQUETES POSTERIORES
→ reutilizan el mismo contrato
→ no vuelven a implementar CI019
```

La futura `SHELL-CI-019::GLOBAL` deberá quedar `VERIFIED` después de CI018 y antes de cualquier `E5-GATE-008` de paquete que pretenda iniciar el ciclo físico `SHELL-CI-020..024`.

#### 5. Universo inicial gobernado

El universo inicial de repositorios se hereda de CI016 y CI018 y comprende exactamente:

1. `vento-group-sas/vento-shell`;
2. `vento-group-sas/vento-nexo`;
3. `vento-group-sas/vento-fogo`;
4. `vento-group-sas/vento-origo`;
5. `vento-group-sas/vento-pulso`;
6. `vento-group-sas/vento-viso`;
7. `vento-group-sas/vento-numera`;
8. `vento-group-sas/vento-anima`.

El universo de paquetes **no se hardcodea en CI019**. Un `package_id` solo entra al contrato cuando proviene de una definición E5 canónica y aprobada. CI019 no infiere paquetes por carpeta, repositorio, nombre de rama ni lista de archivos modificados.

#### 6. Línea base física observada

El corte vigente muestra:

- `SHELL-CI-016::GLOBAL` materializada y utilizada como fachada de pruebas;
- `SHELL-CI-017::GLOBAL` materializada como verificador del registro TREQ;
- `SHELL-CI-018::GLOBAL` en estado `VERIFIED`;
- los ocho repositorios gobernados por la señal `VENTO Required Gate`;
- el workflow vigente de CI018 produce un reporte JSON estructurado para `MERGE` y `DEPLOY`;
- ese reporte contiene identidad de gate, repositorio, commit, contexto, checks, TREQ, ejecución, resultado y razones de bloqueo;
- el reporte vigente se emite como salida de ejecución, pero no existe todavía un contrato CI019 materializado que lo convierta en bundle publicado, íntegro, recuperable y correlacionado por paquete;
- no existe todavía `SHELL-CI-019::GLOBAL`.

Por tanto:

```text
CI018 YA PRODUCE DECISIÓN ESTRUCTURADA
+
CI019 AÚN NO PUBLICA EXPEDIENTE CANÓNICO
```

#### 7. Significado de “publicar”

En CI019, **publicar no significa exposición pública en Internet**.

Publicar significa que el expediente:

- queda materializado fuera del stdout efímero;
- queda asociado a una ejecución identificable;
- puede recuperarse posteriormente por un actor autorizado o por un gate downstream;
- conserva identidad verificable;
- no depende de copiar manualmente texto desde una consola;
- no exige acceso a secretos para ser leído;
- no se altera cuando existe un rerun posterior.

La visibilidad concreta queda limitada por las capacidades y permisos del provider utilizado.

#### 8. Dos unidades de evidencia

CI019 define dos unidades distintas.

##### 8.1. Bundle de repositorio

Es la unidad autoritativa de una ejecución real de pruebas y gates en un repositorio.

Cardinalidad:

```text
1 ejecución identificada
→ 1 repositorio
→ 1 commit
→ 1 contexto de gate
→ 1 intento
→ 1 bundle de repositorio
```

##### 8.2. Expediente de paquete

Es un manifiesto liviano que **referencia** bundles de repositorio ya publicados y los correlaciona con un `package_id`.

No copia ni reinterpreta los payloads.

```text
1 package_id
→ 1 conjunto canónico de repositorios requeridos
→ N referencias a bundles de repositorio
→ 1 identidad de expediente de paquete
```

Un paquete de un solo repositorio conserva igualmente su expediente de paquete.

#### 9. Contrato mínimo del bundle de repositorio

El bundle machine-readable deberá contener como mínimo:

```text
schema_version
evidence_contract_id
repository
source_commit
base_commit
target_branch
environment
gate_context
gate_execution_identity
gate_result
gate_block_reasons
required_check_set_identity
treq_registry_identity
treq_baseline_identity
affected_treq_ids
checks
provider
provider_run_id
provider_run_attempt
provider_workflow_identity
started_at
completed_at
published_at
artifacts
bundle_identity
publication_reference
publication_result
invalidation_reason
```

Reglas:

1. `repository` es obligatorio;
2. `source_commit` usa el SHA exacto de la ejecución;
3. `gate_context` solo puede representar el contexto resuelto por CI018;
4. `environment` es obligatorio para `DEPLOY` y nulo para un merge sin ambiente;
5. `gate_execution_identity` debe coincidir con la decisión CI018 consumida;
6. `gate_result` se copia, no se recalcula;
7. `checks` se copian desde el resultado estructurado del owner;
8. `publication_result` describe la publicación, no el resultado del gate;
9. `bundle_identity` identifica el contenido, no la ubicación;
10. `publication_reference` permite recuperar el bundle publicado.

#### 10. Contrato mínimo del expediente de paquete

El expediente de paquete deberá contener como mínimo:

```text
schema_version
evidence_contract_id
package_id
required_repository_set_identity
repositories
affected_treq_ids
created_at
package_execution_identity
dossier_identity
completeness
result
block_reasons
```

Cada elemento de `repositories` deberá contener:

```text
repository
source_commit
gate_context
environment
bundle_identity
publication_reference
gate_result
publication_result
```

Un expediente de paquete puede contener commits distintos por repositorio. CI019 no exige un SHA global ficticio para un paquete multi-repositorio.

#### 11. Semántica de `completeness`

Estados permitidos:

```text
COMPLETE
INCOMPLETE
```

`COMPLETE` exige:

- conjunto de repositorios requeridos resuelto desde el contrato del paquete;
- una referencia válida por cada repositorio requerido;
- identidad de bundle verificable;
- commit exacto por repositorio;
- evidencia no stale;
- ausencia de referencias duplicadas;
- ausencia de repositorios ajenos al paquete.

`INCOMPLETE` nunca equivale a PASS.

#### 12. Evidencia por check

Cada elemento de `checks` conservará, como mínimo, las identidades ya producidas por el owner:

```text
check_id
owner
classification
applicability_reason
source_identity
result
started_at
completed_at
invalidation_reason
```

CI019 puede añadir una referencia de publicación, pero no sustituye ni reescribe el resultado del owner.

Un check sin salida estructurada suficiente deberá conservar una referencia provider-native y solo los campos realmente demostrables. CI019 no inventa conteos, resultados, duración ni cobertura a partir de texto ambiguo.

#### 13. Consumo de CI016

CI019 consume la evidencia que demuestra la ejecución de `npm test` y sus identidades disponibles.

No podrá:

- cambiar la fachada `npm test`;
- añadir suites para obtener evidencia más rica;
- interpretar un build como prueba;
- declarar número de pruebas no demostrado;
- reejecutar pruebas únicamente para generar un reporte;
- modificar `SHELL-CI-016::GLOBAL`.

Si CI016 entrega solo un resultado y una identidad para una ejecución determinada, CI019 publica exactamente esa evidencia disponible y su referencia.

#### 14. Consumo de CI017

CI019 conserva, cuando apliquen:

- `treq_registry_identity`;
- `treq_baseline_identity`;
- `affected_treq_ids`;
- resultado de validación TREQ;
- referencia al owner que produjo la validación.

CI019 no modifica el registro para completar un expediente y no convierte una declaración TREQ inválida en evidencia aceptable.

#### 15. Consumo de CI018

CI018 entrega a CI019 la decisión de gate estructurada.

CI019 deberá conservar sin reinterpretación:

- identidad lógica del gate;
- contexto;
- repositorio;
- commit;
- ambiente;
- package id cuando exista;
- conjunto obligatorio;
- checks;
- TREQ;
- tiempos;
- execution identity;
- resultado;
- razones de bloqueo.

CI019 no cambia `FAIL`, `BLOCKED`, `CANCELLED`, `TIMED_OUT` o `STALE` a PASS.

#### 16. Orden de publicación dentro del gate

La futura materialización deberá preservar una sola señal final requerida: `VENTO Required Gate`.

La secuencia lógica será:

```text
RESOLVER CHECKS
→ PRODUCIR DECISIÓN CI018
→ MATERIALIZAR BUNDLE CI019
→ PUBLICAR BUNDLE
→ VERIFICAR IDENTIDAD Y RECUPERABILIDAD
→ FINALIZAR LA MISMA SEÑAL REQUIRED
```

No se crea un segundo required status check que pueda abrir una ventana de bypass o deadlock.

CI019 no cambia el nombre público del gate.

#### 17. Publicación cuando la decisión sería PASS

Si la decisión técnica de CI018 es `PASS`, el gate solo podrá finalizar como admisible cuando la publicación obligatoria del bundle termine correctamente.

```text
CI018 DECISIÓN = PASS
+
CI019 PUBLICACIÓN = PASS
=
VENTO Required Gate PUEDE TERMINAR PASS
```

Si el bundle no puede publicarse o verificarse:

```text
CI018 DECISIÓN = PASS
+
CI019 PUBLICACIÓN ≠ PASS
=
DENY
```

CI019 no decide el merge; entrega un requisito operativo que la señal final consume de forma fail-closed.

#### 18. Publicación de resultados DENY

CI019 deberá intentar publicar también:

- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`.

El objetivo es conservar historial de diagnóstico y demostrar por qué un cambio no fue admisible.

Si una cancelación externa impide ejecutar el publicador dentro del mismo run:

- el provider run continúa siendo evidencia de que existió la ejecución;
- el expediente queda `INCOMPLETE`;
- ningún consumidor puede reinterpretarlo como evidencia completa;
- una reconciliación posterior podrá publicar un manifiesto de terminación que referencie el run cancelado, sin fabricar resultados que nunca existieron.

#### 19. Reintentos

Cada intento es inmutable e independiente.

```text
RUN 100 / ATTEMPT 1 / FAIL
→ bundle A

RUN 100 / ATTEMPT 2 / PASS
→ bundle B
```

El bundle B no elimina ni modifica A.

El expediente puede declarar lineage mediante identidades de intento, pero la autoridad de un consumidor siempre se resuelve contra la ejecución exacta exigida.

#### 20. Concurrencia y evidencia stale

Cuando cambia el commit:

1. el bundle del commit anterior permanece histórico;
2. el nuevo commit genera nueva evidencia;
3. la evidencia antigua queda no elegible para el nuevo commit;
4. un resultado tardío no sustituye el bundle del SHA vigente;
5. un package dossier debe referenciar el commit exacto requerido por cada repositorio.

No existe una noción autoritativa de “último verde” que ignore el SHA.

#### 21. Integridad criptográfica

Cada artefacto material del bundle deberá tener una identidad de contenido:

```text
sha256:{digest}
```

El `bundle_identity` se calcula sobre:

- manifiesto normalizado;
- identidades de los artefactos incluidos;
- repositorio;
- commit;
- gate context;
- execution identity.

La referencia de almacenamiento o URL no forma parte de la identidad semántica del bundle, de modo que el expediente pueda moverse a un storage autorizado sin cambiar qué evidencia representa.

#### 22. Inmutabilidad

Después de publicado, un bundle no se edita en sitio.

Una corrección produce:

```text
NUEVO BUNDLE
+ NUEVA IDENTIDAD
+ REFERENCIA AL BUNDLE ANTERIOR
+ MOTIVO DE CORRECCIÓN
```

Queda prohibido:

- reemplazar un FAIL por un PASS bajo el mismo identificador;
- reutilizar un nombre mutable como autoridad;
- editar un manifiesto para cambiar un SHA;
- borrar fallos para “limpiar” historial;
- volver a firmar payload alterado con la identidad anterior.

#### 23. Minimización y secretos

El expediente deberá aplicar minimización.

No se publicarán por defecto:

- dumps completos de variables de entorno;
- tokens;
- cookies;
- credenciales;
- secretos;
- claves privadas;
- service role keys;
- payloads productivos sensibles;
- archivos `.env`;
- stdout o stderr completos cuando puedan contener secretos.

La futura implementación deberá bloquear o redactar contenido sensible antes de publicar.

La detección de secreto real no se resuelve ocultando el warning; el secreto deberá retirarse y rotarse conforme al proceso propietario.

#### 24. Logs

Los logs del provider son una fuente auxiliar, no el expediente canónico.

Por defecto, CI019 publica:

- resultados estructurados;
- identidades;
- resúmenes;
- referencias al run;
- attachments explícitamente autorizados y sanitizados.

El log completo puede permanecer en el provider y ser referenciado mediante una identidad de ejecución. No debe copiarse automáticamente al bundle si no puede garantizarse su sanitización.

#### 25. Conservación

CI019 no inventa una duración legal numérica.

Reglas:

1. un bundle requerido por un paquete activo no puede considerarse disponible si ya expiró;
2. la fecha de expiración del provider, cuando exista, debe quedar registrada;
3. `SHELL-CI-020..024` deberán consumir evidencia todavía recuperable;
4. el cierre de paquete no puede depender exclusivamente de un artefacto ya expirado;
5. cualquier conservación posterior de naturaleza documental, legal o empresarial deberá respetar EVID-ARC y sus owners;
6. CI019 no crea una política jurídica paralela de retención.

#### 26. Descubrimiento y recuperación

Un consumidor deberá poder resolver evidencia por identidad exacta, no por navegación manual.

Claves mínimas de consulta:

```text
repository
source_commit
gate_context
provider_run_id
provider_run_attempt
bundle_identity
```

Cuando exista paquete:

```text
package_id
dossier_identity
```

Una vista “latest” puede existir como comodidad humana, pero no es autoridad para gates.

#### 27. Nombre lógico de artefacto

La gramática lógica inicial será:

```text
vento-test-evidence__{repository_slug}__{scope_slug}__{source_commit}__{gate_context}__{run_id}__{attempt}
```

Para un expediente de paquete:

```text
vento-test-evidence-package__{package_id}__{package_execution_identity}
```

Estas gramáticas son identidades lógicas. El adapter del provider podrá imponer una representación técnica distinta si conserva todos los campos y la misma semántica.

#### 28. Canal inicial de publicación

Para los ocho repositorios gobernados actuales, el adapter inicial será el sistema de artifacts asociado a la misma ejecución de CI que produce `VENTO Required Gate`.

Reglas:

- el artefacto pertenece al run y attempt exactos;
- la publicación no hace commit ni push;
- la publicación no crea releases;
- la publicación no modifica ramas;
- el publicador no necesita privilegios de escritura sobre el contenido del repositorio;
- el acceso a artifacts respeta el control del provider.

CI019 conserva una interfaz provider-agnostic para que otro ejecutor pueda materializar el mismo contrato sin cambiar el expediente.

#### 29. Provider externo de despliegue

Para `DEPLOY`, el expediente puede incorporar referencias de Vercel, EAS u otro provider cuando el gate haya consumido esa identidad.

CI019 no descarga por defecto logs externos ni copia secretos.

La referencia externa deberá conservar:

- provider;
- proyecto o ejecución cuando sea resoluble;
- commit;
- ambiente;
- resultado;
- identidad o referencia de ejecución.

Una referencia externa que no corresponda al mismo commit o ambiente es stale.

#### 30. Paquetes de un solo repositorio

Un paquete de un solo repositorio no omite la capa de paquete.

El expediente conserva:

```text
package_id
→ required_repository_set_identity
→ 1 referencia de bundle
```

Esto permite que `SHELL-CI-020..024` consuman siempre la misma interfaz.

#### 31. Paquetes multi-repositorio

Un paquete multi-repositorio deberá resolver su conjunto requerido desde la autoridad E5.

CI019 no puede completar el dossier hasta tener una referencia por cada repositorio requerido.

Ejemplo conceptual:

```text
PACKAGE P
→ vento-shell @ SHA-A
→ vento-nexo  @ SHA-B
→ vento-anima @ SHA-C
```

Los tres commits pueden ser distintos. La identidad del expediente deriva del conjunto ordenado de referencias, no de un SHA inventado.

#### 32. No duplicación de payload

Cuando varios paquetes consuman la misma ejecución de repositorio:

```text
1 BUNDLE DE REPOSITORIO
→ PACKAGE A referencia el bundle
→ PACKAGE B referencia el mismo bundle
```

No se copian logs, manifests ni resultados completos por paquete.

El dossier de paquete es un índice de lineage y cobertura, no una segunda copia de la prueba.

#### 33. Resultado del expediente de paquete

Estados permitidos:

```text
PASS
FAIL
BLOCKED
STALE
```

`PASS` exige:

- `completeness = COMPLETE`;
- todos los bundles requeridos recuperables;
- todos los bundles correspondientes a los commits exactos;
- todos los resultados obligatorios aplicables en PASS;
- cero referencias stale;
- cero identidades inválidas.

El expediente no transforma un resultado negativo de repositorio en positivo.

#### 34. Evidencia manual u operativa

Si un gate propietario exige una validación manual controlada, CI019 puede publicar su evidencia únicamente cuando exista:

- owner;
- actor atribuible;
- timestamp;
- recurso o ambiente;
- resultado;
- referencia;
- identidad o integridad verificable cuando aplique.

La ausencia de evidencia manual obligatoria se conserva como `BLOCKED`; nunca se completa con un texto genérico.

#### 35. Errores de publicación

Errores mínimos que deberán distinguirse:

```text
PUBLICATION_PAYLOAD_MISSING
PUBLICATION_SCHEMA_INVALID
PUBLICATION_SECRET_DETECTED
PUBLICATION_CONTENT_IDENTITY_MISMATCH
PUBLICATION_BUNDLE_IDENTITY_MISMATCH
PUBLICATION_REFERENCE_MISSING
PUBLICATION_NOT_RETRIEVABLE
PUBLICATION_REPOSITORY_MISMATCH
PUBLICATION_COMMIT_MISMATCH
PUBLICATION_EXECUTION_MISMATCH
PACKAGE_ID_UNRESOLVED
PACKAGE_REQUIRED_REPOSITORY_MISSING
PACKAGE_UNEXPECTED_REPOSITORY
PACKAGE_BUNDLE_STALE
PACKAGE_BUNDLE_DUPLICATED
```

La implementación puede añadir códigos, pero no colapsar causas distintas en un PASS genérico.

#### 36. Contrato de verificación de evidencia

La futura implementación deberá poder validar un bundle ya publicado sin ejecutar nuevamente las pruebas.

La verificación deberá comprobar como mínimo:

- schema;
- repo;
- commit;
- contexto;
- execution identity;
- identidad de cada artefacto;
- bundle identity;
- referencia de publicación;
- recuperabilidad;
- ausencia de mismatch;
- vigencia cuando el provider declare expiración.

La verificación de evidencia no sustituye la ejecución original.

#### 37. Handoff a `SHELL-CI-020..024`

CI019 entrega al ciclo por paquete:

```text
package_id
dossier_identity
required_repository_set_identity
repository bundles
source commits
gate contexts
gate results
TREQ identities
publication references
bundle identities
completeness
result
```

Uso esperado:

- `SHELL-CI-020` registra qué evidencia respalda la implementación;
- `SHELL-CI-021` consume bundles para readiness;
- `SHELL-CI-022` exige evidencia DEPLOY del commit exacto antes de cutover;
- `SHELL-CI-023` añade evidencia de hypercare sin reescribir la evidencia de pruebas;
- `SHELL-CI-024` verifica recuperabilidad y lineage antes del cierre.

CI019 no ejecuta ninguna de esas tareas.

#### 38. Casos positivos mínimos de autocertificación futura

La futura `SHELL-CI-019::GLOBAL` deberá demostrar, como mínimo:

1. publicación de bundle PASS de repositorio;
2. publicación de bundle FAIL sin convertirlo en PASS;
3. publicación de bundle BLOCKED;
4. rerun del mismo SHA generando un bundle distinto;
5. commit nuevo generando identidad distinta;
6. bundle MERGE con ambiente nulo;
7. bundle DEPLOY con ambiente exacto;
8. expediente de paquete de un repositorio;
9. expediente multi-repositorio con SHAs distintos;
10. dos paquetes referenciando el mismo bundle sin duplicarlo;
11. verificación exitosa de hashes;
12. recuperación por identidad exacta;
13. TREQ cero explícito conservado sin inventar IDs;
14. TREQ afectados no vacíos conservados con su registry identity;
15. provider externo referenciado sin copiar secretos.

#### 39. Casos negativos mínimos de autocertificación futura

La futura instancia deberá bloquear o invalidar, como mínimo:

1. bundle sin repositorio;
2. bundle con SHA malformado;
3. bundle de otro repositorio;
4. bundle de otro commit;
5. gate execution identity distinta;
6. content hash alterado;
7. bundle identity alterada;
8. publicación no recuperable;
9. secreto detectado en payload;
10. intento de sobrescribir bundle histórico;
11. package id no resoluble;
12. repositorio requerido ausente en un paquete;
13. repositorio inesperado en un paquete;
14. bundle duplicado dentro de un dossier;
15. bundle stale;
16. `completeness = COMPLETE` con evidencia faltante;
17. PASS de paquete con un repositorio en FAIL;
18. PASS de paquete con publicación fallida;
19. uso de una vista “latest” como autoridad;
20. reutilización de evidencia de preview como evidencia DEPLOY gobernada.

#### 40. Regresiones mínimas de autocertificación futura

La futura instancia deberá impedir:

1. cambiar la identidad `VENTO Required Gate`;
2. crear un segundo required status check obligatorio para sustituir CI018;
3. reejecutar pruebas dentro del publicador;
4. parsear logs ambiguos para inventar resultados;
5. hacer commit o push de evidencia runtime;
6. publicar `.env` o secretos;
7. eliminar bundles fallidos;
8. sobrescribir un intento anterior;
9. convertir publicación fallida en gate PASS;
10. inferir `package_id` por ruta;
11. inferir mismo SHA para repositorios distintos;
12. modificar 04A para obtener verde;
13. modificar Supabase;
14. ejecutar deploy;
15. ejecutar rollback;
16. desarrollar `SHELL-CI-020`.

#### 41. Materialización futura de `SHELL-CI-019::GLOBAL`

La instancia podrá declararse materializada únicamente cuando:

1. exista un único motor propietario de publicación en `vento-shell`;
2. los ocho repositorios puedan consumir el mismo contrato sin duplicar semántica;
3. el publicador pueda construir y validar bundles de repositorio;
4. el publicador pueda construir y validar expedientes de paquete;
5. la señal final `VENTO Required Gate` conserve su identidad;
6. un PASS técnico con publicación fallida produzca DENY;
7. un FAIL técnico publique evidencia de fallo cuando técnicamente sea posible;
8. los intentos se conserven de forma append-only;
9. la identidad SHA-256 detecte alteración;
10. el contenido sensible sea rechazado o redactado antes de publicar;
11. un bundle publicado pueda recuperarse y verificarse sin reejecutar pruebas;
12. se demuestre paquete de un repositorio;
13. se demuestre paquete multi-repositorio;
14. se demuestre rerun sin sobrescritura;
15. se demuestre stale sin reutilización;
16. se demuestre compatibilidad con MERGE y DEPLOY;
17. los ocho repositorios produzcan evidencia con el mismo contrato;
18. las regresiones de CI018 continúen en PASS;
19. no se modifiquen requisitos TREQ;
20. no se modifique 04A;
21. no se modifique Supabase;
22. no se haga merge;
23. no se ejecute despliegue productivo;
24. no se ejecute rollback;
25. no se desarrolle CI020;
26. la instancia y su evidencia queden consolidadas en `SHELL-CI-019::GLOBAL`.

Los archivos, actions, adapters y comandos exactos de la materialización se resolverán contra el estado vigente al iniciar la instancia física.

#### 42. Estado documental conciliado

| Métrica | Resultado |
| --- | ---: |
| Topología CI019 | **GLOBAL_ENABLE_ONCE** |
| Instancias físicas CI016..CI018 verificadas | **3/3** |
| Repositorios iniciales gobernados | **8** |
| Contextos heredados | **2 — MERGE / DEPLOY** |
| Señal final preservada | **VENTO Required Gate** |
| Unidad primaria de evidencia | **bundle de repositorio** |
| Unidad de agregación | **expediente de paquete** |
| Bundles CI019 materializados durante el marcador | **0** |
| Expedientes de paquete materializados durante el marcador | **0** |
| Cambios físicos autorizados durante el marcador | **0** |
| Cambios Supabase autorizados durante el marcador | **0** |
| Requisitos creados o modificados | **0** |

#### 43. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** el registro vigente ya exige comandos reproducibles que bloqueen integración o despliegue cuando corresponda y exige que cada paquete y PR publique resultados reproducibles. CI019 materializa el contrato técnico de publicación, integridad, lineage y recuperación de esa evidencia sin introducir una obligación empresarial nueva.

#### 44. Cobertura de prueba vigente reutilizada

Sin modificar 04A, CI019 reutiliza cobertura vigente de:

- `TREQ-SHELL-005`, que exige comandos reproducibles y bloqueo ante fallos de controles críticos;
- `TREQ-SHELL-008`, que exige validación automática del registro, declaración de requisitos afectados y publicación de resultados reproducibles.

Estas referencias son trazabilidad heredada y no una actualización del registro.

#### 45. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | El marcador documental no materializa el publicador, artifacts, workflows ni adapters. |
| LOCAL | NOT_EXECUTED | No se ejecutaron validadores ni comandos contra el checkout local del usuario durante esta entrega. |
| REMOTA | PASS | Se revisaron las fuentes canónicas vigentes de continuidad, topología, políticas, contrato de entrega, owner file, package scripts, 04A SHELL, CI016, CI017, el motor CI018, el workflow `VENTO Required Gate` y la instancia `SHELL-CI-018::GLOBAL` verificada. |
| OPERATIVA | NOT_EXECUTED | No se intentó publicar artifacts, recuperar bundles, reruns, merge, deploy ni gates de paquete. |
| FÍSICA | NOT_APPLICABLE | La materialización corresponde a la futura `SHELL-CI-019::GLOBAL` después de aprobación documental y autorización física separada. |

#### 46. Criterios de aceptación

`SHELL-CI-019` queda documentalmente completa cuando:

- define evidencia por repositorio y por paquete como unidades separadas;
- conserva el bundle de repositorio como evidencia autoritativa de ejecución;
- conserva el expediente de paquete como índice de referencias, no duplicado de payload;
- liga evidencia a repositorio, commit, contexto e intento exactos;
- conserva la decisión CI018 sin reinterpretarla;
- conserva identidades TREQ cuando apliquen;
- define integridad SHA-256;
- define inmutabilidad append-only;
- define semántica de rerun;
- impide reutilización stale;
- impide autoridad basada en “latest”;
- define publicación de resultados DENY;
- hace obligatoria la publicación para un PASS admisible;
- preserva una sola señal `VENTO Required Gate`;
- prohíbe exposición de secretos;
- limita raw logs a referencias o attachments sanitizados;
- define recuperabilidad;
- define conservación sin inventar retención legal;
- soporta package de un repositorio y multi-repositorio;
- soporta providers externos;
- entrega un handoff explícito a CI020..024;
- no modifica CI016, CI017 ni su semántica;
- no redefine la decisión de CI018;
- no crea ni modifica TREQ;
- no modifica Supabase;
- no inicia CI020.

#### 47. Límites

Esta tarea no:

- implementa `SHELL-CI-019::GLOBAL`;
- crea scripts;
- crea actions;
- modifica workflows;
- publica artifacts reales;
- cambia branch protection;
- cambia la identidad `VENTO Required Gate`;
- cambia `npm test`;
- cambia las suites CI016;
- cambia el verificador CI017;
- cambia la semántica del motor CI018;
- modifica instancias VERIFIED anteriores;
- modifica `package.json`;
- modifica lockfiles;
- modifica dependencias;
- modifica 04A;
- crea requisitos;
- modifica requisitos;
- ejecuta pruebas;
- ejecuta lint;
- ejecuta typecheck;
- ejecuta build;
- abre pull requests;
- fusiona pull requests;
- hace push;
- hace force push;
- crea tags;
- crea releases;
- publica packages;
- despliega;
- ejecuta cutover;
- ejecuta hypercare;
- ejecuta rollback;
- crea o ejecuta migraciones;
- modifica schema;
- modifica RLS;
- modifica RPC;
- modifica triggers;
- modifica grants;
- modifica Storage;
- modifica Realtime;
- modifica Edge Functions;
- modifica datos;
- modifica secretos;
- crea una política jurídica nueva de retención;
- sustituye EVID-ARC;
- desarrolla `SHELL-CI-020`.

#### 48. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias`

**TAREA ACTUAL APROBADA**
`SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-020 — Implementar y desplegar cada paquete aprobado por E5`

