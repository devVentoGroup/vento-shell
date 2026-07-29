### MINI-BLOQUE — TAXONOMIA RESULTADOS Y ALCANCE

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **taxonomia resultados y alcance** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-MAP-001` a `CAP-MAP-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-MAP-001`: Crear taxonomía jerárquica de capacidades de Vento Group
- `CAP-MAP-002`: Definir capacidad, subcapacidad y resultado empresarial esperado
- `CAP-MAP-003`: Vincular cada capacidad con empresa, sede, área y canal aplicables
<!-- PLAN-SECTION-META:END -->

### ✅ CAP-MAP-001 — Crear taxonomía jerárquica de capacidades de Vento Group

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `OPS-PLAN-004` y tareas anteriores de E1
**Naturaleza:** mapa jerárquico de lo que Vento Group necesita poder hacer
**No define todavía:** responsables, aplicaciones, pantallas, permisos, datos, procesos objetivo, prioridad ni implementación
**Cambios en código o Supabase:** no autorizados

---

#### 1. Propósito

Crear un lenguaje común para describir lo que Vento Group necesita poder hacer, sin confundirlo con departamentos, cargos, aplicaciones, pantallas, tablas, sedes o procedimientos temporales.

```text
Gestionar abastecimiento
├── Planear necesidades
├── Solicitar productos
├── Comprar
├── Recibir
├── Almacenar
└── Despachar
```

---

#### 2. Niveles

| Nivel | Nombre              | Uso                                                     |
| ----- | ------------------- | ------------------------------------------------------- |
| 0     | Vento Group         | organización completa                                   |
| 1     | Familia empresarial | grupo amplio de responsabilidades                       |
| 2     | Capacidad           | resultado estable que la organización necesita producir |
| 3     | Subcapacidad        | parte específica y separable de una capacidad           |

`CAP-MAP-002` definirá después qué significa cada capacidad y qué resultado debe producir.

---

#### 3. Reglas de nombres e identificadores

1. Usar verbo en infinitivo más objeto empresarial.
2. Describir qué debe poder hacer la organización, no la herramienta actual.
3. No usar aplicaciones, tablas, pantallas, cargos, marcas o sedes como estructura.
4. No duplicar la misma capacidad en varias familias.
5. Separar capacidades que produzcan resultados diferentes.
6. Permitir trabajo manual, externo, actual o futuro.

Identificadores:

```text
CAP-01
CAP-01.01
CAP-01.01.01
```

Los códigos no serán permisos, rutas ni nombres de aplicaciones. No se reutilizarán identificadores retirados.

---

#### 4. Árbol principal

```text
VENTO GROUP
├── CAP-01 Dirigir y gobernar la organización
├── CAP-02 Gestionar personas y trabajo
├── CAP-03 Proteger salud, seguridad y cumplimiento
├── CAP-04 Gestionar productos, preparaciones y conocimiento
├── CAP-05 Abastecer la operación
├── CAP-06 Controlar inventario y almacenamiento
├── CAP-07 Gestionar activos, equipos y elementos reutilizables
├── CAP-08 Planear y ejecutar producción
├── CAP-09 Vender, cobrar y atender pedidos
├── CAP-10 Atender clientes y fortalecer relaciones
├── CAP-11 Transportar, despachar y entregar
├── CAP-12 Gestionar dinero, costos y obligaciones
├── CAP-13 Mantener instalaciones y condiciones de operación
├── CAP-14 Comunicar, promocionar y desarrollar ventas
├── CAP-15 Gestionar tecnología y soporte
├── CAP-16 Proteger información, documentos y evidencia
├── CAP-17 Medir, analizar y mejorar
└── CAP-18 Mantener continuidad y responder a incidentes
```

---

#### 5. CAP-01 — Dirigir y gobernar la organización

```text
CAP-01.01 Definir dirección y objetivos
CAP-01.02 Tomar y registrar decisiones empresariales
CAP-01.03 Gobernar empresas, marcas y establecimientos
CAP-01.04 Gobernar sedes, oficinas y áreas
CAP-01.05 Definir responsabilidades y límites de decisión
CAP-01.06 Gestionar políticas y reglas internas
CAP-01.07 Gestionar riesgos empresariales
CAP-01.08 Coordinar operación entre negocios y sedes
CAP-01.09 Gestionar relaciones con asesores y autoridades
CAP-01.10 Verificar cumplimiento de decisiones
```

---

#### 6. CAP-02 — Gestionar personas y trabajo

```text
CAP-02.01 Planear necesidades de personal
CAP-02.02 Reclutar y seleccionar
CAP-02.03 Vincular e incorporar trabajadores
CAP-02.04 Mantener información laboral
CAP-02.05 Asignar sedes, áreas y funciones
CAP-02.06 Programar turnos
CAP-02.07 Registrar asistencia y tiempo trabajado
CAP-02.08 Gestionar novedades, ausencias y reemplazos
CAP-02.09 Capacitar y comprobar preparación
CAP-02.10 Acompañar desempeño y desarrollo
CAP-02.11 Gestionar documentos laborales
CAP-02.12 Gestionar pagos y beneficios laborales
CAP-02.13 Gestionar retiro y cierre de accesos
```

---

#### 7. CAP-03 — Proteger salud, seguridad y cumplimiento

```text
CAP-03.01 Identificar peligros y riesgos laborales
CAP-03.02 Prevenir accidentes y enfermedades
CAP-03.03 Entregar y controlar elementos de protección
CAP-03.04 Reportar e investigar incidentes
CAP-03.05 Gestionar emergencias y evacuación
CAP-03.06 Controlar higiene e inocuidad
CAP-03.07 Realizar inspecciones obligatorias
CAP-03.08 Gestionar requisitos legales y certificados
CAP-03.09 Conservar evidencia de cumplimiento
CAP-03.10 Gestionar acciones correctivas
```

---

#### 8. CAP-04 — Gestionar productos, preparaciones y conocimiento

```text
CAP-04.01 Definir productos y servicios
CAP-04.02 Definir presentaciones y unidades
CAP-04.03 Clasificar productos
CAP-04.04 Gestionar ingredientes y componentes
CAP-04.05 Definir recetas y métodos de preparación
CAP-04.06 Definir rendimientos y porciones
CAP-04.07 Gestionar menús y disponibilidad
CAP-04.08 Gestionar información nutricional y alérgenos
CAP-04.09 Gestionar calidad y especificaciones
CAP-04.10 Gestionar cambios y vigencia del conocimiento
```

---

#### 9. CAP-05 — Abastecer la operación

```text
CAP-05.01 Planear necesidades de abastecimiento
CAP-05.02 Solicitar productos, materiales o servicios
CAP-05.03 Buscar y evaluar proveedores
CAP-05.04 Solicitar y comparar ofertas
CAP-05.05 Negociar condiciones
CAP-05.06 Aprobar compras
CAP-05.07 Emitir y controlar órdenes
CAP-05.08 Recibir productos y servicios
CAP-05.09 Verificar cantidades, calidad y documentos
CAP-05.10 Gestionar diferencias y devoluciones
CAP-05.11 Evaluar cumplimiento de proveedores
CAP-05.12 Gestionar compras urgentes
```

---

#### 10. CAP-06 — Controlar inventario y almacenamiento

```text
CAP-06.01 Definir lugares de almacenamiento
CAP-06.02 Identificar productos, lotes y recipientes
CAP-06.03 Registrar entradas
CAP-06.04 Ubicar y reubicar existencias
CAP-06.05 Consultar disponibilidad
CAP-06.06 Reservar o separar existencias
CAP-06.07 Registrar consumo y salida
CAP-06.08 Trasladar entre lugares
CAP-06.09 Solicitar y gestionar remisiones
CAP-06.10 Preparar y despachar remisiones
CAP-06.11 Recibir y confirmar remisiones
CAP-06.12 Contar inventario
CAP-06.13 Investigar y ajustar diferencias
CAP-06.14 Controlar vencimiento, daño y pérdida
CAP-06.15 Controlar frío y condiciones de almacenamiento
```

---

#### 11. CAP-07 — Gestionar activos, equipos y elementos reutilizables

```text
CAP-07.01 Identificar y clasificar activos
CAP-07.02 Registrar ubicación y custodia
CAP-07.03 Entregar, prestar y devolver
CAP-07.04 Transferir custodia
CAP-07.05 Contar activos y reutilizables
CAP-07.06 Registrar condición, daño, pérdida y faltante
CAP-07.07 Planear y ejecutar mantenimiento
CAP-07.08 Gestionar reparación y repuestos
CAP-07.09 Controlar garantías y seguros
CAP-07.10 Gestionar baja, venta, descarte o reemplazo
CAP-07.11 Gestionar kits y conjuntos
CAP-07.12 Gestionar vehículos y equipos de transporte
CAP-07.13 Controlar combustible, kilometraje y disponibilidad
```

---

#### 12. CAP-08 — Planear y ejecutar producción

```text
CAP-08.01 Recopilar necesidades de producción
CAP-08.02 Planear cantidades y fechas
CAP-08.03 Revisar capacidad, personal, equipos e insumos
CAP-08.04 Priorizar trabajo productivo
CAP-08.05 Programar producción
CAP-08.06 Preparar ingredientes y materiales
CAP-08.07 Ejecutar lotes o preparaciones
CAP-08.08 Registrar cantidades producidas
CAP-08.09 Registrar consumo, rendimiento y merma
CAP-08.10 Controlar calidad durante producción
CAP-08.11 Empacar y etiquetar
CAP-08.12 Liberar, retener o rechazar producto
CAP-08.13 Gestionar reproceso y aprovechamiento
CAP-08.14 Cerrar y conciliar producción
```

---

#### 13. CAP-09 — Vender, cobrar y atender pedidos

```text
CAP-09.01 Definir oferta y precios de venta
CAP-09.02 Recibir solicitudes y pedidos
CAP-09.03 Confirmar disponibilidad y condiciones
CAP-09.04 Registrar pedidos
CAP-09.05 Modificar, sustituir o cancelar pedidos
CAP-09.06 Enviar pedidos a preparación
CAP-09.07 Coordinar preparación y entrega
CAP-09.08 Registrar ventas
CAP-09.09 Cobrar y confirmar pagos
CAP-09.10 Emitir factura o soporte
CAP-09.11 Gestionar mesas y servicio presencial
CAP-09.12 Gestionar pedidos para llevar
CAP-09.13 Gestionar pedidos recibidos por aplicaciones o mensajes
CAP-09.14 Gestionar pedidos especiales, catering y ventas a empresas
CAP-09.15 Cerrar y revisar la jornada de venta
```

---

#### 14. CAP-10 — Atender clientes y fortalecer relaciones

```text
CAP-10.01 Identificar y conocer clientes
CAP-10.02 Registrar preferencias y autorizaciones
CAP-10.03 Atender preguntas y solicitudes
CAP-10.04 Recibir y resolver reclamos
CAP-10.05 Gestionar devoluciones y compensaciones
CAP-10.06 Medir satisfacción
CAP-10.07 Gestionar fidelización y beneficios
CAP-10.08 Gestionar reservas y eventos
CAP-10.09 Comunicar cambios que afecten al cliente
CAP-10.10 Proteger información del cliente
```

---

#### 15. CAP-11 — Transportar, despachar y entregar

```text
CAP-11.01 Planear necesidades de transporte
CAP-11.02 Definir recorridos y prioridades
CAP-11.03 Asignar vehículo y responsable
CAP-11.04 Preparar carga
CAP-11.05 Confirmar cantidades y condición al salir
CAP-11.06 Transferir custodia para transporte
CAP-11.07 Ejecutar recorrido
CAP-11.08 Registrar novedades durante transporte
CAP-11.09 Entregar y confirmar recepción
CAP-11.10 Gestionar faltantes, daños y devoluciones
CAP-11.11 Cerrar y revisar el recorrido
CAP-11.12 Gestionar entregas mediante terceros
```

---

#### 16. CAP-12 — Gestionar dinero, costos y obligaciones

```text
CAP-12.01 Registrar hechos económicos
CAP-12.02 Gestionar caja
CAP-12.03 Gestionar bancos y pagos
CAP-12.04 Gestionar cuentas por cobrar
CAP-12.05 Gestionar cuentas por pagar
CAP-12.06 Facturar y controlar documentos
CAP-12.07 Conciliar ventas, pagos y entregas
CAP-12.08 Conciliar compras y recepciones
CAP-12.09 Calcular costos
CAP-12.10 Distribuir costos compartidos
CAP-12.11 Gestionar presupuestos
CAP-12.12 Gestionar tesorería
CAP-12.13 Gestionar impuestos y obligaciones
CAP-12.14 Cerrar períodos y emitir reportes
CAP-12.15 Analizar rentabilidad
```

---

#### 17. CAP-13 — Mantener instalaciones y condiciones de operación

```text
CAP-13.01 Inventariar espacios e instalaciones
CAP-13.02 Planear mantenimiento
CAP-13.03 Solicitar y ejecutar reparaciones
CAP-13.04 Gestionar limpieza y saneamiento
CAP-13.05 Controlar plagas
CAP-13.06 Controlar agua, energía, gas y servicios
CAP-13.07 Inspeccionar condiciones
CAP-13.08 Calibrar equipos
CAP-13.09 Gestionar llaves, acceso físico y seguridad
CAP-13.10 Gestionar obras y adecuaciones
CAP-13.11 Registrar y cerrar novedades
```

---

#### 18. CAP-14 — Comunicar, promocionar y desarrollar ventas

```text
CAP-14.01 Definir identidad y mensajes
CAP-14.02 Planear comunicación y promociones
CAP-14.03 Crear y aprobar contenido
CAP-14.04 Publicar y administrar medios
CAP-14.05 Gestionar campañas
CAP-14.06 Gestionar promociones y cupones
CAP-14.07 Captar oportunidades de venta
CAP-14.08 Gestionar ventas a empresas
CAP-14.09 Gestionar catering y eventos comerciales
CAP-14.10 Medir resultados de comunicación y promoción
CAP-14.11 Gestionar reputación y comentarios públicos
```

---

#### 19. CAP-15 — Gestionar tecnología y soporte

```text
CAP-15.01 Gestionar cuentas y accesos
CAP-15.02 Gestionar computadores, celulares y tabletas
CAP-15.03 Gestionar redes y conectividad
CAP-15.04 Gestionar impresoras y periféricos
CAP-15.05 Gestionar aplicaciones y proveedores tecnológicos
CAP-15.06 Atender solicitudes de soporte
CAP-15.07 Gestionar fallas e incidentes tecnológicos
CAP-15.08 Gestionar cambios y versiones
CAP-15.09 Probar soluciones antes de usarlas
CAP-15.10 Gestionar licencias, contratos y costos tecnológicos
CAP-15.11 Capacitar en el uso de herramientas
```

---

#### 20. CAP-16 — Proteger información, documentos y evidencia

```text
CAP-16.01 Clasificar información y documentos
CAP-16.02 Crear y aprobar documentos
CAP-16.03 Guardar y localizar documentos
CAP-16.04 Controlar versiones y vigencia
CAP-16.05 Compartir información de forma autorizada
CAP-16.06 Proteger datos personales y sensibles
CAP-16.07 Conservar registros y evidencia
CAP-16.08 Archivar y eliminar de forma controlada
CAP-16.09 Gestionar firmas y aprobaciones
CAP-16.10 Atender solicitudes sobre información
CAP-16.11 Investigar accesos o cambios indebidos
```

---

#### 21. CAP-17 — Medir, analizar y mejorar

```text
CAP-17.01 Definir medidas e indicadores
CAP-17.02 Recopilar información
CAP-17.03 Verificar calidad de información
CAP-17.04 Preparar reportes
CAP-17.05 Analizar ventas y demanda
CAP-17.06 Analizar inventario y abastecimiento
CAP-17.07 Analizar producción y rendimiento
CAP-17.08 Analizar servicio y clientes
CAP-17.09 Analizar costos y rentabilidad
CAP-17.10 Identificar problemas y oportunidades
CAP-17.11 Definir y seguir acciones de mejora
CAP-17.12 Comprobar resultados
```

---

#### 22. CAP-18 — Mantener continuidad y responder a incidentes

```text
CAP-18.01 Identificar dependencias críticas
CAP-18.02 Preparar respuestas alternativas
CAP-18.03 Detectar y reportar incidentes
CAP-18.04 Evaluar impacto y prioridad
CAP-18.05 Mantener operación mínima
CAP-18.06 Recuperar equipos, servicios e información
CAP-18.07 Registrar trabajo realizado durante la falla
CAP-18.08 Incorporar posteriormente lo ocurrido
CAP-18.09 Confirmar que no quedaron pendientes
CAP-18.10 Aprender del incidente y mejorar la respuesta
CAP-18.11 Gestionar respaldos y recuperación
CAP-18.12 Coordinar comunicación durante incidentes
```

---

#### 23. Relaciones entre familias

| Necesidad               | Familia principal | Familias relacionadas                  |
| ----------------------- | ----------------- | -------------------------------------- |
| pedido de cliente       | `CAP-09`          | `CAP-08`, `CAP-10`, `CAP-11`, `CAP-12` |
| remisión entre sedes    | `CAP-06`          | `CAP-08`, `CAP-11`, `CAP-12`           |
| compra de insumo        | `CAP-05`          | `CAP-06`, `CAP-12`                     |
| trabajador en turno     | `CAP-02`          | `CAP-03`, `CAP-15`, `CAP-16`           |
| mantenimiento de equipo | `CAP-07`          | `CAP-05`, `CAP-12`, `CAP-13`           |
| reclamo por entrega     | `CAP-10`          | `CAP-09`, `CAP-11`, `CAP-12`           |
| falta de producto       | `CAP-06`          | `CAP-08`, `CAP-09`, `CAP-17`           |
| caída de sistema        | `CAP-18`          | `CAP-09`, `CAP-15`, `CAP-16`           |

Las relaciones no crean capacidades duplicadas.

---

#### 24. Lo que no se convierte en capacidad

- cada pantalla o ruta;
- cada tabla o función;
- cada documento individual;
- cada cargo;
- cada sede o marca;
- cada estado de un pedido;
- cada botón;
- cada excepción temporal;
- cada herramienta actual.

Estos elementos se vincularán después con la capacidad correspondiente.

---

#### 25. Trabajo actual, futuro o externo

Cada capacidad podrá clasificarse posteriormente como:

```text
ACTUAL
NECESARIA
FUTURA
EXTERNA
MANUAL_CONTROLADA
POR_CONFIRMAR
FUERA_DE_ALCANCE
```

Esta tarea no asigna todavía esas clasificaciones.

---

#### 26. Dudas que resolverán las tareas siguientes

| Duda                                           | Tarea         |
| ---------------------------------------------- | ------------- |
| significado y resultado de cada capacidad      | `CAP-MAP-002` |
| empresa, sede, área o forma de venta aplicable | `CAP-MAP-003` |
| aplicación o área propietaria                  | `CAP-MAP-004` |
| aplicaciones y sistemas que la utilizan        | `CAP-MAP-005` |
| quién inicia, ejecuta, supervisa y aprueba     | `CAP-MAP-006` |
| información de entrada y resultado             | `CAP-MAP-007` |
| fuente actual y futura de información          | `CAP-MAP-008` |
| relaciones y comunicaciones                    | `CAP-MAP-009` |
| permisos y controles                           | `CAP-MAP-010` |
| pantallas, aparatos, documentos y evidencia    | `CAP-MAP-011` |
| clasificación empresarial                      | `CAP-MAP-012` |
| duplicados o responsables en conflicto         | `CAP-MAP-013` |
| capacidades ausentes en sistemas               | `CAP-MAP-014` |
| aprobación de la línea base                    | `CAP-MAP-015` |

---

#### 27. Decisiones propuestas

1. Vento Group utilizará un único árbol de capacidades.
2. El nivel principal tendrá 18 familias.
3. Las capacidades se nombrarán por lo que la organización necesita hacer.
4. Aplicaciones, cargos, sedes y herramientas no definirán la estructura.
5. Cada capacidad tendrá una familia principal.
6. El mapa admitirá trabajo actual, necesario, futuro, externo y manual.
7. Esta tarea no asignará responsables, aplicaciones, permisos o datos.
8. Las dudas restantes tendrán destino en `CAP-MAP-002` a `CAP-MAP-015`.

---

#### 28. Criterios de aceptación

`CAP-MAP-001` podrá aprobarse cuando:

- exista un árbol único y comprensible;
- las familias cubran la operación empresarial mínima;
- cada capacidad tenga identificador y nombre estable;
- aplicaciones y cargos no definan la estructura;
- no se dupliquen capacidades por sede o herramienta;
- cada decisión posterior tenga tarea responsable;
- no se hayan diseñado procesos, pantallas, permisos, datos o implementación.

---

#### 29. Resultado y continuidad

Con la aprobación quedará establecida la estructura base para organizar el descubrimiento funcional y técnico.

La continuidad será:

```text
CAP-MAP-002
— Definir capacidad, subcapacidad y resultado empresarial esperado
```

`CAP-MAP-002` definirá qué significa cada elemento, qué incluye, qué excluye y qué resultado debe producir, sin asignar todavía aplicaciones o responsables definitivos.


### ✅ CAP-MAP-002 — Definir capacidad, subcapacidad y resultado empresarial esperado

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencia cumplida:** `CAP-MAP-001`
**Naturaleza:** definiciones y reglas para describir cada elemento del árbol de capacidades
**No define todavía:** empresa, sede, área, forma de venta, responsables, aplicaciones, permisos, información o implementación
**Cambios en código o Supabase:** no autorizados

---

#### 1. Propósito

Definir qué significa cada nivel del árbol aprobado y cómo deberá escribirse el resultado que Vento Group espera obtener.

Esta tarea evita que el mapa termine mezclando:

- cosas que la empresa necesita poder hacer;
- pasos de un procedimiento;
- tareas de una persona;
- herramientas;
- documentos;
- resultados.

---

#### 2. Definiciones aprobables

##### 2.1. Capacidad empresarial

Algo que Vento Group necesita poder hacer de manera estable para operar, dirigir, controlar o mejorar.

Una capacidad:

- sigue siendo necesaria aunque cambie la aplicación;
- puede involucrar varias personas;
- puede realizarse manualmente, con apoyo tecnológico o mediante un tercero;
- produce un resultado empresarial reconocible;
- no describe una secuencia detallada de pasos.

Ejemplo:

```text
CAPACIDAD
Gestionar turnos

