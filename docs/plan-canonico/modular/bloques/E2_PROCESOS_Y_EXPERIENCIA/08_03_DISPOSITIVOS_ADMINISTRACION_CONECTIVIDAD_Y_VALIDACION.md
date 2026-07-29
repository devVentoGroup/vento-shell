### MINI-BLOQUE — DISPOSITIVOS ADMINISTRACION CONECTIVIDAD Y VALIDACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dispositivos administracion conectividad y validación** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `UX-BASE-011` a `UX-BASE-015` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `UX-BASE-011`: Diseñar interfaces táctiles para tablets y kioscos
- `UX-BASE-012`: Diseñar interfaces densas solo para administración
- `UX-BASE-013`: Definir comportamiento con conectividad inestable
- `UX-BASE-014`: Definir reanudación del proceso después de interrupciones
- `UX-BASE-015`: Validar terminología con trabajadores reales
<!-- PLAN-SECTION-META:END -->

### ✅ UX-BASE-011 — Diseñar interfaces táctiles para tablets y kioscos

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-010 — Aplicar divulgación progresiva a opciones avanzadas` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-012 — Diseñar interfaces densas solo para administración`  
**Artefacto producido:** `UX-TACTILE-TABLET-KIOSK-CONTRACT-001`  
**Versión del estándar transversal:** `TOUCH-BASELINE-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de interacción táctil, ergonomía, legibilidad, atribución, periféricos, seguridad, accesibilidad, continuidad y validación física  
**Cambios en código, componentes, rutas, dispositivos, compras, permisos, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mínimo que deberá cumplir toda superficie de Vento OS utilizada principalmente mediante tacto en:

- tablets personales o compartidas;
- kioscos fijos o semifijos;
- terminales de caja y servicio;
- pantallas de producción;
- estaciones de recepción, bodega, despacho y entrega;
- dispositivos móviles usados como apoyo operativo;
- superficies híbridas con escáner, cámara, impresora, báscula, datáfono u otros periféricos.

La interfaz deberá poder utilizarse con precisión y comprensión bajo las condiciones reales del puesto, sin asumir:

- manos limpias y libres;
- atención continua;
- iluminación ideal;
- silencio;
- conectividad estable;
- postura sentada;
- teclado físico;
- un único trabajador por dispositivo;
- precisión fina de mouse;
- conocimiento técnico;
- hardware homogéneo.

Regla de alto nivel:

```text
LA PANTALLA SE ADAPTA
A LA TAREA, LA ESTACIÓN Y EL CUERPO HUMANO

NO

EL TRABAJADOR SE ADAPTA
A UNA VERSIÓN ENCOGIDA DEL ESCRITORIO
```

---

#### 2. Continuidad lógica

```text
DIVULGAR COMPLEJIDAD DE FORMA PROGRESIVA
UX-BASE-010
        ↓
HACER OPERABLE LA CAPA RESULTANTE
EN TABLETS Y KIOSCOS REALES
UX-BASE-011
        ↓
RESERVAR DENSIDAD AL BACKOFFICE
UX-BASE-012
```

`UX-BASE-011` no diseña todavía cada estación ni selecciona hardware. Establece la línea base transversal que deberá consumir:

- `UX-STATION-001` a `UX-STATION-012` para adaptar la interacción a cada puesto real;
- `AUTH-DEV-001` a `AUTH-DEV-016` para identidad, límites, sesión y auditoría del dispositivo;
- `PROC-SCREEN-001` a `PROC-SCREEN-028` para las pantallas concretas;
- `AUTH-UI-001` a `AUTH-UI-060` para rutas, acciones y protección;
- `UX-QA-001` a `UX-QA-030` para prototipos y validación.

---

#### 3. Base canónica heredada

Esta tarea conserva las decisiones aprobadas en:

- `UX-BASE-001` — separación entre experiencia operativa y administrativa;
- `UX-BASE-002` — tarea actual primero;
- `UX-BASE-003` — lenguaje humano;
- `UX-BASE-004` — relevancia contextual;
- `UX-BASE-005` — contexto activo visible;
- `UX-BASE-006` — bloqueos explicables;
- `UX-BASE-007` — captura única;
- `UX-BASE-008` — reducción segura de pasos;
- `UX-BASE-009` — excepciones separadas;
- `UX-BASE-010` — divulgación progresiva;
- `UX-STATION-001` — inventario físico y operativo de estaciones;
- `AUTH-CTX-*`, `AUTH-DEC-*`, `AUTH-SRV-*` y `AUTH-DEV-*` — identidad, contexto, autorización y dispositivo.

Principios heredados:

```text
DISPOSITIVO COMPARTIDO
≠ CUENTA COMPARTIDA
≠ ACTOR HUMANO
≠ ESTACIÓN FÍSICA
```

```text
RESPONSIVE
≠ TÁCTIL
≠ OPERABLE EN EL PUESTO REAL
```

```text
OBJETIVO GRANDE
≠ ACCIÓN AUTORIZADA
```

```text
PANTALLA COMPLETA
≠ OPERACIÓN CONFIRMADA
```

---

#### 4. Referencias técnicas mínimas

`TOUCH-BASELINE-1.0.0` toma como piso de referencia:

- WCAG 2.2, criterio 2.5.8: objetivo mínimo de puntero de `24 × 24 CSS px`, con excepciones controladas;
- WCAG 2.2, criterio 2.5.5: objetivo mejorado de `44 × 44 CSS px`;
- WCAG 2.2, criterio 2.5.7: toda interacción basada en arrastre deberá tener alternativa de puntero simple;
- Android Accessibility: objetivo táctil recomendado de al menos `48 × 48 dp`;
- Apple Human Interface Guidelines: objetivo táctil de al menos `44 × 44 pt` en iOS y iPadOS.

Política propia de Vento OS:

```text
SUPERFICIE OPERATIVA TÁCTIL ORDINARIA
→ OBJETIVO PREFERENTE DE 48 × 48 UNIDADES LÓGICAS

PISO DE CONFORMIDAD WEB
→ 24 × 24 CSS PX

