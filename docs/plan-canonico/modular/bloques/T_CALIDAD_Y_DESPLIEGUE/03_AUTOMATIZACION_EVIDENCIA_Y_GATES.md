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


### [ ] SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba
### [ ] SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias
### [ ] SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio
