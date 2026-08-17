### MINI-BLOQUE — PAQUETES RELEASES Y COMPATIBILIDAD

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **paquetes releases y compatibilidad** dentro de **T CALIDAD Y DESPLIEGUE**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-CI-001` a `SHELL-CI-006` — 6 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-CI-001`: Crear pruebas de paquetes compartidos
- `SHELL-CI-002`: Crear build independiente por paquete
- `SHELL-CI-003`: Crear releases versionados
- `SHELL-CI-004`: Crear changelog automático
- `SHELL-CI-005`: Crear matriz de compatibilidad
- `SHELL-CI-006`: Crear actualización de consumidores mediante PR
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-CI-001 — Crear pruebas de paquetes compartidos

**Estado:** APROBADA
**Tarea anterior:** AUTH-UI-039
**Tarea siguiente:** SHELL-CI-002 — Crear build independiente por paquete
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el habilitador global que gobernará las **pruebas propias de los packages compartidos de Vento OS** antes de que una versión pueda participar en los gates de release, compatibilidad, actualización de consumidores o habilitación E5.

La regla central queda fijada así:

```text
PACKAGE COMPARTIDO
+ IDENTIDAD EXACTA DEL CANDIDATO
+ SUITE PROPIA APLICABLE
+ CASOS POSITIVOS Y NEGATIVOS
+ RESULTADO REPRODUCIBLE
+ EVIDENCIA VIGENTE
= PACKAGE TESTABLE POR EL GATE COMÚN
```

Y, de forma fail-closed:

```text
AUSENCIA, FALLO, OMISIÓN, STALE, TIMEOUT O PRUEBA DESHABILITADA
≠ PASS
```

Esta tarea no publica packages ni ejecuta todavía la instancia física global. Define el contrato que `SHELL-CI-001::GLOBAL` deberá materializar una sola vez y que todos los packages reutilizarán sin duplicar el habilitador.

#### 2. Resultado canónico

`SHELL-CI-001` establece un único contrato transversal para:

1. identificar el package y el snapshot exactos que se prueban;
2. descubrir y ejecutar la suite propia declarada por cada package elegible;
3. exigir casos positivos, negativos y de regresión aplicables;
4. impedir éxito con cero pruebas requeridas;
5. impedir éxito con pruebas obligatorias omitidas o deshabilitadas;
6. distinguir fallo de prueba, bloqueo de infraestructura, cancelación, timeout y evidencia obsoleta;
7. conservar evidencia atribuible a package, versión o candidato, commit y ejecución;
8. invalidar la evidencia cuando cambia una entrada material;
9. producir una salida consumible por los gates posteriores sin otorgar autoridad de merge, publicación o despliegue;
10. probar el propio gate contra falsos verdes y regresiones de su lógica;
11. reutilizar un único habilitador global para todas las familias de package aprobadas;
12. mantener separadas las responsabilidades de build, release, changelog, compatibilidad y actualización de consumidores.

#### 3. Base vinculante

La definición conserva las decisiones ya aprobadas de distribución y calidad:

- packages npm privados e inmutables producidos desde `vento-shell`;
- autoría e integración local mediante npm workspaces;
- versiones exactas y lockfile en consumidores;
- cuatro familias de package compartido vigentes;
- siete consumidores web vigentes y 28 relaciones package–consumidor gobernadas por el contrato de compatibilidad;
- dieciséis gates canónicos de actualización fail-closed;
- cuatro perfiles especializados de familia;
- evidencia ligada a la combinación exacta evaluada;
- invalidación de evidencia al cambiar commit, manifest, lockfile, versión, configuración, fixtures o expectativas;
- prohibición de convertir ausencia, `SKIPPED`, `NEUTRAL`, fallo, bloqueo, cancelación, timeout o resultado stale en `PASS`;
- separación entre pruebas propias del package y pruebas del consumidor.

#### 4. Topología de trabajo

La topología de `PHASE-03-T-CI-FOUNDATION` es `GLOBAL_ENABLE_ONCE`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-001
→ define el contrato una sola vez

INSTANCIA FÍSICA FUTURA
SHELL-CI-001::GLOBAL
→ materializa y certifica el habilitador una sola vez

