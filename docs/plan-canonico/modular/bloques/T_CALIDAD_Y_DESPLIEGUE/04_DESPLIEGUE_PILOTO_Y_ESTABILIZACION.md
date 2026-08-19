### MINI-BLOQUE — DESPLIEGUE PILOTO Y ESTABILIZACION

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `SHELL-CI-020` a `SHELL-CI-024` — 5 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-CI-020 — Implementar y desplegar cada paquete aprobado por E5

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio
**Tarea siguiente:** SHELL-CI-021 — Ejecutar y resolver el checklist de readiness aprobado
**Tipo de tarea:** Plantilla global con ejecución por paquete — contrato documental de orquestación, implementación, despliegue técnico, validación y trazabilidad de cada paquete aprobado por E5
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/04_DESPLIEGUE_PILOTO_Y_ESTABILIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; la materialización futura ocurre únicamente mediante `SHELL-CI-020::<package_id>` con paquete aprobado por `E5-GATE-008::<package_id>` y autorización física separada
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo Vento OS convierte cada paquete que supera `E5-GATE-008::<package_id>` en una ejecución física trazable, reproducible, reversible y validable, sin reabrir el diseño aprobado, sin ampliar alcance por inferencia y sin mezclar implementación, readiness, cutover, piloto, hypercare ni cierre.

La regla vinculante queda:

```text
PAQUETE E5 APROBADO
+ PACKAGE_ID EXACTO
+ ALCANCE CERRADO
+ REPOSITORIOS Y OWNERS RESUELTOS
+ IMPLEMENTATION UNITS APROBADAS
+ ORDEN DE APLICACIÓN
+ TREQ Y PRUEBAS
+ ROLLBACK
+ EVIDENCIA CI019 RECUPERABLE
+ AUTORIZACIÓN FÍSICA EXPLÍCITA
+ IMPLEMENTACIÓN Y DESPLIEGUE TÉCNICO
+ VALIDACIÓN CONTRACTUAL COMPLETA
= SHELL-CI-020::<package_id> VERIFIED
```

Y de forma fail-closed:

```text
PACKAGE_ID INFERIDO
O PAQUETE SIN E5-GATE-008
O ALCANCE AMPLIADO DURANTE EJECUCIÓN
O REPOSITORIO NO DECLARADO
O IMPLEMENTATION UNIT NO APROBADA
O CAMBIO DE DATOS SIN CONTRATO
O TREQ CRÍTICO OMITIDO
O VALIDATION_COMMAND OMITIDO
O EVIDENCIA DE OTRO COMMIT
O DEPLOY NO TRAZABLE
O ROLLBACK NO DISPONIBLE CUANDO APLIQUE
O FALLO BLOQUEANTE ABIERTO
≠ CI020 VERIFIED
```

`SHELL-CI-020` implementa y despliega técnicamente el paquete. No decide readiness, no ejecuta cutover ni piloto, no ejecuta hypercare y no certifica cierre.

#### 2. Resultado canónico

`SHELL-CI-020` establece una única plantilla reutilizable para que cada paquete aprobado por E5:

1. obtenga una instancia física independiente `SHELL-CI-020::<package_id>`;
2. consuma el paquete E5 como contrato de alcance inmutable durante la ejecución;
3. ejecute únicamente implementation units y cambios físicos vinculados al mismo `package_id`;
4. preserve la autoridad semántica de las tareas propietarias de cada cambio;
5. materialice código, configuración, contratos, infraestructura y migraciones aprobadas;
6. despliegue únicamente a ambientes y superficies autorizados por el paquete;
7. conserve commits, versiones, ambientes y evidencia por repositorio;
8. consuma evidencia CI019 por identidad exacta, no por “latest”;
9. ejecute una sola batería física final formada exclusivamente por `validation_commands`;
10. distinga `IMPLEMENTED` de `VERIFIED`;
11. mantenga la instancia en `IMPLEMENTED` mientras falte evidencia remota obligatoria;
12. consolide evidencia física y de validación en el registro propio de la instancia;
13. bloquee expansión de alcance y cambios no previstos;
14. preserve rollback, compatibilidad y orden contractual;
15. no avance a `SHELL-CI-021::<package_id>` hasta quedar `VERIFIED`;
16. no modifique el estado de otras instancias ni del marcador global;
17. permita que paquetes distintos avancen de forma independiente cuando sus dependencias lo permitan;
18. mantenga toda modificación de Supabase dentro de `vento-shell`;
19. no cree una fuente paralela de verdad para paquetes, TREQ o evidencia;
20. entregue un handoff inequívoco al readiness del mismo `package_id`.

#### 3. Frontera de responsabilidad del ciclo CI020..024

| Etapa                        | Responsabilidad                                                                                                           |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| E5                           | Diseñar y aprobar cómo se implementa el paquete, con pruebas, readiness, cutover, piloto, rollback, hypercare y evidencia |
| `E5-GATE-008::<package_id>`  | Autorizar que el paquete exacto pueda entrar a ejecución física                                                           |
| `SHELL-CI-020::<package_id>` | Implementar y desplegar técnicamente el paquete aprobado                                                                  |
| `SHELL-CI-021::<package_id>` | Ejecutar y resolver el checklist de readiness aprobado                                                                    |
| `SHELL-CI-022::<package_id>` | Ejecutar cutover y piloto conforme al plan aprobado                                                                       |
| `SHELL-CI-023::<package_id>` | Ejecutar hypercare, conciliación y estabilización                                                                         |
| `SHELL-CI-024::<package_id>` | Certificar cierre del paquete y transferencia a soporte                                                                   |

La salida positiva de CI020 significa:

```text
EL PAQUETE ESTÁ IMPLEMENTADO
+ EL DESPLIEGUE TÉCNICO EXIGIDO POR CI020 ESTÁ VALIDADO
+ LA EVIDENCIA ES TRAZABLE
```

No significa:

```text
READINESS APROBADO
NI CUTOVER EJECUTADO
NI PILOTO APROBADO
NI HYPERCARE CERRADO
NI PAQUETE CERRADO
```

#### 4. Topología de trabajo

La topología vigente es `TEMPLATE_PER_PACKAGE`.

```text
MARCADOR GLOBAL
SHELL-CI-020
→ define una vez el contrato

INSTANCIAS FÍSICAS
SHELL-CI-020::<package_id>
→ ejecutan el contrato de forma independiente
```

La aprobación documental del marcador global no implementa ningún paquete.

Una instancia física no reabre, modifica ni vuelve a aprobar `SHELL-CI-020`.

#### 5. Cadena física obligatoria por paquete

Para cada `package_id`:

```text
E5-GATE-008::<package_id>
→ SHELL-CI-020::<package_id>
→ SHELL-CI-021::<package_id>
→ SHELL-CI-022::<package_id>
→ SHELL-CI-023::<package_id>
→ SHELL-CI-024::<package_id>
```

No se salta una etapa por disponer de evidencia de otra.

Un paquete puede encontrarse en CI020 mientras otro, sin dependencia bloqueante, se encuentra en otra etapa del ciclo.

#### 6. Condiciones de entrada a CI020

Una instancia `SHELL-CI-020::<package_id>` solo podrá quedar lista para autorización física cuando estén resueltos, como mínimo:

1. `package_id` canónico exacto;
2. `DELIV-PKG` propietario del paquete;
3. `E5-GATE-008::<package_id>` aprobado;
4. `SHELL-CI-001..019` materializados conforme a su topología y aplicabilidad;
5. repositorios propietarios del alcance;
6. propietarios funcionales y técnicos;
7. alcance objetivo aprobado;
8. impactos de autorización;
9. impactos de datos e integraciones;
10. implementation units obligatorias y condicionales incluidas;
11. exclusiones explícitas;
12. orden de aplicación;
13. pruebas y `TREQ-*` aplicables;
14. `validation_commands`;
15. ambientes objetivo;
16. condiciones de suspensión;
17. rollback o justificación canónica cuando no aplique;
18. criterios de evidencia;
19. dependencias y precedencias;
20. ausencia de brechas críticas sin propietario.

La ausencia de una entrada obligatoria bloquea CI020. CI020 no la completa por inferencia.

#### 7. E5 como autoridad de alcance

E5 es la autoridad que transforma decisiones aprobadas en unidades implementables, verificables, desplegables y reversibles.

Por tanto, CI020 consume; no rediseña:

```text
alcance
archivos previstos
repositorios
implementation units
comandos
orden
escenarios
datos de prueba
TREQ
readiness
cutover
piloto
hypercare
suspensión
rollback
evidencia
```

Si durante CI020 se descubre que cualquiera de esos elementos debe cambiar de forma sustantiva, la instancia se bloquea y el cambio vuelve a su owner canónico o a E5 según corresponda.

#### 8. El paquete es una orden cerrada, no una sugerencia

Una vez aprobado `E5-GATE-008::<package_id>`, CI020 no podrá:

- agregar funciones porque “conviene aprovechar”;
- incorporar otro repositorio por proximidad técnica;
- añadir una migración no contemplada;
- crear permisos nuevos para desbloquear una prueba;
- inventar helpers, eventos o fuentes de verdad;
- incorporar otra brecha pendiente;
- sustituir una implementation unit por una solución local no aprobada;
- cambiar el ambiente objetivo;
- reducir pruebas para obtener verde;
- excluir rollback porque la implementación “parece segura”.

Un cambio sustantivo produce cambio de contrato, no una edición oportunista dentro de CI020.

#### 9. Identidad de instancia

La identidad física es:

```text
SHELL-CI-020::<package_id>
```

Su archivo histórico exclusivo usa la convención física de `implementation-instances` y conserva un único registro para esa instancia.

La instancia preservará durante todo su ciclo:

```text
task_id
package_id
instance_id
status
package gate identity
repositorios
commits
versiones
ambientes
validation_commands
evidence
```

La identidad no se reemplaza por nombre de rama, PR, release, deploy o ejecución de CI.

#### 10. Ledger físico append-only

El control de implementación conserva un archivo por instancia.

Estados permitidos por la política física:

```text
PENDING_AUTHORIZATION
AUTHORIZED
IN_PROGRESS
BLOCKED
IMPLEMENTED
VERIFIED
DEFERRED
```

Una instancia `VERIFIED` es histórica e inmutable.

No se usa un arreglo global mutable para reemplazar registros de paquetes anteriores.

#### 11. Autorización y ejecución son decisiones distintas

La existencia de:

```text
E5-GATE-008::<package_id> aprobado
```

habilita la elegibilidad del paquete, pero no equivale a autorización automática de ejecución por ChatGPT ni a mutación automática del repositorio.

La autorización física de la instancia sigue siendo explícita por instancia y el operador predeterminado sigue siendo el usuario humano.

#### 12. CI020 como sobre de ejecución

CI020 gobierna todos los grupos de implementación y cambios físicos incluidos en el mismo `package_id`, pero no absorbe la semántica de las tareas que los originaron.

Ejemplo conceptual:

```text
PAQUETE P
├─ implementation unit A → owner A
├─ implementation unit B → owner B
├─ migration unit C      → owner C
└─ configuration unit D  → owner D

SHELL-CI-020::P
→ orquesta A + B + C + D
→ conserva orden y evidencia
→ no redefine A, B, C ni D
```

La tarea propietaria de una implementation unit sigue siendo autoridad sobre su comportamiento y contrato.

#### 13. Repositorio orquestador y repositorios afectados

El contrato global de CI020 pertenece a `vento-group-sas/vento-shell`.

Una instancia por paquete podrá afectar uno o varios repositorios únicamente cuando E5 los haya vinculado expresamente al paquete.

CI020 deberá distinguir:

```text
REPOSITORIO ORQUESTADOR
≠
CONJUNTO DE REPOSITORIOS AFECTADOS
```

La presencia de un repositorio en el ecosistema Vento no lo convierte en parte del paquete.

#### 14. Paquetes de un solo repositorio

Un paquete de un solo repositorio conserva exactamente la misma disciplina:

```text
package_id
→ repositorio exacto
→ commit exacto
→ versión
→ ambiente
→ evidencia
```

No se omiten lineage, validación ni rollback por tener cardinalidad uno.

#### 15. Paquetes multi-repositorio

Un paquete multi-repositorio conserva identidades independientes por repositorio.

Ejemplo conceptual:

```text
PACKAGE P
→ vento-shell @ SHA-A
→ vento-nexo  @ SHA-B
→ vento-anima @ SHA-C
```

No se inventa un SHA global.

La instancia podrá declarar `VERIFIED` únicamente cuando todos los componentes obligatorios del paquete tengan el estado y la evidencia exigidos por el contrato.

#### 16. Implementación física

En CI020, implementar significa materializar los cambios aprobados que pertenecen al paquete, incluyendo según aplique:

- código;
- contratos y paquetes compartidos;
- configuración;
- server actions;
- UI;
- infraestructura;
- migraciones;
- funciones;
- políticas;
- datos de transición;
- adapters;
- integraciones;
- scripts gobernados;
- tests;
- artefactos técnicos de despliegue.

La lista efectiva no se deduce de este contrato global: proviene del paquete E5 exacto.

#### 17. Despliegue técnico y cutover no son equivalentes

CI020 puede ejecutar el despliegue técnico exigido por el paquete, pero no absorbe CI022.

La frontera es:

```text
CI020
→ materializa versión desplegable
→ publica/aplica el despliegue técnico aprobado
→ demuestra identidad y resultado técnico

CI021
→ demuestra readiness

CI022
→ ejecuta activación, cutover y piloto conforme al plan aprobado
```

Si E5 reserva una activación, cambio de tráfico, habilitación a usuarios, migración de operación o ventana empresarial para CI022, CI020 deberá dejarla intacta.

#### 18. Ambiente objetivo

CI020 no selecciona ambientes.

Cada despliegue deberá conservar el ambiente exacto autorizado por el paquete.

Una referencia de deploy sin ambiente resoluble, o correspondiente a otro ambiente, no demuestra la ejecución exigida.

#### 19. Identidad de versión y commit

Cada repositorio afectado deberá conservar, según aplique:

```text
base_commit
source_commit
materialization_commit
deployed_commit
version
deployment_reference
```

No se acepta “la última versión” como identidad autoritativa.

Si la versión desplegada no corresponde al commit validado, la evidencia es inválida para CI020.

#### 20. Consumo de CI019

CI020 consume la evidencia publicada por CI019 como lineage verificable.

Podrá referenciar:

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

CI020 no copia ni reinterpreta el payload de CI019.

#### 21. Evidencia de entrada y evidencia de salida

CI020 distingue dos momentos:

##### 21.1. Evidencia de entrada

Demuestra que el paquete y sus revisiones previas están admitidos para ejecución.

##### 21.2. Evidencia de salida

Demuestra qué fue realmente implementado, qué commits y versiones resultaron, qué despliegues ocurrieron y qué `validation_commands` pasaron.

La evidencia de entrada no puede reutilizarse como prueba de que la implementación nueva fue validada.

#### 22. Stale evidence

Toda evidencia asociada a un commit anterior permanece histórica, pero deja de ser elegible cuando el contrato exige el commit nuevo.

```text
SHA-A PASS
+
IMPLEMENTACIÓN PRODUCE SHA-B
≠
SHA-B VALIDADO
```

CI020 deberá resolver evidencia para el SHA exacto que pretende declarar implementado o desplegado.

#### 23. TREQ durante la ejecución

El paquete E5 enumera los `TREQ-*` que implementa y las pruebas asociadas.

CI020:

- consume esa declaración;
- no inventa TREQ;
- no elimina TREQ para obtener verde;
- no cambia owner de TREQ;
- no sustituye una prueba requerida por otra sin cambio canónico;
- conserva la identidad del registro y baseline cuando la evidencia CI019 las exponga;
- registra resultados contra el conjunto exacto aplicable.

Un requisito crítico obligatorio sin implementar o sin validación exigida bloquea la salida.

#### 24. Supabase

Toda modificación de Supabase perteneciente a Vento se crea, versiona, documenta y ejecuta desde `vento-shell`.

Si un paquete incluye cambios de Supabase, CI020 deberá respetar las implementation units y transiciones ya aprobadas.

No podrá crear desde otro repositorio:

- migraciones;
- RLS;
- RPC;
- triggers;
- grants;
- Storage;
- Realtime;
- Edge Functions;
- cron;
- colas;
- cambios de datos.

La aplicación consumidora podrá requerir cambios compatibles, pero la mutación Supabase permanece gobernada por `vento-shell`.

#### 25. Migraciones y cambios de datos

Cuando el paquete incluya migraciones o cambios de datos, CI020 deberá preservar:

1. orden;
2. prerequisitos;
3. compatibilidad;
4. estrategia de transición;
5. datos iniciales o fixtures autorizados;
6. validación;
7. backup o salvaguarda cuando aplique;
8. rollback o compensación;
9. evidencia;
10. separación respecto del cutover reservado a CI022.

Una migración irreversible no se trata como reversible por declaración. Su estrategia de recuperación debe venir resuelta por el owner correspondiente.

#### 26. Compatibilidad

CI020 no puede forzar actualización simultánea de consumidores salvo que el paquete la haya aprobado explícitamente como unidad indivisible.

Cuando existan contratos o paquetes compartidos:

- se conserva versionado;
- se validan consumidores obligatorios;
- se respeta la matriz de compatibilidad;
- se evita adoptar una versión incompatible;
- se preserva rollback independiente cuando el contrato lo exige.

#### 27. Dependencias y orden de aplicación

CI020 ejecuta el orden autorizado por E5.

Una dependencia puede ser:

```text
PREVIA OBLIGATORIA
CONDICIONAL
PARALELIZABLE
POSTERIOR
```

Solo podrán paralelizarse unidades cuando sus owners y el paquete permitan hacerlo sin romper orden, integridad, migración ni rollback.

La optimización de velocidad no puede cambiar precedencias.

#### 28. Trabajo condicional

Toda implementation unit condicional deberá haber quedado incluida o excluida expresamente antes de `E5-GATE-008::<package_id>`.

CI020 no reevaluará silenciosamente la condición para agregar trabajo.

Si la realidad física demuestra que una condición aprobada cambió, la instancia se bloquea hasta reconciliar el contrato.

#### 29. Estado `PENDING_AUTHORIZATION`

`PENDING_AUTHORIZATION` significa:

- el paquete es elegible;
- existe un registro exacto;
- el alcance puede auditarse;
- todavía no se autoriza ejecución física.

No significa `IN_PROGRESS`.

#### 30. Estado `AUTHORIZED`

`AUTHORIZED` significa que la instancia exacta puede iniciar el flujo humano de implementación.

No significa que los cambios ya existan, que el preflight haya pasado ni que se pueda declarar resultado.

#### 31. Estado `IN_PROGRESS`

Antes de guardar `AUTHORIZED → IN_PROGRESS`, el watcher se detiene si está activo.

Con la instancia en `IN_PROGRESS`:

1. el watcher permanece apagado;
2. se ejecuta una sola vez el preflight físico estricto;
3. el preflight comprueba el carril y devuelve exclusivamente los `validation_commands` de la instancia;
4. un bloqueo real detiene la ejecución;
5. un PASS permite materializar en un mismo lote todos los cambios deterministas.

No se insertan gates rutinarios entre archivos.

#### 32. Preflight físico

El preflight físico es de solo lectura y se ejecuta una sola vez antes de tocar código, salvo que el checkout cambie materialmente o una discrepancia concreta invalide su evidencia.

Debe resolver:

```text
task_id
instance_id
package_id
estado
owner
continuidad
worktree
divergencia
contrato
validation_commands
bloqueos
avisos
```

No usa validadores globales como sustituto del contrato de la instancia.

#### 33. Materialización continua

Después del preflight PASS, la implementación continúa de forma determinista hasta completar los cambios físicos conocidos.

Quedan prohibidos como gates rutinarios:

- pedir confirmación por cada archivo;
- detenerse después de cada edición;
- ejecutar `git status` como control intermedio;
- pedir capturas;
- pedir hashes sueltos;
- ejecutar builds o tests parciales no exigidos;
- volver al chat si el siguiente paso ya puede determinarse.

La pausa existe solo ante un gate real de evidencia, permiso, credencial, contradicción o fallo.

#### 34. Estado `IMPLEMENTED`

`IMPLEMENTED` significa que el alcance físico previsto fue materializado.

Todavía puede faltar:

- batería final;
- commit de materialización;
- publicación remota;
- evidencia CI;
- deploy remoto;
- verificación de artifact;
- validación remota.

Por tanto:

```text
IMPLEMENTED
≠
VERIFIED
```

#### 35. Batería física final

La batería final de CI020 contiene exclusivamente las `validation_commands` autorizadas de la instancia, en su orden contractual.

CI020 no agrega automáticamente:

```text
docs:plan:build
docs:plan:check
docs:plan:test
docs:treq:check
docs:treq:test
```

ni ningún otro comando por rutina.

Si un validador global es necesario para el paquete, deberá figurar explícitamente en `validation_commands`.

#### 36. Semántica fail-fast

La batería se ejecuta como una única transacción lógica:

```text
COMANDO 1 PASS
→ COMANDO 2 PASS
→ ...
→ COMANDO N PASS
→ BATERÍA PASS
```

Ante un FAIL:

```text
DETENER BATERÍA
→ CONSERVAR IMPLEMENTED
→ IDENTIFICAR CAUSA
→ CORREGIR SOLO DENTRO DEL ALCANCE
→ REEJECUTAR LA BATERÍA COMPLETA
```

No se declara PASS acumulando fragmentos de intentos distintos.

#### 37. Evidencia local y remota

Si toda la evidencia obligatoria es local, una batería PASS puede permitir pasar a `VERIFIED`.

Si el contrato exige evidencia remota:

1. la instancia permanece `IMPLEMENTED`;
2. se crea el commit/push mínimo de materialización;
3. la evidencia remota se resuelve contra ese SHA;
4. se ejecuta el tramo remoto exigido;
5. solo el PASS completo permite `VERIFIED`.

Un push no equivale a validación remota.

#### 38. Cambio de SHA durante corrección

Si corregir un fallo modifica el commit publicado:

```text
SHA-A FAIL
→ corrección
→ SHA-B
```

toda evidencia que exija identidad exacta deberá resolverse de nuevo para SHA-B.

No se hereda el PASS de SHA-A a SHA-B.

#### 39. Despliegue parcialmente exitoso

En paquetes multi-repositorio o multi-componente puede ocurrir:

```text
A desplegado
B desplegado
C falló
```

CI020 no puede convertirlo en éxito parcial elegible.

La instancia queda `IMPLEMENTED` o `BLOCKED` según la condición real y aplica el plan aprobado de:

- retry;
- rollback;
- compensación;
- restauración;
- forward-fix;

sin inventar estrategia durante el incidente.

#### 40. Rollback

El rollback es parte del contrato de ejecución cuando aplique.

CI020 deberá conservar:

```text
trigger
scope
owner
procedure
dependencies
data treatment
expected restored state
validation
evidence
```

Ejecutar rollback no borra la evidencia del intento fallido.

Un intento posterior produce nueva evidencia.

#### 41. `BLOCKED`

Una instancia pasa o permanece `BLOCKED` cuando exista una condición que impida continuar sin violar el contrato, incluyendo:

- discrepancia de alcance;
- dependencia no cumplida;
- credencial o permiso no resuelto;
- ambiente incorrecto;
- secreto real expuesto;
- migration precondition ausente;
- package mismatch;
- evidencia inválida;
- rollback requerido no disponible;
- decisión humana pendiente.

El bloqueo debe conservar causa, owner y condición exacta de salida.

#### 42. `DEFERRED`

`DEFERRED` solo procede cuando una decisión canónica explícita pospone la instancia o parte indivisible de ella.

No se usa para esconder un FAIL ni para cerrar una brecha sin owner.

#### 43. Seguridad y secretos

CI020 no imprimirá, versionará ni publicará como evidencia:

- tokens;
- cookies;
- claves privadas;
- service role keys;
- `.env`;
- dumps de variables;
- secretos de provider;
- credenciales productivas;
- payloads sensibles no autorizados.

Un secreto real detectado bloquea la ejecución hasta retirarlo y rotarlo conforme a su owner.

#### 44. Git y evidencia runtime

La evidencia runtime no se usa como contenido arbitrario de Git.

Git conserva:

- código;
- migraciones;
- configuración versionable;
- contratos;
- tests;
- registros canónicos de instancia;
- referencias e identidades necesarias.

CI019 conserva los bundles de ejecución en el canal de evidencia correspondiente.

#### 45. Concurrencia

Dos paquetes pueden avanzar en paralelo solo si sus dependencias y implementation units lo permiten.

Si dos paquetes pretenden modificar la misma unidad física incompatible:

- no se resuelve por “último commit gana”;
- se respeta owner y dependencia;
- se determina orden;
- se revalida el paquete posterior contra el estado resultante;
- no se reutiliza evidencia stale.

#### 46. Idempotencia y reintentos

Reintentar CI020 no autoriza duplicar efectos.

Las operaciones repetibles deberán conservar idempotencia cuando su owner la exija.

Cada intento conserva su propia evidencia y no sobrescribe un intento anterior.

#### 47. Resultado de CI020

Estados funcionales de salida:

```text
VERIFIED
BLOCKED
DEFERRED
```

`VERIFIED` exige que:

1. el alcance ejecutado corresponda al paquete;
2. todas las unidades obligatorias estén materializadas;
3. todos los repositorios obligatorios estén cubiertos;
4. todos los commits y versiones sean resolubles;
5. el despliegue técnico exigido esté demostrado;
6. todos los `validation_commands` hayan pasado;
7. toda evidencia remota obligatoria haya pasado;
8. no existan fallos bloqueantes abiertos;
9. no exista evidencia stale usada como autoridad;
10. el registro de instancia consolide la evidencia requerida.

#### 48. Evidencia consolidada de la instancia

La evidencia de `SHELL-CI-020::<package_id>` deberá permitir resolver, como mínimo:

```text
package_id
E5 gate identity
DELIV-PKG identity
implementation units ejecutadas
repositorios afectados
base commits
materialization commits
deployed commits
versiones
ambientes
deployment references
validation commands
validation results
CI019 dossier/bundle references
TREQ identities
rollback/compensation result cuando aplique
blockers resueltos
completed_at
```

Las referencias pueden apuntar a evidencia externa recuperable; no se duplica payload innecesario.

#### 49. Handoff a CI021

`SHELL-CI-021::<package_id>` solo podrá consumir una instancia `SHELL-CI-020::<package_id>` en `VERIFIED`.

El handoff conserva:

```text
package_id
implementation instance identity
repositorios
commits
versiones
ambientes
deployment references
validation evidence
CI019 evidence identities
TREQ identities
open non-blocking observations
rollback references
```

CI021 no debe reconstruir qué se implementó a partir de ramas o logs.

#### 50. Casos positivos mínimos de futura ejecución

Cada implementación real deberá poder demostrar, según su aplicabilidad:

1. paquete de un repositorio;
2. paquete multi-repositorio;
3. ejecución con commits distintos por repositorio;
4. implementación de varias units en orden;
5. unit condicional incluida por E5;
6. unit condicional excluida por E5;
7. batería física exacta en PASS;
8. evidencia local suficiente;
9. evidencia remota contra SHA publicado;
10. despliegue técnico recuperable;
11. paquete con migración gobernada desde `vento-shell`;
12. rollback o compensación validable cuando aplique;
13. rerun sin sobrescribir evidencia;
14. corrección que produce SHA nuevo y nueva evidencia;
15. handoff limpio a CI021 sin ejecutar readiness anticipadamente.

#### 51. Casos negativos mínimos de futura ejecución

La instancia deberá bloquear o invalidar, como mínimo:

1. `package_id` inexistente;
2. `E5-GATE-008` ausente;
3. repositorio fuera de alcance;
4. implementation unit no aprobada;
5. ampliación de alcance;
6. ambiente distinto;
7. migración Supabase fuera de `vento-shell`;
8. dependencia obligatoria ausente;
9. TREQ crítico omitido;
10. `validation_command` omitido;
11. batería parcialmente ejecutada presentada como PASS;
12. evidencia de otro SHA;
13. bundle CI019 no recuperable cuando sea obligatorio;
14. deployment reference de otro ambiente;
15. versión desplegada distinta del commit validado;
16. fallo bloqueante abierto;
17. secreto real detectado;
18. rollback requerido no disponible;
19. intento de avanzar a CI021 sin CI020 VERIFIED;
20. intento de ejecutar cutover o piloto dentro de CI020.

#### 52. Regresiones que CI020 debe impedir

CI020 no podrá introducir:

1. un segundo sistema de identificación de paquetes;
2. un catálogo local de repositorios que contradiga E5;
3. un SHA global ficticio para paquetes multi-repositorio;
4. una noción autoritativa de “latest green”;
5. autorización física inferida;
6. tests añadidos por rutina fuera de `validation_commands`;
7. build documental como sustituto de validación física;
8. commits intermedios usados como gates innecesarios;
9. watcher activo durante el carril físico;
10. modificación de instancias VERIFIED;
11. evidencia runtime copiada a Git como almacenamiento primario;
12. TREQ inventados;
13. migraciones Supabase fuera de `vento-shell`;
14. readiness implícito;
15. cutover implícito;
16. piloto implícito;
17. cierre implícito;
18. rollback improvisado;
19. cambio de alcance silencioso;
20. bypass de CI018 o CI019.

#### 53. Flujo operativo canónico de una futura instancia

```text
E5-GATE-008::<package_id> PASS
→ crear/actualizar registro PENDING_AUTHORIZATION
→ auditoría del paquete
→ autorización física explícita
→ watcher OFF
→ IN_PROGRESS
→ preflight físico estricto único
→ materialización determinista completa
→ IMPLEMENTED
→ batería final = SOLO validation_commands
→ evidencia remota si aplica
→ VERIFIED
→ docs:plan:build una sola vez
→ stage de derivados legítimos
→ validación de commit
→ commit/push final de cierre
→ worktree limpio + remoto sincronizado
→ watcher ON
→ arranque read-only
→ habilitar SHELL-CI-021::<package_id>
```

#### 54. Cierre documental de la instancia

Después de `VERIFIED` se ejecuta una sola sincronización documental de cierre mediante el mecanismo canónico de build.

Ese cierre:

- actualiza derivados;
- no reabre la batería física;
- no reejecuta pruebas por rutina;
- no cambia evidencia ya consolidada;
- no vuelve a autorizar la instancia.

El watcher solo vuelve a activarse después del commit/push final y de confirmar sincronía.

#### 55. Estado documental conciliado

| Métrica                                              |                        Resultado |
| ---------------------------------------------------- | -------------------------------: |
| Topología CI020                                      |         **TEMPLATE_PER_PACKAGE** |
| Marcadores globales CI020 materializados físicamente |                            **0** |
| Instancias CI020 creadas por este marcador           |                            **0** |
| Unidad de ejecución futura                           |        **1 `package_id` exacto** |
| Gate de entrada                                      |  **`E5-GATE-008::<package_id>`** |
| Habilitadores CI previos                             |          **`SHELL-CI-001..019`** |
| Autoridad de alcance                                 |               **DELIV-PKG + E5** |
| Evidencia CI consumida                               |   **CI019 por identidad exacta** |
| Batería física                                       |   **solo `validation_commands`** |
| Estado requerido para handoff                        |                     **VERIFIED** |
| Siguiente etapa física                               | **`SHELL-CI-021::<package_id>`** |
| Cambios físicos durante marcador                     |                            **0** |
| Cambios Supabase durante marcador                    |                            **0** |
| Requisitos creados o modificados                     |                            **0** |

#### 56. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** CI020 define el mecanismo de ejecución física de obligaciones ya asignadas y aprobadas por cada paquete E5. El paquete debe llegar con sus requisitos, comandos, regresiones, datos, resultados esperados, rollback y criterios de evidencia definidos. CI020 no introduce una regla empresarial nueva de calidad; ejecuta y demuestra las existentes.

#### 57. Cobertura de prueba vigente reutilizada

Sin modificar 04A, CI020 reutiliza cobertura vigente de:

- `TREQ-SHELL-005`, para comandos reproducibles y bloqueo ante fallos críticos;
- `TREQ-SHELL-006`, para compatibilidad de contratos, SDK y paquetes compartidos;
- `TREQ-SHELL-007`, para rollback independiente y conservación de compatibilidad y datos;
- `TREQ-SHELL-008`, para declaración de `TREQ-*` afectados y publicación reproducible de resultados;
- `TREQ-SHELL-009`, para identidad verificable de repositorio, commit, superficie, configuración, migraciones y ambiente.

Además, cada instancia consume el conjunto específico de `TREQ-*` declarado por su `DELIV-PKG` propietario.

Estas referencias son trazabilidad heredada y no una actualización del registro.

#### 58. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                             |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no materializa paquetes, código, migraciones, deploys ni instancias físicas.                                                                                                                                                                   |
| LOCAL     | NOT_EXECUTED   | La validación local del artefacto y del archivo propietario corresponde al checkout actualizado antes de aprobar canónicamente la tarea.                                                                                                                              |
| REMOTA    | PASS           | Se revisaron la continuidad vigente, la topología `TEMPLATE_PER_PACKAGE`, el contrato genérico CI020..024, los principios obligatorios de E5, la frontera E5/CI020..024, la política de instancias físicas, el registro SHELL de TREQ y el handoff aprobado de CI019. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutó un paquete, deploy, readiness, cutover, piloto, hypercare ni cierre.                                                                                                                                                                                    |
| FÍSICA    | NOT_APPLICABLE | Este marcador solo define la plantilla. La evidencia física pertenecerá a cada `SHELL-CI-020::<package_id>`.                                                                                                                                                          |

#### 59. Criterios de aceptación

`SHELL-CI-020` queda documentalmente completa cuando:

- define CI020 como plantilla global y no como implementación monolítica;
- conserva `package_id` como identidad obligatoria;
- exige `E5-GATE-008::<package_id>` antes de cambios físicos;
- consume DELIV-PKG y E5 como autoridad de alcance;
- impide expansión de alcance por inferencia;
- diferencia owner de la tarea, repositorio orquestador y repositorios afectados;
- gobierna paquetes de uno y varios repositorios;
- conserva commit, versión, ambiente y evidencia por repositorio;
- consume CI019 por identidad exacta;
- impide evidencia stale;
- conserva TREQ sin crear una fuente paralela;
- mantiene Supabase en `vento-shell`;
- distingue implementación de despliegue técnico, readiness y cutover;
- define estados físicos y autorización separada;
- define watcher OFF durante implementación;
- define preflight físico estricto único;
- define materialización continua sin micro-gates;
- define `IMPLEMENTED` como distinto de `VERIFIED`;
- limita la batería final a `validation_commands`;
- exige evidencia remota contra SHA exacto cuando aplique;
- define tratamiento de fallos, reintentos y SHA nuevo;
- define partial deployment sin éxito parcial falso;
- preserva rollback y compensación;
- bloquea secretos reales;
- conserva ledger append-only;
- impide mutación de instancias VERIFIED;
- exige evidencia consolidada de la instancia;
- define handoff inequívoco a CI021;
- no ejecuta readiness;
- no ejecuta cutover;
- no ejecuta piloto;
- no ejecuta hypercare;
- no certifica cierre;
- no crea ni modifica TREQ;
- no modifica 04A durante el marcador;
- no modifica Supabase durante el marcador.

#### 60. Límites

Esta tarea documental no:

- crea una instancia `SHELL-CI-020::<package_id>`;
- autoriza un paquete físico;
- implementa código;
- modifica repositorios de aplicación;
- crea migraciones;
- ejecuta migraciones;
- modifica Supabase;
- cambia datos;
- crea releases;
- publica packages;
- ejecuta deploys;
- cambia branch protection;
- cambia `VENTO Required Gate`;
- reejecuta CI016;
- modifica CI017;
- cambia la decisión CI018;
- reimplementa CI019;
- publica bundles CI019;
- ejecuta tests;
- ejecuta lint;
- ejecuta typecheck;
- ejecuta build;
- ejecuta `validation_commands`;
- ejecuta readiness;
- ejecuta cutover;
- ejecuta piloto;
- habilita usuarios por inferencia;
- ejecuta hypercare;
- certifica cierre;
- transfiere a soporte;
- ejecuta rollback;
- hace commit;
- hace push;
- abre PR;
- fusiona PR;
- crea TREQ;
- modifica TREQ;
- modifica 04A;
- aprueba CI021;
- desarrolla CI021.

#### 61. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio`

**TAREA ACTUAL APROBADA**
`SHELL-CI-020 — Implementar y desplegar cada paquete aprobado por E5`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-021 — Ejecutar y resolver el checklist de readiness aprobado`


### ✅ SHELL-CI-021 — Ejecutar y resolver el checklist de readiness aprobado

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-020 — Implementar y desplegar cada paquete aprobado por E5
**Tarea siguiente:** SHELL-CI-022 — Ejecutar cutover y piloto conforme al plan aprobado
**Tipo de tarea:** Plantilla global con ejecución por paquete — contrato documental para ejecutar, reconciliar y resolver la puerta de readiness operativo de cada paquete implementado, consolidar evidencia real y emitir la decisión final de elegibilidad para piloto sin ejecutar cutover ni piloto
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/04_DESPLIEGUE_PILOTO_Y_ESTABILIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; la ejecución futura ocurre únicamente mediante `SHELL-CI-021::<package_id>` después de una instancia `SHELL-CI-020::<package_id>` resuelta y con autorización física separada
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo Vento OS ejecuta y resuelve el readiness operativo de cada paquete después de su implementación, utilizando exactamente los contratos `READY-GATE-001..015` aprobados por E5 y produciendo una decisión final reproducible sobre su elegibilidad para entrar al piloto.

La regla vinculante queda:

```text
SHELL-CI-020::<package_id> RESUELTO
+ MISMO PACKAGE_ID
+ MISMO CANDIDATO
+ MISMO AMBIENTE
+ MISMO ALCANCE AUTORIZADO
+ READY-GATE-001..014 RECONCILIADOS
+ EVIDENCIA REAL, VIGENTE Y ATRIBUIBLE
+ READY-GATE-015 EJECUTADO
+ AUTORIDAD FINAL DEMOSTRADA
= DECISIÓN DE READINESS DEL PAQUETE
```

Y de forma fail-closed:

```text
CANDIDATO DISTINTO
O AMBIENTE DISTINTO
O ALCANCE DISTINTO
O GATE OBLIGATORIO AUSENTE
O EVIDENCIA STALE
O EVIDENCIA DE OTRO PAQUETE
O FAIL SOBRESCRITO POR "ACEPTACIÓN"
O BLOQUEO SIN RESOLVER
O AUTORIDAD NO DEMOSTRADA
O EXPOSICIÓN ANTICIPADA
≠ APROBAR_ENTRADA
```

`SHELL-CI-021` ejecuta y resuelve readiness. No ejecuta cutover, no ejecuta piloto, no ejecuta hypercare y no certifica cierre.

#### 2. Resultado canónico

`SHELL-CI-021` establece una única plantilla reutilizable para que cada paquete:

1. obtenga una instancia `SHELL-CI-021::<package_id>`;
2. consuma la salida exacta de `SHELL-CI-020::<package_id>`;
3. preserve candidato, ambiente y alcance autorizados;
4. ejecute los contratos de readiness aprobados por E5;
5. materialice evidencia real, no evidencia planificada;
6. evalúe cada gate con su propia regla de aplicabilidad;
7. conserve `PASS`, `FAIL`, `BLOQUEADO` y `NO_APLICA` sin redondeos;
8. resuelva discrepancias mediante sus owners canónicos;
9. invalide evidencia stale cuando cambie el candidato o el ambiente;
10. preserve la autoridad de cada READY-GATE;
11. consolide exactamente las catorce puertas previas exigidas por READY-GATE-015;
12. resuelva la autoridad final ya asignada al paquete;
13. emita `APROBAR_ENTRADA`, `DENEGAR_ENTRADA`, `BLOQUEAR_DECISION` o `NO_APLICA`;
14. distinga ejecución correcta del checklist de una decisión positiva de readiness;
15. impida "aprobar con pendientes";
16. no use aceptación de riesgo para sobreescribir un `FAIL`;
17. no fabrique `NO_APLICA`;
18. no reimplemente CI020 por rutina;
19. no ejecute acciones reservadas a CI022;
20. entregue un handoff inequívoco al mismo `package_id`.

#### 3. Frontera del ciclo CI020..024

| Etapa                        | Responsabilidad                                          |
| ---------------------------- | -------------------------------------------------------- |
| `SHELL-CI-020::<package_id>` | Implementar y desplegar técnicamente el paquete aprobado |
| `SHELL-CI-021::<package_id>` | Ejecutar y resolver readiness operativo                  |
| `SHELL-CI-022::<package_id>` | Ejecutar cutover y piloto                                |
| `SHELL-CI-023::<package_id>` | Ejecutar hypercare, conciliación y estabilización        |
| `SHELL-CI-024::<package_id>` | Certificar cierre y transferencia a soporte              |

CI021 responde:

```text
¿ESTÁ EL PAQUETE REALMENTE LISTO PARA ENTRAR AL PILOTO?
```

No responde:

```text
¿YA SE EJECUTÓ EL PILOTO?
¿YA ESTÁ ESTABILIZADO?
¿YA PUEDE CERRARSE?
```

#### 4. Topología de trabajo

La topología de `SHELL-CI-021` es `TEMPLATE_PER_PACKAGE`.

```text
SHELL-CI-021
→ define una sola vez el contrato

SHELL-CI-021::<package_id>
→ ejecuta readiness para un paquete exacto
```

La instancia no reabre ni modifica el marcador global.

#### 5. Cadena física obligatoria

```text
E5-GATE-008::<package_id>
→ SHELL-CI-020::<package_id>
→ SHELL-CI-021::<package_id>
→ SHELL-CI-022::<package_id>
→ SHELL-CI-023::<package_id>
→ SHELL-CI-024::<package_id>
```

No se salta CI021 aunque exista evidencia aislada de readiness.

#### 6. Condición de entrada desde CI020

CI021 solo puede iniciar evaluación autoritativa cuando la salida de CI020 sea resoluble para el mismo paquete.

La entrada mínima deberá identificar:

```text
package_id
CI020 instance
candidate identity
repositories
commits
versions
target environment
deployment references
validation evidence
CI019 evidence identities
TREQ identities
rollback references
open non-blocking observations
```

Si el candidato que se pretende evaluar no puede correlacionarse con la salida de CI020, readiness queda bloqueado.

#### 7. Candidato de readiness

El candidato es la unidad concreta que pretende entrar al piloto.

Podrá estar compuesto por uno o varios repositorios, versiones, artefactos, migraciones, configuraciones y superficies, según el paquete.

La identidad del candidato debe ser inmutable y resoluble.

No se acepta:

```text
"la última versión"
"el deploy actual"
"la rama vigente"
"lo que está en staging"
```

como sustituto de identidad.

#### 8. Inmutabilidad de package_id, candidato, ambiente y alcance

Toda evidencia de readiness deberá corresponder al mismo cuádruple lógico:

```text
package_id
+
candidate
+
target_environment
+
authorized_scope
```

Una evidencia válida para otro candidato, ambiente, sede, cohorte, rol, proceso o superficie no puede reutilizarse por proximidad.

#### 9. Universo obligatorio de readiness

CI021 ejecuta el contrato aprobado de quince gates:

| Gate             | Pregunta protegida                                                          |
| ---------------- | --------------------------------------------------------------------------- |
| `READY-GATE-001` | ¿El código correcto está desplegado en el ambiente correcto?                |
| `READY-GATE-002` | ¿Las migraciones aplicables están aplicadas y los datos validados?          |
| `READY-GATE-003` | ¿Permisos, matrices y dispositivos están configurados conforme al contrato? |
| `READY-GATE-004` | ¿Usuarios, roles, sedes, áreas y turnos requeridos están disponibles?       |
| `READY-GATE-005` | ¿Catálogos y datos maestros mínimos están listos?                           |
| `READY-GATE-006` | ¿Integraciones y credenciales del ambiente están operativas y gobernadas?   |
| `READY-GATE-007` | ¿Hardware, red, escáneres e impresoras requeridos están disponibles?        |
| `READY-GATE-008` | ¿Procedimientos operativos y contingencias están preparados?                |
| `READY-GATE-009` | ¿Capacitación y material de apoyo están disponibles?                        |
| `READY-GATE-010` | ¿Mesa de soporte, responsables y escalamiento están resueltos?              |
| `READY-GATE-011` | ¿Monitoreo, métricas y alertas están listos?                                |
| `READY-GATE-012` | ¿Respaldo y rollback están probados conforme al contrato?                   |
| `READY-GATE-013` | ¿Existe una línea base previa al piloto reproducible?                       |
| `READY-GATE-014` | ¿Riesgos residuales y condiciones de suspensión están resueltos?            |
| `READY-GATE-015` | ¿La autoridad final puede aprobar la entrada al piloto?                     |

CI021 no redefine ninguna de esas preguntas.

#### 10. READY-GATE-001..014 como conjunto fijo

Para la decisión final de entrada, el conjunto esperado es exactamente:

```text
READY-GATE-001
READY-GATE-002
READY-GATE-003
READY-GATE-004
READY-GATE-005
READY-GATE-006
READY-GATE-007
READY-GATE-008
READY-GATE-009
READY-GATE-010
READY-GATE-011
READY-GATE-012
READY-GATE-013
READY-GATE-014
```

Cada gate deberá materializarse exactamente una vez para el paquete, con resultado y evidencia vigentes.

No se admite una lista reducida por conveniencia.

#### 11. READY-GATE-015 como reconciliador final

`READY-GATE-015` no reemplaza las catorce puertas.

Consume sus resultados y materializa:

```text
required_entry_gate_set::<package_id>
pilot_entry_authority::<package_id>
pilot_entry_decision::<package_id>
pilot_entry_decision_manifest::<package_id>
```

CI021 debe ejecutar esa reconciliación final después de disponer de resultados válidos de `READY-GATE-001..014`.

#### 12. Semántica de resultado por gate

Los gates individuales conservan, cuando su contrato lo establezca:

```text
PASS
FAIL
BLOQUEADO
NO_APLICA
```

Regla general:

- `PASS`: la condición está demostrada;
- `FAIL`: existe evidencia suficiente de incumplimiento;
- `BLOQUEADO`: no existe evidencia o condición suficiente para resolver el estado;
- `NO_APLICA`: el paquete demuestra canónicamente que esa comprobación no corresponde.

`NO_APLICA` no es un estado de espera.

#### 13. Prohibición de PASS parcial

Un gate con varios componentes obligatorios no puede declarar `PASS` si alguno queda sin representar.

Ejemplo:

```text
3 componentes requeridos
2 PASS
1 sin evidencia
≠ PASS
```

El gate conserva el estado exigido por su contrato, normalmente `BLOQUEADO`.

#### 14. Evidencia planificada y evidencia ejecutada

E5 define:

```text
qué comprobar
cómo comprobar
qué evidencia exigir
quién responde
qué suspende
qué rollback aplica
```

CI021 produce:

```text
qué se observó realmente
cuándo
en qué ambiente
contra qué candidato
con qué método
con qué resultado
con qué evidencia
```

La planificación no se presenta como ejecución.

#### 15. Evidencia reproducible

Toda evidencia de readiness deberá permitir que un tercero autorizado repita la comprobación o reconstruya la decisión.

Una captura aislada, una afirmación manual o un mensaje informal no bastan cuando el gate exige metadata autoritativa.

Las referencias pueden apuntar a proveedores, artefactos, dashboards, logs, manifests, tickets, registros operativos o repositorios, siempre sin exponer secretos.

#### 16. Vigencia de la evidencia

Readiness es temporal.

Una evidencia válida puede dejar de ser elegible cuando cambia:

- el candidato;
- el commit;
- la versión;
- el ambiente;
- la configuración;
- una migración;
- una credencial;
- una matriz de permisos;
- el roster;
- un catálogo;
- una integración;
- un dispositivo;
- el procedimiento;
- la capacitación;
- el soporte;
- la observabilidad;
- el backup;
- el rollback;
- la línea base;
- el riesgo residual;
- la autoridad.

CI021 deberá evaluar vigencia antes de consolidar.

#### 17. Evidencia stale

```text
CANDIDATO A
→ READY-GATE PASS

