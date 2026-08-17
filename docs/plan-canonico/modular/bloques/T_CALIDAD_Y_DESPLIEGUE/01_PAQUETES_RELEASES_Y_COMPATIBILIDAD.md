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


### ✅ SHELL-CI-002 — Crear build independiente por paquete

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-001 — Crear pruebas de paquetes compartidos
**Tarea siguiente:** SHELL-CI-003 — Crear releases versionados
**Tipo de tarea:** Habilitador global único — contrato documental de build independiente y artefactos publicables de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el habilitador global que gobernará el **build independiente de cada package compartido de Vento OS**, de modo que cada familia pueda producir desde un snapshot exacto un artefacto npm instalable, verificable y reproducible sin depender del build de una aplicación consumidora ni del build de la aplicación raíz de `vento-shell`.

La regla vinculante queda fijada así:

```text
PACKAGE GOBERNADO
+ SNAPSHOT EXACTO
+ TOOLCHAIN IDENTIFICADO
+ DEPENDENCIAS RESUELTAS
+ BUILD LIMPIO Y ACOTADO AL PACKAGE
+ EXPORTS Y DECLARATIONS RESOLUBLES
+ ARTEFACTO EMPAQUETABLE
+ REPRODUCIBILIDAD DEMOSTRADA
= BUILD DE PACKAGE ELEGIBLE
```

Y, de forma fail-closed:

```text
FUENTE TYPESCRIPT EXPUESTA COMO ARTEFACTO FINAL
O OUTPUT STALE
O EXPORT ROTO
O DECLARATION AUSENTE
O DEPENDENCIA LOCAL NO RESUELTA
O BUILD NO REPRODUCIBLE
≠ PASS
```

Esta tarea no ejecuta todavía la instancia física global. Define el contrato que `SHELL-CI-002::GLOBAL` deberá materializar una sola vez y que todos los packages reutilizarán sin duplicar el habilitador.

#### 2. Resultado canónico

`SHELL-CI-002` establece un único contrato transversal para:

1. identificar el package y el snapshot exactos que se construyen;
2. ejecutar un build limpio y dirigido a un solo package;
3. impedir que el build del package dependa del build de Next.js u otra aplicación consumidora;
4. resolver dependencias internas declaradas sin introducir dependencias implícitas;
5. producir runtime, declarations y assets únicamente cuando formen parte de la superficie pública aprobada;
6. comprobar que `exports`, `main`, `types` y subpaths declarados resuelven dentro del artefacto construido;
7. impedir que una release estable apunte directamente a fuente TypeScript no construida;
8. comprobar que el artefacto puede empaquetarse como package npm sin referencias locales inválidas;
9. capturar identidad, contenido e integridad del candidato de build;
10. demostrar reproducibilidad bajo el mismo snapshot y toolchain;
11. ejecutar contract checks sobre el artefacto construido sin absorber las pruebas funcionales propias de CI001;
12. producir evidencia consumible por CI003 y CI005 sin declarar por sí solo una release ni una combinación compatible;
13. probar el propio habilitador contra falsos verdes de build;
14. conservar rollback seguro del habilitador global;
15. mantener una sola implementación transversal para las cuatro familias aprobadas.

#### 3. Base vinculante

La definición conserva las decisiones aprobadas de distribución, versionado y gates:

- packages npm privados e inmutables producidos desde `vento-shell`;
- npm workspaces como mecanismo de autoría e integración local, no como canal de distribución entre repositorios;
- registry privado compatible con npm como canal ordinario de distribución;
- `.tgz` como artefacto verificable y reproducible, no como mecanismo manual ordinario de instalación;
- versiones independientes por package;
- cuatro familias de package compartido vigentes;
- build, declarations y exports publicables como precondición de distribución;
- snapshots de API antes y después cuando el cambio afecte superficie pública;
- correspondencia posterior entre package, versión, manifest, release, commit y artefacto;
- dieciséis gates canónicos de actualización fail-closed;
- matriz de compatibilidad separada del build propio;
- publicación y adopción separadas del acto de construir.

#### 4. Topología de trabajo

