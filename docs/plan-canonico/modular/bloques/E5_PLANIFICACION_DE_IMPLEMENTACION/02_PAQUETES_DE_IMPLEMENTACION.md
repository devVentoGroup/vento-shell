### PAQUETES DE IMPLEMENTACIÓN

### ✅ DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage`
**Tarea siguiente:** `DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id`
**Tipo de tarea:** documental — definición normativa y materialización de identidad de paquetes de implementación
**Repositorio propietario:** `vento-shell`

---

#### 1. Resultado canónico

Todo paquete de implementación de Vento OS deberá poseer exactamente un
`package_id` estable antes de continuar con las restantes definiciones de
`DELIV-PKG-*`.

El `package_id` es la identidad permanente del paquete. No representa su
estado, versión documental, aprobación, prioridad, ambiente, despliegue,
commit, release ni ejecución.

La identidad se utiliza como clave de correlación para mantener unido el mismo
paquete a través de su definición E5, sus instancias de readiness, cutover,
hypercare, puerta de entrada a implementación, ejecución física, migraciones
aplicables, pruebas y evidencia de cierre.

Una modificación posterior de metadatos del paquete no podrá cambiar su
`package_id`. Cuando el trabajo deje de representar el mismo paquete y se cree
una intención de implementación diferente, se asignará una identidad nueva y
se conservará la relación con la identidad anterior.

---

#### 2. Gramática obligatoria de `package_id`

La forma canónica será:

```text
<ALCANCE-ESTABLE>-<PROPOSITO-ESTABLE>-<SECUENCIA>
```

con las siguientes reglas:

1. el identificador completo utiliza únicamente caracteres ASCII en mayúscula,
   números y guiones;
2. comienza con una letra;
3. contiene como mínimo dos segmentos semánticos antes de la secuencia;
4. cada segmento semántico comienza con una letra o número y no contiene
   espacios, guion bajo, barra, punto ni caracteres acentuados;
5. la secuencia es numérica, utiliza como mínimo tres dígitos y permanece al
   final del identificador;
6. el identificador completo debe ser único dentro del registro de paquetes;
7. una secuencia asignada no se recicla después de cancelación, retiro,
   sustitución, división o fusión del paquete;
8. la forma legible del nombre o título del paquete puede evolucionar sin
   modificar la identidad estable.

Expresión estructural de referencia:

```text
^[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-[0-9]{3,}$
```

Ejemplos ya respaldados por fuentes canónicas:

```text
VISO-SCHEDULE-MONTHLY-001
NEXO-REMISSIONS-001
```

La existencia sintáctica de una cadena válida no basta para convertirla en un
`package_id`. Debe existir una asignación explícita de identidad de paquete.

---

#### 3. Semántica de los segmentos

##### 3.1. Alcance estable

El primer segmento identifica el ámbito estable que permite reconocer el
paquete sin depender de detalles de implementación volátiles. Puede
corresponder a una aplicación o a un ámbito transversal cuando ese sea el
propietario lógico del paquete.

No concede propiedad técnica ni funcional por sí mismo. La propiedad formal se
establece en `DELIV-PKG-003`.

##### 3.2. Propósito estable

Los segmentos intermedios describen el propósito durable del paquete con la
precisión suficiente para distinguirlo de otros paquetes del mismo ámbito.

No deberán codificar información que cambie durante el ciclo normal del
paquete, incluyendo:

- estado de aprobación;
- prioridad coyuntural;
- ambiente;
- sprint;
- fecha de despliegue;
- rama;
- commit;
- versión de aplicación;
- release;
- nombre de una persona responsable.

Una expresión como `MONTHLY` es válida cuando forma parte permanente del
alcance funcional del paquete y no representa una fecha de ejecución.

##### 3.3. Secuencia

La secuencia diferencia identidades dentro de un mismo propósito. Su función es
exclusivamente identitaria.

La secuencia:

