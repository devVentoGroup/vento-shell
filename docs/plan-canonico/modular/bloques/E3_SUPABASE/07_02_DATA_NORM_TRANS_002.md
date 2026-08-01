### ✅ DATA-NORM-TRANS-002 — Ejecutar dry-run de cada regla de normalización

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-001 — Crear baseline de valores actuales antes de transformar` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-003 — Identificar colisiones producidas por valores normalizados` — APROBADA

**Tipo de tarea:** dry-run analítico documental sobre el baseline aprobado, replay de corpus normativos y consolidación de resultados históricos de solo lectura; sin DDL, DML, migraciones, funciones nuevas, backfills, constraints, índices, triggers, cambios en aplicaciones, ejecución de paquetes físicos, consultas remotas nuevas ni modificación de VITAL

**Fecha de preparación documental:** `2026-08-01`

**Contrato material:** `NORMALIZATION-RULE-DRY-RUN-002@1.0.0`

#### 1. Resultado concreto

Queda ejecutado el dry-run preimplementación de las reglas canónicas de normalización sobre la evidencia disponible y fechada del baseline `DNT001::VENTO_OS::2026-07-30::AUDITED_V1`.

El resultado material:

- reutiliza cinco cortes históricos de solo lectura sin presentarlos como una consulta actual;
- reconcilia 89 escenarios normativos de `DATA-NORM-ARC-003` a `008` contra sus resultados esperados;
- cubre 25 unidades de regla, incluidas todas las entradas atómicas activas de conectores, excepciones y diccionario;
- separa resultado ejecutado, replay contractual, regla bloqueada, capacidad deshabilitada y ejecución física diferida;
- conserva valores originales y candidatos sin emitir una lista de escrituras;
- produce el handoff de grupos y señales hacia `DATA-NORM-TRANS-003`, sin clasificarlos como duplicados;
- ejecuta analíticamente las doce etapas de detección de `DATA-NORM-ARC-010` y termina en `CANDIDATE_ONLY_NO_MUTATION`;
- demuestra que no existe cobertura suficiente para afirmar cuántas filas serían modificables por capitalización, diccionario o excepciones hasta materializar política campo por campo;
- deja la validación del motor físico, SQL, RPC, índices y paquetes a `DATA-NORM-DB-001` a `004` en BLOQUE R.

No se produjo un supuesto “100 % exitoso”. Las salidas bloqueadas y deshabilitadas son resultados correctos del dry-run cuando falta una coordenada, versión ejecutable, autoridad, scope, estructura o decisión humana.

#### 2. Identidad y procedencia de la corrida

| Propiedad | Valor |
| --- | --- |
| `dry_run_id` | `DNT002::VENTO_OS::BASELINE_2026-07-30::ANALYTICAL_V1` |
| `baseline_id` | `DNT001::VENTO_OS::2026-07-30::AUDITED_V1` |
| proyecto de origen de la evidencia | `vento-os-dev` — `clzdpinthhtknkmefsxx` |
| motor observado por la auditoría | PostgreSQL `17.6` |
| modo | `ANALYTICAL_BASELINE_REPLAY` |
| mutaciones permitidas | 0 |
| consultas remotas nuevas | 0 |
| filas nuevas extraídas | 0 |
| frontera VITAL | `EXCLUDED_WITH_NON_INTERVENTION_PROOF` |
| resultado global | `COMPLETED_WITH_BLOCKED_AND_DEFERRED_RULES` |
| destino siguiente | `DATA-NORM-TRANS-003` para analizar colisiones; BLOQUE R para ejecución física |

Este dry-run fija resultados preimplementación. No certifica el contenido remoto del `2026-08-01` ni sustituye la recaptura y control de drift de `AUTH-DB-028`.

#### 3. Estados cerrados del dry-run