La topología de `PHASE-03-T-CI-FOUNDATION` es `GLOBAL_ENABLE_ONCE`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-002
→ define el contrato una sola vez

INSTANCIA FÍSICA FUTURA
SHELL-CI-002::GLOBAL
→ materializa y certifica el habilitador una sola vez

PACKAGES
→ declaran su perfil de build
→ reutilizan el habilitador certificado
→ no crean otra implementación de CI002
```

La instancia global deberá quedar certificada antes de que cualquier package pueda depender de este habilitador para superar una puerta `E5-GATE-008` de su paquete de implementación aplicable.

#### 5. Universo de packages gobernado

El contrato inicial cubre exactamente las cuatro familias compartidas aprobadas:

1. `@vento/contracts`;
2. `@vento/os-context`;
3. `@vento/supabase`;
4. `@vento/ui-web`.

La existencia futura de otra carpeta, workspace o package no la incorpora automáticamente. Toda nueva familia deberá contar primero con identidad y ownership canónicos.

#### 6. Línea base física observada

En el corte actual de `vento-shell`:

- la raíz declara `packages/*` como workspace;
- la raíz declara Node `24.19.0` y npm `11.17.0` como toolchain actual del repositorio;
- bajo `packages/` solo existe físicamente `@vento/os-context`;
- `@vento/os-context` permanece en `0.1.0` y `private: true`;
- `@vento/os-context` declara `type: module`;
- `main`, `types` y `exports["."]` de `@vento/os-context` apuntan directamente a `src/index.ts`;
- su manifest no declara un script de build propio;
- su peer `@supabase/supabase-js` permanece como `>=2.90.0`, sin el límite superior `<3` aprobado para la futura línea estable;
- `@vento/contracts`, `@vento/supabase` y `@vento/ui-web` todavía no existen como packages físicos en el workspace observado;
- el `package.json` raíz contiene build de la aplicación y validadores documentales, pero no demuestra un habilitador global de build independiente para packages compartidos.

Por tanto, no existe evidencia física de un build independiente ya materializado para ninguna de las cuatro familias.

#### 7. Definición de build independiente

Un build será **independiente por package** únicamente si cumple simultáneamente:

1. su unidad objetivo es un package canónico específico;
2. parte de un snapshot de fuente y dependencias identificable;
3. no necesita ejecutar el build de la aplicación raíz de `vento-shell`;
4. no necesita ejecutar el build de un consumidor;
5. no necesita construir packages no relacionados;
6. cuando dependa de otro package interno, consume una identidad exacta y respeta el orden del grafo declarado;
7. escribe únicamente outputs pertenecientes al package objetivo;
8. puede repetirse desde un estado limpio sin reutilizar outputs anteriores;
9. produce un artefacto cuya superficie pública puede validarse sin acceder a rutas privadas del repositorio;
10. no necesita credenciales productivas, conexión a Supabase desplegado ni datos operativos para compilar.

Independencia no significa ausencia de dependencias. Significa que las dependencias son explícitas, cerradas y reproducibles y que el build no obtiene éxito accidental por estado compartido no declarado.

#### 8. Unidad exacta de evaluación

Cada ejecución se atribuirá, como mínimo, a esta identidad lógica:

```text
package_name
package_candidate_version
source_commit
package_manifest_hash
lockfile_hash
toolchain_identity
runtime_identity
resolved_internal_dependency_set
public_surface_identity
build_contract_identity
run_identity
```

Cambiar una dimensión material invalida la evidencia anterior para el nuevo candidato.

#### 9. Entradas obligatorias del build

Todo package materializado deberá declarar de forma machine-readable:

1. identidad canónica del package;
2. versión candidata o identidad pre-release evaluada;
3. entrypoints públicos aprobados;
4. formato o formatos de módulo aprobados por el package propietario;
5. outputs runtime aplicables;
6. declarations TypeScript aplicables;
7. assets públicos aplicables;
8. peers externos y sus bandas permitidas;
9. dependencias internas exactas;
10. runtime soportado cuando sea relevante;
11. inputs generados que formen parte del snapshot;
12. exclusiones de contenido del artefacto;
13. contract checks que deben aplicarse al resultado construido.

El build no inferirá silenciosamente entrypoints, peers o assets a partir de archivos encontrados en el árbol.

#### 10. Salidas obligatorias del build

Cuando apliquen al package, el artefacto construido deberá contener:

- JavaScript ejecutable para cada entrypoint runtime público;
- declarations TypeScript resolubles para cada entrypoint público tipado;
- manifests y metadata necesarios para instalación;
- assets públicos explícitamente aprobados;
- mapas u otros artefactos auxiliares solo cuando estén declarados y no filtren rutas o datos sensibles;
- metadata de integridad suficiente para demostrar qué archivos componen el candidato.

Una salida que solo exponga archivos fuente TypeScript como sustituto del build final no satisface esta tarea para una release estable.

#### 11. Contrato de superficie pública construida

Para cada entrypoint público:

1. la ruta declarada deberá existir dentro del artefacto;
2. ningún export público podrá resolver a un archivo ausente;
3. ningún export público podrá escapar hacia una ruta privada del repositorio;
4. ningún export público podrá depender de una ruta absoluta local;
5. las declarations deberán describir la misma superficie pública expuesta por runtime cuando ambas apliquen;
6. subpaths privados no se volverán públicos por inclusión accidental en el artefacto;
7. `main`, `types` y `exports` deberán ser coherentes entre sí cuando coexistan;
8. la superficie construida deberá poder compararse con el snapshot contractual del package.

#### 12. Reglas sobre source y output

El artefacto final deberá separar fuente de distribución:

- source forma parte del repositorio de autoría;
- output forma parte del candidato distribuible;
- un consumidor no deberá necesitar conocer la estructura privada de source;
- imports públicos no deberán apuntar a `src/` por conveniencia;
- outputs anteriores deberán eliminarse o aislarse antes de una nueva ejecución;
- archivos no generados por el snapshot actual no podrán sobrevivir y producir un falso verde.

El package podrá incluir source únicamente cuando su contrato propietario lo declare como contenido distribuible adicional; esa inclusión no sustituirá los outputs runtime y declarations requeridos.

#### 13. Dependencias internas

Cuando un package dependa de otro package compartido:

1. la dependencia deberá estar declarada expresamente;
2. la versión o candidato consumido deberá ser identificable;
3. el build respetará el orden topológico del grafo;
4. un package no leerá archivos privados del source de otro package;
5. no se admitirán dependencias circulares no resueltas;
6. una release estable no podrá quedar ligada a una prerelease interna no autorizada;
7. el conjunto resuelto deberá formar parte de la evidencia del build;
8. cambiar una dependencia interna material invalidará el resultado anterior.

#### 14. Dependencias externas y peers

El build deberá distinguir entre dependencia runtime, dependencia de desarrollo y peer dependency.

Reglas:

1. los peers no se convertirán silenciosamente en código embebido dentro del artefacto si su contrato exige resolución por el consumidor;
2. una banda externa no podrá exceder el soporte canónico aprobado;
3. una dependencia usada en runtime deberá estar declarada en la categoría contractual correcta;
4. una dependencia exclusiva del build no deberá aparecer como requisito runtime del consumidor;
5. dependencias locales por ruta, Git URL o referencias no publicables no podrán escapar al artefacto candidato;
6. el build bloqueará un candidato estable cuando su peer declarado contradiga una banda canónica vinculante.

Para la línea futura estable de `@vento/os-context`, el peer de Supabase JS deberá quedar acotado por debajo de la major `3`; el rango actual abierto no puede considerarse elegible para publicación estable.

#### 15. Perfil de `@vento/contracts`

El build de `@vento/contracts` deberá:

- permanecer libre de dependencias de framework no aprobadas;
- construir y publicar únicamente entrypoints contractuales aprobados;
- conservar declarations completas y resolubles;
- conservar runtime únicamente para schemas, catálogos u otros símbolos que realmente existan en ejecución;
- detectar imports de Next.js, React, React DOM o Supabase cuando no pertenezcan al contrato propietario;
- producir una superficie comparables mediante snapshot de API;
- impedir que tipos privados o archivos internos se vuelvan exports públicos por accidente.

#### 16. Perfil de `@vento/os-context`

El build de `@vento/os-context` deberá:

- conservar la separación entre entrypoints server, client y cualquier subpath aprobado por sus tareas propietarias;
- evitar que el artefacto client arrastre APIs server, secretos o dependencias no permitidas;
- emitir declarations coherentes con los contratos de contexto y autorización vigentes;
- tratar `@supabase/supabase-js` según su condición de peer aprobada;
- impedir que el package estable siga apuntando directamente a `src/index.ts`;
- impedir bundling que mezcle fronteras server/client;
- permitir contract checks sobre cada entrypoint público construido.

#### 17. Perfil de `@vento/supabase`

El build de `@vento/supabase` deberá:

- tratar tipos generados y wrappers aprobados como inputs versionados del snapshot;
- no conectarse a un proyecto Supabase desplegado para completar la compilación;
- no ejecutar migraciones, DDL, RLS, RPC ni cambios de configuración;
- no incluir service-role, secretos, tokens o valores de ambiente en outputs;
- conservar declarations de factories, wrappers y tipos públicos;
- bloquear imports que dependan de archivos generados fuera del snapshot declarado;
- separar claramente el build del SDK de cualquier cambio físico de base de datos.

#### 18. Perfil de `@vento/ui-web`

El build de `@vento/ui-web` deberá:

- conservar React y otros peers aprobados fuera del bundle cuando el contrato los declare peers;
- producir declarations de props y APIs públicas;
- incluir CSS, tokens, fuentes referenciadas o assets solo cuando formen parte de la superficie aprobada;
- evitar imports internos de una aplicación consumidora;
- evitar dependencias implícitas de rutas, variables o configuración de una app concreta;
- conservar entrypoints compatibles con el entorno web aprobado;
- permitir verificación de que no se introducen estilos globales o assets no declarados por accidente.

#### 19. Contract checks del artefacto construido

La decisión histórica que asigna contract tests a CI002 se concreta aquí exclusivamente como **contract checks de la frontera construida**.

CI002 deberá comprobar, como mínimo:

1. resolución de todos los entrypoints públicos;
2. resolución de declarations;
3. coherencia entre exports runtime y tipos;
4. ausencia de imports a source privado desde la superficie distribuible;
5. ausencia de rutas absolutas locales;
6. ausencia de dependencias locales no publicables;
7. coherencia de peers y runtime declarados;
8. instalación o inspección del artefacto empaquetado en un entorno aislado;
9. carga o importación básica de entrypoints aplicables sin recurrir al árbol fuente;
10. comparación de la superficie pública contra el snapshot contractual aplicable.

Estos checks no absorben las pruebas funcionales, negativas o de seguridad del comportamiento propio del package definidas en CI001.

#### 20. Relación con CI001 — pruebas propias

CI001 certifica el comportamiento propio del package. CI002 certifica que el package construido preserva una frontera distribuible válida.

Cuando una prueba de CI001 necesite código compilado:

- consumirá el artefacto exacto certificado por CI002 para el mismo snapshot;
- no mantendrá una segunda implementación de build;
- no reutilizará un build de otro commit o conjunto de dependencias;
- un cambio de output material invalidará la evidencia que dependa de ese output.

El `PASS` de CI001 no sustituye CI002 y el `PASS` de CI002 no demuestra comportamiento funcional completo.

#### 21. Relación con CI003 — releases versionados

CI002 produce la identidad del **candidato de artefacto construido**. CI003 fija posteriormente la identidad publicada e inmutable de la release.

El handoff deberá permitir demostrar:

```text
SOURCE COMMIT
→ BUILD RUN
→ CONTENIDO CONSTRUIDO
→ ARTEFACTO EMPAQUETADO
→ IDENTIDAD CANDIDATA
→ RELEASE PUBLICADA POR CI003
```

CI002 no crea tags, releases ni publica en registry.

Si CI003 no puede demostrar que el release corresponde al mismo artefacto certificado, la evidencia de build no satisface la release.

#### 22. Relación con CI004 — changelog automático

CI002 podrá aportar snapshots de superficie construida y diferencias verificables entre candidatos. CI004 decide cómo esas diferencias alimentan changelog y evidencia de cambio.

CI002 no redacta changelog ni clasifica por sí solo el cambio SemVer definitivo.

#### 23. Relación con CI005 — matriz de compatibilidad

CI002 entrega a CI005 evidencia de que el package puede construirse, empaquetarse y exponer su superficie bajo el runtime y peers declarados.

CI002 no puede declarar una relación package–consumidor como compatible.

La propiedad compartida de los gates de compatibilidad significa:

- CI002 valida la dimensión de build, exports, declarations, runtime y peers del package;
- CI005 cruza esa evidencia con consumidor, framework, runtime, lockfile y conjunto exacto de versiones;
- el resultado de CI002 es entrada necesaria, no veredicto final de compatibilidad.

#### 24. Relación con CI006 — actualización de consumidores

CI006 podrá consumir la identidad del artefacto y el resultado de CI002 para una propuesta concreta.

CI006 deberá rechazar la evidencia cuando no corresponda al package, versión o candidato, commit, manifest, lockfile, dependencias internas y contenido construido de la propuesta actual.

CI002 no modifica manifests ni lockfiles de consumidores y no abre pull requests.

#### 25. Integración con los gates de packages

CI002 contribuye a los gates aprobados sin cambiar su semántica:

- en pruebas propias, aporta el build aplicable cuando la composición del gate lo requiera;
- en identidad de release, aporta identidad e integridad del candidato construido que CI003 deberá fijar;
- en matriz de compatibilidad, aporta la dimensión build/runtime/peers del package que CI005 deberá evaluar contra consumidores;
- en perfil especializado de familia, aporta los checks de artefacto construido correspondientes a cada familia.

Ninguno de esos aportes permite merge, publicación, despliegue o adopción por sí solo.

#### 26. Reproducibilidad

Un build será reproducible cuando dos ejecuciones limpias sobre la misma identidad lógica, con el mismo toolchain y dependencias resueltas, produzcan el mismo contenido distribuible normalizado.

La comparación deberá excluir únicamente metadata no distributiva expresamente declarada por el contrato del empaquetador. No podrá ocultar diferencias en código, declarations, assets, manifest o exports.

La evidencia deberá conservar al menos:

- conjunto ordenado de archivos distribuibles;
- hash de contenido de cada archivo;
- hash agregado del contenido normalizado;
- identidad del manifest empaquetado;
- identidad de declarations;
- identidad de la superficie exportada;
- integridad del artefacto empaquetado cuando exista;
- toolchain y runtime usados.

#### 27. Limpieza y protección contra output stale

Antes de un build certificable:

1. el output anterior del package no será elegible como entrada implícita;
2. la ejecución deberá partir de un estado limpio de outputs distribuibles;
3. un archivo eliminado de source no podrá sobrevivir en el artefacto por residuo de una ejecución anterior;
4. una ejecución incremental podrá utilizarse para desarrollo, pero no sustituirá la evidencia de un build limpio cuando se certifique reproducibilidad;
5. la comparación limpio-versus-repetido deberá detectar residuos y diferencias no explicadas.

#### 28. Empaquetado verificable

El build deberá poder transformarse en un artefacto npm inspeccionable antes de publicación.

La verificación deberá demostrar:

- identidad correcta de package y versión candidata;
- lista cerrada de archivos incluidos;
- ausencia de secretos y archivos operativos no distribuibles;
- resolución de exports y declarations desde el contenido empaquetado;
- ausencia de referencias a rutas locales del workspace;
- integridad capturable del artefacto;
- instalación o importación básica en un entorno aislado cuando aplique.

El empaquetado verificable no equivale a publicación. La publicación continúa reservada a CI003.

#### 29. Evidencia machine-readable

Cada ejecución certificable conservará, como mínimo:

```text
package_name
package_candidate_version
source_commit
package_manifest_hash
lockfile_hash
toolchain_identity
runtime_identity
resolved_internal_dependency_set
public_surface_identity
build_contract_identity
run_identity
build_status
artifact_file_manifest
artifact_content_hash
declarations_identity
exports_identity
pack_integrity
started_at
completed_at
invalidation_reason
```

No se almacenarán secretos, tokens, credenciales ni valores de configuración sensible dentro de esta evidencia.

#### 30. Invalidación

La evidencia deberá pasar a no vigente cuando cambie de forma material cualquiera de estos elementos:

- source commit;
- package manifest;
- lockfile;
- versión candidata;
- toolchain;
- runtime de build;
- dependencia interna;
- banda de peer relevante;
- entrypoint público;
- configuración de compilación;
- declarations;
- assets públicos;
- snapshot de superficie;
- reglas de empaquetado;
- contract checks del artefacto.

La nueva evidencia deberá provenir de otra ejecución atribuible. No se editará manualmente un resultado anterior para hacerlo coincidir con entradas nuevas.

#### 31. Estados y fallo seguro

La instancia física reutilizará la semántica canónica de estados de gate:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente para comprobaciones condicionales justificadas.

El build propio requerido de una familia gobernada solo se satisface con `PASS`.

Un comando ausente, output vacío, error de compilación, export roto, declaration faltante, package no materializado, dependencia irresoluble, timeout o evidencia stale no podrá normalizarse a `PASS`.

#### 32. Casos positivos obligatorios del habilitador

`SHELL-CI-002::GLOBAL` deberá demostrar, como mínimo:

1. package materializado con build completo → artefacto válido y atribuible;
2. dos builds limpios del mismo snapshot → mismo contenido distribuible normalizado;
3. package con declarations → tipos resolubles desde el artefacto empaquetado;
4. package con varios entrypoints → todos resuelven y ninguno escapa a source privado;
5. package con peer externo válido → peer preservado y no convertido silenciosamente en dependencia embebida incompatible;
6. package con dependencia interna exacta → build respeta el grafo y registra la identidad consumida;
7. artefacto empaquetado → importación o inspección aislada satisfactoria sin acceder al árbol fuente;
8. nuevo build después de cambio legítimo → evidencia nueva sin borrar la ejecución anterior.

#### 33. Casos negativos obligatorios del habilitador

`SHELL-CI-002::GLOBAL` deberá bloquear, como mínimo:

1. package sin declaración de build;
2. package gobernado todavía no materializado;
3. script de build inexistente o no ejecutable;
4. build que en realidad ejecuta únicamente el build de la aplicación raíz;
5. build que finaliza con cero outputs distribuibles requeridos;
6. manifest público que apunta a `src/` como artefacto estable;
7. entrypoint declarado cuyo archivo construido no existe;
8. declaration requerida ausente o irresoluble;
9. export público que depende de archivo privado del repositorio;
10. referencia absoluta local en output;
11. dependencia local, Git URL o referencia workspace no resoluble en el artefacto final;
12. dependencia runtime usada pero no declarada correctamente;
13. peer incompatible con una banda canónica vinculante;
14. build que necesita credenciales productivas o conexión a Supabase desplegado;
15. output contaminado por archivos stale de una ejecución anterior;
16. dos builds limpios del mismo snapshot con diferencias distribuibles no justificadas;
17. build de un package que modifica outputs de otro package;
18. artefacto empaquetado que no puede resolverse fuera del árbol fuente;
19. inclusión de secretos, tokens o configuración sensible;
20. evidencia de otro commit, manifest, lockfile, toolchain o dependencia reutilizada como vigente.

#### 34. Regresiones del propio habilitador global

La implementación única deberá probarse contra, como mínimo:

1. falso verde por script que no compila;
2. falso verde por output heredado;
3. falso verde por `main` existente pero `exports` roto;
4. falso verde por declarations desactualizadas;
5. falso verde por artefacto empaquetado que depende del workspace;
6. falso verde por import que funciona solo desde source;
7. diferencia reproducible ignorada por comparación incompleta;
8. peer incompatible tratado como warning no bloqueante;
9. dependencia interna distinta reutilizando evidencia anterior;
10. package desconocido aceptado como familia gobernada;
11. build cancelado o con timeout presentado como correcto;
12. contract check obligatorio omitido;
13. salida con secreto no detectado;
14. build de una familia escribiendo sobre otra;
15. evidencia humana que contradice el resultado machine-readable;
16. segunda implementación del habilitador creada dentro de un package.

#### 35. Criterios de materialización de `SHELL-CI-002::GLOBAL`

La instancia física podrá declararse materializada únicamente cuando:

1. exista una sola implementación transversal en el repositorio propietario;
2. reconozca exactamente las cuatro familias aprobadas;
3. cada package materializado pueda declarar su perfil de build;
4. el build dirigido no requiera el build de la aplicación raíz ni del consumidor;
5. los outputs se generen desde estado limpio;
6. exports, main, types y subpaths aplicables se validen desde el artefacto construido;
7. las declarations requeridas sean resolubles;
8. el artefacto pueda empaquetarse e inspeccionarse fuera del árbol fuente;
9. dependencias internas exactas y peers queden verificadas;
10. los cuatro perfiles de familia puedan aplicar sus checks propios;
11. la ejecución produzca evidencia machine-readable atribuible;
12. dos builds limpios del mismo snapshot demuestren reproducibilidad;
13. los veinte casos negativos aplicables queden bloqueados;
14. las dieciséis regresiones del propio habilitador queden protegidas;
15. no se publiquen releases ni se modifiquen consumidores;
16. no se requieran credenciales productivas ni cambios de Supabase;
17. exista rollback seguro del habilitador;
18. la implementación quede vinculada a una identidad y commit reproducibles.

#### 36. Rollback del habilitador global

El rollback de CI002 nunca autoriza volver a distribuir source no construido ni omitir el build independiente.

Reglas:

1. podrá restituirse una versión anterior certificada del habilitador;
2. la versión restituida deberá comprender el contrato del package evaluado;
3. evidencia generada por una versión incompatible del habilitador no se reutilizará automáticamente;
4. si no existe versión certificada compatible, los packages quedan bloqueados para build certificable;
5. rollback no revalida artefactos stale ni peers incompatibles;
6. la recuperación conservará identidad de origen, identidad restituida, causa y nueva evidencia de funcionamiento.

#### 37. Estado documental de las cuatro familias

| Package             | Estado físico observado                                            | Build independiente confirmado | Bloqueo actual de salida                                                                                      |
| ------------------- | ------------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| `@vento/contracts`  | package físico no observado                                        | No                             | materializar package y contrato de build antes de certificarlo                                                |
| `@vento/os-context` | workspace transitorio `0.1.0`, privado y exportando `src/index.ts` | No                             | construir outputs publicables, corregir superficie distribuible y acotar el peer de Supabase antes de estable |
| `@vento/supabase`   | package físico no observado                                        | No                             | materializar package y contrato de build sin acoplarlo a cambios de base de datos                             |
| `@vento/ui-web`     | package físico no observado                                        | No                             | materializar package, outputs UI y contrato de assets/peers antes de certificarlo                             |

**Conciliación:** 4 familias esperadas, 4 evaluadas documentalmente, 0 builds independientes confirmados y 0 familias omitidas.

#### 38. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** las obligaciones de comandos reproducibles, pruebas y compatibilidad de packages, evidencia por entrega, identidad inmutable de artefactos y validación previa a adopción ya existen en el registro vigente. CI002 concreta el contrato de materialización de esas obligaciones para el build independiente sin introducir un comportamiento empresarial nuevo ni alterar una fila histórica.

#### 39. Cobertura de prueba vigente reutilizada

La cobertura existente se conserva sin modificación:

- `TREQ-SHELL-005` protege comandos reproducibles, build real y bloqueo de falsos verdes;
- `TREQ-SHELL-006` exige pruebas propias y matriz de compatibilidad antes de publicar o adoptar un package compartido;
- `TREQ-SHELL-008` exige trazabilidad reproducible de requisitos y resultados;
- `TREQ-SHELL-036` protege la correspondencia inmutable entre package, versión, manifest, commit y artefacto y asigna responsabilidad a CI002 y CI003;
- `TREQ-SHELL-037` protege cortes coordinados y dependencias internas exactas;
- `TREQ-SHELL-039` exige build y pruebas antes de retiro o fin de soporte.

Estas referencias expresan únicamente trazabilidad de cobertura vigente.

#### 40. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                        |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED   | El marcador global no materializa `SHELL-CI-002::GLOBAL` ni ejecuta builds de packages.                                                          |
| LOCAL     | PASS           | El artefacto documental fue comprobado estructuralmente contra cabecera, secciones obligatorias, continuidad, TREQ y consistencia interna.       |
| REMOTA    | PASS           | Se verificaron en `main` la continuidad activa, el propietario, CI001 aprobado, el workspace actual y el manifest físico de `@vento/os-context`. |
| OPERATIVA | NOT_EXECUTED   | No existe ejecución operativa del habilitador ni publicación de packages en este marcador.                                                       |
| FÍSICA    | NOT_APPLICABLE | La materialización física corresponde a la futura instancia única `SHELL-CI-002::GLOBAL`.                                                        |

#### 41. Criterios de aceptación

`SHELL-CI-002` queda documentalmente completa cuando:

- identifica la topología `GLOBAL_ENABLE_ONCE` y la instancia `SHELL-CI-002::GLOBAL`;
- conserva exactamente las cuatro familias aprobadas;
- define build independiente sin depender del build de una app raíz o consumidora;
- define la unidad exacta de evaluación y sus entradas;
- define runtime, declarations y assets como outputs contractuales cuando apliquen;
- exige coherencia entre `exports`, `main`, `types` y subpaths;
- impide source TypeScript como sustituto del artefacto estable construido;
- define reglas de dependencias internas, peers y runtime;
- define perfiles específicos para contracts, os-context, supabase y ui-web;
- concilia contract checks de CI002 sin absorber pruebas funcionales de CI001;
- produce handoff de identidad de artefacto hacia CI003 sin publicar;
- aporta a CI005 la dimensión build/runtime/peers sin declarar compatibilidad;
- define reproducibilidad mediante contenido distribuible normalizado;
- define limpieza de outputs y protección contra stale;
- define empaquetado verificable sin confundirlo con publicación;
- define evidencia machine-readable e invalidación;
- define al menos ocho casos positivos, veinte casos negativos y dieciséis regresiones del habilitador;
- define dieciocho criterios de materialización y rollback fail-closed;
- reconcilia 4/4 familias con 0 builds independientes actualmente confirmados;
- no modifica código, CI, consumers, registry, datos o Supabase durante el marcador global;
- no crea ni modifica requisitos de prueba;
- entrega a CI003 un candidato de artefacto identificable sin anticipar la release.

#### 42. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-002::GLOBAL` durante el marcador;
- crea scripts, workflows, runners, configuraciones de compilación o directorios de output;
- decide nombres físicos de comandos o archivos que aún no existen;
- crea packages ausentes;
- modifica `@vento/os-context` ni corrige todavía su manifest;
- cambia la API pública aprobada de ningún package;
- ejecuta las pruebas funcionales propias reservadas a CI001;
- crea tags, releases o publicaciones reservadas a CI003;
- genera changelog reservado a CI004;
- certifica combinaciones package–consumidor reservadas a CI005;
- modifica manifests o lockfiles de consumidores ni abre pull requests reservados a CI006;
- configura registry, credenciales o permisos de publicación;
- habilita auto-merge o auto-deploy;
- ejecuta cambios de Supabase;
- modifica requisitos del registro 04A.

#### 43. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-001 — Crear pruebas de paquetes compartidos`

**TAREA ACTUAL APROBADA**
`SHELL-CI-002 — Crear build independiente por paquete`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-003 — Crear releases versionados`


### [ ] SHELL-CI-003 — Crear releases versionados
### [ ] SHELL-CI-004 — Crear changelog automático
### [ ] SHELL-CI-005 — Crear matriz de compatibilidad
### [ ] SHELL-CI-006 — Crear actualización de consumidores mediante PR
