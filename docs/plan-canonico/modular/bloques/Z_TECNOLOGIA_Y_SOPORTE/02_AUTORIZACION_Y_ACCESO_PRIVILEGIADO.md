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
### ✅ TI-AUTH-002 — Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal

**Estado:** APROBADA  
**Tarea anterior:** `TI-AUTH-001 — Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos` — APROBADA  
**Tarea siguiente:** `TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo` — RESERVADA  
**Tipo de tarea:** documental; definición normativa y materializada del gobierno de acceso privilegiado, cuentas técnicas, soporte de proveedores, sesiones remotas, elevación temporal, vigencia, expiración, revocación y evidencia  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/02_AUTORIZACION_Y_ACCESO_PRIVILEGIADO.md`  
**Artefactos producidos:** `TI-PRIVILEGED-ACCESS-GOVERNANCE-CONTRACT-001`; `TI-TECHNICAL-ACCOUNT-CLASSIFICATION-MATRIX-001`; `TI-PRIVILEGED-ACCESS-LIFECYCLE-MATRIX-001`; `TI-TEMPORARY-ELEVATION-CONTRACT-001`; `TI-PROVIDER-PRIVILEGED-ACCESS-MATRIX-001`; `TI-REMOTE-SUPPORT-SESSION-CONTRACT-001`; `TI-PRIVILEGED-ACCESS-ASIS-RECONCILIATION-001`  
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, cuentas, permisos, grants, secretos, sesiones, dispositivos, integraciones, proveedores ni configuración de Supabase  
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir un único gobierno para cualquier privilegio tecnológico humano o técnico, impedir cuentas humanas compartidas o privilegios permanentes por conveniencia, materializar el ciclo de solicitud, aprobación, activación, uso, expiración, revocación y verificación, reutilizar las concesiones individuales canónicas para elevación temporal cuando la modalidad lo admita, separar cuentas técnicas de credenciales y permisos, y gobernar el soporte remoto o de proveedor sin convertir al tercero, a la herramienta ni a una credencial en autoridad empresarial.

---

#### 1. Resultado sustantivo

`TI-AUTH-002` queda definida con las siguientes decisiones obligatorias:

1. **El privilegio es un estado de autorización sobre una acción, recurso, alcance y ventana concretos; no es un rol, una cuenta, una licencia ni una credencial.**
2. Toda elevación humana se resuelve mediante el modelo canónico de autorización existente. No se crea un carril paralelo para TI ni un rol base denominado administrador técnico.
3. La elevación temporal que necesite añadir una capacidad administrativa individual reutiliza la semántica aprobada de concesión individual base: permiso exacto, alcance explícito, inicio, expiración, justificación, solicitante, aprobador, revisión y revocación.
4. Ninguna elevación puede convertir un permiso `OPERATIONAL_ONLY` en capacidad base, eliminar un prerrequisito operativo, superar el alcance máximo del permiso ni prevalecer sobre una denegación aplicable.
5. Una cuenta humana privilegiada debe ser nominativa. Las cuentas humanas genéricas, compartidas o prestadas quedan `BLOQUEADO` para operación privilegiada.
6. Una cuenta técnica representa un principal no humano y debe tener propietario humano responsable, propósito técnico, sistema o proceso autorizado, alcance, ambiente, recurso, mecanismo de revocación y revisión. No puede usarse como sustituto de una identidad humana.
7. `service_role` conserva su naturaleza de credencial técnica privilegiada de servidor: puede omitir RLS técnicamente, pero no produce autorización empresarial. Una operación iniciada por una persona requiere autorización humana previa; un proceso autónomo requiere identidad de servicio y operación incluida en una allowlist aprobada.
8. Un principal técnico de dispositivo compartido sigue siendo un dispositivo, no una cuenta administrativa humana. No recibe elevación interactiva ni permisos empresariales por su existencia.
9. El acceso privilegiado de proveedor o técnico externo requiere identidad trazable, patrocinador interno, caso o cambio correlacionado, recurso y alcance exactos, aprobación interna, ventana, mecanismo de autenticación aplicable, sesión identificable, expiración y verificación de revocación. El proveedor no se autoautoriza.
10. El soporte remoto privilegiado se habilita por sesión y finalidad, no por presencia permanente de una herramienta. La herramienta de soporte no concede autoridad y una reconexión no hereda una autorización vencida.
11. Una aprobación de cambio tecnológico no equivale a aprobación de acceso privilegiado. Cuando un cambio requiera privilegio, ambas decisiones permanecen correlacionadas y separadas.
12. No existe renovación silenciosa. Extender una elevación o reactivar un acceso expirado exige una nueva decisión auditada y una nueva evaluación del contexto vigente.
13. La expiración o revocación invalida la autoridad derivada; reintentos, caché, colas o reconexiones no pueden ejecutar después con la decisión anterior.
14. Se materializa documentalmente `H-TI-DOM-009-005`: todo cambio privilegiado deberá identificar principal, actor, permiso o capacidad, recurso, alcance, vigencia, sesión y revocación antes de operación real.
15. Se materializa el ciclo pendiente de `H-CAP-SCOPE-015-009` para acceso privilegiado, proveedor y soporte remoto: solicitud, aprobación, activación limitada, uso atribuible, expiración o revocación, verificación y cierre.
16. Se conserva la frontera de `TI-AUTH-003`: esta tarea gobierna **quién y durante qué ventana** puede obtener privilegio; la tarea siguiente gobierna **qué operaciones de configuración** quedan protegidas.
17. Se conserva la frontera de `TI-AUTH-004`: esta tarea prohíbe transportar credenciales dentro del expediente de privilegio; la protección detallada de logs, capturas, exportaciones, secretos y datos personales permanece en esa tarea.
18. El acceso de continuidad `break-glass`, credenciales de recuperación y failover permanece fuera de alcance y bajo `CONT-AUTH-002`.

---

#### 2. Entradas canónicas conservadas

Esta tarea consume sin redefinir:

- `TI-AUTH-001` para responsabilidades, segregación y autoridades de decisión;
- `VPROC-0058 — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento`;
- `VPROC-0059 — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación`;
- la regla de `VPROC-0059` que separa solicitante, administrador técnico y aprobador en accesos sensibles;
- la aprobación obligatoria de `VPROC-0059` por `GERENCIA_GENERAL` o autoridad de seguridad competente para concesión, modificación, privilegio, suspensión o revocación de acceso;
- `AUTH-MOD-001` para identidad humana, principal técnico de dispositivo y servicio del sistema;
- `AUTH-RBAC-020` para concesiones individuales base, su vigencia, alcance, aprobación y revocación;
- la precedencia canónica de autorización, incluida la prevalencia de denegaciones sobre concesiones positivas;
- `TI-DOM-006` y `TI-DOM-012` para aplicaciones, proveedores, licencias, relaciones técnicas y relaciones comerciales;
- `TI-DOM-007` para caso de soporte, incidente, prioridad, validación y cierre;
- `TI-DOM-009` para cambio, riesgo, aprobación, ventana, ejecución, rollback y revisión posterior;
- `TI-DOM-013` para conocimiento y capacitación sin convertir documentación en autoridad;
- `TREQ-SHELL-010` como requisito vigente que ya protege el ciclo tecnológico de cuentas, privilegio, soporte remoto, proveedor, vigencia, MFA cuando aplique, actor, evidencia y cierre;
- `TREQ-AUTH-014`, `TREQ-AUTH-015`, `TREQ-AUTH-016` y `TREQ-AUTH-165` para invalidación, auditoría, revocación coordinada y prohibición de convertir `service_role` en autorización empresarial;
- `TI-INT-003` como propietario de la futura integración con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos;
- `AUTH-DB-019`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-012` como destinos de implementación física de identidad, invalidación, evaluación y auditoría cuando un paquete posterior lo autorice;
- `VISO-AUTH-017`, `VISO-AUTH-018` y `VISO-AUTH-019` para administración de excepciones individuales, auditoría de seguridad y restricción de administradores;
- `READY-GATE-003` y `READY-GATE-010` para demostrar configuración de permisos y preparación de mesa de soporte antes de un piloto.