| Estado | Significado |
| --- | --- |
| `HISTORICAL_READ_ONLY_EXECUTED` | existe resultado cuantitativo de una consulta de solo lectura aprobada y fechada |
| `CONTRACT_CORPUS_REPLAYED` | los casos explícitos fueron recorridos y reconciliados con el contrato aprobado; no prueba un motor físico |
| `CANDIDATE_ONLY` | la regla encontró señales, pero no autoriza corrección, identidad ni escritura |
| `BLOCKED_MISSING_COORDINATE` | falta clase, representación, fuente, campo, scope, autoridad o versión resoluble |
| `BLOCKED_HUMAN_REVIEW` | el resultado depende de decisión propietaria o evidencia adicional |
| `DISABLED_BY_POLICY` | la capacidad está expresamente deshabilitada en la versión aprobada |
| `NO_OBSERVATION_IN_CUT` | el corte no produjo casos; no demuestra ausencia en el universo |
| `DEFERRED_PHYSICAL_EXECUTION` | el contrato está aprobado, pero su ejecución con el motor físico pertenece a BLOQUE R |
| `HANDOFF_DNT003` | la salida es un grupo o señal de colisión que debe analizar la tarea siguiente |

`NO_OBSERVATION_IN_CUT` no equivale a `PASS_GLOBAL`. `CONTRACT_CORPUS_REPLAYED` no equivale a prueba de SQL, RPC, aplicación o trigger.

#### 4. Cargas históricas reutilizadas

| `workload_id` | Corte aprobado | Cobertura | Resultado reutilizado | Estado |
| --- | --- | ---: | --- | --- |
| `DNT002-W01` | diagnóstico de forma visible | 31 columnas; 5.750 valores | espacios, Unicode, caja y puntuación | `HISTORICAL_READ_ONLY_EXECUTED` |
| `DNT002-W02` | comparación normalizada controlada | 16 columnas; 4.567 valores | variantes de caja, espacios, tildes y signos | `HISTORICAL_READ_ONLY_EXECUTED` |
| `DNT002-W03` | conectores lingüísticos | 6 columnas; 1.590 valores | variantes por conjunciones, artículos y preposiciones | `HISTORICAL_READ_ONLY_EXECUTED` |
| `DNT002-W04` | comparación de búsqueda | 12 entidades; 4.030 filas | cinco representaciones legacy o analíticas | `HISTORICAL_READ_ONLY_EXECUTED` |
| `DNT002-W05` | candidatos estructurales | 11 fuentes; 1.753 registros | 17 grupos y 94 registros agrupados | `HISTORICAL_READ_ONLY_EXECUTED` |

Las poblaciones se solapan y no se suman. Cada workload conserva su propio propósito, columnas, entidades, scopes y fecha de corte.

#### 5. Replay de corpus normativos

| Corpus propietario | Escenarios explícitos | Resultado reconciliado | Lectura permitida |
| --- | ---: | ---: | --- |
| capitalización `DATA-NORM-ARC-003` | 16 | 16 | expectativas contractuales coherentes |
| conectores `DATA-NORM-ARC-004` | 20 | 20 | posiciones, tokens y bloqueos coherentes |
| excepciones `DATA-NORM-ARC-005` | 21 | 21 | preservación, emisión contextual y revisión coherentes |
| diccionario `DATA-NORM-ARC-006` | 15 | 15 | tres reemplazos, exclusiones y conflictos coherentes |
| búsqueda `DATA-NORM-ARC-008` | 17 | 17 | ranking de modos, tolerancias y preservación coherentes |
| **Total** | **89** | **89** | **replay contractual; no ejecución de motor físico** |

No se encontraron contradicciones entre el resultado esperado de estos 89 casos y la precedencia aprobada. Los escenarios adicionales exigidos por cada corpus continúan como requisitos de prueba para CI, staging y BLOQUE R; no se declaran ejecutados por estar descritos en prosa.

#### 6. Cobertura atómica de catálogos

##### 6.1 Conectores

`VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0` cubre exactamente 18 entradas:

```text
a, al, con, de, del, e, el, en, la, las, lo, los, o, para, por, sin, u, y
```

Cada entrada fue cubierta en el replay por la misma regla exacta de token y por las tres posiciones normativas:

```text
NAME_START
DECLARED_SEGMENT_START
INTERNAL
```

El resultado no genera 54 transformaciones independientes: la posición se evalúa por escenario y la cobertura atómica se conserva mediante catálogo + versión + resultado.

##### 6.2 Excepciones activas de conformidad

