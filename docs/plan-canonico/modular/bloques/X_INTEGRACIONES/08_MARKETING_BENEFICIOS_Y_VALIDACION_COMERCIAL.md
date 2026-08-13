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


### [ ] INT-MKT-002 — Definir beneficios publicados en PASS
### [ ] INT-MKT-003 — Definir validación comercial desde PULSO
