### MINI-BLOQUE — AUTORIZACIÓN Y ACCESO PRIVILEGIADO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **autorización y acceso privilegiado** dentro de **Z TECNOLOGÍA Y SOPORTE**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `TI-AUTH-001` a `TI-AUTH-004` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `TI-AUTH-001`: Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos
- `TI-AUTH-002`: Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal
- `TI-AUTH-003`: Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo
- `TI-AUTH-004`: Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte
<!-- PLAN-SECTION-META:END -->

### ✅ TI-AUTH-001 — Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos

**Estado:** APROBADA  
**Tarea anterior:** `TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos` — APROBADA  
**Tarea siguiente:** `TI-AUTH-002 — Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal` — RESERVADA  
**Tipo de tarea:** documental; definición normativa y materializada de responsabilidades tecnológicas, segregación de funciones, acumulaciones permitidas y prohibidas y autoridades de decisión para el ciclo de soporte, acceso y cambio tecnológico  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/02_AUTORIZACION_Y_ACCESO_PRIVILEGIADO.md`  
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, cuentas, permisos, sesiones, dispositivos, redes, impresoras, aplicaciones, proveedores, secretos ni configuración de Supabase  
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar quién puede participar en las seis funciones de esta tarea —solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar—, cuándo una misma persona puede acumular funciones en trabajo ordinario, cuándo la separación es obligatoria y qué autoridad conserva cada decisión sin convertir cargos, niveles de atención, proveedores, dispositivos o credenciales en autorización empresarial.

---

#### 1. Resultado sustantivo

`TI-AUTH-001` fija el modelo de responsabilidades y segregación para tecnología y soporte con las siguientes decisiones:

1. `RESPONSABLE_TECNOLOGICO` se conserva como responsabilidad canónica del modelo operativo y **no se crea como rol base nuevo**.
2. Los roles base aplicables a `VPROC-0058` pueden ser sujetos o reportantes; esa aplicabilidad no concede soporte privilegiado, administración transversal, acceso sensible ni ejecución técnica.
3. Los roles operativos aplicables a `VPROC-0058` pueden reportar, aportar evidencia o confirmar recuperación desde su contexto autorizado; el rol operativo no concede administración de cuentas, soporte privilegiado ni acceso a logs sensibles.
4. `RESPONSABLE_TECNOLOGICO` coordina y ejecuta trabajo técnico ordinario dentro de permiso, alcance, recurso, estado y contexto válidos; no obtiene autoridad por el nombre de la responsabilidad ni por poseer credenciales.
5. El flujo ordinario no incorpora una aprobación artificial. Una misma persona puede solicitar y ejecutar una acción ordinaria cuando el permiso lo permite y no existe una decisión reservada.
6. La separación se vuelve obligatoria para prioridad crítica cuando implique decisión protegida, cambio sensible o de alto impacto, cierre de incidente mayor, aceptación de riesgo y decisiones sensibles del ciclo de acceso tecnológico.
7. Quien ejecuta una acción crítica o sensible no puede emitir por sí solo la aprobación final ni ser el único validador de la evidencia que demuestra su propia corrección.
8. Un proveedor o técnico externo puede ejecutar trabajo delimitado y devolver evidencia, pero nunca se convierte en propietario del caso, aprobador empresarial, autoridad de acceso ni responsable final del cierre.
9. Alertas, automatizaciones, servicios del sistema y dispositivos compartidos pueden originar o transportar señales, pero no sustituyen al actor humano, supervisor o aprobador cuando la decisión exige autoridad humana.
10. Se materializa la segregación pendiente `H-TI-DOM-009-004` para solicitar, aprobar, ejecutar, validar y cerrar cambios tecnológicos antes de operación real.
11. La asignación nominal de titular y suplente de `RESPONSABLE_TECNOLOGICO` queda gobernada por un contrato de elegibilidad y readiness; no se inventan personas en ausencia de evidencia vigente.
12. Las protecciones específicas de privilegio, configuración protegida y datos técnicos sensibles permanecen reservadas a `TI-AUTH-002`, `TI-AUTH-003` y `TI-AUTH-004`, respectivamente.

---

#### 2. Entradas canónicas conservadas

La tarea consume sin redefinir:

- `VPROC-0058 — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento`;
- `VPROC-0059 — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación`;
- las decisiones de `PROC-ACTOR-001`, `PROC-ACTOR-002` y `PROC-ACTOR-003` sobre aplicabilidad, iniciador, ejecutor, supervisor, aprobador y segregación;
- `TI-DOM-001`, incluidos `TI-SERVICE-001` a `TI-SERVICE-011` y `TI-ATTN-001` a `TI-ATTN-004`;
- `TI-DOM-007` para prioridad, SLA, escalamiento, validación y cierre del caso tecnológico;
- `TI-DOM-009` para clases, riesgo, aprobación, ventana, ejecución, rollback, validación y revisión posterior del cambio;
- el modelo canónico de identidad, actor efectivo, rol base, rol operativo, permisos, alcance, contexto, denegaciones y auditoría;
- el gobierno de readiness de `READY-GATE-003`, `READY-GATE-004` y `READY-GATE-010` para la futura evidencia de configuración y responsables antes del piloto.

No se crean roles paralelos, procesos paralelos, listas locales de cargos autorizados ni un segundo modelo de permisos para TI.

---

#### 3. Responsabilidad tecnológica frente a rol, identidad y privilegio

Se fija la separación:

```text
RESPONSABLE_TECNOLOGICO
≠ ROL BASE
≠ ROL OPERATIVO
≠ IDENTIDAD
≠ PERMISO
≠ SESION PRIVILEGIADA
≠ PROVEEDOR
```

`RESPONSABLE_TECNOLOGICO` identifica una responsabilidad organizacional dentro de procesos y servicios tecnológicos. La persona que la ejerza deberá seguir resolviéndose como actor humano activo y autorizado mediante el modelo general de identidad y permisos.

Ninguna de estas afirmaciones será válida:

```text
ser gerente = administrar TI
ser propietario = omitir autorización técnica
ser supervisor = leer logs sensibles
ser responsable tecnológico = tener privilegio permanente
ser proveedor = aprobar el cambio
poseer una cuenta administrativa = estar autorizado empresarialmente
```

La autoridad efectiva se resuelve acción por acción; no se deriva de jerarquía, nombre del cargo, nivel de atención, aplicación visible o posesión técnica de una credencial.

---

#### 4. Participación autorizable en `VPROC-0058`

##### 4.1. Roles base

Los ocho roles base declarados como aplicables al proceso son:

- `propietario`;
- `gerente_general`;
- `gerente`;
- `supervisor`;
- `auxiliar_administrativa`;
- `contador`;
- `marketing`;
- `trabajador_operativo`.

Su aplicabilidad permite actuar como sujeto o reportante cuando corresponda. No concede por sí sola diagnóstico privilegiado, administración tecnológica, cambio de configuración, acceso a cuentas, lectura de evidencia sensible ni cierre de alto impacto.

##### 4.2. Roles operativos

Los roles operativos declarados como aplicables a `VPROC-0058` son:

- `cajero_satelite`;
- `barista_satelite`;
- `cocinero_satelite`;
- `servicio_salon`;
- `mostrador_satelite`;
- `operador_integral_satelite`;
- `produccion_cocina`;
- `produccion_panaderia`;
- `produccion_reposteria`;
- `bodeguero`;
- `conductor_logistica`;
- `gerencia_operativa`.

Podrán reportar, aportar evidencia o confirmar recuperación desde la estación, sede, área, turno o recurso que realmente les corresponda. El rol operativo no habilita soporte privilegiado, administración de cuentas, configuración transversal ni acceso a logs sensibles.

##### 4.3. Funciones canónicas de proceso

| Función canónica                                       | Responsabilidad en tecnología                                                                                                                       | Límite obligatorio                                                                                                        |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `TRABAJADOR`                                           | Iniciador primario de solicitud o incidente; aporta descripción, contexto, evidencia y confirmación de recuperación dentro de su alcance.           | Reportar no concede ejecución, aprobación, privilegio ni acceso sensible.                                                 |
| `RESPONSABLE_TECNOLOGICO`                              | Ejecuta coordinación técnica, clasificación, diagnóstico, restauración, administración ordinaria autorizada, preparación de cambios y trazabilidad. | No se autoaprueba privilegio, no sustituye al propietario del proceso y no cierra por sí solo decisiones de alto impacto. |
| `RESPONSABLE_DEL_PROCESO`                              | Aporta contexto empresarial y valida que la recuperación restituya el resultado protegido.                                                          | No recibe privilegios técnicos por ser propietario funcional.                                                             |
| `GERENCIA_O_SUPERVISION_DE_SEDE`                       | Aporta contexto territorial, afectación operativa y coordinación local.                                                                             | No amplía autoridad tecnológica ni convierte una sede asignada en alcance global.                                         |
| `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`                 | Participa cuando diagnóstico, acceso, configuración, evidencia o incidente afectan seguridad.                                                       | No obtiene acceso ilimitado ni sustituye las aprobaciones requeridas.                                                     |
| `COORDINACION_DE_OPERACIONES`                          | Conserva control o aceptación en prioridad crítica, cambio sensible, cierre de incidente mayor o aceptación de riesgo cuando corresponda.           | No transforma todo caso ordinario en flujo de aprobación.                                                                 |
| `GERENCIA_GENERAL` o autoridad de seguridad competente | Conserva la aprobación obligatoria aplicable a concesión, modificación, privilegio, suspensión o revocación de acceso sensible en `VPROC-0059`.     | No sustituye ejecución técnica ni elimina la separación entre solicitante, administrador y aprobador.                     |
| `TECNICO_O_PRESTADOR_EXTERNO` / `PROVEEDOR`            | Ejecuta trabajo especializado o contractual dentro del alcance concedido y devuelve evidencia técnica.                                              | No es propietario del caso, aprobador de acceso, autoridad empresarial ni responsable final de cierre.                    |

---

#### 5. Regla de autorización para una acción tecnológica

Una función de proceso nunca basta por sí sola. Para una acción humana protegida deberá resolverse, como mínimo:

```text
IDENTIDAD HUMANA ACTIVA
+
ACTOR EFECTIVO VIGENTE
+
ROL BASE VIGENTE
+
ROL OPERATIVO EFECTIVO CUANDO APLIQUE
+
PERMISO EXACTO VIGENTE
+
ALCANCE TERRITORIAL Y DE RECURSO COMPATIBLE
+
ESTADO Y TRANSICION PERMITIDOS
+
SEGREGACION Y UMBRAL APLICABLES
+
SIN DENEGACION PREVALENTE
=
ACCION TECNOLOGICA AUTORIZABLE
```

La autorización final permanece bajo el evaluador canónico. Una interfaz visible, un cargo, un nivel `L0` a `L3`, una cuenta técnica, un dispositivo, una simulación o un grant aislado no podrán sustituir esa decisión.

---

#### 6. Matriz canónica de las seis funciones

| Función                  | Quién puede originarla o conducirla                                                                                                                                                                                                                                                                              | Cuándo puede avanzar sin aprobador separado                                                                                                                                             | Cuándo exige separación                                                                                                                                                                                        | Prohibición principal                                                                                                                         |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| **Solicitar / reportar** | `TRABAJADOR` como iniciador primario; alternos ya aprobados: `UMBRAL_O_ALERTA`, `RESPONSABLE_TECNOLOGICO` y `GERENCIA_O_SUPERVISION_DE_SEDE`.                                                                                                                                                                    | En toda solicitud o incidente ordinario puede registrarse sin aprobación previa.                                                                                                        | Si la solicitud deriva en acceso sensible, cambio protegido, aceptación de riesgo o cierre de alto impacto, la decisión posterior usa su autoridad propia.                                                     | Ser solicitante no concede ejecución, prioridad final, privilegio ni autoaprobación.                                                          |
| **Diagnosticar**         | Principalmente `RESPONSABLE_TECNOLOGICO`, con apoyo de `RESPONSABLE_DEL_PROCESO`, `GERENCIA_O_SUPERVISION_DE_SEDE` y `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA` cuando corresponda.                                                                                                                                  | Diagnóstico no invasivo y comprobaciones ordinarias pueden ejecutarse dentro del permiso y alcance vigentes.                                                                            | Acceso privilegiado, soporte remoto elevado, secretos, capturas, exportaciones o logs sensibles activan controles adicionales de las tareas propietarias.                                                      | Diagnosticar no autoriza modificar configuración ni ampliar la lectura sensible.                                                              |
| **Administrar**          | `RESPONSABLE_TECNOLOGICO` o actor técnico explícitamente autorizado para el servicio y recurso concretos.                                                                                                                                                                                                        | Acciones estándar, preautorizadas, reversibles y de bajo riesgo pueden ejecutarse dentro del procedimiento vigente.                                                                     | Administración de acceso, cuentas, configuración protegida o datos técnicos sensibles aplica la separación y controles específicos correspondientes.                                                           | La posesión de credenciales o acceso técnico no concede autoridad empresarial ni administración transversal.                                  |
| **Aprobar**              | La autoridad exacta depende del objeto y umbral: `COORDINACION_DE_OPERACIONES` o autoridad tecnológica competente en decisiones condicionadas de `VPROC-0058`; `GERENCIA_GENERAL` o autoridad de seguridad competente en decisiones sensibles de `VPROC-0059`.                                                   | No existe aprobador separado para el flujo ordinario cuando ninguna regla reserva una decisión.                                                                                         | Prioridad crítica con decisión protegida, cambio sensible o de alto impacto, cierre de incidente mayor, aceptación de riesgo y acceso sensible requieren la autoridad separada aplicable.                      | Solicitante o ejecutor no pueden convertirse en aprobadores finales de su propia decisión crítica por acumulación informal.                   |
| **Cambiar**              | `RESPONSABLE_TECNOLOGICO` prepara o coordina; el ejecutor puede ser personal técnico autorizado o proveedor delimitado. Las autoridades conservan la matriz de `TI-DOM-009`.                                                                                                                                     | Un `STANDARD / LOW` puede ejecutarse bajo procedimiento y preautorización vigentes; un `NORMAL / LOW` puede usar la autoridad técnica ya definida cuando no exista conflicto reservado. | `NORMAL / HIGH`, `NORMAL / CRITICAL`, cambios sensibles y emergencias críticas requieren control adicional; quien ejecuta no puede ser la única autoridad final ni el único validador de su propia corrección. | Aprobación de cambio no concede acceso privilegiado, no convierte al proveedor en aprobador y no permite ejecutar fuera de alcance o ventana. |
| **Cerrar**               | En trabajo ordinario, el responsable técnico puede completar el cierre una vez exista restauración o cumplimiento validable, evidencia suficiente y pendientes transferidos. `RESPONSABLE_DEL_PROCESO` valida el resultado empresarial cuando aplica; el trabajador puede confirmar recuperación en su contexto. | Solicitud o incidente ordinario sin decisión reservada puede cerrarse sin firma adicional después de la validación exigida.                                                             | Cierre de incidente mayor, cierre de alto impacto, aceptación de riesgo o cierre de cambio sensible requiere autoridad separada conforme al caso.                                                              | `resolved`, silencio del usuario o validación del proveedor no equivalen por sí solos a cierre aceptado.                                      |

---

#### 7. Segregación por clase de trabajo

##### 7.1. Trabajo ordinario de soporte

Se permite acumulación funcional cuando todas las condiciones son ordinarias y autorizadas. Una misma persona puede:

- recibir una solicitud;
- clasificarla;
- realizar diagnóstico no privilegiado;
- ejecutar una acción preautorizada de bajo riesgo;
- documentar la solución;
- completar el cierre después de la validación aplicable.

No se exige una segunda persona únicamente para aparentar control. La segregación se activa por riesgo, sensibilidad, objeto protegido o umbral, no por el simple número de pasos.

##### 7.2. Prioridad crítica e incidente mayor

`RESPONSABLE_TECNOLOGICO` puede diagnosticar, coordinar y restaurar. Cuando exista cierre de incidente mayor, aceptación de riesgo o decisión protegida de prioridad crítica, `COORDINACION_DE_OPERACIONES` o la autoridad tecnológica competente deberá conservar la decisión separada aplicable.

El técnico que ejecutó la intervención no puede declarar unilateralmente que su propia acción resolvió una decisión de alto impacto cuando el proceso exige control o aceptación separados.

##### 7.3. Acceso tecnológico sensible

Para concesión, modificación, privilegio, suspensión o revocación sensible de `VPROC-0059` se conserva separación entre:

1. solicitante o iniciador;
2. administrador técnico que ejecuta;
3. aprobador competente.

La aprobación corresponde a `GERENCIA_GENERAL` o a la autoridad de seguridad competente según el objeto. El detalle de privilegio temporal, cuenta técnica, proveedor y soporte remoto pertenece a `TI-AUTH-002`.

##### 7.4. Cambio tecnológico

Las clases y autoridades aprobadas por `TI-DOM-009` se conservan:

| Clase / riesgo      | Autoridad mínima conservada                                                                                                        | Regla de segregación de esta tarea                                                                                                                                       |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `STANDARD / LOW`    | Preautorización vigente del procedimiento bajo `RESPONSABLE_TECNOLOGICO`.                                                          | La ejecución no necesita una nueva firma si coincide exactamente con procedimiento, alcance, guardas, prueba y rollback aprobados. Una desviación obliga a reclasificar. |
| `NORMAL / LOW`      | `RESPONSABLE_TECNOLOGICO`.                                                                                                         | Puede acumular evaluación y aprobación técnica cuando no ejecuta una decisión reservada ni existe sensibilidad adicional.                                                |
| `NORMAL / MEDIUM`   | `RESPONSABLE_TECNOLOGICO`; participa `RESPONSABLE_DEL_PROCESO` cuando existe efecto empresarial.                                   | La validación empresarial no puede ser sustituida por el ejecutor técnico. Si el cambio es sensible, aplica separación adicional.                                        |
| `NORMAL / HIGH`     | `RESPONSABLE_TECNOLOGICO` + autoridad funcional aplicable; participa `COORDINACION_DE_OPERACIONES` y seguridad cuando corresponda. | El ejecutor no puede ser la única autoridad final ni el único validador.                                                                                                 |
| `NORMAL / CRITICAL` | `RESPONSABLE_TECNOLOGICO` + `COORDINACION_DE_OPERACIONES` + autoridad funcional aplicable; seguridad cuando corresponda.           | Aprobación final, ejecución y validación de eficacia no pueden quedar concentradas en una sola persona.                                                                  |
| `EMERGENCY`         | Autoridad técnica y de control aplicable; `COORDINACION_DE_OPERACIONES` se conserva en cambios críticos o sensibles.               | La urgencia reduce tiempo de decisión, no elimina separación, identidad, evidencia, rollback, validación ni revisión posterior.                                          |

Un rollback previsto dentro de un cambio aprobado puede ser ejecutado por el actor técnico asignado. Una desviación material de alcance, riesgo, ventana, estado anterior o dependencia invalida la aprobación anterior y exige nueva evaluación.

##### 7.5. Proveedor o fabricante

`TI-ATTN-004 — L3_PROVEEDOR_O_FABRICANTE` puede realizar diagnóstico o ejecución externa delimitada, soporte contractual, RMA o intervención especializada. Siempre devuelve evidencia al caso interno.

El tercero:

- no aprueba su propio acceso;
- no aprueba el cambio empresarial final;
- no acepta riesgo por VENTO;
- no sustituye la validación interna;
- no cierra el caso canónico;
- no conserva privilegios fuera de la vigencia y alcance autorizados.

---

#### 8. Incompatibilidades obligatorias

| Combinación                                                                          | Decisión                                                                                                      |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| Solicitar + ejecutar acción ordinaria                                                | **Permitida condicionalmente** si existe permiso, alcance y estado válidos y ninguna decisión está reservada. |
| Solicitar + aprobar la propia decisión sensible                                      | **Prohibida**.                                                                                                |
| Diagnosticar + ejecutar restauración ordinaria                                       | **Permitida condicionalmente** dentro del alcance autorizado.                                                 |
| Ejecutar cambio `STANDARD / LOW` + operar bajo procedimiento preautorizado           | **Permitida** mientras no exista desviación.                                                                  |
| Ejecutar cambio sensible, alto o crítico + ser única aprobación final                | **Prohibida**.                                                                                                |
| Ejecutar acción crítica + ser único validador de la evidencia propia                 | **Prohibida**.                                                                                                |
| Administrar acceso sensible + aprobar la misma concesión o elevación                 | **Prohibida**.                                                                                                |
| Proveedor + aprobar acceso, riesgo o cambio empresarial final                        | **Prohibida**.                                                                                                |
| Dispositivo técnico o compartido + actuar como aprobador humano                      | **Prohibida**.                                                                                                |
| Automatización o alerta + actuar como aprobador humano                               | **Prohibida**.                                                                                                |
| Rol base jerárquico + asumir administración tecnológica automática                   | **Prohibida**.                                                                                                |
| Grant individual + neutralizar una denegación transversal o conflicto de segregación | **Prohibida**.                                                                                                |

---

#### 9. Reglas de validación y cierre

1. Restauración técnica, cumplimiento de solicitud, workaround, respuesta de proveedor y cierre de una subtarea no equivalen automáticamente a cierre del caso.
2. Una validación negativa devuelve el caso al trabajo de resolución correspondiente.
3. El silencio del usuario no constituye aceptación automática.
4. Cuando el solicitante no pueda validar, el responsable autorizado deberá registrar fundamento y evidencia.
5. La verificación del proveedor no sustituye la validación de VENTO.
6. `RESPONSABLE_DEL_PROCESO` valida el resultado empresarial cuando el servicio afecta un proceso protegido.
7. El trabajador puede confirmar recuperación dentro de su propio contexto autorizado, sin adquirir autoridad de administración o aprobación.
8. Un cierre de alto impacto conserva la autoridad separada ya aprobada para `VPROC-0058`.
9. Todo pendiente material deberá quedar transferido a su propietario antes del cierre; no se oculta dentro del estado cerrado.
10. Reapertura conserva el cierre histórico y no reescribe evidencia previa.

---

#### 10. Asignación de titular y suplente de `RESPONSABLE_TECNOLOGICO`

La responsabilidad no se asigna por inferencia desde un cargo. Antes de una operación productiva deberá existir evidencia de:

1. persona titular activa;
2. persona suplente activa;
3. designación organizacional vigente;
4. alcance de servicios, sedes, recursos o responsabilidades que corresponda;
5. permisos efectivos necesarios para cada acción, sin wildcards ni derivación por nombre del cargo;
6. vigencia y revocación de la designación;
7. separación frente a decisiones que el mismo actor no pueda aprobar;
8. canal de escalamiento cuando titular y suplente no sean elegibles para una decisión reservada.

La ausencia de un nombre vigente no se resuelve inventando una identidad ni concediendo privilegios a un rol base.

La salida documental queda dividida así:

| Elemento                                                                         | Estado después de esta tarea | Propietario de la evidencia posterior                                                                             |
| -------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Naturaleza de `RESPONSABLE_TECNOLOGICO` y reglas de elegibilidad                 | `ESPECIFICADO`               | `TI-AUTH-001` cierra la definición documental.                                                                    |
| Persona titular, suplente y escalamiento realmente configurados antes del piloto | `PENDIENTE_DE_EVIDENCIA`     | `READY-GATE-010 — Definir criterio y evidencia para confirmar mesa de soporte, responsables y escalamiento`.      |
| Permisos y matrices realmente configurados                                       | `PENDIENTE_DE_EVIDENCIA`     | `READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados`.    |
| Usuarios, roles, sedes y áreas requeridos realmente disponibles                  | `PENDIENTE_DE_EVIDENCIA`     | `READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos`. |

La ejecución de las comprobaciones de readiness corresponde posteriormente al mecanismo aprobado de E5; esta tarea no afirma que esas evidencias físicas ya existan.

---

#### 11. Cierre de `H-TI-DOM-009-004`

El hallazgo queda **ESPECIFICADO** documentalmente mediante la siguiente cadena:

```text
SOLICITAR
→ EVALUAR Y DIAGNOSTICAR
→ DETERMINAR CLASE, RIESGO Y AUTORIDAD
→ APROBAR CUANDO CORRESPONDA
→ EJECUTAR POR ACTOR AUTORIZADO
→ VALIDAR POR ACTOR INDEPENDIENTE CUANDO EL RIESGO LO EXIJA
→ REVISAR RESULTADO
→ CERRAR CON EVIDENCIA Y PENDIENTES TRANSFERIDOS
```

Reglas de cierre del hallazgo:

- solicitar no concede aprobación;
- aprobar no concede privilegio técnico;
- poseer privilegio técnico no concede aprobación empresarial;
- ejecutar no convierte al actor en validador independiente;
- proveedor no sustituye autoridad interna;
- `STANDARD` no significa sin control;
- `EMERGENCY` no significa sin segregación;
- una desviación material invalida la autorización previa;
- cambio sensible, alto o crítico conserva separación entre decisión final, ejecución y validación;
- cierre de alto impacto no queda en manos exclusivas del actor que ejecutó.

---

#### 12. Fronteras con las tareas siguientes del mini-bloque

| Tarea         | Decisión reservada que esta tarea no desarrolla                                                                               |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `TI-AUTH-002` | Acceso privilegiado, cuentas técnicas, proveedores con privilegio, soporte remoto, elevación temporal, vigencia y revocación. |
| `TI-AUTH-003` | Operaciones protegidas de configuración sobre endpoints, redes, impresoras, aplicaciones y monitoreo.                         |
| `TI-AUTH-004` | Acceso y manejo de logs, exportaciones, capturas, secretos, credenciales, evidencia sensible y datos personales.              |

Las reglas de identidad, segregación, alcance y ausencia de bypass definidas aquí se conservan como entrada para esas tareas, sin anticipar sus decisiones específicas.

---

#### 13. Cobertura de prueba vigente consumida

La tarea no necesita una regla protegida nueva porque las obligaciones que materializa ya están cubiertas por requisitos vigentes:

- `TREQ-AUTH-001`: la autorización depende de permisos, contexto y alcance canónicos y no de listas locales de roles;
- `TREQ-AUTH-007`: la administración de roles, perfiles, permisos y disponibilidad territorial exige capacidad administrativa explícita y alcance autorizado;
- `TREQ-AUTH-008`: las capacidades administrativas y operativas conservan sus carriles y prerrequisitos;
- `TREQ-AUTH-009`: sede y área efectivas se resuelven de forma determinista y se deniega el cruce territorial;
- `TREQ-AUTH-010`: las matrices preservan segregación de funciones y una concesión individual no anula prohibiciones transversales;
- `TREQ-AUTH-015`: las decisiones y acciones protegidas conservan evidencia correlacionable;
- `TREQ-VISO-002`: la mesa de servicio conserva solicitud, diagnóstico, resolución, validación, cierre, reapertura y protección de detalles sensibles;
- `TREQ-VISO-048`: el cambio tecnológico conserva clases, autoridad, aprobación, ventana, prueba, rollback, ejecución, validación y revisión posterior, y ya asigna responsabilidad a `TI-AUTH-001` a `TI-AUTH-004`.

Los escenarios tecnológicos de esta tarea son casos concretos y parametrizables de esas reglas ya registradas. No se altera su ciclo de vida, estado, paquete, repositorio, evidencia ni relación.

---

#### 14. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa para tecnología y soporte reglas de identidad, autorización, alcance, segregación, cambio, validación y evidencia ya aprobadas y protegidas por requisitos vigentes. No introduce un actor autorizado nuevo, un mecanismo de seguridad nuevo, un límite territorial nuevo, un efecto persistente nuevo ni un comportamiento ante error diferente; concreta casos del mismo riesgo protegido y preserva las autoridades ya definidas para los procesos y cambios tecnológicos. Por tanto, no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito.

---

#### 15. Criterios de aceptación

- [x] `RESPONSABLE_TECNOLOGICO` queda definido como responsabilidad y no como rol base nuevo.
- [x] Los roles base de `VPROC-0058` conservan participación de sujeto o reportante sin adquirir autoridad técnica automática.
- [x] Los roles operativos de `VPROC-0058` conservan reporte, evidencia y confirmación de recuperación sin privilegio técnico automático.
- [x] Se materializan las seis funciones: solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar.
- [x] El trabajo ordinario no recibe aprobaciones artificiales.
- [x] Se define cuándo una misma persona puede acumular solicitud, diagnóstico, ejecución y cierre ordinarios.
- [x] Se prohíbe la autoaprobación de decisiones sensibles y la validación unilateral de la propia acción crítica.
- [x] Se preservan las autoridades de `VPROC-0058` y `VPROC-0059`.
- [x] Se preserva la matriz de clases y autoridad de `TI-DOM-009`.
- [x] `STANDARD` conserva preautorización y guardas; `EMERGENCY` no elimina control.
- [x] Proveedor, automatización y dispositivo no se convierten en aprobadores humanos ni autoridad empresarial.
- [x] Cierre ordinario y cierre de alto impacto quedan diferenciados.
- [x] `H-TI-DOM-009-004` queda especificado documentalmente.
- [x] La asignación nominal futura de titular y suplente queda vinculada a gates existentes de readiness, sin inventar personas.
- [x] `TI-AUTH-002`, `TI-AUTH-003` y `TI-AUTH-004` conservan sus decisiones reservadas.
- [x] No se modificó implementación física, código, migraciones ni Supabase.
- [x] No se crean ni modifican requisitos de prueba.
- [x] No se inicia la tarea siguiente.

---

ÚLTIMA TAREA APROBADA

`TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos`

TAREA ACTUAL APROBADA

`TI-AUTH-001 — Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos`

SIGUIENTE TAREA RESERVADA

`TI-AUTH-002 — Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal`
### [ ] TI-AUTH-002 — Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal
### [ ] TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo
### [ ] TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte
