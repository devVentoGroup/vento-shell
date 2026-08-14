### PAQUETES DE IMPLEMENTACIÓN

### ✅ DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage`
**Tarea siguiente:** `DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id`
**Tipo de tarea:** documental — definición normativa y materialización completa de identidad estable de paquetes de implementación

---

#### 1. Resultado canónico

`DELIV-PKG-001` fija el espacio de identidad estable que E5 deberá utilizar para todos los paquetes de implementación derivados del registro canónico de brechas.

El universo vigente queda compuesto por **207 identidades `GAP-PKG-*` continuas y únicas**, desde `GAP-PKG-001` hasta `GAP-PKG-207`.

La composición del universo se conserva con procedencia explícita:

- `GAP-PKG-001..201`: línea base histórica pre-E5 producida por `GAP-CTRL-006`;
- `GAP-PKG-202..207`: delta append-only producido por `PROC-COVER-010`;
- ninguna de las 201 identidades históricas es renumerada, sustituida, fusionada ni eliminada por la incorporación del delta;
- los seis identificadores nuevos se agregan al final del espacio existente y no reinterpretan ninguna fila histórica.

`package_id` identifica de forma permanente un expediente de implementación y su linaje. No representa estado, prioridad, ola, fecha, repositorio, rama, commit, release, ambiente, despliegue, rollback ni evidencia de ejecución.

---

#### 2. Precedencia y reconciliación de la línea base

La aparente diferencia entre **201** y **207** paquetes corresponde a dos momentos de la misma línea canónica y no a dos universos competidores.

| Capa                              | Paquetes | Brechas | Tratamiento         |
| --------------------------------- | -------: | ------: | ------------------- |
| Línea histórica de `GAP-CTRL-006` |  **201** | **814** | se preserva íntegra |
| Delta de `PROC-COVER-010`         |   **+6** |  **+6** | append-only         |
| Universo vigente para E5          |  **207** | **820** | normativo           |

La regla de precedencia es obligatoria: los conteos vigentes **820/207** prevalecen para planificación posterior, mientras que las filas históricas **814/201** permanecen válidas como procedencia y trazabilidad.

No se permite tratar `GAP-PKG-202..207` como correcciones retroactivas de los primeros 201 paquetes ni volver a una línea base de 201 por utilizar una sección histórica del registro.

---

#### 3. Contrato de identidad estable

Se conserva `IMPLEMENTATION-PACKAGE-IDENTITY-CONTRACT-001@1.1.0` como contrato documental de esta tarea.

##### 3.1. Invariantes

1. Todo paquete reconocido por E5 posee exactamente un `package_id` estable.
2. Todo `package_id` reconocido debe estar materializado documentalmente; una cadena con sintaxis válida no basta para crear identidad.
3. Un identificador asignado no se renumera ni se reutiliza.
4. Cambios de título, estado, prioridad, ola, fecha, repositorio, ambiente o revisión no cambian el `package_id`.
5. `package_id` no sustituye `task_id`, `capability_id`, `process_id`, `gap_id`, requisito de prueba, identificador de aplicación, migración, release o commit.
6. Una división, fusión o sustitución posterior debe preservar el linaje de todos los `GAP-PKG-*` de origen.
7. La incorporación append-only de `GAP-PKG-202..207` no altera identidad, historial, perfiles ni membresía de `GAP-PKG-001..201`.
8. No se crean identidades por semejanza semántica, coincidencia de propietario, capacidad, proceso, tarea o aplicación.
9. La identidad documental no certifica por sí sola una frontera física única de repositorio, despliegue o rollback.
10. La ausencia todavía de una frontera física certificada tiene propietario documental posterior y no convierte el paquete en huérfano.

##### 3.2. Campos de identidad y linaje

| Campo                     | Semántica canónica            | Regla                                                                |
| ------------------------- | ----------------------------- | -------------------------------------------------------------------- |
| `package_id`              | identidad permanente          | inmutable mientras represente el mismo expediente                    |
| `package_revision`        | revisión del expediente       | monotónica dentro del mismo `package_id`                             |
| `package_status`          | estado documental u operativo | separado de identidad                                                |
| `package_title`           | nombre humano                 | modificable sin renumeración                                         |
| `implementation_unit_id`  | unidad física ejecutable      | se materializa después de definir repositorio, despliegue y rollback |
| `derived_from_package_id` | linaje por división           | solo con decisión explícita                                          |
| `merged_from_package_ids` | linaje por fusión             | solo con decisión explícita                                          |
| `supersedes_package_id`   | linaje por sustitución        | solo con decisión explícita                                          |

Los campos de linaje permanecen vacíos mientras no exista una decisión canónica que los materialice.

---

#### 4. Regla de ratificación, división y fusión

1. `GAP-PKG-001..207` quedan ratificados como identidades raíz estables disponibles para E5.
2. Esta tarea no certifica que cada identidad corresponda ya a una única unidad física de despliegue, porque todavía no existen las decisiones de propietario, archivos, dependencias, despliegue y rollback de `DELIV-PKG-003`, `014`, `015`, `019` y `020`.
3. La frontera física se expresará mediante `implementation_unit_id`, separada de `package_id`: un expediente podrá conservar una o varias unidades y una unidad compartida podrá referenciar varios expedientes solo con linaje explícito.
4. `DELIV-PKG-025` deberá registrar para cada uno de los 207 expedientes exactamente una decisión `KEEP_AS_SINGLE_UNIT`, `SPLIT_INTO_IMPLEMENTATION_UNITS` o `SHARE_IMPLEMENTATION_UNIT_WITH_LINEAGE`; sin esa decisión no podrá aprobar el catálogo.
5. Una división física no podrá borrar el `package_id` de origen y deberá asignar cada brecha afectada a una unidad ejecutable.
6. Una unidad compartida no podrá borrar ninguno de los `package_id` de origen ni mezclar propietarios, dependencias, despliegues o rollbacks incompatibles.
7. Una sustitución no podrá reutilizar un identificador retirado para un expediente distinto.
8. Ninguna decisión posterior podrá compactar el rango para eliminar huecos históricos.
9. `GAP-PKG-202..207` ya son identidades reales del catálogo vigente y no quedan "reservadas" ni "pendientes de numeración".

Esta secuencia rectifica expresamente la instrucción histórica de `GAP-CTRL-006` que concentraba ratificación, división y fusión en `DELIV-PKG-001`. E5 fija primero la identidad raíz y certifica la frontera física en `DELIV-PKG-025`, después de reunir la evidencia necesaria, sin multiplicar ni aprobar por separado los marcadores globales `DELIV-PKG-*`.

---

#### 5. Materialización completa del espacio `GAP-PKG-001..207`

Cada fila siguiente representa una identidad canónica reconocida. La matriz no anticipa la frontera física de despliegue; únicamente certifica existencia, continuidad, procedencia y decisión de identidad.

| Identidad fuente | Procedencia                                                     | Decisión                                 | `package_id` canónico | Estado de identidad | Frontera física                |
| ---------------- | --------------------------------------------------------------- | ---------------------------------------- | --------------------- | ------------------- | ------------------------------ |
| `GAP-PKG-001`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-001`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-002`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-002`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-003`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-003`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-004`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-004`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-005`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-005`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-006`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-006`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-007`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-007`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-008`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-008`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-009`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-009`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-010`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-010`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-011`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-011`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-012`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-012`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-013`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-013`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-014`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-014`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-015`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-015`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-016`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-016`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-017`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-017`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-018`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-018`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-019`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-019`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-020`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-020`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-021`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-021`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-022`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-022`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-023`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-023`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-024`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-024`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-025`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-025`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-026`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-026`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-027`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-027`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-028`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-028`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-029`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-029`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-030`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-030`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-031`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-031`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-032`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-032`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-033`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-033`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-034`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-034`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-035`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-035`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-036`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-036`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-037`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-037`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-038`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-038`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-039`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-039`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-040`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-040`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-041`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-041`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-042`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-042`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-043`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-043`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-044`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-044`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-045`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-045`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-046`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-046`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-047`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-047`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-048`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-048`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-049`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-049`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-050`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-050`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-051`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-051`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-052`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-052`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-053`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-053`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-054`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-054`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-055`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-055`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-056`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-056`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-057`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-057`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-058`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-058`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-059`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-059`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-060`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-060`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-061`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-061`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-062`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-062`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-063`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-063`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-064`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-064`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-065`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-065`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-066`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-066`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-067`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-067`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-068`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-068`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-069`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-069`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-070`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-070`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-071`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-071`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-072`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-072`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-073`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-073`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-074`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-074`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-075`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-075`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-076`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-076`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-077`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-077`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-078`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-078`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-079`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-079`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-080`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-080`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-081`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-081`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-082`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-082`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-083`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-083`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-084`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-084`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-085`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-085`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-086`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-086`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-087`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-087`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-088`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-088`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-089`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-089`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-090`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-090`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-091`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-091`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-092`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-092`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-093`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-093`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-094`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-094`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-095`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-095`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-096`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-096`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-097`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-097`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-098`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-098`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-099`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-099`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-100`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-100`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-101`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-101`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-102`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-102`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-103`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-103`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-104`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-104`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-105`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-105`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-106`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-106`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-107`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-107`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-108`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-108`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-109`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-109`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-110`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-110`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-111`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-111`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-112`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-112`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-113`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-113`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-114`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-114`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-115`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-115`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-116`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-116`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-117`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-117`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-118`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-118`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-119`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-119`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-120`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-120`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-121`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-121`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-122`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-122`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-123`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-123`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-124`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-124`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-125`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-125`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-126`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-126`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-127`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-127`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-128`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-128`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-129`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-129`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-130`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-130`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-131`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-131`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-132`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-132`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-133`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-133`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-134`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-134`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-135`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-135`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-136`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-136`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-137`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-137`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-138`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-138`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-139`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-139`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-140`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-140`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-141`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-141`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-142`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-142`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-143`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-143`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-144`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-144`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-145`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-145`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-146`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-146`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-147`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-147`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-148`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-148`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-149`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-149`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-150`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-150`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-151`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-151`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-152`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-152`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-153`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-153`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-154`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-154`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-155`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-155`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-156`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-156`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-157`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-157`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-158`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-158`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-159`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-159`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-160`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-160`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-161`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-161`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-162`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-162`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-163`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-163`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-164`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-164`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-165`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-165`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-166`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-166`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-167`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-167`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-168`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-168`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-169`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-169`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-170`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-170`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-171`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-171`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-172`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-172`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-173`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-173`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-174`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-174`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-175`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-175`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-176`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-176`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-177`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-177`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-178`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-178`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-179`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-179`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-180`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-180`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-181`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-181`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-182`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-182`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-183`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-183`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-184`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-184`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-185`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-185`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-186`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-186`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-187`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-187`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-188`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-188`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-189`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-189`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-190`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-190`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-191`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-191`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-192`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-192`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-193`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-193`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-194`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-194`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-195`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-195`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-196`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-196`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-197`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-197`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-198`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-198`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-199`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-199`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-200`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-200`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-201`    | `GAP-CTRL-006` — línea base histórica pre-E5                    | `PRESERVAR_Y_RATIFICAR_IDENTIDAD_PRE_E5` | `GAP-PKG-201`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-202`    | `PROC-COVER-010` — delta append-only posterior a `GAP-CTRL-006` | `INCORPORAR_IDENTIDAD_APPEND_ONLY`       | `GAP-PKG-202`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-203`    | `PROC-COVER-010` — delta append-only posterior a `GAP-CTRL-006` | `INCORPORAR_IDENTIDAD_APPEND_ONLY`       | `GAP-PKG-203`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-204`    | `PROC-COVER-010` — delta append-only posterior a `GAP-CTRL-006` | `INCORPORAR_IDENTIDAD_APPEND_ONLY`       | `GAP-PKG-204`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-205`    | `PROC-COVER-010` — delta append-only posterior a `GAP-CTRL-006` | `INCORPORAR_IDENTIDAD_APPEND_ONLY`       | `GAP-PKG-205`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-206`    | `PROC-COVER-010` — delta append-only posterior a `GAP-CTRL-006` | `INCORPORAR_IDENTIDAD_APPEND_ONLY`       | `GAP-PKG-206`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |
| `GAP-PKG-207`    | `PROC-COVER-010` — delta append-only posterior a `GAP-CTRL-006` | `INCORPORAR_IDENTIDAD_APPEND_ONLY`       | `GAP-PKG-207`         | `ESPECIFICADO`      | `NO_CERTIFICADA_EN_ESTA_TAREA` |

---

#### 6. Delta append-only `GAP-PKG-202..207`

Los seis paquetes incorporados por `PROC-COVER-010` se materializan con su contexto ya aprobado para impedir que la identidad se separe de su procedencia.

| `package_id`  | `gap_id` de origen     | `capability_id` | proceso de contexto | Clase         | Propietario de brecha | Ola  | Fecha        | Perfil de cierre | Estado de enrutamiento |
| ------------- | ---------------------- | --------------- | ------------------- | ------------- | --------------------- | ---- | ------------ | ---------------- | ---------------------- |
| `GAP-PKG-202` | `H-PROC-COVER-010-001` | `CAP-01.07`     | `VPROC-0063`        | `OPERACION`   | `OWN-GG`              | `W4` | `2026-10-23` | `CLOSE-OPE-ADP`  | `OPEN_ROUTED`          |
| `GAP-PKG-203` | `H-PROC-COVER-010-002` | `CAP-01.09`     | `VPROC-0064`        | `CONTRACTUAL` | `OWN-GG`              | `W1` | `2026-08-21` | `CLOSE-CON-CTR`  | `OPEN_ROUTED`          |
| `GAP-PKG-204` | `H-PROC-COVER-010-003` | `CAP-03.03`     | `VPROC-0066`        | `OPERACION`   | `OWN-SST`             | `W2` | `2026-09-11` | `CLOSE-OPE-ADP`  | `OPEN_ROUTED`          |
| `GAP-PKG-205` | `H-PROC-COVER-010-004` | `CAP-10.06`     | `VPROC-0068`        | `FUNCIONAL`   | `OWN-COM`             | `W4` | `2026-10-23` | `CLOSE-FUN-VAL`  | `OPEN_ROUTED`          |
| `GAP-PKG-206` | `H-PROC-COVER-010-005` | `CAP-12.11`     | `VPROC-0069`        | `FUNCIONAL`   | `OWN-FIN`             | `W4` | `2026-10-23` | `CLOSE-FUN-IMP`  | `OPEN_ROUTED`          |
| `GAP-PKG-207` | `H-PROC-COVER-010-006` | `CAP-15.06`     | `VPROC-TRANSVERSAL` | `TECNICA`     | `OWN-TEC`             | `W3` | `2026-10-02` | `CLOSE-TEC-VAL`  | `OPEN_ROUTED`          |

Estos seis paquetes son **adiciones**, no reemplazos de paquetes históricos. Cada uno incorpora una sola brecha nueva y un solo perfil de cierre en el delta vigente.

---

#### 7. Reconciliación cuantitativa de identidades

##### 7.1. Por origen

| Origen           | Identidades | Resultado             |
| ---------------- | ----------: | --------------------- |
| `GAP-CTRL-006`   |     **201** | preservadas           |
| `PROC-COVER-010` |       **6** | agregadas append-only |
| Total vigente    |     **207** | reconciliado          |

##### 7.2. Por perfil de cierre

La línea histórica registraba **160 paquetes de un solo perfil** y **41 multiperfil**. Los seis paquetes nuevos tienen un único perfil cada uno.

| Tipo             | Históricos | Delta | Vigente |
| ---------------- | ---------: | ----: | ------: |
| un solo perfil   |        160 |    +6 | **166** |
| más de un perfil |         41 |    +0 |  **41** |
| total            |        201 |    +6 | **207** |

Un paquete multiperfil conserva las obligaciones independientes de cada perfil; la identidad común no autoriza a aplicar el criterio de cierre más débil al conjunto.

##### 7.3. Por ola

| Ola       | Brechas vigentes | Paquetes vigentes |
| --------- | ---------------: | ----------------: |
| `W0`      |           **28** |             **5** |
| `W1`      |          **302** |            **72** |
| `W2`      |          **223** |            **55** |
| `W3`      |          **121** |            **14** |
| `W4`      |          **108** |            **46** |
| `W5`      |           **38** |            **15** |
| **Total** |          **820** |           **207** |

##### 7.4. Por clasificación

| Clasificación | Brechas vigentes | Paquetes vigentes |
| ------------- | ---------------: | ----------------: |
| `FUNCIONAL`   |          **189** |            **50** |
| `CONTRACTUAL` |          **103** |            **37** |
| `TECNICA`     |          **221** |            **36** |
| `DATOS`       |          **126** |            **44** |
| `SEGURIDAD`   |           **98** |            **12** |
| `OPERACION`   |           **83** |            **28** |
| **Total**     |          **820** |           **207** |

---

#### 8. Identidades relacionadas fuera del rango `GAP-PKG-*`

##### 8.1. `VISO-SCHEDULE-MONTHLY-001`

`VISO-SCHEDULE-MONTHLY-001` conserva su identidad descriptiva expresamente reservada. No se renombra como `GAP-PKG-*`, no consume un número del rango `001..207` y no se fusiona por semejanza funcional con un paquete del registro de brechas.

Su existencia no modifica el conteo de **207 paquetes `GAP-PKG-*`** derivados del registro canónico de brechas.

##### 8.2. `NEXO-REMISSIONS-001`

`NEXO-REMISSIONS-001` conserva su naturaleza de identidad histórica de carril. No se convierte implícitamente en `package_id` y no entra en el conteo `GAP-PKG-001..207` mientras no exista una asignación documental explícita distinta.

---

#### 9. Unicidad, continuidad y no reutilización

La identidad queda inválida si ocurre cualquiera de estas condiciones:

- un mismo `GAP-PKG-*` identifica dos expedientes diferentes;
- un expediente recibe dos `package_id` sin una decisión explícita de linaje;
- falta cualquier número dentro de `001..207` sin antecedente de retiro canónico;
- aparece un `GAP-PKG-*` superior a `207` sin fuente aprobada que lo cree;
- `GAP-PKG-202..207` se absorbe dentro de un paquete histórico sin conservar linaje;
- un identificador histórico se reutiliza para otro alcance;
- una identidad descriptiva ajena se cuenta automáticamente como `GAP-PKG-*`.

La secuencia vigente cumple: **207 identificadores, 207 valores únicos, rango continuo `001..207`, cero colisiones conocidas en el catálogo aprobado**.

---

#### 10. Instancias y ejecuciones

La identidad de paquete se mantiene separada de cada ejecución concreta. Una implementación posterior podrá materializar, como mínimo, relaciones conceptuales equivalentes a:

```text
package_id
package_revision
implementation_unit_id
implementation_instance_id
source_revision
artifact_revision
migration_ids[]
deployment_id
rollback_reference
executed_at
executed_by
verification_evidence[]
```

Esta estructura no se materializa físicamente en `DELIV-PKG-001`; únicamente fija que ninguna instancia, release o despliegue puede sustituir la identidad estable del paquete.

---

#### 11. Fronteras de responsabilidad

`DELIV-PKG-001` **sí cierra**:

- existencia y continuidad del espacio `GAP-PKG-001..207`;
- procedencia histórica `001..201` y append-only `202..207`;
- invariantes de identidad, revisión y linaje;
- tratamiento separado de `VISO-SCHEDULE-MONTHLY-001` y `NEXO-REMISSIONS-001`;
- prohibición de renumeración, reutilización, fusión implícita o creación inferida.

`DELIV-PKG-001` **no cierra**:

- relaciones `package_id` ↔ capacidad/proceso/brecha, responsabilidad de `DELIV-PKG-002`;
- aplicación, dominio o repositorio propietario, responsabilidad de `DELIV-PKG-003`;
- resultado AS-IS/TO-BE, alcance funcional, componentes, contratos técnicos, dependencias, despliegue, rollback o evidencia de ejecución de tareas posteriores del bloque E5.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

La tarea corrige y consolida identidad documental ya gobernada por el registro canónico de brechas. No introduce comportamiento ejecutable, regla de negocio nueva, cambio de autorización, migración, contrato de runtime ni modificación de un requisito `TREQ-*`.

---

#### 13. Criterios de aceptación

`DELIV-PKG-001` queda cerrada únicamente cuando se cumplen simultáneamente:

- [x] `GAP-PKG-001..201` conserva exactamente sus identidades históricas.
- [x] `GAP-PKG-202..207` queda incorporado como delta append-only de `PROC-COVER-010`.
- [x] El universo vigente contiene **207** `package_id` `GAP-PKG-*` únicos y continuos.
- [x] Ninguna de las **814** brechas históricas es reidentificada por el delta.
- [x] Las **6** brechas nuevas conservan paquetes `202..207` uno a uno.
- [x] Los conteos actuales reconciliados son **820 brechas / 207 paquetes**.
- [x] Los **22** registros de control/evidencia no crean identidades de paquete adicionales.
- [x] `VISO-SCHEDULE-MONTHLY-001` permanece separado del conteo `GAP-PKG-*`.
- [x] `NEXO-REMISSIONS-001` permanece como carril histórico, no como paquete inferido.
- [x] No se certifica prematuramente aplicación, repositorio, despliegue ni rollback.
- [x] La instrucción histórica de división/fusión queda reconciliada: `DELIV-PKG-025` deberá cerrar una decisión física por cada expediente raíz con linaje completo.
- [x] No se crea ni modifica ningún requisito de prueba.

---

#### 14. Continuidad

**ÚLTIMA TAREA APROBADA**
`EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage`

**TAREA ACTUAL APROBADA**
`DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación`

**SIGUIENTE TAREA RESERVADA**
`DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id`


### ✅ DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id

**Estado:** APROBADA
**Tarea anterior:** `DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación`
**Tarea siguiente:** `DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios`
**Tipo de tarea:** documental — materialización y gobierno de trazabilidad canónica paquete ↔ capacidad ↔ proceso ↔ brecha

---

#### 1. Resultado canónico

`DELIV-PKG-002` cierra la trazabilidad estructural entre las **207 identidades `GAP-PKG-001..207`** y las **820 brechas reales vigentes** del registro canónico.

El resultado no es una clasificación nueva ni una segunda fuente de verdad. La tarea fija cómo E5 consume, preserva y verifica las relaciones ya aprobadas sin perder granularidad ni reinterpretar la línea histórica.

La reconciliación obligatoria es:

```text
814 brechas históricas
+  6 brechas append-only de PROC-COVER-010
=820 brechas reales vigentes

201 paquetes históricos
+  6 paquetes append-only
=207 package_id GAP-PKG-* vigentes