CANDIDATO CAMBIA A B
≠
B HEREDA AUTOMÁTICAMENTE EL PASS
```

Toda evidencia cuyo objeto material haya cambiado debe reevaluarse según el gate afectado.

#### 18. Cambios que invalidan múltiples gates

Un cambio material puede afectar más de un gate.

Ejemplo conceptual:

```text
nuevo commit
→ puede invalidar código desplegado
→ puede invalidar migraciones
→ puede invalidar permisos
→ puede invalidar integraciones
→ puede invalidar monitoreo
→ puede invalidar rollback
→ puede invalidar baseline
→ invalida decisión final
```

CI021 no asume que solo el gate que detectó el cambio necesita reevaluación.

#### 19. Readiness no reimplementa CI020 por rutina

CI021 no vuelve a ejecutar por defecto:

- builds;
- test suites de implementación;
- despliegues;
- migraciones;
- publicación de packages;
- promociones;
- materialización de código.

Su función es comprobar y resolver readiness.

Si un gate descubre que la implementación está incorrecta, la corrección vuelve a su owner canónico y, cuando corresponda, a CI020.

#### 20. Discrepancias de implementación

Ejemplos:

```text
commit desplegado incorrecto
migración faltante
versión incompatible
configuración de código equivocada
artifact incorrecto
```

CI021:

1. registra el resultado;
2. preserva evidencia;
3. identifica el owner;
4. bloquea o deniega según el gate;
5. devuelve la corrección al carril propietario;
6. exige nueva evidencia después de la corrección.

No modifica silenciosamente el candidato.

#### 21. Discrepancias de readiness operativo

Ejemplos:

```text
roster incompleto
dispositivo no preparado
credencial no resoluble
material de apoyo ausente
support roster incompleto
alerta no disponible
baseline no capturada
riesgo residual sin decisión
```

CI021 puede coordinar y verificar la resolución únicamente cuando la acción ya esté gobernada por el paquete y por el owner correspondiente.

No crea un alcance nuevo para “completar readiness”.

#### 22. Owner de la corrección

El gate que detecta un problema no adquiere automáticamente la propiedad de corregirlo.

La resolución conserva:

```text
owner canónico
tarea responsable
condición de salida
evidencia de reevaluación
```

No se reasignan owners para acelerar el piloto.

#### 23. Correcciones que cambian el candidato

Si la resolución produce un nuevo commit, versión, artifact o conjunto material del paquete:

```text
CANDIDATO A
→ corrección
→ CANDIDATO B
```

CI021 no continúa acumulando evidence de A.

Debe:

1. actualizar la identidad del candidato conforme al owner;
2. invalidar evidencia afectada;
3. reconciliar con CI020 cuando corresponda;
4. reevaluar los gates afectados;
5. ejecutar nuevamente READY-GATE-015 solo con evidencia vigente de B.

#### 24. Correcciones sin cambio de candidato

Una corrección operacional que no cambia el candidato, por ejemplo completar una capacitación o resolver un roster de soporte, podrá reevaluar el gate propietario sin reconstruir evidencia no afectada, siempre que:

- el candidato siga idéntico;
- el ambiente siga idéntico;
- el alcance siga idéntico;
- no exista dependencia material invalidada;
- las demás evidencias sigan vigentes.

#### 25. Gate de código desplegado

`READY-GATE-001` deberá poder correlacionar:

```text
package_id
→ implementation_unit_id cuando exista
→ repository
→ expected_commit_sha
→ artifact/release
→ deployment
→ target_environment
→ deployed_commit_sha
```

Una rama, URL, PR, build previo o afirmación de deploy no sustituyen esa cadena.

#### 26. Gate de migraciones y datos

`READY-GATE-002` verifica las migraciones y datos que el paquete exige.

CI021 no podrá convertir:

- archivo de migración existente;
- historial incompleto;
- comando con exit code cero;
- captura de dashboard;

en prueba suficiente por sí sola.

La identidad de la migración, ambiente y estado resultante deben ser correlacionables.

#### 27. Gate de permisos, matrices y dispositivos

`READY-GATE-003` confirma que las configuraciones aplicables estén materializadas conforme a contratos canónicos.

Readiness no puede usar:

```text
"el usuario pudo entrar"
```

como sustituto de la matriz, identidad, configuración y evidencia exigidas por el gate.

#### 28. Gate de actores y contexto operativo

`READY-GATE-004` reconcilia el roster real del ambiente objetivo contra usuarios, roles, sedes, áreas y turnos requeridos.

No crea actores por inferencia ni reduce el roster esperado para obtener PASS.

#### 29. Gate de catálogos y datos maestros

`READY-GATE-005` construye el conjunto requerido y compara la realidad del ambiente.

Un dato que “probablemente ya existe” no cuenta como readiness.

Las identidades y valores exigidos deben ser comprobables.

#### 30. Gate de integraciones y credenciales

`READY-GATE-006` verifica que las integraciones aplicables al candidato y ambiente estén disponibles conforme al contrato.

La verificación no expone secretos.

Existencia de una variable, endpoint o credencial almacenada no demuestra por sí sola que la integración sea utilizable.

#### 31. Gate de infraestructura operativa

`READY-GATE-007` protege hardware, red, escáneres, impresoras y otros componentes físicos aplicables.

Un paquete que no requiera determinado hardware solo podrá usar `NO_APLICA` cuando el expediente lo demuestre.

#### 32. Gate de procedimientos y contingencias

`READY-GATE-008` confirma que la operación conoce:

- procedimiento normal;
- excepciones;
- contingencias;
- suspensión;
- recuperación;
- responsables.

No basta con que el código pueda ejecutarse.

#### 33. Gate de capacitación

`READY-GATE-009` confirma que los actores definidos por el paquete disponen de capacitación y material aplicables al alcance que realmente van a operar.

Capacitar a un grupo distinto no satisface el gate.

#### 34. Gate de soporte

`READY-GATE-010` resuelve cobertura de soporte, responsables y escalamiento.

Un nombre o grupo de mensajería sin autoridad, disponibilidad y procedimiento exigidos no equivale a readiness.

#### 35. Gate de observabilidad

`READY-GATE-011` confirma las métricas, señales y alertas que el paquete necesita para ejecutar y observar el piloto de manera segura.

No se entra a piloto ciego cuando el contrato exige observabilidad.

#### 36. Gate de respaldo y rollback

`READY-GATE-012` verifica que las salvaguardas aplicables estén realmente probadas.

La existencia de un plan escrito no equivale a rollback probado.

La aceptación de riesgo no puede convertir un rollback obligatorio no probado en PASS.

#### 37. Gate de línea base

`READY-GATE-013` captura la línea base que permitirá comparar el comportamiento del piloto con el estado anterior.

La baseline debe corresponder al mismo alcance que pretende exponerse.

Una línea base posterior a la activación no puede presentarse como previa.

#### 38. Gate de riesgos y suspensión

`READY-GATE-014` es la autoridad del riesgo residual aceptado y de las condiciones que invalidan esa aceptación.

Puede aceptar riesgo residual dentro de sus reglas.

No puede:

```text
convertir FAIL en PASS
eliminar un gate
ocultar un bloqueo
autorizar exposición fuera del alcance
```

#### 39. Autoridad final

`READY-GATE-015` resuelve la autoridad final desde el `Responsable de decisión` ya asignado al paquete.

No crea un cargo universal nuevo.

La identidad y autoridad de quien decide deben ser demostrables.

El ejecutor del checklist no obtiene autoridad final por haber ejecutado el checklist.

#### 40. Separación ejecutor / decisor

Cuando el contrato exija separación:

```text
QUIEN RECOPILA EVIDENCIA
≠
QUIEN EMITE DECISIÓN FINAL
```

La resolución de autoridad se conserva en el expediente.

No se usa una firma informal para sustituir al decisor requerido.

#### 41. Decisiones finales de readiness

`pilot_entry_decision::<package_id>` utiliza exactamente:

| Decisión            | Semántica                                                                                                                                                            |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `APROBAR_ENTRADA`   | Las catorce puertas están reconciliadas, no existe `FAIL` ni `BLOQUEADO`, todo `NO_APLICA` es válido, la evidencia está vigente y la autoridad final está demostrada |
| `DENEGAR_ENTRADA`   | Existe evidencia suficiente de incumplimiento material que impide la entrada                                                                                         |
| `BLOQUEAR_DECISION` | Falta evidencia, autoridad, vigencia, coherencia o resolución suficiente para aprobar o denegar de forma fundada                                                     |
| `NO_APLICA`         | El expediente demuestra que esta instancia no debe entrar a piloto y que la puerta final de entrada no corresponde                                                   |

`NO_APLICA` no significa “todavía no está listo”.

#### 42. No existe "aprobar con pendientes"

Para `APROBAR_ENTRADA`:

```text
TOTAL_GATES_ESPERADOS = 14
TOTAL_GATES_MATERIALIZADOS = 14
FAIL = 0
BLOQUEADO = 0
NO_APLICA = todos válidos
EVIDENCIA = vigente y consistente
RIESGO RESIDUAL = resuelto por READY-GATE-014
AUTORIDAD FINAL = válida
```

Cualquier pendiente obligatorio impide aprobación.

#### 43. `DENEGAR_ENTRADA`

La denegación es una decisión final válida cuando existe evidencia suficiente de incumplimiento material.

Ejemplos:

- gate en `FAIL`;
- intento de usar aceptación de riesgo para sobreescribir un `FAIL`;
- gate obligatorio incumplido;
- autoridad demostrablemente inválida;
- exposición previa no autorizada;
- evidencia atribuida deliberadamente a otro candidato o ambiente.

Una denegación no es un fallo del mecanismo CI021; puede ser el resultado correcto de ejecutarlo.

#### 44. `BLOQUEAR_DECISION`

Se utiliza cuando todavía no puede emitirse una decisión fundada.

Ejemplos:

- evidencia faltante;
- evidencia contradictoria;
- ambiente inaccesible;
- autoridad no resoluble;
- resultado stale;
- identidad física incompleta;
- bloqueo pendiente de owner.

A diferencia de `DENEGAR_ENTRADA`, aquí falta información o resolución suficiente.

#### 45. `NO_APLICA`

Solo procede cuando el expediente aprobado demuestra que la instancia no debe entrar a piloto.

CI021 no fabrica `NO_APLICA` para:

- evitar resolver un gate;
- cerrar un paquete bloqueado;
- omitir un piloto requerido;
- eludir un entorno no preparado.

#### 46. Estado físico de la instancia y resultado de readiness

El estado físico de `SHELL-CI-021::<package_id>` y la decisión de entrada son dimensiones distintas.

Ejemplo:

```text
CI021 VERIFIED
+
pilot_entry_decision = DENEGAR_ENTRADA
```

es válido si el checklist fue ejecutado correctamente y produjo una denegación fundada.

Por tanto:

```text
CI021 VERIFIED
≠
APROBAR_ENTRADA
```

#### 47. Cuándo CI021 puede quedar VERIFIED

La instancia CI021 puede quedar `VERIFIED` cuando:

1. su ejecución es completa;
2. el expediente es íntegro;
3. la evidencia usada es vigente;
4. la decisión final es reproducible;
5. no existe contradicción no resuelta;
6. el resultado final es uno de los resultados terminados permitidos.

Resultados terminados elegibles:

```text
APROBAR_ENTRADA
DENEGAR_ENTRADA
NO_APLICA
```

`BLOQUEAR_DECISION` no representa cierre verificado; la instancia permanece bloqueada hasta poder resolver.

#### 48. Relación entre VERIFIED y CI022

CI022 solo es elegible cuando simultáneamente:

```text
SHELL-CI-021::<package_id> = VERIFIED
+
pilot_entry_decision = APROBAR_ENTRADA
+
decision vigente
+
mismo package_id
+
mismo candidato
+
mismo ambiente
+
mismo alcance
```

Un CI021 VERIFIED con `DENEGAR_ENTRADA` no habilita CI022.

Un CI021 VERIFIED con `NO_APLICA` tampoco fabrica un cutover.

#### 49. Readiness después de una denegación

Una denegación conserva:

- gate responsable;
- evidencia;
- owner;
- causa;
- condición de salida.

Si posteriormente se corrige la condición:

1. se materializa la corrección por su carril propietario;
2. se invalida la evidencia afectada;
3. se ejecutan nuevamente las comprobaciones requeridas;
4. se emite una nueva decisión trazable.

La decisión anterior permanece histórica.

#### 50. Readiness después de un bloqueo

Un bloqueo deberá registrar:

```text
blocking_gate
blocking_reason
owner
exit_condition
required_evidence
dependencies
```

No se resuelve por comentario manual.

#### 51. Seguridad y secretos

CI021 no imprimirá ni conservará como evidencia expuesta:

- passwords;
- tokens;
- cookies;
- service role keys;
- claves privadas;
- `.env`;
- secretos de proveedores;
- credenciales productivas;
- datos personales innecesarios.

La evidencia deberá demostrar configuración y funcionamiento sin revelar el secreto.

#### 52. Expediente de readiness

La instancia deberá consolidar, como mínimo:

```text
package_id
CI020 instance reference
candidate identity
target environment
authorized scope
expected gate set
result per READY-GATE-001..014
evidence refs per gate
observed_at / freshness
owners
blocking reasons
remediation refs
READY-GATE-014 risk references
pilot entry authority
pilot entry decision
decision timestamp
decision evidence
```

El expediente no duplica payloads cuando una referencia recuperable es suficiente.

#### 53. Consistencia transversal

Antes de ejecutar READY-GATE-015, CI021 deberá comprobar que los resultados de `READY-GATE-001..014`:

- pertenecen al mismo paquete;
- pertenecen al mismo candidato;
- corresponden al mismo ambiente;
- cubren el mismo alcance autorizado;
- no se contradicen;
- siguen vigentes;
- no omiten componentes obligatorios.

Una colección de gates individualmente válidos pero mutuamente inconsistentes no permite aprobación.

#### 54. Concurrencia entre paquetes

Readiness se ejecuta por paquete.

Dos paquetes pueden encontrarse simultáneamente en CI021 si sus dependencias lo permiten.

La evidencia de uno no se reutiliza para otro salvo que el contrato canónico defina explícitamente un artefacto compartido y la referencia siga siendo aplicable a ambos.

#### 55. Readiness multi-repositorio

En un paquete multi-repositorio, READY-GATE-001 y cualquier gate dependiente del candidato deberá preservar la identidad de todos los repositorios obligatorios.

No se declara readiness positivo porque “el repositorio principal” esté correcto si otro componente obligatorio está ausente o diverge.

#### 56. Supabase y readiness

CI021 puede verificar migraciones, datos, políticas, configuración y evidencia de Supabase cuando el gate aplicable lo exija.

No crea una vía alternativa de mutación.

Si se necesita corregir Supabase:

```text
corrección
→ owner canónico
→ vento-shell
→ materialización gobernada
→ nueva evidencia
→ reevaluación readiness
```

#### 57. Cutover permanece fuera de CI021

Aunque la decisión final sea `APROBAR_ENTRADA`, CI021 no ejecuta:

- fecha o ventana;
- activación;
- cambio de tráfico;
- habilitación de cohortes;
- convivencia;
- doble registro;
- conciliación del piloto;
- pausa/reversión durante cutover;
- registro de incidentes de piloto;
- métricas del piloto;
- salida del piloto.

Esas responsabilidades pertenecen al plan `CUTOVER-OPS-*` y a `SHELL-CI-022::<package_id>`.

#### 58. Handoff a CI022

Una decisión `APROBAR_ENTRADA` deberá entregar a CI022, como mínimo:

```text
package_id
candidate
target_environment
authorized_scope
CI020 reference
CI021 reference
pilot_entry_decision_manifest
READY-GATE-001..014 evidence set
risk register reference
baseline reference
support reference
monitoring reference
rollback reference
decision authority
decision timestamp
```

CI022 no reconstruye readiness mirando logs dispersos.

#### 59. Cambio material después de APROBAR_ENTRADA

Una aprobación de entrada puede perder vigencia antes de cutover.

Si cambia materialmente:

- candidato;
- ambiente;
- alcance;
- configuración;
- dependencia;
- riesgo;
- soporte;
- observabilidad;
- rollback;
- baseline;
- autoridad;

la decisión debe reevaluarse según el gate afectado.

CI022 no puede usar una aprobación stale.

#### 60. Exposición anticipada

Queda prohibido usar CI021 para justificar una exposición que ya ocurrió sin la autorización exigida.

Si el paquete entró a usuarios, tráfico o piloto antes de `APROBAR_ENTRADA` cuando esta era obligatoria, el hecho se registra como incumplimiento; no se normaliza retroactivamente.

#### 61. Casos positivos mínimos de futura ejecución

CI021 deberá poder demostrar, según aplicabilidad:

1. paquete con 14 gates en PASS;
2. paquete con `NO_APLICA` válidos;
3. candidato multi-repositorio;
4. evidencia de deploy correlacionada por commit;
5. migraciones y datos validados;
6. configuración de permisos y actores reconciliada;
7. infraestructura operativa lista;
8. capacitación y soporte disponibles;
9. observabilidad disponible;
10. rollback probado;
11. baseline previa al piloto;
12. riesgo residual aceptado válidamente;
13. autoridad final demostrada;
14. `APROBAR_ENTRADA`;
15. `DENEGAR_ENTRADA` fundada;
16. `NO_APLICA` final fundado;
17. reevaluación después de corrección;
18. invalidación de evidencia stale;
19. handoff a CI022 solo ante aprobación vigente.

#### 62. Casos negativos mínimos de futura ejecución

CI021 deberá impedir, como mínimo:

1. iniciar con otro `package_id`;
2. evaluar otro candidato;
3. mezclar ambientes;
4. reutilizar evidencia stale;
5. omitir un gate;
6. duplicar un gate para cubrir otro;
7. usar `NO_APLICA` sin fundamento;
8. redondear un resultado parcial;
9. aceptar captura sin evidencia reproducible cuando no basta;
10. sobreescribir `FAIL` mediante riesgo aceptado;
11. aprobar con `BLOQUEADO`;
12. aprobar con autoridad no demostrada;
13. aprobar con evidencia contradictoria;
14. aprobar con baseline inválida;
15. aprobar con rollback obligatorio no probado;
16. aprobar con soporte u observabilidad obligatorios ausentes;
17. usar evidencia de otro paquete;
18. usar evidencia de otro ambiente;
19. ejecutar cutover dentro de CI021;
20. habilitar CI022 con `DENEGAR_ENTRADA`;
21. habilitar CI022 con `NO_APLICA`;
22. habilitar CI022 con decisión stale.

#### 63. Regresiones que CI021 debe impedir

CI021 no podrá introducir:

1. un checklist paralelo distinto de READY-GATE;
2. un estado global "ready" sin expediente;
3. una noción de "casi listo";
4. un bypass de READY-GATE-015;
5. una autoridad universal inventada;
6. una aceptación de riesgo que tape FAIL;
7. `NO_APLICA` como escape;
8. evidencia sin package_id;
9. evidencia sin candidato;
10. evidencia sin ambiente;
11. evidencia stale;
12. modificación silenciosa del alcance;
13. reimplementación rutinaria de CI020;
14. mutación Supabase fuera de vento-shell;
15. exposición anticipada;
16. cutover anticipado;
17. piloto anticipado;
18. cierre anticipado.

#### 64. Flujo operativo canónico de una futura instancia

```text
SHELL-CI-020::<package_id> RESUELTO
→ crear/actualizar SHELL-CI-021::<package_id>
→ autorización física explícita
→ IN_PROGRESS
→ fijar package + candidate + environment + scope
→ ejecutar/materializar READY-GATE-001..014
→ resolver discrepancias por owners
→ invalidar y reevaluar evidencia afectada cuando corresponda
→ reconciliar exactamente 14 gates
→ resolver pilot_entry_authority
→ ejecutar READY-GATE-015
→ emitir pilot_entry_decision
→ consolidar pilot_entry_decision_manifest
→ verificar expediente
→ VERIFIED si el resultado es terminal y la evidencia es íntegra
→ habilitar CI022 solo si pilot_entry_decision = APROBAR_ENTRADA y sigue vigente
```

#### 65. Cierre documental de la instancia

El cierre documental posterior a una instancia física conserva el mecanismo canónico vigente.

Ese cierre:

- no modifica la decisión emitida;
- no transforma una denegación en aprobación;
- no vuelve a ejecutar readiness por rutina;
- no actualiza evidencia stale como si siguiera vigente;
- no ejecuta CI022.

#### 66. Estado documental conciliado

| Métrica                                              |                                            Resultado |
| ---------------------------------------------------- | ---------------------------------------------------: |
| Topología CI021                                      |                             **TEMPLATE_PER_PACKAGE** |
| Marcadores globales CI021 materializados físicamente |                                                **0** |
| Instancias CI021 creadas por este marcador           |                                                **0** |
| Unidad futura                                        |                            **1 `package_id` exacto** |
| Entrada física                                       | **salida resoluble de `SHELL-CI-020::<package_id>`** |
| Contratos ejecutados                                 |                            **`READY-GATE-001..015`** |
| Gates previos exigidos por gate final                |                                               **14** |
| Autoridad final                                      |   **Responsable de decisión ya asignado al paquete** |
| Decisiones finales                                   |                                                **4** |
| Aprobación con pendientes                            |                                        **PROHIBIDA** |
| Handoff a CI022                                      |                   **solo `APROBAR_ENTRADA` vigente** |
| Cambios físicos durante marcador                     |                                                **0** |
| Cambios Supabase durante marcador                    |                                                **0** |
| Requisitos creados o modificados                     |                                                **0** |

#### 67. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** CI021 define el mecanismo de ejecución, reconciliación y decisión sobre gates de readiness ya diseñados en E5 y protegidos por requisitos existentes. El marcador global no introduce una nueva regla funcional de producto, autorización efectiva, cálculo empresarial, persistencia ni integración.

#### 68. Cobertura de prueba vigente reutilizada

CI021 reutiliza los `TREQ-*` ya vinculados a cada `READY-GATE-*`, a los paquetes E5 y a las obligaciones transversales que protegen despliegue, identidad de ambiente, compatibilidad, rollback, autorización, datos, integraciones, soporte, observabilidad y evidencia.

No crea una capa paralela de requisitos.

#### 69. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                             |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no ejecuta readiness ni materializa instancias.                                                                                                |
| LOCAL     | NOT_EXECUTED   | La validación local corresponde al checkout actualizado antes de aprobar canónicamente la tarea.                                                                      |
| REMOTA    | PASS           | Se revisaron el owner CI020..024, la puerta E5 de readiness, el universo READY-GATE-001..015, la decisión final de READY-GATE-015 y la frontera de CUTOVER-OPS/CI022. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutó ningún checklist real, consulta de ambiente, configuración, capacitación, soporte, baseline, rollback, decisión de entrada, cutover ni piloto.          |
| FÍSICA    | NOT_APPLICABLE | Este marcador solo define la plantilla. La evidencia física pertenecerá a cada `SHELL-CI-021::<package_id>`.                                                          |

#### 70. Criterios de aceptación

`SHELL-CI-021` queda documentalmente completa cuando:

- define CI021 como plantilla por paquete;
- exige salida correlacionada de CI020;
- preserva package, candidato, ambiente y alcance;
- consume READY-GATE-001..015 sin redefinirlos;
- materializa exactamente READY-GATE-001..014 antes de la decisión final;
- diferencia PASS, FAIL, BLOQUEADO y NO_APLICA;
- impide PASS parcial;
- diferencia evidencia planificada y ejecutada;
- exige reproducibilidad y vigencia;
- invalida stale evidence;
- conserva owners;
- devuelve correcciones de implementación a sus carriles propietarios;
- permite resolver readiness operativo solo dentro del alcance aprobado;
- preserva Supabase en vento-shell;
- conserva READY-GATE-014 como autoridad del riesgo residual;
- conserva READY-GATE-015 como autoridad de decisión final;
- no crea autoridad nueva;
- separa ejecutor y decisor cuando aplique;
- define las cuatro decisiones finales;
- prohíbe aprobación con pendientes;
- distingue CI021 VERIFIED de APROBAR_ENTRADA;
- permite cierre verificado con DENEGAR_ENTRADA fundada;
- mantiene BLOQUEAR_DECISION como bloqueo no cerrado;
- habilita CI022 únicamente con APROBAR_ENTRADA vigente;
- invalida aprobación ante cambio material;
- impide exposición anticipada;
- no ejecuta cutover;
- no ejecuta piloto;
- no ejecuta hypercare;
- no certifica cierre;
- no crea ni modifica TREQ;
- no modifica 04A;
- no modifica Supabase durante el marcador.

#### 71. Límites

Esta tarea documental no:

- crea una instancia `SHELL-CI-021::<package_id>`;
- ejecuta un checklist real;
- consulta ambientes productivos;
- cambia código;
- despliega código;
- crea releases;
- aplica migraciones;
- modifica Supabase;
- modifica datos;
- crea usuarios;
- concede permisos;
- configura dispositivos;
- carga catálogos;
- instala hardware;
- provisiona red;
- crea credenciales;
- capacita usuarios;
- crea mesa de soporte;
- crea alertas;
- ejecuta rollback;
- captura baseline real;
- acepta riesgos reales;
- emite una decisión real de entrada;
- ejecuta cutover;
- ejecuta piloto;
- ejecuta hypercare;
- certifica cierre;
- transfiere soporte;
- crea TREQ;
- modifica TREQ;
- modifica 04A;
- aprueba CI022;
- desarrolla CI022.

#### 72. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-020 — Implementar y desplegar cada paquete aprobado por E5`