PACKAGES
→ reutilizan el habilitador certificado
→ no crean otra implementación de CI001
```

La instancia física solo será elegible después de la aprobación del contrato global y deberá estar certificada antes de que un package pueda depender de este habilitador para superar una puerta `E5-GATE-008::<package_id>` aplicable.

#### 5. Universo de packages gobernado

El contrato inicial cubre exactamente las cuatro familias compartidas ya aprobadas:

1. `@vento/contracts`;
2. `@vento/os-context`;
3. `@vento/supabase`;
4. `@vento/ui-web`.

La incorporación de otra familia no se deduce de que exista una carpeta, workspace o dependencia. Requiere identidad, ownership y contrato canónico aprobados antes de entrar al habilitador.

#### 6. Línea base física observada

En el corte actual de `vento-shell`:

- el workspace raíz declara `packages/*`;
- `@vento/os-context@0.1.0` es el único package compartido físicamente presente bajo ese workspace;
- `@vento/os-context` permanece `private: true` y exporta directamente su fuente TypeScript;
- su manifest actual no declara una entrada propia de pruebas;
- su directorio físico contiene `README.md`, `package.json` y `src/`, sin una suite de tests materializada junto al package;
- `@vento/contracts`, `@vento/supabase` y `@vento/ui-web` todavía no existen como packages físicos en el workspace observado;
- el `package.json` raíz contiene pruebas documentales del plan, pero no demuestra un habilitador global ya materializado para ejecutar pruebas propias de las cuatro familias de package.

Esta línea base demuestra la necesidad física futura del habilitador, pero no autoriza crear archivos durante el marcador global.

#### 7. Frontera con el resto del mini-bloque

`SHELL-CI-001` no absorbe las tareas siguientes:

| Responsabilidad                                     | Propietario    |
| --------------------------------------------------- | -------------- |
| build independiente del package                     | `SHELL-CI-002` |
| creación de releases versionados                    | `SHELL-CI-003` |
| changelog automático                                | `SHELL-CI-004` |
| matriz de compatibilidad package–consumidor         | `SHELL-CI-005` |
| actualización de consumidores mediante pull request | `SHELL-CI-006` |

Reglas de frontera:

1. CI001 prueba el package; CI002 demuestra que su build independiente es correcto;
2. CI001 no crea tags, releases ni artefactos publicados; CI003 gobierna esa identidad;
3. CI001 no genera changelog; CI004 lo gobierna;
4. CI001 no declara una combinación package–consumidor compatible; CI005 lo decide con su matriz;
5. CI001 no modifica consumidores ni abre PR; CI006 gobierna la adopción;
6. un `PASS` de CI001 es necesario para las pruebas propias, pero nunca suficiente para release, compatibilidad, merge, despliegue o adopción.

#### 8. Unidad de evaluación de pruebas propias

Cada ejecución de pruebas propias se atribuye a una unidad exacta compuesta, como mínimo, por:

```text
package_name
package_candidate_version
source_commit
package_manifest_identity
resolved_internal_dependencies
runtime_identity
test_contract_identity
fixture_identity
run_identity
```

Si una de estas dimensiones cambia de forma material, el resultado anterior deja de certificar la nueva unidad.

La versión puede corresponder todavía a un candidato previo a release. La identidad definitiva de release sigue perteneciendo a `SHELL-CI-003`.

#### 9. Contrato de declaración de pruebas por package

Todo package gobernado deberá declarar de forma verificable:

1. que posee pruebas propias aplicables;
2. cuál es la entrada ejecutable que activa esas pruebas;
3. qué categorías de prueba son obligatorias para su familia;
4. cuáles fixtures o datasets sintéticos utiliza;
5. qué condiciones producen éxito o fallo;
6. qué casos son positivos;
7. qué casos son negativos o adversariales;
8. qué regresiones de seguridad o contrato deben permanecer bloqueadas;
9. qué dependencias internas exactas forman parte del snapshot;
10. qué artefactos de evidencia produce la ejecución.

La declaración deberá ser legible por automatización y no podrá depender de una instrucción manual ambigua para decidir qué ejecutar.

#### 10. Clases mínimas de prueba

Toda familia deberá cubrir, cuando resulte aplicable a su contrato:

- **unitaria:** comportamiento propio aislado;
- **contractual:** formas, exports, schemas, catálogos, tipos o APIs públicas;
- **negativa/adversarial:** inputs inválidos, versiones incompatibles, estados prohibidos o intentos de bypass;
- **regresión:** comportamiento previamente protegido que no puede degradarse;
- **serialización/determinismo:** cuando el package emita artefactos o contratos serializables;
- **integración interna del package:** interacción entre módulos propios sin convertirla en prueba del consumidor;
- **seguridad:** cuando el package participe en autorización, datos privilegiados, contexto, credenciales o fronteras de confianza.

Una categoría solo podrá declararse no aplicable mediante una regla del perfil de familia o del contrato propietario. No podrá omitirse por ausencia de tiempo, configuración o implementación.

#### 11. Condición de suficiencia de la suite

Una suite propia es suficiente únicamente cuando:

```text
required_test_groups > 0
AND executed_required_test_groups = required_test_groups
AND failed_required_test_groups = 0
AND unresolved_required_skips = 0
AND evidence_is_current = true
```

No constituye suite válida:

- un comando que finaliza correctamente sin ejecutar pruebas requeridas;
- una suite con todos los casos filtrados;
- una suite que convierte errores de carga en cero tests;
- un runner configurado para ignorar el exit code de una prueba fallida;
- una suite que marca como opcional una categoría universal para evitar un fallo;
- una ejecución cuyo reporte no puede atribuirse al snapshot evaluado.

#### 12. Casos positivos obligatorios del habilitador

La instancia física deberá demostrar, como mínimo:

1. package elegible con suite completa y resultado correcto → resultado de pruebas propias válido;
2. dos ejecuciones sobre el mismo snapshot lógico → mismo conjunto de tests y misma clasificación de resultados;
3. package con pruebas de varias categorías → agregación completa sin perder la identidad de cada categoría;
4. package que usa fixtures deterministas → mismo oracle para el mismo fixture y contrato;
5. ejecución repetida después de un fallo ya corregido → nuevo resultado atribuible sin borrar la evidencia del intento fallido;
6. package con categoría condicional realmente no aplicable → exclusión justificada sin degradar categorías universales.

#### 13. Casos negativos obligatorios del habilitador

La instancia física deberá bloquear, como mínimo:

1. package sin declaración de pruebas;
2. package con entrada de pruebas inexistente o no ejecutable;
3. ejecución con cero tests requeridos;
4. fallo de una prueba requerida;
5. suite requerida deshabilitada;
6. filtro que excluye todos los casos obligatorios;
7. timeout;
8. cancelación;
9. error del runner o de carga de fixtures;
10. resultado de otro commit;
11. resultado de otra versión o candidato;
12. fixture cambiado sin nueva ejecución;
13. configuración de pruebas cambiada sin nueva ejecución;
14. dependencia interna relevante cambiada sin nueva ejecución;
15. evidencia corrupta o incompleta;
16. intento de marcar manualmente como correcto un resultado no ejecutado;
17. reintentos utilizados para ocultar intermitencia no resuelta;
18. package fuera del universo aprobado intentando usar el habilitador como certificación.

#### 14. Integración con `PKG-GATE-001`

`PKG-GATE-001 — identidad de release` tiene propiedad compartida entre CI001 y CI003.

CI001 deberá garantizar que toda evidencia de pruebas propias conserve identidad suficiente para vincularla después con la release exacta.

CI001 no declara por sí solo que tag, release, tarball e integridad coinciden. Ese cierre pertenece a CI003.

Por tanto:

```text
CI001
→ prueba candidato identificado
→ conserva lineage verificable

CI003
→ fija identidad inmutable de release
→ demuestra correspondencia con el candidato certificado
```

Una release que no pueda demostrar esa correspondencia deberá volver a ejecutar las pruebas aplicables sobre la identidad definitiva.

#### 15. Integración con `PKG-GATE-005`

`PKG-GATE-005 — pruebas propias del package` es el gate universal cuya automatización común pertenece principalmente a CI001 y al propietario del package.

Para obtener `PASS` deberán coexistir:

1. package y snapshot exactos;
2. suite declarada;
3. categorías requeridas ejecutadas;
4. cero fallos requeridos;
5. cero omisiones obligatorias;
6. resultados vigentes;
7. evidencia reproducible;
8. tipos y build aplicables disponibles desde sus tareas propietarias cuando el gate compuesto los requiera.

CI001 no sustituye el build de CI002. Cuando `PKG-GATE-005` exija además tipos o build, consume esas evidencias sin duplicar su implementación.

#### 16. Estados consumidos del gate

El habilitador respetará la semántica canónica de resultados ya aprobada:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente donde una regla condicional lo permita.

Para pruebas propias requeridas, solo `PASS` satisface el gate.

`SKIPPED`, `NEUTRAL`, ausencia de resultado y éxito parcial no constituyen estados de éxito y deberán normalizarse hacia un estado fail-closed aplicable.

#### 17. Determinismo y reproducibilidad

La ejecución deberá ser reproducible respecto de sus entradas declaradas.

Esto exige:

1. runtime identificado;
2. dependencias resueltas identificadas;
3. fixtures versionados o identificados por contenido;
4. orden o aleatoriedad controlados cuando puedan alterar el resultado;
5. reloj, zona horaria, locale, red y servicios externos controlados cuando afecten el oracle;
6. datos sintéticos deterministas cuando la prueba no requiera un ambiente real;
7. separación entre un test determinista y una validación remota que por naturaleza depende de un servicio externo;
8. conservación del contexto suficiente para reproducir el fallo.

La reproducibilidad del **build independiente del package** permanece en CI002. CI001 únicamente exige que la ejecución de pruebas no produzca un verde diferente por entradas ocultas o no identificadas.

#### 18. Pruebas que requieren servicios o infraestructura

Una prueba propia no dependerá silenciosamente de producción.

Cuando requiera infraestructura:

- el ambiente deberá ser explícito;
- la dependencia deberá estar disponible antes de ejecutar;
- la indisponibilidad produce `BLOCKED`, no `PASS`;
- los datos de prueba no podrán ser datos operativos inventados en producción;
- credenciales y secretos no formarán parte de fixtures ni reportes;
- un mock no sustituirá una prueba de integración real cuando el contrato propietario exija el servicio real;
- una prueba remota no reemplazará las unitarias o contractuales que deban ejecutarse localmente.

#### 19. Política de fixtures

Los fixtures reutilizados por el habilitador deberán ser:

- mínimos para el comportamiento protegido;
- deterministas;
- versionados o identificados por contenido;
- sintéticos cuando contengan identidades o datos sensibles;
- libres de secretos;
- atribuibles al contrato que prueban;
- invalidados cuando cambie el comportamiento esperado;
- capaces de representar casos válidos e inválidos.

Un snapshot visual, JSON, schema o dataset de prueba no podrá actualizarse automáticamente para convertir un fallo en éxito sin revisión del cambio esperado.

#### 20. Intermitencia y reintentos

La intermitencia es un defecto del gate o de la prueba, no una variante de éxito.

Reglas:

1. cada intento conserva identidad propia;
2. un reintento no elimina el intento fallido;
3. una ejecución correcta posterior no convierte automáticamente una prueba intermitente en estable;
4. si resultados equivalentes alternan entre éxito y fallo sin cambio de entrada, la prueba permanece bloqueada hasta resolver la causa;
5. los reintentos podrán usarse para diagnóstico o para confirmar la corrección, no para seleccionar el único verde;
6. el gate deberá distinguir fallo funcional de infraestructura cuando la evidencia permita hacerlo.

#### 21. Evidencia mínima por ejecución

La evidencia de pruebas propias deberá conservar, como mínimo:

| Campo lógico            | Obligación                                       |
| ----------------------- | ------------------------------------------------ |
| package                 | identidad canónica                               |
| candidato o versión     | identidad exacta evaluada                        |
| source commit           | commit que produjo el snapshot                   |
| manifest identity       | identidad del manifest del package               |
| internal dependency set | dependencias internas exactas aplicables         |
| runtime                 | runtime efectivo de ejecución                    |
| test contract           | versión o identidad de la declaración de pruebas |
| fixture identities      | fixtures utilizados                              |
| required groups         | categorías exigidas                              |
| executed groups         | categorías realmente ejecutadas                  |
| test counts             | totales, correctos, fallidos y omitidos          |
| run identity            | identidad única de la ejecución                  |
| start/end               | ventana de ejecución                             |
| outcome                 | resultado final                                  |
| artifacts               | reportes o logs reproducibles permitidos         |
| invalidation reason     | causa cuando el resultado queda stale            |

La evidencia no incluirá secretos, tokens, payloads sensibles ni datos personales innecesarios.

#### 22. Vigencia e invalidación

El resultado de CI001 queda `STALE` y exige nueva ejecución cuando cambia una entrada que pueda alterar la suite o su oracle, incluyendo:

- source commit;
- manifest del package;
- candidato o versión;
- dependencia interna relevante;
- runtime soportado;
- configuración de pruebas;
- fixture;
- snapshot esperado;
- schema o catálogo consumido;
- contrato propietario;
- código del runner global;
- criterio de éxito del gate.

Cambios puramente descriptivos que no alteren el artefacto, suite, oracle ni ambiente podrán conservar la evidencia únicamente si la identidad material evaluada permanece demostrablemente igual.

#### 23. Perfil `@vento/contracts`

Las pruebas propias deberán cubrir, según las superficies materializadas:

- exports públicos;
- schemas;
- catálogos cerrados;
- tipos derivados;
- validadores;
- diagnósticos compartidos;
- serialización determinista cuando aplique;
- aceptación de casos válidos;
- rechazo de casos inválidos y versiones incompatibles;
- prohibición de relajar tipos o usar casts para ocultar incompatibilidad.

Las pruebas del consumidor y la compatibilidad entre versiones permanecen en CI005/CI006 según corresponda.

#### 24. Perfil `@vento/os-context`

Las pruebas propias deberán cubrir, según el contrato materializado:

- validación de contexto y decisiones;
- fronteras server/client;
- inputs confiables frente a valores manipulados;
- casos permitidos y denegados;
- fail-closed ante contrato inválido o backend no disponible;
- separación entre contexto real, simulación y compatibilidad legacy;
- no ampliación de autoridad por fallback, booleanos legacy o contexto incompleto;
- razones y proyecciones seguras conforme a los contratos vigentes;
- frescura, invalidación y cache cuando sus tareas propietarias estén materializadas.

La matriz contra consumidores pertenece a CI005 y la ejecución dentro de cada consumidor a CI006.

#### 25. Perfil `@vento/supabase`

Las pruebas propias deberán cubrir, según las superficies materializadas:

- factories y clientes compartidos;
- tipos generados;
- wrappers RPC;
- parámetros, resultados y errores contractuales;
- ausencia de acceso privilegiado o bypass introducido por el SDK;
- coherencia con el contrato de schema y tipos aplicable;
- separación entre SDK y cambios físicos de base de datos.

Una prueba del package no autoriza ni ejecuta DDL, DML, backfill, RLS, trigger, función, Storage, Realtime, Edge Function, secreto o configuración. Cualquier cambio de Supabase continúa perteneciendo a `vento-shell` y a su tarea física propietaria.

#### 26. Perfil `@vento/ui-web`

Las pruebas propias deberán cubrir, según las superficies materializadas:

- unidades y componentes;
- render esperado;
- estados interactivos;
- contratos de props y eventos;
- accesibilidad automatizable;
- comportamiento de hidratación cuando el package lo requiera;
- contrato CSS y tokens compartidos aplicables;
- regresión visual cuando cambien apariencia, estructura, layout, marca o estados;
- ausencia de imports internos no públicos y dependencias locales no declaradas.

La integración completa en cada aplicación consumidora permanece en CI005/CI006 y no se certifica por una prueba aislada del package.

#### 27. Relación con CI002 — build independiente

CI002 deberá producir la evidencia de build independiente que CI001 puede consumir como parte de `PKG-GATE-005` cuando corresponda.

CI001 no:

- define el formato final del artefacto compilado;
- decide output de build;
- decide declarations;
- certifica que un package es publicable;
- duplica el build como una segunda implementación.

Si las pruebas necesitan código compilado, usarán el artefacto exacto que CI002 certifique para ese snapshot.

#### 28. Relación con CI003 — release versionada

CI003 fija la identidad publicada e inmutable.

CI001 conserva lineage suficiente para responder:

```text
¿las pruebas que se presentan como evidencia corresponden exactamente al contenido que CI003 pretende publicar o publicó?
```

Si la respuesta no puede demostrarse, la evidencia queda inválida.

#### 29. Relación con CI004 — changelog

CI004 gobierna generación y consistencia del changelog.

CI001 podrá producir resultados de prueba que CI004 o el release consuman como evidencia, pero no decide la clasificación del cambio ni redacta el changelog.

#### 30. Relación con CI005 — matriz de compatibilidad

CI005 certifica combinaciones package–consumidor.

El `PASS` de pruebas propias de CI001 es una entrada necesaria para esa matriz, pero no sustituye:

- instalación del consumidor;
- typecheck del consumidor;
- build del consumidor;
- pruebas del consumidor;
- perfil especializado completo;
- bandas soportadas;
- evidencia por relación.

#### 31. Relación con CI006 — actualización de consumidores

CI006 aplica los gates a una propuesta concreta en un consumidor.

CI001 entrega a CI006 únicamente evidencia vigente de las pruebas propias del package. CI006 deberá rechazarla si no corresponde al package, versión/candidato, commit y conjunto exactos que forman parte de la propuesta.

#### 32. Gate del propio habilitador global

`SHELL-CI-001::GLOBAL` no se certificará por existir físicamente.

La implementación deberá probarse a sí misma contra, como mínimo, estas familias de regresión:

1. falso verde con cero tests;
2. falso verde con runner inexistente;
3. falso verde con exit code ignorado;
4. falso verde con test requerido deshabilitado;
5. stale tratado como vigente;
6. resultado de otro commit reutilizado;
7. fixture cambiado sin invalidación;
8. intermitencia ocultada mediante reintento;
9. `NOT_APPLICABLE` aplicado a una obligación universal;
10. package no gobernado aceptado como certificado;
11. evidencia incompleta aceptada;
12. fallo de infraestructura convertido en éxito;
13. pérdida de historial de intentos fallidos;
14. divergencia entre resultado legible por máquina y exit outcome del gate;
15. duplicación de una segunda implementación del habilitador por package.

La ausencia de cualquiera de estas defensas aplicables bloquea la certificación global.

#### 33. Criterios de materialización de `SHELL-CI-001::GLOBAL`

La instancia física podrá declararse materializada únicamente cuando:

1. exista una implementación única en el repositorio propietario;
2. pueda identificar las cuatro familias vigentes sin aceptar familias no aprobadas por inferencia;
3. permita registrar o descubrir la declaración de pruebas de cada package materializado;
4. ejecute y agregue resultados sin ocultar fallos;
5. produzca evidencia atribuible y machine-readable;
6. aplique invalidación de evidencia;
7. distinga los estados fail-closed canónicos;
8. detecte cero tests y omisiones obligatorias;
9. preserve intentos fallidos y reintentos;
10. supere sus casos positivos y negativos;
11. demuestre determinismo para entradas deterministas;
12. no contenga secretos ni datos sensibles en evidencia;
13. no publique packages ni modifique consumidores;
14. no sustituya CI002..CI006;
15. demuestre rollback seguro del habilitador;
16. quede asociado a una versión o identidad de implementación y commit reproducibles.

#### 34. Rollback del habilitador global

El rollback de CI001 nunca elimina la obligación de probar packages.

Reglas:

1. si existe una versión anterior certificada del habilitador, el rollback puede restituirla;
2. la versión restituida deberá seguir comprendiendo el contrato del package evaluado;
3. evidencia producida por una versión incompatible del habilitador no se reutiliza automáticamente;
4. si no existe una versión anterior certificada, el sistema vuelve a estado **bloqueado para habilitación de packages**, no a un modo sin pruebas;
5. rollback no permite ignorar fallos conocidos ni convertir suites incompatibles en correctas;
6. el evento de rollback conserva causa, identidad de origen/destino y evidencia posterior de que el gate volvió a operar.

#### 35. Cierre de la instancia global

El marcador global queda contractualmente definido con esta tarea.

La futura instancia `SHELL-CI-001::GLOBAL` solo podrá cerrarse cuando exista evidencia real y vigente de:

- automatización del habilitador;
- casos positivos;
- casos negativos;
- regresión del propio gate;
- reproducibilidad de la ejecución de pruebas;
- integración con la identidad del package;
- fail-closed ante omisiones y fallos;
- rollback del habilitador;
- ausencia de implementaciones duplicadas por package.

La evidencia de CI002 podrá complementar el build reproducible cuando ese gate se materialice, pero no es sustituida ni anticipada por CI001.

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** el registro vigente ya contiene obligaciones suficientes para pruebas propias de packages compartidos, compatibilidad, evidencia, gates de actualización y control de regresiones. Esta tarea materializa el contrato de ejecución correspondiente a su responsabilidad sin crear una obligación nueva ni alterar una fila histórica.

#### 37. Cobertura de prueba vigente reutilizada

La cobertura existente se conserva sin modificación:

- `TREQ-SHELL-005` protege comandos reproducibles y evita falsos verdes de tooling;
- `TREQ-SHELL-006` exige pruebas propias y compatibilidad antes de publicar o adoptar versiones compartidas;
- `TREQ-SHELL-008` exige declaración y evidencia reproducible de requisitos afectados por package y PR;
- `TREQ-SHELL-038` vincula CI001 con la evidencia necesaria para deprecaciones de superficies y líneas estables;
- `TREQ-SHELL-039` vincula CI001 con la certificación previa al retiro y fin de soporte.

Estas referencias son trazabilidad de cobertura vigente y no representan creación, modificación, diferimiento, descarte u obsolescencia del registro.

#### 38. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                      |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED   | El marcador global no materializa el habilitador ni ejecuta build físico.                                                      |
| LOCAL     | PASS           | El contrato documental define alcance, gates, perfiles, fallos seguros, evidencia, rollback y continuidad sin cambios físicos. |
| REMOTA    | NOT_EXECUTED   | No se ejecutó la futura instancia global contra CI remoto ni packages publicados.                                              |
| OPERATIVA | NOT_APPLICABLE | No existe operación productiva autorizada en este marcador documental.                                                         |
| FÍSICA    | NOT_APPLICABLE | La materialización pertenece a `SHELL-CI-001::GLOBAL` después de la aprobación del contrato.                                   |

#### 39. Criterios de aceptación

`SHELL-CI-001` queda documentalmente completa cuando:

- identifica la topología `GLOBAL_ENABLE_ONCE` y la instancia `SHELL-CI-001::GLOBAL`;
- conserva exactamente las cuatro familias de packages aprobadas;
- define la unidad exacta de evaluación y sus dimensiones de identidad;
- define una declaración automatizable de suite propia por package;
- exige pruebas positivas, negativas y de regresión;
- bloquea cero tests, skips obligatorios, fallos, timeouts, cancelaciones y evidencia stale;
- conserva los nueve estados de gate ya aprobados sin crear un estado permisivo alterno;
- reconcilia CI001 con `PKG-GATE-001` sin absorber release;
- reconcilia CI001 con `PKG-GATE-005` sin absorber el build independiente de CI002;
- define perfiles propios para contracts, os-context, supabase y ui-web conforme a sus fronteras vigentes;
- define evidencia mínima, invalidación, determinismo, fixtures e intermitencia;
- define al menos quince regresiones del habilitador global;
- define dieciséis condiciones de materialización y rollback fail-closed;
- no publica packages ni modifica consumidores, CI, Supabase o datos;
- no crea ni modifica requisitos de prueba;
- entrega a CI002 una frontera clara: pruebas propias definidas, build independiente todavía reservado.

#### 40. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-001::GLOBAL` durante el marcador;
- crea archivos de tests, workflows, runners o configuración de CI;
- crea una ruta o nombre de script no aprobado por el estado físico actual;
- crea packages que todavía no existen;
- transforma `@vento/os-context@0.1.0` en release estable;
- ejecuta pruebas de consumidor;
- ejecuta build independiente por package;
- publica packages, tags o releases;
- genera changelog;
- certifica matrices de compatibilidad;
- abre o modifica pull requests de consumidores;
- habilita auto-merge o auto-deploy;
- ejecuta cambios de Supabase;
- modifica requisitos del registro 04A;
- avanza a CI002 sin instrucción posterior del usuario.

#### 41. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-UI-039`

**TAREA ACTUAL APROBADA**
`SHELL-CI-001 — Crear pruebas de paquetes compartidos`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-002 — Crear build independiente por paquete`


### [ ] SHELL-CI-002 — Crear build independiente por paquete
### [ ] SHELL-CI-003 — Crear releases versionados
### [ ] SHELL-CI-004 — Crear changelog automático
### [ ] SHELL-CI-005 — Crear matriz de compatibilidad
### [ ] SHELL-CI-006 — Crear actualización de consumidores mediante PR
