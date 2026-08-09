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

### ✅ TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo

**Estado:** APROBADA  
**Tarea anterior:** `TI-AUTH-002 — Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal` — APROBADA  
**Tarea siguiente:** `TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte` — RESERVADA  
**Tipo de tarea:** documental; definición normativa y materializada del gobierno de autorización para consultar, proponer, aplicar, revertir, deshabilitar y automatizar cambios de configuración tecnológica sobre endpoints, redes, impresoras, aplicaciones, licencias y monitoreo  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/02_AUTORIZACION_Y_ACCESO_PRIVILEGIADO.md`  
**Artefactos producidos:** `TI-PROTECTED-CONFIGURATION-GOVERNANCE-CONTRACT-001`; `TI-PROTECTED-CONFIGURATION-AUTHORITY-MATRIX-001`; `TI-ENDPOINT-CONFIGURATION-PROTECTION-MATRIX-001`; `TI-NETWORK-CONFIGURATION-PROTECTION-MATRIX-001`; `TI-PRINT-CONFIGURATION-PROTECTION-MATRIX-001`; `TI-APPLICATION-CONFIGURATION-PROTECTION-MATRIX-001`; `TI-LICENSE-CONFIGURATION-PROTECTION-MATRIX-001`; `TI-MONITORING-CONFIGURATION-PROTECTION-MATRIX-001`; `TI-PROTECTED-CONFIGURATION-ASIS-RECONCILIATION-001`  
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, endpoints, redes, impresoras, aplicaciones, licencias, alertas, dashboards, proveedores, cuentas, permisos, secretos, integraciones ni configuración de Supabase  
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar qué configuración tecnológica queda protegida, qué autoridad se requiere para modificarla, cómo se conserva la segregación entre solicitud, aprobación, ejecución y verificación, qué evidencia debe acompañar cada cambio y cómo se preservan las fronteras con acceso privilegiado, gobierno de cambios, datos sensibles, activos, impresión, contratos comerciales y observabilidad.

---

#### 1. Resultado sustantivo

`TI-AUTH-003` queda definida con las siguientes decisiones obligatorias:

1. **Toda alteración de estado administrado de un endpoint, red, impresora, aplicación, licencia o monitoreo es una acción protegida cuando cambia comportamiento, seguridad, conectividad, disponibilidad, alcance, dependencia, enrutamiento, entitlement o capacidad de observación.**
2. Una configuración protegida no crea un nuevo modelo de autorización. Se resuelve mediante identidad, actor efectivo, permiso exacto, alcance, recurso, contexto, segregación, decisión y auditoría canónicos.
3. La autorización de configuración no sustituye el cambio tecnológico. Toda mutación queda correlacionada con `TI-DOM-009` y conserva su clase `STANDARD`, `NORMAL` o `EMERGENCY`, riesgo, autoridad, ventana, prueba, rollback y revisión posterior.
4. La aprobación de un cambio no concede privilegio. Cuando la ejecución requiera capacidad elevada, cuenta administrativa, soporte remoto o proveedor, deberá existir además una concesión o sesión válida conforme a `TI-AUTH-002`.
5. Un incidente, alerta, ticket, recomendación del fabricante, hallazgo de seguridad o necesidad operativa puede originar la propuesta, pero ninguno autoriza por sí solo la modificación.
6. El estado anterior, el cambio propuesto, el resultado aplicado y la verificación posterior deben permanecer distinguibles. Una pantalla o herramienta que solo muestre el estado final no constituye evidencia suficiente.
7. Los cambios estándar y de bajo riesgo pueden usar procedimiento preautorizado vigente, pero siguen exigiendo actor identificable, permiso, alcance, recurso, versión del procedimiento, evidencia y resultado.
8. Los cambios sensibles, de alto impacto o críticos conservan separación obligatoria entre ejecutor y autoridad final conforme a `TI-AUTH-001` y a la matriz de `TI-DOM-009`.
9. Un proveedor, fabricante, MDM, ISP, agente, adaptador, script, servicio del sistema o plataforma externa puede ejecutar únicamente el alcance autorizado; nunca se convierte en autoridad empresarial por disponer de capacidad técnica.
10. La automatización solo puede aplicar una mutación cuando el procedimiento exacto esté previamente autorizado y el principal técnico tenga alcance explícito. Una desviación fuera del cambio esperado detiene la automatización y vuelve al flujo de evaluación.
11. La lectura de configuración no sensible puede autorizarse como diagnóstico o administración ordinaria. La consulta de secretos, logs, exportaciones, capturas o datos personales permanece bajo `TI-AUTH-004`.
12. La compra, renovación, costo, contrato o selección comercial de una licencia no se autoriza desde esta tarea; `TI-DOM-012`, ORIGO y NUMERA conservan esas decisiones. Esta tarea protege únicamente la configuración y asignación técnica que corresponda.
13. La identidad física de activos, endpoints e impresoras permanece en sus dominios propietarios. Autorizar configuración no cambia custodia, propiedad ni identidad del objeto.
14. Se cierra documentalmente `H-TI-DOM-009-006`: las operaciones protegidas y la evidencia exigible quedan definidas antes de implementación física.
15. La implementación, integración con herramientas, enforcement físico y pruebas operativas permanecen fuera de esta fase documental y conservan destinos exactos ya existentes.

---

#### 2. Entradas canónicas conservadas

La tarea consume sin redefinir:

- `TI-AUTH-001`, para segregación entre solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar;
- `TI-AUTH-002`, para acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal;
- `TI-DOM-003`, incluidos `TI-ENDPOINT-LIFECYCLE-CONTRACT-001` y `TI-ENDPOINT-BASELINE-CONTRACT-001`;
- `TI-DOM-004`, incluidos arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de red;
- `TI-DOM-005`, incluidos las nueve identidades `PRN-*`, los bindings físicos y los handoffs con PRINT-ARC;
- `TI-DOM-006`, incluido el catálogo de diez aplicaciones, ambientes, dependencias, proveedores y licencias;
- `TI-DOM-009`, como única autoridad del ciclo de cambio tecnológico;
- `TI-DOM-010`, como autoridad de señales, salud, alertas, logs y correlación de observabilidad;
- `TI-DOM-012`, como autoridad comercial-tecnológica de licencias, asientos, contratos, renovaciones, uso y costos;
- `CAP-SCOPE-015`, que originó el alcance transversal de tecnología y los requisitos de prueba existentes;
- el modelo canónico de identidad, permisos, alcances, precedencia, denegaciones, decisiones y auditoría;
- PRINT-ARC para colas, routing, adaptadores, trabajos y resultados de impresión;
- NEXO para activos físicos, ubicación, custodia, mantenimiento y garantía;
- ORIGO y NUMERA para decisiones comerciales y económicas;
- BLOQUE T para release, prueba, despliegue y rollback;
- `TI-INT-001` a `TI-INT-003` para adaptadores, contratos e integraciones tecnológicas posteriores.

No se crean permisos locales, roles nuevos, un segundo catálogo de activos, un segundo registro de impresoras, una segunda fuente de aplicaciones, una segunda matriz de licencias ni una plataforma paralela de observabilidad.

---

#### 3. Frontera canónica de configuración protegida

Se fija:

```text
CONFIGURACION PROTEGIDA
≠
PRIVILEGIO

CONFIGURACION PROTEGIDA
≠
CAMBIO APROBADO

CONFIGURACION PROTEGIDA
≠
CREDENCIAL O SECRETO

CONFIGURACION PROTEGIDA
≠
ESTADO FISICO DEL ACTIVO

CONFIGURACION PROTEGIDA
≠
CONTRATO O COSTO

