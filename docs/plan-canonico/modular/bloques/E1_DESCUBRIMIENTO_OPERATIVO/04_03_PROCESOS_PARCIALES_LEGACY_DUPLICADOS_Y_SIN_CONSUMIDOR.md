### MINI-BLOQUE — PROCESOS PARCIALES LEGACY DUPLICADOS Y SIN CONSUMIDOR

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **procesos parciales legacy duplicados y sin consumidor** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CODE-AUD-011` a `PULSO-UX-021` — 10 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Detectar infraestructura sin proceso funcional utilizable” y concluye con “Diseñar la arquitectura funcional y técnica del POS integral objetivo sin heredar como contrato el prototipo histórico”.
<!-- PLAN-SECTION-META:END -->

### ✅ CODE-AUD-011 — Detectar infraestructura sin proceso funcional utilizable

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de infraestructura técnica sin recorrido empresarial utilizable de extremo a extremo  
**Dependencia anterior:** `CODE-AUD-010`  
**Continuidad reservada:** `CODE-AUD-012`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea contrasta la existencia de infraestructura con la existencia de un proceso funcional utilizable.

Se considera infraestructura:

- tablas;
- vistas;
- funciones SQL;
- RPC;
- políticas RLS;
- rutas API;
- componentes;
- formularios aislados;
- registros de aplicación;
- permisos;
- plantillas;
- modelos de datos;
- servicios locales;
- código no desplegado.

Se considera proceso funcional utilizable cuando existe una cadena comprobable:

```text
necesidad empresarial
        ↓
actor y contexto
        ↓
entrada alcanzable
        ↓
acciones y estados
        ↓
validación y autorización
        ↓
persistencia o efecto real
        ↓
resultado visible
        ↓
excepciones, corrección y auditoría
```

Resultado general:

- AURA conserva una reserva de catálogo y permiso, pero no una aplicación o proceso;
- NEXO conserva infraestructura de LPN, pero no un ciclo de vida operativo alcanzable;
- PULSO conserva una base técnica amplia de POS interno, pero no un proceso integrado de apertura, venta, cobro, caja y cierre;
- TALENTO contiene pantallas y servicios conectados, pero no constituye todavía un proceso productivo desplegado;
- existen datos de asistencia y pagos sin procesos funcionales comprobados de corrección;
- impresión NEXO no se clasifica como infraestructura sin proceso porque sí puede enviar ZPL mediante BrowserPrint;
- dispositivos compartidos no se clasifican como infraestructura pura porque ya existe creación, resolución de sesión y firma de actor en acciones concretas;
- la existencia de tablas vacías no basta por sí sola para declarar infraestructura inútil;
- no se crea ninguna tarea nueva del roadmap;
- se crean tres requisitos de prueba;
- no se modifica código ni Supabase.

---

#### 2. Diferencia entre infraestructura y proceso

##### 2.1. Infraestructura disponible

Existe una o más piezas técnicas que podrían soportar un proceso.

Ejemplos:

- tabla y RLS;
- endpoint de lectura;
- formulario sin ruta;
- función SQL sin consumidor;
- aplicación registrada sin repositorio;
- pantalla no desplegada;
- esquema de dominio sin flujo de usuario.

##### 2.2. Proceso ausente

No existe una cadena alcanzable que permita al actor:

1. iniciar;
2. continuar;
3. completar;
4. corregir;
5. consultar el resultado;
6. demostrar quién actuó.

##### 2.3. Proceso parcial

Existe un recorrido utilizable, pero omite etapas o casos.

Este caso pertenece principalmente a:

```text
CODE-AUD-012
— Detectar procesos implementados solo parcialmente
```

##### 2.4. Artefacto sin consumidor

Existe una pieza técnica cuya utilización no está confirmada.

Este caso deberá profundizarse en:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```

Una misma evidencia puede alimentar varias tareas sin duplicar el hallazgo.

---

#### 3. Criterios de clasificación

Una infraestructura se clasifica como **sin proceso funcional utilizable** cuando se confirma una o más de estas condiciones:

- no existe ruta alcanzable;
- la ruta redirige fuera del dominio;
- existe solo lectura, pero el dominio exige mutaciones;
- existe componente, pero no consumidor;
- existe función de servidor, pero no invocación;
- existe registro de aplicación, pero no repositorio ni pantallas;
- existe modelo de datos, pero no estados ni transiciones ejecutables;
- existe proceso en código, pero no despliegue accesible;
- existe infraestructura de persistencia, pero no corrección auditable;
- existe un fragmento técnico que no permite completar el objetivo empresarial.

No se clasifica automáticamente como brecha cuando:

- la infraestructura es deliberadamente compartida;
- la pieza es una reserva futura explícita y no se presenta como operativa;
- existe un proceso funcional aunque todavía necesite mejoras;
- la tabla está vacía porque aún no hubo operación real;
- el componente está detrás de una feature flag aprobada;
- el servicio es interno y no necesita una pantalla propia.

---

#### 4. AURA — reserva técnica sin producto ni proceso

La auditoría técnica confirmó:

- no existe repositorio AURA;
- no existen rutas ni pantallas;
- no existen elementos de navegación;
- no existe proceso de marketing implementado;
- existe una aplicación `aura` activa en catálogo;
- existe un permiso base de acceso.

Por tanto:

```text
registro de aplicación
+
permiso reservado
≠
aplicación funcional
```

**Clasificación:** reserva técnica explícita sin proceso funcional.

No se exige implementar AURA.

La decisión correcta es conservarla como:

```text
APLICACIÓN DIFERIDA
```

hasta ejecutar:

- `AURA-AUD-001 — Confirmar repositorio propietario`;
- `AURA-AUD-002 — Confirmar estado real del producto`;
- `AURA-AUD-005 — Inventariar procesos de marketing`;
- `AURA-AUD-010 — Decidir continuidad, reemplazo o retiro`;
- `AURA-AUD-012 — Mantener roadmap de implementación bloqueado hasta decisión`.

Riesgo:

- confundir catálogo técnico con disponibilidad empresarial;
- asignar permisos a una capacidad inexistente;
- presentar una aplicación como activa sin proceso, propietario o despliegue;
- iniciar implementación antes de una decisión de alcance.

No se crea una tarea nueva.

---

#### 5. NEXO — infraestructura LPN sin ciclo de vida operativo alcanzable

Infraestructura confirmada:

```text
inventory_lpns
inventory_lpn_items
/api/inventory/lpns
LpnCreateForm
/inventory/lpns
```

##### 5.1. API

La ruta:

```text
src/app/api/inventory/lpns/route.ts
```

implementa únicamente:

```text
GET
```

y devuelve:

```text
id
code
site_id
created_at
```

No implementa:

- creación;
- activación;
- cierre;
- anulación;
- reetiquetado;
- empaque;
- desempaque;
- traslado;
- cambio de custodia;
- consulta de contenido;
- división;
- unión;
- anidamiento.

##### 5.2. Ruta visible

La página:

```text
src/app/inventory/lpns/page.tsx
```

no presenta gestión de LPN.

Redirige directamente a:

```text
/inventory/stock
```

##### 5.3. Formulario aislado

Existe:

```text
src/features/inventory/lpns/lpn-create-form.tsx
```

El formulario contiene:

- selector local de sedes;
- códigos de sede escritos en código;
- captura manual de `site_id` cuando no existe valor predeterminado;
- vista previa de código;
- una acción recibida por propiedad.

No se localizó otro archivo que importe `LpnCreateForm`.

Por tanto, la existencia del componente no demuestra una pantalla utilizable.

##### 5.4. Contenido del LPN

No se localizaron consumidores de aplicación para:

```text
inventory_lpn_items
```

La tabla puede existir, pero no existe un proceso alcanzable de:

```text
LPN
→ contenido
→ cantidad
→ ubicación
→ movimiento
→ custodia
→ cierre
```

##### 5.5. Conclusión LPN

La extensión canónica de NEXO ya declara expresamente que el subdominio no se considera resuelto por la sola existencia de:

- tablas;
- permisos;
- rutas legacy.

**Clasificación:** infraestructura de dominio sin proceso funcional utilizable.

Destinos exactos:

- `NEXO-DOM-002 — Definir propósito y tipos canónicos de LPN`;
- `NEXO-DOM-003 — Definir ciclo de vida de LPN: crear, activar, cerrar, anular y reetiquetar`;
- `NEXO-DOM-004 — Definir contenido, empaque y desempaque de LPN`;
- `NEXO-DOM-007 — Definir relación sede → LOC → LPN → contenido`;
- `NEXO-DOM-019 — Separar identidad permanente del contenedor físico e identidad temporal o persistente del LPN`;
- `NEXO-DOM-021 — Prohibir doble contabilización entre existencia suelta en LOC y existencia contenida en LPN`;
- `NEXO-DOM-022 — Definir que mover un LPN mueve atómicamente todo su contenido`;
- `NEXO-UX-026 — Diseñar ciclo de vida completo de LPN`;
- `NEXO-UX-027 — Diseñar empaque, desempaque y consulta de contenido`;
- `NEXO-UX-036 — Diseñar búsqueda por LOC, LPN, código, responsable y contenido`;
- `NEXO-UX-037 — Diseñar impresión de LOC, LPN, activo y documento`;
- `NEXO-UX-040 — Validar el prototipo del subdominio con decoración, vajilla, herramientas y repuestos`;
- `CODE-AUD-015`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se autoriza completar el componente existente antes de definir el dominio.


---

#### 6. PULSO — base técnica de POS sin proceso interno completo de venta y caja

Infraestructura confirmada en el esquema `pos`:

```text
pos_sessions
pos_session_orders
pos_payments
pos_cash_shifts
pos_cash_movements
pos_tables
pos_zones
pos_modifiers
pos_modifier_options
pos_product_modifiers
pos_order_item_modifiers
```

También existe:

```text
process_order_payment(...)
```

La función:

- consulta una orden;
- marca la orden como pagada y completada;
- inserta un registro de pago;
- calcula puntos;
- actualiza lealtad.

##### 6.1. Consumidores confirmados

La superficie de salón de PULSO:

- consulta zonas;
- consulta mesas;
- consulta sesiones abiertas;
- consulta llamados;
- permite crear y resolver llamados;
- escucha cambios Realtime.

Por tanto, el proceso de llamados de salón sí tiene comportamiento real.

##### 6.2. Proceso POS no localizado

No se localizó en PULSO una cadena completa para:

1. abrir turno de caja;
2. abrir sesión de mesa o mostrador;
3. crear venta interna;
4. agregar líneas y modificadores;
5. asociar venta con sesión;
6. cobrar mediante un medio aprobado;
7. registrar pago;
8. corregir o anular el medio de pago;
9. registrar entrada o salida de caja;
10. cerrar sesión;
11. cuadrar y cerrar caja;
12. emitir hechos de inventario;
13. emitir hechos económicos a NUMERA;
14. acumular o redimir puntos mediante el contrato final.

Búsquedas sobre:

```text
pos_cash_shifts
pos_cash_movements
process_order_payment
```

no localizaron consumidores de aplicación que permitan ejecutar ese ciclo completo.

La auditoría remota también confirmó que las tablas POS internas estaban vacías al corte.

Una tabla vacía no demuestra por sí sola que no exista proceso. En este caso se combina con:

- ausencia de consumidores encontrados;
- lectura de sesiones sin creación encontrada;
- falta de apertura y cierre de caja;
- falta de flujo integrado de cobro;
- falta de corrección auditable de pago.

##### 6.3. Conclusión PULSO

La infraestructura de salón y llamados no equivale a un POS interno completo.

**Clasificación:** fundación técnica de POS con proceso empresarial principal todavía no utilizable de extremo a extremo.

Destinos exactos:

- `PULSO-AUTH-001 — Inventariar vistas POS`;
- `PULSO-AUTH-002 — Inventariar órdenes`;
- `PULSO-AUTH-008 — Definir permisos de cierre y anulación`;
- `PULSO-AUTH-012 — Integrar dispositivos POS compartidos`;
- `PULSO-AUTH-013 — Registrar trabajador que ejecuta la operación`;
- `PULSO-UX-001 — Inventariar procesos de venta, caja y salón`;
- `PULSO-UX-007 — Simplificar creación de venta`;
- `PULSO-UX-008 — Simplificar cobro y medios de pago`;
- `PULSO-UX-009 — Separar anulación, devolución y reembolso`;
- `PULSO-UX-010 — Diseñar apertura y cierre de caja`;
- `PULSO-UX-016 — Conectar venta con inventario`;
- `PULSO-UX-017 — Conectar venta con NUMERA`;
- `PULSO-UX-018 — Conectar venta con PASS`;
- `CODE-AUD-012`;
- `CODE-AUD-015`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se deberá declarar PULSO POS completo por la sola existencia del esquema y las vistas.

---

#### 7. TALENTO — implementación conectada, pero sin proceso productivo desplegado

`CODE-AUD-003` y `CODE-AUD-010` confirmaron que TALENTO contiene superficies conectadas para:

- inicio;
- perfil;
- documentos;
- postulación.

No obstante, TALENTO se mantiene como producto futuro y no tiene una superficie productiva comprobada.

Por tanto:

```text
código conectado
+
servicios
+
pantallas
≠
proceso operativo disponible
```

**Clasificación:** implementación no desplegada, no infraestructura vacía.

Destinos exactos:

- `CAP-TAL-001 — Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA`;
- `CAP-TAL-002 — Diseñar publicación de vacantes, consulta y postulación en TALENTO`;
- `CAP-TAL-003 — Diseñar expediente progresivo de datos, documentos, consentimiento y conservación`;
- `CAP-TAL-004 — Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato`;
- `CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO`;
- `CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se crea requisito de prueba nuevo durante esta tarea porque el proceso objetivo todavía debe ser aprobado en E2.

---

#### 8. Datos sin proceso de corrección comprobado

##### 8.1. Marcaciones de asistencia

Existen:

- `attendance_logs`;
- consultas de ANIMA;
- informes de VISO;
- notas de incidencia.

No se encontró una acción interna que permita corregir:

- hora;
- tipo de marcación;
- entrada o salida equivocada;
- duplicado;
- marcación atribuida al evento incorrecto.

Esto no significa que toda marcación deba ser editable.

Primero debe definirse:

- quién solicita;
- quién aprueba;
- qué campos pueden corregirse;
- cómo se conserva el valor anterior;
- qué evidencia es obligatoria;
- cómo afecta nómina, turno y contexto.

**Clasificación:** datos disponibles sin proceso de corrección aprobado y utilizable.

Destinos:

- `PROC-CAT-002 — Diseñar el proceso TO-BE para capacidades manuales, parciales, rotas o ausentes`;
- `CODE-AUD-012`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- bloques funcionales de ANIMA y VISO cuando E2 asigne propiedad.

No se crea `TREQ-*` todavía porque la regla de corrección no está aprobada.

##### 8.2. Medios de pago

Existen:

- `pos.pos_payments`;
- `payments.transactions`;
- intención de pago;
- webhook;
- conciliación técnica.

No se encontró una acción interna de corrección manual y auditable del medio de pago.

**Clasificación:** infraestructura de pagos sin proceso aprobado de corrección.

Destinos:

- `PULSO-UX-008`;
- `PULSO-UX-009`;
- `PULSO-AUTH-008`;
- `PROC-CAT-002`;
- `CODE-AUD-012`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se crea un requisito separado hasta definir si la corrección será:

- edición;
- reversión;
- anulación;
- devolución;
- asiento compensatorio.

---

#### 9. Falsos positivos excluidos

##### 9.1. Impresión NEXO

NEXO no conserva únicamente plantillas.

La pantalla de trabajos de impresión:

- detecta impresoras mediante BrowserPrint;
- conecta una impresora;
- genera ZPL;
- envía el ZPL mediante `device.send`;
- comunica éxito o error.

Por tanto, existe un proceso local de impresión.

Las brechas de:

- fidelidad de preview;
- persistencia de cola;
- confirmación física;
- reintentos;
- idempotencia;
- monitoreo;
- fallback;

pertenecen a `CODE-AUD-012`, `018`, E4 y `TREQ-NEXO-003`.

**No se clasifica como infraestructura sin proceso.**

##### 9.2. Dispositivos compartidos

Se confirmó:

- creación administrativa desde VISO;
- usuario técnico;
- plantilla;
- sede;
- área;
- aplicaciones permitidas;
- políticas de actor;
- resolución de sesión en aplicaciones;
- firma de actor por PIN para acciones concretas de NEXO.

Por tanto, existe un recorrido funcional parcial.

Las brechas restantes de:

- provisión física;
- cambio de trabajador;
- revocación;
- sesión expirada;
- superficie contextual;
- ergonomía;
- contingencia;

pertenecen a:

- `UX-STATION-*`;
- `AUTH-DEV-*`;
- `CODE-AUD-012`;
- `CODE-AUD-017`;
- `CODE-AUD-018`.

**No se clasifica como infraestructura pura sin proceso.**

##### 9.3. NUMERA, FOGO y ORIGO

NUMERA tiene consultas reales de resumen y rentabilidad.

FOGO tiene superficies de recetas y lotes.

ORIGO administra órdenes y recepciones.

El hecho de que ciertas tablas tengan cero registros no permite declarar que el proceso sea inexistente.

Su cobertura y completitud deberán evaluarse en `CODE-AUD-012`.

---

#### 10. Matriz por repositorio

| Repositorio     | Resultado de CODE-AUD-011                                                                               | Clasificación                                       |
| --------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| `vento-shell`   | contiene fundamentos de AURA, LPN, POS, pagos y dispositivos; la existencia física no demuestra proceso | infraestructura central                             |
| `vento-viso`    | administra dispositivos compartidos; no es infraestructura pura                                         | proceso parcial confirmado                          |
| `vento-nexo`    | LPN sin ciclo alcanzable; impresión sí envía a impresora                                                | un hallazgo confirmado y un falso positivo excluido |
| `vento-fogo`    | recetas y lotes tienen superficies conectadas                                                           | revisar completitud en `CODE-AUD-012`               |
| `vento-origo`   | órdenes y recepciones tienen superficies conectadas                                                     | revisar completitud en `CODE-AUD-012`               |
| `vento-pulso`   | salón y llamados funcionan; POS interno completo no está localizado                                     | infraestructura principal sin proceso E2E           |
| `vento-numera`  | dashboard y rentabilidad están conectados                                                               | revisar completitud en `CODE-AUD-012`               |
| `Vento-Group`   | newsletter es interfaz sin backend final, no infraestructura sin proceso                                | mantiene `WEB-FRM-011`                              |
| `vento-anima`   | asistencia funciona; no existe corrección comprobada de marcación                                       | dato sin proceso de corrección                      |
| `vento-pass`    | pedidos, lealtad y Club tienen lógica; stubs se revisan como consumidores                               | no se confirma infraestructura pura nueva           |
| `vento-talento` | código conectado, pero producto futuro sin despliegue comprobado                                        | implementación no productiva                        |
| `vento-vital`   | proyecto separado                                                                                       | fuera de Vento OS                                   |
| AURA            | catálogo y permiso sin repositorio ni proceso                                                           | reserva diferida                                    |


---

#### 11. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                            | Clasificación                                 | Destino                                                                                                  |
| ---------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `H-CODE-011-001` | AURA existe como aplicación y permiso reservados, sin repositorio, rutas, pantallas o procesos      | reserva técnica                               | `AURA-AUD-001` a `AURA-AUD-012`                                                                          |
| `H-CODE-011-002` | NEXO tiene tablas LPN y endpoint de lectura, pero no ciclo de vida alcanzable                       | infraestructura sin proceso                   | `NEXO-DOM-002` a `008`, `019` a `024`, `NEXO-UX-026` a `040`, `CODE-AUD-015`, `019`, `020`               |
| `H-CODE-011-003` | `/inventory/lpns` redirige a stock                                                                  | ruta sin proceso LPN                          | mismo destino de `H-CODE-011-002`                                                                        |
| `H-CODE-011-004` | `LpnCreateForm` no tiene consumidor localizado                                                      | componente aislado                            | `CODE-AUD-015`, `019`, `020`                                                                             |
| `H-CODE-011-005` | no se localizaron consumidores de `inventory_lpn_items`                                             | modelo sin operación de contenido             | `NEXO-DOM-004`, `007`, `021`, `022`, `NEXO-UX-027`, `036`, `CODE-AUD-015`                                |
| `H-CODE-011-006` | PULSO conserva esquema POS, vistas y función de pago sin ciclo integrado de venta y caja localizado | fundación sin proceso E2E                     | `PULSO-AUTH-*`, `PULSO-UX-001`, `007` a `010`, `016` a `018`, `CODE-AUD-012`, `015`, `017`, `019`, `020` |
| `H-CODE-011-007` | salón PULSO sí consulta sesiones y gestiona llamados                                                | proceso real                                  | cerrado como falso positivo                                                                              |
| `H-CODE-011-008` | TALENTO tiene código conectado, pero no superficie productiva comprobada                            | implementación no desplegada                  | `CAP-TAL-001` a `006`, `CODE-AUD-019`, `020`                                                             |
| `H-CODE-011-009` | asistencia conserva datos sin corrección funcional comprobada                                       | infraestructura de datos sin proceso aprobado | `PROC-CAT-002`, `CODE-AUD-012`, `019`, `020`                                                             |
| `H-CODE-011-010` | pagos conservan estructuras sin corrección manual auditable                                         | infraestructura de datos sin proceso aprobado | `PULSO-UX-008`, `009`, `PULSO-AUTH-008`, `PROC-CAT-002`, `CODE-AUD-012`, `017`, `019`, `020`             |
| `H-CODE-011-011` | impresión NEXO sí envía ZPL con BrowserPrint                                                        | proceso local existente                       | `CODE-AUD-012`, `018`, mantiene `TREQ-NEXO-003`                                                          |
| `H-CODE-011-012` | dispositivos compartidos ya tienen creación, sesión y firma en acciones concretas                   | proceso parcial existente                     | `UX-STATION-*`, `AUTH-DEV-*`, `CODE-AUD-012`, `017`, `018`                                               |
| `H-CODE-011-013` | una tabla vacía no demuestra ausencia de proceso                                                    | regla de clasificación                        | cerrado                                                                                                  |
| `H-CODE-011-014` | el Registro Canónico de Requisitos de Prueba está desalineado con tareas aprobadas                  | brecha documental                             | corregir durante consolidación de `CODE-AUD-011`; `QA-REG-001` verifica retrospectivamente               |

Todos los hallazgos quedan cerrados o vinculados a tareas existentes.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 12. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Requisitos nuevos derivados:

- `TREQ-SHELL-001`;
- `TREQ-NEXO-004`;
- `TREQ-PULSO-001`.

Requisitos reutilizados:

- `TREQ-NEXO-003`;
- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`.