EL PISO NO SE UTILIZA
COMO TAMAÑO ORDINARIO DEL TRABAJO OPERATIVO
```

La equivalencia física deberá comprobarse en el dispositivo real. Los valores lógicos no sustituyen una prueba con manos, postura, montaje y entorno reales.

Toda modificación futura de esta línea base deberá crear una nueva versión y conservar compatibilidad o plan de transición.

---

#### 5. Decisión principal

Toda superficie táctil deberá resolverse desde un perfil explícito:

```text
TAREA
+
ACTOR
+
ESTACIÓN
+
DISPOSITIVO
+
POSTURA Y MOVILIDAD
+
CONDICIONES AMBIENTALES
+
MÉTODO DE ENTRADA
+
PERIFÉRICOS
+
RIESGO
+
CONECTIVIDAD
=
PERFIL DE INTERACCIÓN
```

No existirá un componente universal cuya única estrategia sea reducir columnas o aumentar botones.

---

#### 6. Clases de superficie

Se distinguen inicialmente:

| Clase                       | Uso principal                                               | Regla                                                   |
| --------------------------- | ----------------------------------------------------------- | ------------------------------------------------------- |
| `PERSONAL_TABLET`           | dispositivo asignado o de uso individual durante una sesión | puede conservar preferencias no sensibles del actor     |
| `SHARED_TABLET`             | varios trabajadores por turno o franja                      | exige cambio de actor y limpieza entre sesiones         |
| `FIXED_KIOSK`               | estación anclada a lugar y función                          | territorio y capacidades máximas definidos por estación |
| `SEMI_FIXED_STATION`        | equipo desplazable dentro de una zona controlada            | deberá revalidar ubicación y montaje permitido          |
| `COUNTER_TERMINAL`          | caja, mostrador, recepción o entrega                        | prioriza rapidez, privacidad lateral y periféricos      |
| `PRODUCTION_DISPLAY`        | consulta o captura en producción                            | considera guantes, humedad, distancia y manos ocupadas  |
| `MOBILE_COMPANION`          | apoyo móvil, recorrido o entrega                            | no sustituye automáticamente una estación completa      |
| `HYBRID_PERIPHERAL_STATION` | tacto más escáner, impresora, báscula, cámara u otro equipo | el estado de cada periférico forma parte de la tarea    |

La clase no concede autoridad ni determina por sí sola el diseño definitivo.

---

#### 7. Perfil obligatorio de estación y uso

Antes de aprobar una interfaz concreta deberán conocerse, como mínimo:

- dispositivo y sistema operativo;
- tamaño, densidad y relación de aspecto;
- orientación permitida;
- montaje, altura e inclinación;
- distancia de lectura;
- uso con una o dos manos;
- postura sentada, de pie o en movimiento;
- movilidad dentro del puesto;
- número de actores y frecuencia de relevo;
- guantes, humedad, grasa, polvo o frío;
- iluminación, reflejos y contraste ambiental;
- ruido y posibilidad de feedback sonoro;
- vibración o movimiento del vehículo o superficie;
- teclado, escáner, cámara y periféricos;
- conectividad, energía y contingencia;
- sensibilidad de la información visible;
- frecuencia, duración y criticidad de la tarea.

La ausencia de estos datos deberá producir `PROFILE_INCOMPLETE`, con responsable y cierre en `UX-STATION-001`, `UX-STATION-002` o `UX-STATION-008`, según corresponda.

---

#### 8. Tamaño de objetivos táctiles

Reglas:

1. El objetivo táctil incluye toda el área activable, no solo el icono visible.
2. Los controles operativos ordinarios utilizarán preferentemente un área mínima equivalente a `48 × 48` unidades lógicas.
3. Las superficies nativas Apple respetarán como mínimo `44 × 44 pt`.
4. Ningún control web dependerá ordinariamente del piso de `24 × 24 CSS px` ni de la excepción de espaciado para tareas frecuentes.
5. Los controles críticos, de uso con guantes, en movimiento o bajo presión podrán requerir objetivos mayores.
6. Un icono pequeño podrá mantenerse visualmente compacto si su hit area cumple el contrato y no invade otro objetivo.
7. El tamaño se validará en orientación, zoom, teclado visible y estados de error.
8. El área táctil no podrá cambiar de forma impredecible durante carga o actualización.

No se congelará una equivalencia física en milímetros sin validar modelo, densidad y montaje.

---

#### 9. Espaciado y agrupación

Los objetivos deberán separarse de forma que un toque impreciso no active una acción vecina.

Se evitará colocar juntos:

- confirmar y cancelar;
- aceptar y rechazar;
- avanzar y eliminar;
- acción ordinaria y excepción;
- dos cantidades de líneas distintas;
- controles de actores diferentes;
- cerrar sesión y cerrar panel.

Reglas:

- el espacio visual no sustituye el hit area;
- las áreas activables no se superpondrán;
- los grupos tendrán título o relación perceptible;
- la acción destructiva no será el objetivo más fácil de alcanzar;
- las barras densas de iconos no se usarán como patrón operativo principal;
- los controles repetidos por fila conservarán alineación y separación estables.

---

#### 10. Jerarquía y ubicación de acciones

La acción principal deberá:

- permanecer próxima al contenido que modifica;
- ser alcanzable sin tapar el dato crítico;
- conservar posición estable durante la tarea;
- evitar esquinas o zonas propensas a toque accidental según montaje;
- mantenerse visible cuando el teclado o un panel secundario aparezcan;
- no competir con navegación, configuración o excepción.

En pantallas largas podrá existir una barra de acción persistente, siempre que:

- no cubra campos, errores o contenido;
- resuma el efecto antes de confirmar;
- respete áreas seguras del sistema;
- no active automáticamente al desplazarse;
- informe si existen cambios no guardados.

La distribución por zona de alcance deberá validarse con mano dominante, postura y montaje reales. No se impondrá una zona universal desde el escritorio.

---

#### 11. Postura, alcance y montaje

El diseño deberá contemplar:

- trabajo de pie;
- pantalla por encima o debajo de la línea visual;
- tablet sostenida con una mano;
- interacción con brazo extendido;
- dispositivo fijo en pared, base, caja o vehículo;
- necesidad de mirar simultáneamente producto, persona o entorno;
- periodos prolongados de uso;
- relevo entre personas de distinta altura o lateralidad.

No se aprobará una interfaz que requiera:

- precisión fina sostenida;
- mantener el brazo elevado durante el flujo completo;
- alternar repetidamente entre extremos de la pantalla;
- sostener el dispositivo y escribir textos largos;
- bloquear la visión del producto o área de trabajo;
- abandonar físicamente la tarea para alcanzar el control.

El montaje y hardware definitivos pertenecen a `UX-STATION-003`, `UX-STATION-006` y la matriz final `UX-STATION-009`.

---

#### 12. Orientación, reflow y teclado virtual

Una interfaz no podrá ser simplemente una captura de escritorio escalada.

Deberá:

- reordenar contenido sin scroll horizontal ordinario;
- mantener contexto, estado y acción principal;
- preservar relación entre etiqueta, valor, error y control;
- evitar que el teclado oculte el campo, el error o la confirmación;
- conservar el punto de lectura al rotar;
- soportar cambios de tamaño sin perder borradores;
- no duplicar controles entre versión horizontal y vertical;
- utilizar orientación fija solo cuando la estación y el proceso lo justifiquen.

Si una rotación no puede soportarse de forma segura, la interfaz deberá explicarlo antes de iniciar la tarea y la estación deberá impedir una orientación incompatible.

---

#### 13. Gestos y mecanismos de entrada

Quedan prohibidos como único mecanismo:

- hover;
- arrastre preciso;
- swipe oculto para acciones críticas;
- pulsación prolongada sin alternativa visible;
- doble toque necesario;
- gesto de borde no indicado;
- pinza para acceder a información esencial;
- icono sin etiqueta o nombre accesible.

Toda función basada en arrastre tendrá una alternativa de un solo puntero, salvo que el movimiento sea esencial al significado.

La interfaz no bloqueará mouse, teclado, lector, stylus u otro mecanismo disponible cuando su uso sea compatible y seguro.

---

#### 14. Minimización de escritura

Las tareas operativas reducirán el teclado mediante:

- contexto resuelto;
- selección de tarea o recurso;
- escaneo;
- listas cortas y contextualizadas;
- valores derivados;
- botones de cantidad;
- teclado numérico cuando corresponda;
- plantillas de motivo gobernadas;
- captura automática desde periférico;
- dictado solo cuando privacidad y ruido lo permitan.

No se utilizarán grandes campos de texto para reemplazar:

- reason codes;
- selección de recurso;
- identificación del actor;
- cantidad estructurada;
- clasificación de diferencia;
- evidencia que puede capturarse de forma específica.

Cuando el texto libre sea necesario, deberá conservar borrador y permitir revisión antes de enviar.

---

#### 15. Captura numérica y cantidades

Las cantidades deberán mostrar siempre:

- valor;
- unidad;
- presentación cuando aplique;
- límites;
- precisión;
- valor esperado como referencia, no como hecho observado;
- efecto de aumentar o disminuir;
- validación inmediata.

Los steppers deberán:

- tener objetivos amplios;
- evitar cambios múltiples por toque sostenido accidental;
- permitir entrada directa cuando el rango sea grande;
- no ocultar decimales o unidad;
- no cambiar de presentación sin confirmación;
- conservar el valor ante teclado, rotación o pérdida de foco.

Un valor cero, vacío y no observado serán estados diferentes.

---

#### 16. Escáner, cámara y captura automática

Toda captura deberá informar:

```text
LISTO
LEYENDO
RECONOCIDO
NO RECONOCIDO
DUPLICADO
FUERA DE CONTEXTO
SIN PERIFÉRICO
CONTINGENCIA MANUAL
```

Reglas:

- la lectura no ejecutará una acción irreversible sin revisión proporcional;
- un código duplicado no producirá un segundo efecto;
- el resultado reconocido será visible y comprensible;
- cámara y permisos del sistema tendrán alternativa;
- la linterna no se activará sin control visible;
- la captura continua deberá limitar duplicados y lecturas vecinas;
- el trabajador podrá corregir una lectura cuando la política lo permita;
- la contingencia manual conservará trazabilidad y no se convertirá en bypass.

---

#### 17. Periféricos

Cuando una tarea dependa de impresora, báscula, datáfono, cámara, escáner o equipo externo, la interfaz mostrará:

- periférico seleccionado;
- estado conocido y última verificación;
- acción enviada;
- confirmación recibida;
- resultado pendiente o desconocido;
- alternativa segura;
- referencia de soporte.

```text
COMANDO ENVIADO
≠ IMPRESIÓN, PAGO, PESO O LECTURA CONFIRMADA
```

No se ofrecerá `Reintentar` hasta saber si repetir puede duplicar el efecto.

La selección física y técnica de periféricos corresponde a `UX-STATION-002`, `UX-STATION-006` y paquetes de integración posteriores.

---

#### 18. Guantes, humedad, higiene y contaminación cruzada

Cada estación deberá decidir si la interacción táctil directa es apropiada.

Se evaluará:

- tipo de guante;
- sensibilidad del panel;
- humedad, grasa, harina, azúcar, polvo o frío;
- necesidad de lavado de manos;
- riesgo de contaminación entre producto y pantalla;
- frecuencia de limpieza;
- químicos de limpieza compatibles;
- protección física del dispositivo;
- posibilidad de usar escáner, pedal, botón físico o captura automática.

La interfaz no resolverá una incompatibilidad higiénica aumentando solamente el tamaño de los botones.

Cuando tocar la pantalla sea inseguro o ineficiente, `UX-STATION-002` deberá seleccionar otra modalidad o una modalidad híbrida.

---

#### 19. Iluminación, ruido, vibración y ambiente

La interfaz deberá conservar legibilidad ante:

- reflejos;
- luz intensa o baja;
- ángulos laterales;
- ruido que impide escuchar alertas;
- vibración de vehículo o superficie;
- movimiento del trabajador;
- distancia variable;
- temperatura y uso exterior cuando aplique.

Reglas:

- el color nunca será el único indicador;
- el feedback sonoro tendrá equivalente visual y, cuando sea útil, háptico;
- las alertas no dependerán de audio en cocina, bar, producción o despacho;
- el contraste se validará con el dispositivo y brillo reales;
- los textos críticos no se reducirán para acomodar más contenido;
- las animaciones no desplazarán objetivos durante el toque.

---

#### 20. Seguridad física y atención al entorno

No se exigirá interactuar con la pantalla mientras la persona:

- conduce;
- manipula cuchillos, calor, maquinaria o cargas;
- sostiene producto que requiere ambas manos;
- realiza un movimiento de riesgo;
- debe mantener atención visual sobre cliente, vehículo o entorno.

El proceso deberá crear un punto seguro de interacción antes o después de la maniobra.

Las emergencias utilizarán controles de contención claros, separados y protegidos; no un menú técnico.

La optimización de clics nunca prevalecerá sobre seguridad, higiene o custodia.

---

#### 21. Actor, contexto y atribución visibles

En tablets y kioscos compartidos permanecerán visibles, según aplique:

- estación o dispositivo;
- sede y área;
- actor humano;
- rol operativo;
- turno y check-in;
- tarea o recurso;
- estado online u offline;
- simulación o delegación.

Ejemplo:

```text
Kiosco Bodega CP
Centro de Producción · Bodega
Operando: Laura Pérez · Bodeguera
Turno activo · En línea
```

Sin actor:

```text
Kiosco Bodega CP
Ningún trabajador identificado
Las acciones personales están bloqueadas
```

El nombre del dispositivo no sustituye la identidad del actor.

---

#### 22. Cambio de trabajador y sesión compartida

El cambio de actor deberá:

```text
DETENER NUEVAS MUTACIONES
→ RESOLVER TAREA, BORRADOR Y CUSTODIA
→ CERRAR O TRANSFERIR SESIÓN DEL ACTOR
→ LIMPIAR DATOS PERSONALES Y PREFERENCIAS
→ IDENTIFICAR NUEVO ACTOR
→ RESOLVER CONTEXTO NUEVO
→ RECALCULAR COLA Y CAPACIDADES
```

No se heredarán:

- permisos;
- PIN;
- firma;
- tareas privadas;
- favoritos;
- búsquedas;
- borradores;
- filtros;
- datos sensibles;
- acciones avanzadas expandidas;
- selección de recurso incompatible.

La expiración por inactividad no borrará silenciosamente trabajo; deberá bloquear nuevas acciones, proteger la pantalla, conservar o cerrar el borrador según política y ofrecer reanudación segura.

---

#### 23. Privacidad visual

En estaciones visibles para clientes o terceros se aplicarán:

- minimización;
- masking;
- ocultamiento de previews;
- bloqueo automático;
- cierre de paneles sensibles al alejarse;
- ausencia de notificaciones con contenido privado;
- limpieza al cambiar de actor;
- posición o protector físico cuando corresponda.

No se mostrará en un kiosco operativo información laboral, médica, financiera, de permisos o de terceros que no sea necesaria para la tarea.

El modo kiosco no convierte el dato en público.

---

#### 24. Acciones destructivas y sensibles

Las acciones destructivas, financieras, de custodia, publicación, acceso o excepción deberán:

- estar separadas del CTA ordinario;
- indicar recurso y efecto;
- evitar proximidad peligrosa;
- exigir confirmación proporcional;
- utilizar step-up cuando la política lo requiera;
- permitir cancelación antes del efecto;
- emitir receipt;
- impedir doble ejecución;
- mantener el resultado visible.

No se usarán gestos ocultos como única protección.

Una confirmación no repetirá innecesariamente todo el formulario, pero deberá mostrar el efecto material.

---

#### 25. Toques repetidos, concurrencia e idempotencia

La interfaz deberá manejar:

- doble toque;
- pulsación prolongada;
- taps durante latencia;
- cambio de orientación;
- reenvío por reconexión;
- dos actores sobre el mismo recurso;
- lectura duplicada del escáner;
- callback tardío de un periférico.

Reglas:

- deshabilitar el botón visualmente no será la única defensa;
- cada mutación material tendrá idempotencia en la frontera autoritativa;
- el estado `ENVIANDO` no se confundirá con `CONFIRMADO`;
- se evitarán overlays transparentes que permitan tocar controles subyacentes;
- una actualización de lista no moverá el objetivo bajo el dedo;
- los conflictos conservarán trabajo y explicarán la recuperación.

---

#### 26. Feedback, latencia y estado

Toda acción ofrecerá feedback perceptible dentro de un tiempo acorde con la tarea:

```text
TOQUE RECONOCIDO
→ PROCESANDO
→ CONFIRMADO
O
→ BLOQUEADO / PENDIENTE / RESULTADO DESCONOCIDO
```

La interfaz deberá:

- reconocer el toque sin simular éxito;
- mostrar progreso cuando la espera sea perceptible;
- evitar spinners sin explicación prolongados;
- permitir continuar con otra tarea cuando la operación sea asíncrona y segura;
- conservar una referencia para consultar el resultado;
- diferenciar guardado local, enviado y confirmado;
- no utilizar vibración o sonido como único feedback.

---

#### 27. Conectividad y continuidad

Cada acción táctil declarará:

```text
ONLINE_REQUIRED
OFFLINE_CAPTURE_ALLOWED
OFFLINE_QUEUE_ALLOWED
STALE_READ_ONLY
MANUAL_CONTINGENCY
```

La superficie mostrará:

- estado de conexión;
- frescura;
- elementos pendientes;
- último punto confirmado;
- limitaciones actuales;
- acción segura disponible.

El diseño detallado de colas, reanudación y conciliación pertenece a `UX-BASE-013`, `UX-BASE-014` y `QUEUE-ARC-001` a `QUEUE-ARC-012`.

Esta tarea prohíbe que una tablet o kiosco oculte el estado offline mientras continúa aceptando mutaciones como si estuvieran confirmadas.

---

#### 28. Modo kiosco y administración del dispositivo

Un kiosco deberá limitar:

- aplicaciones disponibles;
- navegación del sistema;
- apertura de enlaces externos;
- descarga de archivos;
- portapapeles cuando corresponda;
- acceso a configuración técnica;
- persistencia de credenciales;
- salida accidental del flujo.

Pero también deberá existir una salida de mantenimiento autorizada y auditable.

```text
BLOQUEAR SALIDA ACCIDENTAL
≠ IMPEDIR SOPORTE, EMERGENCIA O RECUPERACIÓN AUTORIZADA
```

La interfaz ordinaria no expondrá controles de administración del dispositivo. `AUTH-DEV-*` y la arquitectura de despliegue definirán identidad, revocación, políticas y administración remota.

---

#### 29. Accesibilidad táctil

Además del tamaño de objetivos, se deberá validar:

- nombre, rol y estado accesibles;
- orden lógico de foco;
- lector de pantalla;
- teclado y switch access;
- zoom y tamaño de texto;
- contraste;
- reflow;
- alternativas a gesto, arrastre, audio y color;
- prevención de activación accidental;
- tiempo suficiente;
- mensajes de estado;
- autenticación accesible;
- compatibilidad con stylus o mouse cuando exista.

Las áreas invisibles ampliadas deberán coincidir con el control anunciado y no capturar toques destinados a otro elemento.

---

#### 30. Aplicación inicial por producto

##### 30.1 NEXO

- botones de cantidad y escaneo amplios;
- LOC, LPN, producto, unidad y tarea visibles;
- feedback inequívoco de lectura;
- preparación, carga, transporte y recepción diferenciados;
- kiosco de bodega sin backoffice general;
- impresión y periféricos con estado explícito.

##### 30.2 FOGO

- etapa, lote, receta y cantidad objetivo visibles;
- captura compatible con guantes, humedad y manos ocupadas;
- controles críticos fuera de zonas de toque accidental;
- puntos seguros de interacción antes o después de manipulación peligrosa.

##### 30.3 ORIGO

- orden, proveedor, línea, cantidad esperada y observada legibles;
- cámara o escáner como apoyo, no como confirmación automática;
- recepción parcial y diferencias con controles táctiles claros.

##### 30.4 PULSO y PASS

- controles rápidos de venta, pago, canje y entrega;
- privacidad ante cliente;
- datáfono y pago con estado confirmado;
- cancelación, devolución y override fuera del flujo ordinario.

##### 30.5 ANIMA

- experiencia móvil y tablet ligera;
- check-in, tareas y avisos con objetivos amplios;
- no reproducir backoffice denso;
- sesiones personales separadas de dispositivos operativos.

##### 30.6 VISO, NUMERA y TALENTO

Podrán utilizar tablet para consulta o decisiones acotadas, pero la administración densa se diseñará en `UX-BASE-012` y `UX-ADMIN-*`. Una tablet no convierte automáticamente una tabla administrativa compleja en interfaz operativa.

---

#### 31. Prototipado y pruebas físicas

Ninguna pantalla táctil crítica se aprobará solo mediante navegador de escritorio o emulación.

La validación deberá incluir:

- modelo o clase real de dispositivo;
- orientación y montaje;
- trabajador representativo;
- condición ordinaria y pico;
- guantes o condiciones reales;
- periféricos;
- conectividad degradada;
- cambio de actor;
- iluminación y ruido;
- interrupción y reanudación;
- errores y excepciones;
- tecnología de asistencia cuando aplique.

Resultados mínimos:

- finalización correcta;
- toques erróneos;
- controles no encontrados;
- bloqueos incomprendidos;
- tiempo y esfuerzo;
- postura y fatiga observada;
- pérdida de contexto;
- datos expuestos;
- fallos de periférico;
- recuperación.

`UX-STATION-008` valida con trabajadores; `UX-STATION-009` consolida la matriz final; `UX-QA-*` protege prototipos y aceptación.

---

#### 32. Métricas y guardrails

Se medirán:

- tasa de finalización correcta;
- toques accidentales;
- retrocesos;
- repetición de mutaciones;
- tiempo hasta feedback;
- uso de teclado;
- escaneos fallidos o duplicados;
- cambios de orientación;
- bloqueos por periférico;
- sesiones heredadas detectadas;
- trabajo perdido al expirar;
- recuperación offline;
- necesidad de ayuda;
- incidentes de privacidad;
- incompatibilidades por estación.

Guardrails:

- la velocidad individual no se utilizará como métrica disciplinaria sin contexto;
- menos toques no justifica eliminar controles;
- mayor tamaño no justifica saturar la pantalla;
- poca utilización no elimina una función necesaria;
- los datos de accesibilidad no se usarán para perfilar negativamente al trabajador;
- las métricas deberán analizar proceso, estación y condiciones, no solo persona.

---

#### 33. Migración de interfaces actuales

Cada superficie actual se clasificará como:

```text
TOUCH_READY
TOUCH_PARTIAL
DESKTOP_SHRUNK
TARGETS_UNDERSIZED
SPACING_UNSAFE
HOVER_DEPENDENT
DRAG_ONLY
KEYBOARD_HEAVY
CONTEXT_NOT_VISIBLE
ACTOR_LEAK_RISK
PERIPHERAL_STATE_MISSING
OFFLINE_STATE_MISSING
ORIENTATION_UNSAFE
ENVIRONMENT_UNVALIDATED
PHYSICAL_TEST_REQUIRED
CANDIDATE_FOR_RETIREMENT
```

Secuencia:

```text
INVENTARIAR RUTA Y ESTACIÓN
→ MEDIR OBJETIVOS Y DENSIDAD
→ OBSERVAR USO FÍSICO
→ CLASIFICAR RIESGOS
→ DEFINIR PERFIL OBJETIVO
→ PROTOTIPAR EN DISPOSITIVO REAL
→ PROBAR CON TRABAJADORES
→ PILOTAR
→ MEDIR
→ DESPLEGAR CON ROLLBACK
→ RETIRAR PATRÓN LEGACY
```

No se retirará una pantalla hasta que el reemplazo soporte la tarea completa, contingencia, accesibilidad, actor y contexto.

---

#### 34. Propiedad de decisiones diferidas

| Decisión                                | Tarea o familia propietaria                         |
| --------------------------------------- | --------------------------------------------------- |
| inventario físico vigente               | `UX-STATION-001`                                    |
| selección de modalidad por paso         | `UX-STATION-002`                                    |
| perfiles de estación                    | `UX-STATION-003`                                    |
| identidad y cambio de actor de estación | `UX-STATION-004`; `AUTH-DEV-001` a `AUTH-DEV-016`   |
| superficie contextual de estación       | `UX-STATION-005`                                    |
| hardware, montaje y periféricos         | `UX-STATION-006`                                    |
| contingencia física                     | `UX-STATION-007`                                    |
| prueba con trabajadores                 | `UX-STATION-008`; `UX-QA-*`                         |
| matriz final de estaciones              | `UX-STATION-009`                                    |
| gramática y composición concreta        | `UX-STATION-010` a `UX-STATION-012`                 |
| densidad administrativa                 | `UX-BASE-012`; `UX-ADMIN-001` a `UX-ADMIN-005`      |
| conectividad y reanudación              | `UX-BASE-013`; `UX-BASE-014`; `QUEUE-ARC-*`         |
| terminología real                       | `UX-BASE-015`                                       |
| rutas y acciones concretas              | `AUTH-UI-*`; `PROC-SCREEN-*`                        |
| pruebas ejecutables                     | `UX-QA-*`; paquetes E5 y certificación del BLOQUE U |

No queda decisión diferida sin propietario documental.

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA 23 REQUISITOS DE PRUEBA.

Se incorporan al registro completo:

```text
TREQ-UX-204 a TREQ-UX-226
```

Protegen:

1. perfil táctil por tarea y estación;
2. tamaños mínimos;
3. espaciado;
4. ubicación y alcance;
5. postura y montaje;
6. orientación y reflow;
7. alternativas a gestos;
8. minimización de teclado;
9. captura numérica;
10. escaneo y periféricos;
11. ambiente e higiene;
12. seguridad física;
13. actor y contexto;
14. cambio de trabajador;
15. privacidad;
16. acciones sensibles;
17. doble toque e idempotencia;
18. feedback y latencia;
19. conectividad;
20. accesibilidad;
21. modo kiosco;
22. adaptación por producto y prueba física;
23. migración y métricas.

---

#### 36. Criterios de aceptación

- [ ] Se definieron clases de superficie táctil sin confundirlas con actor o permiso.
- [ ] Se estableció un perfil obligatorio de estación y uso.
- [ ] Se fijaron pisos y objetivos preferentes versionados.
- [ ] Se definieron espaciado, alcance, postura, orientación y reflow.
- [ ] Se prohibió depender de hover, arrastre o gesto oculto.
- [ ] Se definieron escritura, cantidades, escaneo y periféricos.
- [ ] Se trataron guantes, higiene, iluminación, ruido y vibración.
- [ ] Se protegió la seguridad física del trabajador.
- [ ] Se mantuvieron actor, contexto, turno y estado visibles.
- [ ] Se definió cambio de trabajador sin herencia de sesión.
- [ ] Se protegieron privacidad y datos sensibles.
- [ ] Se separaron acciones destructivas y excepcionales.
- [ ] Se cubrieron doble toque, latencia, idempotencia y offline.
- [ ] Se incluyeron accesibilidad y modo kiosco.
- [ ] Se exigieron prototipos y pruebas en dispositivos reales.
- [ ] Cada decisión diferida tiene tarea propietaria.
- [ ] Se generó el registro completo con `TREQ-UX-204` a `TREQ-UX-226`.
- [ ] No se implementó código, hardware, compra, migración ni cambio en Supabase.
- [ ] `UX-BASE-012` permanece sin iniciar.

---

#### 37. Estado y continuidad

```text
UX-BASE-010   APROBADA
UX-BASE-011   APROBADA
UX-BASE-012   NO INICIADA
```

No se inicia `UX-BASE-012` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.


### ✅ UX-BASE-012 — Diseñar interfaces densas solo para administración

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-011 — Diseñar interfaces táctiles para tablets y kioscos` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-013 — Definir comportamiento con conectividad inestable`  
**Artefacto producido:** `UX-ADMIN-DENSITY-CONTRACT-001`  
**Versión del estándar transversal:** `ADMIN-DENSITY-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de densidad informativa, superficies administrativas, tablas, filtros, operaciones masivas, contexto, accesibilidad, seguridad, estaciones compartidas y separación entre consulta y ejecución  
**Caso operativo incorporado:** dos computadores POS táctiles del primer piso del Centro de Producción y posible uso compartido por más de un área productiva  
**Cambios en código, componentes, rutas, dispositivos, permisos, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir cuándo una superficie de Vento OS podrá utilizar una composición densa y
qué controles deberá cumplir para evitar que tablas, filtros, columnas, paneles,
acciones masivas y múltiples regiones simultáneas se trasladen indebidamente a
trabajadores que ejecutan tareas operativas.

La densidad se reservará para trabajo que realmente exige:

- comparar múltiples registros;
- revisar excepciones o diferencias;
- planificar y asignar;
- conciliar;
- aprobar;
- configurar;
- auditar;
- analizar tendencias;
- administrar catálogos o versiones;
- ejecutar operaciones masivas controladas.

No se utilizará densidad porque:

- el dispositivo tenga pantalla grande;
- sea un computador y no una tablet;
- la aplicación se ejecute en escritorio;
- el usuario tenga un rol jerárquico;
- exista una tabla en la base de datos;
- sea más rápido reutilizar un componente administrativo;
- el equipo sea denominado POS;
- el desarrollador pueda mostrar más información.

Regla central:

```text
DENSIDAD
→ SOLO CUANDO LA TAREA ADMINISTRATIVA
  NECESITA COMPARAR, DECIDIR O GOBERNAR

OPERACIÓN
→ FOCO, CONTEXTO, TAREA Y ACCIÓN
  AUNQUE EL DISPOSITIVO SEA UN PC GRANDE
```

---

#### 2. Continuidad lógica

```text
INTERFAZ TÁCTIL OPERABLE
UX-BASE-011
        ↓
EVITAR QUE EL TAMAÑO DEL EQUIPO
CONVIERTA LA OPERACIÓN EN BACKOFFICE
UX-BASE-012
        ↓
DEFINIR QUÉ OCURRE CUANDO LA RED
NO PERMITE CARGAR O CONFIRMAR
UX-BASE-013
```

`UX-BASE-012` utiliza las decisiones aprobadas de:

- `UX-BASE-001` — carriles de experiencia;
- `UX-BASE-002` — tarea actual primero;
- `UX-BASE-003` — lenguaje humano;
- `UX-BASE-004` — funciones relevantes;
- `UX-BASE-005` — contexto activo visible;
- `UX-BASE-006` — bloqueos explicables;
- `UX-BASE-007` — captura única;
- `UX-BASE-008` — reducción segura de pasos;
- `UX-BASE-009` — excepciones separadas;
- `UX-BASE-010` — divulgación progresiva;
- `UX-BASE-011` — interacción táctil y estaciones reales.

No diseña todavía cada pantalla concreta. Su aplicación posterior corresponde a:

- `AUTH-UI-001` a `AUTH-UI-060`;
- `PROC-SCREEN-001` a `PROC-SCREEN-028`;
- `UX-STATION-002` a `UX-STATION-012`;
- subbloques UX de cada aplicación;
- paquetes E5;
- `UX-QA-001` a `UX-QA-030`.

---

#### 3. Respuesta canónica al caso de los dos computadores POS

**Sí es posible que un mismo dispositivo compartido sirva a dos áreas**, siempre
que no se conviertan las dos áreas en una identidad operativa ficticia ni se
mezclen sus ejecuciones.

Modelo preliminar permitido:

```text
DISPOSITIVO FÍSICO
Centro de Producción · Primer piso · Estación 01

SEDE FIJA
Centro de Producción

ÁREAS PERMITIDAS DEL DISPOSITIVO
- Repostería
- Pastelería y Tortas

ACTOR HUMANO ACTUAL
trabajador identificado

ÁREA OPERATIVA ACTIVA
exactamente una para cada acción ejecutada
```

Por tanto:

```text
DISPOSITIVO MULTIÁREA PERMITIDO
≠ ÁREA COMBINADA INVENTADA
≠ COLA SIN PROPIETARIO
≠ PRODUCCIÓN SIN ATRIBUCIÓN TERRITORIAL
```

El dispositivo podrá presentar:

1. **recetarios separados por área**, mediante dos accesos táctiles claros;
2. **una bandeja unificada agrupada por área**, cuando ayude a coordinar el
   trabajo y cada tarjeta conserve su área propietaria;
3. **apertura directa del área del turno vigente**, cuando el actor solo esté
   autorizado para una de las dos;
4. **cambio explícito de área**, cuando actor, turno, proceso y política permitan
   trabajar en ambas.

No se permitirá:

- mezclar recetas en una lista sin mostrar área;
- registrar producción de Pastelería bajo Repostería;
- conservar el área elegida por el trabajador anterior;
- utilizar la última área del dispositivo como autoridad;
- permitir que el selector visual amplíe el turno o el permiso;
- duplicar la misma receta para cada recetario si existe una única receta y
  versión empresarial compartida.

---

#### 4. Decisión provisional para Repostería y Pastelería y Tortas

La recomendación documental inicial es:

```text
INICIO DEL DISPOSITIVO
→ mostrar actor y contexto
→ resolver turno y áreas permitidas

SI SOLO EXISTE UN ÁREA OPERATIVA VÁLIDA
→ abrir directamente su bandeja

SI EXISTEN DOS ÁREAS VÁLIDAS
→ mostrar selector explícito o bandeja agrupada
→ conservar siempre el área en encabezado, tarea y receta

AL ABRIR UNA TAREA
→ fijar área propietaria
→ revalidar permiso, turno y contexto
→ registrar toda ejecución con esa área
```

Para recetas:

```text
RECETARIO OPERATIVO
→ separado por área activa

RECETA EMPRESARIAL COMPARTIDA
→ una identidad y una versión
→ visible en las áreas autorizadas
→ no duplicada físicamente

ADMINISTRACIÓN DE RECETAS
→ superficie administrativa separada
→ no disponible como tabla densa en el POS compartido
```

La decisión definitiva entre dos recetarios visibles, selector de área o bandeja
agrupada no se congela en esta tarea porque depende de:

- ubicación física de los dos equipos;
- distancia entre áreas;
- circulación y contaminación cruzada;
- cantidad de trabajadores concurrentes;
- turnos y rotaciones;
- frecuencia de cambio de área;
- volumen de producción;
- tamaño y resolución real de los POS;
- periféricos;
- pruebas con trabajadores.

---

#### 5. Tareas propietarias de la decisión definitiva

La pregunta detectada no queda como pendiente narrativo. Se asigna a tareas
concretas:

| Decisión                                                   | Tarea propietaria                                     |
| ---------------------------------------------------------- | ----------------------------------------------------- |
| comprobar si un equipo puede atender físicamente dos áreas | `UX-STATION-002`                                      |
| definir perfil de estación multiárea                       | `UX-STATION-003`                                      |
| identificar actor y limpiar contexto al relevar            | `UX-STATION-004`; `AUTH-DEV-007`; `AUTH-DEV-013`      |
| diseñar selector, bandeja y contexto por área              | `UX-STATION-005`; `UX-STATION-010` a `UX-STATION-012` |
| definir hardware, montaje y periféricos de los dos POS     | `UX-STATION-006`                                      |
| probar la alternativa con trabajadores                     | `UX-STATION-008`                                      |
| congelar la matriz estación–áreas–procesos                 | `UX-STATION-009`                                      |
| fijar sede del dispositivo                                 | `AUTH-DEV-003`                                        |
| declarar una o varias áreas permitidas                     | `AUTH-DEV-004`                                        |
| declarar aplicaciones y capacidad máxima                   | `AUTH-DEV-005`; `AUTH-DEV-006`                        |
| combinar límite del dispositivo y autoridad humana         | `AUTH-DEV-008`                                        |
| probar pantallas de FOGO                                   | `AUTH-DEV-016`                                        |
| definir contrato y acceso de recetas                       | `OPS-REC-001`                                         |
| separar áreas productivas en FOGO                          | `FOGO-UX-002`; `FOGO-UX-003`                          |
| diseñar receta operativa                                   | `FOGO-UX-008`                                         |
| separar recetario operativo y administración               | `FOGO-UX-009`                                         |
| validar el prototipo por área                              | `FOGO-UX-015`                                         |
| proteger recetas y acceso por área                         | `FOGO-AUTH-002`; `FOGO-AUTH-003`; `FOGO-AUTH-013`     |

Ninguna de estas decisiones exige implementar anticipadamente los dispositivos.

---

#### 6. Qué significa densidad

Una interfaz será densa cuando presente simultáneamente una combinación alta de:

- filas;
- columnas;
- filtros;
- agrupaciones;
- comparaciones;
- indicadores;
- acciones por fila;
- selección múltiple;
- edición inline;
- paneles paralelos;
- totales;
- historial;
- relaciones entre registros;
- controles avanzados.

La densidad no se mide únicamente por número de elementos. Una pantalla con seis
controles ambiguos puede tener mayor carga cognitiva que una tabla bien
estructurada con veinte filas.

```text
DENSIDAD VISUAL
+
DENSIDAD DE DECISIÓN
+
DENSIDAD DE ACCIONES
+
DENSIDAD DE CONTEXTO
=
CARGA REAL DE LA SUPERFICIE
```

---

#### 7. Carriles autorizados para densidad

| Carril                        | Densidad permitida | Regla                                            |
| ----------------------------- | ------------------ | ------------------------------------------------ |
| `OPERATIONAL_EXECUTION`       | baja               | tarea y acción actual primero                    |
| `OPERATIONAL_SUPERVISION`     | baja a media       | coordinación y bloqueos; no backoffice completo  |
| `ADMINISTRATIVE_WORK`         | media a alta       | comparación, planeación, decisión y conciliación |
| `CONFIGURATION_GOVERNANCE`    | media a alta       | parámetros versionados y efectos claros          |
| `AUDIT_ANALYTICS`             | media a alta       | reconstrucción, filtros y trazabilidad           |
| `PERSONAL_CUSTOMER_CANDIDATE` | baja               | caso propio y acciones comprensibles             |

Una superficie densa deberá declarar expresamente su carril. No podrá inferirlo
por el nombre de la aplicación o del rol.

---

#### 8. Criterios para autorizar una superficie densa

Una composición densa solo se justificará cuando concurran:

1. necesidad legítima de comparar o gobernar múltiples elementos;
2. actor administrativo, de configuración, auditoría o supervisión autorizada;
3. permiso de lectura de la vista;
4. permisos exactos para cada acción;
5. territorio y periodo visibles;
6. dispositivo compatible;
7. sensibilidad y masking resueltos;
8. frecuencia y complejidad que justifiquen la composición;
9. alternativa comprensible para tareas individuales;
10. prueba de accesibilidad, rendimiento y error.

La densidad no concede autoridad.

```text
TABLA VISIBLE
≠ PERMISO PARA EDITAR TODAS LAS FILAS
```

---

#### 9. Prohibición de densidad operativa por hardware

Un computador POS táctil puede ser físicamente un PC completo y, aun así, su
superficie ordinaria deberá seguir siendo operativa.

```text
PC TÁCTIL GRANDE
≠ ESCRITORIO ADMINISTRATIVO
```

En los dos equipos del Centro de Producción no deberán aparecer ordinariamente:

- tabla maestra completa de recetas;
- costos;
- márgenes;
- versiones históricas completas;
- permisos;
- publicación global;
- configuración de ingredientes;
- edición de rendimientos base;
- catálogos empresariales completos;
- exportaciones masivas;
- auditoría técnica.

La estación operativa podrá mostrar:

- producción pendiente;
- receta resumida vigente;
- ingredientes y cantidades aplicables;
- pasos;
- alérgenos y controles;
- lote actual;
- captura de resultado;
- bloqueo o diferencia;
- siguiente acción.

---

#### 10. Niveles de densidad

Se definen conceptualmente:

| Nivel            | Descripción                                   | Uso                                                |
| ---------------- | --------------------------------------------- | -------------------------------------------------- |
| `D0_FOCUSED`     | un caso, una tarea, una acción                | operación táctil                                   |
| `D1_CONTEXTUAL`  | caso más contexto y próximos elementos        | supervisión local y operación compleja             |
| `D2_COMPARATIVE` | lista o tabla moderada con filtros esenciales | administración ordinaria                           |
| `D3_ANALYTICAL`  | múltiples columnas, agrupaciones y paneles    | análisis, conciliación y auditoría                 |
| `D4_SPECIALIZED` | workspace experto con configuración compleja  | gobierno, finanzas, datos o configuración avanzada |

`D3` y `D4` no se utilizarán en kioscos o POS compartidos salvo una herramienta
de soporte protegida, temporal y fuera del flujo ordinario.

---

#### 11. Arquitectura de una superficie administrativa densa

La composición deberá conservar una jerarquía estable:

```text
1. PROPÓSITO Y TERRITORIO
2. PERIODO Y FRESCURA
3. RESUMEN O DIFERENCIA PRINCIPAL
4. FILTROS ACTIVOS
5. TABLA, MATRIZ O VISUALIZACIÓN
6. SELECCIÓN Y ACCIONES AUTORIZADAS
7. DETALLE DEL ELEMENTO
8. RESULTADO, RECEIPT O HISTORIAL
```

No se presentarán diez paneles con igual peso visual.

---

#### 12. Tablas y cuadrículas

Toda tabla administrativa deberá definir:

- identidad estable de fila;
- significado de cada columna;
- unidad y formato;
- origen y frescura;
- orden inicial;
- claves de desempate;
- estados de carga y vacío;
- comportamiento ante datos parciales;
- sensibilidad;
- acciones disponibles;
- mecanismo de detalle;
- paginación o virtualización;
- exportación permitida o prohibida.

Quedan prohibidas:

- columnas sin encabezado comprensible;
- iconos como único significado;
- acciones críticas ocultas en cada fila sin contexto;
- celdas editables que no indiquen modo edición;
- filas sin identidad estable;
- scroll horizontal que oculte contexto crítico sin alternativa;
- totales calculados sobre una selección distinta a la visible sin explicarlo.

---

#### 13. Filtros y alcance

Los filtros que cambien el universo deberán permanecer visibles:

- empresa;
- sede;
- área;
- periodo;
- estado;
- propietario;
- proceso;
- versión;
- sensibilidad cuando aplique.

```text
FILTRO ACTIVO
→ VISIBLE
→ REMOVIBLE
→ INCLUIDO EN EXPORTACIÓN Y RECEIPT
```

`Todas las sedes` o `Todas las áreas` no se interpretarán como autoridad. Solo
podrán representar el conjunto autorizado resultante.

Un filtro administrativo no cambiará el área operativa activa.

---

#### 14. Orden, agrupación y agregación

La interfaz explicará:

- criterio de orden;
- desempate;
- agrupación;
- nivel de subtotal;
- elementos excluidos;
- moneda, unidad y precisión;
- periodo de cálculo;
- datos pendientes o incompletos.

Una agrupación por área no fusionará los hechos de las áreas.

Ejemplo permitido:

```text
PRODUCCIÓN PENDIENTE

Repostería
- tarea 1
- tarea 2

Pastelería y Tortas
- tarea 3
- tarea 4
```

Cada tarea conserva su `area_id` y no hereda el encabezado visual como fuente
autoritativa.

---

#### 15. Columnas y personalización

Las vistas podrán permitir:

- mostrar u ocultar columnas autorizadas;
- reordenar;
- redimensionar;
- guardar vista;
- cambiar agrupación;
- fijar columnas esenciales.

Pero una preferencia:

- no concede acceso a una columna;
- no supera masking;
- no se comparte entre actores sin política;
- no conserva información sensible en dispositivo compartido;
- no oculta consecuencias obligatorias;
- se invalida cuando cambia el contrato.

---

#### 16. Selección y operaciones masivas

Toda selección deberá indicar:

```text
CUÁNTOS ELEMENTOS
+
QUÉ TERRITORIO
+
QUÉ FILTRO
+
QUÉ PÁGINAS
+
QUÉ ELEMENTOS NO SON ELEGIBLES
```

Se distinguirán:

- seleccionar filas visibles;
- seleccionar la página;
- seleccionar todos los resultados filtrados;
- seleccionar una agrupación;
- seleccionar manualmente un subconjunto.

Antes de ejecutar una acción masiva se mostrará:

- efecto común;
- excepciones;
- permisos;
- impacto total;
- ejecución parcial;
- estrategia de idempotencia;
- rollback o compensación cuando corresponda.

---

#### 17. Edición

Se diferencian:

```text
CONSULTAR
EDITAR UNA FILA
EDITAR VARIAS FILAS
CONFIGURAR UNA REGLA
APROBAR
CORREGIR UN HECHO
```

La edición inline se permitirá solo cuando:

- el campo sea de bajo riesgo;
- el efecto sea claro;
- exista control de versión;
- se muestre estado guardado;
- pueda cancelarse;
- no oculte validaciones dependientes.

Cambios de receta, precio, permiso, salario, costo, inventario, estado contable,
publicación o configuración sensible utilizarán una superficie de revisión
apropiada, no una celda casual.

---

#### 18. Concurrencia y conflictos

Una tabla densa puede mostrar datos obsoletos mientras el usuario decide. Toda
acción deberá revalidar:

- versión;
- estado;
- permiso;
- territorio;
- selección;
- dependencias;
- actor;
- periodo.

Ante conflicto:

```text
NO SOBRESCRIBIR
→ MOSTRAR QUÉ CAMBIÓ
→ CONSERVAR TRABAJO SEGURO
→ ACTUALIZAR, COMPARAR O DESCARTAR
```

---

#### 19. Rendimiento y virtualización

La densidad no justificará cargar todos los registros ni bloquear la pantalla.

Se admitirán:

- paginación;
- virtualización;
- carga incremental;
- agregados de servidor;
- caché versionada;
- prefetch controlado.

Pero deberán conservar:

- identidad de fila;
- selección;
- foco;
- lectura accesible;
- total correcto;
- orden estable;
- frescura;
- filtros;
- contexto.

```text
FILA NO RENDERIZADA
≠ FILA NO SELECCIONADA
```

---

#### 20. Teclado, mouse y tacto

Las superficies densas administrativas se optimizarán principalmente para
teclado y mouse cuando el trabajo lo justifique, sin excluir tacto ni
accesibilidad.

Podrán ofrecer:

- navegación por teclado;
- atajos visibles;
- búsqueda;
- selección con modificadores;
- copia controlada;
- edición rápida.

Los atajos:

- no serán la única vía;
- no activarán acciones destructivas sin control;
- no funcionarán cuando el foco esté en un campo incompatible;
- respetarán permisos y contexto;
- serán localizables y documentados.

En táctil, una vista `D2` podrá adaptarse, pero `D3` o `D4` deberá pasar a una
superficie especializada o equipo apropiado.

---

#### 21. Responsive y reflow

Una interfaz administrativa densa no se convertirá en una tabla ilegible en
pantalla pequeña.

Estrategias permitidas:

- columnas prioritarias;
- tarjetas comparativas;
- detalle por fila;
- filtros en panel;
- agrupaciones;
- vistas especializadas;
- modo consulta de solo lectura;
- derivación a un equipo compatible.

No se permitirá:

- reducir tipografía por debajo de legibilidad;
- objetivos táctiles mínimos;
- scroll horizontal sin contexto fijo;
- ocultar filtros activos;
- ejecutar un lote complejo sin resumen.

---

#### 22. Accesibilidad de tablas densas

Toda superficie deberá conservar:

- encabezados programáticos;
- nombre y propósito de la tabla;
- asociación de celdas;
- foco lógico;
- estado de selección;
- anuncios de orden y filtro;
- navegación por teclado;
- equivalentes de color e icono;
- zoom y reflow;
- alternativa a drag;
- resumen de errores;
- persistencia de foco después de actualizar.

Una tabla visual no podrá ser un conjunto de `div` sin semántica cuando su
función sea tabular.

---

#### 23. Sensibilidad y minimización

La densidad aumenta el riesgo de exposición porque reúne muchos datos en una
misma superficie.

Deberán aplicarse:

- proyección mínima;
- masking por campo;
- permiso de columna;
- límites de búsqueda;
- protección de exportación;
- bloqueo por inactividad;
- no persistencia en equipos compartidos;
- prevención de previews sensibles;
- auditoría de consulta cuando corresponda.

Un usuario autorizado para una fila no necesariamente podrá ver todas sus
columnas.

---

#### 24. Contexto administrativo visible

Toda vista densa mostrará permanentemente:

- finalidad;
- actor o simulación;
- rol;
- cobertura;
- sede o áreas incluidas;
- periodo;
- filtros activos;
- frescura;
- modo de solo lectura o edición.

```text
COBERTURA ADMINISTRATIVA
≠ ÁREA OPERATIVA ACTIVA
```

Un supervisor podrá consultar dos áreas en una tabla agrupada, pero al ejecutar
una acción física deberá ingresar al carril operativo y fijar el área exacta.

---

#### 25. Exportación, impresión y copia

Exportar, imprimir o copiar datos será una capacidad separada de visualizar.

Antes de producir un archivo o reporte se validarán:

- permiso;
- finalidad;
- columnas;
- territorio;
- periodo;
- filtros;
- masking;
- volumen;
- retención;
- clasificación;
- destinatario cuando aplique.

El artefacto deberá registrar los criterios utilizados.

No se habilitará exportación en un POS compartido por el solo hecho de que el
navegador pueda descargar archivos.

---

#### 26. Offline y frescura

Las superficies densas administrativas serán, por defecto:

```text
ONLINE_REQUIRED
```

Podrán ofrecer lectura limitada `STALE_READ_ONLY` cuando:

- la frescura sea visible;
- no se confunda con dato actual;
- no se permitan mutaciones;
- la sensibilidad lo permita;
- exista expiración.

No se ejecutarán operaciones masivas, cambios de configuración ni aprobaciones
sensibles desde un snapshot offline salvo contrato específico posterior.

`UX-BASE-013` definirá el comportamiento transversal con conectividad inestable.

---

#### 27. Dispositivos compartidos

En un dispositivo compartido ordinario:

```text
D0 O D1 OPERATIVO
→ PERMITIDO SEGÚN PERFIL

D2 ADMINISTRATIVO
→ EXCEPCIONAL Y LIMITADO

D3 O D4
→ PROHIBIDO EN FLUJO ORDINARIO
```

La pantalla no mostrará automáticamente backoffice porque el actor sea gerente.

Una herramienta administrativa temporal exigirá, según riesgo:

- sesión personal;
- step-up;
- equipo confiable;
- no persistencia;
- masking;
- cierre automático;
- auditoría;
- limpieza completa.

---

#### 28. Contrato de estación multiárea

Un dispositivo con varias áreas permitidas deberá declarar conceptualmente:

```text
station_id
fixed_site_id
allowed_area_ids[]
allowed_process_ids[]
allowed_application_codes[]
device_capability_ceiling
actor_session_required
area_selection_policy
context_reset_policy
```

La forma física se diseñará en `AUTH-DEV-*` y `UX-STATION-*`; esta lista es
conceptual y no autoriza tablas nuevas.

Reglas:

1. `allowed_area_ids` limita al dispositivo; no concede autoridad al actor.
2. El actor deberá estar autorizado para el área y proceso exactos.
3. Toda mutación tendrá un único `active_area_id`.
4. Un selector no podrá elegir áreas fuera del turno o permiso.
5. Cambiar de área revalidará tarea, borrador, claim, recurso y custodia.
6. El área anterior permanecerá visible hasta que el cambio sea confirmado.
7. Las colas podrán agruparse, pero no perderán su área propietaria.
8. El relevo de actor limpiará el área seleccionada cuando no sea compatible.

---

#### 29. Recetarios en una estación multiárea

Se adopta el siguiente principio objetivo:

```text
RECETA
→ IDENTIDAD EMPRESARIAL ÚNICA
→ VERSIÓN VIGENTE
→ ÁREAS EN LAS QUE PUEDE EJECUTARSE

RECETARIO OPERATIVO
→ PROYECCIÓN SEGÚN ÁREA ACTIVA

ADMINISTRACIÓN DE RECETAS
→ WORKSPACE ADMINISTRATIVO SEPARADO
```

Una receta compartida no se copiará en dos registros independientes. Se
referenciará la misma identidad y versión desde los recetarios autorizados.

Una receta exclusiva de Pastelería y Tortas no aparecerá como ejecutable al
operar en Repostería.

Una persona con autorización en ambas podrá cambiar de área explícitamente o
abrir una tarea ya atribuida a la otra área; la interfaz mostrará el cambio antes
de capturar producción.

---

#### 30. Bandeja unificada frente a recetarios separados

Ambas alternativas son válidas, pero resuelven problemas diferentes.

##### 30.1 Recetarios separados

Adecuado cuando:

- los equipos se ubican cerca de cada área;
- los trabajadores permanecen normalmente en una sola;
- las recetas y colas son numerosas;
- el cambio de área es poco frecuente;
- existe riesgo de confusión o contaminación cruzada.

##### 30.2 Bandeja unificada agrupada

Adecuada cuando:

- un mismo equipo es realmente compartido;
- los trabajadores alternan legítimamente;
- el volumen es manejable;
- se necesita coordinación visible;
- cada tarea conserva área y contexto;
- la selección abre un cambio explícito de área cuando sea necesario.

##### 30.3 Recomendación inicial

Para los dos computadores POS del primer piso:

```text
NO MEZCLAR TODAS LAS RECETAS EN UNA SOLA LISTA PLANA
```

Preferir inicialmente:

```text
DOS ACCESOS GRANDES
Repostería | Pastelería y Tortas
```

más una opción de `Pendientes de ambas áreas` agrupada, solo cuando el actor esté
autorizado y la prueba física confirme que mejora la coordinación.

La decisión final se tomará en `UX-STATION-005`, `UX-STATION-008`,
`UX-STATION-009`, `FOGO-UX-002`, `FOGO-UX-003`, `FOGO-UX-008`,
`FOGO-UX-009` y `FOGO-UX-015`.

---

#### 31. Aplicación por producto

##### 31.1 FOGO

Operación:

- producción pendiente por área;
- receta resumida;
- lote;
- cantidades;
- controles;
- resultado.

Administración densa separada:

- versiones de receta;
- ingredientes maestros;
- rendimientos;
- equivalencias;
- restricciones;
- publicación;
- historial;
- acceso por área;
- comparación de versiones.