**TAREA ACTUAL APROBADA**
`SHELL-CI-021 — Ejecutar y resolver el checklist de readiness aprobado`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-022 — Ejecutar cutover y piloto conforme al plan aprobado`


### ✅ SHELL-CI-022 — Ejecutar cutover y piloto conforme al plan aprobado

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-021 — Ejecutar y resolver el checklist de readiness aprobado
**Tarea siguiente:** SHELL-CI-023 — Ejecutar hypercare, conciliación y estabilización
**Tipo de tarea:** Plantilla global con ejecución por paquete — contrato documental para ejecutar el cutover y piloto de cada paquete con readiness aprobado, aplicar la secuencia, convivencia, controles, conciliaciones, decisiones, bitácora y métricas previstas, resolver la salida del piloto y evaluar la elegibilidad documental de retiro legacy sin ejecutar hypercare ni cierre
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/04_DESPLIEGUE_PILOTO_Y_ESTABILIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; la ejecución futura ocurre únicamente mediante `SHELL-CI-022::<package_id>` con readiness vigente, plan de cutover aprobado y autorización física separada
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo Vento OS ejecuta el cutover y el piloto de cada paquete que haya superado readiness, preservando la identidad del candidato y del alcance autorizado, activando únicamente las unidades previstas, manteniendo una única autoridad empresarial por operación, conciliando efectos, observando métricas y emitiendo decisiones reproducibles de continuación, pausa, reversión y salida.

La regla vinculante queda:

```text
SHELL-CI-021::<package_id> VERIFIED
+ pilot_entry_decision = APROBAR_ENTRADA
+ DECISIÓN VIGENTE
+ MISMO PACKAGE_ID
+ MISMO CANDIDATO
+ MISMO AMBIENTE
+ MISMO ALCANCE
+ VENTANA Y RESPONSABLES RESUELTOS
+ SECUENCIA DE ACTIVACIÓN APROBADA
+ CONTROLES DE CONVIVENCIA Y DUPLICIDAD
+ CONCILIACIÓN
+ CHECKPOINTS
+ OBSERVABILIDAD
+ SOPORTE
+ RECUPERACIÓN
= PILOTO EJECUTABLE
```

Y de forma fail-closed:

```text
READINESS STALE
O CANDIDATO DISTINTO
O AMBIENTE DISTINTO
O ALCANCE AMPLIADO
O VENTANA NO VIGENTE
O OLA SIN CHECKPOINT
O DOBLE AUTORIDAD
O RESULTADO INCIERTO REINTENTADO A CIEGAS
O DUPLICIDAD CONFIRMADA IGNORADA
O PAUSA SALTADA
O ROLLBACK IMPROVISADO
O MÉTRICA SIN DEFINICIÓN
O SALIDA APROBADA CON PENDIENTES
≠ CI022 VERIFIED
```

`SHELL-CI-022` ejecuta cutover y piloto. No ejecuta hypercare sostenido, no certifica el cierre integral del paquete y no materializa por sí misma el retiro lógico o físico de procesos legacy.

#### 2. Resultado canónico

`SHELL-CI-022` establece una única plantilla reutilizable para que cada paquete:

1. obtenga una instancia `SHELL-CI-022::<package_id>`;
2. consuma una decisión `APROBAR_ENTRADA` vigente de CI021;
3. preserve el mismo candidato, ambiente y alcance;
4. ejecute los contratos `CUTOVER-OPS-001..010`;
5. seleccione y respete una ventana exacta;
6. active por unidades y olas gobernadas;
7. mantenga convivencia sin doble autoridad;
8. impida doble escritura y doble efecto;
9. conserve identidad estable de las operaciones;
10. concilie hechos y efectos con fuentes autoritativas;
11. decida en checkpoints mediante `CONTINUAR`, `PAUSAR` o `REVERTIR`;
12. mantenga una bitácora append-only;
13. mida tiempo, errores, adopción y resultado de negocio con definiciones reproducibles;
14. resuelva la decisión de salida del piloto;
15. impida aprobación por tiempo, promedio o percepción;
16. evalúe elegibilidad documental de retiro legacy sin ejecutarlo;
17. preserve evidencia de intentos, incidentes, correcciones y decisiones;
18. invalide evidencia y decisiones stale;
19. no invada hypercare;
20. entregue un handoff inequívoco a CI023.

#### 3. Frontera del ciclo CI020..024

| Etapa                        | Responsabilidad                                             |
| ---------------------------- | ----------------------------------------------------------- |
| `SHELL-CI-020::<package_id>` | Implementar y desplegar técnicamente                        |
| `SHELL-CI-021::<package_id>` | Demostrar readiness y autorizar entrada                     |
| `SHELL-CI-022::<package_id>` | Ejecutar cutover, piloto, decisiones y salida               |
| `SHELL-CI-023::<package_id>` | Ejecutar hypercare, conciliación sostenida y estabilización |
| `SHELL-CI-024::<package_id>` | Certificar cierre y transferencia a soporte                 |

CI022 es la primera etapa en la que el alcance autorizado puede exponerse de forma controlada a operación real.

#### 4. Topología de trabajo

La topología de `SHELL-CI-022` es `TEMPLATE_PER_PACKAGE`.

```text
SHELL-CI-022
→ define una sola vez el contrato

SHELL-CI-022::<package_id>
→ ejecuta el cutover y piloto de una instancia exacta
```

La ejecución de una instancia no reabre ni vuelve a aprobar el marcador global.

#### 5. Cadena física obligatoria

```text
E5-GATE-008::<package_id>
→ SHELL-CI-020::<package_id>
→ SHELL-CI-021::<package_id>
→ SHELL-CI-022::<package_id>
→ SHELL-CI-023::<package_id>
→ SHELL-CI-024::<package_id>
```

CI022 no puede saltarse CI021 por disponer de un deploy técnicamente correcto.

#### 6. Condición de entrada desde CI021

CI022 solo puede iniciar ejecución autoritativa cuando se cumplen simultáneamente:

```text
SHELL-CI-021::<package_id> = VERIFIED
pilot_entry_decision = APROBAR_ENTRADA
decision = vigente
package_id = idéntico
candidate = idéntico
environment = idéntico
authorized_scope = idéntico
```

`DENEGAR_ENTRADA`, `BLOQUEAR_DECISION`, `NO_APLICA` o ausencia de decisión válida impiden fabricar un cutover ejecutable.

#### 7. Revalidación inmediatamente antes del cutover

Una aprobación de readiness puede quedar stale después de emitirse.

Antes de iniciar el primer efecto operativo, CI022 deberá comprobar que no cambió materialmente:

- candidato;
- commit o versión;
- ambiente;
- alcance;
- configuración;
- dependencia;
- soporte;
- observabilidad;
- rollback;
- baseline;
- riesgo aceptado;
- autoridad;
- ventana;
- responsables.

Un cambio material devuelve el control al gate propietario antes de exponer operación.

#### 8. Identidad del cutover

La ejecución deberá fijar como mínimo:

```text
package_id
candidate_ref
environment
authorized_scope_ref
cutover_window_ref
activation_sequence_ref
readiness_decision_ref
rollout_ref
rollback_ref
pilot_scope_ref
```

Una fecha aislada no constituye identidad de cutover.

#### 9. Universo obligatorio CUTOVER-OPS

CI022 ejecuta el contrato aprobado de diez piezas:

| Contrato          | Responsabilidad                                          |
| ----------------- | -------------------------------------------------------- |
| `CUTOVER-OPS-001` | Fecha, ventana y responsables                            |
| `CUTOVER-OPS-002` | Secuencia de activación                                  |
| `CUTOVER-OPS-003` | Convivencia temporal                                     |
| `CUTOVER-OPS-004` | Prevención de doble registro o doble efecto              |
| `CUTOVER-OPS-005` | Conciliaciones durante el piloto                         |
| `CUTOVER-OPS-006` | Continuar, pausar o revertir                             |
| `CUTOVER-OPS-007` | Registro de incidentes, decisiones y alcance             |
| `CUTOVER-OPS-008` | Métricas del piloto                                      |
| `CUTOVER-OPS-009` | Decisión de salida del piloto                            |
| `CUTOVER-OPS-010` | Elegibilidad documental para retirar el proceso anterior |

CI022 no redefine esos contratos.

#### 10. Ventana de cutover

La ventana seleccionada debe corresponder exactamente al mismo paquete, candidato, ambiente y alcance autorizados.

Su identidad conserva:

```text
cutover_date
window_start
window_end
timezone
responsible_authorities
operational_owners
technical_owners
support_coverage
recovery_coverage
```

No se usa hora local implícita ni una ventana verbal.

#### 11. Vigencia de la ventana

Una ventana previamente seleccionada deja de ser ejecutable cuando cambia materialmente una precondición que la sustentaba.

Entre otras:

- readiness;
- candidato;
- ambiente;
- alcance;
- rollout;
- recuperación;
- soporte;
- observabilidad;
- rollback;
- dependencia crítica;
- autoridad requerida.

CI022 no ejecuta una ventana stale porque “ya estaba calendarizada”.

#### 12. Responsables y autoridades

La ventana debe resolver los responsables ya definidos por los contratos del paquete.

No crea roles nuevos por conveniencia.

Debe distinguir, según aplique:

```text
autoridad de entrada
autoridad operativa
owner técnico
owner funcional
soporte
observabilidad
autoridad de pausa
autoridad de reversión
owner de recuperación
```

Una persona puede cubrir más de una función solo cuando el contrato lo permita.

#### 13. Unidad de activación

La activación puede organizarse por:

```text
SEDE
AREA
ROL
PROCESO
COMPUESTA
UNICA
```

La dimensión efectiva proviene del paquete y del plan aprobado.

CI022 no fragmenta ni combina unidades si ello rompe atomicidad, integridad o autoridad.

#### 14. Secuencia de olas

Cuando existan varias unidades:

```text
WAVE-001
→ CHECKPOINT
→ WAVE-002
→ CHECKPOINT
→ ...
```

Cada ola conserva:

- unidades;
- prerequisitos;
- orden;
- dependencias;
- checkpoint;
- criterios de continuidad;
- autoridades.

No se promueve la siguiente ola automáticamente.

#### 15. Paralelismo

Dos unidades solo pueden activarse en paralelo cuando su independencia esté demostrada.

Si comparten:

- escritura;
- identidad;
- inventario;
- migración;
- autoridad;
- dependencia;
- compensación;
- recuperación;

el plan deberá serializarlas o definir explícitamente el control concurrente.

La velocidad no justifica paralelismo inseguro.

#### 16. Checkpoint obligatorio

Cada transición material entre olas debe pasar por el checkpoint aprobado.

El checkpoint consume evidencia real de:

- efectos;
- errores;
- conciliación;
- duplicidad;
- soporte;
- observabilidad;
- riesgo;
- recuperación;
- métricas aplicables.

El final temporal de una ola no equivale a checkpoint PASS.

#### 17. Duración del piloto

La duración efectiva proviene del plan aprobado del paquete.

Cuando aplique la modalidad directa gobernada por `DUR-DIR-001`, el piloto deberá respetar la duración activa y el ciclo operativo completo definidos por ese contrato.

Los días de pausa por seguridad no se cuentan como tiempo activo cuando el contrato así lo establece.

Completar el tiempo mínimo nunca sustituye la decisión de salida.

#### 18. Convivencia temporal

La convivencia permite operar durante una transición sin convertir ambos caminos en autoridades simultáneas.

Invariante:

```text
CONVIVENCIA TEMPORAL
≠ DOBLE AUTORIDAD
≠ DOBLE ESCRITURA
≠ DOBLE EFECTO
≠ ROLLBACK
≠ CONCILIACIÓN
≠ RETIRO LEGACY
```

La presencia del camino anterior no lo convierte en fallback informal.

#### 19. Autoridad única por operación

Cada operación lógica debe tener una ruta autoritativa determinable.

La autoridad podrá depender de:

- unidad;
- cohorte;
- momento;
- estado;
- work-in-progress;
- wave;
- rollback state.

Pero nunca puede quedar ambigua por diseño.

#### 20. Trabajo en curso

Operaciones iniciadas antes de la activación deben conservar tratamiento explícito.

CI022 no mueve arbitrariamente work-in-progress entre rutas.

El plan deberá determinar:

- dónde termina;
- quién conserva autoridad;
- cómo se correlaciona;
- qué ocurre durante pausa;
- cómo se recupera.

#### 21. Modo shadow

Cuando exista observación shadow:

```text
SHADOW
→ puede observar
→ puede comparar
→ puede producir telemetría
≠ autoridad empresarial
≠ efecto empresarial duplicado
```

La ruta shadow no puede usar el piloto como permiso para generar efectos reales no autorizados.

#### 22. Control contra doble efecto

Toda operación lógica protegida debe conservar una identidad estable.

Modelo:

```text
ONE LOGICAL OPERATION
→ STABLE IDENTITY
→ ONE AUTHORITATIVE ROUTE
→ CANONICAL CONTROL
→ AT MOST ONE EFFECTIVE BUSINESS EFFECT
```

CI022 no puede basar seguridad únicamente en “el usuario no debería hacer clic dos veces”.

#### 23. Familias de control

Según aplicabilidad, el paquete reutiliza controles aprobados como:

```text
AUTHORITY_FENCE
STABLE_OPERATION_IDENTITY
IDEMPOTENT_RESULT_REUSE
CONTENT_CONFLICT_GUARD
ATOMICITY_OR_VERSION_GUARD
OUTBOX_INBOX_OR_CLAIM_GUARD
EXTERNAL_EFFECT_GUARD
SHADOW_NO_EFFECT_GUARD
WORK_IN_PROGRESS_ROUTE_FENCE
OBSERVABILITY_AUDIT_GUARD
FAIL_CLOSED_GUARD
```

No se inventa un mecanismo local alternativo durante el piloto.

#### 24. Reintentos

Un retry debe preservar la identidad lógica de la operación cuando el contrato exija idempotencia.

Queda prohibido cambiar:

- ruta;
- clave;
- correlación;
- payload;
- actor técnico;

solo para evitar un resultado incierto y “probar de nuevo”.

#### 25. Timeout no equivale a fracaso

Un timeout o ausencia de respuesta no implica automáticamente que el efecto no ocurrió.

Si el resultado es incierto:

```text
NO REINTENTO CIEGO
→ CORRELACIONAR
→ CONCILIAR
→ RESOLVER ESTADO
→ DECIDIR
```

La incertidumbre se trata como estado propio.

#### 26. Efectos externos y asíncronos

Cuando existan colas, providers, impresión, notificaciones, jobs, callbacks o efectos externos, la identidad y conciliación deben sobrevivir a:

- reintentos;
- retrasos;
- callbacks duplicados;
- recuperación;
- pausa;
- reanudación.

La ausencia de respuesta síncrona no elimina el efecto potencial.

#### 27. Conciliación

CI022 ejecuta conciliaciones contra la fuente autoritativa definida por contrato.

Modelo:

```text
MISMO HECHO U OPERACIÓN
+ CORRELACIÓN ESTABLE
+ FUENTE AUTORITATIVA EXPLÍCITA
+ CONTRAPARTE
+ REGLA DE COMPARACIÓN VIGENTE
+ EVIDENCIA REPRODUCIBLE
= CONCILIACIÓN ATRIBUIBLE
```

La fuente autoritativa no se elige por “lo más reciente”.

#### 28. Resultados de conciliación

Los resultados futuros aplicables incluyen:

```text
CONCILIADA
DIFERENCIA_ESPERADA
DIFERENCIA_NO_RESUELTA
RESULTADO_INCIERTO
DUPLICIDAD_CONFIRMADA
NO_APLICA
BLOQUEADA
INVALIDADA
```

Cada uno conserva semántica independiente.

#### 29. Diferencia esperada

`DIFERENCIA_ESPERADA` solo es válida cuando el contrato explica por qué la diferencia es legítima durante la transición.

No se usa para reclasificar una divergencia inesperada después de observarla.

#### 30. Diferencia no resuelta

`DIFERENCIA_NO_RESUELTA` impide continuar automáticamente.

La instancia debe pausar la expansión y resolver:

- causa;
- owner;
- impacto;
- condición de salida;
- necesidad de recuperación.

Si DELIV-PKG-020 define trigger de reversión, se evalúa ese trigger.

#### 31. Resultado incierto

`RESULTADO_INCIERTO` implica:

```text
NO asumir éxito
NO asumir fracaso
NO reintentar a ciegas
PAUSAR expansión
CONCILIAR
```

Solo una evidencia posterior puede resolverlo.

#### 32. Duplicidad confirmada

`DUPLICIDAD_CONFIRMADA` nunca cuenta como conciliada.

Debe:

1. preservar evidencia;
2. detener expansión;
3. identificar impacto;
4. ejecutar compensación o recuperación aprobada cuando corresponda;
5. evaluar si activa reversión.

No se borra historia para aparentar unicidad.

#### 33. Disposiciones operativas

`CUTOVER-OPS-006` permite exactamente:

```text
CONTINUAR
PAUSAR
REVERTIR
```

No existe una cuarta disposición informal equivalente a “sigamos con cuidado”.

#### 34. Precedencia de decisión

La evaluación respeta:

```text
1. IDENTIDAD Y VIGENCIA
2. TRIGGERS DE ROLLBACK / RECUPERACIÓN
3. SUSPENSIÓN / BLOQUEOS
4. GATES DE CONTINUACIÓN / PROMOCIÓN
5. AUTORIDAD EXPLÍCITA
```

Una señal favorable de menor precedencia no anula una condición de mayor precedencia.

#### 35. `CONTINUAR`

Solo procede cuando:

- identidad y alcance siguen vigentes;
- no existe trigger de reversión;
- no existe condición de suspensión;
- controles aplicables están sanos;
- conciliaciones permiten continuar;
- observabilidad crítica está disponible;
- soporte está disponible;
- recuperación sigue viable;
- gates de promoción aplicables pasan;
- autoridad requerida está presente.

El tiempo transcurrido no produce `CONTINUAR`.

#### 36. `PAUSAR`

`PAUSAR` detiene nueva expansión.

La pausa debe conservar un estado seguro y delimitar:

- qué operaciones pueden terminar;
- qué operaciones nuevas quedan bloqueadas;
- qué soporte sigue activo;
- qué conciliación continúa;
- qué evidencia se requiere;
- qué condición permite reevaluar.

Una pausa no es un rollback implícito.

#### 37. Reanudación después de pausa

La reanudación exige una nueva evaluación del checkpoint afectado.

No se continúa porque:

- “ya pasó suficiente tiempo”;
- “no hubo más alertas”;
- “parece estable”;
- “la ventana se está acabando”.

La evidencia y autoridad deben volver a habilitar `CONTINUAR`.

#### 38. `REVERTIR`

`REVERTIR` activa únicamente la estrategia de recuperación aprobada.

CI022 no improvisa rollback.

La ejecución debe poder resolver:

```text
trigger
scope
target
procedure
owner
dependencies
data treatment
validation
evidence
```

Un kill switch no equivale necesariamente a rollback completo.

#### 39. Recuperación, restauración y compensación

CI022 distingue:

```text
PAUSA
REVERSIÓN
ROLLBACK
RESTAURACIÓN
COMPENSACIÓN
RECUPERACIÓN
```

Pueden estar relacionadas, pero no son sinónimos.

La estrategia aplicable proviene de DELIV-PKG-020 y de los owners técnicos correspondientes.

#### 40. Bitácora append-only

La ejecución conserva un registro append-only de:

- incidentes;
- decisiones;
- cambios de alcance solicitados;
- cambios de alcance aprobados o rechazados;
- pausas;
- reanudaciones;
- reversión;
- conciliaciones relevantes;
- decisiones de salida.

Una corrección nueva nunca reescribe el evento anterior.

#### 41. Tiempos distintos

La bitácora distingue, cuando aplique:

```text
fact_at
detected_at
recorded_at
decided_at
effect_at
```

Un evento detectado tarde no debe fingirse registrado en tiempo real.

#### 42. Incidentes

Un incidente debe preservar:

- identidad;
- alcance;
- severidad cuando aplique;
- evidencia;
- operaciones afectadas;
- decisión;
- owner;
- resolución;
- relación con métricas y conciliación.

Registrar un incidente no significa que ya esté resuelto.

#### 43. Decisión no equivale a efecto

Ejemplo:

```text
DECISIÓN = REVERTIR
```

no demuestra que la reversión haya ocurrido.

La bitácora debe diferenciar la decisión de su ejecución y verificación.

#### 44. Cambios de alcance

Una solicitud de ampliar, reducir o cambiar alcance no cambia el alcance efectivo.

Debe conservar:

```text
request
authority
decision
effective_at
new_scope_ref
affected_evidence
```

Hasta su aprobación y materialización, sigue vigente el alcance anterior.

#### 45. Cambio material de alcance

Cuando un cambio aprobado altera materialmente:

- candidato;
- ambiente;
- cohorte;
- proceso;
- datos;
- dispositivo;
- autorización;
- dependencias;

debe evaluarse qué readiness, baseline, métricas, controles y evidencia quedaron invalidados.

CI022 no continúa como si fuera la misma ejecución.

#### 46. Defectos reales encontrados durante piloto

Un defecto observado genera evidencia real.

Su tratamiento debe vincular:

```text
defecto
→ owner canónico
→ corrección exacta
→ requisito de regresión cuando corresponda
→ nueva evidencia
```

El marcador global no inventa por anticipado identificadores de defectos futuros.

#### 47. Corrección que cambia el candidato

Si una corrección produce un candidato material nuevo:

```text
CANDIDATO A
→ CORRECCIÓN
→ CANDIDATO B
```

la evidencia de A permanece histórica.

Debe reevaluarse:

- CI020 cuando la implementación cambió;
- CI021 cuando readiness quedó invalidado;
- CI022 solo después de recuperar una entrada vigente.

No se hereda automáticamente la autorización de A.

#### 48. Corrección operacional sin cambio de candidato

Una corrección que no cambia candidato ni contrato podrá reevaluar el checkpoint y controles afectados cuando:

- package_id siga idéntico;
- ambiente siga idéntico;
- alcance siga idéntico;
- readiness no haya quedado invalidado;
- baseline siga comparable;
- demás evidencia siga vigente.

#### 49. Métricas del piloto

CI022 ejecuta las definiciones aprobadas para:

```text
TIEMPO
ERRORES
ADOPCIÓN
RESULTADO DE NEGOCIO
```

Cada métrica debe conservar:

- definición;
- fórmula;
- numerador;
- denominador;
- población elegible;
- ventana;
- dimensiones;
- baseline cuando aplique;
- fuente;
- calidad de datos;
- regla de decisión cuando sea vinculante.

#### 50. Métrica de tiempo

El tiempo debe distinguir:

- tiempo calendario;
- tiempo activo;
- pausas;
- ventanas no operativas;
- ciclo operativo completo.

No se cuenta una pausa de seguridad como evidencia de exposición activa cuando el contrato la excluye.

#### 51. Métrica de errores

La tasa de error usa únicamente intentos elegibles y errores definidos.

No se cambia el denominador durante el piloto para mejorar el porcentaje.

Los errores críticos pueden tener límites independientes de cualquier promedio agregado.

#### 52. Métrica de adopción

Adopción mide unidades realmente elegibles o expuestas.

No se usa como denominador a toda la organización cuando el piloto solo cubre una cohorte.

Tampoco se cuentan usuarios fuera de alcance para inflar o degradar artificialmente la tasa.

#### 53. Resultado de negocio

El resultado se compara con una baseline compatible cuando el contrato lo exige.

La comparación debe conservar:

- misma definición;
- periodo comparable;
- misma unidad;
- cohortes comparables;
- calidad mínima;
- exclusiones justificadas.

Una mejora técnica no sustituye un criterio de negocio vinculante.

#### 54. Calidad de datos de métricas

CI022 distingue:

```text
0
NULL
SIN_DATOS
NO_APLICA
DATO_INVALIDO
```

No son equivalentes.

Una métrica sin datos suficientes no puede presentarse como cero favorable.

#### 55. Segmentación y seguridad

Un promedio global no puede ocultar un segmento crítico que incumple un hard ceiling o criterio obligatorio.

Cuando el contrato exige segmentación por sede, área, rol, proceso, dispositivo o cohorte, la decisión debe preservar esa dimensión.

#### 56. Métrica diagnóstica y métrica vinculante

Una métrica diagnóstica informa, pero no decide por sí sola.

Una métrica vinculante necesita threshold o regla de decisión canónica.

Si una métrica es declarada vinculante pero carece de umbral o regla resoluble:

```text
NO inventar threshold
→ BLOQUEAR decisión
```

#### 57. Completar duración no aprueba salida

```text
DURACIÓN COMPLETA
≠ PILOTO APROBADO
```

El tiempo mínimo es una condición cuando aplique, no la decisión final.

#### 58. Decisión de salida del piloto

`CUTOVER-OPS-009` produce exactamente:

```text
APROBAR_SALIDA
EXIGIR_CORRECCIONES
BLOQUEAR_DECISION
NO_APLICA
```

No existe `APROBAR_CON_PENDIENTES`.

#### 59. `APROBAR_SALIDA`

Solo procede cuando:

- todos los criterios de aceptación aplicables pasan;
- no existe evidencia faltante o bloqueada;
- duración aplicable está cumplida;
- alcance no fue ampliado sin autorización;
- no existe defecto mayor o bloqueante abierto;
- no queda recuperación, rollback, compensación o conciliación obligatoria pendiente;
- no existe duplicidad material no resuelta;
- no existe incertidumbre material no resuelta;
- no existe diferencia material no resuelta;
- no existe pausa o reversión incompatible activa;
- observabilidad requerida está disponible;
- evidencia está completa;
- métricas vinculantes cumplen sus reglas;
- autoridad de salida es válida;
- no ocurrió cambio material posterior.

Una métrica favorable no compensa un guardrail crítico fallido.

#### 60. `EXIGIR_CORRECCIONES`

Significa que existe evidencia suficiente de incumplimiento material corregible.

No habilita CI023 como si el piloto hubiera terminado satisfactoriamente.

La instancia conserva:

- criterio incumplido;
- evidencia;
- owner;
- corrección requerida;
- nueva evidencia exigida;
- efecto sobre candidato/readiness.

Después de corregir se emite una nueva evaluación trazable.

#### 61. `BLOQUEAR_DECISION`

Significa que todavía falta evidencia, comparabilidad, autoridad, reconciliación o resolución suficiente para decidir de forma fundada.

No equivale a aprobación ni a denegación implícita.

La instancia permanece bloqueada hasta resolver la condición.

#### 62. `NO_APLICA`

Solo procede cuando la modalidad canónica demuestra que esa instancia no posee una decisión de salida de piloto propia.

No se usa para omitir un piloto requerido o cerrar un piloto incompleto.

#### 63. Estado CI022 y decisión de salida

El estado físico de la instancia y la decisión de salida son dimensiones distintas.

La instancia solo puede quedar `VERIFIED` para handoff cuando el ciclo que le corresponde esté completamente resuelto y su evidencia sea íntegra.

Para una instancia con piloto propio:

```text
CI022 VERIFIED
+
pilot_exit_decision = APROBAR_SALIDA
→ handoff positivo a CI023
```

`EXIGIR_CORRECCIONES` mantiene trabajo pendiente.

`BLOQUEAR_DECISION` mantiene la instancia bloqueada.

`NO_APLICA` solo puede cerrar la instancia cuando su modalidad canónica justifique que no existe piloto propio y el handoff posterior conserve esa condición sin fabricar exposición.

#### 64. No promoción automática después de salida

`APROBAR_SALIDA` no autoriza por sí sola:

- rollout adicional;
- expansión a otra cohorte;
- promoción a otro ambiente;
- cierre del paquete;
- retiro legacy;
- desactivación del proceso anterior.

Es una decisión de salida del piloto, no un permiso universal.

#### 65. Elegibilidad de retiro legacy

`CUTOVER-OPS-010` evalúa exclusivamente si una superficie anterior puede considerarse documentalmente elegible para un carril de retiro.

Decisiones:

```text
RETIRO_ELEGIBLE
RETIRO_BLOQUEADO
NO_APLICA
INVALIDADA
```

#### 66. `RETIRO_ELEGIBLE` no ejecuta retiro

Invariante:

```text
RETIRO_ELEGIBLE
≠ LOGICAMENTE_DESHABILITADO
≠ FISICAMENTE_REMOVIDO
≠ RETIREMENT_CLOSED
```

CI022 no borra rutas, tablas, funciones, permisos, procesos, datos, jobs, consumidores ni compatibilidad por emitir esa decisión.

#### 67. Carril de retiro posterior

Cuando aplique, la evolución del retiro preserva etapas como:

```text
INVENTORIED
→ SUCCESSOR_PROVEN
→ DEPRECATION_ANNOUNCED
→ NO_NEW_USAGE_FENCED
→ LEGACY_READ_ONLY
→ ZERO_USAGE_OBSERVED
→ DATA_AND_EVIDENCE_PRESERVED
→ LOGICALLY_DISABLED
→ PHYSICALLY_REMOVED
→ POST_REMOVAL_OBSERVED
→ RETIREMENT_CLOSED
```

CI022 solo evalúa elegibilidad dentro de su contrato; no ejecuta las etapas posteriores que pertenecen a sus owners.

#### 68. Condiciones que bloquean retiro

Entre otras:

- old path sigue siendo autoridad;
- consumidores todavía dependen de él;
- work-in-progress no está resuelto;
- retries o async quedan inciertos;
- faltan datos o backfill;
- sigue siendo necesario para rollback o recovery;
- preserva historia/evidencia obligatoria;
- existe drift;
- no hay evidencia suficiente de zero usage;
- falta compatibilidad sucesora.

Un piloto favorable no elimina esas dependencias.

#### 69. Handoff a CI023

CI022 deberá entregar a CI023, según aplicabilidad:

```text
package_id
candidate
environment
authorized_scope
CI021 readiness reference
cutover window
activation history
wave/checkpoint history
coexistence state
duplicate-control evidence
reconciliation results
incident ledger
decision ledger
scope-change history
pilot metrics
baseline reference
pilot_exit_decision_manifest
legacy_retirement_manifest
surfaces RETIRO_ELEGIBLE no retiradas
surfaces RETIRO_BLOQUEADO y causa
retained dependencies
open support obligations
open observation obligations
open reconciliation obligations
open recovery obligations
```

CI023 no debe reconstruir el piloto a partir de logs dispersos.

#### 70. Frontera con hypercare

CI022 termina con el resultado del piloto y el estado documental de elegibilidad de retiro.

CI023 empieza el acompañamiento intensivo y la estabilización sostenida.

Por tanto CI022 no define ni ejecuta:

- duración de hypercare;
- salida de hypercare;
- estabilización sostenida;
- tendencias post-piloto;
- criterio final de soporte normal;
- cierre del paquete.

#### 71. Autorización física

La ejecución real de `SHELL-CI-022::<package_id>` requiere autorización física explícita por instancia.

La existencia de `APROBAR_ENTRADA` habilita elegibilidad, no autoriza por sí sola a ChatGPT ni a un agente a mutar sistemas.

El operador predeterminado sigue siendo humano salvo autorización canónica distinta.

#### 72. Carril físico y watcher

Durante una ejecución física gobernada por la política de implementación:

1. la instancia conserva su estado propio;
2. el watcher se detiene antes de entrar al carril físico cuando la política vigente lo exige;
3. no se reabre el marcador documental global;
4. la evidencia se captura en el registro de la instancia;
5. al terminar el cierre documental se restablece el mecanismo canónico sin reejecutar el piloto.

CI022 no usa el watcher como mecanismo de cutover.

#### 73. Evidencia consolidada

El expediente físico de `SHELL-CI-022::<package_id>` deberá permitir resolver, como mínimo:

```text
package_id
candidate
environment
authorized_scope
readiness decision
cutover window
activation sequence
activation waves
checkpoints
coexistence authority
operation identities
duplicate controls
reconciliation outcomes
CONTINUAR/PAUSAR/REVERTIR history
incidents
scope changes
pilot duration
metrics
baseline
pilot exit decision
pilot exit authority
legacy retirement evaluation
recovery/rollback evidence when used
completed_at
```

Las referencias pueden apuntar a evidencia recuperable sin duplicar payload sensible.

#### 74. Seguridad y secretos

CI022 no expone como evidencia:

- tokens;
- cookies;
- passwords;
- private keys;
- service-role keys;
- `.env`;
- secretos de providers;
- credenciales productivas;
- datos personales innecesarios.

La evidencia operativa debe demostrar resultado sin revelar el secreto.

#### 75. Casos positivos mínimos de futura ejecución

CI022 deberá poder demostrar, según aplicabilidad:

1. entrada con readiness vigente;
2. ventana exacta y responsables disponibles;
3. activación de una sola unidad;
4. activación por varias olas;
5. checkpoint PASS entre olas;
6. convivencia con autoridad única;
7. shadow sin efectos empresariales;
8. idempotencia y correlación de retries;
9. conciliación positiva;
10. diferencia esperada justificada;
11. pausa correcta ante incertidumbre;
12. reversión conforme al plan;
13. bitácora append-only;
14. métricas reproducibles;
15. baseline comparable;
16. `APROBAR_SALIDA` fundada;
17. corrección y reevaluación cuando corresponda;
18. `RETIRO_ELEGIBLE` sin ejecutar retiro;
19. handoff íntegro a CI023.

#### 76. Casos negativos mínimos de futura ejecución

CI022 deberá impedir, como mínimo:

1. iniciar sin `APROBAR_ENTRADA`;
2. usar readiness stale;
3. cambiar candidato por inferencia;
4. cambiar ambiente;
5. ampliar alcance sin autoridad;
6. ejecutar ventana stale;
7. saltar ola;
8. saltar checkpoint;
9. doble autoridad;
10. doble efecto;
11. retry ciego tras timeout;
12. tratar `RESULTADO_INCIERTO` como PASS;
13. tratar `DUPLICIDAD_CONFIRMADA` como conciliada;
14. continuar con diferencia no resuelta;
15. ignorar trigger de rollback;
16. improvisar rollback;
17. reescribir bitácora;
18. cambiar alcance mediante solicitud no aprobada;
19. inventar threshold de métrica;
20. confundir no-data con cero;
21. aprobar por promedio ocultando segmento crítico;
22. aprobar salida solo por tiempo;
23. `APROBAR_CON_PENDIENTES`;
24. habilitar CI023 con correcciones obligatorias abiertas;
25. retirar legacy por `APROBAR_SALIDA`;
26. retirar legacy por `RETIRO_ELEGIBLE`;
27. ejecutar hypercare dentro de CI022.

#### 77. Regresiones que CI022 debe impedir

CI022 no podrá introducir:

1. un sistema paralelo de cutover;
2. una autoridad de operación no trazable;
3. un identificador de operación regenerado por retry;
4. una noción de timeout = fracaso;
5. doble escritura como estrategia de transición;
6. shadow con efectos reales;
7. conciliación basada en “latest”;
8. avance automático entre olas;
9. continuidad por tiempo;
10. rollback improvisado;
11. historial mutable;
12. métricas vanity como criterio de aprobación;
13. umbrales inventados;
14. aprobación con pendientes;
15. expansión de alcance silenciosa;
16. evidencia stale;
17. retiro legacy prematuro;
18. hypercare anticipado;
19. cierre anticipado.

#### 78. Flujo operativo canónico de una futura instancia

```text
CI021 VERIFIED
+ APROBAR_ENTRADA vigente
→ crear/actualizar SHELL-CI-022::<package_id>
→ autorización física explícita
→ revalidar package + candidate + environment + scope
→ confirmar ventana y responsables
→ activar WAVE-001
→ observar + conciliar + medir
→ checkpoint
→ CONTINUAR / PAUSAR / REVERTIR
→ repetir olas aplicables
→ completar duración/ciclo aplicable
→ reconciliar evidencia final
→ ejecutar CUTOVER-OPS-009
→ APROBAR_SALIDA / EXIGIR_CORRECCIONES / BLOQUEAR_DECISION / NO_APLICA
→ si aplica, evaluar CUTOVER-OPS-010
→ consolidar expediente
→ VERIFIED solo cuando el ciclo correspondiente esté resuelto
→ habilitar handoff a CI023 conforme al resultado vigente
```

#### 79. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** 0
**Requisitos modificados:** 0
**Fragmentos 04A afectados:** 0

**Justificación:** CI022 define el mecanismo de ejecución de controles, conciliaciones, decisiones y métricas ya aprobados en `CUTOVER-OPS-*`, DELIV-PKG, READY-GATE y requisitos existentes. El marcador global no introduce un nuevo comportamiento empresarial independiente ni una nueva fuente de requisitos.

#### 80. Cobertura de prueba vigente reutilizada

Cada instancia reutiliza los `TREQ-*` ya vinculados a:

- su `DELIV-PKG`;
- sus `READY-GATE-*`;
- sus `CUTOVER-OPS-*`;
- los contratos de autorización;
- integraciones;
- datos;
- continuidad;
- rollback;
- observabilidad;
- evidencia;
- operación y conciliación.

CI022 no crea una capa paralela de requisitos ni cambia los owners existentes.

#### 81. Estado documental conciliado

| Métrica                                        |                                    Resultado |
| ---------------------------------------------- | -------------------------------------------: |
| Topología CI022                                |                     **TEMPLATE_PER_PACKAGE** |
| Marcadores globales materializados físicamente |                                        **0** |
| Instancias CI022 creadas por este marcador     |                                        **0** |
| Entrada obligatoria                            | **CI021 VERIFIED + APROBAR_ENTRADA vigente** |
| Contratos de cutover consumidos                |                                       **10** |
| Disposiciones operativas                       |         **3: CONTINUAR / PAUSAR / REVERTIR** |
| Decisiones de salida                           |                                        **4** |
| Aprobación con pendientes                      |                                **PROHIBIDA** |
| `APROBAR_SALIDA` ejecuta retiro legacy         |                                       **NO** |
| `RETIRO_ELEGIBLE` ejecuta retiro legacy        |                                       **NO** |
| Siguiente etapa                                |         **CI023 hypercare y estabilización** |
| Cambios físicos durante marcador               |                                        **0** |
| Cambios Supabase durante marcador              |                                        **0** |
| TREQ creados o modificados                     |                                        **0** |

#### 82. Criterios de aceptación

`SHELL-CI-022` queda documentalmente completa cuando:

- define CI022 como plantilla por paquete;
- exige CI021 VERIFIED y `APROBAR_ENTRADA` vigente;
- preserva package, candidato, ambiente y alcance;
- consume `CUTOVER-OPS-001..010`;
- define ventana y vigencia;
- define unidades, olas y checkpoints;
- impide promoción automática;
- define convivencia sin doble autoridad;
- define tratamiento de work-in-progress;
- define shadow sin efectos;
- protege identidad estable de operaciones;
- impide retry ciego;
- define conciliación y sus resultados;
- distingue incertidumbre y duplicidad;
- limita las decisiones operativas a continuar, pausar o revertir;
- define precedencia de decisión;
- define reanudación;
- preserva rollback aprobado;
- mantiene bitácora append-only;
- separa decisión de efecto;
- gobierna cambios de alcance;
- vincula defectos reales con owners;
- invalida candidato/evidencia cuando cambia;
- define métricas reproducibles;
- distingue no-data, cero y no-aplica;
- impide promedios que oculten guardrails;
- define las cuatro decisiones de salida;
- prohíbe aprobación con pendientes;
- impide aprobación por tiempo;
- define correcciones y bloqueos;
- separa salida de piloto de promoción;
- define elegibilidad de retiro legacy;
- prohíbe retiro por inferencia;
- define handoff a CI023;
- no ejecuta hypercare;
- no certifica cierre;
- no crea ni modifica TREQ;
- no modifica 04A;
- no materializa cambios físicos durante el marcador.

#### 83. Límites

Esta tarea documental no:

- crea una instancia física `SHELL-CI-022::<package_id>`;
- autoriza un cutover real;
- ejecuta una ventana;
- activa usuarios;
- activa sedes;
- activa áreas;
- activa roles;
- activa procesos;
- cambia tráfico;
- modifica producción;
- ejecuta migraciones;
- modifica Supabase;
- cambia datos;
- concede permisos;
- crea credenciales;
- ejecuta reintentos;
- ejecuta rollback;
- ejecuta compensación;
- registra incidentes reales;
- captura métricas reales;
- captura baseline;
- emite una decisión real de salida;
- retira procesos legacy;
- deshabilita rutas;
- elimina código;
- elimina tablas;
- elimina funciones;
- ejecuta hypercare;
- certifica estabilización;
- certifica cierre;
- transfiere a soporte;
- crea TREQ;
- modifica TREQ;
- modifica 04A;
- aprueba CI023;
- desarrolla CI023.

#### 84. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-021 — Ejecutar y resolver el checklist de readiness aprobado`

