### MINI-BLOQUE — ALCANCE VACANTES Y EXPEDIENTE

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **alcance vacantes y expediente** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-TAL-001` a `CAP-TAL-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-TAL-001`: Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA
- `CAP-TAL-002`: Diseñar publicación de vacantes, consulta y postulación en TALENTO
- `CAP-TAL-003`: Diseñar expediente progresivo de datos, documentos, consentimiento y conservación
<!-- PLAN-SECTION-META:END -->

### ✅ CAP-TAL-001 — Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA

**Estado:** APROBADA 
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `OPS-B2B-001 — Diseñar el proceso objetivo de venta B2B del Centro de Producción` — APROBADA  
**Siguiente tarea reservada:** `CAP-TAL-002 — Diseñar publicación de vacantes, consulta y postulación en TALENTO`  
**Artefacto producido:** `CAP-TAL-DOMAIN-BOUNDARIES-001`  
**Procesos canónicos principales:** `VPROC-0005` y `VPROC-0006`  
**Procesos relacionados:** `VPROC-0007`, `VPROC-0011`, `VPROC-0059`, `VPROC-0060` y `VPROC-0065`  
**Naturaleza:** arquitectura funcional, gobierno de dominio y contrato de responsabilidades  
**Cambios en código, datos, migraciones, RLS, RPC, Supabase, aplicaciones o acceso productivo:** no autorizados

---

#### 1. Propósito

Definir la frontera canónica entre `TALENTO`, `VISO` y `ANIMA` para que la
organización pueda gestionar la captación, selección, vinculación, activación,
experiencia laboral y cierre de una persona sin:

- confundir candidato con trabajador;
- duplicar identidades o expedientes;
- permitir que una postulación cree por sí sola un vínculo laboral;
- permitir que una invitación de acceso cree por sí sola un empleado;
- mezclar evaluación de selección con administración laboral;
- copiar documentos, notas o datos sensibles entre aplicaciones sin finalidad;
- asignar sede, área, rol o permisos desde una superficie no autorizada;
- cerrar un handoff mientras existan resultados parciales o inconsistentes;
- obligar a convertir toda alta laboral en una postulación ficticia;
- mantener rutas legacy que eludan la autoridad empresarial definida.

Esta tarea establece **qué pertenece a cada dominio, quién conserva la verdad,
qué proyecciones puede consumir cada aplicación y qué decisiones no puede tomar**.
No diseña todavía el detalle de pantallas, estados, documentos, entrevistas,
ofertas, funciones de handoff ni período de prueba; esas materias quedan en
`CAP-TAL-002` a `CAP-TAL-006`.

---

#### 2. Decisión canónica

```text
TALENTO
→ PERSONA CANDIDATA
→ POSTULACIÓN Y PROCESO DE SELECCIÓN
→ EVIDENCIA PRELABORAL
→ PRE-INGRESO

VISO
→ NECESIDAD DE PERSONAL
→ VACANTE AUTORIZADA
→ AUTORIDAD DE SELECCIÓN Y CONTRATACIÓN
→ CONDICIONES DE VINCULACIÓN
→ REGISTRO LABORAL, ASIGNACIONES Y PERMISOS
→ PROGRAMACIÓN, ADMINISTRACIÓN Y CIERRE

ANIMA
→ EXPERIENCIA DEL TRABAJADOR YA ACTIVADO
→ CONSULTA Y ACCIONES PERSONALES
→ TURNOS PUBLICADOS, ASISTENCIA Y PENDIENTES
→ DOCUMENTOS Y COMUNICACIONES LABORALES AUTORIZADAS
```

Por tanto:

```text
PERSONA ≠ CANDIDATO ≠ POSTULACIÓN ≠ EMPLEADO ≠ VÍNCULO LABORAL

VACANTE PUBLICADA ≠ AUTORIZACIÓN DE CONTRATAR

CANDIDATO APROBADO ≠ OFERTA AUTORIZADA

OFERTA ACEPTADA ≠ EMPLEADO ACTIVO

EMPLEADO ACTIVO ≠ ACCESO ANIMA PROVISIONADO

INVITACIÓN ANIMA ≠ DECISIÓN LABORAL

MISMO USUARIO DE AUTH ≠ MISMO EXPEDIENTE FUNCIONAL
```

La persona podrá mantener una identidad enlazada entre dominios, pero cada
registro conservará propósito, estado, autorización, retención y propietario
propios.

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- cierre documental de BLOQUE E1;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001`;
- `OPS-CAN-001`, `OPS-LOG-001` y `OPS-B2B-001`;
- `VPROC-0005 — Planear dotación y ejecutar selección sin mezclar necesidad
  laboral, candidato y trabajador activo`;
- `VPROC-0006 — Orquestar vinculación, expediente, incorporación, preparación y
  habilitación inicial de la persona`;
- `VPROC-0007 — Administrar asignaciones laborales y programación publicada con
  historial y revisión controlada`;
- `VPROC-0011 — Orquestar retiro laboral, devolución, revocación de accesos y
  cierre documental`;
- `VPROC-0059 — Gestionar el ciclo de acceso tecnológico desde solicitud hasta
  revocación y verificación`;
- `VPROC-0060 — Gestionar documentos y evidencia desde creación hasta disposición
  con metadatos y custodia`;
- `VPROC-0065 — Acompañar desempeño y desarrollo`;
- el modelo aprobado de identidad, rol base, rol operativo, sede, área, turno,
  check-in, permisos, denegaciones y dispositivo compartido;
- la prohibición de autorizar únicamente por el nombre del rol;
- la separación entre iniciador, ejecutor, supervisor y aprobador;
- las reglas de privacidad, firma, evidencia, idempotencia, auditoría y
  revocación ya aprobadas.

Las definiciones existentes en repositorios de aplicaciones se consideran
**evidencia AS-IS o drafts técnicos**, no una autorización para conservar
fronteras incorrectas en el modelo objetivo.

---

#### 4. Glosario canónico

| Concepto                   | Definición                                                     | Regla                                                                    |
| -------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------ |
| persona                    | sujeto humano identificable dentro del ecosistema              | no implica que sea candidato, trabajador, cliente o usuario activo       |
| identidad de autenticación | principal técnico mediante el cual una persona accede          | no sustituye el vínculo funcional ni concede permisos por existir        |
| candidato                  | persona con perfil prelaboral en TALENTO                       | no posee todavía autoridad ni derechos de trabajador por ese solo estado |
| postulación                | candidatura concreta a una vacante o proceso                   | puede coexistir con otras postulaciones sin duplicar la persona          |
| vacante empresarial        | necesidad de personal aprobada y gobernada por VISO            | no equivale a la publicación visible en TALENTO                          |
| publicación de vacante     | proyección autorizada para consulta y postulación              | TALENTO no altera silenciosamente la necesidad o condiciones aprobadas   |
| decisión de selección      | resultado empresarial sobre una postulación                    | requiere autoridad VISO y evidencia de TALENTO                           |
| oferta                     | propuesta laboral versionada y autorizada                      | su aceptación no crea por sí sola el vínculo laboral                     |
| pre-ingreso                | preparación anterior a la activación laboral formal            | no se llamará período de prueba si todavía no existe vínculo laboral     |
| empleado                   | identidad laboral creada o reactivada por autoridad competente | no se genera por una postulación, invitación o correo aislado            |
| episodio laboral           | período concreto de vínculo, desde activación hasta cierre     | un reingreso genera episodio y aprovisionamiento nuevos                  |
| trabajador activo          | empleado con episodio vigente y condiciones habilitantes       | puede utilizar ANIMA según permisos y estado de acceso                   |
| invitación de acceso       | mecanismo para activar o recuperar credenciales                | no crea ni aprueba la relación laboral                                   |
| handoff                    | transición trazable entre selección y vínculo laboral          | debe ser autorizado, idempotente, recuperable y auditable                |

---

#### 5. Frontera temporal del ciclo de vida

```text
PERSONA INTERESADA
→ CANDIDATO
→ POSTULACIÓN
→ EVALUACIÓN Y DECISIÓN
→ OFERTA AUTORIZADA
→ RESPUESTA DEL CANDIDATO
→ PRE-INGRESO COMPLETO
→ ACTIVACIÓN LABORAL AUTORIZADA
→ EMPLEADO Y EPISODIO LABORAL VIGENTES
→ ACCESO ANIMA HABILITADO
→ EXPERIENCIA LABORAL
→ RETIRO O CIERRE
```

Reglas:

1. TALENTO puede terminar en rechazo, retiro, pausa, expiración o readiness de
   vinculación sin crear un empleado.
2. VISO es la autoridad que aprueba la decisión laboral, las condiciones, la
   fecha efectiva y la activación del vínculo.
3. ANIMA comienza como experiencia funcional cuando existe trabajador activado y
   acceso permitido; no comienza cuando se crea una postulación.
4. El cierre de una postulación como contratada no borra el historial prelaboral.
5. El cierre de un vínculo laboral no borra a la persona ni sus postulaciones
   históricas.
6. El período de prueba, si jurídicamente ya existe relación laboral, pertenece al
   dominio laboral administrado por VISO y consumido por ANIMA.

---

#### 6. Matriz maestra de responsabilidad

| Capacidad o verdad                             | Propietario funcional                                  | Consumidores autorizados                           | Prohibición principal                                        |
| ---------------------------------------------- | ------------------------------------------------------ | -------------------------------------------------- | ------------------------------------------------------------ |
| necesidad de dotación y requisición            | VISO                                                   | TALENTO mediante proyección aprobada               | TALENTO no inventa headcount, cargo, sede o presupuesto      |
| vacante empresarial aprobada                   | VISO                                                   | TALENTO, reportes y canales autorizados            | una publicación no modifica la autorización fuente           |
| publicación y experiencia de vacante           | TALENTO                                                | candidato y canales aprobados                      | no publicar borradores, vencidas o no autorizadas            |
| identidad y perfil prelaboral                  | TALENTO                                                | VISO por proyección mínima y autorizada            | ANIMA no accede a notas o datos de selección                 |
| postulación y etapa de selección               | TALENTO                                                | VISO y evaluadores asignados                       | VISO no crea copias locales competidoras del expediente      |
| consentimiento prelaboral                      | TALENTO                                                | VISO solo cuando la finalidad lo exige             | no reutilizar consentimiento laboral o comercial             |
| documentos de selección                        | TALENTO                                                | revisores autorizados                              | no transferir automáticamente notas o soportes temporales    |
| entrevista, prueba y evaluación                | TALENTO                                                | responsables asignados y VISO                      | el evaluador no autoaprueba contratación                     |
| decisión final de selección                    | VISO                                                   | TALENTO para comunicar el resultado                | TALENTO no convierte score o recomendación en contratación   |
| condiciones y autorización de oferta           | VISO                                                   | TALENTO para presentación versionada               | el candidato no altera cargo, sede, fecha, salario o alcance |
| respuesta a la oferta                          | TALENTO                                                | VISO                                               | aceptación no activa permisos ni crea empleado               |
| checklist de pre-ingreso                       | TALENTO con requisitos emitidos por VISO               | VISO y candidato                                   | no mezclar documentos laborales posteriores sin regla        |
| registro de empleado y episodio laboral        | VISO y dominio laboral compartido                      | ANIMA, NUMERA y consumidores autorizados           | TALENTO no administra al trabajador activo                   |
| sede, área, rol base, rol operativo y permisos | VISO y autorización canónica                           | ANIMA y aplicaciones consumidoras                  | ANIMA o TALENTO no se autoasignan privilegios                |
| provisión y revocación de acceso               | VISO autoriza; plataforma ejecuta                      | ANIMA y demás aplicaciones                         | una invitación no crea autoridad laboral                     |
| experiencia móvil del trabajador               | ANIMA                                                  | trabajador y managers con alcance                  | ANIMA no reemplaza el backoffice VISO                        |
| planeación y publicación de turnos             | VISO                                                   | ANIMA consume y permite acciones acotadas          | ANIMA no se convierte en planner gerencial completo          |
| asistencia y acciones personales               | ANIMA como superficie; dominio laboral conserva hechos | VISO y trabajador                                  | una corrección móvil no altera historia sin autorización     |
| documentos laborales vigentes                  | VISO y custodia documental                             | ANIMA mediante proyección mínima                   | TALENTO no conserva copias laborales sin finalidad           |
| período de prueba y continuidad                | VISO                                                   | ANIMA para experiencia y pendientes                | TALENTO no trata trabajador contratado como candidato activo |
| desempeño y desarrollo                         | VISO                                                   | ANIMA mediante vistas y acciones autorizadas       | notas de selección no se reutilizan como evaluación laboral  |
| retiro y offboarding                           | VISO                                                   | ANIMA, plataforma, NEXO y demás dominios afectados | ninguna app declara cierre integral de forma aislada         |

La propiedad funcional no obliga a que cada verdad viva físicamente en una base
separada. Obliga a que exista **un único escritor autorizado y un contrato de
lectura o comando explícito para los demás consumidores**.

---

#### 7. Alcance de TALENTO

##### 7.1. Responsabilidades obligatorias

TALENTO conservará:

- experiencia pública o autenticada de consulta de vacantes;
- identidad prelaboral y perfil del candidato;
- una o más postulaciones vinculadas a la misma persona;
- fuente, campaña o canal de captación;
- estados y línea de tiempo del proceso de selección;
- requisitos, tareas y próxima acción del candidato;
- documentos y evidencias propios de selección;
- agenda y confirmación de entrevistas o validaciones;
- resultados y recomendaciones de evaluadores, con visibilidad controlada;
- comunicaciones con el candidato;
- consentimiento, finalidad y tratamiento prelaboral;
- respuesta a ofertas presentadas mediante una versión autorizada;
- checklist de pre-ingreso anterior al alta laboral;
- historial de rechazo, retiro, expiración, pausa o contratación;
- enlace formal con el episodio laboral cuando el handoff finalice.

##### 7.2. Superficies posibles

El dominio TALENTO podrá exponerse mediante:

- aplicación del candidato;
- portal o landing de vacantes;
- módulo interno de reclutamiento;
- proyecciones dentro de VISO;
- integraciones con canales aprobados.

La ubicación física de una pantalla no cambia la propiedad del dato. Un panel de
reclutamiento alojado técnicamente dentro de VISO seguirá operando mediante el
contrato de TALENTO y no creará una segunda fuente de verdad.

##### 7.3. Acciones prohibidas

TALENTO no podrá:

- crear o aprobar headcount por sí solo;
- publicar vacantes sin autorización empresarial vigente;
- contratar automáticamente por score, checklist o etapa;
- asignar rol base, rol operativo, sede, área o permisos laborales;
- crear turnos, asistencia, nómina, desempeño o offboarding;
- transferir todas las notas y documentos al expediente laboral;
- marcar una persona como trabajadora activa por aceptación de oferta;
- activar ANIMA o credenciales sin autorización laboral;
- sobrescribir la decisión o condiciones conservadas por VISO.

---

#### 8. Alcance de VISO

##### 8.1. Responsabilidades obligatorias

VISO conservará la autoridad administrativa sobre:

- necesidad de personal y requisición de dotación;
- empresa, sede, área, cargo y justificación de la vacante;
- presupuesto, rango o condiciones internas aplicables;
- aprobación, suspensión, cierre y reapertura de vacantes;
- designación de responsables, evaluadores y aprobadores;
- reglas de selección aplicables al cargo;
- decisión empresarial final de avanzar, rechazar o contratar;
- contenido autorizado de la oferta y sus versiones;
- fecha efectiva y condiciones de vinculación;
- alta o reactivación del empleado y del episodio laboral;
- sede, área, rol base, rol operativo, alcance y permisos iniciales;
- requisitos laborales, documentos vigentes y custodia administrativa;
- planeación y publicación de turnos;
- período de prueba, continuidad, cambios y decisiones laborales;
- retiro, offboarding y revocación coordinada.

##### 8.2. Uso de información de TALENTO

VISO podrá recibir una proyección de:

- candidato y postulación;
- cumplimiento de requisitos;
- resultados autorizados de entrevistas o evaluaciones;
- alertas, SLA y bloqueos;
- oferta presentada y respuesta;
- readiness de pre-ingreso.

No recibirá por defecto:

- notas internas sin finalidad aprobada;
- documentos temporales no laborales;
- datos médicos detallados cuando baste un resultado de aptitud permitido;
- datos de otras postulaciones sin relación con la decisión;
- consentimientos reutilizados para otra finalidad.

##### 8.3. Acciones prohibidas

VISO no podrá:

- modificar silenciosamente el expediente TALENTO desde una copia local;
- simular que una persona postuló para justificar un alta directa;
- considerar la creación de un registro `employees` como handoff completo;
- activar permisos antes de la fecha o condición autorizada;
- publicar al candidato una decisión distinta de la aprobada;
- usar notas de selección como evaluación de desempeño laboral;
- mantener accesos después de retiro, cancelación o expiración aplicable.

---

#### 9. Alcance de ANIMA

##### 9.1. Responsabilidades obligatorias

ANIMA será la experiencia móvil y personal del trabajador activado. Podrá cubrir:

- activación, recuperación y uso de acceso laboral;
- perfil laboral visible y contexto de sede autorizado;
- turno de hoy, semana publicada y cambios notificados;
- check-in, check-out y acciones de asistencia permitidas;
- disponibilidad, confirmaciones, solicitudes o reportes personales;
- documentos propios visibles, pendientes y confirmaciones;
- anuncios, comunicaciones y soporte laboral;
- carnet o credencial laboral cuando corresponda;
- pendientes de incorporación, período de prueba o continuidad definidos por
  VISO;
- consulta de historial propio;
- supervisión móvil ligera para managers con permiso y alcance.

##### 9.2. Frontera con VISO

```text
VISO
→ PLANEA, AUTORIZA, PUBLICA Y ADMINISTRA

ANIMA
→ CONSULTA, NOTIFICA, CAPTURA Y EJECUTA ACCIONES MÓVILES ACOTADAS
```

ANIMA no sustituirá:

- el planner semanal denso de VISO;
- la administración masiva de trabajadores;
- la decisión de contratación;
- la definición de salario o condiciones;
- la asignación original de permisos;
- el expediente de selección;
- la custodia integral de documentos laborales.

##### 9.3. Invitaciones de acceso

Una invitación ANIMA será exclusivamente un mecanismo de acceso o incorporación
digital para una persona cuyo vínculo laboral ya fue autorizado.

```text
INVITACIÓN ENVIADA
≠ EMPLEADO CREADO
≠ SEDE ASIGNADA
≠ ROL APROBADO
≠ VÍNCULO LABORAL ACTIVO
```

Si la implementación actual crea o actualiza `employees` y `employee_sites` al
enviar o aceptar una invitación, ese comportamiento se tratará como ruta legacy a
reemplazar o encapsular mediante `CAP-TAL-005` y `CAP-TAL-006`.

---

#### 10. Responsabilidad de la plataforma compartida

`vento-shell`, Supabase y los servicios compartidos podrán ejecutar:

- identidad y autenticación;
- autorización canónica;
- contratos, comandos y eventos entre aplicaciones;
- idempotencia, locks, outbox, colas y recuperación;
- auditoría transversal;
- provisión o revocación técnica ya autorizada;
- migraciones y compatibilidad temporal.

No serán propietarios de:

- necesidad de personal;
- evaluación del candidato;
- decisión de contratación;
- condiciones laborales;
- aceptación del candidato;
- decisión de continuidad o retiro.

```text
SERVICIO TÉCNICO
≠ AUTORIDAD DE TALENTO HUMANO
≠ APROBADOR LABORAL
```

Toda migración o modificación de contratos compartidos se implementará desde
`vento-shell`, conforme a la regla ya preservada para `CAP-TAL-*`.

---

#### 11. Modelo de identidad enlazada

##### 11.1. Regla principal

Una persona podrá tener simultánea o históricamente:

- identidad de autenticación;
- perfil de candidato;
- varias postulaciones;
- uno o varios episodios laborales;
- registro de empleado vigente o inactivo;
- perfiles adicionales en otros dominios.

Estos elementos estarán enlazados, no fusionados.

##### 11.2. Prohibiciones de deduplicación automática

No se enlazará o fusionará automáticamente por compartir únicamente:

- correo;
- teléfono;
- nombre;
- número de documento no verificado;
- dispositivo;
- cuenta social;
- dirección;
- fotografía.

Los casos ambiguos deberán entrar a revisión con evidencia, actor y resolución.
La fusión errónea es más dañina que conservar temporalmente un posible duplicado
marcado para conciliación.

##### 11.3. Aplicaciones múltiples

Una persona podrá tener varias postulaciones históricas o concurrentes. La regla
de cuál puede avanzar como principal hacia contratación se definirá en
`CAP-TAL-002` y `CAP-TAL-004`.

Una postulación rechazada no bloqueará permanentemente nuevas postulaciones,
salvo restricción explícita, legítima, temporal y auditable.

##### 11.4. Reingreso

Un extrabajador que vuelve a postularse:

- conserva su persona y expedientes históricos;
- puede crear una nueva postulación;
- no reactiva automáticamente el episodio laboral anterior;
- no hereda permisos, sedes, dispositivos o excepciones antiguas;
- genera un nuevo episodio laboral si el reingreso es aprobado.

##### 11.5. Compatibilidad técnica actual

La coincidencia actual entre `employees.id` y `auth.users.id`, cuando exista, se
tratará como restricción de compatibilidad y no como definición permanente de
persona, candidato y empleado. `CAP-TAL-005` deberá diseñar el handoff sin romper
la identidad vigente y sin convertir una decisión técnica actual en una frontera
funcional irreversible.

---

#### 12. Vacante empresarial y publicación

Se diferencian tres objetos:

```text
REQUISICIÓN DE PERSONAL — VISO
→ necesidad, justificación, empresa, sede, área, cargo y autorización

VACANTE EMPRESARIAL — VISO
→ condiciones aprobadas, vigencia, cupos y gobierno

PUBLICACIÓN DE VACANTE — TALENTO
→ proyección visible para consulta y postulación
```

Reglas:

1. una requisición podrá existir sin publicación;
2. una publicación no podrá existir sin vacante autorizada y vigente;
3. cerrar o suspender la vacante bloqueará nuevas postulaciones según política;
4. editar la publicación no alterará condiciones laborales materiales sin nueva
   versión y aprobación;
5. fuentes y campañas conservarán correlación con la publicación;
6. la publicación mostrará solo información autorizada para candidatos;
7. `CAP-TAL-002` definirá estados, filtros, consulta y postulación.

---

#### 13. Evaluación, decisión y oferta

##### 13.1. Separación de responsabilidades

TALENTO conservará:

- evidencia del proceso;
- resultados de entrevistas y pruebas;
- requisitos y faltantes;
- recomendaciones y observaciones;
- historial de etapa.

VISO conservará:

- autoridad para avanzar o rechazar;
- aprobación de contratación;
- condiciones de oferta;
- versión autorizada;
- vigencia y fecha esperada;
- razón de decisión y aprobador.

##### 13.2. Regla de segregación

```text
EVALUAR
≠ RECOMENDAR
≠ APROBAR CONTRATACIÓN
≠ EMITIR OFERTA
≠ ACTIVAR VÍNCULO
```

Quien entrevista o captura una prueba no obtiene por ello autorización final.
Cuando una persona cumpla varios papeles por tamaño de la organización, el
sistema conservará acciones, permisos y momentos separados y aplicará la
aprobación superior exigida.

##### 13.3. Respuesta del candidato

TALENTO podrá presentar una proyección versionada de la oferta autorizada y
capturar:

- aceptación;
- rechazo;
- solicitud de aclaración;
- expiración;
- retiro.

La respuesta se vinculará a versión, contenido, canal, fecha, actor y evidencia.
No modificará directamente el registro laboral.

El detalle se definirá en `CAP-TAL-004`.

---

#### 14. Documentos, consentimiento y privacidad

##### 14.1. Clases mínimas

| Clase                    | Ejemplos                                                                 | Propietario inicial           | Tratamiento objetivo                                                  |
| ------------------------ | ------------------------------------------------------------------------ | ----------------------------- | --------------------------------------------------------------------- |
| selección                | CV, respuestas filtro, portafolio, notas y pruebas                       | TALENTO                       | no se transfiere por defecto al expediente laboral                    |
| habilitante reutilizable | identificación, licencia o certificado requerido                         | TALENTO mientras es candidato | solo se referencia o transfiere con finalidad, validez y autorización |
| validación sensible      | aptitud, verificación o resultado restringido                            | custodio especializado        | se comparte únicamente el resultado mínimo permitido                  |
| pre-ingreso              | documentos finales anteriores al alta                                    | TALENTO con requisito VISO    | se transfiere mediante whitelist y evidencia                          |
| laboral                  | contrato, políticas, asignaciones, comprobantes y documentos del vínculo | VISO y custodia documental    | ANIMA recibe proyección personal autorizada                           |
| experiencia laboral      | confirmaciones, solicitudes y soportes del trabajador                    | ANIMA o proceso propietario   | VISO consume según finalidad y alcance                                |

##### 14.2. Reglas

- no copiar carpetas completas entre aplicaciones;
- conservar documento fuente, versión, hash, vigencia, clasificación y origen;
- registrar fundamento, consentimiento o finalidad de cada transferencia;
- no transferir notas internas de reclutamiento a ANIMA;
- no mostrar diagnósticos médicos cuando baste resultado de aptitud permitido;
- separar documento cargado, revisado, aprobado, vigente y transferible;
- permitir derechos de consulta, corrección o retiro según política aplicable;
- conservar retención y disposición por clase documental.

`CAP-TAL-003` deberá definir el expediente progresivo, datos mínimos, documentos,
consentimiento, conservación, eliminación y transferencia.

---

#### 15. Contrato conceptual de handoff

##### 15.1. Precondiciones mínimas

El handoff no podrá iniciarse sin:

- postulación identificada y no transferida previamente;
- persona y candidato resueltos;
- decisión empresarial autorizada;
- oferta vigente y respuesta válida cuando aplique;
- requisitos críticos de pre-ingreso completos o excepción aprobada;
- fecha efectiva;
- empresa, sede y área iniciales;
- rol base y, cuando aplique, rol operativo inicial;
- permisos o plantilla de acceso explícitos;
- responsable y aprobador;
- idempotency key y versión contractual.

##### 15.2. Resultados separados

El handoff deberá distinguir:

```text
DECISIÓN LABORAL AUTORIZADA
REGISTRO O EPISODIO LABORAL CREADO
ASIGNACIONES TERRITORIALES CREADAS
ROLES Y PERMISOS RESUELTOS
DOCUMENTOS TRANSFERIDOS O REFERENCIADOS
ACCESO TÉCNICO PROVISIONADO
ANIMA HABILITADA
POSTULACIÓN CERRADA Y ENLAZADA
```

Un resultado no implicará los demás.

##### 15.3. Atomicidad y recuperación

- un reintento no crea un segundo empleado, episodio, sede, rol o enlace;
- el sistema bloqueará la misma postulación durante la transición;
- si falla antes de activar el vínculo, no se marcará como contratada completa;
- si el vínculo legal ya fue activado y falla la notificación o credencial, no se
  eliminará retroactivamente el empleado: se abrirá remediación de acceso;
- cada resultado parcial conservará estado, error, responsable y siguiente acción;
- la compensación no borrará evidencia ni decisiones;
- la reejecución validará estado vigente, revocaciones y cambios de versión.

##### 15.4. Autoridad

VISO autoriza el alta. TALENTO aporta el caso y readiness. La plataforma ejecuta
el contrato. ANIMA consume el trabajador activado.

`CAP-TAL-005` definirá el contrato técnico, eventos, idempotencia, recuperación,
proyecciones y compatibilidad con el schema vigente.

---

#### 16. Acceso, invitación y habilitación inicial

La activación digital se separará de la vinculación:

```text
VÍNCULO LABORAL AUTORIZADO
→ REGISTRO LABORAL ACTIVO
→ ASIGNACIONES Y PERMISOS VIGENTES
→ INVITACIÓN O ACTIVACIÓN DE CREDENCIAL
→ ACCESO ANIMA
```

Reglas:

1. una invitación no asigna cargo, sede, área ni rol;
2. aceptar una invitación no aprueba el vínculo;
3. reenviar una invitación no crea un empleado nuevo;
4. un usuario existente en Auth no se vuelve trabajador por coincidencia de
   correo;
5. la recuperación de contraseña no reactiva un vínculo cerrado;
6. la fecha efectiva y el estado del episodio controlan el acceso;
7. la revocación deberá invalidar sesiones, tokens, colas offline y accesos
   derivados aplicables;
8. toda invitación conservará propósito, destinatario, episodio laboral, estado,
   expiración, intentos y actor.

---

#### 17. Período de prueba y permisos provisionales

Cuando exista relación contractual:

- el período de prueba pertenece a VISO como estado del vínculo;
- ANIMA muestra pendientes, hitos y comunicaciones autorizadas;
- TALENTO conserva únicamente el expediente histórico de selección y el enlace;
- los permisos provisionales serán explícitos, mínimos, territoriales y con
  expiración;
- superar el período no ampliará permisos automáticamente sin decisión;
- no superarlo activará el cierre laboral coordinado, no un simple rechazo de
  candidato;
- la continuidad definitiva conservará aprobador, fecha y cambios de acceso;
- las colas offline no podrán ejecutar con permisos provisionales vencidos.

El contrato completo corresponde a `CAP-TAL-006`.

---

#### 18. Altas directas, reingresos y excepciones

##### 18.1. Alta administrativa directa

La organización podrá necesitar registrar trabajadores actuales, migrados o
contrataciones que no pasaron por TALENTO.

VISO podrá ejecutar un flujo explícito de alta directa cuando exista:

- motivo clasificado;
- autoridad competente;
- identidad verificada;
- documentación mínima;
- condiciones laborales;
- sede, área y roles;
- fecha efectiva;
- auditoría y responsable de completar faltantes.

Este flujo:

- no creará una postulación ficticia;
- no falsificará entrevistas o evaluaciones;
- no utilizará una invitación ANIMA como aprobación;
- podrá crear un perfil TALENTO únicamente si después existe una finalidad real y
  autorizada.

##### 18.2. Reingreso

El reingreso reutilizará la persona verificada y creará un episodio laboral nuevo.
No restaurará automáticamente:

- permisos;
- sesiones;
- PIN;
- sede primaria;
- rol operativo;
- dispositivos;
- excepciones;
- invitaciones;
- documentos vencidos.

##### 18.3. Transferencia, promoción o cambio interno

Los movimientos de una persona ya trabajadora pertenecen a VISO y a los procesos
laborales. No se crearán como postulaciones TALENTO salvo que la organización
apruebe un proceso interno de selección explícito, con reglas y visibilidad
propias.

##### 18.4. Cancelación antes del inicio

Si una vinculación autorizada se cancela antes de comenzar:

- se conserva la decisión y causa;
- se revocan accesos e invitaciones;
- se liberan asignaciones y recursos;
- se diferencia de retiro posterior al inicio;
- se conserva el expediente conforme a retención.

---

#### 19. Autorización y alcance

Cada acción deberá evaluar:

```text
PRINCIPAL AUTENTICADO
+
ACTOR EFECTIVO
+
PERMISO EXACTO
+
EMPRESA, SEDE, ÁREA Y VACANTE
+
RELACIÓN CON EL CASO
+
ETAPA Y ESTADO
+
FINALIDAD Y SENSIBILIDAD
+
DENEGACIONES Y SEGREGACIÓN
=
ALLOW O DENY
```

Reglas mínimas:

- el candidato accede solo a sus datos, postulaciones y proyecciones permitidas;
- un reclutador accede únicamente a procesos y vacantes asignados;
- un gerente de sede no obtiene acceso global a candidatos de otras sedes;
- un entrevistador recibe la información mínima necesaria;
- salario, datos médicos, documento de identidad y notas internas se restringen
  por finalidad;
- un manager en ANIMA no obtiene acceso al expediente de selección;
- el rol `trabajador_operativo` no concede administración de candidatos;
- `propietario` o `gerente_general` no sustituyen el permiso exacto ni la
  finalidad;
- un dispositivo compartido operativo no almacenará expedientes de candidatos;
- exportaciones y descargas sensibles requieren permiso, alcance y auditoría.

---

#### 20. Contratos de proyección entre aplicaciones

##### 20.1. VISO → TALENTO

Podrá publicar:

- requisición o vacante aprobada;
- empresa, sede, área y cargo;
- condiciones visibles autorizadas;
- cupos, vigencia y reglas;
- responsables y evaluadores;
- requisitos y gates;
- decisión y oferta autorizadas.

##### 20.2. TALENTO → VISO

Podrá proyectar:

- identidad mínima del candidato;
- postulación y fuente;
- etapa, SLA y próxima acción;
- requisitos y documentos en estado resumido;
- resultados autorizados;
- recomendación y bloqueos;
- respuesta a oferta;
- readiness de pre-ingreso.

##### 20.3. VISO → ANIMA

Podrá publicar:

- trabajador y episodio activo;
- sede, área, roles y capacidades;
- programación publicada;
- requisitos laborales y documentos visibles;
- período de prueba y pendientes;
- anuncios o comunicaciones autorizadas;
- estado de acceso y revocación.

##### 20.4. ANIMA → VISO

Podrá emitir:

- activación o aceptación de acceso;
- confirmaciones personales;
- disponibilidad y solicitudes;
- hechos de asistencia;
- carga o aceptación de documentos permitidos;
- reportes, soporte y observaciones;
- evidencias operativas propias.

##### 20.5. Regla de escritura

Una proyección no se convierte en un editor de la fuente.

```text
LECTURA O PROYECCIÓN
≠ PROPIEDAD
≠ AUTORIZACIÓN DE MUTAR EL REGISTRO ORIGEN
```

---

#### 21. Auditoría transversal

Todo evento material conservará, cuando aplique:

- persona, candidato, postulación, empleado y episodio relacionados;
- empresa, sede, área, vacante y cargo;
- actor efectivo y principal técnico;
- aplicación y versión;
- acción, etapa y estado anterior y posterior;
- permiso y decisión de autorización;
- motivo y código de razón;
- snapshot o versión relevante;
- consentimiento o finalidad;
- documentos o evidencias referenciados;
- correlación, causalidad e idempotencia;
- fecha, dispositivo, canal y resultado;
- error, compensación o recuperación.

No se registrarán secretos, diagnósticos innecesarios ni documentos completos en
logs generales.

---

#### 22. Métricas por dominio

##### TALENTO

- postulaciones por vacante y fuente;
- completitud y abandono por etapa;
- tiempo a primera revisión;
- tiempo por etapa;
- no asistencia a entrevista;
- documentos rechazados;
- razones de rechazo y retiro agregadas;
- readiness de pre-ingreso;
- handoffs iniciados, completados y fallidos.

##### VISO

- requisiciones y vacantes por estado;
- tiempo de aprobación;
- cobertura de responsables;
- tiempo de decisión y oferta;
- altas directas y su justificación;
- empleados activados;
- asignaciones incompletas;
- período de prueba y continuidad;
- retiros y revocaciones pendientes.

##### ANIMA

- acceso provisionado y activado;
- fallos de invitación o recuperación;
- pendientes de incorporación;
- lectura de comunicaciones;
- turnos consultados y confirmados;
- asistencia y solicitudes;
- bloqueos o accesos revocados.

Las métricas no podrán incentivar contratación rápida a costa de calidad,
privacidad, seguridad, cumplimiento o experiencia del candidato.

---

#### 23. Hallazgos de implementación legacy que deberán reconducirse

##### 23.1. Alta directa desde VISO

VISO actualmente dispone de alta y administración de staff. El modelo objetivo
no elimina esa capacidad, pero la restringe a:

- alta laboral autorizada;
- migración o regularización;
- reingreso;
- excepción documentada.

No será el flujo ordinario para copiar manualmente candidatos de TALENTO.

##### 23.2. Invitaciones de ANIMA que materializan empleado

El diseño existente de invitaciones ANIMA contempla crear o actualizar
`employees` y `employee_sites` durante creación o aceptación. Esa ruta mezcla
acceso con vinculación y deberá:

- dejar de ser autoridad de alta;
- exigir un episodio laboral autorizado;
- limitarse a provisión o recuperación de acceso;
- conservar compatibilidad temporal y migración controlada;
- incluir pruebas negativas de bypass.

Destino: `CAP-TAL-005`, `CAP-TAL-006`, tareas `AUTH-DB-001` a `AUTH-DB-035`, `ANIMA-AUTH-001` a `ANIMA-AUTH-020` e
integraciones aplicables.

##### 23.3. Handoff TALENTO → ANIMA directo

El draft técnico de TALENTO propone aprovisionar `employees`, `employee_sites` y
`employee_settings` directamente. El contrato objetivo deberá insertar la
autoridad VISO y separar:

- decisión y condiciones laborales;
- creación o reactivación del episodio;
- asignaciones y permisos;
- provisión técnica;
- cierre de postulación;
- habilitación ANIMA.

Destino: `CAP-TAL-005`.

##### 23.4. Rol único y sede única

Las decisiones actuales basadas en `employees.role` o `employees.site_id` como
única verdad deberán converger al modelo canónico de asignaciones, roles y
capacidades por contexto. El handoff no podrá consolidar nuevos bypasses sobre el
fallback legacy.

Destino: `CAP-TAL-005`, `CAP-TAL-006` y contratos de autorización ya aprobados.

---

#### 24. Decisiones diferidas con dueño exacto

| Decisión pendiente                                                    | Tarea propietaria                                                                                                                                             | Condición de cierre                                     |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| publicación, consulta, filtros y postulación                          | `CAP-TAL-002`                                                                                                                                                 | contrato completo de vacante publicada y application    |
| múltiples postulaciones y selección de principal activa               | `CAP-TAL-002`; `CAP-TAL-004`                                                                                                                                  | reglas y transiciones aprobadas                         |
| datos mínimos, documentos, consentimiento y retención                 | `CAP-TAL-003`                                                                                                                                                 | matriz de datos y expediente progresivo aprobada        |
| entrevistas, evaluaciones, decisión, oferta y pre-registro            | `CAP-TAL-004`                                                                                                                                                 | actores, estados, versiones y segregación aprobados     |
| handoff, eventos, idempotencia, recuperación y compatibilidad         | `CAP-TAL-005`                                                                                                                                                 | contrato técnico y funcional aprobado                   |
| invitaciones, permisos provisionales, período de prueba y continuidad | `CAP-TAL-006`                                                                                                                                                 | ciclo laboral inicial y cierre aprobados                |
| detalle de pantallas                                                  | `PROC-SCREEN-001` a `PROC-SCREEN-028`                                                                                                                         | contratos de proceso y UX previos aprobados             |
| autorización técnica                                                  | tareas `AUTH-DB-001` a `AUTH-DB-035`, `AUTH-SRV-001` a `AUTH-SRV-018`, `ANIMA-AUTH-001` a `ANIMA-AUTH-020` y `VISO-AUTH-001` a `VISO-AUTH-020` y consumidoras | permisos, RLS, RPC y servicios implementados y probados |
| migración de rutas legacy                                             | `CAP-TAL-005`; `CAP-TAL-006`; paquetes E5                                                                                                                     | evaluación dual, backfill, cutover y rollback aprobados |

No queda decisión narrativa sin tarea propietaria.

---

#### 25. Requisitos de prueba derivados

Esta tarea crea y especifica en el registro canónico:

```text
TREQ-TALENTO-002
TREQ-TALENTO-003
TREQ-TALENTO-004
TREQ-TALENTO-005
TREQ-TALENTO-006
TREQ-TALENTO-007
TREQ-TALENTO-008
TREQ-TALENTO-009
TREQ-TALENTO-010
TREQ-TALENTO-011
```

También modifica `TREQ-TALENTO-001` para incorporar esta frontera como parte del
alcance y actualiza las evidencias de `TREQ-PROC-217` a `TREQ-PROC-226` para
reflejar que `OPS-B2B-001` ya está aprobada.

Los detalles completos permanecen únicamente en
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 26. Criterios de aceptación

- [ ] TALENTO, VISO y ANIMA tienen una responsabilidad funcional inequívoca.
- [ ] Se diferencian persona, autenticación, candidato, postulación, empleado y episodio laboral.
- [ ] La necesidad y vacante empresarial pertenecen a VISO; la publicación y postulación pertenecen a TALENTO.
- [ ] La evaluación y evidencia se separan de la decisión y oferta autorizadas.
- [ ] La aceptación de oferta no crea automáticamente empleado, permisos o acceso.
- [ ] El handoff separa decisión, registro laboral, asignaciones, provisión, acceso y cierre.
- [ ] ANIMA comienza como experiencia laboral y su invitación no crea vínculo.
- [ ] VISO puede soportar alta directa únicamente mediante excepción explícita, sin postulación ficticia.
- [ ] Reingreso, transferencia y cancelación previa al inicio están diferenciados.
- [ ] Los documentos se clasifican y no se copian masivamente entre dominios.
- [ ] Cada proyección tiene un propietario y no habilita escritura competidora.
- [ ] Las rutas legacy identificadas tienen tarea de migración y no se aceptan como modelo objetivo.
- [ ] Cada decisión diferida tiene tarea y condición de cierre.
- [ ] El registro contiene once requisitos TALENTO, identificadores únicos y catorce columnas.
- [ ] No se implementó código, migraciones, RLS, RPC, Supabase ni cambios productivos.
- [ ] `CAP-TAL-002` permanece sin iniciar.

---

#### 27. Estado y continuidad

```text
OPS-B2B-001 APROBADA
CAP-TAL-001 APROBADA
CAP-TAL-002 NO INICIADA
```

No se inicia `CAP-TAL-002` hasta la aprobación expresa de esta tarea.


### ✅ CAP-TAL-002 — Diseñar publicación de vacantes, consulta y postulación en TALENTO

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `CAP-TAL-001 — Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA` — APROBADA  
**Siguiente tarea reservada:** `CAP-TAL-003 — Diseñar expediente progresivo de datos, documentos, consentimiento y conservación`  
**Artefacto producido:** `CAP-TAL-VACANCY-APPLICATION-CONTRACT-001`  
**Procesos canónicos principales:** `VPROC-0005` y `VPROC-0006`  
**Naturaleza:** arquitectura funcional, experiencia universal, publicación, consulta y contrato de postulación  
**Superficie objetivo:** un solo producto `TALENTO` construido con Expo y Expo Router para web, PWA opcional, Android e iOS  
**Cambios en código, datos, migraciones, RLS, RPC, Supabase, aplicaciones, hosting o tiendas:** no autorizados

---

#### 1. Propósito

Diseñar cómo una necesidad de personal autorizada en `VISO` se convierte en una
publicación consultable en `TALENTO`, cómo una persona descubre y entiende una
vacante y cómo crea una postulación válida sin:

- obligarla a instalar una aplicación antes de conocer o solicitar una vacante;
- duplicar la experiencia web y móvil en dos productos independientes;
- publicar condiciones que no correspondan con la versión autorizada en VISO;
- confundir vacante empresarial, publicación y postulación;
- exigir demasiados datos o documentos en el primer contacto;
- perder el contexto cuando la persona debe autenticarse;
- crear postulaciones duplicadas por doble toque, reintento o respuesta perdida;
- permitir que una URL, campaña o cliente altere reglas del dominio;
- exponer datos internos, sensibles o no autorizados en la superficie pública;
- convertir una postulación en contratación, empleado, rol o acceso laboral;
- ocultar errores de publicación, autenticación o envío detrás de mensajes de
  éxito ambiguos;
- diseñar una experiencia que solo funcione en una plataforma, navegador o
  dispositivo de gama alta.

Esta tarea define el contrato funcional de publicación, descubrimiento,
consulta, autenticación contextual y envío de la postulación. No define todavía
el expediente documental completo, evaluaciones, entrevistas, oferta, handoff o
período de prueba; esas materias permanecen en `CAP-TAL-003` a `CAP-TAL-006`.

---

#### 2. Decisión canónica de producto y plataforma

```text
UN SOLO PRODUCTO TALENTO
        ↓
EXPO + EXPO ROUTER
        ↓
WEB RESPONSIVE SIN INSTALACIÓN OBLIGATORIA
+
PWA INSTALABLE OPCIONAL
+
APLICACIÓN NATIVA ANDROID
+
APLICACIÓN NATIVA iOS
        ↓
MISMO DOMINIO, MISMAS RUTAS LÓGICAS Y MISMAS REGLAS
```

Reglas:

1. La web será el canal principal para descubrir vacantes y comenzar una
   postulación desde enlaces compartidos.
2. La PWA será una capacidad complementaria; la instalación nunca será requisito
   para consultar o postularse.
3. Los builds nativos se producirán desde el mismo proyecto cuando la puerta de
   readiness autorice su publicación.
4. Web, PWA y aplicaciones nativas consumirán el mismo dominio `talento` y los
   mismos contratos de servidor.
5. Las diferencias de plataforma se resolverán mediante componentes adaptados,
   no mediante reglas de negocio divergentes.
6. Una función puede diferirse en una plataforma únicamente con degradación
   explícita, evidencia y destino en `CAP-TAL-006`; no podrá simular paridad.
7. La implementación inicial web no dependerá de renderizado de servidor
   experimental. Las rutas públicas conocidas se generarán o actualizarán al
   publicar una vacante.
8. Una evolución futura hacia renderizado dinámico deberá aprobarse dentro del
   roadmap materializado por `CAP-TAL-006`, sin alterar las URLs canónicas ni el
   contrato de publicación.

Por tanto:

```text
WEB TALENTO ≠ PRODUCTO PARALELO
PWA TALENTO ≠ SEGUNDO DOMINIO
APP NATIVA TALENTO ≠ SEGUNDA FUENTE DE VERDAD

MISMA BASE DE CÓDIGO ≠ INTERFAZ IDÉNTICA SIN ADAPTACIÓN
```

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `CAP-TAL-001` y su matriz de responsabilidades entre TALENTO, VISO y ANIMA;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `OPS-CAN-001`, incluida la arquitectura de canales, campañas y atribución;
- el modelo canónico de identidad, autorización, alcance, auditoría y
  dispositivos;
- la prohibición de autorización derivada únicamente del rol;
- `VPROC-0005 — Planear dotación y ejecutar selección sin mezclar necesidad
  laboral, candidato y trabajador activo`;
- `VPROC-0006 — Orquestar vinculación, expediente, incorporación, preparación y
  habilitación inicial de la persona`;
- las reglas aprobadas de idempotencia, correlación, privacidad, minimización y
  evidencia;
- la decisión de que VISO conserva requisición, vacante empresarial y autoridad
  laboral;
- la decisión de que el dominio prelaboral futuro TALENTO conserva publicación,
  perfil, postulación y expediente bajo gobierno de VISO, sin `app_code` propio;
- la decisión de que ANIMA solo recibe al trabajador vinculado y activado.

Los documentos existentes en `vento-talento` se consideran drafts y evidencia
AS-IS. Esta tarea consolida la regla canónica aunque contradiga atajos técnicos
previos.

---

#### 4. Distinciones obligatorias

```text
REQUISICIÓN DE PERSONAL
→ necesidad y autorización empresarial en VISO

VACANTE EMPRESARIAL
→ posición, cupos, condiciones y vigencia aprobados en VISO

PUBLICACIÓN DE VACANTE
→ proyección versionada y visible administrada por TALENTO

POSTULACIÓN
→ decisión de una persona de participar en una publicación concreta
```

No serán equivalentes:

```text
VACANTE APROBADA ≠ VACANTE PUBLICADA

PUBLICADA ≠ INDEXADA CORRECTAMENTE

VISIBLE EN WEB ≠ DISPONIBLE PARA POSTULARSE

BORRADOR LOCAL ≠ POSTULACIÓN ENVIADA

POSTULACIÓN ENVIADA ≠ CANDIDATO PRESELECCIONADO

CANDIDATO PRESELECCIONADO ≠ CONTRATADO
```

---

#### 5. Objetos funcionales mínimos

| Objeto                  | Propietario                  | Propósito                                         | Regla principal                               |
| ----------------------- | ---------------------------- | ------------------------------------------------- | --------------------------------------------- |
| requisición             | VISO                         | justificar y autorizar necesidad                  | no se expone públicamente                     |
| vacante empresarial     | VISO                         | conservar posición, cupos y condiciones aprobadas | TALENTO no la modifica                        |
| publicación             | TALENTO                      | proyectar información autorizada hacia candidatos | conserva versión y vigencia                   |
| versión de publicación  | TALENTO                      | snapshot inmutable del contenido visible          | toda postulación referencia una versión       |
| ruta pública            | TALENTO                      | permitir consulta y compartir la vacante          | permanece estable durante su vida útil        |
| candidato               | TALENTO                      | identidad prelaboral enlazada                     | no equivale a empleado                        |
| borrador de postulación | TALENTO o cliente autorizado | conservar avance antes del envío                  | no participa en selección                     |
| postulación enviada     | TALENTO                      | registrar participación válida                    | requiere acuse canónico del servidor          |
| atribución de origen    | TALENTO con contrato OPS-CAN | medir canal y campaña                             | nunca concede permisos ni cambia elegibilidad |

---

#### 6. Ciclo de vida de la publicación

##### 6.1. Estados canónicos propuestos

```text
DRAFT
→ PENDING_APPROVAL
→ APPROVED
→ SCHEDULED
→ PUBLISHING
→ PUBLISHED
→ PAUSED
→ CLOSED
→ EXPIRED
→ ARCHIVED
```

Estado de fallo controlado:

```text
PUBLICATION_FAILED
```

##### 6.2. Significado

| Estado               | Significado                                         |                     ¿Visible? |        ¿Admite postulación? |
| -------------------- | --------------------------------------------------- | ----------------------------: | --------------------------: |
| `DRAFT`              | contenido TALENTO en preparación                    |                            no |                          no |
| `PENDING_APPROVAL`   | espera validación de fuente o contenido             |                            no |                          no |
| `APPROVED`           | autorizada, todavía no desplegada                   |                            no |                          no |
| `SCHEDULED`          | autorizada para una fecha futura                    |          no antes de la fecha |        no antes de la fecha |
| `PUBLISHING`         | generación o despliegue en curso                    |       no se declara publicada |                          no |
| `PUBLISHED`          | visible, vigente y lista                            |                            sí | sí, salvo bloqueo explícito |
| `PAUSED`             | temporalmente retirada sin cerrar la vacante fuente |   página informativa opcional |                          no |
| `CLOSED`             | ya no recibe nuevas postulaciones                   | sí durante retención definida |                          no |
| `EXPIRED`            | venció por regla temporal                           | sí durante retención definida |                          no |
| `ARCHIVED`           | fuera de navegación ordinaria                       | no, salvo consulta autorizada |                          no |
| `PUBLICATION_FAILED` | falló generación, despliegue o sincronización       |            no se afirma éxito |                          no |

##### 6.3. Reglas

1. Solo una vacante empresarial vigente y autorizada podrá originar una
   publicación.
2. La publicación no podrá alterar empresa, sede, área, cargo, cupos,
   condiciones, rango salarial, jornada, fecha o requisitos fuente.
3. Cambios materiales producirán una versión nueva; no sobrescribirán el snapshot
   contra el cual ya existen postulaciones.
4. Corregir ortografía sin impacto semántico podrá registrarse como revisión
   menor, pero conservará actor, fecha y diff.
5. Pausar, cerrar o expirar una publicación no rechazará postulaciones existentes.
6. Reabrir una publicación exigirá nueva vigencia y decisión explícita sobre si
   constituye la misma ronda o una nueva.
7. El estado `PUBLISHED` solo se emitirá cuando la proyección pública, ruta,
   metadatos y lectura de dominio estén disponibles.
8. Si el despliegue web falla, la vacante permanecerá `PUBLICATION_FAILED` o en
   estado anterior; no se mostrará éxito administrativo falso.

---

#### 7. Contrato de publicación

La acción de publicar deberá recibir como mínimo:

```text
vacancy_id
vacancy_version
publication_id
publication_version
approved_by
approved_at
publish_at
close_at
public_title
public_summary
public_description
public_requirements
public_conditions
public_company_or_brand
public_city
public_site_label
public_work_modality
public_schedule_summary
public_employment_type
public_salary_display_policy
public_salary_range_when_authorized
public_application_questions_version
public_privacy_notice_version
public_slug
source_snapshot_hash
idempotency_key
```

La respuesta canónica deberá incluir:

```text
publication_id
publication_version
status
canonical_url
published_at
close_at
source_snapshot_hash
web_artifact_version
trace_id
reason_codes[]
```

No se aceptará una publicación si:

- la fuente no existe o no está autorizada;
- la versión fuente cambió después de la aprobación;
- faltan campos públicos obligatorios;
- el slug colisiona sin política de resolución;
- la fecha de cierre es inválida;
- se intenta exponer un campo no autorizado;
- la publicación ya fue procesada con la misma idempotency key y datos distintos;
- el actor carece de permiso, alcance o segregación requerida.

---

#### 8. Contenido público permitido y prohibido

##### 8.1. Contenido permitido cuando esté autorizado

- nombre público de la vacante;
- propósito del cargo;
- responsabilidades principales;
- requisitos obligatorios y deseables claramente separados;
- ciudad y sede o zona pública aplicable;
- modalidad presencial, híbrida o remota cuando corresponda;
- jornada o resumen de disponibilidad esperada;
- tipo de vinculación aprobado;
- rango salarial únicamente si la política y versión lo autorizan;
- fecha de cierre o indicación de convocatoria abierta;
- pasos generales del proceso;
- política de igualdad, privacidad y tratamiento aplicable;
- ajustes o canales de apoyo para postularse;
- identificador y URL canónica.

##### 8.2. Contenido prohibido en la superficie pública

- justificación interna de la requisición;
- presupuesto, centro de costo o margen;
- nombres de candidatos;
- notas de gerencia o reclutamiento;
- evaluadores internos no autorizados para publicación;
- headcount no público;
- criterios discriminatorios o rasgos protegidos;
- preguntas médicas no justificadas en la etapa inicial;
- correos personales, teléfonos privados o credenciales;
- identificadores internos que permitan enumerar recursos sensibles;
- salario, condiciones o beneficios no aprobados;
- reglas de scoring, riesgo o fraude;
- datos de otros trabajadores.

La API pública utilizará una proyección o contrato de whitelist. No expondrá la
fila interna completa y confiará en el cliente para ocultar campos.

---

#### 9. Consulta y descubrimiento de vacantes

##### 9.1. Acceso

La consulta será pública y no exigirá cuenta, descarga, ubicación precisa,
contactos, cámara, notificaciones ni consentimiento de marketing.

##### 9.2. Listado

El listado deberá soportar:

- paginación estable;
- búsqueda textual limitada a contenido público;
- filtros por ciudad;
- sede o zona pública;
- familia de cargo;
- jornada o disponibilidad;
- modalidad de trabajo;
- tipo de vinculación;
- estado de convocatoria cuando corresponda;
- orden por relevancia declarada o fecha, sin scoring oculto de la persona;
- estados vacíos comprensibles;
- recuperación ante error sin perder filtros.

##### 9.3. Reglas de búsqueda y filtros

1. Los filtros solo utilizan atributos de la vacante, nunca rasgos sensibles de
   la persona.
2. La búsqueda no revelará publicaciones no vigentes por diferencias de
   mayúsculas, slug, caché o acceso directo.
3. La paginación no repetirá ni omitirá elementos por cambios concurrentes sin
   indicar actualización.
4. Los conteos públicos, si existen, serán aproximados o autorizados; no
   revelarán volumen interno de candidatos.
5. Una vacante cerrada puede conservar su página histórica durante la retención,
   pero no aparecerá como disponible.
6. La ausencia de resultados no inducirá al usuario a entregar datos antes de
   conocer una oportunidad concreta.

---

#### 10. Detalle de vacante

La pantalla deberá responder, en lenguaje comprensible:

```text
¿QUÉ ES EL TRABAJO?
¿DÓNDE SE REALIZA?
¿QUÉ SE ESPERA?
¿QUÉ ES OBLIGATORIO?
¿QUÉ ES DESEABLE?
¿CUÁL ES LA JORNADA O DISPONIBILIDAD?
¿QUÉ CONDICIONES ESTÁN AUTORIZADAS PARA MOSTRAR?
¿HASTA CUÁNDO PUEDO POSTULARME?
¿QUÉ DATOS ME PEDIRÁN AHORA?
¿QUÉ PASA DESPUÉS?
```

El CTA tendrá uno de estos resultados explícitos:

- `Postularme`;
- `Continuar postulación`;
- `Ya te postulaste`;
- `Vacante pausada`;
- `Convocatoria cerrada`;
- `Convocatoria vencida`;
- `No disponible` con razón pública segura.

No se utilizará un CTA activo que falle después porque la publicación ya estaba
cerrada y la versión local estaba obsoleta. Antes de enviar se revalidará el
estado en servidor.

---

#### 11. URLs, indexación, enlaces y metadatos

##### 11.1. Rutas canónicas

Rutas lógicas iniciales:

```text
/vacantes
/vacantes/[slug]
/postular/[slug]
/mis-postulaciones
/postulaciones/[application_id]
```

Reglas:

1. Cada publicación tendrá URL canónica estable.
2. El slug será legible, pero la resolución final usará un identificador no
   ambiguo o una tabla de alias.
3. Cambiar el título no romperá enlaces existentes; podrá crearse alias o
   redirección registrada.
4. Una vacante cerrada conservará su URL y mostrará el estado correcto durante
   la retención definida.
5. Ninguna URL contendrá tokens de sesión, datos personales, documentos,
   resultado de evaluación o notas internas.

##### 11.2. Web y SEO

La salida web inicial utilizará renderizado estático de rutas públicas conocidas.
La publicación o modificación aprobada deberá activar la regeneración y el
 despliegue de las rutas correspondientes.

Cada detalle público deberá producir:

- título de página;
- descripción;
- URL canónica;
- estado indexable o no indexable según ciclo de vida;
- metadatos para compartir en WhatsApp, Instagram y otros canales;
- imagen pública autorizada o fallback institucional;
- idioma y datos estructurados que se aprueben posteriormente.

No se dependerá de hidratación del cliente para que el título, descripción y
estado básico existan en el HTML inicial.

##### 11.3. Enlaces universales

La misma URL HTTPS deberá:

- abrir la web cuando la app no esté instalada;
- abrir la ruta equivalente en Android o iOS cuando exista asociación válida;
- conservar publicación, campaña y retorno;
- caer de forma segura a web ante una ruta nativa no disponible;
- impedir esquemas abiertos que permitan navegación arbitraria.

---

#### 12. Modelo de acceso: público, autenticado y protegido

##### 12.1. Público

Sin autenticación:

- consultar listado;
- abrir detalle;
- aplicar filtros;
- compartir URL;
- conocer datos mínimos requeridos;
- iniciar un borrador local no sensible;
- solicitar apoyo o ajustes de accesibilidad.

##### 12.2. Autenticación contextual

Se exigirá autenticación antes de:

- persistir datos personales en servidor;
- enviar una postulación;
- consultar postulaciones propias;
- recuperar un borrador remoto;
- acceder a tareas, documentos o historial personal.

La autenticación deberá preservar:

```text
return_to
publication_id
publication_version
source_context
safe_draft_reference
```

Una autenticación fallida, cancelada o reintentada no perderá el contexto ni
creará otra cuenta de candidato.

##### 12.3. Protección real

Ocultar una ruta o redirigir desde el cliente no será autorización. RLS, RPC o el
servicio de dominio verificará identidad, propiedad, publicación, postulación y
acción en cada solicitud.

---

#### 13. Inicio de postulación y captura mínima

##### 13.1. Principio

```text
CONOCER LA VACANTE
→ SIN CUENTA

INICIAR BORRADOR
→ SIN SOBRECAPTURA

PERSISTIR O ENVIAR DATOS PERSONALES
→ IDENTIDAD AUTENTICADA Y FINALIDAD EXPLÍCITA
```

##### 13.2. Datos mínimos de la primera postulación

La configuración por vacante podrá solicitar únicamente lo necesario para
registrar interés y aplicar filtros iniciales autorizados, por ejemplo:

- nombres y apellidos;
- correo o teléfono verificado según método de acceso;
- ciudad o disponibilidad territorial;
- disponibilidad general;
- experiencia resumida;
- respuestas objetivas a requisitos indispensables;
- aceptación del aviso de privacidad vigente;
- preferencia de contacto.

No se exigirán por defecto en el primer envío:

- historia médica;
- información bancaria;
- datos de familiares;
- documentos completos no necesarios;
- fotografías no justificadas;
- referencias personales extensas;
- dirección residencial exacta;
- datos laborales que pertenecen al pre-ingreso;
- información ya disponible y confiable en el perfil.

Los documentos, consentimientos específicos, versionado, conservación y
eliminación se detallarán en `CAP-TAL-003`.

---

#### 14. Preguntas de postulación

Cada pregunta deberá tener:

```text
question_id
question_version
vacancy_or_publication_scope
purpose
required
answer_type
allowed_values
validation
visibility
retention_class
```

Reglas:

1. Las preguntas se versionan junto con la publicación.
2. Una postulación conserva las preguntas y respuestas que realmente recibió.
3. No se cambiará retrospectivamente una respuesta por modificar el formulario.
4. Una pregunta obligatoria tendrá finalidad documentada.
5. Los filtros eliminatorios objetivos deberán ser explícitos, legales,
   versionados y comprensibles.
6. Esta tarea no autoriza scoring automático ni contratación o rechazo por IA.
7. Cualquier evaluación, score o decisión posterior pertenece a `CAP-TAL-004`.
8. Las opciones `Otro`, `Prefiero no responder` o `No aplica` se habilitarán
   cuando sean coherentes con la finalidad.

---

#### 15. Contrato canónico de envío de postulación

##### 15.1. Entrada mínima

```text
candidate_id
publication_id
publication_version
vacancy_id
vacancy_version
answers_version
answers[]
profile_snapshot_or_reference
privacy_notice_version
consent_record
source_context
client_platform
client_app_version
idempotency_key
submitted_at_client
```

##### 15.2. Validaciones del servidor

- principal autenticado válido;
- candidato enlazado al principal;
- publicación existente y vigente;
- versión aceptable y no sustituida sin aviso;
- fecha y cupo de recepción aplicables;
- respuestas obligatorias completas;
- aviso y consentimiento vigentes;
- ausencia de postulación activa duplicada según la política;
- idempotency key válida;
- actor no bloqueado por fraude o abuso mediante una regla autorizada y
  apelable;
- integridad del snapshot.

##### 15.3. Salida

```text
application_id
application_number
status = SUBMITTED
publication_id
publication_version
submitted_at_server
is_primary_active
next_action
receipt_channel_status
trace_id
```

##### 15.4. Regla de éxito

```text
BOTÓN PRESIONADO
≠ POSTULACIÓN ENVIADA

RESPUESTA HTTP RECIBIDA
≠ POSTULACIÓN CREADA SI EL CONTRATO FALLÓ

POSTULACIÓN ENVIADA
= ACUSE CANÓNICO DEL SERVIDOR CON application_id
```

Si el cliente pierde la respuesta, reintentará con la misma idempotency key o
consultará el resultado. Nunca creará otra postulación para “asegurarse”.

---

#### 16. Snapshot y versión aceptada

Cada postulación deberá conservar o poder reconstruir:

- vacante empresarial y versión;
- publicación y versión;
- título y descripción públicos;
- requisitos;
- ciudad, sede pública y modalidad;
- jornada y tipo de vinculación visibles;
- salario o rango mostrado, si existió;
- preguntas y opciones;
- aviso de privacidad;
- consentimiento;
- fuente y campaña;
- fecha y canal de envío.

Modificar o cerrar la publicación no alterará lo que la persona aceptó y
respondió.

Si una versión material cambia mientras existe un borrador, TALENTO mostrará el
cambio y exigirá revisión antes del envío. No migrará respuestas silenciosamente
si la semántica cambió.

---

#### 17. Duplicados, múltiples postulaciones y principal activa

##### 17.1. Múltiples postulaciones

Una persona podrá tener varias postulaciones a vacantes diferentes sin crear otra
identidad de candidato.

##### 17.2. Duplicado operativo

No podrá existir más de una postulación no terminal para la misma combinación
canónica de:

```text
candidate_id
+
vacancy_id
+
recruitment_round
```

Una nueva versión editorial de la publicación no habilita otra postulación a la
misma ronda.

##### 17.3. Repostulación

Podrá permitirse cuando:

- exista una nueva ronda;
- la postulación anterior sea terminal;
- la política de espera lo permita;
- la publicación indique la posibilidad;
- se conserve el vínculo con el historial anterior.

##### 17.4. Postulación principal

Solo una postulación podrá ser `is_primary_active = true` para una vinculación
inminente.

Reglas:

1. Antes del bloqueo interno, el candidato puede indicar preferencia.
2. La preferencia no rechaza las demás postulaciones.
3. Cuando una aplicación entra en oferta, pre-ingreso o bloqueo de contratación,
   cambiar la principal requiere acción interna autorizada.
4. El sistema evita que dos aplicaciones lleguen simultáneamente a handoff para
   la misma persona sin una decisión explícita.
5. La postulación principal no concede prioridad injustificada ni reemplaza la
   evaluación.

---

#### 18. Borradores, continuidad y operación degradada

##### 18.1. Borrador local

Se permitirá conservar localmente información no sensible o cifrada de forma
adecuada para evitar pérdida por cierre del navegador o aplicación.

Un borrador local:

- no aparece a reclutadores;
- no consume cupo;
- no se incluye en métricas de postulaciones enviadas;
- no puede considerarse consentimiento o envío;
- tendrá expiración y opción de descarte.

##### 18.2. Borrador remoto

Cuando exista autenticación, podrá persistirse un borrador remoto con:

- propietario;
- publicación y versión;
- progreso;
- fecha de actualización;
- expiración;
- conflicto de versión;
- sincronización entre plataformas.

##### 18.3. Sin conexión

- la consulta podrá usar contenido cacheado con indicador de antigüedad;
- no se afirmará que una vacante sigue abierta usando solo caché;
- el envío requiere confirmación del servidor;
- una cola offline conservará idempotency key y versión;
- al recuperar conexión se revalidará publicación, consentimiento y preguntas;
- si ya existe la postulación, se mostrará el acuse existente.

---

#### 19. Atribución de canal y campaña

La postulación podrá conservar:

```text
first_touch_channel
first_touch_campaign
first_touch_at
submission_channel
submission_campaign
submission_attribution
referral_code
landing_url
utm_or_equivalent_normalized
```

Reglas:

1. Los valores provenientes de URL se consideran no confiables hasta
   normalización.
2. La atribución no cambia permisos, etapas, elegibilidad o tratamiento.
3. No se incluirán datos personales en parámetros públicos.
4. Se conservará diferencia entre primer contacto y canal de envío.
5. Los enlaces QR, Instagram, WhatsApp, web corporativa y referidos utilizarán el
   contrato definido por `OPS-CAN-001`.
6. Los códigos de referido no permitirán enumerar candidatos ni reclutadores.
7. La analítica utilizará identificadores pseudónimos y minimización.

---

#### 20. Confirmación, comunicaciones y próxima acción

Después del envío, TALENTO deberá mostrar inmediatamente:

- número o referencia de postulación;
- vacante;
- fecha de recepción del servidor;
- estado inicial;
- próxima acción conocida;
- canal de comunicación seleccionado;
- advertencia de que el acuse no equivale a preselección o contratación.

La confirmación podrá enviarse por correo, push o canal autorizado, pero la falta
de entrega de un canal no eliminará la postulación.

La interfaz deberá distinguir:

```text
POSTULACIÓN RECIBIDA
COMUNICACIÓN ENVIADA
COMUNICACIÓN ENTREGADA
COMUNICACIÓN LEÍDA
```

No se enviarán documentos, resultados sensibles o enlaces de sesión en mensajes
no protegidos.

---

#### 21. Accesibilidad e inclusión

La superficie web tendrá como objetivo verificable `WCAG 2.2 AA`; las
aplicaciones nativas deberán ofrecer comportamiento equivalente según las
capacidades de accesibilidad de cada plataforma.

Como mínimo:

- navegación completa por teclado en web;
- foco visible y no oculto;
- etiquetas compatibles con lectores de pantalla;
- orden semántico;
- contraste suficiente;
- áreas táctiles adecuadas;
- errores asociados al campo y resumen general;
- instrucciones que no dependan únicamente de color, posición o icono;
- autenticación accesible;
- no exigir arrastrar como única interacción;
- ampliación de texto sin perder acciones;
- lenguaje claro;
- alternativas para personas con conectividad limitada;
- recuperación sin volver a digitar datos válidos;
- canal para solicitar ajustes en el proceso.

Una validación de accesibilidad automática no será evidencia suficiente; se
requieren pruebas manuales y con tecnologías de asistencia dentro de los
paquetes definidos posteriormente.

---

#### 22. Seguridad, abuso y protección de la superficie pública

La apertura pública no elimina los controles de seguridad.

Se deberán prever:

- rate limiting por operación y riesgo;
- protección contra automatización abusiva;
- límites de creación de cuenta y envío;
- detección de duplicados sin revelar si una persona específica existe;
- normalización y validación de entradas;
- prevención de enumeración de vacantes internas, candidatos o postulaciones;
- CSP, cabeceras y configuración segura de web cuando se implemente;
- expiración y rotación de enlaces sensibles;
- logs sin CV, respuestas completas, tokens ni datos médicos;
- bloqueo y apelación auditables;
- CAPTCHA solo cuando el riesgo lo justifique y con alternativa accesible;
- separación de analítica, autenticación y decisión de selección;
- no confiar en plataforma, user agent, campaña o código de referido para
  autorizar acciones.

Una señal antifraude puede detener o revisar el envío, pero no producir rechazo
laboral definitivo. `CAP-TAL-004` deberá gobernar cualquier efecto sobre la
evaluación.

---

#### 23. Paridad entre web, PWA y aplicaciones nativas

##### 23.1. Paridad obligatoria

Todas las plataformas soportadas deberán conservar:

- listado y detalle coherentes;
- misma disponibilidad;
- misma versión pública;
- mismo contrato de preguntas;
- mismo consentimiento;
- misma validación de servidor;
- misma política de duplicados;
- mismo acuse;
- mismo historial del candidato;
- mismas reglas de autorización.

##### 23.2. Adaptaciones válidas

Pueden diferir:

- navegación visual;
- tamaño y distribución;
- selector de archivos;
- cámara;
- almacenamiento seguro;
- notificaciones;
- apertura de enlaces;
- teclado y gestos;
- instalación y actualización.

##### 23.3. Adaptaciones prohibidas

Una plataforma no podrá:

- mostrar vacantes cerradas como activas;
- pedir menos consentimiento para enviar;
- omitir preguntas obligatorias;
- permitir postulación duplicada;
- crear postulaciones sin autenticación requerida;
- ocultar una razón de error disponible en otra;
- utilizar una API legacy con reglas distintas;
- almacenar datos sensibles de forma menos protegida.

---

#### 24. Panel interno y fronteras de administración

Aunque el panel de reclutamiento pueda alojarse visualmente en VISO, deberá
operar mediante contratos de TALENTO para:

- revisar publicaciones;
- consultar postulaciones;
- observar fuente y métricas;
- corregir contenido público dentro de su autoridad;
- pausar o cerrar una publicación;
- resolver errores de despliegue;
- consultar auditoría.

El panel no podrá:

- editar directamente el snapshot de una postulación;
- insertar una postulación en nombre del candidato sin ruta de excepción;
- convertir un borrador en enviado;
- modificar respuestas;
- alterar atribución para mejorar métricas;
- crear empleado o acceso ANIMA;
- editar la vacante empresarial sin pasar por VISO.

Las postulaciones asistidas presencialmente deberán usar una ruta explícita,
identificar actor asistente, conservar consentimiento del candidato y no
simular que la persona operó el dispositivo.

---

#### 25. Eventos y auditoría

Eventos mínimos:

```text
VACANCY_PUBLICATION_CREATED
VACANCY_PUBLICATION_APPROVED
VACANCY_PUBLICATION_SCHEDULED
VACANCY_PUBLICATION_STARTED
VACANCY_PUBLICATION_SUCCEEDED
VACANCY_PUBLICATION_FAILED
VACANCY_PUBLICATION_PAUSED
VACANCY_PUBLICATION_CLOSED
VACANCY_PUBLICATION_EXPIRED
VACANCY_VIEWED
APPLICATION_DRAFT_STARTED
AUTH_CONTEXT_PRESERVED
APPLICATION_SUBMISSION_STARTED
APPLICATION_SUBMITTED
APPLICATION_SUBMISSION_REUSED
APPLICATION_SUBMISSION_FAILED
APPLICATION_WITHDRAWN
PRIMARY_APPLICATION_CHANGED
```

Cada evento material conservará cuando aplique:

```text
event_id
correlation_id
trace_id
actor_id
actor_type
candidate_id
vacancy_id
vacancy_version
publication_id
publication_version
application_id
platform
app_version
source_context
action
before
after
reason_codes
idempotency_key
occurred_at
```

Los eventos de vista y analítica no almacenarán contenido sensible ni se
confundirán con auditoría jurídica o de autorización.

---

#### 26. Métricas canónicas

Se podrán medir:

- publicaciones creadas, publicadas, fallidas, pausadas y cerradas;
- tiempo desde aprobación hasta publicación disponible;
- impresiones y visitas por publicación;
- apertura de detalle;
- inicio de borrador;
- inicio y finalización de autenticación;
- inicio, éxito y fallo de envío;
- duplicados evitados;
- abandono por paso;
- conversión por canal y plataforma;
- tiempo de respuesta del sistema;
- accesibilidad y errores críticos;
- diferencia de comportamiento entre web, PWA, Android e iOS.

No se utilizarán métricas para:

- inferir rasgos sensibles;
- vender o reutilizar datos de candidatos;
- penalizar a una persona por el dispositivo usado;
- confundir visitas con postulaciones;
- ocultar fallos mediante reintentos;
- optimizar velocidad a costa de calidad o privacidad.

La definición ejecutable de métricas y sus denominadores deberá madurarse en el
paquete de implementación derivado por `CAP-TAL-006`.

---

#### 27. Manejo de errores y recuperación

Errores funcionales mínimos:

```text
publication_not_found
publication_not_open
publication_version_changed
publication_deployment_failed
candidate_not_found
candidate_identity_conflict
application_already_exists
application_locked
required_answers_missing
consent_version_invalid
idempotency_conflict
authentication_required
access_denied
rate_limited
network_unavailable
submission_result_unknown
```

Reglas:

1. El error será accionable y no revelará datos de terceros.
2. `submission_result_unknown` obligará a consultar por idempotency key antes de
   reintentar.
3. Si cambió la versión, se mostrará un resumen y se pedirá revisión.
4. Si la publicación cerró durante el formulario, se conservará el borrador y se
   explicará que no pudo enviarse.
5. Un fallo de notificación no revertirá una postulación válida.
6. Un fallo de analítica no bloqueará el envío.
7. Un fallo de despliegue web no convertirá la publicación en `PUBLISHED`.
8. Todo workaround manual deberá quedar auditado y vinculado a una tarea futura.

---

#### 28. Modelo inicial de rutas universales

```text
src/app/
├── index
├── vacantes/index
├── vacantes/[slug]
├── postular/[slug]
├── (auth)/ingresar
├── (candidate)/inicio
├── (candidate)/mis-postulaciones
├── (candidate)/postulaciones/[application_id]
├── privacidad
├── accesibilidad
└── +not-found
```

Este árbol es contractual, no una orden de implementar archivos exactos.

Principios:

- las rutas públicas no dependen de tabs móviles;
- las rutas privadas pueden usar layouts diferentes por plataforma;
- una URL pública mantiene significado en web y native;
- los grupos visuales no cambian el path canónico;
- rutas internas o administrativas no se exponen por compartir el proyecto;
- la autorización se ejecuta en servidor además de navegación protegida.

---

#### 29. Estrategia inicial de renderizado y despliegue web

##### 29.1. Decisión inicial

```text
PUBLICACIONES CONOCIDAS Y DE BAJO VOLUMEN
→ SALIDA WEB STATIC
→ HTML POR RUTA PÚBLICA
→ REGENERACIÓN AL PUBLICAR O CAMBIAR
```

##### 29.2. Reglas operativas

1. Publicar inicia una operación correlacionada de generación y despliegue.
2. La publicación no queda `PUBLISHED` hasta verificar la URL canónica.
3. El listado y detalle deben provenir de la misma versión.
4. Una publicación urgente no utilizará una ruta manual no auditable.
5. Si aumenta el volumen o frecuencia y la regeneración deja de cumplir el SLA,
   `CAP-TAL-006` deberá evaluar `web.output = server` u otra infraestructura.
6. La evolución no deberá cambiar el dominio, URLs, snapshots ni contrato de
   postulación.
7. Los builds Android e iOS no deberán contener un catálogo congelado; consumirán
   la proyección publicada vigente y respetarán cache/versionado.

---

#### 30. Compatibilidad y migración desde el scaffold existente

El scaffold actual de `vento-talento` podrá reutilizar:

- Expo y Expo Router;
- estructura de rutas;
- componentes comunes;
- cliente Supabase;
- contratos conceptuales de vacantes y postulaciones;
- navegación inicial.

Antes de implementación deberá corregirse cualquier supuesto que:

- trate el producto como exclusivamente móvil;
- cree o edite vacantes fuente directamente en TALENTO;
- permita escrituras directas que omitan funciones de dominio;
- use `service_role` como autorización funcional;
- exponga tablas completas en la superficie pública;
- duplique candidato por plataforma;
- asuma que ocultar una pantalla protege datos;
- cierre la postulación sin snapshot o idempotencia;
- acople el panel interno a una fuente diferente de TALENTO.

La evaluación y plan de materialización corresponderán a `CAP-TAL-006`. Esta
tarea no autoriza refactor, migración o despliegue.

---

#### 31. Matriz de escenarios críticos

| Escenario                                                       | Resultado obligatorio                                                         |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| persona abre enlace desde Instagram sin app                     | ve detalle web sin instalar ni autenticarse                                   |
| app instalada abre la misma URL                                 | abre detalle equivalente mediante enlace universal                            |
| publicación está cerrada en servidor pero cacheada como abierta | no permite enviar y muestra cierre actualizado                                |
| usuario inicia auth desde una vacante                           | vuelve a la misma publicación y versión                                       |
| enlace de autenticación se abre en otro dispositivo             | recupera contexto seguro o solicita selección explícita, sin exponer borrador |
| doble toque en enviar                                           | una sola postulación y mismo acuse                                            |
| respuesta del servidor se pierde                                | consulta por idempotency key antes de reintentar                              |
| publicación cambia materialmente durante borrador               | exige revisar nueva versión                                                   |
| candidato ya tiene aplicación activa                            | muestra la existente, no crea otra                                            |
| candidato aplica a otra vacante                                 | reutiliza identidad y crea postulación distinta                               |
| web deployment falla                                            | publicación no queda como publicada                                           |
| notificación falla después del envío                            | postulación permanece válida y el fallo queda visible                         |
| aplicación nativa usa una versión antigua                       | servidor aplica contrato vigente o exige actualización controlada             |
| persona usa lector de pantalla o teclado                        | puede descubrir, completar y enviar sin barrera crítica                       |
| bot intenta enumerar vacantes internas                          | solo recibe proyección pública y controles de abuso                           |
| reclutador ayuda presencialmente                                | queda actor asistente y consentimiento, sin suplantar al candidato            |

---

#### 32. Brechas y destino documental obligatorio

| Brecha o decisión diferida                                             | Tarea propietaria                                              | Momento de cierre                              |
| ---------------------------------------------------------------------- | -------------------------------------------------------------- | ---------------------------------------------- |
| tipos de documentos, versiones, consentimiento granular y retención    | `CAP-TAL-003`                                                  | antes de especificar Storage o expediente      |
| entrevistas, pruebas, evaluación, decisión, oferta y pre-registro      | `CAP-TAL-004`                                                  | antes de autorizar transición a pre-ingreso    |
| contrato transaccional de handoff hacia VISO y ANIMA                   | `CAP-TAL-005`                                                  | antes de crear empleado o acceso               |
| período de prueba, permisos provisionales, continuidad y cierre        | `CAP-TAL-006`                                                  | antes de activar trabajadores mediante TALENTO |
| decisión de publicar builds nativos, PWA avanzada o renderizado server | `CAP-TAL-006`                                                  | puerta de roadmap BLOQUE Y                     |
| implementación de RLS, RPC, Storage, CI y despliegues                  | roadmap materializado por `CAP-TAL-006`                        | E3, E4 y E5 según paquete aprobado             |
| pantallas y contratos detallados transversales                         | `PROC-SCREEN-001` a `PROC-SCREEN-028`                          | después de UX base y estaciones                |
| validación de experiencia con usuarios y accesibilidad                 | `UX-QA-001` a `UX-QA-030`                                      | certificación del BLOQUE U                     |
| protección y autorización del dominio                                  | `AUTH-DB-001` a `AUTH-DB-035`; `AUTH-SRV-001` a `AUTH-SRV-018` | arquitectura e implementación posteriores      |
| enlaces e integración entre aplicaciones                               | `INT-APP-001` a `INT-APP-010`                                  | BLOQUE X y paquetes consumidores               |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 33. Requisitos de prueba derivados

Esta tarea crea:

```text
TREQ-TALENTO-012
TREQ-TALENTO-013
TREQ-TALENTO-014
TREQ-TALENTO-015
TREQ-TALENTO-016
TREQ-TALENTO-017
TREQ-TALENTO-018
TREQ-TALENTO-019
TREQ-TALENTO-020
TREQ-TALENTO-021
TREQ-TALENTO-022
```

También modifica evidencia de:

```text
TREQ-TALENTO-001 a TREQ-TALENTO-011
```

El detalle completo se conserva exclusivamente en
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

---

#### 34. Criterios de aceptación

`CAP-TAL-002` podrá aprobarse cuando quede aceptado que:

1. TALENTO será un producto universal en Expo y Expo Router;
2. la web permitirá consultar y comenzar sin instalación obligatoria;
3. PWA y apps nativas serán superficies del mismo dominio, no productos
   paralelos;
4. VISO conserva la vacante empresarial y TALENTO la publicación versionada;
5. cada postulación referencia la versión exacta consultada;
6. consulta pública y datos protegidos quedan separados;
7. la autenticación conserva el contexto de la vacante;
8. el envío es atómico, idempotente y produce acuse del servidor;
9. se permiten múltiples postulaciones sin duplicar persona;
10. existe como máximo una postulación principal activa para vinculación;
11. los datos iniciales son mínimos y los documentos quedan para `CAP-TAL-003`;
12. las URLs son estables, compartibles y compatibles con web y enlaces
    universales;
13. publicación, despliegue e indexación no se confunden;
14. la experiencia contempla accesibilidad, baja conectividad y recuperación;
15. ninguna regla de publicación o postulación contrata, crea empleado o concede
    acceso;
16. cada brecha queda vinculada a una tarea existente;
17. no se ejecutan cambios técnicos durante esta tarea documental.

---

#### 35. Decisiones propuestas para aprobación

1. Aprobar Expo universal como base de TALENTO.
2. Aprobar web responsive como canal principal de descubrimiento y postulación.
3. Aprobar PWA como capacidad opcional y no obligatoria.
4. Aprobar builds Android e iOS desde el mismo proyecto cuando readiness lo
   autorice.
5. Aprobar salida web estática y regeneración por publicación como arquitectura
   inicial que no depende de SSR experimental.
6. Aprobar separación entre requisición, vacante empresarial, publicación y
   postulación.
7. Aprobar lifecycle y versionado de publicación.
8. Aprobar consulta pública mediante una whitelist de datos.
9. Aprobar URLs canónicas, metadatos y enlaces universales.
10. Aprobar browsing anónimo y autenticación contextual antes de persistir o
    enviar datos personales.
11. Aprobar captura mínima y progresiva.
12. Aprobar contrato idempotente de postulación y snapshot de versión.
13. Aprobar múltiples postulaciones y una sola principal activa.
14. Aprobar reglas de borradores, caché y recuperación.
15. Aprobar accesibilidad `WCAG 2.2 AA` como objetivo web verificable.
16. Aprobar controles de abuso que no produzcan decisiones laborales automáticas.
17. Mantener implementación, migraciones y despliegues sin iniciar.

---

#### 36. Estado y continuidad

```text
CAP-TAL-001 APROBADA
CAP-TAL-002 APROBADA
CAP-TAL-003 NO INICIADA
```

No se inicia `CAP-TAL-003` hasta la aprobación expresa de esta tarea.


### ✅ CAP-TAL-003 — Diseñar expediente progresivo de datos, documentos, consentimiento y conservación

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `CAP-TAL-002 — Diseñar publicación de vacantes, consulta y postulación en TALENTO` — APROBADA  
**Siguiente tarea reservada:** `CAP-TAL-004 — Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato`  
**Artefacto producido:** `CAP-TAL-PROGRESSIVE-RECORD-CONTRACT-001`  
**Procesos canónicos principales:** `VPROC-0005` y `VPROC-0006`  
**Naturaleza:** gobierno de datos, expediente progresivo, privacidad, documentos, consentimiento, conservación y derechos del titular  
**Superficies consumidoras:** TALENTO web, PWA, Android e iOS; panel interno proyectado en VISO; integraciones autorizadas; proveedores de validación y salud ocupacional  
**Cambios en código, datos, migraciones, RLS, RPC, Storage, Supabase, aplicaciones, contratos externos o políticas jurídicas:** no autorizados

---

#### 1. Propósito

Diseñar el expediente progresivo del candidato para que TALENTO pueda solicitar,
conservar, revisar, compartir, transferir, corregir, bloquear, anonimizar y
suprimir información sin:

- pedir desde la primera postulación todos los datos que podrían llegar a ser
  necesarios durante una contratación;
- tratar una carpeta de archivos como si fuera un expediente gobernado;
- mezclar identidad, perfil reutilizable, postulación, documento, evaluación,
  consentimiento, resultado derivado y expediente laboral;
- usar una autorización genérica para finalidades distintas;
- considerar que aceptar términos equivale a autorizar cualquier tratamiento;
- condicionar la postulación a finalidades opcionales como banco de candidatos,
  marketing o futuras vacantes;
- conservar documentos y datos de forma indefinida por ausencia de una política;
- transferir automáticamente a VISO o ANIMA todo lo recibido durante selección;
- permitir que managers, soporte técnico o aplicaciones consumidoras accedan a
  información que no necesitan;
- almacenar historia clínica ocupacional, diagnósticos o resultados médicos
  detallados dentro del expediente empresarial;
- sobreescribir documentos, consentimientos o decisiones y perder su versión;
- utilizar enlaces públicos, nombres de archivo o rutas como prueba suficiente de
  propiedad, integridad o autorización;
- eliminar una fila y dejar copias en Storage, exportaciones, cachés, colas,
  dispositivos o proveedores;
- ejecutar supresión destructiva cuando exista obligación de conservación,
  disputa, investigación, incidente o legal hold;
- ocultar al candidato qué información existe, por qué se usa y cómo ejercer sus
  derechos;
- hardcodear plazos jurídicos dentro de interfaces o funciones sin una política
  versionada y validada.

Esta tarea define el contrato funcional y documental. No autoriza todavía
implementación, migraciones, creación de buckets, proveedores, tratamiento de
información real ni fijación unilateral de términos legales.

---

#### 2. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. qué compone el expediente progresivo y qué queda fuera de él;
2. qué datos pueden solicitarse en cada fase;
3. cómo se clasifica la información por finalidad, sensibilidad y propietario;
4. cómo se versionan avisos, autorizaciones y consentimientos;
5. cómo se distinguen finalidades obligatorias y opcionales;
6. cómo se modelan requisitos, documentos, archivos, revisiones y hechos
   derivados;
7. cómo se protege y revisa cada archivo;
8. qué información médica puede conocer Vento Group y cuál debe permanecer bajo
   reserva del prestador competente;
9. cómo se gobiernan terceros, encargados, exportaciones y transferencias;
10. cómo se determina conservación, bloqueo, anonimización y eliminación;
11. cómo ejerce la persona acceso, corrección, actualización, revocatoria o
    supresión cuando proceda;
12. qué información puede transferirse al expediente laboral;
13. qué eventos y pruebas deberán proteger estas decisiones;
14. qué materias quedan asignadas a `CAP-TAL-004`, `CAP-TAL-005` y
    `CAP-TAL-006`.

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `CAP-TAL-001` y la separación entre TALENTO, VISO y ANIMA;
- `CAP-TAL-002` y el contrato universal de publicación y postulación;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `OPS-CAN-001` para canales, mensajes y atribución;
- el modelo canónico de identidad, autorización, sesión, alcance y auditoría;
- `EVID-ARC-001` a `EVID-ARC-010` para evidencia, integridad y conservación;
- `AUTH-DB-001` a `AUTH-DB-035` y `AUTH-SRV-001` a `AUTH-SRV-018` para
  protección de datos y comandos;
- la decisión de que TALENTO conserva el expediente prelaboral;
- la decisión de que VISO conserva la autoridad laboral y el expediente
  administrativo del vínculo;
- la decisión de que ANIMA no recibe notas internas de reclutamiento ni
  información médica detallada;
- la decisión de que candidato y empleado son relaciones diferentes de una misma
  persona enlazada;
- la prohibición de materializar vínculo o acceso a partir de un documento,
  consentimiento o invitación.

Los documentos actuales de `vento-talento`, sus modelos SQL y sus buckets se
consideran drafts AS-IS. Esta tarea establece el contrato TO-BE aunque exija
reemplazar estructuras existentes.

---

#### 4. Marco normativo y límite profesional

El diseño deberá implementarse conforme al régimen colombiano de protección de
datos y a las reglas laborales y de salud ocupacional vigentes que resulten
aplicables.

Referencias mínimas para revisión profesional:

- Ley Estatutaria 1581 de 2012;
- Decreto 1074 de 2015 y reglamentación aplicable;
- política empresarial de tratamiento de información vigente;
- normas laborales y de seguridad y salud en el trabajo aplicables;
- Resolución 2346 de 2007 o norma que la modifique, adicione o sustituya para
  evaluaciones médicas ocupacionales e historia clínica ocupacional.

Principios funcionales que el sistema deberá poder demostrar:

```text
FINALIDAD
LIBERTAD Y AUTORIZACIÓN CUANDO CORRESPONDA
MINIMIZACIÓN Y PERTINENCIA
CALIDAD Y ACTUALIZACIÓN
TRANSPARENCIA
ACCESO RESTRINGIDO
SEGURIDAD
CONFIDENCIALIDAD
RESPONSABILIDAD DEMOSTRADA
CONSERVACIÓN LIMITADA A LA FINALIDAD Y OBLIGACIONES APLICABLES
```

Esta tarea no:

- emite concepto jurídico;
- sustituye a asesoría laboral, de privacidad o salud ocupacional;
- declara que una autorización sea la única base aplicable en todos los casos;
- fija períodos legales definitivos;
- decide qué documentos son obligatorios para cada cargo;
- autoriza almacenar historia clínica ocupacional en TALENTO.

Los plazos, textos jurídicos, responsables formales y canales de atención deberán
ser validados antes de implementación dentro de `CAP-TAL-006` y el paquete E5
correspondiente.

---

#### 5. Principio rector del expediente progresivo

```text
NO PEDIR TODO AL INICIO
        ↓
PEDIR EL DATO MÍNIMO
        ↓
CUANDO EXISTA UNA FINALIDAD VIGENTE
        ↓
EN LA ETAPA CORRECTA
        ↓
CON AVISO, AUTORIDAD Y ACCESO ADECUADOS
        ↓
CON FECHA DE REVISIÓN Y DESTINO DE CIERRE
```

Cada elemento del expediente deberá responder:

```text
¿QUÉ ES?
¿DE QUIÉN ES?
¿PARA QUÉ SE NECESITA?
¿PARA QUÉ POSTULACIÓN O VÍNCULO?
¿QUIÉN LO SOLICITÓ?
¿QUIÉN PUEDE VERLO?
¿ES OBLIGATORIO U OPCIONAL?
¿QUÉ VERSIÓN Y VIGENCIA TIENE?
¿DE DÓNDE PROVIENE?
¿QUÉ HECHO DEMUESTRA?
¿CUÁNDO DEBE REVISARSE?
¿CUÁNDO DEBE BLOQUEARSE, TRANSFERIRSE, ANONIMIZARSE O ELIMINARSE?
```

Un dato que no pueda responder estas preguntas no deberá incorporarse como
campo, documento, metadata libre, nota, evento o log.

---

#### 6. Distinciones obligatorias

```text
PERSONA
≠ IDENTIDAD DE AUTENTICACIÓN
≠ CANDIDATO
≠ PERFIL REUTILIZABLE
≠ POSTULACIÓN
≠ EXPEDIENTE DE POSTULACIÓN
≠ REQUISITO
≠ DOCUMENTO
≠ ARCHIVO BINARIO
≠ REVISIÓN
≠ RESULTADO DERIVADO
≠ CONSENTIMIENTO
≠ EMPLEADO
≠ EXPEDIENTE LABORAL
```

Definiciones:

| Objeto             | Definición                                             | Fuente de verdad                  |
| ------------------ | ------------------------------------------------------ | --------------------------------- |
| persona            | ser humano al que se vinculan relaciones               | identidad canónica                |
| auth identity      | credencial y sujeto técnico de autenticación           | proveedor de identidad autorizado |
| candidate          | relación prelaboral de la persona con TALENTO          | TALENTO                           |
| candidate profile  | datos reutilizables y corregibles del candidato        | TALENTO                           |
| application        | participación en una vacante y ronda concretas         | TALENTO                           |
| application record | conjunto lógico de hechos de esa postulación           | TALENTO                           |
| requirement        | dato, acción o documento solicitado                    | TALENTO según regla autorizada    |
| document record    | metadatos y estado del documento                       | TALENTO                           |
| file object        | contenido binario privado                              | Storage autorizado                |
| document review    | decisión sobre una versión concreta                    | TALENTO                           |
| derived fact       | hecho extraído o verificado sin reemplazar el original | dominio que lo produce            |
| consent record     | evidencia versionada de una manifestación              | ledger de privacidad              |
| employee           | relación laboral activa o histórica                    | dominio laboral/VISO              |
| labor record       | expediente administrativo del vínculo                  | VISO/dominio laboral              |

Reglas:

1. El archivo no será la fuente de verdad del estado del documento.
2. La aprobación de un documento no valida toda la identidad de la persona.
3. Un dato extraído no reemplaza ni modifica silenciosamente el original.
4. Una nota interna no podrá convertirse en atributo permanente de la persona.
5. Un documento utilizado en varias postulaciones conservará relación y decisión
   por cada uso.
6. El expediente no será un único JSON sin tipado, versión, propietario o
   política.

---

#### 7. Modelo de recolección progresiva por fase

##### 7.1. Fases

| Fase                    | Relación                              | Datos permitidos                                                                | Datos que no corresponden todavía                            |
| ----------------------- | ------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `P0_DISCOVERY`          | visitante anónimo                     | preferencia de búsqueda no identificable, idioma, accesibilidad local           | identidad, CV, documento, salud                              |
| `P1_IDENTITY_BOOTSTRAP` | usuario autenticado/candidato inicial | nombre, contacto verificado, ciudad general, aceptación del aviso               | dirección exacta, datos bancarios, historia médica           |
| `P2_APPLICATION`        | postulación enviada                   | disponibilidad, experiencia resumida, respuestas objetivas, fuente y versión    | contratación completa, afiliaciones, cuenta bancaria         |
| `P3_SCREENING`          | postulación en revisión               | CV, certificados o licencias estrictamente relacionados                         | documentos laborales generales sin necesidad actual          |
| `P4_INTERVIEW`          | candidato preseleccionado             | agenda, confirmaciones, evidencias de entrevista y ajustes solicitados          | diagnósticos, datos de terceros no necesarios                |
| `P5_VALIDATION`         | candidato en validaciones             | resultados mínimos autorizados, verificaciones y concepto ocupacional permitido | historia clínica, exámenes detallados en poder del empleador |
| `P6_OFFER_PREBOARDING`  | candidato seleccionado                | identidad reforzada, documentos de ingreso, condiciones y checklist             | permisos laborales activos antes de la autoridad VISO        |
| `P7_HANDOFF`            | vínculo autorizado                    | whitelist laboral, lineage y referencias necesarias                             | notas de reclutamiento, scoring interno, diagnósticos        |
| `P8_CLOSED`             | proceso terminado                     | histórico mínimo, auditoría, obligaciones y consentimiento de banco si existe   | retención indiscriminada de archivos y datos operativos      |

##### 7.2. Reglas

1. Cada campo o documento tendrá `earliest_collection_phase`.
2. El cliente no podrá solicitarlo antes de esa fase.
3. Un cambio de fase no autoriza automáticamente todos los datos de la fase
   siguiente.
4. La solicitud será creada por una regla de cargo, vacante, riesgo o excepción
   aprobada.
5. Los datos opcionales no bloquearán el avance salvo decisión distinta y
   jurídicamente válida.
6. Una respuesta sensible deberá indicar expresamente su carácter facultativo
   cuando corresponda.
7. La interfaz explicará la finalidad en lenguaje comprensible antes de capturar.
8. La falta de un dato no permitido o prematuro nunca se tratará como expediente
   incompleto.

---

#### 8. Clasificación canónica de información

| Clase                              | Contenido típico                                                 | Acceso base                    | Regla                                               |
| ---------------------------------- | ---------------------------------------------------------------- | ------------------------------ | --------------------------------------------------- |
| `D0_PUBLIC`                        | publicación de vacante y contenido público autorizado            | público                        | solo whitelist                                      |
| `D1_INTERNAL_OPERATIONAL`          | IDs, estados, tareas, SLA y routing sin contenido sensible       | actores del proceso            | mínimo por función                                  |
| `D2_PRIVATE_IDENTITY_CONTACT`      | nombre, contacto, identificación y perfil                        | candidato y roles autorizados  | cifrado, RLS y trazabilidad                         |
| `D3_RESTRICTED_SELECTION`          | CV, entrevista, evaluación, referencias y notas internas         | reclutamiento autorizado       | no visible en ANIMA                                 |
| `D4_SENSITIVE_PERSONAL`            | biometría, salud u otra categoría sensible                       | acceso explícito y restringido | autorización y finalidad reforzadas cuando apliquen |
| `D5_OCCUPATIONAL_MEDICAL_RESERVED` | historia clínica, exámenes, diagnósticos y valoraciones clínicas | prestador competente y titular | no se almacena en expediente empresarial            |
| `D6_SECURITY_SECRET`               | tokens, claves, OTP, hashes y secretos                           | servicios autorizados          | nunca como documento o metadata de negocio          |

Reglas:

- La clasificación será obligatoria por tipo de dato y documento.
- `metadata` no podrá usarse para evadir la clasificación.
- Una clase más sensible prevalece cuando un archivo contiene categorías mixtas.
- La descarga, exportación, visualización, retención y transferencia dependerán
  de la clase.
- Los controles no se basarán únicamente en ocultar botones.
- El acceso de soporte técnico no equivaldrá a acceso al contenido.

---

#### 9. Catálogo de datos y finalidades

Antes de implementar un campo, pregunta, documento o evento deberá existir una
entrada versionada con:

```text
data_element_code
display_name
description
owner_domain
source
classification
purpose_code
purpose_description
applicable_phases
mandatory_or_optional
condition_rule
allowed_values_or_schema
verification_method
allowed_roles
allowed_consumers
transfer_rule
retention_policy_code
correction_rule
deletion_rule
legal_or_policy_reference
version
effective_from
effective_to
status
approved_by
```

Estados mínimos:

```text
DRAFT
UNDER_REVIEW
APPROVED
ACTIVE
DEPRECATED
RETIRED
```

Ninguna UI podrá crear campos libres permanentes sin catálogo. Las notas libres
se limitarán por finalidad, sensibilidad, audiencia, longitud, retención y
reglas de redacción.

---

#### 10. Arquitectura del aviso y consentimiento

##### 10.1. Objetos separados

```text
PRIVACY NOTICE
→ información al titular

AUTHORIZATION OR CONSENT
→ manifestación verificable para finalidades aplicables

OPERATIONAL ACKNOWLEDGEMENT
→ confirmación de lectura o acción

CONTRACTUAL ACCEPTANCE
→ aceptación de condiciones específicas

COMMUNICATION PREFERENCE
→ canal y tipo de comunicación
```

No serán intercambiables.

##### 10.2. Ledger mínimo

Cada registro deberá conservar:

```text
consent_record_id
person_id
candidate_id
application_id opcional
purpose_code
purpose_version
notice_id
notice_version
policy_version
language
surface
platform
actor_type
collection_method
mandatory_or_optional
sensitive_data_flag
decision
captured_at
server_received_at
ip_or_device_evidence_minimized
content_hash
evidence_reference
withdrawn_at
withdrawal_reason
superseded_by
```

##### 10.3. Finalidades separadas

Como mínimo se diferenciarán:

1. gestionar una postulación concreta;
2. verificar información y requisitos de selección;
3. coordinar entrevistas y comunicaciones operativas;
4. realizar validaciones específicas autorizadas;
5. conservar el perfil para futuras vacantes o banco de candidatos;
6. transferir una whitelist al expediente laboral si se autoriza el vínculo;
7. recibir comunicaciones no operativas o de marca;
8. tratar datos sensibles cuando sea necesario y permitido;
9. compartir información con encargados o prestadores determinados;
10. producir estadísticas anonimizadas o agregadas.

El consentimiento para una postulación no incluirá silenciosamente banco de
candidatos, marketing, futuras vacantes o tratamiento sensible.

---

#### 11. Reglas de autorización, obligatoriedad y retiro

1. La autorización se presentará antes o al momento de la recolección aplicable.
2. El texto completo y la versión permanecerán consultables posteriormente.
3. Las casillas opcionales no estarán premarcadas.
4. El silencio, continuar navegando o instalar la app no equivaldrán a
   consentimiento.
5. Una finalidad opcional rechazada no bloqueará una postulación válida.
6. Los datos sensibles se tratarán mediante flujo separado, explícito y
   reforzado cuando correspondan.
7. La persona podrá retirar finalidades opcionales desde autoservicio o canal
   asistido.
8. Retirar una finalidad no eliminará retroactivamente actos ya realizados ni
   información que deba conservarse por obligación, defensa o auditoría.
9. El sistema calculará el efecto del retiro sobre procesos activos y lo
   explicará antes de confirmar.
10. Una nueva finalidad o cambio material exigirá nueva versión y manifestación;
    no se ampliará el consentimiento anterior.
11. Un error de captura no podrá corregirse editando el registro original; se
    creará corrección o supersesión auditada.

---

#### 12. Derechos del titular y gestión de solicitudes

TALENTO deberá permitir iniciar y seguir solicitudes de:

```text
ACCESS
PROOF_OF_AUTHORIZATION
UPDATE
CORRECTION
PURPOSE_INFORMATION
CONSENT_WITHDRAWAL
SUPPRESSION_WHEN_APPLICABLE
OBJECTION_OR_RESTRICTION_WHEN_APPLICABLE
DATA_COPY
COMPLAINT
```

Objeto mínimo del caso:

```text
privacy_case_id
request_type
requester_person_id
identity_verification_level
scope
received_at
legal_due_at
status
assigned_owner
requested_evidence
actions
resolution
resolved_at
notification_status
appeal_or_reopen_reference
```

Estados:

```text
RECEIVED
IDENTITY_PENDING
IN_REVIEW
INFORMATION_REQUIRED
PARTIALLY_FULFILLED
FULFILLED
DENIED_WITH_BASIS
CLOSED
REOPENED
```

Reglas:

- Los plazos se resolverán desde una política legal versionada, no desde texto
  hardcodeado en la UI.
- La identidad se verificará proporcionalmente al alcance solicitado.
- No se exigirán más datos que los necesarios para autenticar al solicitante.
- La respuesta distinguirá dato, fuente, finalidad, destinatarios, vigencia y
  acciones ejecutadas.
- La corrección conservará historial cuando el dato haya soportado una decisión.
- Una solicitud no dará acceso a datos de evaluadores, referencias o terceros.
- La denegación será motivada, auditada y revisable.

---

#### 13. Taxonomía documental

| Familia                        | Ejemplos                                         | Propietario                         | Transferencia laboral base          |
| ------------------------------ | ------------------------------------------------ | ----------------------------------- | ----------------------------------- |
| `SELECTION_PROFILE`            | CV, portafolio, experiencia                      | TALENTO                             | no por defecto                      |
| `IDENTITY_EVIDENCE`            | documento de identidad, verificación             | TALENTO durante selección           | whitelist condicionada              |
| `QUALIFICATION_EVIDENCE`       | certificados, licencias, cursos                  | TALENTO                             | posible si el cargo lo exige        |
| `INTERVIEW_EVIDENCE`           | guías, respuestas y notas                        | TALENTO                             | no                                  |
| `REFERENCE_EVIDENCE`           | referencias autorizadas y resultado              | TALENTO                             | no por defecto                      |
| `VALIDATION_EVIDENCE`          | verificaciones no médicas                        | TALENTO                             | solo resultado necesario            |
| `OCCUPATIONAL_CERTIFICATE`     | concepto de aptitud y recomendaciones permitidas | prestador; proyección mínima a VISO | sí, como concepto mínimo autorizado |
| `OCCUPATIONAL_CLINICAL_RECORD` | historia, exámenes, diagnósticos                 | prestador competente                | nunca a Vento Group como expediente |
| `PREBOARDING_DOCUMENT`         | documentos definitivos de ingreso                | TALENTO/VISO según fase             | whitelist                           |
| `LABOR_DOCUMENT`               | contrato y documentos del vínculo                | VISO/dominio laboral                | ya pertenece al expediente laboral  |
| `CONSENT_EVIDENCE`             | aviso, autorización y retiro                     | ledger de privacidad                | solo evidencia necesaria            |
| `SYSTEM_EVIDENCE`              | hashes, acuses, logs y eventos                   | dominio productor                   | no como documento visible ordinario |

Cada tipo documental deberá tener código estable, esquema, clasificación,
versionado, obligatoriedad condicional, emisor permitido, validación, retención
y destino.

---

#### 14. Requisito, archivo, documento, revisión y hecho derivado

```text
REQUIREMENT
→ qué debe aportarse o completarse

FILE OBJECT
→ bytes privados recibidos

DOCUMENT RECORD
→ identidad, versión, clasificación y estado del documento

REVIEW
→ decisión de un actor sobre una versión concreta

DERIVED FACT
→ hecho verificado utilizado por el proceso
```

Ejemplo:

```text
REQUISITO: licencia vigente para conducir
ARCHIVO: PDF o fotografía aportada
DOCUMENTO: licencia de conducción versión 2
REVISIÓN: formato legible y vigencia validada
HECHO DERIVADO: categoría autorizada y fecha de expiración
```

Reglas:

1. El hecho derivado conservará referencia al documento y revisión fuente.
2. Corregir el hecho no modificará el archivo original.
3. Reemplazar el archivo producirá versión nueva y nueva revisión.
4. La versión anterior podrá quedar `SUPERSEDED`, no desaparecer silenciosamente.
5. Un documento aprobado para una postulación no será automáticamente válido
   para otra si cambió finalidad, cargo, vigencia o autoridad.

---

#### 15. Ciclo de vida documental

Estados mínimos:

```text
REQUESTED
→ UPLOAD_STARTED
→ UPLOADED
→ SECURITY_CHECK_PENDING
→ QUARANTINED o SECURITY_CLEARED
→ IN_REVIEW
→ APPROVED o REJECTED o REPLACEMENT_REQUIRED
→ SUPERSEDED o EXPIRED o WITHDRAWN
→ RETENTION_HOLD opcional
→ SCHEDULED_FOR_DELETION
→ DELETED o ANONYMIZED
```

Reglas:

- `UPLOADED` no significa seguro, legible, auténtico ni aprobado.
- Un archivo en cuarentena no será visible al revisor ordinario.
- Rechazar exigirá razón estructurada y mensaje público separado de la nota
  interna.
- El revisor no modificará el archivo aportado.
- Aprobar identificará versión, alcance y vigencia.
- Un documento vencido no se borrará si soporta una decisión que deba conservarse;
  cambiará su usabilidad.
- El candidato podrá retirar un documento cuando no exista bloqueo aplicable,
  pero la acción no eliminará la auditoría de que fue aportado y retirado.

---

#### 16. Contrato de carga, integridad y Storage

Todo archivo deberá pasar por:

```text
SOLICITUD AUTORIZADA
→ PREVALIDACIÓN DE TIPO Y TAMAÑO
→ CARGA A CONTENEDOR PRIVADO
→ REGISTRO DE METADATA
→ HASH DE INTEGRIDAD
→ VALIDACIÓN REAL DE CONTENIDO
→ ESCANEO O CONTROL DE SEGURIDAD
→ CUARENTENA O LIBERACIÓN
→ REVISIÓN FUNCIONAL
```

Metadatos mínimos:

```text
file_object_id
document_id
document_version
candidate_id
application_id opcional
requirement_id opcional
bucket_code
storage_path
original_filename_sanitized
content_type_declared
content_type_detected
size_bytes
checksum_algorithm
checksum
uploaded_by
uploaded_at
security_status
scan_engine_and_version
scan_result_at
encryption_profile
retention_policy_code
```

Reglas:

1. Todos los contenedores serán privados.
2. El nombre original no será identidad ni ruta autorizadora.
3. No se sobreescribirá un objeto sin versión y evento.
4. Las descargas utilizarán sesiones autorizadas o URLs firmadas de vida corta.
5. Las URLs no se persistirán como documento.
6. Extensión y MIME declarado no serán suficientes para validar contenido.
7. Se limitarán tamaño, cantidad, formato, dimensiones y páginas según tipo.
8. Carga binaria y registro deberán conciliarse; los objetos huérfanos tendrán
   proceso de limpieza seguro.
9. La miniatura, OCR o conversión heredará clasificación y retención del origen.
10. Ningún archivo privado será indexable o servido desde CDN pública.

---

#### 17. Revisión documental

La revisión deberá conservar:

```text
document_review_id
document_id
document_version
review_type
reviewer_id
reviewer_role_effective
reviewer_scope
started_at
decision
reason_codes
public_feedback
internal_note_reference
verified_fields
valid_from
valid_until
confidence_or_method
second_review_required
completed_at
```

Reglas:

- El acceso a revisar no autoriza descargar, exportar o reutilizar.
- La decisión será estructurada y no dependerá únicamente de una nota libre.
- Las razones públicas no revelarán criterios internos, datos de terceros o
  información discriminatoria.
- Los documentos sensibles podrán exigir segunda revisión o segregación.
- El mismo actor no podrá aportar y aprobar en rutas de excepción sin control
  adicional.
- La revisión masiva deberá mostrar versión, tipo, persona y postulación para
  evitar cruces.
- Un cambio de requisito invalidará únicamente los documentos afectados y bajo
  regla explícita.

---

#### 18. Datos médicos y evaluaciones ocupacionales

##### 18.1. Frontera obligatoria

```text
PRESTADOR COMPETENTE
→ conserva historia clínica, exámenes, diagnósticos y valoraciones

VENTO GROUP
→ recibe únicamente el concepto o certificado permitido,
  restricciones y recomendaciones necesarias para el cargo
```

TALENTO y VISO podrán conservar, según autorización y necesidad:

- solicitud de evaluación;
- prestador;
- fecha y estado operativo;
- asistencia o no asistencia;
- concepto empresarial mínimo permitido;
- restricciones o recomendaciones funcionales necesarias;
- vigencia;
- evidencia de recepción;
- decisión operativa posterior y su autoridad.

No conservarán en el expediente empresarial:

- historia clínica ocupacional;
- anamnesis;
- resultados de laboratorio detallados;
- imágenes diagnósticas;
- diagnósticos clínicos;
- medicación;
- antecedentes médicos completos;
- datos de salud no necesarios para la decisión permitida.

##### 18.2. Controles

1. El prestador no entregará la historia clínica mediante bucket TALENTO.
2. El concepto visible al empleador tendrá plantilla y campos limitados.
3. Los datos médicos no aparecerán en dashboards, exportaciones o notas de
   reclutamiento.
4. La decisión no se inferirá desde diagnósticos a los que Vento Group no debe
   acceder.
5. La persona recibirá la información que legalmente le corresponda desde el
   prestador.
6. Cualquier excepción requerirá fundamento, autorización, actor y evidencia.
7. `CAP-TAL-004` definirá el flujo de solicitud, agenda, resultado y efecto en el
   proceso; no ampliará esta frontera.

---

#### 19. Matriz mínima de acceso

| Actor o superficie     |                            Identidad/perfil |         Documentos selección |                        Notas internas |          Concepto ocupacional mínimo |                     Historia clínica |                 Consentimientos |                Exportar |
| ---------------------- | ------------------------------------------: | ---------------------------: | ------------------------------------: | -----------------------------------: | -----------------------------------: | ------------------------------: | ----------------------: |
| candidato              |                                      propia |                      propios |                                    no |        propio según canal autorizado |          desde prestador, no TALENTO |                         propios | copia propia controlada |
| reclutador             |                                   necesario |        según casos asignados |                 propias y autorizadas | estado mínimo si su función lo exige |                                   no |   estado, no contenido excesivo |             restringido |
| líder de sede          |                           resumen necesario | solo documentos justificados |                   evaluación asignada | aptitud/restricción funcional mínima |                                   no |                    no ordinario |          no por defecto |
| responsable de Talento |                               según alcance |                según alcance |                       sí, segmentadas |                     mínimo necesario |                                   no |       administración autorizada |  con motivo y auditoría |
| decisor VISO           |                           datos de decisión |                    whitelist | recomendación, no expediente completo |                     mínimo permitido |                                   no |       evidencia de cumplimiento |             restringido |
| ANIMA                  |            identidad laboral ya transferida |                           no |                                    no |   solo adaptación laboral autorizada |                                   no |                              no |                      no |
| soporte técnico        |                 metadata técnica minimizada |                 no contenido |                                    no |                                   no |                                   no |                    no contenido |                      no |
| auditor autorizado     |                               según mandato |             lectura temporal |                         según mandato |                               mínimo | no salvo autoridad externa aplicable |                       evidencia |  exportación controlada |
| prestador de salud     | identificación y perfil de cargo necesarios |   no expediente de selección |                                    no |                     produce concepto |                 sí, bajo su custodia | consentimiento médico aplicable |      según norma propia |

El acceso será por caso, propósito, territorio y tiempo; no únicamente por rol
base. Toda elevación temporal expirará automáticamente.

---

#### 20. Terceros, encargados y prestadores

Antes de enviar datos a un tercero deberá existir un registro con:

```text
processor_id
legal_name
service
role_responsible_or_processor
purpose_codes
data_classes
candidate_population
countries_or_regions
transfer_or_transmission_basis
subprocessors
security_requirements
incident_notification_rule
return_or_deletion_rule
audit_right
contract_version
effective_period
owner
status
```

Reglas:

- Un proveedor no recibirá el expediente completo por conveniencia técnica.
- El payload se limitará al servicio contratado.
- La integración conservará qué se envió, cuándo, a quién y con qué resultado.
- Los callbacks no contendrán documentos o datos sensibles en URLs.
- Finalizar el contrato activará devolución, bloqueo o eliminación verificable.
- Un cambio de proveedor no autoriza reutilizar información en una finalidad
  diferente.
- Analítica, mensajería, hosting, Storage, validaciones y salud se clasificarán
  por separado.

---

#### 21. Exportaciones, descargas, impresión y dispositivos

Toda exportación material exigirá:

```text
actor
purpose
scope
filters
classification
reason_code
approval_when_required
watermark_or_identifier
expires_at
recipient
event_id
```

Reglas:

1. No existirán exportaciones masivas por defecto.
2. CSV o Excel no incluirán URLs permanentes de archivos.
3. Las columnas sensibles quedarán excluidas salvo autorización específica.
4. Descargar no otorgará derecho a conservar indefinidamente.
5. Los archivos temporales deberán eliminarse y su vencimiento ser verificable.
6. La impresión se limitará a casos justificados y quedará auditada cuando sea
   técnicamente posible.
7. Los dispositivos compartidos no almacenarán documentos localmente.
8. Los previews evitarán caché persistente donde la plataforma lo permita.
9. No se enviarán documentos por WhatsApp, correo personal o canales no
   autorizados como flujo ordinario.

---

#### 22. Arquitectura de conservación

##### 22.1. Política versionada

Cada categoría tendrá:

```text
retention_policy_code
scope
trigger_event
active_period_rule
archive_or_block_rule
legal_hold_rule
delete_or_anonymize_action
backup_rule
third_party_rule
review_frequency
policy_version
approved_by
effective_from
```

##### 22.2. Estados

```text
ACTIVE
RESTRICTED
RETENTION_HOLD
RETENTION_DUE
SCHEDULED_FOR_DELETION
DELETION_IN_PROGRESS
DELETED
ANONYMIZED
EXEMPT_WITH_BASIS
```

##### 22.3. Categorías mínimas

| Categoría                               | Evento inicial                  | Cierre esperado                                               |
| --------------------------------------- | ------------------------------- | ------------------------------------------------------------- |
| borrador no enviado                     | última actividad o abandono     | eliminación temprana y segura                                 |
| postulación rechazada/retirada/expirada | estado terminal                 | conservar mínimo necesario y eliminar lo no requerido         |
| perfil para futuras vacantes            | consentimiento opcional vigente | retirar al vencer o revocar consentimiento                    |
| postulación contratada                  | handoff autorizado              | transferir whitelist y cerrar resto según política            |
| documentos reemplazados                 | supersesión                     | restringir y eliminar cuando deje de ser necesario            |
| consentimientos y avisos                | captura, retiro o supersesión   | conservar evidencia proporcional                              |
| auditoría y seguridad                   | evento                          | conservar según riesgo y obligación, con contenido minimizado |
| concepto ocupacional mínimo             | recepción                       | transferir o conservar según expediente laboral autorizado    |
| historia clínica ocupacional            | evaluación por prestador        | nunca entra al repositorio empresarial                        |
| métricas                                | evento                          | anonimizar o agregar tan pronto como sea viable               |

No se aprobarán números definitivos dentro de esta tarea. `CAP-TAL-006` deberá
convertir esta matriz en períodos parametrizados tras revisión jurídica, laboral,
contable, de seguridad y de operación.

---

#### 23. Legal hold, bloqueo y preservación excepcional

Un expediente podrá bloquearse temporalmente por:

- solicitud o disputa activa;
- investigación interna autorizada;
- incidente de seguridad;
- orden de autoridad;
- proceso judicial o administrativo;
- obligación contractual o legal validada;
- conciliación de transferencia o eliminación fallida.

El hold deberá conservar:

```text
hold_id
scope
reason_code
authority
created_by
created_at
review_at
expires_at opcional
release_authority
released_at
```

Reglas:

- El hold no ampliará el acceso.
- Solo suspenderá acciones incompatibles de eliminación o modificación.
- No se utilizará como retención indefinida genérica.
- Se revisará periódicamente.
- Liberarlo reanudará la política original, no creará un período nuevo
  arbitrario.

---

#### 24. Eliminación y anonimización

```text
SOLICITUD O POLÍTICA VENCIDA
→ VALIDAR IDENTIDAD, ALCANCE Y EXCEPCIONES
→ CALCULAR DEPENDENCIAS
→ BLOQUEAR NUEVO USO
→ ELIMINAR O ANONIMIZAR DATOS PRIMARIOS
→ ELIMINAR ARCHIVOS Y DERIVADOS
→ PROPAGAR A PROVEEDORES
→ INVALIDAR CACHÉS, URLS Y COLAS
→ REGISTRAR RESULTADO MÍNIMO
→ VERIFICAR
```

La operación deberá cubrir:

- filas principales;
- perfiles y respuestas;
- archivos y versiones;
- thumbnails, OCR y conversiones;
- URLs firmadas aún válidas;
- exportaciones temporales;
- colas y reintentos;
- caché web, PWA y nativa;
- índices de búsqueda;
- analítica identificable;
- proveedores y subprocessors;
- copias operativas bajo política de backup.

Reglas:

1. Eliminar una fila sin el archivo no es supresión completa.
2. Eliminar el archivo sin lineage puede romper auditoría y decisiones.
3. Cuando deba conservarse evidencia, se utilizará tombstone mínimo sin contenido
   excesivo.
4. La anonimización deberá ser irreversible en el contexto razonable del sistema.
5. Un identificador hash estable reutilizable no se considerará automáticamente
   anónimo.
6. La respuesta al titular distinguirá eliminación inmediata, programada,
   bloqueada o denegada con fundamento.

---

#### 25. Transferencia hacia el expediente laboral

La transferencia utilizará una whitelist versionada:

```text
transfer_policy_code
source_document_type
destination_document_type
allowed_fields
transfer_mode
purpose
condition
consent_or_basis_reference
retention_effect
access_effect
```

Modos permitidos:

```text
REFERENCE
→ el expediente laboral consulta una referencia controlada

COPY_WITH_LINEAGE
→ se crea copia gobernada con hash y origen

DERIVED_FACT_ONLY
→ solo se transfiere un hecho verificado

NO_TRANSFER
→ permanece o se elimina en TALENTO
```

Cada transferencia conservará:

```text
transfer_id
candidate_id
application_id
employee_id
episode_id
source_document_id
source_version
source_checksum
destination_reference
policy_version
actor
authority
purpose
transferred_at
result
```

Nunca se transferirán por defecto:

- CV;
- notas de entrevista;
- scoring;
- razones internas de descarte;
- referencias;
- comparaciones con otros candidatos;
- historia clínica;
- diagnósticos;
- datos opcionales de banco de candidatos.

`CAP-TAL-005` definirá el comando, la idempotencia, recuperación y conciliación
exactas del handoff.

---

#### 26. Autoservicio del candidato

La persona deberá poder:

- ver sus datos y su fuente;
- diferenciar perfil reutilizable y datos de una postulación;
- corregir información editable;
- solicitar corrección de información verificada;
- consultar documentos, versiones y estados;
- conocer por qué se solicita cada requisito;
- descargar copia controlada de información propia;
- consultar avisos, autorizaciones y consentimientos;
- retirar finalidades opcionales;
- retirar una postulación sin borrar el historial requerido;
- solicitar acceso, corrección o supresión;
- ver estado y resultado de su solicitud;
- conocer transferencias realizadas hacia el expediente laboral;
- cerrar sesión y revocar sesiones activas.

No podrá:

- editar notas internas;
- alterar decisiones o revisiones;
- borrar evidencia sujeta a hold;
- visualizar datos de evaluadores o terceros;
- transferir documentos directamente a ANIMA sin autoridad;
- cambiar un documento aprobado sin crear una nueva versión.

---

#### 27. Web, PWA, móvil, caché y funcionamiento offline

Reglas comunes:

1. Los service workers no cachearán respuestas privadas del expediente como
   contenido público.
2. Los archivos sensibles no quedarán disponibles offline salvo capacidad
   futura explícitamente autorizada.
3. Los tokens no se almacenarán en ubicaciones accesibles a scripts no confiables.
4. La app nativa usará almacenamiento seguro para credenciales y referencias
   mínimas; no guardará expedientes completos en almacenamiento general.
5. Cerrar sesión limpiará cachés, previews, archivos temporales y colas del
   usuario.
6. Un upload offline podrá conservarse solo cifrado, con expiración y estado
   visible; no se considerará recibido hasta el acuse servidor.
7. Web y móvil aplicarán la misma política de consentimiento, clasificación y
   retención.
8. El borrado remoto deberá invalidar copias locales en la siguiente sincronización
   y bloquear su uso mientras tanto.
9. Las notificaciones no incluirán contenido sensible en pantalla bloqueada.
10. Crash reports, analytics y logs excluirán contenido del expediente.

---

#### 28. Eventos y auditoría

Eventos mínimos:

```text
DATA_ELEMENT_REQUESTED
DATA_ELEMENT_SUBMITTED
DATA_ELEMENT_CORRECTED
PRIVACY_NOTICE_PRESENTED
CONSENT_CAPTURED
CONSENT_WITHDRAWN
CONSENT_SUPERSEDED
DOCUMENT_REQUESTED
DOCUMENT_UPLOAD_STARTED
DOCUMENT_UPLOADED
DOCUMENT_QUARANTINED
DOCUMENT_SECURITY_CLEARED
DOCUMENT_REVIEWED
DOCUMENT_REPLACEMENT_REQUESTED
DOCUMENT_SUPERSEDED
DOCUMENT_EXPIRED
PRIVACY_CASE_CREATED
PRIVACY_CASE_RESOLVED
RETENTION_HOLD_APPLIED
RETENTION_HOLD_RELEASED
RETENTION_DUE
DELETION_STARTED
DELETION_COMPLETED
ANONYMIZATION_COMPLETED
DOCUMENT_TRANSFERRED
TRANSFER_RECONCILED
EXPORT_CREATED
EXPORT_EXPIRED
ACCESS_TO_RESTRICTED_DATA
```

Cada evento material conservará, cuando aplique:

```text
event_id
correlation_id
person_id
candidate_id
application_id
document_id
document_version
consent_record_id
privacy_case_id
actor_id
actor_type
role_effective
scope
purpose_code
classification
policy_version
before
after
reason_codes
occurred_at
result
```

Los eventos no duplicarán el contenido completo del dato o documento.

---

#### 29. Métricas permitidas

Se podrán medir:

- datos y documentos solicitados por fase;
- documentos cargados, rechazados, reemplazados y vencidos;
- tiempo de revisión;
- causas estructuradas de rechazo;
- consentimientos opcionales otorgados y retirados;
- solicitudes de derechos y tiempo de resolución;
- retenciones vencidas;
- eliminaciones, bloqueos y fallos;
- accesos a clases restringidas;
- exportaciones;
- transferencias y conciliaciones;
- archivos huérfanos y objetos en cuarentena;
- divergencias web, PWA y móvil.

No se utilizarán métricas para:

- inferir salud, religión, orientación, origen u otros rasgos sensibles;
- puntuar candidatos por ejercer derechos;
- penalizar el retiro de consentimientos opcionales;
- convertir velocidad de carga documental en criterio de selección;
- comparar candidatos mediante datos no autorizados;
- crear perfiles comerciales.

---

#### 30. Manejo de errores

Errores funcionales mínimos:

```text
data_element_not_authorized
collection_phase_invalid
purpose_not_active
privacy_notice_version_invalid
consent_required
consent_not_applicable
consent_withdrawn
document_type_not_allowed
file_type_invalid
file_size_exceeded
file_content_mismatch
file_security_pending
file_quarantined
document_version_conflict
document_review_conflict
document_expired
access_scope_invalid
privacy_case_identity_pending
retention_hold_active
retention_policy_missing
deletion_dependency_detected
transfer_not_allowed
transfer_lineage_conflict
third_party_delivery_unknown
```

Reglas:

- El error será accionable sin revelar datos de terceros.
- Un fallo de escaneo mantendrá cuarentena, no aprobación implícita.
- Un timeout de upload se conciliará por checksum y referencia antes de repetir.
- Un fallo parcial de eliminación quedará abierto hasta resolver todos los
  destinos.
- Una transferencia desconocida no se repetirá sin consultar idempotencia.
- Una política faltante bloqueará la recolección o transferencia riesgosa; no
  aplicará retención infinita por defecto.

---

#### 31. Compatibilidad y brechas de los drafts actuales

El estado documental actual de `vento-talento` propone:

- `talento.candidates`, perfiles, postulaciones y documentos;
- buckets privados separados para CV, documentos y archivos médicos;
- rutas basadas en candidato y postulación;
- acceso interno mediante `service_role` o endpoints controlados;
- transferencia potencial de identificación y certificados.

Brechas que esta tarea obliga a cerrar antes de implementar:

| Brecha                                                    | Riesgo                            | Destino obligatorio                      |
| --------------------------------------------------------- | --------------------------------- | ---------------------------------------- |
| no existe ledger completo de avisos y consentimientos     | autorización no demostrable       | `CAP-TAL-006` y paquete E5               |
| no existe catálogo de datos/finalidades                   | sobrecaptura y metadata libre     | `CAP-TAL-006`                            |
| buckets por familia no equivalen a clasificación completa | acceso excesivo                   | `CAP-TAL-006`, `AUTH-DB-*`, `AUTH-SRV-*` |
| bucket médico empresarial puede alojar historia clínica   | violación de reserva              | `CAP-TAL-004` y `CAP-TAL-006`            |
| `service_role` como acceso interno amplio                 | bypass de RLS y finalidad         | `CAP-TAL-006`                            |
| no existe escaneo, cuarentena ni hash obligatorio         | malware e integridad desconocida  | `CAP-TAL-006`, `EVID-ARC-*`              |
| no existe política de conservación                        | retención indefinida              | `CAP-TAL-006`                            |
| no existe workflow de derechos del titular                | incumplimiento y operación manual | `CAP-TAL-006`, `PROC-SCREEN-*`           |
| transferencia descrita como copia posible sin lineage     | expediente laboral contaminado    | `CAP-TAL-005`                            |
| no existe eliminación transversal                         | copias residuales                 | `CAP-TAL-006`, `QUEUE-ARC-*`             |

Ninguna brecha queda narrativa sin tarea responsable.

---

#### 32. Contratos de datos a madurar

Esta tarea requiere que la arquitectura posterior contemple, sin autorizar aún
su creación:

```text
talento.data_element_catalog
talento.purpose_catalog
talento.privacy_notices
talento.consent_records
talento.consent_events
talento.document_types
talento.document_requirements
talento.candidate_documents
talento.document_versions
talento.document_reviews
talento.file_objects
talento.privacy_cases
talento.retention_policies
talento.retention_holds
talento.deletion_jobs
talento.document_transfers
talento.processor_registry
```

La decisión final de tablas, esquemas, vistas, funciones, eventos y Storage
corresponde a E3/E4 y al roadmap materializado por `CAP-TAL-006`.

---

#### 33. Responsabilidades por aplicación

| Capacidad                             | TALENTO                             | VISO                             | ANIMA                                          | SHELL/infraestructura      |
| ------------------------------------- | ----------------------------------- | -------------------------------- | ---------------------------------------------- | -------------------------- |
| perfil candidato                      | propietario                         | proyección mínima                | no                                             | contratos compartidos      |
| postulación y expediente selección    | propietario                         | panel autorizado                 | no                                             | migraciones y seguridad    |
| avisos y consentimientos prelaborales | propietario                         | consulta de cumplimiento         | no                                             | catálogo y auditoría       |
| documentos laborales                  | origen temporal solo si preboarding | propietario definitivo           | autoservicio autorizado                        | contratos compartidos      |
| historia clínica ocupacional          | no                                  | no                               | no                                             | no; custodia del prestador |
| concepto ocupacional mínimo           | recibe/controla fase                | consume para decisión autorizada | solo adaptación autorizada después del vínculo | seguridad y lineage        |
| derechos del candidato                | opera y coordina                    | coopera cuando corresponda       | no salvo empleado y dato laboral               | evidencia e integraciones  |
| conservación prelaboral               | propietario                         | consume transferencias           | no                                             | jobs y observabilidad      |
| eliminación transversal               | inicia/coordina                     | confirma destinos                | confirma copias autorizadas                    | ejecuta y evidencia        |

---

#### 34. Asignación de decisiones pendientes

| Decisión pendiente                                   | Tarea responsable               | Momento de cierre                                 |
| ---------------------------------------------------- | ------------------------------- | ------------------------------------------------- |
| requisitos y documentos por cargo/fase               | `CAP-TAL-004`                   | al diseñar evaluación y validaciones              |
| flujo de evaluación médica y concepto mínimo         | `CAP-TAL-004`                   | antes de aprobar validaciones                     |
| whitelist y modalidad de transferencia               | `CAP-TAL-005`                   | antes del handoff                                 |
| períodos exactos de conservación                     | `CAP-TAL-006`                   | antes del roadmap E5 y con validación profesional |
| textos finales de aviso y autorización               | `CAP-TAL-006`                   | antes de cualquier captura real                   |
| arquitectura de tablas, Storage, RLS, escaneo y jobs | `CAP-TAL-006` + E3/E4           | antes de implementación                           |
| proveedor y contratos de encargado                   | `CAP-TAL-006`                   | antes de integrar terceros                        |
| operación de derechos del titular                    | `CAP-TAL-006` + `PROC-SCREEN-*` | antes de producción                               |
| migración de datos o archivos legacy                 | `CAP-TAL-006`                   | antes de cutover                                  |
| certificación de privacidad, seguridad y borrado     | `CAP-TAL-006` + BLOQUE U        | antes de lanzamiento                              |

---

#### 35. Requisitos de prueba generados

Esta tarea incorpora:

```text
TREQ-TALENTO-023
TREQ-TALENTO-024
TREQ-TALENTO-025
TREQ-TALENTO-026
TREQ-TALENTO-027
TREQ-TALENTO-028
TREQ-TALENTO-029
TREQ-TALENTO-030
TREQ-TALENTO-031
TREQ-TALENTO-032
TREQ-TALENTO-033
TREQ-TALENTO-034
TREQ-TALENTO-035
TREQ-TALENTO-036
TREQ-TALENTO-037
TREQ-TALENTO-038
```

El archivo completo
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` deberá reemplazarse por la
versión entregada con esta propuesta.

---

#### 36. Criterios de aceptación

`CAP-TAL-003` podrá aprobarse cuando se confirme que:

- [ ] el expediente es progresivo y no una captura masiva inicial;
- [ ] persona, candidato, postulación, requisito, documento, archivo, revisión,
      consentimiento y expediente laboral están separados;
- [ ] existe clasificación de datos y acceso por finalidad;
- [ ] aviso, autorización, aceptación y preferencias no se confunden;
- [ ] las finalidades opcionales son separables y revocables;
- [ ] se definió un ledger consultable y versionado;
- [ ] los derechos del titular tienen caso, estados, identidad y plazo
      parametrizado;
- [ ] documento, archivo, revisión y hecho derivado tienen lifecycle independiente;
- [ ] Storage es privado, versionado, validado, escaneado y conciliable;
- [ ] historia clínica y resultados médicos detallados quedan fuera del expediente
      empresarial;
- [ ] existe matriz de acceso, exportación y terceros;
- [ ] conservación se resuelve mediante políticas versionadas y no plazos
      hardcodeados;
- [ ] hold, eliminación y anonimización cubren todos los destinos;
- [ ] la transferencia laboral utiliza whitelist y lineage;
- [ ] web, PWA y apps nativas mantienen la misma política;
- [ ] cada brecha está vinculada a una tarea existente concreta;
- [ ] se regeneró y validó el registro de requisitos de prueba;
- [ ] no se autorizaron código, migraciones, datos reales ni cambios en Supabase.

---

#### 37. Decisiones propuestas para aprobación

1. El expediente TALENTO será progresivo, orientado a finalidad y separado por
   postulación.
2. Ningún dato o documento se recolectará sin catálogo, fase, finalidad,
   clasificación y política.
3. Aviso, autorización, consentimiento opcional, aceptación contractual y
   preferencia de comunicación serán objetos distintos.
4. El banco de candidatos y futuras vacantes exigirán finalidad opcional
   separada.
5. Los consentimientos y retiros serán versionados, inmutables y consultables.
6. Documento, archivo, revisión y hecho derivado conservarán lineage propio.
7. Todos los archivos permanecerán privados, versionados, validados y sujetos a
   cuarentena antes de revisión.
8. La historia clínica ocupacional y los exámenes detallados no se almacenarán en
   TALENTO, VISO, ANIMA ni Storage empresarial.
9. Vento Group solo recibirá el concepto ocupacional mínimo permitido y necesario.
10. El acceso se resolverá por función, caso, alcance, finalidad y tiempo.
11. Toda exportación, tercero y transferencia tendrá propósito y auditoría.
12. La conservación utilizará políticas parametrizadas; los períodos exactos se
    cerrarán en `CAP-TAL-006` con validación profesional.
13. La eliminación será transversal, verificable y compatible con legal holds.
14. El handoff laboral transferirá únicamente una whitelist con lineage mediante
    `REFERENCE`, `COPY_WITH_LINEAGE` o `DERIVED_FACT_ONLY`.
15. El candidato tendrá autoservicio para conocer, corregir y gestionar sus datos
    y finalidades.
16. Los drafts actuales no podrán implementarse sin cerrar las brechas registradas.

---

#### 38. Resultado y continuidad

Con la aprobación quedará establecido:

```text
CAP-TAL-001 — APROBADA
CAP-TAL-002 — APROBADA
CAP-TAL-003 — APROBADA
CAP-TAL-004 — NO INICIADA
```

La continuidad será exclusivamente:

```text
CAP-TAL-004
— Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato
```

`CAP-TAL-004` deberá consumir esta clasificación, no solicitar datos fuera de la
fase y no ampliar el acceso médico o documental definido aquí.

No se inicia `CAP-TAL-004` hasta la aprobación expresa de esta tarea.