820 brechas reales
+ 22 referencias de control/evidencia
=842 registros equivalentes conciliados
```

Cada una de las 820 brechas reales debe ser recuperable desde exactamente un `package_id`. Las 22 referencias de control/evidencia permanecen fuera de la relación paquete-brecha.

La capa de proceso conserva además **53 pares históricos únicos `package_id` ↔ `process_id`**, correspondientes a **27 procesos confirmados** y **8 paquetes históricos**, más los seis contextos explícitos del delta `202..207`. Una brecha sin proceso confirmado conserva cardinalidad cero; una relación ya aprobada por `PROC-COVER-010` no puede omitirse como si esa ausencia existiera.

---

#### 2. Fuentes y precedencia documental

La vinculación se gobierna en este orden:

1. registro canónico de brechas, incluida su actualización append-only de `PROC-COVER-010`;
2. catálogo de paquetes y matrices brecha → tarea → paquete de `GAP-CTRL-006` para las 814 brechas históricas;
3. `PROCESS-GAP-RETURN-MATRIX-001` de `PROC-COVER-010` para los vínculos históricos proceso ↔ brecha confirmados o ampliados;
4. filas explícitas de las seis brechas y seis paquetes añadidos por `PROC-COVER-010`;
5. catálogo canónico de capacidades `CAP-*` para validar identidad de capacidad;
6. catálogo AS-IS de procesos `VPROC-*` para validar que cada identidad de proceso existe y conserva su estado aprobado.

La actualización que declara **820 brechas y 207 paquetes** prevalece sobre los conteos históricos **814/201**, pero no reescribe las relaciones históricas. El delta solo agrega `GAP-PKG-202..207` y `H-PROC-COVER-010-001..006`.

No se permite utilizar una copia histórica de la matriz para reducir el universo vigente a 201 paquetes ni reinterpretar una brecha histórica por información posterior no declarada como ampliación de alcance.

---

#### 3. Grano canónico de las relaciones

| Relación                    | Clave lógica                    | Cardinalidad permitida                                                                        | Restricción de integridad                              |
| --------------------------- | ------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| paquete ↔ brecha            | (`package_id`, `gap_id`)        | un paquete contiene una o varias brechas; cada brecha real pertenece a exactamente un paquete | un `gap_id` vigente no puede pertenecer a dos paquetes |
| paquete ↔ capacidad         | (`package_id`, `capability_id`) | muchos a muchos                                                                               | no duplicar el mismo par                               |
| paquete ↔ proceso           | (`package_id`, `process_id`)    | cero, uno o varios procesos por paquete; un proceso puede aparecer en varios paquetes         | no duplicar el mismo par                               |
| brecha ↔ capacidad primaria | (`gap_id`, `capability_id`)     | una capacidad primaria por brecha en la matriz vigente                                        | no sustituir por familia genérica                      |
| brecha ↔ proceso            | (`gap_id`, `process_id`)        | cero, uno o varios procesos confirmados según procedencia                                     | no promover valores provisionales                      |

La multiplicidad es información canónica. Compartir capacidad, proceso, tarea u owner no fusiona paquetes.

---

#### 4. Regla canónica `package_id` ↔ `gap_id`

1. Participan exactamente las **820 brechas reales** vigentes.
2. Las **814 brechas históricas** conservan el `GAP-PKG-*` aprobado en la matriz histórica.
3. Las **6 brechas nuevas** conservan su asignación explícita uno a uno a `GAP-PKG-202..207`.
4. Las **22 referencias de control/evidencia** no son `gap_id` de implementación y no reciben paquete.
5. Una brecha no puede pertenecer simultáneamente a dos paquetes.
6. Una brecha no se mueve de paquete por similitud de nombre, capability, process, task, owner, fecha, ola o aplicación.
7. El conteo de brechas por paquete debe reconciliar con el catálogo vigente.
8. La suma global de membresías paquete-brecha debe ser exactamente **820**.
9. Cualquier división o fusión posterior deberá preservar el `GAP-PKG-*` histórico de origen y su membresía de procedencia; no se reescribe esta matriz silenciosamente.

---

#### 5. Regla canónica `package_id` ↔ `capability_id`

1. Todo `capability_id` vinculado debe ser un identificador `CAP-*` existente y aprobado.
2. Para `GAP-PKG-001..201`, el conjunto del paquete es el conjunto aprobado en el catálogo histórico y debe ser compatible con las capacidades primarias de sus brechas miembro.
3. Para `GAP-PKG-202..207`, el vínculo inicial se toma de la capacidad primaria explícita de la nueva brecha.
4. Un paquete puede conservar varias capacidades; no se reduce a una familia `CAP-xx` ni a una sola capacidad dominante.
5. Una capacidad relacionada o secundaria no se promueve automáticamente a vínculo de paquete si la fuente no la declara como parte del conjunto aplicable.
6. No se crean capacidades sintéticas para simplificar paquetes multicapacidad.
7. Una discrepancia entre la capacidad de una brecha y el conjunto declarado del paquete se conserva como inconsistencia documental; no se corrige por inferencia.

---

#### 6. Regla canónica `package_id` ↔ `process_id`

1. `process_id` solo puede provenir de `PROCESS-GAP-RETURN-MATRIX-001`, de otro vínculo AS-IS confirmado o de una asignación canónica explícita del delta.
2. Un valor provisional, texto libre, familia funcional, tarea o capability no se convierte en `process_id`.
3. La ausencia de proceso confirmado es una cardinalidad válida: cero procesos no autoriza inventar uno.
4. Si varias brechas del mismo paquete referencian el mismo proceso, el par paquete-proceso se materializa una sola vez y conserva procedencia desde todas las brechas fuente.
5. Si una brecha referencia varios procesos confirmados, todos se conservan.
6. Un mismo proceso puede aparecer en varios paquetes sin provocar fusión.
7. La relación con proceso describe contexto operacional y no decide `application_owner`, `domain_owner` ni `repo_owner`.
8. `VPROC-TRANSVERSAL` se conserva cuando la fuente lo declara expresamente; no se sustituye por un proceso concreto inventado.
9. Los **53 pares históricos** materializados en 7.2 son una proyección determinista de `process_id` → brecha E1 → `package_id`; no crean procesos, brechas ni paquetes nuevos.

---

#### 7. Materialización explícita del delta `202..207`

| `package_id`  | `gap_id`               | `capability_id` | `process_id` / contexto canónico | Clase         | Propietario | Tarea primaria   | Perfil          | Evidencia mínima                                              | Revisor   | Estado    |
| ------------- | ---------------------- | --------------- | -------------------------------- | ------------- | ----------- | ---------------- | --------------- | ------------------------------------------------------------- | --------- | --------- |
| `GAP-PKG-202` | `H-PROC-COVER-010-001` | `CAP-01.07`     | `VPROC-0063`                     | `OPERACION`   | `OWN-GG`    | `INFO-DOM-012`   | `CLOSE-OPE-ADP` | `EV-01`; `EV-02`; `EV-07`; `EV-11`                            | `OWN-OPS` | `ABIERTA` |
| `GAP-PKG-203` | `H-PROC-COVER-010-002` | `CAP-01.09`     | `VPROC-0064`                     | `CONTRACTUAL` | `OWN-GG`    | `INFO-INT-003`   | `CLOSE-CON-CTR` | `EV-01`; `EV-02`; `EV-05`; `EV-11`; `EV-17`                   | `OWN-DAT` | `ABIERTA` |
| `GAP-PKG-204` | `H-PROC-COVER-010-003` | `CAP-03.03`     | `VPROC-0066`                     | `OPERACION`   | `OWN-SST`   | `NEXO-DOM-001`   | `CLOSE-OPE-ADP` | `EV-01`; `EV-02`; `EV-07`; `EV-11`; `EV-13`                   | `OWN-OPS` | `ABIERTA` |
| `GAP-PKG-205` | `H-PROC-COVER-010-004` | `CAP-10.06`     | `VPROC-0068`                     | `FUNCIONAL`   | `OWN-COM`   | `DATA-DOM-012`   | `CLOSE-FUN-VAL` | `EV-01`; `EV-02`; `EV-07`; `EV-08`; `EV-11`                   | `OWN-DAT` | `ABIERTA` |
| `GAP-PKG-206` | `H-PROC-COVER-010-005` | `CAP-12.11`     | `VPROC-0069`                     | `FUNCIONAL`   | `OWN-FIN`   | `NUMERA-DOM-018` | `CLOSE-FUN-IMP` | `EV-01`; `EV-02`; `EV-03`; `EV-04`; `EV-08`; `EV-11`          | `OWN-GG`  | `ABIERTA` |
| `GAP-PKG-207` | `H-PROC-COVER-010-006` | `CAP-15.06`     | `VPROC-TRANSVERSAL`              | `TECNICA`     | `OWN-TEC`   | `SHELL-AUD-011`  | `CLOSE-TEC-VAL` | `EV-01`; `EV-02`; `EV-03`; `EV-04`; `EV-06`; `EV-11`; `EV-17` | `OWN-OPS` | `ABIERTA` |

##### 7.1. Tareas de apoyo conservadas por el delta

| `package_id`  | Tareas de apoyo                                                |
| ------------- | -------------------------------------------------------------- |
| `GAP-PKG-202` | `READY-GATE-014`; `DATA-DOM-004`; `DATA-DOM-015`               |
| `GAP-PKG-203` | `INFO-DOM-010`; `INFO-DOM-003`; `INFO-DOM-011`                 |
| `GAP-PKG-204` | `NEXO-DOM-008`; `NEXO-DOM-011`; `NEXO-DOM-017`; `INFO-DOM-011` |
| `GAP-PKG-205` | `INFO-DOM-008`; `DATA-DOM-004`; `DATA-DOM-015`                 |
| `GAP-PKG-206` | `NUMERA-AUTH-015`; `DATA-DOM-013`; `NUMERA-DOM-014`            |
| `GAP-PKG-207` | `PROC-SCREEN-026`; `DELIV-PKG-009`; `SHELL-CI-017`             |

La materialización del delta es cerrada: seis brechas, seis paquetes, seis capacidades primarias, seis contextos de proceso, cero brechas nuevas sin paquete.

##### 7.2. Matriz histórica `package_id` ↔ `process_id`

La matriz siguiente proyecta sin inferencia los vínculos aprobados por `PROCESS-GAP-RETURN-MATRIX-001`. La brecha fuente se resuelve contra la matriz completa de E1 para recuperar su `package_id`; cada par idéntico se conserva una sola vez.

| `package_id`  | `process_id` | Brecha fuente confirmada | `gap_id` estable E1   | `capability_id` | Decisión E2                   |
| ------------- | ------------ | ------------------------ | --------------------- | --------------- | ----------------------------- |
| `GAP-PKG-094` | `VPROC-0001` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-01.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0003` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-01.05`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0004` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-01.08`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0009` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-02.08`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0012` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-03.01`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0013` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-03.04`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0014` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-03.06`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0018` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-04.09`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0020` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-05.04`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0027` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-06.14`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0029` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-07.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0030` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-07.07`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0031` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-07.12`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0033` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-08.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0035` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-08.12`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0037` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-08.13`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0041` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-09.14`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0047` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-10.08`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0048` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-11.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0055` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-13.07`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0058` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-15.06`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-094` | `VPROC-0062` | `H-CAP-COVER-002-008`    | `H-CAP-COVER-002-008` | `CAP-18.05`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-097` | `VPROC-0065` | `H-CAP-COVER-011-008`    | `H-CAP-COVER-011-008` | `CAP-02.10`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-107` | `VPROC-0032` | `H-CAP-SCOPE-007-007`    | `H-CAP-SCOPE-007-007` | `CAP-07.03`     | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-107` | `VPROC-0067` | `H-CAP-SCOPE-008-012`    | `H-CAP-SCOPE-008-012` | `CAP-07.11`     | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-108` | `VPROC-0032` | `H-CAP-SCOPE-007-006`    | `H-CAP-SCOPE-007-006` | `CAP-07.03`     | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-147` | `VPROC-0056` | `H-CAP-SCOPE-014-006`    | `H-CAP-SCOPE-014-006` | `CAP-14.03`     | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-147` | `VPROC-0057` | `H-CAP-SCOPE-014-006`    | `H-CAP-SCOPE-014-006` | `CAP-14.07`     | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-167` | `VPROC-0001` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-01.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0003` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-01.05`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0004` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-01.08`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0009` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-02.08`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0012` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-03.01`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0013` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-03.04`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0014` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-03.06`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0018` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-04.09`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0020` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-05.04`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0027` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-06.14`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0029` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-07.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0030` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-07.07`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0031` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-07.12`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0033` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-08.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0035` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-08.12`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0037` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-08.13`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0041` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-09.14`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0047` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-10.08`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0048` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-11.02`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0055` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-13.07`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0058` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-15.06`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-167` | `VPROC-0062` | `H-CAP-COVER-003-007`    | `H-CAP-COVER-003-007` | `CAP-18.05`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-174` | `VPROC-0065` | `H-CAP-SCOPE-002-010`    | `H-CAP-SCOPE-002-010` | `CAP-02.10`     | `LINKED_TO_EXISTING_GAP`      |
| `GAP-PKG-192` | `VPROC-0056` | `H-CODE-019-005`         | `H-CODE-019-005`      | `CAP-14.03`     | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-192` | `VPROC-0057` | `H-CODE-019-005`         | `H-CODE-019-005`      | `CAP-14.07`     | `EXISTING_GAP_SCOPE_EXTENDED` |

Reconciliación histórica cerrada: **53 pares únicos**, **27 `process_id`**, **8 `package_id`**, cero brechas fuente sin resolución a paquete y cero pares obtenidos por semejanza. Los demás paquetes históricos conservan cardinalidad cero de proceso mientras no exista una fuente canónica explícita que la cambie.

---

#### 8. Tratamiento de la línea histórica `001..201`

Las 814 relaciones históricas no se duplican en una segunda tabla de 814 filas dentro de E5. Su materialización canónica es la matriz completa del registro de brechas producida por `GAP-CTRL-006`, que ya contiene por brecha:

- identidad de brecha;
- clase;
- capacidad primaria;
- propietario y fecha;
- tarea primaria y tareas de soporte;
- `GAP-PKG-*`;
- confianza;
- perfil de cierre, criterio y evidencia en las matrices complementarias.

La matriz histórica de E1 no materializa identidades `VPROC-*`; por tanto, no puede utilizarse por sí sola para afirmar que la relación paquete ↔ proceso está cerrada. `DELIV-PKG-002` adopta por referencia normativa sus **814 relaciones brecha ↔ paquete** sin copiarlas ni reinterpretarlas, materializa en 7.2 los **53 pares históricos paquete ↔ proceso** aprobados por `PROCESS-GAP-RETURN-MATRIX-001` y agrega explícitamente el delta `202..207`.

Esta separación conserva una sola fuente propietaria por relación y evita tanto la duplicación de 814 filas como la omisión de procesos ya confirmados.

---

#### 9. Algoritmo determinista de reconstrucción

Para cualquier `package_id = GAP-PKG-nnn`:

1. seleccionar todas las brechas reales cuyo paquete sea exactamente `GAP-PKG-nnn`;
2. conservar cada `gap_id` sin renombrado ni deduplicación semántica;
3. obtener el conjunto de `capability_id` aprobado para el paquete y contrastarlo con las capacidades primarias de las brechas miembro;
4. reunir los `process_id` históricos materializados en 7.2 y toda asignación explícita del delta 7;
5. deduplicar únicamente pares idénticos dentro de un mismo tipo de relación;
6. conservar cero procesos cuando no exista ninguno confirmado;
7. comprobar el conteo de brechas del paquete contra el catálogo vigente;
8. comprobar globalmente que la unión disjunta de membresías contiene exactamente **820** `gap_id`;
9. comprobar que ninguna de las 22 referencias de control/evidencia entró en el conjunto;
10. rechazar cualquier relación obtenida por texto libre, similitud o inferencia.

La reconstrucción debe ser independiente del orden de filas y producir siempre el mismo conjunto lógico.

---

#### 10. Controles globales de integridad

| Control                                                      | Resultado requerido |
| ------------------------------------------------------------ | ------------------: |
| `package_id` `GAP-PKG-*` vigentes                            |             **207** |
| rango continuo                                               |  `GAP-PKG-001..207` |
| brechas reales vigentes                                      |             **820** |
| brechas históricas preservadas                               |             **814** |
| brechas append-only incorporadas                             |               **6** |
| brechas sin paquete                                          |               **0** |
| brechas asignadas a más de un paquete                        |               **0** |
| referencias control/evidencia convertidas en brecha          |               **0** |
| referencias control/evidencia conservadas fuera de membresía |              **22** |
| registros equivalentes reconciliados                         |             **842** |
| paquetes nuevos sin brecha explícita                         |               **0** |
| pares históricos `package_id` ↔ `process_id`                 |              **53** |
| procesos históricos confirmados en esos pares                |              **27** |
| paquetes históricos con proceso confirmado                   |               **8** |
| brechas fuente de proceso sin resolución a paquete           |               **0** |
| valores provisionales promovidos a `process_id`              |               **0** |
| paquetes históricos renumerados por esta tarea               |               **0** |
| falsos cierres de brecha producidos por esta tarea           |               **0** |

---

#### 11. Reconciliación por ola

| Ola       | Brechas históricas |  Delta | Brechas vigentes | Paquetes históricos |  Delta | Paquetes vigentes |
| --------- | -----------------: | -----: | ---------------: | ------------------: | -----: | ----------------: |
| `W0`      |                 28 |      0 |           **28** |                   5 |      0 |             **5** |
| `W1`      |                301 |     +1 |          **302** |                  71 |     +1 |            **72** |
| `W2`      |                222 |     +1 |          **223** |                  54 |     +1 |            **55** |
| `W3`      |                120 |     +1 |          **121** |                  13 |     +1 |            **14** |
| `W4`      |                105 |     +3 |          **108** |                  43 |     +3 |            **46** |
| `W5`      |                 38 |      0 |           **38** |                  15 |      0 |            **15** |
| **Total** |            **814** | **+6** |          **820** |             **201** | **+6** |           **207** |

---

#### 12. Reconciliación por clasificación

| Clasificación | Brechas históricas |  Delta | Brechas vigentes | Paquetes históricos |  Delta | Paquetes vigentes |
| ------------- | -----------------: | -----: | ---------------: | ------------------: | -----: | ----------------: |
| `FUNCIONAL`   |                187 |     +2 |          **189** |                  48 |     +2 |            **50** |
| `CONTRACTUAL` |                102 |     +1 |          **103** |                  36 |     +1 |            **37** |
| `TECNICA`     |                220 |     +1 |          **221** |                  35 |     +1 |            **36** |
| `DATOS`       |                126 |      0 |          **126** |                  44 |      0 |            **44** |
| `SEGURIDAD`   |                 98 |      0 |           **98** |                  12 |      0 |            **12** |
| `OPERACION`   |                 81 |     +2 |           **83** |                  26 |     +2 |            **28** |
| **Total**     |            **814** | **+6** |          **820** |             **201** | **+6** |           **207** |

---

#### 13. Tratamiento de identidades relacionadas

##### 13.1. `VISO-SCHEDULE-MONTHLY-001`

Conserva su identidad reservada y su contexto `VPROC-0007`, pero no forma parte del rango `GAP-PKG-001..207` ni consume una de las 820 brechas reales. Esta tarea no le crea `gap_id` ni `capability_id` por inferencia.

##### 13.2. `NEXO-REMISSIONS-001`

Permanece como carril histórico. No se incorpora al universo `package_id` y no recibe relaciones `capability_id`, `process_id` o `gap_id` por inferencia.

---

#### 14. Casos de rechazo

La vinculación se considera inválida si ocurre cualquiera de los siguientes casos:

- una brecha vigente queda sin `package_id`;
- una brecha vigente aparece en dos paquetes;
- una referencia de control/evidencia se promueve a brecha;
- un `process_id` se inventa desde un proceso provisional o texto libre;
- un vínculo histórico aprobado por `PROCESS-GAP-RETURN-MATRIX-001` queda omitido de la matriz 7.2;
- una capacidad de familia reemplaza un `CAP-*` concreto;
- el delta `202..207` se omite por usar únicamente la línea histórica;
- una de las 814 relaciones históricas se reescribe sin una fuente canónica que declare la modificación;
- se asignan propietarios de aplicación, dominio o repositorio dentro de esta tarea;
- compartir capacidad o proceso se interpreta como orden de fusión;
- la reconciliación global produce un total distinto de **820/207/22/842**.

---

#### 15. Fronteras de responsabilidad

`DELIV-PKG-002` **sí cierra**:

- relación paquete ↔ brecha para el universo vigente;
- reglas de relación paquete ↔ capacidad;
- reglas y materialización de relación paquete ↔ proceso;
- incorporación explícita de los 53 pares históricos paquete ↔ proceso;
- incorporación explícita de las seis relaciones append-only;
- exclusión formal de 22 referencias de control/evidencia;
- controles de unicidad, cardinalidad y reconstrucción determinista.

`DELIV-PKG-002` **no cierra**:

- `application_owner`, `domain_owner` y `repo_owner`, reservados a `DELIV-PKG-003`;
- estado AS-IS y resultado TO-BE, reservado a `DELIV-PKG-004`;
- alcance incluido, excluido y diferido, reservado a `DELIV-PKG-005`;
- diseño físico de pantallas, lógica, datos, integraciones, despliegue, rollback, observabilidad o evidencia de ejecución de tareas posteriores de E5.

---

#### 16. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

La tarea consume y organiza relaciones documentales ya aprobadas. No crea comportamiento ejecutable, modifica runtime, altera una regla de negocio ni cambia el contenido de un requisito `TREQ-*`.

---

#### 17. Criterios de aceptación

`DELIV-PKG-002` queda cerrada únicamente cuando se cumplen simultáneamente:

- [x] existen exactamente **207** identidades `GAP-PKG-*` en el universo vigente;
- [x] las **820** brechas reales son recuperables mediante exactamente un `package_id`;
- [x] las **814** relaciones históricas se preservan sin reescritura silenciosa;
- [x] las seis relaciones `202..207` están materializadas con `gap_id`, `capability_id` y proceso explícito;
- [x] los **53 pares históricos** paquete ↔ proceso están materializados sin duplicados y preservan **27 procesos** en **8 paquetes**;
- [x] ninguna brecha fuente de `PROCESS-GAP-RETURN-MATRIX-001` queda sin resolución a su paquete histórico;
- [x] las **22** referencias de control/evidencia permanecen fuera de la membresía paquete-brecha;
- [x] el total conciliado es **842 registros equivalentes**;
- [x] ningún valor provisional es promovido a `process_id`;
- [x] ninguna capacidad sintética sustituye identificadores aprobados;
- [x] ninguna ausencia de proceso se rellena por inferencia;
- [x] no se asignan application/domain/repo owners prematuramente;
- [x] no se crea ni modifica ningún requisito de prueba.

---

#### 18. Continuidad

**ÚLTIMA TAREA APROBADA**
`DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación`

**TAREA ACTUAL APROBADA**
`DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id`

**SIGUIENTE TAREA RESERVADA**
`DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios`


### ✅ DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios

**Estado:** APROBADA
**Tarea anterior:** `DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id`
**Tarea siguiente:** `DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable`
**Tipo de tarea:** documental — definición normativa y materialización completa de `application_owner`, `domain_owner` y `repo_owner` para los 207 `package_id` vigentes

---

#### 1. Propósito

Cerrar la propiedad técnica y funcional de cada raíz `GAP-PKG-*` vigente sin alterar su identidad, membresía de brechas, capacidades o procesos aprobados. El resultado determina, para cada uno de los **207 paquetes**, qué aplicación o frontera distribuida conserva la responsabilidad funcional, qué dominio documental/técnico gobierna el cambio y qué repositorio conserva la responsabilidad primaria de materializar y coordinar el paquete.

La asignación de esta tarea no equivale a enumerar todavía todos los repositorios consumidores ni todos los archivos afectados. `repo_owner` identifica el repositorio responsable de la raíz del paquete; `DELIV-PKG-014` materializará el inventario exacto de archivos y podrá incorporar repositorios consumidores sin transferir la propiedad raíz.

---

#### 2. Alcance y entradas canónicas preservadas

- universo vigente de **207** `package_id`: `GAP-PKG-001..207`;
- las **820** brechas reales y sus relaciones de `DELIV-PKG-002` permanecen sin modificación;
- las capacidades, procesos, clase, propietario funcional de la brecha, ola, fecha, tarea dominante y perfiles de cierre heredados no se reinterpretan;
- los códigos canónicos de aplicación continúan siendo `anima`, `aura`, `fogo`, `nexo`, `numera`, `origo`, `pass`, `pulso`, `shell` y `viso`;
- aplicación, repositorio y paquete compartido conservan identidades distintas;
- `VISO-SCHEDULE-MONTHLY-001` y `NEXO-REMISSIONS-001` permanecen fuera del universo `GAP-PKG-001..207`;
- ninguna decisión de esta tarea autoriza implementación física, despliegue, migración, DDL, DML, backfill o cambio de producción.

---

#### 3. Contrato canónico de propiedad

Cada `package_id` queda materializado con las siguientes propiedades:

| Campo                | Regla canónica                                                                                                                                                                        |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `package_id`         | identidad raíz estable `GAP-PKG-*`; no se renumera                                                                                                                                    |
| `application_owner`  | código de aplicación canónico cuando existe una aplicación propietaria inequívoca; en trabajo transversal se usa una frontera distribuida explícita sin crear una aplicación ficticia |
| `domain_owner`       | namespace exacto de la tarea dominante que gobierna el resultado del paquete                                                                                                          |
| `repo_owner`         | repositorio primario responsable de materializar y coordinar la raíz del paquete; no implica exclusividad sobre consumidores posteriores                                              |
| `ownership_state`    | estado documental de la asignación y de cualquier bloqueo de propiedad                                                                                                                |
| `blocking_condition` | tarea o condición exacta que impide cerrar la propiedad cuando la fuente actual no permite asignar repositorio                                                                        |

Invariantes:

1. `application_owner` no se deriva del nombre del repositorio.
2. `repo_owner` no convierte al código `shell` en propietario funcional de dominios ajenos.
3. Un paquete transversal puede tener `FRONTERA_DISTRIBUIDA` como frontera funcional y `devVentoGroup/vento-shell` como repositorio coordinador de su raíz.
4. `domain_owner` conserva el namespace de la tarea dominante y no se reemplaza por la familia `CAP-*`, por el owner organizacional ni por un repositorio.
5. La ausencia de un repositorio confirmado no se rellena por inferencia; se materializa como bloqueo con dueño documental exacto.
6. Esta tarea no decide los archivos exactos ni la frontera física final de implementación; esas decisiones permanecen reservadas a `DELIV-PKG-014` y tareas posteriores aplicables.

---

#### 4. Reglas de asignación

##### 4.1. Aplicaciones con repositorio confirmado

Cuando la tarea dominante pertenece inequívocamente a un namespace de aplicación con repositorio vigente, se asigna el código canónico de aplicación y su repositorio técnico correspondiente:

| Namespace     | `application_owner` | `repo_owner`                 |
| ------------- | ------------------- | ---------------------------- |
| `ANIMA-*`     | `anima`             | `devVentoGroup/vento-anima`  |
| `VISO-*`      | `viso`              | `devVentoGroup/vento-viso`   |
| `NEXO-*`      | `nexo`              | `devVentoGroup/vento-nexo`   |
| `FOGO-*`      | `fogo`              | `devVentoGroup/vento-fogo`   |
| `ORIGO-*`     | `origo`             | `devVentoGroup/vento-origo`  |
| `PULSO-*`     | `pulso`             | `devVentoGroup/vento-pulso`  |
| `NUMERA-*`    | `numera`            | `devVentoGroup/vento-numera` |
| `PASS-*`      | `pass`              | `devVentoGroup/vento-pass`   |
| `SHELL-APP-*` | `shell`             | `devVentoGroup/vento-shell`  |

##### 4.2. Frontera distribuida

Los paquetes cuya tarea dominante pertenece a gobierno, autorización, Supabase, datos compartidos, información, procesos, continuidad, integración, evidencia, NFR, QA, infraestructura transversal o fundación técnica conservan `application_owner = FRONTERA_DISTRIBUIDA`. Su raíz se coordina en `devVentoGroup/vento-shell`; esto no transfiere a la aplicación `shell` la fuente de verdad funcional de las aplicaciones consumidoras.

##### 4.3. TALENTO

`CAP-TAL-*` no se promueve a un nuevo código de aplicación, porque `talento` no forma parte del catálogo canónico de diez aplicaciones. Los paquetes correspondientes conservan `FRONTERA_DISTRIBUIDA_TALENTO_VISO_ANIMA`, con `devVentoGroup/vento-talento` como repositorio técnico confirmado y VISO/ANIMA como fronteras funcionales relacionadas según el diseño aprobado.

##### 4.4. Producción física `OPS-PRD-*`

El paquete cuyo dominante es `OPS-PRD-001` queda primariamente en `fogo` / `devVentoGroup/vento-fogo`, porque el diseño productivo y la ejecución pertenecen a FOGO. NEXO conserva condición de consumidor/colaborador por inventario y movimientos; esta relación no divide ni renumera la raíz `GAP-PKG-*`.

##### 4.5. AURA

`aura` continúa como código de aplicación canónico, pero no existe un repositorio propietario confirmado. Ningún paquete AURA se reasigna a `vento-shell` ni a otra aplicación para ocultar esa ausencia. Los paquetes AURA quedan con `repo_owner = NO_CONFIRMADO` y `ownership_state = BLOQUEADO_REPO_AURA` hasta que `AURA-AUD-001`, `AURA-AUD-010` y `AURA-AUD-012` resuelvan repositorio y continuidad.

---

#### 5. Matriz materializada de propiedad de los 207 paquetes

| `package_id`  | `capability_id`                                                                                                                  | Tarea dominante  | `application_owner`                       | `domain_owner` | `repo_owner`                  | `ownership_state`                            | `blocking_condition`                           |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------- | ---------------- | ----------------------------------------- | -------------- | ----------------------------- | -------------------------------------------- | ---------------------------------------------- |
| `GAP-PKG-001` | `CAP-02.06`                                                                                                                      | `AUTH-DB-003`    | `FRONTERA_DISTRIBUIDA`                    | `AUTH-DB`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-002` | `CAP-10.07`, `CAP-10.10`                                                                                                         | `AUTH-DB-002`    | `FRONTERA_DISTRIBUIDA`                    | `AUTH-DB`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-003` | `CAP-14.04`                                                                                                                      | `SUPA-AUD-015`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-004` | `CAP-15.01`                                                                                                                      | `AUTH-DB-002`    | `FRONTERA_DISTRIBUIDA`                    | `AUTH-DB`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-005` | `CAP-16.06`, `CAP-16.07`                                                                                                         | `INT-EXT-002`    | `FRONTERA_DISTRIBUIDA`                    | `INT-EXT`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-006` | `CAP-09.14`                                                                                                                      | `AURA-DOM-007`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-007` | `CAP-10.01`                                                                                                                      | `PASS-INT-001`   | `pass`                                    | `PASS-INT`     | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-008` | `CAP-14.05`                                                                                                                      | `AURA-DOM-008`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-009` | `CAP-15.09`                                                                                                                      | `INT-EXT-001`    | `FRONTERA_DISTRIBUIDA`                    | `INT-EXT`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-010` | `CAP-01.05`                                                                                                                      | `DATA-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-011` | `CAP-01.01`, `CAP-01.03`                                                                                                         | `DATA-DOM-002`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-012` | `CAP-02.13`                                                                                                                      | `INFO-DOM-004`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-013` | `CAP-04.01`                                                                                                                      | `DATA-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-014` | `CAP-05.03`                                                                                                                      | `INFO-DOM-010`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-015` | `CAP-06.05`                                                                                                                      | `DATA-DOM-010`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-016` | `CAP-07.01`                                                                                                                      | `INFO-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-017` | `CAP-10.07`                                                                                                                      | `PASS-INT-001`   | `pass`                                    | `PASS-INT`     | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-018` | `CAP-15.01`                                                                                                                      | `SUPA-AUD-010`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-019` | `CAP-15.01`, `CAP-15.08`, `CAP-15.09`                                                                                            | `SUPA-AUD-016`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-020` | `CAP-16.07`                                                                                                                      | `INFO-INT-003`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-INT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-021` | `CAP-16.01`, `CAP-16.02`, `CAP-16.05`, `CAP-16.07`, `CAP-16.08`, `CAP-16.09`, `CAP-16.10`                                        | `INFO-AUTH-001`  | `FRONTERA_DISTRIBUIDA`                    | `INFO-AUTH`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-022` | `CAP-17.03`                                                                                                                      | `DATA-INT-003`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-INT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-023` | `CAP-17.01`, `CAP-17.03`, `CAP-17.04`, `CAP-17.12`                                                                               | `DATA-DOM-017`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-024` | `CAP-12.02`, `CAP-12.13`                                                                                                         | `NUMERA-DOM-003` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-025` | `CAP-12.01`                                                                                                                      | `INT-DB-008`     | `FRONTERA_DISTRIBUIDA`                    | `INT-DB`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-026` | `CAP-15.08`                                                                                                                      | `NUMERA-DOM-002` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-027` | `CAP-01.03`, `CAP-01.05`                                                                                                         | `EXT-GOV-001`    | `FRONTERA_DISTRIBUIDA`                    | `EXT-GOV`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-028` | `CAP-01.03`, `CAP-01.04`                                                                                                         | `VISO-CORE-006`  | `viso`                                    | `VISO-CORE`    | `devVentoGroup/vento-viso`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-029` | `CAP-07.01`                                                                                                                      | `NEXO-DOM-001`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-030` | `CAP-15.09`                                                                                                                      | `SUPA-AUD-023`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-031` | `CAP-01.02`, `CAP-01.03`, `CAP-01.04`, `CAP-01.05`, `CAP-01.07`, `CAP-01.08`                                                     | `PROC-CAT-005`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-032` | `CAP-02.03`                                                                                                                      | `INT-WORK-002`   | `FRONTERA_DISTRIBUIDA`                    | `INT-WORK`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-033` | `CAP-04.01`, `CAP-04.07`                                                                                                         | `SHELL-CON-016`  | `FRONTERA_DISTRIBUIDA`                    | `SHELL-CON`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-034` | `CAP-04.01`, `CAP-04.03`, `CAP-04.04`                                                                                            | `SHELL-CON-016`  | `FRONTERA_DISTRIBUIDA`                    | `SHELL-CON`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-035` | `CAP-05.08`                                                                                                                      | `SUPA-AUD-019`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-036` | `CAP-05.03`                                                                                                                      | `SUPA-AUD-019`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-037` | `CAP-06.01`, `CAP-06.02`, `CAP-06.07`, `CAP-06.09`, `CAP-06.12`, `CAP-06.14`                                                     | `NEXO-UX-009`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-038` | `CAP-06.01`, `CAP-06.02`, `CAP-06.05`, `CAP-06.14`, `CAP-06.15`                                                                  | `SUPA-AUD-019`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-039` | `CAP-07.01`                                                                                                                      | `ORIGO-UX-014`   | `origo`                                   | `ORIGO-UX`     | `devVentoGroup/vento-origo`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-040` | `CAP-08.01`, `CAP-08.03`, `CAP-08.07`                                                                                            | `FOGO-AUTH-010`  | `fogo`                                    | `FOGO-AUTH`    | `devVentoGroup/vento-fogo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-041` | `CAP-09.06`, `CAP-09.08`, `CAP-09.09`, `CAP-09.13`, `CAP-09.15`                                                                  | `UX-QA-027`      | `FRONTERA_DISTRIBUIDA`                    | `UX-QA`        | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-042` | `CAP-10.07`, `CAP-10.09`                                                                                                         | `INT-MKT-002`    | `FRONTERA_DISTRIBUIDA`                    | `INT-MKT`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-043` | `CAP-10.08`                                                                                                                      | `PROC-CAT-009`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-044` | `CAP-11.01`, `CAP-11.06`, `CAP-11.09`, `CAP-11.10`                                                                               | `PULSO-UX-009`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-045` | `CAP-12.10`                                                                                                                      | `SHELL-CON-002`  | `FRONTERA_DISTRIBUIDA`                    | `SHELL-CON`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-046` | `CAP-13.01`, `CAP-13.08`                                                                                                         | `NEXO-DOM-029`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-047` | `CAP-13.01`                                                                                                                      | `INT-DB-008`     | `FRONTERA_DISTRIBUIDA`                    | `INT-DB`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-048` | `CAP-14.04`                                                                                                                      | `PULSO-UX-020`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-049` | `CAP-15.01`, `CAP-15.03`, `CAP-15.05`, `CAP-15.07`, `CAP-15.08`, `CAP-15.09`                                                     | `SUPA-ARC-007`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-ARC`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-050` | `CAP-15.01`                                                                                                                      | `DATA-AUTH-003`  | `FRONTERA_DISTRIBUIDA`                    | `DATA-AUTH`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-051` | `CAP-16.07`                                                                                                                      | `FOGO-AUTH-008`  | `fogo`                                    | `FOGO-AUTH`    | `devVentoGroup/vento-fogo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-052` | `CAP-17.10`                                                                                                                      | `INT-APP-008`    | `FRONTERA_DISTRIBUIDA`                    | `INT-APP`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-053` | `CAP-18.01`, `CAP-18.04`                                                                                                         | `CONT-DOM-003`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-054` | `CAP-18.05`                                                                                                                      | `NEXO-UX-037`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-055` | `CAP-01.04`, `CAP-01.07`, `CAP-01.08`, `CAP-01.10`                                                                               | `SUPA-ARC-001`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-ARC`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-056` | `CAP-02.03`, `CAP-02.13`                                                                                                         | `ANIMA-AUTH-015` | `anima`                                   | `ANIMA-AUTH`   | `devVentoGroup/vento-anima`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-057` | `CAP-03.04`                                                                                                                      | `AUTH-QA-029`    | `FRONTERA_DISTRIBUIDA`                    | `AUTH-QA`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-058` | `CAP-10.02`, `CAP-10.07`, `CAP-10.10`                                                                                            | `AUTH-QA-029`    | `FRONTERA_DISTRIBUIDA`                    | `AUTH-QA`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-059` | `CAP-14.01`                                                                                                                      | `AURA-INT-001`   | `aura`                                    | `AURA-INT`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-060` | `CAP-15.01`, `CAP-15.02`, `CAP-15.09`                                                                                            | `INFO-AUTH-004`  | `FRONTERA_DISTRIBUIDA`                    | `INFO-AUTH`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-061` | `CAP-16.06`, `CAP-16.08`, `CAP-16.11`                                                                                            | `INFO-AUTH-002`  | `FRONTERA_DISTRIBUIDA`                    | `INFO-AUTH`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-062` | `CAP-03.03`, `CAP-03.08`                                                                                                         | `AUTH-QA-026`    | `FRONTERA_DISTRIBUIDA`                    | `AUTH-QA`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-063` | `CAP-02.06`                                                                                                                      | `INT-WORK-001`   | `FRONTERA_DISTRIBUIDA`                    | `INT-WORK`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-064` | `CAP-02.02`                                                                                                                      | `CAP-TAL-003`    | `FRONTERA_DISTRIBUIDA_TALENTO_VISO_ANIMA` | `CAP-TAL`      | `devVentoGroup/vento-talento` | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-065` | `CAP-01.02`, `CAP-01.04`, `CAP-01.08`                                                                                            | `SHELL-CI-016`   | `FRONTERA_DISTRIBUIDA`                    | `SHELL-CI`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-066` | `CAP-02.07`                                                                                                                      | `ANIMA-AUTH-014` | `anima`                                   | `ANIMA-AUTH`   | `devVentoGroup/vento-anima`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-067` | `CAP-04.01`                                                                                                                      | `TI-DOM-001`     | `FRONTERA_DISTRIBUIDA`                    | `TI-DOM`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-068` | `CAP-06.01`, `CAP-06.12`, `CAP-06.13`                                                                                            | `SUPA-ARC-020`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-ARC`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-069` | `CAP-09.09`, `CAP-09.11`                                                                                                         | `PULSO-UX-003`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-070` | `CAP-10.01`, `CAP-10.06`, `CAP-10.07`                                                                                            | `PASS-INT-001`   | `pass`                                    | `PASS-INT`     | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-071` | `CAP-11.04`, `CAP-11.08`                                                                                                         | `UX-QA-019`      | `FRONTERA_DISTRIBUIDA`                    | `UX-QA`        | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-072` | `CAP-15.05`                                                                                                                      | `TI-INT-003`     | `FRONTERA_DISTRIBUIDA`                    | `TI-INT`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-073` | `CAP-15.01`, `CAP-15.05`, `CAP-15.09`                                                                                            | `SHELL-CI-007`   | `FRONTERA_DISTRIBUIDA`                    | `SHELL-CI`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-074` | `CAP-16.07`, `CAP-16.08`                                                                                                         | `SUPA-ARC-016`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-ARC`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-075` | `CAP-17.03`, `CAP-17.10`, `CAP-17.12`                                                                                            | `DATA-DOM-004`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-076` | `CAP-18.08`, `CAP-18.11`                                                                                                         | `CONT-INT-001`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-INT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-077` | `CAP-01.05`                                                                                                                      | `PROC-CAT-009`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-078` | `CAP-09.14`                                                                                                                      | `AURA-DOM-007`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-079` | `CAP-10.01`, `CAP-10.07`, `CAP-10.08`                                                                                            | `PASS-UX-006`    | `pass`                                    | `PASS-UX`      | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-080` | `CAP-14.05`                                                                                                                      | `AURA-DOM-001`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-081` | `CAP-14.05`                                                                                                                      | `PASS-UX-012`    | `pass`                                    | `PASS-UX`      | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-082` | `CAP-01.04`                                                                                                                      | `SUPA-AUD-012`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-083` | `CAP-06.01`, `CAP-06.13`                                                                                                         | `SUPA-TRANS-006` | `FRONTERA_DISTRIBUIDA`                    | `SUPA-TRANS`   | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-084` | `CAP-17.10`                                                                                                                      | `SUPA-AUD-019`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-085` | `CAP-01.03`                                                                                                                      | `NUMERA-DOM-013` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-086` | `CAP-04.01`                                                                                                                      | `NUMERA-DOM-005` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-087` | `CAP-06.14`                                                                                                                      | `NUMERA-DOM-016` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-088` | `CAP-09.09`, `CAP-09.10`                                                                                                         | `NUMERA-DOM-016` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-089` | `CAP-12.01`, `CAP-12.02`, `CAP-12.04`, `CAP-12.09`, `CAP-12.10`, `CAP-12.13`                                                     | `NUMERA-DOM-014` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-090` | `CAP-15.01`, `CAP-15.06`                                                                                                         | `NUMERA-DOM-005` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-091` | `CAP-01.04`                                                                                                                      | `NEXO-UX-009`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-092` | `CAP-01.04`                                                                                                                      | `DATA-DOM-006`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-093` | `CAP-06.08`                                                                                                                      | `VISO-CORE-006`  | `viso`                                    | `VISO-CORE`    | `devVentoGroup/vento-viso`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-094` | `CAP-01.02`, `CAP-01.03`, `CAP-01.06`, `CAP-01.08`                                                                               | `PROC-CAT-002`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-095` | `CAP-01.01`, `CAP-01.04`, `CAP-01.05`, `CAP-01.07`, `CAP-01.08`                                                                  | `PROC-CAT-002`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-096` | `CAP-02.02`, `CAP-02.08`, `CAP-02.13`                                                                                            | `NEXO-UX-019`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-097` | `CAP-02.07`, `CAP-02.08`, `CAP-02.10`                                                                                            | `PROC-CAT-001`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-098` | `CAP-03.03`, `CAP-03.06`                                                                                                         | `OPS-PRD-001`    | `fogo`                                    | `OPS-PRD`      | `devVentoGroup/vento-fogo`    | `ASIGNADO_PRIMARIO_FOGO_CON_NEXO_CONSUMIDOR` | —                                              |
| `GAP-PKG-099` | `CAP-04.04`                                                                                                                      | `NEXO-DOM-029`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-100` | `CAP-04.01`, `CAP-04.02`, `CAP-04.04`, `CAP-04.10`                                                                               | `FOGO-UX-009`    | `fogo`                                    | `FOGO-UX`      | `devVentoGroup/vento-fogo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-101` | `CAP-04.01`                                                                                                                      | `NEXO-DOM-033`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-102` | `CAP-05.04`, `CAP-05.08`, `CAP-05.09`                                                                                            | `ORIGO-AUTH-004` | `origo`                                   | `ORIGO-AUTH`   | `devVentoGroup/vento-origo`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-103` | `CAP-05.03`                                                                                                                      | `CONT-DOM-013`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-104` | `CAP-06.01`, `CAP-06.02`, `CAP-06.05`, `CAP-06.09`, `CAP-06.12`, `CAP-06.13`, `CAP-06.14`                                        | `NEXO-UX-037`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-105` | `CAP-06.02`, `CAP-06.05`                                                                                                         | `FOGO-UX-012`    | `fogo`                                    | `FOGO-UX`      | `devVentoGroup/vento-fogo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-106` | `CAP-07.01`                                                                                                                      | `SUPA-AUD-019`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-107` | `CAP-07.01`, `CAP-07.02`, `CAP-07.07`, `CAP-07.08`, `CAP-07.09`, `CAP-07.11`                                                     | `NEXO-DOM-008`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-108` | `CAP-07.01`, `CAP-07.02`, `CAP-07.03`, `CAP-07.07`, `CAP-07.10`, `CAP-07.12`                                                     | `SUPA-AUD-019`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-109` | `CAP-08.01`, `CAP-08.05`, `CAP-08.07`, `CAP-08.08`, `CAP-08.09`, `CAP-08.10`, `CAP-08.11`, `CAP-08.12`, `CAP-08.13`, `CAP-08.14` | `FOGO-UX-010`    | `fogo`                                    | `FOGO-UX`      | `devVentoGroup/vento-fogo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-110` | `CAP-09.01`, `CAP-09.02`, `CAP-09.03`, `CAP-09.05`, `CAP-09.06`, `CAP-09.07`, `CAP-09.08`, `CAP-09.09`, `CAP-09.11`, `CAP-09.12` | `PULSO-UX-021`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-111` | `CAP-10.05`, `CAP-10.07`                                                                                                         | `PULSO-UX-009`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-112` | `CAP-11.01`, `CAP-11.02`, `CAP-11.03`, `CAP-11.07`, `CAP-11.08`, `CAP-11.09`                                                     | `NEXO-UX-013`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-113` | `CAP-11.02`, `CAP-11.04`, `CAP-11.07`, `CAP-11.09`                                                                               | `NEXO-UX-001`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-114` | `CAP-12.02`, `CAP-12.09`                                                                                                         | `PULSO-UX-010`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-115` | `CAP-13.01`, `CAP-13.04`                                                                                                         | `NEXO-DOM-029`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-116` | `CAP-13.01`, `CAP-13.04`, `CAP-13.05`, `CAP-13.06`, `CAP-13.08`, `CAP-13.09`, `CAP-13.10`                                        | `NEXO-AUTH-031`  | `nexo`                                    | `NEXO-AUTH`    | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-117` | `CAP-14.03`, `CAP-14.04`                                                                                                         | `NEXO-DOM-003`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-118` | `CAP-14.02`                                                                                                                      | `AURA-DOM-006`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-119` | `CAP-15.01`, `CAP-15.02`, `CAP-15.05`, `CAP-15.09`                                                                               | `NFR-REQ-012`    | `FRONTERA_DISTRIBUIDA`                    | `NFR-REQ`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-120` | `CAP-15.01`, `CAP-15.08`                                                                                                         | `ORIGO-UX-001`   | `origo`                                   | `ORIGO-UX`     | `devVentoGroup/vento-origo`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-121` | `CAP-16.07`, `CAP-16.09`                                                                                                         | `INFO-DOM-003`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-122` | `CAP-16.07`                                                                                                                      | `NEXO-DOM-026`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-123` | `CAP-17.05`, `CAP-17.10`, `CAP-17.12`                                                                                            | `PULSO-UX-017`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-124` | `CAP-17.10`, `CAP-17.12`                                                                                                         | `DATA-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-125` | `CAP-18.02`, `CAP-18.04`, `CAP-18.05`, `CAP-18.06`                                                                               | `TI-INT-003`     | `FRONTERA_DISTRIBUIDA`                    | `TI-INT`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-126` | `CAP-07.07`                                                                                                                      | `NEXO-DOM-026`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-127` | `CAP-02.02`, `CAP-02.04`, `CAP-02.06`, `CAP-02.07`                                                                               | `ANIMA-UX-017`   | `anima`                                   | `ANIMA-UX`     | `devVentoGroup/vento-anima`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-128` | `CAP-06.01`                                                                                                                      | `ANIMA-UX-017`   | `anima`                                   | `ANIMA-UX`     | `devVentoGroup/vento-anima`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-129` | `CAP-14.05`                                                                                                                      | `ANIMA-UX-017`   | `anima`                                   | `ANIMA-UX`     | `devVentoGroup/vento-anima`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-130` | `CAP-15.11`                                                                                                                      | `TI-DOM-001`     | `FRONTERA_DISTRIBUIDA`                    | `TI-DOM`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-131` | `CAP-01.02`, `CAP-01.03`, `CAP-01.04`, `CAP-01.06`, `CAP-01.07`, `CAP-01.08`                                                     | `PASS-UX-001`    | `pass`                                    | `PASS-UX`      | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-132` | `CAP-02.02`, `CAP-02.06`, `CAP-02.07`, `CAP-02.08`                                                                               | `SHELL-APP-001`  | `shell`                                   | `SHELL-APP`    | `devVentoGroup/vento-shell`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-133` | `CAP-04.01`, `CAP-04.02`, `CAP-04.07`                                                                                            | `SUPA-TRANS-005` | `FRONTERA_DISTRIBUIDA`                    | `SUPA-TRANS`   | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-134` | `CAP-06.01`                                                                                                                      | `SUPA-AUD-014`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-135` | `CAP-07.01`                                                                                                                      | `SUPA-TRANS-006` | `FRONTERA_DISTRIBUIDA`                    | `SUPA-TRANS`   | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-136` | `CAP-08.09`                                                                                                                      | `PASS-UX-001`    | `pass`                                    | `PASS-UX`      | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-137` | `CAP-09.04`, `CAP-09.08`, `CAP-09.09`                                                                                            | `DATA-DOM-009`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-138` | `CAP-10.01`, `CAP-10.07`                                                                                                         | `PASS-UX-001`    | `pass`                                    | `PASS-UX`      | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-139` | `CAP-12.02`, `CAP-12.09`                                                                                                         | `SUPA-AUD-019`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-140` | `CAP-15.01`, `CAP-15.03`, `CAP-15.04`, `CAP-15.05`, `CAP-15.06`, `CAP-15.09`                                                     | `SHELL-AUD-011`  | `FRONTERA_DISTRIBUIDA`                    | `SHELL-AUD`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-141` | `CAP-16.07`, `CAP-16.08`, `CAP-16.09`                                                                                            | `INFO-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-142` | `CAP-17.12`                                                                                                                      | `DATA-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-143` | `CAP-18.11`                                                                                                                      | `CONT-DOM-011`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-144` | `CAP-06.14`                                                                                                                      | `AURA-DOM-007`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-145` | `CAP-10.01`, `CAP-10.02`                                                                                                         | `PASS-INT-001`   | `pass`                                    | `PASS-INT`     | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-146` | `CAP-10.04`                                                                                                                      | `PASS-UX-001`    | `pass`                                    | `PASS-UX`      | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-147` | `CAP-14.01`, `CAP-14.02`, `CAP-14.05`                                                                                            | `AURA-DOM-002`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-148` | `CAP-15.10`                                                                                                                      | `AURA-DOM-003`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-149` | `CAP-15.01`                                                                                                                      | `AURA-DOM-005`   | `aura`                                    | `AURA-DOM`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-150` | `CAP-01.04`                                                                                                                      | `SUPA-AUD-012`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-151` | `CAP-02.06`                                                                                                                      | `SUPA-AUD-014`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-152` | `CAP-10.07`                                                                                                                      | `PASS-INT-002`   | `pass`                                    | `PASS-INT`     | `devVentoGroup/vento-pass`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-153` | `CAP-15.01`, `CAP-15.06`                                                                                                         | `SUPA-ARC-004`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-ARC`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-154` | `CAP-17.01`, `CAP-17.03`                                                                                                         | `DATA-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-155` | `CAP-12.01`, `CAP-12.09`, `CAP-12.15`                                                                                            | `NUMERA-UX-014`  | `numera`                                  | `NUMERA-UX`    | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-156` | `CAP-15.01`                                                                                                                      | `NUMERA-DOM-009` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-157` | `CAP-01.04`                                                                                                                      | `EXT-GOV-001`    | `FRONTERA_DISTRIBUIDA`                    | `EXT-GOV`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-158` | `CAP-01.01`                                                                                                                      | `CONT-DOM-004`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-159` | `CAP-02.12`                                                                                                                      | `PULSO-UX-008`   | `pulso`                                   | `PULSO-UX`     | `devVentoGroup/vento-pulso`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-160` | `CAP-02.03`                                                                                                                      | `CONT-DOM-010`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-161` | `CAP-08.03`                                                                                                                      | `FOGO-UX-001`    | `fogo`                                    | `FOGO-UX`      | `devVentoGroup/vento-fogo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-162` | `CAP-09.13`                                                                                                                      | `CONT-DOM-006`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-163` | `CAP-11.04`, `CAP-11.11`                                                                                                         | `NEXO-UX-012`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-164` | `CAP-13.06`                                                                                                                      | `NFR-REQ-010`    | `FRONTERA_DISTRIBUIDA`                    | `NFR-REQ`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-165` | `CAP-15.04`, `CAP-15.05`                                                                                                         | `NEXO-UX-037`    | `nexo`                                    | `NEXO-UX`      | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-166` | `CAP-15.01`                                                                                                                      | `CONT-DOM-005`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-167` | `CAP-16.02`                                                                                                                      | `PROC-CAT-002`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-168` | `CAP-17.12`                                                                                                                      | `PROC-CAT-018`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-169` | `CAP-18.06`                                                                                                                      | `CONT-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-170` | `CAP-18.01`, `CAP-18.02`, `CAP-18.04`, `CAP-18.07`                                                                               | `CONT-DOM-008`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-171` | `CAP-03.05`, `CAP-03.07`                                                                                                         | `PROC-CAT-002`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-172` | `CAP-15.08`                                                                                                                      | `EVID-ARC-001`   | `FRONTERA_DISTRIBUIDA`                    | `EVID-ARC`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-173` | `CAP-15.09`                                                                                                                      | `PROC-ACTOR-003` | `FRONTERA_DISTRIBUIDA`                    | `PROC-ACTOR`   | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-174` | `CAP-02.06`, `CAP-02.07`, `CAP-02.08`, `CAP-02.09`, `CAP-02.10`                                                                  | `VISO-AUTH-010`  | `viso`                                    | `VISO-AUTH`    | `devVentoGroup/vento-viso`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-175` | `CAP-09.09`                                                                                                                      | `INT-EXT-019`    | `FRONTERA_DISTRIBUIDA`                    | `INT-EXT`      | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-176` | `CAP-16.03`                                                                                                                      | `SUPA-AUD-012`   | `FRONTERA_DISTRIBUIDA`                    | `SUPA-AUD`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-177` | `CAP-16.07`                                                                                                                      | `ANIMA-UX-017`   | `anima`                                   | `ANIMA-UX`     | `devVentoGroup/vento-anima`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-178` | `CAP-04.01`                                                                                                                      | `TI-DOM-001`     | `FRONTERA_DISTRIBUIDA`                    | `TI-DOM`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-179` | `CAP-06.01`                                                                                                                      | `SUPA-TRANS-013` | `FRONTERA_DISTRIBUIDA`                    | `SUPA-TRANS`   | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-180` | `CAP-07.01`                                                                                                                      | `SUPA-TRANS-013` | `FRONTERA_DISTRIBUIDA`                    | `SUPA-TRANS`   | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-181` | `CAP-13.01`                                                                                                                      | `TI-DOM-009`     | `FRONTERA_DISTRIBUIDA`                    | `TI-DOM`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-182` | `CAP-15.01`                                                                                                                      | `TI-DOM-006`     | `FRONTERA_DISTRIBUIDA`                    | `TI-DOM`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-183` | `CAP-15.06`                                                                                                                      | `TI-DOM-007`     | `FRONTERA_DISTRIBUIDA`                    | `TI-DOM`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-184` | `CAP-15.06`                                                                                                                      | `TI-DOM-001`     | `FRONTERA_DISTRIBUIDA`                    | `TI-DOM`       | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-185` | `CAP-15.01`, `CAP-15.05`, `CAP-15.09`                                                                                            | `SHELL-CI-007`   | `FRONTERA_DISTRIBUIDA`                    | `SHELL-CI`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-186` | `CAP-16.07`                                                                                                                      | `GAP-CTRL-007`   | `FRONTERA_DISTRIBUIDA`                    | `GAP-CTRL`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-187` | `CAP-14.01`                                                                                                                      | `AURA-INT-001`   | `aura`                                    | `AURA-INT`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-188` | `CAP-14.01`, `CAP-14.05`                                                                                                         | `AURA-INT-001`   | `aura`                                    | `AURA-INT`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-189` | `CAP-15.01`, `CAP-15.05`                                                                                                         | `AURA-AUTH-001`  | `aura`                                    | `AURA-AUTH`    | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-190` | `CAP-17.03`                                                                                                                      | `DATA-DOM-001`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-191` | `CAP-01.02`, `CAP-01.05`                                                                                                         | `PROC-CAT-002`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-192` | `CAP-10.08`                                                                                                                      | `AURA-AUD-010`   | `aura`                                    | `AURA-AUD`     | `NO_CONFIRMADO`               | `BLOQUEADO_REPO_AURA`                        | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-193` | `CAP-15.09`                                                                                                                      | `CONT-DOM-014`   | `FRONTERA_DISTRIBUIDA`                    | `CONT-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-194` | `CAP-18.06`, `CAP-18.10`, `CAP-18.11`                                                                                            | `CONT-AUTH-004`  | `FRONTERA_DISTRIBUIDA`                    | `CONT-AUTH`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-195` | `CAP-10.02`                                                                                                                      | `PROC-CAT-004`   | `FRONTERA_DISTRIBUIDA`                    | `PROC-CAT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-196` | `CAP-02.04`                                                                                                                      | `ANIMA-UX-001`   | `anima`                                   | `ANIMA-UX`     | `devVentoGroup/vento-anima`   | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-197` | `CAP-04.01`, `CAP-04.04`                                                                                                         | `CAP-TAL-003`    | `FRONTERA_DISTRIBUIDA_TALENTO_VISO_ANIMA` | `CAP-TAL`      | `devVentoGroup/vento-talento` | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-198` | `CAP-06.01`                                                                                                                      | `SHELL-AUD-010`  | `FRONTERA_DISTRIBUIDA`                    | `SHELL-AUD`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-199` | `CAP-07.01`                                                                                                                      | `NEXO-DOM-001`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-200` | `CAP-15.05`, `CAP-15.06`, `CAP-15.09`                                                                                            | `SHELL-CI-007`   | `FRONTERA_DISTRIBUIDA`                    | `SHELL-CI`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-201` | `CAP-16.07`                                                                                                                      | `INFO-DOM-003`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-202` | `CAP-01.07`                                                                                                                      | `INFO-DOM-012`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-203` | `CAP-01.09`                                                                                                                      | `INFO-INT-003`   | `FRONTERA_DISTRIBUIDA`                    | `INFO-INT`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-204` | `CAP-03.03`                                                                                                                      | `NEXO-DOM-001`   | `nexo`                                    | `NEXO-DOM`     | `devVentoGroup/vento-nexo`    | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-205` | `CAP-10.06`                                                                                                                      | `DATA-DOM-012`   | `FRONTERA_DISTRIBUIDA`                    | `DATA-DOM`     | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |
| `GAP-PKG-206` | `CAP-12.11`                                                                                                                      | `NUMERA-DOM-018` | `numera`                                  | `NUMERA-DOM`   | `devVentoGroup/vento-numera`  | `ASIGNADO`                                   | —                                              |
| `GAP-PKG-207` | `CAP-15.06`                                                                                                                      | `SHELL-AUD-011`  | `FRONTERA_DISTRIBUIDA`                    | `SHELL-AUD`    | `devVentoGroup/vento-shell`   | `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          | —                                              |

