### MINI-BLOQUE — MARKETING BENEFICIOS Y VALIDACIÓN COMERCIAL

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **marketing beneficios y validación comercial** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-MKT-001` a `INT-MKT-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INT-MKT-001`: Definir campañas solo después de aprobar AURA
- `INT-MKT-002`: Definir beneficios publicados en PASS
- `INT-MKT-003`: Definir validación comercial desde PULSO
<!-- PLAN-SECTION-META:END -->

### ✅ INT-MKT-001 — Definir campañas solo después de aprobar AURA

**Estado:** APROBADA
**Tarea anterior:** `INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos`
**Tarea siguiente:** `INT-MKT-002 — Definir beneficios publicados en PASS`
**Tipo de tarea:** documental; definición normativa permanente de la puerta que impide materializar campañas canónicas, ampliar superficies de marketing o activar integraciones de campaña en Vento OS antes de que la auditoría de AURA produzca una decisión formal de continuidad o reemplazo y, cuando corresponda, su ADR, preservando mientras tanto las superficies transitorias existentes sin convertirlas en arquitectura objetivo ni ampliar su autoridad
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/08_MARKETING_BENEFICIOS_Y_VALIDACION_COMERCIAL.md`
**Aplicación objetivo de marketing:** `AURA`, actualmente diferida
**Proceso canónico reutilizado:** `VPROC-0056 — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro`
**Puerta propietaria de continuidad:** `AURA-AUD-001` a `AURA-AUD-012`
**Decisión propietaria de continuidad:** `AURA-AUD-010`
**ADR cuando corresponda:** `AURA-AUD-011`
**Control de bloqueo del roadmap AURA:** `AURA-AUD-012`
**Línea base documental:** `vento-shell@f3ccea09048db131da3975040e0b33d1aa618c53`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir la condición canónica que debe cumplirse antes de que Vento OS trate una campaña de marketing como capacidad operativa perteneciente a AURA o a una solución que la sustituya formalmente.

La regla raíz es:

```text
MODELO OBJETIVO DE MARKETING APROBADO
≠
AURA APROBADA PARA CONTINUIDAD
≠
CAMPAÑA OPERATIVA
```

Mientras la auditoría de AURA no haya producido la decisión formal correspondiente:

```text
AURA DIFERIDA
→
CAMPAÑAS AURA NO MATERIALIZADAS
→
CERO AMPLIACIÓN DE AUTORIDAD POR INFERENCIA
→
SUPERFICIES EXISTENTES SOLO CONSERVAN SU ALCANCE TRANSITORIO APROBADO
```

Esta tarea define una puerta de arquitectura e integración. No prohíbe que Vento Group continúe actividades reales de marketing mediante medios actualmente autorizados; impide que esas actividades se presenten como implementación canónica de AURA o que se amplíe su autoridad técnica bajo esa justificación.

---

#### 2. Resultado sustantivo

`INT-MKT-001` congela las siguientes decisiones permanentes:

1. `CAP-SCOPE-014` aprobó el producto objetivo y las fronteras de marketing, pero no aprobó la continuidad técnica de AURA.
2. AURA continúa siendo una aplicación diferida.
3. La existencia de tareas `AURA-DOM-*`, `AURA-AUTH-*`, `AURA-UX-*` y `AURA-INT-*` no autoriza su ejecución anticipada.
4. La asignación de `VPROC-0056` a AURA es una propiedad objetivo documental y no prueba que AURA exista operativamente.
5. Una campaña canónica no puede materializarse en AURA antes de la decisión formal de `AURA-AUD-010`.
6. Cuando la decisión requiera ADR, `AURA-AUD-011` debe conservar esa decisión antes de continuar el roadmap afectado.
7. `AURA-AUD-012` mantiene bloqueado el roadmap hasta la decisión y deberá conservar su estado coherente con lo que esa decisión establezca.
8. Una decisión de continuidad habilita únicamente el desarrollo posterior autorizado; no equivale por sí sola a campaña publicada, canal conectado ni implementación terminada.
9. Una decisión de reemplazo no permite improvisar una aplicación propietaria distinta; el reemplazo debe conservar las fronteras canónicas y quedar gobernado por la decisión y el ADR aplicables.
10. Una decisión de retiro impide materializar nuevas capacidades de campaña bajo AURA; cualquier nueva propietaria requerirá decisión canónica explícita.
11. Ningún launcher, código reservado de aplicación, permiso base, dominio reservado, pantalla existente de otra aplicación o referencia documental demuestra que AURA esté aprobada.
12. Las superficies de contenido actuales que pertenecen a VISO conservan su propiedad mientras no exista transferencia aprobada.
13. Las superficies públicas actuales que consumen contenido conservan su propiedad mientras no exista transferencia aprobada.
14. Las superficies transitorias existentes no pueden ampliar su alcance para llenar anticipadamente el dominio AURA.
15. PULSO no se convierte en sistema de campañas por ejecutar una promoción en una venta.
16. PASS no se convierte en sistema de campañas por publicar o mostrar beneficios.
17. NUMERA no se convierte en sistema de campañas por validar presupuesto, margen o resultado económico.
18. Un canal externo no se convierte en maestro de campaña por publicar contenido o aportar métricas.
19. `VPROC-0056` conserva el ciclo funcional canónico que deberá respetar una implementación futura.
20. Campaña, contenido, publicación, promoción, beneficio y regla transaccional permanecen objetos o responsabilidades distintas.
21. La creación de una intención promocional no activa una regla en PULSO o PASS.
22. La aprobación de una pieza no equivale a publicación.
23. La publicación en un canal no prueba una redención, venta, conversión o rentabilidad.
24. La actividad de marketing existente puede seguir bajo su autoridad actual, pero no se reclasifica retrospectivamente como campaña AURA.
25. No se crean objetos físicos, integraciones, cuentas, credenciales, proveedores, tablas, funciones, jobs, datos ni automatizaciones desde esta tarea.
26. Se crean cero requisitos `TREQ-*`.
27. Se modifican cero requisitos `TREQ-*`.

---

#### 3. Base canónica consumida

Esta tarea consume sin reabrir:

- `CAP-SCOPE-014`, que define AURA como sistema operativo objetivo de marketing y desarrollo comercial;
- `AURA-AUD-001` a `AURA-AUD-012`, que gobiernan la auditoría y la decisión de continuidad;
- `AURA-AUD-010`, que decide continuidad, reemplazo o retiro;
- `AURA-AUD-011`, que documenta la decisión mediante ADR cuando corresponde;
- `AURA-AUD-012`, que mantiene bloqueado el roadmap hasta la decisión;
- `VPROC-0056`, que define el proceso canónico de contenido y promociones;
- `VPROC-0057`, que conserva separada la conversión de interacciones digitales en oportunidades o casos;
- `OPS-CAN-001`, que mantiene a los canales como medios de captura o publicación y no como propietarios del hecho empresarial;
- `TREQ-AURA-001`, `TREQ-AURA-002` y `TREQ-AURA-003`;
- `TREQ-AURA-004` a `TREQ-AURA-007`, para existencia, drift, disponibilidad y propiedad actual de superficies;
- `TREQ-INTEGRATION-019`, para integraciones de marketing, canales, idempotencia, conciliación y fuentes de verdad;
- las decisiones aprobadas del mini-bloque `INT-SALES-001` a `INT-SALES-011`, que preservan PULSO, PASS, NUMERA y NEXO como propietarias de sus hechos.

Ninguna de estas fuentes se modifica por esta tarea.

---

#### 4. Distinción entre diseño objetivo y autorización operativa

Se preserva:

```text
CAP-SCOPE-014
→ DEFINE QUÉ DEBE SER AURA
```

pero:

```text
AURA-AUD-001..012
→ DETERMINAN SI Y CÓMO PUEDE CONTINUAR
```

Por tanto:

```text
MODELO OBJETIVO DEFINIDO
+
PROCESO VPROC DEFINIDO
+
TAREAS FUTURAS ENUMERADAS
≠
PRODUCTO OPERATIVO
```

La documentación de una capacidad futura no constituye permiso para crearla, conectarla, publicar con ella o usar datos reales.

---

#### 5. Puerta obligatoria de campaña

Antes de materializar una campaña canónica bajo AURA debe existir una decisión formal producida por el mini-bloque de auditoría.

La secuencia lógica es:

```text
AUDITORÍA AURA
        ↓
EVIDENCIA DE ESTADO REAL
        ↓
AURA-AUD-010
        ↓
DECISIÓN DE CONTINUIDAD / REEMPLAZO / RETIRO
        ↓
AURA-AUD-011 CUANDO CORRESPONDA
        ↓
AURA-AUD-012 MANTIENE EL ESTADO DEL ROADMAP COHERENTE CON LA DECISIÓN
        ↓
TAREAS AURA POSTERIORES SEGÚN DECISIÓN
        ↓
PAQUETE Y READINESS AUTORIZADOS CUANDO CORRESPONDA
        ↓
CAPACIDAD OPERATIVA DE CAMPAÑA
```

Esta tarea no sustituye ninguna de esas etapas.

---

#### 6. Estado mientras la puerta permanezca cerrada

Mientras no exista la decisión formal:

1. AURA permanece diferida.
2. No se crea un repositorio AURA por efecto de esta tarea.
3. No se materializan campañas AURA.
4. No se crean nuevos maestros de campañas en PULSO, PASS, VISO, NUMERA o canales externos para sustituir silenciosamente a AURA.
5. No se conectan cuentas de redes, mensajería, correo, reseñas, analítica o IA en nombre de AURA.
6. No se importan audiencias, leads, reseñas o métricas a un dominio AURA inexistente.
7. No se autoriza contacto masivo con clientes por inferencia.
8. No se autoriza gasto publicitario por inferencia.
9. No se activan promociones transaccionales porque exista un brief o contenido.
10. No se amplían las superficies transitorias actuales.
11. No se presenta una pantalla, permiso reservado o catálogo de aplicaciones como prueba de disponibilidad.
12. No se modifica la propiedad actual de CMS, contenido web o superficies públicas.

---

#### 7. Actividad de marketing transitoria

La puerta de AURA no borra ni invalida el marketing que Vento Group pueda ejecutar mediante procedimientos actuales autorizados.

Mientras AURA siga diferida:

- los responsables humanos pueden continuar actividades permitidas mediante los controles vigentes;
- el contenido actualmente administrado por VISO conserva esa propiedad;
- los consumidores públicos existentes continúan consumiendo según su contrato actual;
- los canales externos conservan su autoridad nativa sobre publicación, mensajería o métricas;
- cualquier registro manual o transitorio conserva su procedencia real;
- esas superficies no adquieren por ello el dominio canónico futuro de AURA;
- una práctica transitoria no puede convertirse en precedente para ampliar permisos, datos o automatización.

La continuidad transitoria y la arquitectura objetivo permanecen separadas.

---

#### 8. Decisión de continuidad

Si `AURA-AUD-010` decide continuar AURA:

1. la decisión confirma que AURA puede seguir hacia su roadmap autorizado;
2. no declara implementadas las tareas `AURA-DOM-*`, `AURA-AUTH-*`, `AURA-UX-*` o `AURA-INT-*`;
3. no crea campañas por sí misma;
4. no conecta canales por sí misma;
5. no publica contenido por sí misma;
6. no concede permisos por sí misma;
7. no habilita proveedores de IA por sí misma;
8. las tareas posteriores deberán materializar dominio, autorización, experiencia e integración;
9. la implementación deberá superar las puertas de paquete, readiness y certificación que le correspondan;
10. `VPROC-0056` permanece como contrato de proceso que debe respetarse.

---

#### 9. Decisión de reemplazo

Si `AURA-AUD-010` decide reemplazar la implementación prevista:

- el reemplazo debe conservar las mismas fronteras empresariales ya aprobadas;
- no se reasigna la propiedad a PULSO, PASS, NUMERA, VISO o un proveedor externo por conveniencia;
- el ADR aplicable debe explicar la nueva decisión cuando corresponda;
- los contratos de producto, cliente, venta, fidelización, economía y contenido conservan sus propietarias;
- las tareas AURA afectadas deberán reconciliarse de forma explícita antes de materializar campañas;
- la solución sustituta no hereda credenciales, datos, permisos o canales sin evaluación;
- un cambio de tecnología no elimina las obligaciones de auditoría, consentimiento, idempotencia, versionado, aprobación y conciliación.

`INT-MKT-001` no selecciona la solución sustituta.

---

#### 10. Decisión de retiro

Si `AURA-AUD-010` decide retirar AURA como solución:

- no se materializa el dominio de campañas bajo AURA;
- no se usa el retiro como permiso para trasladar silenciosamente campañas a otra aplicación;
- `VPROC-0056` y sus fronteras deberán reconciliarse mediante una decisión canónica posterior antes de asignar una implementación diferente;
- las superficies existentes solo conservan sus responsabilidades previamente aprobadas;
- no se pierde historia de contenido, campañas manuales, publicaciones, consentimientos o evidencia que deba preservarse;
- ninguna consumidora obtiene autoridad adicional como consecuencia del retiro.

---

#### 11. Proceso canónico `VPROC-0056`

La futura capacidad de campañas deberá respetar el proceso ya aprobado:

```text
VPROC-0056
Gestionar contenido y promociones desde solicitud y aprobación
hasta publicación y retiro
```

AURA es la propietaria objetivo del proceso mientras la decisión de continuidad no determine otra cosa formalmente.

El proceso protege que:

- iniciar no significa aprobar;
- aprobar no significa programar;
- programar no significa publicar;
- publicar no significa demostrar impacto;
- retirar no borra historia;
- evaluar rendimiento no prueba automáticamente causalidad o rentabilidad.

---

#### 12. Estados canónicos preservados

El ciclo aprobado de `VPROC-0056` permanece:

```text
CONTENT_REQUESTED
→ BRIEF_UNDER_REVIEW
→ IN_CREATION
→ UNDER_REVIEW
→ PENDING_APPROVAL
→ APPROVED
→ SCHEDULED
→ PUBLISHED
→ PERFORMANCE_REVIEW
→ CONTENT_CYCLE_REVIEWED
```

Mientras AURA esté diferida, estos estados son contrato documental objetivo y no evidencia de una máquina operativa desplegada.

No se crean estados alternativos desde `INT-MKT-001`.

---

#### 13. Acciones excepcionales preservadas

Se conservan sin redefinición:

- `VPROC-0056.EX-001` — pausar publicación programada;
- `VPROC-0056.EX-002` — retirar temporalmente contenido;
- `VPROC-0056.EX-003` — solicitar retrabajo o evidencia;
- `VPROC-0056.EX-004` — escalar riesgo legal, reputacional o de marca.

La existencia de estas acciones en el contrato funcional no implica que estén implementadas mientras AURA permanezca diferida.

---

#### 14. Corrección, sustitución y cancelación

Se conservan:

- `VPROC-0056.CCR-001` — cancelar propuesta pendiente;
- `VPROC-0056.CCR-002` — anular versión inválida o duplicada;
- `VPROC-0056.CCR-003` — sustituir prospectivamente una definición vigente;
- `VPROC-0056.CCR-004` — corregir mediante nueva revisión.

Invariantes:

1. una corrección no sobrescribe historia;
2. una sustitución no reescribe el periodo anterior;
3. una cancelación detiene trabajo futuro sin fingir que nunca existió;
4. una versión nula conserva relación con la válida;
5. una publicación retirada conserva evidencia de haber existido.

---

#### 15. Campaña, contenido, publicación y promoción

Se conserva obligatoriamente:

```text
OBJETIVO
≠
CAMPAÑA
≠
CONTENIDO
≠
PUBLICACIÓN
≠
PROMOCIÓN
≠
BENEFICIO
≠
REGLA TRANSACCIONAL
```

Consecuencias:

- una campaña puede agrupar varias piezas;
- una pieza puede tener variantes por canal;
- una publicación es una salida concreta a un canal;
- una promoción expresa una intención comercial con condiciones;
- un beneficio PASS pertenece a la frontera de fidelización;
- una regla aplicada en PULSO pertenece a la frontera comercial transaccional;
- una misma campaña puede relacionarse con varias operaciones sin convertirse en su fuente de verdad.

---

#### 16. Contrato mínimo de campaña después de abrir la puerta

Una vez la continuidad correspondiente esté aprobada y las tareas propietarias posteriores permitan materializar la capacidad, una campaña deberá poder conservar, como mínimo:

- objetivo;
- hipótesis;
- audiencia;
- exclusiones;
- oferta o mensaje;
- piezas;
- canales;
- presupuesto;
- responsable;
- periodo;
- calendario;
- guardas de margen;
- guardas de stock;
- guardas de capacidad;
- referencias de atribución;
- variantes y grupo de control cuando aplique;
- criterio de inicio;
- criterio de pausa;
- criterio de cierre;
- resultado;
- aprendizaje.

`INT-MKT-001` no define nombres físicos de campos, tablas, endpoints ni esquemas.

---

#### 17. Propiedad empresarial

| Materia                                              | Propietaria o autoridad                     | Frontera                                  |
| ---------------------------------------------------- | ------------------------------------------- | ----------------------------------------- |
| intención de marketing y campaña objetivo            | `AURA`, sujeta a la decisión de continuidad | no ejecuta la venta ni el ledger          |
| contenido, piezas, calendario y publicación objetivo | `AURA`, cuando corresponda tras la puerta   | no crea maestros de producto o cliente    |
| oferta vendible y venta                              | `PULSO`                                     | no administra campañas                    |
| identidad, consentimiento y fidelización             | `PASS`                                      | no administra campañas                    |
| beneficio de fidelización                            | `PASS`                                      | la publicación se define en `INT-MKT-002` |
| validación comercial transaccional                   | `PULSO`                                     | se define en `INT-MKT-003`                |
| verdad económica, margen y presupuesto               | `NUMERA`                                    | no publica campañas                       |
| producto y atributos maestros                        | `NEXO`                                      | no gobierna mensajes de campaña           |
| capacidad productiva y disponibilidad operativa      | `FOGO` / `NEXO` según el hecho              | no decide la campaña                      |
| reclamo formal y servicio                            | proceso propietario de servicio             | comentario público no cierra el caso      |
| publicación o métrica nativa                         | canal externo                               | nunca es maestro de campaña               |

Ninguna fila autoriza escritura cruzada.

---

#### 18. Frontera con PASS

La campaña no controla directamente el dominio PASS.

Se preserva:

```text
CAMPAÑA
≠
BENEFICIO PASS
≠
CUENTA PASS
≠
LEDGER PASS
≠
REDENCIÓN PASS
```

Por tanto:

1. una campaña puede referenciar un beneficio únicamente mediante el contrato posterior autorizado;
2. mostrar una pieza promocional no crea un beneficio;
3. comunicar un beneficio no acredita elegibilidad;
4. elegibilidad y redención permanecen en PASS;
5. saldo y ledger nunca son autoridad de AURA;
6. una campaña no otorga puntos;
7. una campaña no gasta puntos;
8. una campaña no modifica consentimientos.

`INT-MKT-002` conserva la definición específica de beneficios publicados en PASS.

---

#### 19. Frontera con PULSO

Se preserva:

```text
CAMPAÑA
≠
PRECIO
≠
DESCUENTO APLICADO
≠
PEDIDO
≠
VENTA
≠
PAGO
```

AURA podrá gobernar intención promocional cuando su capacidad esté autorizada, pero:

- PULSO conserva oferta vendible y transacción;
- una campaña no cambia un precio por sí sola;
- una publicación no aplica un descuento;
- un código visible no demuestra una regla válida;
- PULSO debe validar su propio contrato antes de materializar cualquier efecto comercial;
- una venta sin correlación de campaña puede seguir siendo una venta válida;
- una campaña correlacionada no se declara conversión solo por existir la venta.

`INT-MKT-003` conserva la validación comercial desde PULSO.

---

#### 20. Frontera con NUMERA

NUMERA conserva:

- presupuesto;
- margen;
- costo;
- rentabilidad;
- efecto económico;
- análisis financiero correspondiente.

Una futura campaña podrá consumir guardas o resultados autorizados, pero:

- AURA no fija costos;
- AURA no reconoce ingreso;
- AURA no crea asientos;
- AURA no convierte interacción en rentabilidad;
- una métrica del canal no reemplaza la verdad económica;
- un presupuesto de campaña no constituye por sí solo autorización de gasto.

---

#### 21. Frontera con NEXO y FOGO

Producto, inventario, capacidad y producción permanecen fuera de AURA.

Una campaña no podrá afirmar como hecho:

- disponibilidad;
- inventario vendible;
- capacidad productiva;
- ingredientes;
- propiedades;
- composición;
- tiempos operativos;
- restricciones técnicas;

si no provienen de la fuente autorizada.

La necesidad comercial puede consumir proyecciones autorizadas, pero no convertirlas en maestros de marketing editables.

---

#### 22. Audiencias, identidad y consentimiento

La audiencia de campaña no equivale a una lista libre de contactos.

Se preserva:

```text
AUDIENCIA
≠
CLIENTE
≠
CUENTA PASS
≠
CONTACTO
≠
CONSENTIMIENTO
```

Toda capacidad futura deberá:

- usar la finalidad aprobada;
- respetar consentimiento y opt-out;
- minimizar datos;
- impedir exportaciones indiscriminadas;
- conservar origen del segmento;
- evitar inferir consentimiento por compra, redención, visita o interacción;
- distinguir comunicación transaccional de marketing.

La puerta de AURA no puede abrirse mediante importación previa de datos personales.

---

#### 23. Inteligencia artificial

La IA permanece subordinada a la decisión y a las tareas propietarias de AURA.

Antes de la aprobación correspondiente no se autoriza, por esta tarea:

- contratar un proveedor para operar AURA;
- enviar datos reales a un modelo;
- publicar contenido generado;
- contactar clientes automáticamente;
- activar promociones;
- responder crisis de forma autónoma.

Cuando la capacidad futura sea autorizada, se conservarán las obligaciones de `TREQ-AURA-002`: fuentes autorizadas, grounding, frescura, separación entre hecho, inferencia y propuesta, trazabilidad de proveedor/modelo/instrucción/datos/resultado y aprobación humana para decisiones sensibles.

---

#### 24. Canales externos

Redes sociales, mensajería, correo, reseñas, analítica y otros proveedores son fronteras externas.

Se preserva:

```text
CANAL
→ PUBLICA O TRANSPORTA
→ NO SE CONVIERTE EN PROPIETARIO DEL HECHO EMPRESARIAL
```

La capacidad posterior deberá pasar por `AURA-INT-001` para adaptadores, webhooks, límites, credenciales y conciliación externa.

`INT-MKT-001` no conecta ningún canal.

---

#### 25. Contratos internos de lectura y eventos

AURA deberá consumir NEXO, PULSO, PASS, NUMERA, VISO y FOGO mediante lecturas o eventos autorizados conforme a `AURA-INT-002`.

La puerta de campaña no autoriza:

- consultas privilegiadas improvisadas;
- réplicas editables de maestros;
- escrituras directas en dominios consumidores;
- uso de credenciales compartidas por conveniencia;
- bypass de contratos porque la información sea necesaria para marketing.

---

#### 26. Idempotencia y conciliación futura

`TREQ-INTEGRATION-019` ya exige que publicaciones, mensajes, leads, comentarios, conversiones, cupones y métricas conserven identidades, versiones, estados y claves idempotentes cuando se materialicen.

Por tanto:

- reintentar una publicación no debe crear otra publicación empresarial;
- un webhook repetido no debe crear otro lead;
- una respuesta perdida no debe asumirse como no publicada;
- una métrica tardía no debe crear otra conversión;
- un canal no puede duplicar redenciones;
- una campaña sin piezas o una publicación sin confirmación debe quedar conciliable.

Esta tarea no selecciona la infraestructura física de esas garantías.

---

#### 27. Medición y atribución

Una campaña futura deberá distinguir:

```text
INTERACCIÓN
≠
CONVERSIÓN
≠
VENTA CORRELACIONADA
≠
VENTA INCREMENTAL
≠
MARGEN
≠
RENTABILIDAD
```

La atribución deberá conservar método y nivel de confianza.

Queda prohibido presentar:

- likes como ventas;
- clics como clientes;
- mensajes como oportunidades calificadas;
- ventas coincidentes como incrementales sin método;
- ingreso como margen;
- correlación como causalidad.

La definición detallada permanece en `AURA-DOM-008` y la experiencia correspondiente en `AURA-UX-008`.

---

#### 28. Guardas económicas, físicas y reputacionales

El modelo objetivo ya exige que una campaña pueda detenerse ante daño económico, operativo o reputacional.

La futura materialización deberá poder consultar las fuentes autorizadas para:

- margen;
- presupuesto;
- stock;
- capacidad;
- derechos;
- restricciones legales;
- consentimiento;
- riesgo reputacional.

La ausencia de una guarda requerida no se interpreta como aprobación.

---

#### 29. Superficies existentes y transición

El inventario vigente de AURA mantiene la aplicación como diferida y sin producto standalone operativo acreditado.

Se preserva además la decisión de que:

- las superficies administrativas actuales de contenido continúan atribuidas a VISO;
- las superficies públicas consumidoras continúan en su propietaria vigente;
- la reserva de AURA en launchers o catálogos no equivale a disponibilidad;
- un placeholder no equivale a producto;
- la existencia de contenido, promociones o canales actuales no demuestra un sistema de campañas AURA;
- cualquier transferencia futura de propiedad requiere decisión aprobada.

---

#### 30. Duplicidad de implementación

Se preserva `DUP-006`:

- contenido, promoción, activo y publicación pueden aparecer actualmente distribuidos entre operación de marketing, CMS, PULSO, PASS y canales;
- AURA es la propietaria objetivo mientras permanezca la decisión documental vigente;
- mientras AURA continúe diferida, las superficies existentes son transitorias;
- las superficies transitorias no pueden ampliar su alcance;
- el cambio de propiedad depende de la decisión de continuidad y de readiness aprobado.

Esta tarea impide usar una duplicidad existente como argumento para anticipar la arquitectura futura.

---

#### 31. Eventos empresariales preservados

No se crea una definición normal de evento nueva.

Se conservan para `VPROC-0056`:

- `VPROC-0056.EVT-001` — contenido o promoción solicitado;
- `VPROC-0056.EVT-002` — brief en revisión;
- `VPROC-0056.EVT-003` — en creación;
- `VPROC-0056.EVT-004` — pendiente de aprobación;
- `VPROC-0056.EVT-005` — ciclo de contenido evaluado.

Ninguno de estos eventos debe interpretarse como evento operacional AURA desplegado mientras la aplicación siga diferida.

---

#### 32. Auditoría mínima futura

Cuando la campaña se materialice mediante las tareas autorizadas, deberá poder reconstruirse, según aplicabilidad:

- decisión que habilitó AURA o su reemplazo;
- campaña;
- objetivo e hipótesis;
- marca;
- audiencia;
- consentimiento;
- brief;
- pieza y versión;
- derechos;
- aprobación;
- calendario;
- publicación;
- canal;
- oferta o promoción;
- referencias a PASS/PULSO cuando existan;
- presupuesto y guardas;
- actor;
- cambios;
- pausas;
- retiro;
- métricas;
- método de atribución;
- resultado;
- aprendizaje;
- evidencia.

La auditoría no sustituye la autorización ni la fuente propietaria.

---

#### 33. Frontera de implementación posterior

La materialización detallada queda distribuida así:

| Materia                                           | Tarea propietaria posterior       | Condición de salida                                                                  |
| ------------------------------------------------- | --------------------------------- | ------------------------------------------------------------------------------------ |
| decisión sobre AURA                               | `AURA-AUD-010`                    | continuidad, reemplazo o retiro queda formalmente decidido                           |
| ADR de la decisión cuando corresponda             | `AURA-AUD-011`                    | decisión arquitectónica queda documentada                                            |
| bloqueo o liberación del roadmap                  | `AURA-AUD-012`                    | el estado del roadmap coincide con la decisión                                       |
| objetivos, audiencias, briefs, calendario y ciclo | `AURA-DOM-002`                    | contrato de planificación de campaña queda definido                                  |
| campañas, experimentos, promociones y guardas     | `AURA-DOM-006`                    | dominio de campaña y promoción queda definido                                        |
| métricas, atribución y aprendizaje                | `AURA-DOM-008`                    | medición y cierre quedan definidos                                                   |
| segregación de acciones                           | `AURA-AUTH-001` a `AURA-AUTH-004` | capacidades sensibles quedan protegidas                                              |
| experiencia de campaña                            | `AURA-UX-005`                     | interfaz de campañas y guardas queda diseñada                                        |
| adaptadores externos                              | `AURA-INT-001`                    | canales, webhooks, límites, credenciales y conciliación quedan definidos             |
| contratos internos                                | `AURA-INT-002`                    | lecturas y eventos con aplicaciones internas quedan definidos                        |
| beneficios visibles al cliente                    | `INT-MKT-002`                     | publicación de beneficios en PASS queda definida sin transferir propiedad de campaña |
| validación comercial                              | `INT-MKT-003`                     | PULSO valida el efecto comercial sin convertirse en propietaria de campaña           |