| Familia | Entradas cubiertas | Cantidad | Resultado de dry-run |
| --- | --- | ---: | --- |
| marcas | `3M`, `iPhone`, `Coca-Cola` | 3 | forma oficial emitida o preservada solo en coordenada compatible |
| aplicaciones | `NEXO`, `VISO`, `ORIGO`, `NUMERA`, `FOGO`, `PULSO` | 6 | forma técnica preservada; no palabra ordinaria |
| códigos empresariales | `VGR`, `SAU`, `VCF` | 3 | validación o emisión técnica contextual |
| moneda | `COP` | 1 | componente técnico; sin capitalización comercial |
| unidades | `g`, `kg`, `ml`, `l`, `un`, `dz` | 6 | código unitario solo en componente estructurado |
| familias unitarias | `count`, `mass`, `volume` | 3 | `VALIDATE_ONLY` salvo contrato posterior |
| sufijos legales | `SAS`, `S.A.S.`, `SA`, `S.A.`, `LTDA`, `CIA` | 6 | preservación exacta; sin equivalencias implícitas |
| **Total** | **entradas activas cubiertas** | **28** | **sin ampliar catálogo por analogía** |

Los candidatos `Oster`, `Wellmix`, `Welmix`, `BBQ`, `HIT`, `AA`, `CMS`, `PAM`, `REF`, `T26`, `WIP`, `AVSA`, `FC`, `SVV`, `Botellla`, `Six Pack` y otros casos no aprobados producen preservación, bloqueo o revisión. No cuentan como entradas ejecutables.

##### 6.3 Diccionario inicial

| Regla | Origen | Destino | Resultado contractual |
| --- | --- | --- | --- |
| `ORTHO_ES_CO_MAIZ_MAIZ` | `maiz` | `maíz` | reemplazo direccional por token, scope y clase elegibles |
| `ORTHO_ES_CO_CLASICO_CLASICO` | `clasico` | `clásico` | reemplazo direccional por token, scope y clase elegibles |
| `ORTHO_ES_CO_FRIO_FRIO` | `frio` | `frío` | reemplazo direccional por token, scope y clase elegibles |

`expresso` queda expresamente fuera del diccionario `1.0.0` y produce `BLOCKED_HUMAN_REVIEW`.

#### 7. Registro material de las 25 unidades

