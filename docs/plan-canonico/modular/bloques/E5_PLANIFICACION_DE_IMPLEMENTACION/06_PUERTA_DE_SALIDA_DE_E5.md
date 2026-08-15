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


### [ ] E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos
### [ ] E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables
### [ ] E5-GATE-005 — Confirmar que el piloto tiene criterios medibles
### [ ] E5-GATE-006 — Confirmar que capacitación y soporte están planificados
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