##### 31.2 NEXO

Operación:

- tarea, ubicación, producto, cantidad y escaneo.

Administración:

- conciliación;
- maestros;
- políticas;
- análisis de diferencias;
- configuraciones territoriales.

##### 31.3 ORIGO

Operación:

- orden seleccionada;
- recepción física;
- lote;
- vencimiento;
- diferencias.

Administración:

- proveedores;
- condiciones;
- órdenes;
- aprobaciones;
- comparación y desempeño.

##### 31.4 PULSO

Operación:

- venta, cobro, entrega y servicio.

Administración:

- menú;
- precios;
- cierres;
- conciliaciones;
- promociones;
- configuración.

##### 31.5 VISO y NUMERA

Podrán utilizar densidad media o alta porque concentran planeación, aprobación,
configuración, conciliación, finanzas y auditoría, pero deberán mantener contexto,
masking, permisos por acción, accesibilidad y protección de operaciones masivas.

##### 31.6 TALENTO y ANIMA

Los trabajadores y candidatos conservarán experiencias enfocadas. Las tablas
densas de personas, turnos, expedientes o novedades pertenecerán a superficies
administrativas protegidas, no al dispositivo operativo compartido.

---

#### 32. Supervisión

Un supervisor podrá necesitar una vista comparativa de dos áreas, pero se
separarán:

```text
VER Y COORDINAR
→ superficie de supervisión

EJECUTAR PRODUCCIÓN
→ superficie operativa con área exacta

CAMBIAR RECETA O POLÍTICA
→ administración o configuración
```

La vista de supervisión no concederá por sí misma capacidad para producir,
corregir, anular o administrar recetas.

---

#### 33. Estados vacíos y datos parciales

Se distinguirán:

- no existen registros;
- no existen en el periodo;
- filtros excluyen resultados;
- actor sin visibilidad;
- área sin tareas;
- datos cargados parcialmente;
- agregados pendientes;
- fuente desactualizada;
- error de una sección;
- resultado demasiado grande.

No se mostrará `0` como resultado confirmado cuando una parte de los datos no
pudo cargarse.

---

#### 34. Antipatrones prohibidos

```text
UNA TABLA POR CADA TABLA DE BASE DE DATOS
```

```text
TODO EN UNA SOLA PANTALLA PORQUE CABE
```

```text
PC GRANDE = BACKOFFICE
```

```text
GERENTE = TODAS LAS COLUMNAS Y ACCIONES
```

```text
DOS ÁREAS PERMITIDAS = ÁREA UNIFICADA
```

```text
RECETA COMPARTIDA = DOS COPIAS EDITABLES
```

```text
SELECCIONAR TODO = TODA LA ORGANIZACIÓN
```

```text
COLUMNA OCULTA CON CSS = DATO PROTEGIDO
```

```text
EXPORTAR = VER EN PANTALLA
```

```text
EDITAR CELDA = CORREGIR HECHO HISTÓRICO
```

---

#### 35. Eventos conceptuales

Podrán definirse posteriormente eventos como:

```text
DENSE_VIEW_OPENED
DENSE_VIEW_SCOPE_RESOLVED
DENSE_VIEW_FILTER_CHANGED
DENSE_VIEW_COLUMNS_CHANGED
BULK_SELECTION_CREATED
BULK_ACTION_REQUESTED
BULK_ACTION_COMPLETED
BULK_ACTION_PARTIAL
ADMIN_DATA_CONFLICT_DETECTED
MULTI_AREA_STATION_OPENED
ACTIVE_AREA_SWITCH_REQUESTED
ACTIVE_AREA_SWITCH_CONFIRMED
ACTIVE_AREA_SWITCH_BLOCKED
RECIPE_AREA_PROJECTION_OPENED
```

La telemetría no será autorización ni fuente de contexto.

---

#### 36. Métricas

Se medirán:

- tiempo para encontrar información;
- errores de alcance;
- filtros olvidados;
- columnas utilizadas;
- acciones masivas parciales;
- conflictos;
- exportaciones;
- retrocesos;
- accesibilidad;
- tiempo de decisión;
- confusión entre áreas;
- cambios de área fallidos;
- producción atribuida al área incorrecta;
- recetas abiertas fuera de contexto.

Criterios duros:

```text
PRODUCCIÓN REGISTRADA SIN ÁREA EXACTA = 0

RECETA EJECUTABLE FUERA DE SU ALCANCE = 0

DATO SENSIBLE EXPUESTO POR COLUMNA O EXPORTACIÓN = 0

ACCIÓN MASIVA SOBRE ELEMENTOS FUERA DEL RESUMEN = 0
```

Las métricas no se utilizarán para maximizar cantidad de registros visibles ni
sancionar a quien detecte diferencias reales.

---

#### 37. Migración de superficies existentes

La aplicación posterior deberá inventariar:

- tablas;
- grids;
- paneles;
- filtros;
- columnas;
- acciones por fila;
- operaciones masivas;
- vistas táctiles que reutilizan componentes de escritorio;
- POS con backoffice expuesto;
- dispositivos que conservan áreas o actores;
- recetarios duplicados;
- rutas de exportación;
- densidad sin justificación.

Clasificación:

```text
CONFORME
REQUIERE_SIMPLIFICACIÓN_OPERATIVA
REQUIERE_WORKSPACE_ADMINISTRATIVO
REQUIERE_SEPARACIÓN_DE_CARRIL
REQUIERE_MASKING
REQUIERE_PROTECCIÓN_DE_LOTE
REQUIERE_REDISEÑO_MULTIÁREA
LEGACY
CANDIDATA_A_RETIRO
```

No se retirará una superficie hasta contar con reemplazo, validación, migración,
rollback y cobertura de pruebas.

---

#### 38. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-227 a TREQ-UX-249
```

El detalle completo se incorpora al archivo canónico
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

Cobertura resumida:

1. densidad reservada a trabajo administrativo justificable;
2. clasificación explícita de densidad;
3. prohibición de backoffice en operación;
4. independencia frente al hardware;
5. tablas y semántica;
6. filtros y alcance;
7. orden y agregaciones;
8. columnas y preferencias;
9. selección y operaciones masivas;
10. edición y conflictos;
11. rendimiento y virtualización;
12. teclado, mouse y tacto;
13. responsive y reflow;
14. accesibilidad;
15. sensibilidad y masking;
16. contexto administrativo;
17. exportación e impresión;
18. offline y frescura;
19. límites de dispositivos compartidos;
20. estación multiárea;
21. proyección de recetas por área;
22. cambio de área y atribución;
23. prototipado, métricas y migración.

---

#### 39. Criterios de aceptación

- [ ] La densidad queda definida por necesidad de decisión, no por tamaño del equipo.
- [ ] Las superficies operativas permanecen enfocadas aunque se ejecuten en PC táctil.
- [ ] Se distinguen los niveles `D0` a `D4`.
- [ ] Tablas, filtros, columnas, selección y lotes tienen contratos explícitos.
- [ ] La densidad no amplía permisos ni visibilidad de campos.
- [ ] Se protegen sensibilidad, exportación y dispositivos compartidos.
- [ ] Los dos POS del Centro de Producción pueden modelarse como estaciones multiárea sin inventar un área combinada.
- [ ] Cada ejecución conserva un área exacta y autoritativa.
- [ ] Se recomienda inicialmente acceso separado a Repostería y Pastelería y Tortas, con bandeja conjunta agrupada solo si el prototipo lo valida.
- [ ] Una receta compartida conserva identidad y versión únicas.
- [ ] La administración de recetas queda fuera del POS operativo.
- [ ] Todas las decisiones pendientes tienen tarea propietaria concreta.
- [ ] Se crean `TREQ-UX-227` a `TREQ-UX-249`.
- [ ] No se implementa código, hardware, migraciones ni cambios en Supabase.
- [ ] `UX-BASE-013` permanece sin iniciar.

---

#### 40. Estado y continuidad

```text
UX-BASE-011 APROBADA
UX-BASE-012 APROBADA
UX-BASE-013 NO INICIADA
```

No se inicia `UX-BASE-013` hasta la aprobación expresa de esta tarea.


### ✅ UX-BASE-013 — Definir comportamiento con conectividad inestable

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-012 — Diseñar interfaces densas solo para administración` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-014 — Definir reanudación del proceso después de interrupciones`  
**Artefacto producido:** `UX-CONNECTIVITY-DEGRADATION-CONTRACT-001`  
**Versión del estándar transversal:** `CONNECTIVITY-DEGRADATION-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de conectividad, frescura, captura local, sincronización, idempotencia, conflictos, autorización, dispositivos compartidos, periféricos, contingencia y recuperación  
**Caso operativo incorporado:** computadores POS táctiles multiárea del primer piso del Centro de Producción  
**Cambios en código, Service Workers, almacenamiento local, colas, RPC, RLS, Supabase, dispositivos, red o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir cómo deberá comportarse Vento OS cuando la conectividad sea lenta,
intermitente, parcial, ausente o incierta, evitando dos fallos opuestos:

1. detener innecesariamente toda la operación ante una degradación recuperable;
2. presentar como confirmado un efecto que solo existe en el dispositivo o cuya
   ejecución real es desconocida.

El contrato deberá permitir que cada proceso declare, de forma explícita:

- qué información puede consultarse desde una copia local;
- qué datos pueden capturarse sin conexión;
- qué comandos pueden quedar en cola;
- qué acciones exigen conexión y autorización en línea;
- qué nivel de frescura requiere cada dato;
- cómo se identifica y ordena cada operación pendiente;
- qué sucede al recuperar conectividad;
- cómo se resuelven conflictos;
- cuándo debe activarse una contingencia manual;
- cómo se mantiene informado al trabajador sin lenguaje técnico.

Regla central:

```text
SIN CONEXIÓN
≠ SIN CONTROL

CAPTURA LOCAL
≠ EFECTO EMPRESARIAL CONFIRMADO

REINTENTO
≠ NUEVA OPERACIÓN
```

---

#### 2. Continuidad lógica

```text
SUPERFICIE ADECUADA AL CARRIL Y DISPOSITIVO
UX-BASE-011 Y UX-BASE-012
        ↓
COMPORTAMIENTO PREDECIBLE CUANDO
LA CONECTIVIDAD CAMBIA
UX-BASE-013
        ↓
REANUDAR LA TAREA, EL BORRADOR,
LA CUSTODIA Y EL PUNTO EXACTO
UX-BASE-014
```

`UX-BASE-013` define el comportamiento durante la degradación y la
sincronización inicial. `UX-BASE-014` definirá con mayor detalle cómo una
persona retoma el proceso después de interrupciones humanas, técnicas,
operativas o de sesión.

---

#### 3. Decisión principal

Toda superficie deberá separar cuatro preguntas:

```text
1. ¿EL DISPOSITIVO TIENE RED?
2. ¿EL SERVICIO REQUERIDO RESPONDE?
3. ¿LOS DATOS SIGUEN SIENDO VIGENTES?
4. ¿LA OPERACIÓN FUE CONFIRMADA?
```

No se permitirá deducirlas de un único icono de Wi-Fi.

```text
WIFI CONECTADO
≠ INTERNET DISPONIBLE
≠ SUPABASE DISPONIBLE
≠ SESIÓN VÁLIDA
≠ DATOS FRESCOS
≠ OPERACIÓN CONFIRMADA
```

---

#### 4. Vector canónico de conectividad

La interfaz y los contratos internos deberán representar, como mínimo, estas
dimensiones:

```text
network_reachability
service_reachability
session_validity
context_freshness
resource_freshness
sync_health
peripheral_health
last_verified_at
```

Estados conceptuales iniciales:

```text
ONLINE_HEALTHY
ONLINE_DEGRADED
INTERMITTENT
OFFLINE_CONFIRMED
CONNECTIVITY_UNKNOWN
RECOVERING
SYNC_BLOCKED
```

El estado será derivado y versionado. No será una selección del usuario.

##### 4.1 `ONLINE_HEALTHY`

Los servicios necesarios responden dentro del umbral aprobado y las
operaciones pueden seguir su política ordinaria.

##### 4.2 `ONLINE_DEGRADED`

Existe comunicación, pero con latencia, errores parciales o servicios
secundarios no disponibles. No se cambiará automáticamente a offline si una
operación segura todavía puede confirmarse.

##### 4.3 `INTERMITTENT`

La disponibilidad cambia durante la interacción. La interfaz deberá evitar
reenvíos automáticos no controlados y conservar el estado de cada intento.

##### 4.4 `OFFLINE_CONFIRMED`

La ausencia de conectividad está comprobada. Solo se habilitarán capacidades
expresamente autorizadas para este estado.

##### 4.5 `CONNECTIVITY_UNKNOWN`

No puede determinarse si la solicitud no salió, llegó, se ejecutó o perdió la
respuesta. Es el estado de mayor riesgo para reintentos.

##### 4.6 `RECOVERING`

La red reapareció, pero todavía deben revalidarse hora, sesión, contexto,
versiones, colas y conflictos.

##### 4.7 `SYNC_BLOCKED`

Existe conectividad, pero una o más operaciones no pueden sincronizarse por
conflicto, autorización, versión, esquema, dependencia o evidencia faltante.

---

#### 5. Política por capacidad

Cada consulta y comando deberá declarar uno de estos modos:

```text
ONLINE_REQUIRED
ONLINE_PREFERRED
STALE_READ_ONLY
OFFLINE_CAPTURE_ALLOWED
OFFLINE_QUEUE_ALLOWED
MANUAL_CONTINGENCY
NOT_AVAILABLE_OFFLINE
```

| Modo                      | Comportamiento                                                      |
| ------------------------- | ------------------------------------------------------------------- |
| `ONLINE_REQUIRED`         | No se inicia ni confirma sin respuesta autoritativa                 |
| `ONLINE_PREFERRED`        | Opera en línea y puede degradarse según política específica         |
| `STALE_READ_ONLY`         | Permite consultar una copia con frescura y limitaciones visibles    |
| `OFFLINE_CAPTURE_ALLOWED` | Permite registrar observaciones como borrador local                 |
| `OFFLINE_QUEUE_ALLOWED`   | Permite preparar un comando idempotente para sincronización         |
| `MANUAL_CONTINGENCY`      | Remite a procedimiento físico controlado y reconciliación posterior |
| `NOT_AVAILABLE_OFFLINE`   | Explica por qué la acción no puede ejecutarse                       |

Regla:

```text
LA APLICACIÓN NO DECLARA "MODO OFFLINE" GLOBAL

CADA CAPACIDAD DECLARA
SU POLÍTICA DE CONECTIVIDAD
```

Una misma pantalla podrá mostrar una receta en `STALE_READ_ONLY`, permitir
capturar una medición en `OFFLINE_CAPTURE_ALLOWED` y bloquear una aprobación
`ONLINE_REQUIRED`.

---

#### 6. Clasificación inicial de operaciones

##### 6.1 Consultas de referencia

Podrán admitir `STALE_READ_ONLY` cuando exista:

- snapshot identificado;
- versión;
- fecha de última verificación;
- política de expiración;
- alcance del actor;
- ausencia de datos revocados o sensibles no reutilizables.

##### 6.2 Borradores

Podrán guardarse localmente si:

- pertenecen a un actor identificado;
- el dispositivo es confiable;
- la información está minimizada y protegida;
- existe identificador estable;
- no se presentan como confirmados;
- pueden eliminarse o transferirse de forma controlada.

##### 6.3 Observaciones físicas

Cantidades, temperaturas, pesos, daños, tiempos, fotos o resultados podrán
capturarse localmente cuando el proceso lo autorice. El dato conservará momento,
actor, dispositivo, método y recurso observado.

##### 6.4 Claims, inicios y handoffs

Serán `ONLINE_REQUIRED` por defecto porque afectan concurrencia, responsabilidad
y custodia. Una excepción offline requerirá lease o autorización previa,
alcance finito, vencimiento y reconciliación explícita.

##### 6.5 Acciones irreversibles o sensibles

Aprobaciones, anulaciones, reversas, pagos, reembolsos, permisos, publicaciones,
exportaciones, cierre de caja, cambios maestros y excepciones sensibles serán
`ONLINE_REQUIRED` salvo contrato específico posterior.

##### 6.6 Administración densa

Las superficies `D2`, `D3` y `D4` serán `ONLINE_REQUIRED` por defecto. Una copia
obsoleta podrá ser solo lectura y nunca aprobar, configurar o ejecutar lotes.

---

#### 7. Presentación persistente del estado

La conectividad deberá permanecer visible sin cubrir la tarea.

Ejemplos:

```text
Con conexión
Última verificación: ahora
```

```text
Conexión inestable
Tus cambios se guardarán en este equipo hasta poder confirmarlos
```

```text
Sin conexión
3 operaciones pendientes de sincronizar
Última actualización de datos: 14:32
```

```text
Conexión recuperada
Validando sesión y operaciones pendientes
```

No serán suficientes:

```text
Offline
Error de red
Algo salió mal
```

La interfaz distinguirá:

- estado de la red;
- estado del dato mostrado;
- estado de la acción actual;
- cantidad de operaciones pendientes;
- conflictos que requieren intervención.

---

#### 8. Estados de una captura o comando

```text
LOCAL_DRAFT
READY_TO_SYNC
WAITING_FOR_DEPENDENCY
SYNCING
ACKNOWLEDGED
REJECTED_RETRYABLE
REJECTED_TERMINAL
CONFLICT
REAUTH_REQUIRED
RECONCILIATION_REQUIRED
CANCELLED_LOCAL
SUPERSEDED
```

Definiciones:

- `LOCAL_DRAFT`: trabajo guardado únicamente en el dispositivo;
- `READY_TO_SYNC`: operación completa y elegible para intentar sincronización;
- `WAITING_FOR_DEPENDENCY`: depende de otra operación local o remota;
- `SYNCING`: intento activo con identificador estable;
- `ACKNOWLEDGED`: servidor confirmó receipt y resultado;
- `REJECTED_RETRYABLE`: fallo temporal seguro para reintentar;
- `REJECTED_TERMINAL`: no puede repetirse sin corrección;
- `CONFLICT`: el recurso o su versión cambiaron;
- `REAUTH_REQUIRED`: la autoridad anterior no puede reutilizarse;
- `RECONCILIATION_REQUIRED`: el resultado físico y digital deben compararse;
- `CANCELLED_LOCAL`: borrador descartado antes de envío;
- `SUPERSEDED`: reemplazado por una operación posterior vinculada.

```text
LOCAL_DRAFT O READY_TO_SYNC
≠ COMPLETADO
```

---

#### 9. Mensajes de confirmación

La interfaz utilizará lenguaje inequívoco:

```text
Guardado en este equipo
Pendiente de sincronizar
```

```text
Enviado al servidor
Esperando confirmación
```

```text
Confirmado por el servidor
Movimiento MV-2026-00184
```

```text
No sabemos si la operación se completó
Verificaremos el estado antes de permitir otro intento
```

Queda prohibido mostrar:

```text
Listo
Completado
Guardado
```

sin indicar si el resultado es local o autoritativo cuando exista ambigüedad.

---

#### 10. Registro conceptual de operación local

Toda operación pendiente deberá conservar, cuando aplique:

```text
local_operation_id
idempotency_key
operation_type
process_id
process_instance_id
task_id
resource_type
resource_id
resource_version_observed
actor_id
principal_id
device_id
site_id
area_id
shift_id
checkin_id
permission_code_requested
context_id_observed
context_resolved_at
captured_at_device
captured_at_server_estimate
payload_schema_version
application_version
payload_minimized
evidence_refs
dependency_ids
retry_policy
sync_status
attempt_count
last_attempt_at
server_receipt_id
conflict_ref
```

Esta forma es conceptual. No autoriza una tabla, tecnología o estructura física.

---

#### 11. Idempotencia y reintentos

Toda mutación elegible para cola deberá poseer una clave de idempotencia estable.

```text
MISMA INTENCIÓN EMPRESARIAL
→ MISMA IDEMPOTENCY KEY

NUEVA INTENCIÓN
→ NUEVA KEY
```

El sistema deberá impedir duplicar:

- movimientos de inventario;
- recepciones;
- consumos;
- producción;
- pagos;
- entregas;
- check-ins;
- impresiones empresariales;
- handoffs;
- eventos de auditoría de negocio.

Un botón deshabilitado o un indicador de carga no será defensa suficiente.

Ante `CONNECTIVITY_UNKNOWN`:

```text
CONSULTAR RECEIPT O ESTADO
→ SOLO DESPUÉS DECIDIR
  REINTENTAR, CONCILIAR O DETENER
```

---

#### 12. Orden y dependencias

Las operaciones no se sincronizarán únicamente por fecha de creación.

Se conservará un grafo o secuencia explícita cuando exista dependencia:

```text
CREAR BORRADOR DE LOTE
→ REGISTRAR MEDICIÓN
→ COMPLETAR RESULTADO
→ EMITIR MOVIMIENTO
```

Reglas:

1. una operación dependiente no se enviará antes de su prerequisito;
2. un rechazo terminal bloqueará dependientes;
3. una operación independiente podrá continuar;
4. las colas de actores diferentes no se fusionarán;
5. las operaciones de áreas distintas conservarán su área;
6. la prioridad no alterará el orden causal;
7. una operación superseded no se ejecutará posteriormente.

---

#### 13. Frescura y expiración

Cada dato susceptible de obsolescencia deberá declarar:

```text
fetched_at
valid_until
freshness_class
source_version
stale_behavior
```

Clases iniciales:

```text
REAL_TIME_REQUIRED
SHORT_LIVED
SHIFT_SCOPED
DAY_SCOPED
VERSION_SCOPED
REFERENCE_LONG_LIVED
```

Ejemplos:

- permisos, actor, claims y estados transaccionales: `REAL_TIME_REQUIRED`;
- turno y check-in: `SHIFT_SCOPED`, con expiración explícita;
- receta aprobada: `VERSION_SCOPED`;
- instrucciones generales no sensibles: `REFERENCE_LONG_LIVED`;
- existencia disponible para prometer o retirar: normalmente requiere alta
  frescura y validación previa a la mutación.

```text
DATO EN CACHÉ
≠ DATO VIGENTE
```

Una pantalla deberá mostrar cuándo fue actualizada y qué acciones están
limitadas por su antigüedad.

---

#### 14. Autorización durante la degradación

El dispositivo no conservará permisos como autoridad indefinida.

Solo podrá admitirse operación offline protegida cuando exista un paquete o
envelope previamente emitido y verificable que declare:

```text
actor
capacidad exacta
recurso o alcance finito
sitio y área
turno o ventana
actividad permitida
límites cuantitativos
emitido en
vence en
versión de política
identificador de dispositivo
revocación o condición de revalidación
```

Reglas:

```text
PERMISO VISTO ANTES
≠ PERMISO VÁLIDO AHORA

CONTEXTO EN CACHÉ
≠ CONTEXTO AUTORIZADO PARA NUEVA MUTACIÓN
```

Al sincronizar se revalidarán actor, vínculo, turno, contexto, dispositivo,
permiso, recurso, versión y denegaciones aplicables.

Una revocación podrá convertir una captura local en evidencia conservable, pero
no obligará al servidor a ejecutar el efecto solicitado.

---

#### 15. Dispositivos compartidos y cambio de actor

Toda cola local deberá estar aislada por:

```text
DISPOSITIVO
+
ACTOR
+
CONTEXTO
+
ÁREA
```

Al cambiar de trabajador:

1. se detendrán nuevas mutaciones del actor anterior;
2. se mostrará el estado de sus borradores y pendientes;
3. no se asignarán al nuevo actor;
4. se protegerán o retirarán de la vista;
5. se resolverá una sesión nueva;
6. se creará una cola lógica separada;
7. las operaciones pendientes conservarán la atribución original.

Sin conexión, el cambio de actor solo permitirá mutaciones cuando exista un
mecanismo offline de identidad y autorización aprobado para ese dispositivo.
De lo contrario, la estación quedará en consulta o contingencia.

---

#### 16. Lecturas y caché

La caché deberá aplicar:

- partición por actor, territorio y sensibilidad;
- versión de esquema;
- cifrado cuando corresponda;
- expiración;
- invalidación por logout o cambio de actor;
- limpieza remota o local ante revocación cuando sea técnicamente posible;
- límites de volumen;
- exclusión de secretos;
- minimización de datos.

No se almacenarán offline por conveniencia:

- salarios completos;
- diagnósticos;
- información bancaria;
- permisos detallados de terceros;
- notas internas sensibles;
- secretos o tokens de larga duración;
- datasets administrativos masivos.

---

#### 17. Captura de hechos físicos

Una observación offline deberá distinguir:

```text
HECHO OBSERVADO
MOMENTO DE OBSERVACIÓN
MOMENTO DE REGISTRO LOCAL
MOMENTO DE SINCRONIZACIÓN
```

Ejemplo:

```text
Temperatura observada: 3,8 °C
Observada a las 10:14
Guardada en este equipo a las 10:14
Sincronizada a las 10:27
```

No se sustituirá la hora de observación por la hora de sincronización.

Una fotografía, firma o medición deberá quedar vinculada a la observación y no
subirse como archivo huérfano.

---

#### 18. Claims, custodia y handoffs

Por defecto, no se permitirá offline:

- tomar una tarea de una cola compartida;
- transferir custodia;
- declarar recepción definitiva;
- liberar a un actor anterior;
- completar un handoff;
- iniciar trabajo que excluya a otros actores.

Una excepción requerirá:

- lease emitido previamente;
- actor y recurso exactos;
- vencimiento;
- ámbito territorial;
- secuencia permitida;
- evidencia local;
- tratamiento de doble ejecución;
- reconciliación posterior.

```text
ENTREGA FÍSICA REALIZADA SIN CONEXIÓN
→ PUEDE SER HECHO OBSERVADO

HANDOFF DIGITAL CONFIRMADO
→ SOLO DESPUÉS DE RECONCILIAR Y ACEPTAR
```

---

#### 19. Acciones obligatoriamente en línea

Sin contrato posterior más específico, serán `ONLINE_REQUIRED`:

- aprobar o rechazar decisiones sensibles;
- anular, revertir o reabrir;
- cambiar permisos, roles o dispositivo;
- publicar horarios, recetas, precios o configuración;
- realizar pagos, reembolsos o cierres financieros;
- aceptar exportaciones o descargas sensibles;
- ejecutar lotes administrativos;
- cambiar fuentes maestras;
- resolver conflictos con pérdida de información;
- aplicar overrides;
- finalizar una conciliación.

La interfaz explicará la razón y conservará el trabajo preparatorio permitido.

---

#### 20. Conflictos

Se clasifican inicialmente:

```text
RESOURCE_VERSION_CONFLICT
CONTEXT_CHANGED
AUTHORIZATION_CHANGED
DUPLICATE_OPERATION
DEPENDENCY_REJECTED
SCHEMA_INCOMPATIBLE
BUSINESS_STATE_CHANGED
QUANTITY_CONFLICT
CUSTODY_CONFLICT
TIME_WINDOW_EXPIRED
```

La resolución nunca utilizará `last write wins` para efectos empresariales.

Opciones controladas:

```text
ACCEPT_SERVER_STATE
REAPPLY_ALLOWED_FIELDS
CREATE_CORRECTION
SPLIT_OPERATION
ESCALATE
DISCARD_LOCAL_DRAFT
MANUAL_RECONCILIATION
```

El trabajador deberá saber:

- qué cambió;
- qué parte local se conserva;
- qué parte no puede aplicarse;
- quién puede resolver;
- si el hecho físico ya ocurrió;
- cuál es la siguiente acción segura.

---

#### 21. Secuencia de reconexión

Al detectar conectividad no se enviará toda la cola inmediatamente.

Secuencia canónica:

```text
1. ESTABILIZAR CONECTIVIDAD
2. VERIFICAR HORA Y SERVICIOS
3. REVALIDAR SESIÓN Y DISPOSITIVO
4. RESOLVER NUEVO ACCESS CONTEXT
5. DESCARGAR REVOCACIONES Y VERSIONES
6. CLASIFICAR OPERACIONES PENDIENTES
7. SINCRONIZAR POR DEPENDENCIAS
8. CONSULTAR RECEIPTS
9. DETENER Y EXPLICAR CONFLICTOS
10. ACTUALIZAR PROYECCIONES
11. CONFIRMAR AL TRABAJADOR
```

La recuperación parcial de un servicio no habilitará capacidades dependientes
de otro servicio todavía indisponible.

---

#### 22. Ciclo de vida de la aplicación

La cola deberá sobrevivir, según política, a:

- recarga;
- cierre accidental;
- suspensión del sistema;
- reinicio;
- cambio de orientación;
- pérdida temporal de energía.

Pero no deberá ejecutarse en segundo plano sin validar:

- actor todavía atribuible;
- sesión o envelope vigente;
- dispositivo autorizado;
- aplicación y esquema compatibles;
- red suficientemente estable;
- operación no cancelada;
- dependencias satisfechas.

Cerrar la aplicación no equivaldrá a descartar una operación ni a confirmarla.

---

#### 23. Evidencias y archivos

Los archivos usarán estados propios:

```text
LOCAL_ONLY
QUEUED
UPLOADING
UPLOADED_UNLINKED
LINKED_AND_CONFIRMED
FAILED_RETRYABLE
FAILED_TERMINAL
```

Reglas:

- se mostrará progreso real;
- un upload parcial no será evidencia confirmada;
- se evitarán duplicados mediante hash o identificador estable;
- se validará tamaño, tipo, sensibilidad y retención;
- el recurso de negocio no se cerrará si la evidencia obligatoria falta;
- una evidencia local sensible se protegerá y eliminará según política después
  de la confirmación.

---

#### 24. Periféricos y conectividad independiente

La red del backend y el periférico se tratarán por separado.

Ejemplos:

```text
BACKEND OFFLINE + IMPRESORA LOCAL DISPONIBLE
```

no significa que una impresión empresarial pueda emitirse sin cola, receipt y
política.

```text
BACKEND ONLINE + DATÁFONO SIN RESPUESTA
```

no significa que el pago falló ni que pueda repetirse.

Cada integración deberá indicar:

- comando enviado;
- recepción por el periférico;
- ejecución física;
- resultado conocido o desconocido;
- posibilidad de reintento;
- conciliación requerida.

---

#### 25. Contingencia manual

La contingencia no será una autorización genérica para usar papel.

Todo procedimiento manual deberá definir:

```text
CONDICIÓN DE ACTIVACIÓN
RESPONSABLE
FORMATO O IDENTIFICADOR
DATOS MÍNIMOS
CONTROL DE DUPLICADOS
CUSTODIA
NUMERACIÓN
MOMENTO DE DIGITALIZACIÓN
RESPONSABLE DE CONCILIAR
CRITERIO DE CIERRE
```

Cuando vuelva la conexión:

- no se copiará ciegamente;
- se verificará si el sistema ya contiene el efecto;
- se relacionará el soporte físico;
- se registrará el actor original;
- se distinguirá observación, transcripción y aprobación;
- se cerrará la contingencia únicamente después de conciliar.

---

#### 26. NEXO

Política inicial:

- catálogos, LOC y LPN podrán consultarse offline solo con versión y frescura;
- conteos físicos podrán capturarse localmente;
- retiros o movimientos requerirán política específica, reserva o envelope;
- una existencia cacheada no permitirá prometer disponibilidad definitiva;
- preparación, carga, tránsito y recepción conservarán estados separados;
- la custodia no se transferirá digitalmente sin confirmación o reconciliación;
- escaneos repetidos no crearán movimientos duplicados.

---

#### 27. FOGO

Política inicial:

- una receta aprobada y versionada podrá quedar disponible como referencia
  offline cuando su política lo permita;
- deberá mostrarse la versión y la última validación;
- el inicio de un lote será online por defecto;
- cantidades, tiempos, temperaturas, merma y resultado podrán capturarse como
  observaciones locales cuando exista lote válido y actor atribuible;
- finalizar el lote y emitir consumos o producto terminado exigirá
  sincronización y conciliación;
- una receta revocada o sustituida no podrá iniciar trabajo nuevo al reconectar.

---

#### 28. POS multiárea del Centro de Producción

Para los computadores táctiles compartidos de Repostería y Pastelería y Tortas:

```text
COLA LOCAL
→ SEPARADA POR DISPOSITIVO, ACTOR Y ÁREA
```

Reglas:

1. la pantalla conservará visible el área activa;
2. una receta cacheada conservará su área y versión;
3. cambiar de área sin conexión no ampliará la autorización;
4. si el trabajador ya posee un contexto offline válido para ambas áreas, el
   cambio deberá ser explícito y cada operación conservará el área elegida;
5. si no existe autorización offline válida, el cambio quedará bloqueado o en
   consulta;
6. un borrador de Repostería no aparecerá como borrador de Pastelería y Tortas;
7. las operaciones de las dos estaciones no se fusionarán por cercanía física;
8. al reconectar se detectarán conflictos de lote, receta, claim y versión.

La decisión definitiva de capacidad offline por estación corresponde a
`UX-STATION-007`, `NFR-REQ-004`, `AUTH-DEV-*`, `FOGO-UX-*` y los paquetes E5.

---

#### 29. ORIGO

- órdenes y líneas podrán consultarse con frescura visible;
- cantidades recibidas, lotes, vencimientos y condición física podrán capturarse
  localmente;
- la recepción definitiva, actualización de inventario, documento y diferencias
  deberán sincronizarse como una unidad o saga controlada;
- una orden modificada producirá conflicto, no sobrescritura;
- la misma recepción no podrá registrarse dos veces por timeout.

---

#### 30. PULSO y pagos

- crear o preparar un pedido offline requerirá contrato específico de numeración,
  precios, impuestos, catálogo y disponibilidad;
- aceptar un pago nunca se inferirá del estado de red;
- datáfono, efectivo, pago en línea y factura tendrán estados independientes;
- una respuesta desconocida del proveedor bloqueará un segundo cobro hasta
  consultar o conciliar;
- cierres, devoluciones, reembolsos y anulaciones serán online por defecto;
- comandas e impresiones usarán colas idempotentes y receipts.

---

#### 31. ANIMA, TALENTO y PASS

- check-in y check-out requerirán política estricta de identidad, hora y
  duplicados;
- una marcación local deberá mostrar que está pendiente y no conceder por sí
  sola un contexto operativo confirmado;
- documentos sensibles no se almacenarán offline salvo necesidad y protección
  aprobadas;
- formularios largos conservarán borrador local protegido;
- el cliente podrá consultar información cacheada no sensible con frescura
  visible;
- consentimientos, canjes, cambios de identidad y acciones financieras serán
  online por defecto.

---

#### 32. VISO y NUMERA

Las superficies administrativas densas serán `ONLINE_REQUIRED`.

Podrán admitir `STALE_READ_ONLY` únicamente para consulta claramente marcada,
sin:

- aprobaciones;
- conciliaciones;
- ajustes;
- configuración;
- exportaciones;
- lotes;
- cambios de periodo;
- decisiones sobre información incompleta.

Un snapshot administrativo deberá mostrar periodo, territorio, filtros, versión
y momento de extracción.

---

#### 33. Privacidad y seguridad local

El almacenamiento local deberá protegerse con controles proporcionales:

- cifrado o protección del sistema;
- aislamiento por aplicación y actor;
- bloqueo del dispositivo;
- expiración;
- minimización;
- borrado después de confirmar;
- detección de manipulación cuando corresponda;
- no inclusión de tokens o secretos de larga duración;
- logs sin payload sensible;
- procedimiento ante pérdida o revocación del dispositivo.

Una función offline se descartará si el riesgo de conservar el dato localmente
supera el beneficio operativo.

---

#### 34. Accesibilidad y carga cognitiva

El estado de conectividad:

- no dependerá solo de color;
- tendrá texto y semántica accesible;
- se anunciará cuando cambie materialmente;
- no interrumpirá repetidamente con modales;
- permitirá revisar operaciones pendientes;
- diferenciará local, en cola, conflicto y confirmado;
- no usará animaciones continuas innecesarias;
- ofrecerá acciones comprensibles por teclado, tacto y lector de pantalla.

Los contadores se expresarán con significado:

```text
3 operaciones guardadas en este equipo
1 necesita revisión
```

No:

```text
Sync queue: 3
Error 409: 1
```

---

#### 35. Observabilidad y soporte

Se registrarán sin culpabilizar al trabajador:

- cambios de estado de conectividad;
- latencia y disponibilidad por servicio;
- tamaño y edad de colas;
- intentos;
- receipts;
- duplicados evitados;
- conflictos;
- rechazos por autorización;
- tiempo hasta sincronización;
- contingencias;
- pérdida o recuperación de borradores;
- versión de aplicación y esquema.

Los logs técnicos no expondrán datos sensibles. La interfaz mostrará una
referencia segura para soporte.

---

#### 36. Métricas y guardrails

Métricas:

- porcentaje de tareas completadas sin pérdida;
- tiempo offline y hasta sincronización;
- cantidad y antigüedad de pendientes;
- conflictos por tipo;
- duplicados evitados;
- reintentos;
- operaciones con resultado desconocido;
- contingencias activadas;
- tiempo de reconciliación;
- tareas abandonadas por conectividad;
- claridad reportada por trabajadores.

Guardrails:

```text
EFECTO DUPLICADO POR REINTENTO = 0

OPERACIÓN LOCAL PRESENTADA COMO CONFIRMADA = 0

BORRADOR DE UN ACTOR ENTREGADO A OTRO = 0

MUTACIÓN SENSIBLE CON CONTEXTO VENCIDO = 0

CONFLICTO RESUELTO POR LAST WRITE WINS = 0
```

Las métricas no se utilizarán para responsabilizar al trabajador por fallas de
red, infraestructura, latencia o sincronización.

---

#### 37. Pruebas obligatorias

Cada capacidad deberá probar, según aplique:

- red lenta;
- pérdida antes de enviar;
- pérdida durante envío;
- pérdida después de ejecutar y antes de responder;
- reconexión breve y nueva caída;
- servidor parcial;
- sesión expirada;
- permiso revocado;
- cambio de actor;
- cambio de área;
- dos dispositivos sobre el mismo recurso;
- esquema de cola antiguo;
- aplicación actualizada con pendientes;
- almacenamiento lleno;
- reloj incorrecto;
- periférico disponible sin backend;
- backend disponible sin periférico;
- cierre y reinicio del equipo;
- evidencia parcialmente subida;
- contingencia manual y reconciliación.

La prueba se realizará además en estaciones reales cuando la operación dependa
de red, dispositivo o periférico.

---

#### 38. Propiedad de decisiones posteriores

| Decisión                                       | Tarea propietaria                                                                                                        |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| política offline y sincronización no funcional | `NFR-REQ-004`                                                                                                            |
| disponibilidad por proceso                     | `NFR-REQ-001`                                                                                                            |
| tiempos y latencia                             | `NFR-REQ-003`                                                                                                            |
| hardware, red y periféricos                    | `NFR-REQ-008`                                                                                                            |
| observabilidad y soporte                       | `NFR-REQ-009`                                                                                                            |
| respaldo, RTO y RPO                            | `NFR-REQ-010`                                                                                                            |
| compatibilidad de dispositivos                 | `NFR-REQ-011`                                                                                                            |
| contingencia por estación                      | `UX-STATION-007`                                                                                                         |
| recuperación del punto de trabajo              | `UX-BASE-014`                                                                                                            |
| identidad y límites de dispositivos            | `AUTH-DEV-001` a `AUTH-DEV-016`                                                                                          |
| colas y entrega confiable                      | `QUEUE-ARC-001` a `QUEUE-ARC-012`                                                                                        |
| integración entre aplicaciones                 | `INT-APP-001` a `INT-APP-010`                                                                                            |
| protección de comandos                         | `AUTH-SRV-*` y `AUTH-DB-*`                                                                                               |
| materialización por pantalla                   | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `AUTH-UI-001` a `AUTH-UI-060`                                                     |
| comportamiento por dominio                     | subbloques `NEXO-UX-*`, `FOGO-UX-*`, `ORIGO-UX-*`, `PULSO-UX-*`, `ANIMA-*`, `VISO-*`, `NUMERA-*`, `TALENTO-*` y `PASS-*` |
| prueba física y con trabajadores               | `UX-STATION-008`; `UX-QA-001` a `UX-QA-030`                                                                              |