| `run_unit_id` | Regla o capacidad | Evidencia aplicada | Resultado observado | Estado final |
| --- | --- | --- | --- | --- |
| `DNT002-R01` | recorte de espacios de borde | 5.750 valores | 4 valores candidatos | `CANDIDATE_ONLY` |
| `DNT002-R02` | compactación de separadores repetidos | 5.750 valores | 32 valores candidatos | `CANDIDATE_ONLY` |
| `DNT002-R03` | composición Unicode NFC | 5.750 valores | 0 valores fuera de NFC | `NO_OBSERVATION_IN_CUT` |
| `DNT002-R04` | espacios Unicode e invisibles | 5.750 valores | 0 no estándar; 0 invisibles | `NO_OBSERVATION_IN_CUT` |
| `DNT002-R05` | separación de puntuación de prosa | 5.750 valores | 1 espacio previo y 9 ausencias posteriores | `CANDIDATE_ONLY` |
| `DNT002-R06` | capitalización comercial `es-CO@1.0.0` | 16 escenarios; 23 grupos de variantes | corpus reconciliado; total de filas elegibles no demostrable | `BLOCKED_MISSING_COORDINATE` |
| `DNT002-R07` | conectores exactos y posición | 18 entradas; 20 escenarios; 1.590 valores | 20 escenarios reconciliados; 0 grupos de variantes en el corte | `NO_OBSERVATION_IN_CUT` |
| `DNT002-R08` | excepciones de marca | 3 activas; corpus de 21 escenarios compartido | formas activas coherentes; candidatos no autorizados preservados | `CONTRACT_CORPUS_REPLAYED` |
| `DNT002-R09` | siglas y códigos controlados | 10 activos | formas activas coherentes; candidatos contextuales bloqueados | `CONTRACT_CORPUS_REPLAYED` |
| `DNT002-R10` | unidades y familias técnicas | 9 activas | códigos preservados; etiquetas mixtas no mapeadas | `CONTRACT_CORPUS_REPLAYED` |
| `DNT002-R11` | nombres y sufijos legales | 6 sufijos; 92 valores escritos observados | valores completos preservados; sin equivalencias | `CONTRACT_CORPUS_REPLAYED` |
| `DNT002-R12` | diccionario `maiz -> maíz` | corpus contractual y grupos auditados | salida correcta en contexto elegible; filas modificables no demostrables | `BLOCKED_MISSING_COORDINATE` |
| `DNT002-R13` | diccionario `clasico -> clásico` | corpus contractual | salida contractual reconciliada; sin universo masivo identificado | `CONTRACT_CORPUS_REPLAYED` |
| `DNT002-R14` | diccionario `frio -> frío` | corpus contractual y grupos auditados | salida correcta en contexto elegible; identidad separada | `BLOCKED_MISSING_COORDINATE` |
| `DNT002-R15` | exclusión `expresso` | corpus contractual | valor preservado y enviado a revisión | `BLOCKED_HUMAN_REVIEW` |
| `DNT002-R16` | `SEARCH_FORM_KEY` | proxy `LOWER_TRIM` y `_vento_norm` sobre 4.030 filas | cobertura histórica parcial; no equivale al algoritmo objetivo completo | `DEFERRED_PHYSICAL_EXECUTION` |
| `DNT002-R17` | `SEARCH_ACCENT_KEY` `es-CO` | 4.030 filas | 27 grupos y 54 filas; 17 grupos solo activos | `HANDOFF_DNT003` |
| `DNT002-R18` | token, frase y prefijo controlado | corpus de búsqueda | casos normativos reconciliados; sin índice o motor objetivo | `DEFERRED_PHYSICAL_EXECUTION` |
| `DNT002-R19` | aliases aprobados | catálogo físico no materializado al corte | no se crean aliases desde variantes observadas | `BLOCKED_MISSING_COORDINATE` |
| `DNT002-R20` | transliteración | política `es-CO@1.0.0` | sin salida; capacidad deshabilitada por defecto | `DISABLED_BY_POLICY` |
| `DNT002-R21` | similitud difusa | política `es-CO@1.0.0` | sin salida; candidato difuso deshabilitado | `DISABLED_BY_POLICY` |
| `DNT002-R22` | componentes estructurados | 2.312 perfiles/políticas; 86 grupos; 186 registros | etiquetas iguales no colapsan estructura | `HANDOFF_DNT003` |
| `DNT002-R23` | texto libre | diagnóstico visible y corpus | preservar autoría; sin identidad ni corrección genérica | `BLOCKED_MISSING_COORDINATE` |
| `DNT002-R24` | externos, históricos, evidencia y secretos | clases protegidas | preservación exacta; ninguna derivación destructiva | `CONTRACT_CORPUS_REPLAYED` |
| `DNT002-R25` | pipeline de candidatos de doce etapas | corpus de 1.753 y comparación de 4.030 filas | candidatos reproducidos como señales; sin consolidación | `HANDOFF_DNT003` |

#### 8. Resultado cuantitativo de forma visible

| Señal | Resultado |
| --- | ---: |
| espacios iniciales o finales | 4 |
| espacios o separadores repetidos | 32 |
| espacios Unicode no estándar | 0 |
| caracteres invisibles | 0 |
| valores fuera de NFC | 0 |
| completamente en mayúsculas | 246 |
| completamente en minúsculas | 17 |
| mezcla de mayúsculas y minúsculas | 5.428 |
| espacio antes de puntuación | 1 |
| puntuación sin separación posterior | 9 |

Los 246 valores en mayúsculas y 17 en minúsculas no son 263 errores. Incluyen potencialmente marcas, siglas, unidades, razones legales, códigos y decisiones válidas. Por eso `DNT002-R06` no produce una lista de backfill.

#### 9. Resultado de agrupaciones de forma

| Agrupación analítica | Grupos | Disposición |
| --- | ---: | --- |
| caja o espacios | 23 | señal para revisar fuente, clase y scope |
| tildes o diacríticos | 4 | candidato de diccionario o búsqueda; nunca corrección implícita |
| signos o separación | 3 | revisión estructural o contextual |
| conjunciones `&`, `y`, `e` | 0 | `NO_OBSERVATION_IN_CUT` |
| omisión de artículos o preposiciones | 0 | `NO_OBSERVATION_IN_CUT` |

