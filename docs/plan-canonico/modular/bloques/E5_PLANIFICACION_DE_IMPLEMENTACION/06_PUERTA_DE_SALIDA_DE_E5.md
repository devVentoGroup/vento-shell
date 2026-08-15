### PUERTA DE SALIDA DE E5

### ✅ E5-GATE-001 — Confirmar que cada capacidad priorizada tiene paquete aprobado

**Estado:** APROBADA
**Tarea anterior:** `HYPERCARE-OPS-010 — Definir autoridad y evidencia para aprobar cierre funcional, técnico y operativo`
**Tarea siguiente:** `E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino`
**Tipo de tarea:** documental — puerta de salida de E5 para reconciliar, identidad por identidad, las subcapacidades priorizadas de `CAP-COVER-011` con los paquetes materializados en `DELIV-PKG-001..025`, distinguiendo existencia de vínculo, cobertura por paquete y decisión final de autorización física; sin crear, fusionar, dividir, aprobar ni ejecutar paquetes, sin alterar prioridades, brechas, requisitos, readiness, cutover, hypercare, código, migraciones, datos ni operaciones sobre Supabase
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`E5-GATE-001` verifica si el universo priorizado aprobado en E1 posee cobertura documental por paquetes de implementación y si esos paquetes cuentan con la decisión final que permite considerarlos aprobados para implementación física.

La comprobación conserva tres hechos separados:

```text
SUBCAPACIDAD PRIORIZADA
→ identidad aprobada por CAP-COVER-011

VÍNCULO A PAQUETE
→ membresía explícita en el mapa de capacidades de DELIV-PKG-003

PAQUETE APROBADO
→ decisión APROBADO_PARA_IMPLEMENTACION_FISICA de DELIV-PKG-025
```

La existencia de un `GAP-PKG-*`, la aprobación documental de una tarea `DELIV-PKG-*` o la presencia de una capacidad en una familia no sustituyen la decisión final del expediente del paquete.

---

#### 2. Resultado de la comprobación

La puerta consume las **217 subcapacidades** que `CAP-COVER-011` declara expresamente como unidad priorizada y las confronta con el universo vigente de **207 paquetes**.

| Métrica                                                                        | Resultado |
| ------------------------------------------------------------------------------ | --------: |
| subcapacidades priorizadas evaluadas                                           |   **217** |
| familias canónicas evaluadas                                                   |    **18** |
| subcapacidades con al menos un vínculo explícito a paquete                     |   **156** |
| subcapacidades sin vínculo explícito a paquete                                 |    **61** |
| vínculos explícitos capacidad ↔ paquete reconciliados                          |   **425** |
| paquetes distintos presentes en esos vínculos                                  |   **207** |
| paquetes con decisión `APROBADO_PARA_IMPLEMENTACION_FISICA` en `DELIV-PKG-025` | **0/207** |
| subcapacidades que pueden confirmarse actualmente con paquete aprobado         | **0/217** |

**Conclusión:** la condición exigida por `E5-GATE-001` **no está satisfecha** en el corte canónico actual.

Existen dos causas distintas y no intercambiables:

1. **61 subcapacidades priorizadas no tienen vínculo explícito a ningún `GAP-PKG-*`** en el mapa de capacidades de `DELIV-PKG-003`;
2. las **156 subcapacidades que sí tienen uno o más paquetes vinculados** continúan sin un paquete aprobado para implementación física porque `DELIV-PKG-025` mantiene los **207/207** expedientes en `BLOQUEADO`.

La puerta no corrige ninguno de esos hechos por inferencia.

---

#### 3. Fuentes canónicas y precedencia

La comprobación utiliza, sin redefinirlas:

- `CAP-COVER-011` como fuente del universo priorizado de **217 subcapacidades** y sus clases `P0`, `P1`, `P2`, `P3`, `P4` y `DEFERRED`;
- `CAP-COVER-012` como matriz aprobada de **217 registros** de cobertura capacidad × proceso × aplicación × implementación;
- `DELIV-PKG-001` como inventario estable de raíces de paquete `GAP-PKG-001..207`;
- `DELIV-PKG-002` como reconciliación del universo vigente de **207 paquetes / 820 brechas**;
- `DELIV-PKG-003` como fuente de los conjuntos de capacidades explícitamente vinculados a cada paquete;
- `DELIV-PKG-024` como cierre de pendientes documentales del dossier previo a la decisión final;
- `DELIV-PKG-025` como fuente de la decisión final de cada expediente de paquete;
- los principios de E5, que prohíben confundir planificación documental con implementación física;
- `E5-GATE-008` como puerta posterior de entrada a implementación física por `package_id`, sin adelantarla desde 001.

Precedencia:

```text
CAP-COVER-011
→ CAP-COVER-012
→ DELIV-PKG-001..003
→ DELIV-PKG-024
→ DELIV-PKG-025
→ E5-GATE-001
```

Una referencia posterior no puede borrar una identidad priorizada anterior ni promover un paquete bloqueado a aprobado.

---

#### 4. Unidad mínima de verificación

La unidad mínima es cada `capability_id` exacto de `CAP-COVER-011`.

Para cada una de las 217 identidades se verifica:

1. que la identidad continúe existiendo en el universo priorizado;
2. que exista o no exista un vínculo explícito a uno o más `GAP-PKG-*`;
3. que ningún vínculo se infiera por familia, dominio, proceso, aplicación o similitud semántica;
4. que la decisión del paquete se tome exclusivamente de `DELIV-PKG-025`;
5. que una capacidad con varios paquetes conserve todos sus vínculos y no se reduzca a un paquete sintético;
6. que un paquete `BLOQUEADO` no se contabilice como aprobado;
7. que una ausencia de paquete permanezca visible hasta que exista una fuente canónica que la resuelva o la excluya expresamente de esta puerta.

No se encontró en las fuentes consumidas una exclusión aprobada que permita considerar satisfecha `E5-GATE-001` para una subcapacidad priorizada sin paquete.

---

#### 5. Regla de aprobación de paquete

Para esta puerta, un paquete solo cuenta como aprobado cuando su expediente tenga en `DELIV-PKG-025` la decisión:

`APROBADO_PARA_IMPLEMENTACION_FISICA`

No equivalen a esa decisión:

- que exista el identificador `GAP-PKG-*`;
- que las tareas `DELIV-PKG-*` estén documentalmente aprobadas;
- que el dossier esté completo;
- que el paquete tenga owner, repositorio, pruebas o planes definidos;
- que una dependencia esté controlada;
- que readiness, cutover, piloto o hypercare estén diseñados;
- que un gate futuro todavía pueda llegar a cumplirse.

`DELIV-PKG-025` conserva actualmente **0/207** paquetes con esa autorización y **207/207** en `BLOQUEADO`; por ello ninguna subcapacidad puede pasar esta comprobación en el corte actual.

---

#### 6. Reconciliación por familia

| Familia   | Priorizadas | Con paquete | Sin paquete | Vínculos paquete |
| --------- | ----------: | ----------: | ----------: | ---------------: |
| `CAP-01`  |          10 |          10 |           0 |               47 |
| `CAP-02`  |          13 |          10 |           3 |               31 |
| `CAP-03`  |          10 |           6 |           4 |                8 |
| `CAP-04`  |          10 |           6 |           4 |               20 |
| `CAP-05`  |          12 |           4 |           8 |                7 |
| `CAP-06`  |          15 |          10 |           5 |               33 |
| `CAP-07`  |          13 |           9 |           4 |               20 |
| `CAP-08`  |          14 |          11 |           3 |               15 |
| `CAP-09`  |          15 |          15 |           0 |               26 |
| `CAP-10`  |          10 |           9 |           1 |               27 |
| `CAP-11`  |          12 |          10 |           2 |               18 |
| `CAP-12`  |          15 |           8 |           7 |               18 |
| `CAP-13`  |          11 |           7 |           4 |               14 |
| `CAP-14`  |          11 |           5 |           6 |               16 |
| `CAP-15`  |          11 |          11 |           0 |               60 |
| `CAP-16`  |          11 |          10 |           1 |               27 |
| `CAP-17`  |          12 |           6 |           6 |               20 |
| `CAP-18`  |          12 |           9 |           3 |               18 |
| **Total** |     **217** |     **156** |      **61** |          **425** |

La distribución anterior es una reconciliación derivada de identidades y vínculos explícitos; no sustituye los conteos fuente de `CAP-COVER-011` ni de `DELIV-PKG-001..003`.

---

#### 7. Matriz materializada de las 217 subcapacidades priorizadas

Cada identidad aparece exactamente una vez. `0/N` indica que ninguno de los `N` paquetes vinculados posee actualmente la decisión `APROBADO_PARA_IMPLEMENTACION_FISICA`.