**TAREA ACTUAL APROBADA**
`SHELL-CI-022 — Ejecutar cutover y piloto conforme al plan aprobado`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-023 — Ejecutar hypercare, conciliación y estabilización`


### ✅ SHELL-CI-023 — Ejecutar hypercare, conciliación y estabilización

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-022 — Ejecutar cutover y piloto conforme al plan aprobado
**Tarea siguiente:** SHELL-CI-024 — Certificar cierre del paquete y transferencia a soporte
**Tipo de tarea:** Plantilla global con ejecución por paquete — contrato documental para ejecutar hypercare, monitoreo técnico y operativo, conciliación sostenida, gestión de incidentes y residuales, transferencia operativa a soporte, disposición de contingencias temporales y decisión de cierre de hypercare por cada paquete que complete válidamente CI022, sin certificar el cierre integral del paquete
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/04_DESPLIEGUE_PILOTO_Y_ESTABILIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; la ejecución futura ocurre únicamente mediante `SHELL-CI-023::<package_id>` con handoff válido de CI022, identidad vigente y autorización física separada
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cómo Vento OS acompaña intensivamente, observa, concilia y estabiliza cada paquete después del cutover y piloto, hasta producir evidencia suficiente para decidir si puede abandonar hypercare y pasar a certificación de cierre.

La regla vinculante queda:

```text
SHELL-CI-022::<package_id> RESUELTO
+ HANDOFF VÁLIDO HACIA HYPERCARE
+ MISMO PACKAGE_ID
+ MISMO CANDIDATO
+ MISMO AMBIENTE
+ MISMO ALCANCE
+ COBERTURA FUNCIONAL Y TÉCNICA
+ MONITOREO TÉCNICO
+ MONITOREO OPERATIVO
+ CONCILIACIÓN SOSTENIDA
+ INCIDENTES CON DISPOSICIÓN VÁLIDA
+ RESIDUALES Y DEUDA CON OWNER
+ SOPORTE Y DOCUMENTACIÓN PREPARADOS Y RECIBIDOS
+ CONTINGENCIAS CON DISPOSICIÓN VÁLIDA
+ CANDIDATA_A_SALIDA
+ DECISIÓN DE CIERRE DE HYPERCARE
= HYPERCARE RESUELTO
```

Y de forma fail-closed:

```text
HANDOFF DE OTRO PAQUETE
O CANDIDATO DISTINTO
O AMBIENTE DISTINTO
O ALCANCE DISTINTO
O EVIDENCIA STALE
O COBERTURA DE RESPONSABILIDAD AUSENTE
O MONITOREO NO SALUDABLE
O RESULTADO DESCONOCIDO SIN OWNER
O CONCILIACIÓN ABIERTA INCOMPATIBLE CON SALIDA
O INCIDENTE BLOQUEANTE ABIERTO
O SERVICE_RESTORED PRESENTADO COMO INCIDENT_RESOLVED
O RESIDUAL HUÉRFANO
O CONTINGENCIA INCOMPATIBLE CON OPERACIÓN ORDINARIA
O CIERRE POR SIMPLE PASO DEL TIEMPO
≠ APROBAR_CIERRE_HYPERCARE
```

`SHELL-CI-023` ejecuta hypercare y estabilización. No certifica el cierre integral del paquete; esa certificación pertenece a `SHELL-CI-024::<package_id>`.

#### 2. Resultado canónico

`SHELL-CI-023` establece una única plantilla reutilizable para que cada paquete aplicable:

1. obtenga una instancia física independiente `SHELL-CI-023::<package_id>`;
2. consuma el handoff exacto producido por CI022;
3. preserve paquete, candidato, ambiente y alcance;
4. ejecute los contratos `HYPERCARE-OPS-001..010` según modalidad y aplicabilidad;
5. inicie hypercare únicamente desde un handoff válido;
6. mantenga un estado temporal explícito;
7. preserve responsables funcionales, técnicos, suplencias y escalamiento;
8. observe estabilidad técnica con evidencia real;
9. observe estabilidad operativa y adopción con evidencia real;
10. concilie datos, documentos, estados y efectos;
11. clasifique y gestione incidentes mediante sus owners canónicos;
12. separe restauración de servicio, resolución de incidente y resolución de problema;
13. vincule toda deuda o trabajo posterior a un owner y destino;
14. ejecute el handoff operativo a soporte ordinario cuando sea elegible;
15. mantenga documentación, runbooks, known errors y workarounds vigentes;
16. evalúe y, cuando exista autorización material, desactive contingencias temporales elegibles;
17. preserve capacidades permanentes de recovery, auditoría, observabilidad y soporte;
18. suspenda, extienda o invalide hypercare cuando corresponda;
19. permita `CANDIDATA_A_SALIDA` únicamente con evidencia suficiente;
20. emita una decisión de cierre de hypercare sin convertirla en certificación de cierre del paquete.

#### 3. Frontera del ciclo CI020..024

| Etapa                        | Responsabilidad                                                                                                 |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `SHELL-CI-020::<package_id>` | Implementar y desplegar técnicamente                                                                            |
| `SHELL-CI-021::<package_id>` | Ejecutar readiness y decidir entrada                                                                            |
| `SHELL-CI-022::<package_id>` | Ejecutar cutover y piloto                                                                                       |
| `SHELL-CI-023::<package_id>` | Ejecutar hypercare, conciliación sostenida, estabilización, handoff operativo y decisión de cierre de hypercare |
| `SHELL-CI-024::<package_id>` | Certificar el cierre integral del paquete y la transferencia a soporte                                          |

CI023 responde:

```text
¿SE MANTIENE EL PAQUETE ESTABLE EN OPERACIÓN
Y PUEDE ABANDONAR EL ACOMPAÑAMIENTO INTENSIVO?
```

CI024 responderá posteriormente:

```text
¿EL EXPEDIENTE COMPLETO PERMITE CERTIFICAR
EL CIERRE DEL PAQUETE Y SU TRANSFERENCIA?
```

#### 4. Topología de trabajo

La topología de `SHELL-CI-023` es `TEMPLATE_PER_PACKAGE`.

```text
SHELL-CI-023
→ define una sola vez el contrato global

SHELL-CI-023::<package_id>
→ ejecuta hypercare para una identidad exacta
```

La ejecución de una instancia no reabre, modifica ni vuelve a aprobar el marcador global.

#### 5. Cadena física obligatoria

```text
E5-GATE-008::<package_id>
→ SHELL-CI-020::<package_id>
→ SHELL-CI-021::<package_id>
→ SHELL-CI-022::<package_id>
→ SHELL-CI-023::<package_id>
→ SHELL-CI-024::<package_id>
```

CI023 no se inicia directamente desde un deploy ni desde readiness.

#### 6. Condición de entrada desde CI022

Una instancia directa de CI023 solo puede iniciar cuando el handoff de CI022 permita demostrar, para la misma identidad:

```text
package_id
candidate_ref
environment
authorized_scope_ref
CI022 execution reference
pilot exit decision compatible
cutover history
pilot evidence
incident history
reconciliation history
support obligations
observation obligations
recovery obligations
legacy/contingency disposition
```

El inicio de hypercare no se deduce de la fecha del deploy ni del final calendario del piloto.

#### 7. Revalidación de identidad antes de iniciar

Antes de registrar el inicio real de hypercare se confirma:

```text
package_id = mismo
candidate = mismo
environment = mismo
authorized_scope = mismo
handoff = vigente
```

Si cambió materialmente el candidato, ambiente o alcance, la evidencia de CI022 se clasifica según su vigencia y se devuelve el control al carril propietario que deba restablecer una entrada válida.

#### 8. Modalidades heredadas

CI023 preserva la distribución aprobada por E5:

| Modalidad heredada            | Cantidad | Tratamiento                                                                                                  |
| ----------------------------- | -------: | ------------------------------------------------------------------------------------------------------------ |
| `PILOT-DIRECT-001`            |  **160** | ventana directa de `SHELL-CI-023::<package_id>` después de handoff válido                                    |
| `PILOT-SHARED-001`            |    **3** | `NO_APLICA_DIRECTA`; cobertura derivada de consumidores directos                                             |
| `PILOT-CONTROL-001`           |   **26** | `NO_APLICA_DIRECTA`; cobertura observacional de raíces gobernadas, salvo frontera ejecutable propia aprobada |
| AURA bloqueada                |   **14** | no inicia hypercare mientras persista el gate                                                                |
| dependencia externa bloqueada |    **2** | no inicia hypercare mientras persista el gate externo                                                        |
| TALENTO fuera de línea actual |    **2** | `FUERA_DE_LINEA`                                                                                             |
| **Total**                     |  **207** | **reconciliado**                                                                                             |

Reconciliación:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

CI023 no fabrica ejecuciones directas para raíces shared, control, bloqueadas o fuera de línea.

#### 9. Universo obligatorio HYPERCARE-OPS

CI023 ejecuta los contratos aprobados de hypercare según su aplicabilidad:

| Contrato            | Responsabilidad                                                                       |
| ------------------- | ------------------------------------------------------------------------------------- |
| `HYPERCARE-OPS-001` | Duración, frecuencia, suspensión, extensión y candidatura de salida                   |
| `HYPERCARE-OPS-002` | Responsables funcionales, técnicos, suplencia, cobertura y escalamiento               |
| `HYPERCARE-OPS-003` | Monitoreo de errores, colas, integraciones y rendimiento                              |
| `HYPERCARE-OPS-004` | Monitoreo de adopción, tiempos de usuario y desviaciones operativas                   |
| `HYPERCARE-OPS-005` | Conciliaciones de datos y efectos entre dominios                                      |
| `HYPERCARE-OPS-006` | Clasificación, prioridad y procedimiento de corrección de incidentes                  |
| `HYPERCARE-OPS-007` | Registro y aprobación de deuda y tareas posteriores                                   |
| `HYPERCARE-OPS-008` | Transferencia a soporte ordinario y documentación definitiva                          |
| `HYPERCARE-OPS-009` | Criterio y evidencia para retirar contingencias temporales                            |
| `HYPERCARE-OPS-010` | Autoridad y evidencia para aprobar cierre funcional, técnico y operativo de hypercare |

CI023 ejecuta estos contratos; no crea una semántica paralela.

#### 10. Modelo temporal

Hypercare no posee una duración universal.

Queda prohibido definir localmente reglas como:

```text
7 días
14 días
30 días
```

si la fuente aplicable no las exige.

La duración real depende de:

- modalidad heredada;
- requisitos temporales explícitos;
- periodos activos;
- suspensiones;
- extensiones;
- evidencia de estabilidad;
- obligaciones abiertas;
- observación posterior requerida;
- decisiones propietarias.

El tiempo es una condición posible, nunca sustituto de evidencia.

#### 11. Inicio de hypercare

Para una instancia directa:

```text
HANDOFF VÁLIDO DE CI022
+ ESTADO OPERATIVO OBSERVABLE
+ SIN RECOVERY ABIERTO QUE IMPIDA ESTABILIDAD
+ RESPONSABILIDAD CONTINUA
= HYPERCARE_START
```

El reloj no comienza en:

- el commit;
- el deploy;
- readiness;
- inicio del piloto;
- primera exposición;
- aprobación documental del marcador.

#### 12. Estados temporales de hypercare

CI023 conserva exactamente los estados temporales definidos por `HYPERCARE-OPS-001`:

```text
NO_INICIADA
ACTIVA
SUSPENDIDA
EXTENDIDA
CANDIDATA_A_SALIDA
INVALIDADA
NO_APLICA_DIRECTA
FUERA_DE_LINEA
```

Su semántica es independiente del estado físico de la instancia CI023.

#### 13. `ACTIVA`

`ACTIVA` significa que hypercare está reuniendo evidencia válida de estabilización.

Durante `ACTIVA` permanecen vigentes:

- monitoreo técnico;
- monitoreo operativo;
- conciliaciones;
- incident management;
- soporte intensivo;
- recovery cuando aplique;
- seguimiento de residuales;
- evaluación de contingencias.

No significa que la salida esté garantizada.

#### 14. `SUSPENDIDA`

`SUSPENDIDA` significa que existe una condición que impide usar el periodo como evidencia normal de estabilidad.

La suspensión:

- no borra evidencia anterior;
- no cuenta como evidencia positiva de estabilidad;
- conserva causa y owner;
- conserva estado estable conocido;
- exige una condición objetiva de reanudación.

Reanudar no produce `CANDIDATA_A_SALIDA` automáticamente.

#### 15. `EXTENDIDA`

`EXTENDIDA` significa que la ventana continúa porque una obligación aplicable sigue abierta o necesita observación adicional.

Extender hypercare:

```text
NO amplía scope
NO agrega usuarios
NO agrega sedes
NO cambia candidato
NO cambia permisos
NO cambia ambiente
```

La extensión prolonga observación y resolución dentro del alcance ya autorizado.

#### 16. `INVALIDADA`

Un cambio material puede invalidar la ventana o la evidencia de estabilización.

Ejemplos:

- nuevo candidato;
- cambio de versión;
- cambio material de configuración;
- cambio de ambiente;
- cambio de alcance;
- cambio de autoridad relevante;
- corrección que modifica comportamiento crítico;
- cambio de dependencia que altera la base observada.

La invalidación conserva la historia y devuelve cada obligación al carril propietario aplicable.

#### 17. `CANDIDATA_A_SALIDA`

`CANDIDATA_A_SALIDA` significa únicamente que se cumplieron las condiciones temporales y de dependencia de `HYPERCARE-OPS-001` para presentar la instancia a evaluación de cierre.

Invariante:

```text
CANDIDATA_A_SALIDA
≠ APROBAR_CIERRE_HYPERCARE
≠ CI023 VERIFIED
≠ PAQUETE CERRADO
```

#### 18. Responsabilidad funcional y técnica

CI023 preserva la separación de autoridades.

El responsable funcional gobierna el impacto y la aceptación empresarial que le correspondan.

El responsable técnico conserva ownership de:

- candidato;
- runtime;
- repositorios;
- unidades de implementación;
- dependencias técnicas;
- diagnóstico;
- trazabilidad síntoma → versión → configuración → cambio → resultado.

Una conformidad técnica no acepta impacto empresarial y una aprobación funcional no demuestra seguridad técnica.

#### 19. Ejecutor y decisor

Para cada acción o decisión relevante, la evidencia deberá permitir resolver:

```text
QUIÉN OBSERVÓ
QUIÉN TENÍA RESPONSABILIDAD FUNCIONAL
QUIÉN TENÍA RESPONSABILIDAD TÉCNICA
QUIÉN EJECUTÓ
QUIÉN DECIDIÓ
QUÉ AUTORIDAD RESPALDABA CADA PAPEL
```

Ejecutar una acción no concede autoridad para aprobarla.

#### 20. Cobertura, suplencia y escalamiento

La cobertura de hypercare deberá ser ejecutable, no nominal.

Debe conservar, según aplique:

- responsable funcional primario;
- responsables técnicos por repositorio o unidad;
- suplentes autorizados;
- ventanas o condiciones de disponibilidad;
- handoff entre responsables;
- ruta de escalamiento;
- autoridad de recovery/rollback;
- cobertura de soporte;
- cobertura de observabilidad.

“Alguien del equipo” no constituye suplencia válida.

#### 21. Monitoreo técnico

`HYPERCARE-OPS-003` produce evidencia técnica sobre la operación real.

Según aplicabilidad, deberá observar:

- demanda y operaciones;
- éxitos y fallos;
- clases y códigos estables de error;
- errores controlados y no controlados;
- resultados técnicos desconocidos;
- retries;
- fallbacks;
- recovery automático;
- colas;
- integraciones;
- componentes;
- dependencias;
- runtime;
- release;
- ambiente;
- rendimiento;
- rutas críticas.

La observación técnica no inventa severidad de incidente ni criterio de cierre.

#### 22. Monitoreo operativo

`HYPERCARE-OPS-004` produce evidencia sobre:

- adopción;
- tiempos humanos;
- uso real;
- desviaciones de proceso;
- fricción operativa;
- diferencias respecto de baseline o criterio vigente cuando exista;
- comportamiento de los actores dentro del alcance autorizado.

Una señal técnica sana no demuestra por sí sola estabilidad operativa.

#### 23. Prohibición de umbrales inventados

CI023 no crea:

- SLO;
- SLA;
- porcentaje de error;
- tiempo máximo;
- umbral de adopción;
- ventana de observación;
- límite de colas;

cuando la fuente propietaria no lo haya definido.

Si un criterio declarado obligatorio no puede resolverse sin inventar un threshold, la evaluación queda bloqueada y vuelve a su owner.

#### 24. Salud de la observabilidad

La ausencia de alertas solo tiene valor cuando puede demostrarse que la observabilidad está sana.

CI023 deberá distinguir:

```text
SIN INCIDENTES OBSERVADOS
≠ SIN TELEMETRÍA
≠ PRODUCTOR DE SEÑAL CAÍDO
≠ SIN DEMANDA REPRESENTATIVA
```

Una señal ausente por fallo del monitoreo no cuenta como estabilidad.

#### 25. Evidencia vigente

Toda evidencia usada durante hypercare debe corresponder a la misma identidad:

```text
package_id
candidate
environment
authorized_scope
execution
```

La evidencia prestada de otra instancia, otro ambiente o un candidato anterior permanece histórica pero no autoriza conclusiones sobre la instancia actual.

#### 26. Conciliación sostenida

`HYPERCARE-OPS-005` mantiene conciliación de datos y efectos durante la estabilización.

La reconciliación deberá preservar:

- hecho u operación;
- identidad/correlación;
- fuente autoritativa;
- contraparte;
- regla de comparación;
- resultado;
- evidencia;
- owner de cualquier diferencia.

CI023 no selecciona autoridad por “lo más reciente”.

#### 27. Diferencias y resultados desconocidos

Una diferencia material o resultado desconocido que sea incompatible con salida deberá:

1. conservar evidencia;
2. identificar owner;
3. registrar impacto;
4. activar la ruta de corrección o recuperación aplicable;
5. mantener la instancia fuera de candidatura de salida hasta su disposición válida.

No se reclasifica una diferencia inesperada como “esperada” después de observarla para facilitar el cierre.

#### 28. Incidentes

`HYPERCARE-OPS-006` conserva la clasificación, prioridad y procedimiento de corrección definidos por el modelo de soporte vigente.

CI023 no crea una mesa de incidentes paralela.

Todo incidente deberá conservar:

- síntoma;
- evidencia;
- alcance;
- clasificación;
- prioridad cuando aplique;
- owner;
- acciones;
- cambios;
- validación;
- relación con problema o known error;
- relación con conciliación;
- disposición final.

#### 29. Restauración no equivale a resolución

La siguiente distinción es obligatoria:

```text
SERVICE_RESTORED
!= INCIDENT_RESOLVED
!= PROBLEM_RESOLVED
```

Un fallback, workaround, rollback o reinicio puede restaurar servicio sin eliminar la causa.

CI023 no presenta restauración temporal como resolución causal.

#### 30. Known errors y workarounds

Puede existir un known error después de resolver un incidente únicamente cuando su tratamiento posterior sea permitido por su fuente.

Su expediente conserva:

- versión;
- restricciones;
- owner;
- workaround;
- impacto;
- escalamiento;
- destino;
- evidencia futura exigida.

Un workaround no se convierte en comportamiento objetivo permanente por uso repetido.

#### 31. Correcciones durante hypercare

Una corrección solo se ejecuta mediante el owner, procedimiento y autoridad que correspondan.

CI023 no absorbe automáticamente ownership de:

- código;
- migraciones;
- configuración;
- datos;
- infraestructura;
- integraciones.

El hallazgo se resuelve por su carril propietario y CI023 consume la evidencia resultante.

#### 32. Corrección que cambia el candidato

Si una corrección produce un candidato material nuevo:

```text
CANDIDATO A
→ CORRECCIÓN
→ CANDIDATO B
```

CI023 deberá evaluar qué partes de:

```text
CI020
CI021
CI022
hypercare ya observado
```

quedaron invalidadas.

No se hereda estabilidad de A a B por defecto.

#### 33. Corrección sin cambio material del candidato

Una corrección operacional o documental que no altere materialmente candidato, ambiente ni alcance puede permitir continuar la misma instancia cuando:

- la fuente propietaria así lo permita;
- la evidencia no afectada siga vigente;
- la condición de suspensión quede resuelta;
- la observación adicional requerida se complete.

La continuidad debe quedar demostrada, no presumida.

#### 34. Residuales y deuda

`HYPERCARE-OPS-007` impide que los pendientes se conviertan en narrativa sin owner.

Toda obligación residual debe tener una disposición gobernada.

Disposiciones admitidas por el contrato:

```text
NO_DIFERIBLE
VINCULAR_BACKLOG_EXISTENTE
DEUDA_APROBABLE
TRABAJO_POSTERIOR_APROBABLE
BLOQUEADO_POR_AUTORIDAD
BLOQUEADO_POR_DESTINO
BLOQUEADO_POR_EVIDENCIA
```

CI023 no crea deuda solo para poder cerrar hypercare.

#### 35. `NO_DIFERIBLE`

`NO_DIFERIBLE` significa que la fuente exige resolución antes de la puerta aplicable.

Por tanto:

```text
NO_DIFERIBLE
→ MANTIENE BLOQUEO
→ NO CREA DEUDA
→ NO HABILITA CIERRE
```

Una tarea futura no elimina ese bloqueo si la fuente exige resolverlo antes de salida.

#### 36. Backlog y trabajo posterior

Cuando una obligación sea legítimamente diferible:

- conserva owner;
- conserva destino canónico;
- reutiliza backlog existente cuando exista;
- conserva riesgo y control temporal;
- conserva condición de salida;
- conserva evidencia futura;
- evita duplicar una obligación ya registrada.

No puede quedar un residual huérfano.

#### 37. Transferencia operativa a soporte

`HYPERCARE-OPS-008` define y CI023 ejecuta, cuando corresponda, el cambio desde acompañamiento intensivo a soporte ordinario.

La transferencia:

```text
CAMBIA MODO DE ACOMPAÑAMIENTO
≠ CAMBIA OWNER DE LA FUENTE DE VERDAD
≠ CIERRA INCIDENTES POR SÍ SOLA
≠ ACEPTA DEUDA POR SÍ SOLA
≠ CERTIFICA EL PAQUETE
```

#### 38. Criterio de handoff a soporte

El handoff deberá demostrar, según aplicabilidad:

- destino de soporte vigente;
- cobertura;
- escalamiento;
- documentación;
- runbooks;
- conocimiento;
- observabilidad;
- recovery;
- known errors;
- workarounds;
- incidentes y problemas que continúen;
- deuda y trabajo posterior;
- contingencias que continúen;
- restricciones y riesgos.

Un contacto asignado no equivale a handoff ejecutado.

#### 39. Documentación definitiva

“Definitiva” significa documentación operativa vigente para la instancia real, no un documento inmutable.

Debe reflejar:

- camino normal actual;
- configuración vigente;
- soporte;
- escalamiento;
- recovery;
- known errors;
- workarounds;
- contingencias restantes;
- restricciones;
- procedimientos.

La documentación planificada en E5 no se presenta como publicada o recibida sin evidencia.

#### 40. Capacitación y conocimiento

CI023 no considera conocimiento transferido solo porque exista material.

Cuando el contrato exija capacitación, recepción o handoff de conocimiento, debe existir evidencia real de ejecución.

#### 41. Soporte no absorbe obligaciones bloqueantes

Transferir una obligación a soporte ordinario no convierte en diferible aquello que su fuente exige resolver antes de salida.

Por tanto:

```text
SOPORTE RECIBE
≠ OBLIGACIÓN BLOQUEANTE RESUELTA
```

#### 42. Inventario de contingencias temporales

Antes de decidir cualquier retiro, CI023 reconstruye el conjunto esperado desde las fuentes vigentes de la misma instancia.

No se omite una contingencia porque:

- no se usó recientemente;
- parece innecesaria;
- no produjo alertas;
- existe otra contingencia similar.

Y no se agrega una por analogía con otro paquete.

#### 43. Decisiones de contingencia

Cada contingencia evaluada utiliza exactamente:

```text
RETIRO_ELEGIBLE
RETIRO_BLOQUEADO
NO_APLICA
INVALIDADA
```

Una contingencia compartida conserva una única fuente material y dependencias explícitas por paquete.

#### 44. Elegibilidad no equivale a retiro

Invariante:

```text
RETIRO_ELEGIBLE
≠ DESACTIVADA_MATERIALMENTE
≠ REMOVIDA_FISICAMENTE
≠ CIERRE_DE_HYPERCARE
```

`RETIRO_ELEGIBLE` habilita únicamente la acción material que la fuente propietaria autorice.

#### 45. Desactivación material durante CI023

Cuando una contingencia temporal tenga:

- identidad exacta;
- `RETIRO_ELEGIBLE`;
- autoridad vigente;
- acción de desactivación dentro del alcance físico autorizado de la instancia;

CI023 puede ejecutar esa desactivación.

La acción deberá:

1. preservar historia;
2. preservar evidencia;
3. preservar datos sujetos a retención;
4. preservar controles permanentes;
5. conciliar efectos;
6. observar el camino normal según la condición vigente;
7. registrar el resultado real.

#### 46. Eliminación física permanece separada

Desactivar una contingencia no autoriza por sí sola a eliminar:

- código;
- tablas;
- funciones;
- infraestructura;
- rutas;
- datos;
- configuraciones persistentes;
- credenciales;
- superficies legacy.

La eliminación física requiere el owner y autorización que gobiernen ese cambio.

#### 47. Controles permanentes

Cerrar una contingencia temporal no elimina capacidades permanentes exigidas, entre ellas cuando apliquen:

- backup;
- restore;
- rollback;
- recovery;
- kill switch;
- observabilidad;
- auditoría;
- soporte;
- retención.

CI023 distingue la activación temporal del mecanismo permanente que debe conservarse.

#### 48. Observación posterior a una desactivación

Una contingencia desactivada puede requerir observación posterior.

CI023 usa únicamente la ventana o condición definida por la fuente propietaria.

No inventa un periodo universal de “cero uso” o estabilidad posterior.

#### 49. Relación con superficies legacy

La disposición de legacy recibida desde CI022/CUTOVER sigue siendo una entrada, no una orden de borrado.

CI023 podrá usarla para determinar si una contingencia basada en la superficie anterior puede dejar de operar.

No convierte:

```text
RETIRO_ELEGIBLE
```

en:

```text
FISICAMENTE_REMOVIDO
```

sin el carril material propietario.

#### 50. Suspensión por regresión

Si después de una desactivación o durante observación aparece una regresión:

- se preserva evidencia;
- se aplica la autoridad de incident/recovery vigente;
- se suspende o extiende hypercare según corresponda;
- se evita inventar una reversión local;
- se reevalúa la contingencia y la candidatura de salida.

#### 51. Candidatura de salida

Una instancia directa solo puede recibir `CANDIDATA_A_SALIDA` cuando:

1. `hypercare_start_at` es válido;
2. los requisitos temporales aplicables se cumplieron;
3. no existe suspensión activa;
4. no existe invalidación;
5. la evidencia técnica exigible está disponible;
6. la evidencia operativa exigible está disponible;
7. las conciliaciones incompatibles con salida están resueltas;
8. los incidentes tienen disposición compatible;
9. los residuales tienen disposición gobernada;
10. soporte y documentación se encuentran en el estado exigido;
11. las contingencias tienen disposición compatible;
12. ninguna obligación aplicable exige prolongar acompañamiento intensivo.

La candidatura no puede fabricarse por fecha.

#### 52. Autoridad de cierre de hypercare

`HYPERCARE-OPS-010` resuelve la autoridad final de cierre desde las fuentes ya aprobadas.

No crea un rol universal de “aprobador de hypercare”.

Cuando exista separación funcional y técnica, ambas dimensiones conservan su evidencia y autoridad.

Un ejecutor no adquiere autoridad final por haber operado CI023.

#### 53. Expediente de cierre de hypercare

El expediente deberá permitir reconstruir, como mínimo:

```text
package_id
candidate
environment
authorized_scope
CI023 execution reference
hypercare temporal history
responsibility coverage
technical stability evidence
operational stability evidence
reconciliation evidence
incident/problem dispositions
residual/debt dispositions
support handoff
documentation state
contingency dispositions
recovery/legacy obligations
test/evidence references
freshness cut
decision authority
decision reasons
decision evidence
```

Una captura, correo, ticket cerrado o ausencia aparente de alertas no constituye por sí sola un expediente suficiente.

#### 54. Decisiones de cierre de hypercare

La evaluación final utiliza exclusivamente:

```text
APROBAR_CIERRE_HYPERCARE
BLOQUEAR_CIERRE_HYPERCARE
```

No existe:

```text
APROBAR_PARCIALMENTE
APROBAR_CON_PENDIENTES_BLOQUEANTES
```

Una dimensión favorable no compensa un bloqueo obligatorio en otra.

#### 55. Condiciones acumulativas para aprobar cierre

`APROBAR_CIERRE_HYPERCARE` exige simultáneamente, según aplicabilidad:

1. identidad completa y correlacionable;
2. `CANDIDATA_A_SALIDA` vigente;
3. autoridad final vigente;
4. conformidad técnica exigible;
5. evidencia técnica satisfecha;
6. evidencia operativa satisfecha;
7. conciliaciones exigibles para salida cerradas;
8. incidentes con disposición compatible;
9. deuda y trabajo posterior gobernados, sin residual huérfano;
10. handoff a soporte ejecutado cuando aplique;
11. documentación operativa vigente;
12. contingencias con disposición compatible;
13. ninguna obligación de recovery, rollback, compensation o reconciliation exige acompañamiento intensivo;
14. legacy retenido con tratamiento compatible;
15. requisitos y evidencia aplicables en estado compatible con salida;
16. evidencia vigente, reproducible, completa y coherente;
17. ningún cambio material posterior invalidó la evaluación;
18. soporte conoce las obligaciones que continúan;
19. la decisión conserva autoridad, fecha, alcance, razones y referencias exactas.

#### 56. `BLOQUEAR_CIERRE_HYPERCARE`

La decisión queda bloqueada ante cualquier condición incompatible con salida.

Todo bloqueo debe registrar:

```text
source
owner
condition
evidence
impact
exit_condition
```

CI023 no crea pendientes narrativos sin dueño.

#### 57. Incidentes o deuda que pueden continuar después de hypercare

El cierre de hypercare no exige falsificar que absolutamente todo expediente relacionado esté materialmente terminado.

Puede existir trabajo posterior solo si:

- su fuente permite diferimiento;
- 007 le asignó disposición válida;
- tiene owner;
- tiene destino;
- tiene control temporal suficiente;
- el riesgo es compatible con salida;
- soporte lo recibió cuando afecte operación ordinaria;
- la evidencia futura exigida está definida.

Si una fuente exige resolución antes de salida, sigue bloqueando.

#### 58. Handoff positivo a CI024

Cuando exista una decisión real:

```text
APROBAR_CIERRE_HYPERCARE
```

CI023 entrega a CI024 un expediente que permita certificar sin inferencia:

- identidad exacta del paquete;
- identidad de la ejecución;
- decisión de cierre de hypercare;
- autoridad que decidió;
- evidencia funcional;
- evidencia técnica;
- evidencia operativa;
- transferencia a soporte;
- documentación vigente;
- incidentes, problemas, deuda y trabajo posterior que continúen;
- contingencias y mecanismos permanentes que continúen;
- pruebas y evidencias aplicables;
- restricciones, riesgos y obligaciones posteriores.

#### 59. CI023 VERIFIED y cierre de hypercare

Para una instancia directa normal:

```text
APROBAR_CIERRE_HYPERCARE
+ EXPEDIENTE COMPLETO
+ EVIDENCIA VIGENTE
= CI023 ELEGIBLE PARA VERIFIED
```

En cambio:

```text
BLOQUEAR_CIERRE_HYPERCARE
→ CI023 NO QUEDA VERIFIED
→ conserva ownership
→ resuelve la condición
→ vuelve a evaluar
```

CI023 no trata un cierre bloqueado como ejecución terminada satisfactoriamente.

#### 60. CI023 VERIFIED no cierra el paquete

Invariante:

```text
CI023 VERIFIED
≠ PACKAGE_CLOSED
≠ CERTIFICACIÓN DE CIERRE
```

CI023 termina cuando hypercare fue aprobado para cierre y el expediente está listo.

CI024 realiza la certificación posterior del paquete y de la transferencia a soporte.

#### 61. Transferencia ejecutada y certificación

La cadena correcta es:

```text
CI023
→ ejecuta el handoff operativo de HYPERCARE-OPS-008
→ resuelve contingencias de HYPERCARE-OPS-009
→ obtiene decisión de HYPERCARE-OPS-010
→ entrega expediente