Los grupos pueden solaparse. No se suman como 30 duplicados ni como 30 correcciones.

#### 10. Resultado de búsqueda y comparación

| Representación histórica | Grupos | Filas | Relación con el objetivo |
| --- | ---: | ---: | --- |
| `LOWER_TRIM` | 26 | 52 | proxy parcial de forma; no incluye todo `SEARCH_FORM_KEY` |
| `ACCENT_INSENSITIVE` | 27 | 54 | evidencia principal para `SEARCH_ACCENT_KEY` y handoff a 003 |
| `_vento_slugify` | 26 | 52 | helper legacy; no define identidad objetivo |
| `_navigation_slugify` | 27 | 54 | helper legacy incompatible; no define identidad objetivo |

Sobre 4.030 filas:

- `_vento_slugify` y `_navigation_slugify` produjeron diferencias exactas en 2.730 filas (67,74 %);
- persistieron diferencias semánticas en 324 filas (8,04 %) aun ignorando `-` frente a `_`;
- 17 de los 27 grupos sin tildes contienen exclusivamente filas activas.

Estas cifras son resultados reales del corte histórico. La 002 no decide cuál helper sobrevive, no crea un algoritmo nuevo y no clasifica los 27 grupos.

#### 11. Handoff de candidatos por familia

| Familia | Resultado del dry-run | Handoff obligatorio |
| --- | --- | --- |
| productos | 1 grupo de 2 filas activas bajo comparación sin tildes | `DATA-NORM-TRANS-003`; revisar identidad y 66 FK entrantes potenciales |
| perfiles UOM | 16 grupos, 32 filas activas; 14 con estructura diferente | `DATA-NORM-TRANS-003`; prohibir identidad por etiqueta |
| catálogo PASS | 8 grupos, 16 filas; una activa y una inactiva por grupo | `DATA-NORM-TRANS-003`; conservar códigos, vigencia e historia |
| políticas de solicitud | 2 grupos, 4 filas; ciclo actual e histórico | `DATA-NORM-TRANS-003`; separar lifecycle de duplicidad |
| posiciones de inventario | 72 registros `Nivel 1` a `Nivel 6` | `DATA-NORM-TRANS-003`; preservar padre, camino y código |
| personas | 106 registros y 24 grupos por nombre | `DATA-NORM-TRANS-003`; nombre no constituye identidad |
| categorías de remisión | dos valores activos `VÍVERES & BODEGA PRINCIPAL` en el corte amplio | `DATA-NORM-TRANS-003`; analizar scope, relaciones y enrutamiento |

No se asigna aquí ninguna de las diez clases de colisión de `DATA-NORM-ARC-010`; esa clasificación pertenece a `DATA-NORM-TRANS-003`.

#### 12. Ejecución analítica del pipeline de doce etapas

| Etapa | Ejecución sobre el baseline | Resultado |
| ---: | --- | --- |
| 1 | finalidad limitada a análisis preimplementación; sin actor de mutación | `PASS_ANALYTICAL_ONLY` |
| 2 | dominios y 12 entidades heredados de U01–U12 | `PASS_WITH_PROVISIONAL_SCOPES` |
| 3 | versiones `ARC-003` a `010` y baseline fijadas | `PASS_VERSION_SET_FIXED` |
| 4 | coordenadas completas solo donde la auditoría las demuestra | `BLOCK_PARTIAL_COORDINATES` |
| 5 | scope, estado y vigencia aplicados según cada corte histórico | `PASS_HISTORICAL_SCOPE` |
| 6 | identificadores y referencias se preservan; no se deduce identidad desde texto | `PASS_NO_TEXT_IDENTITY` |
| 7 | estructuras UOM, jerarquías, catálogos y ciclos se separan | `PASS_STRUCTURAL_GUARD` |
| 8 | candidatos generados por forma, tildes y helpers históricos | `PASS_CANDIDATES_GENERATED` |
| 9 | grupos conservan scope y razones; no se aplica transitividad A-B-C | `PASS_GROUPS_NOT_IDENTITIES` |
| 10 | se enlazan relaciones, actividad, estructura, historia y evidencia negativa disponible | `PASS_WITH_KNOWN_EVIDENCE_GAPS` |
| 11 | candidatos se entregan a `DATA-NORM-TRANS-003`; no se clasifican aquí | `HANDOFF_DNT003` |
| 12 | disposición global sin consolidación ni escritura | `CANDIDATE_ONLY_NO_MUTATION` |