| `capability_id` | Paquetes vinculados en `DELIV-PKG-003`                                                                                                                                                                                                                                       | Paquetes aprobados según `DELIV-PKG-025` | Comprobación E5-GATE-001                                    |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------: | ----------------------------------------------------------- |
| `CAP-01.01`     | `GAP-PKG-011`, `GAP-PKG-095`, `GAP-PKG-158`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-01.02`     | `GAP-PKG-031`, `GAP-PKG-065`, `GAP-PKG-094`, `GAP-PKG-131`, `GAP-PKG-191`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-01.03`     | `GAP-PKG-011`, `GAP-PKG-027`, `GAP-PKG-028`, `GAP-PKG-031`, `GAP-PKG-085`, `GAP-PKG-094`, `GAP-PKG-131`                                                                                                                                                                      |                                  **0/7** | NO — 7 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-01.04`     | `GAP-PKG-028`, `GAP-PKG-031`, `GAP-PKG-055`, `GAP-PKG-065`, `GAP-PKG-082`, `GAP-PKG-091`, `GAP-PKG-092`, `GAP-PKG-095`, `GAP-PKG-131`, `GAP-PKG-150`, `GAP-PKG-157`                                                                                                          |                                 **0/11** | NO — 11 paquetes vinculados, todos con decisión `BLOQUEADO` |
| `CAP-01.05`     | `GAP-PKG-010`, `GAP-PKG-027`, `GAP-PKG-031`, `GAP-PKG-077`, `GAP-PKG-095`, `GAP-PKG-191`                                                                                                                                                                                     |                                  **0/6** | NO — 6 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-01.06`     | `GAP-PKG-094`, `GAP-PKG-131`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-01.07`     | `GAP-PKG-031`, `GAP-PKG-055`, `GAP-PKG-095`, `GAP-PKG-131`, `GAP-PKG-202`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-01.08`     | `GAP-PKG-031`, `GAP-PKG-055`, `GAP-PKG-065`, `GAP-PKG-094`, `GAP-PKG-095`, `GAP-PKG-131`                                                                                                                                                                                     |                                  **0/6** | NO — 6 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-01.09`     | `GAP-PKG-203`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-01.10`     | `GAP-PKG-055`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-02.01`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-02.02`     | `GAP-PKG-064`, `GAP-PKG-096`, `GAP-PKG-127`, `GAP-PKG-132`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-02.03`     | `GAP-PKG-032`, `GAP-PKG-056`, `GAP-PKG-160`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-02.04`     | `GAP-PKG-127`, `GAP-PKG-196`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-02.05`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-02.06`     | `GAP-PKG-001`, `GAP-PKG-063`, `GAP-PKG-127`, `GAP-PKG-132`, `GAP-PKG-151`, `GAP-PKG-174`                                                                                                                                                                                     |                                  **0/6** | NO — 6 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-02.07`     | `GAP-PKG-066`, `GAP-PKG-097`, `GAP-PKG-127`, `GAP-PKG-132`, `GAP-PKG-174`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-02.08`     | `GAP-PKG-096`, `GAP-PKG-097`, `GAP-PKG-132`, `GAP-PKG-174`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-02.09`     | `GAP-PKG-174`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-02.10`     | `GAP-PKG-097`, `GAP-PKG-174`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-02.11`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-02.12`     | `GAP-PKG-159`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-02.13`     | `GAP-PKG-012`, `GAP-PKG-056`, `GAP-PKG-096`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-03.01`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-03.02`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-03.03`     | `GAP-PKG-062`, `GAP-PKG-098`, `GAP-PKG-204`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-03.04`     | `GAP-PKG-057`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-03.05`     | `GAP-PKG-171`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-03.06`     | `GAP-PKG-098`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-03.07`     | `GAP-PKG-171`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-03.08`     | `GAP-PKG-062`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-03.09`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-03.10`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-04.01`     | `GAP-PKG-013`, `GAP-PKG-033`, `GAP-PKG-034`, `GAP-PKG-067`, `GAP-PKG-086`, `GAP-PKG-100`, `GAP-PKG-101`, `GAP-PKG-133`, `GAP-PKG-178`, `GAP-PKG-197`                                                                                                                         |                                 **0/10** | NO — 10 paquetes vinculados, todos con decisión `BLOQUEADO` |
| `CAP-04.02`     | `GAP-PKG-100`, `GAP-PKG-133`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-04.03`     | `GAP-PKG-034`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-04.04`     | `GAP-PKG-034`, `GAP-PKG-099`, `GAP-PKG-100`, `GAP-PKG-197`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-04.05`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-04.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-04.07`     | `GAP-PKG-033`, `GAP-PKG-133`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-04.08`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-04.09`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-04.10`     | `GAP-PKG-100`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-05.01`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-05.02`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-05.03`     | `GAP-PKG-014`, `GAP-PKG-036`, `GAP-PKG-103`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-05.04`     | `GAP-PKG-102`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-05.05`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-05.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-05.07`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-05.08`     | `GAP-PKG-035`, `GAP-PKG-102`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-05.09`     | `GAP-PKG-102`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-05.10`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-05.11`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-05.12`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-06.01`     | `GAP-PKG-037`, `GAP-PKG-038`, `GAP-PKG-068`, `GAP-PKG-083`, `GAP-PKG-104`, `GAP-PKG-128`, `GAP-PKG-134`, `GAP-PKG-179`, `GAP-PKG-198`                                                                                                                                        |                                  **0/9** | NO — 9 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-06.02`     | `GAP-PKG-037`, `GAP-PKG-038`, `GAP-PKG-104`, `GAP-PKG-105`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-06.03`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-06.04`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-06.05`     | `GAP-PKG-015`, `GAP-PKG-038`, `GAP-PKG-104`, `GAP-PKG-105`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-06.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-06.07`     | `GAP-PKG-037`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-06.08`     | `GAP-PKG-093`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-06.09`     | `GAP-PKG-037`, `GAP-PKG-104`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-06.10`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-06.11`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-06.12`     | `GAP-PKG-037`, `GAP-PKG-068`, `GAP-PKG-104`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-06.13`     | `GAP-PKG-068`, `GAP-PKG-083`, `GAP-PKG-104`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-06.14`     | `GAP-PKG-037`, `GAP-PKG-038`, `GAP-PKG-087`, `GAP-PKG-104`, `GAP-PKG-144`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-06.15`     | `GAP-PKG-038`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-07.01`     | `GAP-PKG-016`, `GAP-PKG-029`, `GAP-PKG-039`, `GAP-PKG-106`, `GAP-PKG-107`, `GAP-PKG-108`, `GAP-PKG-135`, `GAP-PKG-180`, `GAP-PKG-199`                                                                                                                                        |                                  **0/9** | NO — 9 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-07.02`     | `GAP-PKG-107`, `GAP-PKG-108`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-07.03`     | `GAP-PKG-108`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-07.04`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-07.05`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-07.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-07.07`     | `GAP-PKG-107`, `GAP-PKG-108`, `GAP-PKG-126`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-07.08`     | `GAP-PKG-107`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-07.09`     | `GAP-PKG-107`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-07.10`     | `GAP-PKG-108`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-07.11`     | `GAP-PKG-107`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-07.12`     | `GAP-PKG-108`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-07.13`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-08.01`     | `GAP-PKG-040`, `GAP-PKG-109`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-08.02`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-08.03`     | `GAP-PKG-040`, `GAP-PKG-161`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-08.04`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-08.05`     | `GAP-PKG-109`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-08.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-08.07`     | `GAP-PKG-040`, `GAP-PKG-109`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-08.08`     | `GAP-PKG-109`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-08.09`     | `GAP-PKG-109`, `GAP-PKG-136`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-08.10`     | `GAP-PKG-109`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-08.11`     | `GAP-PKG-109`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-08.12`     | `GAP-PKG-109`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-08.13`     | `GAP-PKG-109`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-08.14`     | `GAP-PKG-109`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.01`     | `GAP-PKG-110`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.02`     | `GAP-PKG-110`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.03`     | `GAP-PKG-110`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.04`     | `GAP-PKG-137`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.05`     | `GAP-PKG-110`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.06`     | `GAP-PKG-041`, `GAP-PKG-110`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-09.07`     | `GAP-PKG-110`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.08`     | `GAP-PKG-041`, `GAP-PKG-110`, `GAP-PKG-137`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-09.09`     | `GAP-PKG-041`, `GAP-PKG-069`, `GAP-PKG-088`, `GAP-PKG-110`, `GAP-PKG-137`, `GAP-PKG-175`                                                                                                                                                                                     |                                  **0/6** | NO — 6 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-09.10`     | `GAP-PKG-088`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.11`     | `GAP-PKG-069`, `GAP-PKG-110`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-09.12`     | `GAP-PKG-110`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-09.13`     | `GAP-PKG-041`, `GAP-PKG-162`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-09.14`     | `GAP-PKG-006`, `GAP-PKG-078`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-09.15`     | `GAP-PKG-041`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-10.01`     | `GAP-PKG-007`, `GAP-PKG-070`, `GAP-PKG-079`, `GAP-PKG-138`, `GAP-PKG-145`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-10.02`     | `GAP-PKG-058`, `GAP-PKG-145`, `GAP-PKG-195`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-10.03`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-10.04`     | `GAP-PKG-146`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-10.05`     | `GAP-PKG-111`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-10.06`     | `GAP-PKG-070`, `GAP-PKG-205`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-10.07`     | `GAP-PKG-002`, `GAP-PKG-017`, `GAP-PKG-042`, `GAP-PKG-058`, `GAP-PKG-070`, `GAP-PKG-079`, `GAP-PKG-111`, `GAP-PKG-138`, `GAP-PKG-152`                                                                                                                                        |                                  **0/9** | NO — 9 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-10.08`     | `GAP-PKG-043`, `GAP-PKG-079`, `GAP-PKG-192`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-10.09`     | `GAP-PKG-042`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-10.10`     | `GAP-PKG-002`, `GAP-PKG-058`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-11.01`     | `GAP-PKG-044`, `GAP-PKG-112`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-11.02`     | `GAP-PKG-112`, `GAP-PKG-113`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-11.03`     | `GAP-PKG-112`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-11.04`     | `GAP-PKG-071`, `GAP-PKG-113`, `GAP-PKG-163`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-11.05`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-11.06`     | `GAP-PKG-044`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-11.07`     | `GAP-PKG-112`, `GAP-PKG-113`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-11.08`     | `GAP-PKG-071`, `GAP-PKG-112`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-11.09`     | `GAP-PKG-044`, `GAP-PKG-112`, `GAP-PKG-113`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-11.10`     | `GAP-PKG-044`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-11.11`     | `GAP-PKG-163`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-11.12`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.01`     | `GAP-PKG-025`, `GAP-PKG-089`, `GAP-PKG-155`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-12.02`     | `GAP-PKG-024`, `GAP-PKG-089`, `GAP-PKG-114`, `GAP-PKG-139`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-12.03`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.04`     | `GAP-PKG-089`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-12.05`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.07`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.08`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.09`     | `GAP-PKG-089`, `GAP-PKG-114`, `GAP-PKG-139`, `GAP-PKG-155`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-12.10`     | `GAP-PKG-045`, `GAP-PKG-089`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-12.11`     | `GAP-PKG-206`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-12.12`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.13`     | `GAP-PKG-024`, `GAP-PKG-089`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-12.14`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-12.15`     | `GAP-PKG-155`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-13.01`     | `GAP-PKG-046`, `GAP-PKG-047`, `GAP-PKG-115`, `GAP-PKG-116`, `GAP-PKG-181`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-13.02`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-13.03`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-13.04`     | `GAP-PKG-115`, `GAP-PKG-116`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-13.05`     | `GAP-PKG-116`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-13.06`     | `GAP-PKG-116`, `GAP-PKG-164`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-13.07`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-13.08`     | `GAP-PKG-046`, `GAP-PKG-116`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-13.09`     | `GAP-PKG-116`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-13.10`     | `GAP-PKG-116`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-13.11`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-14.01`     | `GAP-PKG-059`, `GAP-PKG-147`, `GAP-PKG-187`, `GAP-PKG-188`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-14.02`     | `GAP-PKG-118`, `GAP-PKG-147`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-14.03`     | `GAP-PKG-117`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-14.04`     | `GAP-PKG-003`, `GAP-PKG-048`, `GAP-PKG-117`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-14.05`     | `GAP-PKG-008`, `GAP-PKG-080`, `GAP-PKG-081`, `GAP-PKG-129`, `GAP-PKG-147`, `GAP-PKG-188`                                                                                                                                                                                     |                                  **0/6** | NO — 6 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-14.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-14.07`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-14.08`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-14.09`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-14.10`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-14.11`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-15.01`     | `GAP-PKG-004`, `GAP-PKG-018`, `GAP-PKG-019`, `GAP-PKG-049`, `GAP-PKG-050`, `GAP-PKG-060`, `GAP-PKG-073`, `GAP-PKG-090`, `GAP-PKG-119`, `GAP-PKG-120`, `GAP-PKG-140`, `GAP-PKG-149`, `GAP-PKG-153`, `GAP-PKG-156`, `GAP-PKG-166`, `GAP-PKG-182`, `GAP-PKG-185`, `GAP-PKG-189` |                                 **0/18** | NO — 18 paquetes vinculados, todos con decisión `BLOQUEADO` |
| `CAP-15.02`     | `GAP-PKG-060`, `GAP-PKG-119`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-15.03`     | `GAP-PKG-049`, `GAP-PKG-140`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-15.04`     | `GAP-PKG-140`, `GAP-PKG-165`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-15.05`     | `GAP-PKG-049`, `GAP-PKG-072`, `GAP-PKG-073`, `GAP-PKG-119`, `GAP-PKG-140`, `GAP-PKG-165`, `GAP-PKG-185`, `GAP-PKG-189`, `GAP-PKG-200`                                                                                                                                        |                                  **0/9** | NO — 9 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-15.06`     | `GAP-PKG-090`, `GAP-PKG-140`, `GAP-PKG-153`, `GAP-PKG-183`, `GAP-PKG-184`, `GAP-PKG-200`, `GAP-PKG-207`                                                                                                                                                                      |                                  **0/7** | NO — 7 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-15.07`     | `GAP-PKG-049`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-15.08`     | `GAP-PKG-019`, `GAP-PKG-026`, `GAP-PKG-049`, `GAP-PKG-120`, `GAP-PKG-172`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-15.09`     | `GAP-PKG-009`, `GAP-PKG-019`, `GAP-PKG-030`, `GAP-PKG-049`, `GAP-PKG-060`, `GAP-PKG-073`, `GAP-PKG-119`, `GAP-PKG-140`, `GAP-PKG-173`, `GAP-PKG-185`, `GAP-PKG-193`, `GAP-PKG-200`                                                                                           |                                 **0/12** | NO — 12 paquetes vinculados, todos con decisión `BLOQUEADO` |
| `CAP-15.10`     | `GAP-PKG-148`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-15.11`     | `GAP-PKG-130`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-16.01`     | `GAP-PKG-021`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-16.02`     | `GAP-PKG-021`, `GAP-PKG-167`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-16.03`     | `GAP-PKG-176`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-16.04`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-16.05`     | `GAP-PKG-021`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-16.06`     | `GAP-PKG-005`, `GAP-PKG-061`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-16.07`     | `GAP-PKG-005`, `GAP-PKG-020`, `GAP-PKG-021`, `GAP-PKG-051`, `GAP-PKG-074`, `GAP-PKG-121`, `GAP-PKG-122`, `GAP-PKG-141`, `GAP-PKG-177`, `GAP-PKG-186`, `GAP-PKG-201`                                                                                                          |                                 **0/11** | NO — 11 paquetes vinculados, todos con decisión `BLOQUEADO` |
| `CAP-16.08`     | `GAP-PKG-021`, `GAP-PKG-061`, `GAP-PKG-074`, `GAP-PKG-141`                                                                                                                                                                                                                   |                                  **0/4** | NO — 4 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-16.09`     | `GAP-PKG-021`, `GAP-PKG-121`, `GAP-PKG-141`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-16.10`     | `GAP-PKG-021`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-16.11`     | `GAP-PKG-061`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-17.01`     | `GAP-PKG-023`, `GAP-PKG-154`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-17.02`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-17.03`     | `GAP-PKG-022`, `GAP-PKG-023`, `GAP-PKG-075`, `GAP-PKG-154`, `GAP-PKG-190`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-17.04`     | `GAP-PKG-023`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-17.05`     | `GAP-PKG-123`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-17.06`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-17.07`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-17.08`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-17.09`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-17.10`     | `GAP-PKG-052`, `GAP-PKG-075`, `GAP-PKG-084`, `GAP-PKG-123`, `GAP-PKG-124`                                                                                                                                                                                                    |                                  **0/5** | NO — 5 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-17.11`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-17.12`     | `GAP-PKG-023`, `GAP-PKG-075`, `GAP-PKG-123`, `GAP-PKG-124`, `GAP-PKG-142`, `GAP-PKG-168`                                                                                                                                                                                     |                                  **0/6** | NO — 6 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-18.01`     | `GAP-PKG-053`, `GAP-PKG-170`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-18.02`     | `GAP-PKG-125`, `GAP-PKG-170`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-18.03`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-18.04`     | `GAP-PKG-053`, `GAP-PKG-125`, `GAP-PKG-170`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-18.05`     | `GAP-PKG-054`, `GAP-PKG-125`                                                                                                                                                                                                                                                 |                                  **0/2** | NO — 2 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-18.06`     | `GAP-PKG-125`, `GAP-PKG-169`, `GAP-PKG-194`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-18.07`     | `GAP-PKG-170`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-18.08`     | `GAP-PKG-076`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-18.09`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |
| `CAP-18.10`     | `GAP-PKG-194`                                                                                                                                                                                                                                                                |                                  **0/1** | NO — 1 paquete vinculado, todos con decisión `BLOQUEADO`    |
| `CAP-18.11`     | `GAP-PKG-076`, `GAP-PKG-143`, `GAP-PKG-194`                                                                                                                                                                                                                                  |                                  **0/3** | NO — 3 paquetes vinculados, todos con decisión `BLOQUEADO`  |
| `CAP-18.12`     | ninguno                                                                                                                                                                                                                                                                      |                                  **0/0** | NO — no existe paquete vinculado                            |

Reconciliación de la matriz:

- **217/217** identidades priorizadas materializadas;
- **217/217** identidades únicas;
- **156** con uno o más paquetes vinculados;
- **61** sin paquete vinculado;
- **425** vínculos explícitos capacidad ↔ paquete;
- unión de referencias de paquete: **207/207**, desde `GAP-PKG-001` hasta `GAP-PKG-207`;
- paquetes aprobados físicamente: **0/207**;
- subcapacidades confirmadas por esta puerta: **0/217**.

---

#### 8. Tratamiento de las 61 subcapacidades sin paquete

La ausencia de vínculo no se rellena usando el paquete de otra subcapacidad de la misma familia, un repositorio compartido, un proceso cercano, una aplicación propietaria o una coincidencia nominal.

Para estas 61 identidades, la fuente que deberá resolver el vínculo es el mapa de capacidades del dossier de paquetes materializado en `DELIV-PKG-003`, preservando la membresía real de brechas y sin crear paquetes sin brecha explícita.

Mientras no exista una resolución canónica:

- la subcapacidad permanece incluida en el universo de 217 priorizadas;
- no se considera cubierta por paquete para esta puerta;
- no se promueve automáticamente a un paquete existente;
- no se inventa una exclusión;
- no se altera su prioridad o estado de cobertura;
- `E5-GATE-001` no puede darse por satisfecha.

---

#### 9. Tratamiento de las 156 subcapacidades con paquete

Las 156 identidades con vínculos explícitos conservan sus **425 relaciones** con los 207 paquetes. Esa cobertura documental no basta para cerrar la puerta porque la decisión final de cada expediente permanece `BLOQUEADO` en `DELIV-PKG-025`.

La fuente que deberá cambiar antes de una revalidación positiva es la decisión canónica del expediente correspondiente en `DELIV-PKG-025`, una vez satisfechas las condiciones propietarias que permitan autorizar implementación física.

001 no modifica esas condiciones, no ejecuta readiness y no adelanta `E5-GATE-008::<package_id>`.

---

#### 10. Separación entre aprobación documental y resultado de la puerta

El estado `APROBADA` de esta tarea significa que el análisis, la matriz y la decisión documental de `E5-GATE-001` quedan aceptados como parte del plan canónico.

No significa que la condición evaluada haya pasado.

En el corte actual:

```text
E5-GATE-001 DOCUMENTADA Y APROBABLE
≠
CONDICIÓN E5-GATE-001 SATISFECHA
≠
PAQUETE AUTORIZADO PARA IMPLEMENTACIÓN FÍSICA
≠
E5-GATE-008::<package_id> APROBADA
```

Esta separación permite continuar diseñando las puertas `E5-GATE-002..008` sin falsear que E5 ya puede cerrarse o que algún paquete ya puede ejecutarse.

---

#### 11. Fronteras con las puertas siguientes

| Tarea         | Materia reservada                                                                                   |
| ------------- | --------------------------------------------------------------------------------------------------- |
| `E5-GATE-002` | confirmar que cada brecha crítica tiene propietario y destino                                       |
| `E5-GATE-003` | confirmar que los requisitos no funcionales están cubiertos                                         |
| `E5-GATE-004` | confirmar que rollout, rollback y contingencia son ejecutables                                      |
| `E5-GATE-005` | confirmar que el piloto tiene criterios medibles                                                    |
| `E5-GATE-006` | confirmar que capacitación y soporte están planificados                                             |
| `E5-GATE-007` | confirmar trazabilidad desde cada requisito `TREQ-*` hasta su prueba, paquete y evidencia de cierre |
| `E5-GATE-008` | aprobar entrada a implementación física por paquetes                                                |

001 no usa el resultado de ninguna de esas puertas futuras para corregir su propio hallazgo.

---

#### 12. Condiciones para una revalidación positiva de E5-GATE-001

La condición solo podrá considerarse satisfecha cuando una lectura canónica futura demuestre simultáneamente que:

1. las 217 identidades priorizadas continúan reconciliadas, salvo cambio canónico explícito en la fuente de priorización;
2. toda identidad incluida en la puerta tiene resolución explícita de paquete, sin inferencias ni omisiones;
3. los vínculos conservan la membresía real del dossier de paquetes;
4. no se pierde ninguna relación existente al resolver las 61 ausencias actuales;
5. los paquetes necesarios para la cobertura de cada subcapacidad poseen decisión final compatible con aprobación física en la fuente propietaria;
6. ninguna decisión `BLOQUEADO` se presenta como aprobación;
7. las identidades con múltiples paquetes conservan todos los expedientes necesarios para su alcance priorizado;
8. cualquier exclusión futura está explícitamente aprobada por una fuente canónica y no es inferida por 001.

---

#### 13. Separación entre planificación y ejecución

`E5-GATE-001` es exclusivamente documental.

No ejecuta ni autoriza:

- creación, fusión o división física de paquetes;
- implementación de código;
- despliegues;
- migraciones;
- DDL/DML;
- backfills;
- cambios de datos;
- cambios de configuración;
- cambios de permisos o RLS;
- ejecución de pruebas;
- readiness;
- cutover;
- piloto;
- hypercare;
- rollback o recovery;
- operaciones remotas sobre Supabase.

La autorización física permanece fuera de esta tarea.

---

#### 14. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Fragmentos 04A afectados:** 0

**Justificación:** `E5-GATE-001` verifica consistencia documental entre identidades priorizadas, membresía de paquetes y decisiones de aprobación ya existentes. No introduce comportamiento de runtime, regla empresarial ejecutable, transición de dominio, autorización nueva, cálculo, integración, persistencia, algoritmo, umbral NFR, recuperación ni mecanismo técnico que requiera un nuevo `TREQ-*`. Las faltas detectadas son de cobertura y decisión documental del dossier de paquetes, no requisitos de prueba nuevos.

---

#### 15. Criterios de aceptación documental

`E5-GATE-001` queda documentalmente completa cuando:

1. conserva `HYPERCARE-OPS-010 → E5-GATE-001 → E5-GATE-002`;
2. usa como universo de entrada las 217 subcapacidades priorizadas por `CAP-COVER-011`;
3. preserva las 18 familias y las 217 identidades sin renombrarlas;
4. cada `capability_id` aparece exactamente una vez en la matriz de la puerta;
5. la matriz diferencia capacidad sin paquete de capacidad con paquete bloqueado;
6. los vínculos a paquete provienen de `DELIV-PKG-003` y no de inferencias por familia, proceso, aplicación o repositorio;
7. la reconciliación conserva 156 identidades con paquete y 61 sin paquete;
8. la reconciliación conserva 425 vínculos explícitos capacidad ↔ paquete;
9. la unión de los vínculos preserva `GAP-PKG-001..207` sin omisiones;
10. la decisión de aprobación de paquete se toma de `DELIV-PKG-025`;
11. los 207 paquetes `BLOQUEADO` no se cuentan como aprobados;
12. la puerta declara 0/217 subcapacidades confirmadas con paquete aprobado en el corte vigente;
13. las 61 ausencias permanecen visibles y vinculadas al mapa propietario `DELIV-PKG-003` para su resolución;
14. las 156 capacidades con paquete preservan todos sus vínculos y no se reducen a un paquete sintético;
15. la tarea no cambia prioridad, estado de cobertura, brechas ni membresía por inferencia;
16. la aprobación documental de 001 no se presenta como cumplimiento de la condición de salida;
17. no se adelanta ninguna decisión de `E5-GATE-002..008`;
18. no se autoriza implementación física ni se altera `DELIV-PKG-025`;
19. no se ejecutan código, despliegues, migraciones, DDL/DML, backfills, cambios de datos, configuración remota ni Supabase;
20. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 16. Continuidad

##### ÚLTIMA TAREA APROBADA
HYPERCARE-OPS-010 — Definir autoridad y evidencia para aprobar cierre funcional, técnico y operativo

##### TAREA ACTUAL APROBADA
E5-GATE-001 — Confirmar que cada capacidad priorizada tiene paquete aprobado

##### SIGUIENTE TAREA RESERVADA
E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino


### ✅ E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino

**Estado:** APROBADA  
**Tarea anterior:** `E5-GATE-001 — Confirmar que cada capacidad priorizada tiene paquete aprobado`  
**Tarea siguiente:** `E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos`  
**Tipo de tarea:** documental — puerta de salida de E5 para reconciliar, identidad por identidad, las brechas críticas vigentes con su propietario interno, fecha de resolución, tarea primaria, paquete trazable y perfil de cierre; sin cerrar brechas, reasignar propietarios, mover brechas entre paquetes, aprobar implementación física ni ejecutar código, migraciones, datos o Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`E5-GATE-002` confirma que toda brecha crítica vigente conserva responsabilidad interna y un destino documental y de implementación trazable antes de continuar la evaluación de salida de E5.

La puerta verifica cinco elementos inseparables por identidad:

```text
BRECHA CRÍTICA
→ PROPIETARIO VIGENTE
→ FECHA O MOMENTO DE RESOLUCIÓN
→ TAREA PRIMARIA CONCRETA
→ PAQUETE DE RESOLUCIÓN TRAZABLE
→ PERFIL DE CIERRE
```

La existencia de propietario y destino no equivale a cierre de la brecha, ejecución de la tarea, aprobación del paquete ni autorización de implementación física.

---

#### 2. Resultado de la comprobación

El registro canónico vigente contiene **820 brechas**. La línea base aprobada de `GAP-CTRL-008` contenía **138 brechas críticas explícitas** y la actualización append-only de `PROC-COVER-010` añadió una nueva brecha crítica, `H-PROC-COVER-010-003`, para un total vigente de **139**.

| Métrica                                                |   Resultado |
| ------------------------------------------------------ | ----------: |
| brechas canónicas vigentes                             |     **820** |
| brechas críticas vigentes evaluadas                    |     **139** |
| identidades críticas únicas                            |     **139** |
| con propietario válido                                 | **139/139** |
| sin propietario                                        |   **0/139** |
| con fecha o momento de resolución                      | **139/139** |
| con tarea primaria concreta                            | **139/139** |
| con paquete de resolución trazable                     | **139/139** |
| con perfil de cierre                                   | **139/139** |
| brechas críticas sin destino                           |   **0/139** |
| brechas nuevas sin routing después de `PROC-COVER-010` |       **0** |

**Conclusión:** la condición documental exigida por `E5-GATE-002` **está satisfecha** en el corte canónico vigente.

Las 139 brechas permanecen abiertas hasta que exista evidencia de cierre válida conforme a su perfil. Esta puerta no modifica ese estado.

---

#### 3. Fuentes canónicas y precedencia

La comprobación utiliza, sin redefinirlas:

- `GAP-CTRL-004` como fuente del propietario y fecha o momento de resolución de las brechas;
- `GAP-CTRL-006` como fuente de `resolution_task_id` y `implementation_package_id`;
- `GAP-CTRL-007` como gobierno del criterio y evidencia de cierre;
- `GAP-CTRL-008` como fuente de la línea base crítica, del contrato de puerta y del requisito absoluto de no dejar una brecha crítica sin propietario;
- `E1-GATE-001` como aprobación de la línea base de 138 brechas críticas mediante `PASS_WITH_CARRYOVER`;
- la actualización canónica devuelta por `PROC-COVER-010`, que eleva el universo a **820 brechas**, **207 paquetes** y **139 brechas críticas**;
- `DELIV-PKG-002` como reconciliación vigente de las **820 brechas** contra las **207** raíces `GAP-PKG-*`;
- `E5-GATE-001` como puerta inmediatamente anterior, sin reutilizar su resultado como sustituto de esta comprobación.

Precedencia de cardinalidad vigente:

```text
GAP-CTRL-008 / E1-GATE-001
→ baseline: 814 brechas / 138 críticas / 201 paquetes