CI024
→ certifica que el cierre del paquete y la transferencia cumplen el contrato
```

CI024 no sustituye el handoff real que CI023 debía ejecutar.

#### 62. Autorización física futura

La futura ejecución de `SHELL-CI-023::<package_id>` requiere autorización física explícita por instancia.

La existencia de un handoff válido desde CI022 no autoriza por sí sola a ChatGPT ni a un agente a:

- cambiar sistemas;
- corregir código;
- desactivar contingencias;
- modificar datos;
- ejecutar recovery;
- modificar Supabase;
- cerrar incidentes;
- aceptar deuda.

La autoridad de cada acción permanece en su fuente propietaria.

#### 63. Carril físico y watcher

Durante una futura instancia física:

1. el marcador global permanece cerrado;
2. la instancia usa su archivo histórico propio;
3. el watcher se detiene antes del carril físico conforme a la política vigente;
4. el watcher permanece apagado durante `IN_PROGRESS`, implementación/acción operativa, validación y cierre físico;
5. la instancia consolida evidencia sin modificar registros VERIFIED anteriores;
6. después de `VERIFIED` se ejecuta una sola sincronización documental;
7. el watcher solo vuelve a activarse después del cierre limpio y sincronizado;
8. su arranque es read-only.

La duración potencial de hypercare no convierte el watcher en autoridad operativa.

#### 64. Batería física final de una futura instancia

La evidencia continua de hypercare no se sustituye por una batería final.

Cuando la instancia tenga `validation_commands`, su batería final ejecuta exclusivamente esos comandos, en el orden autorizado.

La batería:

- no inventa evidencia operativa;
- no reemplaza monitoreo;
- no reemplaza conciliación;
- no reemplaza decisiones de owners;
- no reemplaza el handoff a soporte;
- no reemplaza `APROBAR_CIERRE_HYPERCARE`.

Un PASS técnico no puede convertir un hypercare bloqueado en cerrado.

#### 65. Evidencia consolidada de CI023

La evidencia de la instancia deberá permitir resolver, según aplicabilidad:

```text
package_id
candidate
environment
authorized_scope
CI022 handoff
hypercare_start_at
temporal states and intervals
responsibility coverage
technical observations
operational observations
reconciliation results
incident/problem records
corrections and candidate changes
residual/debt decisions
support handoff
documentation version
contingency inventory
contingency decisions
material deactivations when authorized
post-deactivation observations
recovery/rollback/compensation references
legacy disposition
CANDIDATA_A_SALIDA
hypercare closure authority
hypercare closure decision
closure evidence bundle
completed_at
```

No se duplica payload sensible cuando una referencia recuperable es suficiente.

#### 66. Seguridad y secretos

CI023 no expone como evidencia:

- passwords;
- tokens;
- cookies;
- claves privadas;
- service-role keys;
- `.env`;
- credenciales productivas;
- secretos de proveedores;
- PII innecesaria;
- payloads sensibles sin necesidad.

La evidencia debe probar configuración, evento o resultado sin revelar secretos.

#### 67. Concurrencia entre paquetes

Hypercare se ejecuta por paquete.

Dos paquetes pueden encontrarse simultáneamente en CI023 cuando sus dependencias lo permitan.

La evidencia de uno no se presenta como evidencia del otro salvo que exista un artefacto compartido canónico, vigente y explícitamente aplicable.

Un paquete shared/control conserva su modalidad heredada y no adquiere una ejecución directa ficticia.

#### 68. Casos positivos mínimos de futura ejecución

CI023 deberá poder demostrar, según aplicabilidad:

1. inicio desde handoff válido de CI022;
2. misma identidad de paquete/candidato/ambiente/alcance;
3. cobertura funcional y técnica vigente;
4. monitoreo técnico saludable;
5. monitoreo operativo saludable;
6. conciliación sostenida;
7. incidente correctamente clasificado y resuelto;
8. distinción entre restauración y resolución;
9. known error gobernado;
10. residual vinculado a backlog existente;
11. deuda legítimamente aprobable mediante su autoridad;
12. trabajo posterior con owner y destino;
13. handoff ejecutado a soporte;
14. documentación vigente;
15. contingencia `RETIRO_BLOQUEADO` conservada;
16. contingencia `RETIRO_ELEGIBLE` desactivada solo con autorización;
17. control permanente preservado;
18. observación posterior satisfactoria;
19. suspensión y reanudación trazables;
20. extensión justificada;
21. `CANDIDATA_A_SALIDA` fundada;
22. `APROBAR_CIERRE_HYPERCARE` fundada;
23. handoff completo a CI024.

#### 69. Casos negativos mínimos de futura ejecución

CI023 deberá impedir, como mínimo:

1. iniciar desde otro `package_id`;
2. iniciar con handoff stale;
3. iniciar con candidato distinto;
4. mezclar ambientes;
5. ampliar alcance por inferencia;
6. contar suspensión como estabilidad;
7. cerrar por simple paso del tiempo;
8. inventar duración universal;
9. inventar threshold técnico u operativo;
10. usar ausencia de telemetría como estabilidad;
11. usar evidencia de otro candidato;
12. dejar una diferencia material sin owner;
13. tratar `SERVICE_RESTORED` como `INCIDENT_RESOLVED`;
14. cerrar problema por cerrar incidente;
15. crear deuda para ocultar un bloqueo no diferible;
16. crear residual sin owner;
17. transferir a soporte para evitar una obligación técnica;
18. retirar contingencia por falta de uso aparente;
19. eliminar un control permanente al retirar contingencia;
20. eliminar físicamente legacy sin carril propietario;
21. presentar `RETIRO_ELEGIBLE` como retiro ejecutado;
22. presentar `CANDIDATA_A_SALIDA` como cierre;
23. aprobar cierre con evidencia contradictoria;
24. aprobar cierre con conciliación bloqueante abierta;
25. aprobar cierre con incidente incompatible abierto;
26. aprobar cierre con handoff de soporte obligatorio no ejecutado;
27. convertir `BLOQUEAR_CIERRE_HYPERCARE` en VERIFIED;
28. certificar el paquete dentro de CI023.

#### 70. Regresiones que CI023 debe impedir

CI023 no podrá introducir:

1. un reloj universal de hypercare;
2. un sistema paralelo de incidentes;
3. un sistema paralelo de deuda;
4. un soporte paralelo;
5. una autoridad global inventada;
6. un promedio que sustituya evidencia por componente;
7. un estado “casi estable” con efecto de cierre;
8. evidencia stale;
9. supresión de historia;
10. cierre de incidentes por restauración;
11. cierre de problemas por workaround;
12. residuales huérfanos;
13. contingencias retiradas por percepción;
14. pérdida de controles permanentes;
15. eliminación legacy prematura;
16. mutación Supabase fuera de `vento-shell`;
17. cierre de paquete anticipado;
18. certificación de CI024 anticipada.

#### 71. Flujo operativo canónico de una futura instancia

```text
HANDOFF VÁLIDO DE CI022
→ crear/actualizar SHELL-CI-023::<package_id>
→ autorización física explícita
→ fijar package + candidate + environment + scope
→ confirmar cobertura funcional/técnica
→ ACTIVA
→ monitoreo técnico 003
→ monitoreo operativo 004
→ conciliación sostenida 005
→ incidentes/correcciones 006
→ residuales/deuda 007
→ transferencia operativa a soporte 008
→ evaluación y acciones autorizadas de contingencia 009
→ SUSPENDIDA / EXTENDIDA / INVALIDADA cuando corresponda
→ CANDIDATA_A_SALIDA solo con evidencia suficiente
→ evaluación de cierre 010
→ BLOQUEAR_CIERRE_HYPERCARE: resolver y continuar
→ APROBAR_CIERRE_HYPERCARE: consolidar expediente
→ batería física final cuando exista, solo validation_commands
→ VERIFIED
→ cierre documental único
→ handoff a SHELL-CI-024::<package_id>
```

#### 72. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Fragmentos 04A afectados:** 0

**Justificación:** CI023 define la ejecución de contratos de hypercare, estabilización, conciliación, soporte, incidentes, residuales y contingencias ya diseñados en E5 y protegidos por requisitos vigentes del paquete y sus fuentes propietarias. El marcador global no introduce un nuevo comportamiento funcional independiente, una nueva regla empresarial, un algoritmo, una transición de datos ni una autorización nueva.

#### 73. Cobertura de prueba vigente reutilizada

Cada futura instancia consume la cobertura vigente ya asociada a:

- su `DELIV-PKG`;
- readiness;
- cutover y piloto;
- monitoreo técnico;
- monitoreo operativo;
- conciliación;
- continuidad;
- recovery y rollback;
- incident management;
- soporte;
- documentación;
- contingencias;
- requisitos específicos del paquete.

Estas referencias son trazabilidad heredada. No actualizan el registro de requisitos.

#### 74. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                   |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador global no ejecuta hypercare, build, correcciones, desactivaciones ni cambios físicos.                                                                                                                                                                                                           |
| LOCAL     | NOT_EXECUTED   | La validación local del artefacto y de su archivo propietario corresponde al checkout actualizado antes de aprobar canónicamente la tarea.                                                                                                                                                                  |
| REMOTA    | PASS           | Se verificaron el owner del ciclo CI020..024, el archivo canónico E5 de hypercare mediante lectura por blob, los contratos `HYPERCARE-OPS-001..010`, las modalidades heredadas, la separación entre candidatura, cierre de hypercare y certificación de CI024, y el tratamiento de soporte y contingencias. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutó monitoreo, conciliación, incidente, corrección, handoff de soporte, contingencia ni decisión real de cierre.                                                                                                                                                                                  |
| FÍSICA    | NOT_APPLICABLE | Este marcador solo define la plantilla global; la evidencia física pertenecerá a cada `SHELL-CI-023::<package_id>`.                                                                                                                                                                                         |

#### 75. Estado documental conciliado

| Métrica                                                 |                Resultado |
| ------------------------------------------------------- | -----------------------: |
| Topología CI023                                         | **TEMPLATE_PER_PACKAGE** |
| Marcadores globales materializados físicamente          |                    **0** |
| Instancias CI023 creadas por este marcador              |                    **0** |
| Contratos HYPERCARE-OPS consumidos                      |                   **10** |
| Raíces heredadas reconciliadas                          |                  **207** |
| Directas                                                |                  **160** |
| Shared                                                  |                    **3** |
| Control                                                 |                   **26** |
| AURA bloqueadas                                         |                   **14** |
| Dependencia externa bloqueada                           |                    **2** |
| TALENTO fuera de línea                                  |                    **2** |
| Duración universal nueva                                |                    **0** |
| Estados temporales definidos                            |                    **8** |
| Decisiones de cierre de hypercare                       |                    **2** |
| Aprobación parcial de cierre                            |            **PROHIBIDA** |
| `CANDIDATA_A_SALIDA` equivale a cierre                  |                   **NO** |
| `APROBAR_CIERRE_HYPERCARE` equivale a cierre de paquete |                   **NO** |
| Handoff operativo a soporte pertenece a CI023           |   **SÍ, cuando aplique** |
| Certificación del cierre pertenece a CI024              |                   **SÍ** |
| Cambios físicos durante marcador                        |                    **0** |
| Cambios Supabase durante marcador                       |                    **0** |
| Requisitos creados o modificados                        |                    **0** |

#### 76. Criterios de aceptación

`SHELL-CI-023` queda documentalmente completa cuando:

- define CI023 como plantilla global con ejecución por paquete;
- conserva `package_id`, candidato, ambiente y alcance;
- exige handoff válido de CI022;
- preserva las modalidades heredadas 160 + 3 + 26 + 14 + 2 + 2;
- consume `HYPERCARE-OPS-001..010`;
- define inicio real de hypercare;
- prohíbe duración universal;
- conserva los ocho estados temporales;
- distingue suspensión, extensión e invalidación;
- impide usar tiempo como sustituto de estabilidad;
- conserva owners funcionales y técnicos;
- conserva suplencia, cobertura, segregación y escalamiento;
- define monitoreo técnico y operativo sin inventar thresholds;
- exige observabilidad saludable;
- define evidencia vigente por misma identidad;
- exige conciliación sostenida;
- conserva incident management propietario;
- diferencia restauración, incidente y problema;
- devuelve correcciones a sus owners;
- gobierna candidato nuevo y evidencia stale;
- define residuales y deuda sin pendientes huérfanos;
- conserva `NO_DIFERIBLE` como bloqueo;
- ejecuta handoff operativo a soporte cuando aplique;
- exige documentación y conocimiento vigentes;
- impide usar soporte para ocultar bloqueos;
- reconstruye inventario de contingencias;
- conserva las cuatro decisiones de contingencia;
- distingue elegibilidad, desactivación y eliminación física;
- preserva controles permanentes;
- define observación posterior sin inventar ventanas;
- define `CANDIDATA_A_SALIDA`;
- define autoridad de cierre;
- define las dos decisiones de cierre;
- prohíbe aprobación parcial;
- exige cierre acumulativo de evidencia funcional, técnica y operativa;
- permite trabajo posterior solo cuando su fuente lo permite;
- entrega expediente completo a CI024;
- exige `APROBAR_CIERRE_HYPERCARE` para CI023 VERIFIED en ejecución directa normal;
- impide confundir CI023 VERIFIED con paquete cerrado;
- no certifica el cierre del paquete;
- no crea ni modifica requisitos;
- no modifica 04A;
- no materializa cambios físicos durante el marcador.

#### 77. Límites

Esta tarea documental no:

- crea una instancia `SHELL-CI-023::<package_id>`;
- inicia un hypercare real;
- consulta producción;
- observa métricas reales;
- registra incidentes reales;
- corrige incidentes;
- cambia código;
- despliega código;
- crea releases;
- aplica migraciones;
- modifica Supabase;
- modifica datos;
- ejecuta rollback;
- ejecuta recovery;
- ejecuta compensation;
- concilia efectos reales;
- acepta deuda real;
- crea backlog;
- transfiere un paquete real a soporte;
- capacita soporte;
- publica documentación operativa;
- desactiva contingencias;
- retira superficies legacy;
- elimina código;
- elimina tablas;
- elimina funciones;
- elimina datos;
- elimina controles permanentes;
- emite `CANDIDATA_A_SALIDA` real;
- emite `APROBAR_CIERRE_HYPERCARE` real;
- emite `BLOQUEAR_CIERRE_HYPERCARE` real;
- certifica cierre de paquete;
- certifica transferencia a soporte;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica 04A;
- aprueba CI024;
- desarrolla CI024.

#### 78. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-022 — Ejecutar cutover y piloto conforme al plan aprobado`

**TAREA ACTUAL APROBADA**
`SHELL-CI-023 — Ejecutar hypercare, conciliación y estabilización`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-024 — Certificar cierre del paquete y transferencia a soporte`


### ✅ SHELL-CI-024 — Certificar cierre del paquete y transferencia a soporte

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-023 — Ejecutar hypercare, conciliación y estabilización
**Tarea siguiente:** AUTH-SRV-001 — Inventariar Server Actions de todos los repositorios
**Tipo de tarea:** Plantilla global con ejecución por paquete — contrato documental para certificar el cierre integral de cada paquete después de hypercare, verificar la transferencia operativa ya ejecutada hacia soporte, consolidar evidencia técnica, funcional, operativa y de repositorio, preservar obligaciones posteriores gobernadas y producir un cierre auditable sin ejecutar cambios físicos ni sustituir los owners de incidentes, deuda, recovery, legacy o soporte; incluye la política de cierre del BLOQUE T y continuidad Git multiestación consumiendo el Required Gate definido por SHELL-CI-018
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/04_DESPLIEGUE_PILOTO_Y_ESTABILIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; la futura certificación se ejecuta únicamente mediante `SHELL-CI-024::<package_id>` sobre evidencia real y no autoriza despliegues, mutaciones de datos, cambios de configuración, eliminación de legacy, cierre de incidentes ni aceptación de deuda por inferencia
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada cuándo una instancia de paquete puede considerarse integralmente certificada después de completar implementación, readiness, cutover, piloto e hypercare, y cómo Vento OS conserva una transferencia a soporte verificable, una línea de evidencia reproducible y una continuidad de repositorio independiente del computador desde el cual se trabaje.

La regla vinculante queda:

```text
E5-GATE-008::<package_id>
+ SHELL-CI-020::<package_id> COMPLETADO
+ SHELL-CI-021::<package_id> RESUELTO
+ SHELL-CI-022::<package_id> RESUELTO
+ SHELL-CI-023::<package_id> VERIFIED
+ APROBAR_CIERRE_HYPERCARE
+ MISMA IDENTIDAD DE PAQUETE / CANDIDATO / AMBIENTE / ALCANCE
+ TRAZABILIDAD DE REVISIONES Y DESPLIEGUES
+ EVIDENCIA FUNCIONAL, TÉCNICA Y OPERATIVA VIGENTE
+ CONCILIACIONES COMPATIBLES CON CIERRE
+ INCIDENTES Y PROBLEMAS CON DISPOSICIÓN VÁLIDA
+ RESIDUALES Y DEUDA GOBERNADOS
+ HANDOFF DE SOPORTE EJECUTADO Y RECIBIDO
+ DOCUMENTACIÓN OPERATIVA VIGENTE
+ CONTINGENCIAS CON DISPOSICIÓN VÁLIDA
+ RECOVERY Y CONTROLES PERMANENTES PRESERVADOS
+ LEGACY CON DISPOSICIÓN VÁLIDA
+ PRUEBAS Y EVIDENCIAS EXIGIBLES SATISFECHAS
+ SIN CAMBIO MATERIAL POSTERIOR QUE INVALIDE EL EXPEDIENTE
= CIERRE CERTIFICABLE DEL PAQUETE
```

La certificación es fail-closed. La ausencia de evidencia suficiente impide certificar.

#### 2. Resultado canónico

`SHELL-CI-024` establece una plantilla reutilizable para que cada paquete aplicable:

1. obtenga una instancia independiente `SHELL-CI-024::<package_id>`;
2. consuma exclusivamente un handoff positivo y vigente de CI023;
3. revalide identidad y procedencia;
4. reconstruya el expediente completo del ciclo CI020..023;
5. verifique evidencia de implementación y revisión desplegada;
6. verifique readiness, cutover, piloto e hypercare;
7. certifique que la transferencia a soporte ya ejecutada es efectiva y reproducible;
8. verifique documentación, runbooks, conocimiento, observabilidad y escalamiento;
9. verifique incidentes, problemas, known errors, workarounds, deuda y trabajo posterior;
10. verifique conciliaciones y efectos;
11. verifique contingencias temporales y controles permanentes;
12. verifique recovery, rollback, compensation y legacy retenido;
13. verifique la cobertura de prueba exigible;
14. preserve evidencia histórica e inmutable;
15. bloquee el cierre ante contradicción, staleness o pendiente incompatible;
16. produzca una conclusión final de certificación;
17. deje el paquete bajo soporte ordinario sin borrar obligaciones posteriores;
18. no confunda cierre de paquete con cierre del producto, bloque, aplicación, dominio o Vento OS completo.

#### 3. Frontera del ciclo CI020..024

| Etapa                        | Responsabilidad                                                                                     |
| ---------------------------- | --------------------------------------------------------------------------------------------------- |
| `SHELL-CI-020::<package_id>` | Implementar y desplegar técnicamente el paquete autorizado                                          |
| `SHELL-CI-021::<package_id>` | Ejecutar readiness y decidir la entrada al siguiente tramo                                          |
| `SHELL-CI-022::<package_id>` | Ejecutar cutover y piloto                                                                           |
| `SHELL-CI-023::<package_id>` | Ejecutar hypercare, conciliación sostenida, estabilización, handoff operativo y cierre de hypercare |
| `SHELL-CI-024::<package_id>` | Certificar el cierre integral de la instancia del paquete y la transferencia a soporte              |

CI024 no repite los pasos anteriores. Certifica que ocurrieron conforme a sus contratos y que el expediente final es suficiente.

#### 4. Topología de trabajo

La topología es:

```text
TEMPLATE_PER_PACKAGE
```

El marcador global se desarrolla una sola vez.

La materialización posterior ocurre mediante:

```text
SHELL-CI-024::<package_id>
```

La ejecución de una instancia no reabre ni modifica el marcador global.

#### 5. Cadena física obligatoria

```text
E5-GATE-008::<package_id>
→ SHELL-CI-020::<package_id>
→ SHELL-CI-021::<package_id>
→ SHELL-CI-022::<package_id>
→ SHELL-CI-023::<package_id>
→ SHELL-CI-024::<package_id>
```

No existe salto directo desde implementación, readiness, piloto o cutover hacia CI024.

#### 6. Precondición desde CI023

Una instancia directa de CI024 solo puede evaluarse cuando el handoff de CI023 demuestre:

```text
package_id
candidate_ref
environment
authorized_scope_ref
CI023 execution reference
APROBAR_CIERRE_HYPERCARE
closure evidence bundle
support handoff evidence
documentation version
remaining obligations
contingency dispositions
recovery / rollback / compensation references
legacy disposition
test and evidence references
freshness cut
decision authority
```

Si falta cualquiera de las piezas obligatorias aplicables, CI024 no reconstruye la evidencia por inferencia.

#### 7. Revalidación de identidad

Antes de certificar, CI024 confirma que toda evidencia material pertenece a la misma identidad:

```text
package_id
candidate
environment
authorized_scope
execution lineage
```

La evidencia perteneciente a otro candidato, ambiente, alcance o ejecución se conserva como historia, pero no puede cerrar la instancia actual.

#### 8. Qué significa certificar

Certificar significa emitir una conclusión reproducible de que:

- el paquete autorizado fue materializado y recorrido por el ciclo aplicable;
- la versión efectivamente observada corresponde a la identidad declarada;
- los gates previos fueron satisfechos según su semántica;
- hypercare quedó aprobado para cierre;
- la transferencia operativa a soporte fue ejecutada y es sostenible;
- las obligaciones posteriores que pueden continuar están gobernadas;
- no existe una condición canónica incompatible con cierre;
- el expediente permite a otra persona autorizada verificar la misma conclusión.

#### 9. Qué no significa certificar

La certificación de un paquete no significa automáticamente:

```text
BLOQUE COMPLETO
APLICACIÓN COMPLETA
DOMINIO COMPLETO
ROADMAP COMPLETO
VENTO OS COMPLETO
DEUDA GLOBAL CERRADA
TODOS LOS INCIDENTES HISTÓRICOS BORRADOS
TODAS LAS SUPERFICIES LEGACY REMOVIDAS
TODOS LOS CONTROLES TEMPORALES ELIMINADOS
```

CI024 cierra únicamente la instancia de paquete evaluada.

#### 10. Evidencia end-to-end

El expediente debe reconstruir como mínimo:

```text
aprobación de paquete y scope
identidad de candidato
revisiones de repositorio
artefactos de implementación
validaciones de CI020
readiness de CI021
cutover y piloto de CI022
hypercare de CI023
conciliaciones
incidentes y problemas
deuda y trabajo posterior
handoff a soporte
documentación y conocimiento
contingencias
recovery / rollback / compensation
legacy
pruebas
autoridades
fechas de corte
restricciones
decisión final
```

No se exige duplicar payloads cuando una referencia inmutable y recuperable es suficiente.

#### 11. Trazabilidad de repositorio

La certificación deberá poder relacionar el paquete con las revisiones concretas que participaron en su ejecución.

Según aplicabilidad se conservan:

- repositorio;
- commit o revisión;
- PR o mecanismo de integración;
- artefacto generado;
- release o versión;
- ambiente de despliegue;
- relación entre revisión y evidencia;
- cambios posteriores que puedan invalidar la conclusión.

Una rama por sí sola no es evidencia suficiente porque su punta puede cambiar.

#### 12. Revisión desplegada

La revisión certificada debe corresponder a la revisión efectivamente utilizada por la instancia.

No es válido certificar:

```text
SHA A probado
+
SHA B desplegado
```

como si fueran la misma revisión, salvo que una fuente propietaria demuestre equivalencia material suficiente.

#### 13. Integridad de la evidencia

La evidencia usada para cierre debe ser:

1. atribuible;
2. reproducible;
3. vigente;
4. coherente;
5. recuperable;
6. suficientemente inmutable;
7. sanitizada;
8. compatible con la identidad exacta;
9. consistente con el resto del expediente.

Una captura aislada o una afirmación manual no sustituye una fuente recuperable cuando esta existe.

#### 14. Evidencia stale

Un cambio material posterior puede volver obsoleta parte del expediente.

CI024 debe identificar:

- qué evidencia quedó stale;
- qué conclusión afecta;
- cuál es su owner;
- qué etapa debe repetirse o revalidarse;
- qué condición restablece certificabilidad.

CI024 no recicla evidencia inválida para preservar un cierre.

#### 15. Readiness

La certificación consume la decisión real de CI021.

No reabre el checklist ni reinterpreta sus resultados.

Debe demostrar que la instancia que continuó hacia CI022 fue exactamente la instancia cuya entrada resultó autorizada por el contrato aplicable.

#### 16. Cutover y piloto

La certificación consume el expediente de CI022:

- identidad;
- exposición;
- secuencia;
- decisiones;
- incidentes;
- recovery;
- conciliaciones;
- evidencia;
- salida;
- handoff a hypercare.

Una exposición distinta no puede sustituir el piloto certificado.

#### 17. Hypercare

CI024 exige una salida positiva de CI023.

Para una instancia directa normal:

```text
CI023 VERIFIED
+ APROBAR_CIERRE_HYPERCARE
```

son precondiciones de certificación.

`CANDIDATA_A_SALIDA` por sí sola no es suficiente.

#### 18. Transferencia a soporte

CI023 ejecuta el handoff operativo.

CI024 certifica que ese handoff:

- ocurrió;
- fue recibido;
- corresponde al paquete;
- conserva cobertura;
- conserva escalamiento;
- conserva observabilidad;
- conserva recovery;
- incorpora obligaciones restantes;
- dispone de documentación vigente;
- dispone del conocimiento exigible.

CI024 no inventa un segundo handoff.

#### 19. Recepción de soporte

La recepción por soporte debe ser demostrable cuando el contrato la exija.

Debe poder identificarse:

```text
qué se transfirió
a quién
bajo qué autoridad
qué documentación
qué restricciones
qué known errors
qué workarounds
qué incidentes/problemas siguen abiertos
qué deuda/trabajo posterior sigue abierto
qué contingencias continúan
qué recovery permanece disponible
```

La mera asignación de un contacto no demuestra recepción.

#### 20. Soporte ordinario no cambia la fuente de verdad

El paso a soporte ordinario modifica el modo de acompañamiento.

No modifica automáticamente:

- ownership de datos;
- ownership de código;
- ownership funcional;
- autoridad de riesgo;
- severidad de incidentes;
- estado de backlog;
- política de rollback;
- política de retención;
- fuente canónica de documentación.

#### 21. Documentación operativa vigente

CI024 certifica la versión operativa que refleja el estado real del paquete al cierre.

Debe cubrir, según aplique:

- operación normal;
- límites;
- configuración relevante;
- observabilidad;
- escalamiento;
- recovery;
- rollback;
- known errors;
- workarounds;
- contingencias;
- restricciones;
- soporte;
- procedimientos.

“Definitiva” no significa inmutable.

#### 22. Conocimiento y capacitación

Cuando la transferencia exige capacitación o recepción de conocimiento, CI024 requiere evidencia de ejecución.

No basta:

```text
DOCUMENTO EXISTE
```

para concluir:

```text
SOPORTE ESTÁ PREPARADO
```

#### 23. Incidentes

CI024 no cierra incidentes.

Consume su disposición vigente y verifica si es compatible con cierre del paquete.

Un incidente que su fuente exige resolver antes de cierre mantiene la certificación bloqueada.

#### 24. Restauración y resolución

CI024 conserva:

```text
SERVICE_RESTORED
!= INCIDENT_RESOLVED
!= PROBLEM_RESOLVED
```

Una recuperación de servicio no permite certificar como resuelto aquello que sigue abierto según su fuente propietaria.

#### 25. Problemas y known errors

Un problema o known error puede continuar después del cierre del paquete únicamente cuando:

- su fuente permite continuidad posterior;
- tiene owner;
- tiene destino;
- tiene riesgo/disposición vigente;
- soporte lo conoce cuando aplique;
- existe condición futura de seguimiento o cierre.

CI024 certifica la disposición; no resuelve causalmente el problema.

#### 26. Deuda y trabajo posterior

La deuda o trabajo posterior solo son compatibles con cierre cuando ya están gobernados por su contrato vigente.

Deben conservar:

- owner;
- destino canónico;
- decisión aplicable;
- control temporal cuando corresponda;
- riesgo;
- condición de salida;
- evidencia futura.

Un residual huérfano bloquea certificación.

#### 27. Obligaciones no diferibles

Una obligación declarada no diferible continúa bloqueando.

CI024 no puede convertirla en deuda, backlog o trabajo futuro para lograr cierre.

#### 28. Conciliaciones

Toda conciliación exigible para cierre debe tener un resultado compatible.

Queda prohibido certificar cuando exista:

- resultado desconocido incompatible;
- diferencia material sin owner;
- doble fuente de verdad activa;
- operación pendiente cuya disposición no pueda determinarse;
- efecto no correlacionable.

#### 29. Contingencias temporales

CI024 consume las decisiones y acciones ejecutadas en hypercare.

Distingue:

```text
RETIRO_ELEGIBLE
DESACTIVACIÓN MATERIAL
REMOCIÓN FÍSICA
```

como hechos diferentes.

La certificación no presume remoción física por la sola salida del modo temporal.

#### 30. Controles permanentes

CI024 confirma que los controles permanentes exigidos siguen disponibles aunque termine hypercare.

Según aplique:

- backup;
- restore;
- rollback;
- recovery;
- kill switch;
- observabilidad;
- auditoría;
- soporte;
- retención.

Cerrar el paquete no autoriza retirarlos.

#### 31. Recovery, rollback y compensation

Una capacidad permanente de recovery puede permanecer después del cierre.

Lo que bloquea certificación es una acción abierta o una incertidumbre que la fuente declare incompatible con salida.

CI024 verifica disposición y estado; no ejecuta la recuperación.

#### 32. Legacy retenido

Una superficie anterior puede permanecer retenida cuando su fuente así lo exija.

CI024 debe distinguir:

```text
LEGACY RETENIDO CON DISPOSICIÓN VÁLIDA
```

de:

```text
LEGACY OLVIDADO SIN OWNER
```

Solo el segundo caso constituye una omisión incompatible con cierre.

#### 33. Remoción física de legacy

CI024 no autoriza la eliminación física de código, tablas, rutas, datos, infraestructura o configuraciones legacy.

La remoción pertenece al owner físico que tenga esa autorización.

#### 34. Cobertura de prueba

La certificación debe resolver la evidencia de prueba aplicable a la misma revisión, alcance y ambiente.

No crea una batería universal nueva.

Consume las pruebas y gates ya exigidos por:

- el paquete;
- CI;
- readiness;
- cutover;
- hypercare;
- contratos de dominio;
- integraciones;
- continuidad;
- seguridad;
- configuración;
- migraciones;
- datos.

#### 35. PASS técnico no sustituye certificación

Un build o suite de tests en PASS demuestra únicamente aquello que cubre.

No sustituye:

- handoff de soporte;
- evidencia operativa;
- conciliación;
- autoridad;
- disposición de incidentes;
- deuda;
- contingencias;
- recovery;
- vigencia de documentación.

#### 36. Autoridad de certificación

CI024 no inventa un aprobador universal.

La certificación se sustenta en las autoridades ya resueltas por las fuentes propietarias de:

- alcance;
- riesgo;
- soporte;
- evidencia técnica;
- evidencia funcional;
- cierre de hypercare;
- cambios físicos;
- incidentes y deuda.

Cuando se requieran varias conformidades, ninguna absorbe a las demás.

#### 37. Segregación

Ejecutar una implementación, operar hypercare o recopilar evidencia no concede automáticamente autoridad para certificar la dimensión funcional o técnica correspondiente.

Si una misma persona ejerce varias funciones permitidas, las conformidades permanecen distinguibles.

#### 38. Decisión final

La futura instancia produce una de dos conclusiones semánticas:

```text
CIERRE CERTIFICADO
CERTIFICACIÓN BLOQUEADA
```

Estas expresiones describen la conclusión de CI024 y no crean un nuevo sistema de estados paralelo al ledger de implementación.

No existe certificación parcial con efecto de cierre.

#### 39. Cierre certificado

Solo es admisible cuando todas las condiciones aplicables son compatibles simultáneamente.

La conclusión debe conservar:

- identidad;
- revisión;
- alcance;
- evidencia;
- autoridades;
- fecha de corte;
- obligaciones posteriores;
- restricciones;
- referencias de soporte;
- razones.

#### 40. Certificación bloqueada

Cualquier condición obligatoria abierta, contradictoria, stale o sin evidencia suficiente bloquea.

El bloqueo debe identificar:

```text
source
owner
condition
impact
required evidence
exit condition
```

CI024 no crea pendientes narrativos sin dueño.

#### 41. Retorno al owner correcto

Cuando CI024 encuentra un bloqueo, devuelve la obligación al owner que puede resolverla.

Ejemplos:

- código → owner técnico;
- conciliación → owner de conciliación;
- incidente → sistema de incidentes vigente;
- soporte → owner del handoff;
- deuda → owner de deuda/riesgo;
- legacy → owner de retiro;
- documentación → owner documental;
- prueba faltante → owner de la evidencia.

CI024 no absorbe el trabajo por conveniencia.

#### 42. Reingreso a certificación

Después de resolver un bloqueo, CI024 reevalúa únicamente con evidencia vigente.

La historia de la evaluación anterior se conserva.

No se borra el intento bloqueado ni se reescribe como si nunca hubiera existido.

#### 43. Estado VERIFIED de la instancia

Para una instancia física normal:

```text
CIERRE CERTIFICADO
+ EXPEDIENTE COMPLETO
+ EVIDENCIA VIGENTE
= SHELL-CI-024::<package_id> ELEGIBLE PARA VERIFIED
```

En cambio:

```text
CERTIFICACIÓN BLOQUEADA
→ NO VERIFIED
→ resolver en owner
→ reevaluar
```

#### 44. Efecto de `SHELL-CI-024::<package_id>` VERIFIED

`VERIFIED` de CI024 significa:

- el ciclo de despliegue de esa instancia terminó;
- el cierre del paquete fue certificado;
- el soporte ordinario quedó como modo operativo aplicable;
- el expediente histórico quedó consolidado;
- las obligaciones posteriores gobernadas continúan bajo sus owners.

No significa cierre de tareas globales no relacionadas.

#### 45. Inmutabilidad histórica

Una instancia CI024 `VERIFIED` y su evidencia consolidada son históricas.

No se reescriben para reflejar una versión posterior del mismo paquete.

Una nueva materialización, corrección material o candidato posterior requiere su propia identidad o ciclo según la topología aplicable.

#### 46. Paquete cerrado no equivale a bloque cerrado

La certificación de un paquete no marca automáticamente como completos:

- BLOQUE T;
- BLOQUE J;
- BLOQUE R;
- aplicación propietaria;
- dominios transversales;
- otras raíces;
- otros paquetes.

La continuidad global sigue el roadmap canónico.

#### 47. Concurrencia

Varios paquetes pueden avanzar de forma independiente cuando sus dependencias lo permitan.

La certificación de uno no presta evidencia a otro salvo que exista una fuente compartida explícita y vigente.

#### 48. Seguridad y secretos

El expediente final no debe almacenar innecesariamente:

- passwords;
- tokens;
- cookies;
- claves privadas;
- secretos de proveedor;
- variables sensibles;
- credenciales productivas;
- PII no necesaria;
- payloads sensibles.

Se prefieren referencias recuperables y evidencia sanitizada.

#### 49. Cierre del BLOQUE T global

La aprobación documental global de CI024 cierra la definición canónica del ciclo base:

```text
SHELL-CI-001
...
SHELL-CI-024
```

como capacidad transversal definida.

Esto no ejecuta las futuras instancias por paquete de CI020..024.

Después de consolidar y validar documentalmente el bloque, la continuidad normal pasa a BLOQUE J.

#### 50. Separación entre cierre del bloque y cierre de paquetes

Existen dos planos diferentes:

```text
PLANO GLOBAL
SHELL-CI-001..024
→ define la infraestructura y contratos de CI/despliegue