El pipeline se considera ejecutado analíticamente porque cada etapa tiene entrada, salida y bloqueo explícitos. No se presenta como ejecución del motor físico pendiente de BLOQUE R.

#### 13. Reproducibilidad y replay

| Evidencia | Nivel alcanzable en esta tarea | Motivo |
| --- | --- | --- |
| tablas normativas de 89 escenarios | `FULL_REPLAYABLE` contractual | entrada, contexto y salida esperada están en documentos versionados |
| agregados de auditoría | `DECISION_RECONSTRUCTABLE` | se preservan cortes, conteos, scopes y ejemplos, no el corpus íntegro en Git |
| valores sensibles o personales | `REFERENCE_REPLAYABLE` o `DECISION_RECONSTRUCTABLE` futuro | no deben copiarse al documento canónico |
| motor SQL/RPC objetivo | `NOT_IMPLEMENTED` | pertenece a `DATA-NORM-DB-001` a `004` |

Repetir este dry-run documental sobre las mismas fuentes y versiones deberá producir las mismas 25 disposiciones, 89 reconciliaciones y cifras históricas. Una diferencia se clasifica como cambio de fuente documental, versión, baseline o defecto de reconciliación; no se corrige editando evidencia histórica.

#### 14. Preservación de casos, ocurrencias e historia

Al corte aprobado no existe cola transversal físicamente materializada. Por ello:

1. los grupos auditados no se convierten en `review_case_key`;
2. dos ocurrencias con distinto dominio, campo, clase, fuente, locale, versión o acción permanecen separadas;
3. una muestra o ejemplo no aprueba otras filas;
4. los estados activo/inactivo observados no se reinterpretan como `ACTIVE`, `SUSPENDED` o `RETIRED` de catálogos futuros;
5. no se autoaprueban candidatos por coincidencia con una entrada del corpus;
6. evidencia, relaciones, SLA y decisiones inexistentes no se inventan;
7. toda materialización futura deberá migrar o vincular evidencia sin perder procedencia.

#### 15. Privacidad, seguridad y frontera VITAL

- El documento conserva conteos, ejemplos ya aprobados y resultados agregados.
- No contiene dump de producción, correos, teléfonos, documentos, secretos, firmas, tokens ni payloads completos.
- Personas, direcciones, nombres legales y externos permanecen bajo finalidad y scope restringidos.
- La ausencia de una salida visible no permite consultar datos sensibles con mayor privilegio.
- No se crea vista, RPC o función `SECURITY DEFINER` para el dry-run.
- No se cambia exposición Data API, grants o RLS.
- VITAL queda excluido de las 25 unidades y de todos los grupos de transición; su coexistencia solo conserva prueba de no intervención.

La guía oficial vigente de Supabase mantiene los cambios de base dentro de migraciones locales versionadas antes del despliegue; este dry-run no crea cambios que deban migrarse. La ejecución física posterior deberá seguir ese flujo desde `vento-shell`.

#### 16. Puerta de salida hacia `DATA-NORM-TRANS-003`

La 002 queda documentalmente completa únicamente si:

1. baseline, versiones, fecha y fronteras permanecen identificados;
2. las cinco cargas históricas conservan cobertura sin sumar poblaciones solapadas;
3. los 89 escenarios están reconciliados sin llamarlos prueba de motor físico;
4. las 25 unidades tienen resultado y estado final;
5. las 18 entradas de conectores, 28 excepciones activas y 3 reglas de diccionario están cubiertas;
6. reglas sin coordenada se bloquean y capacidades deshabilitadas no producen salida;
7. los resultados cuantitativos coinciden con las auditorías aprobadas;
8. las doce etapas del pipeline tienen salida explícita y no aplican transitividad;
9. grupos y señales se transfieren a 003 sin clasificarlos como duplicados;
10. casos, ocurrencias, historia y evidencia no se autoaprueban ni colapsan;
11. `TREQ-DATA-116`, `122`, `159` y `171` tienen cobertura material;
12. no se ejecutó DDL, DML, consulta remota nueva, dry-run físico o modificación de VITAL;
13. implementación, recaptura y pruebas físicas permanecen asignadas a BLOQUE R;
14. `DATA-NORM-TRANS-003` continúa reservada hasta aprobación explícita del usuario.

#### 17. Trazabilidad de requisitos

| Requisito | Cobertura material | Evidencia |
| --- | --- | --- |
| `TREQ-DATA-116` | agrupación exacta, separación de ocurrencias y prohibición de aprobar muestras no examinadas | secciones 11, 12 y 14 |
| `TREQ-DATA-122` | preservación de casos, decisiones, versiones, ocurrencias, SLA, evidencia y relaciones | secciones 11 y 14; salida sin mutación |
| `TREQ-DATA-159` | niveles de reproducibilidad, replay controlado y diferencias sin modificar producción | secciones 5 y 13 |
| `TREQ-DATA-171` | doce etapas, políticas, scope, corte, versiones, inclusiones, exclusiones y no transitividad | sección 12 |

No se crean TREQ adicionales: esta tarea materializa evidencia para cuatro requisitos vigentes.

#### 18. Límites y propiedad posterior

Esta tarea no:

- identifica ni clasifica formalmente colisiones; lo hará `DATA-NORM-TRANS-003`;
- decide duplicados, sobrevivientes o reasignación de relaciones; lo hará `DATA-NORM-TRANS-004`;
- define o ejecuta lotes de backfill; pertenece a `DATA-NORM-TRANS-005` y BLOQUE R;
- activa reglas sobre writers; pertenece a `DATA-NORM-TRANS-006` y BLOQUE R;
- valida un estado posterior a backfill; pertenece a `DATA-NORM-TRANS-007` y BLOQUE R;
- ejecuta rollback; `DATA-NORM-TRANS-008` define su contrato y BLOQUE R lo implementa;
- aprueba candidatos por dominio; pertenece a `DATA-NORM-TRANS-009`;
- implementa funciones, catálogos, índices o motor de búsqueda;
- certifica paridad local, staging o producción;
- crea datos de prueba productivos ni copia datos sensibles a Git.

#### 19. Referencias técnicas vigentes

| Fuente | Uso limitado |
| --- | --- |
| [Supabase — Local development with schema migrations](https://supabase.com/docs/guides/local-development/overview) | reservar cambios físicos a migraciones versionadas y pruebas locales posteriores |
| [Supabase — Database migrations](https://supabase.com/docs/guides/local-development/database-migrations) | impedir cambios remotos directos fuera del flujo propietario |
| [Supabase — Restoring a downloaded backup locally](https://supabase.com/docs/guides/local-development/restoring-downloaded-backup) | reconocer que una restauración local futura puede servir para inspección controlada sin convertirla en producción |

No se identificó en el changelog de cambios incompatibles una modificación aplicable a este dry-run documental de solo lectura. Las referencias deberán verificarse nuevamente antes de implementar el motor físico.

#### 20. Criterios de aceptación documental

- [x] existe un `dry_run_id` vinculado al baseline aprobado;
- [x] se distinguen ejecución histórica, replay contractual, bloqueo, deshabilitación y diferimiento físico;
- [x] cinco workloads y 25 unidades tienen resultados materiales;
- [x] 89 escenarios normativos quedaron reconciliados;
- [x] catálogos atómicos y diccionario tienen cobertura explícita;
- [x] cifras de forma, búsqueda, divergencia y candidatos coinciden con auditorías aprobadas;
- [x] las doce etapas de detección tienen resultado y bloqueo explícitos;
- [x] colisiones y duplicados no se deciden en esta tarea;
- [x] se preservan casos, ocurrencias, historia, privacidad y VITAL;
- [x] los cuatro TREQ directos tienen trazabilidad;
- [x] no se ejecutó motor físico, consulta remota nueva, DDL, DML o migración;
- [x] `DATA-NORM-TRANS-003` permanece reservada.

#### 21. Continuidad

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-002 — Ejecutar dry-run de cada regla de normalización
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-003 — Identificar colisiones producidas por valores normalizados
```