---

#### 6. Reconciliación cuantitativa

| Control                                                 |          Resultado |
| ------------------------------------------------------- | -----------------: |
| `package_id` esperados                                  |            **207** |
| `package_id` materializados                             |            **207** |
| rango                                                   | `GAP-PKG-001..207` |
| faltantes                                               |              **0** |
| duplicados                                              |              **0** |
| decisiones de `application_owner`                       |      **207 / 207** |
| decisiones de `domain_owner`                            |      **207 / 207** |
| repositorios primarios confirmados                      |      **193 / 207** |
| repositorios no confirmados                             |       **14 / 207** |
| paquetes bloqueados exclusivamente por repositorio AURA |             **14** |
| paquetes con frontera distribuida                       |            **121** |
| paquetes con asignación directa de aplicación           |             **71** |
| paquete FOGO con NEXO consumidor explícito              |              **1** |

##### 6.1. Distribución por aplicación o frontera

| `application_owner`                       | Paquetes |
| ----------------------------------------- | -------: |
| `FRONTERA_DISTRIBUIDA`                    |  **119** |
| `nexo`                                    |   **21** |
| `aura`                                    |   **14** |
| `numera`                                  |   **11** |
| `pass`                                    |   **11** |
| `pulso`                                   |    **8** |
| `anima`                                   |    **7** |
| `fogo`                                    |    **7** |
| `origo`                                   |    **3** |
| `viso`                                    |    **3** |
| `FRONTERA_DISTRIBUIDA_TALENTO_VISO_ANIMA` |    **2** |
| `shell`                                   |    **1** |
| **Total**                                 |  **207** |