RESULTADO
El trabajo requerido queda asignado a personas, fechas, horas, lugares y
funciones de forma comprensible y verificable.
```

##### 2.2. Subcapacidad

Parte concreta de una capacidad que produce un resultado propio y puede analizarse por separado.

Ejemplo:

```text
CAPACIDAD
Gestionar turnos

SUBCAPACIDADES
├── Crear programación
├── Comunicar programación
├── Registrar cambios
└── Resolver ausencias
```

##### 2.3. Resultado empresarial esperado

Estado verificable que debe existir después de ejecutar correctamente una capacidad o subcapacidad.

Debe responder:

```text
¿QUÉ QUEDA CREADO, CONFIRMADO, ENTREGADO, CONTROLADO O RESUELTO?
```

No será una frase genérica como:

```text
Proceso realizado correctamente
Información actualizada
Gestión completada
```

##### 2.4. Proceso

Secuencia ordenada que conecta varias capacidades o subcapacidades para resolver un caso de principio a fin.

Ejemplo:

```text
PEDIDO DE CLIENTE
→ recibir pedido
→ confirmar disponibilidad
→ preparar
→ cobrar
→ entregar
→ cerrar
```

El proceso se diseñará después. No sustituye el mapa de capacidades.

##### 2.5. Actividad

Paso específico realizado por una persona o sistema dentro de un proceso.

Ejemplos:

- contar unidades;
- imprimir una comanda;
- llamar a un proveedor;
- marcar una casilla;
- adjuntar una fotografía.

Las actividades no se registrarán como capacidades independientes salvo que produzcan un resultado empresarial separable.

---

#### 3. Prueba para reconocer una capacidad

Una candidata será capacidad cuando pueda responder afirmativamente:

| Pregunta                                                            | Debe cumplirse |
| ------------------------------------------------------------------- | -------------- |
| ¿La organización necesita conservarla aunque cambie la herramienta? | Sí             |
| ¿Produce un resultado útil y reconocible?                           | Sí             |
| ¿Puede evaluarse si existe, está incompleta o falta?                | Sí             |
| ¿Es más estable que un procedimiento actual?                        | Sí             |
| ¿Puede tener varias formas de ejecución?                            | Sí             |

Si solo describe una pantalla, archivo, cargo, botón o paso, no es capacidad.

---

#### 4. Prueba para separar subcapacidades

Dos elementos permanecerán separados cuando:

- produzcan resultados distintos;
- puedan existir uno sin el otro;
- tengan controles o riesgos diferentes;
- uno pueda estar completo mientras el otro falta;
- requieran decisiones empresariales diferentes.

Se mantendrán unidos cuando sean únicamente pasos inseparables de un mismo resultado.

Ejemplo:

```text
Recibir productos
≠
Verificar productos