- no expresa prioridad;
- no expresa orden de despliegue;
- no expresa estado;
- no obliga a que los paquetes se implementen en orden numérico;
- no se renumera para cerrar huecos;
- no se reutiliza.

---

#### 4. Identidad, revisión y estado son conceptos distintos

Cada expediente de paquete deberá distinguir, como mínimo:

| Campo              | Significado                                          | Regla                                          |
| ------------------ | ---------------------------------------------------- | ---------------------------------------------- |
| `package_id`       | identidad permanente del paquete                     | inmutable durante toda la vida de la identidad |
| `package_revision` | revisión documental del expediente del mismo paquete | entero monotónico iniciado en `1`              |
| `package_status`   | estado documental u operativo vigente                | no forma parte del identificador               |
| `package_title`    | nombre humano legible                                | puede cambiar sin renumerar la identidad       |

La revisión cambia cuando una modificación aprobada altera el contenido del
expediente manteniendo la misma intención de implementación. El estado cambia
según el ciclo gobernado por E5 y las tareas posteriores. Ninguno de los dos
cambios produce por sí mismo un nuevo `package_id`.

---

#### 5. Regla de estabilidad

Se conserva el mismo `package_id` cuando continúe existiendo una sola intención
de implementación reconocible y la evolución corresponda a revisión del mismo
paquete.

Esto incluye cambios documentales posteriores sobre:

- vínculos con capacidades, procesos o brechas;
- repositorios y dominios propietarios;
- alcance incluido o excluido;
- archivos previstos;
- dependencias;
- pruebas;
- observabilidad;
- configuración;
- rollout;
- rollback;
- capacitación;
- piloto;
- criterios de cierre.

Esos elementos son definidos por las tareas posteriores de `DELIV-PKG-*` y no
forman parte de la identidad primaria.

Se crea un nuevo `package_id` cuando se materializa una intención de
implementación distinta que deba poder aprobarse, implementarse, suspenderse,
revertirse y cerrarse independientemente.

---

#### 6. División, fusión, sustitución y retiro

La identidad histórica nunca se sobrescribe.

##### 6.1. División

Si un paquete se divide en dos o más paquetes independientes:

- el identificador original se conserva como antecedente histórico;
- cada paquete resultante recibe un `package_id` nuevo;
- cada identidad nueva declara `derived_from_package_id` con el identificador
  de origen;
- ninguna identidad resultante reutiliza el identificador original.

##### 6.2. Fusión

Si dos o más paquetes pasan a constituir una única intención de implementación:

- las identidades de origen permanecen históricas;
- el paquete consolidado recibe un `package_id` nuevo;
- el nuevo expediente declara `merged_from_package_ids` con todas las
  identidades de origen;
- la fusión no convierte una de las identidades previas en alias silencioso de
  las demás.

##### 6.3. Sustitución

Un paquete sustituido conserva su identidad y su historia. El paquete sucesor
recibe una identidad nueva y declara `supersedes_package_id`.

##### 6.4. Retiro

Un paquete retirado conserva su `package_id`. Su identificador queda fuera de
reutilización permanente.

---

#### 7. Relación con otras identidades canónicas

`package_id` no sustituye ni redefine:

- `task_id`;
- `capability_id`;
- `process_id`;
- `gap_id`;
- identificadores de aplicaciones;
- identificadores de contratos;
- identificadores de requisitos de prueba;
- identificadores de migraciones;
- identificadores de releases;
- identificadores de commits;
- identificadores de ambientes;
- identificadores de carriles de ejecución.

La igualdad textual entre valores pertenecientes a espacios de identidad
distintos no autoriza inferir que representan el mismo objeto.

Cuando una identidad utilizada previamente por otro espacio de nombres deba
ser también identidad de paquete, esa condición deberá quedar registrada de
forma explícita como asignación del `package_id`; nunca se deducirá por
coincidencia textual.

---

#### 8. Instancias por paquete