No se crea un segundo catálogo de permisos, un esquema paralelo de roles ni una identidad ficticia para proveedores.

---

#### 3. Contrato `TI-PRIVILEGED-ACCESS-GOVERNANCE-CONTRACT-001`

##### 3.1. Definición de privilegio

Se considera **acceso privilegiado tecnológico** toda autoridad que permita, dentro de un sistema técnico o plano administrativo:

- ejercer una capacidad administrativa o de seguridad no disponible al uso ordinario del actor;
- ejecutar una operación mediante un principal o canal técnico capaz de superar controles ordinarios;
- administrar identidades, permisos, sesiones o credenciales;
- intervenir un recurso técnico mediante una sesión remota con autoridad superior a la del usuario ordinario;
- actuar sobre una configuración, ambiente o servicio cuyo cambio exige controles adicionales;
- utilizar una capacidad de proveedor o plataforma externa con efecto administrativo sobre recursos VENTO.

La definición no concede autoridad por sí misma. La autorización efectiva sigue resolviéndose contra permiso o capacidad registrada, principal, actor, alcance, recurso, estado, modalidad, vigencia y denegaciones.

##### 3.2. Separaciones obligatorias

```text
CUENTA
≠ IDENTIDAD
≠ PRINCIPAL
≠ ACTOR EFECTIVO
≠ PERMISO
≠ CREDENCIAL
≠ SECRETO
≠ ASIENTO DE LICENCIA
≠ SESION PRIVILEGIADA
≠ AUTORIZACION
```

También:

```text
APROBACION DE CAMBIO
≠ APROBACION DE ACCESO

HERRAMIENTA DE SOPORTE REMOTO
≠ AUTORIDAD

PROVEEDOR
≠ APROBADOR INTERNO

SERVICE_ROLE
≠ PERMISO EMPRESARIAL
```

##### 3.3. Principio de mínima autoridad

Todo privilegio deberá estar limitado simultáneamente por:

1. actor o principal exacto;
2. finalidad verificable;
3. capacidad o permiso exactos;
4. aplicación, servicio, ambiente o plataforma objetivo;
5. recurso o conjunto explícitamente autorizado;
6. alcance territorial cuando el recurso lo requiera;
7. ventana de inicio y fin;
8. caso, solicitud o cambio que justifica la intervención;
9. controles de autenticación aplicables;
10. denegaciones y segregación vigentes.

Un valor ausente o ambiguo no significa alcance global.

---

#### 4. Matriz `TI-TECHNICAL-ACCOUNT-CLASSIFICATION-MATRIX-001`