PLANO POR PAQUETE
SHELL-CI-020::<package_id>
...
SHELL-CI-024::<package_id>
→ ejecuta y certifica cada paquete real
```

Cerrar documentalmente BLOQUE T no simula ninguna instancia física.

#### 51. Owner de protección de ramas

La política de bloqueo de merge continúa perteneciendo a `SHELL-CI-018`.

CI024 no redefine:

- el Required Gate;
- su composición;
- estados exitosos;
- estados bloqueantes;
- protección de ramas;
- protección de despliegues.

CI024 consume ese gate como control transversal ya definido.

#### 52. `main` como baseline estable de integración

Para `vento-shell`, `main` es la rama estable de integración y sincronización entre estaciones de trabajo.

La regla operativa queda:

```text
TRABAJO ACTIVO
→ RAMA DE TRABAJO PUBLICADA EN GITHUB

CIERRE DEL ALCANCE
→ PR
→ REQUIRED GATE
→ MERGE
→ MAIN ACTUALIZADO

SIGUIENTE ALCANCE
→ PARTE DE MAIN ACTUALIZADO
```

`main` no se usa como cuaderno local de trabajo inconcluso.

#### 53. Trabajo fuera de `main`

El desarrollo documental o físico ordinario ocurre en una rama de trabajo separada.

CI024 no fija una convención nueva de nombres de rama cuando otra fuente no la define.

La identidad canónica del trabajo sigue siendo la tarea o instancia; el nombre de la rama es un mecanismo Git.

#### 54. Integración por PR

La integración normal hacia `main` debe pasar por el mecanismo de PR y por el Required Gate vigente.

La mera capacidad técnica de hacer merge no sustituye:

- validaciones;
- required checks;
- revisión exigible;
- ausencia de bloqueos;
- coherencia de alcance.

Un gate ausente, pendiente o fallido no se interpreta como PASS.

#### 55. Momento de integrar un bloque documental

Una rama usada para desarrollar un bloque global puede integrarse a `main` cuando:

1. el alcance documental del bloque quedó cerrado;
2. la última tarea del bloque fue aprobada explícitamente;
3. los artefactos canónicos fueron consolidados;
4. los validadores locales aplicables pasaron;
5. la rama fue publicada;
6. el PR representa el alcance real;
7. el Required Gate vigente pasa;
8. no existe contradicción canónica abierta;
9. no quedan cambios locales legítimos sin incorporar al cierre.

El merge es una acción de repositorio, no una aprobación documental automática.

#### 56. Continuidad entre computadores

GitHub es el punto remoto compartido para transportar el estado versionado entre computadores.

Para cambiar de estación de trabajo de forma segura:

```text
COMPUTADOR A
→ trabajo versionado
→ commit
→ push de la rama activa

GITHUB
→ fuente remota compartida

COMPUTADOR B
→ fetch
→ misma rama
→ actualización fast-forward
→ continuar
```

No es necesario transferir manualmente la carpeta del proyecto entre computadores.

#### 57. Lo que Git sí transporta

El flujo multiestación transporta todo lo versionado y publicado:

- código;
- documentación;
- migraciones;
- tests;
- configuración versionada;
- scripts;
- archivos canónicos;
- historial;
- commits;
- ramas;
- tags;
- referencias de PR.

#### 58. Lo que Git no transporta automáticamente

No se consideran sincronizados por Git:

- cambios sin commit;
- commits no publicados;
- secretos locales;
- `.env` no versionados;
- dependencias instaladas;
- caches;
- procesos en ejecución;
- watcher runtime;
- credenciales;
- bases locales no versionadas.

Cambiar de computador exige distinguir estado versionado de estado local.

#### 59. Punto seguro antes de cambiar de computador

Antes de abandonar una estación, el estado reutilizable debe estar publicado en la rama remota correspondiente.

Queda prohibido asumir que:

```text
archivo guardado localmente
```

equivale a:

```text
estado disponible en otro computador
```

Si existe trabajo deliberadamente no listo para compartir, sigue siendo responsabilidad local y no forma parte del checkpoint remoto.

#### 60. Reanudación desde otro computador

La nueva estación debe reconstruir su estado desde el remoto, no desde memoria de conversación.

La fuente de continuidad es:

```text
GitHub
+ rama actual
+ historial Git
+ plan canónico versionado
+ archivos de instancia
+ Iniciador regenerado desde el checkout
```

ChatGPT es una herramienta de apoyo y no una dependencia para transportar el proyecto.

#### 61. Evitar divergencia entre computadores

El flujo normal es secuencial por rama activa:

```text
PUSH EN A
→ ACTUALIZAR B
→ TRABAJAR EN B
→ PUSH EN B
→ ACTUALIZAR A
```

No se deben mantener dos líneas locales divergentes sobre la misma rama y asumir que Git las conciliará sin una decisión explícita.

#### 62. Cierre de una rama de trabajo

Después de integrar su alcance a `main`:

- `main` pasa a ser el baseline estable;
- la rama cerrada deja de ser base de nuevos bloques;
- el siguiente alcance se crea desde `main` actualizado;
- la rama antigua puede conservarse temporalmente o eliminarse conforme a las capacidades y políticas Git vigentes;
- el historial permanece recuperable mediante commits y PR.

No se prolonga indefinidamente una rama de bloque solo para conservar contexto.

#### 63. Prohibición de reescritura rutinaria

El flujo ordinario no depende de force-push ni de reescritura destructiva de historia.

Si una operación excepcional exige reescritura, debe estar justificada y gobernada por la política Git aplicable.

La sincronización multiestación normal debe poder funcionar con historial publicado y actualizaciones no destructivas.

#### 64. Merge de rama no equivale a despliegue

Invariante:

```text
MERGE A MAIN
≠ DEPLOY PRODUCTIVO
≠ CUTOVER
≠ HYPERCARE
≠ CERTIFICACIÓN DEL PAQUETE
```

El merge integra revisiones al baseline del repositorio.

Las tareas CI020..024 siguen gobernando el ciclo físico del paquete.

#### 65. Merge de rama no sustituye CI024

Para una instancia física:

```text
CÓDIGO INTEGRADO
```

es evidencia de repositorio.

No demuestra por sí solo:

```text
PILOTO RESUELTO
HYPERCARE CERRADO
SOPORTE TRANSFERIDO
PAQUETE CERTIFICADO
```

CI024 conserva esa separación.

#### 66. Portabilidad sin dependencia de ChatGPT

El proyecto debe poder abrirse en un computador nuevo y recuperar su estado verificable desde el repositorio.

La continuidad no debe depender de:

- recordar qué archivo se cambió;
- recuperar una conversación específica;
- copiar una carpeta desde otro equipo;
- reconstruir manualmente la última tarea;
- conocer de memoria el estado del watcher.

El checkout actualizado y los scripts canónicos deben permitir reconstruir el contexto.

#### 67. Handoff hacia BLOQUE J

Después del cierre documental de BLOQUE T, el siguiente bloque normal es:

```text
BLOQUE J — Inventariar y proteger acciones de servidor
```

La primera tarea es:

```text
AUTH-SRV-001 — Inventariar Server Actions de todos los repositorios
```

El cambio de bloque no autoriza por sí solo una instancia física CI020..024.

#### 68. Casos positivos mínimos de futura certificación

CI024 deberá poder demostrar, según aplicabilidad:

1. handoff válido desde CI023;
2. misma identidad de paquete/candidato/ambiente/alcance;
3. `APROBAR_CIERRE_HYPERCARE` vigente;
4. revisión de repositorio trazable;
5. revisión observada y desplegada correlacionable;
6. readiness trazable;
7. cutover y piloto trazables;
8. hypercare trazable;
9. conciliaciones compatibles con cierre;
10. incidentes con disposición válida;
11. problemas/known errors gobernados;
12. deuda y trabajo posterior con owner;
13. soporte recibido;
14. documentación vigente;
15. conocimiento transferido cuando aplique;
16. contingencias con disposición válida;
17. controles permanentes preservados;
18. recovery compatible con operación ordinaria;
19. legacy con disposición válida;
20. evidencia de prueba vigente;
21. ausencia de cambios materiales invalidantes;
22. conclusión final reproducible;
23. expediente histórico completo.

#### 69. Casos negativos mínimos

CI024 deberá bloquear, como mínimo:

1. handoff de otro paquete;
2. candidato distinto;
3. ambiente distinto;
4. alcance distinto;
5. CI023 no VERIFIED;
6. ausencia de cierre positivo de hypercare;
7. revisión probada distinta de la utilizada sin equivalencia demostrada;
8. evidencia stale;
9. prueba obligatoria faltante;
10. conciliación incompatible abierta;
11. resultado desconocido incompatible;
12. incidente bloqueante abierto;
13. residual huérfano;
14. obligación no diferible enviada artificialmente a backlog;
15. soporte no recibido;
16. documentación obsoleta;
17. known error sin owner;
18. contingencia sin disposición;
19. eliminación indebida de control permanente;
20. recovery abierto incompatible;
21. legacy olvidado sin owner;
22. evidencia contradictoria;
23. autoridad insuficiente;
24. intento de certificar parcialmente;
25. intento de usar merge Git como evidencia de operación;
26. intento de cerrar bloque, aplicación o sistema por cerrar un paquete.

#### 70. Regresiones que CI024 debe impedir

CI024 no podrá introducir:

1. un nuevo sistema de gates de merge;
2. un nuevo sistema de soporte;
3. un nuevo sistema de incidentes;
4. un nuevo sistema de deuda;
5. un nuevo sistema de estados paralelo al ledger;
6. un owner universal inventado;
7. certificación por simple transcurso del tiempo;
8. certificación por PASS técnico aislado;
9. mezcla de candidatos;
10. mezcla de ambientes;
11. mezcla de alcances;
12. evidencia prestada entre paquetes;
13. supresión de historia;
14. reescritura de fallos pasados;
15. pérdida de obligaciones posteriores;
16. eliminación prematura de legacy;
17. eliminación de controles permanentes;
18. dependencia de una conversación para reconstruir continuidad;
19. uso de una rama local no publicada como fuente compartida;
20. desarrollo ordinario directo sobre `main`.

#### 71. Flujo canónico de una futura instancia

```text
CI023 VERIFIED
→ recibir closure evidence bundle
→ fijar package + candidate + environment + scope
→ revalidar identidad y vigencia
→ reconstruir CI020
→ reconstruir CI021
→ reconstruir CI022
→ reconstruir CI023
→ verificar revisión/release/ambiente
→ verificar pruebas
→ verificar conciliaciones
→ verificar incidentes/problemas
→ verificar deuda/trabajo posterior
→ verificar soporte/documentación/conocimiento
→ verificar contingencias
→ verificar recovery/rollback/compensation
→ verificar legacy
→ verificar autoridades
→ verificar freshness
→ CERTIFICACIÓN BLOQUEADA: devolver al owner y reevaluar
→ CIERRE CERTIFICADO: consolidar expediente
→ batería final autorizada cuando exista
→ VERIFIED
→ cierre documental único
```

#### 72. Batería física de la futura instancia

La futura instancia utiliza exclusivamente sus `validation_commands` autorizadas.

La batería final:

- no inventa evidencia operativa;
- no sustituye el expediente de CI020..023;
- no modifica estados de incidentes;
- no acepta deuda;
- no transfiere soporte;
- no ejecuta cutover;
- no ejecuta hypercare;
- no convierte un fallo de certificación en PASS.

Después de VERIFIED, el cierre documental se sincroniza una sola vez conforme al flujo vigente.

#### 73. Evidencia consolidada de CI024

La evidencia de la instancia deberá permitir resolver, según aplicabilidad:

```text
package_id
candidate
environment
authorized_scope
E5 approval
CI020 execution
repository revisions
release/deployment references
CI021 decision
CI022 evidence
CI023 evidence
hypercare closure decision
support handoff
documentation version
knowledge transfer
reconciliation results
incident/problem dispositions
residual/debt dispositions
contingency dispositions
recovery/rollback/compensation state
legacy disposition
test evidence
authority evidence
freshness cut
remaining obligations
certification conclusion
completed_at
```

#### 74. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Fragmentos 04A afectados:** 0

**Justificación:** CI024 certifica evidencia producida por contratos y requisitos ya vigentes. No crea una nueva regla empresarial, algoritmo, autorización, transición de datos, integración ni comportamiento ejecutable independiente. La política Git aquí materializada gobierna continuidad e integración del repositorio y consume el Required Gate ya definido; no altera el comportamiento funcional del producto.

#### 75. Cobertura de prueba vigente reutilizada

Cada futura instancia reutiliza la cobertura vigente asociada a:

- paquete;
- implementación;
- CI;
- readiness;
- cutover;
- piloto;
- hypercare;
- conciliación;
- continuidad;
- seguridad;
- integraciones;
- datos;
- soporte;
- recovery;
- configuración.

La trazabilidad heredada no modifica el registro de requisitos.

#### 76. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                              |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador global no compila, despliega ni certifica físicamente un paquete.                                                                                                                                                                                                          |
| LOCAL     | NOT_EXECUTED   | La validación local del archivo propietario y de los derivados corresponde al checkout actualizado antes de la aprobación canónica.                                                                                                                                                    |
| REMOTA    | PASS           | Se verificaron la rama por defecto `main`, la rama de trabajo vigente del BLOQUE T, el PR abierto hacia `main`, el Required Gate propietario de SHELL-CI-018, la topología `TEMPLATE_PER_PACKAGE`, la continuidad normal hacia BLOQUE J y el contrato de handoff de CI023 hacia CI024. |
| OPERATIVA | NOT_EXECUTED   | No se certificó un paquete real, no se transfirió soporte y no se consultó operación productiva.                                                                                                                                                                                       |
| FÍSICA    | NOT_APPLICABLE | El marcador global define la plantilla; las evidencias físicas corresponderán a futuras instancias `SHELL-CI-024::<package_id>`.                                                                                                                                                       |

#### 77. Estado documental conciliado

| Métrica                                             |                Resultado |
| --------------------------------------------------- | -----------------------: |
| Topología CI024                                     | **TEMPLATE_PER_PACKAGE** |
| Instancias creadas por el marcador                  |                    **0** |
| Cambios físicos durante marcador                    |                    **0** |
| Requisitos creados o modificados                    |                    **0** |
| Branch baseline de integración                      |                 **main** |
| Trabajo ordinario directo en `main`                 |                   **NO** |
| Integración ordinaria a `main`                      |   **PR + Required Gate** |
| Owner del Required Gate                             |         **SHELL-CI-018** |
| Estado transportable entre computadores             |        **COMMIT + PUSH** |
| Cambios sin commit transportados por Git            |                   **NO** |
| Commits no publicados transportados por GitHub      |                   **NO** |
| Dependencia obligatoria de ChatGPT para continuidad |                   **NO** |
| Siguiente bloque documental normal                  |             **BLOQUE J** |

#### 78. Criterios de aceptación

`SHELL-CI-024` queda documentalmente completa cuando:

- define CI024 como certificación posterior a CI023;
- conserva la topología por paquete;
- exige handoff positivo y vigente;
- revalida identidad completa;
- reconstruye evidencia end-to-end;
- correlaciona revisión, release y ambiente;
- exige evidencia vigente;
- consume readiness, piloto e hypercare sin reejecutarlos;
- certifica la transferencia a soporte ya ejecutada;
- exige documentación y conocimiento vigentes;
- conserva la distinción entre restauración, incidente y problema;
- conserva owners de deuda y trabajo posterior;
- bloquea residuales huérfanos;
- exige conciliaciones compatibles;
- preserva contingencias y controles permanentes;
- conserva recovery y legacy con disposición;
- consume pruebas vigentes sin crear una batería universal;
- define cierre certificado y certificación bloqueada sin crear un ledger paralelo;
- impide certificación parcial;
- hace fail-closed la certificación;
- conserva inmutabilidad histórica de VERIFIED;
- distingue paquete cerrado de bloque/aplicación/sistema cerrados;
- reconoce SHELL-CI-018 como owner del Required Gate;
- establece `main` como baseline estable de integración y sincronización;
- exige trabajo ordinario fuera de `main`;
- exige integración por PR y Required Gate;
- establece commit + push como checkpoint portable entre computadores;
- impide depender de memoria de chat para reconstruir continuidad;
- establece que el siguiente alcance parte de `main` actualizado después del merge del alcance anterior;
- mantiene separados merge, deploy, hypercare y certificación;
- entrega continuidad hacia BLOQUE J;
- no crea ni modifica requisitos;
- no modifica 04A;
- no ejecuta cambios físicos durante el marcador.

#### 79. Límites

Esta tarea documental no:

- crea una instancia `SHELL-CI-024::<package_id>`;
- certifica un paquete real;
- cambia código;
- despliega código;
- ejecuta tests físicos;
- ejecuta cutover;
- ejecuta piloto;
- ejecuta hypercare;
- corrige incidentes;
- cierra problemas;
- acepta deuda;
- crea backlog;
- transfiere un paquete real a soporte;
- capacita soporte;
- publica documentación;
- modifica datos;
- modifica Supabase;
- aplica migraciones;
- ejecuta recovery;
- ejecuta rollback;
- ejecuta compensation;
- retira contingencias;
- elimina legacy;
- elimina controles permanentes;
- modifica branch protection;
- modifica el Required Gate;
- crea ramas;
- hace commit;
- hace push;
- abre PR;
- hace merge;
- despliega desde `main`;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica 04A;
- desarrolla BLOQUE J;
- desarrolla `AUTH-SRV-001`.

#### 80. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-023 — Ejecutar hypercare, conciliación y estabilización`

**TAREA ACTUAL APROBADA**
`SHELL-CI-024 — Certificar cierre del paquete y transferencia a soporte`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-001 — Inventariar Server Actions de todos los repositorios`