Las tareas que el protocolo ejecuta por paquete utilizarán la forma:

```text
<task_id>::<package_id>
```

La parte izquierda mantiene la identidad canónica de la tarea y la parte
derecha identifica el paquete exacto al que corresponde la instancia.

Reglas:

1. una instancia no crea una tarea canónica nueva;
2. cambiar el `package_id` cambia la instancia y no la tarea global;
3. dos paquetes distintos no comparten una misma instancia;
4. una aprobación de instancia no aprueba otro `package_id`;
5. todas las instancias del ciclo de un mismo paquete deberán conservar el
   mismo `package_id`;
6. una tarea global no se considera parcialmente aprobada porque exista una
   instancia aprobada para un paquete.

Esta identidad deberá permanecer constante en las instancias de entrada a
implementación y en las etapas posteriores que el protocolo ejecuta por
paquete.

---

#### 9. Registro materializado de identidades actuales

La revisión de las fuentes vigentes de E5 produce el siguiente inventario de
identidades de paquete ya existentes:

| `package_id`                | Clasificación     | Estado documental vigente | Decisión de identidad                          |
| --------------------------- | ----------------- | ------------------------- | ---------------------------------------------- |
| `VISO-SCHEDULE-MONTHLY-001` | paquete reservado | `RESERVED_NOT_APPROVED`   | SE CONSERVA COMO IDENTIDAD ESTABLE DEL PAQUETE |

**Balance del inventario actual:** 1 identidad de paquete materializada; 1
única; 0 duplicadas; 0 renumeradas; 0 retiradas.

`VISO-SCHEDULE-MONTHLY-001` conserva exactamente su identificador preexistente.
Esta tarea no modifica su alcance, proceso, repositorios, estado de aprobación
ni bloqueos; solo fija que esa cadena es su `package_id` estable para el ciclo
E5 y las instancias posteriores que correspondan.

---

#### 10. Reconciliación de `NEXO-REMISSIONS-001`

`NEXO-REMISSIONS-001` permanece registrado como identificador histórico de un
carril suspendido. La fuente histórica vigente declara expresamente que aquel
registro no creó un `package_id` y no habilitó `DELIV-PKG-*` para Remisiones.

Por tanto, el resultado de esta tarea es:

```text
NEXO-REMISSIONS-001
clasificación actual = IDENTIFICADOR_DE_CARRIL_HISTORICO
package_id actual = NO ASIGNADO
```

No se crea un paquete de Remisiones por inferencia y no se convierte el carril
histórico en paquete activo.

Si posteriormente se materializa un paquete de Remisiones, su identidad deberá
quedar asignada explícitamente conforme a este contrato antes de utilizarse en
instancias `::<package_id>`.

---

#### 11. Reglas de unicidad y no inferencia

Antes de aceptar una nueva identidad de paquete deberá comprobarse:

1. que el identificador cumple la gramática de esta tarea;
2. que no existe otro paquete con el mismo `package_id`;
3. que el identificador no fue retirado previamente;
4. que no se intenta renumerar un paquete existente;
5. que una coincidencia con otro espacio de identidad está declarada y no fue
   inferida;
6. que el identificador representa una sola intención de implementación;
7. que el mismo paquete no posee dos `package_id` activos;
8. que la secuencia elegida no reutiliza una identidad histórica.

Un identificador no podrá cambiar únicamente porque cambie el orden de
prioridad, la aplicación de una dependencia, el estado documental, la revisión
o el ambiente de despliegue.

---

#### 12. Campos mínimos de identidad que deberán acompañar al expediente

A partir de esta tarea, todo expediente de paquete deberá conservar estos
campos identitarios aun cuando las tareas posteriores todavía no hayan
materializado el resto del contenido:

| Campo                     | Obligación                            |
| ------------------------- | ------------------------------------- |
| `package_id`              | obligatorio y estable                 |
| `package_revision`        | obligatorio; inicia en `1`            |
| `package_status`          | obligatorio; separado de la identidad |
| `package_title`           | obligatorio; legible y no identitario |
| `derived_from_package_id` | únicamente cuando exista división     |
| `merged_from_package_ids` | únicamente cuando exista fusión       |
| `supersedes_package_id`   | únicamente cuando exista sustitución  |

Los campos de linaje son mutuamente interpretables con la historia real del
paquete y no se rellenan con valores ficticios cuando no aplican.

Para `VISO-SCHEDULE-MONTHLY-001` en el estado actual:

```text
package_id = VISO-SCHEDULE-MONTHLY-001
package_revision = 1
package_status = RESERVED_NOT_APPROVED
package_title = Programación mensual VISO
derived_from_package_id = NO_APLICA
merged_from_package_ids = NO_APLICA
supersedes_package_id = NO_APLICA
```

---

#### 13. Fronteras de esta tarea

Esta tarea define exclusivamente identidad estable y linaje identitario.

No decide todavía:

- vínculos formales con capacidades, procesos y brechas, responsabilidad de
  `DELIV-PKG-002`;
- aplicación, dominio y repositorio propietarios, responsabilidad de
  `DELIV-PKG-003`;
- AS-IS y resultado TO-BE, responsabilidad de `DELIV-PKG-004`;
- alcance incluido, excluido y diferido, responsabilidad de `DELIV-PKG-005`;
- inventario final de archivos, responsabilidad de `DELIV-PKG-014`;
- requisitos de prueba que implementará cada paquete, responsabilidad de
  `DELIV-PKG-016`;
- aprobación del paquete para implementación física, responsabilidad de
  `DELIV-PKG-025`;
- entrada a implementación física, responsabilidad de `E5-GATE-008`.

Estas fronteras no dejan decisiones identitarias abiertas: la identidad actual
queda resuelta por esta tarea y las materias enumeradas conservan sus tareas
propietarias exactas.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea formaliza identidad y trazabilidad documental de
los paquetes E5 sin crear ni modificar comportamiento ejecutable, reglas de
negocio, autorización, datos, integración, migraciones, efectos físicos ni
contratos runtime. Los requisitos de prueba ya registrados para los paquetes y
sus futuros componentes conservan sus identidades y estados sin modificación.

---

#### 14. Criterios de aceptación

1. Todo paquete que continúe en E5 posee exactamente un `package_id` explícito
   antes de usar instancias por paquete.
2. La gramática admite la identidad preexistente
   `VISO-SCHEDULE-MONTHLY-001` sin renombrarla.
3. `package_id`, revisión, estado y título permanecen separados.
4. Cambiar estado, prioridad, ambiente, commit, release o revisión no cambia el
   identificador.
5. Las secuencias no se renumeran ni se reutilizan.
6. División, fusión, sustitución y retiro preservan la historia de identidades.
7. Las instancias `task_id::package_id` conservan la tarea global y aíslan el
   paquete exacto.
8. Ninguna instancia de un paquete concede aprobación a otro.
9. `VISO-SCHEDULE-MONTHLY-001` queda registrado como la única identidad de
   paquete preexistente materializada en E5 al corte de esta tarea.
10. `NEXO-REMISSIONS-001` no se trata como `package_id` vigente ni se reactiva
    por inferencia.
11. La tarea no adelanta decisiones reservadas a `DELIV-PKG-002` a
    `DELIV-PKG-025`.
12. La tarea no ejecuta código, migraciones, cambios de datos, despliegues ni
    modificaciones remotas.
13. La tarea genera cero cambios en requisitos de prueba.
14. La continuidad queda reservada exclusivamente hacia `DELIV-PKG-002`.

---

#### 15. Continuidad

ÚLTIMA TAREA APROBADA
`EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage`

TAREA ACTUAL APROBADA
`DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación`

SIGUIENTE TAREA RESERVADA
`DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id`


### [ ] DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id
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
