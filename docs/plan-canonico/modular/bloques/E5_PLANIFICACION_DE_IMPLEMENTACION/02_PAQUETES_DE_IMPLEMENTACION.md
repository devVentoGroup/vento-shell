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

| Campo                     | Semántica canónica            | Regla                                             |
| ------------------------- | ----------------------------- | ------------------------------------------------- |
| `package_id`              | identidad permanente          | inmutable mientras represente el mismo expediente |
| `package_revision`        | revisión del expediente       | monotónica dentro del mismo `package_id`          |
| `package_status`          | estado documental u operativo | separado de identidad                             |
| `package_title`           | nombre humano                 | modificable sin renumeración                      |
| `implementation_unit_id`  | unidad física ejecutable      | se materializa después de definir repositorio, despliegue y rollback |
| `derived_from_package_id` | linaje por división           | solo con decisión explícita                       |
| `merged_from_package_ids` | linaje por fusión             | solo con decisión explícita                       |
| `supersedes_package_id`   | linaje por sustitución        | solo con decisión explícita                       |

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

| `package_id` | `process_id` | Brecha fuente confirmada | `gap_id` estable E1 | `capability_id` | Decisión E2 |
| --- | --- | --- | --- | --- | --- |
| `GAP-PKG-094` | `VPROC-0001` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-01.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0003` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-01.05` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0004` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-01.08` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0009` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-02.08` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0012` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-03.01` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0013` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-03.04` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0014` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-03.06` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0018` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-04.09` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0020` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-05.04` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0027` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-06.14` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0029` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-07.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0030` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-07.07` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0031` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-07.12` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0033` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-08.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0035` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-08.12` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0037` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-08.13` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0041` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-09.14` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0047` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-10.08` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0048` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-11.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0055` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-13.07` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0058` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-15.06` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-094` | `VPROC-0062` | `H-CAP-COVER-002-008` | `H-CAP-COVER-002-008` | `CAP-18.05` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-097` | `VPROC-0065` | `H-CAP-COVER-011-008` | `H-CAP-COVER-011-008` | `CAP-02.10` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-107` | `VPROC-0032` | `H-CAP-SCOPE-007-007` | `H-CAP-SCOPE-007-007` | `CAP-07.03` | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-107` | `VPROC-0067` | `H-CAP-SCOPE-008-012` | `H-CAP-SCOPE-008-012` | `CAP-07.11` | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-108` | `VPROC-0032` | `H-CAP-SCOPE-007-006` | `H-CAP-SCOPE-007-006` | `CAP-07.03` | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-147` | `VPROC-0056` | `H-CAP-SCOPE-014-006` | `H-CAP-SCOPE-014-006` | `CAP-14.03` | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-147` | `VPROC-0057` | `H-CAP-SCOPE-014-006` | `H-CAP-SCOPE-014-006` | `CAP-14.07` | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-167` | `VPROC-0001` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-01.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0003` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-01.05` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0004` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-01.08` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0009` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-02.08` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0012` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-03.01` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0013` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-03.04` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0014` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-03.06` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0018` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-04.09` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0020` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-05.04` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0027` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-06.14` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0029` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-07.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0030` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-07.07` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0031` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-07.12` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0033` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-08.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0035` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-08.12` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0037` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-08.13` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0041` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-09.14` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0047` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-10.08` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0048` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-11.02` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0055` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-13.07` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0058` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-15.06` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-167` | `VPROC-0062` | `H-CAP-COVER-003-007` | `H-CAP-COVER-003-007` | `CAP-18.05` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-174` | `VPROC-0065` | `H-CAP-SCOPE-002-010` | `H-CAP-SCOPE-002-010` | `CAP-02.10` | `LINKED_TO_EXISTING_GAP` |
| `GAP-PKG-192` | `VPROC-0056` | `H-CODE-019-005` | `H-CODE-019-005` | `CAP-14.03` | `EXISTING_GAP_SCOPE_EXTENDED` |
| `GAP-PKG-192` | `VPROC-0057` | `H-CODE-019-005` | `H-CODE-019-005` | `CAP-14.07` | `EXISTING_GAP_SCOPE_EXTENDED` |

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
| paquetes históricos con proceso confirmado                  |               **8** |
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


### [ ] DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios
### [ ] DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable
### [ ] DELIV-PKG-005 — Definir alcance incluido, excluido y diferido
### [ ] DELIV-PKG-006 — Definir pantallas, componentes y navegación que se crearán o modificarán
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
