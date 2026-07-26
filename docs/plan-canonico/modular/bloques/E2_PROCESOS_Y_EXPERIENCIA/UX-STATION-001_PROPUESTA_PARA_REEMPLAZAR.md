**PROPUESTA PARA APROBACIÓN**

### 🟡 UX-STATION-001 — Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación

**Estado:** PROPUESTA PARA APROBACIÓN

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-001 — Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación`

**Tarea anterior:** `PROC-ACTOR-010 — Prohibir autorización derivada únicamente del nombre del rol` — APROBADA

**Siguiente tarea reservada:** `OPS-CAN-001 — Diseñar la arquitectura objetivo de canales corporativos y comerciales`

**Artefacto producido:** `UX-STATION-INVENTORY-001`

**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Crear una línea base única de los lugares, áreas, puestos, dispositivos,
periféricos y condiciones físicas que deberán soportar la experiencia
operativa de Vento OS.

Esta tarea describe el **AS-IS físico y operativo**. No selecciona todavía
hardware objetivo, modalidad definitiva de interacción, montaje, navegación,
pantallas ni arquitectura de autorización.

---

#### 2. Dependencias canónicas

- BLOQUE E1 cerrado con resultado `PASS_WITH_CARRYOVER`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- catálogo de áreas, sedes, zonas y capacidades de BLOQUE E1;
- auditoría de dispositivos y seguridad de BLOQUE A;
- `TREQ-UX-004`, que protege la viabilidad física de estaciones y
  periféricos.

Las observaciones históricas de E1 son evidencia inicial. No se convierten
automáticamente en especificación objetivo ni prueban que la condición siga
vigente.

---

#### 3. Alcance territorial

El inventario cubrirá:

| Lugar canónico | Cobertura mínima |
| --- | --- |
| Oficina 1 | puestos administrativos que participan o supervisan procesos operativos |
| Centro de Producción | bodega, recepción, despacho, Cocina Caliente, Panadería y Bollería, Repostería, Pastelería y Tortas, Galletería, Barra y Servicios Generales |
| Vento Café | caja, servicio interior, servicio exterior, cocina, bar, barra, mostrador y entrega |
| Saudo | caja, servicio, cocina, bebidas, mostrador y entrega |
| Molka | mostrador, caja, preparación, servicio y entrega |

`Centro de Distribución` no se inventariará como sede: E1 confirmó que no
existe físicamente y que la logística se ejecuta desde el Centro de
Producción.

---

#### 4. Unidad mínima de inventario

Cada fila de `UX-STATION-INVENTORY-001` representará una combinación
observable:

```text
LUGAR
+ ÁREA O ZONA
+ PUESTO O PUNTO DE TRABAJO
+ FUNCIÓN OPERATIVA
+ FRANJA O CONDICIÓN RELEVANTE
```

No se fusionarán puestos únicamente porque utilicen la misma aplicación o el
mismo nombre de rol.

---

#### 5. Campos obligatorios

| Grupo | Campos |
| --- | --- |
| identidad | ID estable, lugar, área, zona, nombre operativo y responsable de verificación |
| operación | procesos y pasos observados, actor habitual, relevos, concurrencia y picos |
| movilidad | fijo, semifijo, móvil, recorrido, distancia y cambios de zona |
| interacción | manos libres u ocupadas, guantes, humedad, grasa, ruido, iluminación, postura y lectura disponible |
| dispositivo | equipo observado, propiedad, uso personal o compartido, ubicación y aplicaciones usadas |
| sesión | cuenta individual o conjunta, cambio de actor, bloqueo, abandono y atribución real |
| periféricos | impresora, escáner, cámara, datáfono, campana, comandera, etiqueta u otro apoyo |
| infraestructura | energía, montaje, protección física, red, señal, carga y mantenimiento |
| contingencia | operación manual, pérdida de red o energía, equipo alterno y reconciliación posterior |
| evidencia | fuente, fecha, observador, soporte permitido y nivel de confianza |
| estado | `CONFIRMADO`, `CONFIRMADO_PARCIAL`, `POR_VERIFICAR` o `NO_APLICA` |

No se recopilarán PIN, contraseña, token, dato de pago ni información personal
innecesaria.

---

#### 6. Línea base documental conocida

| Lugar o familia | Hecho documentado que debe verificarse | Estado inicial |
| --- | --- | --- |
| Vento Café — servicio | los meseros usan una tablet compartida con cuenta conjunta de Servicio | `CONFIRMADO_PARCIAL` |
| Vento Café — caja | existe una estación de caja; el datáfono puede circular y el pago se informa verbalmente | `CONFIRMADO_PARCIAL` |
| Vento Café — cocina, bar y barra | Makos distribuye comandas; existen impresoras y entrega mediante ventana o campana | `CONFIRMADO_PARCIAL` |
| Saudo — servicio | se utiliza tablet compartida o celular con cuenta operativa conjunta | `CONFIRMADO_PARCIAL` |
| Saudo — caja y cocina | la comunicación ordinaria es verbal; existe una impresora que no se usa habitualmente | `CONFIRMADO_PARCIAL` |
| Molka — mostrador | una persona puede atender, cobrar, preparar, servir y entregar desde un flujo concentrado | `CONFIRMADO_PARCIAL` |
| Centro de Producción — bodega | existe referencia técnica a un kiosco de bodega con política amplia que requiere verificación física y funcional | `CONFIRMADO_PARCIAL` |
| Centro de Producción — producción | existen áreas con frío, mesones, canastas, bandejas y trabajo manual cuya interacción física aún no está inventariada por puesto | `POR_VERIFICAR` |
| dispositivos compartidos | la auditoría no encontró sesiones persistidas de actor en tablets o dispositivos operativos compartidos | `CONFIRMADO_PARCIAL` |

`CONFIRMADO_PARCIAL` significa que existe evidencia documental suficiente para
iniciar el inventario, pero no una observación física vigente y completa.

---

#### 7. Instrumento de verificación

La verificación podrá ejecutarla un responsable de sede o área sin
conocimientos técnicos:

1. recorrer cada área durante una condición ordinaria y, cuando sea posible,
   durante un pico;
2. identificar cada punto donde se consulta, registra, confirma, imprime,
   escanea, cobra, entrega o corrige;
3. registrar quién lo usa realmente y cómo cambia el actor;
4. anotar restricciones físicas y ambientales;
5. identificar dispositivo, periféricos, energía y red disponibles;
6. describir qué ocurre cuando el equipo o la conexión no están disponibles;
7. adjuntar únicamente evidencia no sensible y necesaria;
8. confirmar la fila con responsable del área y fecha.

Una respuesta `NO SÉ` se convertirá en `POR_VERIFICAR`; nunca se sustituirá
por una suposición técnica.

---

#### 8. Reglas de calidad y cierre de vacíos

1. Cada lugar y área tendrá al menos una fila o una justificación
   `NO_APLICA`.
2. Toda fila tendrá fuente, fecha y responsable de verificación.
3. Un dispositivo registrado en Supabase no probará por sí solo su existencia,
   ubicación o uso físico vigente.
4. Una plantilla de dispositivo no se confundirá con una instancia real.
5. Cuenta compartida, dispositivo compartido y estación compartida se
   registrarán como conceptos distintos.
6. Las variantes por sede o turno se conservarán como condiciones, no como
   procesos duplicados.
7. Todo `POR_VERIFICAR` que permanezca al aprobar esta tarea tendrá:
   responsable, evidencia requerida, condición de activación y cierre en
   `UX-STATION-008`.
8. Un riesgo de identidad o autorización se vinculará además con
   `AUTH-DEV-001` a `AUTH-DEV-016`.
9. Un vacío de red, energía, dispositivo o contingencia alimentará
   `NFR-REQ-004`, `NFR-REQ-008`, `NFR-REQ-010` o `NFR-REQ-011`, según
   corresponda.

---

#### 9. Uso posterior del inventario

| Decisión | Tarea propietaria |
| --- | --- |
| comparar modalidades de interacción | `UX-STATION-002` |
| definir perfiles canónicos de estación | `UX-STATION-003` |
| identidad y cambio de actor | `UX-STATION-004`; `AUTH-DEV-001` a `AUTH-DEV-016` |
| superficie contextual | `UX-STATION-005` |
| hardware y periféricos objetivo | `UX-STATION-006` |
| contingencia y recuperación | `UX-STATION-007` |
| gramática, bandeja y composición | `UX-STATION-010` a `UX-STATION-012` |
| validación con trabajadores | `UX-STATION-008` |
| matriz final | `UX-STATION-009` |
| contrato de pantallas | `PROC-SCREEN-001` a `PROC-SCREEN-028` |

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea crea un inventario documental del entorno físico y
no introduce ni modifica comportamiento ejecutable. La regla de viabilidad
física ya está protegida por `TREQ-UX-004`; sus escenarios se concretarán
durante `UX-STATION-008` y la planificación de pruebas correspondiente.

---

#### 10. Criterios de aceptación

- [ ] Los cinco lugares reales y todas sus áreas relevantes están cubiertos.
- [ ] `Centro de Distribución` no reaparece como sede física.
- [ ] Cada fila usa la unidad mínima y los campos obligatorios.
- [ ] Se distinguen puesto, estación, dispositivo, sesión, actor y periférico.
- [ ] Se documentan movilidad, ergonomía, higiene, ambiente, energía y red.
- [ ] Se documenta la contingencia observada sin diseñar todavía la solución.
- [ ] Toda evidencia tiene fuente, fecha, responsable y nivel de confianza.
- [ ] No se recopilan secretos ni datos personales innecesarios.
- [ ] Cada vacío conserva un destino exacto y una condición de cierre.
- [ ] No se seleccionó hardware, modalidad o pantalla definitiva.
- [ ] No se implementó código, migraciones ni cambios en Supabase.
- [ ] `OPS-CAN-001` permanece sin iniciar.

---

#### 11. Estado y continuidad

```text
PROC-ACTOR-010 APROBADA
UX-STATION-001 PROPUESTA PARA APROBACIÓN
OPS-CAN-001 NO INICIADA
```

No se inicia `OPS-CAN-001` hasta la aprobación expresa de esta tarea y una
solicitud explícita de continuidad.