Las definiciones completas, estados, responsables, ambientes y evidencias de estos requisitos existen únicamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas del Registro Canónico dentro de esta tarea.

---
#### 13. Decisiones aprobadas

1. La infraestructura no se considerará proceso.
2. Una aplicación registrada no se considerará producto disponible.
3. Una tabla, permiso o endpoint no demostrará cobertura funcional.
4. AURA permanecerá diferida y no navegable hasta decisión.
5. No se exigirá implementar AURA.
6. LPN se declara infraestructura sin ciclo operativo alcanzable.
7. El formulario LPN aislado no se tomará como implementación.
8. La ruta redirigida no se tomará como pantalla LPN.
9. El diseño LPN deberá preceder cualquier reutilización del componente.
10. PULSO salón se reconoce como proceso conectado.
11. PULSO POS completo no se considera implementado.
12. La función `process_order_payment` no prueba por sí sola un proceso de caja.
13. TALENTO se clasifica como implementación no productiva, no como infraestructura vacía.
14. Corrección de asistencia deberá diseñarse antes de implementarse.
15. Corrección de pagos deberá distinguir edición, reversión, anulación, devolución y compensación.
16. Impresión NEXO se excluye como falso positivo porque sí envía ZPL.
17. Dispositivos compartidos se excluyen como falso positivo puro porque ya tienen acciones funcionales.
18. Tablas vacías no bastan para declarar ausencia de proceso.
19. Se deriva `TREQ-SHELL-001`.
20. Se deriva `TREQ-NEXO-004`.
21. Se deriva `TREQ-PULSO-001`.
22. Los tres requisitos quedan en estado `IDENTIFICADO`.
23. No se crea una tarea nueva del roadmap.
24. `CODE-AUD-012` será la única continuidad inmediata.

---

#### 14. Límites de certeza

Esta tarea no confirma:

- que nunca haya existido un consumidor LPN en otra rama;
- que las tablas LPN estén vacías;
- que la función de pago POS no sea invocada externamente;
- que ningún sistema externo escriba sesiones POS;
- que AURA deba eliminarse;
- que TALENTO no pueda desplegarse con la infraestructura actual;
- que toda corrección de asistencia deba permitirse;
- que todo pago pueda editarse;
- que una tabla con registros implique proceso correcto;
- que una tabla sin registros implique proceso roto;
- que impresión NEXO tenga confirmación física;
- que el ciclo de dispositivos compartidos esté completo;
- que todos los procesos parciales hayan sido detectados.

`CODE-AUD-012` continuará con los procesos que sí tienen un recorrido, pero no lo completan correctamente.

---

#### 15. Criterios de aceptación

`CODE-AUD-011` podrá aprobarse cuando:

- infraestructura y proceso estén diferenciados;
- AURA quede clasificada como reserva;
- LPN quede contrastado entre tabla, API, ruta y componente;
- se documente que la ruta LPN redirige;
- se documente que el formulario LPN no tiene consumidor localizado;
- el POS interno se diferencie del proceso de llamados de salón;
- el esquema POS no se confunda con un POS completo;
- TALENTO quede clasificado como no productivo;
- asistencia y pagos tengan destinos sin inventar reglas;
- impresión NEXO sea excluida como falso positivo;
- dispositivos compartidos sean excluidos como falso positivo puro;
- cada hallazgo tenga destino exacto;
- no se cree ninguna tarea nueva;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-012` permanezca como continuidad inmediata.

---

#### 16. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
tabla, función, API, componente o registro
        ↓
actor y entrada alcanzable
        ↓
estados y acciones
        ↓
resultado empresarial
        ↓
proceso utilizable o infraestructura aislada
        ↓
diseño, retiro, integración o paquete
```

La continuidad será:

```text
CODE-AUD-012
— Detectar procesos implementados solo parcialmente
```


### ✅ CODE-AUD-012 — Detectar procesos implementados solo parcialmente

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de recorridos funcionales que ya ejecutan efectos reales, pero todavía no completan el contrato empresarial de extremo a extremo  
**Dependencia anterior:** `CODE-AUD-011`  
**Continuidad reservada:** `CODE-AUD-013`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica procesos que:

- ya tienen una entrada alcanzable;
- ejecutan al menos una validación o mutación real;
- producen algún resultado visible o persistente;
- pero todavía omiten una etapa, excepción, transición, integración, corrección, recuperación o cierre obligatorio.

Resultado general:

- se confirman procesos parciales en `vento-anima`, `vento-pass`, `vento-nexo`, `vento-viso`, `vento-fogo` y `vento-origo`;
- no se reclasifican como parciales las capacidades inexistentes o puramente técnicas ya cubiertas por `CODE-AUD-010` y `CODE-AUD-011`;
- no se declara un defecto por la sola existencia de un modo piloto, degradado o de solo registro;
- cada modo parcial deberá quedar explícitamente diferenciado de la operación final;
- se reutilizan requisitos de prueba ya existentes;
- se derivan cinco requisitos de prueba nuevos;
- se propone una sola tarea nueva del roadmap, porque no existe una tarea funcional exacta para cerrar el ciclo de novedades internas de ANIMA;
- no se modifican repositorios funcionales;
- no se modifica Supabase.

---

#### 2. Definición canónica de proceso parcial

Un proceso se clasifica como **parcialmente implementado** cuando existe esta base:

```text
actor
  ↓
entrada alcanzable
  ↓
validación
  ↓
acción real
  ↓
persistencia o efecto observable
```

pero falta uno o más componentes del contrato completo:

```text
estado inicial
→ ejecución
→ transición
→ confirmación
→ excepción
→ corrección
→ recuperación
→ integración posterior
→ cierre auditable
```

No es suficiente que una pantalla “haga algo”.

Para considerarse completo, el proceso deberá demostrar:

1. propósito empresarial aprobado;
2. actor y contexto autorizados;
3. entrada alcanzable;
4. datos de entrada completos;
5. validación de servidor;
6. estados y transiciones válidos;
7. persistencia atómica cuando corresponda;
8. resultado visible;
9. manejo de diferencias;
10. corrección sin destruir historial;
11. reintento o recuperación;
12. efecto sobre dominios consumidores;
13. evidencia auditable;
14. finalización inequívoca.

---

#### 3. Diferencia frente a otras tareas CODE-AUD

##### 3.1. No corresponde a CODE-AUD-010

`CODE-AUD-010` cubre interfaces que aparentan capacidad, pero no tienen lógica real suficiente detrás.

Ejemplos ya clasificados:

- acción de movimientos de PASS que solo muestra “Próximamente”;
- escaneo de mesa de PASS que solo muestra una alerta;
- newsletter pública sin persistencia real.

##### 3.2. No corresponde a CODE-AUD-011

`CODE-AUD-011` cubre infraestructura sin proceso utilizable.

Ejemplos ya clasificados:

- AURA como reserva;
- LPN sin ciclo operativo alcanzable;
- POS interno de PULSO sin recorrido completo;
- TALENTO sin despliegue productivo.

##### 3.3. Sí corresponde a CODE-AUD-012

Esta tarea cubre recorridos que sí ejecutan una parte real del proceso, pero quedan incompletos.

Ejemplos:

- crear una novedad y enviar notificación, pero no persistir ni aplicar su audiencia;
- enviar ZPL a la impresora, pero eliminar la cola antes de confirmar el resultado;
- registrar una remisión operativa, pero no afectar inventario porque el modo real está desactivado;
- crear un dispositivo compartido, pero no poder revocarlo o rotar sus credenciales desde una superficie administrativa;
- registrar producción real en una sola acción, pero no manejar inicio, producción parcial, finalización y corrección;
- registrar una recepción en modo solo registro, pero no completar la entrada de inventario y sus integraciones posteriores.

---

#### 4. Método aplicado

Para cada proceso se contrastó:

```text
actor
→ ruta o pantalla
→ acción de servidor
→ tabla, RPC o función
→ estado
→ resultado visible
→ consumidor posterior
→ corrección
→ cierre
```

Se revisaron especialmente:

- rutas alcanzables;
- formularios;
- server actions;
- RPC;
- flags de operación;
- persistencia local;
- estados declarados;
- transiciones encontradas;
- ausencia de consumidores posteriores;
- modos piloto, fallback o solo registro;
- tareas funcionales ya existentes en el plan.

La ausencia de una coincidencia en búsqueda de código no se interpreta por sí sola como prueba absoluta de inexistencia. Los hallazgos se formulan como estado comprobado de las ramas principales inspeccionadas al corte.

---

#### 5. ANIMA — novedades con CRUD y notificación, pero sin contrato completo de audiencia

Archivo principal revisado:

```text
vento-anima/src/components/announcements/use-announcements-screen.ts
```

##### 5.1. Capacidad real confirmada

El flujo permite:

- consultar novedades activas;
- crear una novedad;
- editar título, cuerpo y etiqueta;
- eliminar una novedad;
- invocar `announcement-notify`;
- seleccionar sedes y roles al crear.

Por tanto, no es una interfaz ficticia.

##### 5.2. Brecha de audiencia

Las selecciones:

```text
formSiteIds
formRoleCodes
```

solo se envían a:

```text
announcement-notify
```

después de insertar una novedad.

La fila persistida en `announcements` no conserva en ese flujo:

- sedes objetivo;
- roles objetivo;
- regla global o segmentada;
- versión de audiencia;
- criterio de visibilidad persistente.

La lectura posterior consulta todas las novedades activas y no aplica la audiencia seleccionada.

Por tanto, la interfaz actualmente puede significar:

```text
audiencia de la notificación
```

pero no demuestra:

```text
audiencia persistente de la novedad
```

##### 5.3. Edición incompleta

Al editar:

- no se cargan sedes o roles anteriores;
- no se actualiza una audiencia persistida;
- no se define si una edición vuelve a notificar;
- no se distingue edición editorial de redistribución;
- no se conserva historial de versiones.

##### 5.4. Eliminación

La acción encontrada ejecuta eliminación física sobre `announcements`.

No se encontró en este recorrido:

- archivo;
- despublicación;
- vigencia;
- motivo;
- historial de edición o retiro.

La política final deberá decidir si la eliminación física está permitida.

##### 5.5. Modo fallback

Cuando la tabla no existe:

- se cargan datos locales;
- la pantalla indica “modo local”;
- el guardado se rechaza con una alerta.

Este comportamiento ya está protegido por `TREQ-ANIMA-002`, pero sigue siendo un proceso degradado que deberá expresarse sin controles engañosos.

##### 5.6. Clasificación

**Proceso parcial confirmado.**

Capacidades reales:

```text
lectura
+ creación
+ edición básica
+ eliminación
+ notificación
```

Contrato incompleto:

```text
audiencia persistente
+ visibilidad
+ edición de audiencia
+ reenvío
+ archivo
+ historial
```

Destinos:

- nueva tarea `ANIMA-UX-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- `TREQ-ANIMA-001`;
- `TREQ-ANIMA-002`.

---

#### 6. PASS — historial de Saudo con atribución incompleta de sede

Archivo revisado:

```text
vento-pass/src/components/Saudo.tsx
```

La vista filtra transacciones por:

```text
metadata.site_id
```

Cuando una transacción no contiene ese campo:

```text
return false
```

Por tanto:

- la carga de transacciones es real;
- el historial se renderiza;
- el filtro por sede es real;
- pero una transacción legítima sin `metadata.site_id` desaparece silenciosamente.

No existe en este flujo una alternativa para:

- resolver la sede desde el beneficio;
- resolverla desde la orden;
- mostrar “sin atribución”;
- solicitar reconciliación;
- advertir al usuario que el historial está incompleto.

**Clasificación:** proceso de historial parcialmente implementado.

Destino exacto:

- `PASS-UX-006 — Diseñar historial`;
- `PASS-UX-009 — Diferenciar estado pendiente, usado y cancelado`;
- `PASS-QA-001 — Probar flujo completo de acumulación`;
- `PASS-QA-002 — Probar flujo completo de redención`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PASS-003`.

No se crea un requisito nuevo porque la regla ya está registrada.

---

#### 7. NEXO — ajustes con cobertura parcial del catálogo elegible

Archivo revisado:

```text
vento-nexo/src/app/inventory/adjust/page.tsx
```

##### 7.1. Capacidad real confirmada

La pantalla:

- exige permiso;
- resuelve sedes;
- permite seleccionar LOC;
- consulta stock por sede, LOC y posición;
- carga productos controlados;
- presenta el formulario de ajuste.

##### 7.2. Corte de productos

La consulta inicial utiliza:

```text
.limit(500)
```

Después se recuperan productos omitidos únicamente cuando aparecen con cantidad positiva en:

- stock por sede;
- stock por LOC;
- stock por posición.

Este rescate evita perder productos con existencia positiva, pero no recupera necesariamente:

- productos activos elegibles con stock cero;
- productos nuevos;
- productos fuera de los primeros quinientos por orden alfabético;
- productos que deban ajustarse desde cero por conteo o corrección.

Por tanto, el proceso de ajuste es real, pero su selector puede conservar una cobertura parcial del catálogo.

##### 7.3. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `NEXO-UX-019 — Diseñar flujo completo de ajustes`;
- `NEXO-UX-021 — Mostrar solo información necesaria según etapa`;
- `NEXO-UX-022 — Diseñar manejo de diferencias y excepciones`;
- `NEXO-UX-023 — Probar flujos en tablets y kioscos`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-002`.

No se crea un requisito nuevo porque la regla ya está registrada.

---

#### 8. NEXO — impresión local sin ciclo durable del trabajo

Archivos revisados:

```text
vento-nexo/src/app/printing/jobs/page.tsx
vento-nexo/src/app/printing/jobs/_components/QueuePanel.tsx
```

##### 8.1. Capacidad real confirmada

El flujo:

- detecta impresoras con BrowserPrint;
- conecta un dispositivo;
- genera ZPL;
- prepara una cola;
- conserva texto de cola en `localStorage`;
- envía ZPL mediante `device.send`;
- informa callback de éxito o error.

Por tanto, sí existe impresión local real.

##### 8.2. Cola no durable

La “cola” es texto local del navegador.

No se encontró en este recorrido:

- identificador de trabajo;
- estado `pending`;
- estado `sending`;
- estado `sent`;
- estado `confirmed`;
- estado `failed`;
- número de intentos;
- propietario;
- dispositivo;
- plantilla usada;
- hash del ZPL;
- evidencia de impresión;
- reimpresión controlada;
- recuperación desde otra terminal.

##### 8.3. Eliminación anticipada

En modo de una columna:

```text
sendZpl(...)
setQueueText("")
```

En modo con layout:

```text
sendZpl(...)
setQueueText("")
```

La cola se limpia inmediatamente después de invocar el envío, no después de que el callback confirme éxito.

En modo `3-up`, las filas se retiran de la cola después de invocar el envío.

Esto permite el escenario:

```text
envío iniciado
→ cola retirada
→ callback de error
→ trabajo perdido de la cola visible
```

##### 8.4. Confirmación limitada

El mensaje:

```text
Impresión enviada
```

confirma que BrowserPrint aceptó el envío, pero no demuestra:

- que la impresora imprimió;
- que el papel estaba disponible;
- que la etiqueta fue legible;
- que el trabajo no se duplicó;
- que el operador recibió la salida correcta.

##### 8.5. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `NEXO-UX-037 — Diseñar impresión de LOC, LPN, activo y documento`;
- `NEXO-UX-038 — Diseñar operación con escáner y etiquetas dañadas`;
- `NEXO-AUTH-028 — Proteger impresión y reimpresión mediante permisos atómicos`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-003`;
- crea `TREQ-NEXO-005`.

---

#### 9. NEXO — remisiones operativas con publicación de inventario desactivable

Archivo principal revisado:

```text
vento-nexo/src/app/inventory/remissions/[id]/detail-actions.ts
```

##### 9.1. Capacidad real confirmada

El dominio contiene:

- solicitud;
- preparación;
- cantidades preparadas;
- cantidades despachadas;
- validaciones de presentación;
- ubicaciones;
- faltantes;
- tránsito;
- recepción;
- estados operativos;
- firmas de actor en acciones aplicables.

No es infraestructura vacía.

##### 9.2. Modo operativo sin inventario

La publicación de inventario depende de:

```text
remissions.inventory_posting_enabled
```

El fallback global es:

```text
false
```

También existen flags por ubicación:

```text
inventory_real_enabled
remissions_posting_enabled
```

cuyo valor predeterminado es falso.

Por tanto, el sistema puede conservar el flujo operativo y sus eventos sin que necesariamente exista el efecto final sobre inventario real.

Este modo corresponde al piloto actualmente conocido y no se clasifica por sí mismo como error.

##### 9.3. Brecha contractual

El proceso permanece parcial mientras no exista una distinción inequívoca entre:

```text
remisión operativa registrada
```

y:

```text
remisión con inventario publicado
```

También deberán definirse:

- puerta de activación;
- responsables;
- LOC habilitados;
- comportamiento mixto entre ubicaciones;
- reconciliación del período piloto;
- prevención de doble publicación;
- tratamiento de remisiones completadas antes de activar inventario;
- evidencia de qué movimiento fue emitido;
- reversión o corrección.

##### 9.4. Clasificación

**Proceso parcial e intencionalmente degradado.**

Destino exacto:

- `NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión`;
- `NEXO-UX-010 — Diseñar flujo completo de preparación`;
- `NEXO-UX-011 — Diseñar flujo completo de despacho`;
- `NEXO-UX-012 — Diseñar flujo completo de tránsito`;
- `NEXO-UX-013 — Diseñar flujo completo de recepción`;
- `NEXO-UX-022 — Diseñar manejo de diferencias y excepciones`;
- `NEXO-UX-023 — Probar flujos en tablets y kioscos`;
- `NEXO-UX-025 — Definir métricas de tiempo, error y capacitación para el piloto operativo`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-NEXO-006`.

---

#### 10. Dispositivos compartidos — creación completa, administración del ciclo de vida incompleta

Archivos y superficies revisadas:

```text
vento-viso/src/app/staff/shared-devices/new/page.tsx
vento-viso/src/app/staff/page.tsx
vento-nexo/src/lib/auth/shared-device-signature.ts
vento-shell/supabase/migrations/*shared_device*
```

##### 10.1. Capacidad real confirmada

VISO puede:

- seleccionar una plantilla;
- asignar sede;
- asignar área;
- seleccionar aplicaciones;
- definir aplicación principal;
- crear usuario técnico;
- generar contraseña temporal;
- crear el registro del dispositivo;
- copiar políticas de actor;
- registrar el evento `device.created`.

NEXO ya puede exigir firma de actor por PIN en acciones concretas.

Por tanto, el modelo no es solo infraestructura.

##### 10.2. Superficie administrativa parcial

En VISO se localizó la creación del dispositivo, pero no una superficie equivalente y completa para:

- listar todos los dispositivos;
- ver estado;
- editar sede o área;
- cambiar aplicaciones;
- cambiar plantilla;
- suspender;
- revocar;
- rotar contraseña;
- recuperar credenciales;
- transferir un dispositivo;
- consultar sesiones;
- cerrar sesiones;
- consultar eventos;
- marcar pérdida o daño;
- retirar físicamente una estación.

##### 10.3. Experiencia de actor parcial

El modelo técnico contempla firma por PIN, pero el ciclo final todavía requiere definir y probar:

- identificación inicial;
- cambio de trabajador;
- cierre explícito;
- expiración;
- trabajador sin turno;
- trabajador sin PIN;
- PIN bloqueado;
- contingencia;
- operación offline;
- estación sin periférico;
- revocación inmediata.

##### 10.4. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `AUTH-DEV-011 — Permitir revocar un dispositivo`;
- `AUTH-DEV-012 — Manejar sesión expirada`;
- `AUTH-DEV-013 — Manejar cambio de trabajador`;
- `AUTH-DEV-014 — Probar tablets de NEXO`;
- `AUTH-DEV-015 — Probar terminales de PULSO`;
- `AUTH-DEV-016 — Probar pantallas de FOGO`;
- `UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas`;
- `UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación`;
- `UX-STATION-008 — Prototipar alternativas con trabajadores reales`;
- `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`;
- `UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción`;
- `UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados`;
- `CODE-AUD-017`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-AUTH-003`.

---

#### 11. ORIGO — recepción con modos inventario y solo registro

Archivos revisados:

```text
vento-origo/src/app/receipts/new/page.tsx
vento-origo/src/components/vento/receipts/receipt-form.tsx
```

##### 11.1. Capacidad real confirmada

El proceso contiene:

- selección de proveedor;
- orden de compra opcional;
- recepción directa de emergencia;
- productos;
- presentaciones;
- cantidades;
- costos e impuestos;
- lote y vencimiento;
- LOC y posición;
- solicitud de maestro de datos;
- corrección;
- firma de actor en dispositivo compartido;
- modos `inventory` y `record_only`.

##### 11.2. Modo solo registro

El servidor resuelve:

```text
receipt_operation_mode
```

como:

```text
inventory
```

o:

```text
record_only
```

En modo solo registro, la compra puede conservar evidencia administrativa sin mover inventario.

Este modo puede ser válido durante transición, pero no equivale a una recepción completa de inventario.

##### 11.3. Brechas que permanecen

El proceso final deberá definir y demostrar:

- cuándo se permite `record_only`;
- quién puede seleccionarlo;
- cómo se muestra en listados;
- si puede convertirse posteriormente en entrada real;
- cómo se evita una segunda recepción manual en NEXO;
- cómo se tratan recepciones parciales;
- cómo se tratan diferencias contra la orden;
- cómo se actualizan cantidades recibidas;
- cómo se emite el evento financiero;
- cómo se corrige sin duplicar stock ni costo;
- cómo se concilia una compra registrada sin entrada de inventario.

##### 11.4. Clasificación

**Proceso parcial e intencionalmente dual.**

Destino exacto:

- `ORIGO-UX-001 — Inventariar el proceso completo de abastecimiento`;
- `ORIGO-UX-002 — Separar solicitud, compra, aprobación y recepción`;
- `ORIGO-UX-009 — Diseñar recepción total`;
- `ORIGO-UX-010 — Diseñar recepción parcial`;
- `ORIGO-UX-011 — Diseñar diferencias contra orden`;
- `ORIGO-UX-013 — Evitar repetir recepción manualmente en NEXO`;
- `ORIGO-UX-014 — Conectar recepción con entrada de inventario`;
- `ORIGO-UX-015 — Conectar compra con evento financiero`;
- `ORIGO-AUTH-006 — Definir permisos de aprobación`;
- `ORIGO-AUTH-007 — Definir permisos de recepción`;
- `ORIGO-AUTH-008 — Definir permisos de corrección`;
- `ORIGO-AUTH-011 — Registrar actor de recepción`;
- `ORIGO-AUTH-012 — Integrar contexto operativo donde aplique`;
- `CODE-AUD-017`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-ORIGO-001`.

---

#### 12. FOGO — registro real de lote sin ciclo operativo completo de producción

Archivos revisados:

```text
vento-fogo/src/app/production-batches/new/page.tsx
vento-fogo/src/app/production-batches/page.tsx
```

##### 12.1. Capacidad real confirmada

FOGO puede:

- seleccionar una receta publicada;
- resolver ruta productiva;
- capturar rendimiento;
- capturar consumo real;
- capturar empaques;
- capturar coproductos y subproductos;
- exigir LOC destino cuando corresponde;
- exigir firma de actor en estación compartida;
- invocar `fogo_create_real_production_batch`;
- listar lote, consumo, costos, empaque y destino.

Esto demuestra una mutación productiva real.

##### 12.2. Modelo de una sola acción

El flujo encontrado registra el lote real mediante una acción final.

En la superficie inspeccionada no se localizó un recorrido de usuario para:

- iniciar un lote;
- marcarlo en progreso;
- registrar producción parcial;
- pausar;
- reanudar;
- cambiar responsable;
- registrar desperdicio durante ejecución;
- bloquear por control de calidad;
- finalizar;
- cancelar;
- corregir mediante evento compensatorio.

La lista conoce etiquetas como:

```text
draft
posted
completed
cancelled
```

pero no se localizaron en `vento-fogo` acciones equivalentes que gestionen todo ese ciclo.

##### 12.3. Consecuencia

El proceso actual puede servir como:

```text
registro posterior de producción ejecutada
```

pero no demuestra todavía:

```text
gestión operativa del lote durante el turno
```

##### 12.4. Clasificación

**Proceso parcial confirmado.**

Destino exacto:

- `FOGO-AUTH-009 — Proteger inicio de producción`;
- `FOGO-AUTH-010 — Proteger producción parcial`;
- `FOGO-AUTH-011 — Proteger finalización`;
- `FOGO-AUTH-012 — Proteger correcciones y anulaciones`;
- `FOGO-AUTH-014 — Registrar actor y turno`;
- `FOGO-UX-001 — Inventariar procesos reales de producción`;
- `FOGO-UX-003 — Diseñar inicio por área productiva`;
- `FOGO-UX-004 — Mostrar producción pendiente del turno`;
- `FOGO-UX-005 — Diseñar inicio de lote`;
- `FOGO-UX-006 — Diseñar producción parcial`;
- `FOGO-UX-007 — Diseñar finalización de lote`;
- `FOGO-UX-010 — Registrar cantidades, desperdicio y resultado`;
- `FOGO-UX-011 — Diseñar correcciones sin alterar historial`;
- `FOGO-UX-012 — Conectar consumo de insumos con NEXO`;
- `FOGO-UX-013 — Conectar producto terminado con NEXO`;
- `CODE-AUD-017`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-FOGO-001`.

---

#### 13. Falsos positivos y exclusiones

##### 13.1. AURA

No es un proceso parcial.

Es una reserva sin producto y permanece en `CODE-AUD-011`.

##### 13.2. LPN

No es un proceso parcial alcanzable.

La infraestructura sin ciclo pertenece a `CODE-AUD-011`.

##### 13.3. POS interno completo de PULSO

No se reclasifica como parcial.

La fundación técnica sin recorrido de venta y caja completo pertenece a `CODE-AUD-011`.

##### 13.4. PASS movimientos y escaneo de mesa

Son acciones sin lógica completa detrás.

Permanecen en `CODE-AUD-010`.

##### 13.5. Newsletter pública

La interfaz no persiste una suscripción real.

Permanence en `CODE-AUD-010` y `WEB-FRM-011`.

##### 13.6. Corrección de marcaciones y pagos

No se encontró un proceso aprobado de corrección.

Permanecen como infraestructura de datos sin proceso en `CODE-AUD-011`.

##### 13.7. Código legacy

La existencia de rutas o estructuras antiguas no se resuelve aquí.

Continúa en:

```text
CODE-AUD-013
— Detectar código legacy todavía activo
```

##### 13.8. Artefactos sin consumidor

La falta de consumidor se profundizará en:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```

---

#### 14. Matriz por repositorio

| Repositorio     | Resultado de CODE-AUD-012                                                                                     | Clasificación                  |
| --------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| `vento-shell`   | soporta contratos y persistencia de varios procesos parciales; no se detecta una nueva superficie propia      | infraestructura transversal    |
| `vento-viso`    | creación de dispositivo compartido real, sin ciclo administrativo completo                                    | proceso parcial                |
| `vento-nexo`    | ajustes, impresión y remisiones tienen recorridos reales con brechas de cobertura, confirmación e integración | procesos parciales confirmados |
| `vento-fogo`    | registro real de lote, pero sin ciclo operativo completo de inicio, parcialidad, finalización y corrección    | proceso parcial                |
| `vento-origo`   | recepción real con modos inventario y solo registro; integración final todavía condicionada                   | proceso parcial                |
| `vento-pulso`   | salón y llamados tienen lógica; POS integral sigue clasificado en CODE-AUD-011                                | sin nuevo hallazgo parcial     |
| `vento-numera`  | no se confirma una nueva brecha parcial durante este corte                                                    | continuar en CODE-AUD-019      |
| `Vento-Group`   | newsletter pertenece a interfaz sin lógica completa                                                           | excluido                       |
| `vento-anima`   | novedades tienen CRUD y notificación, pero audiencia y ciclo editorial están incompletos                      | proceso parcial                |
| `vento-pass`    | historial de Saudo omite transacciones sin atribución de sede                                                 | proceso parcial                |
| `vento-talento` | producto no desplegado                                                                                        | excluido                       |
| `vento-vital`   | proyecto separado                                                                                             | fuera de Vento OS              |
| AURA            | reserva sin aplicación                                                                                        | excluido                       |

---

#### 15. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                             | Destino                                                                  |
| ---------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `H-CODE-012-001` | ANIMA crea y notifica novedades, pero no persiste ni aplica audiencia de lectura                     | `ANIMA-UX-017`, `CODE-AUD-019`, `020`, `TREQ-ANIMA-001`                  |
| `H-CODE-012-002` | ANIMA no recupera audiencia al editar ni define reenvío                                              | `ANIMA-UX-017`, `TREQ-ANIMA-001`                                         |
| `H-CODE-012-003` | ANIMA elimina físicamente y no demuestra archivo o historial editorial                               | `ANIMA-UX-017`, `CODE-AUD-019`, `020`                                    |
| `H-CODE-012-004` | ANIMA fallback permite lectura, pero rechaza mutaciones                                              | `TREQ-ANIMA-002`, `CODE-AUD-020`                                         |
| `H-CODE-012-005` | PASS excluye silenciosamente transacciones de Saudo sin `metadata.site_id`                           | `PASS-UX-006`, `PASS-QA-001`, `002`, `TREQ-PASS-003`                     |
| `H-CODE-012-006` | NEXO ajustes corta el catálogo inicial a 500 y solo rescata omitidos con stock positivo              | `NEXO-UX-019`, `021`, `022`, `023`, `TREQ-NEXO-002`                      |
| `H-CODE-012-007` | la cola de impresión NEXO es estado local, no un trabajo durable                                     | `NEXO-UX-037`, `038`, `CODE-AUD-018`, `019`, `020`, `TREQ-NEXO-005`      |
| `H-CODE-012-008` | NEXO limpia elementos de impresión antes del callback definitivo                                     | mismo destino de `H-CODE-012-007`                                        |
| `H-CODE-012-009` | una remisión puede avanzar operativamente sin publicar inventario real                               | `NEXO-UX-009` a `013`, `022`, `023`, `025`, `TREQ-NEXO-006`              |
| `H-CODE-012-010` | no está cerrado el contrato de activación y reconciliación del piloto de remisiones                  | mismo destino de `H-CODE-012-009`                                        |
| `H-CODE-012-011` | VISO crea dispositivos compartidos, pero no demuestra administración completa posterior              | `AUTH-DEV-011` a `016`, `UX-STATION-004`, `007` a `012`, `TREQ-AUTH-003` |
| `H-CODE-012-012` | ORIGO permite `record_only` e `inventory` sin que el cierre integral de abastecimiento esté definido | `ORIGO-UX-001`, `002`, `009` a `015`, `TREQ-ORIGO-001`                   |
| `H-CODE-012-013` | FOGO registra un lote real en una acción final, pero no gestiona el ciclo durante el turno           | `FOGO-AUTH-009` a `014`, `FOGO-UX-001`, `003` a `013`, `TREQ-FOGO-001`   |
| `H-CODE-012-014` | las etiquetas de estado de lote no equivalen a transiciones operativas alcanzables                   | mismo destino de `H-CODE-012-013`                                        |
| `H-CODE-012-015` | no todo modo parcial es un defecto; deberá quedar identificado y no confundirse con operación final  | `PROC-CAT-002`, `CODE-AUD-019`, `020`                                    |

Todos los hallazgos quedan cerrados, reutilizan una tarea existente o generan una tarea explícita.

---

#### 16. Nueva tarea propuesta

No existe una tarea funcional exacta para el ciclo de novedades internas de ANIMA.

Se propone agregar en:

```text
docs/plan-canonico/modular/bloques/F_ANIMA/00_BLOQUE_F.md
```

inmediatamente después de:

```md
### [ ] ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno
```

la línea completa:

```md
### [ ] ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad
```

Esta tarea deberá definir:

- audiencia de notificación;
- audiencia de lectura;
- publicación global o segmentada;
- persistencia;
- edición;
- reenvío;
- archivo;
- vigencia;
- historial;
- permisos;
- evidencia;
- comportamiento fallback.

No se crea ninguna otra tarea nueva.

---

#### 17. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 17.1. Requisitos reutilizados

- `TREQ-ANIMA-001`;
- `TREQ-ANIMA-002`;
- `TREQ-PASS-003`;
- `TREQ-NEXO-002`;
- `TREQ-NEXO-003`;
- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`.

No se cambia su estado durante esta tarea.

##### 17.2. Requisitos nuevos

###### `TREQ-NEXO-005`

Un trabajo de impresión no podrá retirarse definitivamente de la cola antes de recibir el resultado del envío; deberá poder conservar estado, error, reintento, dispositivo, contenido e identificación suficientes para evitar pérdida o duplicación.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-NEXO-006`

Toda remisión deberá indicar de forma verificable si fue únicamente registrada de manera operativa o si publicó movimientos reales de inventario; la activación, mezcla por LOC, reconciliación y reintento no podrán producir doble contabilización.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-AUTH-003`

Todo dispositivo compartido deberá tener un ciclo auditable de creación, activación, uso, cambio de actor, expiración, suspensión, revocación, rotación de credenciales y retiro, sin conservar acceso después de quedar inactivo.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-ORIGO-001`

Toda recepción deberá declarar si mueve inventario o si es solo registro, conservar esa modalidad de forma visible y auditable, y evitar que su conversión, corrección o repetición duplique cantidades, costos, orden recibida o evento financiero.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-FOGO-001`

Todo lote productivo deberá demostrar el ciclo aprobado de inicio, producción parcial, consumo, desperdicio, resultado, finalización, cancelación o corrección, con actor, turno, cantidades y efectos de inventario auditables.

**Estado inicial propuesto:** `IDENTIFICADO`.

Las filas canónicas completas se agregarán únicamente en:

```text
04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

después de la aprobación de `CODE-AUD-012`.

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 18. Decisiones propuestas

1. Un proceso parcial deberá ejecutar al menos un efecto real.
2. Una interfaz sin efecto continuará en `CODE-AUD-010`.
3. Infraestructura sin recorrido continuará en `CODE-AUD-011`.
4. ANIMA novedades se declara proceso parcial.
5. Audiencia de notificación y audiencia de lectura no se presumirán equivalentes.
6. La eliminación física de novedades deberá someterse a decisión funcional.
7. Se crea `ANIMA-UX-017`.
8. PASS Saudo mantiene `TREQ-PASS-003`.
9. NEXO ajustes mantiene `TREQ-NEXO-002`.
10. Impresión NEXO se reconoce como funcional, pero no durable.
11. Se deriva `TREQ-NEXO-005`.
12. El piloto de remisiones no se considera un defecto por estar desactivado el inventario.
13. El modo operativo de remisiones no podrá confundirse con inventario publicado.
14. Se deriva `TREQ-NEXO-006`.
15. Dispositivos compartidos se reconocen como proceso parcial, no como infraestructura vacía.
16. Se deriva `TREQ-AUTH-003`.
17. ORIGO `record_only` se reconoce como modalidad transitoria o específica, no como recepción completa de inventario.
18. Se deriva `TREQ-ORIGO-001`.
19. FOGO tiene registro productivo real, pero no ciclo operativo completo.
20. Se deriva `TREQ-FOGO-001`.
21. No se crea ninguna tarea adicional fuera de `ANIMA-UX-017`.
22. No se modifican estados de requisitos existentes.
23. No se modifica código.
24. No se modifica Supabase.
25. `CODE-AUD-013` será la única continuidad inmediata.

---

#### 19. Límites de certeza

Esta tarea no confirma:

- que ninguna otra rama contenga administración adicional de dispositivos;
- que BrowserPrint nunca confirme impresión física mediante capacidades no inspeccionadas;
- que todas las remisiones actuales operen con inventario desactivado;
- que todos los LOC tengan flags desactivados;
- que `record_only` de ORIGO deba eliminarse;
- que toda recepción deba mover inventario;
- que FOGO deba adoptar obligatoriamente estados largos para todas las áreas;
- que toda novedad de ANIMA deba tener audiencia segmentada;
- que una eliminación física esté siempre prohibida;
- que ninguna integración externa complete los procesos observados;
- que todos los procesos parciales existentes hayan sido detectados.

Las tareas siguientes deberán profundizar:

- `CODE-AUD-013`: código legacy activo;
- `CODE-AUD-015`: artefactos sin consumidor;
- `CODE-AUD-017`: autorización y seguridad;
- `CODE-AUD-018`: offline, reintentos, concurrencia e idempotencia;
- `CODE-AUD-019`: vínculo entre capacidad e implementación verificable;
- `CODE-AUD-020`: backlog técnico y funcional.

---

#### 20. Criterios de aceptación

`CODE-AUD-012` podrá aprobarse cuando:

- exista una definición verificable de proceso parcial;
- se diferencie de interfaz ficticia e infraestructura aislada;
- ANIMA novedades quede evaluado;
- PASS historial quede evaluado;
- NEXO ajustes quede evaluado;
- NEXO impresión quede evaluado;
- NEXO remisiones quede evaluado;
- dispositivos compartidos queden evaluados;
- ORIGO recepción quede evaluado;
- FOGO producción quede evaluado;
- cada hallazgo tenga destino exacto;
- la única tarea nueva sea `ANIMA-UX-017`;
- los requisitos reutilizados estén identificados;
- los cinco requisitos nuevos estén identificados;
- las filas completas no se dupliquen dentro de esta tarea;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-013` permanezca como continuidad inmediata.

---

#### 21. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
recorrido real
→ etapa disponible
→ etapa ausente o degradada
→ riesgo
→ tarea funcional
→ requisito de prueba
→ paquete posterior
```

La continuidad será:

```text
CODE-AUD-013
— Detectar código legacy todavía activo
```


### ✅ CODE-AUD-013 — Detectar código legacy todavía activo

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de código, contratos, aliases, fallbacks y estructuras heredadas que todavía participan en ejecución real  
**Dependencia anterior:** `CODE-AUD-012`  
**Continuidad reservada:** `CODE-AUD-014`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica elementos legacy que todavía intervienen en:

- renderizado;
- navegación;
- autorización;
- persistencia;
- resolución de contexto;
- selección de datos;
- transición de estados;
- contratos entre aplicaciones;
- compatibilidad con filas antiguas;
- ejecución de procesos actuales.

La clasificación no depende del nombre del archivo ni de que el código contenga la palabra `legacy`.

Un elemento se considera **legacy todavía activo** cuando:

```text
fue reemplazado, superado o declarado transitorio
        +
todavía es consumido durante la ejecución actual
```

Resultado general:

- PULSO continúa montando su tablero operativo actual sobre `orders-board-legacy`;
- PULSO acepta simultáneamente dos nombres para un mismo estado de tránsito;
- NEXO mantiene fallbacks activos para esquemas antiguos de configuración de producto por sede;
- NEXO deriva comportamiento operativo desde roles, nombres de sede y conjuntos hardcodeados cuando faltan contratos canónicos;
- NEXO permite operar productos sin perfil canónico y les asigna semántica predeterminada;
- NEXO conserva compatibilidad explícita con productos sin SKU;
- VISO y PASS mantienen `logo_url` como contrato heredado junto a `card_logo_url` y `header_logo_url`;
- VISO conserva un tipo de carga `legacy`;
- el sistema de simulación mediante role override sigue activo y distribuido en varias aplicaciones;
- migraciones históricas, scripts no invocados y etiquetas textuales no se consideran automáticamente legado activo;
- no se crea ninguna tarea nueva del roadmap;
- se derivan cinco requisitos de prueba;
- no se modifica código ni Supabase.

---

#### 2. Definiciones utilizadas

##### 2.1. Código legacy activo

Código antiguo o transitorio que todavía es alcanzado por el recorrido actual.

Ejemplos:

- componente nuevo que importa y renderiza un componente `legacy`;
- wrapper que delega la mayor parte de la operación a una implementación antigua;
- columna antigua que todavía se escribe y consulta;
- alias de estado aceptado en producción;
- fallback que sustituye columnas o tablas canónicas ausentes;
- lógica basada en nombres que reemplaza temporalmente un catálogo;
- datos sin migrar que reciben supuestos automáticos.

##### 2.2. Compatibilidad temporal válida

Puente explícito que:

- tiene propietario;
- tiene consumidores conocidos;
- está limitado;
- preserva comportamiento;
- produce evidencia cuando se activa;
- tiene pruebas de paridad;
- posee criterio y momento de retiro.

No todo puente temporal es un defecto.

##### 2.3. Legado dormido

Código que permanece en el repositorio, pero no tiene consumidor o entrada alcanzable confirmada.

Corresponde principalmente a:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```

##### 2.4. Código histórico

No se considera legado activo por sí solo:

- migraciones ya ejecutadas;
- documentos históricos;
- changelogs;
- commits;
- fixtures;
- scripts de migración no conectados con build o runtime;
- copias archivadas no importadas.

##### 2.5. Alias de compatibilidad

Nombre antiguo aceptado junto con el nombre actual.

Ejemplos:

```text
on_the_way
in_transit
```

o:

```text
received
closed
```

El alias puede ser necesario durante una transición, pero no debe permanecer indefinidamente sin contrato.

---

#### 3. Criterios de clasificación

Para declarar un hallazgo se verificó al menos una de estas condiciones:

1. existe importación desde una ruta activa;
2. existe invocación desde una pantalla o acción actual;
3. una columna legacy todavía se escribe;
4. una columna legacy todavía se usa como fallback;
5. el código acepta dos contratos equivalentes;
6. un error de esquema activa una rama heredada;
7. faltan datos canónicos y el sistema aplica supuestos;
8. una regla basada en nombre o rol sustituye una fuente canónica;
9. la compatibilidad no tiene criterio de retiro visible;
10. el elemento puede alterar resultados actuales.

No se declara brecha únicamente porque:

- el archivo contiene `legacy` en su nombre;
- existe una migración de limpieza;
- una dependencia externa está marcada deprecated;
- un mensaje de interfaz dice “producto legacy”;
- existe un fallback visual inocuo;
- la compatibilidad está aprobada y acotada;
- el código pertenece a una versión antigua, pero no es consumido.

---

#### 4. PULSO — el tablero actual depende directamente de `orders-board-legacy`

Archivos revisados:

```text
vento-pulso/src/app/orders/orders-board.tsx
vento-pulso/src/app/orders/orders-board-live.tsx
vento-pulso/src/app/orders/orders-board-legacy.tsx
vento-pulso/src/app/orders/page.tsx
```

##### 4.1. Dependencia runtime confirmada

El componente actual:

```text
orders-board.tsx
```

importa:

```ts
import { OrdersBoard as BaseOrdersBoard } from "./orders-board-legacy";
```

Después agrega comportamiento de regalos y finalmente renderiza:

```tsx
<BaseOrdersBoard {...props} orders={orders} />
```

Por tanto:

```text
OrdersBoardLive
        ↓
OrdersBoard actual
        ↓
OrdersBoard legacy
```

El archivo `orders-board-legacy.tsx` no es una copia dormida. Continúa siendo la base visual y funcional del tablero activo.

##### 4.2. Responsabilidades todavía concentradas en la base legacy

La implementación heredada conserva contratos y comportamiento para:

- tarjetas de pedido;
- modal;
- pestañas de pedido, chat e historial;
- facturación;
- mensajes;
- eventos;
- estados;
- despacho;
- acciones operativas.

Las mejoras actuales se montan alrededor de ella mediante wrappers.

Riesgos:

- cambiar el wrapper no elimina la dependencia legacy;
- la lógica puede repartirse entre tres capas;
- tipos y estados pueden divergir;
- una corrección puede aplicarse en la capa equivocada;
- retirar el archivo sin mapa de paridad puede romper chat, historial o facturación;
- el nombre “legacy” puede hacer que se subestime que sigue siendo producción.

##### 4.3. Scripts históricos de parche

Persisten scripts que fueron utilizados para redirigir modificaciones hacia el tablero legacy.

Sin embargo, el `package.json` actual no contiene hooks `predev` o `prebuild` que demuestren su ejecución automática.

Clasificación:

```text
orders-board-legacy.tsx
→ legacy activo confirmado

scripts de parche
→ artefactos sin activación actual confirmada
→ CODE-AUD-015
```

##### 4.4. Destino

- `PULSO-AUTH-002 — Inventariar órdenes`;
- `PULSO-UX-001 — Inventariar procesos de venta, caja y salón`;
- `PULSO-UX-007 — Simplificar creación de venta`;
- `PULSO-UX-013 — Diseñar confirmaciones para acciones sensibles`;
- `PULSO-UX-019 — Validar el prototipo con caja, salón, barra, cocina y mostrador`;
- `SHELL-AUD-001 — Buscar código duplicado entre repositorios`;
- `SHELL-PKG-004 — Definir política de compatibilidad`;
- `SHELL-PKG-005 — Definir política de deprecación`;
- `CODE-AUD-014`;
- `CODE-AUD-015`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se autoriza reemplazar el tablero antes de levantar una matriz de paridad.

---

#### 5. PULSO — vocabulario doble de estados de tránsito

En las superficies actuales se aceptan:

```text
in_transit
on_the_way
```

Ambos se muestran como:

```text
En camino
```

y ambos permiten avanzar a:

```text
delivered
```

Esto constituye un alias de compatibilidad activo.

No se determina todavía cuál debe ser el nombre final.

La decisión deberá establecer:

- estado canónico;
- consumidores de cada alias;
- datos existentes;
- eventos emitidos;
- filtros;
- Realtime;
- integraciones;
- backfill;
- ventana de compatibilidad;
- criterio de retiro.

Riesgos:

- órdenes excluidas por filtros;
- transiciones distintas para el mismo significado;
- métricas divididas;
- eventos incompatibles;
- consultas que contemplan solo uno de los valores;
- aliases que se vuelven permanentes.

Destino:

- `PULSO-UX-001`;
- `SHELL-CON-010 — Centralizar estados de procesos`;
- `SUPA-AUD-018`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-001`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-006`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `SUPA-TRANS-013`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 6. NEXO — fallback de configuración antigua de producto por sede

Archivo principal:

```text
vento-nexo/src/app/inventory/remissions/page-helpers.ts
```

##### 6.1. Consulta canónica intentada

La primera consulta solicita:

```text
product_id
is_active
default_area_kind
area_kinds
remission_category_id
audience
remission_enabled
updated_at
created_at
```

##### 6.2. Rama legacy activa

Cuando esa consulta produce error, el código ejecuta otra consulta sin:

```text
audience
remission_enabled
```

Después completa artificialmente:

```ts
audience: null
remission_enabled: null
```

La compatibilidad puede permitir operar contra un esquema o despliegue desactualizado.

Pero actualmente:

- el fallback se activa por cualquier error de la primera consulta;
- no distingue columna ausente de error de permisos, red o consulta;
- no produce evidencia visible;
- no declara ambiente;
- no tiene fecha de retiro;
- puede degradar silenciosamente reglas de audiencia o habilitación.

Consecuencia:

```text
error de consulta moderna
        ↓
modelo antiguo asumido
        ↓
operación continúa con semántica reducida
```

**Clasificación:** puente legacy activo sin observabilidad suficiente.

Destinos:

- `SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de vento-shell`;
- `SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración`;
- `SUPA-AUD-018 — Identificar tablas, columnas, funciones y políticas legacy`;
- `SUPA-AUD-019 — Detectar duplicidades, datos huérfanos y fuentes de verdad competidoras`;
- `SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos`;
- `SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos`;
- `SUPA-TRANS-006 — Definir vistas, wrappers o aliases temporales de compatibilidad`;
- `SUPA-TRANS-007 — Definir adaptación coordinada de consumidores`;
- `SUPA-TRANS-012 — Definir retiro progresivo de objetos legacy`;
- `SUPA-TRANS-013 — Definir verificación de paridad local, staging y producción`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 7. NEXO — alcance de remisiones derivado desde roles y fallbacks hardcodeados

El flujo actual contiene reglas de compatibilidad como:

```text
cajero
→ cajero / mostrador

barista
→ bar / barra

cocinero
→ cocina
```

Además, cuando falla la consulta del catálogo `area_kinds`, utiliza:

```text
cajero
mostrador
bar
barra
cocina
```

como conjunto permitido para remisiones.

Esta lógica sigue activa dentro de la resolución de área.

No se trata únicamente de un valor hardcodeado. Es una segunda fuente de verdad que puede sustituir:

- roles operativos;
- áreas activas;
- catálogo de tipos de área;
- reglas por sede;
- capacidades configuradas.

Riesgos:

- un rol nuevo no recibe área;
- una sede con códigos distintos opera incorrectamente;
- una falla de catálogo cambia silenciosamente autorización o alcance;
- el rol base se usa como proxy del contexto operativo;
- la compatibilidad evita detectar una configuración incompleta.

Destino:

- `PROC-ACTOR-002 — Vincular cada proceso con roles operativos aplicables`;
- `PROC-ACTOR-010 — Prohibir autorización derivada únicamente del nombre del rol`;
- `NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión`;
- `NEXO-UX-021 — Mostrar solo información necesaria según etapa`;
- `NEXO-AUTH-029 — Eliminar dependencia de permisos amplios legacy`;
- `AUTH-DEV-*` cuando aplique a estaciones;
- `CODE-AUD-014`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-AUTH-001`.

---

#### 8. NEXO — aliases de estado de remisión todavía aceptados

La presentación actual reconoce, entre otros:

```text
pending
preparing
dispatch_ready
in_transit
partial
received
closed
cancelled
```

Los valores:

```text
received
closed
```

se muestran ambos como:

```text
Recibida
```

y la matriz de acciones acepta ambos para reversión.

Esto indica que dos estados con significado potencialmente distinto o sucesivo continúan tratados como equivalentes en ciertas superficies.

La tarea no declara que uno deba eliminarse inmediatamente.

Debe definirse:

- si `received` es recepción física;
- si `closed` es cierre administrativo;
- si son sinónimos históricos;
- qué transiciones existen;
- cuál consume inventario;
- cuál habilita reversión;
- cuál es final;
- cómo se migran registros existentes.

Destino:

- `NEXO-UX-009` a `NEXO-UX-013`;
- `PROC-CAT-009` a `PROC-CAT-014`;
- `SHELL-CON-010`;
- `SUPA-AUD-018`;
- `SUPA-TRANS-001`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-006`;
- `SUPA-TRANS-012`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 9. NEXO — productos sin perfil canónico reciben semántica predeterminada

En creación de remisiones se consulta primero:

```text
product_inventory_profiles
```

Cuando un producto no aparece allí, el flujo lo recupera desde:

```text
products
```

y le asigna:

```text
inventory_kind: null
measurement_mode: fixed_presentation
default_tolerance_percent: null
requires_actual_dispatch_qty: false
requires_count_alongside_weight: false
```

Esto mantiene utilizables productos antiguos sin perfil.

Sin embargo, el fallback no es neutro.

Define comportamiento operativo:

- modalidad de medición;
- captura de cantidad;
- tolerancia;
- conteo;
- despacho real.

Un producto sin perfil puede comportarse como presentación fija aunque su naturaleza real sea:

- peso variable;
- conteo con peso;
- volumen;
- lote;
- empaque;
- producto producido.

**Clasificación:** compatibilidad de datos legacy activa con riesgo semántico.

Destino:

- `CAP-SCOPE-004 — Evaluar catálogo, productos, presentaciones, unidades, menús y recetas`;
- `CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN`;
- `NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 10. NEXO — productos legacy sin SKU continúan soportados

El componente:

```text
vento-nexo/src/components/inventory/SkuField.tsx
```

muestra expresamente:

```text
Sin SKU (legacy)
Producto legacy sin SKU
```

y permite:

- conservar el registro sin SKU;
- editar el SKU manualmente;
- asignar SKU automático si queda vacío.

La compatibilidad es razonable durante saneamiento del catálogo.

El riesgo aparece si no existe:

- inventario completo de registros afectados;
- regla de unicidad;
- prioridad de backfill;
- bloqueo para nuevos productos sin SKU;
- distinción entre identificador visible y clave técnica;
- verificación de consumidores que usan SKU;
- criterio de retiro de la compatibilidad.

**Clasificación:** datos legacy activos, con mecanismo de regularización parcial.

Destino:

- `CAP-SCOPE-004`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 11. NEXO — clasificación de sede inferida desde nombre cuando falta contrato

El editor de configuración de producto intenta utilizar:

```text
site_type
```

y capacidades de sede.

Cuando faltan, puede inferir:

```text
nombre contiene "centro de producción"
→ production_center

cualquier otro nombre
→ satellite
```

La misma inferencia influye en qué sedes aparecen como productivas o satélites cuando no existe registro de capacidades.

Esto es un puente de compatibilidad activo con modelos anteriores de sede.

Riesgos:

- un cambio de nombre altera comportamiento;
- una sede administrativa puede clasificarse como satélite;
- una nueva sede productiva queda fuera;
- una traducción o variación ortográfica rompe la inferencia;
- la ausencia de capacidades queda oculta;
- el nombre visible se convierte en regla empresarial.

Destino:

- `CAP-SCOPE-001 — Evaluar gobierno, empresas, sedes y organización`;
- `PROC-CAT-005 — Definir aplicación propietaria de cada proceso`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

---

#### 12. VISO y PASS — `logo_url` continúa como contrato heredado activo

Archivos revisados:

```text
vento-viso/src/components/viso/business-form.tsx
vento-viso/src/app/businesses/[id]/page.tsx
vento-viso/src/app/api/viso/upload-logo/route.ts
vento-pass/src/utils/satelliteLogos.ts
```

##### 12.1. Modelo actual

El modelo nuevo contiene:

```text
card_logo_url
header_logo_url
```

pero conserva:

```text
logo_url
```

##### 12.2. Escritura legacy confirmada

VISO:

- inicializa card y header desde `logo_url`;
- calcula un `legacyLogo`;
- envía `logo_url` como campo oculto;
- guarda simultáneamente las tres columnas;
- muestra diagnóstico “Legacy logo URL”.

##### 12.3. Lectura legacy confirmada

PASS elige:

```text
card_logo_url
→ fallback logo_url
```

o:

```text
header_logo_url
→ fallback logo_url
```

Por tanto, `logo_url` todavía forma parte del contrato de ejecución y no es una columna histórica pasiva.

##### 12.4. Carga legacy

El endpoint de VISO acepta:

```text
kind = legacy
```

como valor predeterminado cuando no recibe `card` o `header`.

Esto permite generar nuevos objetos legacy.

##### 12.5. Evaluación

La compatibilidad evita romper satélites sin logos separados.

Pero falta definir:

- backfill de card y header;
- precedencia definitiva;
- consumidores;
- prohibición de nuevas escrituras legacy;
- tratamiento de satélites antiguos;
- prueba visual de paridad;
- retiro de `kind=legacy`;
- retiro futuro de la columna.

Destino:

- `VISO-UX-017 — Evitar duplicar configuración propia de otras aplicaciones`;
- `VISO-UX-018 — Enlazar a la aplicación propietaria cuando corresponda`;
- `PASS-UX-001 — Inventariar pantallas actuales de cliente`;
- `SUPA-AUD-018`;
- `SUPA-AUD-019`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-006`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `SUPA-TRANS-013`;
- `CODE-AUD-014`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PASS-004`.

---

#### 13. Role override — puente activo de simulación distribuido

Se localizaron implementaciones de:

```text
checkPermissionWithRoleOverride
```

en varias aplicaciones.

La función de NEXO:

- lee un rol simulado desde cookie;
- consulta permisos de `role_permissions`;
- resuelve alcance;
- sustituye estrictamente el rol efectivo durante simulación;
- contiene una excepción especial para conductor en tránsito.

No se clasifica el role override como defecto por existir.

El plan ya aprobó una simulación separada.

La brecha es de transición y distribución:

- la implementación está copiada entre repositorios;
- puede divergir;
- combina simulación con excepciones operativas;
- consulta contratos legacy de permisos;
- el comportamiento depende de cada copia;
- no existe todavía paquete compartido aprobado.

Destino:

- `SHELL-AUD-005 — Comparar role override`;
- `SHELL-AUD-003 — Comparar helpers de permisos`;
- `SHELL-PKG-004 — Definir política de compatibilidad`;
- `SHELL-PKG-005 — Definir política de deprecación`;
- `SHELL-CON-003 — Centralizar códigos de permisos`;
- `SHELL-CON-007 — Centralizar tipos de contexto`;
- `CODE-AUD-014`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-AUTH-001`;
- mantiene `TREQ-AUTH-002`.

---

#### 14. Artefactos excluidos como falsos positivos

##### 14.1. Migraciones históricas

Archivos con nombres como:

```text
cleanup_legacy
drop_legacy
deactivate_legacy
```

no son código runtime por el solo hecho de permanecer en:

```text
supabase/migrations
```

Deben conservarse como historial reproducible.

E3 verificará el estado final de los objetos, no eliminará migraciones aplicadas.

##### 14.2. Scripts de parche no conectados

Los scripts de PULSO que apuntaron al tablero legacy no aparecen en los scripts actuales de `package.json`.

Se reservan para `CODE-AUD-015`.

##### 14.3. Dependencias deprecated del lockfile

Una advertencia de paquete no demuestra lógica empresarial legacy.

Corresponde a build y dependencias:

```text
CODE-AUD-016
```

##### 14.4. Valores de dominio antiguos no declarados obsoletos

Códigos como:

```text
preparacion
venta
```

no se consideran legacy sin una decisión canónica que los reemplace.

##### 14.5. Modo `record_only`

El modo de ORIGO fue clasificado como proceso parcial en `CODE-AUD-012`.

No se reclasifica como legacy únicamente por ser transitorio.

##### 14.6. Código sin consumidor

Aunque un archivo parezca antiguo, si no se confirma importación o ruta activa deberá resolverse en `CODE-AUD-015`.

---

#### 15. Matriz por repositorio

| Repositorio     | Legado activo confirmado                                                                                                     | Clasificación                   |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `vento-shell`   | objetos legacy deberán verificarse en E3; migraciones históricas se excluyen como runtime                                    | pendiente de auditoría de datos |
| `vento-viso`    | escritura de `logo_url`, fallback de logos y carga `legacy`; role override distribuido                                       | compatibilidad activa           |
| `vento-nexo`    | columnas opcionales con fallback, áreas por rol, aliases de estado, productos sin perfil/SKU, sedes inferidas, role override | legado activo transversal       |
| `vento-fogo`    | role override distribuido; no se confirma otro legado funcional específico                                                   | compatibilidad compartida       |
| `vento-origo`   | role override distribuido; no se confirma otro legado funcional específico                                                   | compatibilidad compartida       |
| `vento-pulso`   | tablero legacy en la cadena runtime y aliases de estado                                                                      | legado activo crítico           |
| `vento-numera`  | no se confirma legado activo específico en este corte                                                                        | sin cierre de integridad        |
| `Vento-Group`   | no se confirma legado activo específico en este corte                                                                        | sin cierre de integridad        |
| `vento-anima`   | no se confirma legado activo específico en este corte                                                                        | sin cierre de integridad        |
| `vento-pass`    | lectura de `logo_url` como fallback activo                                                                                   | compatibilidad activa           |
| `vento-talento` | no se confirma legado activo específico; producto futuro                                                                     | fuera de producción             |
| `vento-vital`   | proyecto separado                                                                                                            | fuera de Vento OS               |

“Sin legado activo específico confirmado” no equivale a certificación de ausencia.

---

#### 16. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                         | Clasificación                  | Destino                                                                                    |
| ---------------- | ------------------------------------------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------------------------------------ |
| `H-CODE-013-001` | el tablero actual de órdenes PULSO importa y renderiza `orders-board-legacy`                     | dependencia runtime legacy     | `PULSO-AUTH-002`, `PULSO-UX-001`, `007`, `013`, `019`, `CODE-AUD-014`, `015`, `019`, `020` |
| `H-CODE-013-002` | la funcionalidad del tablero queda distribuida entre live, wrapper actual y base legacy          | transición sin consolidar      | `SHELL-AUD-001`, `SHELL-PKG-004`, `005`, `CODE-AUD-014`                                    |
| `H-CODE-013-003` | PULSO acepta `in_transit` y `on_the_way` para el mismo estado visible                            | alias activo                   | `SHELL-CON-010`, `SUPA-TRANS-*`, `CODE-AUD-014`, `019`, `020`                              |
| `H-CODE-013-004` | scripts históricos apuntan al tablero legacy, pero no se prueba ejecución actual                 | posible artefacto huérfano     | `CODE-AUD-015`                                                                             |
| `H-CODE-013-005` | NEXO cambia a una consulta antigua cuando falla la consulta con `audience` y `remission_enabled` | fallback legacy activo         | `SUPA-AUD-016` a `019`, `SUPA-TRANS-003`, `005` a `007`, `012`, `013`                      |
| `H-CODE-013-006` | NEXO deriva áreas de remisión desde nombres de rol y listas hardcodeadas                         | fuente de verdad legacy        | `PROC-ACTOR-002`, `010`, `NEXO-AUTH-029`, `CODE-AUD-014`, `017`, `019`, `020`              |
| `H-CODE-013-007` | NEXO trata `received` y `closed` como equivalentes en superficies operativas                     | alias de estados               | `PROC-CAT-009` a `014`, `SHELL-CON-010`, `SUPA-TRANS-*`                                    |
| `H-CODE-013-008` | productos sin perfil reciben supuestos operativos predeterminados                                | compatibilidad de datos legacy | `CAP-SCOPE-004`, `006`, `SUPA-TRANS-005`, `007`, `012`, `CODE-AUD-019`, `020`              |
| `H-CODE-013-009` | productos sin SKU continúan operables mediante tratamiento legacy                                | compatibilidad de datos        | `CAP-SCOPE-004`, `DATA-NORM-AUD-004`, `SUPA-TRANS-005`, `007`, `012`                       |
| `H-CODE-013-010` | la clase de una sede puede inferirse desde su nombre cuando faltan datos canónicos               | fallback semántico legacy      | `CAP-SCOPE-001`, `SUPA-AUD-019`, `SUPA-TRANS-005`, `007`, `012`                            |
| `H-CODE-013-011` | VISO continúa escribiendo `logo_url` junto a card/header y PASS todavía lo consume               | columna legacy activa          | `VISO-UX-017`, `018`, `PASS-UX-001`, `SUPA-AUD-018`, `019`, `SUPA-TRANS-*`                 |
| `H-CODE-013-012` | el endpoint de logos conserva `kind=legacy`                                                      | entrada legacy activa          | mismo destino de `H-CODE-013-011`                                                          |
| `H-CODE-013-013` | role override permanece duplicado entre aplicaciones                                             | puente distribuido             | `SHELL-AUD-003`, `005`, `SHELL-PKG-004`, `005`, `CODE-AUD-014`, `017`                      |
| `H-CODE-013-014` | migraciones históricas con nombre legacy no son runtime                                          | falso positivo                 | cerrado                                                                                    |
| `H-CODE-013-015` | no se confirma legado activo específico en ANIMA, NUMERA, TALENTO o Vento Group                  | límite de evidencia            | continuar `CODE-AUD-014` a `020`                                                           |

Todos los hallazgos quedan cerrados o vinculados a tareas existentes.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 17. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 17.1. Requisitos reutilizados

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-PASS-004`;
- `TREQ-NEXO-002`;
- `TREQ-NEXO-006`.

No se cambia su estado.

##### 17.2. Requisitos nuevos

###### `TREQ-PULSO-002`

El tablero operativo de órdenes deberá migrar desde `orders-board-legacy` sin perder paridad comprobada de pedidos, filtros, transiciones, despacho, conversación, historial, facturación, regalos, eventos y actualización en tiempo real; después del retiro no podrá existir una importación runtime hacia la implementación legacy.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-NEXO-007`

Todo fallback legacy de configuración de remisiones deberá distinguir errores de esquema de errores de permisos, red o consulta, registrar cuándo se activa y demostrar que no amplía ni reduce silenciosamente productos, audiencia, áreas, alcance o estados antes de su retiro.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-NEXO-008`

Ningún producto podrá participar en una operación de inventario aplicando silenciosamente semántica predeterminada por ausencia de SKU o perfil canónico; toda excepción transitoria deberá ser identificable, auditable, regularizable y protegida por pruebas de paridad.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-PASS-005`

La selección de logos de cada experiencia PASS deberá utilizar `card_logo_url` y `header_logo_url` como contrato canónico; `logo_url` solo podrá funcionar como fallback temporal identificado, y su backfill y retiro deberán preservar paridad visual antes de impedir nuevas escrituras legacy.

**Estado inicial propuesto:** `IDENTIFICADO`.

###### `TREQ-SUPABASE-001`

Todo wrapper, alias, columna, vista o fallback legacy todavía activo deberá tener propietario, consumidores, condición de activación, evidencia de uso, prueba de paridad, estrategia de rollback y puerta explícita de retiro antes de modificar o eliminar el contrato heredado.

**Estado inicial propuesto:** `IDENTIFICADO`.

Las filas canónicas completas deberán agregarse únicamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

después de la aprobación de `CODE-AUD-013`.

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 18. Decisiones propuestas

1. El nombre `legacy` no bastará para clasificar un artefacto.
2. Se exigirá evidencia de consumo o ejecución actual.
3. `orders-board-legacy` se declara legado runtime activo.
4. Su retiro exigirá matriz de paridad funcional.
5. Los scripts históricos de parche pasan a `CODE-AUD-015`.
6. `in_transit` y `on_the_way` se declaran aliases activos pendientes de normalización.
7. `received` y `closed` deberán diferenciarse o consolidarse mediante decisión de proceso.
8. El fallback de columnas de NEXO se declara compatibilidad activa.
9. Un error genérico no deberá activar silenciosamente un contrato antiguo.
10. Las reglas de área por nombre de rol no serán fuente canónica definitiva.
11. Los productos sin perfil no deberán recibir semántica operativa silenciosa en el estado objetivo.
12. Los productos sin SKU deberán regularizarse antes de retirar compatibilidad.
13. La inferencia de sede por nombre se declara fallback legacy.
14. `logo_url` se declara contrato heredado todavía activo.
15. `card_logo_url` y `header_logo_url` serán el contrato objetivo sujeto a validación.
16. El endpoint no deberá seguir creando objetos `legacy` después de cerrar el backfill.
17. Role override se conserva como simulación, pero deberá consolidarse.
18. Las migraciones históricas no se eliminarán por contener la palabra legacy.
19. Se derivan cinco requisitos de prueba.
20. No se crea ninguna tarea nueva.
21. No se modifica código.
22. No se modifica Supabase.
23. `CODE-AUD-014` será la única continuidad inmediata.

---

#### 19. Límites de certeza

Esta tarea no confirma:

- que todos los registros existentes utilicen columnas legacy;
- que todos los aliases aparezcan en producción;
- que `logo_url` pueda eliminarse inmediatamente;
- que `on_the_way` o `in_transit` sea el estado definitivo;
- que `closed` y `received` deban fusionarse;
- que todos los productos sin perfil sean operativamente incorrectos;
- que todo producto deba tener SKU visible;
- que los scripts históricos de PULSO no sean ejecutados manualmente;
- que ninguna otra rama contenga consumidores legacy;
- que la inferencia por nombre se active actualmente para todas las sedes;
- que role override deba retirarse;
- que todas las migraciones legacy hayan cumplido su objetivo;
- que no exista legado activo adicional en repositorios sin hallazgo específico.

E3 deberá verificar datos y objetos reales antes de cualquier retiro.

---

#### 20. Criterios de aceptación

`CODE-AUD-013` podrá aprobarse cuando:

- legacy activo, dormido e histórico estén diferenciados;
- PULSO tenga documentada la dependencia runtime hacia su tablero legacy;
- se documenten los aliases de estado;
- los scripts sin activación probada no se clasifiquen como runtime;
- el fallback de columnas NEXO quede registrado;
- las reglas por rol y nombre de sede tengan destino;
- los productos sin perfil y sin SKU tengan tratamiento explícito;
- el contrato heredado de logos quede documentado;
- role override quede clasificado como puente distribuido;
- las migraciones históricas queden excluidas como falsos positivos;
- cada hallazgo tenga destino exacto;
- no se cree ninguna tarea nueva;
- los cinco requisitos nuevos estén identificados;
- las filas completas no se dupliquen dentro de la tarea;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-014` permanezca como continuidad inmediata.

---

#### 21. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
artefacto heredado
→ consumidor actual
→ motivo de compatibilidad
→ riesgo de permanencia
→ prueba de paridad
→ adaptación de consumidores
→ retiro controlado
```

La continuidad será:

```text
CODE-AUD-014
— Detectar código duplicado y fuentes de verdad competidoras
```


### ✅ CODE-AUD-014 — Detectar código duplicado y fuentes de verdad competidoras

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de duplicación ejecutable, contratos replicados y fuentes de verdad paralelas  
**Dependencia anterior:** `CODE-AUD-013`  
**Continuidad reservada:** `CODE-AUD-015`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica dos familias de riesgo:

1. **código duplicado activo**, cuando una misma responsabilidad está implementada en varios repositorios o archivos y puede evolucionar de forma distinta;
2. **fuentes de verdad competidoras**, cuando un mismo hecho empresarial puede obtenerse, inferirse o modificarse desde más de una fuente sin un propietario, precedencia o reconciliación inequívocos.

Resultado general:

- la fundación de Vento OS continúa copiada dentro de varias aplicaciones;
- AppShell, contexto operativo, role override, permisos, navegación y contratos básicos presentan implementaciones locales;
- ya existe divergencia funcional entre copias del evaluador de role override;
- el catálogo visible de aplicaciones se encuentra hardcodeado en cada AppShell mientras la navegación se consulta dinámicamente desde Supabase;
- NEXO resuelve la habilitación de remisiones mediante varias capas de configuración y fallbacks distribuidos;
- NEXO compone la semántica operativa de un producto desde varias tablas y reglas locales;
- inventario mantiene un ledger de movimientos y tres proyecciones mutables que ciertas rutas actualizan de forma secuencial;
- PASS conserva simultáneamente experiencias estáticas de Vento Café y Saudo y la experiencia dinámica basada en `pass_satellites`;
- PASS puede resolver la sede por heurística sobre `sites` o mediante `pass_satellites.site_id`;
- las duplicaciones de compatibilidad ya detectadas en `CODE-AUD-013` se reutilizan y no se registran dos veces;
- no se crea ninguna tarea nueva del roadmap;
- se derivan siete requisitos de prueba;
- no se modifica código ni Supabase.

---

#### 2. Definiciones utilizadas

##### 2.1. Duplicación técnica

Dos o más implementaciones ejecutables de la misma responsabilidad.

Ejemplos:

- dos evaluadores de permisos;
- varios resolutores de contexto;
- AppShell copiado por repositorio;
- normalización de unidades repetida;
- listas de aplicaciones replicadas;
- lógica de stock escrita en varias rutas.

##### 2.2. Duplicación deliberada

Duplicación permitida temporalmente cuando:

- existe propietario;
- tiene alcance conocido;
- se conserva paridad;
- se prueba;
- tiene mecanismo de actualización;
- posee criterio de retiro.

##### 2.3. Fuente de verdad canónica

Única fuente autorizada para crear o modificar un hecho empresarial.

Puede existir más de una representación, pero las demás deberán ser:

- proyecciones;
- cachés;
- vistas;
- snapshots;
- índices;
- réplicas;
- adaptadores.

Cada representación derivada deberá declarar de qué fuente proviene y cómo se reconcilia.

##### 2.4. Fuente competidora

Fuente que puede decidir o modificar el mismo hecho sin una precedencia inequívoca.

Ejemplos:

- capacidad de una sede definida por tabla especializada y por `site_type`;
- permiso evaluado por helper canónico y por lista local de roles;
- unidad base tomada de perfil, política, presentación o columna del producto;
- stock calculado por ledger y también escrito directamente en varias tablas;
- sede cliente resuelta por relación explícita y por búsqueda de nombre.

##### 2.5. Proyección válida

Tabla o vista derivada que:

- no redefine la regla empresarial;
- se actualiza atómicamente;
- puede reconstruirse;
- se reconcilia;
- tiene semántica documentada;
- no puede divergir silenciosamente.

---

#### 3. Método aplicado

Para cada responsabilidad se contrastó:

```text
hecho empresarial
→ escritor o resolutor
→ fuentes consultadas
→ precedencia
→ consumidores
→ mecanismos de actualización
→ pruebas
→ reconciliación
```

Se buscó especialmente:

- el mismo archivo o helper en varios repositorios;
- estructuras TypeScript repetidas;
- constantes repetidas;
- decisiones locales de autorización;
- lecturas de tablas diferentes para el mismo hecho;
- fallbacks basados en nombres o tipos;
- escrituras paralelas;
- proyecciones actualizadas desde cliente o API;
- rutas antiguas y nuevas disponibles simultáneamente;
- contratos configurados en Supabase y replicados en código.

No se clasifica como duplicación problemática:

- una interfaz específica de aplicación;
- una copia generada automáticamente;
- un adaptador local pequeño;
- un tipo derivado de contrato versionado;
- una caché con fuente y TTL explícitos;
- una proyección reconstruible y reconciliada;
- una configuración por sede con jerarquía formalmente aprobada.

---

#### 4. Fundación compartida copiada entre aplicaciones

Se confirmaron archivos equivalentes dentro de aplicaciones como:

```text
src/components/vento/standard/vento-shell.tsx
src/components/vento/standard/vento-chrome.tsx
src/lib/auth/role-override.ts
src/lib/auth/operational-context.ts
src/lib/auth/operational-session.ts
src/lib/auth/permissions.ts
src/lib/supabase/server.ts
```

Las copias de `vento-shell.tsx` en NEXO, VISO y PULSO contienen la misma estructura base:

- tipos de sede;
- asignaciones del trabajador;
- contexto activo;
- dispositivo compartido;
- puertas operativas;
- catálogo de aplicaciones;
- navegación;
- bypass administrativo;
- resolución de jornada;
- permisos por navegación;
- renderizado de Chrome.

No son simples componentes visuales.

Cada copia participa en:

- autorización;
- visibilidad;
- contexto;
- disponibilidad de aplicaciones;
- bloqueo por jornada;
- navegación;
- dispositivos compartidos.

##### 4.1. Divergencias ya visibles

NEXO agrega responsabilidades que otras copias no tienen o no manejan igual:

- `checkOperationalPermission`;
- cookie local de sede;
- permisos operativos específicos de remisión;
- conjunto ampliado de iconos;
- lógica específica de aplicaciones y rutas.

PULSO y VISO conservan catálogos e iconos diferentes.

Estas diferencias pueden ser válidas como extensiones, pero actualmente el límite entre:

```text
núcleo compartido
```

y:

```text
extensión local
```

no está materializado mediante contrato o paquete.

##### 4.2. Riesgo

- una corrección de seguridad puede aplicarse solo en una aplicación;
- la misma sesión puede resolverse de forma distinta;
- los dispositivos compartidos pueden tener puertas diferentes;
- el app switcher puede divergir;
- los tipos copiados pueden dejar de representar la base;
- cada repositorio puede interpretar distinto un cambio de Supabase.

##### 4.3. Destino

- `SHELL-AUD-001` a `SHELL-AUD-010`;
- `SHELL-PKG-001` a `SHELL-PKG-008`;
- `SHELL-CON-001` a `SHELL-CON-016`;
- `CODE-AUD-016`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`.

No se ordena extraer todo a un único paquete.

`SHELL-AUD-010` deberá clasificar cada pieza como:

```text
compartir
generar
mantener local
```

---

#### 5. Evaluadores de role override ya divergentes

Se compararon las implementaciones de NEXO y FOGO.

##### 5.1. FOGO

FOGO carga desde `role_permissions`:

```text
scope_site_id
scope_area_id
scope_site_type
scope_area_kind
```

y evalúa esos campos directamente.

##### 5.2. NEXO

NEXO no selecciona `scope_site_id` ni `scope_area_id` dentro de esa carga.

En su lugar:

- asigna ambos como `null`;
- consulta todos los `employee_sites` activos;
- exige que el contexto de sede esté dentro de ese conjunto;
- contiene una excepción específica para conductor y tránsito.

Por tanto, dos aplicaciones que afirman ejecutar:

```text
checkPermissionWithRoleOverride
```

no aplican exactamente el mismo contrato de alcance.

##### 5.3. Riesgo

- una simulación puede permitir en una app y denegar en otra;
- un scope por sede concreta puede ignorarse;
- la cobertura del trabajador puede reemplazar el scope del permiso;
- una excepción funcional puede quedar incrustada en el helper general;
- una prueba de una copia no protege a las demás.

##### 5.4. Clasificación

**Duplicación crítica con divergencia funcional confirmada.**

Destinos:

- `SHELL-AUD-003`;
- `SHELL-AUD-004`;
- `SHELL-AUD-005`;
- `SHELL-AUD-009`;
- `SHELL-CON-003`;
- `SHELL-CON-006`;
- `SHELL-CON-007`;
- `AUTH-CTX-025` a `AUTH-CTX-030`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-AUTH-001`;
- mantiene `TREQ-AUTH-002`;
- crea `TREQ-AUTH-004`.

---

#### 6. Catálogo de aplicaciones y navegación distribuido

Cada AppShell conserva un arreglo local:

```text
APP_SWITCHER_ITEMS
```

con:

- identificador;
- nombre;
- descripción;
- URL;
- logo;
- color;
- estado;
- grupo.

Al mismo tiempo, la navegación interna se obtiene desde:

```text
app_navigation_items
```

y el acceso depende de permisos y aplicaciones permitidas.

##### 6.1. Fuentes actuales

```text
APP_SWITCHER_ITEMS local
→ qué aplicación existe, URL, marca y estado

app_navigation_items
→ qué navegación tiene la aplicación

shared_operational_devices.allowed_app_codes
→ qué aplicación puede abrir un dispositivo

apps / app_permissions
→ qué aplicación y permisos existen en autorización
```

Estas fuentes representan aspectos diferentes, pero el código no contiene un contrato central que garantice:

- que todos los IDs existan;
- que las URLs coincidan;
- que un estado `soon` no contradiga el catálogo;
- que un dispositivo no reciba una aplicación ausente del switcher;
- que todos los repositorios tengan la misma lista;
- que la eliminación de una aplicación se propague.

##### 6.2. Riesgo

- AURA puede aparecer diferente entre aplicaciones;
- un dominio puede cambiar sin actualizar todos los repositorios;
- una app activa puede seguir marcada `soon`;
- una aplicación permitida puede no tener URL;
- el mismo color, logo o descripción puede divergir;
- el switcher puede presentar una capacidad inexistente.

##### 6.3. Destino

- `SHELL-AUD-006`;
- `SHELL-AUD-009`;
- `SHELL-AUD-010`;
- `SHELL-CON-002`;
- `SHELL-CON-011`;
- `SHELL-PKG-004`;
- `SHELL-PKG-005`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-SHELL-001`;
- crea `TREQ-SHELL-003`.

---

#### 7. NEXO — varias fuentes resuelven si una sede puede operar remisiones

Se localizaron estas fuentes activas:

```text
area_kinds.use_for_remission
site_purpose_settings
site_area_purpose_rules
site_operational_capabilities
sites.site_type
areas.kind
contexto operativo activo
shared_operational_devices.site_id / area_id
product_site_settings.remission_enabled
product_site_settings.area_kinds
```

##### 7.1. Jerarquía parcial existente

La configuración administrativa permite:

```text
global
→ area_kinds.use_for_remission

por sede
→ site_purpose_settings.mode

excepciones por sede y área
→ site_area_purpose_rules
```

El resolutor de áreas intenta primero las reglas específicas y después combina áreas activas con el catálogo global.

##### 7.2. Segunda decisión para la sede

La creación de remisiones consulta:

```text
site_operational_capabilities.can_request_remissions
```

Cuando no existe fila, vuelve a:

```text
sites.site_type === satellite
```

Por tanto, la capacidad “esta sede solicita remisiones” puede depender de:

1. una capacidad explícita; o
2. una clasificación general de sede.

##### 7.3. Decisiones adicionales

Después se filtran:

- productos habilitados;
- áreas del producto;
- contexto del trabajador;
- contexto del dispositivo;
- permiso.

Estas condiciones son legítimas, pero están distribuidas entre páginas, helpers y acciones.

##### 7.4. Riesgo

- dos superficies pueden usar una parte distinta de la jerarquía;
- la ausencia de una fila puede interpretarse como herencia o como denegación;
- `site_type` puede reactivar una capacidad no configurada;
- el catálogo global puede competir con una excepción vacía;
- un producto puede aparecer en catálogo y ser rechazado al guardar;
- un dispositivo y un trabajador pueden obtener resultados diferentes.

##### 7.5. Clasificación

**Fuentes de decisión distribuidas con precedencia parcialmente codificada.**

Destinos:

- `PROC-CAT-003` a `PROC-CAT-018`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `NEXO-UX-009` a `NEXO-UX-013`;
- `NEXO-AUTH-029`;
- `SHELL-CON-009`;
- `SHELL-CON-012`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `CODE-AUD-017`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-NEXO-009`.

No se elimina la configuración por capas.

Se exige convertirla en una jerarquía canónica única y reutilizable.

---

#### 8. NEXO — semántica operativa de producto compuesta desde varias fuentes

En remisiones se utilizan:

```text
products.unit
products.stock_unit_code
products.product_type
product_inventory_profiles.inventory_kind
product_inventory_profiles.measurement_mode
product_inventory_profiles.default_tolerance_percent
product_inventory_profiles.requires_actual_dispatch_qty
product_inventory_profiles.requires_count_alongside_weight
product_uom_profiles
product_request_policies
product_site_settings
```

##### 8.1. Precedencias actuales

El flujo puede decidir la cantidad base mediante:

1. una política de solicitud;
2. una presentación física;
3. la unidad de stock;
4. la unidad legacy del producto;
5. el fallback `"un"`.

La modalidad de medición puede provenir de:

1. `product_inventory_profiles.measurement_mode`;
2. una normalización local;
3. `fixed_presentation` cuando falta perfil.

La disponibilidad depende adicionalmente de `product_site_settings`.

##### 8.2. Lógica repetida

La interpretación de unidades, presentaciones y perfiles aparece en:

- remisiones;
- conteo inicial;
- retiro desde kiosco;
- tablero de LOC;
- catálogo;
- configuración de remisiones;
- presentación de productos.

Existen helpers comunes, pero también normalizadores, tipos y fallbacks locales.

##### 8.3. Riesgo

- una pantalla convierte distinto que otra;
- la unidad mostrada puede no ser la unidad persistida;
- una política puede contradecir un perfil;
- una presentación inactiva puede seguir siendo aceptada por otro flujo;
- un producto sin perfil recibe semántica de código;
- un cambio de unidad puede no propagarse a todas las superficies;
- la configuración por sede puede alterar disponibilidad sin alterar conversión.

##### 8.4. Clasificación

No se declara que las tablas sean duplicadas por diseño.

El hallazgo es:

```text
la precedencia y las invariantes viven parcialmente en código consumidor
```

en lugar de existir como contrato único.

Destinos:

- `CAP-SCOPE-004`;
- `CAP-SCOPE-006`;
- `SHELL-AUD-009`;
- `SHELL-CON-001`;
- `SHELL-CON-009`;
- `SHELL-CON-012`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `SUPA-ARC-*`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-008`;
- crea `TREQ-NEXO-010`.

---

#### 9. Inventario — ledger y proyecciones mutables actualizados desde una misma ruta

La ruta de ajustes utiliza:

```text
inventory_movements
inventory_stock_by_site
inventory_stock_by_location
inventory_stock_by_position
```

##### 9.1. Comportamiento confirmado

La ruta:

1. lee las tres proyecciones;
2. calcula diferencias;
3. inserta un movimiento;
4. actualiza stock por sede;
5. actualiza stock por LOC;
6. actualiza stock por posición;
7. puede ejecutar RPC de reconciliación;
8. puede actualizar costo del producto;
9. puede insertar un evento de costo.

Estas operaciones se ejecutan mediante llamadas sucesivas desde la ruta.

##### 9.2. Competencia potencial de verdad

Si `inventory_movements` es el ledger canónico, las tablas de stock deberían ser proyecciones derivadas.

Sin embargo, las proyecciones son modificadas directamente y luego utilizadas para decidir cantidades futuras.

Un fallo después de insertar el movimiento puede dejar:

```text
movimiento creado
+
una o más proyecciones sin actualizar
```

Un fallo posterior puede dejar costo y stock en estados distintos.

##### 9.3. Riesgo

- stock por sede distinto de la suma de LOC;
- stock de LOC distinto de posiciones;
- movimiento sin proyección;
- proyección sin evento equivalente;
- reintento que duplica el movimiento;
- costo actualizado sin evento o viceversa;
- correcciones especiales acumuladas como lógica local.

##### 9.4. Clasificación

**Fuentes mutables múltiples sin atomicidad demostrada en esta ruta.**

Destinos:

- `SUPA-AUD-004` a `SUPA-AUD-008`;
- `SUPA-AUD-018`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `SUPA-ARC-003`;
- `SUPA-ARC-005`;
- `SUPA-ARC-006`;
- `SUPA-ARC-012`;
- `SUPA-ARC-013`;
- `SUPA-ARC-014`;
- `SUPA-TRANS-*`;
- `CODE-AUD-018`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-SUPABASE-002`.

No se decide todavía si el ledger o una tabla de stock será la fuente final.

E3 deberá aprobarlo explícitamente.

---

#### 10. PASS — experiencias estáticas y dinámicas activas en paralelo

`App.js` registra simultáneamente:

```text
VentoCafe
Saudo
SatelliteExperience
SatellitePass
```

Las rutas de Vento Café y Saudo usan componentes específicos.

La experiencia nueva utiliza:

```text
pass_satellites
→ site_id
→ configuración de marca
→ experiencia dinámica
```

##### 10.1. Resolución antigua de sede

La utilidad `site.ts` busca la sede mediante una combinación de:

```text
sites.type
sites.name
sites.code
BUSINESS_SEARCH_TERMS
```

y toma el primer resultado activo.

##### 10.2. Resolución dinámica

La experiencia dinámica utiliza:

```text
pass_satellites.site_id
```

y puede combinar:

```text
sites.address / latitude / longitude
```

con:

```text
pass_satellites.address_override
pass_satellites.latitude_override
pass_satellites.longitude_override
```

##### 10.3. Doble implementación

Para una misma marca pueden coexistir:

```text
componente específico
+
búsqueda heurística de sede
```

y:

```text
componente dinámico
+
relación explícita pass_satellites.site_id
```

Esto no es únicamente una diferencia visual.

Afecta:

- sede de recompensas;
- historial;
- marca;
- dirección;
- coordenadas;
- enlaces;
- navegación;
- pedidos;
- filtros;
- caché.

##### 10.4. Riesgo

- una ruta usa un `site_id` y otra usa otro;
- una marca corregida en VISO no cambia el componente estático;
- la experiencia dinámica y la específica muestran datos distintos;
- una nueva sede queda fuera de la heurística;
- una ruta vieja permanece accesible después de migrar;
- pruebas sobre una experiencia no protegen la otra.

##### 10.5. Destino

- `PASS-UX-001 — Inventariar pantallas actuales de cliente`;
- `PASS-UX-002 — Diseñar navegación principal`;
- `PASS-UX-003 — Diseñar inicio`;
- `PASS-UX-004 — Diseñar identificación por QR`;
- `PASS-UX-006 — Diseñar historial`;
- `PASS-UX-010 — Simplificar interfaz móvil`;
- `PASS-UX-013 — Ejecutar pruebas con clientes reales`;
- `SHELL-AUD-001`;
- `SHELL-AUD-009`;
- `SUPA-AUD-019`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `CODE-AUD-015`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PASS-004`;
- mantiene `TREQ-PASS-005`;
- crea `TREQ-PASS-006`.

---

#### 11. Duplicaciones ya cubiertas por tareas anteriores

##### 11.1. PULSO `orders-board-legacy`

Permanece cubierto por:

```text
CODE-AUD-013
TREQ-PULSO-002
```

`CODE-AUD-014` añade que la responsabilidad está distribuida entre:

- live bridge;
- wrapper actual;
- implementación legacy;
- bridges adicionales.

No se crea otro requisito.

##### 11.2. Aliases de estados

Los estados equivalentes de PULSO y NEXO permanecen cubiertos por:

- `TREQ-SUPABASE-001`;
- transición de Supabase;
- centralización de estados.

##### 11.3. `logo_url`

La columna legacy y sus nuevos campos permanecen cubiertos por:

```text
TREQ-PASS-005
```

`CODE-AUD-014` amplía el análisis hacia la coexistencia de experiencia estática y dinámica.

##### 11.4. Role override

La compatibilidad legacy permanece cubierta por:

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-SUPABASE-001`.

Se crea `TREQ-AUTH-004` únicamente para proteger la paridad entre evaluadores duplicados.

---

#### 12. Falsos positivos excluidos

##### 12.1. Componentes visuales parecidos

No se clasifican como duplicación crítica cuando representan:

- una composición propia;
- estilo de aplicación;
- pantalla de dominio;
- layout específico.

##### 12.2. Configuración global con override por sede

No es fuente competidora si existe una jerarquía inequívoca:

```text
global
→ override por sede
→ override por área
```

El hallazgo aparece cuando esa jerarquía se implementa de manera distinta en cada consumidor o incluye fallbacks no declarados.

##### 12.3. Cachés

AsyncStorage, caché de memoria y snapshots no son fuentes canónicas si:

- tienen TTL;
- pueden invalidarse;
- no escriben el hecho empresarial;
- la fuente remota prevalece.

##### 12.4. Vistas y proyecciones

No son fuentes competidoras por existir.

Se convierten en riesgo cuando:

- son directamente mutables;
- no pueden reconstruirse;
- no se actualizan atómicamente;
- no existe conciliación.

##### 12.5. Datos comerciales y operativos separados

`pass_satellites` puede ser propietario de la experiencia comercial y `sites` de la sede operativa.

La separación es válida si el contrato define:

- campos propios;
- campos heredados;
- overrides permitidos;
- precedencia;
- sincronización;
- consumidores.

##### 12.6. Tipos locales

Un tipo local pequeño no exige paquete compartido si no representa un contrato transversal.

---

#### 13. Matriz por repositorio

| Repositorio     | Duplicación o competencia confirmada                                                          | Clasificación           |
| --------------- | --------------------------------------------------------------------------------------------- | ----------------------- |
| `vento-shell`   | contiene la base y los contratos candidatos, pero todavía no se distribuyen como fuente única | fundación pendiente     |
| `vento-viso`    | AppShell y auth locales; administra `pass_satellites`; catálogo de apps local                 | duplicación compartida  |
| `vento-nexo`    | AppShell/auth locales; múltiples resolutores de capacidad, producto y stock                   | crítica                 |
| `vento-fogo`    | AppShell/auth locales con evaluador de scope distinto a NEXO                                  | crítica de autorización |
| `vento-origo`   | AppShell/auth locales; requiere comparación completa en SHELL-AUD                             | duplicación compartida  |
| `vento-pulso`   | AppShell local y responsabilidad de órdenes distribuida                                       | duplicación activa      |
| `vento-numera`  | AppShell y contratos locales pendientes de comparación                                        | duplicación compartida  |
| `Vento-Group`   | no se confirma fuente competidora nueva en este corte                                         | sin hallazgo nuevo      |
| `vento-anima`   | implementación móvil propia; contratos de contexto deberán compararse                         | pendiente               |
| `vento-pass`    | experiencias estáticas y dinámicas, dos resoluciones de sede y múltiples capas de marca       | competencia activa      |
| `vento-talento` | producto futuro; no se clasifica como riesgo productivo                                       | diferido                |
| `vento-vital`   | proyecto separado                                                                             | fuera de Vento OS       |

---

#### 14. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                | Destino                                                                 |
| ---------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `H-CODE-014-001` | AppShell y fundación operativa están copiados entre aplicaciones                        | `SHELL-AUD-001` a `010`, `SHELL-PKG-*`, `SHELL-CON-*`, `TREQ-SHELL-002` |
| `H-CODE-014-002` | las copias ya contienen extensiones y comportamientos diferentes                        | mismo destino de `H-CODE-014-001`                                       |
| `H-CODE-014-003` | NEXO y FOGO evalúan role override con semántica territorial distinta                    | `SHELL-AUD-003` a `005`, `CODE-AUD-017`, `TREQ-AUTH-004`                |
| `H-CODE-014-004` | cada AppShell conserva un catálogo local de aplicaciones                                | `SHELL-AUD-006`, `SHELL-CON-002`, `TREQ-SHELL-003`                      |
| `H-CODE-014-005` | el catálogo local debe coexistir con navegación, permisos y apps permitidas en Supabase | `SHELL-AUD-006`, `009`, `010`, `CODE-AUD-019`, `020`                    |
| `H-CODE-014-006` | la capacidad de remisiones de una sede se resuelve desde varias tablas y fallbacks      | `PROC-CAT-*`, `NEXO-UX-009` a `013`, `SUPA-AUD-019`, `TREQ-NEXO-009`    |
| `H-CODE-014-007` | la semántica de producto se compone desde varias tablas y precedencias locales          | `CAP-SCOPE-004`, `006`, `SUPA-AUD-019`, `TREQ-NEXO-010`                 |
| `H-CODE-014-008` | la interpretación de unidades y perfiles se repite entre varios consumidores NEXO       | `SHELL-AUD-009`, `SHELL-CON-001`, `012`, `CODE-AUD-019`, `020`          |
| `H-CODE-014-009` | ajustes escribe ledger y tres proyecciones mediante pasos sucesivos                     | `SUPA-AUD-*`, `SUPA-ARC-*`, `CODE-AUD-018`, `TREQ-SUPABASE-002`         |
| `H-CODE-014-010` | PASS registra rutas específicas y dinámicas para experiencias equivalentes              | `PASS-UX-*`, `CODE-AUD-015`, `019`, `020`, `TREQ-PASS-006`              |
| `H-CODE-014-011` | PASS puede resolver sede mediante heurística o relación explícita                       | `PASS-UX-001`, `006`, `SUPA-AUD-019`, `TREQ-PASS-006`                   |
| `H-CODE-014-012` | datos operativos de `sites` y overrides comerciales requieren contrato de propiedad     | `SUPA-AUD-022`, `023`, `PASS-UX-001`, `TREQ-PASS-006`                   |
| `H-CODE-014-013` | tablero legacy, aliases y logos legacy ya están cubiertos por requisitos anteriores     | reutilización                                                           | mantener `TREQ-PULSO-002`, `TREQ-PASS-005`, `TREQ-SUPABASE-001` |
| `H-CODE-014-014` | no toda configuración por capas constituye competencia                                  | regla de clasificación                                                  | cerrado                                                         |
| `H-CODE-014-015` | no se confirma una fuente competidora nueva en Vento Group, TALENTO o VITAL             | límite de evidencia                                                     | continuar auditoría                                             |

Todos los hallazgos quedan cerrados o vinculados a tareas existentes.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 15. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 15.1. Requisitos reutilizados

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-SHELL-001`;
- `TREQ-NEXO-006`;
- `TREQ-NEXO-007`;
- `TREQ-NEXO-008`;
- `TREQ-PASS-004`;
- `TREQ-PASS-005`;
- `TREQ-PULSO-002`;
- `TREQ-SUPABASE-001`.

No se cambia su estado.

##### 15.2. Requisitos nuevos

- `TREQ-SHELL-002` — paridad y distribución controlada de la fundación compartida;
- `TREQ-SHELL-003` — catálogo único de aplicaciones, destinos y estado;
- `TREQ-AUTH-004` — equivalencia de decisiones entre evaluadores de autorización;
- `TREQ-NEXO-009` — jerarquía única de capacidad de remisiones por sede y área;
- `TREQ-NEXO-010` — precedencia única de semántica operativa de producto;
- `TREQ-PASS-006` — convergencia entre experiencia estática, experiencia dinámica y sede;
- `TREQ-SUPABASE-002` — atomicidad y reconciliación entre ledger y proyecciones de inventario.

Las filas canónicas completas deberán agregarse únicamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 16. Decisiones propuestas

1. No toda duplicación será eliminada.
2. Cada pieza se clasificará como compartir, generar o mantener local.
3. La fundación común no seguirá dependiendo de copias manuales sin pruebas de paridad.
4. Las extensiones locales deberán separarse del núcleo.
5. Los evaluadores de autorización deberán producir la misma decisión para el mismo contexto.
6. Las excepciones de negocio no deberán incrustarse en una copia general sin contrato.
7. El catálogo de aplicaciones deberá tener una fuente canónica.
8. La navegación podrá seguir siendo dinámica.
9. La jerarquía de capacidad de remisiones deberá centralizarse en un resolutor único.
10. `site_type` no deberá competir indefinidamente con capacidades explícitas.
11. La semántica de producto deberá tener precedencia aprobada.
12. Los consumidores no deberán inventar fallbacks incompatibles.
13. E3 deberá decidir la fuente canónica de stock.
14. Ledger y proyecciones deberán actualizarse atómicamente o reconciliarse.
15. PASS deberá decidir y ejecutar la convergencia entre rutas específicas y dinámicas.
16. `sites` y `pass_satellites` podrán coexistir con propiedad de campos explícita.
17. Se derivan siete requisitos de prueba.
18. No se crea ninguna tarea nueva.
19. No se modifica código.
20. No se modifica Supabase.
21. `CODE-AUD-015` será la única continuidad inmediata.

---

#### 17. Límites de certeza

Esta tarea no confirma:

- que cada copia de AppShell tenga exactamente el mismo número de líneas;
- que toda diferencia entre aplicaciones sea incorrecta;
- que el mecanismo final de distribución deba ser un paquete npm;
- que `apps` contenga actualmente toda la metadata del switcher;
- que las proyecciones de stock no tengan triggers adicionales;
- que todos los ajustes terminen en divergencia;
- que `inventory_movements` deba ser obligatoriamente la fuente definitiva;
- que todas las rutas estáticas de PASS sean alcanzadas desde Home;
- que `pass_satellites` y `sites` deban fusionarse;
- que toda regla por sede deba vivir en una sola tabla;
- que todas las duplicaciones existentes hayan sido detectadas;
- que ausencia de hallazgo en un repositorio equivalga a integridad.

E3 deberá revisar objetos, triggers, funciones y datos reales antes de aprobar una fuente de verdad.

---

#### 18. Criterios de aceptación

`CODE-AUD-014` podrá aprobarse cuando:

- duplicación técnica, deliberada y proyección válida estén diferenciadas;
- las copias de AppShell estén inventariadas;
- la divergencia del role override esté documentada;
- el catálogo de aplicaciones tenga destino;
- la jerarquía de remisiones tenga destino;
- las fuentes de semántica de producto tengan destino;
- ledger y proyecciones de stock estén contrastados;
- PASS estático y dinámico estén contrastados;
- cada hallazgo tenga tarea responsable;
- no se cree ninguna tarea nueva;
- los siete requisitos nuevos estén identificados;
- las filas completas se entreguen fuera de esta tarea;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-015` permanezca como continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
hecho empresarial
→ implementaciones y fuentes actuales
→ propietario
→ fuente canónica
→ proyecciones y adaptadores
→ pruebas de paridad y reconciliación
→ retiro de duplicación accidental
```

La continuidad será:

```text
CODE-AUD-015
— Detectar rutas, componentes, funciones y tablas sin consumidores
```


### ✅ CODE-AUD-015 — Detectar rutas, componentes, funciones y tablas sin consumidores

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de alcanzabilidad, referencias, consumidores y artefactos huérfanos  
**Dependencia anterior:** `CODE-AUD-014`  
**Continuidad reservada:** `CODE-AUD-016`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados durante esta tarea  

---

#### 1. Resultado de esta tarea

Esta tarea identifica artefactos que existen en los repositorios o en el esquema, pero para los cuales no se localizó una cadena funcional completa y actualmente alcanzable.

Se revisaron:

- rutas y páginas;
- componentes;
- hooks y helpers;
- exports;
- endpoints;
- server actions;
- scripts;
- tablas;
- vistas;
- RPC;
- funciones;
- navegación;
- registros de pantalla;
- imports estáticos;
- manifests de build históricos disponibles;
- referencias textuales;
- comandos de `package.json`;
- consumidores actuales e históricos.

Resultado general:

- NEXO conserva una superficie LPN fragmentada: componente de creación sin montaje localizado, ruta que redirige, endpoint de lectura sin caller interno localizado y tablas sin ciclo completo;
- PASS conserva una cadena alternativa de seguimiento de pedidos que no está registrada en la navegación activa;
- PASS conserva al menos un export auxiliar sin consumidor localizado;
- PULSO conserva scripts manuales de parche que no forman parte de sus comandos actuales;
- el repositorio archivado `vento-platform` contiene un prototipo POS histórico, pero la ruta POS alcanzable del último build inspeccionado solo consumía identificación de cliente, puntos y canjes;
- las acciones históricas de creación de orden y pago existen en código fuente, pero no aparecen conectadas a la ruta POS compilada inspeccionada;
- algunos objetos `pos.*` sí tienen consumidores actuales en el salón de `vento-pulso`;
- otros objetos solo tienen consumidores históricos dormidos, referencias de tipos o ninguna referencia ejecutable confirmada;
- el prototipo histórico no se adopta como arquitectura base del nuevo POS;
- se crearán tareas explícitas para auditar el prototipo y diseñar un POS integral nuevo;
- no se autoriza eliminar ningún artefacto durante E1;
- se reutilizan requisitos existentes;
- se derivan cuatro requisitos de prueba nuevos;
- no se modifica código ni Supabase.

---

#### 2. Regla de clasificación

Un artefacto se clasifica como **sin consumidor confirmado** cuando no se localiza una cadena demostrable como:

```text
entrada alcanzable
→ consumidor
→ invocación
→ resultado
```

Para código:

```text
ruta, import, registro, navegación, script o build
→ artefacto
```

Para datos:

```text
aplicación, RPC, trigger, vista, función, integración o proceso externo
→ objeto
```

Para scripts:

```text
package.json, workflow, hook, documentación operativa vigente o ejecución controlada
→ script
```

Estados de clasificación permitidos:

```text
CONSUMIDO_ACTUAL
CONSUMIDO_HISTORICO_DORMIDO
SIN_CONSUMIDOR_CONFIRMADO
CONSUMO_PARCIAL
CONSUMO_TRANSITIVO_HUERFANO
RESERVA_APROBADA
CONSUMIDOR_EXTERNO_PENDIENTE
NO_DETERMINADO
```

---

#### 3. “Sin consumidor” no significa “seguro para eliminar”

No se deberá eliminar un artefacto únicamente porque una búsqueda textual no encuentre referencias.

Antes de retirar deberá comprobarse:

1. imports estáticos;
2. imports dinámicos;
3. resolución por convención;
4. rutas de framework;
5. navegación;
6. registros en base de datos;
7. llamadas mediante URL;
8. RPC por nombre construido;
9. triggers;
10. funciones SQL;
11. vistas;
12. Edge Functions;
13. webhooks;
14. workflows;
15. scripts manuales aprobados;
16. clientes móviles;
17. consumidores externos;
18. ambientes y ramas;
19. datos históricos;
20. rollback.

También deberá distinguirse:

```text
existe en el código fuente
≠
está enlazado a una entrada
≠
fue incluido en el build
≠
es utilizado actualmente
```

---

#### 4. NEXO — fragmentos LPN sin recorrido consumidor completo

Artefactos revisados:

```text
src/features/inventory/lpns/lpn-create-form.tsx
src/app/inventory/lpns/page.tsx
src/app/api/inventory/lpns/route.ts
inventory_lpns
inventory_lpn_items
```

##### 4.1. Componente de creación

`LpnCreateForm` contiene:

- selector de sede;
- preview del código;
- `site_id`;
- acción de creación;
- botón “Crear LPN”.

La búsqueda del símbolo solo localizó su propio archivo.

No se localizó:

- importación;
- página que lo monte;
- server action conectada;
- entrada desde navegación;
- prueba;
- historia;
- uso desde otra aplicación.

**Clasificación:** `SIN_CONSUMIDOR_CONFIRMADO`.

##### 4.2. Ruta `/inventory/lpns`

La ruta existe, pero su única acción es:

```text
redirect("/inventory/stock")
```

El sincronizador de navegación la clasifica dentro de:

```text
NEVER_MENU_EXACT
```

Por tanto, no monta un flujo LPN ni promueve la pantalla como candidato de menú.

**Clasificación:** ruta técnica sin proceso LPN propio.

##### 4.3. Endpoint LPN

Existe:

```text
GET /api/inventory/lpns
```

El endpoint:

- autentica;
- consulta `inventory_lpns`;
- devuelve `id`, `code`, `site_id` y `created_at`.

No se localizó dentro de `vento-nexo` una referencia a:

```text
/api/inventory/lpns
```

No se descarta un consumidor externo, manual o futuro.

**Clasificación:** `CONSUMIDOR_EXTERNO_PENDIENTE`.

##### 4.4. Tablas LPN

`inventory_lpns` tiene al menos un consumidor de lectura mediante el endpoint.

`inventory_lpn_items` no presentó consumidor de aplicación localizado durante la búsqueda.

No se revisaron todavía exhaustivamente todas las dependencias SQL remotas.

**Clasificación:**

```text
inventory_lpns
→ CONSUMO_PARCIAL

inventory_lpn_items
→ SIN_CONSUMIDOR_DE_APLICACION_CONFIRMADO
```

##### 4.5. Conclusión

La capacidad LPN no está ausente por completo, pero sus piezas no forman una cadena utilizable:

```text
ruta
→ redirección

componente
→ sin montaje

endpoint
→ sin caller interno

tablas
→ sin ciclo funcional completo
```

Destinos:

- `NEXO-DOM-002` a `NEXO-DOM-008`;
- `NEXO-DOM-019` a `NEXO-DOM-024`;
- `NEXO-UX-026` a `NEXO-UX-040`;
- nueva tarea `SHELL-AUD-011`;
- `SUPA-AUD-022`;
- `SUPA-AUD-023`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-NEXO-004`.

No se crea un requisito LPN nuevo porque `TREQ-NEXO-004` ya exige el ciclo completo.

---

#### 5. PASS — cadena alternativa de seguimiento sin registro de navegación

Artefactos revisados:

```text
src/components/OrderTrackingScreen.tsx
src/components/OrderPlacedScreenLive.tsx
src/components/OrderPlacedScreen.tsx
App.js
```

##### 5.1. Navegación activa

`App.js` registra:

```text
OrderPlaced
→ OrderPlacedScreen
```

No registra:

```text
OrderTrackingScreen
OrderPlacedScreenLive
```

##### 5.2. Cadena alternativa

`OrderTrackingScreen` importa:

```text
OrderPlacedScreenLive
```

y agrega lógica de:

- estado de entrega;
- PIN de entrega;
- consulta de la orden;
- presentación del seguimiento.

La búsqueda de `OrderTrackingScreen` solo localizó su propio archivo y archivos de configuración, no un import o registro de pantalla.

`OrderPlacedScreenLive` tiene como consumidor localizado a `OrderTrackingScreen`.

Esto forma:

```text
OrderTrackingScreen
→ sin entrada localizada

OrderPlacedScreenLive
→ consumido solo por OrderTrackingScreen
```

**Clasificación:**

```text
OrderTrackingScreen
→ SIN_CONSUMIDOR_CONFIRMADO

OrderPlacedScreenLive
→ CONSUMO_TRANSITIVO_HUERFANO
```

##### 5.3. Riesgo

- dos implementaciones evolucionan por separado;
- correcciones de pagos o estados se aplican en una sola;
- una ruta profunda futura puede montar una pantalla no probada;
- código muerto sigue aumentando superficie de mantenimiento;
- eliminación impulsiva puede perder lógica útil de PIN o seguimiento.

##### 5.4. Destino

- `PASS-UX-001`;
- `PASS-UX-002`;
- `PASS-UX-006`;
- `PASS-UX-013`;
- nueva tarea `SHELL-AUD-011`;
- `CODE-AUD-019`;
- `CODE-AUD-020`;
- crea `TREQ-PASS-007`.

No se ordena eliminar la cadena.

Primero deberá compararse contra el flujo canónico y decidir:

```text
integrar
fusionar
reemplazar
retirar
```

---

#### 6. PASS — export auxiliar sin consumidor localizado

Archivo:

```text
src/utils/site.ts
```

Export:

```text
clearSiteIdCache()
```

La búsqueda solo localizó la definición.

El módulo sí tiene consumidores reales para:

- `getCurrentSiteIdCached`;
- `getSiteIdByBusinessType`.

Por tanto, no se considera huérfano el archivo completo.

**Clasificación:** export individual sin consumidor confirmado.

Destino:

- nueva tarea `SHELL-AUD-011`;
- `PASS-UX-001`;
- `CODE-AUD-020`.

Prioridad: baja.

No genera requisito de prueba independiente.

---

#### 7. PULSO — antecedente histórico real en `vento-platform`

Repositorio:

```text
devVentoGroup/vento-platform
```

Ruta histórica:

```text
apps/vento-os/modules/pos
```

Entrada histórica:

```text
apps/vento-os/app/staff/pos/page.tsx
```

##### 7.1. Qué estaba realmente alcanzable

La página histórica importaba y utilizaba:

- `decodeQRCode`;
- `processRedemptionAction`;
- `awardPointsAction`;
- identificación de clientes;
- validación de canjes;
- otorgamiento manual de puntos.

La misma pantalla mostraba:

```text
Sistema POS (Próximamente)
```

con el control deshabilitado.

Por tanto, la entrada alcanzable era:

```text
scanner de cliente
+ loyalty
+ canjes
```

y no:

```text
POS completo
```

##### 7.2. Evidencia del build histórico

El manifest de rutas inspeccionado contenía:

```text
/staff/pos
```

pero no una segunda ruta para venta, caja, pagos o administración POS.

El manifest de server actions incluía para `/staff/pos`:

- `validateRedemption`;
- `processRedemptionAction`;
- `awardPointsAction`.

No incluía como acciones consumidas por esa ruta:

- `createOrderAction`;
- `processPaymentAction`.

Esto permite distinguir:

```text
acción presente en source
```

de:

```text
acción conectada al build alcanzable
```

##### 7.3. Documentación histórica inconsistente

Un documento histórico marcaba PULSO como:

```text
POS funcional
```

pero esa afirmación contradice:

- la pantalla que dice “Próximamente”;
- el manifest del build;
- las acciones realmente enlazadas.

La documentación histórica no se utilizará como prueba de capacidad.

**Clasificación:** documentación sobreestimada y obsoleta.

---

#### 8. PULSO histórico — acciones fuente dormidas y objetos referenciados

##### 8.1. `createOrderAction`

El archivo histórico:

```text
apps/vento-os/modules/pos/actions/create-order.action.ts
```

sí contiene lógica para:

- crear `orders`;
- crear `order_items`;
- consultar `pos_tables`;
- consultar o crear `pos_sessions`;
- insertar `pos_session_orders`.

Sin embargo:

- no aparece conectado a la ruta POS compilada inspeccionada;
- usa pasos sucesivos;
- aplica eliminaciones compensatorias manuales;
- utiliza bypass administrativo para owner;
- no falla la orden si falla la creación de sesión;
- no falla la orden si falla `pos_session_orders`;
- deja un `TODO` para cursos;
- no demuestra idempotencia;
- no demuestra concurrencia de mesa;
- no demuestra cierre de sesión;
- no demuestra split, merge, transferencia o corrección.

**Clasificación de consumidor:** `CONSUMIDO_HISTORICO_DORMIDO`.

##### 8.2. `processPaymentAction`

El archivo histórico:

```text
apps/vento-os/modules/pos/actions/process-payment.action.ts
```

sí invoca:

```text
process_order_payment
```

pero tampoco aparece conectado a la ruta POS compilada inspeccionada.

Además, su comentario afirma que la RPC crea movimientos de inventario.

La RPC actual inspeccionada:

- actualiza la orden;
- inserta `pos_payments`;
- actualiza puntos;
- inserta `loyalty_transactions`;
- no crea movimientos de inventario.

Por tanto, el comentario y la implementación real divergen.

**Clasificación de consumidor:** `CONSUMIDO_HISTORICO_DORMIDO`.

##### 8.3. Datos mock

`types.ts` mezcla:

- tipos de tablas reales;
- modelos de orden;
- tipos de caja y pagos;
- mesas, zonas y cursos;
- datos mock;
- menú con precios de demostración;
- meseros ficticios;
- órdenes mock;
- modificadores mock.

La coexistencia de tipos y mocks confirma que el módulo era una combinación de:

```text
prototipo visual
+ contratos tentativos
+ acciones parciales
+ scanner real
```

No constituye una arquitectura POS aprobada.

---

#### 9. Matriz real de consumidores POS

| Objeto o capacidad            | Consumidor histórico en `vento-platform` | Conectado al build POS histórico inspeccionado | Consumidor actual en `vento-pulso`     | Clasificación                             |
| ----------------------------- | ---------------------------------------- | ---------------------------------------------: | -------------------------------------- | ----------------------------------------- |
| identificación QR de cliente  | sí                                       |                                             sí | sí, mediante scanner actual            | `CONSUMIDO_ACTUAL`                        |
| canje PASS                    | sí                                       |                                             sí | sí                                     | `CONSUMIDO_ACTUAL`                        |
| otorgamiento manual de puntos | sí                                       |                                             sí | sí, con implementación actual distinta | `CONSUMIDO_ACTUAL`                        |
| `orders` y `order_items`      | `createOrderAction`                      |                                  no confirmado | sí, órdenes operativas y PASS          | dominio activo, creación POS no conectada |
| `pos_zones`                   | tipos y prototipo                        |                                  no confirmado | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_tables`                  | `createOrderAction`                      |                                             no | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_sessions`                | `createOrderAction`                      |                                             no | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_table_service_calls`     | no corresponde al prototipo inicial      |                                             no | sí, salón                              | `CONSUMIDO_ACTUAL`                        |
| `pos_session_orders`          | `createOrderAction`                      |                                             no | no localizado en aplicación actual     | `CONSUMIDO_HISTORICO_DORMIDO`             |
| `process_order_payment`       | `processPaymentAction`                   |                                             no | no localizado                          | `CONSUMIDO_HISTORICO_DORMIDO`             |
| `pos_payments`                | indirectamente mediante RPC              |                                             no | no localizado                          | `CONSUMIDO_HISTORICO_DORMIDO`             |
| `pos_cash_shifts`             | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_cash_movements`          | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_modifiers`               | tipo y mock                              |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_modifier_options`        | tipo y mock                              |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_product_modifiers`       | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |
| `pos_order_item_modifiers`    | tipo declarado                           |                                             no | no localizado                          | `SIN_CONSUMIDOR_EJECUTABLE_CONFIRMADO`    |

Esta matriz reemplaza la conclusión simplificada de que todos los objetos POS estaban completamente huérfanos.

---

#### 10. Decisión canónica sobre el nuevo POS

El POS nuevo **no se basará en el modelo histórico**.

El prototipo de `vento-platform` se utilizará únicamente como:

- inventario forense;
- referencia de necesidades detectadas;
- fuente de piezas puntuales reutilizables;
- evidencia de contratos y datos que ya pudieron crearse;
- insumo para migración o retiro.

No se reutilizará automáticamente:

- esquema;
- nombres de estados;
- acciones;
- componentes;
- tipos;
- cálculos;
- RPC;
- reglas de autorización;
- modelos de mesa;
- modelo de caja;
- modelo de pago;
- mocks;
- flujos visuales.

Cada pieza deberá clasificarse como:

```text
REUTILIZAR
ADAPTAR
REESCRIBIR
REEMPLAZAR
RETIRAR
CONSERVAR_SOLO_COMO_HISTORIA
```

---

#### 11. Alcance mínimo del POS integral objetivo

La arquitectura nueva deberá diseñar, como mínimo, los siguientes dominios.

##### 11.1. Venta, cuenta y pedido

- orden comercial;
- cuenta o check;
- líneas;
- snapshots de producto, nombre, precio e impuesto;
- asientos;
- cursos;
- notas;
- modificadores;
- combos;
- cantidades;
- estados;
- canales;
- consumo en mesa;
- mostrador;
- recogida;
- domicilio;
- pedidos programados;
- venta rápida;
- venta sin cliente;
- cliente identificado.

##### 11.2. Salón

- sedes;
- zonas;
- mesas;
- capacidad;
- estado derivado;
- sesión de servicio;
- mesero responsable;
- transferencia;
- unión y separación de mesas;
- apertura y cierre;
- cambio de mesa;
- cuentas simultáneas;
- llamados;
- reservas futuras si se aprueban.

##### 11.3. Menú, disponibilidad y precios

- catálogo vendible por sede;
- horarios;
- canal;
- lista de precios;
- impuestos;
- cargos de servicio;
- disponibilidad;
- agotados;
- modificadores;
- opciones obligatorias;
- sustituciones;
- promociones;
- descuentos;
- autorizaciones;
- cortesías;
- precio manual controlado.

##### 11.4. Cocina, barra y despacho

- estaciones;
- routing por producto;
- comandas;
- impresoras;
- KDS;
- fire;
- hold;
- cursos;
- prioridades;
- reimpresión;
- recall;
- preparación parcial;
- listo;
- entregado;
- trazabilidad de actor y tiempos.

##### 11.5. Pagos

- intención de pago;
- tender;
- efectivo;
- tarjeta;
- transferencia;
- bono;
- crédito aprobado;
- pago mixto;
- pago parcial;
- propina;
- vuelto;
- referencia;
- autorización;
- captura;
- fallo;
- reversión;
- devolución;
- reembolso;
- chargeback cuando aplique;
- conciliación.

##### 11.6. Caja

- terminal;
- cajón;
- turno de caja;
- apertura;
- fondo inicial;
- ingresos;
- egresos;
- retiros;
- consignaciones;
- arqueos;
- conteos;
- cierre;
- diferencia;
- aprobación;
- reapertura controlada;
- reporte por actor, terminal y sede.

##### 11.7. Integraciones

- NEXO para inventario;
- PASS para cliente, acumulación y redención;
- NUMERA para hechos económicos y conciliación;
- facturación electrónica;
- impresión;
- dispositivos compartidos;
- periféricos;
- notificaciones;
- delivery;
- KDS;
- reporting.

##### 11.8. Integridad técnica

- comandos de servidor;
- transacciones atómicas;
- idempotency key;
- control de concurrencia;
- ledger financiero inmutable;
- correcciones compensatorias;
- outbox de eventos;
- reintentos;
- operación offline o degradada;
- recuperación;
- observabilidad;
- auditoría;
- RLS;
- autorización atómica;
- actor real;
- sede;
- área;
- turno;
- dispositivo;
- versionado de contratos.

##### 11.9. Principio de separación

La arquitectura deberá decidir explícitamente la relación entre:

```text
orders
pos_sessions
cuentas/checks
pagos
turnos de caja
movimientos de inventario
hechos económicos
```

No se asumirá que:

```text
una orden
=
una cuenta
=
un pago
=
una mesa
```

---

#### 12. PULSO — scripts manuales sin integración actual confirmada

Se localizaron scripts como:

```text
scripts/apply-orders-chat-inbox-mount.py
scripts/apply-order-modal-operational-improvements.py
scripts/run-order-modal-operational-improvements.py
scripts/apply-electronic-billing-ui.mjs
```

El `package.json` actual contiene únicamente:

```text
dev
build
start
lint
audit:i18n
```

No contiene:

- `predev`;
- `prebuild`;
- `postinstall`;
- comando de parche;
- comando de migración de UI.

El runner inspeccionado:

- abre otro script;
- cambia el target desde el tablero actual al tablero legacy;
- compila y ejecuta el código modificado.

**Clasificación:** `SIN_CONSUMIDOR_AUTOMATICO_CONFIRMADO`.

No se puede afirmar que nunca sea ejecutado manualmente.

Destinos:

- nueva tarea `SHELL-AUD-011`;
- `PULSO-UX-001`;
- `PULSO-UX-019`;
- `CODE-AUD-020`;
- mantiene `TREQ-PULSO-002`.

---

#### 13. Falsos positivos excluidos

##### 13.1. `pos_tables`, `pos_zones` y `pos_sessions`

Tienen consumidores actuales confirmados en PULSO salón.

**Clasificación:** `CONSUMIDO_ACTUAL`.

##### 13.2. `pos_table_service_calls`

Tiene consumidor actual y Realtime.

No pertenece al prototipo POS inicial.

**Clasificación:** `CONSUMIDO_ACTUAL`.

##### 13.3. `process_order_payment`

No está completamente “sin consumidor histórico”.

Tiene un caller en código fuente archivado.

Su clasificación correcta es:

```text
CONSUMIDOR_HISTORICO_DORMIDO
+
SIN_CALLER_ACTUAL_LOCALIZADO
```

##### 13.4. `pos_session_orders`

Tiene escritor en una acción histórica dormida.

No tiene consumidor actual localizado.

##### 13.5. Bridges de órdenes PULSO

Se confirmaron consumidores para:

```text
OrdersLiveBridge
DeliveryOverrideBridge
DeliveryDispatchBridge
```

desde `page.tsx` o `layout.tsx`.

**Clasificación:** `CONSUMIDO_ACTUAL`.

##### 13.6. Rutas Next.js

Un `page.tsx` es una entrada por convención aunque no aparezca en búsqueda textual.

La auditoría diferencia:

```text
ruta existente
ruta compilada
ruta promovida
ruta enlazada
ruta funcional
```

##### 13.7. Migraciones

Las migraciones aplicadas son historial reproducible.

No se eliminan por no ser importadas desde TypeScript.

##### 13.8. `app_screen_registry`

Tiene productor desde el sincronizador y consumidor administrativo en VISO.

**Clasificación:** `CONSUMIDO_ACTUAL`.

---

#### 14. Cobertura por repositorio

| Repositorio      | Resultado                                                                                                                    |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `vento-shell`    | conserva objetos POS con consumidores actuales, históricos dormidos y no confirmados; E3 decidirá fuente, migración o retiro |
| `vento-platform` | prototipo histórico archivado; scanner/loyalty alcanzable, POS completo no conectado                                         |
| `vento-viso`     | no se confirma artefacto huérfano nuevo; consume `app_screen_registry`                                                       |
| `vento-nexo`     | componente LPN sin montaje, ruta redirigida, endpoint sin caller interno y consumo LPN incompleto                            |
| `vento-fogo`     | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-origo`    | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-pulso`    | salón y órdenes activos; POS integral ausente; scripts manuales sin integración; varios objetos sin consumidor actual        |
| `vento-numera`   | no se confirma huérfano nuevo durante este corte                                                                             |
| `Vento-Group`    | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-anima`    | no se confirma huérfano nuevo durante este corte                                                                             |
| `vento-pass`     | cadena alternativa de seguimiento desconectada y export auxiliar sin consumidor                                              |
| `vento-talento`  | producto futuro; ausencia de navegación productiva no equivale a código muerto                                               |
| `vento-vital`    | fuera de Vento OS                                                                                                            |

“No se confirma huérfano nuevo” no equivale a certificación de ausencia.

---

#### 15. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                  | Clasificación                        | Destino                                                               |
| ---------------- | ----------------------------------------------------------------------------------------- | ------------------------------------ | --------------------------------------------------------------------- |
| `H-CODE-015-001` | `LpnCreateForm` no tiene importación o montaje localizado                                 | `SIN_CONSUMIDOR_CONFIRMADO`          | `NEXO-DOM-*`, `NEXO-UX-026` a `040`, `SHELL-AUD-011`, `TREQ-NEXO-004` |
| `H-CODE-015-002` | `/inventory/lpns` solo redirige a stock                                                   | ruta sin proceso propio              | mismo destino                                                         |
| `H-CODE-015-003` | el sincronizador excluye `/inventory/lpns` del menú                                       | no promovida                         | mismo destino                                                         |
| `H-CODE-015-004` | `GET /api/inventory/lpns` no tiene caller interno localizado                              | `CONSUMIDOR_EXTERNO_PENDIENTE`       | `SHELL-AUD-011`, `SUPA-AUD-022`, `023`                                |
| `H-CODE-015-005` | `inventory_lpn_items` no tiene consumidor de aplicación localizado                        | objeto sin consumidor app confirmado | `SUPA-AUD-019`, `022`, `023`, `TREQ-SUPABASE-003`                     |
| `H-CODE-015-006` | `OrderTrackingScreen` no está registrado ni importado por la navegación activa            | `SIN_CONSUMIDOR_CONFIRMADO`          | `PASS-UX-001`, `002`, `006`, `013`, `SHELL-AUD-011`, `TREQ-PASS-007`  |
| `H-CODE-015-007` | `OrderPlacedScreenLive` solo es consumido por una pantalla desconectada                   | `CONSUMO_TRANSITIVO_HUERFANO`        | mismo destino                                                         |
| `H-CODE-015-008` | `clearSiteIdCache` no tiene consumidor localizado                                         | export huérfano de baja prioridad    | `SHELL-AUD-011`, `CODE-AUD-020`                                       |
| `H-CODE-015-009` | scripts manuales PULSO no están conectados a comandos actuales                            | sin consumidor automático confirmado | `SHELL-AUD-011`, `PULSO-UX-019`, `CODE-AUD-020`                       |
| `H-CODE-015-010` | la ruta POS histórica solo consumía scanner, loyalty y canjes                             | prototipo parcial alcanzable         | `PULSO-UX-020`, `PULSO-UX-021`, `TREQ-PULSO-003`                      |
| `H-CODE-015-011` | `createOrderAction` existe, pero no estaba conectada al build POS inspeccionado           | consumidor histórico dormido         | `PULSO-UX-020`, `SUPA-AUD-022`, `023`                                 |
| `H-CODE-015-012` | `processPaymentAction` llama la RPC, pero no estaba conectada al build POS inspeccionado  | consumidor histórico dormido         | mismo destino                                                         |
| `H-CODE-015-013` | el comentario de pago afirma movimientos de inventario que la RPC inspeccionada no crea   | contrato divergente                  | `PULSO-UX-020`, `PULSO-UX-021`, `TREQ-PULSO-003`                      |
| `H-CODE-015-014` | tipos reales, mocks y contratos tentativos están mezclados en el módulo histórico         | prototipo no canónico                | `PULSO-UX-020`, `PULSO-UX-021`                                        |
| `H-CODE-015-015` | `pos_zones`, `pos_tables` y `pos_sessions` sí tienen consumidores actuales                | falso positivo corregido             | cerrado                                                               |
| `H-CODE-015-016` | `pos_session_orders`, `pos_payments` y la RPC tienen consumo histórico dormido, no actual | clasificación corregida              | `SUPA-AUD-022`, `023`, `TREQ-SUPABASE-003`                            |
| `H-CODE-015-017` | caja y modificadores no tienen consumidor ejecutable actual o histórico confirmado        | objeto sin consumidor confirmado     | `PULSO-UX-020`, `PULSO-UX-021`, `SUPA-AUD-022`, `023`                 |
| `H-CODE-015-018` | una búsqueda textual no prueba ausencia de consumidores dinámicos o externos              | regla de seguridad                   | `SHELL-AUD-011`, `TREQ-SHELL-004`                                     |
| `H-CODE-015-019` | no se confirma un nuevo huérfano en VISO, FOGO, ORIGO, NUMERA, ANIMA o Vento Group        | límite de evidencia                  | continuar `CODE-AUD-016` a `020`                                      |

Todos los hallazgos quedan cerrados o vinculados a tareas concretas.

---

#### 16. Tareas nuevas propuestas

##### 16.1. Fundación compartida

Agregar:

```md
### [ ] SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados
```

La tarea deberá:

- generar inventario;
- registrar evidencia de consumidor;
- distinguir uso estático, dinámico, por convención y externo;
- clasificar conservar, integrar, fusionar, reemplazar o retirar;
- verificar impacto;
- ejecutar eliminación mediante PR;
- exigir build, typecheck, lint y pruebas;
- conservar rollback;
- actualizar documentación y navegación.

##### 16.2. PULSO

Agregar:

```md
### [ ] PULSO-UX-020 — Auditar el prototipo POS histórico de vento-platform y clasificar cada pieza como reutilizable, adaptable o descartable
### [ ] PULSO-UX-021 — Diseñar la arquitectura funcional y técnica del POS integral objetivo sin heredar como contrato el prototipo histórico
```

`PULSO-UX-020` deberá producir una matriz por:

- pantalla;
- componente;
- acción;
- función;
- tabla;
- vista;
- RPC;
- estado;
- permiso;
- integración;
- dato existente.

`PULSO-UX-021` deberá definir:

- dominios;
- agregados;
- estados;
- comandos;
- eventos;
- ownership;
- atomicidad;
- idempotencia;
- concurrencia;
- offline;
- auditoría;
- integraciones;
- interfaces operativas;
- pruebas;
- estrategia de migración.

No se crea ninguna otra tarea nueva.

---

#### 17. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 17.1. Requisitos reutilizados

- `TREQ-NEXO-004`;
- `TREQ-PULSO-001`;
- `TREQ-PULSO-002`;
- `TREQ-SHELL-002`;
- `TREQ-SUPABASE-001`;
- `TREQ-SUPABASE-002`.

No se cambia su estado.

##### 17.2. Requisitos nuevos

###### `TREQ-SHELL-004`

Ninguna ruta, componente, función, script o endpoint podrá retirarse por “no usado” sin evidencia reproducible que cubra imports estáticos y dinámicos, convenciones de framework, navegación, scripts, CI, consumidores externos y ambientes; el retiro deberá superar build, typecheck, lint y pruebas aplicables.

###### `TREQ-PASS-007`

El retorno de pago y el seguimiento de un pedido deberán abrir una única experiencia canónica; cualquier pantalla alternativa deberá integrarse con paridad demostrada o retirarse, y ninguna cadena transitivamente huérfana podrá permanecer como implementación paralela sin decisión explícita.

###### `TREQ-SUPABASE-003`

Ninguna tabla, vista, función, RPC, trigger, política, publicación o bucket podrá eliminarse o declararse operativo sin un mapa verificable de propietarios, consumidores directos, dependencias SQL, consumidores externos, datos existentes, reemplazo y puerta de retiro.

###### `TREQ-PULSO-003`

Ninguna pieza del prototipo POS histórico podrá incorporarse al POS objetivo por la sola existencia de código, tablas o datos; deberá demostrar ajuste al proceso aprobado, contrato canónico, seguridad, atomicidad, idempotencia, concurrencia, recuperación, auditoría, integraciones y pruebas, o deberá adaptarse, reemplazarse o descartarse.

Las filas completas se entregan fuera de esta tarea para agregarlas únicamente al registro `04A`.

---

#### 18. Decisiones propuestas

1. “Sin referencia textual” no equivaldrá a “seguro para eliminar”.
2. Se distinguirán consumidores actuales, históricos dormidos, dinámicos, SQL y externos.
3. `LpnCreateForm` se clasifica como sin consumidor confirmado.
4. `/inventory/lpns` no se considera una superficie LPN funcional.
5. El endpoint LPN queda pendiente de confirmar consumidor externo.
6. `inventory_lpns` no se considera completamente huérfana.
7. `inventory_lpn_items` requiere mapa SQL y funcional.
8. `OrderTrackingScreen` se clasifica como desconectada.
9. `OrderPlacedScreenLive` se clasifica como huérfano transitivo.
10. Los scripts PULSO se clasifican como manuales sin integración actual confirmada.
11. `vento-platform` se reconoce como antecedente histórico real.
12. Su ruta POS alcanzable se clasifica como scanner, loyalty y canjes.
13. `createOrderAction` y `processPaymentAction` se clasifican como código histórico dormido.
14. `pos_zones`, `pos_tables`, `pos_sessions` y `pos_table_service_calls` se reconocen como consumidos actualmente.
15. `pos_session_orders`, `pos_payments` y `process_order_payment` tienen antecedente histórico, pero no caller actual localizado.
16. Caja y modificadores no tienen consumidor ejecutable confirmado.
17. El documento histórico que decía “POS funcional” no prevalece sobre el código.
18. El prototipo histórico no será arquitectura base.
19. Solo se rescatarán piezas aprobadas mediante matriz explícita.
20. El POS objetivo se diseñará desde cero como sistema integral.
21. Se crean `SHELL-AUD-011`, `PULSO-UX-020` y `PULSO-UX-021`.
22. Se derivan cuatro requisitos de prueba.
23. No se modifica código.
24. No se modifica Supabase.
25. `CODE-AUD-016` será la única continuidad inmediata.

---

#### 19. Límites de certeza

Esta tarea no confirma:

- que un endpoint sin caller interno no tenga consumidor externo;
- que un script no sea ejecutado manualmente;
- que una tabla sin referencia TypeScript no tenga trigger, vista o función;
- que el manifest inspeccionado represente todos los builds históricos;
- que ninguna rama histórica haya conectado las acciones POS;
- que el índice de búsqueda incluya todas las ramas;
- que todos los objetos remotos correspondan al repositorio;
- que los objetos POS existentes deban conservar su diseño;
- que todos los huérfanos hayan sido detectados;
- que un artefacto clasificado pueda eliminarse inmediatamente.

E3 deberá inspeccionar el Supabase remoto y sus dependencias antes de migrar o retirar objetos.

---

#### 20. Criterios de aceptación

`CODE-AUD-015` podrá aprobarse cuando:

- exista definición de consumidor;
- se distinga ausencia confirmada de incertidumbre;
- LPN quede evaluado por ruta, componente, endpoint y tablas;
- PASS seguimiento alternativo quede evaluado;
- los scripts PULSO queden evaluados;
- `vento-platform` quede reconocido como prototipo histórico;
- se diferencie código fuente dormido de consumidor compilado;
- cada objeto POS tenga clasificación individual;
- los objetos usados por salón queden excluidos como huérfanos;
- el prototipo histórico no se adopte como contrato;
- se materialicen `SHELL-AUD-011`, `PULSO-UX-020` y `PULSO-UX-021`;
- se identifiquen los cuatro requisitos nuevos;
- no se autorice eliminación durante E1;
- no se modifique código;
- no se modifique Supabase;
- `CODE-AUD-016` permanezca como continuidad inmediata.

---

#### 21. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
artefacto
→ consumidor actual o histórico
→ alcanzabilidad
→ clasificación
→ propietario
→ conservar / rescatar / adaptar / reemplazar / retirar
→ pruebas
→ cambio controlado
```

Para PULSO:

```text
prototipo histórico
→ auditoría de rescate
→ proceso empresarial objetivo
→ arquitectura POS nueva
→ contratos canónicos
→ implementación progresiva
```

La continuidad será:

```text
CODE-AUD-016
— Revisar estado de build, lint, typecheck y pruebas
```