| Clase                                           | Naturaleza                                                                |                           ¿Puede ser actor humano? |                                                            ¿Puede recibir privilegio? | Regla obligatoria                                                                                                                                                         | Estado objetivo                                                                             |
| ----------------------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------: | ------------------------------------------------------------------------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| **Cuenta humana nominativa interna**            | Principal personal vinculado a una identidad laboral activa.              |                                                 Sí |                             Sí, únicamente mediante autorización explícita y vigente. | No comparte credencial; la elevación no modifica el rol base ni crea bypass.                                                                                              | `ESPECIFICADO`                                                                              |
| **Servicio del sistema**                        | Principal no humano para un proceso autónomo identificado.                |                                                 No |                  Sí, solo para operaciones técnicas allowlisted y recursos definidos. | Debe registrar identidad del servicio o job, propietario humano, propósito y límites. No puede simular una persona.                                                       | `ESPECIFICADO`                                                                              |
| **Credencial `service_role`**                   | Credencial técnica privilegiada de Supabase usada únicamente en servidor. |                                                 No | Tiene capacidad técnica de omitir RLS, pero cero autorización empresarial automática. | Si la operación proviene de una persona, se autoriza primero al actor humano. Si es autónoma, se identifica proceso y allowlist. Nunca se entrega como credencial humana. | `IMPLEMENTADO` parcialmente como patrón técnico; gobierno integral `PENDIENTE_DE_EVIDENCIA` |
| **Principal técnico de dispositivo compartido** | Identidad técnica de una terminal o dispositivo.                          |                                                 No |                          No recibe privilegio empresarial propio ni elevación humana. | Solo ejecuta operaciones técnicas expresamente permitidas y requiere actor humano para acciones empresariales.                                                            | `ESPECIFICADO`; materialización parcial existente                                           |
| **Identidad humana externa de proveedor**       | Persona externa identificada por relación de proveedor o plataforma.      | Sí, como tercero trazable; no como rol base VENTO. |                          Solo dentro de una sesión o autorización externa delimitada. | Requiere patrocinador interno, aprobación, finalidad, recurso, ventana y evidencia. Una cuenta compartida del proveedor no satisface identidad.                           | `PENDIENTE_DE_EVIDENCIA` para bindings productivos actuales                                 |
| **Credencial de integración o token técnico**   | Secreto que autentica una integración o servicio.                         |                                                 No |                                                                      No por sí mismo. | Es credencial, no identidad humana ni permiso. Su uso debe quedar ligado al servicio autorizado.                                                                          | `ESPECIFICADO`; instancias físicas dependen de cada integración                             |
| **Cuenta humana genérica o compartida**         | Identidad no atribuible de manera unívoca a una persona.                  |                              No de forma confiable |                                                                                    No | Queda prohibida para operación privilegiada. No se corrige añadiendo un nombre informal en el ticket.                                                                     | `BLOQUEADO`                                                                                 |

##### 4.1. Reglas adicionales de cuenta técnica

Toda cuenta técnica o principal de servicio deberá declarar, antes de uso productivo:

- `principal_id` o identidad técnica verificable;
- clase de principal;
- sistema o plataforma propietaria;
- ambiente;
- propietario humano responsable;
- proceso, job o integración que la utiliza;
- finalidad;
- capacidades o allowlist aplicables;
- recursos permitidos;
- mecanismo de autenticación;
- referencia al custodio de la credencial sin insertar el secreto en el expediente;
- estado;
- fecha de última revisión;
- condición de suspensión o revocación;
- evidencia de retiro cuando deje de ser necesaria.

Una cuenta técnica no puede utilizarse interactívamente por una persona para evitar una autorización nominativa. Si una persona necesita operar, deberá hacerlo mediante su identidad humana y la sesión privilegiada aprobada correspondiente.

---

#### 5. Matriz `TI-PRIVILEGED-ACCESS-LIFECYCLE-MATRIX-001`

El ciclo no crea un proceso empresarial nuevo. Utiliza `VPROC-0059` para acceso tecnológico y se correlaciona con `VPROC-0058` o `TI-DOM-009` cuando la necesidad nace de soporte, incidente o cambio.

| Etapa                           | Entrada mínima                                                                                       | Autoridad / actor                                                                  | Resultado obligatorio                                         | Prohibición                                                                        |
| ------------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| **1. Necesidad**                | Caso, cambio, evento o responsabilidad verificable.                                                  | Solicitante legítimo.                                                              | Motivo y objetivo identificados.                              | No activar privilegio por urgencia verbal o conveniencia.                          |
| **2. Solicitud**                | Principal o beneficiario, capacidad, recurso, alcance, ambiente, inicio, fin y referencia de origen. | Solicitante o patrocinador interno.                                                | Solicitud completa y no ejecutable.                           | No usar un rol, una cuenta o una herramienta como sustituto del permiso requerido. |
| **3. Evaluación**               | Riesgo, segregación, modalidad, denegaciones, alcance máximo, sensibilidad y conflicto de interés.   | Administrador técnico prepara; seguridad participa cuando corresponda.             | Expediente suficiente para decisión.                          | El administrador técnico no se concede autoridad por preparar el registro.         |
| **4. Aprobación**               | Solicitud evaluada y autoridad aplicable.                                                            | `GERENCIA_GENERAL` o autoridad de seguridad competente según `VPROC-0059`.         | Decisión aprobada o rechazada con actor y condiciones.        | Solicitante, beneficiario o ejecutor no se autoaprueban en acceso sensible.        |
| **5. Programación / provisión** | Decisión aprobada, inicio futuro cuando aplique.                                                     | Actor técnico autorizado.                                                          | Grant, vínculo o sesión preparado con alcance exacto.         | No activar antes de `effective_from`; no ampliar la decisión durante provisión.    |
| **6. Activación**               | Vigencia iniciada y autenticación aplicable satisfecha.                                              | Actor o principal autorizado.                                                      | Autoridad efectiva únicamente dentro de la ventana y recurso. | No heredar autoridad de otra sesión, dispositivo, cambio o usuario.                |
| **7. Uso**                      | Sesión vigente, recurso compatible y autorización revalidable.                                       | Actor efectivo o servicio identificado.                                            | Acciones atribuibles y auditables.                            | No compartir sesión, credencial ni identidad; no ejecutar fuera de finalidad.      |
| **8. Terminación**              | Expiración, revocación, suspensión, cierre de ventana o pérdida de condición.                        | Sistema por expiración o actor autorizado por decisión.                            | Acceso deja de participar en autorización; sesión termina.    | No prolongar por reconexión, reintento, caché o proceso pendiente.                 |
| **9. Verificación**             | Resultado de terminación y fuentes de autoridad.                                                     | Responsable técnico distinto cuando el riesgo lo exija.                            | Evidencia de que no queda autoridad residual utilizable.      | No considerar revocado únicamente porque una pantalla diga inactivo.               |
| **10. Cierre**                  | Evidencia, pendientes transferidos y correlación con caso/cambio.                                    | Responsable del proceso de acceso; cierre empresarial según segregación aplicable. | Historial preservado y expediente cerrado.                    | No borrar evidencia ni convertir cierre en renovación.                             |