CONFIGURACION PROTEGIDA
≠
LOG O DATO SENSIBLE
```

La decisión efectiva se compone así:

```text
ACTOR AUTORIZADO
+ PERMISO EXACTO
+ ALCANCE Y RECURSO COMPATIBLES
+ CAMBIO VALIDO SEGUN TI-DOM-009
+ SEGREGACION APLICABLE
+ PRIVILEGIO VIGENTE CUANDO SEA NECESARIO
+ ESTADO ANTERIOR IDENTIFICABLE
+ DIFERENCIA PROPUESTA
+ PRUEBA Y ROLLBACK APLICABLES
+ SIN DENEGACION PREVALENTE
=
CONFIGURACION AUTORIZABLE
```

Un cambio puede estar aprobado y aun así no ser ejecutable si el actor carece del permiso, alcance o privilegio requerido. Del mismo modo, una persona con privilegio técnico no puede aplicar una configuración que no tenga cambio y autoridad válidos.

---

#### 4. `TI-PROTECTED-CONFIGURATION-GOVERNANCE-CONTRACT-001`

##### 4.1. Unidad protegida

La unidad de decisión es:

```text
actor
+ accion
+ familia de configuracion
+ recurso concreto
+ alcance
+ estado anterior
+ estado propuesto
+ ventana
+ cambio correlacionado
```

No se autoriza una familia completa de manera genérica cuando la operación requiere un recurso concreto.

##### 4.2. Acciones conceptuales protegidas

| Acción conceptual            | Resultado                                                       | Regla                                                                                    |
| ---------------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `CONSULTAR_CONFIGURACION`    | leer metadata o estado de configuración autorizado              | no concede mutación; la información sensible conserva las restricciones de `TI-AUTH-004` |
| `PROPONER_CONFIGURACION`     | preparar una diferencia o plan de cambio                        | no autoriza ejecución                                                                    |
| `APLICAR_CONFIGURACION`      | producir un estado técnico distinto                             | exige decisión de autorización y gobierno de cambio                                      |
| `REVERTIR_CONFIGURACION`     | aplicar el rollback aprobado o una recuperación controlada      | conserva actor, causa, estado previo, resultado y nueva verificación                     |
| `DESHABILITAR_CONFIGURACION` | retirar, pausar o desactivar una capacidad configurada          | se trata como mutación; no equivale a borrar historia                                    |
| `AUTOMATIZAR_CONFIGURACION`  | permitir que un principal técnico aplique un cambio predefinido | exige allowlist de procedimiento, recurso y alcance; cualquier desviación falla cerrado  |

Estas etiquetas son semántica documental y no crean claves de permiso nuevas. La implementación deberá mapearlas al catálogo canónico vigente sin inventar permisos.

##### 4.3. Invariantes

1. el estado deseado y el observado no se confunden;
2. una deriva detectada no autoriza su propia corrección;
3. una recomendación automática no se convierte en decisión;
4. un rollback no borra la evidencia de la configuración fallida;
5. una herramienta administrativa no define quién puede usarla;
6. una credencial o token no constituye autorización;
7. una configuración futura o programada no está activa antes de su ventana;
8. una configuración expirada o sustituida permanece en historial;
9. un recurso no identificado de forma inequívoca no puede modificarse;
10. un valor desconocido no se interpreta como global, permitido o seguro.

---

#### 5. `TI-PROTECTED-CONFIGURATION-AUTHORITY-MATRIX-001`

Se preserva exactamente la autoridad de `TI-DOM-009`; esta tarea añade únicamente la condición de autorización sobre configuración.

| Clase y riesgo      | Autoridad de cambio conservada                                                                                                                                     | Condición adicional para configuración                                                               | Separación                                             |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| `STANDARD / LOW`    | preautorización vigente del procedimiento bajo `RESPONSABLE_TECNOLOGICO`                                                                                           | actor, permiso, alcance, recurso, versión exacta del procedimiento y evidencia                       | según `TI-AUTH-001`; no se crea aprobador artificial   |
| `NORMAL / LOW`      | `RESPONSABLE_TECNOLOGICO`                                                                                                                                          | diferencia propuesta y recurso concretos                                                             | ejecutor dentro de autorización vigente                |
| `NORMAL / MEDIUM`   | `RESPONSABLE_TECNOLOGICO`; `RESPONSABLE_DEL_PROCESO` cuando exista efecto empresarial                                                                              | validar efecto funcional y rollback                                                                  | separar cuando el objeto o decisión protegida lo exija |
| `NORMAL / HIGH`     | `RESPONSABLE_TECNOLOGICO` + autoridad funcional aplicable; `COORDINACION_DE_OPERACIONES`; seguridad cuando sea sensible                                            | privilegio temporal cuando sea necesario y verificación independiente                                | ejecutor no emite solo la autoridad final              |
| `NORMAL / CRITICAL` | `RESPONSABLE_TECNOLOGICO` + `COORDINACION_DE_OPERACIONES` + autoridad funcional aplicable; `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA` cuando corresponda               | prueba, rollback, ventana, comunicación y evidencia reforzadas                                       | separación obligatoria de ejecución y autoridad final  |
| `EMERGENCY`         | autoridad técnica y de control aplicable; `COORDINACION_DE_OPERACIONES` en cambios críticos o sensibles; seguridad, propietario funcional y proveedor según riesgo | se acelera la decisión, no se eliminan identidad, alcance, evidencia, rollback ni revisión posterior | no existe bypass por urgencia                          |

Reglas adicionales:

- si la configuración modifica acceso o entitlement de una persona, también aplica `VPROC-0059`;
- si la ejecución requiere elevación, soporte remoto o proveedor, también aplica `TI-AUTH-002`;
- si la configuración afecta datos sensibles, la lectura de evidencia o contenido queda bajo `TI-AUTH-004`;
- un tercero nunca es aprobador empresarial final;
- quien aplica una modificación sensible no puede ser el único verificador de su propio resultado.

---

#### 6. `TI-ENDPOINT-CONFIGURATION-PROTECTION-MATRIX-001`

`TI-DOM-003` conserva identidad, lifecycle y baseline. Esta tarea protege las mutaciones sobre esa configuración.

| Configuración de endpoint     | Acción protegida                                               | Evidencia mínima                                                          | Frontera                                                |
| ----------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------- |
| baseline aplicable            | publicar, asignar o cambiar `baseline_id` o versión aplicable  | baseline anterior, nuevo baseline, endpoint, actor, cambio y resultado    | no cambia identidad física ni custodia                  |
| sistema operativo soportado   | cambiar política o versión objetivo                            | política anterior/nueva, compatibilidad, prueba y rollback                | despliegue físico posterior                             |
| parches y actualización       | cambiar política, canal, ventana o versión objetivo            | versión previa, objetivo, ventana, resultado y health posterior           | no equivale a parche aplicado con éxito                 |
| cifrado y bloqueo             | habilitar, endurecer, reducir o deshabilitar exigencias        | requisito anterior/nuevo, autoridad, prueba y estado posterior            | secretos y material criptográfico no se documentan aquí |
| aplicaciones administradas    | instalar, retirar o cambiar política de aplicación en endpoint | aplicación, versión, endpoint, causa, resultado y reversibilidad          | licencia y permiso empresarial permanecen separados     |
| administración remota / MDM   | enrolar o cambiar política de administración                   | endpoint, herramienta, alcance, actor, sesión privilegiada cuando aplique | integración física corresponde a `TI-INT-003`           |
| postura y health configurados | cambiar qué postura se evalúa o cómo se reporta                | perfil anterior/nuevo y resultado de comprobación                         | la señal y health se gobiernan en `TI-DOM-010`          |

No queda autorizado por esta tarea:

- inventar un `endpoint_id`;
- tratar `asset_id`, `device_id`, IP, MAC, serial o fingerprint como autorización;
- retirar o borrar un equipo por una simple modificación de baseline;
- exponer contraseñas, tokens, llaves o secretos;
- convertir un endpoint administrado en fuente de permisos del trabajador.

---

#### 7. `TI-NETWORK-CONFIGURATION-PROTECTION-MATRIX-001`

`TI-DOM-004` conserva arquitectura, inventario, segmentación y direccionamiento.

| Configuración de red              | Acción protegida                              | Evidencia mínima                                                  | Regla de seguridad                                             |
| --------------------------------- | --------------------------------------------- | ----------------------------------------------------------------- | -------------------------------------------------------------- |
| segmentación y finalidad          | cambiar segmento, VLAN o finalidad aprobada   | estado anterior, topología afectada, propuesta, prueba y rollback | una convivencia excepcional requiere justificación y autoridad |
| SSID y política de conectividad   | crear, cambiar, retirar o reasignar finalidad | SSID o referencia, finalidad, sedes, dependencias y resultado     | no registrar PSK, claves privadas o secretos                   |
| direccionamiento                  | cambiar rango, perfil o política de dirección | anterior/nuevo, recursos afectados y prueba                       | una IP conocida no concede administración                      |
| reserva DHCP / dirección estable  | crear, mover, cambiar o retirar una reserva   | recurso exacto, anterior/nuevo, conflicto comprobado y resultado  | la reserva debe corresponder al recurso autorizado             |
| router, switch o punto de acceso  | modificar configuración administrada          | equipo, versión o estado previo, diferencia, prueba y rollback    | la posesión de consola no concede autoridad                    |
| uplink, camino alterno o failover | cambiar ruta primaria o contingente           | dependencias, ventana, health anterior/posterior y retorno        | continuidad no se activa por una configuración no validada     |
| perfil de monitoreo de red        | cambiar señales o health esperados            | perfil anterior/nuevo y verificación                              | contenido sensible queda fuera de esta tarea                   |

Una alerta de red o una falla de proveedor puede originar el cambio, pero no autoriza modificar segmentación, direccionamiento o equipo de red sin la decisión aplicable.

---

#### 8. `TI-PRINT-CONFIGURATION-PROTECTION-MATRIX-001`

La tarea conserva las nueve identidades `PRN-*` aprobadas y no crea impresoras nuevas.

| Configuración de impresión        | Acción protegida                                              | Evidencia mínima                                          | Propiedad conservada                           |
| --------------------------------- | ------------------------------------------------------------- | --------------------------------------------------------- | ---------------------------------------------- |
| interfaz física o lógica          | cambiar LAN, Wi-Fi, USB, Bluetooth o puente local             | impresora exacta, interfaz anterior/nueva y prueba        | NEXO conserva activo físico                    |
| dirección estable / reserva       | cambiar IP o reserva asociada                                 | anterior/nuevo, recurso, red, prueba y rollback           | red permanece gobernada por `TI-DOM-004`       |
| driver                            | instalar, actualizar, cambiar o retirar versión               | versión anterior/nueva, compatibilidad y prueba de salida | no modifica plantilla ni trabajo               |
| firmware                          | actualizar, revertir o cambiar canal aprobado                 | versión, ventana, prueba y recuperación                   | requiere autoridad proporcional al riesgo      |
| binding técnico                   | cambiar relación entre impresora, endpoint, canal o adaptador | binding anterior/nuevo, dependencias y health             | PRINT-ARC conserva routing y adaptadores       |
| cola, ruta o fallback relacionado | cambiar asociación operativa                                  | ruta anterior/nueva, alcance, prueba y resultado          | PRINT-ARC conserva cola, job y receipt         |
| capacidades y medio esperado      | cambiar configuración que afecte salida                       | capacidad anterior/nueva y prueba aplicable               | el cambio no redefine el documento empresarial |

Reglas:

1. una impresora accesible por red no queda autorizada para uso por ese hecho;
2. un técnico que conoce la IP no puede reconfigurarla sin autoridad;
3. una prueba física satisfactoria no sustituye la aprobación del cambio;
4. un cambio de driver, firmware, IP, interfaz, adaptador o ruta no es una corrección informal;
5. el proveedor puede ejecutar bajo alcance temporal, pero no aprobar ni cerrar por sí solo.

---

#### 9. `TI-APPLICATION-CONFIGURATION-PROTECTION-MATRIX-001`

Se preservan exactamente las diez aplicaciones canónicas:

```text
shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass
```

La matriz aplica a cada una sin inferir que una superficie esté desplegada o que un proveedor comercial esté confirmado.

| Configuración de aplicación                 | Acción protegida                                         | Evidencia mínima                                                   | Frontera                                         |
| ------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------ |
| ambiente y superficie autorizada            | cambiar asociación de ambiente, URL o superficie         | valor anterior/nuevo, ambiente, propietario y prueba               | una URL observable no prueba despliegue          |
| repositorio / versión / release relacionada | cambiar referencia desplegable o versión objetivo        | versión anterior/nueva y correlación con BLOQUE T                  | release y cambio aprobado permanecen distintos   |
| dependencia técnica                         | añadir, cambiar o retirar dependencia administrada       | dependencia anterior/nueva, impacto y recuperación                 | no inventar dependencia por presencia de paquete |
| proveedor o integración técnica             | cambiar endpoint, adaptador o relación técnica           | proveedor/integración exactos, contrato técnico, prueba y rollback | proveedor no se convierte en fuente de autoridad |
| configuración runtime no secreta            | cambiar valor que afecte comportamiento o disponibilidad | clave conceptual, anterior/nuevo, ambiente y resultado             | secretos y credenciales quedan fuera             |
| activación o retiro operativo               | habilitar o deshabilitar capacidad configurada           | estado anterior/nuevo, impacto y confirmación                      | no sustituye decisión de continuidad de producto |
| configuración de cuenta técnica relacionada | cambiar vínculo o finalidad técnica                      | cuenta/principal exactos y autorización aplicable                  | ciclo privilegiado pertenece a `TI-AUTH-002`     |

Una variable visible en un repositorio, una configuración de proveedor o un panel administrativo no crea por sí misma una fuente canónica de configuración.

---

#### 10. `TI-LICENSE-CONFIGURATION-PROTECTION-MATRIX-001`

La licencia, el asiento, la cuenta, el permiso y el contrato permanecen objetos distintos.

| Configuración de licencia          | Acción protegida                                          | Evidencia mínima                                    | Autoridad que no se sustituye                     |
| ---------------------------------- | --------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------- |
| asignación de asiento              | asignar un entitlement técnico a sujeto autorizado        | sujeto, producto, entitlement, vigencia y resultado | aprobación de acceso cuando aplique               |
| reasignación                       | transferir asiento entre sujetos                          | origen, destino, causa y resultado                  | no crea autorización empresarial para el destino  |
| revocación técnica                 | retirar entitlement o asiento                             | sujeto, motivo, momento y verificación              | offboarding y acceso conservan sus procesos       |
| activación en aplicación/proveedor | habilitar capacidad técnica contratada                    | producto, ambiente, cuenta técnica y resultado      | contrato y costo siguen en `TI-DOM-012`           |
| integración de licenciamiento      | cambiar relación técnica o proveedor consumido            | anterior/nuevo, contrato técnico y prueba           | `TI-INT-003` conserva implementación de proveedor |
| parámetros de uso administrado     | cambiar configuración que afecte consumo o disponibilidad | anterior/nuevo, alcance y resultado                 | no modifica compra, renovación o presupuesto      |

Quedan fuera de esta tarea y no se autorizan aquí:

- seleccionar un proveedor;
- aceptar términos comerciales;
- comprar;
- renovar;
- modificar costo;
- aprobar compromiso o gasto;
- definir tratamiento contable.

Cuando una asignación de licencia otorgue además acceso funcional, deberá existir la decisión de acceso correspondiente; el asiento no sustituye el permiso.

---

#### 11. `TI-MONITORING-CONFIGURATION-PROTECTION-MATRIX-001`

`TI-DOM-010` conserva la semántica de señal, health, alerta, log y correlación. Esta tarea protege la configuración que determina qué se observa y cómo se actúa sobre la señal.

| Configuración de monitoreo                | Acción protegida                                        | Evidencia mínima                              | Riesgo controlado                            |
| ----------------------------------------- | ------------------------------------------------------- | --------------------------------------------- | -------------------------------------------- |
| fuente o collector                        | habilitar, deshabilitar o cambiar fuente de señal       | fuente anterior/nueva, recurso y verificación | dejar un servicio ciego                      |
| binding señal–recurso–servicio            | cambiar correlación                                     | relación anterior/nueva y prueba              | atribuir health al recurso equivocado        |
| perfil de health                          | cambiar reglas de derivación aplicables                 | perfil anterior/nuevo y ejemplos verificados  | salud falsa o inconsistente                  |
| regla de alerta                           | crear, modificar, retirar o deshabilitar                | regla anterior/nueva, alcance y prueba        | incidente no detectado o ruido               |
| umbral                                    | aumentar, reducir o cambiar condición                   | valor anterior/nuevo, razón y evidencia       | ocultar degradación o generar falsas alarmas |
| routing / escalamiento                    | cambiar destino, prioridad o ruta operativa de alertas  | ruta anterior/nueva y prueba                  | alerta sin responsable                       |
| mute / suppression / ventana              | activar o ampliar supresión                             | alcance, inicio, expiración y causa           | supresión permanente o accidental            |
| dashboard / vista operativa               | cambiar composición que represente health o alertas     | versión anterior/nueva y fuente               | tablero engañoso                             |
| política técnica de retención o colección | cambiar parámetros bajo una decisión propietaria válida | anterior/nuevo, autoridad y efecto            | pérdida de evidencia o exceso de recolección |

Límites:

- consultar logs, payloads, exportaciones, capturas o datos personales pertenece a `TI-AUTH-004`;
- silenciar una alerta no resuelve el incidente;
- cambiar un umbral no modifica por sí solo el SLA;
- un dashboard verde no prueba recuperación;
- una herramienta externa de monitoreo no se convierte en fuente empresarial de servicio, incidente o cambio.

---

#### 12. Automatización, deriva y remediación

##### 12.1. Detección de deriva

La diferencia entre estado deseado y observado se registra como señal o hallazgo. Por sí sola no autoriza mutación.

```text
DRIFT DETECTADO
→ IDENTIFICAR RECURSO
→ CLASIFICAR IMPACTO
→ CORRELACIONAR CAMBIO O PROCEDIMIENTO
→ AUTORIZAR
→ APLICAR
→ VERIFICAR
```

##### 12.2. Remediación automática

La remediación automática solo es admisible cuando:

- existe procedimiento `STANDARD` vigente y exacto;
- la operación y el recurso están en allowlist explícita;
- el principal técnico está identificado;
- el alcance está acotado;
- el estado previo es compatible con el procedimiento;
- la diferencia observada coincide con el patrón esperado;
- existe rollback o salida segura aplicable;
- la ejecución conserva evidencia y resultado.

Si el estado previo, la diferencia o el recurso no coinciden con la expectativa, la automatización no amplía la corrección. Debe detenerse y escalar a evaluación humana.

##### 12.3. Emergencia

`EMERGENCY` acelera el proceso de decisión de `TI-DOM-009`; no elimina:

- identidad;
- permiso;
- alcance;
- recurso;
- autoridad técnica;
- segregación aplicable;
- registro del estado previo;
- evidencia de ejecución;
- rollback cuando sea técnicamente posible;
- validación posterior;
- revisión post-implementación.

---

#### 13. Evidencia mínima y cierre

Toda modificación protegida deberá poder reconstruir como mínimo:

```text
caso o cambio correlacionado
familia de configuracion
recurso exacto
actor solicitante
actor aprobador cuando aplique
actor ejecutor
actor verificador cuando aplique
permiso y alcance evaluados
sesion privilegiada cuando aplique
estado anterior
diferencia propuesta
procedimiento o version aplicable
ventana
resultado de aplicacion
prueba posterior
rollback aplicado o disponible
estado posterior verificado
incidente o desviacion si existio
timestamp y correlacion de auditoria
```

No se exige que todos estos datos residan en una sola tabla. La obligación es conservar correlación suficiente entre las fuentes propietarias.

Criterios de cierre:

1. el resultado técnico coincide con el cambio aprobado o se registra la desviación;
2. la prueba posterior fue ejecutada por el actor habilitado;
3. la salud o función relevante fue comprobada;
4. los efectos no deseados se transfieren a un caso propietario;
5. el rollback, si fue utilizado, queda registrado como hecho y no borra el intento anterior;
6. un proveedor entrega evidencia pero no declara por sí solo el cierre empresarial;
7. un cambio sensible no se cierra exclusivamente con evidencia del mismo ejecutor.

---

#### 14. Límites con tareas y dominios vecinos

| Tema                                                   | Esta tarea define                                 | Propietario conservado                            |
| ------------------------------------------------------ | ------------------------------------------------- | ------------------------------------------------- |
| segregación                                            | aplicación a configuración protegida              | `TI-AUTH-001`                                     |
| privilegio, cuenta técnica y soporte remoto            | prerequisito cuando la ejecución lo necesita      | `TI-AUTH-002`                                     |
| contenido sensible de diagnóstico                      | no se amplía                                      | `TI-AUTH-004`                                     |
| cambio, ventana, riesgo, aprobación, prueba y rollback | se consumen                                       | `TI-DOM-009`                                      |
| endpoint y baseline                                    | autorización sobre mutaciones                     | `TI-DOM-003`                                      |
| red, segmentación y direccionamiento                   | autorización sobre mutaciones                     | `TI-DOM-004`                                      |
| impresora física y binding                             | autorización sobre mutaciones                     | `TI-DOM-005`; NEXO; PRINT-ARC                     |
| aplicación, ambiente y dependencia                     | autorización sobre mutaciones                     | `TI-DOM-006`; BLOQUE T                            |
| licencia, contrato y costo                             | configuración técnica únicamente                  | `TI-DOM-012`; ORIGO; NUMERA                       |
| señal, health y alerta                                 | autorización de configuración                     | `TI-DOM-010`                                      |
| adaptadores y proveedores técnicos                     | contrato de autorización consumible               | `TI-INT-001` a `TI-INT-003`                       |
| enforcement físico de autorización                     | contrato de decisión consumido por implementación | `AUTH-DB-034` y paquetes autorizados              |
| evidencia de autorización                              | correlación requerida                             | `AUTH-DB-032` y gobierno transversal de auditoría |

---

#### 15. `TI-PROTECTED-CONFIGURATION-ASIS-RECONCILIATION-001`

La línea base documental y técnica disponible se reconcilia sin declarar implementaciones no demostradas.

| Familia      | Estado documental actual | Evidencia disponible                                                                        | Decisión de esta tarea                                                                        | Destino físico exacto                                                            |
| ------------ | ------------------------ | ------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| endpoints    | `ESPECIFICADO`           | lifecycle, baseline, desired/observed configuration y postura definidos en `TI-DOM-003`     | autorización de sus mutaciones queda `ESPECIFICADO`                                           | `AUTH-DB-034`; `TI-INT-003` para MDM/administración remota; paquete E5 aplicable |
| redes        | `ESPECIFICADO`           | arquitectura, segmentación, direccionamiento y monitoring handoff definidos en `TI-DOM-004` | autorización de configuración queda `ESPECIFICADO`                                            | `AUTH-DB-034`; `TI-INT-001`; `TI-INT-003`; paquete E5 aplicable                  |
| impresoras   | `ESPECIFICADO`           | nueve `PRN-*`, estado físico, bindings y handoffs definidos en `TI-DOM-005`                 | autorización de IP, interfaz, driver, firmware, binding, ruta y fallback queda `ESPECIFICADO` | `AUTH-DB-034`; PRINT-ARC; `TI-INT-002`; `TI-INT-003`                             |
| aplicaciones | `ESPECIFICADO`           | diez aplicaciones, ambientes, dependencias y proveedores técnicos definidos en `TI-DOM-006` | autorización de configuración técnica queda `ESPECIFICADO`                                    | `AUTH-DB-034`; BLOQUE T; `SHELL-CI-020` a `SHELL-CI-024`                         |
| licencias    | `ESPECIFICADO`           | contrato de licencias/asientos y reconciliación comercial definidos en `TI-DOM-012`         | asignación y configuración técnica quedan protegidas sin alterar autoridad comercial          | `AUTH-DB-034`; `TI-INT-003`; paquetes ORIGO/NUMERA cuando corresponda            |
| monitoreo    | `ESPECIFICADO`           | contrato de observabilidad, señales, health y alertas definidos en `TI-DOM-010`             | configuración de fuentes, reglas, umbrales, routing y supresión queda `ESPECIFICADO`          | `AUTH-DB-034`; `TI-INT-001` a `TI-INT-003`                                       |

Estado físico transversal:

```text
CONTRATO DOCUMENTAL DE AUTORIZACION DE CONFIGURACION = ESPECIFICADO
IMPLEMENTACION TRANSVERSAL DEL CONTRATO = FUERA_DE_ALCANCE EN ESTA FASE
VALIDACION OPERATIVA / REMOTA / FISICA = FUERA_DE_ALCANCE EN ESTA FASE
```

La existencia actual de un modelo genérico de aplicaciones, permisos, alcances y concesiones individuales no se presenta como evidencia de que las seis familias ya apliquen este contrato de configuración de extremo a extremo.

---

#### 16. Brecha `H-TI-DOM-009-006`

Estado anterior:

```text
PENDIENTE_DE_EVIDENCIA
```

Decisión de `TI-AUTH-003`:

```text
ESPECIFICADO
```

Condición documental de salida satisfecha:

- seis familias protegidas delimitadas;
- acciones protegidas definidas;
- autoridad preservada por clase de cambio;
- vínculo con privilegio definido;
- segregación definida;
- evidencia antes/durante/después definida;
- automatización y emergencia delimitadas;
- destinos de implementación identificados;
- fronteras con `TI-AUTH-004`, dominios propietarios y fuentes comerciales preservadas.

La implementación física no se declara realizada.

---

#### 17. Cobertura de prueba vigente consumida

La tarea consume requisitos existentes que ya protegen el comportamiento materializado:

- `TREQ-SHELL-010`, para administración tecnológica de aplicaciones, endpoints, cuentas, licencias, privilegio, actor, alcance y evidencia;
- `TREQ-NEXO-019`, para configuración de elementos tecnológicos, red e impresión y para cambios de IP, driver, firmware, red o configuración con autorización, estado anterior, prueba y resultado;
- `TREQ-INTEGRATION-020`, para correlación y operación segura de redes, endpoints, impresoras, licencias, monitoreo, MDM, proveedores y adaptadores;
- `TREQ-VISO-002`, para mantener el caso tecnológico y la autorización del diagnóstico dentro del proceso de soporte cuando corresponda.

La tarea parametriza esas reglas existentes sobre las seis familias y no cambia el actor autorizado, el límite territorial, el efecto persistente protegido, el mecanismo de seguridad ni el comportamiento ante error ya cubiertos por esos requisitos.

---

#### 18. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

Justificación: `CAP-SCOPE-015` ya creó la cobertura transversal necesaria para tecnología y asignó expresamente estas reglas a las tareas `TI-AUTH-*`. `TI-AUTH-003` materializa los casos de configuración previstos dentro de esa cobertura, sin introducir una regla ejecutable nueva que requiera otro identificador. Tampoco modifica, difiere, descarta u obsolete requisitos existentes.

---

#### 19. Criterios de aceptación

- [x] La tarea cubre exactamente endpoints, redes, impresoras, aplicaciones, licencias y monitoreo.
- [x] No crea un modelo de autorización paralelo.
- [x] No crea una clasificación de riesgo paralela a `TI-DOM-009`.
- [x] Conserva `STANDARD`, `NORMAL` y `EMERGENCY`.
- [x] Distingue aprobación de cambio y privilegio de ejecución.
- [x] Conserva la segregación de `TI-AUTH-001`.
- [x] Consume el ciclo privilegiado de `TI-AUTH-002`.
- [x] Mantiene secretos y datos sensibles fuera del alcance de esta tarea.
- [x] Protege configuración de baseline, parcheo, cifrado, aplicaciones y administración remota de endpoints.
- [x] Protege segmentación, SSID, direccionamiento, reservas y configuración administrada de red.
- [x] Protege IP, interfaz, driver, firmware, binding, ruta y fallback de impresión.
- [x] Protege ambientes, dependencias y configuración runtime no secreta de aplicaciones.
- [x] Protege asignación y revocación técnica de licencias sin asumir autoridad comercial.
- [x] Protege fuentes, health, alertas, umbrales, routing y supresión de monitoreo.
- [x] Define comportamiento de automatización y deriva.
- [x] Define evidencia mínima de antes, diferencia, ejecución, prueba, rollback y estado posterior.
- [x] Define destinos exactos para la implementación física posterior.
- [x] Cierra documentalmente `H-TI-DOM-009-006`.
- [x] Crea 0 requisitos de prueba y modifica 0 requisitos existentes.
- [x] No realiza código, migraciones, DDL, DML, cambios de Supabase ni configuración real.
- [x] Mantiene `TI-AUTH-004` únicamente como tarea siguiente reservada.

---

#### 20. Continuidad

```text
ÚLTIMA TAREA APROBADA
TI-AUTH-002 — Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal
        ↓
TAREA ACTUAL APROBADA
TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo
        ↓
SIGUIENTE TAREA RESERVADA
TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte
```


### ✅ TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte

**Estado:** APROBADA  
**Tarea anterior:** `TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo` — APROBADA  
**Tarea siguiente:** `TI-UX-001 — Diseñar portal simple de soporte para trabajadores dentro de ANIMA` — RESERVADA  
**Tipo de tarea:** documental; definición normativa y materializada de autorización, minimización, redacción, manejo de secretos, acceso a logs, exportación, captura, divulgación y evidencia sensible dentro del soporte tecnológico  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/02_AUTORIZACION_Y_ACCESO_PRIVILEGIADO.md`  
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, políticas desplegadas, secretos, cuentas, logs, herramientas de monitoreo, integraciones, notificaciones, Storage ni configuración de Supabase  
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar las reglas que impiden que el diagnóstico y el soporte tecnológico conviertan tickets, mensajes, logs, exportaciones, capturas, adjuntos, notificaciones o sesiones con proveedores en canales de exposición de secretos o datos personales; separar cada acción sensible de la mera capacidad técnica de observar un sistema; y definir qué puede conocerse, copiarse, transmitirse, conservarse, compartir con terceros o convertirse en evidencia bajo finalidad, alcance, autorización, minimización y trazabilidad verificables.

---

#### 1. Resultado sustantivo

`TI-AUTH-004` queda definida con las siguientes decisiones obligatorias:

1. **Diagnosticar no equivale a conocer todo el contenido disponible técnicamente.** La investigación debe obtener únicamente los datos necesarios para la finalidad del caso.
2. **Ver un recurso, exportarlo, capturarlo, adjuntarlo, compartirlo, enviarlo a un proveedor y publicarlo como conocimiento son acciones distintas.** Cada una exige una decisión de autorización compatible con el objeto, clasificación, finalidad, destinatario y alcance.
3. Los artefactos de diagnóstico de `VPROC-0058` se tratan como evidencia restringida; no se convierten en anexos de libre circulación por pertenecer a un ticket de soporte.
4. El ticket, sus mensajes y la clasificación operativa no son depósitos de secretos. Nunca se registra deliberadamente en ellos el valor completo de contraseñas, tokens, claves privadas, códigos de recuperación, OTP, cookies de sesión, credenciales privilegiadas, secretos de proveedor o materiales equivalentes.
5. Los logs operativos conservan contexto suficiente para correlación y diagnóstico, pero omiten o protegen el contenido sensible que no sea necesario.
6. Un dato personal observable durante soporte no queda autorizado para reutilización, exportación, entrenamiento, publicación, mensajería o conocimiento por el solo hecho de haber sido visible durante el diagnóstico.
7. La persona técnica, el proveedor, la herramienta de soporte remoto, la cuenta privilegiada y el principal técnico no adquieren autoridad empresarial sobre la información a la que pueden llegar técnicamente.
8. La redacción o minimización produce una vista derivada para soporte o divulgación; no destruye ni altera la evidencia original cuando esta deba preservarse por auditoría, investigación, retención o hold.
9. Toda divulgación a proveedor o tercero se limita al mínimo conjunto necesario, se vincula con un caso y finalidad, usa un canal autorizado y conserva evidencia de quién autorizó, qué se entregó y cuándo dejó de ser necesario.
10. Los accesos temporales a evidencia conservan autorización previa, vigencia, expiración y nueva evaluación antes de ser emitidos nuevamente.
11. La captura de pantalla, fotografía, grabación o exportación no demuestra por sí sola autenticidad, integridad ni cierre; su valor depende de procedencia, correlación, clasificación, custodia y controles de evidencia.
12. Las notificaciones de soporte se consideran una superficie de divulgación: su contenido debe minimizarse y no podrá transportar secretos o datos sensibles innecesarios.
13. Se conserva la separación entre incidente de servicio, incidente de seguridad e incidente de continuidad; pueden correlacionarse, pero no se fusionan para ampliar visibilidad.
14. `TI-AUTH-004` cierra la protección específica del soporte tecnológico sin absorber el gobierno empresarial general de clasificación, privacidad, retención, investigación, exportación o disposición que pertenece al bloque de gobierno de información.
15. La tarea cierra documentalmente el mini-bloque `TI-AUTH-001` a `TI-AUTH-004`; la siguiente continuidad pertenece a experiencia de soporte y permanece reservada.