PROC-COVER-010
→ delta append-only: +6 brechas / +1 crítica / +6 paquetes

DELIV-PKG-002
→ universo E5: 820 brechas / 139 críticas / 207 paquetes

E5-GATE-002
→ reconciliación de propietario y destino de las 139 críticas
```

---

#### 4. Definición operativa de propietario y destino

Para esta puerta, una brecha crítica tiene **propietario** cuando conserva un `decision_owner_code` válido del catálogo aprobado y no existe evidencia canónica posterior de vacancia o pérdida de autoridad que lo invalide.

Una brecha crítica tiene **destino** cuando conserva simultáneamente:

1. una fecha o momento de resolución;
2. una tarea primaria exacta;
3. un `GAP-PKG-*` de resolución trazable;
4. un perfil de cierre aplicable.

No son destinos válidos expresiones genéricas como “después”, “en implementación”, “en E5”, “en Supabase” o “en el roadmap”. Tampoco se permite derivar el destino por similitud de capacidad, aplicación, repositorio, dominio o nombre.

---

#### 5. Reconciliación por propietario

La distribución vigente resulta de conservar las 138 asignaciones aprobadas en `GAP-CTRL-008` y añadir exclusivamente la nueva brecha crítica `H-PROC-COVER-010-003 → OWN-SST`.

| Propietario | Brechas críticas |
| ----------- | ---------------: |
| `OWN-OPS`   |           **83** |
| `OWN-SEG`   |           **18** |
| `OWN-FIN`   |           **13** |
| `OWN-TEC`   |           **10** |
| `OWN-COM`   |            **8** |
| `OWN-DAT`   |            **6** |
| `OWN-SST`   |            **1** |
| **Total**   |          **139** |

No existe ninguna brecha crítica con propietario nulo ni ninguna asignación nueva inferida por esta puerta.

---

#### 6. Reconciliación por clasificación

| Clasificación | Brechas críticas |
| ------------- | ---------------: |
| `FUNCIONAL`   |           **35** |
| `CONTRACTUAL` |           **29** |
| `OPERACION`   |           **28** |
| `DATOS`       |           **21** |
| `SEGURIDAD`   |           **18** |
| `TECNICA`     |            **8** |
| **Total**     |          **139** |

La única variación frente a la línea base de 138 es el incremento de `OPERACION` de 27 a 28 por `H-PROC-COVER-010-003`.

---

#### 7. Fechas o momentos de resolución del conjunto crítico

| Fecha        | Brechas críticas |
| ------------ | ---------------: |
| `2026-08-21` |           **63** |
| `2026-09-11` |           **60** |
| `2026-10-02` |            **4** |
| `2026-10-23` |           **10** |
| `2026-11-20` |            **2** |
| **Total**    |          **139** |

La nueva brecha crítica añadida por `PROC-COVER-010` tiene fecha `2026-09-11`; no se desplaza silenciosamente ninguna fecha histórica.

---

#### 8. Matriz materializada de las 139 brechas críticas

Cada identidad aparece exactamente una vez. `CONFIRMADA` significa exclusivamente que la brecha conserva propietario y destino trazable para esta puerta; no significa `CERRADA`, `IMPLEMENTADA`, `VALIDADA` ni `APROBADO_PARA_IMPLEMENTACION_FISICA`.

| Brecha crítica         | Propietario | Fecha        | Tarea primaria   | Paquete       | Perfil de cierre | E5-GATE-002  |
| ---------------------- | ----------- | ------------ | ---------------- | ------------- | ---------------- | ------------ |
| `EQG-053`              | `OWN-OPS`   | `2026-09-11` | `TI-INT-003`     | `GAP-PKG-125` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `EQG-055`              | `OWN-OPS`   | `2026-09-11` | `NFR-REQ-004`    | `GAP-PKG-125` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-COVER-001-009`  | `OWN-TEC`   | `2026-10-02` | `DATA-DOM-001`   | `GAP-PKG-142` | `CLOSE-TEC-DES`  | `CONFIRMADA` |
| `H-CAP-COVER-010-002`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-019`   | `GAP-PKG-031` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-COVER-011-005`  | `OWN-OPS`   | `2026-09-11` | `PROC-CAT-002`   | `GAP-PKG-095` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-002-006`  | `OWN-TEC`   | `2026-08-21` | `ANIMA-AUTH-014` | `GAP-PKG-066` | `CLOSE-TEC-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-004-002`  | `OWN-OPS`   | `2026-08-21` | `SUPA-AUD-019`   | `GAP-PKG-034` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-004-013`  | `OWN-OPS`   | `2026-08-21` | `INT-POS-011`    | `GAP-PKG-033` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-005-004`  | `OWN-SEG`   | `2026-08-21` | `ORIGO-AUTH-010` | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-005-006`  | `OWN-OPS`   | `2026-08-21` | `ORIGO-AUTH-010` | `GAP-PKG-036` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-005-012`  | `OWN-OPS`   | `2026-09-11` | `ORIGO-UX-011`   | `GAP-PKG-114` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-006-004`  | `OWN-OPS`   | `2026-08-21` | `NEXO-DOM-002`   | `GAP-PKG-038` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-006-005`  | `OWN-OPS`   | `2026-08-21` | `NEXO-DOM-019`   | `GAP-PKG-038` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-006-007`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-009`   | `GAP-PKG-043` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-006-008`  | `OWN-OPS`   | `2026-08-21` | `SUPA-AUD-019`   | `GAP-PKG-038` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-006-010`  | `OWN-OPS`   | `2026-08-21` | `INT-PROD-001`   | `GAP-PKG-037` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-006-011`  | `OWN-OPS`   | `2026-08-21` | `INT-POS-020`    | `GAP-PKG-041` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-006-016`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-002`   | `GAP-PKG-038` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-007-003`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-009`   | `GAP-PKG-106` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-007-004`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-008`   | `GAP-PKG-107` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-007-005`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-008`   | `GAP-PKG-107` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-007-009`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-012`   | `GAP-PKG-107` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-002`  | `OWN-OPS`   | `2026-09-11` | `FOGO-UX-004`    | `GAP-PKG-109` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-004`  | `OWN-OPS`   | `2026-10-23` | `FOGO-UX-001`    | `GAP-PKG-161` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-006`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-012`   | `GAP-PKG-104` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-007`  | `OWN-OPS`   | `2026-09-11` | `FOGO-UX-012`    | `GAP-PKG-105` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-009`  | `OWN-OPS`   | `2026-08-21` | `FOGO-AUTH-008`  | `GAP-PKG-051` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-013`  | `OWN-OPS`   | `2026-08-21` | `FOGO-UX-005`    | `GAP-PKG-049` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-017`  | `OWN-OPS`   | `2026-09-11` | `FOGO-UX-001`    | `GAP-PKG-109` | `CLOSE-FUN-VAL`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-019`  | `OWN-OPS`   | `2026-09-11` | `OPS-PRD-001`    | `GAP-PKG-098` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-021`  | `OWN-OPS`   | `2026-09-11` | `FOGO-UX-010`    | `GAP-PKG-109` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-023`  | `OWN-OPS`   | `2026-09-11` | `FOGO-UX-011`    | `GAP-PKG-119` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-008-024`  | `OWN-OPS`   | `2026-09-11` | `AUTH-QA-029`    | `GAP-PKG-119` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-001`  | `OWN-OPS`   | `2026-09-11` | `PULSO-UX-021`   | `GAP-PKG-110` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-004`  | `OWN-OPS`   | `2026-09-11` | `PROC-CAT-009`   | `GAP-PKG-110` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-006`  | `OWN-OPS`   | `2026-08-21` | `PULSO-UX-016`   | `GAP-PKG-033` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-008`  | `OWN-OPS`   | `2026-09-11` | `PROC-CAT-013`   | `GAP-PKG-110` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-009`  | `OWN-OPS`   | `2026-09-11` | `PULSO-UX-001`   | `GAP-PKG-110` | `CLOSE-FUN-VAL`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-010`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-017`   | `GAP-PKG-041` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-017`  | `OWN-OPS`   | `2026-09-11` | `PULSO-UX-008`   | `GAP-PKG-110` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-018`  | `OWN-OPS`   | `2026-08-21` | `PULSO-UX-010`   | `GAP-PKG-041` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-019`  | `OWN-OPS`   | `2026-09-11` | `INT-POS-007`    | `GAP-PKG-110` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-021`  | `OWN-OPS`   | `2026-09-11` | `PULSO-UX-009`   | `GAP-PKG-110` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-022`  | `OWN-OPS`   | `2026-09-11` | `PULSO-UX-009`   | `GAP-PKG-111` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-025`  | `OWN-OPS`   | `2026-08-21` | `PASS-INT-001`   | `GAP-PKG-042` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-026`  | `OWN-OPS`   | `2026-09-11` | `INT-POS-017`    | `GAP-PKG-110` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-009-027`  | `OWN-OPS`   | `2026-09-11` | `INT-POS-006`    | `GAP-PKG-104` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-002`  | `OWN-OPS`   | `2026-09-11` | `NEXO-UX-001`    | `GAP-PKG-113` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-003`  | `OWN-OPS`   | `2026-09-11` | `NEXO-UX-005`    | `GAP-PKG-113` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-004`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-024`   | `GAP-PKG-113` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-005`  | `OWN-OPS`   | `2026-09-11` | `NEXO-UX-005`    | `GAP-PKG-097` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-006`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-026`   | `GAP-PKG-105` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-009`  | `OWN-OPS`   | `2026-09-11` | `NEXO-UX-010`    | `GAP-PKG-113` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-010`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-017`   | `GAP-PKG-105` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-011`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-008`   | `GAP-PKG-108` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-012`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-019`   | `GAP-PKG-113` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-014`  | `OWN-OPS`   | `2026-09-11` | `NEXO-UX-011`    | `GAP-PKG-122` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-016`  | `OWN-SEG`   | `2026-08-21` | `AUTH-SRV-004`   | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-017`  | `OWN-OPS`   | `2026-08-21` | `NEXO-UX-013`    | `GAP-PKG-044` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-018`  | `OWN-OPS`   | `2026-09-11` | `NEXO-UX-013`    | `GAP-PKG-095` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-019`  | `OWN-OPS`   | `2026-08-21` | `NEXO-UX-022`    | `GAP-PKG-037` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-021`  | `OWN-OPS`   | `2026-09-11` | `PULSO-UX-018`   | `GAP-PKG-113` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-022`  | `OWN-SEG`   | `2026-08-21` | `PULSO-AUTH-001` | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-023`  | `OWN-SEG`   | `2026-08-21` | `AUTH-QA-020`    | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-024`  | `OWN-OPS`   | `2026-09-11` | `PULSO-AUTH-011` | `GAP-PKG-122` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-011-027`  | `OWN-OPS`   | `2026-09-11` | `OPS-LOG-001`    | `GAP-PKG-122` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-003`  | `OWN-FIN`   | `2026-09-11` | `NUMERA-DOM-005` | `GAP-PKG-090` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-004`  | `OWN-FIN`   | `2026-08-21` | `NUMERA-DOM-002` | `GAP-PKG-026` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-007`  | `OWN-FIN`   | `2026-09-11` | `NUMERA-DOM-016` | `GAP-PKG-087` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-008`  | `OWN-FIN`   | `2026-09-11` | `NUMERA-DOM-016` | `GAP-PKG-089` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-010`  | `OWN-FIN`   | `2026-09-11` | `NUMERA-DOM-010` | `GAP-PKG-090` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-011`  | `OWN-FIN`   | `2026-08-21` | `NUMERA-DOM-003` | `GAP-PKG-024` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-013`  | `OWN-FIN`   | `2026-08-21` | `NUMERA-DOM-009` | `GAP-PKG-024` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-014`  | `OWN-FIN`   | `2026-10-23` | `NUMERA-DOM-009` | `GAP-PKG-156` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-015`  | `OWN-FIN`   | `2026-10-23` | `NUMERA-UX-021`  | `GAP-PKG-155` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-017`  | `OWN-FIN`   | `2026-09-11` | `INT-POS-020`    | `GAP-PKG-088` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-020`  | `OWN-FIN`   | `2026-10-23` | `NUMERA-DOM-007` | `GAP-PKG-155` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-021`  | `OWN-FIN`   | `2026-09-11` | `NUMERA-DOM-013` | `GAP-PKG-085` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-012-030`  | `OWN-FIN`   | `2026-09-11` | `NUMERA-DOM-013` | `GAP-PKG-089` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-002`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-029`   | `GAP-PKG-115` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-004`  | `OWN-OPS`   | `2026-08-21` | `NEXO-DOM-029`   | `GAP-PKG-046` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-005`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-030`   | `GAP-PKG-122` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-006`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-030`   | `GAP-PKG-108` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-009`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-031`   | `GAP-PKG-115` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-011`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-032`   | `GAP-PKG-116` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-012`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-033`   | `GAP-PKG-101` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-014`  | `OWN-OPS`   | `2026-08-21` | `NEXO-DOM-034`   | `GAP-PKG-046` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-017`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-035`   | `GAP-PKG-108` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-018`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-035`   | `GAP-PKG-116` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-019`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-035`   | `GAP-PKG-105` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-021`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-036`   | `GAP-PKG-120` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-023`  | `OWN-OPS`   | `2026-09-11` | `NEXO-DOM-037`   | `GAP-PKG-116` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-013-025`  | `OWN-SEG`   | `2026-08-21` | `NEXO-AUTH-031`  | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-002`  | `OWN-COM`   | `2026-11-20` | `AURA-AUTH-001`  | `GAP-PKG-189` | `CLOSE-FUN-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-006`  | `OWN-COM`   | `2026-10-23` | `AURA-DOM-002`   | `GAP-PKG-147` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-007`  | `OWN-COM`   | `2026-10-23` | `AURA-DOM-002`   | `GAP-PKG-147` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-011`  | `OWN-SEG`   | `2026-08-21` | `AURA-AUTH-004`  | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-013`  | `OWN-SEG`   | `2026-08-21` | `AURA-AUTH-004`  | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-017`  | `OWN-COM`   | `2026-10-23` | `AURA-DOM-006`   | `GAP-PKG-147` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-019`  | `OWN-SEG`   | `2026-08-21` | `AURA-AUTH-003`  | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-020`  | `OWN-COM`   | `2026-08-21` | `AURA-DOM-007`   | `GAP-PKG-006` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-022`  | `OWN-COM`   | `2026-09-11` | `AURA-DOM-008`   | `GAP-PKG-079` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-024`  | `OWN-COM`   | `2026-08-21` | `AURA-DOM-008`   | `GAP-PKG-008` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-014-026`  | `OWN-COM`   | `2026-10-23` | `PASS-UX-001`    | `GAP-PKG-146` | `CLOSE-FUN-VAL`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-003`  | `OWN-TEC`   | `2026-10-23` | `TI-DOM-007`     | `GAP-PKG-183` | `CLOSE-FUN-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-007`  | `OWN-SEG`   | `2026-08-21` | `TI-AUTH-002`    | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-008`  | `OWN-TEC`   | `2026-10-23` | `TI-DOM-006`     | `GAP-PKG-182` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-009`  | `OWN-SEG`   | `2026-08-21` | `TI-AUTH-002`    | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-012`  | `OWN-TEC`   | `2026-08-21` | `TI-DOM-004`     | `GAP-PKG-073` | `CLOSE-TEC-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-013`  | `OWN-SEG`   | `2026-08-21` | `TI-AUTH-003`    | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-014`  | `OWN-TEC`   | `2026-10-02` | `TI-DOM-005`     | `GAP-PKG-140` | `CLOSE-TEC-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-018`  | `OWN-TEC`   | `2026-10-02` | `TI-DOM-005`     | `GAP-PKG-140` | `CLOSE-TEC-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-021`  | `OWN-TEC`   | `2026-08-21` | `TI-AUTH-004`    | `GAP-PKG-073` | `CLOSE-TEC-IMP`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-025`  | `OWN-TEC`   | `2026-10-02` | `TI-DOM-007`     | `GAP-PKG-140` | `CLOSE-TEC-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-015-026`  | `OWN-TEC`   | `2026-11-20` | `TI-DOM-007`     | `GAP-PKG-200` | `CLOSE-TEC-DES`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-002`  | `OWN-DAT`   | `2026-08-21` | `INFO-DOM-001`   | `GAP-PKG-016` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-003`  | `OWN-SEG`   | `2026-08-21` | `INFO-AUTH-001`  | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-007`  | `OWN-SEG`   | `2026-08-21` | `INFO-AUTH-003`  | `GAP-PKG-061` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-008`  | `OWN-DAT`   | `2026-08-21` | `INFO-DOM-004`   | `GAP-PKG-012` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-013`  | `OWN-SEG`   | `2026-08-21` | `INFO-DOM-008`   | `GAP-PKG-058` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-014`  | `OWN-SEG`   | `2026-08-21` | `INFO-DOM-009`   | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-022`  | `OWN-DAT`   | `2026-08-21` | `INFO-DOM-010`   | `GAP-PKG-014` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-026`  | `OWN-SEG`   | `2026-08-21` | `INFO-AUTH-004`  | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-028`  | `OWN-DAT`   | `2026-08-21` | `INFO-DOM-007`   | `GAP-PKG-021` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-029`  | `OWN-DAT`   | `2026-08-21` | `INFO-DOM-011`   | `GAP-PKG-021` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-030`  | `OWN-DAT`   | `2026-08-21` | `INFO-DOM-007`   | `GAP-PKG-021` | `CLOSE-DAT-GOV`  | `CONFIRMADA` |
| `H-CAP-SCOPE-016-031`  | `OWN-SEG`   | `2026-08-21` | `INFO-AUTH-004`  | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-001`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-017`   | `GAP-PKG-031` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-002`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-004`   | `GAP-PKG-031` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-003`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-005`   | `GAP-PKG-031` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-005`  | `OWN-OPS`   | `2026-08-21` | `INT-PROD-001`   | `GAP-PKG-040` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-006`  | `OWN-OPS`   | `2026-08-21` | `GAP-CTRL-008`   | `GAP-PKG-049` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-007`  | `OWN-OPS`   | `2026-08-21` | `PROC-CAT-002`   | `GAP-PKG-031` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-008`  | `OWN-SEG`   | `2026-08-21` | `TI-AUTH-002`    | `GAP-PKG-060` | `CLOSE-SEG-ENF`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-011`  | `OWN-OPS`   | `2026-08-21` | `INFO-DOM-003`   | `GAP-PKG-031` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-012`  | `OWN-OPS`   | `2026-08-21` | `CONT-DOM-001`   | `GAP-PKG-053` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-014`  | `OWN-OPS`   | `2026-08-21` | `GAP-CTRL-007`   | `GAP-PKG-031` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-CAP-SCOPE-019-015`  | `OWN-OPS`   | `2026-08-21` | `GAP-CTRL-007`   | `GAP-PKG-037` | `CLOSE-CON-CTR`  | `CONFIRMADA` |
| `H-PROC-COVER-010-003` | `OWN-SST`   | `2026-09-11` | `NEXO-DOM-001`   | `GAP-PKG-204` | `CLOSE-OPE-ADP`  | `CONFIRMADA` |

Reconciliación de la matriz:

- **139/139** identidades críticas materializadas;
- **139/139** identidades únicas;
- **139/139** con propietario;
- **139/139** con fecha;
- **139/139** con tarea primaria;
- **139/139** con paquete trazable;
- **139/139** con perfil de cierre;
- **0** brechas críticas sin propietario;
- **0** brechas críticas sin destino;
- **0** cierres inferidos por esta puerta.

---

#### 9. Regla de decisión de la puerta

Una identidad se marca `CONFIRMADA` únicamente cuando todos los campos de gobierno requeridos existen en las fuentes propietarias.

La puerta quedaría no satisfecha si apareciera cualquiera de estas condiciones:

- propietario ausente o inválido;
- pérdida de autoridad sin reemplazo formal;
- fecha o momento de resolución ausente;
- tarea primaria ausente;
- paquete de resolución ausente;
- perfil de cierre ausente;
- brecha crítica omitida o duplicada;
- nueva brecha crítica sin routing canónico.

Ninguna de esas condiciones está presente en el corte vigente reconciliado.

---

#### 10. Relación con `E5-GATE-001` y con la autorización física

`E5-GATE-001` y `E5-GATE-002` verifican propiedades distintas y sus resultados no se sustituyen entre sí.

```text
E5-GATE-001
→ condición no satisfecha: 0/217 capacidades con paquete aprobado