##### 5.1. Datos mínimos del expediente

Cada acceso privilegiado deberá poder reconstruir como mínimo:

| Grupo         | Campos conceptuales obligatorios                                                                 |
| ------------- | ------------------------------------------------------------------------------------------------ |
| identidad     | principal técnico o humano, actor efectivo cuando corresponda y beneficiario                     |
| patrocinio    | solicitante, patrocinador interno cuando exista tercero y aprobador                              |
| finalidad     | justificación, caso/incidente/cambio/proceso de origen                                           |
| autoridad     | permiso o capacidad exacta, modalidad, fuente de la concesión y denegaciones relevantes          |
| alcance       | aplicación o plataforma, ambiente, recurso, sede/área cuando aplique y restricciones             |
| tiempo        | `effective_from`, `effective_until`, activación, terminación y última revisión                   |
| autenticación | mecanismo aplicable y evidencia de reautenticación/MFA cuando corresponda, sin conservar secreto |
| sesión        | identificador de sesión privilegiada o identidad de ejecución técnica cuando exista              |
| proveedor     | proveedor, identidad externa y responsable interno cuando aplique                                |
| cierre        | causa de expiración/revocación, actor, resultado de verificación y referencia de evidencia       |

No se fija una duración universal. La ventana deberá ser la mínima necesaria para la finalidad aprobada y nunca podrá superar silenciosamente la ventana o condición que originó el acceso.

---

#### 6. Contrato `TI-TEMPORARY-ELEVATION-CONTRACT-001`

##### 6.1. Mecanismo canónico

La elevación temporal humana **no crea un tipo nuevo de rol ni un mecanismo alternativo de permisos**.

Cuando la capacidad sea compatible con el carril base, la elevación reutiliza una concesión individual base con la semántica ya aprobada:

```text
TRABAJADOR ACTIVO
+
PERMISO CANONICO COMPATIBLE
+
CONCESION INDIVIDUAL VIGENTE
+
ALCANCE APROBADO
+
RECURSO COMPATIBLE
+
CONTROLES SENSIBLES APLICABLES
+
SIN DENEGACION PREVALENTE
=
ELEVACION TEMPORAL POSIBLE
```

##### 6.2. Invariantes

1. `effective_from` es obligatorio.
2. `effective_until` es obligatorio para una elevación temporal.
3. Una elevación futura no autoriza antes del inicio.
4. Una elevación vencida permanece en historial pero no participa como allow.
5. Extender la vigencia genera una nueva decisión auditada; no se modifica silenciosamente la fecha anterior.
6. Un cambio de rol, vínculo laboral, sede, área, responsabilidad, permiso, recurso o riesgo obliga a reevaluar la concesión.
7. La concesión utiliza una clave canónica exacta; no admite wildcard, prefijo, aplicación completa ni permiso inexistente.
8. La elevación no puede convertir una capacidad `OPERATIONAL_ONLY` en base.
9. En `BASE_AND_OPERATIONAL`, la elevación solo puede aportar el componente base; turno, check-in, rol operativo y demás condiciones siguen siendo obligatorios.
10. Una denegación aplicable prevalece sobre la concesión temporal.
11. Un permiso sensible conserva reautenticación, motivo, segregación y demás controles propios; elevar no reduce sensibilidad.
12. Una persona que administra técnicamente el grant no adquiere por ello facultad para aprobarlo.
13. El beneficiario no aprueba su propia elevación sensible.
14. La aprobación de un cambio no inserta automáticamente la concesión individual necesaria para ejecutarlo.
15. La finalización de la ventana invalida el acceso incluso si el trabajo técnico no terminó; continuar exige una nueva solicitud o ampliación aprobada.

##### 6.3. Prohibiciones

Quedan expresamente prohibidos:

- elevar mediante cambio permanente del rol base para resolver una necesidad temporal;
- añadir permisos manuales sin origen, vigencia, aprobador y alcance;
- conceder acceso total para facilitar diagnóstico;
- reutilizar una concesión temporal de otro trabajador;
- usar una cuenta técnica, dispositivo o `service_role` como identidad del humano elevado;
- reactivar un grant expirado sin nueva decisión;
- mantener privilegio activo porque el proveedor aún no respondió;
- utilizar presión operativa o contractual como sustituto de aprobación.

---

#### 7. Gobierno de cuentas técnicas

##### 7.1. Servicio del sistema

Un servicio autónomo solo podrá realizar operaciones privilegiadas cuando:

1. el principal o servicio esté identificado;
2. la operación pertenezca a una allowlist aprobada;
3. el ambiente y recurso estén definidos;
4. el proceso tenga propietario humano;
5. la credencial utilizada esté separada del permiso empresarial;
6. la operación produzca auditoría suficiente;
7. exista mecanismo de suspensión o revocación;
8. una modificación de privilegio siga el proceso de acceso tecnológico.

Una tarea programada, función, webhook o Edge Function no se convierte en actor humano. Su auditoría deberá conservar identidad del servicio y, cuando la operación sea originada por una persona, también el actor humano que la solicitó.

##### 7.2. Uso de `service_role`

La regla canónica es:

```text
SERVICE_ROLE
=
CAPACIDAD TECNICA PRIVILEGIADA
≠
AUTORIZACION EMPRESARIAL
```

Para operación iniciada por una persona:

```text
IDENTIDAD HUMANA
→ AUTORIZACION CANONICA
→ RECURSO Y ALCANCE VALIDOS
→ OPERACION TECNICA CON SERVICE_ROLE
→ AUDITORIA DEL ACTOR HUMANO
```

Para proceso autónomo:

```text
SERVICIO IDENTIFICADO
→ OPERACION ALLOWLISTED
→ RECURSO Y AMBIENTE PERMITIDOS
→ OPERACION TECNICA
→ AUDITORIA DEL SERVICIO
```

No se autoriza entregar `service_role` a un técnico, proveedor o administrador para uso interactivo.

##### 7.3. Principal técnico de dispositivo

El principal técnico de un dispositivo compartido conserva su autoridad propia y limitada. No recibe permisos del trabajador, no recibe una concesión individual base y no puede convertirse en administrador por configuración local.

---

#### 8. Matriz `TI-PROVIDER-PRIVILEGED-ACCESS-MATRIX-001`

La matriz materializa exactamente las **cinco familias externas** ya reconciliadas por `TI-DOM-012`. La existencia de SDK, repositorio, proyecto o integración no demuestra acceso humano privilegiado actual.

| Familia externa | Evidencia tecnológica conservada                                                                            | Evidencia actual de acceso privilegiado humano del proveedor                                                | Regla de acceso privilegiado                                                                                                                                                                       | Estado / propietario de cierre                                                                                        |
| --------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **GitHub**      | Relación técnica confirmada mediante repositorios de aplicaciones.                                          | `PENDIENTE_DE_EVIDENCIA`; no se infiere desde la existencia del repositorio.                                | Toda intervención privilegiada debe identificar persona, organización/repositorio objetivo, finalidad, nivel exacto, patrocinador, ventana y revocación. Cuenta humana compartida queda bloqueada. | Gobierno de privilegio `ESPECIFICADO`; mecanismo e identidades reales se verifican durante implementación/readiness.  |
| **Supabase**    | Dependencia técnica confirmada en aplicaciones y uso de cliente privilegiado backend en funciones actuales. | `PENDIENTE_DE_EVIDENCIA`; un proyecto o `service_role` no demuestra acceso humano del proveedor.            | `service_role` nunca se entrega al proveedor ni a una persona. Cualquier soporte privilegiado humano requiere identidad separada, aprobación, recurso, ambiente, ventana y sesión atribuible.      | Gobierno `ESPECIFICADO`; controles de identidad/evaluación bajo AUTH y la integración de proveedor bajo `TI-INT-003`. |
| **Expo/EAS**    | Configuración técnica observada para ANIMA y PASS.                                                          | `PENDIENTE_DE_EVIDENCIA`; cuenta, plan y miembros con privilegio no están demostrados por la configuración. | Acceso administrativo solo con identidad trazable y alcance al proyecto/ambiente necesario; no usar credencial de integración como cuenta humana.                                                  | Gobierno `ESPECIFICADO`; evidencia de tenant/cuenta y mecanismo bajo `TI-DOM-012` y `TI-INT-003`.                     |
| **Sentry**      | SDK observado en ANIMA.                                                                                     | `PENDIENTE_DE_EVIDENCIA`; SDK no prueba servicio activo ni acceso humano vigente.                           | Si se habilita soporte o administración privilegiada, deberá usar identidad trazable, proyecto definido, ventana y límites; el contenido sensible observado queda sujeto a `TI-AUTH-004`.          | Gobierno `ESPECIFICADO`; relación real y mecanismo pendientes de evidencia.                                           |
| **RevenueCat**  | SDK observado en PASS.                                                                                      | `PENDIENTE_DE_EVIDENCIA`; SDK no prueba producto, contrato, cuenta o acceso humano vigente.                 | Toda administración privilegiada requiere identidad trazable, proyecto exacto, patrocinador, aprobación y alcance; no se deriva autoridad de un token técnico.                                     | Gobierno `ESPECIFICADO`; relación real y mecanismo pendientes de evidencia.                                           |

Balance de la matriz:

```text
5 familias esperadas
5 familias materializadas
0 familias omitidas
0 accesos humanos actuales inventados
5 estados de acceso actual PENDIENTE_DE_EVIDENCIA
```

##### 8.1. Reglas transversales para proveedor

1. El proveedor no se convierte en rol base, empleado, aprobador empresarial ni propietario del proceso.
2. El patrocinador interno responde por necesidad, alcance y correlación, pero no puede ampliar la decisión aprobada.
3. La plataforma del proveedor no sustituye el expediente VENTO.
4. Un técnico externo debe ser individualmente atribuible; una identidad compartida invalida el acceso privilegiado interactivo.
5. El acceso se habilita únicamente para el recurso, ambiente y ventana necesarios.
6. Finalizada la ventana, la relación de sesión o grant deja de autorizar aunque el proveedor mantenga una cuenta en su plataforma.
7. Una relación comercial vigente no concede acceso técnico.
8. Una relación técnica observada no prueba relación comercial ni privilegio.
9. La terminación del contrato o de la necesidad activa una revisión inmediata de accesos, credenciales de integración y sesiones relacionadas.
10. La integración física de herramientas de proveedor pertenece a `TI-INT-003`; esta tarea define los controles que esa integración deberá respetar.

---

#### 9. Contrato `TI-REMOTE-SUPPORT-SESSION-CONTRACT-001`

##### 9.1. Regla raíz

```text
CASO O CAMBIO VALIDO
+
ACTOR DE SOPORTE IDENTIFICADO
+
APROBACION DE ACCESO CUANDO HAY PRIVILEGIO
+
OBJETIVO Y ALCANCE EXACTOS
+
VENTANA VIGENTE
+
SESION REMOTA IDENTIFICABLE
=
SOPORTE REMOTO PRIVILEGIADO POSIBLE
```