##### 6.2. Distribución por repositorio primario

| `repo_owner`                  | Paquetes |
| ----------------------------- | -------: |
| `devVentoGroup/vento-shell`   |  **120** |
| `devVentoGroup/vento-nexo`    |   **21** |
| `NO_CONFIRMADO`               |   **14** |
| `devVentoGroup/vento-numera`  |   **11** |
| `devVentoGroup/vento-pass`    |   **11** |
| `devVentoGroup/vento-pulso`   |    **8** |
| `devVentoGroup/vento-anima`   |    **7** |
| `devVentoGroup/vento-fogo`    |    **7** |
| `devVentoGroup/vento-origo`   |    **3** |
| `devVentoGroup/vento-viso`    |    **3** |
| `devVentoGroup/vento-talento` |    **2** |
| **Total**                     |  **207** |

##### 6.3. Distribución por estado de propiedad

| `ownership_state`                            | Paquetes |
| -------------------------------------------- | -------: |
| `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`          |  **121** |
| `ASIGNADO`                                   |   **71** |
| `BLOQUEADO_REPO_AURA`                        |   **14** |
| `ASIGNADO_PRIMARIO_FOGO_CON_NEXO_CONSUMIDOR` |    **1** |
| **Total**                                    |  **207** |

---

#### 7. Registro de bloqueo AURA

Los siguientes paquetes tienen una decisión de propiedad materializada, pero su `repo_owner` no puede cerrarse sin inventar una fuente inexistente:

| `package_id`  | Tarea dominante | `capability_id`                       | `application_owner` | `repo_owner`    | Resolución obligatoria                         |
| ------------- | --------------- | ------------------------------------- | ------------------- | --------------- | ---------------------------------------------- |
| `GAP-PKG-006` | `AURA-DOM-007`  | `CAP-09.14`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-008` | `AURA-DOM-008`  | `CAP-14.05`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-059` | `AURA-INT-001`  | `CAP-14.01`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-078` | `AURA-DOM-007`  | `CAP-09.14`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-080` | `AURA-DOM-001`  | `CAP-14.05`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-118` | `AURA-DOM-006`  | `CAP-14.02`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-144` | `AURA-DOM-007`  | `CAP-06.14`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-147` | `AURA-DOM-002`  | `CAP-14.01`, `CAP-14.02`, `CAP-14.05` | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-148` | `AURA-DOM-003`  | `CAP-15.10`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-149` | `AURA-DOM-005`  | `CAP-15.01`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-187` | `AURA-INT-001`  | `CAP-14.01`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-188` | `AURA-INT-001`  | `CAP-14.01`, `CAP-14.05`              | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-189` | `AURA-AUTH-001` | `CAP-15.01`, `CAP-15.05`              | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-192` | `AURA-AUD-010`  | `CAP-10.08`                           | `aura`              | `NO_CONFIRMADO` | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |

Este bloqueo no deja un pendiente narrativo sin dueño. La condición de salida es que la cadena `AURA-AUD-001` / `AURA-AUD-010` / `AURA-AUD-012` confirme repositorio y continuidad; hasta entonces esos catorce paquetes no pueden declararse listos para implementación física.

---

#### 8. Casos de rechazo

La propiedad de un paquete se considera inválida si ocurre cualquiera de los siguientes casos:

- se asigna un código de aplicación que no existe en el catálogo canónico;
- se usa el nombre de un repositorio como si fuera automáticamente el código de aplicación;
- un paquete AURA recibe un repositorio inventado o prestado de otra aplicación;
- un paquete transversal se atribuye funcionalmente a `shell` solo porque su raíz se coordina en `vento-shell`;
- un `domain_owner` no coincide con el namespace de la tarea dominante materializada;
- una identidad `GAP-PKG-*` queda sin decisión de aplicación/frontera o dominio;
- una ausencia de repositorio queda expresada como `TBD`, texto libre o pendiente sin tarea propietaria;
- se renumera, fusiona o divide un paquete para simplificar propiedad;
- se modifica la membresía de brechas, capacidades o procesos resuelta por tareas anteriores;
- se confunde `repo_owner` con el inventario exhaustivo de repositorios y archivos que corresponde a `DELIV-PKG-014`.

---

#### 9. Fronteras de responsabilidad

`DELIV-PKG-003` **sí cierra**:

- una decisión explícita de `application_owner` o frontera distribuida para cada uno de los 207 paquetes;
- un `domain_owner` explícito y trazable para cada paquete;
- un `repo_owner` confirmado para 193 paquetes;
- el bloqueo explícito y gobernado de los 14 paquetes AURA cuyo repositorio no existe actualmente;
- la regla de que la propiedad del repositorio raíz no elimina consumidores ni repositorios impactados posteriores.

`DELIV-PKG-003` **no cierra**:

- estado AS-IS ni resultado TO-BE, reservado a `DELIV-PKG-004`;
- alcance incluido, excluido o diferido, reservado a `DELIV-PKG-005`;
- archivos exactos, reservado a `DELIV-PKG-014`;
- dependencias, bloqueos técnicos y orden de aplicación, reservado a `DELIV-PKG-015`;
- requisitos `TREQ-*` y plan de pruebas por paquete, reservado a `DELIV-PKG-016`;
- despliegue, rollback, piloto, evidencia de cierre o aprobación física.

---

#### 10. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

Esta tarea materializa exclusivamente metadatos documentales de propiedad sobre identidades y relaciones ya aprobadas. No crea comportamiento ejecutable, regla de negocio, autorización, contrato de integración, transición, cálculo ni restricción técnica. La vinculación de `TREQ-*` por paquete permanece reservada a `DELIV-PKG-016`; por tanto, se crean **0** requisitos y se modifican **0** requisitos existentes.

---

#### 11. Criterios de aceptación

- [x] existen exactamente **207** filas, una por `GAP-PKG-001..207`;
- [x] no existen `package_id` faltantes ni duplicados;
- [x] cada paquete tiene una decisión explícita de aplicación o frontera distribuida;
- [x] cada paquete tiene `domain_owner` trazable a su tarea dominante;
- [x] **193** paquetes tienen repositorio primario confirmado;
- [x] los **14** paquetes AURA conservan `repo_owner = NO_CONFIRMADO` sin inventar repositorio;
- [x] los catorce bloqueos AURA tienen resolución documental explícita mediante `AURA-AUD-001`, `AURA-AUD-010` y `AURA-AUD-012`;
- [x] los paquetes transversales no transfieren propiedad funcional a la aplicación `shell`;
- [x] TALENTO no se convierte en un undécimo código de aplicación;
- [x] el paquete productivo `OPS-PRD-001` conserva FOGO como propietario primario y NEXO como consumidor relacionado;
- [x] no se modifican identidades, brechas, capacidades ni procesos de `DELIV-PKG-001/002`;
- [x] no se crea ni modifica ningún requisito de prueba;
- [x] no se inicia implementación física ni se ejecutan cambios de repositorio, Supabase o producción.

---

ÚLTIMA TAREA APROBADA
`DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id`

TAREA ACTUAL APROBADA
`DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios`

SIGUIENTE TAREA RESERVADA
`DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable`


### ✅ DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable

**Estado:** APROBADA
**Tarea anterior:** `DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios`
**Tarea siguiente:** `DELIV-PKG-005 — Definir alcance incluido, excluido y diferido`
**Tipo de tarea:** documental — definición normativa y materialización completa del estado AS-IS y del resultado TO-BE verificable para los 207 `package_id` vigentes

---

#### 1. Resultado canónico

`DELIV-PKG-004` fija para cada una de las **207** raíces `GAP-PKG-001..207` una lectura AS-IS cerrada a la evidencia canónica existente y un resultado TO-BE verificable derivado de todos los perfiles de cierre de sus brechas miembro.

La tarea no convierte existencia parcial en capacidad terminada. Las **820 brechas vigentes continúan abiertas** y ningún paquete puede presentarse como cerrado por disponer de repositorio, código, datos, contrato, mock, fallback, procedimiento o evidencia parcial.

La decisión se expresa en cuatro capas inseparables:

1. **estado AS-IS del paquete:** lo que la evidencia vigente permite afirmar hoy sin completar vacíos por inferencia;
2. **política de reutilización:** qué información y qué implementación pueden conservarse;
3. **resultado TO-BE:** condición final que cada perfil de cierre exige demostrar;
4. **prueba de salida:** evidencia mínima que deberá existir antes de declarar cerradas las brechas correspondientes.

---

#### 2. Fuentes y precedencia documental

La tarea consume, sin reescribirlas, las siguientes decisiones ya aprobadas:

- el registro canónico de brechas de E1, incluida la actualización append-only de `PROC-COVER-010`;
- la matriz completa brecha → criterio → evidencia, que conserva **820** brechas vigentes y sus perfiles de cierre;
- `DELIV-PKG-001`, que fija las **207** identidades `GAP-PKG-*`;
- `DELIV-PKG-002`, que conserva la membresía brecha/capacidad/proceso;
- `DELIV-PKG-003`, que fija `application_owner`, `domain_owner`, `repo_owner` y sus bloqueos;
- las reglas de cierre de E1: una tarea cerrada no cierra automáticamente una brecha y una brecha cerrada no cierra automáticamente un paquete.

La actualización `PROC-COVER-010` prevalece en cardinalidad sobre la línea histórica: **820 brechas / 207 paquetes**. No modifica las 814 relaciones históricas salvo las ampliaciones de alcance declaradas expresamente.

---

#### 3. Contrato canónico AS-IS / TO-BE

| Campo                | Regla canónica                                                                                                                               |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `package_id`         | identidad estable `GAP-PKG-*`; no se renumera ni se sustituye                                                                                |
| `as_is_state`        | estado demostrable del paquete en la línea base vigente; nunca se eleva por inferencia desde existencia parcial                              |
| `as_is_basis`        | conjunto completo de brechas abiertas miembro y sus evidencias vigentes; para `202..207`, además se conserva el hallazgo explícito del delta |
| `reuse_policy`       | `REUSE-VERIFY`: conservar trazabilidad y reutilizar físicamente solo aquello que demuestre compatibilidad con todos los perfiles aplicables  |
| `closure_profiles`   | conjunto de perfiles `CLOSE-*` de todas las brechas miembro; en paquete multi-perfil se conservan todos                                      |
| `to_be_result`       | unión de resultados exigidos por los perfiles; no se reduce al perfil dominante                                                              |
| `verification_basis` | unión de evidencias mínimas de los perfiles; la evidencia deberá vincularse a cada brecha que respalda                                       |
| `result_owner`       | tarea dominante y propiedad definida en `DELIV-PKG-003`; no transfiere la propiedad de brechas a otro dominio                                |

---

#### 4. Estados AS-IS permitidos

Para evitar que E5 invente una clasificación física que E1 no certificó a nivel de paquete, se utilizan estados cerrados y conservadores:

| Código                                           | Significado                                                                                                                                                                              |
| ------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ASIS-E1-OPEN-MIXED`                             | paquete histórico con una o varias brechas abiertas; su AS-IS exacto es la unión normativa de las declaraciones de sus brechas miembro; no se presume completitud ni homogeneidad física |
| `ASIS-OPEN-REPO-AURA-BLOCKED`                    | paquete AURA abierto cuyo `repo_owner` continúa `NO_CONFIRMADO`; el bloqueo de repositorio se conserva además del AS-IS de las brechas                                                   |
| `ASIS-SIN-OPERACION-VIGENTE-EVIDENCIABLE`        | no existe operación vigente y evidenciable para el ciclo descrito                                                                                                                        |
| `ASIS-SIN-CICLO-INTERNO-GOBERNADO`               | no existe ciclo interno gobernado para el alcance descrito                                                                                                                               |
| `ASIS-PROCESO-COMPLETO-NO-CONFIRMADO`            | no se confirmó un proceso completo para el alcance descrito                                                                                                                              |
| `ASIS-CANALES-PRESENTES-PROCESO-NO-GOBERNADO`    | existen canales o superficies parciales, pero no demuestran el proceso gobernado requerido                                                                                               |
| `ASIS-ESTRUCTURAS-PARCIALES-SIN-CICLO-GOBERNADO` | existen estructuras o análisis parciales, pero no el ciclo gobernado requerido                                                                                                           |
| `ASIS-SUPERFICIE-RUNTIME-NO-CONFIRMADA`          | una búsqueda estática no confirmó la superficie equivalente y no prueba inexistencia en runtime                                                                                          |

Un paquete histórico no recibe etiquetas como `BACKEND_REAL`, `MOCK`, `FALLBACK`, `CODIGO_HUERFANO` o `CONTRATO_IMPLEMENTADO` solo por el nombre de una tarea, aplicación o repositorio. Si una tarea posterior demuestra una de esas condiciones, la evidencia podrá refinar el AS-IS sin alterar `package_id` ni ocultar las brechas abiertas.

---

#### 5. Política de conservación y sustitución

La política común es `REUSE-VERIFY`:

1. se conservan siempre identidad del paquete, membresía de brechas, capacidades, procesos, propiedad, historia y evidencia válida;
2. una implementación existente solo se reutiliza cuando satisface los criterios aplicables o puede adaptarse sin crear una ruta competidora no controlada;
3. un mock, fallback, código huérfano, duplicado, dato competidor o contrato obsoleto no se conserva por mera existencia;
4. ningún elemento físico se retira por esta tarea sin evidencia de consumidores, dependencias, migración, compatibilidad y rollback cuando apliquen;
5. los paquetes con `CLOSE-TEC-VAL` pueden terminar en conservación, corrección o retiro, pero el retiro exige demostrar que no quedan consumidores activos ni dependencias ocultas;
6. los paquetes con perfiles múltiples deben satisfacer todos sus resultados TO-BE antes de poder cerrar las brechas correspondientes.

Esta tarea decide la **condición de salida**. La superficie física exacta se materializa en las tareas posteriores de E5: pantallas/componentes, lógica de dominio, datos, migraciones, archivos, dependencias, pruebas, despliegue y rollback.

---

#### 6. Catálogo de resultados TO-BE verificables

| Perfil          | Código TO-BE   | Resultado verificable                                                                                          | Evidencia mínima heredada de E1                                                   |
| --------------- | -------------- | -------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `CLOSE-FUN-DES` | `TOBE-FUN-DES` | definición funcional aprobada y no ambigua.                                                                    | `EV-01`; `EV-02`; `EV-07` cuando exista interacción humana                        |
| `CLOSE-FUN-IMP` | `TOBE-FUN-IMP` | comportamiento funcional implementado y aceptado de punta a punta.                                             | `EV-02`; `EV-03`; `EV-04`; `EV-05`; `EV-07`; `EV-11`                              |
| `CLOSE-FUN-VAL` | `TOBE-FUN-VAL` | cobertura funcional inspeccionada o probada con conclusión reproducible.                                       | `EV-02`; `EV-05`; `EV-07` o `EV-13`; `EV-18` solo como apoyo                      |
| `CLOSE-CON-CTR` | `TOBE-CON-CTR` | contrato versionado y aprobado, adoptado por productores y consumidores o con transición explícita.            | `EV-01`; `EV-02`; `EV-05`; `EV-11`; `EV-17`                                       |
| `CLOSE-TEC-DES` | `TOBE-TEC-DES` | diseño técnico ejecutable aprobado con dependencias, riesgos, observabilidad, seguridad, migración y rollback. | `EV-01`; `EV-02`; `EV-16` o `EV-17` cuando aplique                                |
| `CLOSE-TEC-IMP` | `TOBE-TEC-IMP` | condición técnica corregida en código, configuración y runtime, probada, desplegada y observable.              | `EV-02`; `EV-03`; `EV-04`; `EV-05`; `EV-06`; `EV-11`; `EV-09` si modifica datos   |
| `CLOSE-TEC-VAL` | `TOBE-TEC-VAL` | conclusión técnica demostrada; si existe retiro, sin consumidores activos ni dependencias ocultas.             | `EV-02`; `EV-04`; `EV-05`; `EV-15`; `EV-17`                                       |
| `CLOSE-DAT-GOV` | `TOBE-DAT-GOV` | gobierno y contrato de datos aprobados sin fuentes competidoras no gobernadas.                                 | `EV-01`; `EV-02`; `EV-08`; `EV-13` cuando exista obligación profesional o externa |
| `CLOSE-DAT-MIG` | `TOBE-DAT-MIG` | migración o corrección de datos reversible y reconciliada cuantitativa y semánticamente.                       | `EV-02`; `EV-04`; `EV-08`; `EV-09`; `EV-11`; `EV-17`                              |
| `CLOSE-SEG-ENF` | `TOBE-SEG-ENF` | control aplicado en capa autoritativa y probado también por denegación.                                        | `EV-01`; `EV-02`; `EV-04`; `EV-10`; `EV-11`; `EV-14` para excepción temporal      |
| `CLOSE-OPE-ADP` | `TOBE-OPE-ADP` | proceso operativo aprobado, adoptado, repetible y ejecutado correctamente por usuarios reales.                 | `EV-01`; `EV-02`; `EV-07`; `EV-11`; `EV-12`; `EV-16` para continuidad o capacidad |

Los códigos `TOBE-*` no sustituyen los perfiles `CLOSE-*`; son una proyección de E5 para expresar el resultado objetivo sin perder el criterio original de cierre.

---

#### 7. Regla de paquetes multi-perfil

La línea histórica contiene **41 paquetes con más de un perfil** y **160 con un solo perfil**. Las seis extensiones `202..207` son mono-perfil. El universo vigente queda en **166 paquetes mono-perfil + 41 multi-perfil = 207**.

Para un paquete multi-perfil:

- `closure_profiles` es el conjunto completo de perfiles presentes en sus brechas;
- `to_be_result` es la unión de todos los `TOBE-*` correspondientes;
- la evidencia mínima se acumula por perfil, pero cada evidencia debe enlazarse individualmente a la brecha que realmente respalda;
- no se usa el criterio más débil para aprobar brechas de otro perfil;
- un resultado de diseño no sustituye un resultado de implementación, validación, seguridad, datos u operación cuando ambos coexisten.

---

#### 8. Matriz materializada AS-IS / TO-BE de los 207 paquetes

| `package_id`  | Brechas | `as_is_state`                                    | Perfiles de cierre                                | Resultados TO-BE                               | Tarea dominante  | `repo_owner` / estado                                                     |
| ------------- | ------: | ------------------------------------------------ | ------------------------------------------------- | ---------------------------------------------- | ---------------- | ------------------------------------------------------------------------- |
| `GAP-PKG-001` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-DB-003`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-002` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-DB-002`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-003` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `SUPA-AUD-015`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-004` |  **22** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-DB-002`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-005` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `INT-EXT-002`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-006` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-DOM-007`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-007` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PASS-INT-001`   | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-008` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-DOM-008`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-009` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-EXT-001`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-010` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `DATA-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-011` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-002`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-012` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INFO-DOM-004`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-013` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-014` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INFO-DOM-010`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-015` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-010`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-016` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INFO-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-017` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PASS-INT-001`   | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-018` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-AUD-010`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-019` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `SUPA-AUD-016`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-020` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INFO-INT-003`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-021` |  **18** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INFO-AUTH-001`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-022` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `DATA-INT-003`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-023` |  **27** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `DATA-DOM-017`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-024` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NUMERA-DOM-003` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-025` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INT-DB-008`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-026` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NUMERA-DOM-002` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-027` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `EXT-GOV-001`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-028` |   **5** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `VISO-CORE-006`  | `devVentoGroup/vento-viso` / `ASIGNADO`                                   |
| `GAP-PKG-029` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NEXO-DOM-001`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-030` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-AUD-023`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-031` |  **27** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PROC-CAT-005`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-032` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-WORK-002`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-033` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SHELL-CON-016`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-034` |   **5** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `SHELL-CON-016`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-035` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-AUD-019`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-036` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-037` |   **7** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NEXO-UX-009`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-038` |   **9** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-039` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `ORIGO-UX-014`   | `devVentoGroup/vento-origo` / `ASIGNADO`                                  |
| `GAP-PKG-040` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `FOGO-AUTH-010`  | `devVentoGroup/vento-fogo` / `ASIGNADO`                                   |
| `GAP-PKG-041` |   **8** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `UX-QA-027`      | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-042` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-MKT-002`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-043` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PROC-CAT-009`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-044` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PULSO-UX-009`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-045` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SHELL-CON-002`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-046` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NEXO-DOM-029`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-047` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INT-DB-008`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-048` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PULSO-UX-020`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-049` |   **9** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-ARC-007`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-050` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-AUTH-003`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-051` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `FOGO-AUTH-008`  | `devVentoGroup/vento-fogo` / `ASIGNADO`                                   |
| `GAP-PKG-052` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-APP-008`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-053` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `CONT-DOM-003`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-054` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NEXO-UX-037`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-055` |   **5** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `SUPA-ARC-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-056` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `ANIMA-AUTH-015` | `devVentoGroup/vento-anima` / `ASIGNADO`                                  |
| `GAP-PKG-057` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-QA-029`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-058` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-QA-029`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-059` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AURA-INT-001`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-060` |  **52** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `INFO-AUTH-004`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-061` |   **5** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `INFO-AUTH-002`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-062` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AUTH-QA-026`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-063` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-WORK-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-064` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `CAP-TAL-003`    | `devVentoGroup/vento-talento` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`       |
| `GAP-PKG-065` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-CI-016`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-066` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-IMP`                                   | `TOBE-TEC-IMP`                                 | `ANIMA-AUTH-014` | `devVentoGroup/vento-anima` / `ASIGNADO`                                  |
| `GAP-PKG-067` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `TI-DOM-001`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-068` |   **8** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SUPA-ARC-020`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-069` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `PULSO-UX-003`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-070` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `PASS-INT-001`   | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-071` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-IMP`; `TOBE-TEC-VAL`                 | `UX-QA-019`      | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-072` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `TI-INT-003`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-073` |  **18** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-CI-007`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-074` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `SUPA-ARC-016`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-075` |   **7** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `DATA-DOM-004`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-076` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `CONT-INT-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-077` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PROC-CAT-009`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-078` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-007`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-079` |   **7** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `PASS-UX-006`    | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-080` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `AURA-DOM-001`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-081` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-IMP`                                   | `TOBE-FUN-IMP`                                 | `PASS-UX-012`    | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-082` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-012`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-083` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-TRANS-006` | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-084` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-085` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-013` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-086` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-005` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-087` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-016` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-088` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `NUMERA-DOM-016` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-089` |   **6** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `NUMERA-DOM-014` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-090` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-005` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-091` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-009`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-092` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `DATA-DOM-006`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-093` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `VISO-CORE-006`  | `devVentoGroup/vento-viso` / `ASIGNADO`                                   |
| `GAP-PKG-094` |   **6** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `PROC-CAT-002`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-095` |   **6** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-CAT-002`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-096` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `NEXO-UX-019`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-097` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-CAT-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-098` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `OPS-PRD-001`    | `devVentoGroup/vento-fogo` / `ASIGNADO_PRIMARIO_FOGO_CON_NEXO_CONSUMIDOR` |
| `GAP-PKG-099` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NEXO-DOM-029`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-100` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `FOGO-UX-009`    | `devVentoGroup/vento-fogo` / `ASIGNADO`                                   |
| `GAP-PKG-101` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-033`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-102` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ORIGO-AUTH-004` | `devVentoGroup/vento-origo` / `ASIGNADO`                                  |
| `GAP-PKG-103` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-013`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-104` |  **13** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `NEXO-UX-037`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-105` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `FOGO-UX-012`    | `devVentoGroup/vento-fogo` / `ASIGNADO`                                   |
| `GAP-PKG-106` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-107` |   **8** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `NEXO-DOM-008`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-108` |   **6** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `SUPA-AUD-019`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-109` |  **19** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `FOGO-UX-010`    | `devVentoGroup/vento-fogo` / `ASIGNADO`                                   |
| `GAP-PKG-110` |  **26** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `PULSO-UX-021`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-111` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PULSO-UX-009`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-112` |   **9** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-013`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-113` |  **10** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-UX-001`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-114` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-VAL`                  | `TOBE-FUN-DES`; `TOBE-FUN-VAL`                 | `PULSO-UX-010`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-115` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NEXO-DOM-029`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-116` |   **8** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-AUTH-031`  | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-117` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-DOM-003`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-118` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `AURA-DOM-006`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-119` |  **11** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `NFR-REQ-012`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-120` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `ORIGO-UX-001`   | `devVentoGroup/vento-origo` / `ASIGNADO`                                  |
| `GAP-PKG-121` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-VAL`                  | `TOBE-FUN-DES`; `TOBE-FUN-VAL`                 | `INFO-DOM-003`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-122` |   **5** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-026`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-123` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `PULSO-UX-017`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-124` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `DATA-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-125` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `TI-INT-003`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-126` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-026`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-127` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `devVentoGroup/vento-anima` / `ASIGNADO`                                  |
| `GAP-PKG-128` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `devVentoGroup/vento-anima` / `ASIGNADO`                                  |
| `GAP-PKG-129` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `devVentoGroup/vento-anima` / `ASIGNADO`                                  |
| `GAP-PKG-130` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `TI-DOM-001`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-131` |  **19** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `PASS-UX-001`    | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-132` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `SHELL-APP-001`  | `devVentoGroup/vento-shell` / `ASIGNADO`                                  |
| `GAP-PKG-133` |   **8** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SUPA-TRANS-005` | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-134` |  **12** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SUPA-AUD-014`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-135` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `SUPA-TRANS-006` | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-136` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `PASS-UX-001`    | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-137` |   **6** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `DATA-DOM-009`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-138` |   **9** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `PASS-UX-001`    | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-139` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-VAL`                                   | `TOBE-TEC-VAL`                                 | `SUPA-AUD-019`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-140` |  **36** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-AUD-011`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-141` |   **6** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `INFO-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-142` |  **11** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `DATA-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-143` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `CONT-DOM-011`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-144` |   **2** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-007`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-145` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PASS-INT-001`   | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-146` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-VAL`                                   | `TOBE-FUN-VAL`                                 | `PASS-UX-001`    | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-147` |   **7** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-002`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-148` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `AURA-DOM-003`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-149` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-005`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-150` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-012`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-151` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-014`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-152` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PASS-INT-002`   | `devVentoGroup/vento-pass` / `ASIGNADO`                                   |
| `GAP-PKG-153` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-ARC-004`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-154` |  **11** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `DATA-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-155` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NUMERA-UX-014`  | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-156` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NUMERA-DOM-009` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-157` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `EXT-GOV-001`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-158` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-004`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-159` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PULSO-UX-008`   | `devVentoGroup/vento-pulso` / `ASIGNADO`                                  |
| `GAP-PKG-160` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-010`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-161` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `FOGO-UX-001`    | `devVentoGroup/vento-fogo` / `ASIGNADO`                                   |
| `GAP-PKG-162` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-006`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-163` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-012`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-164` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NFR-REQ-010`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-165` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-037`    | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-166` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-005`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-167` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PROC-CAT-002`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-168` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PROC-CAT-018`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-169` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `CONT-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-170` |   **9** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-008`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-171` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-CAT-002`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-172` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `EVID-ARC-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-173` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-ACTOR-003` | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-174` |   **6** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `VISO-AUTH-010`  | `devVentoGroup/vento-viso` / `ASIGNADO`                                   |
| `GAP-PKG-175` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `INT-EXT-019`    | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-176` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-012`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-177` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `devVentoGroup/vento-anima` / `ASIGNADO`                                  |
| `GAP-PKG-178` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `TI-DOM-001`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-179` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `SUPA-TRANS-013` | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-180` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `SUPA-TRANS-013` | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-181` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `TI-DOM-009`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-182` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `TI-DOM-006`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-183` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `TI-DOM-007`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-184` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `TI-DOM-001`     | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-185` |  **24** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-CI-007`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-186` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `GAP-CTRL-007`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-187` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-INT-001`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-188` |   **2** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-INT-001`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-189` |   **2** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-FUN-IMP`                                   | `TOBE-FUN-IMP`                                 | `AURA-AUTH-001`  | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-190` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-001`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-191` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PROC-CAT-002`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-192` |   **1** | `ASIS-OPEN-REPO-AURA-BLOCKED`                    | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-AUD-010`   | `NO_CONFIRMADO` / `BLOQUEADO_REPO_AURA`                                   |
| `GAP-PKG-193` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-014`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-194` |   **3** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-AUTH-004`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-195` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PROC-CAT-004`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-196` |   **2** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-FUN-DES`; `CLOSE-FUN-VAL`                  | `TOBE-FUN-DES`; `TOBE-FUN-VAL`                 | `ANIMA-UX-001`   | `devVentoGroup/vento-anima` / `ASIGNADO`                                  |
| `GAP-PKG-197` |   **5** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `CAP-TAL-003`    | `devVentoGroup/vento-talento` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`       |
| `GAP-PKG-198` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `SHELL-AUD-010`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-199` |   **1** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `NEXO-DOM-001`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-200` |  **10** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `SHELL-CI-007`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-201` |   **4** | `ASIS-E1-OPEN-MIXED`                             | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `INFO-DOM-003`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-202` |   **1** | `ASIS-SIN-OPERACION-VIGENTE-EVIDENCIABLE`        | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `INFO-DOM-012`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-203` |   **1** | `ASIS-SIN-CICLO-INTERNO-GOBERNADO`               | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INFO-INT-003`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-204` |   **1** | `ASIS-PROCESO-COMPLETO-NO-CONFIRMADO`            | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-001`   | `devVentoGroup/vento-nexo` / `ASIGNADO`                                   |
| `GAP-PKG-205` |   **1** | `ASIS-CANALES-PRESENTES-PROCESO-NO-GOBERNADO`    | `CLOSE-FUN-VAL`                                   | `TOBE-FUN-VAL`                                 | `DATA-DOM-012`   | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |
| `GAP-PKG-206` |   **1** | `ASIS-ESTRUCTURAS-PARCIALES-SIN-CICLO-GOBERNADO` | `CLOSE-FUN-IMP`                                   | `TOBE-FUN-IMP`                                 | `NUMERA-DOM-018` | `devVentoGroup/vento-numera` / `ASIGNADO`                                 |
| `GAP-PKG-207` |   **1** | `ASIS-SUPERFICIE-RUNTIME-NO-CONFIRMADA`          | `CLOSE-TEC-VAL`                                   | `TOBE-TEC-VAL`                                 | `SHELL-AUD-011`  | `devVentoGroup/vento-shell` / `ASIGNADO_CON_FRONTERA_DISTRIBUIDA`         |