E5-GATE-002
→ condición satisfecha: 139/139 brechas críticas con propietario y destino
```

Por tanto, el resultado positivo de 002:

- no corrige las 61 capacidades sin vínculo de paquete detectadas por 001;
- no convierte ningún paquete `BLOQUEADO` en aprobado;
- no modifica `DELIV-PKG-025`;
- no cierra ninguna de las 139 brechas críticas;
- no autoriza `E5-GATE-008`;
- no habilita implementación física.

La salida completa de E5 continúa condicionada por las demás puertas aplicables.

---

#### 11. Conservación de responsabilidad y destino

Después de esta comprobación:

1. cada propietario histórico permanece sin cambio;
2. `OWN-SST` se conserva exclusivamente para la nueva brecha crítica `H-PROC-COVER-010-003`;
3. ninguna brecha cambia de tarea por similitud funcional;
4. ninguna brecha cambia de paquete por compartir capacidad, proceso, aplicación o repositorio;
5. una tarea primaria futura no cierra la brecha por el solo hecho de ser aprobada;
6. un paquete futuro no cierra la brecha por el solo hecho de ser autorizado;
7. la evidencia de cierre deberá satisfacer el perfil correspondiente y el gobierno de `GAP-CTRL-007`.

Si una brecha crítica pierde propietario, destino o trazabilidad antes de la autorización física, esta puerta deberá revalidarse y no podrá conservarse el resultado positivo por inercia documental.

---

#### 12. Separación entre planificación y ejecución

`E5-GATE-002` es exclusivamente documental.

No ejecuta ni autoriza:

- cierre material de brechas;
- reasignación de propietarios;
- creación, fusión, división o transferencia de paquetes;
- implementación de tareas destino;
- cambios de código;
- despliegues;
- migraciones;
- DDL/DML;
- backfills;
- cambios de datos;
- cambios de configuración;
- operaciones remotas sobre Supabase;
- readiness;
- cutover;
- piloto;
- hypercare;
- rollback o recovery.

---

#### 13. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0  
**Requisitos modificados:** 0  
**Fragmentos 04A afectados:** 0

**Justificación:** `E5-GATE-002` reconcilia identidades, propietarios y destinos ya gobernados por `GAP-CTRL-004`, `GAP-CTRL-006`, `GAP-CTRL-007`, `GAP-CTRL-008`, `E1-GATE-001` y `PROC-COVER-010`. No introduce comportamiento de runtime, regla empresarial ejecutable nueva, transición de dominio, autorización, cálculo, integración, persistencia, algoritmo, umbral NFR, recuperación ni mecanismo técnico nuevo que requiera un `TREQ-*` adicional. Tampoco modifica el requisito histórico que protege la puerta de brechas críticas.

---

#### 14. Criterios de aceptación documental

`E5-GATE-002` queda documentalmente completa cuando:

1. conserva `E5-GATE-001 → E5-GATE-002 → E5-GATE-003`;
2. usa como universo vigente **820 brechas** y no la línea histórica de 814;
3. reconoce **139 brechas críticas** y no reduce el universo a las 138 históricas;
4. preserva las 138 identidades de `GAP-CTRL-008`;
5. incorpora exactamente una identidad crítica adicional: `H-PROC-COVER-010-003`;
6. cada identidad crítica aparece exactamente una vez en la matriz;
7. las 139 identidades conservan propietario válido;
8. las 139 conservan fecha o momento de resolución;
9. las 139 conservan tarea primaria concreta;
10. las 139 conservan paquete de resolución trazable;
11. las 139 conservan perfil de cierre;
12. no existe brecha crítica sin propietario;
13. no existe brecha crítica sin destino;
14. no se infiere ningún propietario, tarea, paquete o perfil por similitud;
15. ninguna brecha se presenta como cerrada por superar esta puerta;
16. el resultado positivo de 002 no se usa para alterar el resultado de 001;
17. no se modifica `DELIV-PKG-025` ni se declara ningún paquete aprobado físicamente;
18. no se adelanta ninguna decisión de `E5-GATE-003..008`;
19. no se ejecutan código, migraciones, DDL/DML, backfills, datos, despliegues ni Supabase;
20. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 15. Continuidad

##### ÚLTIMA TAREA APROBADA
E5-GATE-001 — Confirmar que cada capacidad priorizada tiene paquete aprobado

##### TAREA ACTUAL APROBADA
E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino

##### SIGUIENTE TAREA RESERVADA
E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos


### ✅ E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos

**Estado:** APROBADA  
**Tarea anterior:** `E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino`  
**Tarea siguiente:** `E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables`  
**Tipo de tarea:** documental — puerta de salida de E5 para reconciliar la línea base NFR aprobada, su cobertura de procesos y su materialización estructural sobre las 207 raíces `GAP-PKG-*`; sin certificar mediciones, dispositivos, pruebas ejecutadas, implementación, piloto, cutover ni producción  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`E5-GATE-003` confirma que los requisitos no funcionales aprobados están cubiertos como obligación de planificación antes de continuar con las puertas restantes de E5.

La puerta separa obligatoriamente dos conceptos:

```text
COBERTURA NFR PARA PLANIFICACION
= baseline aprobada + cobertura de procesos + obligacion por paquete + trazabilidad de prueba