La instalación de un agente, la existencia de una consola o la disponibilidad de una plataforma no equivalen a una sesión autorizada.

##### 9.2. Inicio de sesión

Antes de abrir una sesión privilegiada deberá resolverse:

- caso o cambio correlacionado;
- identidad del actor que prestará soporte;
- patrocinador interno si es tercero;
- endpoint, servicio o recurso objetivo;
- finalidad;
- permiso o capacidad necesaria;
- alcance;
- inicio y expiración;
- aprobación aplicable;
- autenticación y reautenticación/MFA cuando corresponda;
- política de supervisión o acompañamiento si el riesgo lo exige;
- referencia a la evidencia sin incorporar secretos.

##### 9.3. Durante la sesión

La sesión deberá conservar:

- identificador propio;
- actor y principal;
- recurso objetivo;
- inicio y fin;
- correlación con caso o cambio;
- estado de autorización vigente;
- eventos administrativos relevantes;
- causa de terminación.

La sesión no puede:

- prestar la identidad de otro administrador;
- reutilizar una sesión ajena;
- convertir la credencial técnica del endpoint en actor humano;
- ampliar el recurso objetivo sin nueva autorización;
- continuar después de expiración por mantener abierta la conexión;
- reanudar automáticamente una acción mutante después de perder conectividad;
- transportar contraseñas, tokens o códigos de recuperación dentro del expediente de soporte.

##### 9.4. Sesiones atendidas y no atendidas

El modelo no presume que exista hoy una herramienta de soporte remoto ni un modo no atendido aprobado.

- una sesión **atendida** puede operar cuando el flujo y la autorización correspondientes estén vigentes;
- un acceso **no atendido persistente** no queda autorizado por esta tarea y permanece `BLOQUEADO` hasta que una implementación posterior demuestre identidad, alcance, política, expiración, revocación y auditoría equivalentes;
- un agente técnico instalado puede permanecer como componente, pero su presencia no debe otorgar privilegio interactivo permanente.

La implementación y verificación del mecanismo concreto pertenecen a `TI-INT-003` y al paquete de implementación que resulte expresamente autorizado.

##### 9.5. Reconexión, offline y reintentos

1. Una reconexión dentro de una ventana aún vigente debe revalidar la autorización y la identidad de sesión antes de continuar.
2. Una reconexión posterior a expiración exige nueva autorización; no revive la sesión previa.
3. Acciones privilegiadas pendientes no se ejecutan automáticamente después de recuperar conectividad.
4. Colas y reintentos deben reautorizarse con contexto fresco antes de producir efecto.
5. Una operación iniciada antes de expirar pero confirmada después no se da por válida únicamente por su hora de inicio; el contrato de la operación deberá demostrar la frontera transaccional aplicable.
6. Duplicados, resultado incierto o efecto parcial se derivan al caso tecnológico y a la reconciliación correspondiente, sin afirmar éxito o rollback no demostrado.

---

#### 10. Relación con cambio tecnológico

`TI-DOM-009` conserva las clases `STANDARD`, `NORMAL` y `EMERGENCY`. La autorización del cambio y la del privilegio son controles distintos.

| Situación                                                          | Decisión de cambio                                                           | Decisión de privilegio                                                                                                                |
| ------------------------------------------------------------------ | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `STANDARD / LOW` sin acción privilegiada                           | Usa la preautorización vigente del procedimiento.                            | No se crea privilegio artificial.                                                                                                     |
| `STANDARD / LOW` que requiere una capacidad privilegiada explícita | El procedimiento de cambio debe permitir esa clase de intervención.          | Requiere una concesión o sesión de acceso compatible, vigente y aprobada; la preautorización del cambio no crea el grant.             |
| `NORMAL`                                                           | Conserva la autoridad definida por riesgo en `TI-DOM-009`.                   | Si exige privilegio, `VPROC-0059` conserva su aprobación propia y segregación.                                                        |
| `EMERGENCY`                                                        | Acelera la decisión sin eliminar identidad, autoridad, rollback ni revisión. | No elimina el proceso de acceso. Si el caso exige un mecanismo de continuidad `break-glass`, su gobierno pertenece a `CONT-AUTH-002`. |
| Proveedor ejecutor                                                 | Puede participar en el cambio según riesgo y contrato.                       | No recibe autoridad empresarial por estar asignado al cambio; su sesión privilegiada se gobierna de forma separada.                   |

Un cambio aprobado tampoco autoriza:

- acceso a otro ambiente;
- acceso a otros recursos del mismo proveedor;
- ampliación temporal sin nueva decisión;
- uso de una cuenta compartida;
- lectura sensible fuera de la finalidad autorizada;
- configuración no incluida en el alcance del cambio.

---

#### 11. Expiración, suspensión, revocación y autoridad residual

##### 11.1. Eventos que obligan a reevaluar o terminar acceso

Como mínimo:

- llegada de `effective_until`;
- revocación o suspensión aprobada;
- retiro o inactivación del vínculo laboral;
- cambio material de rol, responsabilidad, sede o área;
- modificación o retiro del permiso;
- retiro o sustitución del recurso;
- fin de la necesidad o ventana de soporte;
- cierre o cancelación de la relación de proveedor aplicable;
- cambio material de riesgo;
- conflicto de seguridad;
- cambio de principal, actor o identidad de la sesión;
- pérdida de autenticación requerida;
- revocación de la credencial técnica utilizada por un servicio.

##### 11.2. Efecto

La expiración automática ejecuta una condición ya autorizada y no necesita una segunda aprobación para dejar de autorizar. Reactivar, extender o volver a conceder sí exige una nueva decisión cuando la autorización anterior dejó de estar vigente.

Después de terminación:

```text
GRANT INACTIVO
+
SESION TERMINADA
+
CONTEXTO INVALIDADO
+
TOKENS O CACHE DERIVADOS NO REUTILIZABLES
+
REINTENTOS O COLAS REAUTORIZADOS DESDE CERO
+
EVIDENCIA CONSERVADA
=
CERO AUTORIDAD RESIDUAL ACEPTABLE
```

No se afirma que estos mecanismos estén físicamente implementados hoy; constituyen la condición documental que deberán materializar `AUTH-DB-035`, `AUTH-DB-034`, `AUTH-DB-012`, los consumidores y el paquete autorizado.

---

#### 12. Reconciliación `TI-PRIVILEGED-ACCESS-ASIS-RECONCILIATION-001`

| Elemento AS-IS                                              | Evidencia actual                                                                                                                                      | Estado frente al contrato                                                                      | Decisión                                                                                                                                                   |
| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Modelo canónico de identidad y autorización                 | Personas, dispositivos técnicos, servicios del sistema, permisos, alcance y precedencia ya están definidos documentalmente.                           | `ESPECIFICADO`                                                                                 | Reutilizar; no crear otro modelo TI.                                                                                                                       |
| Concesiones individuales                                    | Existe `employee_permissions` como estructura física de overrides y existe contrato documental de concesiones individuales con vigencia y aprobación. | `IMPLEMENTADO` parcialmente / ciclo objetivo `PENDIENTE_DE_EVIDENCIA`                          | Usar como base de futura elevación temporal; no asumir que la estructura física actual satisface toda la semántica de vigencia, aprobación e invalidación. |
| Override temporal histórico                                 | Existe una migración que retiró un acceso temporal total de validación y devolvió el comportamiento a la matriz canónica.                             | `IMPLEMENTADO` como corrección histórica; no prueba gobierno general                           | Prohíbe normalizar overrides amplios ad hoc como mecanismo de soporte.                                                                                     |
| Uso de `service_role`                                       | Funciones actuales consumen `SUPABASE_SERVICE_ROLE_KEY` en servidor para operaciones técnicas.                                                        | `IMPLEMENTADO` como patrón técnico; autorización empresarial integral `PENDIENTE_DE_EVIDENCIA` | Mantener credencial separada de autorización y exigir actor/servicio identificable.                                                                        |
| Ledger transversal de sesiones privilegiadas                | Las fuentes consumidas no demuestran una materialización canónica completa de sesión privilegiada con ventana, actor, recurso y revocación.           | `PENDIENTE_DE_EVIDENCIA`                                                                       | Materialización posterior bajo AUTH/SHELL y paquete autorizado.                                                                                            |
| Soporte remoto productivo                                   | No se demuestra una herramienta o contrato runtime canónico de soporte remoto en las fuentes actuales.                                                | `PENDIENTE_DE_EVIDENCIA`                                                                       | `TI-INT-003` define integración; no inferir capacidad desde agente, SDK o proveedor.                                                                       |
| Familias externas                                           | GitHub, Supabase, Expo/EAS, Sentry y RevenueCat están reconciliados como cinco familias técnicas externas.                                            | `ESPECIFICADO`; relación comercial y acceso humano variables `PENDIENTE_DE_EVIDENCIA`          | Aplicar la matriz de proveedor sin inventar tenants, cuentas o miembros.                                                                                   |
| Acceso no atendido persistente de tercero                   | No está aprobado ni demostrado por las fuentes consumidas.                                                                                            | `BLOQUEADO`                                                                                    | No habilitar hasta existir mecanismo trazable, limitado, revocable y auditado aprobado.                                                                    |
| `break-glass` y credenciales de recuperación de continuidad | Existe tarea propietaria específica en continuidad.                                                                                                   | `FUERA_DE_ALCANCE`                                                                             | `CONT-AUTH-002`.                                                                                                                                           |

La reconciliación distingue una capacidad técnica existente de un gobierno de privilegio completo. Encontrar un cliente administrativo, una tabla de override o una dependencia externa no permite declarar la tarea implementada.

---

#### 13. Cierre de hallazgos y pendientes con propietario

| Hallazgo                                                                                           | Resultado en `TI-AUTH-002`                                                                         | Estado tras esta tarea                                                   | Propietario siguiente cuando existe evidencia o implementación pendiente      | Condición de salida                                                                                 |
| -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `H-CAP-SCOPE-015-007` — ciclo de cuentas no reconciliado con altas, cambios, retiros y externos    | Se fija el ciclo privilegiado y su revocación; se conserva la dependencia de identidad y vínculo.  | `ESPECIFICADO` para privilegio; materialización `PENDIENTE_DE_EVIDENCIA` | `AUTH-DB-019`; `AUTH-DB-035`; procesos propietarios de personas/proveedor     | vínculo y eventos de ciclo alimentan invalidación real sin autoridad residual.                      |
| `H-CAP-SCOPE-015-008` — cuenta, permiso, credencial, secreto y licencia conflados                  | Se materializa separación normativa y clasificación de principales/cuentas.                        | `ESPECIFICADO`                                                           | `TI-AUTH-004` para manejo de secretos; `TI-DOM-012` para licencia/contrato    | cada objeto conserva identidad, propietario y control independiente.                                |
| `H-CAP-SCOPE-015-009` — privilegio, proveedor y soporte remoto sin ciclo explícito                 | Se define solicitud, aprobación, activación, sesión, vigencia, terminación, verificación y cierre. | `ESPECIFICADO`                                                           | `VISO-AUTH-017` a `VISO-AUTH-019`; `AUTH-DB-034`; `AUTH-DB-035`; `TI-INT-003` | flujo implementado y probado con identidades y sesiones reales.                                     |
| `H-CAP-SCOPE-015-021` — credenciales o material sensible pueden terminar en expedientes o mensajes | El expediente de privilegio referencia la credencial pero no la incorpora.                         | `ESPECIFICADO` parcialmente                                              | `TI-AUTH-004`                                                                 | reglas completas de secreto, log, captura y dato sensible aprobadas y posteriormente implementadas. |
| `H-CAP-SCOPE-015-031` — remoto, offline o reintento puede duplicar acciones o perder atribución    | Se prohíbe replay privilegiado y se exige reautorización en reconexión/reintento.                  | `ESPECIFICADO`                                                           | `TI-INT-003`; `AUTH-DB-035`; paquete E5 aplicable                             | adaptador y consumidores demuestran idempotencia, atribución y autoridad fresca.                    |
| `H-TI-DOM-009-005` — cambio privilegiado requiere elevación o soporte remoto                       | Principal, actor, alcance, vigencia, sesión y revocación quedan gobernados.                        | `ESPECIFICADO`                                                           | implementación de AUTH y `TI-INT-003`                                         | cambio productivo puede demostrar privilegio temporal sin acceso residual.                          |

No quedan pendientes narrativos sin propietario documental.

---

#### 14. Fronteras obligatorias

##### 14.1. `TI-AUTH-003`

`TI-AUTH-002` no define el catálogo de operaciones protegidas sobre endpoints, redes, impresoras, aplicaciones, licencias o monitoreo. Solo define cómo se gobierna el privilegio que pueda ser necesario para ejecutarlas.

##### 14.2. `TI-AUTH-004`

La tarea no define retención, minimización o exposición detallada de logs, capturas, exportaciones, secretos ni datos personales. Únicamente establece que una credencial o secreto no se convierte en evidencia del expediente ni en mecanismo de identidad humana.

##### 14.3. `TI-INT-003`

La tarea no selecciona ni integra una herramienta concreta de MDM o soporte remoto. `TI-INT-003` deberá materializar el contrato técnico de cualquier proveedor o herramienta respetando este gobierno.

##### 14.4. `CONT-AUTH-002`

No se define `break-glass`, credencial de recuperación, failover ni acceso de emergencia de continuidad. Esa superficie conserva su tarea propietaria.

##### 14.5. Implementación física

No se crean tablas, grants, funciones, secretos, cuentas, sesiones ni migraciones. La implementación posterior deberá pasar por las tareas y paquetes autorizados de AUTH/SHELL, BLOQUE R, E5 y `TI-INT-003` según el objeto materializado.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

La tarea no introduce una regla protegida distinta de las ya registradas para el ciclo tecnológico de cuentas y acceso, invalidación de autoridad, auditoría, revocación coordinada y separación de la capacidad técnica de la autorización empresarial. El requisito vigente del dominio SHELL ya incluye de forma expresa acceso privilegiado, soporte remoto, proveedor, vigencia, autenticación reforzada cuando aplique, actor, evidencia y cierre. Las decisiones de esta tarea materializan casos parametrizados y contratos documentales dentro de esa regla existente, sin cambiar su comportamiento protegido.

---

#### 15. Criterios de aceptación

- [x] Se define acceso privilegiado sin convertirlo en rol, cuenta, credencial o licencia.
- [x] Se preserva `VPROC-0059` como ciclo propietario de acceso tecnológico.
- [x] Se preserva la aprobación obligatoria de acceso sensible por la autoridad ya definida.
- [x] Se materializan exactamente siete clases relevantes en la matriz de cuentas y principales, incluida la cuenta humana compartida como `BLOQUEADO`.
- [x] Se define un ciclo completo de diez etapas desde necesidad hasta cierre.
- [x] Se define un expediente mínimo con identidad, autoridad, alcance, tiempo, autenticación, sesión y cierre.
- [x] La elevación temporal reutiliza concesiones individuales base y no crea un carril paralelo.
- [x] Una elevación temporal exige `effective_from` y `effective_until` y no admite renovación silenciosa.
- [x] Una concesión no puede convertir `OPERATIONAL_ONLY` en base ni eliminar prerrequisitos de `BASE_AND_OPERATIONAL`.
- [x] Las denegaciones aplicables continúan prevaleciendo sobre una elevación positiva.
- [x] `service_role` permanece como capacidad técnica de servidor sin autorización empresarial automática.
- [x] Un dispositivo compartido no puede recibir privilegio humano por su principal técnico.
- [x] Una cuenta humana genérica o compartida queda bloqueada para acceso privilegiado.
- [x] Se materializan las cinco familias externas ya aprobadas, sin inventar accesos humanos actuales.
- [x] Proveedor, patrocinador, herramienta y credencial quedan separados de la autoridad interna.
- [x] Se define soporte remoto por sesión, objetivo, ventana y actor, con reautorización después de expiración.
- [x] Se impide replay de acciones privilegiadas después de pérdida de conectividad o expiración.
- [x] Se separa aprobación de cambio de aprobación de acceso.
- [x] `break-glass` y continuidad permanecen bajo `CONT-AUTH-002`.
- [x] La configuración protegida permanece reservada a `TI-AUTH-003`.
- [x] La protección detallada de información sensible permanece reservada a `TI-AUTH-004`.
- [x] La integración física de soporte remoto permanece bajo `TI-INT-003`.
- [x] Se reconcilia el AS-IS sin confundir piezas parciales con implementación completa.
- [x] Los hallazgos y pendientes conservan propietario y condición de salida explícitos.
- [x] Se reutiliza cobertura de prueba existente y se generan cero cambios TREQ.
- [x] La tarea permanece exclusivamente documental y no modifica Supabase, código, cuentas ni configuración.

---

#### 16. Continuidad

```text
ÚLTIMA TAREA APROBADA
TI-AUTH-001 — Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos
        ↓
TAREA ACTUAL APROBADA
TI-AUTH-002 — Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal
        ↓
SIGUIENTE TAREA RESERVADA
TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo
```

### [ ] TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo
### [ ] TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte
