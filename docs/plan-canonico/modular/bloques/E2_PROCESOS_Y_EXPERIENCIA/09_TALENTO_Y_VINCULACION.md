PROCESO TO-BE DE TALENTO Y VINCULACIÓN

Las tareas siguientes fueron reubicadas desde E1 porque diseñan el proceso,
los actores, estados, pantallas, contratos e integraciones objetivo de una
aplicación futura. Conservan sus identificadores y no autorizan implementación.

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


### ✅ CAP-TAL-004 — Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato

**Estado:** APROBADA 
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `CAP-TAL-003 — Diseñar expediente progresivo de datos, documentos, consentimiento y conservación` — APROBADA  
**Siguiente tarea reservada:** `CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO`  
**Artefacto producido:** `CAP-TAL-SELECTION-DECISION-OFFER-CONTRACT-001`  
**Procesos canónicos principales:** `VPROC-0005` y `VPROC-0006`  
**Naturaleza:** proceso de selección, evaluación, entrevistas, validaciones, decisión laboral, oferta y pre-registro  
**Propiedad y canales:** VISO es la aplicación propietaria de `VPROC-0005` y `VPROC-0006`; la base futura TALENTO conserva evidencia prelaboral solo como canal candidato hasta obtener `app_code`; ANIMA permanece fuera hasta el handoff autorizado
**Cambios en código, datos, migraciones, RLS, RPC, Storage, Supabase, proveedores, plantillas jurídicas, contratos o aplicaciones:** no autorizados

---

#### 1. Propósito

Diseñar el proceso objetivo desde la preselección hasta la existencia de un
candidato listo para handoff, de manera que Vento Group pueda evaluar y escoger
personas sin:

- convertir una entrevista en una contratación;
- permitir que un score, checklist, prueba automática o modelo de IA rechace o
  contrate por sí solo;
- mezclar observación, evidencia, calificación, recomendación, decisión y oferta;
- usar criterios que no estén relacionados con las funciones y riesgos reales del
  cargo;
- formular preguntas discriminatorias o capturar información sensible sin una
  finalidad válida;
- tratar la ausencia de información como un resultado negativo;
- permitir que un entrevistador modifique la vacante, el salario, la sede o las
  condiciones aprobadas;
- emitir ofertas sin autoridad, versión, vigencia o trazabilidad;
- considerar que abrir un enlace, dibujar una firma o responder un mensaje prueba
  identidad y aceptación suficientes;
- modificar materialmente una oferta ya presentada sin crear una nueva versión;
- crear `employee`, asignaciones, roles, permisos, turnos, nómina o acceso ANIMA
  desde una aceptación de oferta;
- almacenar historia clínica ocupacional, diagnósticos o exámenes detallados en
  TALENTO, VISO, ANIMA o Storage empresarial;
- rechazar automáticamente por una restricción ocupacional sin revisar ajustes,
  compatibilidad y autoridad;
- perder el proceso por reprogramaciones, no asistencia de un entrevistador,
  fallos de videollamada, doble clic, reintentos o desconexión;
- ocultar conflictos de interés, overrides, excepciones o decisiones divergentes;
- inventar postulaciones, entrevistas o resultados para altas directas,
  reingresos o regularizaciones;
- mantener al candidato indefinidamente en evaluación, oferta o pre-registro.

Esta tarea define el contrato funcional y documental. No autoriza operar procesos
reales, usar datos personales, contratar proveedores, emitir ofertas, ejecutar
exámenes, crear trabajadores ni implementar cambios técnicos.

---

#### 2. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. el lifecycle desde preselección hasta pre-registro;
2. la diferencia entre plan, sesión, evidencia, evaluación, score,
   recomendación y decisión;
3. los criterios mínimos para diseñar evaluaciones relacionadas con el cargo;
4. cómo se programan, confirman, reprograman, ejecutan y cierran entrevistas;
5. cómo se gestionan pruebas prácticas, técnicas, referencias y validaciones;
6. cómo se evita que datos sensibles, categorías protegidas o criterios opacos
   afecten decisiones;
7. cómo se trata la evaluación médica pre-ocupacional y qué información puede
   recibir Vento Group;
8. qué constituye un expediente de decisión completo;
9. qué autoridad conserva TALENTO y cuál conserva VISO;
10. cómo se versiona, aprueba, presenta, acepta, rechaza, expira, retira o
    reemplaza una oferta;
11. cómo se verifica identidad y voluntad del candidato;
12. qué es el pre-registro y por qué no constituye vínculo ni acceso;
13. cómo se manejan múltiples postulaciones, candidatos alternos, desistimientos,
    reingresos y altas directas;
14. cómo se controlan concurrencia, offline, reintentos y recuperación;
15. qué métricas, evidencia y requisitos de prueba deberán proteger el proceso;
16. qué materias quedan reservadas para `CAP-TAL-005` y `CAP-TAL-006`.

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `CAP-TAL-001` y las fronteras TALENTO–VISO–ANIMA;
- `CAP-TAL-002` y el contrato de publicación, consulta y postulación universal;
- `CAP-TAL-003` y el expediente progresivo, consentimiento, privacidad,
  conservación y frontera médica;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `OPS-CAN-001` para canales y sobre canónico de interacción;
- el modelo canónico de identidad, autorización, contexto, sesión, alcance,
  evidencia e idempotencia;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `AUTH-DB-001` a `AUTH-DB-035`;
- `AUTH-SRV-001` a `AUTH-SRV-018`;
- `INT-APP-001` a `INT-APP-010` e `INT-EXT-001` a `INT-EXT-020`;
- `PROC-SCREEN-001` a `PROC-SCREEN-028` y `UX-QA-001` a `UX-QA-030`;
- la decisión de que una persona sigue siendo candidata hasta que exista un
  vínculo laboral autorizado;
- la decisión de que TALENTO conserva evidencia y recomendación prelaboral;
- la decisión de que VISO conserva la decisión empresarial, las condiciones, la
  oferta autorizada y el vínculo;
- la decisión de que ANIMA no participa en evaluación ni contratación;
- la prohibición de transferir por defecto notas, scoring, comparaciones,
  referencias o información médica al expediente laboral.

Los documentos, tablas, enums, RPC, pantallas y flujos existentes en
`vento-talento`, `vento-viso` y `vento-anima` se consideran evidencia AS-IS. Esta
tarea establece el contrato TO-BE aunque implique reemplazar diseños actuales.

---

#### 4. Marco normativo y límite profesional

La implementación deberá revisarse frente a la normativa colombiana vigente y a
las políticas empresariales aplicables antes de usar información o emitir actos
con efectos laborales.

Referencias mínimas para revisión profesional:

- Constitución Política y principio de igualdad;
- Código Sustantivo del Trabajo y reglas antidiscriminatorias aplicables;
- Ley 1581 de 2012 y régimen de protección de datos;
- Ley 2114 de 2021 y prohibiciones asociadas a pruebas de embarazo y preguntas
  sobre planes reproductivos;
- Resolución 2346 de 2007 o la norma que la modifique, adicione o sustituya para
  evaluaciones médicas ocupacionales;
- reglas aplicables al cargo, sector, seguridad y salud en el trabajo;
- plantillas, poderes, políticas salariales y delegaciones aprobadas por Vento
  Group.

Principios funcionales obligatorios:

```text
RELACIÓN DIRECTA CON EL CARGO
IGUALDAD Y NO DISCRIMINACIÓN
TRANSPARENCIA
BUENA FE
MINIMIZACIÓN
ACCESIBILIDAD Y AJUSTES RAZONABLES
DECISIÓN HUMANA AUTORIZADA
TRAZABILIDAD
SEGREGACIÓN DE FUNCIONES
CONFIDENCIALIDAD
DERECHO A CORREGIR DATOS OBJETIVOS
NO AUTOMATIZACIÓN EXCLUSIVA DE EFECTOS ADVERSOS
```

Esta tarea no:

- emite concepto jurídico;
- declara que una oferta produzca o no efectos contractuales en todos los casos;
- aprueba textos de oferta o contrato;
- define salarios, beneficios, períodos de prueba o modalidades concretas;
- autoriza pruebas psicológicas, médicas, biométricas o de antecedentes;
- sustituye la evaluación de ajustes razonables;
- determina qué validaciones exige cada cargo;
- reemplaza al profesional de salud ocupacional ni a los responsables laborales.

Las plantillas, criterios jurídicos, responsables formales, plazos y proveedores
se deberán validar antes de implementación en `CAP-TAL-006` y en el paquete E5
correspondiente.

---

#### 5. Principio rector

```text
EVIDENCIA DEL CARGO
        ↓
EVALUACIÓN ESTRUCTURADA
        ↓
RECOMENDACIÓN NO VINCULANTE
        ↓
DECISIÓN EMPRESARIAL AUTORIZADA EN VISO
        ↓
OFERTA VERSIONADA Y APROBADA
        ↓
RESPUESTA VERIFICADA DEL CANDIDATO
        ↓
PRE-REGISTRO SIN ACTIVACIÓN LABORAL
```

Reglas:

1. Ningún paso anterior sustituye al siguiente.
2. La aprobación de una fase no implica contratación.
3. La aceptación de una oferta no crea por sí sola empleado, episodio, rol,
   permiso, turno, nómina o acceso.
4. Una recomendación negativa no será una decisión terminal hasta que la
   autoridad competente la confirme.
5. Un dato faltante se tratará como faltante, no como cero ni como evidencia
   adversa.
6. Una excepción no modificará la política general; quedará versionada, limitada
   y auditada.

---

#### 6. Distinciones obligatorias

```text
PLAN DE EVALUACIÓN
≠ CRITERIO
≠ ACTIVIDAD
≠ SESIÓN
≠ RESPUESTA
≠ EVIDENCIA
≠ OBSERVACIÓN
≠ CALIFICACIÓN
≠ SCORE AGREGADO
≠ RECOMENDACIÓN
≠ DECISIÓN LABORAL
≠ OFERTA
≠ RESPUESTA A OFERTA
≠ PRE-REGISTRO
≠ EMPLEADO
```

| Objeto              | Definición                                                                            | Propietario funcional           |
| ------------------- | ------------------------------------------------------------------------------------- | ------------------------------- |
| evaluation plan     | versión de criterios, actividades, pesos, gates y responsables para una vacante/ronda | TALENTO con aprobación VISO     |
| criterion           | atributo observable y relacionado con funciones o riesgos del cargo                   | TALENTO/VISO según política     |
| assessment activity | entrevista, prueba, validación o ejercicio autorizado                                 | TALENTO                         |
| session             | ocurrencia concreta con fecha, participantes y canal                                  | TALENTO                         |
| response            | manifestación o entrega del candidato                                                 | TALENTO                         |
| evidence            | soporte verificable producido o recibido                                              | TALENTO                         |
| observation         | hecho descrito sin conclusión automática                                              | TALENTO                         |
| rating              | resultado de un criterio y escala versionados                                         | TALENTO                         |
| aggregate score     | cálculo auxiliar reproducible, nunca decisión autónoma                                | TALENTO                         |
| recommendation      | criterio profesional no vinculante                                                    | TALENTO                         |
| hiring decision     | acto empresarial autorizado sobre la postulación                                      | VISO                            |
| offer               | condiciones aprobadas y presentadas en una versión exacta                             | VISO                            |
| offer response      | aceptación, rechazo o solicitud de aclaración del candidato                           | TALENTO con evidencia para VISO |
| preregistration     | conjunto laboral propuesto y validable antes del handoff                              | VISO                            |
| employee            | relación laboral materializada por el flujo autorizado                                | dominio laboral/VISO            |

Prohibiciones:

- no guardar decisión dentro de una nota libre;
- no guardar preguntas y respuestas sensibles dentro de metadata genérica;
- no usar `score` como sinónimo de aptitud o contratación;
- no sobrescribir una recomendación o decisión anterior;
- no convertir una plantilla de oferta en fuente de condiciones reales sin
  instancia versionada;
- no reutilizar una evaluación en otra vacante sin verificar cargo, versión,
  vigencia y finalidad.

---

#### 7. Lifecycle maestro de selección

```text
APPLICATION_SUBMITTED
→ INITIAL_REVIEW
→ SCREENING_IN_PROGRESS
→ SHORTLIST_DECISION
→ EVALUATION_PLAN_ASSIGNED
→ INTERVIEW_OR_ASSESSMENT_IN_PROGRESS
→ VALIDATIONS_IN_PROGRESS
→ DECISION_PACKET_READY
→ HIRING_DECISION_PENDING
→ APPROVED_CONDITIONAL / APPROVED_FOR_OFFER / HOLD / ALTERNATE / REJECTED
→ OFFER_PREPARING
→ OFFER_PENDING_APPROVAL
→ OFFER_PRESENTED
→ CANDIDATE_RESPONSE_PENDING
→ OFFER_ACCEPTED / OFFER_DECLINED / OFFER_EXPIRED / OFFER_WITHDRAWN
→ PREREGISTRATION_IN_PROGRESS
→ READY_FOR_HANDOFF
```

Estados terminales o de interrupción posibles:

```text
REJECTED
WITHDRAWN_BY_CANDIDATE
CANCELLED_BY_COMPANY
VACANCY_CLOSED
EXPIRED
DUPLICATE_RESOLVED
TRANSFERRED_TO_HIRING_FLOW
```

Reglas:

1. La máquina de estados agregada no reemplaza los estados propios de entrevista,
   evaluación, decisión, oferta o pre-registro.
2. Cada transición tendrá precondiciones, actor, permiso, motivo, versión,
   timestamp de servidor y evento.
3. `force` no será un booleano general. Toda excepción tendrá tipo, autoridad,
   alcance, vencimiento y evidencia.
4. Cerrar una vacante no borrará las postulaciones ni respuestas existentes.
5. Una postulación terminal no se reabrirá por edición directa; requerirá comando
   autorizado y nueva versión del proceso cuando proceda.

---

#### 8. Plan de evaluación por vacante y ronda

Antes de evaluar personas deberá existir un plan aprobado que defina:

- `evaluation_plan_id` y versión;
- vacante, ronda, empresa, sede, área y cargo;
- perfil y funciones del cargo;
- criterios obligatorios y opcionales;
- evidencia aceptada por criterio;
- actividades autorizadas;
- escala y anchors observables;
- pesos, mínimos, gates y reglas de cálculo;
- criterios que solo admiten `meets / does_not_meet / unknown`;
- participantes y competencias requeridas;
- conflictos de interés;
- ajustes y accesibilidad;
- idiomas permitidos;
- vigencia;
- condiciones de repetición;
- reglas de datos y conservación;
- aprobadores;
- protocolo de calibración;
- ruta de reconsideración o revisión interna;
- métricas de calidad y sesgo.

Estados del plan:

```text
DRAFT
→ PENDING_APPROVAL
→ APPROVED
→ ACTIVE
→ SUSPENDED
→ RETIRED
```

Reglas:

1. Una persona se evaluará contra la versión asignada al iniciar la fase.
2. Cambiar preguntas, pesos, umbrales o gates creará versión nueva.
3. El plan retirado seguirá disponible para reconstruir decisiones históricas.
4. No podrán agregarse criterios ad hoc después de conocer respuestas para
   favorecer o perjudicar a una persona.
5. Un criterio deberá describir relación con el cargo y evidencia observable.
6. Expresiones como “buena presencia”, “encaja con nosotros”, “energía correcta”
   o “perfil familiar” no serán criterios válidos sin definición objetiva,
   pertinente y revisada.

---

#### 9. Preselección y screening

La preselección deberá distinguir:

```text
REQUISITO OBJETIVO
RESPUESTA DEL CANDIDATO
EVIDENCIA DISPONIBLE
RESULTADO DE REVISIÓN
DECISIÓN DE AVANCE
```

Resultados permitidos:

```text
MEETS_MINIMUM
DOES_NOT_MEET_MINIMUM
NEEDS_INFORMATION
NEEDS_MANUAL_REVIEW
CONFLICT_DETECTED
NOT_APPLICABLE
```

Reglas:

1. Los filtros eliminatorios deberán existir en el plan publicado o en una regla
   interna autorizada relacionada con el cargo.
2. El candidato deberá conocer los requisitos esenciales visibles antes de
   postularse, salvo información de seguridad que deba reservarse.
3. Un campo vacío, archivo pendiente o integración fallida no equivaldrá a
   incumplimiento.
4. Un rechazo por requisito objetivo identificará criterio, versión, evidencia y
   revisor.
5. Los resultados de screening automático solo podrán clasificar o priorizar para
   revisión; un efecto adverso requerirá validación humana autorizada.
6. El sistema deberá impedir el uso de atributos sensibles o proxies injustificados
   como filtros.

---

#### 10. Programación de entrevistas

Cada entrevista deberá conservar:

- `interview_id`;
- aplicación y candidato;
- tipo y objetivo;
- plan y versión;
- ronda;
- entrevistadores requeridos;
- modalidad;
- zona horaria;
- fecha de inicio y fin;
- sede, dirección o enlace protegido;
- instrucciones públicas;
- necesidades de accesibilidad declaradas;
- estado de confirmación;
- ventanas de reprogramación;
- responsable operativo;
- backup;
- canal de contingencia;
- correlación e idempotencia.

Estados mínimos:

```text
DRAFT
→ INVITATION_PENDING
→ INVITED
→ SCHEDULED
→ CANDIDATE_CONFIRMED
→ RESCHEDULE_REQUESTED
→ RESCHEDULED
→ IN_PROGRESS
→ COMPLETED
```

Estados de excepción:

```text
CANCELLED_BY_CANDIDATE
CANCELLED_BY_COMPANY
NO_SHOW_CANDIDATE
NO_SHOW_INTERVIEWER
TECHNICAL_FAILURE
LOCATION_FAILURE
EXPIRED
```

Reglas:

1. Agendar no equivale a confirmar.
2. Reprogramar creará nueva ocurrencia enlazada y conservará la anterior.
3. El no-show del entrevistador no perjudicará al candidato ni se registrará como
   ausencia de este.
4. Un fallo técnico tendrá ruta de recuperación y no producirá evaluación
   incompleta como negativa.
5. Los enlaces no expondrán datos personales en parámetros y tendrán acceso
   restringido cuando corresponda.
6. La cancelación de una sesión no cancelará automáticamente la postulación.
7. Las notificaciones se derivarán del estado canónico y no serán la fuente de
   verdad de la cita.

---

#### 11. Ejecución de entrevistas

La sesión deberá abrirse únicamente para participantes autorizados y con contexto
vigente.

El formulario del entrevistador mostrará:

- objetivo de la sesión;
- criterios asignados;
- preguntas autorizadas;
- anchors de evaluación;
- campos estructurados;
- advertencias de privacidad y no discriminación;
- conflicto de interés;
- estado de la sesión;
- acción de guardar borrador;
- acción de finalizar;
- acción de reportar incidente.

Se separarán:

```text
NOTA FACTUAL
COMENTARIO DEL CANDIDATO
EVIDENCIA
CALIFICACIÓN POR CRITERIO
RECOMENDACIÓN
NOTA INTERNA RESTRINGIDA
```

Reglas:

1. Finalizar congelará la versión presentada; corregir creará addendum.
2. El entrevistador no verá calificaciones de otros antes de finalizar cuando la
   política requiera evaluación independiente.
3. Las preguntas fuera del plan deberán marcarse y no podrán alimentar scoring
   hasta revisión.
4. Las notas no contendrán diagnósticos, rumores, opiniones sobre vida privada ni
   categorías no relacionadas con el cargo.
5. La grabación estará desactivada por defecto. Si una política la habilita,
   requerirá finalidad, información previa, consentimiento cuando corresponda,
   alternativa equivalente, acceso restringido y conservación específica.
6. Una transcripción automática será dato derivado, deberá indicar proveedor,
   confianza y fuente, y no sustituirá la evidencia original.
7. El candidato recibirá instrucciones, asistencia y canal para reportar
   comportamiento inapropiado sin afectar automáticamente su proceso.

---

#### 12. Pruebas prácticas, técnicas y psicométricas

Cada assessment deberá declarar:

- relación con funciones reales;
- finalidad;
- proveedor o responsable;
- versión del instrumento;
- instrucciones;
- tiempo y condiciones;
- accesibilidad;
- materiales permitidos;
- criterios de evaluación;
- vigencia;
- datos producidos;
- tratamiento de fraude o incidentes;
- revisión humana;
- política de repetición;
- conservación;
- limitaciones conocidas.

Resultados separados:

```text
STARTED
SUBMITTED
INCOMPLETE
TECHNICAL_FAILURE
INVALIDATED_WITH_REASON
PENDING_REVIEW
REVIEWED
```

Reglas:

1. Una falla de plataforma no será un resultado del candidato.
2. La detección automática de fraude será una señal, no una decisión terminal.
3. El assessment no solicitará acceso innecesario a cámara, micrófono, pantalla,
   contactos, archivos o ubicación.
4. Las adaptaciones por accesibilidad no reducirán la calificación por sí mismas.
5. Un instrumento externo no enviará decisión de contratación, sino datos o
   resultados definidos por contrato.
6. No se aplicarán instrumentos no validados para la finalidad declarada.
7. Una prueba podrá repetirse solo bajo regla conocida, conservando intentos y
   motivos.
8. No se compararán scores de instrumentos o versiones incompatibles como si
   fueran equivalentes.

---

#### 13. Accesibilidad, ajustes y trato equitativo

El candidato podrá solicitar ajustes sin exponer públicamente diagnósticos ni
recibir una marca negativa.

El caso de ajuste conservará:

- solicitud;
- necesidad funcional mínima;
- actividad afectada;
- responsable restringido;
- alternativa aprobada;
- vigencia;
- comunicación;
- resultado operativo;
- acceso y conservación limitados.

Reglas:

1. El evaluador verá la instrucción operativa necesaria, no el diagnóstico.
2. El ajuste no se mostrará como score ni como evidencia adversa.
3. La alternativa deberá medir el mismo criterio esencial cuando sea posible.
4. Rechazar un ajuste requerirá autoridad, fundamento y revisión especializada.
5. Una persona no será obligada a usar exclusivamente una modalidad inaccesible
   si existe alternativa razonable aprobada.
6. La experiencia web, PWA, Android e iOS conservará las mismas garantías.

---

#### 14. Preguntas y datos prohibidos o restringidos

El banco de preguntas deberá clasificar cada pregunta como:

```text
ALLOWED
CONDITIONALLY_ALLOWED
RESTRICTED_TO_AUTHORIZED_PROVIDER
PROHIBITED
RETIRED
```

Toda pregunta permitida deberá incluir:

- criterio del cargo;
- finalidad;
- etapa;
- texto y variantes;
- evidencia esperada;
- quién puede formularla;
- tratamiento de respuesta;
- vigencia y versión.

No se admitirán preguntas o inferencias sobre asuntos no relacionados con el
cargo, entre ellos:

- planes reproductivos;
- intención de tener hijos;
- embarazo, salvo los supuestos estrictos y procedimientos permitidos por ley;
- religión;
- orientación sexual;
- afiliación política;
- origen étnico o racial;
- discapacidad como sustituto de evaluación funcional y ajustes;
- vida familiar o estado civil sin finalidad válida;
- diagnósticos médicos;
- información genética;
- datos bancarios antes de la fase correspondiente;
- contraseñas o acceso a cuentas personales.

Reglas:

1. Una respuesta voluntaria no autoriza usarla en scoring.
2. El sistema permitirá reportar y excluir una pregunta improcedente.
3. Si se detecta dato sensible en una nota, se bloqueará su difusión, se abrirá
   incidente y se aplicará la política de corrección y conservación.
4. Los formularios no tendrán campos libres ilimitados como vía para evadir el
   catálogo.

---

#### 15. Evaluación médica pre-ocupacional

La evaluación médica se tratará como una validación especializada y reservada,
no como una entrevista ni como una prueba administrada por TALENTO.

Secuencia objetivo:

```text
CANDIDATO CON APROBACIÓN CONDICIONAL
→ PERFIL DE CARGO Y FACTORES DE RIESGO AUTORIZADOS
→ ORDEN AL PRESTADOR COMPETENTE
→ INFORMACIÓN Y CONSENTIMIENTOS APLICABLES
→ EVALUACIÓN POR PROFESIONAL HABILITADO
→ CERTIFICADO O CONCEPTO OCUPACIONAL MÍNIMO
→ REVISIÓN DE RESTRICCIONES Y AJUSTES
→ DECISIÓN VISO SOBRE COMPATIBILIDAD Y CONDICIONES
```

Vento Group podrá conservar únicamente lo permitido y necesario, por ejemplo:

- identificación del certificado;
- prestador;
- cargo evaluado;
- fecha y vigencia;
- concepto funcional permitido;
- restricciones o recomendaciones necesarias;
- necesidad de ajuste o reevaluación;
- referencia segura al documento permitido.

No conservará:

- historia clínica ocupacional;
- anamnesis;
- diagnósticos;
- resultados detallados;
- imágenes;
- muestras;
- medicación;
- antecedentes clínicos completos.

Reglas:

1. El empleador asumirá el costo de las evaluaciones que ordene según la regla
   aplicable; no se cargará al aspirante.
2. El prestador recibirá el perfil del cargo y factores de riesgo autorizados.
3. Las pruebas complementarias seguirán el consentimiento informado y la
   competencia profesional aplicables.
4. La prueba de embarazo no será requisito general. Cualquier supuesto
   excepcional deberá cumplir la ley, consentimiento, riesgo real documentado y
   revisión especializada.
5. Las preguntas sobre planes reproductivos estarán prohibidas.
6. Una restricción no producirá rechazo automático. Se abrirá revisión de ajuste,
   compatibilidad, temporalidad y autoridad.
7. El evaluador de selección no verá diagnósticos ni historia clínica.
8. TALENTO mostrará al candidato únicamente instrucciones y estados operativos
   permitidos.
9. Los archivos médicos detallados no pasarán por buckets empresariales.

---

#### 16. Referencias y verificaciones externas

Toda referencia o verificación deberá tener:

- finalidad y relación con el cargo;
- fuente autorizada;
- aviso o autorización aplicable;
- datos mínimos;
- preguntas estructuradas;
- identidad y rol de quien responde;
- timestamp;
- nivel de certeza;
- contradicciones;
- evidencia;
- política de conservación;
- revisión humana antes de efecto adverso.

Se distinguirán:

```text
VERIFICACIÓN OBJETIVA
→ existencia, cargo, período, licencia o certificado

REFERENCIA SUBJETIVA
→ opinión contextual de una fuente identificada

SEÑAL DE RIESGO
→ dato que requiere investigación y contradicción
```

Reglas:

1. No responder una referencia no equivaldrá a resultado negativo.
2. Una opinión no comprobada no será hecho.
3. No se utilizarán listas informales, rumores o búsquedas masivas de redes
   sociales como sustituto de verificación.
4. Información adversa deberá contrastarse y, cuando corresponda, permitir
   corrección o explicación.
5. El proveedor no recibirá el expediente completo.
6. Los resultados no se reutilizarán en futuras vacantes sin vigencia y finalidad.

---

#### 17. Calificación y score

Cada rating deberá registrar:

- criterio;
- versión;
- escala;
- anchor seleccionado;
- evidencia;
- evaluador;
- confianza;
- condición `unknown` o `not_observed`;
- fecha;
- conflicto;
- addendum posterior.

El score agregado, si existe, deberá ser:

- reproducible;
- explicable;
- versionado;
- recalculable sin modificar ratings originales;
- incapaz de incluir atributos prohibidos;
- incapaz de convertir faltantes en cero;
- acompañado de cobertura de criterios;
- presentado como apoyo, no como decisión.

Reglas:

1. No se ocultarán umbrales dentro del cliente.
2. Un cambio de peso no recalificará silenciosamente decisiones históricas.
3. Un override conservará valor previo, nuevo valor, actor, motivo y autoridad.
4. La comparación entre candidatos utilizará la misma versión o explicará la
   incompatibilidad.
5. No se publicarán rankings nominativos fuera del equipo autorizado.
6. Los modelos de IA no accederán a datos sensibles ni producirán decisión final.
7. Toda recomendación generada o asistida automáticamente será marcada como tal
   y revisada por una persona competente.

---

#### 18. Recomendación de selección

La recomendación será un objeto separado con estados:

```text
DRAFT
→ SUBMITTED
→ NEEDS_CALIBRATION
→ CALIBRATED
→ FINALIZED
→ SUPERSEDED
```

Resultados permitidos:

```text
RECOMMEND_ADVANCE
RECOMMEND_HOLD
RECOMMEND_ALTERNATE
RECOMMEND_NOT_ADVANCE
INSUFFICIENT_EVIDENCE
CONFLICT_REQUIRES_REVIEW
```

La recomendación deberá incluir:

- criterios cubiertos y faltantes;
- evidencia principal;
- riesgos relacionados con el cargo;
- fortalezas observables;
- contradicciones;
- ajustes pendientes;
- autor o panel;
- disensos;
- fecha y versión.

No deberá incluir:

- decisión laboral;
- salario o condiciones no autorizadas;
- diagnósticos;
- juicios sobre vida privada;
- comparaciones humillantes;
- etiquetas permanentes sobre la persona;
- conclusiones sin evidencia.

---

#### 19. Paquete de decisión

Antes de solicitar decisión en VISO deberá existir un paquete congelado con:

- postulación y versión de vacante;
- plan de evaluación y versión;
- resumen de requisitos;
- entrevistas completadas;
- assessments y cobertura;
- validaciones permitidas;
- concepto ocupacional mínimo cuando aplique;
- recomendaciones y disensos;
- conflictos de interés;
- excepciones;
- datos faltantes;
- riesgos y ajustes pendientes;
- propuesta de condiciones dentro de política;
- hash o referencia de integridad;
- `decision_packet_version`.

Estados:

```text
BUILDING
→ VALIDATING
→ READY
→ SUBMITTED_TO_VISO
→ RETURNED_FOR_INFORMATION
→ LOCKED_FOR_DECISION
→ SUPERSEDED
```

Reglas:

1. El decisor no decidirá sobre un paquete que cambie silenciosamente durante la
   revisión.
2. Una nueva evidencia material creará versión y podrá invalidar la decisión
   pendiente.
3. El paquete no contendrá datos médicos detallados ni notas sin finalidad.
4. La proyección VISO será mínima y no convertirá a VISO en propietario de todo
   el expediente TALENTO.

---

#### 20. Decisión empresarial en VISO

La decisión deberá ejecutarse mediante comando autorizado y no mediante edición
directa de estado.

Estados de decisión:

```text
DRAFT
→ PENDING_APPROVAL
→ APPROVED_CONDITIONAL
→ APPROVED_FOR_OFFER
→ HOLD
→ ALTERNATE
→ REJECTED
→ CANCELLED
```

Campos mínimos:

- `hiring_decision_id`;
- aplicación;
- paquete y versión;
- empresa, sede, área y cargo;
- headcount/cupo relacionado;
- resultado;
- reason codes;
- justificación restringida;
- mensaje público separado;
- condiciones pendientes;
- aprobador;
- delegación y alcance;
- segundo aprobador cuando aplique;
- timestamp;
- vigencia;
- correlación e idempotencia.

Reglas:

1. TALENTO no emitirá la decisión empresarial.
2. El entrevistador no decidirá por ser entrevistador.
3. El líder de sede no podrá aprobar fuera de su empresa, sede, cargo, presupuesto
   o delegación.
4. Una decisión `APPROVED_CONDITIONAL` identificará condiciones concretas y
   resolverá cada una antes de oferta final o según la plantilla aprobada.
5. Un score no podrá completar automáticamente el comando.
6. El rechazo tendrá fundamento relacionado con el proceso o cargo y no utilizará
   categorías protegidas.
7. La excepción de segregación requerirá segundo control y motivo.
8. Cancelar una vacante no convertirá automáticamente a todos los candidatos en
   “no aptos”; utilizará un resultado distinto.

---

#### 21. Rechazo, hold y candidato alterno

Se diferenciarán:

```text
REJECTED_FOR_THIS_APPLICATION
VACANCY_CANCELLED
CANDIDATE_WITHDRAWN
HOLD_WITH_REVIEW_DATE
ALTERNATE_FOR_THIS_ROUND
INSUFFICIENT_INFORMATION
DUPLICATE_RESOLVED
```

Reglas:

1. El rechazo será específico de la postulación y no una marca global permanente.
2. El mensaje público será respetuoso, claro y separado de notas internas.
3. `HOLD` deberá tener motivo, responsable y fecha de revisión; no será un limbo.
4. `ALTERNATE` tendrá vigencia y no equivaldrá a consentimiento para futuras
   vacantes.
5. Cerrar una postulación resolverá entrevistas, tareas, ofertas y notificaciones
   pendientes sin borrar evidencia.
6. Un candidato podrá volver a postularse según política; el historial no se
   convertirá automáticamente en rechazo nuevo.
7. Las razones adversas basadas en información corregible deberán actualizarse
   mediante addendum, no sobreescritura.

---

#### 22. Modelo canónico de oferta

La oferta será una instancia versionada derivada de una decisión VISO autorizada.

Campos mínimos:

- `offer_id`;
- `offer_version`;
- aplicación y candidato;
- decisión autorizante;
- entidad empleadora;
- cargo;
- sede y área propuestas;
- responsable o línea de reporte cuando aplique;
- modalidad y naturaleza del vínculo propuesta;
- fecha prevista de inicio;
- duración o término cuando aplique;
- compensación y periodicidad;
- jornada o regla de programación;
- lugar o movilidad;
- beneficios autorizados;
- período de prueba propuesto si legalmente corresponde;
- condiciones precedentes;
- documentos o verificaciones pendientes;
- plantilla y versión jurídica;
- idioma;
- fecha de emisión;
- expiración;
- firmantes o aprobadores;
- canales de entrega;
- anexos;
- hash de contenido.

Reglas:

1. Los valores se resolverán desde políticas o autorizaciones vigentes; no desde
   texto manual no controlado.
2. Una plantilla no será una oferta hasta crear instancia aprobada.
3. La oferta no contendrá permisos de aplicaciones ni datos de otros candidatos.
4. El candidato verá las condiciones materiales antes de responder.
5. Una oferta no ocultará condiciones en documentos distintos no presentados.
6. Los anexos conservarán versión y hash.
7. El sistema no asumirá que una oferta aceptada equivale por sí sola a contrato,
   alta laboral o inicio efectivo; el efecto dependerá del contrato jurídico
   aprobado y del handoff.

---

#### 23. Lifecycle de oferta

```text
DRAFT
→ PENDING_APPROVAL
→ APPROVED
→ SCHEDULED_TO_SEND
→ SENT
→ DELIVERED
→ VIEWED
→ ACKNOWLEDGED
→ ACCEPTED / DECLINED / EXPIRED / WITHDRAWN
```

Estados adicionales:

```text
DELIVERY_FAILED
CLARIFICATION_REQUESTED
AMENDMENT_PENDING
SUPERSEDED
VOIDED
```

Reglas:

1. `SENT` no equivale a `DELIVERED`.
2. `DELIVERED` no equivale a `VIEWED`.
3. `VIEWED` no equivale a `ACKNOWLEDGED`.
4. `ACKNOWLEDGED` no equivale a `ACCEPTED`.
5. Un mensaje de WhatsApp, email o push será proyección; el estado canónico vive
   en la instancia de oferta.
6. La entrega fallida tendrá reintento y canal alterno sin crear otra oferta.
7. Expirar no borrará la oferta ni la respuesta anterior.
8. Retirar requerirá autoridad, motivo, comunicación y resolución de efectos.
9. Solo una versión podrá estar abierta para respuesta por aplicación, salvo
   excepción explícita.

---

#### 24. Respuesta del candidato

Resultados permitidos:

```text
ACCEPTED
DECLINED
CLARIFICATION_REQUESTED
NO_RESPONSE
EXPIRED
```

La evidencia deberá conservar:

- persona autenticada o verificada;
- aplicación;
- oferta y versión;
- contenido/hash presentado;
- canal;
- método de autenticación;
- timestamp de servidor;
- decisión;
- comentarios permitidos;
- consentimiento o aceptación aplicable;
- dirección de retorno segura;
- idempotency key;
- receipt.

Métodos posibles según riesgo y plantilla:

- portal autenticado;
- OTP o step-up;
- firma electrónica autorizada;
- aceptación presencial auditada;
- respuesta desde canal previamente verificado con control adicional.

```text
FIRMA DIBUJADA
≠ IDENTIDAD VERIFICADA
≠ AUTORIDAD
≠ CONOCIMIENTO DE LA VERSIÓN
≠ ACEPTACIÓN VÁLIDA POR SÍ SOLA
```

Reglas:

1. Doble toque o reintento devolverá el mismo resultado.
2. Una aceptación posterior a expiración quedará rechazada o en revisión, no se
   activará silenciosamente.
3. La solicitud de aclaración no equivaldrá a rechazo.
4. El candidato podrá descargar o consultar la versión respondida.
5. Una respuesta offline permanecerá pendiente hasta acuse del servidor y no se
   presentará como final sin confirmación.
6. El personal interno no aceptará en nombre del candidato salvo procedimiento
   excepcional jurídicamente aprobado y auditado.

---

#### 25. Cambios materiales y supersesión

Se consideran cambios materiales, entre otros:

- entidad empleadora;
- cargo;
- sede o área;
- compensación;
- jornada;
- fecha de inicio;
- modalidad o término;
- período de prueba;
- condición precedente;
- lugar de trabajo;
- beneficios materiales;
- firmante o plantilla jurídica cuando altere efectos.

Flujo:

```text
CAMBIO MATERIAL SOLICITADO
→ REVALIDAR AUTORIDAD Y POLÍTICA
→ CREAR NUEVA VERSIÓN
→ APROBAR
→ MARCAR VERSIÓN ANTERIOR COMO SUPERSEDED
→ PRESENTAR NUEVA VERSIÓN
→ CAPTURAR NUEVA RESPUESTA
```

Reglas:

1. Editar una oferta aceptada no modificará su contenido histórico.
2. La aceptación de una versión no se trasladará a otra.
3. Los cambios menores también conservarán addendum y clasificación.
4. Retirar o anular no eliminará evidencia.
5. La renegociación tendrá su propio motivo y actores.

---

#### 26. Pre-registro del candidato seleccionado

El pre-registro será un objeto preparatorio dentro de VISO, no un empleado activo.

```text
OFERTA ACEPTADA Y CONDICIONES RESUELTAS
→ PRE-REGISTRATION_DRAFT
→ VALIDATING
→ READY_FOR_HANDOFF
```

Estados de excepción:

```text
BLOCKED
NEEDS_CANDIDATE_CORRECTION
NEEDS_INTERNAL_APPROVAL
CANCELLED_BEFORE_START
SUPERSEDED
EXPIRED
```

Campos permitidos:

- persona y candidate/application IDs;
- decisión y oferta aceptada;
- entidad empleadora;
- cargo;
- sede y área propuestas;
- fecha efectiva propuesta;
- modalidad o término aprobado;
- jefe o responsable propuesto;
- rol base y rol operativo propuestos, sin activar;
- documentos laborales whitelisted y su estado;
- concepto ocupacional mínimo y ajustes necesarios;
- tareas de pre-ingreso;
- estado de validación;
- bloqueos;
- paquete de handoff y versión.

El pre-registro no podrá crear ni activar:

- `employee`;
- episodio laboral;
- sede asignada activa;
- rol o permiso;
- usuario laboral;
- PIN;
- acceso ANIMA;
- turno;
- check-in;
- nómina;
- carnet;
- dispositivo o sesión.

Reglas:

1. El candidato seguirá siendo candidato durante el pre-registro.
2. La vista interna deberá etiquetarlo como “pre-registro”, no “empleado activo”.
3. Los datos propuestos se validarán contra catálogo y autorización antes del
   handoff.
4. Corregir un dato no alterará la oferta material sin nueva versión cuando
   corresponda.
5. Cancelar antes de inicio cerrará tareas y accesos pendientes sin borrar el
   historial ni producir offboarding ficticio.
6. `CAP-TAL-005` definirá el comando que materializa cada resultado laboral.

---

#### 27. Múltiples postulaciones, ofertas y selección principal

Reglas:

1. Una persona puede tener varias postulaciones activas, pero solo una puede estar
   marcada como proceso principal de contratación cuando alcance oferta o
   pre-registro, salvo política expresa.
2. Aprobar una postulación no rechazará automáticamente las demás.
3. Emitir una oferta deberá evaluar conflictos con otras ofertas abiertas.
4. Aceptar una oferta podrá pausar otras postulaciones, pero el efecto será
   explícito y reversible hasta el handoff según política.
5. Una decisión de `ALTERNATE` no bloqueará postulación a otra vacante.
6. Los equipos no verán comparaciones de otras vacantes sin finalidad y permiso.
7. La persona no se duplicará por postularse a diferentes empresas o sedes.

---

#### 28. Altas directas, reingresos y movimientos internos

Se conservarán rutas separadas:

| Caso                        | Ruta correcta                                                            |
| --------------------------- | ------------------------------------------------------------------------ |
| contratación externa normal | TALENTO → decisión VISO → oferta → pre-registro → handoff                |
| alta directa excepcional    | comando VISO con motivo, autoridad y evidencia, sin postulación ficticia |
| reingreso                   | identidad existente + nuevo episodio y nuevas autorizaciones             |
| traslado o promoción        | proceso laboral interno, no candidatura externa ficticia                 |
| migración histórica         | paquete de migración con procedencia y controles                         |

Reglas:

1. No se crearán entrevistas o scores ficticios para satisfacer validaciones.
2. La alta directa no usará invitación ANIMA como autoridad laboral.
3. El reingreso no heredará automáticamente permisos, sesiones, sedes o
   excepciones anteriores.
4. Un trabajador activo que participa en convocatoria interna tendrá proceso
   diferenciado y privacidad acorde.
5. `CAP-TAL-005` y `CAP-TAL-006` cerrarán handoff, continuidad, revocación y
   readiness de estas rutas.

---

#### 29. SLA, tareas y comunicaciones

Cada tipo de actividad deberá definir:

- plazo objetivo;
- responsable;
- backup;
- horas de servicio;
- zona horaria;
- recordatorios;
- escalamiento;
- contingencia;
- estado terminal;
- regla de vencimiento.

Eventos de comunicación mínimos:

- invitación a entrevista;
- confirmación;
- reprogramación;
- cancelación;
- recordatorio;
- solicitud de información;
- avance de etapa;
- decisión comunicable;
- presentación de oferta;
- aclaración;
- expiración;
- retiro;
- aceptación y siguientes pasos.

Reglas:

1. La comunicación no revelará notas internas, scores, diagnósticos ni datos de
   otros candidatos.
2. Un mensaje enviado no cerrará la tarea sin acuse cuando el proceso lo exija.
3. Los canales alternos conservarán la misma correlación.
4. El candidato podrá actualizar preferencias sin perder comunicaciones
   obligatorias del proceso.
5. El silencio no se interpretará como aceptación.

---

#### 30. Concurrencia, offline e idempotencia

Comandos materiales deberán exigir:

- versión esperada;
- actor y contexto;
- permiso;
- idempotency key;
- correlación;
- precondiciones;
- resultado estable;
- evento y receipt.

Casos obligatorios:

1. dos entrevistadores finalizan simultáneamente;
2. un decisor actúa sobre paquete supersedido;
3. dos aprobadores editan condiciones;
4. se envía dos veces la oferta;
5. candidato acepta desde web y móvil;
6. aceptación llega después de expiración;
7. la red cae después de guardar la respuesta;
8. proveedor reenvía callback;
9. una cita se reprograma mientras sale un recordatorio;
10. se cancela la vacante durante evaluación;
11. se crea pre-registro mientras se retira la oferta.

Resultados:

```text
SUCCESS
ALREADY_APPLIED
STALE_VERSION
PRECONDITION_FAILED
NOT_AUTHORIZED
CONFLICT_REQUIRES_REVIEW
RETRYABLE_FAILURE
FINAL_FAILURE
```

La UI no podrá mostrar éxito definitivo sin receipt del servidor.

---

#### 31. Auditoría y evidencia

Cada acción material conservará:

- persona;
- candidato;
- postulación;
- vacante y versión;
- plan y versión;
- actividad o sesión;
- actor humano o técnico;
- rol y alcance efectivo;
- aplicación y superficie;
- empresa, sede y área;
- objeto anterior y nuevo;
- reason code;
- evidencia;
- datos excluidos;
- consentimiento o autoridad;
- correlación;
- idempotencia;
- timestamp;
- resultado;
- excepción;
- recuperación.

Eventos obligatorios incluyen:

- plan aprobado o retirado;
- candidato preseleccionado;
- entrevista creada, confirmada, reprogramada, ejecutada o fallida;
- rating finalizado o corregido;
- assessment recibido o invalidado;
- recomendación emitida;
- paquete congelado;
- decisión creada o supersedida;
- oferta aprobada, enviada, entregada, vista, respondida, expirada o retirada;
- pre-registro creado, bloqueado, listo o cancelado.

---

#### 32. Métricas y control de calidad

Métricas permitidas:

- tiempo por etapa;
- tasa de reprogramación;
- no-show separado por actor;
- cobertura de criterios;
- tiempo de decisión;
- tasa de oferta;
- aceptación;
- expiración;
- causas operativas de abandono;
- fallos de canal;
- discrepancia entre evaluadores;
- overrides;
- ajustes solicitados y resueltos;
- resultados por versión de instrumento;
- integridad y completitud del expediente.

Guardrails:

- ninguna métrica de velocidad incentivará saltar evidencia;
- no se publicarán rankings de entrevistadores basados en tasa de rechazo;
- la comparación entre grupos requerirá privacidad y revisión especializada;
- una señal de disparidad abrirá análisis, no corrección automática de resultados;
- dashboards no mostrarán diagnósticos, notas libres ni muestras pequeñas
  reidentificables;
- los KPIs distinguirán vacante cancelada, retiro, rechazo y pérdida técnica.

---

#### 33. Seguridad y privacidad

Controles mínimos:

- RLS y comandos de dominio;
- acceso por caso, finalidad, territorio y tiempo;
- step-up para decisiones, ofertas y overrides;
- URLs firmadas y temporales;
- logs sin respuestas sensibles;
- no caché de paquetes, ofertas o documentos en dispositivos compartidos;
- no secretos en el cliente;
- service role fuera del frontend;
- exportaciones limitadas y auditadas;
- separación de nota pública e interna;
- ocultamiento de evaluaciones de otros candidatos;
- revocación de accesos al cerrar participación;
- minimización en proveedores y notificaciones.

La aplicación móvil o web del candidato nunca recibirá:

- score de otros candidatos;
- ranking interno;
- notas internas;
- deliberación;
- identidad no necesaria de evaluadores;
- razones de seguridad reservadas;
- historia clínica;
- datos de terceros.

---

#### 34. Integraciones y contratos

Integraciones posibles:

- calendario;
- videollamada;
- correo, SMS o WhatsApp;
- assessments;
- verificación de licencias o certificados;
- referencias;
- salud ocupacional;
- firma electrónica;
- VISO;
- TALENTO web, PWA y nativo.

Cada integración deberá definir:

- propietario;
- finalidad;
- datos mínimos;
- identificadores externos e internos;
- versión del contrato;
- autenticación;
- firma de webhook;
- idempotencia;
- estados y mapeo;
- timeouts;
- reintentos;
- reconciliación;
- datos prohibidos;
- retención;
- contingencia;
- cierre contractual.

Regla:

```text
ESTADO DEL PROVEEDOR
≠ ESTADO CANÓNICO SIN MAPEO, VALIDACIÓN Y RECONCILIACIÓN
```

---

#### 35. Fallos y recuperación

| Fallo                            | Respuesta objetivo                                                 |
| -------------------------------- | ------------------------------------------------------------------ |
| entrevistador ausente            | reprogramar, registrar responsabilidad y no afectar al candidato   |
| videollamada caída               | contingencia o nueva sesión enlazada                               |
| assessment no carga              | `TECHNICAL_FAILURE`, no score adverso                              |
| callback duplicado               | devolver resultado idempotente                                     |
| criterio retirado                | congelar versión y abrir revisión                                  |
| paquete cambiado                 | invalidar decisión pendiente                                       |
| oferta no entregada              | reintentar o usar canal alterno                                    |
| aceptación duplicada             | devolver mismo receipt                                             |
| aceptación tardía                | bloquear y remitir a revisión                                      |
| prestador envía historia clínica | rechazar payload, aislar incidente y no incorporar al expediente   |
| restricción ocupacional          | abrir revisión de ajuste, no rechazo automático                    |
| decisor sin alcance              | denegar y escalar                                                  |
| oferta retirada tras aceptación  | caso excepcional con autoridad, comunicación y resolución jurídica |
| pre-registro duplicado           | conciliar por aplicación, decisión y oferta                        |
| vacante cancelada                | cerrar por cancelación, no por ineptitud                           |

Un fallo parcial mantendrá visible el estado pendiente y su recuperación. No se
marcará como completado por conveniencia visual.

---

#### 36. Contrato de pantallas futuro

Sin diseñar todavía UI definitiva, las superficies consumidoras deberán poder
soportar:

**Candidato TALENTO**

- detalle y confirmación de entrevista;
- solicitud de reprogramación;
- instrucciones de assessment;
- ajustes y asistencia;
- estado de validaciones;
- oferta versionada;
- aclaraciones;
- respuesta y receipt;
- tareas de pre-ingreso.

**Equipo TALENTO**

- tablero por etapa;
- plan y criterios;
- agenda;
- formularios estructurados;
- incidentes;
- recomendación;
- paquete de decisión;
- comunicaciones.

**VISO**

- decisión autorizada;
- propuesta y validación de condiciones;
- aprobación de oferta;
- pre-registro;
- bloqueos y excepciones;
- readiness para handoff.

Las pantallas serán especificadas y auditadas en `PROC-SCREEN-001` a
`PROC-SCREEN-028`, `UX-BASE-001` a `UX-BASE-015`, `UX-ADMIN-001` a
`UX-ADMIN-005` y tareas de aplicación consumidoras. Esta tarea no duplica esas
definiciones.

---

#### 37. Propiedad de brechas y decisiones diferidas

| Brecha o decisión                                     | Tarea propietaria                                              |
| ----------------------------------------------------- | -------------------------------------------------------------- |
| comando de handoff y materialización laboral          | `CAP-TAL-005`                                                  |
| whitelist exacta de transferencia                     | `CAP-TAL-005`                                                  |
| creación de empleado, episodio, asignaciones y acceso | `CAP-TAL-005`                                                  |
| período de prueba, continuidad y cierre               | `CAP-TAL-006`                                                  |
| permisos provisionales y revocación                   | `CAP-TAL-006`                                                  |
| textos jurídicos y efectos de oferta                  | `CAP-TAL-006` y validación profesional                         |
| plazos definitivos de retención y respuesta           | `CAP-TAL-006`                                                  |
| readiness y roadmap del producto                      | `CAP-TAL-006`                                                  |
| RLS, RPC y Storage                                    | `AUTH-DB-001` a `AUTH-DB-035`, `AUTH-SRV-001` a `AUTH-SRV-018` |
| integraciones de terceros                             | `INT-APP-001` a `INT-APP-010`, `INT-EXT-001` a `INT-EXT-020`   |
| pantallas                                             | `PROC-SCREEN-001` a `PROC-SCREEN-028`                          |
| experiencia y pruebas UX                              | `UX-BASE-001` a `UX-BASE-015`, `UX-QA-001` a `UX-QA-030`       |
| evidencia                                             | `EVID-ARC-001` a `EVID-ARC-010`                                |
| colas, reintentos y reconciliación                    | `QUEUE-ARC-001` a `QUEUE-ARC-010`                              |

No queda decisión diferida sin propietario documental.

---

#### 38. Fuera de alcance

Esta tarea no:

- implementa pantallas;
- crea tablas, enums, buckets o funciones;
- aplica migraciones;
- selecciona proveedor;
- emite una oferta real;
- define salarios o beneficios;
- autoriza pruebas concretas;
- contrata ni registra trabajadores;
- habilita ANIMA;
- crea permisos;
- reemplaza la validación jurídica, laboral, psicológica o médica;
- aprueba IA de selección;
- activa firma electrónica;
- materializa el roadmap de TALENTO.

---

#### 39. Requisitos de prueba derivados

Esta tarea incorpora al registro canónico:

```text
TREQ-TALENTO-039
TREQ-TALENTO-040
TREQ-TALENTO-041
TREQ-TALENTO-042
TREQ-TALENTO-043
TREQ-TALENTO-044
TREQ-TALENTO-045
TREQ-TALENTO-046
TREQ-TALENTO-047
TREQ-TALENTO-048
TREQ-TALENTO-049
TREQ-TALENTO-050
TREQ-TALENTO-051
TREQ-TALENTO-052
TREQ-TALENTO-053
TREQ-TALENTO-054
TREQ-TALENTO-055
```

Protegen respectivamente:

1. plan y criterios de evaluación;
2. lifecycle de entrevistas;
3. ejecución, evidencia y notas;
4. assessments y fallos técnicos;
5. accesibilidad y ajustes;
6. preguntas prohibidas y no discriminación;
7. scoring, recomendación y decisión humana;
8. frontera médica;
9. referencias y verificaciones;
10. paquete de decisión y autoridad VISO;
11. rechazo, hold y alternos;
12. lifecycle y versionado de oferta;
13. respuesta, identidad e idempotencia;
14. cambios materiales y supersesión;
15. pre-registro sin activación;
16. concurrencia, offline y recuperación;
17. auditoría, métricas y control de calidad.

---

#### 40. Criterios de aceptación

`CAP-TAL-004` podrá aprobarse cuando:

1. evaluación, recomendación, decisión, oferta y pre-registro estén separados;
2. el plan de evaluación sea versionado, relacionado con el cargo y previo al
   uso;
3. entrevistas y assessments tengan estados, participantes, evidencia,
   contingencia y recuperación;
4. datos faltantes y fallos técnicos no produzcan resultados adversos;
5. preguntas restringidas y categorías no relacionadas estén excluidas;
6. la accesibilidad y los ajustes no se conviertan en scoring negativo;
7. scoring y automatización sean auxiliares y requieran decisión humana;
8. la evaluación médica conserve reserva, costo, prestador y certificado mínimo;
9. referencias y verificaciones tengan fuente, finalidad y contradicción;
10. TALENTO conserve recomendación y VISO decisión y condiciones;
11. el paquete de decisión sea congelado y versionado;
12. rechazo, cancelación, hold, alterno y retiro sean resultados distintos;
13. la oferta tenga plantilla, instancia, versión, aprobación, vigencia y hash;
14. envío, entrega, vista, acuse y aceptación estén separados;
15. la respuesta del candidato tenga identidad, versión, receipt e
    idempotencia;
16. los cambios materiales creen una nueva versión;
17. el pre-registro no cree empleado, asignaciones, permisos ni acceso;
18. múltiples postulaciones, altas directas y reingresos tengan rutas explícitas;
19. concurrencia, offline y fallos parciales tengan resultados seguros;
20. las brechas queden asignadas a tareas concretas;
21. el registro canónico contenga 427 filas únicas de catorce columnas;
22. `CAP-TAL-005` permanezca sin iniciar.

---

#### 41. Resultado y continuidad

**Estado confirmado:** APROBADA

Como resultado de la aprobación:

- este bloque será el contrato canónico de evaluación, decisión, oferta y
  pre-registro;
- los drafts existentes deberán considerarse parciales cuando contradigan estas
  decisiones;
- no se autorizará implementación;
- la continuidad documental será:

```text
CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO
```

**Continuidad:**

```text
CAP-TAL-004 — APROBADA
CAP-TAL-005 — NO INICIADA
```


### ✅ CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO

**Estado:** APROBADA 
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `CAP-TAL-004 — Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato` — APROBADA  
**Siguiente tarea reservada:** `CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre`  
**Artefacto producido:** `CAP-TAL-HANDOFF-ORCHESTRATION-CONTRACT-001`  
**Procesos canónicos principales:** `VPROC-0005` y `VPROC-0006`  
**Naturaleza:** contrato transversal de identidad, materialización laboral, asignaciones, transferencia documental, aprovisionamiento de acceso, eventos, recuperación y conciliación  
**Propiedad y canales:** VISO gobierna el caso prelaboral, autoriza y materializa el vínculo; la base futura TALENTO podrá aportar interacción candidata sin propiedad de aplicación; identidad y autorización resuelven accesos; ANIMA consume la proyección del trabajador
**Cambios en código, datos, migraciones, RLS, RPC, Storage, Supabase, Auth, Edge Functions, colas, proveedores o aplicaciones:** no autorizados

---

#### 1. Propósito

Diseñar el traspaso objetivo desde un pre-registro laboral listo hasta la
existencia de un trabajador correctamente materializado y habilitado, sin:

- convertir directamente un candidato en empleado desde TALENTO;
- usar una invitación, correo, aceptación de oferta o coincidencia de email como
  autorización laboral;
- asumir que `candidate_id`, `auth_user_id`, `employee_id` y
  `employment_episode_id` son el mismo identificador;
- sobrescribir al trabajador existente durante un reingreso;
- reutilizar permisos, sesiones, dispositivos o excepciones de un vínculo
  anterior;
- modificar la sede, rol o contexto de un empleado existente solo porque una
  nueva postulación fue aprobada;
- cerrar la postulación como contratada antes de existir el compromiso laboral
  canónico;
- presentar el handoff como completo cuando ANIMA, documentos, asignaciones o
  accesos permanezcan pendientes;
- ejecutar una transacción distribuida ficticia entre TALENTO, VISO, Auth,
  Storage, ANIMA y canales externos;
- reintentar creando empleados, episodios, sedes, roles, permisos, invitaciones,
  documentos o eventos duplicados;
- borrar un vínculo laboral válido para compensar un fallo posterior de
  notificación o acceso;
- copiar carpetas completas de selección al expediente laboral;
- transferir notas, scores, comparaciones, referencias o información médica
  detallada a ANIMA;
- usar `service_role` como sustituto de la autorización humana;
- permitir que una UI, RPC directa, webhook, cola o consumidor desactualizado
  amplíe el alcance aprobado;
- dejar estados parciales sin responsable, siguiente acción ni conciliación;
- ocultar errores detrás de un mensaje genérico de “ingreso completado”;
- ejecutar el alta final desde una operación offline o sin acuse del servidor;
- mantener rutas legacy que crean `employees` desde invitaciones o desde un RPC
  de TALENTO sin evaluación dual y plan de retiro.

Esta tarea define contrato funcional, semántico y de orquestación. No autoriza
crear tablas, migraciones, funciones, eventos, colas, usuarios, trabajadores,
invitaciones ni accesos reales.

---

#### 2. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. cuál es la autoridad de inicio y quién puede autorizar el handoff;
2. qué precondiciones forman el gate `READY_FOR_HANDOFF`;
3. qué objetos, versiones y hashes se congelan en el manifiesto de traspaso;
4. cómo se distinguen persona, identidad Auth, candidato, empleado y episodio;
5. cómo se resuelven duplicados, coincidencias y conflictos de identidad;
6. qué crea o actualiza VISO y qué no puede crear TALENTO;
7. cómo se materializan empresa, cargo, sede, área, responsable y asignaciones;
8. cómo se resuelven roles y permisos desde catálogos autorizados;
9. qué documentos se referencian, copian, derivan o excluyen;
10. cómo se provisiona acceso a ANIMA sin convertir la invitación en autoridad;
11. qué ocurre cuando la fecha efectiva es futura;
12. qué estados conserva la orquestación completa y cada paso;
13. cómo funcionan locks, versionado esperado, idempotencia, outbox e inbox;
14. cómo se manejan fallos parciales, reintentos, compensaciones y cancelaciones;
15. cuándo se cierra TALENTO como `hired` y cuándo el handoff queda `COMPLETED`;
16. cómo se concilian TALENTO, VISO, identidad/autorización, ANIMA y Storage;
17. cómo se gestionan reingresos, altas directas, movimientos internos y
    migraciones sin inventar postulaciones;
18. qué evidencia, receipts, métricas y requisitos de prueba protegen el flujo;
19. qué brechas del diseño AS-IS deberán migrarse;
20. qué materias quedan reservadas para `CAP-TAL-006`.

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `CAP-TAL-001` y las fronteras TALENTO–VISO–ANIMA;
- `CAP-TAL-002` y la identidad/postulación universal web, PWA y nativa;
- `CAP-TAL-003` y el expediente progresivo, clasificación, consentimiento,
  transferencia, retención y eliminación;
- `CAP-TAL-004` y la evaluación, decisión VISO, oferta, respuesta y pre-registro;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- el modelo canónico de identidad, vínculos, roles base, roles operativos,
  asignaciones, contexto, autorización, evidencia e idempotencia;
- `AUTH-DB-001` a `AUTH-DB-035`;
- `AUTH-SRV-001` a `AUTH-SRV-018`;
- `VISO-AUTH-001` a `VISO-AUTH-020`;
- `ANIMA-AUTH-001` a `ANIMA-AUTH-020`;
- `INT-APP-001` a `INT-APP-010`;
- `INT-DB-001` a `INT-DB-008`;
- `INT-EXT-001` a `INT-EXT-020`;
- `QUEUE-ARC-001` a `QUEUE-ARC-012`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `PROC-SCREEN-001` a `PROC-SCREEN-028`;
- `UX-BASE-001` a `UX-BASE-015`, `UX-ADMIN-001` a `UX-ADMIN-005` y
  `UX-QA-001` a `UX-QA-030`.

Decisiones preservadas:

1. El dominio prelaboral futuro TALENTO conserva candidato, postulación y expediente histórico bajo propiedad funcional de VISO.
2. VISO conserva la decisión, el pre-registro, el vínculo, el episodio laboral y
   las asignaciones administrativas.
3. ANIMA no crea vínculos ni permisos; consume al trabajador habilitado.
4. Una aceptación de oferta no crea empleado.
5. Una invitación no crea ni reactiva empleado.
6. Un reingreso crea un episodio laboral nuevo.
7. Los permisos se resuelven desde catálogos y contexto; no se copian desde texto
   o JSON libre del candidato.
8. El período de prueba y los permisos provisionales pertenecen a
   `CAP-TAL-006`.
9. Ninguna migración se crea o ejecuta fuera de `vento-shell`.

Los documentos y RPC actuales de `vento-talento`, `vento-viso` y `vento-anima`
son evidencia AS-IS. Esta tarea establece el contrato TO-BE aunque exija retirar
funciones existentes.

---

#### 4. Principio rector

```text
TALENTO DECLARA READINESS
        ↓
VISO REVALIDA Y AUTORIZA EL ALTA
        ↓
ORQUESTADOR CONGELA EL MANIFIESTO
        ↓
IDENTIDAD CANÓNICA RESUELTA
        ↓
VISO MATERIALIZA EMPLEADO Y EPISODIO
        ↓
ASIGNACIONES Y AUTORIZACIÓN RESUELTAS
        ↓
DOCUMENTOS LABORALES REFERENCIADOS O TRANSFERIDOS
        ↓
ACCESO ANIMA PROVISIONADO SEGÚN FECHA Y POLÍTICA
        ↓
TALENTO CIERRA Y ENLAZA LA POSTULACIÓN
        ↓
RECEIPT, CONCILIACIÓN Y CIERRE DEL HANDOFF
```

Reglas:

- TALENTO no escribe directamente la verdad laboral.
- VISO no modifica el expediente histórico de selección.
- ANIMA no otorga autoridad laboral ni de seguridad.
- El orquestador ejecuta decisiones previamente autorizadas; no las inventa.
- Cada paso produce un resultado independiente y reconciliable.
- El compromiso laboral válido no se revierte mediante borrado técnico.
- La UI solo declara éxito cuando recibe un receipt canónico.

---

#### 5. Distinciones obligatorias

```text
PERSONA
≠ IDENTIDAD DE AUTENTICACIÓN
≠ CANDIDATO
≠ POSTULACIÓN
≠ PRE-REGISTRO
≠ EMPLEADO
≠ EPISODIO LABORAL
≠ ASIGNACIÓN TERRITORIAL
≠ ROL BASE
≠ ROL OPERATIVO
≠ PERMISO
≠ INVITACIÓN
≠ SESIÓN
```

```text
OFERTA ACEPTADA
≠ READINESS DE HANDOFF
≠ HANDOFF AUTORIZADO
≠ EMPLEO MATERIALIZADO
≠ ACCESO PROVISIONADO
≠ ANIMA ACTIVADA
≠ HANDOFF COMPLETADO
```

```text
EMPLOYEE CREATED
≠ EMPLOYMENT EPISODE ACTIVE
≠ SITE ASSIGNED
≠ ROLE RESOLVED
≠ PERMISSION EFFECTIVE
≠ ACCESS READY
```

---

#### 6. Objetos canónicos del traspaso

| Objeto                    | Propósito                                                              | Propietario                                  |
| ------------------------- | ---------------------------------------------------------------------- | -------------------------------------------- |
| `handoff_case`            | coordina una transición candidata-laboral                              | orquestación compartida gobernada desde VISO |
| `handoff_manifest`        | snapshot inmutable de referencias, versiones y decisiones              | orquestación                                 |
| `handoff_step`            | resultado durable por paso                                             | orquestación                                 |
| `identity_resolution`     | enlaza persona, Auth, candidato y empleado sin fusionar por heurística | identidad canónica                           |
| `employment_activation`   | orden autorizada para crear o reactivar verdad laboral                 | VISO                                         |
| `employee`                | identidad laboral estable de una persona                               | dominio laboral/VISO                         |
| `employment_episode`      | vínculo concreto con inicio, estado y cierre propios                   | dominio laboral/VISO                         |
| `employment_assignment`   | empresa, sede, área, cargo o responsable con vigencia                  | VISO                                         |
| `access_profile_request`  | plantilla y alcance de acceso solicitados, aún no efectivos            | VISO/autorización                            |
| `document_transfer_item`  | referencia/copia/hecho derivado con lineage                            | custodia documental                          |
| `access_invitation`       | mecanismo temporal de activación o recuperación                        | identidad/ANIMA                              |
| `handoff_receipt`         | resultado firmado o verificable de la ejecución                        | orquestación                                 |
| `candidate_employee_link` | relación histórica entre selección y resultado laboral                 | TALENTO, de solo enlace                      |

Los nombres son conceptos documentales. No autorizan tablas o enums con esos
nombres.

---

#### 7. Propiedad y fuentes de verdad

| Verdad                                | Fuente autorizada                    | Consumidores                                     |
| ------------------------------------- | ------------------------------------ | ------------------------------------------------ |
| candidato, postulación y selección    | VISO / dominio prelaboral TALENTO    | canal candidato futuro por contrato              |
| decisión y oferta aprobada            | VISO                                 | canal candidato futuro para presentación         |
| aceptación de oferta                  | VISO, recibida desde canal candidato | procesos de vinculación autorizados              |
| pre-registro                          | VISO                                 | canal candidato futuro por estado resumido       |
| persona e identidades enlazadas       | identidad canónica                   | todas las aplicaciones autorizadas               |
| empleado y episodio laboral           | VISO/dominio laboral                 | ANIMA, NUMERA y consumidores autorizados         |
| empresa, sede, área y cargo asignados | VISO                                 | autorización y ANIMA                             |
| permisos efectivos                    | motor de autorización                | VISO y aplicaciones                              |
| invitación y estado de credencial     | identidad/ANIMA                      | VISO por proyección                              |
| expediente histórico de selección     | VISO / dominio prelaboral TALENTO    | acceso restringido por finalidad                 |
| documentos laborales vigentes         | custodia laboral/VISO                | ANIMA solo para la persona y finalidad permitida |

Una proyección no podrá convertirse en fuente de verdad porque una pantalla la
permita editar.

---

#### 8. Gate `READY_FOR_HANDOFF`

El pre-registro solo podrá declararse listo cuando se hayan validado, al menos:

- persona y candidato resueltos;
- postulación vigente y no transferida;
- vacante/ronda identificadas;
- decisión VISO autorizada y no supersedida;
- oferta y versión vigentes;
- respuesta válida cuando aplique;
- pre-registro y versión vigentes;
- requisitos críticos completos o excepciones aprobadas;
- empresa empleadora;
- cargo;
- fecha efectiva y zona horaria;
- sede y área iniciales, cuando apliquen;
- responsable o cadena de reporte, cuando aplique;
- rol base propuesto;
- rol operativo inicial o regla para resolverlo;
- plantilla de acceso mínima;
- documentos de handoff clasificados;
- concepto ocupacional mínimo permitido, si aplica;
- bloqueos, conflictos y otras postulaciones resueltos;
- aprobadores y autoridad;
- política de invitación y acceso;
- versión esperada e idempotency key.

El readiness será una evaluación reproducible y versionada, no un checkbox
editable sin evidencia.

Estados posibles:

```text
NOT_READY
READY_WITH_APPROVED_EXCEPTIONS
READY_FOR_HANDOFF
SUPERSEDED
CANCELLED
```

---

#### 9. Autoridad para iniciar, autorizar y ejecutar

Se separan:

```text
PREPARAR
SOLICITAR
AUTORIZAR
EJECUTAR
REINTENTAR
CANCELAR
COMPENSAR
CONCILIAR
CERRAR
```

Reglas:

1. Preparar el pre-registro no autoriza el alta.
2. El mismo actor no podrá autoaprobar excepciones incompatibles con segregación.
3. VISO deberá verificar empresa, sede, área, cargo, cupo y delegación.
4. El orquestador ejecutará con identidad técnica, pero conservará al actor humano
   y su decisión de autorización.
5. `service_role` no equivale a permiso ni aprobador.
6. Reintentar requerirá alcance propio y validará que la autorización siga
   vigente.
7. Cancelar después del compromiso laboral tendrá semántica distinta a cancelar
   antes del compromiso.
8. Soporte técnico no podrá cambiar condiciones laborales para “destrabar” el
   caso.

---

#### 10. Comando canónico de handoff

El comando deberá incluir como mínimo:

##### 10.1. Control

- `handoff_id`;
- `command_id`;
- `idempotency_key`;
- `correlation_id`;
- `causation_id`;
- `requested_at`;
- `requested_by`;
- `authorized_at`;
- `authorized_by`;
- aplicación y canal de origen;
- versión contractual del comando;
- versión esperada del handoff y pre-registro.

##### 10.2. Referencias congeladas

- `person_id`;
- `auth_identity_id` cuando exista;
- `candidate_id`;
- `application_id`;
- vacante, publicación y ronda;
- decisión y versión;
- oferta y versión/hash;
- respuesta y receipt;
- pre-registro y versión;
- expediente documental/whitelist;
- readiness result y versión.

##### 10.3. Destino laboral

- empresa o entidad empleadora;
- tipo de vínculo o modalidad autorizada;
- cargo;
- fecha/hora efectiva y zona horaria;
- sede;
- área;
- responsable propuesto;
- centro de costo si corresponde;
- rol base solicitado;
- rol operativo solicitado o regla de resolución;
- plantilla mínima de acceso;
- política de acceso previo a inicio;
- documentos o facts transferibles;
- excepciones aprobadas.

##### 10.4. Precondiciones

- versión esperada de cada recurso;
- estado esperado;
- no existencia de handoff incompatible;
- no existencia de episodio activo incompatible;
- no revocación de decisión u oferta;
- vigencia de aprobaciones;
- integridad del manifiesto.

La UI no construirá libremente este payload. El servidor lo resolverá desde
fuentes autorizadas y aceptará únicamente referencias o cambios permitidos.

---

#### 11. Manifiesto inmutable

Antes de ejecutar se creará un snapshot verificable de:

- referencias e identificadores;
- versiones;
- hashes;
- condiciones laborales;
- asignaciones propuestas;
- política de acceso;
- whitelist documental;
- excepciones;
- aprobadores;
- precondiciones;
- acciones requeridas y opcionales.

Estados:

```text
BUILDING
VALIDATING
READY
LOCKED
SUPERSEDED
INVALIDATED
```

Una modificación material de decisión, oferta, respuesta, pre-registro,
identidad, empresa, cargo, fecha, sede, área, roles o documentos críticos
invalidará el manifiesto y obligará a generar uno nuevo.

---

#### 12. Resolución de identidad

La resolución no se basará únicamente en email, teléfono, nombre, documento sin
verificar ni coincidencia de dispositivo.

Casos:

| Caso                                             | Resultado                                                  |
| ------------------------------------------------ | ---------------------------------------------------------- |
| persona y Auth existentes, candidato enlazado    | reutilizar enlaces verificados                             |
| persona existente sin Auth                       | crear flujo de provisión o invitación, no duplicar persona |
| Auth existente sin vínculo de persona confirmado | abrir resolución, no convertir en empleado                 |
| candidato duplicado probable                     | bloquear y resolver con evidencia                          |
| empleado histórico existente                     | enlazar persona/employee y crear episodio nuevo si procede |
| identidad incompatible o disputada               | `IDENTITY_REVIEW_REQUIRED`                                 |
| posible suplantación                             | bloqueo de seguridad e incidente                           |

Resultados de resolución:

```text
RESOLVED_EXISTING
RESOLVED_NEW_LINK
MERGE_REVIEW_REQUIRED
IDENTITY_REVIEW_REQUIRED
SECURITY_HOLD
FAILED
```

Reglas:

1. `auth_user_id` es identidad técnica, no el episodio laboral.
2. `employee_id` no deberá depender conceptualmente de que sea igual a
   `auth_user_id`.
3. Si el schema legacy exige igualdad temporal, se utilizará un adaptador de
   compatibilidad y se registrará la dependencia.
4. Un merge no se ejecutará dentro del handoff sin workflow, autoridad y
   posibilidad de reversión.
5. Nunca se cambiará el propietario de una cuenta Auth para resolver un conflicto.

---

#### 13. Empleado y episodio laboral

Modelo objetivo:

```text
PERSONA
→ EMPLOYEE IDENTITY
→ EMPLOYMENT EPISODE 1
→ EMPLOYMENT EPISODE 2
→ ...
```

El empleado representa la identidad laboral estable. El episodio representa un
vínculo concreto, con:

- empresa;
- modalidad o tipo;
- cargo;
- fecha de inicio;
- estado;
- fecha de cierre cuando aplique;
- condiciones y versión;
- motivo/origen;
- asignaciones;
- aprobador;
- relación con el handoff.

Reglas:

1. Un primer ingreso puede crear empleado y episodio.
2. Un reingreso reutiliza persona/employee verificados y crea episodio nuevo.
3. No se modifica `joined_at` histórico para simular un nuevo ingreso.
4. No se reactiva un episodio cerrado.
5. Un traslado o promoción modifica o crea asignaciones del episodio vigente;
   no crea candidatura externa ficticia.
6. La existencia de `employee` sin episodio vigente no concede acceso operativo.

---

#### 14. Fecha efectiva y activación diferida

Se distinguen:

```text
AUTHORIZED_AT
EMPLOYMENT_EFFECTIVE_AT
ACCESS_NOT_BEFORE
FIRST_SHIFT_AT
INVITATION_EXPIRES_AT
```

Para una fecha futura:

- el episodio podrá quedar `SCHEDULED` o equivalente, no activo;
- las asignaciones podrán quedar programadas;
- los permisos efectivos no comenzarán antes de la política aprobada;
- una invitación anticipada solo dará acceso de preingreso expresamente permitido;
- ANIMA no mostrará turnos, equipo o información interna antes del alcance
  habilitado;
- un cambio de fecha revalidará invitación, roles, documentos y condiciones;
- la cancelación antes de inicio no se modelará como retiro de un trabajador que
  nunca estuvo activo.

`CAP-TAL-006` definirá el período de prueba, provisionalidad y continuidad
posteriores.

---

#### 15. Orquestación tipo saga

El handoff podrá involucrar múltiples dominios y servicios. No se asumirá una
transacción ACID única entre todos.

Flujo objetivo:

```text
1. LOCK_AND_REVALIDATE
2. RESOLVE_IDENTITY
3. COMMIT_EMPLOYMENT_IN_VISO
4. CREATE_OR_SCHEDULE_ASSIGNMENTS
5. RESOLVE_ACCESS_PROFILE
6. TRANSFER_OR_REFERENCE_DOCUMENTS
7. PROVISION_ANIMA_ACCESS
8. PUBLISH_PROJECTIONS_AND_NOTIFICATIONS
9. CLOSE_AND_LINK_TALENTO_APPLICATION
10. RECONCILE_AND_ISSUE_RECEIPT
```

Reglas:

- cada dominio realiza su transacción local;
- cada paso registra inicio, resultado y error antes de avanzar;
- los efectos externos usan outbox/inbox o mecanismo equivalente;
- una caída no obliga a repetir pasos exitosos;
- un paso opcional fallido no se oculta, pero puede no impedir el compromiso
  laboral cuando la política lo permita;
- los pasos críticos y opcionales se definen por versión de política;
- el workflow puede permanecer abierto después de activar el vínculo si el acceso
  o una notificación requiere remediación.

---

#### 16. Máquina de estados del handoff

Estados agregados propuestos:

```text
PREPARING
READY_FOR_AUTHORIZATION
AUTHORIZED
EXECUTING
EMPLOYMENT_COMMITTED
ACCESS_PENDING
PARTIALLY_COMPLETED
COMPLETED
BLOCKED
FAILED_RETRYABLE
FAILED_TERMINAL
CANCELLED
SUPERSEDED
COMPENSATION_REQUIRED
RECONCILIATION_REQUIRED
```

Estados de cada paso:

```text
PENDING
RUNNING
SUCCEEDED
SKIPPED_BY_POLICY
BLOCKED
FAILED_RETRYABLE
FAILED_TERMINAL
COMPENSATED
SUPERSEDED
```

Estos son labels documentales, no enums autorizados.

Invariantes:

1. `COMPLETED` exige receipt y reconciliación de pasos críticos.
2. `EMPLOYMENT_COMMITTED` no retrocede mediante delete.
3. `ACCESS_PENDING` no significa que el vínculo no exista.
4. `PARTIALLY_COMPLETED` siempre exige responsable y siguiente acción.
5. `FAILED_TERMINAL` no elimina efectos válidos ya confirmados.
6. `CANCELLED` solo es posible sin contradicción con el estado laboral real.

---

#### 17. Ledger de pasos

Cada `handoff_step` conservará:

- handoff y step code;
- versión;
- criticidad;
- estado;
- intento;
- idempotency key específica;
- input hash;
- output/receipt;
- sistema propietario;
- actor humano y principal técnico;
- inicio y fin;
- error normalizado;
- retry policy;
- next retry;
- compensation policy;
- dependencia;
- evidencia;
- correlation y causation IDs.

No se inferirá el estado de un paso únicamente a partir de la existencia de una
fila en otra tabla.

---

#### 18. Idempotencia

Niveles obligatorios:

1. **Comando:** una misma intención devuelve el mismo `handoff_id`.
2. **Caso de negocio:** una postulación y versión de pre-registro no crean dos
   handoffs activos incompatibles.
3. **Paso:** cada side effect usa una clave estable.
4. **Consumidor:** inbox evita procesar el mismo evento dos veces.
5. **Proveedor:** callbacks y respuestas externas se deduplican.
6. **Documentos:** hash, tipo, destino y versión evitan copias duplicadas.
7. **Invitación:** reenviar no crea empleado ni otra autoridad.

Clave conceptual:

```text
application_id
+
preregistration_version
+
employment_activation_intent
```

Un retry nunca será interpretado como una nueva contratación.

---

#### 19. Concurrencia y locks

Se deberán probar y controlar:

- dos actores autorizando el mismo pre-registro;
- dos comandos de handoff simultáneos;
- nueva versión de oferta mientras se ejecuta;
- retiro de aceptación;
- cancelación de vacante;
- dos postulaciones de la misma persona llegando a pre-registro;
- reingreso mientras existe episodio activo;
- cambio de sede, área o rol durante ejecución;
- resolución de identidad paralela;
- invitación creada por ruta legacy;
- cierre TALENTO y acceso ANIMA en orden invertido;
- retry después de timeout con efecto ya aplicado.

Controles:

- lock lógico o transaccional del caso;
- versión esperada;
- constraints de unicidad;
- compare-and-set;
- idempotency registry;
- revalidación antes de cada commit crítico;
- conflicto visible, no last-write-wins silencioso.

---

#### 20. Commit points y atomicidad

Se definen tres hitos:

```text
C0 — HANDOFF AUTHORIZED
C1 — EMPLOYMENT COMMITTED
C2 — HANDOFF COMPLETED
```

##### C0

Existe autorización válida, pero todavía no hay vínculo materializado. Se puede
cancelar sin offboarding.

##### C1

VISO confirmó empleado/episodio y fecha efectiva. Desde este punto:

- no se borra para compensar;
- una cancelación se procesa con semántica laboral apropiada;
- fallos de acceso abren remediación;
- TALENTO puede reflejar “ingreso materializado” con estado de habilitación
  separado.

##### C2

Los pasos críticos están conciliados, el enlace histórico existe y se emitió
receipt.

La política definirá qué pasos son críticos para C2 sin confundir acceso con
existencia del vínculo.

---

#### 21. Materialización laboral en VISO

VISO o el dominio laboral autorizado deberá:

- crear o resolver `employee`;
- crear un episodio laboral nuevo o programado;
- enlazar empresa;
- registrar cargo y condiciones aprobadas;
- crear asignaciones iniciales con vigencia;
- enlazar sede y área;
- registrar responsable cuando aplique;
- conservar decisión, oferta y pre-registro de origen;
- devolver IDs, versiones y receipt;
- rechazar conflictos o datos supersedidos.

TALENTO no deberá ejecutar `insert/upsert` directo sobre `employees`,
`employee_sites`, `employee_settings`, episodios, roles o permisos.

Actualizar un empleado existente no podrá:

- reemplazar automáticamente su sede principal;
- sobrescribir su rol global;
- reactivar un episodio cerrado;
- modificar su nombre canónico sin workflow de identidad;
- desmarcar asignaciones válidas de otros episodios;
- restaurar permisos históricos.

---

#### 22. Asignaciones, roles y permisos

El manifiesto podrá solicitar, pero no conceder directamente:

- empresa;
- sede;
- área;
- cargo;
- rol base;
- rol operativo;
- plantilla mínima de acceso;
- restricciones temporales;
- fecha de efectividad.

El motor de autorización deberá:

1. validar catálogos vigentes;
2. comprobar compatibilidad empresa/sede/área;
3. comprobar rol permitido por territorio;
4. resolver permisos atómicos desde catálogo;
5. aplicar mínimo privilegio;
6. rechazar cadenas manuales o JSON heredado;
7. programar efectividad;
8. conservar decisión y razones;
9. invalidar contextos/cachés cuando corresponda.

```text
ROL PROPUESTO
≠ ROL ASIGNADO
≠ PERMISOS EFECTIVOS
≠ CONTEXTO OPERATIVO ACTIVO
```

Los permisos provisionales y su expiración se cierran en `CAP-TAL-006`.

---

#### 23. Transferencia documental

Cada ítem usará una modalidad aprobada en `CAP-TAL-003`:

```text
REFERENCE
COPY_WITH_LINEAGE
DERIVED_FACT_ONLY
NO_TRANSFER
```

Campos mínimos:

- tipo;
- origen;
- documento y versión;
- hash;
- clasificación;
- finalidad;
- fundamento;
- destino;
- modalidad;
- vigencia;
- retención;
- consentimiento o autoridad cuando aplique;
- resultado;
- error;
- receipt.

No se transferirán por defecto:

- CV;
- notas de entrevista;
- ratings o scores;
- comparaciones;
- referencias;
- motivos internos;
- grabaciones;
- transcripciones;
- historia clínica;
- diagnósticos;
- resultados médicos detallados;
- consentimientos de banco de candidatos o marketing.

ANIMA recibirá únicamente documentos personales/laborales y estados que la
persona pueda consultar según finalidad y alcance.

---

#### 24. Provisión de ANIMA

La secuencia será:

```text
EPISODIO AUTORIZADO O PROGRAMADO
→ ASIGNACIONES Y ACCESO RESUELTOS
→ INVITACIÓN O ACTIVACIÓN DE CREDENCIAL
→ ACEPTACIÓN/RECUPERACIÓN DE ACCESO
→ SESIÓN ANIMA SEGÚN FECHA Y ALCANCE
```

Reglas:

1. Crear una invitación no crea employee, episodio, sede, rol o permiso.
2. Aceptar una invitación no modifica condiciones laborales.
3. Un usuario ya existente en Auth no se agrega al equipo sin episode/assignment
   autorizados.
4. Reenviar conserva la misma intención y no duplica empleado.
5. La invitación enlaza explícitamente `employment_episode_id` y propósito.
6. La expiración de invitación no cancela el vínculo.
7. El fallo de correo o push no revierte C1.
8. ANIMA consulta proyecciones autorizadas; no recibe expediente de selección.
9. Acceso previo al inicio será limitado por política y no simulará turno activo.
10. La activación invalidará cualquier invitación incompatible previa.

---

#### 25. Cierre de TALENTO

Se separan:

```text
APPLICATION_SELECTION_CLOSED
EMPLOYMENT_COMMITTED
CANDIDATE_EMPLOYEE_LINK_CREATED
HANDOFF_COMPLETED
```

Reglas:

1. TALENTO no marcará `hired` solo porque se solicitó el handoff.
2. El estado `hired` requiere al menos C1 confirmado por VISO.
3. El link deberá incluir `employee_id` y `employment_episode_id`, no solo un ID
   técnico ambiguo.
4. Si C1 existe y ANIMA falla, la postulación puede quedar `hired` con
   `access_pending`, no revertirse a candidata rechazada.
5. Otras postulaciones se pausarán o cerrarán solo mediante política explícita.
6. El expediente histórico permanecerá en TALENTO sujeto a retención.
7. El candidato verá lenguaje comprensible, no detalles internos de errores.

---

#### 26. Eventos, outbox e inbox

Eventos documentales mínimos:

```text
HANDOFF_REQUESTED
HANDOFF_AUTHORIZED
HANDOFF_SUPERSEDED
IDENTITY_RESOLVED
EMPLOYMENT_COMMITTED
ASSIGNMENTS_COMMITTED
ACCESS_PROFILE_RESOLVED
DOCUMENT_TRANSFER_COMPLETED
ANIMA_ACCESS_PROVISIONED
ANIMA_ACCESS_PENDING
APPLICATION_LINKED_AND_CLOSED
HANDOFF_COMPLETED
HANDOFF_BLOCKED
HANDOFF_FAILED
HANDOFF_RECONCILIATION_REQUIRED
```

Todo evento incluirá:

- event ID;
- schema/version;
- business time y processing time;
- aggregate y versión;
- actor humano y principal técnico;
- correlation y causation IDs;
- idempotency key;
- empresa, sede y alcance cuando aplique;
- referencias, no datos sensibles innecesarios;
- resultado y razones;
- clasificación de privacidad.

Los consumidores deberán usar inbox o control equivalente. Publicar y marcar
procesado deberán ser atómicos dentro del dominio propietario.

---

#### 27. Receipt y contrato de resultado

El resultado deberá devolver:

- `handoff_id`;
- estado agregado;
- commit point alcanzado;
- person/candidate/application references;
- employee ID;
- employment episode ID;
- asignaciones creadas o programadas;
- estado de roles/permisos;
- documentos transferidos/referenciados;
- estado de invitación/acceso;
- application link/close result;
- pasos pendientes;
- warnings;
- error codes normalizados;
- acciones de recuperación;
- versión;
- timestamp;
- receipt hash o referencia verificable.

La respuesta técnica no expondrá datos médicos, notas de selección, secretos,
tokens ni información no necesaria.

---

#### 28. Errores normalizados

Familias mínimas:

```text
PRECONDITION_FAILED
VERSION_CONFLICT
AUTHORIZATION_DENIED
IDENTITY_CONFLICT
DUPLICATE_ACTIVE_HANDOFF
ACTIVE_EPISODE_CONFLICT
INVALID_COMPANY_SITE_AREA
INVALID_ROLE_OR_ACCESS_PROFILE
DOCUMENT_TRANSFER_BLOCKED
EMPLOYMENT_COMMIT_FAILED
ACCESS_PROVISION_FAILED
EXTERNAL_DELIVERY_FAILED
RETRYABLE_DEPENDENCY_FAILURE
TERMINAL_POLICY_FAILURE
RECONCILIATION_REQUIRED
```

Cada error declarará:

- código estable;
- mensaje interno;
- mensaje seguro para UI;
- paso;
- retryable;
- efecto aplicado o no;
- responsable;
- siguiente acción;
- evidencia/correlation.

---

#### 29. Compensaciones

| Momento                         | Fallo                                         | Tratamiento                                  |
| ------------------------------- | --------------------------------------------- | -------------------------------------------- |
| antes de C0                     | validación                                    | no crear efectos; corregir y reintentar      |
| C0 antes de C1                  | cancelación o versión nueva                   | superseder/cancelar, liberar lock y tareas   |
| durante identidad               | conflicto                                     | bloquear; no fusionar automáticamente        |
| durante C1                      | transacción local falla                       | rollback local, no declarar compromiso       |
| después de C1                   | asignación incorrecta                         | corrección versionada, no delete destructivo |
| después de C1                   | documentos fallan                             | retry/cola; bloquear solo si son críticos    |
| después de C1                   | invitación falla                              | access remediation; vínculo permanece        |
| después de C1                   | notificación falla                            | retry/canal alterno                          |
| cierre TALENTO falla            | reconciliar desde receipt VISO                |
| identidad equivocada confirmada | freeze, incidente y remediación especializada |

Una compensación nunca inventará un estado contrario a la realidad laboral.

---

#### 30. Cancelación y supersesión

##### Antes de C1

Puede cancelarse o supersederse con:

- actor y autoridad;
- motivo;
- versión;
- comunicación;
- resolución de tareas, documentos e invitaciones anticipadas;
- auditoría.

##### Después de C1

No se usará `handoff.cancel`. Se activará el proceso laboral correspondiente:

- cancelación antes de fecha efectiva;
- corrección de alta;
- suspensión;
- retiro;
- incidente de identidad;
- offboarding.

`CAP-TAL-006` definirá continuidad, período de prueba y cierre.

---

#### 31. Rutas especiales

| Caso                          | Contrato correcto                                                                |
| ----------------------------- | -------------------------------------------------------------------------------- |
| contratación externa estándar | TALENTO → VISO → handoff                                                         |
| alta directa excepcional      | VISO origina activación con motivo; no crea candidatura ficticia                 |
| reingreso                     | persona/employee existentes + episodio nuevo + acceso nuevo                      |
| convocatoria interna          | proceso interno enlazado al trabajador; no duplica persona                       |
| traslado/promoción            | cambio laboral del episodio vigente, no handoff de candidato externo             |
| migración histórica           | paquete de migración con procedencia, reconciliación y sin invitación automática |
| regularización                | comando VISO con evidencia y autoridad, no entrevistas inventadas                |

Todas reutilizarán los mismos invariantes de identidad, episodio, asignaciones,
autorización, acceso y auditoría, aunque no todas tengan `application_id`.

---

#### 32. Offline y clientes

Reglas:

1. La UI puede preparar o consultar, pero no completar C0/C1/C2 offline.
2. Un botón offline mostrará pendiente local, nunca “trabajador creado”.
3. Al recuperar conexión se revalidarán versión, autoridad y estado.
4. Un retry de cliente usará la misma idempotency key.
5. PWA/service worker no cacheará manifiestos, documentos o receipts sensibles sin
   política expresa.
6. Android/iOS no conservarán tokens de invitación en logs, analytics o
   notificaciones.
7. Un deep link se resolverá contra el estado actual y expiración.
8. El resultado final vendrá del servidor.

---

#### 33. Reconciliación

La conciliación deberá comparar periódicamente:

- handoffs autorizados sin C1;
- episodios sin handoff/origen válido;
- C1 sin asignaciones;
- asignaciones sin episodio;
- roles solicitados vs resueltos;
- permisos efectivos vs plantilla aprobada;
- documentos transferidos vs manifest;
- invitaciones sin episodio;
- episodios activos sin acceso esperado;
- aplicación `hired` sin episode ID;
- episode ID sin `candidate_employee_link` cuando aplica;
- `COMPLETED` con pasos críticos pendientes;
- eventos outbox sin consumo;
- callbacks huérfanos;
- duplicados y versiones divergentes.

Cada diferencia abrirá caso con dueño, severidad, evidencia y resolución. No se
“arreglará” sobrescribiendo automáticamente una fuente con otra.

---

#### 34. Seguridad y autorización

Cada comando y paso deberá verificar:

- principal y actor efectivo;
- permiso atómico;
- empresa;
- sede;
- área;
- recurso;
- decisión/oferta/pre-registro vigentes;
- segregación;
- simulación;
- fecha efectiva;
- estado de vínculo;
- dispositivo cuando aplique;
- frescura del contexto;
- revocaciones.

Se prohíbe:

- exponer el RPC de handoff a `authenticated` genérico;
- confiar en un rol escrito por la UI;
- ejecutar por conocer IDs;
- omitir actor humano por usar `service_role`;
- almacenar secretos o tokens en payloads/eventos;
- devolver información de otros candidatos o trabajadores;
- usar `SECURITY DEFINER` sin `search_path`, validaciones y grants mínimos;
- habilitar bypass desde ANIMA, TALENTO o panel de soporte.

---

#### 35. Privacidad y minimización

El manifiesto y eventos usarán referencias y hechos mínimos. No incluirán:

- notas completas de entrevistas;
- scores detallados cuando baste resultado;
- historia clínica;
- diagnósticos;
- archivos binarios;
- secretos;
- tokens;
- contraseñas;
- documentos completos dentro de eventos;
- comentarios libres no necesarios.

Los accesos de soporte, conciliación y auditoría serán restringidos y trazables.
La retención del handoff, documentos y eventos seguirá `CAP-TAL-003` y se cerrará
en `CAP-TAL-006`.

---

#### 36. Experiencia del candidato y del equipo

##### Candidato

Estados comprensibles:

```text
Preparando tu ingreso
Ingreso confirmado
Activando tu acceso
Acceso listo
Necesitamos corregir información
Proceso cancelado antes del inicio
```

No se mostrarán:

- nombres de tablas;
- stack traces;
- service role;
- conflictos internos de permisos;
- documentos de terceros;
- notas de selección;
- diagnósticos.

##### Equipo interno

Debe ver:

- gate y versión;
- commit point;
- pasos;
- bloqueos;
- responsable;
- retry permitido;
- receipt;
- conciliación;
- historial;
- acciones según permiso.

No habrá un botón genérico “forzar contratado”.

---

#### 37. Auditoría y métricas

Eventos auditables:

- readiness calculado;
- excepción aprobada;
- handoff solicitado/autorizado;
- identidad resuelta;
- empleado/episodio creado o reutilizado;
- asignación creada/programada;
- perfil de acceso resuelto;
- documento transferido/referenciado;
- invitación creada/enviada/aceptada/expirada;
- aplicación cerrada/enlazada;
- error, retry, compensación y conciliación;
- cancelación o supersesión.

Métricas:

- handoffs iniciados y completados;
- tiempo C0→C1 y C1→C2;
- bloqueos por categoría;
- conflictos de identidad;
- reintentos por paso;
- duplicados prevenidos;
- episodios sin acceso;
- accesos sin episodio;
- documentos fallidos;
- invitaciones fallidas/expiradas;
- conciliaciones abiertas y antigüedad;
- altas directas y excepciones;
- reingresos;
- fallos de ruta legacy.

Las métricas no expondrán datos sensibles ni incentivarán saltar controles para
reducir tiempos.

---

#### 38. Análisis del diseño AS-IS

El draft `talento.handoff_to_anima(...)` sirve como evidencia de intención, pero
no es el contrato objetivo porque actualmente:

1. es una función de TALENTO que escribe directamente en `public.employees`;
2. asume `employee_id = auth_user_id` como regla universal;
3. no modela persona ni episodio laboral;
4. recibe sede, rol, área y nombre como parámetros mutables;
5. no referencia decisión, oferta, aceptación o pre-registro/versiones;
6. no evalúa autoridad humana ni permiso atómico dentro del contrato;
7. actualiza directamente sede, rol, nombre y actividad de empleados existentes;
8. desmarca otras sedes primarias sin comprender el episodio o asignaciones;
9. sobrescribe `employee_settings`;
10. no resuelve rol base vs rol operativo ni permisos efectivos;
11. no transfiere documentos mediante whitelist/lineage;
12. no crea ni gestiona invitación de acceso;
13. marca la aplicación `hired` dentro de la misma función;
14. no separa C1 de C2;
15. no tiene ledger de pasos, outbox, inbox ni reconciliación;
16. no posee versionado esperado o receipt completo;
17. trata reingreso como update del mismo registro;
18. no diferencia fecha efectiva futura;
19. solo evita duplicado mediante existencia del link, insuficiente para retries
    parciales;
20. usa `service_role` como superficie ejecutora sin contrato de autorización
    canónico.

Por tanto:

```text
DRAFT AS-IS
→ NO SE PROMUEVE DIRECTAMENTE
→ SE INVENTARÍA Y PRUEBA
→ SE IMPLEMENTA ORQUESTACIÓN OBJETIVO
→ EVALUACIÓN DUAL
→ CUTOVER
→ RETIRO DEL BYPASS
```

---

#### 39. Contrato de migración y compatibilidad

Durante transición:

- el RPC legacy permanecerá deshabilitado para nuevos flujos o detrás de control
  explícito;
- no habrá dos escritores activos sin reconciliación;
- las filas existentes se clasificarán por procedencia;
- se backfilleará enlace persona–employee–episodio cuando sea posible;
- los casos ambiguos irán a cuarentena;
- se medirá divergencia entre contrato legacy y objetivo;
- el cutover tendrá rollback técnico sin reabrir bypass de autorización;
- las invitaciones legacy que crean empleados se bloquearán antes de activar la
  ruta objetivo;
- las migraciones vivirán en `vento-shell`.

---

#### 40. Propiedad de brechas y decisiones diferidas

| Brecha o decisión                                 | Tarea propietaria                                                                         |
| ------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| período de prueba, continuidad y cierre           | `CAP-TAL-006`                                                                             |
| permisos provisionales y su vencimiento           | `CAP-TAL-006`                                                                             |
| readiness del producto TALENTO y roadmap BLOQUE Y | `CAP-TAL-006`                                                                             |
| políticas definitivas de retención                | `CAP-TAL-006`                                                                             |
| esquema de persona, empleado y episodio           | `AUTH-DB-016`, `AUTH-DB-019`, `AUTH-DB-020`                                               |
| RLS, grants, RPC y funciones server               | `AUTH-DB-001` a `AUTH-DB-035`, `AUTH-SRV-001` a `AUTH-SRV-018`                            |
| roles, sedes, áreas y administración              | `VISO-AUTH-001` a `VISO-AUTH-020`                                                         |
| consumo operativo y no otorgamiento de permisos   | `ANIMA-AUTH-001` a `ANIMA-AUTH-020`                                                       |
| orquestación, retries y dead-letter               | `QUEUE-ARC-001` a `QUEUE-ARC-012`                                                         |
| outbox, inbox, idempotencia y cuarentena          | `INT-DB-001` a `INT-DB-008`, `INT-APP-001` a `INT-APP-010`                                |
| documentos y evidencia                            | `EVID-ARC-001` a `EVID-ARC-010`                                                           |
| pantallas                                         | `PROC-SCREEN-001` a `PROC-SCREEN-028`                                                     |
| UX y pruebas                                      | `UX-BASE-001` a `UX-BASE-015`, `UX-ADMIN-001` a `UX-ADMIN-005`, `UX-QA-001` a `UX-QA-030` |
| retiro de funciones legacy                        | `CAP-TAL-006` y paquete E5 correspondiente                                                |

No queda brecha narrativa sin propietario documental.

---

#### 41. Requisitos de prueba derivados

Esta tarea incorpora al registro completo:

```text
TREQ-TALENTO-056 a TREQ-TALENTO-074
```

Cubren:

- gate y manifiesto;
- autoridad y comando;
- identidad;
- empleado/episodio/reingreso;
- orquestación y ledger;
- idempotencia;
- concurrencia;
- materialización VISO;
- roles/permisos;
- documentos;
- ANIMA e invitaciones;
- fecha efectiva;
- cierre TALENTO;
- compensación;
- eventos/reconciliación;
- rutas especiales;
- seguridad;
- offline/receipts;
- auditoría, métricas y migración legacy.

---

#### 42. Criterios de aceptación

`CAP-TAL-005` podrá aprobarse cuando:

- [ ] TALENTO, VISO, identidad/autorización y ANIMA tienen propietarios claros.
- [ ] Se diferencia persona, Auth, candidato, empleado y episodio.
- [ ] El gate `READY_FOR_HANDOFF` es reproducible y versionado.
- [ ] El comando referencia decisión, oferta, respuesta y pre-registro exactos.
- [ ] Se define un manifiesto inmutable.
- [ ] Se separan C0, C1 y C2.
- [ ] Se define saga, pasos y ledger durable.
- [ ] Un retry no duplica efectos.
- [ ] Se controlan versiones y concurrencia.
- [ ] VISO materializa la verdad laboral.
- [ ] TALENTO no escribe directamente empleados o asignaciones.
- [ ] ANIMA no crea vínculo ni permisos.
- [ ] Un reingreso crea episodio nuevo.
- [ ] La fecha futura no concede acceso prematuro.
- [ ] Los documentos usan whitelist y lineage.
- [ ] Se distinguen aplicación `hired`, acceso pendiente y handoff completado.
- [ ] Las compensaciones no borran vínculos válidos.
- [ ] Existe reconciliación transversal.
- [ ] Se identifican y asignan las brechas del RPC legacy.
- [ ] Se agregan `TREQ-TALENTO-056` a `TREQ-TALENTO-074` sin duplicados.
- [ ] `CAP-TAL-006` permanece sin iniciar.

---

#### 43. Fuera de alcance

Esta tarea no:

- implementa el orquestador;
- crea tablas, enums, RPC, Edge Functions, jobs, triggers o webhooks;
- modifica Auth o Supabase;
- crea trabajadores reales;
- envía invitaciones;
- transfiere documentos;
- aplica roles o permisos;
- define el contrato laboral;
- define el período de prueba;
- define continuidad definitiva;
- realiza offboarding;
- aprueba el producto TALENTO para operar;
- reemplaza la validación jurídica, laboral, de privacidad o seguridad.

---

#### 44. Resultado y continuidad

**Estado confirmado:** APROBADA

Como resultado de la aprobación:

- este bloque será el contrato canónico de handoff TALENTO–VISO–ANIMA;
- el RPC legacy quedará formalmente clasificado como diseño parcial sujeto a
  migración;
- no se autorizará implementación;
- la continuidad documental será:

```text
CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre
```

**Continuidad:**

```text
CAP-TAL-005 — APROBADA
CAP-TAL-006 — NO INICIADA
```


### ✅ CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre

**Estado:** APROBADA
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-001 — Separar experiencia operativa y administrativa`  
**Artefacto producido:** `CAP-TAL-PROBATION-CONTINUITY-OFFBOARDING-READINESS-001`  
**Procesos canónicos principales:** `VPROC-0006` y procesos laborales, de identidad, autorización, evidencia y cierre relacionados  
**Naturaleza:** contrato funcional, laboral, temporal, de autorización, continuidad, cierre, revocación, conciliación y readiness  
**Aplicaciones propietarias y canales:** VISO administra vínculo, período de prueba, decisiones y cierre; ANIMA presenta la experiencia permitida; la base futura TALENTO conserva evidencia prelaboral como canal subordinado; SHELL y los contratos compartidos resuelven identidad, autorización, eventos y revocación
**Cambios en código, datos, migraciones, RLS, RPC, Storage, Supabase, Auth, Edge Functions, colas, proveedores o aplicaciones:** no autorizados

---

#### 1. Propósito

Diseñar el ciclo objetivo que comienza después de que el handoff laboral alcanzó
el compromiso canónico `C1 — EMPLOYMENT_COMMITTED` y termina cuando:

- el trabajador continúa definitivamente bajo las condiciones autorizadas;
- el vínculo se cierra durante el período de prueba;
- el vínculo se cierra por otra causal laboral válida;
- una cancelación anterior al inicio se resuelve sin inventar un retiro;
- los accesos provisionales se convierten, reemplazan, reducen o revocan;
- activos, turnos, sesiones, credenciales, documentos y efectos derivados quedan
  conciliados;
- la postulación y el expediente laboral conservan historia sin duplicarse;
- el roadmap propio de TALENTO puede materializarse en el futuro mediante una
  puerta explícita de readiness.

La tarea deberá evitar:

- tratar el período de prueba como una etapa de candidatura;
- asumir que todo contrato tiene período de prueba;
- crear un período de prueba sin estipulación escrita válida;
- exceder límites legales o calcularlos con una cantidad fija de días;
- aplicar un nuevo período de prueba a contratos sucesivos con el mismo
  empleador sin fundamento jurídico;
- confundir período de prueba con inducción, capacitación, onboarding,
  habilitación técnica, evaluación de cargo o período de adaptación;
- usar la palabra “provisional” para negar derechos, prestaciones, seguridad
  social, dotación, capacitación o herramientas necesarias;
- conceder permisos de producción antes de la fecha efectiva;
- mantener privilegios temporales indefinidamente por falta de decisión;
- convertir permisos provisionales en permanentes por silencio;
- finalizar automáticamente el contrato porque venció un temporizador del
  sistema;
- bloquear al trabajador de forma arbitraria cuando la relación laboral sigue
  vigente;
- usar score, asistencia aislada, opinión libre o una nota de manager como
  decisión laboral automática;
- terminar por razones discriminatorias o ignorar estabilidad laboral reforzada;
- afirmar que la facultad de terminar durante prueba elimina controles
  constitucionales, laborales o de autorización;
- borrar empleado, episodio, turnos, asistencia, documentos o auditoría como
  compensación;
- dejar sesiones, tokens, roles, excepciones, dispositivos o colas offline con
  autoridad después del cierre;
- reactivar accesos antiguos durante un reingreso;
- cerrar el vínculo sin custodiar activos, caja, inventario, llaves, equipos,
  documentos o pendientes operativos;
- considerar completado el offboarding cuando quedan revocaciones o
  conciliaciones pendientes;
- autorizar implementación o lanzamiento de TALENTO solo por aprobar esta
  definición documental.

---

#### 2. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. cuándo existe y cuándo no existe período de prueba;
2. qué regla legal y contractual determina su duración;
3. cómo se calculan inicio, fin, revisión, prórroga y vencimiento;
4. cómo se diferencian reloj legal, plan de onboarding y ventanas de decisión;
5. qué estados conserva el período de prueba;
6. qué objetivos, evidencias, formación y apoyos deben existir;
7. cómo participa el trabajador en la evaluación recíproca de las condiciones;
8. cómo se solicitan, conceden, revisan y expiran permisos provisionales;
9. qué permisos deben existir desde el primer día para ejecutar el cargo;
10. cómo se evita que permisos temporales se vuelvan permanentes por omisión;
11. qué ocurre si llega la fecha de revisión sin decisión válida;
12. qué resultados de continuidad y no continuidad están permitidos;
13. cómo se controla una prórroga válida dentro de límites legales;
14. qué gate jurídico debe superarse antes de una no continuidad;
15. cómo se gestionan embarazo, lactancia, salud, discapacidad y otras
    protecciones reforzadas;
16. cómo se ejecuta el cierre laboral y la revocación coordinada;
17. cómo se resuelven activos, caja, inventario, turnos, documentos y pagos;
18. cómo se conservan expediente, auditoría, retención y derechos del titular;
19. cómo se tratan reingresos, traslados y evaluaciones internas sin inventar un
    nuevo período de prueba legal;
20. qué eventos, conciliaciones, métricas y receipts protegen el ciclo;
21. qué gate permite crear el roadmap detallado del BLOQUE Y;
22. qué requisitos de prueba se incorporan;
23. cuál es la continuidad después del cierre del segmento `CAP-TAL-*`.

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `CAP-TAL-001` y las fronteras TALENTO–VISO–ANIMA;
- `CAP-TAL-002` y la experiencia universal web, PWA, Android e iOS;
- `CAP-TAL-003` y el expediente progresivo, privacidad, conservación y
  eliminación;
- `CAP-TAL-004` y la evaluación, decisión, oferta y pre-registro;
- `CAP-TAL-005` y los commit points `C0`, `C1`, `C2`, el episodio laboral, el
  handoff, la identidad y la provisión de acceso;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `AUTH-DB-001` a `AUTH-DB-035`;
- `AUTH-SRV-001` a `AUTH-SRV-018`;
- `AUTH-DEV-001` a `AUTH-DEV-016`;
- `VISO-AUTH-001` a `VISO-AUTH-020`;
- `ANIMA-AUTH-001` a `ANIMA-AUTH-020`;
- `INT-APP-001` a `INT-APP-010`;
- `INT-DB-001` a `INT-DB-008`;
- `INT-EXT-001` a `INT-EXT-020`;
- `QUEUE-ARC-001` a `QUEUE-ARC-012`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `PROC-SCREEN-001` a `PROC-SCREEN-028`;
- `UX-QA-001` a `UX-QA-030`;
- `AUTH-QA-001` a `AUTH-QA-030`.

Decisiones preservadas:

1. El período de prueba pertenece al vínculo laboral y no a TALENTO.
2. El trabajador en período de prueba ya es trabajador.
3. La aceptación de oferta no inicia por sí sola el período de prueba.
4. El inicio depende del contrato y del comienzo efectivo del vínculo.
5. VISO es la autoridad para decisiones laborales.
6. ANIMA no termina contratos ni concede permisos por sí sola.
7. TALENTO no reabre la candidatura por una no continuidad posterior al alta.
8. Un reingreso crea un episodio nuevo y no restaura permisos antiguos.
9. Ningún cierre borra historia, documentos sujetos a retención o auditoría.
10. Ninguna migración se crea o ejecuta fuera de `vento-shell`.

---

#### 4. Baseline jurídico parametrizable

La arquitectura deberá conservar una política jurídica versionada y no
hardcodear reglas como constantes dispersas.

Baseline colombiano verificado para esta propuesta:

1. El período de prueba es la etapa inicial del contrato de trabajo y tiene una
   finalidad recíproca: el empleador aprecia aptitudes y el trabajador evalúa la
   conveniencia de las condiciones.
2. Debe estipularse por escrito; si no existe estipulación válida, el sistema no
   podrá tratar el vínculo como sometido a período de prueba.
3. El límite general vigente no puede exceder dos meses.
4. En contratos a término fijo inferiores a un año no puede superar la quinta
   parte del término inicialmente pactado ni exceder dos meses.
5. En contratos sucesivos entre el mismo empleador y trabajador solo es válida,
   como regla general vigente, la estipulación del primer contrato.
6. Si se pactó un plazo menor, solo podrá prorrogarse antes de su vencimiento y
   sin exceder el máximo aplicable.
7. Durante el período de prueba el trabajador conserva todas las prestaciones.
8. La facultad de terminación durante prueba no autoriza decisiones
   discriminatorias ni elimina protecciones constitucionales o legales
   reforzadas.
9. La terminación deberá conservar fundamento objetivo, evidencia, autoridad y
   validación jurídica cuando exista riesgo de protección reforzada.

La política deberá registrar:

```text
jurisdiction
legal_policy_version
source_references
valid_from
valid_to
contract_type_rules
maximum_duration_rule
successive_contract_rule
extension_rule
protected_status_gate
approved_by
reviewed_at
```

Si una reforma futura modifica estas reglas:

- no se reescribirá el historial;
- cada episodio conservará la versión jurídica aplicada;
- los casos abiertos se revalidarán según una regla de transición aprobada;
- un cambio legislativo no se desplegará solo mediante copy o configuración de
  frontend;
- el cambio generará contrato, migración, pruebas y plan de entrada en vigencia.

Esta tarea no constituye asesoría jurídica ni sustituye la validación laboral
formal previa a implementación o a una decisión individual.

---

#### 5. Principio rector

```text
EMPLEO MATERIALIZADO EN VISO
        ↓
CONTRATO Y REGLA JURÍDICA RESUELTOS
        ↓
PERÍODO DE PRUEBA APLICABLE O NO APLICABLE
        ↓
PLAN DE INICIO, FORMACIÓN Y CRITERIOS
        ↓
ACCESO NECESARIO Y PRIVILEGIOS TEMPORALES
        ↓
CHECK-INS, EVIDENCIA Y APOYOS
        ↓
DECISIÓN AUTORIZADA
        ↓
CONTINUIDAD / AJUSTE / CIERRE
        ↓
PERMISOS DEFINITIVOS O REVOCACIÓN
        ↓
CONCILIACIÓN Y RECEIPT
```

Reglas:

- El contrato determina la relación; la aplicación la representa.
- El temporizador no termina el vínculo.
- El score no decide continuidad.
- El manager aporta evidencia; VISO conserva la decisión.
- La autorización de seguridad sigue el estado laboral, pero no lo sustituye.
- Una falla de acceso no convierte al trabajador en candidato.
- Una falla de offboarding no mantiene el vínculo abierto, pero sí mantiene el
  caso de revocación hasta conciliación.

---

#### 6. Distinciones obligatorias

```text
PERÍODO DE PRUEBA LEGAL
≠ PRE-INGRESO
≠ ONBOARDING
≠ INDUCCIÓN
≠ CAPACITACIÓN
≠ EVALUACIÓN DE DESEMPEÑO
≠ CERTIFICACIÓN DE CARGO
≠ PERMISO PROVISIONAL
```

```text
TRABAJADOR EN PRUEBA
= TRABAJADOR CON DERECHOS Y PRESTACIONES

TRABAJADOR EN PRUEBA
≠ CANDIDATO
≠ INVITADO
≠ USUARIO TEMPORAL SIN VÍNCULO
```

```text
PERMISO NECESARIO PARA EL CARGO
≠ PRIVILEGIO ELEVADO
≠ EXCEPCIÓN TEMPORAL
≠ PERMISO DEFINITIVO
```

```text
REVISIÓN POSITIVA
≠ CONVERSIÓN AUTOMÁTICA DE PERMISOS

SILENCIO ADMINISTRATIVO
≠ TERMINACIÓN AUTOMÁTICA
≠ CONTINUIDAD APROBADA
```

```text
NO CONTINUIDAD
≠ RECHAZO DE CANDIDATURA
≠ BORRADO DEL EMPLEADO
≠ ELIMINACIÓN DEL EXPEDIENTE
```

---

#### 7. Propiedad funcional

| Verdad o acción                   | Propietario canónico                        |
| --------------------------------- | ------------------------------------------- |
| contrato y estipulación de prueba | VISO / dominio laboral                      |
| episodio laboral y fecha efectiva | VISO                                        |
| política jurídica aplicable       | gobierno laboral y jurídico                 |
| plan de onboarding                | VISO con responsable de sede o área         |
| objetivos y criterios del cargo   | VISO con catálogo de cargo                  |
| evidencia operativa               | responsable autorizado y trabajador         |
| check-ins y retroalimentación     | VISO, proyectados en ANIMA                  |
| estado visible para el trabajador | ANIMA como proyección                       |
| solicitud de permisos temporales  | VISO                                        |
| resolución de permisos            | autorización canónica                       |
| decisión de continuidad           | VISO con autoridad laboral                  |
| no continuidad y causal           | VISO con gate jurídico                      |
| cierre de episodio                | VISO                                        |
| revocación técnica                | identidad, autorización y consumidores      |
| cierre histórico prelaboral       | TALENTO, sin reabrir candidatura            |
| activos y custodia                | dominios propietarios con coordinación VISO |
| pagos y obligaciones económicas   | NUMERA o dominio económico autorizado       |
| receipt y conciliación            | orquestación compartida                     |

Una pantalla alojada en ANIMA no convierte a ANIMA en fuente laboral. Un botón
de VISO no puede saltarse autorización, evidencia ni gate jurídico.

---

#### 8. Objetos canónicos

| Objeto                       | Propósito                                            |
| ---------------------------- | ---------------------------------------------------- |
| `probation_policy`           | versión jurídica y contractual aplicable             |
| `probation_term`             | período pactado para un episodio concreto            |
| `probation_clock`            | cálculo auditable de inicio, fin y revisiones        |
| `onboarding_plan`            | tareas, formación, apoyos y responsables             |
| `probation_objective`        | criterio observable ligado al cargo                  |
| `probation_checkin`          | conversación y evidencia en un momento definido      |
| `worker_feedback`            | evaluación del trabajador sobre condiciones y apoyos |
| `performance_evidence`       | hecho verificable, no conclusión libre               |
| `support_action`             | formación, acompañamiento, ajuste o recurso acordado |
| `provisional_access_profile` | acceso temporal solicitado y autorizado              |
| `provisional_access_grant`   | permiso o rol con vigencia y fundamento              |
| `continuity_case`            | expediente decisorio de continuidad o cierre         |
| `continuity_decision`        | resultado laboral autorizado y versionado            |
| `employment_closure`         | cierre del episodio y su fundamento                  |
| `offboarding_case`           | coordinación de revocación y pendientes              |
| `revocation_step`            | efecto técnico individual con receipt                |
| `asset_return_case`          | devolución o conciliación de activos y custodia      |
| `readiness_gate`             | puerta de materialización del roadmap TALENTO        |

No se modelará todo en una sola fila `employees.status` ni en un JSON libre.

---

#### 9. Aplicabilidad del período de prueba

Antes de crear `probation_term`, el sistema deberá resolver:

- empleador jurídico;
- trabajador y episodio;
- tipo de contrato;
- fecha de inicio;
- duración contractual cuando corresponda;
- existencia de estipulación escrita;
- fecha y versión del documento;
- firma o aceptación válida;
- si es primer contrato o contrato sucesivo con el mismo empleador;
- política jurídica vigente;
- excepción o prohibición aplicable;
- autoridad que validó la configuración.

Resultados permitidos:

```text
NOT_APPLICABLE
APPLICABLE_PENDING_DOCUMENT
APPLICABLE_VALIDATED
INVALID_STIPULATION
LEGAL_REVIEW_REQUIRED
```

Reglas:

- `NOT_APPLICABLE` no es error.
- No se inventará prueba para todos los ingresos.
- Una casilla en interfaz no reemplaza la estipulación escrita.
- Un documento cargado no se considera válido hasta ser vinculado al episodio y
  revisado.
- La ausencia de prueba no impide onboarding, controles de seguridad ni
  evaluación ordinaria del trabajador.

---

#### 10. Cálculo temporal

El sistema distinguirá:

```text
contract_signed_at
employment_effective_at
actual_service_started_at
probation_stipulated_at
probation_start_at
probation_end_at
review_due_at
continuity_decision_due_at
access_review_at
access_expires_at
employment_end_at
```

Reglas:

1. `probation_start_at` no se derivará de la fecha de creación del usuario.
2. No se usará un entero fijo de sesenta días para representar dos meses.
3. El cálculo utilizará una función jurídica versionada de fechas y calendarios.
4. La zona horaria empresarial y la fecha local deberán quedar explícitas.
5. Correcciones de fecha crearán una nueva versión y recalcularán impactos.
6. Una suspensión, incapacidad, licencia o interrupción no extenderá
   automáticamente la prueba; deberá existir regla jurídica y decisión válida.
7. El reloj operativo de onboarding podrá pausarse sin afirmar que se pausó el
   plazo legal.
8. El sistema avisará antes del vencimiento con ventanas configurables.
9. El cierre de la prueba no dependerá de que un job se ejecute exactamente a
   medianoche.

---

#### 11. Duración máxima y reglas por contrato

El motor deberá calcular:

```text
legal_maximum
contractual_stipulation
effective_probation_duration
```

Y validar:

```text
effective_probation_duration
≤ legal_maximum
```

Para contratos a término fijo inferiores a un año, la política deberá aplicar
la regla proporcional vigente sin convertirla en una aproximación manual.

Prohibiciones:

- redondear en perjuicio del trabajador sin regla jurídica aprobada;
- usar la fecha de fin del contrato equivocada;
- modificar retroactivamente la duración;
- permitir un plazo mayor porque la plantilla lo trae por defecto;
- ocultar un cálculo inválido detrás de una advertencia no bloqueante.

El resultado del cálculo conservará:

- inputs;
- algoritmo y versión;
- máximo legal;
- plazo pactado;
- fecha final;
- actor;
- validación;
- warnings;
- hash del documento.

---

#### 12. Contratos sucesivos, reingresos y movimientos internos

```text
NUEVO EPISODIO
≠ NUEVO PERÍODO DE PRUEBA AUTOMÁTICO
```

Para un reingreso o contrato sucesivo deberá evaluarse:

- identidad del empleador jurídico;
- existencia de contratos anteriores;
- continuidad o ruptura;
- naturaleza del nuevo contrato;
- regla jurídica vigente;
- asesoría laboral cuando exista duda.

Un traslado, promoción, cambio de sede o cambio de rol de un trabajador activo:

- no se representará como nueva candidatura externa;
- no creará automáticamente otro período de prueba legal;
- podrá tener un plan de adaptación, certificación o evaluación de cargo;
- mantendrá el episodio o creará el movimiento laboral que corresponda;
- revalidará permisos y formación;
- conservará claramente que la evaluación interna no es período de prueba legal.

---

#### 13. Lifecycle del período de prueba

Estados propuestos:

```text
NOT_APPLICABLE
PLANNED
PENDING_DOCUMENT_VALIDATION
SCHEDULED
ACTIVE
REVIEW_IN_PROGRESS
EXTENSION_PENDING
EXTENDED
COMPLETED_CONTINUING
COMPLETED_NON_CONTINUING
CANCELLED_BEFORE_START
INVALIDATED
LEGAL_HOLD
CLOSED
```

Reglas:

- `ACTIVE` exige episodio laboral activo y fecha vigente.
- `LEGAL_HOLD` impide una decisión automática, no suspende por sí solo el
  contrato ni el reloj legal.
- `EXTENDED` exige acuerdo válido anterior al vencimiento.
- `COMPLETED_CONTINUING` no concede permisos adicionales por sí solo.
- `COMPLETED_NON_CONTINUING` exige un cierre laboral separado.
- `CLOSED` exige conciliación, no solo cambio de estado.

---

#### 14. Plan de inicio y objetivos

Todo trabajador deberá tener un plan de inicio aunque no exista período de
prueba.

Contenido mínimo:

- cargo y versión;
- empresa, sede y área;
- responsable;
- funciones esenciales;
- formación obligatoria;
- seguridad y salud en el trabajo;
- herramientas y accesos;
- objetivos observables;
- criterios de calidad;
- fuentes de evidencia;
- fechas de check-in;
- apoyos y recursos;
- ajustes razonables;
- riesgos operativos;
- método de feedback;
- criterios de cierre.

Los objetivos deberán ser:

- relacionados con el cargo;
- conocidos por el trabajador;
- alcanzables con los recursos entregados;
- verificables;
- consistentes entre personas comparables;
- versionados;
- ajustados cuando cambian funciones o condiciones.

No se usarán criterios vagos como “actitud correcta” o “encaje” sin definición
observable.

---

#### 15. Naturaleza recíproca

El período de prueba también permite al trabajador evaluar las condiciones del
trabajo.

ANIMA deberá permitir registrar, con privacidad y sin represalia:

- claridad de funciones;
- disponibilidad de herramientas;
- formación recibida;
- condiciones reales frente a las ofrecidas;
- seguridad;
- carga y horario;
- acompañamiento;
- ajustes solicitados;
- dudas sobre pagos o afiliaciones;
- intención de continuar;
- incidentes o bloqueos.

```text
FEEDBACK DEL TRABAJADOR
≠ PUNTUACIÓN CONTRA EL TRABAJADOR
```

Una queja, solicitud de ajuste o reporte de seguridad no podrá reducir el score
de continuidad ni convertirse en motivo oculto de terminación.

---

#### 16. Check-ins y evidencia

Los check-ins deberán producir dos capas:

1. una capa visible y accionable para trabajador y responsable;
2. una capa restringida para decisión laboral y auditoría.

Cada check-in conservará:

- fecha programada y real;
- participantes;
- objetivos revisados;
- hechos y ejemplos;
- evidencia asociada;
- formación entregada;
- obstáculos;
- acuerdos;
- responsables;
- fecha de seguimiento;
- observaciones del trabajador;
- versión;
- addenda.

Prohibiciones:

- sobrescribir una evaluación finalizada;
- puntuar una ausencia causada por fallo del empleador;
- convertir faltantes de evidencia en cero;
- copiar notas privadas a ANIMA;
- usar un único incidente como conclusión automática;
- permitir que el mismo actor cree, apruebe y cierre una decisión sensible cuando
  la segregación exija revisión.

---

#### 17. Formación, apoyos y ajustes

Antes de concluir falta de aptitud se deberá verificar, según el cargo:

- inducción completada;
- instrucciones disponibles;
- acceso funcional;
- herramientas entregadas;
- acompañamiento razonable;
- tiempo suficiente dentro del plazo válido;
- incidentes técnicos;
- cambios de turno o funciones;
- ajustes razonables solicitados;
- condiciones de seguridad;
- barreras atribuibles al empleador.

Una acción de apoyo podrá ser:

```text
TRAINING
COACHING
TOOLING
ACCESS_FIX
SCHEDULE_ADJUSTMENT
ROLE_CLARIFICATION
REASONABLE_ADJUSTMENT
SUPERVISION
SAFETY_INTERVENTION
```

La evidencia de apoyo no se utilizará para inferir diagnósticos médicos.

---

#### 18. Permisos provisionales

Los permisos provisionales son un mecanismo de seguridad, no una categoría
laboral inferior.

Un trabajador deberá recibir desde el primer día los accesos necesarios para
realizar de forma segura las funciones asignadas.

El perfil se separará en:

```text
BASELINE_EMPLOYEE_ACCESS
ROLE_REQUIRED_ACCESS
SUPERVISED_ACCESS
TEMPORARY_ELEVATED_ACCESS
EXCEPTION_ACCESS
```

Cada grant temporal deberá incluir:

- permiso atómico o plantilla;
- empresa, sede, área y recurso;
- fundamento;
- episodio;
- cargo;
- solicitante;
- aprobador;
- supervisor cuando aplique;
- `valid_from`;
- `valid_until`;
- condición de renovación;
- nivel de riesgo;
- evidencia;
- revocación;
- receipt.

```text
PERÍODO DE PRUEBA ACTIVO
↛ PERMISOS MÍNIMOS INSUFICIENTES PARA TRABAJAR

PERÍODO DE PRUEBA ACTIVO
↛ PRIVILEGIOS ADMINISTRATIVOS COMPLETOS
```

---

#### 19. Progresión de acceso

Ejemplo conceptual:

```text
DÍA DE INICIO
→ baseline + acceso requerido de bajo riesgo

FORMACIÓN COMPLETADA
→ acceso supervisado a función sensible

CERTIFICACIÓN O APROBACIÓN
→ acceso requerido completo del cargo

DECISIÓN DE CONTINUIDAD
→ perfil definitivo revalidado
```

La progresión deberá depender de:

- necesidad de negocio;
- formación;
- segregación;
- cargo;
- riesgo;
- supervisión;
- fecha;
- estado del episodio;
- decisión explícita.

No dependerá únicamente de días transcurridos.

---

#### 20. Expiración y ausencia de decisión

La arquitectura deberá evitar dos fallos opuestos:

1. acceso provisional que nunca expira;
2. bloqueo automático de un trabajador cuyo contrato sigue vigente.

Si llega `access_expires_at` sin decisión:

- el empleo no terminará;
- el permiso no se convertirá automáticamente en definitivo;
- los privilegios elevados pasarán a revocación o `SAFE_MODE` según política;
- el acceso baseline necesario se mantendrá únicamente bajo una regla de
  continuidad operacional aprobada;
- se abrirá `COMPLIANCE_EXCEPTION` con responsable y plazo;
- la asignación de trabajo deberá adaptarse si el acceso requerido no puede
  mantenerse;
- cualquier extensión de seguridad será limitada, explícita y auditada;
- el sistema escalará antes y después del vencimiento.

```text
NO DECISIÓN
≠ NO CONTINUIDAD
≠ CONTINUIDAD APROBADA
```

---

#### 21. Ventanas de decisión

Se definirán al menos:

```text
EARLY_CHECKIN
MIDPOINT_CHECKIN
FINAL_REVIEW_OPEN
DECISION_DUE
PROBATION_END
ACCESS_REVIEW_DUE
```

Los tiempos exactos serán configurables según duración válida.

Alertas:

- responsable operativo;
- Talento o administración laboral;
- aprobador VISO;
- seguridad/autorización cuando existan grants temporales;
- trabajador para check-ins y pendientes visibles.

Una alerta no modifica estados por sí misma.

---

#### 22. Resultados de continuidad

Resultados permitidos:

```text
CONTINUE_AS_IS
CONTINUE_WITH_ACCESS_ADJUSTMENT
CONTINUE_WITH_ROLE_OR_ASSIGNMENT_CHANGE
EXTEND_WITHIN_LEGAL_LIMIT
NON_CONTINUE_DURING_PROBATION
WORKER_RESIGNATION
MUTUAL_TERMINATION
OTHER_LAWFUL_CLOSURE
LEGAL_REVIEW_REQUIRED
```

Cada decisión conservará:

- episodio y versión;
- período aplicable;
- paquete de evidencia;
- objetivos;
- apoyos;
- feedback del trabajador;
- razón estructurada;
- fundamento jurídico;
- aprobadores;
- fecha de decisión;
- fecha efectiva;
- impacto de acceso;
- documentos;
- comunicación;
- receipt.

---

#### 23. Continuidad definitiva

La continuidad no crea un contrato nuevo ni reemplaza el episodio.

Deberá:

- cerrar el período de prueba;
- confirmar que el episodio continúa;
- resolver el perfil de acceso definitivo;
- retirar excepciones no necesarias;
- convertir únicamente grants aprobados;
- actualizar plan de desarrollo ordinario;
- conservar objetivos y evidencias históricas;
- comunicar el resultado al trabajador;
- verificar documentos, asignaciones y calendario;
- emitir receipt.

```text
CONTINUIDAD
≠ COPIAR TODOS LOS PERMISOS TEMPORALES
```

Los permisos definitivos se recalcularán desde rol, territorio, cargo, funciones
y segregación vigentes.

---

#### 24. Prórroga

Una prórroga solo podrá iniciarse cuando:

- existe período de prueba válido;
- el plazo inicialmente pactado es inferior al máximo aplicable;
- la solicitud ocurre antes del vencimiento;
- existe acuerdo escrito válido de las partes;
- el total no excede el máximo;
- no se usa para ocultar ausencia de decisión;
- se actualizan fechas, plan, accesos y comunicaciones;
- se conserva la versión anterior.

Estados:

```text
REQUESTED
LEGAL_VALIDATION_PENDING
WORKER_ACCEPTANCE_PENDING
APPROVED
REJECTED
EXPIRED
SUPERSEDED
```

Una aprobación interna unilateral no constituye prórroga válida.

---

#### 25. No continuidad durante el período de prueba

La decisión deberá pasar por un gate que verifique:

- período válido y activo;
- autoridad competente;
- fecha efectiva;
- evidencia objetiva relacionada con el cargo;
- criterios conocidos;
- apoyos y condiciones entregadas;
- consistencia y ausencia de retaliación;
- datos prohibidos excluidos;
- revisión de protección reforzada;
- revisión de discriminación;
- obligaciones documentales y económicas;
- comunicación;
- offboarding;
- revocación;
- conservación.

```text
ARTÍCULO 80
≠ TERMINACIÓN SIN CONTROL
≠ TERMINACIÓN DISCRIMINATORIA
≠ TERMINACIÓN AUTOMÁTICA POR SCORE
```

La categoría genérica “no superó prueba” no será suficiente sin trazabilidad
interna del fundamento y validación.

---

#### 26. Protecciones reforzadas y gate jurídico

Antes de aprobar una no continuidad, el sistema deberá revisar señales que
exigen análisis especializado, entre otras:

- embarazo o lactancia;
- protección de pareja en los supuestos legales aplicables;
- discapacidad;
- afectación de salud o debilidad manifiesta conocida;
- incapacidad;
- accidente de trabajo o enfermedad laboral;
- fuero sindical u otra protección;
- denuncia de acoso, seguridad, corrupción o represalia;
- solicitud de ajuste razonable;
- licencia o permiso protegido;
- discriminación potencial.

Resultados:

```text
NO_SPECIAL_GATE_IDENTIFIED
LEGAL_REVIEW_REQUIRED
AUTHORITY_APPROVAL_REQUIRED
DECISION_BLOCKED
CLEARED_WITH_BASIS
```

La app no diagnosticará ni mostrará datos sensibles a managers no autorizados.
Solo expondrá el bloqueo y la instrucción necesaria.

---

#### 27. Cierre antes de inicio

Si el vínculo no comenzó:

```text
CANCELLED_BEFORE_EMPLOYMENT_EFFECTIVE
```

No se registrará como:

- terminación durante prueba;
- trabajador retirado después de laborar;
- período de prueba fallido;
- no-show definitivo sin decisión;
- reingreso futuro.

Deberá resolver:

- episodio programado;
- asignaciones futuras;
- invitaciones;
- credenciales aún no activas;
- documentos;
- turnos futuros;
- compras o dotación;
- comunicaciones;
- retención;
- receipt.

---

#### 28. Taxonomía de cierre laboral

El cierre del episodio deberá distinguir, como mínimo:

```text
NON_CONTINUE_DURING_VALID_PROBATION
WORKER_RESIGNATION
MUTUAL_AGREEMENT
TERMINATION_WITH_CAUSE
TERMINATION_WITHOUT_CAUSE
CONTRACT_TERM_COMPLETED
WORK_OR_SERVICE_COMPLETED
TRANSFER_WITH_EPISODE_REPLACEMENT
DEATH
ADMINISTRATIVE_OR_JUDICIAL_ORDER
OTHER_AUTHORIZED_REASON
```

La taxonomía:

- no decide por sí sola la legalidad;
- conserva fundamento y versión normativa;
- define documentos y aprobaciones;
- activa efectos económicos y técnicos;
- evita usar “inactivo” como única explicación.

---

#### 29. Orquestación de offboarding

```text
CLOSURE_AUTHORIZED
→ EFFECTIVE_TIME_SCHEDULED
→ OPERATIONS_FROZEN OR HANDOVER_MODE
→ ASSIGNMENTS ENDED
→ ROLES AND EXCEPTIONS REVOKED
→ SESSIONS AND TOKENS INVALIDATED
→ DEVICES AND SHARED-CONTEXT ACCESS RESOLVED
→ EXTERNAL CREDENTIALS REVOKED
→ FUTURE SHIFTS AND QUEUES RECONCILED
→ ASSETS AND CUSTODY CLOSED
→ ECONOMIC OBLIGATIONS HANDED OFF
→ DOCUMENTS AND RETENTION APPLIED
→ RECEIPT AND RECONCILIATION
```

El cierre no se ejecutará como una colección de toggles manuales sin
orquestación.

---

#### 30. Revocación coordinada

La matriz deberá cubrir:

| Superficie                      | Efecto mínimo                              |
| ------------------------------- | ------------------------------------------ |
| roles base y operativos         | finalizar vigencia                         |
| grants temporales y excepciones | revocar sin herencia                       |
| asignaciones por sede y área    | cerrar con fecha efectiva                  |
| sesiones                        | invalidar según riesgo y fecha             |
| refresh tokens                  | revocar                                    |
| PIN y credenciales locales      | rotar o invalidar                          |
| dispositivos compartidos        | impedir selección del actor retirado       |
| dispositivos personales         | remover tokens y datos locales             |
| colas offline                   | rechazar autoridad anterior al sincronizar |
| API keys personales             | revocar                                    |
| proveedores externos            | cerrar o desasociar acceso                 |
| archivos compartidos            | retirar permisos, no borrar por defecto    |
| notificaciones                  | dejar de enviar contenido laboral futuro   |
| turnos futuros                  | cancelar, reasignar o marcar pendiente     |
| simulaciones y delegaciones     | invalidar                                  |
| carnet o wallet                 | revocar o vencer según política            |

Cada paso producirá receipt. `OFFBOARDING_COMPLETED` exigirá que los pasos
críticos estén conciliados.

---

#### 31. Offline, caché y eventos tardíos

Después de `employment_end_at`:

- un comando offline no conservará autoridad anterior;
- el servidor revalidará episodio, grant y fecha;
- los eventos tardíos se registrarán como rechazados o incidentes;
- una cola no podrá revivir una asignación;
- una app móvil limpiará datos y tokens según política;
- una PWA no mantendrá expedientes en service worker;
- una notificación en tránsito no abrirá una ruta sensible válida;
- un webhook duplicado será idempotente;
- un dispositivo compartido exigirá actor vigente.

---

#### 32. Activos, caja, inventario y custodia

El cierre deberá identificar activos o responsabilidades como:

- llaves;
- uniformes y dotación;
- equipos;
- dispositivos;
- herramientas;
- tarjetas;
- caja o fondos;
- documentos físicos;
- inventario bajo custodia;
- LPN, ubicaciones o contenedores asignados;
- accesos físicos;
- cuentas de terceros;
- pendientes y handover.

Estados por ítem:

```text
NOT_APPLICABLE
PENDING_RETURN
RETURNED
TRANSFERRED
DAMAGED
MISSING
DISPUTED
WAIVED_WITH_AUTHORITY
```

La existencia de un pendiente no mantendrá permisos operativos abiertos. Abrirá
un caso económico, logístico, disciplinario o jurídico separado.

---

#### 33. Obligaciones económicas y documentales

El cierre deberá emitir hechos para los dominios responsables de:

- salario y novedades;
- prestaciones;
- vacaciones;
- horas y recargos;
- descuentos autorizados;
- liquidación;
- certificados;
- seguridad social;
- préstamos o anticipos;
- activos pendientes;
- paz y salvo cuando corresponda.

```text
OFFBOARDING TÉCNICO COMPLETO
≠ OBLIGACIONES ECONÓMICAS CERRADAS
```

El receipt mostrará estados separados y responsables, sin permitir que ANIMA o
TALENTO calculen obligaciones económicas por su cuenta.

---

#### 34. Documentos, privacidad y conservación

Al continuar:

- los documentos whitelisted pasan a política laboral;
- el expediente de selección permanece en TALENTO;
- el plan de prueba y sus evidencias se clasifican;
- datos sensibles mantienen acceso restringido;
- consentimientos opcionales no se transforman en laborales.

Al cerrar:

- no se borrará la persona;
- no se borrará la postulación;
- no se borrará el episodio;
- se aplicarán políticas de retención por categoría;
- se bloquearán usos que perdieron finalidad;
- se resolverán solicitudes del titular;
- se propagarán eliminaciones o anonimización cuando procedan;
- se mantendrán holds legales sin acceso operativo general.

---

#### 35. Experiencia ANIMA

Para el trabajador, ANIMA podrá mostrar:

- fecha de inicio;
- existencia y fechas del período de prueba cuando aplique;
- objetivos conocidos;
- plan de formación;
- próximos check-ins;
- apoyos y pendientes;
- permisos o funciones aún supervisadas;
- canales para feedback y ayuda;
- resultado comunicado;
- acciones de cierre permitidas.

No mostrará:

- notas internas;
- comparaciones con candidatos o compañeros;
- scores ocultos;
- protecciones sensibles;
- deliberaciones jurídicas;
- reason codes técnicos;
- acceso a información interna después del cierre.

El lenguaje evitará estigmatizar al trabajador como “temporal” cuando no sea una
condición contractual real.

---

#### 36. Experiencia VISO

VISO deberá ofrecer, según permiso:

- bandeja de períodos próximos a iniciar o vencer;
- validador de aplicabilidad y duración;
- plan de objetivos;
- check-ins y evidencia;
- apoyos y ajustes sin diagnósticos;
- revisión de permisos temporales;
- conflictos y tareas vencidas;
- paquete de continuidad;
- gate jurídico;
- decisión y comunicación;
- offboarding y conciliación;
- métricas agregadas.

Ningún manager verá todo el expediente por defecto. La vista será territorial,
por finalidad y por etapa.

---

#### 37. Comportamiento de TALENTO después del handoff

TALENTO conservará:

- candidato;
- postulación;
- decisión prelaboral;
- handoff y enlace;
- expediente de selección;
- retención y derechos del titular.

No deberá:

- administrar el período de prueba;
- recibir evaluaciones laborales ordinarias;
- cambiar el estado del episodio;
- reabrir la postulación porque el vínculo terminó;
- mostrar al extrabajador notas laborales;
- duplicar el offboarding.

Una futura postulación podrá reutilizar identidad y datos permitidos, pero no
ocultará el episodio anterior ni heredará una etiqueta de “falló prueba”.

---

#### 38. Eventos mínimos

Eventos versionados sugeridos:

```text
probation_applicability_resolved
probation_term_validated
probation_started
onboarding_plan_published
probation_objective_updated
probation_checkin_completed
worker_feedback_submitted
support_action_created
provisional_access_granted
provisional_access_expiring
provisional_access_revoked
continuity_review_opened
continuity_decision_recorded
probation_extension_requested
probation_extended
probation_completed_continuing
probation_completed_non_continuing
employment_closure_authorized
offboarding_started
revocation_step_completed
asset_return_updated
offboarding_completed
readiness_gate_evaluated
```

Cada evento incluirá, cuando aplique:

- event id;
- schema version;
- episode id;
- actor efectivo;
- principal técnico;
- empresa, sede y área;
- before y after;
- legal policy version;
- correlation y causation;
- idempotency key;
- business time;
- processing time;
- clasificación;
- referencia de evidencia;
- resultado.

---

#### 39. Conciliaciones

La conciliación deberá detectar:

- episodio activo sin contrato o documento de prueba referenciado;
- prueba activa sin episodio activo;
- fecha final inválida;
- período vencido sin estado de cierre;
- continuidad registrada sin perfil de acceso resuelto;
- permisos temporales vencidos aún efectivos;
- trabajador activo sin acceso requerido;
- empleado terminado con sesiones vigentes;
- turnos futuros de trabajador retirado;
- actor retirado disponible en dispositivo compartido;
- wallet o carnet activo después del cierre;
- cierre técnico sin obligaciones económicas entregadas;
- TALENTO reabierto por error;
- reingreso con grants heredados;
- offboarding marcado completo con pasos críticos pendientes;
- callbacks o eventos duplicados.

Cada diferencia abrirá un caso; no se reparará mediante sobrescritura destructiva.

---

#### 40. Métricas y guardrails

Métricas permitidas:

- períodos aplicables y no aplicables;
- términos inválidos detectados;
- check-ins completados a tiempo;
- formación y herramientas entregadas;
- bloqueos atribuibles al sistema;
- grants temporales próximos a vencer;
- excepciones de compliance;
- tiempo de decisión;
- continuidad por cargo, sede y cohorte con privacidad;
- no continuidad con reason codes agregados;
- revisiones jurídicas requeridas;
- revocación dentro del SLA;
- sesiones o accesos residuales;
- activos pendientes;
- tiempo de cierre económico;
- reingresos sin herencia de acceso;
- diferencias de conciliación;
- rutas legacy aún activas.

Guardrails:

- no incentivar terminaciones rápidas;
- no comparar managers por tasa de no continuidad sin contexto;
- no optimizar score sobre seguridad, formación o no discriminación;
- no exponer datos sensibles en dashboards;
- no usar métricas agregadas para decisiones individuales automáticas;
- revisar disparidades y calidad de evidencia.

---

#### 41. Readiness gate para materializar el BLOQUE Y

La aprobación documental de `CAP-TAL-006` permite declarar:

```text
READY_TO_MATERIALIZE_TALENTO_ROADMAP
```

Esto significa únicamente que existe base suficiente para crear el roadmap
detallado del BLOQUE Y. No significa:

```text
READY_FOR_IMPLEMENTATION
READY_FOR_PILOT
READY_FOR_PRODUCTION
```

Dimensiones del gate:

1. **Gobierno:** propietarios, aprobadores y segregación definidos.
2. **Legal:** política laboral versionada y revisión externa programada.
3. **Identidad:** persona, candidato, empleado y episodio separados.
4. **Vacantes:** requisición, publicación y snapshot definidos.
5. **Privacidad:** finalidades, consentimientos, retención y derechos definidos.
6. **Evaluación:** instrumentos, evidencia y no discriminación definidos.
7. **Oferta:** decisión y aceptación versionadas.
8. **Handoff:** saga, commit points, receipts y compensaciones definidos.
9. **Período de prueba:** aplicabilidad, reloj, objetivos y decisiones definidos.
10. **Autorización:** permisos temporales, expiración y revocación definidos.
11. **Offboarding:** cierre, activos, sesiones y efectos derivados definidos.
12. **Arquitectura:** contratos, eventos, outbox, inbox y conciliación diseñados.
13. **Migración:** rutas AS-IS y bypass legacy inventariados.
14. **UX:** superficies web, móvil, VISO y ANIMA delimitadas.
15. **Pruebas:** TREQ y escenarios críticos identificados.
16. **Operación:** runbooks, responsables y soporte por definir en roadmap.
17. **Seguridad:** threat model, hardening y pentest por definir en roadmap.
18. **Despliegue:** ambientes, observabilidad y rollback por definir en roadmap.

Resultados:

```text
NOT_READY_TO_MATERIALIZE
READY_TO_MATERIALIZE_WITH_ACTIONS
READY_TO_MATERIALIZE_TALENTO_ROADMAP
```

Esta propuesta asigna la materialización detallada al BLOQUE Y. Ninguna tarea de
ese bloque podrá marcarse disponible hasta existir en el roadmap, superar sus
dependencias y obtener readiness de implementación.

---

#### 42. Paquetes que deberá crear el roadmap del BLOQUE Y

El futuro roadmap deberá incluir, como mínimo:

1. auditoría AS-IS de `vento-talento`, VISO, ANIMA, Auth y Supabase;
2. modelo canónico de persona, candidato, empleado y episodio;
3. catálogo de vacantes, publicaciones y formularios;
4. expediente, consentimiento, Storage y retención;
5. evaluación, entrevistas y proveedores;
6. decisión, oferta y pre-registro;
7. handoff y orquestación;
8. período de prueba y onboarding;
9. permisos provisionales y progresión;
10. continuidad y offboarding;
11. superficies Expo universal;
12. backoffice VISO;
13. proyecciones ANIMA;
14. autorización y RLS/RPC;
15. eventos, colas y conciliación;
16. migración y cutover de rutas legacy;
17. observabilidad y soporte;
18. QA contractual, seguridad, privacidad y E2E;
19. piloto controlado;
20. gate de producción.

Los identificadores exactos del BLOQUE Y se crearán cuando se materialice ese
roadmap; esta tarea no los inventa anticipadamente.

---

#### 43. Casos críticos de aceptación

La futura implementación deberá demostrar, al menos:

1. ingreso sin período de prueba aplicable;
2. estipulación escrita válida;
3. estipulación ausente o inválida;
4. contrato fijo inferior a un año;
5. intento de exceder máximo;
6. contrato sucesivo;
7. reingreso;
8. traslado interno sin prueba legal nueva;
9. fecha efectiva futura;
10. inicio real distinto de fecha de usuario;
11. check-in y addendum;
12. acceso requerido desde el primer día;
13. privilegio supervisado;
14. permiso temporal vencido;
15. falta de decisión antes del vencimiento;
16. continuidad con recalculo de permisos;
17. prórroga válida;
18. prórroga tardía o excesiva;
19. no continuidad con evidencia objetiva;
20. gate de embarazo o lactancia;
21. gate de salud o discapacidad;
22. solicitud de ajuste razonable;
23. represalia o motivo prohibido bloqueado;
24. cancelación antes de inicio;
25. cierre después de C1;
26. revocación de sesiones y tokens;
27. cola offline posterior al retiro;
28. actor retirado en dispositivo compartido;
29. turno futuro pendiente;
30. activo faltante sin mantener permisos;
31. obligación económica pendiente;
32. reingreso sin grants heredados;
33. evento duplicado;
34. conciliación de acceso residual;
35. readiness del BLOQUE Y sin autorizar implementación.

---

#### 44. Requisitos de prueba creados y modificados

Se crean:

```text
TREQ-TALENTO-075
TREQ-TALENTO-076
TREQ-TALENTO-077
TREQ-TALENTO-078
TREQ-TALENTO-079
TREQ-TALENTO-080
TREQ-TALENTO-081
TREQ-TALENTO-082
TREQ-TALENTO-083
TREQ-TALENTO-084
TREQ-TALENTO-085
TREQ-TALENTO-086
TREQ-TALENTO-087
TREQ-TALENTO-088
TREQ-TALENTO-089
TREQ-TALENTO-090
TREQ-TALENTO-091
TREQ-TALENTO-092
TREQ-TALENTO-093
TREQ-TALENTO-094
TREQ-TALENTO-095
TREQ-TALENTO-096
TREQ-TALENTO-097
```

Se actualiza evidencia, sin cambiar la regla protegida, para:

- `TREQ-AUTH-016`;
- `TREQ-TALENTO-001`;
- `TREQ-TALENTO-003`;
- `TREQ-TALENTO-005`;
- `TREQ-TALENTO-007` a `TREQ-TALENTO-011`;
- `TREQ-TALENTO-056` a `TREQ-TALENTO-074`.

El detalle canónico vive exclusivamente en
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 45. Criterios de aprobación de `CAP-TAL-006`

La tarea podrá aprobarse cuando se confirme que:

1. el período de prueba pertenece al episodio laboral;
2. la aplicabilidad y estipulación escrita están resueltas;
3. la duración y prórroga dependen de política jurídica versionada;
4. contratos sucesivos y movimientos internos no generan prueba automática;
5. el trabajador conserva derechos y acceso necesario;
6. los objetivos, apoyos y feedback recíproco están definidos;
7. los permisos provisionales son mínimos, fechados y revocables;
8. el silencio no termina ni confirma automáticamente;
9. continuidad recalcula permisos definitivos;
10. no continuidad exige evidencia y gate jurídico;
11. protecciones reforzadas bloquean decisiones no autorizadas;
12. cancelación antes del inicio se diferencia de offboarding;
13. cierre laboral y revocación están coordinados;
14. offline, caché, dispositivos y credenciales externas quedan cubiertos;
15. activos y obligaciones económicas tienen estados separados;
16. expediente y retención no se destruyen;
17. TALENTO no reabre candidatura;
18. eventos, conciliación y métricas están definidos;
19. el gate del BLOQUE Y no autoriza implementación;
20. el registro completo de TREQ queda válido y sin duplicados.

---

#### 46. Materias no autorizadas por esta tarea

La aprobación no autoriza:

- modificar contratos reales;
- crear o terminar trabajadores;
- conceder o revocar permisos reales;
- crear migraciones;
- ejecutar SQL;
- modificar Supabase;
- cambiar RLS o RPC;
- publicar TALENTO;
- activar PWA, Android o iOS;
- enviar invitaciones;
- alterar períodos de prueba vigentes;
- ejecutar offboarding;
- aplicar decisiones jurídicas a casos concretos;
- crear todavía los identificadores del BLOQUE Y.

---

#### 47. Resultado y continuidad

Si se aprueba:

```text
CAP-TAL-001 APROBADA
CAP-TAL-002 APROBADA
CAP-TAL-003 APROBADA
CAP-TAL-004 APROBADA
CAP-TAL-005 APROBADA
CAP-TAL-006 APROBADA
```

El segmento `CAP-TAL-*` quedará documentalmente cerrado y el sistema podrá
registrar:

```text
READY_TO_MATERIALIZE_TALENTO_ROADMAP
```

La continuidad inmediata de la secuencia E2 será:

```text
UX-BASE-001 — Separar experiencia operativa y administrativa
```

La materialización del roadmap propio de TALENTO en el BLOQUE Y permanecerá
como una puerta posterior y explícita; no interrumpe la continuidad documental
vigente de E2.


Reglas preservadas:

1. la persona postulada continúa siendo candidata hasta la vinculación autorizada;
2. TALENTO conserva postulación y expediente de selección;
3. VISO conserva vacantes, decisiones laborales y permisos administrativos;
4. ANIMA recibe al trabajador vinculado y su experiencia operativa;
5. candidato y trabajador comparten identidad enlazada, sin duplicación;
6. el período de prueba es un estado del vínculo laboral;
7. el rechazo, retiro o cierre conserva trazabilidad y retira accesos cuando corresponda;
8. cualquier migración o cambio de Supabase se creará y ejecutará desde `vento-shell`;
9. `CAP-TAL-006` deberá definir la puerta para materializar el roadmap propio del BLOQUE Y.