La matriz no duplica las 820 declaraciones de brecha. Para `GAP-PKG-001..201`, `as_is_basis` es por referencia normativa la matriz E1 de brechas miembro ya preservada por `DELIV-PKG-002`; para `202..207`, la síntesis explícita se materializa en la sección siguiente.

---

#### 9. Materialización explícita del AS-IS del delta `202..207`

| `package_id`  | Hallazgo AS-IS vigente                                                                                                                                                                                                             | Resultado TO-BE                                                                                                                      |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `GAP-PKG-202` | No existe una operación vigente y evidenciable para registrar, evaluar, tratar, aceptar, seguir y cerrar riesgos estratégicos, financieros, operativos, legales y tecnológicos.                                                    | `TOBE-OPE-ADP` mediante `INFO-DOM-012`, con procedimiento, responsables, controles, contingencia y evidencia aprobados y repetibles. |
| `GAP-PKG-203` | No existe un ciclo interno gobernado que asigne propietario, expediente, requerimiento, vencimiento, concepto, respuesta, aceptación, obligación y cierre para relaciones con asesores y autoridades.                              | `TOBE-CON-CTR` mediante `INFO-INT-003`, con contrato versionado, aprobado y adoptado o transición explícita.                         |
| `GAP-PKG-204` | No se confirmó un proceso completo para determinar requerimiento de EPP, entregar el elemento correcto, obtener aceptación y controlar vigencia, sustitución, devolución, pérdida y evidencia.                                     | `TOBE-OPE-ADP` mediante `NEXO-DOM-001`, sin confundir existencia de inventario con adopción del proceso completo.                    |
| `GAP-PKG-205` | La existencia de canales de feedback no demuestra un proceso gobernado de satisfacción; faltan población, muestra, canal, consentimiento, respuesta, sesgo, análisis, uso y separación frente a reclamo, incentivo y compensación. | `TOBE-FUN-VAL` mediante `DATA-DOM-012`, con cobertura funcional inspeccionada o probada y conclusión reproducible.                   |
| `GAP-PKG-206` | Existen estructuras y análisis financieros parciales, pero no un ciclo presupuestal alcanzable y gobernado para versión, supuestos, aprobación, vigencia, consumo, proyección, desviación, reforecast y supersesión.               | `TOBE-FUN-IMP` mediante `NUMERA-DOM-018`, con comportamiento objetivo funcionando de punta a punta.                                  |
| `GAP-PKG-207` | Para 77 pantallas canónicas no se confirmó una superficie equivalente en snapshots de repositorio; una búsqueda estática no prueba inexistencia en runtime, consumo dinámico, deep link, QR, notificación o integración externa.   | `TOBE-TEC-VAL` mediante `SHELL-AUD-011`; cualquier retiro exige demostrar ausencia de consumidores activos y dependencias ocultas.   |

---

#### 10. Reconciliación cuantitativa

| Control                                      |          Resultado |
| -------------------------------------------- | -----------------: |
| `package_id` esperados                       |            **207** |
| `package_id` materializados                  |            **207** |
| rango continuo                               | `GAP-PKG-001..207` |
| brechas vigentes cubiertas                   |            **820** |
| paquetes mono-perfil                         |            **166** |
| paquetes multi-perfil                        |             **41** |
| paquetes sin perfil                          |              **0** |
| paquetes sin tarea dominante                 |              **0** |
| paquetes con repositorio primario confirmado |            **193** |
| paquetes AURA con repositorio no confirmado  |             **14** |

##### 10.1. Cobertura por perfil vigente

| Perfil          | Brechas | Paquetes que lo contienen |
| --------------- | ------: | ------------------------: |
| `CLOSE-FUN-DES` | **135** |                    **45** |
| `CLOSE-FUN-IMP` |  **39** |                    **16** |
| `CLOSE-FUN-VAL` |  **15** |                    **11** |
| `CLOSE-CON-CTR` | **103** |                    **37** |
| `CLOSE-TEC-DES` | **127** |                    **32** |
| `CLOSE-TEC-IMP` |  **33** |                    **17** |
| `CLOSE-TEC-VAL` |  **61** |                    **19** |
| `CLOSE-DAT-GOV` | **115** |                    **44** |
| `CLOSE-DAT-MIG` |  **11** |                     **4** |
| `CLOSE-SEG-ENF` |  **98** |                    **12** |
| `CLOSE-OPE-ADP` |  **83** |                    **28** |

La suma de la columna de paquetes por perfil excede 207 porque un paquete multi-perfil aparece una vez en cada perfil que debe satisfacer.

---

#### 11. Tratamiento del bloqueo AURA

Los **14 paquetes AURA** conservan `repo_owner = NO_CONFIRMADO` y `ownership_state = BLOQUEADO_REPO_AURA`. `DELIV-PKG-004` no usa ese bloqueo para inventar un repositorio ni para convertir la ausencia de repositorio en ausencia funcional.

Su AS-IS se registra como `ASIS-OPEN-REPO-AURA-BLOCKED`, y el resultado TO-BE continúa siendo el derivado de sus perfiles de cierre. La condición de propiedad permanece gobernada por `AURA-AUD-001`, `AURA-AUD-010` y `AURA-AUD-012`, sin reducir los resultados funcionales, contractuales, técnicos o de datos del paquete.

---

#### 12. Casos de rechazo

El resultado de `DELIV-PKG-004` es inválido si ocurre cualquiera de los siguientes casos:

- se declara un paquete cerrado mientras alguna de sus brechas permanece abierta;
- se trata un código existente, mock, fallback, contrato, tabla, proceso manual o repositorio como prueba automática de capacidad completa;
- se declara reutilizable una implementación sin contrastarla con todos los perfiles aplicables;
- se retira una superficie técnica sin demostrar consumidores, dependencias y efectos;
- se reduce un paquete multi-perfil a un único criterio de salida;
- se usa la propiedad de `DELIV-PKG-003` como sustituto de evidencia AS-IS;
- se convierte `NO_CONFIRMADO` en una afirmación de inexistencia;
- se inventa estado runtime a partir del nombre de tarea, namespace, aplicación o repositorio;
- se omite el delta `GAP-PKG-202..207`;
- se modifican identidad, membresía, capability, process o ownership resueltos por tareas anteriores;
- se anticipa el alcance incluido/excluido/diferido reservado a `DELIV-PKG-005`;
- se anticipan archivos, migraciones, rollout o rollback reservados a tareas posteriores de E5.

---

#### 13. Fronteras de responsabilidad

`DELIV-PKG-004` **sí cierra**:

- una definición AS-IS conservadora y trazable para los 207 paquetes;
- la regla única de reutilización `REUSE-VERIFY`;
- el conjunto completo de perfiles de cierre por paquete;
- el resultado TO-BE verificable asociado a cada perfil;
- el tratamiento de paquetes multi-perfil sin pérdida de exigencias;
- la materialización explícita del delta `202..207`;
- la prohibición de presentar existencia parcial como capacidad completada.

`DELIV-PKG-004` **no cierra**:

- alcance incluido, excluido o diferido, reservado a `DELIV-PKG-005`;
- pantallas, componentes y navegación, reservados a `DELIV-PKG-006`;
- lógica de dominio y servicios, reservados a `DELIV-PKG-007`;
- datos físicos y políticas, reservados a `DELIV-PKG-008`;
- migraciones, backfills y retiro legacy, reservados a `DELIV-PKG-009`;
- archivos exactos, reservados a `DELIV-PKG-014`;
- pruebas vinculadas por paquete, reservadas a `DELIV-PKG-016`;
- despliegue y rollback, reservados a `DELIV-PKG-019` y `DELIV-PKG-020`;
- cierre de brechas o paquetes en ejecución real.

---

#### 14. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

La tarea organiza estados, perfiles y condiciones de salida documentales ya aprobadas. No crea comportamiento ejecutable ni modifica el contenido de requisitos del registro canónico de pruebas.

---

#### 15. Criterios de aceptación

- [x] existen exactamente **207** filas materializadas y el rango es continuo `GAP-PKG-001..207`;
- [x] las **820** brechas vigentes quedan representadas por el conteo de brechas de sus paquetes;
- [x] los **11** perfiles canónicos de cierre están proyectados a resultados TO-BE verificables sin alterar su criterio original;
- [x] los **41** paquetes multi-perfil conservan todos sus perfiles y no usan un criterio único debilitado;
- [x] los **6** paquetes `202..207` tienen AS-IS explícito derivado de sus hallazgos append-only;
- [x] los **14** paquetes AURA conservan el bloqueo de repositorio sin inferir inexistencia funcional;
- [x] ninguna fila presenta una brecha abierta como capacidad terminada;
- [x] la reutilización física queda condicionada a verificación, no a mera existencia;
- [x] ningún retiro técnico queda autorizado sin evidencia de consumidores y dependencias;
- [x] no se altera la propiedad aprobada en `DELIV-PKG-003`;
- [x] no se define todavía alcance incluido, excluido o diferido;
- [x] no se crea ni modifica ningún requisito de prueba;
- [x] no se inicia implementación física, migración, despliegue ni cambio de producción.

---

#### 16. Continuidad

ÚLTIMA TAREA APROBADA
`DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios`

TAREA ACTUAL APROBADA
`DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable`

SIGUIENTE TAREA RESERVADA
`DELIV-PKG-005 — Definir alcance incluido, excluido y diferido`


### ✅ DELIV-PKG-005 — Definir alcance incluido, excluido y diferido

**Estado:** APROBADA
**Tarea anterior:** `DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable`
**Tarea siguiente:** `DELIV-PKG-006 — Definir pantallas, componentes y navegación que se crearán o modificarán`
**Tipo de tarea:** documental — definición normativa y materialización completa del alcance incluido, excluido y diferido para los 207 `package_id` vigentes

---

#### 1. Resultado canónico

`DELIV-PKG-005` fija la frontera de alcance de cada una de las **207** raíces `GAP-PKG-001..207` sin alterar identidad, membresía, propiedad, estado AS-IS, perfiles de cierre ni resultados TO-BE aprobados en `DELIV-PKG-001..004`.

La regla central es cerrada: **las 820 brechas reales vigentes permanecen incluidas en su paquete de origen y ninguna brecha miembro se elimina, transfiere, sustituye o difiere por conveniencia de implementación**. Un paquete puede conservar un bloqueo o una condición de activación, pero esa condición no borra su obligación de cierre.

El resultado distingue tres conceptos que no son intercambiables:

1. **incluido:** obligación que pertenece a la raíz del paquete y deberá conservarse hasta satisfacer todos los perfiles de cierre de sus brechas miembro;
2. **excluido:** elemento que no pertenece a la raíz del paquete y cuya exclusión no elimina una brecha vigente ni transfiere responsabilidad de forma implícita;
3. **diferido:** parte del alcance incluido cuya definición o ejecución está impedida por una condición canónica concreta, con propietario y condición de salida identificados.

El diferimiento no equivale a descarte, cierre, `NO_APLICA`, retiro de brecha ni cambio automático del estado de un requisito `TREQ-*`.

---

#### 2. Fuentes y precedencia documental

La tarea consume y preserva:

- `DELIV-PKG-001`: **207** identidades raíz estables `GAP-PKG-001..207`;
- `DELIV-PKG-002`: **820** brechas reales, membresía exclusiva paquete ↔ brecha, capacidades y procesos confirmados, además de **22** referencias de control/evidencia fuera de la membresía;
- `DELIV-PKG-003`: aplicación, dominio, repositorio primario y bloqueos de propiedad por paquete;
- `DELIV-PKG-004`: AS-IS, política `REUSE-VERIFY`, perfiles `CLOSE-*`, resultados `TOBE-*` y tratamiento de paquetes multiperfil;
- la ruta normal vigente, que mantiene `EXT-GOV` como etapa condicional con activación `ACTIVATE_WHEN_REQUIRED_EXTERNAL_FILE_EXISTS`;
- el bloqueo AURA ya materializado como `repo_owner = NO_CONFIRMADO` y `ownership_state = BLOQUEADO_REPO_AURA`;
- la separación entre planificación documental E5 e implementación física posterior.

Ninguna decisión de esta tarea reescribe las fuentes anteriores. Ante una ampliación posterior aprobada, la raíz conserva su `package_id` y la nueva decisión deberá preservar linaje y trazabilidad.

---

#### 3. Contrato canónico de alcance

| Campo                     | Regla canónica                                                                                                                      |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `package_id`              | raíz estable del expediente; no se renumera ni cambia por una decisión de alcance                                                   |
| `included_scope`          | unión completa de brechas miembro, capacidades aplicables, procesos confirmados, perfiles de cierre y resultados TO-BE del paquete  |
| `excluded_scope`          | elementos que no pertenecen a la membresía ni a las obligaciones de cierre de la raíz; nunca se usa para retirar una brecha vigente |
| `deferred_scope`          | subconjunto incluido que conserva una condición de bloqueo o activación explícita                                                   |
| `deferred_owner`          | tarea o tareas exactas responsables de resolver la condición                                                                        |
| `deferred_exit_condition` | evidencia o estado canónico que permite retirar el diferimiento sin inferencia                                                      |
| `scope_status`            | clasificación documental de la raíz en esta tarea; no equivale a estado de implementación                                           |
| `member_gaps_excluded`    | debe ser **0** para los 207 paquetes en la línea vigente                                                                            |

La ausencia de detalle físico en esta tarea no convierte ese detalle en alcance excluido. Las tareas `DELIV-PKG-006..025` descomponen progresivamente el alcance ya incluido sin autorizar reducción retroactiva.

---

#### 4. Estados de alcance permitidos

| Código                                | Significado                                                                                                                                                                  |
| ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `INCLUIDO_COMPLETO`                   | la raíz conserva íntegramente sus brechas y obligaciones; no existe un bloqueo especial de alcance en esta tarea                                                             |
| `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` | la raíz conserva íntegramente su obligación, pero la definición física dependiente de repositorio no puede cerrarse mientras AURA mantenga `repo_owner = NO_CONFIRMADO`      |
| `INCLUIDO_CON_ACTIVACION_CONDICIONAL` | la raíz conserva íntegramente su obligación, pero la parte gobernada por `EXT-GOV-001` solo se activa cuando se cumple la condición canónica de expediente externo requerido |

Códigos de diferimiento:

| Código                        | Propietario                                    | Condición de salida                                                                                              |
| ----------------------------- | ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              | no existe condición especial adicional a la descomposición normal de E5                                          |
| `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` | repositorio y continuidad AURA confirmados canónicamente, sin reasignación inferida                              |
| `DIFERIDO_ACTIVACION_EXT_GOV` | `EXT-GOV-001`                                  | activación conforme a `ACTIVATE_WHEN_REQUIRED_EXTERNAL_FILE_EXISTS` y existencia del expediente externo exigible |

---

#### 5. Regla de alcance incluido

Para cada `package_id`, queda incluido de manera inseparable:

1. el **100 % de sus brechas miembro** aprobadas en `DELIV-PKG-002`;
2. todas las capacidades vinculadas que la fuente canónica asocia con esas brechas;
3. todos los `process_id` confirmados, conservando cardinalidad cero cuando no exista proceso confirmado;
4. todos los perfiles `CLOSE-*` presentes en sus brechas;
5. todos los resultados `TOBE-*` correspondientes, sin reducir paquetes multiperfil al criterio dominante;
6. la propiedad funcional y técnica fijada en `DELIV-PKG-003`, incluido cualquier bloqueo explícito;
7. la evidencia y los criterios de salida heredados que sean necesarios para demostrar cierre real;
8. las obligaciones de compatibilidad, transición, seguridad, datos, operación y evidencia que resulten de tareas posteriores del mismo paquete.

Una implementación parcial podrá satisfacer parte de este alcance, pero no cambia la frontera de la raíz ni autoriza a declarar cerrado el paquete mientras existan brechas u obligaciones pendientes.

---

#### 6. Regla de alcance excluido

Queda excluido **de una raíz determinada**, sin eliminarlo del plan global cuando tenga identidad propia:

- cualquier brecha cuyo `package_id` sea diferente;
- cualquier capacidad o proceso no vinculado por una fuente canónica a la raíz;
- las **22 referencias de control/evidencia** que `DELIV-PKG-002` conserva fuera de la membresía paquete ↔ brecha;
- `VISO-SCHEDULE-MONTHLY-001`, que conserva identidad reservada separada del rango `GAP-PKG-*`;
- `NEXO-REMISSIONS-001`, que conserva identidad de carril y no se convierte en `package_id` por inferencia;
- cambios oportunistas, refactors, mejoras cosméticas, normalizaciones, retiros o sustituciones que no sean necesarios para satisfacer el alcance aprobado del paquete;
- trabajo de otro paquete que comparta aplicación, repositorio, capacidad, proceso, owner o consumidor, salvo que una dependencia posterior lo vincule expresamente.

**Resultado cuantitativo:** **0 de 820 brechas miembro quedan excluidas**. La exclusión se aplica a elementos ajenos a la raíz, no a obligaciones vigentes de cierre.

---

#### 7. Regla de alcance diferido

Un diferimiento es válido únicamente si cumple simultáneamente:

1. el elemento continúa identificado como parte del alcance incluido;
2. existe una causa concreta y verificable;
3. existe una tarea propietaria exacta;
4. existe una condición de salida;
5. el diferimiento no se usa para cerrar una brecha;
6. no se cambia por inferencia el estado de un `TREQ-*`;
7. no se desplaza silenciosamente la responsabilidad a otra aplicación, dominio o repositorio.

La línea vigente materializa **16 paquetes con diferimiento especial**:

- **14 AURA** por repositorio no confirmado;
- **2** gobernados por `EXT-GOV-001` por activación condicional;
- **191** sin diferimiento bloqueante especial.

La descomposición documental que sigue en `DELIV-PKG-006..025` aplica a los 207 paquetes, pero no constituye por sí misma un diferimiento de alcance: es el mecanismo obligatorio para especificar cómo se materializará el alcance ya incluido.

---

#### 8. Matriz materializada de alcance de los 207 paquetes

| `package_id`  | Brechas | Perfiles de cierre incluidos                      | Resultados TO-BE incluidos                     | Tarea dominante  | `scope_status`                        | Brechas miembro excluidas | `deferred_scope`              | `deferred_owner`                               |
| ------------- | ------: | ------------------------------------------------- | ---------------------------------------------- | ---------------- | ------------------------------------- | ------------------------: | ----------------------------- | ---------------------------------------------- |
| `GAP-PKG-001` |   **1** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-DB-003`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-002` |   **2** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-DB-002`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-003` |   **1** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `SUPA-AUD-015`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-004` |  **22** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-DB-002`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-005` |   **2** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `INT-EXT-002`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-006` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-DOM-007`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-007` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PASS-INT-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-008` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-DOM-008`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-009` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-EXT-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-010` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `DATA-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-011` |   **2** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-012` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INFO-DOM-004`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-013` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-014` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INFO-DOM-010`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-015` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-010`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-016` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INFO-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-017` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PASS-INT-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-018` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-AUD-010`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-019` |   **3** | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `SUPA-AUD-016`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-020` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INFO-INT-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-021` |  **18** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INFO-AUTH-001`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-022` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `DATA-INT-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-023` |  **27** | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `DATA-DOM-017`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-024` |   **2** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NUMERA-DOM-003` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-025` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INT-DB-008`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-026` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NUMERA-DOM-002` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-027` |   **2** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `EXT-GOV-001`    | `INCLUIDO_CON_ACTIVACION_CONDICIONAL` |                     **0** | `DIFERIDO_ACTIVACION_EXT_GOV` | `EXT-GOV-001`                                  |
| `GAP-PKG-028` |   **5** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `VISO-CORE-006`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-029` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NEXO-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-030` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-AUD-023`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-031` |  **27** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PROC-CAT-005`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-032` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-WORK-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-033` |   **4** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SHELL-CON-016`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-034` |   **5** | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `SHELL-CON-016`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-035` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-AUD-019`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-036` |   **2** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-037` |   **7** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NEXO-UX-009`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-038` |   **9** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-039` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `ORIGO-UX-014`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-040` |   **3** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `FOGO-AUTH-010`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-041` |   **8** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `UX-QA-027`      | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-042` |   **4** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-MKT-002`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-043` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PROC-CAT-009`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-044` |   **4** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PULSO-UX-009`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-045` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SHELL-CON-002`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-046` |   **4** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `NEXO-DOM-029`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-047` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `INT-DB-008`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-048` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PULSO-UX-020`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-049` |   **9** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `SUPA-ARC-007`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-050` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-AUTH-003`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-051` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `FOGO-AUTH-008`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-052` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-APP-008`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-053` |   **2** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `CONT-DOM-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-054` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NEXO-UX-037`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-055` |   **5** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `SUPA-ARC-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-056` |   **2** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `ANIMA-AUTH-015` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-057` |   **1** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-QA-029`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-058` |   **4** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AUTH-QA-029`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-059` |   **1** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `AURA-INT-001`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-060` |  **52** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `INFO-AUTH-004`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-061` |   **5** | `CLOSE-SEG-ENF`                                   | `TOBE-SEG-ENF`                                 | `INFO-AUTH-002`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-062` |   **2** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AUTH-QA-026`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-063` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INT-WORK-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-064` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `CAP-TAL-003`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-065` |   **3** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-CI-016`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-066` |   **1** | `CLOSE-TEC-IMP`                                   | `TOBE-TEC-IMP`                                 | `ANIMA-AUTH-014` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-067` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `TI-DOM-001`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-068` |   **8** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SUPA-ARC-020`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-069` |   **2** | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `PULSO-UX-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-070` |   **4** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `PASS-INT-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-071` |   **2** | `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-IMP`; `TOBE-TEC-VAL`                 | `UX-QA-019`      | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-072` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `TI-INT-003`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-073` |  **18** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-CI-007`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-074` |   **2** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `SUPA-ARC-016`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-075` |   **7** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `DATA-DOM-004`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-076` |   **2** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `CONT-INT-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-077` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PROC-CAT-009`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-078` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-007`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-079` |   **7** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `PASS-UX-006`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-080` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `AURA-DOM-001`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-081` |   **1** | `CLOSE-FUN-IMP`                                   | `TOBE-FUN-IMP`                                 | `PASS-UX-012`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-082` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-012`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-083` |   **4** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-TRANS-006` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-084` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-085` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-013` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-086` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-005` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-087` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-016` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-088` |   **2** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `NUMERA-DOM-016` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-089` |   **6** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `NUMERA-DOM-014` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-090` |   **3** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NUMERA-DOM-005` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-091` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-009`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-092` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `DATA-DOM-006`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-093` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `VISO-CORE-006`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-094` |   **6** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `PROC-CAT-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-095` |   **6** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-CAT-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-096` |   **3** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `NEXO-UX-019`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-097` |   **3** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-CAT-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-098` |   **2** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `OPS-PRD-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-099` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NEXO-DOM-029`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-100` |   **4** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `FOGO-UX-009`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-101` |   **2** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-033`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-102` |   **3** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ORIGO-AUTH-004` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-103` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-013`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-104` |  **13** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `NEXO-UX-037`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-105` |   **4** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `FOGO-UX-012`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-106` |   **2** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-019`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-107` |   **8** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `NEXO-DOM-008`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-108` |   **6** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `SUPA-AUD-019`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-109` |  **19** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `FOGO-UX-010`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-110` |  **26** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `PULSO-UX-021`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-111` |   **3** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PULSO-UX-009`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-112` |   **9** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-013`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-113` |  **10** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-UX-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-114` |   **3** | `CLOSE-FUN-DES`; `CLOSE-FUN-VAL`                  | `TOBE-FUN-DES`; `TOBE-FUN-VAL`                 | `PULSO-UX-010`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-115` |   **2** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NEXO-DOM-029`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-116` |   **8** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-AUTH-031`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-117` |   **2** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-DOM-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-118` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `AURA-DOM-006`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-119` |  **11** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`; `CLOSE-FUN-VAL` | `TOBE-FUN-DES`; `TOBE-FUN-IMP`; `TOBE-FUN-VAL` | `NFR-REQ-012`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-120` |   **2** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `ORIGO-UX-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-121` |   **4** | `CLOSE-FUN-DES`; `CLOSE-FUN-VAL`                  | `TOBE-FUN-DES`; `TOBE-FUN-VAL`                 | `INFO-DOM-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-122` |   **5** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-026`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-123` |   **4** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `PULSO-UX-017`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-124` |   **2** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `DATA-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-125` |   **4** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `TI-INT-003`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-126` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-026`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-127` |   **4** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-128` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-129` |   **2** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-130` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `TI-DOM-001`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-131` |  **19** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `PASS-UX-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-132` |   **4** | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `SHELL-APP-001`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-133` |   **8** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SUPA-TRANS-005` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-134` |  **12** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SUPA-AUD-014`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-135` |   **4** | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `SUPA-TRANS-006` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-136` |   **2** | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `PASS-UX-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-137` |   **6** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `DATA-DOM-009`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-138` |   **9** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `PASS-UX-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-139` |   **2** | `CLOSE-TEC-VAL`                                   | `TOBE-TEC-VAL`                                 | `SUPA-AUD-019`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-140` |  **36** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-AUD-011`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-141` |   **6** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `INFO-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-142` |  **11** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `DATA-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-143` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `CONT-DOM-011`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-144` |   **2** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-007`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-145` |   **2** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PASS-INT-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-146` |   **1** | `CLOSE-FUN-VAL`                                   | `TOBE-FUN-VAL`                                 | `PASS-UX-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-147` |   **7** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-002`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-148` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `AURA-DOM-003`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-149` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-DOM-005`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-150` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-012`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-151` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-014`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-152` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PASS-INT-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-153` |   **2** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-ARC-004`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-154` |  **11** | `CLOSE-DAT-GOV`; `CLOSE-DAT-MIG`                  | `TOBE-DAT-GOV`; `TOBE-DAT-MIG`                 | `DATA-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-155` |   **3** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NUMERA-UX-014`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-156` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `NUMERA-DOM-009` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-157` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `EXT-GOV-001`    | `INCLUIDO_CON_ACTIVACION_CONDICIONAL` |                     **0** | `DIFERIDO_ACTIVACION_EXT_GOV` | `EXT-GOV-001`                                  |
| `GAP-PKG-158` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-004`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-159` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `PULSO-UX-008`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-160` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-010`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-161` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `FOGO-UX-001`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-162` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-006`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-163` |   **2** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-012`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-164` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NFR-REQ-010`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-165` |   **2** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `NEXO-UX-037`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-166` |   **2** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-005`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-167` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PROC-CAT-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-168` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `PROC-CAT-018`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-169` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `CONT-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-170` |   **9** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-008`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-171` |   **3** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-CAT-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-172` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `EVID-ARC-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-173` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `PROC-ACTOR-003` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-174` |   **6** | `CLOSE-FUN-DES`; `CLOSE-FUN-IMP`                  | `TOBE-FUN-DES`; `TOBE-FUN-IMP`                 | `VISO-AUTH-010`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-175` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `INT-EXT-019`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-176` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `SUPA-AUD-012`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-177` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `ANIMA-UX-017`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-178` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `TI-DOM-001`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-179` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `SUPA-TRANS-013` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-180` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `SUPA-TRANS-013` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-181` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `TI-DOM-009`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-182` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `TI-DOM-006`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-183` |   **1** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `TI-DOM-007`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-184` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `TI-DOM-001`     | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-185` |  **24** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`; `CLOSE-TEC-VAL` | `TOBE-TEC-DES`; `TOBE-TEC-IMP`; `TOBE-TEC-VAL` | `SHELL-CI-007`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-186` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `GAP-CTRL-007`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-187` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-INT-001`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-188` |   **2** | `CLOSE-FUN-DES`                                   | `TOBE-FUN-DES`                                 | `AURA-INT-001`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-189` |   **2** | `CLOSE-FUN-IMP`                                   | `TOBE-FUN-IMP`                                 | `AURA-AUTH-001`  | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-190` |   **1** | `CLOSE-DAT-GOV`                                   | `TOBE-DAT-GOV`                                 | `DATA-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-191` |   **2** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PROC-CAT-002`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-192` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `AURA-AUD-010`   | `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO` |                     **0** | `DIFERIDO_REPO_AURA`          | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012` |
| `GAP-PKG-193` |   **2** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-DOM-014`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-194` |   **3** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `CONT-AUTH-004`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-195` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `PROC-CAT-004`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-196` |   **2** | `CLOSE-FUN-DES`; `CLOSE-FUN-VAL`                  | `TOBE-FUN-DES`; `TOBE-FUN-VAL`                 | `ANIMA-UX-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-197` |   **5** | `CLOSE-TEC-DES`; `CLOSE-TEC-IMP`                  | `TOBE-TEC-DES`; `TOBE-TEC-IMP`                 | `CAP-TAL-003`    | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-198` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `SHELL-AUD-010`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-199` |   **1** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `NEXO-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-200` |  **10** | `CLOSE-TEC-DES`; `CLOSE-TEC-VAL`                  | `TOBE-TEC-DES`; `TOBE-TEC-VAL`                 | `SHELL-CI-007`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-201` |   **4** | `CLOSE-TEC-DES`                                   | `TOBE-TEC-DES`                                 | `INFO-DOM-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-202` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `INFO-DOM-012`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-203` |   **1** | `CLOSE-CON-CTR`                                   | `TOBE-CON-CTR`                                 | `INFO-INT-003`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-204` |   **1** | `CLOSE-OPE-ADP`                                   | `TOBE-OPE-ADP`                                 | `NEXO-DOM-001`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-205` |   **1** | `CLOSE-FUN-VAL`                                   | `TOBE-FUN-VAL`                                 | `DATA-DOM-012`   | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-206` |   **1** | `CLOSE-FUN-IMP`                                   | `TOBE-FUN-IMP`                                 | `NUMERA-DOM-018` | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |
| `GAP-PKG-207` |   **1** | `CLOSE-TEC-VAL`                                   | `TOBE-TEC-VAL`                                 | `SHELL-AUD-011`  | `INCLUIDO_COMPLETO`                   |                     **0** | `SIN_DIFERIMIENTO_BLOQUEANTE` | —                                              |

La matriz registra una decisión explícita por identidad. El conteo de brechas proviene de la membresía vigente de `DELIV-PKG-002`; perfiles, resultados y tarea dominante provienen de `DELIV-PKG-004`. Ninguna fila redefine esos valores.

---

#### 9. Reconciliación cuantitativa

| Control                                          |          Resultado |
| ------------------------------------------------ | -----------------: |
| `package_id` esperados                           |            **207** |
| `package_id` materializados                      |            **207** |
| rango continuo                                   | `GAP-PKG-001..207` |
| brechas vigentes incluidas                       |            **820** |
| brechas miembro excluidas                        |              **0** |
| paquetes `INCLUIDO_COMPLETO`                     |            **191** |
| paquetes `INCLUIDO_CON_BLOQUEO_DE_REPOSITORIO`   |             **14** |
| paquetes `INCLUIDO_CON_ACTIVACION_CONDICIONAL`   |              **2** |
| paquetes con diferimiento especial               |             **16** |
| paquetes sin diferimiento bloqueante especial    |            **191** |
| paquetes multiperfil preservados                 |             **41** |
| paquetes monoperfil preservados                  |            **166** |
| referencias control/evidencia fuera de membresía |             **22** |

Los tres estados de alcance suman exactamente **207** y no se solapan.

---

#### 10. Tratamiento específico AURA

Los siguientes **14 paquetes** conservan alcance incluido completo y no pierden ninguna brecha: `GAP-PKG-006`, `GAP-PKG-008`, `GAP-PKG-059`, `GAP-PKG-078`, `GAP-PKG-080`, `GAP-PKG-118`, `GAP-PKG-144`, `GAP-PKG-147`, `GAP-PKG-148`, `GAP-PKG-149`, `GAP-PKG-187`, `GAP-PKG-188`, `GAP-PKG-189` y `GAP-PKG-192`.

Su condición es `DIFERIDO_REPO_AURA`. Esto difiere exclusivamente la definición y ejecución que dependa de un repositorio propietario confirmado; no difiere la necesidad funcional, contractual, técnica, operativa o de datos representada por sus brechas.

La salida requiere que `AURA-AUD-001`, `AURA-AUD-010` y `AURA-AUD-012` resuelvan canónicamente repositorio y continuidad. Mientras no ocurra, queda prohibido reasignar esos paquetes a `vento-shell` u otro repositorio para eliminar el bloqueo documental.

---

#### 11. Tratamiento específico `EXT-GOV-001`

`GAP-PKG-027` y `GAP-PKG-157` conservan todas sus brechas y resultados TO-BE dentro del alcance, pero la ejecución de la parte gobernada por `EXT-GOV-001` mantiene `DIFERIDO_ACTIVACION_EXT_GOV`.

La condición de salida es la activación canónica `ACTIVATE_WHEN_REQUIRED_EXTERNAL_FILE_EXISTS` y la existencia del expediente externo exigible. La ausencia de activación no convierte las brechas en cerradas, descartadas ni inexistentes.

Si la condición nunca se activa para un caso concreto, cualquier cierre posterior deberá quedar respaldado por la decisión canónica aplicable; esta tarea no convierte la condición en una exclusión permanente.

---

#### 12. Descomposición posterior obligatoria del alcance incluido

El alcance fijado aquí se descompone, sin cambiar la frontera de la raíz, mediante las siguientes tareas exactas:

| Tarea           | Responsabilidad reservada                                                               |
| --------------- | --------------------------------------------------------------------------------------- |
| `DELIV-PKG-006` | pantallas, componentes y navegación que se crearán o modificarán                        |
| `DELIV-PKG-007` | lógica de dominio, Server Actions, API, RPC y Edge Functions                            |
| `DELIV-PKG-008` | tablas, vistas, funciones, políticas, Storage y Realtime afectados                      |
| `DELIV-PKG-009` | migraciones, backfills, compatibilidad y retiro legacy                                  |
| `DELIV-PKG-010` | eventos emitidos, consumidos, colas y compensaciones                                    |
| `DELIV-PKG-011` | impresión, notificaciones, documentos y evidencia requeridos                            |
| `DELIV-PKG-012` | permisos, modalidad, alcance, contexto y contrato de recurso                            |
| `DELIV-PKG-013` | requisitos no funcionales aplicables                                                    |
| `DELIV-PKG-014` | archivos exactos que se crearán, modificarán o retirarán                                |
| `DELIV-PKG-015` | dependencias, bloqueos y orden de aplicación                                            |
| `DELIV-PKG-016` | requisitos `TREQ-*` y pruebas unitarias, contractuales, de integración, seguridad y E2E |
| `DELIV-PKG-017` | observabilidad, métricas, logs, alertas y auditoría                                     |
| `DELIV-PKG-018` | feature flags, configuración y activación progresiva                                    |
| `DELIV-PKG-019` | estrategia de despliegue y rollout                                                      |
| `DELIV-PKG-020` | rollback técnico, funcional y de datos                                                  |
| `DELIV-PKG-021` | documentación, procedimiento y capacitación                                             |
| `DELIV-PKG-022` | alcance, actores, datos y duración del piloto                                           |
| `DELIV-PKG-023` | criterios de aceptación y evidencia de cierre                                           |
| `DELIV-PKG-024` | vinculación del paquete con el registro canónico de brechas                             |
| `DELIV-PKG-025` | decisión final de aprobación del paquete antes de implementación física                 |

Estas tareas pueden descubrir que una superficie concreta no aplica a un paquete. Esa conclusión deberá quedar demostrada en la tarea propietaria correspondiente y no podrá reinterpretarse como exclusión retroactiva de una brecha miembro.

---

#### 13. Casos de rechazo

El alcance de `DELIV-PKG-005` es inválido si ocurre cualquiera de los siguientes casos:

- una de las **820** brechas vigentes queda fuera de su paquete sin una decisión canónica posterior que preserve linaje;
- una brecha se mueve de paquete por similitud de aplicación, repositorio, owner, capability o proceso;
- un paquete multiperfil elimina alguno de sus perfiles o resultados TO-BE;
- una exclusión se usa para evitar una obligación de seguridad, datos, operación, contrato, implementación o validación;
- un diferimiento no identifica tarea propietaria y condición de salida;
- un paquete AURA recibe repositorio por inferencia;
- `GAP-PKG-027` o `GAP-PKG-157` se descarta por no estar activa todavía la condición externa;
- las **22** referencias de control/evidencia se convierten en brechas de paquete;
- `VISO-SCHEDULE-MONTHLY-001` o `NEXO-REMISSIONS-001` se incorporan al rango `GAP-PKG-*` sin decisión explícita;
- una tarea posterior amplía trabajo sin conservar la raíz, la brecha y la dependencia que justifican esa ampliación;
- se confunde ausencia de detalle físico en `DELIV-PKG-005` con autorización para omitirlo en `DELIV-PKG-006..025`.

---

#### 14. Fronteras de responsabilidad

`DELIV-PKG-005` **sí cierra**:

- la frontera de alcance de las **207** raíces;
- la inclusión de las **820** brechas vigentes;
- la decisión explícita de **0 brechas miembro excluidas**;
- la separación entre exclusión real y trabajo perteneciente a otra raíz;
- la identificación de **14** diferimientos por repositorio AURA;
- la identificación de **2** diferimientos por activación condicional `EXT-GOV-001`;
- la preservación integral de los **41** paquetes multiperfil;
- el destino documental exacto de la descomposición posterior del alcance.

`DELIV-PKG-005` **no cierra**:

- pantallas, componentes o navegación exactos, reservados a `DELIV-PKG-006`;
- lógica de dominio y servicios, reservados a `DELIV-PKG-007`;
- objetos físicos de datos y políticas, reservados a `DELIV-PKG-008`;
- migraciones y transición física, reservadas a `DELIV-PKG-009`;
- eventos y compensaciones, reservados a `DELIV-PKG-010`;
- servicios de impresión, notificación y evidencia, reservados a `DELIV-PKG-011`;
- permisos y contrato de recurso, reservados a `DELIV-PKG-012`;
- requisitos no funcionales, reservados a `DELIV-PKG-013`;
- archivos, dependencias, pruebas, observabilidad, configuración, rollout, rollback, capacitación, piloto y cierre, reservados a `DELIV-PKG-014..025` según su responsabilidad exacta;
- implementación física, ejecución de migraciones, despliegue, piloto o cierre real de brechas.

---

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea fija fronteras documentales de alcance y conserva sin modificación las reglas verificables, perfiles de cierre y requisitos existentes. No introduce comportamiento ejecutable, no modifica runtime y no cambia el estado, contenido, destino o secuencia de ningún `TREQ-*`. La vinculación de requisitos con cada paquete permanece reservada a `DELIV-PKG-016`.

---

#### 16. Criterios de aceptación

- [x] existen exactamente **207** decisiones materializadas, una por `GAP-PKG-001..207`;
- [x] las **820** brechas vigentes permanecen incluidas en su raíz de origen;
- [x] existen **0** brechas miembro excluidas;
- [x] los **41** paquetes multiperfil conservan todos sus perfiles y resultados TO-BE;
- [x] los **166** paquetes monoperfil conservan su perfil completo;
- [x] los **14** paquetes AURA quedan incluidos con diferimiento de repositorio y tareas de salida exactas;
- [x] `GAP-PKG-027` y `GAP-PKG-157` quedan incluidos con activación condicional gobernada por `EXT-GOV-001`;
- [x] los otros **191** paquetes no reciben un diferimiento bloqueante inventado;
- [x] las **22** referencias de control/evidencia permanecen fuera de la membresía paquete-brecha;
- [x] no se incorpora `VISO-SCHEDULE-MONTHLY-001` ni `NEXO-REMISSIONS-001` al rango `GAP-PKG-*`;
- [x] cada diferimiento especial declara propietario y condición de salida;
- [x] la ausencia de detalle físico se asigna a tareas exactas `DELIV-PKG-006..025` sin convertirla en exclusión;
- [x] no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún `TREQ-*`;
- [x] no se implementa código, configuración, migraciones, DDL, DML, backfills ni cambios de producción.

---

#### 17. Continuidad

ÚLTIMA TAREA APROBADA
`DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable`

TAREA ACTUAL APROBADA
`DELIV-PKG-005 — Definir alcance incluido, excluido y diferido`

SIGUIENTE TAREA RESERVADA
`DELIV-PKG-006 — Definir pantallas, componentes y navegación que se crearán o modificarán`


### ✅ DELIV-PKG-006 — Definir pantallas, componentes y navegación que se crearán o modificarán

**Estado:** APROBADA
**Tarea anterior:** `DELIV-PKG-005 — Definir alcance incluido, excluido y diferido`
**Tarea siguiente:** `DELIV-PKG-007 — Definir lógica de dominio, Server Actions, API, RPC y Edge Functions`
**Tipo de tarea:** documental — descomposición normativa y materialización completa del impacto de pantallas, componentes y navegación para los 207 `package_id` vigentes

---

#### 1. Resultado canónico

`DELIV-PKG-006` fija una decisión explícita de interfaz para cada una de las **207** raíces `GAP-PKG-001..207`, sin convertir una dependencia técnica, de datos, contractual o de seguridad en una pantalla por inferencia.

La clasificación materializada es:

| Decisión              | Paquetes | Regla                                                                                                                                                                    |
| --------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `UI_CHANGE_REQUIRED`  |   **68** | el conjunto de tareas primarias incluidas contiene al menos una tarea propietaria de experiencia, superficie o navegación que obliga a descomponer el cambio de interfaz |
| `NO_DIRECT_UI_CHANGE` |  **123** | ninguna tarea primaria incluida exige cambio directo de pantalla, componente o navegación; el resultado de esta tarea para el paquete es `NO_APLICA`                     |
| `AURA_UI_BLOCKED`     |   **14** | el paquete pertenece a AURA y la superficie no puede materializarse mientras el repositorio y la continuidad AURA sigan bloqueados                                       |
| `EXT_GOV_CONDITIONAL` |    **2** | el paquete depende de la activación condicional de `EXT-GOV-001`; la decisión UI deberá reevaluarse solo si se cumple la condición de activación                         |
| **Total**             |  **207** | cobertura completa, sin faltantes ni duplicados                                                                                                                          |

Las **820 brechas** continúan dentro de sus paquetes. `NO_DIRECT_UI_CHANGE` no excluye una brecha ni reduce el resultado TO-BE: declara exclusivamente que su cierre no requiere un cambio directo de interfaz según las fuentes primarias vigentes.

Esta tarea define el alcance lógico de superficie. `DELIV-PKG-014` enumerará los archivos físicos exactos y distinguirá las operaciones de creación, modificación o retiro de archivos sin redefinir la decisión UI aprobada aquí.

---

#### 2. Fuentes y precedencia documental

La descomposición consume, sin reescribir:

- `DELIV-PKG-001..005`, que fijan identidad, membresía, propiedad, AS-IS/TO-BE y alcance de las 207 raíces;
- el registro canónico de brechas de E1, en particular la matriz `package_id` con sus tareas primarias incluidas;
- `PROC-SCREEN-001..004` y el inventario canónico `VSCREEN-0001..VSCREEN-0177`;
- `UX-STATION-012` y su catálogo cerrado de componentes operativos `OPC-*`;
- los contratos de navegación por actor, tarea, contexto y carril de E2;
- las tareas `*-UX-*`, `UX-ADMIN-*`, `SHELL-APP-*` y `SHELL-UI-*` presentes como tareas primarias del paquete;
- las condiciones AURA aprobadas en `DELIV-PKG-003..005`;
- la activación condicional de `EXT-GOV-001` aprobada para `GAP-PKG-027` y `GAP-PKG-157`.

Precedencia obligatoria: una referencia UI incluida como tarea primaria habilita alcance de interfaz; una referencia que exista solo como soporte no se promueve automáticamente a cambio de interfaz. Si una tarea posterior demuestra que un `NO_DIRECT_UI_CHANGE` necesita UI, `DELIV-PKG-006` deberá revisarse expresamente antes de `DELIV-PKG-025`; no se permite ampliar el paquete de forma silenciosa.

---

#### 3. Contrato de descomposición UI por paquete

| Campo              | Regla canónica                                                                                             |
| ------------------ | ---------------------------------------------------------------------------------------------------------- |
| `package_id`       | conserva la identidad `GAP-PKG-*` vigente                                                                  |
| `ui_decision`      | exactamente uno de `UI_CHANGE_REQUIRED`, `NO_DIRECT_UI_CHANGE`, `AURA_UI_BLOCKED` o `EXT_GOV_CONDITIONAL`  |
| `ui_owner_tasks`   | conjunto exacto de tareas primarias que justifican el impacto UI; no admite tareas inferidas por similitud |
| `screen_scope`     | código que determina si el paquete modifica una superficie canónica, no aplica o permanece bloqueado       |
| `component_scope`  | código que gobierna reutilización del catálogo `OPC-*` y prohíbe crear semántica nueva por inferencia      |
| `navigation_scope` | código que conserva actor, tarea, contexto y carril; una ruta visible nunca concede autoridad              |
| `ui_state`         | `ESPECIFICADO`, `NO_APLICA`, `BLOQUEADO` o `BLOQUEADO_CONDICIONAL`                                         |

Invariantes:

1. una tarea de backend, datos, contrato, migración o seguridad no crea una pantalla por el solo hecho de afectar una capacidad usada por humanos;
2. una tarea UI primaria no puede omitirse porque el paquete también contenga trabajo técnico;
3. un `VSCREEN-*`, un `OPC-*`, una ruta, un carril y un permiso son identidades diferentes;
4. visibilidad y navegación no sustituyen la autorización de servidor;
5. una aplicación transversal no crea un código de aplicación ficticio para alojar pantallas;
6. un nuevo `VSCREEN-*` solo puede aparecer cuando exista un cambio material de identidad gobernado por `PROC-SCREEN-001` y sus vínculos de aplicación, proceso y paso;
7. un nuevo identificador semántico `OPC-*` no puede ser creado por un paquete sin una evolución explícita del contrato de `UX-STATION-012`;
8. el estado físico de archivos, rutas y componentes de código se materializa en `DELIV-PKG-014` y no altera la identidad lógica decidida aquí.

---

#### 4. Alcance canónico de pantallas