No queda una decisión diferida sin tarea propietaria.

---

#### 39. Migración de comportamiento existente

La aplicación posterior deberá inventariar:

- formularios que pierden contenido al caer la red;
- botones que reenvían mutaciones;
- mensajes `Guardado` ambiguos;
- cachés sin fecha;
- permisos persistidos en cliente;
- colas sin actor o área;
- service workers no gobernados;
- reintentos automáticos sin idempotencia;
- impresiones o pagos con resultado desconocido;
- operaciones en `localStorage` sin protección;
- pantallas que se vacían offline;
- borradores heredados entre trabajadores;
- sincronizaciones `last write wins`;
- contingencias en papel sin reconciliación;
- dispositivos que cambian de área usando un selector local.

Clasificación:

```text
CONFORME
REQUIERE_ESTADO_VISIBLE
REQUIERE_IDEMPOTENCIA
REQUIERE_OUTBOX
REQUIERE_FRESCURA
REQUIERE_REAUTORIZACIÓN
REQUIERE_CONCILIACIÓN
REQUIERE_CONTINGENCIA
NO_APTO_OFFLINE
LEGACY
CANDIDATA_A_RETIRO
```

Ningún flujo se declarará offline-capable antes de pruebas de pérdida, duplicado,
conflicto, actor, área, reinicio y reconciliación.

---

#### 40. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-250 a TREQ-UX-273
```

El detalle completo se incorpora al archivo canónico
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

Cobertura resumida:

1. vector de conectividad;
2. política por capacidad;
3. estado visible;
4. diferenciación local-servidor;
5. contrato de outbox;
6. idempotencia;
7. dependencias;
8. frescura;
9. autorización offline;
10. dispositivos compartidos;
11. caché y privacidad;
12. observaciones físicas;
13. claims, handoffs y custodia;
14. acciones sensibles;
15. conflictos;
16. reconexión;
17. ciclo de vida;
18. evidencias;
19. periféricos;
20. contingencia;
21. estaciones multiárea FOGO;
22. administración en solo lectura;
23. accesibilidad;
24. pruebas, observabilidad y migración.

---

#### 41. Criterios de aceptación

- [ ] Se distinguen red, servicio, frescura, sesión y confirmación.
- [ ] Cada capacidad declara una política explícita de conectividad.
- [ ] La interfaz diferencia borrador local, cola, sincronización, conflicto y confirmación.
- [ ] Ningún resultado desconocido se reintenta ciegamente.
- [ ] Las mutaciones en cola conservan identidad, actor, contexto, versión e idempotencia.
- [ ] Las dependencias se sincronizan en orden causal.
- [ ] La caché muestra frescura y no amplía autorización.
- [ ] Los dispositivos compartidos aíslan colas por actor y área.
- [ ] Las observaciones físicas conservan la hora real de observación.
- [ ] Claims, custodia y handoffs son online por defecto.
- [ ] Las acciones sensibles permanecen online salvo contrato posterior específico.
- [ ] Los conflictos no se resuelven mediante `last write wins`.
- [ ] La reconexión revalida sesión, contexto, versiones y revocaciones antes de enviar.
- [ ] Archivos y periféricos tienen estados independientes y receipts.
- [ ] La contingencia manual posee activación y conciliación formal.
- [ ] Los POS multiárea del Centro de Producción conservan colas, recetas y operaciones por área.
- [ ] Las superficies administrativas son online por defecto.
- [ ] Se protegen privacidad, accesibilidad y soporte.
- [ ] Todas las decisiones posteriores tienen tarea propietaria exacta.
- [ ] Se crean `TREQ-UX-250` a `TREQ-UX-273`.
- [ ] No se implementan colas, código, Service Workers, migraciones ni cambios en Supabase.
- [ ] `UX-BASE-014` permanece sin iniciar.

---

#### 42. Estado y continuidad

```text
UX-BASE-012 APROBADA
UX-BASE-013 APROBADA
UX-BASE-014 NO INICIADA
```

No se inicia `UX-BASE-014` hasta la aprobación expresa de esta tarea.


### ✅ UX-BASE-014 — Definir reanudación del proceso después de interrupciones

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-013 — Definir comportamiento con conectividad inestable` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-015 — Validar terminología con trabajadores reales`  
**Artefacto producido:** `UX-PROCESS-RESUMPTION-CONTRACT-001`  
**Versión del estándar transversal:** `PROCESS-RESUMPTION-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de pausa, checkpoint, borradores, claims, custodia, handoffs, conflictos, reautorización, recuperación, dispositivos compartidos y continuidad entre aplicaciones  
**Caso operativo incorporado:** computadores POS táctiles multiárea del primer piso del Centro de Producción  
**Cambios en código, almacenamiento local, colas, RPC, RLS, Supabase, dispositivos o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir cómo deberá retomar Vento OS una tarea después de una interrupción sin:

1. obligar a la persona a reconstruir manualmente todo el contexto;
2. repetir efectos que ya pudieron quedar confirmados;
3. continuar sobre una versión, actor, área, turno o custodia vencidos;
4. perder borradores, observaciones o evidencia recuperable;
5. permitir que otro trabajador herede trabajo o autoridad de forma implícita;
6. tratar la última URL visitada como el estado real del proceso.

Regla central:

```text
REANUDAR
≠ VOLVER A LA ÚLTIMA PANTALLA

REANUDAR
=
RECONSTRUIR EL PUNTO DE TRABAJO
+
REVALIDAR EL ESTADO ACTUAL
+
COMPARAR CAMBIOS
+
CONTINUAR DE FORMA SEGURA
```

---

#### 2. Continuidad lógica

```text
OPERACIÓN DEGRADADA, COLAS Y RESULTADOS DESCONOCIDOS
UX-BASE-013
        ↓
CHECKPOINT, VALIDACIÓN Y PUNTO SEGURO DE RETORNO
UX-BASE-014
        ↓
VALIDACIÓN DEL LENGUAJE Y COMPRENSIÓN REAL
UX-BASE-015
```

`UX-BASE-013` determina qué puede quedar local, en cola, confirmado o en
conciliación. Esta tarea determina cómo retomar el trabajo después de una pausa,
cambio de sesión, pérdida de energía, navegación, handoff, conflicto o recuperación
técnica.

---

#### 3. Decisión principal

Toda reanudación seguirá esta secuencia:

```text
IDENTIFICAR ACTOR Y DISPOSITIVO
→ RESOLVER ACCESS CONTEXT NUEVO
→ LOCALIZAR TAREA Y RECURSO AUTORITATIVOS
→ LOCALIZAR CHECKPOINT Y BORRADORES
→ CONSULTAR RECEIPTS Y OPERACIONES PENDIENTES
→ COMPARAR VERSIONES, CLAIM Y CUSTODIA
→ CLASIFICAR EL ESTADO DE REANUDACIÓN
→ MOSTRAR RESUMEN HUMANO
→ CONTINUAR, REVISAR, REASIGNAR O CONCILIAR
```

Ningún campo autoritativo se restaurará desde una URL, cookie no firmada,
`localStorage`, estado React o selección visual sin revalidación de servidor.

---

#### 4. Taxonomía de interrupciones

Toda interrupción deberá clasificarse, como mínimo, en una de estas categorías:

```text
HUMAN_PAUSE
APP_BACKGROUND
NAVIGATION_AWAY
SESSION_EXPIRED
ACTOR_CHANGE
DEVICE_CHANGE
SITE_OR_AREA_CHANGE
SHIFT_OR_CHECKIN_CHANGE
CONNECTIVITY_LOSS
POWER_OR_RESTART
PERIPHERAL_FAILURE
DEPENDENCY_WAIT
HANDOFF
CONCURRENT_CHANGE
EMERGENCY
APPLICATION_UPDATE
UNKNOWN_INTERRUPTION
```

La categoría no determina por sí sola que el trabajo sea reanudable. Solo orienta
qué hechos deben comprobarse.

---

#### 5. Tres modos distintos

```text
PAUSA
→ el mismo actor conserva una tarea recuperable

HANDOFF
→ otro actor acepta explícitamente tarea o custodia

RECUPERACIÓN
→ existe conflicto, resultado desconocido, pérdida de contexto
  o inconsistencia que exige conciliación
```

Reglas:

```text
PAUSA
≠ HANDOFF

HANDOFF
≠ CAMBIO SILENCIOSO DE USUARIO

RECUPERACIÓN
≠ REINTENTAR TODO
```

---

#### 6. Checkpoint semántico

Un checkpoint será una referencia durable al punto lógico de trabajo, no una
copia completa de la interfaz.

```text
CHECKPOINT SEMÁNTICO
≠ URL
≠ HISTORIAL DEL NAVEGADOR
≠ SCREENSHOT
≠ ESTADO COMPLETO DEL COMPONENTE
≠ PERMISO CONGELADO
```

Forma conceptual:

```ts
type ProcessCheckpoint = {
  checkpoint_id: string;
  process_id: string;
  process_instance_id: string;
  task_id: string | null;
  process_step: string;
  owner_app_code: string;

  resource_refs: Array<{
    resource_type: string;
    resource_id: string;
    observed_version: string | null;
  }>;

  actor_id: string;
  principal_id: string | null;
  device_id: string | null;
  context_id_observed: string;
  site_id: string | null;
  area_id: string | null;
  shift_id: string | null;
  checkin_id: string | null;

  claim_id: string | null;
  custody_ref: string | null;
  draft_ref: string | null;
  pending_operation_ids: string[];
  evidence_refs: string[];

  created_at: string;
  last_updated_at: string;
  valid_until: string | null;
  resume_policy: string;
  sensitivity_class: string;
  schema_version: string;
};
```

La forma es documental. No autoriza tablas, tipos físicos ni almacenamiento.

---

#### 7. Qué debe conservar y qué no

El checkpoint podrá conservar referencias a:

- proceso, instancia y etapa;
- tarea;
- recurso y versión observada;
- actor y contexto originales;
- sede y área;
- claim o lease;
- custodia;
- borrador;
- operaciones locales o pendientes;
- evidencia;
- aplicación propietaria;
- momento y vigencia.

No conservará como autoridad:

- permisos ya concedidos;
- rol efectivo futuro;
- sesión válida indefinidamente;
- estado objetivo solicitado por el cliente;
- resultado empresarial no confirmado;
- secretos, PIN o tokens reutilizables;
- payloads sensibles innecesarios;
- una copia completa del recurso autoritativo.

---

#### 8. Estados de reanudación

```text
NO_CHECKPOINT
DRAFT_ONLY
CHECKPOINT_AVAILABLE
VALIDATING
RESUMABLE
RESUMABLE_WITH_REVIEW
WAITING_FOR_DEPENDENCY
HANDOFF_REQUIRED
REASSIGNMENT_REQUIRED
CONFLICT
RESULT_UNKNOWN
REAUTH_REQUIRED
RECONCILIATION_REQUIRED
SUPERSEDED
COMPLETED
EXPIRED
INVALID
```

La interfaz no mostrará un botón `Continuar` hasta terminar la clasificación.

---

#### 9. Reanudación directa

`RESUMABLE` solo procederá cuando se compruebe:

- mismo actor atribuible;
- sesión y dispositivo permitidos;
- contexto compatible;
- turno y check-in válidos cuando se exijan;
- tarea todavía abierta;
- recurso en versión compatible;
- claim o lease vigente o renovable;
- custodia compatible;
- ausencia de resultado desconocido;
- borrador compatible con el esquema actual;
- permiso exacto revalidado.

La aplicación abrirá el punto semántico y no la portada genérica.

Ejemplos:

```text
Continuar conteo de Congelados

Retomar recepción OC-2026-00418

Continuar lote de torta de chocolate
```

---

#### 10. Reanudación con revisión

`RESUMABLE_WITH_REVIEW` se utilizará cuando el trabajo pueda continuar, pero
cambió información relevante.

La interfaz deberá mostrar:

```text
DESDE TU PAUSA
- cambió el estado del recurso;
- se actualizaron dos líneas;
- tu borrador conserva tres observaciones;
- la tarea sigue asignada a ti;
- debes revisar las diferencias antes de confirmar.
```

Acciones posibles:

```text
COMPARAR CAMBIOS
APLICAR CAMPOS COMPATIBLES
DESCARTAR CAMPOS OBSOLETOS
CONTINUAR CON LA VERSIÓN ACTUAL
SOLICITAR REVISIÓN
```

Nunca se aplicará `last write wins` de forma silenciosa.

---

#### 11. Borrador frente a estado empresarial

```text
BORRADOR
→ trabajo todavía no confirmado

CHECKPOINT
→ referencia al punto de continuidad

OPERACIÓN PENDIENTE
→ intención ya preparada para sincronizar

RECEIPT
→ evidencia de que el servidor recibió o ejecutó

ESTADO EMPRESARIAL
→ verdad autoritativa del proceso
```

Estos objetos no se sustituirán entre sí.

Un borrador podrá recuperarse aunque la acción final ya no sea ejecutable. En
ese caso se conservará como evidencia, se permitirá copiar información segura o
se enviará a conciliación, pero no se aplicará automáticamente.

---

#### 12. Resultados desconocidos

Cuando una interrupción ocurra después de enviar una mutación:

```text
RESULTADO DESCONOCIDO
→ CONSULTAR IDEMPOTENCY KEY
→ CONSULTAR RECEIPT
→ CONSULTAR ESTADO DEL RECURSO
→ CLASIFICAR
```

Posibles resultados:

```text
CONFIRMADO
NO EJECUTADO Y REINTENTABLE
RECHAZADO
PARCIAL
CONFLICTO
SIN EVIDENCIA SUFICIENTE
```

Queda prohibido regenerar una nueva intención para “intentar de nuevo” antes de
resolver la intención original.

---

#### 13. Actor y cambio de trabajador

Un checkpoint pertenecerá al actor que produjo el trabajo, salvo handoff formal.

```text
CAMBIAR DE TRABAJADOR
≠ TRANSFERIR BORRADOR
≠ TRANSFERIR CLAIM
≠ TRANSFERIR CUSTODIA
```

Al cambiar de actor:

1. se detienen nuevas mutaciones del actor anterior;
2. se clasifica su trabajo como guardado, pendiente, confirmado o en conflicto;
3. se limpia información personal de la superficie;
4. el nuevo actor se identifica;
5. se resuelve un contexto nuevo;
6. el sistema ofrece solo tareas que pueda aceptar;
7. cualquier transferencia exige un handoff explícito.

---

#### 14. Handoff formal

Un handoff deberá conservar:

```text
QUIÉN ENTREGA
QUIÉN RECIBE
QUÉ TAREA O CUSTODIA
ESTADO Y VERSIÓN
EVIDENCIA
PENDIENTES
CONDICIONES
MOMENTO DE OFERTA
MOMENTO DE ACEPTACIÓN
```

Estados conceptuales:

```text
OFFERED
ACCEPTED
REJECTED
EXPIRED
CANCELLED
PARTIALLY_ACCEPTED
RECONCILIATION_REQUIRED
```

```text
HANDOFF OFRECIDO
≠ HANDOFF ACEPTADO
```

Hasta la aceptación, la responsabilidad no se atribuirá al receptor.

---

#### 15. Claims, leases y trabajo excluyente

Al reanudar una tarea con claim o lease, el sistema comprobará:

- propietario;
- recurso;
- etapa;
- vigencia;
- heartbeat cuando aplique;
- dispositivo;
- área;
- estado del proceso;
- posibilidad de renovar;
- política de takeover.

No podrá asumirse que un claim sigue vigente porque la pantalla permanece abierta.

Resultados posibles:

```text
CLAIM_VALID
CLAIM_RENEWED
CLAIM_EXPIRED_AVAILABLE
CLAIM_HELD_BY_OTHER
TAKEOVER_REQUIRES_APPROVAL
TASK_ALREADY_COMPLETED
CLAIM_CONFLICT
```

---

#### 16. Custodia física

La custodia no se deducirá de una pantalla ni de un borrador.

Si una remisión, activo, efectivo, lote o documento cambió físicamente de manos
durante la interrupción, la reanudación deberá:

- identificar la última custodia confirmada;
- registrar el hecho físico observado;
- comparar con el handoff digital;
- impedir dobles aceptaciones;
- separar actor físico, transcriptor y aprobador;
- enviar inconsistencias a conciliación.

---

#### 17. Cambio de contexto

Toda variación en:

- sede;
- área;
- turno;
- check-in;
- rol operativo;
- delegación;
- simulación;
- dispositivo;

obliga a resolver un `AccessContext` nuevo.

```text
CONTEXTO NUEVO COMPATIBLE
→ reanudar después de reautorizar

CONTEXTO NUEVO INCOMPATIBLE
→ bloquear, reasignar o hacer handoff
```

La sede primaria, último turno o selector visual no se utilizarán como fallback.

---

#### 18. Cambio de versión del recurso

La comparación deberá distinguir:

```text
SIN CAMBIOS
CAMBIOS NO SUPERPUESTOS
CAMBIOS SUPERPUESTOS
RECURSO CERRADO
RECURSO CANCELADO
RECURSO REEMPLAZADO
ESQUEMA INCOMPATIBLE
```

Política:

- cambios no superpuestos podrán reaplicarse con revisión;
- cambios superpuestos exigirán comparación;
- un recurso cerrado no se reabrirá por restaurar el navegador;
- un recurso reemplazado dirigirá al nuevo recurso vinculado;
- un esquema incompatible conservará el borrador original y exigirá migración o soporte.

---

#### 19. Reinicio, suspensión y actualización

Los checkpoints recuperables podrán sobrevivir, según política:

- recarga;
- cierre accidental;
- suspensión del dispositivo;
- reinicio;
- pérdida breve de energía;
- actualización compatible de la aplicación.

Al volver:

```text
NO EJECUTAR EN SEGUNDO PLANO AUTOMÁTICAMENTE
NO RESTAURAR AUTORIDAD OBSOLETA
NO MOSTRAR DATOS DEL ACTOR ANTERIOR
```

Primero se validarán actor, sesión, aplicación, esquema, dispositivo, red,
pendientes y cancelaciones.

---

#### 20. Continuidad entre dispositivos

Un trabajador podrá continuar en otro dispositivo solo cuando:

- el checkpoint esté sincronizado o exista una transferencia segura;
- el nuevo dispositivo admita la aplicación y capacidad;
- el actor vuelva a identificarse;
- el contexto sea compatible;
- los datos sensibles puedan mostrarse;
- el claim permita mover o renovar la sesión;
- no exista trabajo local exclusivo sin sincronizar en el equipo anterior.

Si existe un borrador solo local, la interfaz no prometerá que está disponible en
otro equipo.

---

#### 21. Continuidad entre aplicaciones

```text
APLICACIÓN A
→ CHECKPOINT SEMÁNTICO
→ DEEP LINK OPACO
→ APLICACIÓN PROPIETARIA B
→ REVALIDACIÓN
→ CONTINUACIÓN
→ RETORNO O SIGUIENTE PASO
```

El enlace podrá transportar identificadores opacos de proceso, tarea, recurso y
retorno. No transportará autoridad, permiso, actor autoritativo ni estado objetivo.

---

#### 22. POS multiárea de FOGO

Para los computadores del primer piso del Centro de Producción:

```text
REPOSTERÍA
≠ PASTELERÍA Y TORTAS
```

Cada checkpoint conservará:

- área propietaria;
- receta y versión;
- lote;
- tarea;
- actor;
- dispositivo;
- cantidades y controles registrados;
- evidencia;
- pendientes de sincronización.

Al cambiar de área:

1. se guarda o descarta conscientemente el trabajo actual;
2. se liberan o transfieren claims según política;
3. se resuelve contexto nuevo;
4. se carga la bandeja del área seleccionada;
5. no se mezclan borradores, recetarios ni lotes.

Una bandeja conjunta podrá mostrar ambos grupos, pero abrir una tarea siempre
activará y mostrará el área exacta antes de registrar producción.

---

#### 23. Tareas repetitivas y lotes