Ningún pendiente material queda sin propietaria y condición de salida.

---

#### 34. Diagnóstico documental actual

El estado actual demostrable es:

```text
CAP-SCOPE-014 = APROBADA
AURA COMO PRODUCTO OBJETIVO = DEFINIDA
VPROC-0056 = DEFINIDO
AURA-AUD-001..012 = PENDIENTES
AURA-DOM/AUTH/UX/INT = BLOQUEADAS
CAMPAÑA AURA OPERATIVA = NO AUTORIZADA
CAMBIOS FÍSICOS DE ESTA TAREA = 0
```

La tarea no declara implementado ningún repositorio, pantalla, permiso, integración, proveedor, dato, campaña o publicación AURA.

---

#### 35. Prohibiciones

Queda prohibido:

1. interpretar `CAP-SCOPE-014` como aprobación operativa de AURA;
2. interpretar la propiedad objetivo de `VPROC-0056` como prueba de implementación;
3. crear campañas AURA mientras la puerta de continuidad siga cerrada;
4. ampliar VISO para convertirlo silenciosamente en AURA;
5. ampliar PULSO para convertirlo silenciosamente en AURA;
6. ampliar PASS para convertirlo silenciosamente en AURA;
7. ampliar NUMERA para convertirlo silenciosamente en AURA;
8. convertir un canal externo en maestro de campaña;
9. convertir una publicación en campaña;
10. convertir una campaña en regla transaccional;
11. convertir una campaña en beneficio PASS;
12. convertir un descuento en prueba de campaña;
13. convertir un beneficio en prueba de campaña;
14. convertir una venta en conversión atribuida sin método;
15. convertir interacción en impacto empresarial;
16. usar un launcher o permiso reservado como evidencia de disponibilidad;
17. crear un repositorio AURA desde esta tarea;
18. conectar cuentas externas desde esta tarea;
19. conectar proveedores de IA desde esta tarea;
20. importar audiencias o leads desde esta tarea;
21. enviar datos reales a terceros desde esta tarea;
22. publicar o programar contenido desde esta tarea;
23. contactar clientes desde esta tarea;
24. crear o activar promociones desde esta tarea;
25. modificar precios desde esta tarea;
26. modificar beneficios o ledger PASS desde esta tarea;
27. modificar ventas o pedidos PULSO desde esta tarea;
28. modificar costos, presupuesto o hechos NUMERA desde esta tarea;
29. modificar producto, stock o capacidad desde esta tarea;
30. asumir consentimiento por compra, visita, redención o contacto;
31. crear una definición normal de evento adicional;
32. crear nombres físicos de tablas, RPC, funciones, triggers, colas o jobs;
33. modificar código, SQL, migraciones, RLS, datos, Supabase, credenciales o configuración remota;
34. iniciar o desarrollar `INT-MKT-002`.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro vigente ya protege que AURA gobierne campañas mediante identidades, versiones, estados y aprobaciones; que AURA continúe indisponible hasta existir repositorio, despliegue, superficies certificadas, autorización y decisión formal de continuidad; que las superficies actuales no transfieran propiedad por inferencia; que campaña, contenido, publicación, promoción y regla transaccional permanezcan separados; que IA, audiencias y datos requieran autorización y minimización; y que las integraciones futuras con canales e internamente con NEXO, PULSO, PASS, NUMERA, VISO y FOGO sean versionadas, idempotentes y conciliables. `INT-MKT-001` convierte esa puerta ya protegida en el contrato permanente del mini-bloque de marketing sin añadir una obligación verificable material nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 37. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-AURA-001`, para identidad, versionado, propiedad y estados separados de campaña, contenido, publicación y promoción;
- `TREQ-AURA-002`, para grounding, privacidad, trazabilidad y límites de IA;
- `TREQ-AURA-003`, para campañas, promociones, oportunidades, presupuesto, guardas, atribución y fronteras PULSO/PASS/NUMERA;
- `TREQ-AURA-004`, para distinguir la ausencia de producto AURA de reservas y placeholders;
- `TREQ-AURA-005`, para detectar cualquier delta futuro de superficies AURA;
- `TREQ-AURA-006`, para mantener AURA no disponible mientras falten producto, despliegue, autorización y decisión formal de continuidad;
- `TREQ-AURA-007`, para mantener la propiedad actual de CMS y superficies públicas hasta una transferencia aprobada;
- `TREQ-INTEGRATION-019`, para contratos internos, adaptadores externos, idempotencia, conciliación, credenciales, datos y métricas de marketing;
- la cobertura transversal vigente de autorización, privacidad, idempotencia, retry, auditoría y fuentes propietarias.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 38. Decisiones congeladas

1. `CAP-SCOPE-014` define el objetivo, no la aprobación operativa de AURA.
2. AURA permanece diferida.
3. `AURA-AUD-010` conserva la decisión de continuidad, reemplazo o retiro.
4. `AURA-AUD-011` conserva el ADR cuando corresponda.
5. `AURA-AUD-012` conserva el bloqueo documental hasta la decisión.
6. No existe campaña AURA operativa antes de superar esa puerta.
7. Las superficies actuales mantienen su propiedad y alcance transitorio.
8. Las superficies transitorias no se amplían para sustituir AURA.
9. `VPROC-0056` permanece como proceso objetivo.
10. Sus estados, transiciones, excepciones y correcciones permanecen vigentes documentalmente.
11. El proceso objetivo no demuestra implementación.
12. Campaña, contenido, publicación, promoción, beneficio y regla transaccional permanecen separados.
13. AURA conserva intención de marketing cuando la continuidad aplicable se apruebe.
14. PULSO conserva oferta vendible, pedido y venta.
15. PASS conserva identidad, consentimiento, beneficios y fidelización.
16. NUMERA conserva verdad económica.
17. NEXO conserva producto e inventario.
18. FOGO/NEXO conservan capacidad operacional según el hecho.
19. Los canales externos no son maestros empresariales.
20. `INT-MKT-002` conserva beneficios publicados en PASS.
21. `INT-MKT-003` conserva validación comercial desde PULSO.
22. `AURA-DOM-002`, `AURA-DOM-006` y `AURA-DOM-008` conservan el detalle del dominio de campaña.
23. `AURA-AUTH-*` conserva segregación y protección.
24. `AURA-UX-005` conserva la experiencia de campaña.
25. `AURA-INT-001` y `AURA-INT-002` conservan integraciones.
26. No se crea una definición normal de evento.
27. Se crean cero cambios `TREQ-*`.
28. No se genera una copia del registro canónico de requisitos.
29. Se crean cero objetos físicos.
30. Se modifican cero objetos físicos.
31. No se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 39. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `INT-SALES-011` como tarea anterior;
2. conserva `INT-MKT-002` como única tarea siguiente reservada;
3. identifica AURA como aplicación diferida;
4. distingue `CAP-SCOPE-014` de la decisión de continuidad;
5. mantiene `AURA-AUD-001` a `AURA-AUD-012` como puerta propietaria;
6. mantiene `AURA-AUD-010` como decisión de continuidad, reemplazo o retiro;
7. mantiene `AURA-AUD-011` como ADR cuando corresponde;
8. mantiene `AURA-AUD-012` como control del bloqueo del roadmap;
9. impide materializar campañas AURA antes de la decisión;
10. impide interpretar el proceso objetivo como implementación;
11. preserva la continuidad transitoria de marketing sin ampliarla;
12. mantiene VISO y superficies públicas con su propiedad actual mientras no exista transferencia;
13. preserva `VPROC-0056`;
14. preserva su secuencia canónica de estados;
15. preserva sus acciones excepcionales;
16. preserva cancelación, anulación, sustitución y corrección versionadas;
17. distingue campaña, contenido, publicación y promoción;
18. distingue promoción de beneficio PASS;
19. distingue promoción de regla PULSO;
20. define el mínimo contractual de campaña sin diseñar objetos físicos;
21. preserva las fuentes propietarias de producto, cliente, venta, fidelización y economía;
22. impide que un canal externo sea maestro de campaña;
23. preserva consentimiento y minimización de audiencias;
24. mantiene IA bloqueada para operación real hasta las autorizaciones correspondientes;
25. preserva `AURA-INT-001` y `AURA-INT-002` como integraciones posteriores;
26. preserva idempotencia y conciliación ya protegidas;
27. preserva atribución con método y confianza;
28. preserva guardas económicas, físicas y reputacionales;
29. preserva `DUP-006`;
30. crea cero definiciones normales de evento;
31. asigna todo detalle posterior a una tarea propietaria exacta;
32. genera cero requisitos de prueba nuevos;
33. modifica cero requisitos de prueba;
34. no genera una copia del registro canónico de requisitos;
35. crea cero objetos físicos;
36. modifica cero objetos físicos;
37. no modifica código, SQL, migraciones, Supabase, datos, credenciales ni configuración remota;
38. no inicia ni desarrolla `INT-MKT-002`.

---

#### 40. Resultado de la tarea

`INT-MKT-001` queda definida como la puerta permanente que evita que el diseño objetivo de marketing se convierta por inferencia en una implementación AURA o en una campaña operativa antes de la decisión formal de continuidad.

Resultado consolidado:

```text
CAP-SCOPE-014 APROBADA
+
AURA DIFERIDA
+
AUDITORÍA AURA PENDIENTE
→
CAMPAÑAS AURA BLOQUEADAS
```

y, únicamente después de la decisión aplicable y de las tareas posteriores autorizadas:

```text
DECISIÓN AURA FORMAL
+
GOBIERNO DOCUMENTADO
+
DOMINIO DE CAMPAÑA
+
AUTORIZACIÓN
+
EXPERIENCIA
+
INTEGRACIONES
+
READINESS
→
CAPACIDAD DE CAMPAÑA MATERIALIZABLE
```

sin ampliar superficies transitorias, sin transferir propiedad a PULSO/PASS/NUMERA por conveniencia y sin conectar canales o datos reales desde esta tarea.

---

#### 41. Continuidad

ÚLTIMA TAREA APROBADA

`INT-SALES-011 — Definir retiro del adaptador externo sin modificar consumidores internos`

TAREA ACTUAL APROBADA

`INT-MKT-001 — Definir campañas solo después de aprobar AURA`

SIGUIENTE TAREA RESERVADA

`INT-MKT-002 — Definir beneficios publicados en PASS`


### ✅ INT-MKT-002 — Definir beneficios publicados en PASS

**Estado:** APROBADA
**Tarea anterior:** `INT-MKT-001 — Definir campañas solo después de aprobar AURA`
**Tarea siguiente:** `INT-MKT-003 — Definir validación comercial desde PULSO`
**Tipo de tarea:** documental; definición normativa permanente del contrato por el que PASS conserva la propiedad de los beneficios de fidelización y presenta al cliente una proyección publicada de esos beneficios sin transferir a AURA la propiedad de fidelización, sin transferir a PASS la propiedad de campaña y sin convertir visibilidad en elegibilidad, redención, descuento aplicado o venta
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/08_MARKETING_BENEFICIOS_Y_VALIDACION_COMERCIAL.md`
**Proceso propietario reutilizado:** `VPROC-0045 — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados`
**Proceso relacionado de marketing:** `VPROC-0056 — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro`
**Aplicación propietaria de fidelización:** `PASS`
**Aplicación objetivo de marketing:** `AURA`, sujeta a `AURA-AUD-001` a `AURA-AUD-012`
**Aplicación propietaria de la operación comercial:** `PULSO`
**Autoridad económica:** `NUMERA`
**Línea base documental:** `vento-shell@26aa14a6c1b5bd789443e6dae0b7bc5753dd2d66`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir qué significa que un beneficio esté publicado en PASS y fijar la frontera permanente entre fidelización, marketing y ejecución comercial.

La regla raíz es:

```text
BENEFICIO DEFINIDO EN PASS
≠
BENEFICIO PUBLICADO EN PASS
≠
ELEGIBILIDAD CONFIRMADA
≠
REDENCIÓN
≠
DESCUENTO APLICADO
≠
VENTA
```

y, cuando exista una campaña relacionada:

```text
CAMPAÑA AURA
≠
BENEFICIO PASS
≠
REGLA TRANSACCIONAL
≠
EFECTO COMERCIAL PULSO
```

PASS conserva la identidad del cliente, el consentimiento, la fidelización, sus reglas y el ledger correspondiente. AURA conserva la intención de marketing y la correlación de campaña cuando su continuidad esté formalmente autorizada. PULSO conserva la operación comercial. NUMERA conserva la verdad económica.

Esta tarea define el contrato documental entre esas responsabilidades. No activa publicaciones reales, no crea beneficios, no modifica cuentas PASS y no ejecuta efectos comerciales.

---

#### 2. Resultado sustantivo

`INT-MKT-002` congela las siguientes decisiones:

1. PASS es la propietaria del beneficio de fidelización y de su proyección visible al cliente.
2. Publicar un beneficio en PASS significa hacerlo consultable mediante una proyección gobernada por PASS; no significa crear una campaña.
3. La proyección publicada no se convierte en fuente distinta del beneficio, de su regla ni de su versión.
4. Un beneficio puede existir en PASS sin pertenecer a una campaña de AURA.
5. Un beneficio relacionado con una campaña conserva una referencia de correlación sin transferir su propiedad a AURA.
6. AURA no crea, acredita, gasta, ajusta ni revierte puntos.
7. AURA no crea ni consume directamente el ledger de fidelización.
8. AURA no decide por sí sola que un cliente sea elegible.
9. AURA no valida una redención.
10. PASS no se convierte en sistema de campañas por mostrar beneficios.
11. PASS no se convierte en POS por mostrar una recompensa, cupón o beneficio.
12. La visibilidad de un beneficio no demuestra elegibilidad efectiva.
13. La elegibilidad no demuestra que exista una redención.
14. Una redención no demuestra que el efecto comercial haya sido validado o aplicado en PULSO.
15. Una recompensa, un cupón, una promoción, una cortesía, una membresía, un nivel, puntos y un beneficio por campaña permanecen conceptos distintos.
16. Una publicación de marketing no crea una regla de fidelización.
17. Una regla de fidelización no crea una venta.
18. Una venta no crea una campaña por inferencia.
19. PASS conserva la versión de regla necesaria para explicar el beneficio y reconstruir su aplicación.
20. Los cambios de regla son prospectivos y no reescriben movimientos, redenciones o evidencia histórica.
21. Retirar u ocultar una proyección no borra el beneficio histórico ni revierte automáticamente efectos ya ocurridos.
22. Vencimiento, cancelación, uso, ajuste y reversión conservan la semántica del dominio de fidelización y no se sustituyen por estados de campaña.
23. La administración laboral de productos de fidelización permanece reservada a `PASS-INT-003`.
24. La experiencia visible de puntos, beneficios, recompensas y redención permanece reservada a `PASS-UX-002`, `PASS-UX-005`, `PASS-UX-007` y `PASS-UX-009`.
25. La acumulación y redención PULSO → PASS permanecen reservadas a `PASS-INT-001` y `PASS-INT-002`.
26. La validación comercial del efecto permanece reservada a `INT-MKT-003`.
27. La intención promocional detallada permanece en `AURA-DOM-006` cuando la puerta de AURA permita ejecutarla.
28. Los contratos internos AURA ↔ PASS permanecen en `AURA-INT-002` cuando correspondan.
29. No se crean nombres físicos de tablas, columnas, RPC, funciones, endpoints, eventos, colas o jobs.
30. No se crean ni modifican requisitos `TREQ-*`.

---

#### 3. Base canónica consumida

Esta tarea consume sin reabrir:

- `INT-MKT-001`, que separa campaña, contenido, publicación, promoción, beneficio y regla transaccional;
- `CAP-SCOPE-009`, que mantiene PULSO como propietaria de pedido, venta, cobro y ejecución comercial, y PASS como fuente de fidelización;
- `CAP-SCOPE-010`, especialmente `CAP-10.07 — Gestionar fidelización y beneficios`;
- `CAP-SCOPE-014`, especialmente `CAP-14.06 — Gestionar promociones y cupones`;
- `VPROC-0045`, propiedad de PASS;
- `VPROC-0056`, propiedad objetivo de AURA sujeta a su puerta de continuidad;
- `GAP-OWN-006`, que mantiene fidelización en PASS y la ejecución transaccional de acumulación o redención en PULSO mediante contrato;
- `PASS-UX-002`, `PASS-UX-005`, `PASS-UX-007` y `PASS-UX-009`;
- `PASS-INT-001` a `PASS-INT-005`;
- `PASS-QA-001` y `PASS-QA-002`;
- `AURA-DOM-006` y `AURA-INT-002`, bloqueadas por la decisión de continuidad de AURA;
- `PULSO-AUTH-009` y `PULSO-AUTH-010`;
- la cobertura vigente de `TREQ-PASS-006`, `TREQ-PASS-008`, `TREQ-PASS-010`, `TREQ-AURA-001`, `TREQ-AURA-003`, `TREQ-PROC-021`, `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-006` y `TREQ-INTEGRATION-019`.

Ninguna de estas fuentes cambia de significado por esta tarea.

---

#### 4. Definición normativa de beneficio publicado

Un beneficio publicado en PASS es una proyección de cliente que representa un beneficio de fidelización gobernado por PASS y permite conocer su existencia y condiciones aplicables sin crear una fuente paralela ni anticipar el resultado de uso.

Se conserva:

```text
FUENTE PASS
→ BENEFICIO + REGLA + VERSIÓN
→ PROYECCIÓN VISIBLE EN PASS
```

No se admite:

```text
CAMPAÑA
→ TEXTO PROMOCIONAL
→ BENEFICIO CREADO POR INFERENCIA
```

ni:

```text
PROYECCIÓN VISIBLE
→ SALDO MODIFICADO
```

ni:

```text
PROYECCIÓN VISIBLE
→ REDENCIÓN CONFIRMADA
```

La proyección es una lectura gobernada del beneficio. La mutación del ledger, la reserva o consumo de puntos y la ejecución comercial pertenecen a contratos distintos.

---

#### 5. Taxonomía preservada

Se conserva la separación aprobada en `CAP-SCOPE-010`:

```text
PUNTOS
≠
RECOMPENSA
≠
CUPÓN
≠
NIVEL
≠
MEMBRESÍA
≠
PROMOCIÓN
≠
CORTESÍA
≠
BENEFICIO POR CAMPAÑA
```

Consecuencias:

1. puntos representan movimientos y saldo proyectado de fidelización;
2. una recompensa representa aquello que puede obtenerse bajo una regla;
3. un cupón representa un instrumento o referencia aplicable bajo condiciones;
4. un nivel o membresía representa una condición de relación o programa;
5. una promoción expresa una intención comercial y sus condiciones;
6. una cortesía responde a una decisión distinta de fidelización ordinaria;
7. un beneficio por campaña es un beneficio PASS correlacionado con una iniciativa de marketing, no una campaña almacenada dentro de PASS;
8. la interfaz futura no deberá colapsar estas identidades en una sola etiqueta que cambie su autoridad.

---

#### 6. Propiedad empresarial

| Materia                                   | Propietaria o autoridad                          | Frontera                                                         |
| ----------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------- |
| identidad del cliente                     | `PASS`                                           | no se deriva de una campaña                                      |
| consentimiento y preferencias aplicables  | `PASS`                                           | Marketing consume la autorización; no la fabrica                 |
| cuenta y ledger de fidelización           | `PASS`                                           | ninguna consumidora mantiene saldo paralelo                      |
| beneficio y regla de fidelización         | `PASS`                                           | AURA puede referenciar; PULSO puede ejecutar efectos autorizados |
| proyección de beneficios al cliente       | `PASS`                                           | no convierte PASS en sistema de campañas                         |
| intención promocional y campaña           | `AURA`, solo después de su puerta de continuidad | no modifica ledger ni venta                                      |
| validación y efecto comercial de venta    | `PULSO`                                          | no administra el maestro de fidelización                         |
| presupuesto, margen y resultado económico | `NUMERA`                                         | no publica beneficios ni ejecuta redenciones                     |
| producto y atributos maestros             | `NEXO`                                           | no crea campañas ni beneficios                                   |
| disponibilidad y capacidad operacional    | `NEXO` / `FOGO` según el hecho                   | no se convierten en datos editables de PASS o AURA               |
| publicación o métrica nativa externa      | canal externo                                    | nunca es fuente del beneficio PASS                               |

Ninguna fila autoriza escritura cruzada.

---

#### 7. Contrato conceptual mínimo de publicación

La proyección publicada deberá resolver desde fuentes autorizadas, cuando aplique:

- identidad estable del beneficio o recompensa;
- tipo de beneficio;
- regla y versión vigentes;
- condiciones de aplicación;
- vigencia o expiración;
- límites y exclusiones;
- relación con puntos, recompensa, cupón, nivel, membresía o cortesía según corresponda;
- alcance de marca, sede, canal o cliente cuando la regla ya lo establezca;
- referencias autorizadas a producto u oferta;
- estado necesario para no presentar como utilizable algo vencido, usado, cancelado o no disponible;
- referencia de campaña únicamente cuando exista una correlación autorizada;
- información suficiente para que una consumidora solicite validación sin copiar el maestro.

Esta lista es conceptual. No define campos físicos, nombres de API ni estructuras de almacenamiento.

---

#### 8. Publicación y versión

La proyección visible deberá corresponder a una regla de beneficio identificable y versionada.

Se preserva:

```text
BENEFICIO
→ REGLA
→ VERSIÓN
→ VIGENCIA
→ PROYECCIÓN
```

Invariantes:

1. una modificación posterior no reescribe la regla utilizada por un movimiento o redención anterior;
2. una campaña nueva no cambia silenciosamente la versión de un beneficio existente;
3. un cambio de nombre, condición, vigencia, límite o exclusión debe conservar la versión aplicable;
4. una proyección desactualizada no se convierte en autoridad por haber sido mostrada anteriormente;
5. la historia de fidelización conserva la regla y versión del efecto realmente aplicado.

---

#### 9. Visibilidad y elegibilidad

Se conserva obligatoriamente:

```text
VISIBLE
≠
ELEGIBLE
```

Mostrar un beneficio significa que PASS puede presentarlo al cliente conforme al contrato vigente. No significa que todas las condiciones necesarias para utilizarlo estén satisfechas en el instante de la transacción.

La elegibilidad efectiva podrá depender de reglas ya autorizadas sobre:

- cliente o cuenta;
- marca o sede;
- vigencia;
- beneficio o recompensa;
- saldo o reserva aplicable;
- límites y exclusiones;
- pedido o venta;
- condiciones comerciales;
- disponibilidad o capacidad cuando corresponda.

La consumidora que ejecute un efecto no podrá sustituir la validación por el hecho de que el beneficio haya sido visible.

---

#### 10. Publicación y redención

Se conserva:

```text
BENEFICIO VISIBLE
≠
REDENCIÓN CREADA
≠
REDENCIÓN USADA
```

La publicación:

- no reserva puntos;
- no descuenta puntos;
- no crea una redención;
- no marca una redención como usada;
- no cancela una redención;
- no acredita una recompensa;
- no modifica el ledger.

La redención permanece gobernada por PASS y por los contratos autorizados con PULSO.

---

#### 11. Frontera con AURA

Mientras AURA continúe diferida:

1. PASS no depende de AURA para conservar sus beneficios de fidelización.
2. AURA no escribe beneficios dentro de PASS.
3. AURA no publica directamente en PASS por efecto de esta tarea.
4. AURA no crea audiencias operativas a partir del catálogo de beneficios.
5. AURA no convierte una pieza o campaña en una regla PASS.
6. AURA no activa promociones reales.
7. AURA no recibe autoridad sobre identidad, consentimiento, ledger o redención.
8. una referencia documental a AURA no demuestra una integración desplegada.

Después de una decisión formal de continuidad, `AURA-DOM-006` podrá definir intención promocional y `AURA-INT-002` el contrato autorizado con PASS, sin modificar estas fronteras.

---

#### 12. Beneficio independiente de campaña

Un beneficio PASS no necesita una campaña para existir.

Se preservan dos casos:

```text
BENEFICIO PASS
→ SIN CAMPAÑA
```

y, cuando exista correlación autorizada:

```text
CAMPAÑA AURA
→ REFERENCIA BENEFICIO PASS
```

La segunda relación no convierte:

- la campaña en beneficio;
- el beneficio en campaña;
- PASS en propietaria de campaña;
- AURA en propietaria del beneficio.

La correlación deberá poder conservarse sin duplicar el objeto de fidelización.

---

#### 13. Beneficio por campaña

Un beneficio por campaña continúa siendo un beneficio gobernado por PASS cuya relación con una campaña sirve para comunicación, atribución o análisis.

Se conserva:

```text
AURA
→ INTENCIÓN PROMOCIONAL
→ REFERENCIA A BENEFICIO PASS

PASS
→ BENEFICIO + REGLA + VERSIÓN + FIDELIZACIÓN
```

La relación no autoriza a AURA a:

- determinar el saldo del cliente;
- crear puntos;
- gastar puntos;
- confirmar redención;
- cambiar la vigencia de una regla PASS;
- sustituir la elegibilidad;
- ejecutar el descuento en la venta.

---

#### 14. Frontera con PULSO

PULSO conserva la operación comercial y no obtiene la propiedad del beneficio.

Se preserva:

```text
PASS
→ BENEFICIO Y FIDELIZACIÓN

PULSO
→ PEDIDO / VENTA / EFECTO COMERCIAL
```

La publicación en PASS no obliga a PULSO a aplicar un efecto sin validación.

`INT-MKT-003` conserva la definición específica de:

- validación comercial;
- correlación con pedido o venta;
- condiciones transaccionales;
- efecto aplicado;
- rechazo o conflicto;
- relación con la regla vigente.

`INT-MKT-002` no adelanta esas decisiones.

---

#### 15. Frontera con NUMERA

NUMERA conserva margen, presupuesto, costo, rentabilidad y resultado económico.

Por tanto:

- PASS no calcula la rentabilidad de una promoción por mostrar un beneficio;
- AURA no declara viable un beneficio únicamente por intención de campaña;
- una proyección visible no sustituye las guardas económicas aplicables;
- una redención observada no demuestra por sí sola rentabilidad;
- el resultado económico no modifica retroactivamente el ledger de fidelización.

---

#### 16. Frontera con NEXO y FOGO

Cuando un beneficio se refiera a producto, disponibilidad o capacidad, PASS deberá consumir el hecho autorizado sin convertirse en su maestro.

Se preserva:

```text
BENEFICIO
≠
PRODUCTO MAESTRO
≠
INVENTARIO
≠
CAPACIDAD PRODUCTIVA
```

PASS no podrá convertir una descripción promocional en evidencia de:

- existencia de producto;
- stock comprometible;
- capacidad de preparación;
- composición;
- disponibilidad territorial;
- restricción técnica.

La fuente propietaria del hecho conserva autoridad.

---

#### 17. Consentimiento y finalidad

La presencia de un beneficio en PASS no constituye consentimiento de Marketing.

Se conserva:

```text
CUENTA PASS
≠
CONSENTIMIENTO DE MARKETING
```

y:

```text
BENEFICIO VISIBLE
≠
AUTORIZACIÓN PARA CONTACTAR
```

Cuando un beneficio sea comunicado mediante una campaña o canal de Marketing:

- la finalidad y el canal deberán estar autorizados;
- el consentimiento aplicable deberá provenir de PASS;
- un uso, compra, visita, acumulación o redención no deberá inferirse como opt-in;
- AURA consumirá únicamente la proyección mínima autorizada.

La consulta normal del cliente sobre sus beneficios no transforma una comunicación operativa o de autoservicio en permiso para campañas.

---

#### 18. Experiencia futura de PASS

La experiencia detallada permanece reservada a las tareas propietarias de PASS:

| Materia                                               | Tarea propietaria |
| ----------------------------------------------------- | ----------------- |
| inicio de puntos y beneficios                         | `PASS-UX-002`     |
| redención visible                                     | `PASS-UX-005`     |
| catálogo de recompensas                               | `PASS-UX-007`     |
| estados pendiente, usado y cancelado                  | `PASS-UX-009`     |
| integración de acumulación                            | `PASS-INT-001`    |
| integración de redención                              | `PASS-INT-002`    |
| administración laboral de productos de fidelización   | `PASS-INT-003`    |
| administración laboral de clientes cuando corresponda | `PASS-INT-004`    |
| separación cliente-trabajador                         | `PASS-INT-005`    |
| prueba completa de acumulación                        | `PASS-QA-001`     |
| prueba completa de redención                          | `PASS-QA-002`     |

Esta tarea no diseña esas pantallas, acciones ni pruebas.

---

#### 19. Administración de beneficios

La autoridad para crear, modificar, activar, retirar o administrar productos de fidelización no se infiere desde la posibilidad de verlos en PASS.

`PASS-INT-003` conserva la definición de administración laboral correspondiente.

Hasta que esa tarea y la autorización aplicable se materialicen:

- la existencia de un catálogo no concede permiso administrativo;
- una pantalla de cliente no concede autoridad laboral;
- una cuenta PASS no equivale a perfil de trabajador;
- una campaña no concede autoridad administrativa;
- una integración no concede permiso de edición por sí sola.

---

#### 20. Corrección, retiro y vencimiento

La corrección de un beneficio preservará historia.

Se conserva:

```text
CORREGIR PROYECCIÓN
≠
REESCRIBIR LEDGER
```

```text
RETIRAR VISIBILIDAD
≠
ANULAR MOVIMIENTO HISTÓRICO
```

```text
VENCER BENEFICIO
≠
BORRAR REDENCIÓN
```

Toda modificación deberá respetar la regla y versión que originaron movimientos anteriores. Los efectos que requieran reversión o compensación utilizarán el mecanismo propietario correspondiente y no se producirán por ocultar contenido.

---

#### 21. Idempotencia y conciliación

La publicación no crea una excepción a las reglas transversales de idempotencia.

Cuando una integración futura sincronice una referencia de beneficio o campaña:

- un reintento no deberá crear otro beneficio empresarial;
- una respuesta perdida no justificará duplicar una redención;
- la misma operación estable deberá poder recuperar su resultado;
- un identificador reutilizado con contenido incompatible deberá producir conflicto;
- una proyección divergente deberá reconciliarse contra la fuente PASS;
- una promoción sin regla aplicable deberá permanecer sin efecto transaccional.

No se define infraestructura física para estas garantías.

---

#### 22. Auditoría mínima futura

Cuando la capacidad quede materializada por sus tareas propietarias, deberá poder reconstruirse, según aplicabilidad:

- beneficio y tipo;
- regla y versión;
- vigencia;
- condiciones, límites y exclusiones;
- fuente de los hechos externos usados;
- proyección visible;
- cuenta o relación PASS cuando corresponda;
- campaña correlacionada cuando exista;
- pedido o venta correlacionados cuando exista efecto;
- movimiento o redención asociados;
- actor o sistema que produjo el efecto;
- reversión o compensación;
- resultado y evidencia.

La auditoría no convierte la proyección en fuente de verdad.

---

#### 23. Sin nueva máquina de estados

`INT-MKT-002` no crea una máquina de estados adicional para beneficios.

Se conservan las responsabilidades ya reservadas:

- el ledger y la fidelización permanecen en PASS;
- la experiencia de redención visible permanece en `PASS-UX-005`;
- la diferenciación de pendiente, usado y cancelado permanece en `PASS-UX-009`;
- los estados de campaña permanecen separados bajo `VPROC-0056`;
- los estados comerciales permanecen separados en PULSO.

No se introducen equivalencias entre estos ciclos.

---

#### 24. Sin nueva definición normal de evento

Esta tarea no crea una definición normal de evento empresarial.

Los contratos futuros deberán reutilizar las identidades y eventos canónicos aprobados o crear los que correspondan únicamente en su tarea propietaria.

La necesidad de correlacionar campaña, beneficio, redención y venta no autoriza crear un evento transversal improvisado desde `INT-MKT-002`.

---

#### 25. Frontera de implementación posterior

| Materia                                     | Tarea propietaria posterior    | Condición de salida                                       |
| ------------------------------------------- | ------------------------------ | --------------------------------------------------------- |
| diseño visible de puntos y beneficios       | `PASS-UX-002`                  | inicio de fidelización queda diseñado                     |
| catálogo de recompensas                     | `PASS-UX-007`                  | catálogo visible queda diseñado                           |
| redención y estados visibles                | `PASS-UX-005`; `PASS-UX-009`   | experiencia de uso y estados queda definida               |
| acumulación PULSO → PASS                    | `PASS-INT-001`                 | contrato de acumulación queda definido                    |
| redención PULSO → PASS                      | `PASS-INT-002`                 | contrato de redención queda definido                      |
| administración de productos de fidelización | `PASS-INT-003`                 | autoridad administrativa queda definida                   |
| identidad cliente-trabajador                | `PASS-INT-004`; `PASS-INT-005` | proyecciones y separación de identidades quedan definidas |
| campañas, promociones y guardas             | `AURA-DOM-006`                 | solo después de la puerta AURA                            |
| contrato AURA con PASS                      | `AURA-INT-002`                 | lectura o eventos internos quedan definidos               |
| validación comercial                        | `INT-MKT-003`                  | PULSO valida el efecto sin apropiarse del beneficio       |
| prueba E2E de acumulación                   | `PASS-QA-001`                  | flujo queda probado con evidencia                         |
| prueba E2E de redención                     | `PASS-QA-002`                  | flujo queda probado con evidencia                         |

Ningún pendiente material de esta definición queda sin tarea propietaria.

---

#### 26. Diagnóstico documental actual

El estado demostrable en la línea base de esta tarea es:

```text
INT-MKT-001 = APROBADA
INT-MKT-002 = TAREA ACTUAL
INT-MKT-003 = RESERVADA

PASS = PROPIETARIA DE VPROC-0045
PASS-UX / PASS-INT / PASS-QA = PENDIENTES
AURA = DIFERIDA
AURA-DOM / AUTH / UX / INT = BLOQUEADAS POR SU PUERTA
CAMBIOS FÍSICOS DE ESTA TAREA = 0
```

El registro 04A vigente ya contiene cobertura para propiedad, versión, idempotencia, fidelización, campañas e integración. Esta tarea no declara implementada ninguna pantalla, regla, integración o redención.

---

#### 27. Prohibiciones

Queda prohibido interpretar esta tarea como autorización para:

1. crear beneficios reales;
2. modificar beneficios existentes;
3. acreditar o descontar puntos;
4. crear o validar redenciones;
5. publicar campañas;
6. habilitar AURA;
7. contactar clientes;
8. inferir consentimiento;
9. crear segmentos de Marketing;
10. cambiar precios;
11. aplicar descuentos;
12. alterar pedidos o ventas;
13. cambiar margen o presupuesto;
14. modificar producto, stock o capacidad;
15. crear una fuente de beneficios dentro de AURA;
16. crear una fuente de campañas dentro de PASS;
17. mantener un ledger paralelo en PULSO;
18. copiar una regla mutable de PASS como maestro de otra aplicación;
19. tratar visibilidad como elegibilidad;
20. tratar elegibilidad como redención;
21. tratar redención como venta;
22. tratar beneficio por campaña como campaña;
23. tratar un QR personal como autorización de canje;
24. crear estados nuevos de fidelización;
25. crear una definición normal de evento;
26. crear nombres físicos de tablas, columnas, RPC, funciones, triggers, endpoints, colas o jobs;
27. modificar código, SQL, migraciones, RLS, datos, Supabase, credenciales o configuración remota;
28. iniciar o desarrollar `INT-MKT-003`.

---

#### 28. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `INT-MKT-002` no introduce un comportamiento ejecutable nuevo ni modifica una obligación verificable existente. Materializa la frontera documental ya protegida por `TREQ-PASS-006`, `TREQ-PASS-008` y `TREQ-PASS-010` para consistencia de recompensas, ledger, reglas versionadas, idempotencia y redención; por `TREQ-AURA-001` y `TREQ-AURA-003` para separación de campaña, promoción, beneficio y ejecución; por `TREQ-PROC-021` para impedir duplicidad de propiedad; y por `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-006` y `TREQ-INTEGRATION-019` para idempotencia, fuente única y contratos de marketing. Crear otro requisito repetiría cobertura ya vigente sin añadir una regla verificable material nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 29. Cobertura de prueba existente preservada

Se preserva sin modificación:

- `TREQ-PASS-006`, para convergencia de recompensas e historial entre experiencias;
- `TREQ-PASS-008`, para acumulación, gasto, ajuste, reversión y redención mediante contratos autorizados, atómicos e idempotentes;
- `TREQ-PASS-010`, para identidad, consentimiento, reglas versionadas, ledger inmutable y saldo como proyección;
- `TREQ-AURA-001`, para separar campaña, contenido, publicación y promoción y conservar las fuentes propietarias;
- `TREQ-AURA-003`, para promociones, redenciones y fronteras AURA/PULSO/PASS/NUMERA;
- `TREQ-PROC-021`, para impedir duplicidad de fidelización entre aplicaciones;
- `TREQ-INTEGRATION-003`, para idempotencia, reintento, estado durable y conciliación;
- `TREQ-INTEGRATION-006`, para una única fuente empresarial y propagación por contrato;
- `TREQ-INTEGRATION-019`, para marketing, promociones, cupones, redenciones, contratos internos y conciliación.

Ninguna fila cambia de identidad, texto, estado, relación, propietaria, evidencia ni secuencia por esta tarea.

---

#### 30. Decisiones congeladas

1. PASS conserva identidad, consentimiento, fidelización y ledger.
2. PASS conserva la superficie de beneficios del cliente.
3. AURA conserva intención promocional y campaña únicamente cuando su continuidad esté autorizada.
4. PULSO conserva pedido, venta y efecto comercial.
5. NUMERA conserva verdad económica.
6. NEXO conserva producto e inventario.
7. FOGO/NEXO conservan capacidad según el hecho.
8. beneficio publicado no equivale a campaña.
9. beneficio publicado no equivale a elegibilidad.
10. elegibilidad no equivale a redención.
11. redención no equivale a descuento aplicado ni venta.
12. puntos, recompensa, cupón, nivel, membresía, promoción, cortesía y beneficio por campaña permanecen distintos.
13. un beneficio PASS puede existir sin campaña.
14. una campaña puede correlacionar un beneficio sin apropiárselo.
15. AURA no modifica ledger ni saldo.
16. PASS no administra campañas por mostrar beneficios.
17. PULSO no mantiene un maestro paralelo de fidelización.
18. la proyección visible se resuelve desde beneficio, regla y versión autorizados.
19. los cambios no reescriben historia.
20. ocultar o retirar una proyección no revierte efectos por sí mismo.
21. la administración permanece en `PASS-INT-003`.
22. la experiencia permanece en `PASS-UX-*`.
23. las integraciones de acumulación y redención permanecen en `PASS-INT-001` y `PASS-INT-002`.
24. la integración futura AURA ↔ PASS permanece en `AURA-INT-002`.
25. la validación comercial permanece en `INT-MKT-003`.
26. no se crea una máquina de estados nueva.
27. no se crea una definición normal de evento.
28. se crean cero cambios `TREQ-*`.
29. no se modifica el registro 04A.
30. se crean cero objetos físicos.
31. se modifican cero objetos físicos.
32. no se modifica código, SQL, migraciones, datos, Supabase, credenciales ni configuración remota.

---

#### 31. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `INT-MKT-001` como tarea anterior;
2. conserva `INT-MKT-003` como única tarea siguiente reservada;
3. identifica `VPROC-0045` como proceso propietario de fidelización;
4. mantiene PASS como propietaria del beneficio y su proyección visible;
5. mantiene AURA como propietaria objetivo de intención promocional y campaña, sujeta a su puerta;
6. mantiene PULSO como propietaria de la operación comercial;
7. mantiene NUMERA como autoridad económica;
8. distingue beneficio definido de beneficio publicado;
9. distingue publicación de elegibilidad;
10. distingue elegibilidad de redención;
11. distingue redención de descuento aplicado y venta;
12. preserva la taxonomía de puntos, recompensa, cupón, nivel, membresía, promoción, cortesía y beneficio por campaña;
13. permite beneficios PASS sin campaña;
14. permite correlación con campaña sin transferencia de propiedad;
15. impide que AURA cree o modifique ledger, saldo, puntos o redenciones;
16. impide que PASS se convierta en sistema de campañas;
17. impide que PULSO mantenga fidelización paralela;
18. conserva regla y versión como base de la proyección;
19. preserva historia ante cambios, retiro o vencimiento;
20. conserva fuentes propietarias de producto, disponibilidad, capacidad y economía;
21. preserva consentimiento y finalidad;
22. mantiene `PASS-UX-002`, `PASS-UX-005`, `PASS-UX-007` y `PASS-UX-009` como propietarias de experiencia posterior;
23. mantiene `PASS-INT-001` a `PASS-INT-005` como propietarias de integraciones y administración posterior;
24. mantiene `PASS-QA-001` y `PASS-QA-002` como pruebas futuras;
25. mantiene `AURA-DOM-006` y `AURA-INT-002` bloqueadas por la puerta AURA;
26. reserva `INT-MKT-003` para validación comercial;
27. crea cero definiciones normales de evento;
28. crea cero requisitos de prueba;
29. modifica cero requisitos de prueba;
30. no modifica el registro canónico de requisitos;
31. crea cero objetos físicos;
32. modifica cero objetos físicos;
33. no modifica código, SQL, migraciones, Supabase, datos, credenciales ni configuración remota;
34. no inicia ni desarrolla `INT-MKT-003`.

---

#### 32. Resultado de la tarea

`INT-MKT-002` queda definida como el contrato permanente que permite representar beneficios de fidelización en PASS sin confundir visibilidad con autoridad transaccional ni marketing con fidelización.

Resultado consolidado:

```text
PASS
→ BENEFICIO + REGLA + VERSIÓN
→ PROYECCIÓN VISIBLE AL CLIENTE
```

sin producir por sí mismo:

```text
ELEGIBILIDAD CONFIRMADA
REDENCIÓN
DESCUENTO
VENTA
CAMPAÑA
```

y, cuando una campaña autorizada se relacione con el beneficio:

```text
AURA
→ INTENCIÓN PROMOCIONAL + CORRELACIÓN

PASS
→ BENEFICIO + FIDELIZACIÓN

PULSO
→ VALIDACIÓN Y EFECTO COMERCIAL

NUMERA
→ RESULTADO ECONÓMICO
```

sin transferencia de propiedad ni fuentes competidoras.

---

#### 33. Continuidad

ÚLTIMA TAREA APROBADA

`INT-MKT-001 — Definir campañas solo después de aprobar AURA`

TAREA ACTUAL APROBADA

`INT-MKT-002 — Definir beneficios publicados en PASS`

SIGUIENTE TAREA RESERVADA

`INT-MKT-003 — Definir validación comercial desde PULSO`


### ✅ INT-MKT-003 — Definir validación comercial desde PULSO

**Estado:** APROBADA
**Tarea anterior:** `INT-MKT-002 — Definir beneficios publicados en PASS`
**Tarea siguiente:** `QUEUE-ARC-001 — Inventariar colas, cron, jobs y automatizaciones existentes`
**Tipo de tarea:** documental; definición normativa permanente del contrato mediante el cual PULSO valida, dentro de una operación comercial concreta, si una promoción, cupón, beneficio, recompensa o redención puede producir un efecto sobre pedido o venta, preservando a PASS como propietaria de fidelización, a AURA como propietaria objetivo de intención de marketing cuando su continuidad sea autorizada, a NUMERA como autoridad económica y a PULSO como propietaria de la transacción comercial, sin crear maestros paralelos ni asumir que visibilidad, campaña o elegibilidad equivalen a descuento aplicado o venta
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/08_MARKETING_BENEFICIOS_Y_VALIDACION_COMERCIAL.md`
**Proceso de fidelización reutilizado:** `VPROC-0045 — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados`
**Proceso relacionado de marketing:** `VPROC-0056 — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro`
**Aplicación propietaria de la operación comercial:** `PULSO`
**Aplicación propietaria de fidelización:** `PASS`
**Aplicación objetivo de marketing:** `AURA`, sujeta a `AURA-AUD-001` a `AURA-AUD-012`
**Autoridad económica:** `NUMERA`
**Línea base documental:** `vento-shell@4a72fc81cc2d3d67d3e19bc6d7fa3a15a94d0c05`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir la validación comercial que PULSO debe realizar antes de materializar un efecto promocional o de fidelización dentro de un pedido o una venta.

La regla raíz es:

```text
BENEFICIO O PROMOCIÓN CONOCIDOS
≠
CONDICIONES COMERCIALES VÁLIDAS
≠
EFECTO APLICABLE
≠
EFECTO APLICADO
≠
VENTA CERRADA
```

Para fidelización se conserva además:

```text
BENEFICIO VISIBLE EN PASS
≠
ELEGIBILIDAD CONFIRMADA
≠
REDENCIÓN VÁLIDA
≠
EFECTO COMERCIAL APLICABLE
≠
EFECTO COMERCIAL APLICADO
```

Y para marketing:

```text
CAMPAÑA O INTENCIÓN AURA
≠
REGLA TRANSACCIONAL
≠
DESCUENTO O BENEFICIO APLICADO EN PULSO
```

PULSO valida la transacción que administra. No adquiere por ello propiedad sobre el beneficio PASS, la campaña AURA, el ledger de fidelización, la verdad económica de NUMERA ni los maestros de producto, inventario o capacidad.

---

#### 2. Resultado sustantivo

`INT-MKT-003` congela las siguientes decisiones:

1. PULSO es la aplicación propietaria de la validación comercial dentro del pedido o la venta.
2. Validar comercialmente no significa crear ni editar la campaña que originó una intención promocional.
3. Validar comercialmente no significa crear ni editar el beneficio de fidelización.
4. PULSO no mantendrá un saldo, ledger, consentimiento, recompensa o redención paralelo a PASS.
5. PULSO no mantendrá una campaña, pieza, calendario o atribución paralelos a AURA.
6. Una campaña podrá aportar correlación o intención, pero nunca sustituirá la regla que debe validar PULSO.
7. Un beneficio visible en PASS podrá ser presentado al cliente sin que PULSO lo considere automáticamente aplicable.
8. Una elegibilidad informada por PASS no sustituye las condiciones comerciales de la venta.
9. Una redención válida no sustituye las comprobaciones de pedido, línea, precio, sede, canal, modalidad, actor y estado que correspondan.
10. Una promoción podrá ser válida documentalmente y resultar no aplicable a una transacción concreta.
11. Una venta válida podrá existir sin campaña, beneficio o cliente identificado cuando el proceso comercial aprobado lo permita.
12. La denegación de un beneficio no invalida automáticamente una venta que pueda continuar legítimamente sin ese efecto.
13. PULSO solo aplicará efectos comerciales mediante acciones de servidor autorizadas y auditables.
14. Ningún parámetro de interfaz, URL, código visible, texto promocional o estado local podrá otorgar autoridad comercial por sí solo.
15. El acceso general a PULSO no concede automáticamente autoridad para descuento, acumulación, redención, anulación o cambio de precio.
16. La sede enviada por el cliente no amplía el territorio autorizado del actor.
17. En terminal compartida deberá conservarse la identidad del trabajador real que ejecuta la acción sensible.
18. La operación deberá conservar una referencia estable e idempotente para impedir efectos duplicados.
19. El mismo hecho comercial reintentado no podrá aplicar dos veces el mismo descuento, beneficio, redención o movimiento de puntos.
20. El mismo identificador de operación con contenido materialmente distinto deberá producir conflicto, no una segunda aplicación silenciosa.
21. Una respuesta perdida o un resultado desconocido deberá reconciliarse antes de repetir un efecto sensible.
22. PULSO no mostrará un efecto como aplicado antes de recibir confirmación válida del servidor propietario correspondiente.
23. El descuento, beneficio, cupón o recompensa aplicado deberá quedar vinculado con la regla y versión utilizadas para reconstruir la transacción.
24. El snapshot comercial de la línea conservará el efecto realmente aplicado sin depender de cambios futuros de precio, beneficio o campaña.
25. Cambiar una promoción, beneficio o regla después de la venta no reescribirá la venta histórica.
26. Anulación, devolución, reembolso, compensación y reversión de fidelización permanecerán efectos distintos y coordinados.
27. Una reversión comercial no borrará la historia del beneficio o redención original.
28. PASS seguirá siendo la autoridad para acumulación, redención y ledger.
29. NUMERA seguirá siendo la autoridad para margen, presupuesto, costo y resultado económico.
30. NEXO y FOGO seguirán aportando, cuando corresponda, hechos autorizados de producto, disponibilidad o capacidad sin transferir su propiedad a PULSO.
31. AURA seguirá diferida hasta superar su puerta de continuidad; `INT-MKT-003` no depende de que AURA esté operativa para validar beneficios PASS o reglas comerciales ya autorizadas.
32. Cuando AURA exista operativamente, su referencia de campaña será correlación y atribución, no autoridad para aplicar el efecto.
33. No se crean nombres físicos de tablas, columnas, funciones, RPC, endpoints, eventos, colas, triggers o jobs.
34. No se crean ni modifican requisitos `TREQ-*`.

---

#### 3. Base canónica consumida

Esta tarea consume sin reabrir:

- `INT-MKT-001`, que separa campaña, contenido, publicación, promoción, beneficio y regla transaccional;
- `INT-MKT-002`, que mantiene el beneficio y su proyección bajo PASS y reserva a PULSO la validación del efecto comercial;
- `CAP-SCOPE-009`, que mantiene a PULSO como propietaria de pedido, venta, cobro, caja y ejecución comercial;
- `CAP-SCOPE-010`, especialmente `CAP-10.07 — Gestionar fidelización y beneficios`;
- `CAP-SCOPE-014`, especialmente `CAP-14.06 — Gestionar promociones y cupones`;
- `VPROC-0045`, propiedad de PASS con PULSO como consumidora que solicita efectos durante la venta;
- `VPROC-0056`, propiedad objetivo de AURA con PULSO como consumidora que aplica promociones en la venta;
- `GAP-OWN-006`, que impide a PULSO mantener saldo, consentimiento o identidad de fidelización paralelos;
- `PULSO-AUTH-006` a `PULSO-AUTH-013` y `PULSO-AUTH-016`;
- `PULSO-UX-007` a `PULSO-UX-014` y `PULSO-UX-016` a `PULSO-UX-019`;
- `PASS-INT-001` a `PASS-INT-005`;
- `PASS-QA-001` y `PASS-QA-002`;
- `AURA-DOM-006` y `AURA-INT-002`, que permanecen sujetas a la puerta de AURA;
- la cobertura vigente de `TREQ-PULSO-004`, `TREQ-PULSO-005`, `TREQ-PULSO-006`, `TREQ-PASS-008`, `TREQ-PASS-010`, `TREQ-PASS-022`, `TREQ-PASS-025`, `TREQ-PASS-026`, `TREQ-PASS-027`, `TREQ-PASS-029`, `TREQ-PASS-032`, `TREQ-AURA-003`, `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-006`, `TREQ-INTEGRATION-014`, `TREQ-INTEGRATION-015` y `TREQ-INTEGRATION-019`.

Ninguna de estas fuentes cambia de identidad o propietario por esta tarea.

---

#### 4. Definición normativa de validación comercial

La validación comercial es la decisión que PULSO debe obtener o producir, dentro de una operación concreta, para determinar si una regla promocional o de fidelización puede modificar legítimamente el resultado comercial de un pedido o una venta.

Debe responder, según aplicabilidad:

```text
¿QUÉ REGLA SE INTENTA APLICAR?
¿A QUÉ PEDIDO, VENTA O LÍNEA?
¿BAJO QUÉ VERSIÓN?
¿PARA QUÉ SEDE, CANAL Y MODALIDAD?
¿PARA QUÉ CLIENTE O CONSUMIDOR FINAL?
¿QUIÉN EJECUTA LA ACCIÓN?
¿TIENE AUTORIDAD?
¿EL ESTADO ACTUAL PERMITE EL EFECTO?
¿SE CUMPLEN LAS CONDICIONES DE LA REGLA?
¿EL EFECTO YA FUE APLICADO?
¿EL RESULTADO QUEDÓ CONFIRMADO?
```

La validación no crea la regla. Comprueba su aplicabilidad a la transacción y conserva evidencia del resultado.

---

#### 5. Cadena canónica de responsabilidades

La cadena queda definida así:

```text
AURA
→ intención promocional y correlación de campaña, cuando corresponda

PASS
→ identidad, consentimiento, beneficio, regla de fidelización,
  elegibilidad y ledger

PULSO
→ pedido, venta, condiciones comerciales,
  validación de aplicabilidad y efecto aplicado

NUMERA
→ guardas económicas y resultado económico

NEXO / FOGO
→ hechos autorizados de producto, disponibilidad o capacidad
```

Ninguna aplicación podrá resolver por sí sola las responsabilidades de las demás.

---

#### 6. Propiedad empresarial

| Materia                                   | Propietaria o autoridad         | Frontera obligatoria                                           |
| ----------------------------------------- | ------------------------------- | -------------------------------------------------------------- |
| pedido, línea, venta y snapshot comercial | `PULSO`                         | no copia el maestro de fidelización ni de campaña              |
| validación de efecto sobre la transacción | `PULSO`                         | valida el contexto comercial y consume decisiones propietarias |
| identidad, consentimiento y fidelización  | `PASS`                          | no modifica pedido, precio o caja por sí sola                  |
| beneficio, recompensa, redención y ledger | `PASS`                          | PULSO solicita y consume el resultado autorizado               |
| intención promocional y campaña           | `AURA`, cuando supere su puerta | no aplica directamente descuento ni redención                  |
| margen, presupuesto y resultado económico | `NUMERA`                        | PULSO consume guardas cuando la regla las exija                |
| producto y atributos maestros             | `NEXO`                          | PULSO consume proyecciones autorizadas                         |
| inventario y disponibilidad física        | `NEXO`                          | no se convierte en regla comercial editable                    |
| capacidad productiva                      | `FOGO`                          | no decide la promoción ni el descuento                         |
| publicación o métrica externa             | canal externo                   | no concede autoridad transaccional                             |

Ninguna fila autoriza escritura cruzada.

---

#### 7. Separación de conceptos comerciales

Se conserva obligatoriamente:

```text
PRECIO BASE
≠
PRECIO PUBLICADO
≠
PROMOCIÓN
≠
CONVENIO
≠
BENEFICIO
≠
CUPÓN
≠
REDENCIÓN
≠
DESCUENTO AUTORIZADO
≠
PRECIO APLICADO
≠
TOTAL DE VENTA
```

También:

```text
DESCUENTO
≠
SERVICIO
≠
PROPINA
≠
RECARGO
≠
COMPENSACIÓN
≠
REEMBOLSO
```

PULSO deberá mantener estas diferencias al calcular y conservar el resultado comercial.

---

#### 8. Punto de validación dentro de la operación

La validación comercial debe ocurrir antes de materializar el efecto que modifica el pedido o la venta.

La secuencia conceptual es:

```text
PEDIDO O VENTA EN ESTADO APLICABLE
        ↓
REGLA O BENEFICIO REFERENCIADO
        ↓
RESOLUCIÓN DE FUENTES PROPIETARIAS
        ↓
VALIDACIÓN DE AUTORIDAD Y CONTEXTO
        ↓
VALIDACIÓN DE CONDICIONES
        ↓
CONFIRMACIÓN DEL RESULTADO PROPIETARIO
        ↓
APLICACIÓN DEL EFECTO COMERCIAL EN PULSO
        ↓
SNAPSHOT Y EVIDENCIA
```

La interfaz no podrá saltar directamente desde una pieza, código o beneficio visible hasta el descuento aplicado.

---

#### 9. Identidad de la operación

Toda validación sensible deberá vincularse con una operación empresarial estable.

Según el caso, la correlación deberá permitir reconstruir:

- pedido o venta;
- revisión del pedido;
- línea o conjunto de líneas afectadas;
- sede;
- canal;
- modalidad;
- terminal o dispositivo cuando corresponda;
- actor efectivo;
- cliente cuando la regla lo requiera;
- regla, beneficio, cupón, recompensa o redención;
- versión utilizada;
- efecto solicitado;
- resultado confirmado.

No se define aquí la forma física de esos identificadores. Su materialización queda distribuida exclusivamente entre las tareas exactas enumeradas en la sección 38.

---

#### 10. Autoridad laboral y sesión

Antes de una acción sensible, PULSO deberá revalidar la autoridad efectiva.

Se preserva:

```text
ACCESO A PULSO
≠
PERMISO PARA DESCUENTO
≠
PERMISO PARA ACUMULACIÓN
≠
PERMISO PARA REDENCIÓN
≠
PERMISO PARA ANULACIÓN
```

La decisión deberá considerar, según el contrato de autorización vigente:

- principal autenticado;
- actor humano efectivo;
- permiso exacto;
- sede efectiva;
- turno o contexto operativo cuando aplique;
- dispositivo compartido cuando aplique;
- recurso y estado actual;
- firma del trabajador real para acciones que la exijan.

Una sesión administrativa o un permiso general no podrá transferir autoridad a otro actor.

---

#### 11. Territorio, sede y canal

La sede y el canal forman parte de la validación cuando la regla los utilice.

Invariantes:

1. `site_id` enviado por cliente no amplía territorio;
2. una regla válida en una sede no se asume válida en otra;
3. una regla válida para un canal no se asume válida para todos;
4. una regla válida para salón no se asume válida para recogida, domicilio o canal externo;
5. una campaña multicanal no elimina restricciones particulares de cada oferta o beneficio;
6. una redención de otra sede se rechaza cuando el contrato PASS la limite territorialmente.

---

#### 12. Cliente identificado y consumidor final

La validación deberá respetar la decisión comercial de que una venta puede existir sin cliente identificado cuando el proceso lo permita.

Por tanto:

```text
VENTA VÁLIDA
≠
CLIENTE PASS OBLIGATORIO
```

Pero también:

```text
BENEFICIO QUE REQUIERE IDENTIDAD
→
IDENTIDAD PASS RESUELTA Y VÁLIDA
```

PULSO no creará una cuenta ficticia para satisfacer una regla. Si el efecto exige identidad, consentimiento, saldo o relación PASS y estos no pueden resolverse, el efecto no se aplicará por inferencia.

---

#### 13. Beneficio visible y elegibilidad

`INT-MKT-002` conserva:

```text
VISIBLE
≠
ELEGIBLE
```

`INT-MKT-003` añade la frontera comercial:

```text
ELEGIBLE EN PASS
≠
APLICABLE A ESTA VENTA EN PULSO
```

PULSO deberá comprobar las condiciones comerciales de la transacción aunque PASS pueda indicar que el beneficio existe o que el cliente satisface condiciones propias de fidelización.

---

#### 14. Regla, versión y vigencia

La validación deberá utilizar una regla identificable y una versión aplicable.

Se conserva:

```text
REGLA
→ VERSIÓN
→ VIGENCIA
→ CONDICIONES
→ VALIDACIÓN
→ EFECTO
```

Queda prohibido:

- aplicar la versión más reciente a una operación histórica por conveniencia;
- aceptar una regla vencida porque permanezca visible en caché;
- modificar retrospectivamente el efecto de una venta por cambiar la regla;
- usar un texto promocional como sustituto de la regla versionada;
- asumir que la campaña vigente determina el precio aplicado sin contrato comercial.

---

#### 15. Condiciones mínimas de aplicabilidad

Sin crear nuevos campos físicos ni una taxonomía paralela, PULSO deberá poder evaluar las condiciones que la regla aprobada declare, entre ellas cuando correspondan:

- vigencia temporal;
- marca;
- sede;
- canal;
- modalidad;
- cliente o segmento autorizado;
- producto, categoría, presentación u oferta;
- cantidades mínimas o máximas;
- importe o umbral comercial;
- límites de uso;
- exclusiones;
- compatibilidad con otros beneficios o promociones;
- disponibilidad o capacidad cuando sean condición material;
- presupuesto o margen cuando exista una guarda económica aprobada;
- estado del pedido, venta, cupón o redención;
- permisos y autoridad del actor.

La ausencia de una condición requerida no equivale a aprobación.

---

#### 16. Productos, oferta y precio

PULSO deberá aplicar la validación contra la oferta autorizada y conservar un snapshot suficiente para reconstruir la venta.

La cadena aprobada permanece:

```text
PRODUCTO / ÍTEM
→ OFERTA POR SEDE Y CANAL
→ PRECIO BASE
→ PRECIO PUBLICADO
→ PROMOCIÓN O CONVENIO
→ DESCUENTO AUTORIZADO
→ SNAPSHOT APLICADO A LA LÍNEA
```

La regla comercial no podrá:

- convertir un producto inactivo en vendible mediante payload manipulado;
- sustituir un precio histórico por el actual;
- usar una oferta de otra sede o canal;
- confundir descuento con impuesto, servicio, propina o recargo;
- alterar directamente el maestro de producto.

---

#### 17. Beneficios y recompensas de PASS

Cuando el efecto provenga de PASS:

1. PULSO resolverá la identidad necesaria mediante contrato de servidor;
2. consumirá la regla, versión y estado autorizados;
3. no calculará un saldo paralelo;
4. no insertará movimientos directamente en el ledger;
5. no marcará una redención como usada mediante una copia local;
6. no inferirá elegibilidad solo por haber mostrado el beneficio;
7. no aplicará un efecto si PASS rechaza la operación propietaria correspondiente;
8. conservará la correlación entre la operación comercial y el resultado PASS.

---

#### 18. Acumulación de puntos

La acumulación es un efecto de fidelización posterior o correlacionado con un hecho comercial elegible; no es un descuento sobre la venta.

PULSO deberá:

- identificar la compra elegible;
- conservar monto y moneda del hecho que origina la solicitud cuando correspondan;
- usar la regla vigente autorizada;
- identificar actor, sede y dispositivo según el contexto;
- usar una referencia empresarial estable e idempotente;
- solicitar el movimiento a PASS mediante servidor;
- considerar aplicado el efecto solo cuando PASS confirme el resultado;
- reutilizar la misma referencia ante reintento del mismo hecho.

PULSO no fijará directamente el saldo final.

---

#### 19. Redención de puntos o recompensa

Cuando una transacción utilice una redención, deberán mantenerse separados:

```text
SOLICITUD DE REDENCIÓN
≠
REDENCIÓN VÁLIDA EN PASS
≠
EFECTO COMERCIAL APLICABLE EN PULSO
≠
EFECTO APLICADO
```

La validación deberá respetar, según el contrato PASS vigente:

- código o identidad de redención;
- cliente;
- recompensa;
- sede;
- estado pendiente aplicable;
- vigencia;
- saldo debitado o reservado cuando corresponda;
- actor efectivo;
- no utilización previa.

Una redención usada, cancelada, vencida o territorialmente inválida no producirá un efecto comercial nuevo.

---

#### 20. Cupones y promociones

Un cupón o promoción no constituye autoridad por su sola presentación.

Se conserva:

```text
CÓDIGO O REFERENCIA
≠
REGLA VÁLIDA
≠
APLICABILIDAD
≠
DESCUENTO APLICADO
```

PULSO deberá resolver la regla autorizada y validar sus condiciones contra la transacción real.

Cuando exista relación con AURA, la referencia de campaña podrá conservarse para atribución, pero no sustituye la regla ni concede un descuento.

---

#### 21. AURA diferida y validación independiente

Mientras AURA permanezca diferida:

- PULSO puede validar reglas comerciales y beneficios PASS que ya pertenezcan a contratos aprobados;
- no necesita crear una campaña AURA para ejecutar una venta válida;
- no inventará una campaña para justificar un descuento;
- no copiará estructuras futuras de AURA;
- no usará un launcher, placeholder o permiso reservado como fuente de promoción;
- no ampliará superficies transitorias para llenar el dominio AURA.

La futura apertura de AURA no cambia estas fronteras.

---

#### 22. Correlación de campaña futura

Cuando la puerta de AURA haya sido superada y exista una campaña autorizada, PULSO podrá conservar una correlación para:

- identificar origen promocional;
- asociar código o referencia autorizada;
- devolver hechos de venta o redención para medición;
- permitir atribución posterior con método y confianza.

La correlación no podrá:

- cambiar el precio sin regla válida;
- crear un beneficio PASS;
- marcar una redención;
- modificar el ledger;
- declarar una venta como incremental;
- convertir correlación en causalidad.

---

#### 23. Guardas económicas

Cuando una promoción o regla exija guardas económicas, PULSO deberá consumir la decisión o los parámetros autorizados de la fuente correspondiente sin convertirse en propietario de margen, presupuesto o rentabilidad.

Se conserva:

```text
PRECIO Y EFECTO COMERCIAL
→ PULSO

MARGEN / PRESUPUESTO / COSTO / RESULTADO ECONÓMICO
→ NUMERA
```

La ausencia de una guarda económica obligatoria no se interpreta como autorización.

Un presupuesto de campaña tampoco equivale a permiso automático para aplicar descuentos.

---

#### 24. Guardas físicas y operativas

Cuando la regla dependa de disponibilidad o capacidad, PULSO consumirá hechos autorizados de NEXO o FOGO según corresponda.

Queda prohibido:

- copiar stock a una regla editable de PULSO;
- asumir que stock mayor que cero garantiza disponibilidad comercial;
- asumir que stock cero bloquea automáticamente productos preparados o bajo pedido;
- inventar capacidad productiva desde marketing;
- permitir que una campaña sustituya una restricción operacional vigente.

---

#### 25. Compatibilidad, exclusiones y acumulación de efectos

PULSO deberá aplicar únicamente la política versionada aprobada sobre compatibilidad entre efectos.

No se asumirá por defecto que:

- dos promociones son acumulables;
- un cupón se combina con una recompensa;
- una cortesía se combina con un descuento;
- una redención puede repetirse sobre la misma operación;
- un beneficio de campaña puede sumarse a cualquier convenio;
- un precio manual puede convivir con una promoción.

Cuando la regla no permita resolver la combinación, el sistema deberá fallar cerrado para el efecto en conflicto y conservar la venta sin aplicar silenciosamente un beneficio no validado.

---

#### 26. Precio manual y excepciones

El precio manual, descuento extraordinario, cortesía, compensación o excepción comercial no se tratarán como promoción ordinaria por conveniencia.

Cada acción sensible deberá conservar:

- autoridad correspondiente;
- motivo;
- recurso afectado;
- contexto comercial;
- valor o efecto;
- evidencia mínima;
- relación con la operación original.

La existencia de una campaña no reduce el nivel de autorización exigido por una excepción.

---

#### 27. Idempotencia

La validación y el efecto comercial deberán reutilizar una referencia estable de la operación.

Se conserva:

```text
MISMA OPERACIÓN
+
MISMO CONTENIDO MATERIAL
→
MISMO RESULTADO
```

Y:

```text
MISMO IDENTIFICADOR
+
CONTENIDO MATERIAL DISTINTO
→
CONFLICTO
```

La referencia no deberá depender únicamente de tiempo, aleatoriedad o estado efímero de interfaz cuando el mismo hecho empresarial pueda reintentarse.

---

#### 28. Concurrencia y doble aplicación

Dos solicitudes concurrentes sobre el mismo beneficio, cupón, redención o descuento no podrán producir dos efectos válidos sobre la misma operación cuando la regla permita solo uno.

Los controles posteriores de implementación deberán impedir, según corresponda:

- doble descuento;
- doble redención;
- doble acreditación;
- doble reserva;
- doble compensación;
- doble reversión;
- dos snapshots incompatibles para la misma revisión de venta.

Esta tarea no selecciona el mecanismo físico de bloqueo o claim. Su materialización corresponde a `QUEUE-ARC-001` a `QUEUE-ARC-010` y a los paquetes que implementen `PASS-INT-001`, `PASS-INT-002`, `PULSO-AUTH-009` y `PULSO-AUTH-010`.

---

#### 29. Respuesta perdida y resultado desconocido

Un timeout o una respuesta perdida no significan automáticamente rechazo.

Cuando exista posibilidad de que el efecto haya ocurrido, PULSO deberá consultar o reconciliar el resultado antes de reenviar una mutación sensible.

La interfaz deberá distinguir, conforme a los contratos ya protegidos:

- error recuperable;
- duplicado;
- conflicto;
- denegación;
- resultado ya aplicado;
- resultado todavía desconocido o pendiente de conciliación cuando corresponda.

No se crea una máquina de estados nueva con esta enumeración.

---

#### 30. Confirmación de servidor

La experiencia de PULSO no podrá mostrar como hecho confirmado:

- cliente identificado;
- puntos otorgados;
- redención validada;
- beneficio aplicado;
- descuento aplicado;
- reversión completada;

antes de recibir el resultado válido del servidor propietario correspondiente.

Un mensaje local optimista no sustituye la confirmación del efecto.

---

#### 31. Snapshot comercial y reconstrucción

Una vez aplicado el efecto, el pedido o la venta deberá conservar suficiente evidencia para reconstruir el resultado comercial sin consultar reglas futuras.

La reconstrucción deberá poder explicar, según aplicabilidad:

- precio base o publicado relevante;
- regla o beneficio utilizado;
- versión;
- vigencia aplicable;
- descuento o efecto realmente aplicado;
- líneas afectadas;
- actor;
- sede y canal;
- referencia PASS o de campaña cuando exista;
- correlación idempotente;
- resultado de validación.

La forma física no pertenece al alcance documental de `INT-MKT-003`; su materialización queda distribuida exclusivamente según las tareas exactas de la sección 38.

---

#### 32. Cambios prospectivos

Los cambios de precio, regla, beneficio, promoción o campaña serán prospectivos.

Queda prohibido:

- recalcular una venta histórica con una versión nueva;
- alterar un descuento aplicado porque cambió una campaña;
- reabrir una redención usada porque el beneficio fue retirado;
- borrar la referencia original para mostrar la configuración actual;
- reconstruir historia desde una proyección mutable sin versión.

---

#### 33. Anulación, devolución, reembolso y reversión

Se mantiene la separación aprobada:

```text
CANCELACIÓN DE PEDIDO
≠
ANULACIÓN DE VENTA
≠
DEVOLUCIÓN
≠
REEMBOLSO
≠
COMPENSACIÓN
≠
REVERSIÓN DE FIDELIZACIÓN
```

Cuando una operación de venta afectada por beneficio o promoción se revierta:

1. PULSO conserva la acción comercial y su motivo;
2. PASS conserva la reversión o compensación de fidelización que corresponda;
3. NUMERA conserva el efecto económico aplicable;
4. NEXO conserva el efecto físico cuando exista;
5. las aplicaciones se coordinan mediante contratos correlacionados e idempotentes;
6. la historia original no se borra.

---

#### 34. Venta sin beneficio después de una denegación

Una regla promocional o de fidelización denegada no convierte por sí misma el pedido o venta en inválidos.

Cuando el proceso permita continuar:

```text
EFECTO DENEGADO
→
NO SE APLICA EL BENEFICIO
→
LA OPERACIÓN COMERCIAL PUEDE CONTINUAR
```

siempre que:

- el cliente o actor conozca el resultado cuando corresponda;
- el total sea recalculado sin el efecto rechazado;
- no se conserve una apariencia de beneficio aplicado;
- no se repita silenciosamente la mutación;
- ninguna otra regla obligatoria quede incumplida.

Esta regla no obliga a continuar una venta que por otra razón deba bloquearse.

---

#### 35. Evidencia mínima exigida a la implementación

Cuando esta capacidad se implemente, deberá poder reconstruirse, según aplicabilidad:

- pedido o venta;
- revisión;
- línea afectada;
- regla, beneficio, cupón, recompensa o redención;
- versión;
- actor efectivo;
- permiso;
- sede;
- terminal o dispositivo;
- cliente cuando aplique;
- fuente propietaria consultada;
- condiciones relevantes;
- referencias económicas u operativas requeridas;
- referencia de campaña cuando exista;
- decisión obtenida;
- motivo de rechazo cuando corresponda;
- efecto aplicado;
- clave o referencia idempotente;
- timestamps;
- reversión o compensación posterior;
- evidencia de conciliación ante resultados ambiguos.

La auditoría no concede autoridad ni sustituye las fuentes propietarias. Esta evidencia deberá materializarse junto con las tareas exactas y las condiciones de salida de la sección 38, no mediante una tarea paralela implícita.

---

#### 36. Privacidad y minimización

La validación comercial deberá consumir únicamente los datos de cliente necesarios para decidir el efecto.

PULSO no obtendrá por defecto:

- historial completo de fidelización;
- documento completo;
- fecha de nacimiento;
- contactos no necesarios;
- segmentos internos ajenos a la regla;
- notas de servicio;
- consentimientos no relacionados con la finalidad.

Cuando un dato sea necesario, deberá provenir de una proyección autorizada y conservar su finalidad.

---

#### 37. Dispositivo compartido

En una terminal compartida, una sesión técnica válida no sustituye la identidad del trabajador real para acciones sensibles.

Las acciones de descuento, acumulación, redención, reversión o excepción que requieran firma deberán vincular:

```text
PRINCIPAL TÉCNICO
+
ACTOR HUMANO
+
DISPOSITIVO
+
SEDE
+
PERMISO
+
RECURSO
+
RESULTADO
```

La credencial operativa del trabajador permanecerá efímera y no formará parte de la evidencia en texto claro.

---

#### 38. Frontera de implementación posterior

La materialización detallada queda distribuida así:

| Materia                             | Tarea propietaria posterior                    | Condición de salida                                                     |
| ----------------------------------- | ---------------------------------------------- | ----------------------------------------------------------------------- |
| permisos de acumulación y redención | `PULSO-AUTH-009`; `PULSO-AUTH-010`             | cada mutación de fidelización queda protegida por capacidad específica  |
| sede y contexto operativo           | `PULSO-AUTH-011`                               | el efecto no puede ejecutarse fuera del territorio autorizado           |
| terminal compartida                 | `PULSO-AUTH-012`; `PULSO-AUTH-013`             | principal técnico y trabajador real quedan separados y auditables       |
| acumulación de puntos               | `PULSO-UX-011`; `PASS-INT-001`                 | venta elegible solicita el movimiento PASS exactamente una vez          |
| redención                           | `PULSO-UX-012`; `PASS-INT-002`                 | canje se valida y aplica sin doble uso                                  |
| confirmaciones sensibles            | `PULSO-UX-013`                                 | la interfaz confirma únicamente resultados autorizados                  |
| actor real                          | `PULSO-UX-014`                                 | la terminal compartida atribuye la acción al trabajador efectivo        |
| venta con PASS                      | `PULSO-UX-018`                                 | PULSO consume fidelización sin mantener una fuente paralela             |
| administración de fidelización      | `PASS-INT-003`; `PASS-INT-004`; `PASS-INT-005` | maestros, clientes y separación cliente-trabajador quedan gobernados    |
| pruebas de acumulación y redención  | `PASS-QA-001`; `PASS-QA-002`; `PULSO-AUTH-016` | los flujos integrales quedan comprobados en sus paquetes autorizados    |
| promoción y guardas AURA            | `AURA-DOM-006`; `AURA-INT-002`                 | campaña futura consume fuentes internas sin aplicar efectos por sí sola |
| arquitectura de colas y reintentos  | `QUEUE-ARC-001` a `QUEUE-ARC-010`              | efectos asíncronos y conciliación obtienen infraestructura aprobada     |

No queda un pendiente material sin tarea propietaria y condición de salida.

---

#### 39. Prohibiciones

Queda prohibido:

1. convertir una campaña en autoridad de descuento;
2. convertir una pieza o publicación en regla transaccional;
3. convertir un beneficio visible en elegibilidad automática;
4. convertir elegibilidad PASS en aplicación comercial automática;
5. aplicar una redención sin confirmación propietaria;
6. mantener saldo o ledger PASS dentro de PULSO;
7. mantener campaña AURA dentro de PULSO;
8. modificar el maestro de producto desde una promoción;
9. modificar stock desde una validación comercial;
10. recalcular margen oficial dentro de PULSO como fuente paralela de NUMERA;
11. aceptar `site_id` de cliente como autoridad territorial;
12. usar un permiso general como permiso de descuento, acumulación o redención;
13. atribuir una acción sensible solo a la sesión técnica de un dispositivo compartido;
14. aplicar dos veces el mismo efecto por doble clic, reintento o respuesta perdida;
15. generar una clave nueva para repetir el mismo hecho empresarial;
16. asumir fallo definitivo ante un resultado desconocido;
17. mostrar éxito antes de confirmación de servidor;
18. reescribir ventas históricas con reglas nuevas;
19. borrar historia al anular, devolver o revertir;
20. tratar descuento, reembolso, compensación y reversión de puntos como equivalentes;
21. crear una cuenta PASS ficticia para aplicar un beneficio;
22. impedir toda venta sin cliente identificado cuando el proceso permita consumidor final;
23. aceptar una regla vencida por caché o texto promocional;
24. inventar condiciones cuando la regla no las declare;
25. asumir compatibilidad entre promociones por defecto;
26. asumir que presupuesto de campaña equivale a autorización de descuento;
27. declarar correlación de campaña como causalidad o venta incremental;
28. activar AURA desde esta tarea;
29. crear definiciones normales de eventos desde esta tarea;
30. crear objetos físicos de integración desde esta tarea;
31. modificar código, SQL, migraciones, Supabase, datos, credenciales o configuración remota;
32. iniciar o desarrollar `QUEUE-ARC-001`.

---

#### 40. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `INT-MKT-003` consolida en un único contrato documental obligaciones ya protegidas por la cobertura vigente de autorización comercial, fidelización, marketing e integración: permiso y territorio por acción, compra elegible, regla versionada, redención válida, actor real, idempotencia, confirmación de servidor, fuentes propietarias, efectos exactamente una vez y conciliación. La tarea no introduce un comportamiento ejecutable nuevo, una transición nueva ni una regla de integridad no cubierta; define cómo esas obligaciones existentes se combinan en la frontera PULSO–PASS–AURA–NUMERA.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 41. Cobertura de prueba existente preservada

Se preserva sin modificación, en especial:

- `TREQ-PULSO-004`, para que toda mutación valide permiso, sede, estado y columnas permitidas;
- `TREQ-PULSO-005`, para snapshot de oferta y precio, descuentos, revisiones y estados comerciales separados;
- `TREQ-PULSO-006`, para descuentos, anulaciones, devoluciones, reembolsos, caja y acciones nombradas y auditables;
- `TREQ-PASS-008`, para acumulación, gasto, ajuste, reversión y redención mediante contratos autorizados, atómicos e idempotentes;
- `TREQ-PASS-022`, para permisos exactos por acción en la superficie PULSO relacionada con PASS;
- `TREQ-PASS-025`, para compra elegible, monto, moneda, regla vigente, actor, dispositivo y referencia estable en acumulación;
- `TREQ-PASS-026`, para referencia idempotente derivada del hecho empresarial;
- `TREQ-PASS-027`, para validar código, usuario, recompensa, sede, estado, vigencia y no utilización previa en redención;
- `TREQ-PASS-029`, para firma del trabajador real en dispositivo compartido;
- `TREQ-PASS-032`, para que la interfaz refleje únicamente resultados confirmados y tipifique conflictos o duplicados;
- `TREQ-AURA-003`, para que AURA gobierne intención y PULSO/PASS ejecuten reglas y redenciones;
- `TREQ-INTEGRATION-003`, para idempotencia, concurrencia, resultado recuperable y conciliación;
- `TREQ-INTEGRATION-006`, para impedir fuentes empresariales competidoras;
- `TREQ-INTEGRATION-014`, para efectos de venta exactamente una vez hacia PASS, NEXO y NUMERA;
- `TREQ-INTEGRATION-015`, para fidelización y compensaciones integradas sin duplicación;
- `TREQ-INTEGRATION-019`, para promociones, cupones, redenciones, campañas y métricas con fuentes propietarias e idempotencia.

Ninguna fila cambia de identidad, texto, estado, relación, propietario, evidencia ni secuencia por esta tarea.

---

#### 42. Decisiones congeladas

1. PULSO conserva pedido, venta y efecto comercial.
2. PASS conserva identidad, consentimiento, beneficio y ledger de fidelización.
3. AURA conserva intención de marketing cuando su continuidad sea autorizada.
4. NUMERA conserva margen, presupuesto, costo y resultado económico.
5. NEXO conserva producto e inventario.
6. FOGO conserva capacidad productiva según el hecho.
7. Un canal externo no concede autoridad comercial.
8. Beneficio visible no equivale a elegibilidad.
9. Elegibilidad PASS no equivale a aplicabilidad comercial en PULSO.
10. Redención válida no equivale a descuento aplicado.
11. Campaña no equivale a regla transaccional.
12. Correlación de campaña no equivale a causalidad.
13. Venta válida no exige cliente PASS cuando el proceso permita consumidor final.
14. Beneficio que exige identidad sí requiere identidad PASS resuelta.
15. PULSO valida autoridad laboral y contexto antes del efecto.
16. El permiso general no autoriza acciones sensibles específicas.
17. `site_id` de cliente no amplía territorio.
18. Dispositivo compartido conserva actor humano real.
19. Regla y versión quedan asociadas con el efecto aplicado.
20. El snapshot comercial preserva la historia de la transacción.
21. Cambios posteriores son prospectivos.
22. El mismo hecho no produce dos efectos por reintento.
23. Un resultado desconocido se reconcilia antes de repetir la mutación.
24. La interfaz no confirma éxito antes del servidor.
25. Acumulación permanece como movimiento PASS originado en venta elegible.
26. Redención permanece como movimiento PASS consumido por PULSO mediante contrato.
27. Descuento, compensación, reembolso y reversión de fidelización permanecen distintos.
28. La denegación del beneficio no invalida automáticamente una venta que pueda continuar sin él.
29. La ausencia de una guarda requerida no equivale a aprobación.
30. No se crean estados canónicos nuevos.
31. No se crean definiciones normales de eventos.
32. Se crean cero cambios `TREQ-*`.
33. No se genera una copia del registro canónico de requisitos.
34. Se crean cero objetos físicos.
35. Se modifican cero objetos físicos.
36. No se modifica código, SQL, migraciones, Supabase, datos, credenciales ni configuración remota.
37. `QUEUE-ARC-001` permanece reservada y no se inicia.

---

#### 43. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `INT-MKT-002` como tarea anterior;
2. conserva `QUEUE-ARC-001` como única tarea siguiente reservada;
3. mantiene a PULSO como propietaria de la operación comercial;
4. mantiene a PASS como propietaria de fidelización;
5. mantiene a AURA como propietaria objetivo de campaña sujeta a su puerta;
6. mantiene a NUMERA como autoridad económica;
7. distingue beneficio visible, elegibilidad, redención, aplicabilidad comercial y efecto aplicado;
8. distingue campaña de regla transaccional;
9. distingue promoción, cupón, beneficio, recompensa y descuento aplicado;
10. preserva la cadena de oferta, precio, promoción y snapshot de línea;
11. exige validación de regla y versión;
12. exige validación de vigencia y condiciones aplicables;
13. exige validación de sede, canal y modalidad cuando correspondan;
14. respeta venta a consumidor final cuando el proceso la permita;
15. exige identidad PASS cuando la regla realmente la requiera;
16. revalida autoridad laboral y acción sensible;
17. protege territorio frente a parámetros manipulados;
18. conserva actor real en dispositivo compartido;
19. impide saldo o ledger paralelo en PULSO;
20. impide campaña paralela en PULSO;
21. conserva acumulación mediante contrato PASS;
22. conserva redención mediante contrato PASS;
23. conserva compra elegible, monto, moneda, actor, dispositivo y referencia estable para acumulación;
24. conserva código, recompensa, sede, vigencia, estado y no utilización previa para redención;
25. conserva guardas económicas en NUMERA cuando correspondan;
26. conserva hechos de disponibilidad y capacidad en sus fuentes propietarias;
27. define compatibilidad únicamente por regla aprobada y no por inferencia;
28. exige idempotencia y conflicto ante reutilización incompatible de identificador;
29. impide doble aplicación concurrente;
30. exige reconciliación ante resultado desconocido;
31. impide confirmación optimista de un efecto sensible;
32. conserva snapshot y evidencia suficientes para reconstrucción;
33. mantiene cambios prospectivos sin reescritura histórica;
34. mantiene anulación, devolución, reembolso, compensación y reversión separados;
35. permite continuar una venta sin beneficio cuando el proceso lo permita y la única denegación sea el efecto solicitado;
36. minimiza datos personales en la validación;
37. asigna cada detalle posterior a una tarea propietaria exacta;
38. genera cero requisitos de prueba nuevos;
39. modifica cero requisitos de prueba;
40. no genera una copia del registro canónico de requisitos;
41. crea cero objetos físicos;
42. modifica cero objetos físicos;
43. no modifica código, SQL, migraciones, Supabase, datos, credenciales ni configuración remota;
44. no inicia ni desarrolla `QUEUE-ARC-001`.

---

#### 44. Resultado de la tarea

`INT-MKT-003` queda definida como el contrato permanente que separa la existencia de una promoción o beneficio de la decisión de aplicarlo a una transacción concreta.

Resultado consolidado:

```text
AURA
→ INTENCIÓN PROMOCIONAL Y CORRELACIÓN, CUANDO CORRESPONDA

PASS
→ BENEFICIO + REGLA + VERSIÓN + FIDELIZACIÓN

PULSO
→ PEDIDO / VENTA
→ VALIDACIÓN DE AUTORIDAD Y CONTEXTO
→ VALIDACIÓN DE CONDICIONES
→ CONFIRMACIÓN DE FUENTES PROPIETARIAS
→ EFECTO COMERCIAL
→ SNAPSHOT Y EVIDENCIA

NUMERA
→ GUARDAS Y RESULTADO ECONÓMICO
```

sin convertir una campaña en descuento, un beneficio visible en elegibilidad automática, una redención en venta, una venta en conversión atribuida ni PULSO en propietario de fidelización o marketing.

Con esta tarea se cierra documentalmente el mini-bloque `INT-MKT-001` a `INT-MKT-003` sin iniciar implementación física.

---

#### 45. Continuidad

ÚLTIMA TAREA APROBADA

`INT-MKT-002 — Definir beneficios publicados en PASS`

TAREA ACTUAL APROBADA

`INT-MKT-003 — Definir validación comercial desde PULSO`

SIGUIENTE TAREA RESERVADA

`QUEUE-ARC-001 — Inventariar colas, cron, jobs y automatizaciones existentes`