El inventario de referencia contiene **177** identidades continuas `VSCREEN-0001..VSCREEN-0177`, distribuidas entre nueve aplicaciones con pantalla materializada:

| Aplicación | Pantallas | Rango canónico                                                       |
| ---------- | --------: | -------------------------------------------------------------------- |
| `shell`    |         7 | `VSCREEN-0001..0007`                                                 |
| `viso`     |        31 | `VSCREEN-0008..0026`, `VSCREEN-0113..0123`, `VSCREEN-0175`           |
| `anima`    |        14 | `VSCREEN-0027..0032`, `VSCREEN-0124..0131`                           |
| `nexo`     |        37 | `VSCREEN-0033..0054`, `VSCREEN-0132..0144`, `VSCREEN-0176..0177`     |
| `fogo`     |        15 | `VSCREEN-0055..0067`, `VSCREEN-0173..0174`                           |
| `origo`    |        14 | `VSCREEN-0068..0079`, `VSCREEN-0145..0146`                           |
| `pulso`    |        20 | `VSCREEN-0080..0093`, `VSCREEN-0147..0152`                           |
| `numera`   |        20 | `VSCREEN-0094..0106`, `VSCREEN-0153..0159`                           |
| `pass`     |        19 | `VSCREEN-0107..0112`, `VSCREEN-0160..0172`                           |
| `aura`     |         0 | sin identidad `VSCREEN-*` materializada mientras permanezca diferida |

Códigos usados por la matriz:

- `SCREEN-SOURCE-001`: el paquete tiene cambio UI directo. La superficie objetivo es la gobernada por sus `ui_owner_tasks`, dentro del contrato `VSCREEN-*`; no se inventa una pantalla adicional por el nombre del paquete.
- `SCREEN-NONE-001`: no existe cambio directo de pantalla exigido por las tareas primarias del paquete.
- `SCREEN-AURA-001`: AURA no tiene `VSCREEN-*` materializado; la superficie permanece bloqueada por `AURA-AUD-001`, `AURA-AUD-010` y `AURA-AUD-012`.
- `SCREEN-EXT-001`: no se materializa superficie mientras `EXT-GOV-001` permanezca inactivo; al activarse se debe reevaluar el paquete antes de `DELIV-PKG-025`.

`DELIV-PKG-006` crea **cero identidades nuevas `VSCREEN-*`**. La tarea vincula paquetes con las obligaciones UI ya presentes en su conjunto de tareas primarias y conserva la evolución de identidad bajo `PROC-SCREEN-001`.

---

#### 5. Alcance canónico de componentes

El catálogo semántico de referencia contiene **24** componentes operativos aprobados:

`OPC-CONTEXT-001`, `OPC-ACTOR-001`, `OPC-CONNECTION-001`, `OPC-WORK-001`, `OPC-STATE-001`, `OPC-RISK-001`, `OPC-ACTION-001`, `OPC-ACTION-002`, `OPC-TEXT-001`, `OPC-QUANTITY-001`, `OPC-SELECTION-001`, `OPC-SELECTION-002`, `OPC-SCAN-001`, `OPC-CAMERA-001`, `OPC-MEASURE-001`, `OPC-CHECKLIST-001`, `OPC-REASON-001`, `OPC-CONFIRM-001`, `OPC-HANDOFF-001`, `OPC-OFFLINE-001`, `OPC-PERIPHERAL-001`, `OPC-RECEIPT-001`, `OPC-HELP-001`, `OPC-PRIVACY-001`.

Los siete slots de composición se conservan como `PERSISTENT_CONTEXT`, `BLOCKING_STATE`, `WORK_IDENTITY`, `STEP_CONTENT`, `PRIMARY_ACTION`, `SECONDARY_SUPPORT` y `RESULT_AND_RECEIPT`.

Códigos usados por la matriz:

- `COMP-SOURCE-001`: reutilizar y componer exclusivamente los `OPC-*` requeridos por la superficie y la tarea UI propietaria; no se crea un identificador semántico nuevo por conveniencia de implementación.
- `COMP-NONE-001`: no aplica cambio de componente de interfaz para el paquete.
- `COMP-AURA-001`: composición diferida junto con la superficie AURA.
- `COMP-EXT-001`: composición condicional a la activación de `EXT-GOV-001`.

La creación de un componente de código local no equivale a crear un nuevo `OPC-*`; los archivos concretos pertenecen al inventario de `DELIV-PKG-014`.

---

#### 6. Alcance canónico de navegación

La navegación conserva los seis carriles aprobados:

`OPERATIONAL_EXECUTION`, `OPERATIONAL_SUPERVISION`, `ADMINISTRATIVE_WORK`, `CONFIGURATION_GOVERNANCE`, `AUDIT_ANALYTICS`, `PERSONAL_CUSTOMER_CANDIDATE`.

Códigos usados por la matriz:

- `NAV-SOURCE-001`: aplicar el contrato de navegación de la tarea UI propietaria, preservando actor efectivo, tarea, contexto, retorno y carril; una URL o elemento visible no concede permiso.
- `NAV-NONE-001`: el paquete no exige cambio directo de navegación.
- `NAV-AURA-001`: navegación AURA bloqueada junto con la superficie.
- `NAV-EXT-001`: navegación condicional a la activación de `EXT-GOV-001`.

Una ruta nueva no se crea por inferencia desde `package_id`, capability, rol, repositorio o pantalla. Cuando una fuente UI aprobada requiera una ruta o transición nueva, esa identidad deberá conservar el contrato de pantalla y la navegación autorizada antes de su inventario físico en `DELIV-PKG-014`.

---

#### 7. Matriz materializada de las 207 decisiones UI

| `package_id`  | `ui_decision`         | `ui_owner_tasks`                                                                                               | `screen_scope`      | `component_scope` | `navigation_scope` | `ui_state`              |
| ------------- | --------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------- | ----------------- | ------------------ | ----------------------- |
| `GAP-PKG-001` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-002` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-003` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-004` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-005` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-006` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-007` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-008` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-009` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-010` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-011` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-012` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-013` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-014` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-015` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-016` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-017` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-018` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-019` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-020` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-021` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-022` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-023` | `UI_CHANGE_REQUIRED`  | `DATA-UX-002`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-024` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-025` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-026` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-027` | `EXT_GOV_CONDITIONAL` | `EXT-GOV-001`                                                                                                  | `SCREEN-EXT-001`    | `COMP-EXT-001`    | `NAV-EXT-001`      | `BLOQUEADO_CONDICIONAL` |
| `GAP-PKG-028` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-029` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-030` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-031` | `UI_CHANGE_REQUIRED`  | `FOGO-UX-011`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-032` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-033` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-016`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-034` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-035` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-036` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-037` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-009`; `NEXO-UX-018`; `NEXO-UX-022`                                                                    | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-038` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-021`; `NEXO-UX-015`                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-039` | `UI_CHANGE_REQUIRED`  | `ORIGO-UX-014`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-040` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-041` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-010`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-042` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-043` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-044` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-009`; `NEXO-UX-011`; `NEXO-UX-013`                                                                   | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-045` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-046` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-047` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-048` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-020`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-049` | `UI_CHANGE_REQUIRED`  | `FOGO-UX-005`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-050` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-051` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-052` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-053` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-054` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-037`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-055` | `UI_CHANGE_REQUIRED`  | `VISO-UX-013`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-056` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-057` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-058` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-018`; `PASS-UX-001`                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-059` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-060` | `UI_CHANGE_REQUIRED`  | `VISO-UX-020`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-061` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-062` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-063` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-064` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-065` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-066` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-067` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-068` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-069` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-003`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-070` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-071` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-072` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-073` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-009`; `PULSO-UX-020`                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-074` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-075` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-037`; `NEXO-UX-009`                                                                                   | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-076` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-077` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-078` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-079` | `UI_CHANGE_REQUIRED`  | `PASS-UX-006`; `PULSO-UX-009`; `PULSO-UX-007`; `PASS-UX-002`                                                   | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-080` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-081` | `UI_CHANGE_REQUIRED`  | `PASS-UX-012`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-082` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-083` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-084` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-085` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-086` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-087` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-088` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-089` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-090` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-091` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-009`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-092` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-093` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-094` | `UI_CHANGE_REQUIRED`  | `VISO-UX-005`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-095` | `UI_CHANGE_REQUIRED`  | `VISO-UX-005`; `NEXO-UX-013`                                                                                   | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-096` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-019`; `VISO-UX-001`; `ORIGO-UX-014`                                                                   | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-097` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-005`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-098` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-037`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-099` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-100` | `UI_CHANGE_REQUIRED`  | `FOGO-UX-009`; `FOGO-UX-013`                                                                                   | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-101` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-102` | `UI_CHANGE_REQUIRED`  | `ORIGO-UX-009`; `ORIGO-UX-011`                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-103` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-104` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-037`; `NEXO-UX-019`; `NEXO-UX-022`; `NEXO-UX-001`; `NEXO-UX-039`; `NEXO-UX-009`; `FOGO-UX-005`        | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-105` | `UI_CHANGE_REQUIRED`  | `FOGO-UX-012`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-106` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-107` | `UI_CHANGE_REQUIRED`  | `FOGO-UX-012`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-108` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-109` | `UI_CHANGE_REQUIRED`  | `FOGO-UX-010`; `FOGO-UX-004`; `FOGO-UX-001`; `FOGO-UX-005`; `FOGO-UX-006`; `FOGO-UX-007`; `FOGO-UX-011`        | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-110` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-021`; `PULSO-UX-008`; `PULSO-UX-001`; `PULSO-UX-007`; `PULSO-UX-004`; `PULSO-UX-009`; `PULSO-UX-020` | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-111` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-009`; `PASS-UX-006`                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-112` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-013`; `NEXO-UX-022`; `PULSO-UX-009`; `NEXO-UX-010`; `NEXO-UX-011`; `PULSO-UX-021`                     | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-113` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-001`; `NEXO-UX-005`; `NEXO-UX-010`; `NEXO-UX-012`; `PULSO-UX-018`; `NEXO-UX-041`                      | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-114` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-010`; `ORIGO-UX-011`; `PULSO-UX-020`                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-115` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-116` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-117` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-009`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-118` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-119` | `UI_CHANGE_REQUIRED`  | `UX-ADMIN-001`; `FOGO-UX-011`; `SHELL-APP-002`                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-120` | `UI_CHANGE_REQUIRED`  | `ORIGO-UX-001`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-121` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-122` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-011`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-123` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-017`; `NUMERA-UX-025`                                                                                | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-124` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-125` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-126` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-127` | `UI_CHANGE_REQUIRED`  | `ANIMA-UX-017`; `ANIMA-UX-011`; `FOGO-UX-005`                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-128` | `UI_CHANGE_REQUIRED`  | `ANIMA-UX-017`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-129` | `UI_CHANGE_REQUIRED`  | `ANIMA-UX-017`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-130` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-131` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`; `PASS-UX-006`; `NEXO-UX-009`; `PULSO-UX-001`                                                    | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-132` | `UI_CHANGE_REQUIRED`  | `SHELL-APP-001`                                                                                                | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-133` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-134` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-135` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-136` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-137` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`; `PULSO-UX-020`                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-138` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`; `PULSO-UX-001`                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-139` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-001`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-140` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-141` | `UI_CHANGE_REQUIRED`  | `SHELL-UI-014`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-142` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-143` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-144` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-145` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-146` | `UI_CHANGE_REQUIRED`  | `PASS-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-147` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-148` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-149` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-150` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-151` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-152` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-153` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-154` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-155` | `UI_CHANGE_REQUIRED`  | `NUMERA-UX-014`; `NUMERA-UX-021`                                                                               | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-156` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-157` | `EXT_GOV_CONDITIONAL` | `EXT-GOV-001`                                                                                                  | `SCREEN-EXT-001`    | `COMP-EXT-001`    | `NAV-EXT-001`      | `BLOQUEADO_CONDICIONAL` |
| `GAP-PKG-158` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-159` | `UI_CHANGE_REQUIRED`  | `PULSO-UX-008`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-160` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-161` | `UI_CHANGE_REQUIRED`  | `FOGO-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-162` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-163` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-012`; `NEXO-UX-013`                                                                                   | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-164` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-165` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-037`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-166` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-167` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-168` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-169` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-170` | `UI_CHANGE_REQUIRED`  | `CONT-UX-001`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-171` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-172` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-173` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-174` | `UI_CHANGE_REQUIRED`  | `VISO-UX-002`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-175` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-176` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-177` | `UI_CHANGE_REQUIRED`  | `ANIMA-UX-017`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-178` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-179` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-180` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-181` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-182` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-183` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-184` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-185` | `UI_CHANGE_REQUIRED`  | `NEXO-UX-037`                                                                                                  | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-186` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-187` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-188` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-189` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-190` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-191` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-192` | `AURA_UI_BLOCKED`     | `AURA-AUD-001`; `AURA-AUD-010`; `AURA-AUD-012`                                                                 | `SCREEN-AURA-001`   | `COMP-AURA-001`   | `NAV-AURA-001`     | `BLOQUEADO`             |
| `GAP-PKG-193` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-194` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-195` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-196` | `UI_CHANGE_REQUIRED`  | `ANIMA-UX-001`                                                                                                 | `SCREEN-SOURCE-001` | `COMP-SOURCE-001` | `NAV-SOURCE-001`   | `ESPECIFICADO`          |
| `GAP-PKG-197` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-198` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-199` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-200` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-201` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-202` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-203` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-204` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-205` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-206` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |
| `GAP-PKG-207` | `NO_DIRECT_UI_CHANGE` | —                                                                                                              | `SCREEN-NONE-001`   | `COMP-NONE-001`   | `NAV-NONE-001`     | `NO_APLICA`             |

---

#### 8. Reconciliación de cobertura

| Control                                                      |    Resultado |
| ------------------------------------------------------------ | -----------: |
| `package_id` materializados                                  |      **207** |
| `UI_CHANGE_REQUIRED`                                         |       **68** |
| `NO_DIRECT_UI_CHANGE`                                        |      **123** |
| `AURA_UI_BLOCKED`                                            |       **14** |
| `EXT_GOV_CONDITIONAL`                                        |        **2** |
| filas duplicadas                                             |        **0** |
| identificadores faltantes en `001..207`                      |        **0** |
| nuevas identidades `VSCREEN-*` creadas por esta tarea        |        **0** |
| nuevas identidades semánticas `OPC-*` creadas por esta tarea |        **0** |
| brechas excluidas por esta tarea                             | **0 de 820** |

Las 68 raíces con cambio UI referencian **61 tareas propietarias distintas** de experiencia, superficie o navegación. La multiplicidad se conserva: una misma tarea UI puede participar en varios paquetes y un paquete puede requerir varias tareas UI sin fusionar sus identidades.

---

#### 9. Tratamiento de AURA

Los 14 paquetes AURA son `GAP-PKG-006`, `008`, `059`, `078`, `080`, `118`, `144`, `147`, `148`, `149`, `187`, `188`, `189` y `192`.

Para estos paquetes:

- el alcance funcional permanece incluido;
- no se inventa un repositorio ni una ruta;
- no se asigna una identidad `VSCREEN-*` inexistente;
- `AURA-AUD-001`, `AURA-AUD-010` y `AURA-AUD-012` son la condición documental exacta de desbloqueo;
- después del desbloqueo, `DELIV-PKG-006` deberá revisarse para materializar la decisión de superficie antes de que esos paquetes puedan superar `DELIV-PKG-025`.

El bloqueo no convierte a AURA en `NO_APLICA` y no transfiere sus superficies a `shell` ni a otra aplicación.

---

#### 10. Tratamiento de `EXT-GOV-001`

`GAP-PKG-027` y `GAP-PKG-157` conservan `EXT_GOV_CONDITIONAL`. Mientras no exista el archivo externo requerido por la regla `ACTIVATE_WHEN_REQUIRED_EXTERNAL_FILE_EXISTS`, esta tarea no materializa pantalla, componente ni navegación para esos dos paquetes.

Si la condición se activa, `EXT-GOV-001` deberá producir la evidencia que permita reevaluar el impacto UI y la matriz de esta misma tarea deberá actualizarse antes de `DELIV-PKG-025`. El silencio o la ausencia del archivo no se interpreta como `NO_APLICA` permanente.

---

#### 11. Relación con la descomposición posterior de E5

Esta tarea fija el alcance lógico de interfaz y no invade responsabilidades posteriores:

- `DELIV-PKG-007` definirá lógica de dominio, Server Actions, API, RPC y Edge Functions;
- `DELIV-PKG-008` definirá datos, políticas, Storage y Realtime;
- `DELIV-PKG-009` definirá migraciones, backfills, compatibilidad y retiro legacy;
- `DELIV-PKG-010..013` definirán integración operativa, evidencia, autorización y requisitos no funcionales;
- `DELIV-PKG-014` enumerará archivos exactos y la operación física prevista sobre cada archivo;
- `DELIV-PKG-015` fijará dependencias y orden;
- `DELIV-PKG-016` vinculará requisitos `TREQ-*` y pruebas por paquete;
- `DELIV-PKG-023` consolidará criterios y evidencia de cierre;
- `DELIV-PKG-025` impedirá aprobar un paquete con una decisión UI bloqueada, condicional no resuelta o contradicha por la descomposición posterior.

Un hallazgo de `DELIV-PKG-007..013` que contradiga `NO_DIRECT_UI_CHANGE` no autoriza a modificar la interfaz silenciosamente: obliga a revisar esta tarea antes del cierre del paquete.

---

#### 12. Fronteras de responsabilidad

`DELIV-PKG-006` **sí cierra**:

- una decisión UI explícita para las 207 raíces;
- identificación de las 68 raíces con obligación UI directa y sus 61 tareas propietarias;
- 123 decisiones `NO_DIRECT_UI_CHANGE` justificadas por ausencia de tarea primaria UI;
- 14 bloqueos AURA y 2 condiciones `EXT-GOV-001`;
- reglas de pantalla, componente y navegación que impiden identidades inventadas;
- continuidad con el inventario `VSCREEN-*`, el catálogo `OPC-*` y los carriles de navegación vigentes;
- regla de reapertura si una descomposición posterior demuestra impacto UI no registrado.

`DELIV-PKG-006` **no cierra**:

- archivos físicos concretos, reservados a `DELIV-PKG-014`;
- lógica de dominio o servidor, reservada a `DELIV-PKG-007`;
- tablas, funciones, RLS, Storage o Realtime, reservados a `DELIV-PKG-008`;
- migraciones y retiro legacy, reservados a `DELIV-PKG-009`;
- autorización funcional, reservada a `DELIV-PKG-012`;
- pruebas por paquete, reservadas a `DELIV-PKG-016`;
- implementación de frontend, rutas, componentes o despliegues;
- desbloqueo AURA o activación de `EXT-GOV-001`.

---

#### 13. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa una clasificación documental de alcance UI y consume contratos de pantallas, componentes y navegación ya aprobados. No introduce comportamiento ejecutable, no modifica autorización, runtime ni datos y no cambia el contenido de ningún requisito de prueba vigente. La vinculación de requisitos existentes por paquete permanece en `DELIV-PKG-016`.

---

#### 14. Criterios de aceptación

- [x] existen exactamente **207** filas y el rango `GAP-PKG-001..207` es continuo;
- [x] cada paquete tiene exactamente una `ui_decision`;
- [x] **68** paquetes quedan como `UI_CHANGE_REQUIRED` con tareas UI propietarias explícitas;
- [x] **123** paquetes quedan como `NO_DIRECT_UI_CHANGE` sin convertir trabajo técnico en pantalla por inferencia;
- [x] los **14** paquetes AURA conservan bloqueo y no reciben `VSCREEN-*` inventado;
- [x] `GAP-PKG-027` y `GAP-PKG-157` conservan la condición exacta de `EXT-GOV-001`;
- [x] las **820** brechas permanecen incluidas en sus paquetes;
- [x] el inventario `VSCREEN-0001..0177` se conserva sin renumeración;
- [x] el catálogo de **24** `OPC-*` se conserva sin crear semántica paralela;
- [x] los seis carriles de navegación se preservan y no se confunden con autoridad;
- [x] no se enumeran archivos físicos antes de `DELIV-PKG-014`;
- [x] no se crea ni modifica ningún requisito de prueba;
- [x] no se inicia código, migración, cambio de Supabase, despliegue ni tarea posterior.

---

#### 15. Continuidad

ÚLTIMA TAREA APROBADA
`DELIV-PKG-005 — Definir alcance incluido, excluido y diferido`

TAREA ACTUAL APROBADA
`DELIV-PKG-006 — Definir pantallas, componentes y navegación que se crearán o modificarán`

SIGUIENTE TAREA RESERVADA
`DELIV-PKG-007 — Definir lógica de dominio, Server Actions, API, RPC y Edge Functions`


### [ ] DELIV-PKG-007 — Definir lógica de dominio, Server Actions, API, RPC y Edge Functions
### [ ] DELIV-PKG-008 — Definir tablas, vistas, funciones, políticas, Storage y Realtime afectados
### [ ] DELIV-PKG-009 — Definir migraciones, backfills, compatibilidad y retiro legacy
### [ ] DELIV-PKG-010 — Definir eventos emitidos, consumidos, colas y compensaciones
### [ ] DELIV-PKG-011 — Definir impresión, notificaciones, documentos y evidencia requeridos
### [ ] DELIV-PKG-012 — Definir permisos, modalidad, alcance, contexto y contrato de recurso
### [ ] DELIV-PKG-013 — Definir requisitos no funcionales aplicables
### [ ] DELIV-PKG-014 — Enumerar archivos exactos que se crearán, modificarán o retirarán
### [ ] DELIV-PKG-015 — Definir dependencias, bloqueos y orden de aplicación
### [ ] DELIV-PKG-016 — Vincular requisitos `TREQ-*` y definir pruebas unitarias, contractuales, de integración, seguridad y E2E
### [ ] DELIV-PKG-017 — Definir observabilidad, métricas, logs, alertas y auditoría
### [ ] DELIV-PKG-018 — Definir feature flags, configuración y activación progresiva
### [ ] DELIV-PKG-019 — Definir estrategia de despliegue y rollout
### [ ] DELIV-PKG-020 — Definir rollback técnico, funcional y de datos
### [ ] DELIV-PKG-021 — Definir documentación, procedimiento y capacitación
### [ ] DELIV-PKG-022 — Definir alcance, actores, datos y duración del piloto
### [ ] DELIV-PKG-023 — Definir criterios de aceptación y evidencia de cierre
### [ ] DELIV-PKG-024 — Vincular el paquete con el registro canónico de brechas
### [ ] DELIV-PKG-025 — Aprobar el paquete antes de iniciar implementación física

### Package reservado

```text
VISO-SCHEDULE-MONTHLY-001
status = RESERVED_NOT_APPROVED
process = VPROC-0007
repos = vento-viso, vento-shell
```

Entrada: `CODE-AUD-021`, `AUTH-UI-061`, `VISO-SCH-001..008`, UX/autorización/servidor aplicables, E3 y `04A`.

Archivos iniciales: seis archivos VISO del delta y la migración. `DELIV-PKG-014` fija inventario final.

Bloqueos: límite/excepciones, migración, pruebas, seguridad por acción, concurrencia y commit final.