CONFORMIDAD NFR REAL
= medicion + implementacion + prueba + evidencia + revision independiente
```

Esta tarea confirma la primera. No declara satisfecha la segunda.

---

#### 2. Criterio canónico de cobertura

Una obligación NFR se considera cubierta para E5 cuando:

1. pertenece a una de las once familias `NFR-REQ-001..NFR-REQ-011` aprobadas;
2. conserva la cobertura de los 69 procesos aprobada por `NFR-REQ-012`;
3. cada raíz `GAP-PKG-*` conserva las once referencias `nfr_profile_refs[11]`;
4. las reglas universales y los overrides aplicables permanecen exigibles aunque el paquete no tenga `process_id`;
5. la ausencia de proyección por proceso se expresa como `NOT_APPLICABLE_APPROVED` y no como eliminación de la dimensión;
6. los valores sin evidencia no se presentan como mediciones reales;
7. la conformidad de implementación permanece `NOT_EVALUATED` hasta que existan ejecución y evidencia verificables;
8. `NFR-REQ-012` conserva el gobierno de precedencia, excepciones, certificación y gates, pero no se convierte en una duodécima referencia de perfil por paquete.

---

#### 3. Universo reconciliado

| Control                                                   |   Resultado |
| --------------------------------------------------------- | ----------: |
| familias NFR de perfil aprobadas                          |      **11** |
| procesos canónicos cubiertos por familia                  |      **69** |
| intersecciones proceso-familia                            |     **759** |
| requisitos NFR históricos preservados                     |     **354** |
| requisitos de gobierno NFR de `NFR-REQ-012` preservados   |      **50** |
| requisitos NFR y de gobierno consumidos por esta puerta   |     **404** |
| paquetes E5 esperados                                     |     **207** |
| paquetes E5 materializados en `DELIV-PKG-013`             |     **207** |
| identificadores de paquete únicos                         |     **207** |
| paquetes faltantes                                        |       **0** |
| paquetes duplicados                                       |       **0** |
| referencias estructurales paquete-familia                 |   **2.277** |
| paquetes con conformidad de implementación evaluada       |       **0** |
| paquetes con `implementation_conformance = NOT_EVALUATED` | **207/207** |

Los **354** requisitos históricos corresponden a `TREQ-PROC-227..580`. Los **50** requisitos de gobierno corresponden a `TREQ-PROC-1511..1560`. Ambos rangos permanecen dentro del registro canónico vigente; esta puerta no altera sus estados ni contenido.

---

#### 4. Matriz de cobertura por familia NFR

| Familia       | Dimensión                                                      |    Procesos | Requisitos preservados          |                                  Cobertura en paquetes E5 | Conformidad real |
| ------------- | -------------------------------------------------------------- | ----------: | ------------------------------- | --------------------------------------------------------: | ---------------- |
| `NFR-REQ-001` | Criticidad y disponibilidad                                    |   **69/69** | `TREQ-PROC-227..246` (**20**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-002` | Volumen, concurrencia y crecimiento                            |   **69/69** | `TREQ-PROC-247..270` (**24**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-003` | Tiempos máximos de respuesta                                   |   **69/69** | `TREQ-PROC-271..294` (**24**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-004` | Offline y sincronización                                       |   **69/69** | `TREQ-PROC-295..324` (**30**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-005` | Privacidad y sensibilidad                                      |   **69/69** | `TREQ-PROC-325..354` (**30**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-006` | Trazabilidad y retención                                       |   **69/69** | `TREQ-PROC-355..389` (**35**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-007` | Accesibilidad y ergonomía                                      |   **69/69** | `TREQ-PROC-390..424` (**35**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-008` | Hardware, red y periféricos                                    |   **69/69** | `TREQ-PROC-425..460` (**36**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-009` | Observabilidad, soporte y alertas                              |   **69/69** | `TREQ-PROC-461..500` (**40**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-010` | Respaldo, RTO y RPO                                            |   **69/69** | `TREQ-PROC-501..540` (**40**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-011` | Compatibilidad mínima por dispositivo                          |   **69/69** | `TREQ-PROC-541..580` (**40**)   |                                               **207/207** | `NOT_EVALUATED`  |
| `NFR-REQ-012` | Gobierno, precedencia, excepciones y frontera de certificación | transversal | `TREQ-PROC-1511..1560` (**50**) | gobierna las **207** raíces; no es `nfr_profile_refs[12]` | `NOT_EVALUATED`  |

Resultado: las once dimensiones de perfil están presentes de forma estructural en las 207 raíces y `NFR-REQ-012` conserva la regla que impide confundir cobertura documental con certificación.

---

#### 5. Proyección por proceso y regla universal

`DELIV-PKG-013` conserva la cardinalidad aprobada:

| Proyección               | Paquetes | Tratamiento NFR                                                                              |
| ------------------------ | -------: | -------------------------------------------------------------------------------------------- |
| con `VPROC-*` numerado   |   **13** | perfil del proceso aplicable + reglas universales                                            |
| con `VPROC-TRANSVERSAL`  |    **1** | reglas transversales + reglas universales                                                    |
| con `process_ids[] = []` |  **193** | `NOT_APPLICABLE_APPROVED` solo para la proyección por proceso; reglas universales permanecen |
| **Total**                |  **207** | **sin reducción de obligación NFR**                                                          |

La ausencia de `process_id` no autoriza eliminar seguridad, privacidad, integridad, retención, recuperación, compatibilidad, observabilidad, accesibilidad ni otra obligación universal aplicable.

---

#### 6. Matriz materializada de las 207 raíces

Cada `package_id` aparece exactamente una vez. `CUBIERTO_PARA_PLANIFICACION` confirma exclusivamente que la raíz conserva las once referencias NFR y el gobierno de `NFR-REQ-012`; no significa implementación ni verificación.

| Paquete       | Proyección                            | Condición heredada relevante     | Perfiles NFR       | Conformidad     | E5-GATE-003                   |
| ------------- | ------------------------------------- | -------------------------------- | ------------------ | --------------- | ----------------------------- |
| `GAP-PKG-001` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-002` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-003` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-004` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-005` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-006` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-007` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-008` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-009` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-010` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-011` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-012` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-013` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-014` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-015` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-016` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-017` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-018` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-019` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-020` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-021` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-022` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-023` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-024` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-025` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-026` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-027` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `CONDICION_EXT_GOV_PRESERVADA`   | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-028` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-029` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-030` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-031` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-032` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-033` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-034` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-035` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-036` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-037` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-038` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-039` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-040` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-041` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-042` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-043` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-044` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-045` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-046` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-047` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-048` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-049` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-050` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-051` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-052` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-053` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-054` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-055` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-056` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-057` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-058` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-059` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-060` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-061` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-062` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-063` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-064` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `LINEA_TALENTO_PRESERVADA`       | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-065` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-066` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-067` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-068` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-069` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-070` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-071` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-072` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-073` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-074` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-075` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-076` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-077` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-078` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-079` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-080` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-081` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-082` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-083` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-084` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-085` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-086` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-087` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-088` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-089` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-090` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-091` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-092` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-093` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-094` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-095` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-096` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-097` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-098` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-099` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-100` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-101` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-102` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-103` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-104` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-105` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-106` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-107` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-108` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-109` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-110` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-111` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-112` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-113` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-114` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-115` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-116` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-117` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-118` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-119` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-120` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-121` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-122` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-123` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-124` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-125` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-126` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-127` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-128` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-129` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-130` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-131` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-132` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-133` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-134` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-135` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-136` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-137` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-138` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-139` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-140` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-141` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-142` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-143` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-144` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-145` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-146` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-147` | `VPROC_APLICABLE + UNIVERSAL`         | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-148` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-149` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-150` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-151` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-152` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-153` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-154` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-155` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-156` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-157` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `CONDICION_EXT_GOV_PRESERVADA`   | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-158` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-159` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-160` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-161` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-162` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-163` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-164` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-165` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-166` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-167` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-168` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-169` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-170` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-171` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-172` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-173` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-174` | `VPROC_APLICABLE + UNIVERSAL`         | `VPROC-0065_DIFERIDO_PRESERVADO` | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-175` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-176` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-177` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-178` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-179` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-180` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-181` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-182` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-183` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-184` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-185` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-186` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-187` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-188` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-189` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-190` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-191` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-192` | `VPROC_APLICABLE + UNIVERSAL`         | `BLOQUEO_AURA_PRESERVADO`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-193` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-194` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-195` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-196` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-197` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `LINEA_TALENTO_PRESERVADA`       | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-198` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-199` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-200` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-201` | `NOT_APPLICABLE_APPROVED + UNIVERSAL` | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-202` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-203` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-204` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-205` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-206` | `VPROC_APLICABLE + UNIVERSAL`         | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |
| `GAP-PKG-207` | `VPROC-TRANSVERSAL + UNIVERSAL`       | `SIN_CAMBIO_DE_CONDICION`        | `NFR-REQ-001..011` | `NOT_EVALUATED` | `CUBIERTO_PARA_PLANIFICACION` |

Reconciliación de la matriz:

```text
esperados = 207
materializados = 207
unicos = 207
faltantes = 0
duplicados = 0
familias_por_paquete = 11
referencias_paquete_familia = 207 * 11 = 2277
implementation_conformance_not_evaluated = 207
```

Los bloqueos y condiciones heredados no reducen la obligación NFR. Tampoco son resueltos por esta puerta.

---

#### 7. Trazabilidad hacia pruebas y evidencia

El registro canónico conserva los requisitos NFR aprobados y `DELIV-PKG-016` define planes de prueba y vínculos por paquete para las obligaciones aplicables. Esta puerta no cambia el estado vigente de ninguna fila ni convierte una prueba planificada en prueba ejecutada.

La trazabilidad final TREQ → prueba → paquete → evidencia corresponde a E5-GATE-007, y la aprobación de entrada a implementación física por paquetes corresponde a E5-GATE-008.

---

#### 8. Frontera de medición y certificación

Se mantienen las siguientes restricciones:

- un objetivo cualitativo no es una medición real;
- un `UNKNOWN_BLOCKING` crítico no puede sustituirse por una estimación;
- una combinación de dispositivo desconocida no se considera soportada;
- una excepción exige propietario, aprobador, vencimiento, control, tarea y criterio de salida;
- seguridad, privacidad, integridad, evidencia, retención y recuperación prevalecen sobre velocidad o conveniencia;
- un build, una captura, una demo o un documento no certifican conformidad;
- la implementación, piloto, cutover y producción continúan fuera de la autorización de esta puerta.

---

#### 9. Resultado de la puerta

```text
E5-GATE-003 = PASS
CONDICION_NFR = SATISFECHA_PARA_PLANIFICACION
NFR_BASELINE = PASS_FOR_E5_PLANNING
NFR_PROFILE_FAMILIES = 11
NFR_PROCESS_FAMILY_INTERSECTIONS = 759
NFR_PACKAGE_COVERAGE = 207/207
NFR_PACKAGE_FAMILY_REFERENCES = 2277
NFR_IMPLEMENTATION_CONFORMANCE = NOT_EVALUATED
PILOT_AUTHORIZATION = NOT_GRANTED
CUTOVER_AUTHORIZATION = NOT_GRANTED
PRODUCTION_AUTHORIZATION = NOT_GRANTED
E5-GATE-001_CONDITION = NOT_SATISFIED_PRESERVED
```

La condición de `E5-GATE-003` está satisfecha. El estado global de salida de E5 no queda aprobado por esta decisión porque `E5-GATE-001` conserva su condición no satisfecha y las puertas posteriores permanecen pendientes.

---

#### 10. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** **0**  
**Requisitos modificados:** **0**

Justificación: esta puerta confirma cobertura documental ya definida y consume requisitos existentes. No introduce un comportamiento nuevo, no cambia el estado de pruebas existentes y no autoriza a presentar evidencia pendiente como verificada.

---

#### 11. Criterios de aceptación

- [x] Las once familias NFR fuente permanecen aprobadas.
- [x] Los 69 procesos conservan cobertura en las once familias.
- [x] Se reconcilian 759 intersecciones proceso-familia.
- [x] Se preservan los 354 requisitos NFR históricos y los 50 requisitos de gobierno NFR.
- [x] Las 207 raíces `GAP-PKG-*` aparecen exactamente una vez.
- [x] Las 207 raíces conservan exactamente once referencias NFR de perfil.
- [x] Existen 2.277 referencias estructurales paquete-familia.
- [x] No existen paquetes faltantes ni duplicados en la matriz de esta puerta.
- [x] Los 193 paquetes sin `process_id` conservan `NOT_APPLICABLE_APPROVED` solo para proyección por proceso y mantienen reglas universales.
- [x] `NFR-REQ-012` gobierna la cobertura sin convertirse en una duodécima referencia de perfil.
- [x] La conformidad real permanece `NOT_EVALUATED` para 207/207 paquetes.
- [x] No se inventan mediciones, SLO, RTO/RPO, combinaciones de dispositivo ni evidencia operativa.
- [x] No se crean ni modifican requisitos de prueba.
- [x] No se ejecuta código, migraciones, Supabase, despliegues, pilotos, cutover ni producción.
- [x] La condición no satisfecha de `E5-GATE-001` permanece intacta.

---

#### 12. Continuidad

ÚLTIMA TAREA APROBADA

`E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino`

TAREA ACTUAL APROBADA

`E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos`

SIGUIENTE TAREA RESERVADA

`E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables`


### ✅ E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables

**Estado:** APROBADA  
**Tarea anterior:** `E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos`  
**Tarea siguiente:** `E5-GATE-005 — Confirmar que el piloto tiene criterios medibles`  
**Tipo de tarea:** documental — puerta de salida de E5 para comprobar si la estrategia de rollout, el rollback técnico/funcional/de datos y las contingencias operativas están definidos con suficiente concreción para poder ejecutarse sin improvisación cuando sus prerrequisitos físicos y de readiness estén satisfechos; sin ejecutar despliegues, promociones, rollback, restore, contingencias, piloto, migraciones, DDL/DML, cambios remotos ni operaciones sobre Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`E5-GATE-004` verifica si el universo vigente de paquetes posee una cadena documental de rollout, rollback y contingencia que pueda convertirse en ejecución controlada sin inventar artefactos, repositorios, procedimientos, autoridades, cohortes, estados seguros ni mecanismos de recuperación.

La comprobación conserva tres niveles distintos:

```text
ESPECIFICADO
→ existe contrato documental y disposición explícita

EJECUTABLE
→ existen además los prerrequisitos físicos y operativos necesarios para ejecutar ese contrato sin inventar piezas

PROBADO
→ existe evidencia real de ejecución o ensayo reproducible
```

`E5-GATE-004` no puede convertir un plan especificado en ejecutable cuando su propia fuente conserva un bloqueo de identidad física, repositorio, línea funcional o gobierno externo. Tampoco puede convertir un plan ejecutable en probado: la evidencia real pertenece a las tareas de implementación, readiness y CI posteriores.

---

#### 2. Resultado de la comprobación

La puerta evalúa las **207 raíces `GAP-PKG-*`** vigentes.

| Control                                                                          |   Resultado |
| -------------------------------------------------------------------------------- | ----------: |
| raíces de paquete evaluadas                                                      |     **207** |
| raíces con disposición de rollout materializada en `DELIV-PKG-019`               | **207/207** |
| raíces con disposición de rollback materializada en `DELIV-PKG-020`              | **207/207** |
| raíces con identidad física no confirmada                                        |     **167** |
| raíces AURA bloqueadas por repositorio/runtime/datos/identidad física            |      **14** |
| raíces condicionadas por `EXT-GOV-001`                                           |       **2** |
| raíces TALENTO fuera de la línea funcional actual                                |       **2** |
| raíces sin cambio físico directo confirmado                                      |      **22** |
| raíces con ejecución física o activación todavía bloqueada                       | **185/207** |
| raíces sin deploy directo al que pueda atribuirse rollout/rollback físico propio |  **22/207** |

La reconciliación es cerrada:

```text
167 + 14 + 2 + 2 + 22 = 207
185 bloqueadas para ejecución/activación + 22 sin deploy directo = 207
```

**Conclusión:** la condición exigida por `E5-GATE-004` **NO ESTÁ SATISFECHA** en el corte canónico actual.

Los contratos de rollout y rollback están materializados para las 207 raíces y la contingencia posee criterio de readiness definido, pero las fuentes canónicas impiden afirmar que esas tres dimensiones sean actualmente ejecutables para el universo completo. En particular, las 185 raíces sujetas a ejecución o activación conservan un bloqueo físico, de AURA, externo o de línea funcional; las 22 restantes no poseen deploy directo y no pueden utilizarse para fabricar una ejecución física inexistente.

---

#### 3. Fuentes canónicas y precedencia

La comprobación consume, sin redefinirlas:

- `DELIV-PKG-014` como fuente de la identidad física, inventario de cambios y bloqueos que impiden inventar artefactos ejecutables;
- `DELIV-PKG-015` como consolidación de arquitectura, dependencias, bloqueos y orden de actualización;
- `DELIV-PKG-018` como contrato de default seguro, activación progresiva y kill switch;
- `DELIV-PKG-019` como fuente de la estrategia de rollout por paquete;
- `DELIV-PKG-020` como fuente del rollback técnico, funcional y de datos por paquete;
- `DELIV-PKG-021` como fuente de runbooks y procedimientos requeridos por paquete;
- `READY-GATE-008` como criterio futuro para confirmar procedimientos operativos y contingencias mediante evidencia de readiness;
- `READY-GATE-012` como criterio futuro para confirmar respaldo, restauración y rollback probados mediante evidencia real;
- `CUTOVER-OPS-006` como criterio posterior de pausa, reversión o continuación durante el piloto;
- los principios obligatorios de E5, que separan planificación preimplementación de ejecución física y evidencia real;
- la salida obligatoria de E5, que exige rollback, contingencia y vínculo ejecutable con la implementación posterior, sin afirmar despliegue, piloto o cierre real.

Precedencia de interpretación:

```text
identidad física y bloqueos
→ control de activación
→ rollout
→ rollback
→ procedimientos y contingencias
→ readiness con evidencia real
→ cutover/piloto
→ ejecución posterior
```

Una disposición `ESPECIFICADO` no elimina un bloqueo heredado ni constituye evidencia de ejecución.

---

#### 4. Criterio de ejecutabilidad de rollout

Para esta puerta, un rollout solo puede confirmarse como ejecutable cuando la misma raíz dispone, como mínimo, de:

1. identidad de paquete vigente;
2. repositorio y frontera física suficientes para materializar el artefacto aplicable;
3. propietario y perfil `TP-*` definidos;
4. ambiente y orden de promoción definidos;
5. artefacto o unidad sobre la cual pueda actuar la estrategia, sin inventarla;
6. secuencia de stages aplicable;
7. cohortes o unidad discreta de promoción cuando la segmentación sea segura;
8. pausas, gates de promoción y reglas de detención;
9. observabilidad y evidencia previstas;
10. default seguro y mecanismo de contención o kill switch cuando aplique.

`DELIV-PKG-019` materializa la estrategia para las 207 raíces, pero conserva expresamente los bloqueos heredados. En consecuencia:

- las **167** raíces con identidad física no confirmada poseen rollout especificado, pero no un release ejecutable que pueda promoverse hoy;
- las **14** raíces AURA permanecen no ejecutables mientras no se confirmen repositorio, runtime, datos e identidad física;
- las **2** raíces `EXT` permanecen bloqueadas hasta satisfacer `EXT-GOV-001`;
- las **2** raíces TALENTO permanecen fuera de la línea funcional actual;
- las **22** raíces sin cambio físico directo no reciben un deploy ficticio y conservan rollout de control/evidencia según aplicabilidad.

La existencia de una secuencia `5% → 25% → 50% → 100%`, de una regla de cohortes o de un gate de promoción no convierte por sí sola una raíz bloqueada en ejecutable.

---

#### 5. Criterio de ejecutabilidad de rollback

`DELIV-PKG-020` materializa una disposición de rollback para las 207 raíces y define, según perfil, disparadores, autoridad, detención de promoción, estado técnico seguro, estado funcional seguro, tratamiento de datos, efectos externos, irreversibilidad, conciliación y evidencia futura.

La puerta preserva las siguientes reglas:

1. rollback técnico, rollback funcional, rollback de datos, kill switch, compensación, restore, recovery, failover y conciliación no son sinónimos;
2. un kill switch puede detener exposición nueva, pero no borra hechos empresariales ni revierte datos por sí solo;
3. un rollback de datos no puede destruir historia válida ni deshacer hechos confirmados de manera silenciosa;
4. una reversa contractual no demuestra que exista hoy el comando, archivo, migración, release o artefacto físico para ejecutarla;
5. una reversa planificada no puede declararse probada sin evidencia real.

Por ello, las **167** raíces con identidad física no confirmada continúan sin artefacto ejecutable; AURA, EXT y TALENTO conservan sus respectivos gates; y las **22** raíces sin cambio físico directo no reciben un rollback de deploy inventado.

`DELIV-PKG-020` queda reconocido como diseño de rollback completo, pero ese hecho no satisface por sí solo la condición de ejecutabilidad global de `E5-GATE-004`.

---

#### 6. Criterio de ejecutabilidad de contingencia

La contingencia operativa no se reduce a “hacer rollback”. Debe permitir que un operador autorizado responda a una condición anómala mediante un procedimiento vigente, identificable y reproducible, con:

- condición de entrada;
- límites y alcance;
- autoridad y escalamiento;
- acción segura y mecanismo de contención;
- evidencia que debe conservarse;
- condición de suspensión;
- criterio de reincorporación;
- retorno gobernado a la operación normal.

`READY-GATE-008` define precisamente el criterio y la evidencia que deberán utilizarse para confirmar esa capacidad durante readiness. La propia fuente establece que E5 **no afirma que los procedimientos hayan sido ejecutados, ensayados o certificados en el ambiente objetivo**.

Por tanto, `E5-GATE-004` reconoce que el contrato de contingencia está diseñado, pero no presenta la futura comprobación de readiness como evidencia presente de ejecutabilidad real.

---

#### 7. Frontera con la evidencia posterior

La separación obligatoria es:

```text
E5
→ define rollout, rollback, contingencia, gates y evidencia esperada

IMPLEMENTACIÓN FÍSICA
→ materializa artefactos y cambios autorizados

SHELL-CI-021 / READINESS
→ obtiene evidencia real, incluida la comprobación de contingencias y rollback aplicables

CUTOVER / PILOTO
→ aplica los criterios de pausa, reversión o continuación sobre evidencia real
```

`READY-GATE-012` existe precisamente para exigir respaldo, restauración y rollback probados mediante evidencia real. Esa prueba no puede anticiparse documentalmente desde `E5-GATE-004`.

---

#### 8. Reconciliación de estados de ejecutabilidad

| Clase canónica                       |  Raíces | Rollout                                         | Rollback                                                      | Contingencia / readiness                            | Resultado E5-GATE-004              |
| ------------------------------------ | ------: | ----------------------------------------------- | ------------------------------------------------------------- | --------------------------------------------------- | ---------------------------------- |
| identidad física no confirmada       | **167** | especificado, sin release ejecutable confirmado | especificado, sin artefacto físico confirmado para la reversa | criterio futuro aplicable                           | `NO_CONFIRMABLE_COMO_EJECUTABLE`   |
| AURA bloqueada                       |  **14** | bloqueado                                       | bloqueado                                                     | no ejecutable mientras persista el bloqueo AURA     | `NO_CONFIRMABLE_COMO_EJECUTABLE`   |
| dependencia `EXT-GOV-001`            |   **2** | bloqueado                                       | condicionado                                                  | condicionado al gate externo                        | `NO_CONFIRMABLE_COMO_EJECUTABLE`   |
| TALENTO fuera de línea actual        |   **2** | fuera de línea                                  | fuera de línea                                                | no ejecutable en la línea actual                    | `NO_CONFIRMABLE_COMO_EJECUTABLE`   |
| sin cambio físico directo confirmado |  **22** | sin deploy directo; control/evidencia posterior | sin rollback de deploy propio                                 | evidencia contractual/operativa según aplicabilidad | `NO_APLICA_DEPLOY_DIRECTO`         |
| **Total**                            | **207** |                                                 |                                                               |                                                     | **condición global no satisfecha** |

No existe en el corte actual una clase adicional que pueda utilizarse para promover estas raíces a `EJECUTABLE` por inferencia.

---

#### 9. Relación con las demás puertas de E5

Esta tarea no reescribe el resultado de las puertas anteriores:

- `E5-GATE-001` conserva su conclusión propia sobre capacidades y paquetes aprobados;
- `E5-GATE-002` conserva su conclusión propia sobre propietario y destino de brechas críticas;
- `E5-GATE-003` conserva su conclusión propia sobre cobertura de requisitos no funcionales.

Tampoco anticipa las materias reservadas posteriores:

- `E5-GATE-005` evaluará si el piloto posee criterios medibles;
- `E5-GATE-006` evaluará capacitación y soporte;
- `E5-GATE-007` evaluará trazabilidad de `TREQ-*` hacia prueba, paquete y evidencia de cierre;
- `E5-GATE-008` resolverá la entrada a implementación física por paquete usando el conjunto de puertas y bloqueos vigentes.

El resultado `NO ESTÁ SATISFECHA` de esta puerta debe permanecer visible para `E5-GATE-008`; no autoriza implementación física y no se corrige por inferencia dentro de `E5-GATE-004`.

---

#### 10. Decisiones y pendientes preservados

`E5-GATE-004` no crea una nueva brecha ni reasigna los bloqueos existentes. Conserva sus destinos canónicos:

- la identidad física y el inventario ejecutable permanecen gobernados por `DELIV-PKG-014` y su trazabilidad posterior;
- AURA conserva sus condiciones canónicas de repositorio, runtime, datos e identidad física;
- las raíces externas conservan `EXT-GOV-001` como condición previa;
- TALENTO conserva su estado fuera de la línea funcional actual hasta su activación canónica;
- las raíces sin cambio físico directo permanecen como controles/evidencia y no reciben deploy o rollback ficticios;
- la comprobación real de contingencias corresponde a `READY-GATE-008` durante readiness;
- la evidencia real de respaldo, restore y rollback probado corresponde a `READY-GATE-012` durante readiness.

Ningún bloqueo se considera cerrado por el hecho de haber sido enumerado en esta puerta.

---

#### 11. Criterios de aceptación documental

`E5-GATE-004` queda documentalmente completa cuando:

1. evalúa las 207 raíces sin excluir identidades bloqueadas o sin deploy directo;
2. distingue `ESPECIFICADO`, `EJECUTABLE` y `PROBADO`;
3. conserva la reconciliación **167 + 14 + 2 + 2 + 22 = 207**;
4. no presenta rollout especificado como release ejecutable cuando la identidad física sigue abierta;
5. no presenta rollback planificado como rollback probado;
6. no presenta el criterio futuro de contingencia como evidencia ya ejecutada;
7. conserva AURA, `EXT-GOV-001`, TALENTO y los controles sin cambio físico directo sin inventar excepciones;
8. deja explícito que la condición global de `E5-GATE-004` no está satisfecha;
9. no crea ni modifica código, migraciones, datos, configuración remota ni operaciones sobre Supabase;
10. no crea ni modifica requisitos de prueba ni fragmentos del registro 04A;
11. mantiene `E5-GATE-005` como siguiente tarea reservada.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta puerta reconcilia contratos documentales ya aprobados de rollout, rollback, contingencia y evidencia futura. No introduce comportamiento ejecutable nuevo, no modifica una regla de negocio, autorización, dato, integración, algoritmo, transición de estado ni requisito de prueba existente. La ejecución y evidencia real permanecen en las tareas propietarias de implementación y readiness.

**Requisitos TREQ-* creados:** 0  
**Requisitos TREQ-* modificados:** 0  
**Fragmentos 04A afectados:** 0

---

#### 13. Continuidad canónica

##### ÚLTIMA TAREA APROBADA
E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos

##### TAREA ACTUAL APROBADA
E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables

##### SIGUIENTE TAREA RESERVADA
E5-GATE-005 — Confirmar que el piloto tiene criterios medibles


### ✅ E5-GATE-005 — Confirmar que el piloto tiene criterios medibles

**Estado:** APROBADA  
**Tarea anterior:** `E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables`  
**Tarea siguiente:** `E5-GATE-006 — Confirmar que capacitación y soporte están planificados`  
**Tipo de tarea:** documental — puerta de salida de E5 para confirmar, identidad por identidad, que el piloto previsto para las 207 raíces `GAP-PKG-*` posee criterios de aceptación medibles, un sistema reproducible de medición y una regla determinista de decisión; sin ejecutar piloto, mediciones, promoción, cutover, rollback, correcciones, despliegues, migraciones, DDL/DML, cambios de datos, configuración remota ni operaciones sobre Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`E5-GATE-005` comprueba si el piloto diseñado en E5 dispone de criterios que permitan evaluar posteriormente, con evidencia reproducible, si una instancia concreta de paquete satisface o no las condiciones de aceptación y salida.

La puerta separa cuatro conceptos que no son equivalentes:

```text
CRITERIO DEFINIDO
→ expresa qué debe cumplirse y con qué umbral o condición verificable

MÉTRICA DEFINIDA
→ expresa cómo medir, con fórmula, población, denominador, fuente, ventana y calidad

EVIDENCIA EJECUTADA
→ resultado real obtenido durante la ejecución posterior

DECISIÓN DE SALIDA
→ conclusión determinista basada en criterios y evidencia de la misma instancia
```

La existencia de criterios medibles puede confirmarse documentalmente antes de ejecutar el piloto. Esa confirmación no convierte ningún paquete en `PASS`, no demuestra una medición real y no autoriza salida, promoción ni implementación física.

---

#### 2. Resultado de la comprobación

La condición documental exigida por `E5-GATE-005` **está satisfecha**.

La comprobación encuentra una cadena completa y materializada para las **207/207** raíces:

```text
DELIV-PKG-022
→ modalidad, alcance, cohorte y duración de piloto

DELIV-PKG-023
→ perfil de aceptación, ocho criterios universales, umbrales y manifiesto de evidencia

DELIV-PKG-024
→ reconciliación de trazabilidad necesaria para aplicar el criterio de requisitos sin crear relaciones por inferencia

CUTOVER-OPS-008
→ fórmulas, numeradores, denominadores, baseline, calidad, segmentación y estados de dato

CUTOVER-OPS-009
→ regla determinista para aprobar salida, exigir correcciones, bloquear decisión o declarar no aplicabilidad demostrada
```

Controles principales:

| Control                                                           |   Resultado |
| ----------------------------------------------------------------- | ----------: |
| raíces esperadas                                                  |     **207** |
| raíces materializadas con modalidad de piloto                     | **207/207** |
| raíces materializadas con perfil de aceptación                    | **207/207** |
| criterios universales de aceptación definidos                     |       **8** |
| raíces cubiertas por el sistema de medición                       | **207/207** |
| identificadores de paquete duplicados                             |       **0** |
| identificadores de paquete faltantes                              |       **0** |
| paquetes con `PASS` por evidencia ejecutada en la fase documental |   **0/207** |

El valor **0/207 `PASS`** no contradice esta puerta: `PASS` exige ejecución y evidencia reproducible, mientras que `E5-GATE-005` confirma exclusivamente que el criterio previo para medir y decidir ya existe.

---

#### 3. Fuentes canónicas y precedencia

La puerta consume sin redefinir:

- `DELIV-PKG-022` como fuente de modalidad, alcance y duración del piloto por raíz;
- `DELIV-PKG-023` como fuente de perfiles de aceptación, umbrales, estados de cierre y `EVID-CLOSE-001`;
- `DELIV-PKG-024` como cierre documental de la reconciliación de trazabilidad que 023 había delegado;
- `CUTOVER-OPS-008` como fuente del sistema reproducible de métricas de tiempos, errores, adopción y resultado empresarial;
- `CUTOVER-OPS-009` como fuente de la regla determinista de decisión de salida;
- los principios de E5, que separan planificación de ejecución física y reservan la evidencia real del piloto a la ejecución posterior;
- la salida obligatoria de E5, que exige plan de cutover y piloto y criterios de evidencia, pero no un piloto ya ejecutado.

Precedencia utilizada:

```text
DELIV-PKG-022
→ DELIV-PKG-023
→ DELIV-PKG-024
→ CUTOVER-OPS-008
→ CUTOVER-OPS-009
→ E5-GATE-005
```

La puerta no redefine umbrales de otra fuente. Cuando un requisito no funcional posee un valor numérico propio, ese valor prevalece. Cuando una métrica empresarial no posee target canónico, se conserva como medición reproducible y no se inventa un umbral de salida.

---

#### 4. Regla de criterio medible

Para esta puerta, un criterio se considera medible únicamente cuando el expediente permite determinar de forma reproducible:

1. **qué identidad se evalúa:** paquete, candidato, ambiente, alcance y ventana;
2. **qué condición debe cumplirse:** umbral numérico, guardrail o condición verificable aprobada;
3. **cómo se observa:** fuente, fórmula o método de medición y evidencia mínima;
4. **sobre qué población o unidad:** granularidad, cohorte y denominador elegible cuando exista una tasa;
5. **durante qué ventana:** duración o periodo comparable correspondiente;
6. **quién responde por la decisión:** propietario o autoridad ya asignada por la fuente canónica;
7. **cómo se trata la calidad del dato:** cero real, ausencia de observaciones, dato no disponible, provisional, reconstruido o no aplicable sin mezclarlos;
8. **cómo cambia el resultado:** `PASS`, `FAIL`, `BLOQUEADO`, `PENDIENTE_DE_EVIDENCIA` o `NO_APLICA` para criterios, y la decisión de salida definida por CUTOVER.

Un conteo sin denominador cuando la métrica es una tasa, una ausencia de eventos con telemetría incompleta, un promedio que oculta un hard ceiling, una ventana incompleta o evidencia planeada no satisfacen esta regla.

---

#### 5. Criterios universales materializados

`DELIV-PKG-023` aporta ocho criterios de aceptación verificables. La puerta conserva sus umbrales sin simplificarlos:

| Criterio          | Regla medible confirmada                                                                                                                                                                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `AC-TREQ-001`     | **100 %** de requisitos aplicables ejecutados satisfactoriamente con evidencia reproducible; **0** fallos, bloqueos o evidencias faltantes entre los aplicables.                                       |
| `AC-NFR-001`      | **100 %** de umbrales y guardrails no funcionales aplicables satisfechos; **0** incumplimientos abiertos.                                                                                              |
| `AC-OBS-001`      | **100 %** de señales obligatorias disponibles durante la ventana; **0** alertas críticas o gaps bloqueantes sin resolver.                                                                              |
| `AC-PILOT-001`    | alcance real coincidente con 022; para piloto directo, **14 días calendario activos y al menos un ciclo operativo completo**; **0** ampliaciones no autorizadas de cohorte, sede, dispositivo o datos. |
| `AC-ROLLBACK-001` | **0** incidentes requeridos de rollback, recovery, compensation o reconciliation que permanezcan abiertos; el no disparo debe quedar demostrado cuando corresponda.                                    |
| `AC-DOC-001`      | **100 %** de documentación, runbooks, soporte y capacitación obligatorios con evidencia real cuando la fase los exija; **0** artefactos obligatorios faltantes.                                        |
| `AC-DEFECT-001`   | **0** defectos bloqueantes o mayores abiertos; **100 %** de defectos detectados clasificados, con propietario y disposición trazable.                                                                  |
| `AC-MANIFEST-001` | **100 %** de campos obligatorios del manifiesto de cierre presentes, consistentes y referenciables; **0** evidencia fabricada, huérfana o sensible innecesaria.                                        |

Estos criterios impiden una aprobación por tiempo transcurrido, promedio favorable, ausencia aparente de incidentes o evidencia incompleta.

---

#### 6. Sistema de medición del piloto

`CUTOVER-OPS-008` completa la medibilidad mediante un contrato de métrica que exige, según aplicabilidad:

- nombre y propósito de decisión;
- propietario;
- fórmula reproducible;
- numerador y denominador explícitos para tasas;
- granularidad, dimensiones y filtros;
- unidad;
- fuente y versión;
- ventana y calendario;
- baseline comparable;
- reglas de calidad, cobertura, duplicados, datos tardíos y reconciliación.

La semántica de datos conserva separados `VALIDO`, `CERO_MEDIDO`, `SIN_OBSERVACIONES`, `NO_DISPONIBLE`, `PROVISIONAL`, `RECONSTRUIDA` y `NO_APLICA`. Un denominador cero no se transforma en una tasa de cero y la ausencia de telemetría no se interpreta como ausencia de incidentes.

La cobertura documental del sistema de medición alcanza las **207 raíces exactamente una vez**, con **0 faltantes y 0 duplicados**, y conserva la distribución heredada de modalidades.

---

#### 7. Distribución canónica de modalidades y perfiles

| Modalidad / perfil                      | Cantidad | Tratamiento de medibilidad                                                                         |
| --------------------------------------- | -------: | -------------------------------------------------------------------------------------------------- |
| `PILOT-DIRECT-001` / `ACC-DIRECT-001`   |  **160** | ventana directa, ocho criterios aplicables y métricas sobre cohorte realmente expuesta             |
| `PILOT-SHARED-001` / `ACC-SHARED-001`   |    **3** | medición derivada de consumidores directos y compatibilidad; sin piloto independiente ficticio     |
| `PILOT-CONTROL-001` / `ACC-CONTROL-001` |   **26** | medición de control, observabilidad, evidencia y defectos; sin imponer exposición directa ficticia |
| `PILOT-BLOCK-AURA-001` / `ACC-AURA-001` |   **14** | criterios definidos; medición ejecutada bloqueada mientras persistan los gates AURA                |
| `PILOT-BLOCK-EXT-001` / `ACC-EXT-001`   |    **2** | criterios definidos; medición ejecutada bloqueada mientras persista el gate externo                |
| `PILOT-FUTURE-001` / `ACC-FUTURE-001`   |    **2** | criterios definidos para activación formal; métricas fuera de línea en la línea actual             |
| **Total**                               |  **207** | **207/207 con tratamiento explícito**                                                              |

Dentro de las 26 raíces de control, **22** están `PENDIENTE_DE_EVIDENCIA` sin deploy directo y **4** conservan `BLOQUEADO_014_Y_EVIDENCIA` por identidad física.

---

#### 8. Estado actual de evidencia y medición

La puerta preserva el estado real de cierre después de `DELIV-PKG-024`:

| Estado de cierre actual     | Cantidad | Interpretación para esta puerta                                                            |
| --------------------------- | -------: | ------------------------------------------------------------------------------------------ |
| `BLOQUEADO_014_Y_EVIDENCIA` |  **167** | criterios medibles existentes; ejecución/evidencia todavía bloqueada                       |
| `PENDIENTE_DE_EVIDENCIA`    |   **22** | criterios medibles existentes; falta evidencia ejecutada                                   |
| `BLOQUEADO_AURA`            |   **14** | criterios definidos; no existe exposición ejecutable mientras el gate AURA siga cerrado    |
| `BLOQUEADO_EXT_GOV`         |    **2** | criterios definidos; no existe exposición ejecutable mientras el gate externo siga cerrado |
| `FUERA_DE_LINEA_ACTUAL`     |    **2** | perfil y tratamiento definidos; medición de piloto fuera de la línea funcional actual      |
| `PASS`                      |    **0** | ningún paquete recibe aceptación por evidencia todavía inexistente                         |
| **Total**                   |  **207** | **la ausencia de `PASS` no elimina la medibilidad del criterio**                           |

La reconciliación de trazabilidad de `DELIV-PKG-024` resolvió documentalmente los 19 paquetes que 023 había enviado a reconciliación. Esa reconciliación permite aplicar el criterio correspondiente, pero no lo convierte en evidencia ejecutada ni en `PASS`.

---

#### 9. Matriz materializada de las 207 raíces

Cada identidad aparece exactamente una vez. La última columna confirma únicamente **medibilidad documental**; no es una decisión de aceptación del paquete ni evidencia de piloto ejecutado.

| `package_id`  | Modalidad 022          | Perfil 023        | Estado canónico actual      | Tratamiento de medición                                                        | Resultado E5-GATE-005           |
| ------------- | ---------------------- | ----------------- | --------------------------- | ------------------------------------------------------------------------------ | ------------------------------- |
| `GAP-PKG-001` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-002` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-003` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-004` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-005` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-006` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-007` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-008` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-009` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-010` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-011` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-012` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-013` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-014` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-015` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-016` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-017` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-018` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-019` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-020` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-021` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-022` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-023` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-024` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-025` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-026` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-027` | `PILOT-BLOCK-EXT-001`  | `ACC-EXT-001`     | `BLOQUEADO_EXT_GOV`         | criterios y métricas definidos; ejecución bloqueada por EXT-GOV-001            | **SÍ — medibilidad confirmada** |
| `GAP-PKG-028` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-029` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-030` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-031` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-032` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-033` | `PILOT-SHARED-001`     | `ACC-SHARED-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | medible por consumidores directos y compatibilidad; sin reloj de piloto propio | **SÍ — medibilidad confirmada** |
| `GAP-PKG-034` | `PILOT-SHARED-001`     | `ACC-SHARED-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | medible por consumidores directos y compatibilidad; sin reloj de piloto propio | **SÍ — medibilidad confirmada** |
| `GAP-PKG-035` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-036` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-037` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-038` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-039` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-040` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-041` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-042` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-043` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-044` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-045` | `PILOT-SHARED-001`     | `ACC-SHARED-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | medible por consumidores directos y compatibilidad; sin reloj de piloto propio | **SÍ — medibilidad confirmada** |
| `GAP-PKG-046` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-047` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-048` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-049` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-050` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-051` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-052` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-053` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-054` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-055` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-056` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-057` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-058` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-059` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-060` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-061` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-062` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `BLOQUEADO_014_Y_EVIDENCIA` | medible como control; ejecución bloqueada por identidad física                 | **SÍ — medibilidad confirmada** |
| `GAP-PKG-063` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-064` | `PILOT-FUTURE-001`     | `ACC-FUTURE-001`  | `FUERA_DE_LINEA_ACTUAL`     | criterios definidos; métricas fuera de línea hasta activación formal           | **SÍ — medibilidad confirmada** |
| `GAP-PKG-065` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `BLOQUEADO_014_Y_EVIDENCIA` | medible como control; ejecución bloqueada por identidad física                 | **SÍ — medibilidad confirmada** |
| `GAP-PKG-066` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-067` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-068` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-069` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-070` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-071` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-072` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-073` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-074` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-075` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-076` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-077` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-078` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-079` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-080` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-081` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-082` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-083` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-084` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-085` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-086` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-087` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-088` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-089` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-090` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-091` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-092` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-093` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-094` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-095` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-096` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-097` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-098` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-099` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-100` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-101` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-102` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-103` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-104` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-105` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-106` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-107` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-108` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-109` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-110` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-111` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-112` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-113` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-114` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-115` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-116` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-117` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-118` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-119` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-120` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-121` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-122` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-123` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-124` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-125` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-126` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-127` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-128` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-129` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-130` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-131` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-132` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-133` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-134` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-135` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-136` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-137` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-138` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-139` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-140` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `BLOQUEADO_014_Y_EVIDENCIA` | medible como control; ejecución bloqueada por identidad física                 | **SÍ — medibilidad confirmada** |
| `GAP-PKG-141` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-142` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-143` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-144` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-145` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-146` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-147` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-148` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-149` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-150` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-151` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-152` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-153` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-154` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-155` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-156` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-157` | `PILOT-BLOCK-EXT-001`  | `ACC-EXT-001`     | `BLOQUEADO_EXT_GOV`         | criterios y métricas definidos; ejecución bloqueada por EXT-GOV-001            | **SÍ — medibilidad confirmada** |
| `GAP-PKG-158` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-159` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-160` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-161` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-162` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-163` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-164` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-165` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-166` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-167` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-168` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-169` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-170` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-171` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-172` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `BLOQUEADO_014_Y_EVIDENCIA` | medible como control; ejecución bloqueada por identidad física                 | **SÍ — medibilidad confirmada** |
| `GAP-PKG-173` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-174` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-175` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-176` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-177` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-178` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-179` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-180` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-181` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-182` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-183` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-184` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-185` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-186` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-187` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-188` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-189` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-190` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-191` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-192` | `PILOT-BLOCK-AURA-001` | `ACC-AURA-001`    | `BLOQUEADO_AURA`            | criterios y métricas definidos; ejecución bloqueada por AURA                   | **SÍ — medibilidad confirmada** |
| `GAP-PKG-193` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-194` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-195` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-196` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-197` | `PILOT-FUTURE-001`     | `ACC-FUTURE-001`  | `FUERA_DE_LINEA_ACTUAL`     | criterios definidos; métricas fuera de línea hasta activación formal           | **SÍ — medibilidad confirmada** |
| `GAP-PKG-198` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-199` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-200` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |
| `GAP-PKG-201` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-202` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-203` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-204` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-205` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-206` | `PILOT-DIRECT-001`     | `ACC-DIRECT-001`  | `BLOQUEADO_014_Y_EVIDENCIA` | 8 criterios universales + métricas 008; ventana directa definida               | **SÍ — medibilidad confirmada** |
| `GAP-PKG-207` | `PILOT-CONTROL-001`    | `ACC-CONTROL-001` | `PENDIENTE_DE_EVIDENCIA`    | medible como control/observación; sin deploy directo ficticio                  | **SÍ — medibilidad confirmada** |

---

#### 10. Regla de decisión posterior

`CUTOVER-OPS-009` impide convertir una medición parcial en aprobación. Una futura `APROBAR_SALIDA` exige simultáneamente, para la misma identidad de paquete, candidato, ambiente, alcance y ventana:

- todos los criterios aplicables de 023 en `PASS`;
- ningún criterio aplicable en `FAIL`, `BLOQUEADO` o `PENDIENTE_DE_EVIDENCIA`;
- todo `NO_APLICA` respaldado por fuente canónica;
- duración de 022 satisfecha cuando aplique;
- ningún defecto bloqueante o mayor abierto;
- ningún rollback, recovery, compensation, reconciliation, duplicidad o diferencia bloqueante pendiente;
- señales y evidencia completas durante la ventana;
- métricas decisionales con calidad y comparabilidad suficientes;
- targets y guardrails canónicos satisfechos;
- manifiesto de evidencia completo;
- autoridad final vigente para el alcance exacto;
- ausencia de cambios materiales posteriores que invaliden la evaluación.

No existe aprobación por mero transcurso del tiempo, aprobación parcial ni compensación de un guardrail incumplido mediante una métrica empresarial favorable.

---

#### 11. Decisión de E5-GATE-005

La puerta queda resuelta así:

```text
E5-GATE-005 = PASS

CONDICIÓN EVALUADA
el piloto posee criterios medibles

RESULTADO
SATISFECHA

COBERTURA DOCUMENTAL
207/207 raíces con modalidad, perfil de aceptación y tratamiento de medición

CRITERIOS UNIVERSALES
8 criterios medibles de aceptación

SISTEMA DE MÉTRICAS
fórmulas, denominadores, baseline, calidad y comparabilidad definidos

REGLA DE SALIDA
criterio determinista definido; no admite aprobación parcial ni por tiempo

EVIDENCIA EJECUTADA
0/207 paquetes en PASS; no corresponde producirla en esta fase
```

`E5-GATE-005` confirma la existencia y suficiencia documental del sistema de medición y decisión del piloto. No modifica el resultado independiente de `E5-GATE-004` ni concede autorización de implementación física.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0  
**Requisitos modificados:** 0  
**Fragmentos 04A afectados:** 0

**Justificación:** la puerta reconcilia y confirma criterios, métricas, perfiles y reglas de decisión ya aprobados. No introduce comportamiento ejecutable, permiso, transformación de datos, contrato runtime, umbral no funcional nuevo ni regla de negocio adicional.

---

#### 13. Criterios de aceptación documental

`E5-GATE-005` queda documentalmente completa cuando:

1. se evalúan exactamente las **207** raíces `GAP-PKG-001..207`;
2. cada identidad aparece una vez, sin faltantes ni duplicados;
3. la distribución de modalidades reconcilia `160 + 3 + 26 + 14 + 2 + 2 = 207`;
4. cada raíz conserva su modalidad 022, perfil 023 y estado vigente sin promoción artificial;
5. se confirman los ocho criterios universales y sus umbrales o guardrails verificables;
6. el piloto directo conserva **14 días calendario activos y al menos un ciclo operativo completo**;
7. el sistema de métricas conserva fórmula, denominador, fuente, ventana, baseline, calidad y comparabilidad según aplicabilidad;
8. cero medido, ausencia de observaciones y dato no disponible no se confunden;
9. una métrica sin target empresarial canónico no recibe un umbral inventado;
10. la regla de salida exige todos los criterios aplicables resueltos y prohíbe aprobación parcial o por tiempo;
11. los estados actuales reconcilian `167 + 22 + 14 + 2 + 2 = 207` y se conservan **0** paquetes en `PASS`;
12. la reconciliación previa de requisitos se consume sin convertirla en evidencia de ejecución;
13. se crean **0** requisitos de prueba y se modifican **0** requisitos existentes;
14. no se ejecutan piloto, mediciones productivas, promoción, rollback, cutover, despliegues, migraciones, DDL/DML, backfills, cambios de datos, configuración remota ni operaciones sobre Supabase;
15. `E5-GATE-006` permanece reservada y no se desarrolla desde esta tarea.

---

#### 14. Continuidad canónica

##### ÚLTIMA TAREA APROBADA
E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables

##### TAREA ACTUAL APROBADA
E5-GATE-005 — Confirmar que el piloto tiene criterios medibles

##### SIGUIENTE TAREA RESERVADA
E5-GATE-006 — Confirmar que capacitación y soporte están planificados


### ✅ E5-GATE-006 — Confirmar que capacitación y soporte están planificados

**Estado:** APROBADA  
**Tarea anterior:** `E5-GATE-005 — Confirmar que el piloto tiene criterios medibles`  
**Tarea siguiente:** `E5-GATE-007 — Confirmar trazabilidad desde cada requisito TREQ-* hasta su prueba, paquete y evidencia de cierre`  
**Tipo de tarea:** documental — puerta de salida de E5 para confirmar, sobre las 207 raíces `GAP-PKG-*`, que la capacitación requerida y el modelo de soporte aplicable poseen planificación documental suficiente, con audiencia, contenido, propietario, versión, criterio de actualización, preparación de material, responsables, cobertura, suplencia, niveles de atención, escalamiento y transferencia posterior definidos; sin impartir capacitación, certificar competencia, publicar material, activar turnos, ejecutar soporte, probar escalamiento, transferir operación, ejecutar hypercare ni producir evidencia operativa posterior  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`E5-GATE-006` verifica si la salida documental de E5 conserva, para el universo completo de **207** raíces `GAP-PKG-001..207`, una planificación explícita y gobernada de:

1. documentación operativa, procedimientos, runbooks y capacitación requerida;
2. material de apoyo, población objetivo, competencia y evidencia que deberán comprobarse antes del piloto cuando sean aplicables;
3. mesa de soporte, responsables, suplencia, cobertura, niveles de atención y escalamiento;
4. continuidad de ownership durante hypercare y transferencia posterior hacia soporte ordinario.

La puerta no exige que esas actividades ya hayan ocurrido. Su pregunta es estrictamente de **planificación E5**.

---

#### 2. Resultado de la comprobación

La condición exigida por `E5-GATE-006` **ESTÁ SATISFECHA en la capa de planificación documental de E5**.

La comprobación conserva cuatro planos distintos que no pueden confundirse:

```text
planificación documental
→ existe contrato suficiente para ejecutar y verificar después

ejecución
→ la capacitación fue impartida o el soporte fue efectivamente activado

evidencia
→ existe prueba real de competencia, disponibilidad, cobertura y escalamiento

transferencia
→ soporte ordinario recibió formalmente la instancia ejecutada y su conocimiento vigente
```

`E5-GATE-006` confirma únicamente la planificación documental.

| Componente                                                                      | Resultado documental vigente                           |
| ------------------------------------------------------------------------------- | ------------------------------------------------------ |
| raíces con expediente documental y de capacitación definido por `DELIV-PKG-021` | **207/207**                                            |
| raíces con capacitación `PLANIFICADA_NO_EJECUTADA`                              | **189/207**                                            |
| raíces con capacitación `DIFERIDA_POR_GATE`                                     | **18/207**                                             |
| criterio de readiness para capacitación y material                              | **ESPECIFICADO** por `READY-GATE-009`                  |
| criterio de readiness para mesa de soporte, responsables y escalamiento         | **ESPECIFICADO** por `READY-GATE-010`                  |
| transferencia futura a soporte ordinario                                        | **ESPECIFICADA** por `HYPERCARE-OPS-008`; no ejecutada |
| raíces evaluables para transferencia futura según hypercare                     | **189/207**                                            |
| raíces que conservan gate heredado para esa transferencia                       | **18/207**                                             |
| requisitos `TREQ-*` creados o modificados por esta puerta                       | **0**                                                  |

Los **18** casos diferidos no representan ausencia de planificación. Conservan expediente documental, versión, reglas de actualización, audiencia y tratamiento previsto; lo bloqueado es la ejecución operativa mientras permanezca abierto su gate heredado.

---

#### 3. Fuentes canónicas y precedencia

La puerta consume, sin redefinirlas:

- `DELIV-PKG-021`, como fuente de documentación, runbooks, procedimientos, audiencia, propietario, versión, criterio de actualización y capacitación requerida por paquete;
- `READY-GATE-009`, como contrato de evidencia futura para capacitación, competencia, vigencia, material de apoyo y alineación con el cambio implementado;
- `READY-GATE-010`, como contrato de evidencia futura para mesa de soporte, responsables nominales, suplencia, cobertura, niveles de atención, escalamiento y continuidad del caso;
- `HYPERCARE-OPS-002`, como resolución de responsabilidad funcional y técnica, cobertura, suplencia y escalamiento durante acompañamiento intensivo;
- `HYPERCARE-OPS-008`, como criterio de transferencia posterior a soporte ordinario y documentación definitiva;
- `DELIV-PKG-023`, como fuente posterior de criterios de aceptación y evidencia de cierre sin convertir evidencia planeada en evidencia ejecutada;
- los principios de E5, que separan la aprobación de artefactos de planificación de la ejecución física posterior.

Precedencia:

```text
DELIV-PKG-021
→ READY-GATE-009 / READY-GATE-010
→ HYPERCARE-OPS-002
→ HYPERCARE-OPS-008
→ E5-GATE-006
```

Una actividad futura de readiness o hypercare no puede utilizarse para afirmar que la capacitación, la cobertura o la transferencia ya ocurrieron durante E5.

---

#### 4. Capacitación planificada por paquete

`DELIV-PKG-021` materializa un expediente documental obligatorio para cada una de las **207** raíces y fija una versión documental inicial `1.0.0`.

La planificación conserva, según aplicabilidad:

- audiencia objetivo;
- contenido y procedimiento requerido;
- propietario documental y operativo;
- runbook y relación con diagnóstico, contención, rollout y rollback;
- material de apoyo;
- versión vigente;
- criterio de actualización cuando cambien fuentes canónicas materiales;
- estado de capacitación separado de la publicación del expediente.

La semántica vigente es:

- `ESPECIFICADO_NO_PUBLICADO`: el contenido obligatorio está definido sin afirmar publicación operativa;
- `PLANIFICADA_NO_EJECUTADA`: la capacitación requerida está especificada pero no impartida;
- `DIFERIDA_POR_GATE`: la capacitación operativa solo podrá ejecutarse después de cerrar el bloqueo heredado.

La distribución queda reconciliada así:

```text
189 PLANIFICADA_NO_EJECUTADA
+ 18 DIFERIDA_POR_GATE
= 207 raíces con planificación documental
```

---

#### 5. Tratamiento de las 18 raíces con capacitación diferida

Las **18** raíces con capacitación `DIFERIDA_POR_GATE` corresponden exactamente a:

| Familia de bloqueo heredado   | Cantidad | Tratamiento                                                                    |
| ----------------------------- | -------: | ------------------------------------------------------------------------------ |
| AURA                          |   **14** | capacitación operativa diferida mientras persista su gate                      |
| `EXT-GOV-001`                 |    **2** | capacitación operativa diferida mientras persista el gate externo              |
| TALENTO fuera de línea actual |    **2** | capacitación operativa diferida mientras la línea funcional no esté habilitada |
| **Total**                     |   **18** | planificación conservada; ejecución no afirmada                                |

E5 no fabrica instrucciones ejecutables sobre una implementación inexistente ni convierte esos bloqueos en ausencia de diseño.

---

#### 6. Readiness de capacitación y material de apoyo

`READY-GATE-009` deja especificado el contrato que `SHELL-CI-021::<package_id>` deberá ejecutar posteriormente.

La preparación se separa en planos independientes que abarcan:

- capacitación aplicable;
- competencia y vigencia;
- material de apoyo;
- alineación entre paquete, candidato, procedimiento, versión formativa, material y población objetivo.

La ejecución futura deberá poder reconciliar población objetivo, completada, aprobada, pendiente y vencida; controlar versión, propiedad, aprobación, vigencia y accesibilidad del material; y exigir simulacro, walkthrough o práctica cuando el riesgo o la contingencia lo requieran.

Una capacitación programada, una invitación, una lista de asistencia, una presentación o un archivo publicado no constituyen por sí solos evidencia de competencia ni readiness.

---

#### 7. Soporte planificado

`READY-GATE-010` deja especificado el modelo de comprobación que `SHELL-CI-021::<package_id>` deberá ejecutar antes del piloto.

El soporte se gobierna mediante seis planos:

1. `MESA_Y_ENTRADA`;
2. `RESPONSABLES_NOMINALES`;
3. `COBERTURA_Y_DISPONIBILIDAD`;
4. `NIVELES_DE_ATENCION`;
5. `ESCALAMIENTO`;
6. `COMUNICACION_Y_CONTINUIDAD_DEL_CASO`.

Para esos planos quedan definidos criterios `PASS`, `FAIL`, `BLOQUEADO` y `NO_APLICA`, junto con una agregación estricta que impide aprobar una muestra parcial o compensar una ausencia crítica con porcentajes agregados.

La planificación incluye titular, suplente, alcance, segregación, cobertura por servicio/sede/ventana, receptor de cada nivel de atención, rutas de escalamiento y continuidad del owner durante handoffs y esperas.

La existencia de esta definición no afirma todavía que las personas nominales estén configuradas, que la cobertura real esté vigente o que una prueba de escalamiento haya sido ejecutada. Esas evidencias permanecen `PENDIENTE_DE_EVIDENCIA` para `SHELL-CI-021::<package_id>`.

---

#### 8. Responsabilidad durante hypercare

`HYPERCARE-OPS-002` conserva para cada paquete la separación entre:

```text
RESPONSABILIDAD FUNCIONAL
≠ RESPONSABILIDAD TÉCNICA
≠ EJECUTOR
≠ SOPORTE ORDINARIO
≠ AUTORIDAD FINAL DE CIERRE
```

La responsabilidad de hypercare hereda las fuentes canónicas de ownership, autoridad técnica, cobertura, suplencia y escalamiento, sin crear una organización paralela ni un owner ficticio de acompañamiento intensivo.

Esta capa asegura que la planificación de soporte no termine en readiness: también existe un contrato explícito para sostener ownership durante estabilización y entregar posteriormente la operación al modelo ordinario.

---

#### 9. Transferencia posterior a soporte ordinario

`HYPERCARE-OPS-008` define el gate documental de transferencia desde acompañamiento intensivo hacia soporte ordinario.

La transferencia exige, según aplicabilidad:

- documentación definitiva correspondiente a la instancia realmente ejecutada;
- conocimiento y material de apoyo vigentes;
- capacitación y competencia demostrables cuando sean requeridas;
- observabilidad y escalamiento operables;
- rollback, recovery y contingencias conocidas;
- known errors, workarounds, deuda y trabajo posterior con propietario y destino;
- handoff trazable sin pérdida de ownership.

La reconciliación heredada conserva:

```text
189 raíces evaluables para transferencia futura
+ 18 raíces con gate heredado cerrado
= 207 raíces
```

Todas permanecen en estado documental `ESPECIFICADO`; ninguna transferencia se presenta como ejecutada dentro de E5.

---

#### 10. Regla de decisión de `E5-GATE-006`

La condición de esta puerta se considera satisfecha cuando, para el universo aplicable:

1. existe planificación documental de capacitación con audiencia, contenido, propietario, versión y criterio de actualización;
2. cualquier ejecución diferida conserva gate, causa y condición de salida explícitos;
3. existe un criterio verificable para demostrar posteriormente capacitación, competencia, vigencia y material de apoyo;
4. existe un modelo verificable de mesa de soporte, responsables, suplencia, cobertura, atención y escalamiento;
5. existe continuidad de responsabilidad durante hypercare;
6. existe criterio explícito de transferencia posterior hacia soporte ordinario;
7. ninguna de esas definiciones se confunde con evidencia de ejecución real.

Las siete condiciones están materializadas en las fuentes propietarias vigentes.

**Resultado:** la condición de `E5-GATE-006` está satisfecha en la capa de planificación documental de E5.

Este resultado no declara `PASS` de `READY-GATE-009`, `READY-GATE-010` ni `HYPERCARE-OPS-008` en ejecución.

---

#### 11. Límites de la aprobación

`E5-GATE-006` **sí confirma**:

- planificación de documentación, procedimientos, runbooks y capacitación para las 207 raíces;
- tratamiento explícito de las 18 raíces cuya capacitación operativa está diferida por gate;
- contrato de evidencia futura para capacitación y material de apoyo;
- contrato de evidencia futura para mesa de soporte, responsables, cobertura y escalamiento;
- continuidad de ownership durante hypercare;
- criterio de transferencia posterior a soporte ordinario.

`E5-GATE-006` **no confirma**:

- que la capacitación haya sido impartida;
- que la competencia haya sido aprobada;
- que materiales estén publicados, accesibles o vigentes en el ambiente real;
- que titulares y suplentes estén efectivamente disponibles;
- que la cobertura de soporte esté activa;
- que una escalación real haya sido probada;
- que la instancia haya entrado o salido de hypercare;
- que la transferencia a soporte ordinario haya ocurrido;
- que los 18 gates heredados estén cerrados;
- que un paquete esté autorizado para implementación física.

---

#### 12. Carryovers y propietarios

No se crea ningún pendiente narrativo nuevo.

- evidencia real de capacitación, competencia y material: `SHELL-CI-021::<package_id>` mediante `READY-GATE-009`;
- evidencia real de mesa, responsables, cobertura y escalamiento: `SHELL-CI-021::<package_id>` mediante `READY-GATE-010`;
- ownership funcional y técnico durante estabilización: `HYPERCARE-OPS-002` y `SHELL-CI-023::<package_id>`;
- transferencia real a soporte ordinario y documentación definitiva: `HYPERCARE-OPS-008`, `SHELL-CI-023::<package_id>` y certificación posterior de `SHELL-CI-024::<package_id>`;
- cierre de los **18** gates heredados: fuentes propietarias AURA, `EXT-GOV-001` y TALENTO, sin reasignación desde esta puerta;
- autorización física final: `E5-GATE-008`.

---

#### 13. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0  
**Requisitos modificados:** 0  
**Fragmentos 04A afectados:** 0

**Justificación:** `E5-GATE-006` reconcilia artefactos documentales ya aprobados de capacitación, soporte, readiness y hypercare. No introduce comportamiento funcional, autorización, transición de datos, integración, cálculo, SLA, algoritmo, umbral NFR ni mecanismo técnico nuevo. Las obligaciones verificables continúan protegidas por los requisitos y contratos existentes y su evidencia real pertenece a las fases de ejecución posteriores.

---

#### 14. Criterios de aceptación documental

`E5-GATE-006` queda documentalmente completa cuando:

1. [x] conserva `E5-GATE-005 → E5-GATE-006 → E5-GATE-007`;
2. [x] evalúa exactamente las **207** raíces `GAP-PKG-001..207`;
3. [x] confirma que las **207** poseen expediente documental y de capacitación definido por `DELIV-PKG-021`;
4. [x] reconcilia **189** capacitaciones `PLANIFICADA_NO_EJECUTADA` y **18** `DIFERIDA_POR_GATE`;
5. [x] reconcilia las 18 diferidas como **14 AURA + 2 EXT + 2 TALENTO**;
6. [x] no trata una capacitación planificada como capacitación ejecutada;
7. [x] conserva `READY-GATE-009` como propietario de la evidencia futura de capacitación, competencia y material;
8. [x] conserva `READY-GATE-010` como propietario de la evidencia futura de mesa, responsables, cobertura y escalamiento;
9. [x] conserva la segregación entre responsabilidad funcional, técnica, ejecución, soporte ordinario y cierre;
10. [x] conserva `HYPERCARE-OPS-008` como propietario del criterio de transferencia a soporte ordinario;
11. [x] reconcilia **189** raíces evaluables y **18** bloqueadas para transferencia futura, sin afirmar transferencia ejecutada;
12. [x] mantiene evidencia real de readiness y hypercare fuera de E5;
13. [x] no cierra ni modifica los gates heredados AURA, EXT o TALENTO;
14. [x] no autoriza implementación física;
15. [x] crea **0** requisitos `TREQ-*`, modifica **0** requisitos y afecta **0** fragmentos 04A;
16. [x] no ejecuta capacitación, soporte, publicación, monitoreo, escalamiento, hypercare, transferencias, despliegues, migraciones, DDL/DML, cambios de datos, configuración remota ni operaciones sobre Supabase;
17. [x] `E5-GATE-007` permanece exclusivamente reservada.

---

#### 15. Continuidad canónica

##### ÚLTIMA TAREA APROBADA
E5-GATE-005 — Confirmar que el piloto tiene criterios medibles

##### TAREA ACTUAL APROBADA
E5-GATE-006 — Confirmar que capacitación y soporte están planificados

##### SIGUIENTE TAREA RESERVADA
E5-GATE-007 — Confirmar trazabilidad desde cada requisito TREQ-* hasta su prueba, paquete y evidencia de cierre


### [ ] E5-GATE-007 — Confirmar trazabilidad desde cada requisito `TREQ-*` hasta su prueba, paquete y evidencia de cierre
### [ ] E5-GATE-008 — Aprobar entrada a implementación física por paquetes

`E5-GATE-008` solo puede comprobar que el paquete y sus planes previos son
completos y ejecutables. No depende de `READY-GATE-*` ejecutados ni de
evidencia posterior al despliegue.

Después de `E5-GATE-008`, la secuencia propietaria será:

```text
SHELL-CI-020
→ SHELL-CI-021
→ SHELL-CI-022
→ SHELL-CI-023
→ SHELL-CI-024
```

BLOQUE R se intercalará cuando el paquete incluya cambios físicos de Supabase,
y BLOQUE U certificará la regresión e integración transversal aplicables.

### Instancia de puerta por paquete

Para un carril prioritario, la puerta se ejecutará como:

```text
E5-GATE-008::<package_id>
```

La instancia deberá registrar:

- versión aprobada del paquete;
- capacidades, procesos, vistas, acciones y brechas incluidas;
- artefactos transversales consumidos y estado real de sus tareas fuente;
- dependencias excluidas y fundamento de no aplicabilidad;
- repositorios y ambientes;
- migraciones de BLOQUE R aplicables;
- pruebas, readiness, cutover, piloto, hypercare y rollback;
- aprobadores y fecha;
- hash o versión inmutable del expediente.

Una instancia aprobada habilita únicamente su `package_id`. No cambia por sí
sola el marcador de `E5-GATE-008`, no cierra E5 y no habilita otro paquete.