En una secuencia de elementos, el checkpoint distinguirá:

```text
ELEMENTOS CONFIRMADOS
ELEMENTO ACTUAL
ELEMENTOS PENDIENTES
ELEMENTOS FALLIDOS
ELEMENTOS EN CONFLICTO
```

Al retomar:

- no se repetirán los confirmados;
- el elemento actual se consultará por idempotencia y receipt;
- los pendientes se recalcularán;
- los incompatibles saldrán del lote;
- el resumen indicará qué cambió.

---

#### 24. Acciones sensibles y administrativas

No se reanudarán directamente después de sesión vencida o cambio de dispositivo:

- aprobaciones;
- anulaciones y reversas;
- pagos o reembolsos;
- cambios de permisos;
- publicación de recetas, horarios, precios o configuración;
- exportaciones sensibles;
- overrides;
- lotes administrativos materiales.

Podrá restaurarse el trabajo preparatorio, pero la acción final exigirá
reautorización, resumen actualizado y confirmación proporcional al riesgo.

---

#### 25. Excepciones

Un caso excepcional interrumpido conservará por separado:

- solicitud;
- aprobación;
- ejecución;
- conciliación;
- cierre.

```text
APROBACIÓN EXISTENTE
≠ EJECUCIÓN PENDIENTE AUTORIZADA INDEFINIDAMENTE
```

Al retomar se comprobarán vigencia, alcance, aprobador, recurso, versión y usos
previos. Un override expirado no reaparecerá como disponible.

---

#### 26. Dependencias y esperas largas

Una tarea en espera podrá generar un checkpoint sin ocupar permanentemente la
pantalla.

La reanudación deberá mostrar:

- evento esperado;
- responsable actual;
- última actualización;
- vencimiento;
- si la dependencia ocurrió;
- si la tarea fue reasignada;
- siguiente acción segura.

Una notificación no sustituye la aceptación ni prueba que el estado siga vigente.

---

#### 27. Archivos, evidencia y periféricos

Al retomar se distinguirán:

```text
ARCHIVO SOLO LOCAL
ARCHIVO SUBIDO SIN VINCULAR
ARCHIVO VINCULADO Y CONFIRMADO
COMANDO DE IMPRESIÓN ENVIADO
IMPRESIÓN CONFIRMADA
RESULTADO DE PERIFÉRICO DESCONOCIDO
```

No se cerrará el proceso por encontrar un archivo local o un comando enviado.
Los efectos físicos y digitales se conciliarán por separado.

---

#### 28. Superficie de reanudación

La interfaz deberá ofrecer un resumen como:

```text
Tarea interrumpida

Recepción OC-2026-00418
Vento Café · Recepción
Último avance: 14:32

Guardado:
- 8 cantidades confirmadas
- 2 observaciones en borrador

Cambió desde entonces:
- el proveedor actualizó una línea

[Comparar y continuar]
[Guardar para después]
[Descartar borrador]
```

No se limitará a:

```text
¿Deseas restaurar la sesión anterior?
```

---

#### 29. Prioridad de elementos al volver

Después de identificar al actor, la pantalla inicial priorizará:

```text
1. RESULTADOS DESCONOCIDOS O CONCILIACIONES
2. CUSTODIAS Y HANDOFFS PENDIENTES
3. TAREAS CON CLAIM VIGENTE
4. BORRADORES RECUPERABLES
5. TAREAS PRÓXIMAS A VENCER
6. COLA ORDINARIA
```

No se abrirá automáticamente una tarea sensible sin que el actor vea el contexto
y el resumen de cambios.

---

#### 30. Accesibilidad

La experiencia de reanudación:

- anunciará la existencia de trabajo recuperable;
- explicará qué se guardó y qué cambió;
- mantendrá foco lógico después de actualizar;
- funcionará con teclado, tacto y lector de pantalla;
- no dependerá de color, hover o gestos ocultos;
- permitirá revisar conflictos sin límite de tiempo arbitrario;
- evitará modales repetitivos en cada navegación;
- conservará una ruta clara para posponer o descartar.

---

#### 31. Privacidad y dispositivos compartidos

En dispositivos compartidos:

- la pantalla bloqueada no mostrará detalles sensibles del checkpoint;
- el trabajo del actor anterior no aparecerá al nuevo trabajador;
- la lista de reanudación se filtrará después de identificar al actor;
- los borradores locales estarán cifrados o protegidos según la arquitectura futura;
- logout, revocación y retención podrán volver un checkpoint no recuperable;
- soporte técnico no verá contenido empresarial completo por defecto.

---

#### 32. Retención y limpieza

Todo checkpoint tendrá política de:

```text
VIGENCIA
RETENCIÓN
EXPIRACIÓN
CANCELACIÓN
SUPERSESIÓN
BORRADO SEGURO
PRESERVACIÓN POR AUDITORÍA
```

No se acumularán indefinidamente borradores antiguos en kioscos o navegadores.
La limpieza no eliminará evidencia requerida ni operaciones todavía pendientes.

---

#### 33. Telemetría y soporte

Se registrarán, sin usar texto visible como identificador primario:

- `checkpoint_id`;
- proceso y etapa;
- categoría de interrupción;
- estado de reanudación;
- tiempo hasta retomar;
- resultado;
- conflicto;
- campos recuperados o descartados;
- cambio de actor, dispositivo o área;
- referencia de soporte;
- versión del contrato.

Métricas útiles:

```text
TASA DE REANUDACIÓN EXITOSA
PÉRDIDA DE BORRADORES
TIEMPO DE RECUPERACIÓN
CONFLICTOS POR VERSIÓN
HANDOFFS NO ACEPTADOS
RESULTADOS DESCONOCIDOS RESUELTOS
REPETICIONES EVITADAS POR IDEMPOTENCIA
```

No se utilizarán para sancionar pausas legítimas ni comparar velocidad individual
sin contexto operativo.

---

#### 34. Pruebas obligatorias

Se deberán probar, según aplique:

- recarga y cierre accidental;
- app en background;
- reinicio y pérdida de energía;
- sesión expirada;
- logout y revocación;
- cambio de actor;
- cambio de área;
- cambio de dispositivo;
- claim vencido o tomado por otro;
- recurso modificado, cerrado o reemplazado;
- resultado desconocido;
- borrador con esquema anterior;
- actualización de aplicación;
- archivo solo local;
- periférico con resultado incierto;
- handoff ofrecido, aceptado, rechazado y vencido;
- custodia física sin confirmación digital;
- lote parcial;
- dos dispositivos intentando retomar;
- contingencia manual;
- accesibilidad y privacidad en dispositivo compartido.

---

#### 35. Propiedad de decisiones posteriores

| Decisión                                   | Tarea propietaria                                                                                                                                             |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| identidad, contexto y reautorización       | `AUTH-CTX-*`; `AUTH-SRV-*`; `AUTH-DB-*`                                                                                                                       |
| sesiones y cambio de actor en dispositivos | `AUTH-DEV-007` a `AUTH-DEV-016`; `UX-STATION-004`                                                                                                             |
| superficie contextual de reanudación       | `UX-STATION-005`; `UX-STATION-010` a `UX-STATION-012`                                                                                                         |
| conectividad, outbox y reconciliación      | `UX-BASE-013`; `NFR-REQ-004`; `QUEUE-ARC-001` a `QUEUE-ARC-012`                                                                                               |
| claims, leases, tareas y handoffs          | `QUEUE-ARC-001` a `QUEUE-ARC-012`; `INT-APP-001` a `INT-APP-010`; `PROC-SCREEN-001` a `PROC-SCREEN-028`; subbloques UX y AUTH propietarios de cada aplicación |
| deep links y continuidad cross-app         | `INT-APP-001` a `INT-APP-010`; `AUTH-UI-001` a `AUTH-UI-060`                                                                                                  |
| retención, evidencia y privacidad          | `EVID-ARC-001` a `EVID-ARC-010`; `NFR-REQ-005`; `NFR-REQ-006`; `NFR-REQ-010`                                                                                  |
| comportamiento por producto                | subbloques UX y AUTH de cada aplicación                                                                                                                       |
| POS multiárea y FOGO                       | `UX-STATION-002` a `UX-STATION-012`; `FOGO-UX-002` a `FOGO-UX-015`; `FOGO-AUTH-002`, `003`, `013` y `016`                                                     |
| validación con trabajadores                | `UX-STATION-008`; `UX-QA-001` a `UX-QA-030`                                                                                                                   |

La arquitectura concreta de claims, leases y handoffs deberá materializarse en las tareas canónicas ya asignadas en la tabla anterior. Si durante E3 se detecta una brecha no cubierta, deberá vincularse en ese mismo momento a una tarea existente o generar una tarea explícita antes de implementar; no se autoriza dejarla como decisión narrativa ni inventar identificadores en código.

---

#### 36. Migración de comportamiento existente

Se inventariarán:

- formularios que desaparecen al navegar;
- restauraciones basadas en URL;
- borradores sin actor o recurso;
- modales genéricos de restaurar sesión;
- claims sin expiración;
- tareas retomadas por otro usuario;
- acciones reenviadas después de timeout;
- datos personales visibles tras logout;
- pestañas que compiten sobre el mismo recurso;
- deep links que restauran autoridad;
- borradores incompatibles después de actualización;
- dispositivos compartidos que mezclan áreas;
- cierres que eliminan evidencia recuperable.

Clasificación:

```text
CONFORME
REQUIERE_CHECKPOINT
REQUIERE_BORRADOR_DURABLE
REQUIERE_REAUTORIZACIÓN
REQUIERE_COMPARACIÓN
REQUIERE_HANDOFF
REQUIERE_CLAIM
REQUIERE_CONCILIACIÓN
NO_REANUDABLE
LEGACY
CANDIDATA_A_RETIRO
```

---

#### 37. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-274 a TREQ-UX-296
```

Cobertura resumida:

1. checkpoint semántico;
2. taxonomía de interrupciones;
3. algoritmo de reanudación;
4. estados visibles;
5. reanudación directa;
6. revisión y comparación;
7. borradores y receipts;
8. resultado desconocido;
9. cambio de actor;
10. handoffs;
11. claims y leases;
12. custodia;
13. cambio de contexto;
14. versiones y conflictos;
15. reinicio y actualización;
16. continuidad entre dispositivos;
17. continuidad entre aplicaciones;
18. POS multiárea FOGO;
19. lotes y tareas repetitivas;
20. acciones sensibles y excepciones;
21. dependencias, archivos y periféricos;
22. accesibilidad, privacidad y retención;
23. pruebas, telemetría y migración.

---

#### 38. Criterios de aceptación

- [ ] Reanudar no depende de la última URL ni del estado del componente.
- [ ] Existe un checkpoint semántico versionado y limitado.
- [ ] Se distinguen pausa, handoff y recuperación.
- [ ] La reanudación resuelve actor, contexto, recurso, versión, claim y custodia.
- [ ] No se muestra `Continuar` antes de clasificar el estado.
- [ ] Los cambios concurrentes se comparan sin `last write wins`.
- [ ] Borrador, checkpoint, operación pendiente, receipt y estado empresarial permanecen separados.
- [ ] Los resultados desconocidos se consultan antes de reintentar.
- [ ] El cambio de trabajador no transfiere trabajo ni autoridad implícitamente.
- [ ] Todo handoff exige oferta y aceptación trazables.
- [ ] Claims y leases se revalidan y no se presumen vigentes.
- [ ] La custodia física se concilia con la digital.
- [ ] Los cambios de sede, área, turno, rol o dispositivo crean contexto nuevo.
- [ ] Reinicio y actualización no restauran autoridad obsoleta.
- [ ] La continuidad entre dispositivos exige sincronización o transferencia segura.
- [ ] Los deep links no transportan autorización.
- [ ] Los POS multiárea conservan checkpoints por área, receta, lote y actor.
- [ ] Las tareas repetitivas no repiten elementos confirmados.
- [ ] Las acciones sensibles exigen reautorización y resumen actualizado.
- [ ] Se protegen accesibilidad, privacidad, retención y soporte.
- [ ] Todas las decisiones diferidas tienen propietario documental.
- [ ] Se crean `TREQ-UX-274` a `TREQ-UX-296`.
- [ ] No se implementa código, almacenamiento, migraciones ni cambios en Supabase.
- [ ] `UX-BASE-015` permanece sin iniciar.

---

#### 39. Estado y continuidad

```text
UX-BASE-013 APROBADA
UX-BASE-014 APROBADA
UX-BASE-015 NO INICIADA
```

No se inicia `UX-BASE-015` hasta la aprobación expresa de esta tarea.


### ✅ UX-BASE-015 — Validar terminología con trabajadores reales

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-014 — Definir reanudación del proceso después de interrupciones` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-001 — Definir criticidad y disponibilidad por proceso`  
**Artefactos producidos:** `UX-TERMINOLOGY-VALIDATION-CONTRACT-001`; estructura inicial de `UX-TERMINOLOGY-REGISTER-001`  
**Versión del estándar transversal:** `TERMINOLOGY-VALIDATION-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** gobierno semántico, lenguaje de interfaz, validación contextual, accesibilidad, consistencia cross-app, métricas, cambios y migración  
**Cambios en código, traducciones, pantallas, Supabase, migraciones, roles o permisos:** no autorizados

---

#### 1. Propósito

Definir cómo Vento OS deberá seleccionar, probar, aprobar, versionar y mantener la
terminología que ven trabajadores, responsables, administradores, clientes y
otros actores, de forma que las palabras utilizadas:

1. representen correctamente el concepto empresarial;
2. sean comprendidas por el actor que debe actuar;
3. permitan predecir qué ocurrirá antes de pulsar una acción;
4. conserven el mismo significado entre aplicaciones;
5. no expongan nombres técnicos, códigos, permisos ni estructuras internas;
6. no dependan de una capacitación para compensar una interfaz ambigua;
7. puedan adaptarse a variantes locales sin fragmentar el modelo canónico.

Regla central:

```text
TERMINOLOGÍA APROBADA
≠ PALABRA PREFERIDA POR DISEÑO
≠ TEXTO ESCRITO POR DESARROLLO
≠ TÉRMINO CONOCIDO SOLO POR GERENCIA

TERMINOLOGÍA APROBADA
=
CONCEPTO SEMÁNTICO ESTABLE
+
ETIQUETA ADECUADA AL ACTOR Y CONTEXTO
+
COMPRENSIÓN DEMOSTRADA EN UNA TAREA REALISTA
+
EVIDENCIA VERSIONADA
```

---

#### 2. Continuidad lógica

```text
PRINCIPIOS DE EXPERIENCIA
UX-BASE-001 a UX-BASE-014
        ↓
VALIDACIÓN DEL LENGUAJE QUE LOS MATERIALIZA
UX-BASE-015
        ↓
CRITICIDAD, DISPONIBILIDAD Y REQUISITOS NO FUNCIONALES
NFR-REQ-001 a NFR-REQ-011
```

`UX-BASE-015` cierra la serie `UX-BASE-*`, pero no declara cerrada toda la
experiencia de E2. La terminología deberá aplicarse y volver a validarse durante
el diseño de estaciones, prototipos, pantallas y subbloques UX de cada producto.

---

#### 3. Decisión principal

Toda palabra o frase visible que pueda afectar comprensión, decisión o ejecución
seguirá este ciclo:

```text
IDENTIFICAR EL CONCEPTO
→ DEFINIR SU SIGNIFICADO Y LÍMITES
→ INVENTARIAR ETIQUETAS ACTUALES
→ PROPONER ETIQUETA POR AUDIENCIA
→ PROBARLA EN UNA TAREA CONTEXTUAL
→ OBSERVAR INTERPRETACIÓN Y CONDUCTA
→ CLASIFICAR HALLAZGOS
→ CORREGIR Y REPROBAR
→ APROBAR CON EVIDENCIA
→ VERSIONAR Y MONITOREAR
```

No se congelará una etiqueta porque “suena bien”, porque aparece en la base de
datos o porque una persona responsable la usa habitualmente.

---

#### 4. Qué significa validar

Validar un término significa demostrar que un trabajador representativo puede:

- explicar con sus propias palabras qué significa;
- distinguirlo de conceptos cercanos;
- predecir el efecto de una acción;
- encontrarlo en el momento correcto;
- completar la tarea sin instrucciones adicionales;
- reconocer el estado posterior;
- detectar cuándo no debe continuar.

No equivale a:

- preguntar si le gusta la palabra;
- mostrar la definición antes de probar;
- entrenar y después medir memoria;
- obtener aprobación exclusiva de gerencia;
- contar clics sin verificar comprensión;
- asumir que una persona silenciosa entendió.

---

#### 5. Arquitectura semántica

Se separarán cinco capas:

```text
CONCEPTO EMPRESARIAL
→ significado canónico

IDENTIFICADOR SEMÁNTICO
→ clave estable no visible

ETIQUETA POR AUDIENCIA
→ texto que comprende el actor

ALIAS RECONOCIDO
→ variante aceptada para búsqueda, ayuda o transición

IDENTIFICADOR TÉCNICO
→ código, permiso, tabla, enum, RPC o evento
```

Ejemplo conceptual:

```text
CONCEPTO: ubicación física controlada de inventario
SEMANTIC_ID: inventory.location
ETIQUETA CANDIDATA: Ubicación de inventario
ALIAS POSIBLE: Estante; Zona; Nevera
TÉRMINO TÉCNICO: LOC
```

`LOC` podrá conservarse internamente, pero no se declarará etiqueta operativa
válida hasta demostrar que el actor realmente la comprende y la necesita.

---

#### 6. Registro canónico de terminología

`UX-TERMINOLOGY-REGISTER-001` tendrá, como mínimo:

| Campo                   | Propósito                                            |
| ----------------------- | ---------------------------------------------------- |
| `concept_id`            | Identidad semántica estable                          |
| `domain_owner`          | Proceso o aplicación propietaria                     |
| `definition`            | Significado y límites                                |
| `examples`              | Casos incluidos                                      |
| `counterexamples`       | Casos que no pertenecen al concepto                  |
| `technical_identifiers` | Códigos internos relacionados                        |
| `worker_label`          | Etiqueta operativa validada                          |
| `admin_label`           | Etiqueta administrativa cuando difiera legítimamente |
| `short_label`           | Variante compacta autorizada                         |
| `accepted_aliases`      | Variantes reconocidas sin crear conceptos nuevos     |
| `prohibited_terms`      | Palabras ambiguas, técnicas o peligrosas             |
| `audiences`             | Actores para los que aplica                          |
| `contexts`              | Procesos, pasos, sedes, áreas y dispositivos         |
| `locale`                | Variante lingüística aplicable                       |
| `status`                | Estado de validación                                 |
| `validation_evidence`   | Sesiones, resultados y fecha                         |
| `owner`                 | Responsable de cambio                                |
| `version`               | Versión semántica y de etiqueta                      |
| `affected_surfaces`     | Pantallas, documentos, impresos y notificaciones     |
| `revalidation_trigger`  | Condiciones que obligan a probar otra vez            |

El registro no sustituye catálogos de permisos, estados o procesos; los referencia.

---

#### 7. Estados de un término

```text
DISCOVERED
CANDIDATE
PROVISIONAL
IN_VALIDATION
VALIDATED
VALIDATED_WITH_CONTEXT
REJECTED
DEPRECATED
REVALIDATION_REQUIRED
```

Reglas:

- `DISCOVERED`: texto existente aún no evaluado;
- `CANDIDATE`: propuesta con concepto definido;
- `PROVISIONAL`: puede usarse en prototipo, no como estándar definitivo;
- `IN_VALIDATION`: campaña activa;
- `VALIDATED`: comprensión demostrada para las audiencias declaradas;
- `VALIDATED_WITH_CONTEXT`: válido solo en contextos explícitos;
- `REJECTED`: produjo ambigüedad o riesgo;
- `DEPRECATED`: se conserva solo por transición;
- `REVALIDATION_REQUIRED`: cambió proceso, audiencia, dispositivo o significado.

```text
VALIDADO EN UNA PANTALLA
≠ VALIDADO EN TODO EL ECOSISTEMA
```

---

#### 8. Inventario de superficies

Se inventariará terminología en:

- navegación;
- títulos y subtítulos;
- botones y menús;
- campos, unidades y placeholders;
- estados y transiciones;
- errores, bloqueos y recuperación;
- notificaciones;
- impresos, etiquetas y comprobantes;
- kioscos, tablets y POS;
- tablas, reportes y exportaciones;
- documentos de soporte y capacitación;
- mensajes enviados a clientes o terceros;
- expresiones verbales utilizadas en el proceso real.

La auditoría agrupará textos por concepto, no solo por coincidencia literal.

---

#### 9. Cobertura de participantes

La validación no podrá realizarse únicamente con propietarios, gerencia,
desarrollo o personal administrativo.

La matriz incluirá, según el término:

- actor que ejecuta;
- actor que supervisa;
- actor que recibe un handoff;
- personal nuevo y experimentado;
- personas con distinta familiaridad digital;
- turnos y condiciones de pico;
- sedes o áreas con variantes operativas;
- usuarios de dispositivo personal y compartido;
- necesidades de accesibilidad relevantes.

Para términos transversales se cubrirán al menos dos contextos operativos
materialmente distintos. Para términos propios de una sola área se probarán con
personas reales de esa área.

---

#### 10. Evidencia mínima por riesgo

| Riesgo  | Evidencia mínima inicial                                                                              |
| ------- | ----------------------------------------------------------------------------------------------------- |
| crítico | todos los participantes representativos ejecutan correctamente; cero interpretación peligrosa         |
| alto    | al menos cinco participantes relevantes, dos niveles de experiencia y ningún patrón de error material |
| medio   | al menos tres participantes relevantes y comprensión consistente                                      |
| bajo    | revisión contextual y prueba dentro del prototipo correspondiente                                     |

Un resultado porcentual no compensará un fallo crítico aislado relacionado con:

- seguridad;
- dinero;
- inventario;
- custodia;
- alérgenos o calidad;
- privacidad;
- permisos;
- acciones irreversibles.

---

#### 11. Entorno de prueba

La prueba se ejecutará, según aplicabilidad, con:

- prototipo o pantalla suficientemente realista;
- dispositivo y tamaño objetivo;
- postura y montaje reales;
- ruido, iluminación, guantes o manos ocupadas;
- datos realistas no sensibles;
- secuencia completa, no una palabra aislada;
- escenario ordinario y al menos un bloqueo o diferencia;
- participantes sin haber recibido la respuesta.

Las pruebas de los POS multiárea se harán físicamente en el Centro de Producción
y deberán incluir cambio de área, receta, lote, actor e interrupción.

---

#### 12. Protocolo de sesión

Cada sesión seguirá una guía controlada:

1. explicar el objetivo sin definir los términos evaluados;
2. presentar una situación realista;
3. pedir a la persona que indique qué haría;
4. solicitar que explique lo que entiende;
5. observar acción, dudas, retrocesos y lenguaje espontáneo;
6. introducir una diferencia, bloqueo o cambio de estado;
7. verificar si distingue acciones ordinarias y excepcionales;
8. registrar resultado sin culpar ni corregir durante la tarea;
9. realizar preguntas posteriores;
10. comparar resultados por actor, sede, área y experiencia.

---

#### 13. Preguntas permitidas

Ejemplos:

```text
¿Qué crees que significa esto?

¿Qué pasaría si pulsas este botón?

Muéstrame cómo registrarías lo que recibiste.

¿Cómo sabrías que ya quedó confirmado?

¿Qué diferencia ves entre estos dos estados?

¿Con qué palabra llamas normalmente a esto en tu área?
```

No se preguntará primero:

```text
¿Entiendes?

¿Te parece claro?

¿Te gusta más A o B?

¿Sabes que LOC significa ubicación?
```

Estas preguntas inducen respuestas positivas o enseñan el término antes de medir.

---

#### 14. Técnicas de validación

Se utilizarán de forma combinada:

- comprensión espontánea;
- `teach-back` o explicación con palabras propias;
- predicción del efecto;
- selección de acción;
- clasificación de conceptos cercanos;
- búsqueda de una tarea;
- ordenamiento de estados;
- detección de información crítica;
- comparación de dos etiquetas candidatas dentro de una tarea;
- observación del vocabulario que la persona usa naturalmente.

No se aprobará una palabra solo mediante encuesta de preferencia.

---

#### 15. Métricas

Se registrarán:

- comprensión correcta;
- acción correcta al primer intento;
- predicción correcta del efecto;
- tiempo hasta decidir;
- dudas verbalizadas;
- retrocesos;
- ayuda requerida;
- confusión con otro concepto;
- interpretación peligrosa;
- confianza declarada después de actuar;
- término espontáneo utilizado;
- diferencias por actor, sede, área o experiencia.

Las métricas no se utilizarán para evaluar rendimiento individual del trabajador.

---

#### 16. Criterios iniciales de aprobación

| Elemento           | Criterio                                                                                |
| ------------------ | --------------------------------------------------------------------------------------- |
| acción crítica     | cero interpretación peligrosa y ejecución correcta por todos los participantes críticos |
| CTA frecuente      | al menos 90 % de elección correcta al primer intento y sin patrón de error por grupo    |
| estado operativo   | al menos 90 % distingue estado actual, siguiente acción y cierre                        |
| detalle secundario | al menos 80 % comprende o puede recuperarse mediante ayuda contextual                   |
| término contextual | evidencia separada para cada contexto declarado                                         |

Una muestra pequeña se evaluará además cualitativamente. Un porcentaje no se
presentará como precisión estadística si la muestra no lo permite.

---

#### 17. Severidad de hallazgos

```text
S0_CRITICAL
S1_HIGH
S2_MEDIUM
S3_LOW
OBSERVATION
```

- `S0_CRITICAL`: puede causar daño, pérdida, exposición o efecto irreversible;
- `S1_HIGH`: provoca una acción incorrecta o bloqueo frecuente;
- `S2_MEDIUM`: requiere ayuda o genera retraso considerable;
- `S3_LOW`: fricción menor y recuperable;
- `OBSERVATION`: variante de lenguaje sin impacto demostrado.

Todo `S0` o `S1` bloquea la validación del término afectado.

---

#### 18. Acciones y botones

Los CTA se validarán por el efecto que la persona predice, no por su longitud.

```text
Confirmar
```

será insuficiente cuando no indique qué se confirma.

Etiquetas candidatas deberán expresar objeto o efecto, por ejemplo:

```text
Confirmar cantidades recibidas

Iniciar preparación

Entregar custodia al conductor

Guardar como borrador
```

Las palabras definitivas dependerán de la prueba contextual.

---

#### 19. Estados y transiciones

Cada estado deberá permitir responder:

1. qué ocurrió;
2. quién debe actuar;
3. qué puede hacerse ahora;
4. si el efecto está confirmado;
5. qué falta para cerrar.

Los enums internos no se mostrarán directamente:

```text
ready_for_transport
in_transit
partial
stale
reconciliation_required
```

Podrán mapearse a etiquetas humanas distintas, siempre conservando un único
significado semántico y una transición inequívoca.

---

#### 20. Cantidades, unidades y presentaciones

Se probarán conjuntamente:

```text
VALOR
+
UNIDAD
+
PRESENTACIÓN
+
ACCIÓN
+
EFECTO
```

Ejemplos de confusión que deben detectarse:

- paquete frente a unidad;
- gramos frente a kilogramos;
- solicitado frente a recibido;
- rendimiento esperado frente a real;
- cantidad preparada frente a cargada;
- cero frente a vacío o no observado.

La terminología nunca deberá ocultar una conversión o cambiar la unidad sin
confirmación visible.

---

#### 21. Actor, rol y contexto

Se validarán de forma separada:

```text
ROL BASE
ROL OPERATIVO
ÁREA ASIGNADA
ÁREA ACTIVA
SEDE
TURNO
CHECK-IN
SIMULACIÓN
DELEGACIÓN
```

Nombres internos como `navigation_role`, `effective_role`, `checkin_id` o
`territory_scope` no serán etiquetas de trabajador.

La persona deberá poder identificar bajo qué sede, área, turno y función está
actuando sin interpretar códigos.

---

#### 22. Bloqueos, conectividad y recuperación

Los mensajes deberán permitir distinguir:

- no autorizado;
- falta de turno o identificación;
- espera normal;
- conflicto;
- fallo técnico;
- guardado local;
- pendiente de sincronizar;
- confirmado por el servidor;
- resultado desconocido;
- conciliación requerida.

```text
Ocurrió un error
```

no se considerará terminología suficiente.

Las pruebas verificarán que el trabajador comprenda qué quedó guardado, qué no
debe repetir y cuál es el siguiente paso seguro.

---

#### 23. Términos técnicos y abreviaturas

Se inventariarán, entre otros:

```text
LOC
LPN
RPC
RLS
claim
lease
override
receipt
stale
payload
batch
check-in
```

Tratamiento posible:

- mantener solo en código;
- traducir a una expresión humana;
- explicar dentro de ayuda contextual;
- conservar como término profesional validado;
- retirar de la superficie.

Que un término sea estándar técnico no demuestra que sea adecuado para operación.

---

#### 24. Alias y variantes locales

Una misma cosa puede recibir nombres cotidianos distintos entre áreas. El sistema
podrá reconocer alias para:

- búsqueda;
- ayuda;
- transición desde lenguaje anterior;
- capacitación;
- dictado o captura asistida.

Pero:

```text
ALIAS LOCAL
≠ CONCEPTO NUEVO
≠ ESTADO NUEVO
≠ PERMISO NUEVO
```

Cuando dos palabras representen hechos realmente distintos, deberán permanecer
separadas aunque los trabajadores las usen indistintamente.

---

#### 25. Consistencia entre aplicaciones

La aplicación propietaria del concepto definirá su significado. Las aplicaciones
consumidoras podrán adaptar la longitud o explicar el término, pero no cambiar su
semántica.

Ejemplo:

```text
FOGO origina el lote de producción
NEXO consume su identidad logística
NUMERA consume su efecto de costo
```

Las tres aplicaciones no podrán utilizar la misma palabra para hechos diferentes
ni crear copias semánticas independientes.

---

#### 26. Experiencia operativa y administrativa

Podrán existir etiquetas diferenciadas cuando la tarea lo exija:

```text
OPERACIÓN
→ lenguaje de acción, objeto y siguiente paso

ADMINISTRACIÓN
→ lenguaje de análisis, configuración y gobierno
```

La diferencia deberá estar registrada y validada. No se permitirá usar jerga
administrativa en un kiosco solo porque el concepto provenga de una tabla maestra.

---

#### 27. POS multiárea del Centro de Producción

Los computadores compartidos podrán mostrar:

```text
Repostería
Pastelería y Tortas
```

como áreas separadas y visibles.

La validación deberá comprobar que los trabajadores:

- distinguen el área activa;
- identifican a qué área pertenece cada tarea;
- no confunden un recetario conjunto con una autorización global;
- entienden qué ocurre al cambiar de área;
- reconocen que un borrador, lote o receta permanece en su área propietaria.

Si en la operación real se utiliza otra denominación para `Pastelería y Tortas`,
se registrará como candidata y se probará antes de modificar el nombre canónico o
la etiqueta visible.

---

#### 28. Candidatos iniciales por producto

Estos ejemplos son **candidatos para probar**, no palabras aprobadas:

| Producto    | Identificador o término técnico | Candidato humano                                          |
| ----------- | ------------------------------- | --------------------------------------------------------- |
| NEXO        | `LOC`                           | Ubicación de inventario                                   |
| NEXO        | `LPN`                           | Contenedor, canasta o caja identificada según objeto real |
| FOGO        | `batch`                         | Lote de producción                                        |
| FOGO        | recipe version                  | Versión vigente de la receta                              |
| ORIGO       | purchase reception              | Recibir compra                                            |
| ANIMA       | check-in                        | Registrar entrada o iniciar jornada                       |
| SHELL       | active context                  | Sede, área y función activas                              |
| transversal | claim                           | Tarea tomada por otra persona                             |
| transversal | receipt                         | Confirmación del servidor                                 |
| transversal | override                        | Autorización excepcional                                  |

La campaña podrá rechazar todos o algunos candidatos.

---

#### 29. Accesibilidad y lenguaje claro

La terminología deberá:

- utilizar frases directas;
- evitar dobles negaciones;
- conservar el mismo verbo para la misma acción;
- no depender únicamente de iconos, color o posición;
- ofrecer pronunciación y lectura comprensibles;
- mantener etiquetas accesibles equivalentes;
- evitar abreviaturas no explicadas;
- funcionar con ampliación, lector de pantalla y orden de foco;
- respetar plural, género y concordancia;
- permitir traducción futura sin codificar la lógica en la frase.

Una etiqueta corta no prevalecerá sobre una etiqueta comprensible.

---

#### 30. Privacidad y ética de la prueba

Las sesiones:

- utilizarán datos ficticios o minimizados;
- no registrarán credenciales, PIN ni información médica;
- informarán propósito y uso de la evidencia;
- permitirán detener la sesión;
- no evaluarán desempeño laboral individual;
- no comunicarán resultados a modo disciplinario;
- anonimizarán hallazgos cuando sea posible;
- separarán observación de identidad personal.

Una dificultad se tratará primero como problema de diseño, proceso o lenguaje.

---

#### 31. Capacitación no sustituye validación

```text
EL TRABAJADOR LO APRENDIÓ
≠ EL TÉRMINO ES CLARO
```

Se conservarán términos profesionales que sean necesarios para seguridad,
calidad, contabilidad o trazabilidad, pero deberán:

- tener definición operativa;
- enseñarse deliberadamente;
- utilizarse consistentemente;
- comprobarse en una tarea;
- disponer de ayuda contextual cuando corresponda.

La capacitación podrá complementar, no ocultar, una interfaz ambigua.

---

#### 32. Gobierno y cambios

Todo cambio de término deberá indicar:

- concepto afectado;
- razón;
- evidencia;
- audiencias;
- superficies;
- compatibilidad con documentos e impresos;
- alias de transición;
- fecha de entrada;
- versión;
- necesidad de revalidación;
- responsable de retiro del término anterior.

No se modificará una etiqueta global desde una aplicación consumidora sin acuerdo
del propietario semántico.

---

#### 33. Disparadores de revalidación

```text
CAMBIO DE PROCESO
CAMBIO DE SIGNIFICADO
NUEVO ACTOR
NUEVA SEDE O ÁREA
NUEVO DISPOSITIVO
NUEVA ACCIÓN O RIESGO
CAMBIO DE UNIDAD
NUEVA INTEGRACIÓN
HALLAZGO RECURRENTE
TRADUCCIÓN
CAMBIO REGULATORIO
```

Un cambio exclusivamente visual no exigirá siempre revalidación, salvo que afecte
visibilidad, jerarquía, truncamiento o asociación entre texto y control.

---

#### 34. Feedback continuo

Después del despliegue se habilitarán mecanismos para registrar:

- búsquedas sin resultado;
- aperturas repetidas de ayuda;
- retrocesos después de un CTA;
- selección frecuente de acción equivocada;
- bloqueos repetidos;
- términos reportados por soporte;
- alias escritos por trabajadores;
- diferencias entre sedes o áreas.

La telemetría servirá para detectar hipótesis de confusión, no para afirmar por sí
sola qué palabra debe utilizarse.

---

#### 35. Aplicación posterior y propietarios

| Decisión                               | Tarea propietaria                                                            |
| -------------------------------------- | ---------------------------------------------------------------------------- |
| prototipos y sesiones con trabajadores | `UX-STATION-008`; `AUTH-UI-055` a `AUTH-UI-060`                              |
| gramática y composición de estaciones  | `UX-STATION-010` a `UX-STATION-012`                                          |
| inventario y contrato de cada pantalla | `PROC-SCREEN-001` a `PROC-SCREEN-028`                                        |
| términos por producto                  | subbloques `*-UX-*` y `*-AUTH-*` propietarios                                |
| accesibilidad y ergonomía              | `NFR-REQ-007`; `UX-QA-001` a `UX-QA-030`                                     |
| observabilidad de confusión y soporte  | `NFR-REQ-009`; `OBS-ARC-001` a `OBS-ARC-016`                                 |
| validación de POS multiárea            | `UX-STATION-008`; `FOGO-UX-002`, `003`, `008`, `009`, `015`; `FOGO-AUTH-016` |
| certificación y regresión              | `UX-QA-001` a `UX-QA-030`; `AUTH-QA-001` a `AUTH-QA-030`                     |

Ninguna terminología quedará declarada `VALIDATED` sin evidencia generada por las
tareas anteriores. La aprobación documental de `UX-BASE-015` aprueba este
contrato, no inventa resultados de sesiones que todavía no se han ejecutado.

---

#### 36. Migración del lenguaje existente

Se inventariarán:

- términos técnicos visibles;
- traducciones literales;
- la misma acción con verbos diferentes;
- una palabra usada para conceptos distintos;
- estados mostrados como enums;
- abreviaturas no explicadas;
- textos hardcodeados utilizados como lógica;
- placeholders que sustituyen etiquetas;
- mensajes genéricos;
- documentos e impresos con vocabulario anterior;
- nombres locales no registrados;
- capacitación creada para explicar defectos de interfaz.

Clasificación:

```text
CONFORME
REQUIERE_VALIDACIÓN
REQUIERE_ALIAS_TRANSITORIO
REQUIERE_CAMBIO_COORDINADO
REQUIERE_EXPLICACIÓN
TÉCNICO_NO_VISIBLE
AMBIGUO
PELIGROSO
DEPRECATED
```

---

#### 37. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-297 a TREQ-UX-319
```

Cobertura resumida:

1. registro semántico;
2. separación entre identificador y etiqueta;
3. estados y gobierno;
4. participantes representativos;
5. validación contextual;
6. protocolo neutral;
7. umbrales y severidad;
8. términos críticos;
9. acciones y CTA;
10. estados y transiciones;
11. cantidades, unidades y presentaciones;
12. roles y contexto;
13. bloqueos y recuperación;
14. términos técnicos;
15. alias locales;
16. consistencia cross-app;
17. separación operativa y administrativa;
18. POS compartidos multiárea;
19. accesibilidad;
20. privacidad;
21. capacitación;
22. feedback y revalidación;
23. migración y certificación.

---

#### 38. Criterios de aceptación

- [ ] Existe una separación explícita entre concepto, identificador, etiqueta, alias y término técnico.
- [ ] Se define la estructura de `UX-TERMINOLOGY-REGISTER-001`.
- [ ] Los términos tienen estados de validación y versión.
- [ ] La validación exige participantes operativos representativos.
- [ ] Las pruebas se realizan dentro de tareas realistas y sin enseñar la respuesta.
- [ ] Se utilizan comprensión, predicción, conducta y `teach-back`.
- [ ] Existen umbrales diferenciados por riesgo.
- [ ] Todo hallazgo crítico o alto bloquea la aprobación del término.
- [ ] Acciones, estados, cantidades, unidades y contexto se prueban explícitamente.
- [ ] Los identificadores técnicos no se muestran automáticamente al trabajador.
- [ ] Los alias locales no crean semántica paralela.
- [ ] La aplicación propietaria conserva el significado cross-app.
- [ ] Se diferencian etiquetas operativas y administrativas solo con justificación.
- [ ] Los POS multiárea validan área activa, recetario, lote y cambio de actor.
- [ ] La prueba protege accesibilidad, privacidad y ética.
- [ ] La capacitación no sustituye comprensión demostrada.
- [ ] Todo cambio tiene propietario, evidencia y disparador de revalidación.
- [ ] Todas las decisiones diferidas tienen tarea propietaria exacta.
- [ ] Se crean `TREQ-UX-297` a `TREQ-UX-319`.
- [ ] No se implementan pantallas, código, traducciones, migraciones ni Supabase.
- [ ] `NFR-REQ-001` permanece sin iniciar.

---

#### 39. Estado y continuidad

```text
UX-BASE-014 APROBADA
UX-BASE-015 APROBADA
NFR-REQ-001 NO INICIADA
```

Al aprobarse `UX-BASE-015`, quedará cerrada la serie de principios
`UX-BASE-001` a `UX-BASE-015`. La continuidad documental interna de E2 será
`NFR-REQ-001 — Definir criticidad y disponibilidad por proceso`.