---

#### 2. Entradas canónicas conservadas

La tarea consume y conserva, sin redefinirlas:

- `TI-AUTH-001`, para responsabilidad tecnológica, segregación, acumulaciones permitidas y decisiones que exigen autoridad separada;
- `TI-AUTH-002`, para acceso privilegiado, cuentas técnicas, proveedores, soporte remoto, elevación temporal, expiración y revocación;
- `TI-AUTH-003`, para autorización de cambios sobre configuración tecnológica;
- `TI-DOM-007`, para solicitud, incidente, prioridad, comunicación, validación y cierre;
- `TI-DOM-010`, para señales, salud, alertas, logs, correlación, evidencia y observabilidad;
- `CAP-SCOPE-015`, especialmente las brechas de secretos y datos sensibles dentro de tickets, capturas, mensajería y soporte;
- `CAP-SCOPE-016`, para clasificación, finalidad, minimización, datos personales, acceso sensible, exportación, auditoría, retención, investigación y protección de evidencia;
- `VPROC-0058 — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento`;
- la arquitectura transversal `EVID-ARC` para evidencia, adjuntos, acceso temporal, auditoría, retención y disposición;
- el modelo canónico de identidad, actor efectivo, rol, permiso, alcance, contexto, privilegio, denegación y auditoría;
- los requisitos de prueba vigentes que ya protegen administración tecnológica, exposición sensible en soporte, información restringida, evidencia, integraciones y auditoría.

No se crea una política paralela de privacidad, un catálogo alterno de clasificación, un segundo repositorio de evidencia ni una lista local de cargos autorizados.

---

#### 3. Frontera de autorización

Se fija la separación:

```text
CAPACIDAD TECNICA DE OBSERVAR
≠
AUTORIZACION PARA CONOCER
≠
AUTORIZACION PARA COPIAR
≠
AUTORIZACION PARA EXPORTAR
≠
AUTORIZACION PARA CAPTURAR
≠
AUTORIZACION PARA COMPARTIR
≠
AUTORIZACION PARA PUBLICAR
```

Y también:

```text
TICKET
≠
LOG
≠
DIAGNOSTICO
≠
CAPTURA
≠
EXPORTACION
≠
EVIDENCIA PRESERVADA
≠
SECRETO
≠
DATO PERSONAL
```

Una credencial privilegiada puede permitir técnicamente abrir un recurso. Esa capacidad no constituye autorización empresarial para leer todo su contenido, copiarlo o entregarlo a otra persona.

---

#### 4. Regla de acceso a diagnóstico sensible

Una acción humana que revele información sensible de soporte será autorizable únicamente cuando converjan, como mínimo:

```text
IDENTIDAD HUMANA ACTIVA
+
ACTOR EFECTIVO VIGENTE
+
PERMISO EXACTO
+
CASO, CAMBIO O INVESTIGACION CORRELACIONADOS CUANDO APLIQUE
+
FINALIDAD EXPLICITA Y VIGENTE
+
RECURSO EXACTO
+
CLASIFICACION CONOCIDA O TRATADA CONSERVADORAMENTE
+
ALCANCE MINIMO NECESARIO
+
PRIVILEGIO VIGENTE CUANDO LA OPERACION LO EXIJA
+
SEGREGACION Y AUTORIDAD APLICABLES
+
SIN DENEGACION PREVALENTE
=
ACCESO SENSIBLE AUTORIZABLE
```

Si falta una guarda obligatoria, el acceso sensible no avanza por conveniencia operativa.

---

#### 5. Familias protegidas

| Familia          | Objeto protegido                                                                                                                         | Riesgo principal                                                             | Regla de protección                                                                                     |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Diagnósticos     | hipótesis, comprobaciones, trazas correlacionadas, datos técnicos y resultado de investigación                                           | exposición excesiva durante la búsqueda de causa                             | recolectar y revelar solo lo necesario para responder una hipótesis o decisión concreta                 |
| Logs             | registros estructurados, eventos, errores, telemetría y contexto técnico                                                                 | secretos o datos personales en texto claro; lectura masiva sin finalidad     | acceso por recurso, ventana, finalidad y permiso; contenido minimizado y correlacionable                |
| Exportaciones    | subconjuntos de logs, datos, configuraciones, reportes o evidencias extraídos de su superficie original                                  | copia durable fuera del control original                                     | definir destinatario, finalidad, campos, clasificación, canal, vigencia, custodia y cierre              |
| Capturas         | pantallas, fotografías, grabaciones, recortes y artefactos visuales                                                                      | captura incidental de información ajena al caso                              | capturar la mínima región necesaria, redactar lo no pertinente y conservar procedencia                  |
| Secretos         | contraseñas, tokens, claves, OTP, códigos de recuperación, cookies, credenciales privilegiadas y materiales equivalentes                 | toma de control, persistencia de acceso y propagación en canales secundarios | nunca registrar deliberadamente el valor completo; referenciar identidad, estado o ubicación controlada |
| Datos personales | identificadores, contacto, relación laboral, datos financieros, salud, comportamiento y demás información personal observable en soporte | tratamiento fuera de finalidad, divulgación y persistencia innecesaria       | finalidad, minimización, clasificación y acceso exacto antes de revelar o conservar                     |

Las seis familias se gobiernan juntas cuando aparecen en un mismo caso, pero mantienen identidad y controles independientes.

---

#### 6. Clasificación mínima dentro de `VPROC-0058`

Se conserva la clasificación ya materializada en la arquitectura de evidencia:

| Artefacto de soporte | Clasificación vigente | Decisión de esta tarea                                                      |
| -------------------- | --------------------- | --------------------------------------------------------------------------- |
| ticket               | `S2_CONFIDENTIAL`     | visible únicamente dentro del alcance autorizado del proceso                |
| clasificación y SLA  | `S2_CONFIDENTIAL`     | no amplía visibilidad sobre diagnóstico o evidencia                         |
| diagnóstico          | `S3_RESTRICTED`       | exige acceso restringido y finalidad de diagnóstico                         |
| workaround           | `S2_CONFIDENTIAL`     | debe omitir secretos y datos innecesarios                                   |
| conocimiento         | `S2_CONFIDENTIAL`     | solo material sanitizado puede reutilizarse como conocimiento               |
| cierre               | `S2_CONFIDENTIAL`     | conserva resultado y evidencia suficiente sin duplicar material restringido |

Si un artefacto contiene material cuya clasificación aplicable sea superior o más restrictiva, prevalece el tratamiento más protector.

---

#### 7. Matriz de autoridad por actor

| Actor o función                              | Puede hacer                                                                                  | Condición                                                               | No puede asumir                                                                                                  |
| -------------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `TRABAJADOR`                                 | reportar síntomas, aportar evidencia mínima y revisar la parte de su caso que le corresponda | identidad y contexto válidos                                            | acceso a logs internos, secretos, datos de terceros o diagnósticos restringidos por ser solicitante              |
| `RESPONSABLE_TECNOLOGICO`                    | ejecutar diagnóstico autorizado, correlacionar señales y consultar evidencia necesaria       | permiso, recurso, caso, alcance y finalidad compatibles                 | lectura indiscriminada, autoampliación de privilegio, divulgación libre o uso secundario de datos                |
| `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`       | intervenir cuando exista riesgo de seguridad, secreto o exposición                           | autoridad y alcance exactos                                             | acceso permanente o ilimitado por el nombre de la función                                                        |
| `RESPONSABLE_DEL_PROCESO`                    | aportar contexto empresarial y validar recuperación                                          | conocer únicamente lo necesario para validar el resultado               | obtener logs completos, secretos o evidencia técnica restringida sin autorización específica                     |
| `GERENCIA_O_SUPERVISION_DE_SEDE`             | aportar contexto territorial y afectación                                                    | sede y finalidad compatibles                                            | ampliar el diagnóstico a otras sedes, personas o recursos                                                        |
| autoridad aprobadora aplicable               | decidir cuando la acción o el umbral estén reservados                                        | objeto y regla de segregación correspondientes                          | sustituir al ejecutor técnico o conceder acceso fuera del alcance aprobado                                       |
| `TECNICO_O_PRESTADOR_EXTERNO` / `PROVEEDOR`  | recibir y producir material técnico mínimo para el trabajo autorizado                        | patrocinio interno, caso, sesión, alcance, vigencia y canal autorizados | convertirse en propietario del dato, aprobador, custodio indefinido o receptor de datasets completos por defecto |
| servicio, automatización o principal técnico | recolectar, correlacionar o transportar señales expresamente permitidas                      | finalidad técnica, allowlist, identidad técnica y alcance               | representar autoridad humana o transformar telemetría en permiso empresarial                                     |

---

#### 8. Diagnóstico por capas

El diagnóstico debe avanzar desde la alternativa menos intrusiva hacia la más sensible.

| Capa                        | Contenido permitido                                                                | Condición para avanzar                                        |
| --------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| 1. estado y metadata mínima | disponibilidad, código de error, health, versión, identificadores no sensibles     | suficiente para descartar o confirmar hipótesis sin contenido |
| 2. contexto estructurado    | timestamps, correlación, recurso, actor o principal técnico, operación y resultado | la hipótesis exige contexto adicional                         |
| 3. log restringido          | fragmento temporal y del recurso exacto                                            | finalidad concreta y permiso de acceso sensible               |
| 4. contenido de evidencia   | adjunto, payload o detalle restringido necesario                                   | no existe alternativa menos invasiva y el caso lo justifica   |
| 5. material de tercero      | subconjunto sanitizado para proveedor o especialista                               | autorización de divulgación, destinatario y canal controlados |

No se empieza por copiar el dataset más amplio disponible.

---

#### 9. Contrato de acceso a logs

Todo acceso humano a logs de soporte deberá conservar, cuando aplique:

- identidad del actor;
- caso, cambio, incidente o investigación correlacionados;
- servicio y recurso;
- ambiente;
- intervalo temporal;
- finalidad;
- clasificación;
- permiso y alcance;
- privilegio o elevación cuando sea necesaria;
- filtros utilizados;
- resultado del acceso;
- evidencia de exportación o divulgación si ocurrió;
- cierre o terminación de la necesidad.

Los logs no constituyen una nueva fuente de verdad de los hechos empresariales. Sirven para diagnóstico, correlación, auditoría y reconstrucción dentro de su finalidad.

---

#### 10. Contenido permitido y contenido prohibido en logs ordinarios

El registro técnico debe favorecer:

- identificadores estables;
- códigos de resultado;
- categorías de error;
- timestamps;
- correlación;
- recurso;
- ambiente;
- versión;
- principal técnico o actor cuando corresponda;
- hashes o fingerprints no reversibles cuando el contrato aplicable lo permita;
- tamaños, conteos o estados necesarios;
- campos estructurados de contexto mínimo.

Queda prohibido registrar deliberadamente en texto claro, salvo que una política canónica superior exija preservación controlada en una evidencia distinta:

- contraseñas;
- tokens completos;
- claves privadas;
- secretos de API;
- credenciales de `service_role`;
- OTP;
- códigos de recuperación de MFA;
- cookies de sesión;
- secretos embebidos en URLs;
- encabezados completos que contengan autorización;
- variables de entorno completas;
- PSK o credenciales de infraestructura;
- datos de pago completos;
- datos personales completos cuando identificadores minimizados sean suficientes.

---

#### 11. Redacción y minimización

La regla general será:

```text
CONTENIDO ORIGINAL CONTROLADO
→ CLASIFICAR
→ IDENTIFICAR FINALIDAD
→ SELECCIONAR SOLO LO NECESARIO
→ REDACTAR O PSEUDONIMIZAR LO AJENO A LA FINALIDAD
→ PRODUCIR VISTA DERIVADA
→ AUTORIZAR DESTINATARIO Y CANAL
→ REGISTRAR DIVULGACION
```

La redacción no autoriza alterar destructivamente el original que deba conservarse. Cuando exista una investigación, hold o obligación de preservación, se mantiene el original bajo custodia y se comparte únicamente la vista derivada autorizada.

---

#### 12. Reglas para datos personales durante soporte

1. No se utilizarán datos personales productivos por comodidad cuando una reproducción sintética, anonimizada o mínima sea suficiente.
2. El diagnóstico conserva la finalidad del caso; un dato observado incidentalmente no puede reutilizarse.
3. El técnico no recopila campos ajenos a la hipótesis.
4. Una búsqueda por persona debe tener recurso, relación y finalidad autorizados antes de revelar resultados.
5. Listados masivos de trabajadores, clientes, proveedores o transacciones no son la respuesta predeterminada a un incidente puntual.
6. La presencia de un dato en una interfaz visible para el usuario no autoriza su copia a un canal de soporte.
7. El contenido de terceros que aparezca en una pantalla debe redactarse cuando no sea necesario para el diagnóstico.
8. La publicación en conocimiento debe eliminar nombres, contactos, identificadores personales, secretos y referencias incidentales que no aporten a la solución general.
9. Las métricas derivadas del soporte deben preferir agregados y categorías antes que contenido individual.
10. El acceso extraordinario conserva justificación, mínimo alcance, vigencia y auditoría.

---

#### 13. Exportaciones

Una exportación de soporte solo será autorizable cuando pueda responder de forma verificable:

- qué caso o investigación la origina;
- quién la solicita;
- quién la autoriza cuando corresponda;
- quién la produce;
- cuál es la finalidad;
- qué recursos y campos exactos incluye;
- qué intervalo temporal cubre;
- qué clasificación aplica;
- qué datos se excluyeron o redactaron;
- quién es el destinatario;
- qué canal está autorizado;
- cuánto tiempo sigue siendo necesaria;
- cómo se verifica la recepción;
- qué obligación de custodia o disposición aplica.

Una exportación no hereda automáticamente toda la autoridad de la superficie origen. Su copia crea una nueva superficie de custodia que debe seguir controlada.

---

#### 14. Capturas, fotografías y grabaciones

Toda captura de soporte deberá cumplir:

1. capturar el mínimo contexto visual que demuestre el síntoma o resultado;
2. excluir zonas no relacionadas con el caso;
3. redactar secretos y datos personales ajenos a la finalidad;
4. evitar mostrar notificaciones, pestañas, conversaciones o aplicaciones de terceros si no son relevantes;
5. conservar fecha, actor, caso y recurso correlacionados cuando sea evidencia;
6. distinguir una captura original controlada de una versión sanitizada;
7. no usar una captura como sustituto de registros canónicos que ya existan;
8. impedir que una imagen compartida con proveedor revele más información que el conjunto de datos autorizado;
9. no convertir fotografías o videos informales en el único soporte de una decisión sensible;
10. aplicar controles de retención y disposición equivalentes a su clasificación.

---

#### 15. Adjuntos y archivos de diagnóstico

Los adjuntos usados como evidencia conservan el contrato transversal de evidencia:

- tipo permitido mediante allowlist versionada;
- tamaño máximo según política aplicable;
- fingerprint del archivo;
- estado de validación o escaneo requerido;
- clasificación;
- caso y proceso correlacionados;
- actor y finalidad;
- custodia;
- acceso temporal cuando corresponda.

Un archivo no se vuelve confiable por estar adjunto a un ticket. La validación de archivo y la autorización de contenido son controles independientes.

---

#### 16. Acceso temporal a evidencia

Cuando una evidencia se exponga mediante acceso temporal:

1. la autorización ocurre antes de emitir el acceso;
2. el acceso es efímero;
3. existe TTL obligatorio;
4. el recurso y destinatario quedan limitados;
5. una nueva emisión exige nueva autenticación y autorización;
6. la expiración no elimina las reglas de retención del objeto original;
7. una URL firmada o mecanismo equivalente no sustituye el permiso empresarial;
8. el acceso expirado no puede reutilizarse mediante caché, historial o reintento.

---

#### 17. Secretos

Se considera secreto o material equivalente cualquier valor cuya posesión pueda autenticar, autorizar, firmar, recuperar, impersonar o ampliar acceso técnico.

Incluye, entre otros:

- contraseñas;
- tokens de acceso o refresh;
- API keys;
- claves privadas;
- certificados privados;
- cookies de sesión;
- OTP;
- códigos de recuperación;
- secretos internos de webhook o funciones;
- credenciales de servicio;
- credenciales privilegiadas;
- PSK;
- capability URLs con vigencia activa;
- materiales de recuperación.

La identidad o existencia de un secreto puede referenciarse mediante un identificador, propietario, sistema, estado, fecha de rotación o ubicación controlada cuando ello sea necesario. El valor no se copia al caso.

---

#### 18. Respuesta ante exposición accidental de un secreto

Si durante soporte aparece un secreto en un ticket, mensaje, log, captura, exportación o adjunto:

1. se detiene su propagación;
2. se restringe el artefacto afectado;
3. no se reproduce el valor en comentarios, mensajes o conocimiento;
4. se identifica el tipo de secreto y su propietario sin copiar el valor;
5. se activa la revocación, rotación o invalidación mediante la autoridad propietaria cuando corresponda;
6. se preserva únicamente la evidencia necesaria de que la exposición ocurrió y fue contenida;
7. se revisan copias y destinatarios correlacionados;
8. el caso conserva el resultado de contención y cierre sin volver a revelar el secreto.

La gestión técnica del secreto no convierte a soporte en propietario del ciclo empresarial de credenciales.

---

#### 19. Proveedores y terceros

Un proveedor solo recibe información cuando:

```text
CASO AUTORIZADO
+
PATROCINADOR INTERNO
+
FINALIDAD CONCRETA
+
RECURSO Y ALCANCE EXACTOS
+
CLASIFICACION COMPATIBLE
+
MINIMIZACION O REDACCION
+
CANAL AUTORIZADO
+
VENTANA VIGENTE
+
TRAZABILIDAD DE ENTREGA
=
DIVULGACION AUTORIZABLE
```

Reglas adicionales:

- no se comparte un conjunto completo para que el proveedor "busque qué pasa";
- no se entregan secretos de VENTO como mecanismo normal de soporte;
- el proveedor usa su identidad y acceso autorizado conforme a `TI-AUTH-002`;
- el proveedor no obtiene propiedad sobre el ticket, la evidencia ni los datos;
- el material devuelto por el proveedor se clasifica antes de incorporarlo como evidencia;
- el cierre del trabajo incluye terminación de accesos y custodia que ya no sean necesarios;
- una herramienta de soporte remoto no autoriza capturar o transferir todo lo visible en pantalla.

---

#### 20. Diferencia entre soporte remoto y divulgación de información

`TI-AUTH-002` gobierna quién puede abrir una sesión privilegiada o de proveedor. `TI-AUTH-004` gobierna qué información puede revelarse durante esa sesión.

Por tanto:

```text
SESION REMOTA AUTORIZADA
≠
DATOS ILIMITADOS AUTORIZADOS
```

y:

```text
PRIVILEGIO VIGENTE
≠
PERMISO DE EXPORTAR
```

El técnico puede estar correctamente autenticado y aun así carecer de autorización para copiar, capturar o divulgar determinada información.

---

#### 21. Notificaciones y mensajería

Los canales de notificación de soporte deben tratar el contenido como una superficie independiente de divulgación.

Reglas:

1. el asunto o preview debe contener el mínimo contexto necesario para avisar;
2. no se incluyen secretos;
3. no se incluyen datos personales sensibles si un identificador de caso o mensaje genérico es suficiente;
4. no se proyecta un diagnóstico restringido completo en una notificación;
5. la notificación no sustituye la autorización para abrir el caso;
6. un destinatario que pueda recibir una alerta no queda autorizado a conocer todo el ticket;
7. el contenido debe ser compatible con la exposición potencial en pantalla bloqueada, historial del sistema operativo o proveedor push.

---

#### 22. Conocimiento derivado de soporte

Una solución de soporte puede convertirse en conocimiento reutilizable únicamente después de separar:

- patrón técnico reutilizable;
- procedimiento;
- versión o ambiente relevante;
- síntomas generales;
- pasos de resolución;
- datos específicos del caso;
- secretos;
- identidades personales;
- información contractual o interna innecesaria.

La base de conocimiento conserva el patrón general y elimina el contenido sensible que no sea necesario para resolver casos futuros.

---

#### 23. Evidencia, integridad y custodia

Una captura, log o exportación usada como evidencia debe conservar:

- referencia al caso o investigación;
- origen;
- fecha;
- actor o principal técnico;
- clasificación;
- fingerprint cuando aplique;
- resultado de validación del archivo cuando aplique;
- relación con el recurso;
- transformaciones o redacciones aplicadas;
- acceso y divulgaciones relevantes;
- retención o hold aplicables;
- resultado de disposición cuando llegue a ser elegible.

La evidencia sanitizada para compartir conserva relación con el original controlado sin convertir la copia derivada en fuente competidora.

---

#### 24. Retención y disposición

Para la evidencia de soporte se conserva la política `RET_ACTIVE_CASE`.

Esta tarea no inventa una duración temporal que las fuentes vigentes no han fijado.

Mientras la duración permanezca sin definición materializada:

- el estado se conserva como `PENDIENTE_DE_EVIDENCIA` respecto de la duración;
- el bloqueo concreto es la ausencia de una regla empresarial aprobada de tiempo;
- el propietario documental de cierre es `INFO-DOM-006`;
- la condición de salida es una política vigente que defina disparador, duración, excepciones, hold y disposición para la clase correspondiente.

Antes de cualquier disposición se verifica hold. Una evidencia preservada por investigación o obligación aplicable no se elimina por el mero cierre operativo del ticket.

---

#### 25. Auditoría e investigación

El soporte debe poder reconstruir, según la sensibilidad de la acción:

- quién consultó;
- qué recurso;
- desde qué contexto;
- para qué finalidad;
- qué permiso o decisión lo habilitó;
- qué filtro o alcance se aplicó;
- qué resultado obtuvo;
- si produjo exportación, captura o divulgación;
- quién recibió material;
- qué redacción ocurrió;
- qué acceso temporal se emitió;
- cuándo terminó la necesidad;
- qué evidencia quedó preservada.

El gobierno empresarial general de investigación, chain of custody, acceso extraordinario y evidencia preservada permanece bajo `INFO-DOM-013` e `INFO-AUTH-004`.

---

#### 26. Incidente de servicio, seguridad y continuidad

Se mantiene:

```text
INCIDENTE DE SERVICIO
≠
INCIDENTE DE SEGURIDAD
≠
INCIDENTE DE CONTINUIDAD
```

Un mismo hecho puede requerir correlación entre los tres.

- `VPROC-0058` conserva la restauración del servicio tecnológico;
- una exposición, secreto comprometido o acceso impropio activa el tratamiento de seguridad correspondiente;
- una afectación que supere umbrales de operación mínima o recuperación se correlaciona con continuidad;
- la correlación conserva identificadores y evidencia, no duplica el mismo contenido sensible en todos los expedientes.

---

#### 27. Frontera con gobierno de información

`TI-AUTH-004` protege el uso de información dentro del soporte tecnológico.

No absorbe las decisiones empresariales generales que permanecen en:

- `INFO-DOM-002`, para clasificación y sensibilidad;
- `INFO-DOM-006`, para retención, hold y disposición;
- `INFO-DOM-010`, para gobierno general de compartición y exportación externa;
- `INFO-DOM-013`, para auditoría, investigación e integridad de evidencia;
- `INFO-AUTH-001`, para autorización general por clasificación, finalidad, identidad, relación, recurso, territorio y estado;
- `INFO-AUTH-002`, para información sensible y acciones de copia, impresión, exportación o compartición;
- `INFO-AUTH-004`, para auditoría, investigación, acceso extraordinario, logs y evidencia preservada.

Las tareas futuras pueden ampliar el gobierno transversal sin rebajar las protecciones específicas fijadas aquí.

---

#### 28. Frontera con otras tareas tecnológicas

| Tema                                              | Propietario   | Límite de `TI-AUTH-004`                                                                 |
| ------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------- |
| roles, responsabilidades y segregación            | `TI-AUTH-001` | consume las autoridades ya aprobadas                                                    |
| privilegio, proveedor, soporte remoto y elevación | `TI-AUTH-002` | gobierna la información revelada durante el acceso, no la sesión en sí                  |
| configuración protegida                           | `TI-AUTH-003` | gobierna evidencia y datos sensibles producidos al consultar o cambiar configuración    |
| experiencia del trabajador                        | `TI-UX-001`   | no diseña pantallas                                                                     |
| observabilidad                                    | `TI-DOM-010`  | no redefine señales, health o alertas; protege su contenido y acceso                    |
| integraciones de soporte remoto y proveedores     | `TI-INT-003`  | no diseña adaptadores ni mecanismos de integración                                      |
| evidencia transversal                             | `EVID-ARC`    | reutiliza sus contratos de archivo, acceso temporal, auditoría, retención y disposición |

---

#### 29. Reconciliación AS-IS verificable

La inspección técnica disponible permite clasificar el estado actual sin extrapolar más allá de la evidencia observada.

| Superficie observada                                                         | Evidencia actual                                                                                                        | Estado frente a esta tarea | Decisión                                                                                                      |
| ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Edge Function `support-message-notify`                                       | usa credencial de servicio en servidor y un secreto interno para autorizar la invocación                                | `IMPLEMENTADO_PARCIAL`     | la existencia de autenticación técnica no demuestra por sí sola minimización del contenido                    |
| preview de mensaje de soporte en push                                        | el flujo inspeccionado construye el cuerpo de la notificación con hasta 120 caracteres del mensaje                      | `PENDIENTE_DE_EVIDENCIA`   | debe demostrarse que el contenido enviado al proveedor push satisface clasificación, minimización y redacción |
| redacción previa al preview push                                             | en el archivo inspeccionado no se observa una etapa explícita de clasificación o redacción antes de construir el cuerpo | `PENDIENTE_DE_EVIDENCIA`   | no se afirma ausencia global; se identifica únicamente la falta de demostración en este flujo concreto        |
| reglas documentales de logging seguro                                        | `TI-DOM-010` ya prohíbe valores sensibles en logs ordinarios                                                            | `ESPECIFICADO`             | `TI-AUTH-004` añade autorización de lectura, copia, captura y divulgación                                     |
| evidencia de soporte                                                         | arquitectura `EVID-ARC` define clasificación, validación de archivos, acceso temporal y auditoría                       | `ESPECIFICADO`             | se reutiliza sin crear un repositorio paralelo                                                                |
| política temporal exacta de retención de soporte                             | `RET_ACTIVE_CASE` existe, pero la duración no está materializada                                                        | `PENDIENTE_DE_EVIDENCIA`   | cierre documental asignado a `INFO-DOM-006`                                                                   |
| controles físicos completos de exportación, captura y divulgación de soporte | no se demuestran integralmente mediante las fuentes inspeccionadas                                                      | `PENDIENTE_DE_EVIDENCIA`   | la implementación se decide únicamente dentro del alcance de implementación autorizado que corresponda        |

---

#### 30. Destino de los pendientes detectados

| Pendiente                                                      | Bloqueo concreto                                                                      | Propietario o destino exacto                                                                                    | Condición de salida                                                                                          |
| -------------------------------------------------------------- | ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| minimización/redacción del preview push                        | el flujo inspeccionado proyecta contenido del mensaje y no demuestra redacción previa | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` para decidir inclusión física en el paquete prioritario | decisión explícita de alcance; si aplica al paquete, control implementado y probado antes de exposición real |
| duración de retención de evidencia de soporte                  | `RET_ACTIVE_CASE` no fija duración verificable en las fuentes consumidas              | `INFO-DOM-006`                                                                                                  | duración, disparador, excepciones, hold y disposición aprobados                                              |
| gobierno empresarial general de exportaciones y compartición   | esta tarea solo protege el contexto de soporte                                        | `INFO-DOM-010`; `INFO-AUTH-002`                                                                                 | contrato empresarial general materializado sin degradar las reglas de soporte                                |
| investigación, auditoría e integridad de evidencia             | falta gobierno transversal completo fuera del soporte                                 | `INFO-DOM-013`; `INFO-AUTH-004`                                                                                 | contrato transversal de investigación, auditoría y evidencia preservada materializado                        |
| integración concreta de herramienta remota o proveedor técnico | mecanismo productivo no pertenece a esta tarea                                        | `TI-INT-003`                                                                                                    | integración definida con autenticación, alcance, auditoría y salida                                          |
| controles físicos no demostrados para todas las superficies    | fase actual es documental                                                             | etapa de implementación que resulte autorizada por el plan canónico                                             | implementación y evidencia real en repositorio, servicio y ambiente aplicables                               |

Ningún pendiente habilita una excepción temporal a las reglas documentales aprobadas.

---

#### 31. Hallazgos de descubrimiento que quedan cubiertos

`TI-AUTH-004` materializa la respuesta documental específica de soporte para:

- `H-CAP-SCOPE-015-021`, respecto de credenciales, tokens, códigos de recuperación y diagnóstico sensible que podrían propagarse por tickets, capturas o mensajería;
- `H-CAP-SCOPE-015-032`, respecto de logs, capturas y exportaciones de soporte que podrían revelar información personal, secretos, direcciones o información financiera;
- `H-CAP-SCOPE-015-034`, respecto de la separación y correlación entre incidentes de servicio, seguridad y continuidad;
- `H-CAP-SCOPE-016-027`, respecto de logs, tickets, capturas y eventos que podrían contener secretos o datos personales innecesarios.

Los componentes generales de privacidad, retención, auditoría e investigación conservan sus propietarios del bloque de gobierno de información.

---

#### 32. Cobertura de pruebas existente

La regla protegida de esta tarea ya dispone de cobertura contractual vigente en el registro canónico, incluyendo:

- `TREQ-SHELL-010`, para administración tecnológica sin conflar cuenta, permiso, credencial, secreto, licencia, endpoint, dispositivo o sesión;
- `TREQ-SHELL-011`, para acceso, búsqueda, copia, impresión, exportación, compartición y administración de información según identidad, finalidad, clasificación, recurso, relación, territorio, estado, destinatario y acción;
- `TREQ-VISO-002`, para evitar exponer logs, IP y detalles sensibles antes de un diagnóstico autorizado;
- `TREQ-VISO-003`, para proteger investigación y evidencia sin exponer logs completos o datos innecesarios;
- `TREQ-INTEGRATION-020`, para operación tecnológica e integraciones sin almacenar secretos en tickets ni convertir adaptadores en maestros;
- `TREQ-INTEGRATION-021`, para ciclo de información, documentos y evidencia frente a copias, terceros, revocación, retención y reconciliación;
- `TREQ-SUPABASE-013`, para la integridad y confiabilidad de evidencia y auditoría que no puede depender de registros mutables sin control;
- requisitos `AUTH` vigentes que protegen identidad, contexto, privilegio, segregación, acceso extraordinario y auditoría.

La tarea amplía casos documentales dentro de esas reglas existentes y no altera su identidad ni su regla protegida.

---

#### 33. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

Justificación: las reglas verificables de acceso sensible, ocultamiento de diagnóstico, protección de secretos, tratamiento de evidencia, exportación, divulgación, integraciones y auditoría ya están protegidas por requisitos vigentes equivalentes. Esta tarea materializa casos y decisiones específicas del soporte tecnológico sin cambiar la regla empresarial, el mecanismo de seguridad protegido ni el riesgo que exigirían una identidad de prueba nueva.

---

#### 34. Criterios de aceptación

- [x] La tarea protege explícitamente diagnósticos.
- [x] La tarea protege explícitamente logs.
- [x] La tarea protege explícitamente exportaciones.
- [x] La tarea protege explícitamente capturas.
- [x] La tarea protege explícitamente secretos.
- [x] La tarea protege explícitamente datos personales.
- [x] Ver, copiar, exportar, capturar, compartir y publicar quedan separados.
- [x] El diagnóstico restringido conserva finalidad, recurso y alcance mínimo.
- [x] La posesión de privilegio técnico no se interpreta como permiso sobre toda la información.
- [x] El proveedor no adquiere autoridad empresarial.
- [x] La sesión remota no concede divulgación ilimitada.
- [x] Los logs ordinarios excluyen deliberadamente secretos y datos innecesarios.
- [x] Los datos personales se minimizan antes de copiarse a canales de soporte.
- [x] Las capturas se limitan al área necesaria y admiten vista sanitizada.
- [x] Los adjuntos conservan validación, fingerprint, clasificación y correlación.
- [x] El acceso temporal exige autorización previa y vigencia.
- [x] Los secretos no se almacenan deliberadamente en ticket, mensaje o conocimiento.
- [x] La exposición accidental de un secreto tiene contención y destino de revocación o rotación.
- [x] La divulgación a proveedor exige destinatario, finalidad, alcance y canal.
- [x] Las notificaciones se reconocen como superficie de divulgación.
- [x] La base de conocimiento elimina contenido específico sensible del caso.
- [x] La evidencia sanitizada no destruye el original que deba preservarse.
- [x] `RET_ACTIVE_CASE` se conserva sin inventar duración.
- [x] Los pendientes tienen bloqueo, propietario y condición de salida.
- [x] Se separan incidente de servicio, seguridad y continuidad.
- [x] Se conserva la frontera con el bloque de gobierno de información.
- [x] Se conserva la frontera con `TI-AUTH-002` y `TI-AUTH-003`.
- [x] Se conserva la frontera con `EVID-ARC`.
- [x] La reconciliación AS-IS distingue evidencia observada de inferencias no demostradas.
- [x] La tarea no realiza cambios físicos.
- [x] La tarea crea cero requisitos nuevos y modifica cero existentes.
- [x] `TI-UX-001` queda únicamente reservada.

---

#### 35. Estado del resultado

| Resultado material                            | Estado                                    |
| --------------------------------------------- | ----------------------------------------- |
| gobierno de diagnóstico sensible              | `ESPECIFICADO`                            |
| clasificación de artefactos de soporte        | `ESPECIFICADO`                            |
| matriz de autoridad de diagnóstico            | `ESPECIFICADO`                            |
| control de acceso a logs                      | `ESPECIFICADO`                            |
| control de exportaciones y capturas           | `ESPECIFICADO`                            |
| manejo de secretos                            | `ESPECIFICADO`                            |
| minimización y redacción                      | `ESPECIFICADO`                            |
| divulgación a proveedores y terceros          | `ESPECIFICADO`                            |
| ciclo de evidencia sensible                   | `ESPECIFICADO`                            |
| reconciliación AS-IS                          | `ESPECIFICADO`                            |
| duración temporal exacta de `RET_ACTIVE_CASE` | `PENDIENTE_DE_EVIDENCIA` — `INFO-DOM-006` |
| implementación física de controles            | `FUERA_DE_ALCANCE`                        |
| cambios de código, Supabase o proveedores     | `NO_APLICA`                               |

---

#### 36. Continuidad

```text
ÚLTIMA TAREA APROBADA
TI-AUTH-003 — Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo
        ↓
TAREA ACTUAL APROBADA
TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte
        ↓
SIGUIENTE TAREA RESERVADA
TI-UX-001 — Diseñar portal simple de soporte para trabajadores dentro de ANIMA
```