La recepción confirma que algo llegó.
La verificación confirma cantidad, condición y correspondencia.
```

---

#### 5. Forma obligatoria de redactar resultados

Cada resultado utilizará esta estructura:

```text
[OBJETO O SITUACIÓN]
QUEDA
[ESTADO OBSERVABLE]
CON
[CONDICIONES MÍNIMAS]
```

Ejemplo:

```text
La solicitud de compra queda registrada y lista para evaluación, con
solicitante, necesidad, cantidades, fecha y soporte mínimo identificables.
```

Un resultado no deberá indicar todavía:

- qué aplicación lo guarda;
- qué tabla se modifica;
- qué cargo lo ejecuta;
- qué permiso lo autoriza;
- qué pantalla se utiliza.

---

#### 6. Campos que tendrá cada capacidad

| Campo              | Contenido                                                   |
| ------------------ | ----------------------------------------------------------- |
| Identificador      | código aprobado en `CAP-MAP-001`                            |
| Nombre             | verbo más objeto empresarial                                |
| Definición         | qué significa                                               |
| Incluye            | situaciones cubiertas                                       |
| Excluye            | situaciones cercanas que pertenecen a otra capacidad        |
| Resultado esperado | estado verificable que debe quedar                          |
| Evidencia posible  | ejemplo de cómo podría comprobarse, sin definir herramienta |
| Dudas              | elementos que requieren tareas posteriores                  |

Los campos empresa, sede, área y forma de venta se agregarán en `CAP-MAP-003`.

---

#### 7. Resultados esperados de las 18 familias

| Código   | Familia                                           | Resultado empresarial esperado                                                                                             |
| -------- | ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `CAP-01` | Dirigir y gobernar la organización                | Las decisiones, reglas, responsabilidades y riesgos quedan definidos, comunicados y sujetos a seguimiento.                 |
| `CAP-02` | Gestionar personas y trabajo                      | La organización dispone de personas vinculadas, preparadas, programadas y acompañadas para realizar el trabajo requerido.  |
| `CAP-03` | Proteger salud, seguridad y cumplimiento          | Los riesgos y obligaciones quedan identificados, prevenidos, atendidos y respaldados con evidencia.                        |
| `CAP-04` | Gestionar productos, preparaciones y conocimiento | Los productos, presentaciones, recetas, condiciones y cambios quedan definidos y disponibles para uso controlado.          |
| `CAP-05` | Abastecer la operación                            | Las necesidades de productos y servicios quedan atendidas mediante proveedores y compras verificables.                     |
| `CAP-06` | Controlar inventario y almacenamiento             | Las existencias quedan identificadas, ubicadas, disponibles y explicables desde entrada hasta consumo, traslado o pérdida. |
| `CAP-07` | Gestionar activos, equipos y reutilizables        | Los recursos físicos quedan identificados, custodiados, mantenidos y disponibles durante su vida útil.                     |
| `CAP-08` | Planear y ejecutar producción                     | Las necesidades se convierten en productos terminados con cantidades, calidad, consumo y diferencias conocidos.            |
| `CAP-09` | Vender, cobrar y atender pedidos                  | Las solicitudes se convierten en pedidos, ventas, pagos y entregas completos o en excepciones claramente resueltas.        |
| `CAP-10` | Atender clientes y fortalecer relaciones          | Las necesidades, reclamos, preferencias y compromisos con clientes quedan atendidos y protegidos.                          |
| `CAP-11` | Transportar, despachar y entregar                 | Los productos o recursos llegan al destino previsto con cantidades, condición, custodia y recepción confirmadas.           |
| `CAP-12` | Gestionar dinero, costos y obligaciones           | Los movimientos económicos quedan registrados, conciliados, cumplidos y disponibles para decisión.                         |
| `CAP-13` | Mantener instalaciones y condiciones de operación | Los espacios y servicios permanecen seguros, limpios, disponibles y aptos para operar.                                     |
| `CAP-14` | Comunicar, promocionar y desarrollar ventas       | La organización comunica su oferta, genera oportunidades y conoce el resultado de sus esfuerzos comerciales.               |
| `CAP-15` | Gestionar tecnología y soporte                    | Las herramientas tecnológicas permanecen disponibles, controladas y acompañadas durante su uso.                            |
| `CAP-16` | Proteger información, documentos y evidencia      | La información queda clasificada, protegida, localizable, vigente y conservada durante el tiempo necesario.                |
| `CAP-17` | Medir, analizar y mejorar                         | La organización convierte información confiable en conclusiones, decisiones y mejoras verificables.                        |
| `CAP-18` | Mantener continuidad y responder a incidentes     | La operación crítica puede sostenerse, recuperarse y reconciliarse después de una interrupción.                            |

---

#### 8. Contrato de resultado para las subcapacidades

Cada subcapacidad de `CAP-MAP-001` deberá cumplir esta plantilla:

```text
ID:
NOMBRE:

DEFINICIÓN:
Esta subcapacidad permite...

INCLUYE:
- ...

EXCLUYE:
- ...

RESULTADO ESPERADO:
... queda ...

PUEDE COMPROBARSE MEDIANTE:
- observación;
- registro;
- documento;
- confirmación;
- conteo;
- otro tipo de evidencia.

PREGUNTAS PENDIENTES:
- ...
```

La plantilla se completará durante el desarrollo progresivo del mapa y deberá estar completa antes de `CAP-MAP-015`.

---

#### 9. Ejemplos aplicados

##### 9.1. CAP-05.02 — Solicitar productos, materiales o servicios

**Definición:** expresar una necesidad de compra o contratación para que pueda revisarse y atenderse.

**Incluye:**

- necesidad;
- producto, material o servicio;
- cantidad cuando aplique;
- fecha requerida;
- lugar solicitante;
- motivo o soporte.

**Excluye:**

- elegir proveedor;
- aprobar compra;
- emitir orden;
- recibir producto.

**Resultado esperado:** la necesidad queda registrada de forma suficiente para ser evaluada, aprobada, rechazada o devuelta para corrección.

##### 9.2. CAP-06.11 — Recibir y confirmar remisiones

**Definición:** comprobar y registrar lo que llega a un lugar como resultado de una remisión.

**Incluye:**

- identificación de la remisión;
- conteo recibido;
- condición;
- diferencias;
- persona que recibe;
- fecha y hora.

**Excluye:**

- preparar el envío;
- transportarlo;
- realizar ajustes automáticos;
- decidir el costo.

**Resultado esperado:** la entrega queda confirmada con cantidad y condición recibidas, y cualquier diferencia queda visible y asignada para resolución.

##### 9.3. CAP-08.09 — Registrar consumo, rendimiento y merma

**Definición:** dejar evidencia de lo utilizado, lo obtenido y lo perdido durante producción.

**Incluye:**

- cantidades utilizadas;
- cantidades producidas;
- merma observada;
- unidad;
- preparación o lote relacionado.

**Excluye:**

- calcular costo definitivo;
- aprobar ajustes de inventario;
- definir receta.

**Resultado esperado:** cada ejecución productiva queda explicada mediante consumo, producción obtenida y diferencia observada.

##### 9.4. CAP-09.05 — Modificar, sustituir o cancelar pedidos

**Definición:** cambiar un pedido existente conservando qué se pidió originalmente, qué cambió y por qué.

**Incluye:**

- producto;
- cantidad;
- presentación;
- fecha;
- sustitución;
- cancelación;
- motivo.

**Excluye:**

- devolución posterior a la entrega;
- corrección contable;
- cambio de receta.

**Resultado esperado:** el pedido queda en un estado comprensible y el cambio conserva motivo, aceptación y efecto sobre preparación, cobro y entrega.

##### 9.5. CAP-11.09 — Entregar y confirmar recepción

**Definición:** transferir el producto o recurso al destinatario y dejar confirmación de lo recibido.

**Incluye:**

- destinatario;
- momento;
- cantidad;
- condición;
- diferencias;
- confirmación.

**Excluye:**

- preparación;
- cobro;
- ajuste de inventario;
- investigación de pérdidas.

**Resultado esperado:** el destino confirma qué recibió, cuándo y en qué condición, y cualquier diferencia queda pendiente de una resolución identificable.

---

#### 10. Diferencia entre resultado y evidencia

```text
RESULTADO
El pedido queda entregado y confirmado.

EVIDENCIA POSIBLE
Firma, mensaje, fotografía autorizada, registro, comprobante o confirmación de
la persona que recibe.
```

La evidencia prueba el resultado; no es el resultado.

---

#### 11. Diferencia entre resultado y medida

```text
RESULTADO
El reclamo queda atendido y cerrado.

MEDIDAS POSIBLES
Tiempo de respuesta
Cantidad de reaperturas
Porcentaje resuelto
```

Las medidas se definirán después. No reemplazan el resultado esperado.

---

#### 12. Resultados completos, parciales y fallidos

Cada capacidad podrá producir:

| Estado           | Significado                                                |
| ---------------- | ---------------------------------------------------------- |
| `COMPLETO`       | resultado alcanzado y comprobable                          |
| `PARCIAL`        | una parte quedó pendiente o fue aceptada parcialmente      |
| `NO_REALIZADO`   | no se obtuvo el resultado                                  |
| `CANCELADO`      | se decidió no continuar y quedó motivo                     |
| `EXCEPCIONAL`    | se obtuvo mediante una regla extraordinaria                |
| `NO_COMPROBABLE` | se afirma que ocurrió, pero no existe evidencia suficiente |

Estos estados son conceptuales; no crean todavía estados de base de datos.

---

#### 13. Resultado mínimo y resultado ampliado

Cuando una capacidad tenga distintas formas de cumplimiento se distinguirá:

```text
RESULTADO MÍNIMO
lo indispensable para considerar atendida la necesidad

RESULTADO AMPLIADO
información, evidencia o control adicional deseable
```

Ejemplo:

```text
Recibir productos

Mínimo:
producto, cantidad, fecha y receptor.

Ampliado:
condición, lote, vencimiento, temperatura, fotografía y diferencias.
```

La clasificación exacta se definirá cuando se documente cada subcapacidad.

---

#### 14. Casos que no deben confundirse

| No confundir               | Diferencia                                          |
| -------------------------- | --------------------------------------------------- |
| capacidad y responsable    | la capacidad existe aunque cambie la persona        |
| capacidad y aplicación     | la capacidad existe aunque cambie la herramienta    |
| capacidad y proceso        | el proceso conecta varias capacidades               |
| capacidad y actividad      | la actividad es un paso concreto                    |
| resultado y documento      | el documento puede demostrar el resultado           |
| resultado y estado técnico | el resultado describe una condición empresarial     |
| subcapacidad y excepción   | una excepción no crea automáticamente una capacidad |

---

#### 15. Control de duplicados

Si dos nombres parecen similares, se comparará:

1. objeto afectado;
2. resultado esperado;
3. inicio y final;
4. evidencia;
5. situaciones incluidas;
6. situaciones excluidas.

Si producen el mismo resultado, se unifican. Si producen resultados diferentes, permanecen separadas.

La decisión final sobre duplicados se registrará en `CAP-MAP-013`.

---

#### 16. Preguntas que esta tarea no responde

| Pregunta                                     | Tarea         |
| -------------------------------------------- | ------------- |
| ¿Dónde aplica?                               | `CAP-MAP-003` |
| ¿Qué aplicación o área es propietaria?       | `CAP-MAP-004` |
| ¿Qué sistemas la utilizan?                   | `CAP-MAP-005` |
| ¿Quién inicia, ejecuta, supervisa o aprueba? | `CAP-MAP-006` |
| ¿Qué información recibe y produce?           | `CAP-MAP-007` |
| ¿Cuál es la fuente actual o futura?          | `CAP-MAP-008` |
| ¿Qué comunicaciones requiere?                | `CAP-MAP-009` |
| ¿Qué permisos necesita?                      | `CAP-MAP-010` |
| ¿Qué pantallas, aparatos o documentos usa?   | `CAP-MAP-011` |
| ¿Cómo se clasifica?                          | `CAP-MAP-012` |
| ¿Está duplicada?                             | `CAP-MAP-013` |
| ¿Falta en los sistemas actuales?             | `CAP-MAP-014` |
| ¿Está lista la línea base?                   | `CAP-MAP-015` |

---

#### 17. Decisiones propuestas

1. Capacidad, subcapacidad, proceso, actividad, resultado y evidencia tendrán significados separados.
2. Cada capacidad deberá producir un resultado empresarial observable.
3. Los resultados no mencionarán aplicaciones, tablas, cargos o permisos.
4. Las 18 familias tendrán los resultados generales definidos en esta tarea.
5. Cada subcapacidad usará la plantilla de la sección 8.
6. La plantilla deberá completarse antes de aprobar la línea base en `CAP-MAP-015`.
7. Resultados incompletos, parciales o no comprobables permanecerán visibles.
8. Los posibles duplicados se resolverán mediante comparación de resultados.

---

#### 18. Criterios de aceptación

`CAP-MAP-002` podrá aprobarse cuando:

- capacidad, subcapacidad, proceso, actividad, resultado y evidencia estén claramente separados;
- exista una prueba para reconocer y dividir capacidades;
- exista una forma obligatoria de redactar resultados;
- cada familia tenga resultado general;
- exista plantilla para completar cada subcapacidad;
- los ejemplos demuestren cómo aplicar la regla;
- las preguntas posteriores tengan tarea responsable;
- no se hayan asignado todavía sedes, responsables, aplicaciones, permisos o datos.

---

#### 19. Resultado y continuidad

Con la aprobación quedará definido el contrato descriptivo que deberá cumplir cada elemento de la taxonomía.

La continuidad será exclusivamente:

```text
CAP-MAP-003
— Vincular cada capacidad con empresa, sede, área y canal aplicables
```

`CAP-MAP-003` determinará dónde aplica cada capacidad sin confundir empresa, sede, área o forma de recibir y atender pedidos.


### ✅ CAP-MAP-003 — Vincular cada capacidad con empresa, sede, área y canal aplicables

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `CAP-MAP-001` y `CAP-MAP-002`
**Propósito:** indicar en qué parte de la organización se necesita cada capacidad, sin confundir empresas, marcas, sedes, áreas, aplicaciones o formas de recibir pedidos
**No define todavía:** propietario funcional, responsables, aplicaciones, permisos, datos, diseño futuro ni titularidades sin soporte documental

---

#### 1. Resultado de esta tarea

Cada una de las 217 subcapacidades definidas en `CAP-MAP-001` quedará vinculada de forma controlada con:

1. la empresa o titular, cuando exista soporte documental;
2. el frente de operación observado;
3. el lugar físico donde se necesita;
4. el área de trabajo donde se usa o produce el resultado;
5. la forma de recibir o atender solicitudes, únicamente cuando aplique;
6. el estado de certeza de cada vínculo;
7. la pregunta concreta que permitirá resolver cualquier vínculo pendiente.

Esta tarea describe alcance. No decide todavía quién es dueño de la capacidad ni quién debe ejecutarla.

---

#### 2. Palabras que no se tratarán como equivalentes

| Palabra                    | Qué significa en esta tarea                                               | Ejemplo                                             |
| -------------------------- | ------------------------------------------------------------------------- | --------------------------------------------------- |
| Empresa o titular          | persona jurídica o natural que aparece en documentos y asume obligaciones | quien factura, contrata o figura en un certificado  |
| Frente observado           | nombre con el que actualmente se reconoce una operación                   | Vento Café, Saudo o Molka                           |
| Sede o lugar               | espacio físico donde se realiza trabajo                                   | Oficina 1, Centro de Producción, cocina o bodega    |
| Área de trabajo            | tipo de trabajo realizado dentro de un lugar                              | caja, cocina, compras o contabilidad                |
| Marca                      | nombre usado frente al público                                            | no demuestra por sí solo quién factura o contrata   |
| Forma de recibir o atender | manera concreta por la cual llega o se atiende una solicitud              | mesa, mostrador, llamada, WhatsApp, Rappi o Shopify |
| Aplicación                 | herramienta utilizada para trabajar                                       | Makos, Shopify o una hoja de cálculo                |

En las tablas se podrá conservar la palabra **canal** por compatibilidad con el plan, pero siempre significará **forma concreta de recibir o atender una solicitud**.

---

#### 3. Regla obligatoria sobre empresas y titulares

No se convertirá automáticamente una marca, una sede o un nombre operativo en empresa.

Hasta completar la verificación documental prevista en `EXT-GOV-001`, el campo **empresa o titular** utilizará uno de estos valores:

| Valor                            | Cuándo se usa                                                                         |
| -------------------------------- | ------------------------------------------------------------------------------------- |
| `CONFIRMADO_DOCUMENTALMENTE`     | existe documento vigente que permite identificar al titular                           |
| `POR_CONFIRMAR_DOCUMENTALMENTE`  | se conoce el frente operativo, pero no existe conciliación documental suficiente      |
| `VARIOS_TITULARES_POR_CONFIRMAR` | la capacidad parece compartida entre varios frentes y no se ha separado jurídicamente |
| `NO_APLICA`                      | el campo no corresponde al vínculo evaluado                                           |

Con la evidencia disponible, ninguna familia recibirá un titular jurídico definitivo en esta tarea.

---

#### 4. Estados permitidos para cada vínculo

| Estado               | Significado                                                                   |
| -------------------- | ----------------------------------------------------------------------------- |
| `CONFIRMADO`         | existe evidencia suficiente en la documentación revisada                      |
| `CONFIRMADO_PARCIAL` | existe evidencia, pero faltan lugares, variantes o límites                    |
| `POR_CONFIRMAR`      | hay una duda específica que puede resolverse mediante observación o documento |
| `NO_APLICA`          | la capacidad no necesita ese lugar, área o forma de atención                  |
| `NO_OBSERVADO`       | no se encontró evidencia de que actualmente ocurra                            |
| `FUTURO_POR_DECIDIR` | podría necesitarse después, pero no se declarará como operación actual        |

`POR_CONFIRMAR`, `NO_OBSERVADO` y `FUTURO_POR_DECIDIR` no significan lo mismo.

---

#### 5. Inventario base de frentes y lugares

| Código provisional | Nombre usado actualmente | Clasificación permitida en esta tarea        | Estado               |
| ------------------ | ------------------------ | -------------------------------------------- | -------------------- |
| `ORG-VENTO`        | Vento Group              | referencia organizacional                    | `CONFIRMADO`         |
| `LUG-OFI-01`       | Oficina 1                | punto administrativo real                    | `CONFIRMADO`         |
| `LUG-PROD-01`      | Centro de Producción     | contexto operativo diferenciado              | `CONFIRMADO`         |
| `LUG-CAF-01`       | Vento Café               | sede comercial y operativa                   | `CONFIRMADO`         |
| `LUG-SAU-01`       | Saudo                    | sede operativa diferenciada                  | `CONFIRMADO`         |
| `LUG-MOL-01`       | Molka                    | sede operativa diferenciada                  | `CONFIRMADO`         |
| `FRE-VAI-01`       | Vaila Vainilla           | frente comercial por caracterizar            | `CONFIRMADO_PARCIAL` |
| `FRE-CAT-01`       | Catering                 | servicio o frente comercial por caracterizar | `CONFIRMADO_PARCIAL` |

Los códigos son referencias documentales provisionales. No crean registros, empresas, centros de costo ni configuraciones.

---

#### 6. Áreas de trabajo que podrán marcarse

Para evitar respuestas abiertas, se utilizará inicialmente esta lista:

| Código    | Área de trabajo                                      |
| --------- | ---------------------------------------------------- |
| `ARE-DIR` | dirección o gerencia                                 |
| `ARE-ADM` | administración                                       |
| `ARE-CON` | contabilidad y tesorería                             |
| `ARE-PER` | personal, turnos y asuntos laborales                 |
| `ARE-SST` | seguridad, salud, higiene y cumplimiento             |
| `ARE-COM` | compras y relación con proveedores                   |
| `ARE-BOD` | bodega y almacenamiento                              |
| `ARE-PRO` | producción                                           |
| `ARE-COC` | cocina o preparación en sede                         |
| `ARE-CAJ` | caja y cobro                                         |
| `ARE-SAL` | salón, mesas y atención presencial                   |
| `ARE-PED` | recepción y seguimiento de pedidos                   |
| `ARE-DES` | despacho, transporte y entrega                       |
| `ARE-MER` | mercadeo, comunicación y ventas empresariales        |
| `ARE-MAN` | mantenimiento, limpieza e instalaciones              |
| `ARE-TEC` | tecnología y soporte                                 |
| `ARE-DOC` | documentos e información                             |
| `ARE-ANA` | medición, análisis y mejora                          |
| `ARE-OTR` | otra, indicando el nombre usado por los trabajadores |

Esta lista indica dónde se usa una capacidad. No asigna propiedad ni responsabilidad.

---

#### 7. Formas concretas de recibir o atender

| Código      | Forma concreta                                      |
| ----------- | --------------------------------------------------- |
| `FOR-MES`   | cliente atendido en una mesa                        |
| `FOR-MOS`   | cliente atendido en mostrador                       |
| `FOR-LLE`   | pedido para llevar                                  |
| `FOR-LLA`   | llamada telefónica                                  |
| `FOR-WHA`   | mensaje de WhatsApp                                 |
| `FOR-RAP`   | pedido recibido por Rappi                           |
| `FOR-MAN`   | solicitud o pedido recibido por ManyChat            |
| `FOR-SHO`   | pedido recibido por Shopify                         |
| `FOR-EMP`   | solicitud directa de una empresa                    |
| `FOR-EVE`   | evento o catering                                   |
| `FOR-INT`   | solicitud interna entre áreas o sedes               |
| `FOR-PRO`   | solicitud enviada por un proveedor                  |
| `FOR-AUT`   | otra forma identificada por nombre                  |
| `NO_APLICA` | la capacidad no depende de cómo llega una solicitud |

Makos u otra aplicación no será una forma de atención. Será la herramienta en la que puede registrarse una solicitud recibida por alguna de las formas anteriores.

---

#### 8. Regla de vinculación sin repetir 217 filas

Cada subcapacidad heredará el vínculo de su familia, salvo que aparezca en la tabla de excepciones del apartado 10.

La lectura será:

```text
VÍNCULO DE LA SUBCAPACIDAD
=
VÍNCULO BASE DE SU FAMILIA
+
EXCEPCIÓN ESPECÍFICA, SI EXISTE
```

Así, ninguna subcapacidad queda sin clasificación y se evita copiar 217 veces la misma información.

---

#### 9. Mapa base aplicable a todas las subcapacidades

| Familia                                                    | Frentes o lugares observados                                             | Áreas donde se necesita el resultado                                      | Forma de recibir o atender                                                                  | Estado               |
| ---------------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | -------------------- |
| `CAP-01` Dirigir y gobernar                                | Oficina 1 y operación transversal                                        | dirección y administración                                                | solicitudes internas                                                                        | `CONFIRMADO_PARCIAL` |
| `CAP-02` Gestionar personas y trabajo                      | Oficina 1, Centro de Producción, Vento Café, Saudo y Molka               | personal, administración y áreas con trabajadores                         | solicitudes internas                                                                        | `CONFIRMADO`         |
| `CAP-03` Proteger salud, seguridad y cumplimiento          | todos los lugares físicos observados                                     | seguridad, salud, higiene y cada área expuesta                            | solicitudes internas y avisos de incidentes                                                 | `CONFIRMADO_PARCIAL` |
| `CAP-04` Gestionar productos, preparaciones y conocimiento | Oficina 1, Centro de Producción y sedes que ofrecen o preparan productos | administración, producción, cocina, caja, pedidos y mercadeo              | todas las formas donde se ofrece un producto                                                | `CONFIRMADO_PARCIAL` |
| `CAP-05` Abastecer la operación                            | Oficina 1 y cada lugar que solicita o recibe productos o servicios       | compras, bodega, producción, cocina y administración                      | solicitudes internas y comunicaciones de proveedores                                        | `CONFIRMADO_PARCIAL` |
| `CAP-06` Controlar inventario y almacenamiento             | Centro de Producción y lugares con existencias                           | bodega, producción, cocina, caja y despacho cuando custodien productos    | solicitudes internas entre lugares                                                          | `CONFIRMADO_PARCIAL` |
| `CAP-07` Gestionar activos, equipos y reutilizables        | todos los lugares físicos observados                                     | administración, mantenimiento y cada área que custodie recursos           | solicitudes internas                                                                        | `CONFIRMADO_PARCIAL` |
| `CAP-08` Planear y ejecutar producción                     | Centro de Producción y sedes que preparen productos                      | producción, cocina, bodega y control de calidad                           | necesidades internas y pedidos que generan preparación                                      | `CONFIRMADO_PARCIAL` |
| `CAP-09` Vender, cobrar y atender pedidos                  | sedes comerciales y frentes de venta por caracterizar                    | caja, salón, pedidos, cocina y despacho                                   | mesa, mostrador, para llevar, llamada, WhatsApp, Rappi, ManyChat, Shopify, empresa y evento | `CONFIRMADO_PARCIAL` |
| `CAP-10` Atender clientes y fortalecer relaciones          | sedes comerciales y frentes de venta por caracterizar                    | salón, caja, pedidos, mercadeo y administración                           | todas las formas usadas por clientes                                                        | `CONFIRMADO_PARCIAL` |
| `CAP-11` Transportar, despachar y entregar                 | Centro de Producción, sedes receptoras y destinos de clientes            | bodega, producción, despacho, transporte y recepción                      | solicitud interna, domicilio, aplicación, mensaje, empresa o evento                         | `CONFIRMADO_PARCIAL` |
| `CAP-12` Gestionar dinero, costos y obligaciones           | Oficina 1 y lugares con caja, ventas, compras o consumo                  | contabilidad, tesorería, caja y administración                            | todas las formas que generen venta, compra, pago o cobro                                    | `CONFIRMADO_PARCIAL` |
| `CAP-13` Mantener instalaciones y condiciones de operación | todos los lugares físicos observados                                     | mantenimiento, limpieza, administración y área afectada                   | solicitudes internas y reporte de novedades                                                 | `CONFIRMADO_PARCIAL` |
| `CAP-14` Comunicar, promocionar y desarrollar ventas       | Oficina 1, sedes comerciales, Vaila Vainilla y catering                  | mercadeo, dirección, pedidos y atención                                   | mostrador, llamada, WhatsApp, Rappi, ManyChat, Shopify, empresa y evento                    | `CONFIRMADO_PARCIAL` |
| `CAP-15` Gestionar tecnología y soporte                    | Oficina 1 y lugares que utilicen equipos o aplicaciones                  | tecnología, administración y área usuaria                                 | solicitudes internas                                                                        | `CONFIRMADO_PARCIAL` |
| `CAP-16` Proteger información, documentos y evidencia      | todos los frentes y lugares que produzcan documentos                     | administración, contabilidad, personal, documentos y cada área generadora | `NO_APLICA`, salvo solicitudes de información                                               | `CONFIRMADO_PARCIAL` |
| `CAP-17` Medir, analizar y mejorar                         | Oficina 1 y todas las operaciones que produzcan información              | dirección, administración, contabilidad, análisis y área evaluada         | `NO_APLICA`                                                                                 | `CONFIRMADO_PARCIAL` |
| `CAP-18` Mantener continuidad y responder a incidentes     | todos los lugares y frentes que ejecuten trabajo crítico                 | dirección, administración, tecnología y área afectada                     | avisos de incidentes y solicitudes internas                                                 | `CONFIRMADO_PARCIAL` |

En todas las familias, **empresa o titular** permanece `POR_CONFIRMAR_DOCUMENTALMENTE`.

---

#### 10. Excepciones que afinan el mapa base

| Subcapacidad              | Vínculo específico que reemplaza o limita el vínculo base                                                      |
| ------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `CAP-01.03`               | aplica a todos los frentes identificados y exige separar empresa, marca y establecimiento                      |
| `CAP-01.04`               | aplica a Oficina 1, Centro de Producción, Vento Café, Saudo, Molka y cualquier lugar adicional que se confirme |
| `CAP-01.08`               | aplica únicamente cuando dos o más frentes o lugares participan en el mismo resultado                          |
| `CAP-02.05` a `CAP-02.08` | aplican por cada lugar donde haya trabajadores asignados o cubriendo turnos                                    |
| `CAP-03.05`               | aplica por cada lugar físico; no se hereda automáticamente a un frente sin presencia física confirmada         |
| `CAP-03.06`               | aplica a producción, cocina, almacenamiento, despacho y atención de alimentos                                  |
| `CAP-04.07`               | aplica por cada forma concreta en la que se muestre o prometa disponibilidad                                   |
| `CAP-05.08` a `CAP-05.10` | aplican en cada lugar que reciba físicamente un producto o confirme un servicio                                |
| `CAP-06.08` a `CAP-06.11` | aplican cuando existen origen y destino diferentes; deben marcarse ambos lugares                               |
| `CAP-06.15`               | aplica solamente en lugares que almacenen productos bajo temperatura o condición controlada                    |
| `CAP-07.12` y `CAP-07.13` | aplican donde existan vehículos o equipos de transporte; actualmente queda `POR_CONFIRMAR`                     |
| `CAP-08.06` a `CAP-08.14` | aplican en Centro de Producción y en cada sede que realmente prepare o transforme productos                    |
| `CAP-09.11`               | aplica solamente a atención en mesa                                                                            |
| `CAP-09.12`               | aplica solamente a mostrador o pedido para llevar                                                              |
| `CAP-09.13`               | aplica separadamente a WhatsApp, Rappi, ManyChat, Shopify y cualquier otra aplicación o mensajería confirmada  |
| `CAP-09.14`               | aplica separadamente a solicitudes de empresas, pedidos especiales, eventos y catering                         |
| `CAP-10.08`               | aplica donde se acepten reservas o eventos; lugares exactos `POR_CONFIRMAR`                                    |
| `CAP-11.01` a `CAP-11.11` | deben indicar origen, destino y si el traslado es entre lugares internos o hacia un cliente                    |
| `CAP-11.12`               | aplica únicamente cuando la entrega se delega a Rappi, mensajería u otro tercero                               |
| `CAP-12.02`               | aplica por cada caja física o equivalente que reciba y entregue dinero                                         |
| `CAP-12.07`               | se separa por forma de venta para comparar pedido, venta, pago y entrega                                       |
| `CAP-12.10`               | aplica cuando dos o más frentes o lugares comparten un costo                                                   |
| `CAP-13.01` a `CAP-13.11` | se registran por lugar físico y no por marca                                                                   |
| `CAP-14.04` a `CAP-14.06` | se separan por medio publicado: redes, WhatsApp, Rappi, ManyChat, Shopify u otro                               |
| `CAP-14.08` y `CAP-14.09` | aplican respectivamente a ventas a empresas y a catering o eventos                                             |
| `CAP-15.02` a `CAP-15.04` | se registran por ubicación física del equipo                                                                   |
| `CAP-15.05`               | se registra por aplicación y frente usuario, sin convertir la aplicación en canal o área                       |
| `CAP-16.06`               | aplica donde se consulten o conserven datos de trabajadores, clientes, proveedores u otras personas            |
| `CAP-17.05` a `CAP-17.09` | se analizan por frente, lugar y forma de atención cuando la información lo permita                             |
| `CAP-18.05` a `CAP-18.09` | se registran por lugar afectado y por forma alternativa usada durante la falla                                 |

Las subcapacidades no listadas conservan íntegramente el vínculo base de su familia.

---

#### 11. Registro mínimo para consultar cualquier subcapacidad

Cuando el mapa se convierta en tabla o sistema, cada fila deberá contener:

| Campo                      | Regla                                                      |
| -------------------------- | ---------------------------------------------------------- |
| Código de subcapacidad     | identificador de `CAP-MAP-001`                             |
| Empresa o titular          | valor confirmado o pendiente documental                    |
| Frente observado           | uno o varios códigos del apartado 5                        |
| Lugar                      | lugar físico específico o `NO_APLICA`                      |
| Área de trabajo            | una o varias opciones del apartado 6                       |
| Forma de recibir o atender | una o varias opciones del apartado 7 o `NO_APLICA`         |
| Estado                     | valor permitido del apartado 4                             |
| Evidencia                  | documento, observación o respuesta que respalda el vínculo |
| Duda pendiente             | pregunta única y concreta, si el estado no es `CONFIRMADO` |
| Tarea de resolución        | tarea posterior encargada de cerrar la duda                |

---

#### 12. Preguntas pendientes que no bloquean el avance

| Código         | Duda puntual                                                               | Quién puede resolverla                          | Evidencia necesaria                                           | Destino                       |
| -------------- | -------------------------------------------------------------------------- | ----------------------------------------------- | ------------------------------------------------------------- | ----------------------------- |
| `D-CAP003-001` | ¿Qué titular aparece en los documentos de cada frente?                     | Contabilidad o Gerencia                         | certificado, factura, contrato o registro                     | `EXT-GOV-001`                 |
| `D-CAP003-002` | ¿En cuáles sedes se prepara o transforma producto actualmente?             | responsable de cada sede                        | respuesta marcada y foto no sensible del lugar de preparación | auditoría operativa posterior |
| `D-CAP003-003` | ¿Qué lugares almacenan productos y cuáles controlan frío?                  | responsable de bodega, cocina o sede            | respuesta marcada y foto del equipo o zona                    | `OPS-LOG-001`                 |
| `D-CAP003-004` | ¿Qué formas de recibir pedidos usa realmente cada sede?                    | cajero o responsable de pedidos                 | autocuestionario `OPS-PLAN-003`                               | `OPS-CAN-001`                 |
| `D-CAP003-005` | ¿Qué frente vende, produce, cobra y entrega los pedidos de Vaila Vainilla? | Gerencia, Contabilidad y responsable de pedidos | respuestas separadas y soportes disponibles                   | `OPS-CAN-001`, `OPS-CST-001`  |
| `D-CAP003-006` | ¿Catering ya opera, quién lo recibe y desde dónde se prepara?              | Gerencia y responsable operativo                | respuesta marcada, ejemplo de pedido y lugar                  | `OPS-CAN-001`                 |
| `D-CAP003-007` | ¿Qué vehículos o equipos de transporte existen y dónde permanecen?         | responsable de operación                        | listado y foto sin placas visibles si no son necesarias       | `OPS-ACT-001`                 |
| `D-CAP003-008` | ¿Qué aplicaciones o medios utiliza cada lugar?                             | trabajador que los usa                          | nombre visible de la herramienta y tarea realizada            | `CAP-MAP-005`                 |

Estas dudas se conservan en el plan; no deben quedar únicamente en notas de revisión.

---

#### 13. Autocuestionario para Contabilidad o Gerencia

Se enviará un bloque independiente por cada nombre: Vento Group, Vento Café, Saudo, Molka, Vaila Vainilla y Catering.

```text
CAP003-DOC — [NOMBRE]

Revisa únicamente documentos que tengas autorizados.

¿En cuál documento aparece quién responde legalmente por [NOMBRE]?

Marca TODOS los que encontraste:
[ ] Certificado de Cámara de Comercio
[ ] RUT
[ ] Factura de venta
[ ] Contrato
[ ] Cuenta bancaria o documento de recaudo
[ ] Contrato de Rappi, Shopify u otra plataforma
[ ] No encontré documento
[ ] No tengo permiso para revisarlo
[ ] NO SÉ

Escribe exactamente el nombre o razón social que aparece:
________________________________

Escribe el NIT solo si está permitido; de lo contrario escribe “DATO RESERVADO”:
________________________________

Nombre del documento revisado:
________________________________

Fecha visible del documento:
________________________________

No envíes contraseñas, números de cuenta completos, datos de tarjetas ni
documentos personales por WhatsApp.
```

---

#### 14. Autocuestionario para responsable de sede

Se enviará un bloque separado por cada lugar.

```text
CAP003-SEDE — [NOMBRE DEL LUGAR]

Marca qué trabajos ocurren físicamente en este lugar:

[ ] Se atienden clientes en mesas
[ ] Se atienden clientes en mostrador
[ ] Se reciben pedidos para llevar
[ ] Se reciben pedidos por llamada
[ ] Se reciben pedidos por WhatsApp
[ ] Se reciben pedidos por Rappi
[ ] Se reciben pedidos por ManyChat
[ ] Se reciben pedidos por Shopify
[ ] Se preparan o transforman alimentos
[ ] Se guardan productos
[ ] Se guardan productos en frío
[ ] Se reciben compras de proveedores
[ ] Se envían productos a otra sede
[ ] Se reciben productos de otra sede
[ ] Se maneja caja o dinero
[ ] Se guardan documentos
[ ] Ninguna de las anteriores
[ ] NO SÉ

Si ocurre otro trabajo que no aparece, escribe una sola frase:
________________________________

Nombre del cargo o función de quien respondió:
________________________________

Fecha de la respuesta:
________________________________

No escribas nombres de clientes, contraseñas ni datos de tarjetas.
```

---

#### 15. Autocuestionario corto para cualquier trabajador

Este formulario se utilizará solamente cuando exista una duda sobre un trabajo que esa persona realiza.

```text
CAP003-TRABAJO — [NOMBRE DEL TRABAJO]

Durante una jornada normal, ¿tú realizas [NOMBRE DEL TRABAJO]?

Marca UNA:
[ ] Sí
[ ] No
[ ] Algunas veces
[ ] NO SÉ

¿En qué lugar lo haces?
[ ] Oficina 1
[ ] Centro de Producción
[ ] Vento Café
[ ] Saudo
[ ] Molka
[ ] Otro lugar

Si marcaste “Otro lugar”, escribe el nombre que usan ustedes:
________________________________

¿Cómo recibes el aviso o la solicitud para hacerlo?
[ ] Me lo dicen personalmente
[ ] Me llaman
[ ] Me escriben por WhatsApp
[ ] Lo veo en una pantalla o aplicación
[ ] Lo veo en un papel
[ ] Lo hago sin recibir una solicitud
[ ] Otra forma

Si marcaste “pantalla o aplicación”, escribe el nombre visible:
________________________________

Si marcaste “otra forma”, escribe qué ocurre:
________________________________

Ejemplo de respuesta:
“Sí. Lo hago en Saudo. Me escriben por WhatsApp y después lo registro en Makos”.
```

---

#### 16. Lo que queda decidido con esta tarea

1. Empresa, frente, sede, área, forma de atención y aplicación permanecerán separados.
2. Las 217 subcapacidades se vincularán mediante una regla base por familia y excepciones explícitas.
3. No se inventará un titular jurídico cuando solo exista evidencia de marca o sede.
4. Vento Café, Saudo, Molka, Oficina 1 y Centro de Producción se reconocerán como lugares o contextos observados, no como empresas por presunción.
5. Vaila Vainilla y catering permanecerán como frentes por caracterizar.
6. “Canal” significará siempre una forma concreta de recibir o atender.
7. Una aplicación no será tratada automáticamente como forma de atención.
8. Toda duda tendrá pregunta, persona capaz de responderla, evidencia esperada y tarea de destino.
9. Los cuestionarios podrán enviarse por WhatsApp sin intervención de un ingeniero.
10. Los pendientes documentales no bloquearán `CAP-MAP-004`; permanecerán visibles y trazables.

---

#### 17. Criterios de aceptación

`CAP-MAP-003` podrá aprobarse cuando:

- exista una diferencia inequívoca entre empresa, frente, sede, área, forma de atención y aplicación;
- todas las subcapacidades puedan resolverse mediante mapa base más excepción;
- no se haya atribuido una titularidad jurídica sin documento;
- los lugares y frentes ya observados estén incluidos;
- las formas de recibir pedidos estén expresadas con palabras reconocibles por los trabajadores;
- las excepciones de venta, producción, traslado, caja y atención estén identificadas;
- cada duda pendiente tenga una vía no técnica y específica de resolución;
- `CAP-MAP-004` permanezca como única continuidad inmediata.

---

#### 18. Resultado y continuidad

Con la aprobación quedará definido dónde se necesita cada capacidad según la evidencia disponible, qué vínculos siguen pendientes y cómo podrá confirmarlos personal operativo, administrativo o contable.

La continuidad será exclusivamente:

```text
CAP-MAP-004
— Definir dominio y aplicación propietaria candidata
```

`CAP-MAP-004` propondrá qué área funcional y qué aplicación deberían gobernar cada capacidad, sin confundir uso, propiedad, ejecución o aprobación.
