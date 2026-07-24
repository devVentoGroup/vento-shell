### MAPA CANÓNICO DE CAPACIDADES EMPRESARIALES

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


### ✅ CAP-MAP-004 — Definir dominio y aplicación propietaria candidata

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `CAP-MAP-001`, `CAP-MAP-002` y `CAP-MAP-003`
**Propósito:** proponer qué grupo de trabajo empresarial y qué aplicación deberían gobernar el resultado principal de cada capacidad
**No define todavía:** aplicaciones consumidoras, responsables humanos, permisos, tablas, integraciones, fuente de verdad definitiva ni implementación

---

#### 1. Resultado de esta tarea

Cada una de las 217 subcapacidades quedará asociada con:

1. un grupo estable de trabajo empresarial;
2. una aplicación propietaria candidata;
3. la razón empresarial de la candidatura;
4. el estado de certeza de la propuesta;
5. la frontera que la aplicación no deberá cruzar;
6. una pregunta específica cuando falte evidencia.

La palabra **candidata** significa que la asignación orienta el análisis y la remodelación, pero aún debe contrastarse con procesos, información e implementación en `CAP-MAP-005` a `CAP-MAP-015`.

---

#### 2. Definiciones en lenguaje directo

##### 2.1. Grupo de trabajo empresarial

Conjunto de capacidades que persiguen un mismo tipo de resultado.

Ejemplos:

- comprar y recibir de proveedores;
- controlar existencias;
- producir;
- vender y cobrar;
- gestionar personas;
- controlar costos.

En el plan podrá conservarse la palabra **dominio**, pero significará siempre este grupo de trabajo.

##### 2.2. Aplicación propietaria candidata

Aplicación propuesta para:

- crear o aceptar el registro principal;
- aplicar sus reglas;
- permitir su corrección autorizada;
- conservar su estado;
- explicar qué ocurrió con ese resultado.

No significa que toda la tarea humana ocurra dentro de esa aplicación.

##### 2.3. Aplicación consumidora

Aplicación que consulta, presenta o utiliza un resultado gobernado por otra.

Las consumidoras se identificarán en `CAP-MAP-005`; esta tarea solo evita confundirlas con la propietaria.

##### 2.4. Repositorio técnico

Lugar donde se conserva código, documentación, migraciones o paquetes.

`vento-shell` es un repositorio técnico. No es automáticamente la aplicación propietaria de todas las capacidades ni equivale a la aplicación SHELL.

---

#### 3. Prueba obligatoria para elegir una candidata

Una aplicación podrá proponerse como propietaria únicamente si obtiene respuestas favorables en estas preguntas:

1. ¿Su propósito canónico coincide con el resultado empresarial?
2. ¿Debe controlar el registro principal y no solo mostrarlo?
3. ¿Puede definir las reglas sin apropiarse de trabajo de otro grupo?
4. ¿Es el lugar lógico para corregir el resultado?
5. ¿Puede explicar su estado completo, parcial, cancelado o fallido?
6. ¿Evita que dos aplicaciones creen versiones independientes del mismo hecho?

Si las respuestas no son suficientes, la capacidad quedará pendiente o deberá dividirse por resultado.

---

#### 4. Estados de la candidatura

| Estado                       | Significado                                                                     |
| ---------------------------- | ------------------------------------------------------------------------------- |
| `CANDIDATA_FUERTE`           | el propósito canónico de la aplicación coincide claramente                      |
| `CANDIDATA_CON_FRONTERA`     | la aplicación es adecuada si se respeta un límite explícito                     |
| `CANDIDATA_DIFERIDA`         | existe una aplicación adecuada, pero su roadmap está diferido                   |
| `REQUIERE_DIVIDIR_RESULTADO` | una sola subcapacidad mezcla resultados que pertenecen a aplicaciones distintas |
| `PENDIENTE_DE_EVIDENCIA`     | falta observar dónde se crea, corrige o controla el resultado                   |
| `SIN_CANDIDATA_ADECUADA`     | ninguna aplicación actual cubre limpiamente el resultado                        |

`SIN_CANDIDATA_ADECUADA` no autoriza a crear una aplicación nueva. Solo registra una brecha.

---

#### 5. Catálogo de aplicaciones permitido

| Código   | Aplicación | Propósito canónico relevante                                                                             |
| -------- | ---------- | -------------------------------------------------------------------------------------------------------- |
| `shell`  | Vento OS   | entrada al ecosistema, navegación, selección y coordinación entre aplicaciones                           |
| `anima`  | ANIMA      | turnos, asistencia, entrada y salida, documentos e información personal del trabajador                   |
| `viso`   | VISO       | administración de trabajadores, roles, permisos, turnos, perfiles, sedes, áreas y auditoría de seguridad |
| `nexo`   | NEXO       | inventario, logística, remisiones, ubicaciones, conteos, activos, despacho y recepción                   |
| `fogo`   | FOGO       | producción, órdenes, lotes, recetas y ejecución productiva                                               |
| `origo`  | ORIGO      | compras, proveedores, órdenes de compra, recepción y abastecimiento                                      |
| `pulso`  | PULSO      | punto de venta, pedidos, ventas, pagos, salón, entregas, puntos y caja                                   |
| `numera` | NUMERA     | gastos, costos, rentabilidad, información financiera, reportes y centros de costo                        |
| `aura`   | AURA       | trabajo administrativo de comunicación y mercadeo; aplicación conservada pero diferida                   |
| `pass`   | Vento Pass | experiencia e identidad del cliente                                                                      |

No se crea ningún código adicional en esta tarea.

---

#### 6. Reglas que impiden propietarios falsos

1. SHELL no será propietaria por el solo hecho de enlazar a otras aplicaciones.
2. `vento-shell` no será tratado como aplicación.
3. Supabase no será tratado como aplicación propietaria empresarial.
4. Una pantalla que muestra información no se vuelve propietaria de esa información.
5. La aplicación donde una persona copia un dato no necesariamente gobierna el hecho original.
6. Una aplicación externa como Rappi o Shopify no se convierte automáticamente en propietaria de la capacidad empresarial.
7. Una capacidad no se duplicará por sede, dispositivo o forma de recibir pedidos.
8. Si dos aplicaciones necesitan el mismo resultado, una lo gobernará y la otra lo consumirá.
9. Si una subcapacidad produce dos resultados independientes, se marcará `REQUIERE_DIVIDIR_RESULTADO`.
10. La propiedad candidata no concede permisos ni acceso.

---

#### 7. Regla de cobertura para las 217 subcapacidades

Cada subcapacidad heredará la candidatura de su familia, salvo que aparezca en el apartado 9.

```text
CANDIDATURA DE LA SUBCAPACIDAD
=
CANDIDATURA BASE DE SU FAMILIA
+
EXCEPCIÓN ESPECÍFICA, SI EXISTE
```

Esta regla cubre las 217 subcapacidades sin repetir filas idénticas y permite consultar la candidatura de cualquiera de ellas.

---

#### 8. Mapa base por familia

| Familia                                          | Grupo de trabajo empresarial         | Aplicación candidata base         | Estado                       | Frontera principal                                                                            |
| ------------------------------------------------ | ------------------------------------ | --------------------------------- | ---------------------------- | --------------------------------------------------------------------------------------------- |
| `CAP-01` Dirigir y gobernar                      | gobierno organizacional              | `viso`                            | `CANDIDATA_CON_FRONTERA`     | VISO administra estructura y controles; no reemplaza decisiones de Gerencia                   |
| `CAP-02` Gestionar personas y trabajo            | personas y contexto laboral          | `viso`                            | `CANDIDATA_CON_FRONTERA`     | ANIMA gobierna registros personales y operativos indicados en las excepciones                 |
| `CAP-03` Salud, seguridad y cumplimiento         | seguridad y cumplimiento laboral     | `viso`                            | `CANDIDATA_CON_FRONTERA`     | no convierte a VISO en sistema fiscal, sanitario o de autoridades externas                    |
| `CAP-04` Productos, preparaciones y conocimiento | catálogo y conocimiento de producto  | `nexo`                            | `CANDIDATA_CON_FRONTERA`     | recetas y ejecución productiva pertenecen a FOGO                                              |
| `CAP-05` Abastecer la operación                  | compras y proveedores                | `origo`                           | `CANDIDATA_FUERTE`           | NEXO gobierna existencias después de la recepción aceptada                                    |
| `CAP-06` Inventario y almacenamiento             | existencias y logística interna      | `nexo`                            | `CANDIDATA_FUERTE`           | no gobierna compras, producción ni contabilidad                                               |
| `CAP-07` Activos y reutilizables                 | activos, custodia y equipos          | `nexo`                            | `CANDIDATA_CON_FRONTERA`     | mantenimiento detallado y soporte tecnológico requieren excepciones                           |
| `CAP-08` Producción                              | planificación y ejecución productiva | `fogo`                            | `CANDIDATA_FUERTE`           | NEXO conserva existencias; FOGO gobierna orden, lote y resultado producido                    |
| `CAP-09` Pedidos, ventas y cobro                 | venta y atención operativa           | `pulso`                           | `CANDIDATA_FUERTE`           | las plataformas externas son medios de entrada, no propietarias internas                      |
| `CAP-10` Clientes y relaciones                   | servicio y relación con clientes     | `pulso`                           | `CANDIDATA_CON_FRONTERA`     | PASS gobierna acciones realizadas directamente por el cliente                                 |
| `CAP-11` Transporte, despacho y entrega          | logística y entrega                  | `nexo`                            | `REQUIERE_DIVIDIR_RESULTADO` | traslado interno pertenece a NEXO; entrega al cliente pertenece a PULSO                       |
| `CAP-12` Dinero, costos y obligaciones           | finanzas y control económico         | `numera`                          | `CANDIDATA_CON_FRONTERA`     | PULSO gobierna la operación de caja y el pago de la venta                                     |
| `CAP-13` Instalaciones y condiciones             | instalaciones y mantenimiento        | `nexo`                            | `CANDIDATA_CON_FRONTERA`     | NEXO gobernaría el activo y la novedad, no necesariamente toda ejecución técnica              |
| `CAP-14` Comunicación y promoción                | comunicación y mercadeo              | `aura`                            | `CANDIDATA_DIFERIDA`         | PULSO gobierna aplicación de promociones dentro de la venta                                   |
| `CAP-15` Tecnología y soporte                    | tecnología empresarial               | sin candidata única               | `REQUIERE_DIVIDIR_RESULTADO` | accesos, activos, aplicaciones y soporte tienen propietarios diferentes                       |
| `CAP-16` Información, documentos y evidencia     | gobierno de información              | aplicación del resultado original | `REQUIERE_DIVIDIR_RESULTADO` | cada documento permanece con la aplicación que gobierna el hecho respaldado                   |
| `CAP-17` Medición, análisis y mejora             | análisis empresarial                 | `numera`                          | `CANDIDATA_CON_FRONTERA`     | cada aplicación de origen conserva sus hechos; NUMERA no debe recrearlos                      |
| `CAP-18` Continuidad e incidentes                | continuidad empresarial              | aplicación afectada               | `REQUIERE_DIVIDIR_RESULTADO` | SHELL coordina acceso y navegación, pero no se apropia de los datos de todas las aplicaciones |

---

#### 9. Excepciones específicas

##### 9.1. Gobierno y personas

| Subcapacidad              | Aplicación candidata   | Estado                   | Razón o frontera                                                                                     |
| ------------------------- | ---------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `CAP-01.01` y `CAP-01.02` | `viso`                 | `CANDIDATA_CON_FRONTERA` | conserva objetivos y decisiones; la decisión sigue siendo humana                                     |
| `CAP-01.03` y `CAP-01.04` | `viso`                 | `CANDIDATA_FUERTE`       | VISO ya gobierna sedes, áreas y estructura laboral                                                   |
| `CAP-01.09`               | sin candidata adecuada | `PENDIENTE_DE_EVIDENCIA` | las relaciones con autoridades y asesores no tienen aplicación canónica confirmada                   |
| `CAP-02.01` a `CAP-02.06` | `viso`                 | `CANDIDATA_FUERTE`       | administración de personal, asignaciones y programación                                              |
| `CAP-02.07`               | `anima`                | `CANDIDATA_FUERTE`       | ANIMA gobierna entrada, salida y registro de asistencia                                              |
| `CAP-02.08` a `CAP-02.10` | `viso`                 | `CANDIDATA_CON_FRONTERA` | VISO administra la novedad y seguimiento; ANIMA puede ser superficie personal                        |
| `CAP-02.11`               | `anima`                | `CANDIDATA_CON_FRONTERA` | documentos personales del trabajador; los documentos administrativos se consultarán en `CAP-MAP-005` |
| `CAP-02.12`               | `numera`               | `PENDIENTE_DE_EVIDENCIA` | pagos y beneficios laborales requieren confirmar alcance real de NUMERA                              |
| `CAP-02.13`               | `viso`                 | `CANDIDATA_CON_FRONTERA` | VISO gobierna cierre laboral y permisos; cada aplicación ejecuta el cierre de sus accesos            |

##### 9.2. Cumplimiento, productos y compras

| Subcapacidad              | Aplicación candidata | Estado                       | Razón o frontera                                                                  |
| ------------------------- | -------------------- | ---------------------------- | --------------------------------------------------------------------------------- |
| `CAP-03.01` a `CAP-03.10` | `viso`               | `CANDIDATA_CON_FRONTERA`     | registro administrativo de riesgos, inspecciones y acciones                       |
| `CAP-04.01` a `CAP-04.04` | `nexo`               | `CANDIDATA_FUERTE`           | catálogo, presentación, clasificación, ingredientes y componentes                 |
| `CAP-04.05` y `CAP-04.06` | `fogo`               | `CANDIDATA_FUERTE`           | receta, método, rendimiento y porción productiva                                  |
| `CAP-04.07`               | `pulso`              | `CANDIDATA_CON_FRONTERA`     | PULSO gobierna oferta vendible y disponibilidad mostrada durante la venta         |
| `CAP-04.08` y `CAP-04.09` | `nexo`               | `CANDIDATA_CON_FRONTERA`     | especificación maestra; FOGO aplica controles durante producción                  |
| `CAP-04.10`               | `nexo`               | `REQUIERE_DIVIDIR_RESULTADO` | catálogo en NEXO y recetas en FOGO requieren vigencias coordinadas, no duplicadas |
| `CAP-05.01` a `CAP-05.12` | `origo`              | `CANDIDATA_FUERTE`           | ciclo completo de abastecimiento y proveedor                                      |

##### 9.3. Inventario, activos y producción

| Subcapacidad              | Aplicación candidata | Estado                   | Razón o frontera                                                            |
| ------------------------- | -------------------- | ------------------------ | --------------------------------------------------------------------------- |
| `CAP-06.01` a `CAP-06.15` | `nexo`               | `CANDIDATA_FUERTE`       | lugares, existencias, movimientos, remisiones, conteos y diferencias        |
| `CAP-07.01` a `CAP-07.06` | `nexo`               | `CANDIDATA_FUERTE`       | identificación, ubicación, custodia, transferencia y conteo                 |
| `CAP-07.07` a `CAP-07.10` | `nexo`               | `CANDIDATA_CON_FRONTERA` | NEXO gobierna activo, necesidad y estado; la reparación puede ser externa   |
| `CAP-07.11` a `CAP-07.13` | `nexo`               | `CANDIDATA_FUERTE`       | kits, vehículos, combustible, kilometraje y disponibilidad                  |
| `CAP-08.01` a `CAP-08.14` | `fogo`               | `CANDIDATA_FUERTE`       | necesidad, orden, lote, ejecución, rendimiento, calidad y cierre productivo |

##### 9.4. Ventas, clientes y entregas

| Subcapacidad              | Aplicación candidata           | Estado                       | Razón o frontera                                                                   |
| ------------------------- | ------------------------------ | ---------------------------- | ---------------------------------------------------------------------------------- |
| `CAP-09.01` a `CAP-09.15` | `pulso`                        | `CANDIDATA_FUERTE`           | oferta de venta, pedido, preparación comercial, cobro y cierre                     |
| `CAP-10.01` a `CAP-10.07` | `pulso`                        | `CANDIDATA_CON_FRONTERA`     | relación operacional con el cliente y beneficios asociados a ventas                |
| `CAP-10.08` y `CAP-10.09` | `pulso`                        | `CANDIDATA_FUERTE`           | reservas, eventos y comunicación que afecta pedidos vigentes                       |
| `CAP-10.10`               | `pass`                         | `REQUIERE_DIVIDIR_RESULTADO` | PASS protege identidad del cliente; PULSO protege datos usados en la venta         |
| `CAP-11.01` a `CAP-11.06` | `nexo`                         | `CANDIDATA_CON_FRONTERA`     | planificación, carga y custodia logística antes de entrega                         |
| `CAP-11.07` a `CAP-11.11` | `nexo` o `pulso` según destino | `REQUIERE_DIVIDIR_RESULTADO` | NEXO para recorrido entre lugares; PULSO para entrega asociada a pedido de cliente |
| `CAP-11.12`               | `pulso`                        | `CANDIDATA_CON_FRONTERA`     | PULSO conserva el pedido y resultado de entrega aunque intervenga un tercero       |

##### 9.5. Finanzas, instalaciones y mercadeo

| Subcapacidad              | Aplicación candidata | Estado                   | Razón o frontera                                                              |
| ------------------------- | -------------------- | ------------------------ | ----------------------------------------------------------------------------- |
| `CAP-12.01`               | `numera`             | `CANDIDATA_FUERTE`       | registro y clasificación del hecho económico                                  |
| `CAP-12.02`               | `pulso`              | `CANDIDATA_FUERTE`       | apertura, operación, arqueo y cierre de caja                                  |
| `CAP-12.03` a `CAP-12.15` | `numera`             | `CANDIDATA_CON_FRONTERA` | finanzas, obligaciones, conciliaciones, costos, cierres y rentabilidad        |
| `CAP-13.01` a `CAP-13.11` | `nexo`               | `CANDIDATA_CON_FRONTERA` | inventario de espacios, solicitudes, estado y cierre de novedades             |
| `CAP-14.01` a `CAP-14.05` | `aura`               | `CANDIDATA_DIFERIDA`     | identidad, contenido, medios y campañas; no habilita implementación inmediata |
| `CAP-14.06`               | `pulso`              | `CANDIDATA_CON_FRONTERA` | PULSO aplica cupón o promoción a la venta; AURA conserva intención de campaña |
| `CAP-14.07` a `CAP-14.11` | `aura`               | `CANDIDATA_DIFERIDA`     | oportunidades, ventas empresariales, eventos, medición y reputación           |

##### 9.6. Tecnología, información, análisis y continuidad

| Subcapacidad              | Aplicación candidata            | Estado                       | Razón o frontera                                                                                              |
| ------------------------- | ------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `CAP-15.01`               | `viso`                          | `CANDIDATA_FUERTE`           | VISO gobierna roles, permisos y accesos laborales                                                             |
| `CAP-15.02` a `CAP-15.04` | `nexo`                          | `CANDIDATA_CON_FRONTERA`     | inventario y ubicación de equipos; soporte y configuración no pertenecen automáticamente a NEXO               |
| `CAP-15.05`               | `shell`                         | `CANDIDATA_CON_FRONTERA`     | SHELL gobierna catálogo y navegación, no contratos ni funcionamiento interno de cada aplicación               |
| `CAP-15.06` a `CAP-15.09` | sin candidata adecuada          | `SIN_CANDIDATA_ADECUADA`     | solicitudes, incidentes, cambios y pruebas tecnológicas necesitan decisión posterior                          |
| `CAP-15.10`               | `numera`                        | `REQUIERE_DIVIDIR_RESULTADO` | NUMERA gobierna costo; contratos y licencias requieren soporte documental adicional                           |
| `CAP-15.11`               | `viso`                          | `PENDIENTE_DE_EVIDENCIA`     | capacitación administrativa candidata; debe confirmarse cómo se registra actualmente                          |
| `CAP-16.01` a `CAP-16.11` | aplicación del hecho respaldado | `REQUIERE_DIVIDIR_RESULTADO` | el documento de compra queda con ORIGO, el laboral con ANIMA/VISO, el productivo con FOGO y así sucesivamente |
| `CAP-17.01` a `CAP-17.04` | `numera`                        | `CANDIDATA_CON_FRONTERA`     | definición, recopilación validada, reporte y análisis transversal                                             |
| `CAP-17.05`               | `pulso` + `numera`              | `REQUIERE_DIVIDIR_RESULTADO` | PULSO gobierna ventas; NUMERA gobierna análisis consolidado                                                   |
| `CAP-17.06`               | `nexo` + `numera`               | `REQUIERE_DIVIDIR_RESULTADO` | NEXO gobierna existencias; NUMERA analiza efecto económico                                                    |
| `CAP-17.07`               | `fogo` + `numera`               | `REQUIERE_DIVIDIR_RESULTADO` | FOGO gobierna producción; NUMERA analiza costo y rendimiento consolidado                                      |
| `CAP-17.08`               | `pulso`                         | `CANDIDATA_CON_FRONTERA`     | servicio y clientes; NUMERA podrá consumir medidas consolidadas                                               |
| `CAP-17.09`               | `numera`                        | `CANDIDATA_FUERTE`           | costos y rentabilidad                                                                                         |
| `CAP-17.10` a `CAP-17.12` | `numera`                        | `CANDIDATA_CON_FRONTERA`     | seguimiento transversal sin apropiarse de los hechos operativos                                               |
| `CAP-18.01` a `CAP-18.12` | aplicación afectada             | `REQUIERE_DIVIDIR_RESULTADO` | cada aplicación recupera y reconcilia su información; SHELL solo coordina acceso cuando corresponda           |

---

#### 10. Qué significa `REQUIERE_DIVIDIR_RESULTADO`

No implica crear dos copias del mismo registro.

Ejemplos:

```text
Venta confirmada
→ PULSO gobierna pedido, pago y entrega

Ingreso y rentabilidad resultantes
→ NUMERA gobierna clasificación y análisis financiero
```

```text
Producción terminada
→ FOGO gobierna orden, lote y rendimiento

Existencia disponible
→ NEXO gobierna cantidad y ubicación después de recibir el resultado
```

La separación exacta de información y eventos se realizará en `CAP-MAP-007` a `CAP-MAP-009`.

---

#### 11. Registro mínimo de cada candidatura

| Campo                       | Contenido                                         |
| --------------------------- | ------------------------------------------------- |
| Código de subcapacidad      | identificador canónico                            |
| Grupo de trabajo            | resultado empresarial al que pertenece            |
| Aplicación candidata        | un código del catálogo o estado sin candidata     |
| Registro principal esperado | hecho que debería gobernar                        |
| Razón                       | por qué coincide con el propósito canónico        |
| Frontera                    | qué no debe gobernar                              |
| Estado                      | valor del apartado 4                              |
| Evidencia                   | documento, pantalla, observación o regla aprobada |
| Duda                        | pregunta puntual pendiente                        |
| Destino                     | tarea que resolverá la duda                       |

---

#### 12. Dudas que permanecen visibles

| Código         | Duda concreta                                                               | Quién puede responder                                   | Evidencia esperada                         | Destino                      |
| -------------- | --------------------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------ | ---------------------------- |
| `D-CAP004-001` | ¿Dónde se registra actualmente una decisión de Gerencia y dónde se corrige? | Gerencia o auxiliar administrativa                      | nombre del documento, carpeta o pantalla   | `CAP-MAP-005`, `CAP-MAP-008` |
| `D-CAP004-002` | ¿Dónde se calcula y conserva actualmente el pago laboral?                   | Contabilidad                                            | nombre del archivo, proveedor o aplicación | `CAP-MAP-005`, `CAP-MAP-008` |
| `D-CAP004-003` | ¿Dónde se guardan inspecciones y acciones de seguridad?                     | responsable SST o Gerencia                              | formato o ubicación usada                  | `CAP-MAP-005`                |
| `D-CAP004-004` | ¿Cómo se separa hoy un traslado entre sedes de una entrega al cliente?      | despachador, domiciliario o cajero                      | ejemplo de ambos registros                 | `CAP-MAP-007`, `CAP-MAP-009` |
| `D-CAP004-005` | ¿Dónde se recibe, asigna y cierra una solicitud de soporte tecnológico?     | persona que atiende soporte                             | nombre del chat, papel o herramienta       | `CAP-MAP-005`                |
| `D-CAP004-006` | ¿Quién puede corregir un documento cuando contiene un error?                | trabajador que crea el documento y responsable del área | ejemplo sin datos sensibles                | `CAP-MAP-006`                |
| `D-CAP004-007` | ¿Qué parte de AURA existe y se usa actualmente?                             | Gerencia o Mercadeo                                     | nombre de ruta, pantalla o tarea utilizada | auditoría de AURA            |
| `D-CAP004-008` | ¿Qué se hace en cada aplicación cuando deja de funcionar?                   | trabajador usuario de la aplicación                     | pasos observados durante una falla         | `CAP-MAP-015`                |

Estas dudas no se eliminan al aprobar la candidatura. Se conservan hasta obtener evidencia.

##### 12.1. Lista acumulada de preguntas dirigidas al usuario

Las dudas que requieran una decisión o confirmación directa del usuario se marcarán como `RESPONDE_USUARIO` durante `CAP-MAP-004` a `CAP-MAP-015`.

Al cerrar `CAP-MAP-015`, y antes de avanzar a la etapa siguiente, se entregará una sola lista consolidada con estas reglas:

1. cada número contendrá una sola duda;
2. cada duda admitirá una sola respuesta;
3. se indicará el formato esperado: `SÍ/NO`, una opción, un nombre, una fecha, un número o una frase corta;
4. no se mezclarán dos decisiones en la misma pregunta;
5. las preguntas para trabajadores, Contabilidad u otros responsables permanecerán en listas separadas;
6. ninguna pregunta respondida desaparecerá: respuesta, fecha y decisión resultante quedarán registradas en el plan.

---

#### 13. Autocuestionario para trabajadores

Se enviará un bloque separado por cada trabajo que la persona realice.

```text
CAP004-USO — [NOMBRE DEL TRABAJO]

Ejemplo del nombre del trabajo:
“Recibir una compra de proveedor” o “Cerrar la caja”.

Cuando haces este trabajo, ¿dónde escribes la información POR PRIMERA VEZ?

Marca UNA:
[ ] En ANIMA
[ ] En VISO
[ ] En NEXO
[ ] En FOGO
[ ] En ORIGO
[ ] En PULSO
[ ] En NUMERA
[ ] En AURA
[ ] En Vento Pass
[ ] En WhatsApp
[ ] En una hoja de cálculo
[ ] En papel
[ ] No escribo nada
[ ] En otro lugar
[ ] NO SÉ

Si marcaste “otro lugar”, escribe el nombre que ves:
________________________________

Si cometiste un error, ¿dónde lo corriges?
________________________________

¿En qué lugar miras para saber si el trabajo quedó terminado?
________________________________

Si debes copiar lo mismo en otro lugar, escribe dónde:
________________________________

Ejemplo:
“El pedido llega por WhatsApp, lo registro en PULSO y miro en PULSO si quedó pagado”.

No envíes nombres de clientes, contraseñas, números de tarjeta ni información
privada.
```

---

#### 14. Autocuestionario para responsable del área

```text
CAP004-CONTROL — [NOMBRE DEL RESULTADO]

Ejemplo:
“Compra recibida”, “lote terminado”, “venta pagada” o “turno trabajado”.

Para confirmar que [NOMBRE DEL RESULTADO] es correcto, ¿qué revisas?

Marca TODAS:
[ ] Una pantalla o aplicación
[ ] Un documento
[ ] Un mensaje
[ ] Una hoja de cálculo
[ ] Un papel
[ ] Pregunto a otra persona
[ ] No existe una revisión definida
[ ] NO SÉ

Nombre exacto de la pantalla, documento o archivo:
________________________________

Si está incorrecto, ¿quién solicita la corrección?
Escribe el cargo, no el nombre de la persona:
________________________________

¿Dónde se hace la corrección?
________________________________

¿Qué señal te permite saber que ya quedó corregido?
________________________________
```

---

#### 15. Regla para resolver contradicciones

Si dos personas indican aplicaciones distintas:

1. no se escogerá la respuesta del cargo más alto automáticamente;
2. se comparará dónde nace el registro;
3. se verificará dónde se corrige;
4. se comprobará cuál conserva el estado final;
5. se registrará si existe una copia manual;
6. se marcará la candidatura como `PENDIENTE_DE_EVIDENCIA` hasta reconciliarla.

La aplicación más visible no necesariamente será la propietaria.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades tienen una candidatura consultable mediante familia más excepción.
2. ORIGO es candidata principal para compras y proveedores.
3. NEXO es candidata principal para inventario, logística interna y activos.
4. FOGO es candidata principal para producción.
5. PULSO es candidata principal para pedidos, ventas, caja y entrega al cliente.
6. NUMERA es candidata principal para finanzas, costos y análisis económico.
7. VISO y ANIMA quedan separados entre administración laboral y registro personal u operativo.
8. AURA conserva la candidatura de mercadeo, pero permanece diferida.
9. PASS se limita a resultados gobernados directamente por la identidad o acción del cliente.
10. SHELL se limita a entrada, navegación y coordinación; no hereda todos los dominios.
11. Documentos, análisis y continuidad conservan propiedad por resultado y no por conveniencia.
12. Toda candidatura incierta mantiene una duda y una guía concreta para resolverla.
13. Esta tarea no cambia código, datos, permisos ni aplicaciones.

---

#### 17. Criterios de aceptación

`CAP-MAP-004` podrá aprobarse cuando:

- grupo de trabajo, aplicación, repositorio y aplicación consumidora estén separados;
- todas las subcapacidades tengan candidatura o estado explícito;
- las candidaturas respeten el catálogo canónico;
- SHELL y `vento-shell` no se confundan;
- las fronteras ANIMA/VISO, NEXO/FOGO, ORIGO/NEXO, PULSO/NUMERA y NEXO/PULSO estén documentadas;
- no se haya creado una aplicación nueva para ocultar una brecha;
- las candidaturas inciertas tengan una pregunta observable;
- `CAP-MAP-005` permanezca como única continuidad inmediata.

---

#### 18. Resultado y continuidad

Con la aprobación quedará una primera distribución de propiedad funcional para orientar la auditoría de sistemas y la remodelación, sin convertirla todavía en arquitectura definitiva.

La continuidad será exclusivamente:

```text
CAP-MAP-005
— Definir aplicaciones y sistemas consumidores
```

`CAP-MAP-005` identificará qué otras aplicaciones, plataformas, archivos o personas necesitan consultar o utilizar cada resultado sin duplicar su propiedad.


### ✅ CAP-MAP-005 — Definir aplicaciones y sistemas consumidores

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `CAP-MAP-001` a `CAP-MAP-004`
**Propósito:** identificar qué aplicaciones, plataformas o medios necesitan consultar o utilizar el resultado de cada capacidad sin duplicar su propiedad
**No define todavía:** responsables humanos, información exacta intercambiada, fuente de verdad, integraciones, permisos, funcionamiento sin conexión ni implementación

---

#### 1. Resultado de esta tarea

Cada una de las 217 subcapacidades quedará relacionada con:

1. su aplicación propietaria candidata definida en `CAP-MAP-004`;
2. las aplicaciones VENTO que necesitan utilizar su resultado;
3. las plataformas externas que intervienen;
4. los archivos, mensajes o papeles que actualmente actúan como medios auxiliares;
5. el motivo por el cual cada consumidor necesita el resultado;
6. el estado de certeza del vínculo;
7. una pregunta concreta cuando el consumidor actual no esté confirmado.

Esta tarea identifica necesidades de uso. No autoriza copias, accesos ni integraciones.

---

#### 2. Qué es un consumidor

Un consumidor es una aplicación, plataforma o medio que necesita un resultado producido y gobernado en otro lugar.

Ejemplos:

```text
ORIGO gobierna una compra recibida
→ NEXO necesita conocer qué producto fue aceptado para registrar existencias
→ NUMERA necesita conocer la obligación económica
```

```text
PULSO gobierna una venta
→ NEXO necesita conocer la salida de existencias
→ NUMERA necesita conocer el ingreso y el pago
```

Consumir no significa convertirse en propietario ni poder corregir directamente el registro original.

---

#### 3. Elementos que no son consumidores

No se registrarán como consumidores:

- una persona o cargo; se tratará en `CAP-MAP-006`;
- una tabla de base de datos;
- una biblioteca de código;
- un repositorio;
- Supabase por el solo hecho de almacenar información;
- una pantalla dentro de la misma aplicación propietaria;
- una copia de respaldo;
- una sede o área;
- un dispositivo;
- una impresión que solo reproduce información para consulta momentánea.

Un papel, archivo o chat sí se registrará cuando actualmente sea necesario para que otra parte del trabajo continúe.

---

#### 4. Tipos de consumidor

| Tipo                  | Significado                                                                             |
| --------------------- | --------------------------------------------------------------------------------------- |
| `VENTO_INTERNO`       | otra aplicación del catálogo VENTO                                                      |
| `EXTERNO_COMERCIAL`   | plataforma de pedidos, venta, mensajería o relación con clientes                        |
| `EXTERNO_EMPRESARIAL` | sistema de banco, autoridad, proveedor, asesor u otro tercero                           |
| `MEDIO_MANUAL`        | WhatsApp, hoja de cálculo, archivo, carpeta o papel utilizado para continuar el trabajo |
| `SIN_CONSUMIDOR`      | el resultado puede permanecer únicamente en su propietaria                              |
| `POR_CONFIRMAR`       | existe una necesidad probable, pero no hay evidencia suficiente                         |

---

#### 5. Estados del vínculo

| Estado                     | Significado                                                                   |
| -------------------------- | ----------------------------------------------------------------------------- |
| `CONFIRMADO_ACTUAL`        | existe evidencia de que el consumidor se usa hoy                              |
| `OBSERVADO_PARCIAL`        | se conoce el consumidor, pero no el alcance completo                          |
| `CANDIDATO_OBJETIVO`       | el consumidor se propone para el modelo futuro                                |
| `TEMPORAL_HASTA_REEMPLAZO` | medio actual que deberá conservarse durante una transición                    |
| `PENDIENTE_DE_EVIDENCIA`   | falta una respuesta u observación                                             |
| `NO_APLICA`                | no necesita consumir ese resultado                                            |
| `NO_AUTORIZADO_A_DUPLICAR` | puede consultar el resultado, pero no crear una segunda versión independiente |

Un mismo vínculo podrá tener estado actual y estado objetivo separados.

---

#### 6. Catálogo inicial de posibles consumidores

##### 6.1. Aplicaciones VENTO

| Código   | Aplicación |
| -------- | ---------- |
| `shell`  | Vento OS   |
| `anima`  | ANIMA      |
| `viso`   | VISO       |
| `nexo`   | NEXO       |
| `fogo`   | FOGO       |
| `origo`  | ORIGO      |
| `pulso`  | PULSO      |
| `numera` | NUMERA     |
| `aura`   | AURA       |
| `pass`   | Vento Pass |

##### 6.2. Plataformas y medios ya observados

| Código provisional | Nombre                                              | Clasificación                                                  |
| ------------------ | --------------------------------------------------- | -------------------------------------------------------------- |
| `EXT-RAPPI`        | Rappi                                               | plataforma externa de pedidos y entrega                        |
| `EXT-SHOPIFY`      | Shopify                                             | plataforma externa de comercio                                 |
| `EXT-MANYCHAT`     | ManyChat                                            | mensajería o automatización comercial                          |
| `MED-WHATSAPP`     | WhatsApp                                            | mensajería utilizada para solicitudes y coordinación           |
| `LEG-MAKOS`        | Makos                                               | sistema operativo actual mencionado en respuestas y documentos |
| `MED-HOJA`         | hoja de cálculo                                     | medio manual estructurado                                      |
| `MED-PAPEL`        | papel, comanda o formato impreso                    | medio manual físico                                            |
| `MED-ARCHIVO`      | archivo o carpeta compartida                        | medio documental                                               |
| `EXT-BANCO`        | banco o portal bancario por identificar             | sistema empresarial externo                                    |
| `EXT-AUTORIDAD`    | portal o medio de una autoridad por identificar     | sistema empresarial externo                                    |
| `EXT-PROVEEDOR`    | portal, correo o medio de proveedor por identificar | sistema empresarial externo                                    |

La presencia en esta lista no demuestra uso activo. Cada vínculo necesita su propio estado.

---

#### 7. Regla de consumo mínimo

Un consumidor solo deberá recibir lo necesario para continuar su propio trabajo.

Para cada vínculo deberá responderse:

1. ¿Qué resultado necesita?
2. ¿Para qué lo necesita?
3. ¿Necesita verlo o actuar a partir de él?
4. ¿Debe conocer cambios posteriores?
5. ¿Qué ocurriría si no lo recibe?
6. ¿Puede consultar el original o necesita una copia controlada?

Los campos exactos se definirán en `CAP-MAP-007` y las comunicaciones en `CAP-MAP-009`.

---

#### 8. Regla de cobertura de las 217 subcapacidades

Cada subcapacidad heredará los consumidores base de su familia, salvo que aparezca en el apartado 10.

```text
CONSUMIDORES DE LA SUBCAPACIDAD
=
CONSUMIDORES BASE DE LA FAMILIA
+
EXCEPCIONES ESPECÍFICAS
```

Un consumidor base no recibirá automáticamente todos los datos de la familia. Solo declara una necesidad empresarial que deberá detallarse posteriormente.

---

#### 9. Mapa base por familia

| Familia                           | Propietaria candidata           | Consumidores VENTO candidatos                                                            | Externos o medios por confirmar                      | Motivo principal                                             |
| --------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------ |
| `CAP-01` Gobierno                 | `viso`                          | `shell` y aplicaciones afectadas por la regla                                            | documentos, archivos o actas actuales                | aplicar estructura, decisiones y límites vigentes            |
| `CAP-02` Personas                 | `viso` / `anima`                | aplicaciones que requieren contexto laboral: `nexo`, `fogo`, `origo`, `pulso` y `numera` | archivos laborales actuales                          | conocer vinculación, sede, área, turno o novedad necesaria   |
| `CAP-03` Seguridad y cumplimiento | `viso`                          | `anima` y aplicación del área afectada                                                   | formatos, documentos y portales de autoridad         | prevenir, reportar y demostrar cumplimiento                  |
| `CAP-04` Productos y conocimiento | `nexo` / `fogo` / `pulso`       | `origo`, `nexo`, `fogo`, `pulso`, `aura` y `pass` cuando aplique                         | Rappi, Shopify, ManyChat y Makos                     | comprar, producir, ofrecer y vender el mismo producto        |
| `CAP-05` Compras                  | `origo`                         | `nexo` y `numera`; `fogo` cuando la necesidad nazca de producción                        | proveedor, WhatsApp, hoja o documento                | recibir existencias y reconocer obligación económica         |
| `CAP-06` Inventario               | `nexo`                          | `origo`, `fogo`, `pulso` y `numera`                                                      | Makos, hojas, papel o WhatsApp actuales              | conocer disponibilidad, consumo, traslado y valor            |
| `CAP-07` Activos                  | `nexo`                          | `viso` y `numera`                                                                        | archivos, hojas y proveedores de mantenimiento       | conocer custodia, disponibilidad, costo y condición          |
| `CAP-08` Producción               | `fogo`                          | `nexo`, `pulso` y `numera`                                                               | hojas, papel y WhatsApp actuales                     | actualizar existencias, disponibilidad de venta y costo      |
| `CAP-09` Ventas                   | `pulso`                         | `nexo`, `fogo`, `numera`, `aura` y `pass` cuando aplique                                 | Rappi, Shopify, ManyChat, WhatsApp y Makos           | preparar, descontar existencias, cobrar, entregar y analizar |
| `CAP-10` Clientes                 | `pulso` / `pass`                | `aura` y aplicaciones que atiendan una solicitud autorizada                              | Rappi, Shopify, ManyChat y WhatsApp                  | atender, comunicar y conservar preferencias autorizadas      |
| `CAP-11` Entregas                 | `nexo` / `pulso`                | `numera` y la aplicación propietaria del pedido o traslado                               | Rappi, mensajería y WhatsApp                         | confirmar custodia, recepción, devolución y costo            |
| `CAP-12` Finanzas                 | `numera` / `pulso`              | `viso` y aplicaciones que deban conocer aprobación o conciliación                        | bancos, autoridades, hojas y archivos                | pagar, conciliar, controlar costos y reportar                |
| `CAP-13` Instalaciones            | `nexo`                          | `viso` y `numera`                                                                        | proveedores, WhatsApp, hojas y formatos              | atender riesgos, reparaciones, servicios y costos            |
| `CAP-14` Mercadeo                 | `aura` / `pulso`                | `pass`, `pulso` y `numera` para resultados autorizados                                   | Rappi, Shopify, ManyChat, WhatsApp y medios públicos | publicar, aplicar promoción y medir resultado                |
| `CAP-15` Tecnología               | propietaria según resultado     | `shell`, `viso`, `nexo` y aplicación afectada                                            | WhatsApp, hojas, archivos y proveedores              | administrar acceso, activo, solicitud, falla o cambio        |
| `CAP-16` Información              | aplicación del hecho respaldado | consumidores autorizados del mismo hecho                                                 | archivos, carpetas, correo, papel y autoridades      | conservar, localizar y compartir evidencia necesaria         |
| `CAP-17` Análisis                 | `numera` y aplicación del hecho | `viso`, `aura` y aplicación del área evaluada                                            | hojas y reportes actuales                            | convertir hechos confiables en decisiones y mejoras          |
| `CAP-18` Continuidad              | aplicación afectada             | `shell` y aplicaciones dependientes                                                      | WhatsApp, papel, hojas y respaldos autorizados       | operar durante una falla y reconciliar lo ocurrido           |

---

#### 10. Excepciones y fronteras específicas

##### 10.1. Personas y contexto laboral

| Subcapacidades            | Consumidor                                 | Necesidad                                         | Frontera                                                  |
| ------------------------- | ------------------------------------------ | ------------------------------------------------- | --------------------------------------------------------- |
| `CAP-02.05` y `CAP-02.06` | `anima`                                    | mostrar asignación y turno al trabajador          | ANIMA no redefine la asignación aprobada en VISO          |
| `CAP-02.07`               | `viso`                                     | revisar asistencia y novedades                    | VISO consulta o administra; no crea una segunda marcación |
| `CAP-02.07` y `CAP-02.08` | aplicaciones operativas                    | comprobar contexto laboral cuando sea obligatorio | no reciben historia laboral completa                      |
| `CAP-02.12`               | `numera`                                   | calcular o registrar efecto económico laboral     | alcance actual `PENDIENTE_DE_EVIDENCIA`                   |
| `CAP-02.13`               | todas las aplicaciones laborales afectadas | cerrar accesos correspondientes                   | cada aplicación conserva su autorización interna          |

##### 10.2. Producto, compra, inventario y producción

| Subcapacidades            | Consumidor                                       | Necesidad                                                                 | Frontera                                      |
| ------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------- | --------------------------------------------- |
| `CAP-04.01` a `CAP-04.04` | `origo`, `fogo` y `pulso`                        | usar identificación, presentación y componentes coherentes                | no crean catálogos independientes             |
| `CAP-04.05` y `CAP-04.06` | `nexo` y `numera`                                | conocer componentes, rendimiento y efecto sobre existencias o costo       | no modifican la receta                        |
| `CAP-04.07`               | Rappi, Shopify, ManyChat y otros medios de venta | mostrar oferta disponible                                                 | reciben solo oferta autorizada para ese medio |
| `CAP-05.07` a `CAP-05.10` | `nexo`                                           | preparar y registrar recepción aceptada                                   | NEXO no aprueba ni corrige la compra          |
| `CAP-05.08` a `CAP-05.12` | `numera`                                         | reconocer obligación, diferencia o devolución                             | NUMERA no altera cantidades recibidas         |
| `CAP-06.05`               | `origo`, `fogo` y `pulso`                        | consultar disponibilidad necesaria para comprar, producir o vender        | consulta no equivale a reserva                |
| `CAP-06.07` a `CAP-06.11` | `fogo`, `pulso` o `numera` según origen          | conocer consumo, salida o traslado confirmado                             | no recrean el movimiento                      |
| `CAP-08.08` a `CAP-08.14` | `nexo`                                           | recibir cantidad liberada, consumos y diferencias que afectan existencias | NEXO no modifica el lote productivo           |
| `CAP-08.09` y `CAP-08.14` | `numera`                                         | calcular costo y rendimiento consolidado                                  | NUMERA no sustituye el cierre productivo      |

##### 10.3. Venta, cliente y entrega

| Subcapacidades            | Consumidor                                             | Necesidad                                                            | Frontera                                                 |
| ------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------- | -------------------------------------------------------- |
| `CAP-09.02` a `CAP-09.05` | Rappi, Shopify, ManyChat o WhatsApp cuando sean origen | enviar solicitud y recibir confirmación correspondiente              | la plataforma externa no crea una venta interna paralela |
| `CAP-09.06` y `CAP-09.07` | `fogo` o pantalla de preparación que se confirme       | conocer qué debe prepararse y su prioridad                           | no cobra ni modifica condiciones comerciales             |
| `CAP-09.08` y `CAP-09.09` | `numera`                                               | reconocer venta, ingreso y pago confirmados                          | NUMERA no reabre la caja                                 |
| `CAP-09.08`               | `nexo`                                                 | registrar efecto confirmado sobre existencias                        | no recrea el pedido                                      |
| `CAP-09.13`               | Rappi, Shopify, ManyChat y WhatsApp                    | intercambiar estados necesarios del pedido                           | cada medio se valida separadamente                       |
| `CAP-09.14`               | `aura` y `numera`                                      | seguimiento comercial y económico de empresa, evento o catering      | no administran la ejecución del pedido                   |
| `CAP-10.01` y `CAP-10.02` | `pass`                                                 | permitir al cliente administrar información y autorizaciones propias | no expone notas internas ni datos laborales              |
| `CAP-10.03` a `CAP-10.09` | medio por el cual llegó la solicitud                   | responder por el mismo medio cuando sea necesario                    | la respuesta oficial permanece asociada al caso interno  |
| `CAP-11.07` a `CAP-11.12` | aplicación propietaria del pedido o traslado           | conocer estado, recepción y novedad                                  | no cambia la custodia sin confirmación                   |
| `CAP-11.12`               | Rappi u otro tercero                                   | recibir datos mínimos de entrega y devolver resultado                | no recibe información financiera o personal innecesaria  |

##### 10.4. Finanzas, mercadeo y análisis

| Subcapacidades            | Consumidor                                           | Necesidad                                                   | Frontera                                                 |
| ------------------------- | ---------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| `CAP-12.02`               | `numera`                                             | conocer cierres y diferencias confirmadas de caja           | no opera la caja                                         |
| `CAP-12.04` y `CAP-12.05` | banco, proveedor o cliente cuando corresponda        | emitir o recibir pago y confirmación                        | intercambio externo sujeto a autorización posterior      |
| `CAP-12.07`               | `pulso` y medios de venta                            | resolver diferencias entre pedido, venta, pago y entrega    | la conciliación no reescribe el pedido sin procedimiento |
| `CAP-12.08`               | `origo` y `nexo`                                     | resolver diferencias entre compra, recepción y obligación   | NUMERA conserva la conciliación económica                |
| `CAP-12.13`               | autoridad aplicable                                  | presentar información obligatoria                           | contenido y método pendientes de evidencia               |
| `CAP-14.03` a `CAP-14.06` | Rappi, Shopify, ManyChat, WhatsApp y medios públicos | publicar contenido o aplicar promoción                      | solo reciben versión aprobada y vigente                  |
| `CAP-14.10`               | `numera` y `pulso`                                   | comparar gasto, ventas y resultado promocional              | AURA no recrea ventas ni costos                          |
| `CAP-17.05` a `CAP-17.09` | `numera`                                             | consolidar hechos de PULSO, NEXO, FOGO y otras propietarias | conserva referencia al hecho original                    |

##### 10.5. Tecnología, documentos y continuidad

| Subcapacidades            | Consumidor                                           | Necesidad                                 | Frontera                                              |
| ------------------------- | ---------------------------------------------------- | ----------------------------------------- | ----------------------------------------------------- |
| `CAP-15.01`               | cada aplicación laboral                              | aplicar accesos aprobados                 | la aplicación conserva sus controles internos         |
| `CAP-15.02` a `CAP-15.04` | aplicación o trabajador que usa el equipo            | conocer disponibilidad y novedad          | no obtiene propiedad del activo                       |
| `CAP-15.05`               | `shell`                                              | mostrar catálogo, disponibilidad y acceso | SHELL no administra funciones internas                |
| `CAP-15.06` a `CAP-15.09` | aplicación afectada y medio de soporte por confirmar | reportar, atender, probar y cerrar        | no existe consumidor canónico confirmado              |
| `CAP-16.01` a `CAP-16.11` | consumidor autorizado del hecho original             | consultar o aportar evidencia necesaria   | no se crea un archivo maestro paralelo sin control    |
| `CAP-18.03` a `CAP-18.05` | `shell` cuando afecte acceso al ecosistema           | informar indisponibilidad y alternativa   | SHELL no reconcilia datos internos de otra aplicación |
| `CAP-18.06` a `CAP-18.11` | aplicaciones dependientes del resultado recuperado   | reanudar y comprobar continuidad          | cada propietaria valida su propia información         |

---

#### 11. Relación actual frente a relación objetivo

Cada vínculo se registrará en dos columnas:

| Columna             | Pregunta                                                                     |
| ------------------- | ---------------------------------------------------------------------------- |
| Consumidor actual   | ¿Qué aplicación, plataforma, archivo, chat o papel utiliza hoy el resultado? |
| Consumidor objetivo | ¿Qué aplicación debería utilizarlo cuando se remodele el flujo?              |

No se eliminará un consumidor actual hasta demostrar:

1. que su función fue reemplazada;
2. que la información histórica necesaria fue conservada;
3. que los usuarios pueden continuar trabajando;
4. que las excepciones tienen tratamiento;
5. que existe reversión o alternativa proporcional al riesgo.

---

#### 12. Registro mínimo de cada vínculo consumidor

| Campo                 | Contenido                                  |
| --------------------- | ------------------------------------------ |
| Subcapacidad          | código canónico                            |
| Propietaria candidata | aplicación de `CAP-MAP-004`                |
| Consumidor            | aplicación, plataforma o medio             |
| Tipo                  | valor del apartado 4                       |
| Uso esperado          | acción empresarial que necesita realizar   |
| Resultado requerido   | descripción sin definir todavía campos     |
| Estado actual         | valor del apartado 5                       |
| Estado objetivo       | valor del apartado 5                       |
| Evidencia             | pantalla, mensaje, documento u observación |
| Riesgo si no recibe   | efecto operativo concreto                  |
| Riesgo de duplicación | qué versión paralela podría producirse     |
| Duda                  | pregunta única pendiente                   |
| Destino               | tarea posterior                            |

---

#### 13. Dudas operativas pendientes

| Código         | Pregunta única                                                           | Quién puede responder                         | Respuesta esperada                     | Destino       |
| -------------- | ------------------------------------------------------------------------ | --------------------------------------------- | -------------------------------------- | ------------- |
| `D-CAP005-001` | ¿En qué aplicación se registra hoy por primera vez una venta presencial? | cajero                                        | un nombre                              | `CAP-MAP-008` |
| `D-CAP005-002` | ¿En qué aplicación se registra hoy por primera vez una compra?           | responsable de compras                        | un nombre                              | `CAP-MAP-008` |
| `D-CAP005-003` | ¿Dónde consulta cocina los pedidos pendientes?                           | cocinero o responsable                        | un nombre de pantalla, papel o medio   | `CAP-MAP-007` |
| `D-CAP005-004` | ¿Dónde consulta producción lo que debe fabricar?                         | responsable de producción                     | un nombre de pantalla, archivo o medio | `CAP-MAP-007` |
| `D-CAP005-005` | ¿Dónde se consulta actualmente el saldo de inventario?                   | responsable de bodega o sede                  | un nombre                              | `CAP-MAP-008` |
| `D-CAP005-006` | ¿Qué medio se usa actualmente para reportar una falla tecnológica?       | cualquier trabajador usuario                  | una opción                             | `CAP-MAP-015` |
| `D-CAP005-007` | ¿Qué aplicación recibe el cierre de caja para conciliación?              | cajero o Contabilidad                         | un nombre o `NINGUNA`                  | `CAP-MAP-008` |
| `D-CAP005-008` | ¿Dónde se consulta el estado de una entrega al cliente?                  | cajero, responsable de pedidos o domiciliario | un nombre                              | `CAP-MAP-007` |

---

#### 14. Decisiones ya resueltas que no deben volver a preguntarse

| Asunto   | Decisión o hecho vigente                                                                                                          | Estado                             | Evidencia canónica                                      |
| -------- | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- | ------------------------------------------------------- |
| Makos    | es un sistema operativo actual y se tratará como solución temporal hasta que PULSO cubra, valide y migre el flujo correspondiente | `RESUELTA_POR_EVIDENCIA_Y_ROADMAP` | auditoría E1, contrato temporal Makos y `INT-SALES-002` |
| Shopify  | recibe los pedidos principales de Vaila Vainilla y se conservará durante la transición hasta que exista reemplazo validado        | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de Vaila Vainilla                          |
| Rappi    | recibe pedidos de Vento Café y Saudo y se conservará durante la transición hasta que exista reemplazo validado                    | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de pedidos Rappi                           |
| ManyChat | recibe pedidos directos y domicilios de Vento Café y se conservará durante la transición hasta que exista reemplazo validado      | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de pedidos directos                        |
| WhatsApp | funciona como medio operativo informal y se conservará únicamente mientras sus funciones no hayan sido reemplazadas y verificadas | `RESUELTA_POR_EVIDENCIA`           | auditoría E1 de operación real                          |
| AURA     | permanece en el catálogo, asociada al trabajo administrativo de mercadeo y diferida en el roadmap                                 | `RESUELTA_POR_DECISION_CANONICA`   | catálogo canónico y BLOQUE W                            |

`CAP-MAP-005` no genera preguntas `RESPONDE_USUARIO`.

##### 14.1. Puerta obligatoria antes de preguntar al usuario

Una duda solo podrá marcarse `RESPONDE_USUARIO` después de comprobar, en este orden:

1. si ya fue respondida por el usuario;
2. si una tarea aprobada contiene la respuesta;
3. si una auditoría, documento, artefacto, código o configuración aporta evidencia suficiente;
4. si una decisión canónica previa permite resolverla;
5. si la respuesta puede obtenerse de un trabajador o responsable funcional;
6. si realmente requiere una decisión exclusiva del usuario.

Si existe respuesta suficiente, se registrará como hecho o decisión con su evidencia y no se volverá a preguntar.

La lista final excluirá:

- preguntas repetidas;
- preguntas cuya respuesta pueda inferirse de una decisión aprobada;
- preguntas técnicas comprobables mediante inspección;
- preguntas que deba contestar otro responsable;
- preguntas que no cambien ninguna decisión.

---

#### 15. Autocuestionario para identificar consumidores actuales

Se enviará un bloque por cada resultado que el trabajador reciba de otra persona o sistema.

```text
CAP005-RECIBO — [NOMBRE DEL RESULTADO]

Ejemplos:
“Pedido confirmado”, “compra recibida” o “turno asignado”.

¿Dónde ves [NOMBRE DEL RESULTADO] para poder continuar tu trabajo?

Marca UNA:
[ ] ANIMA
[ ] VISO
[ ] NEXO
[ ] FOGO
[ ] ORIGO
[ ] PULSO
[ ] NUMERA
[ ] AURA
[ ] Vento Pass
[ ] Makos
[ ] Rappi
[ ] Shopify
[ ] ManyChat
[ ] WhatsApp
[ ] Hoja de cálculo
[ ] Papel
[ ] Otra
[ ] No lo recibo
[ ] NO SÉ

Si marcaste “otra”, escribe el nombre:
________________________________

¿Qué haces después de verlo?
Marca UNA:
[ ] Preparo algo
[ ] Entrego algo
[ ] Registro información
[ ] Cobro o pago
[ ] Reviso y apruebo
[ ] Corrijo una diferencia
[ ] Solo lo consulto
[ ] Otra acción

Si marcaste “otra acción”, escribe una frase:
________________________________

Si no recibes esa información, ¿puedes terminar el trabajo?
[ ] Sí
[ ] No
[ ] Algunas veces
[ ] NO SÉ

No envíes contraseñas, nombres de clientes, datos bancarios ni información
privada.
```

---

#### 16. Regla para copias manuales

Cuando una persona copie información entre dos lugares, se registrará:

1. dónde apareció primero;
2. dónde se volvió a escribir;
3. quién necesita la copia, sin asignar todavía responsabilidad formal;
4. qué permite hacer la copia;
5. qué ocurre si se omite;
6. cómo se detecta una diferencia;
7. si la copia debe conservarse temporalmente durante la remodelación.

La copia manual será evidencia de una necesidad de consumo, no prueba de que ambos lugares sean propietarios.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades tienen consumidores consultables mediante familia más excepción.
2. Propietaria, consumidora, plataforma externa y medio manual permanecen separados.
3. Las plataformas externas no se convertirán en propietarias internas.
4. Los consumidores recibirán únicamente el resultado necesario.
5. Las relaciones actuales y objetivo se documentarán por separado.
6. Makos, WhatsApp, hojas y papel podrán conservarse temporalmente hasta validar su reemplazo.
7. No se eliminará un medio actual únicamente porque exista una aplicación futura.
8. Las copias manuales se registrarán como brechas o transiciones.
9. Los actores humanos se definirán en `CAP-MAP-006`.
10. La información exacta y su fuente de verdad se definirán en `CAP-MAP-007` y `CAP-MAP-008`.
11. Solo las dudas no resueltas después de agotar evidencia podrán acumularse bajo `RESPONDE_USUARIO`.
12. Esta tarea no crea integraciones, accesos ni cambios de sistema.

---

#### 18. Criterios de aceptación

`CAP-MAP-005` podrá aprobarse cuando:

- todas las subcapacidades tengan una regla de consumidores;
- aplicación propietaria y consumidora estén separadas;
- sistemas actuales, futuros, externos y manuales tengan estados distintos;
- se documenten las relaciones principales entre compras, inventario, producción, ventas y finanzas;
- las copias manuales no se confundan con fuentes definitivas;
- las plataformas externas no reciban información innecesaria;
- las dudas operativas indiquen quién puede responderlas sin conocimientos técnicos;
- no se repitan preguntas ya resueltas por auditorías, decisiones, código, configuración o respuestas anteriores;
- toda eventual pregunta reservada para el usuario haya superado la puerta de deduplicación y tenga una sola respuesta esperada;
- `CAP-MAP-006` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Con la aprobación quedará definido quién necesita utilizar cada resultado empresarial, sin decidir todavía quién realiza, supervisa o aprueba el trabajo.

La continuidad será exclusivamente:

```text
CAP-MAP-006
— Identificar actor iniciador, ejecutor, supervisor y aprobador
```

`CAP-MAP-006` identificará funciones humanas y responsabilidades observadas o candidatas sin confundir persona, cargo, rol operativo o permiso.

### ✅ CAP-MAP-006 — Identificar actor iniciador, ejecutor, supervisor y aprobador

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencias cumplidas:** `CAP-MAP-001` a `CAP-MAP-005`
**Propósito:** identificar qué función humana, tercero, sistema o evento inicia, ejecuta, supervisa y aprueba cada capacidad
**No define todavía:** personas asignadas permanentemente, cargos objetivo, permisos, montos de aprobación, reglas técnicas, información intercambiada ni implementación

---

#### 1. Resultado de esta tarea

Cada una de las 217 subcapacidades quedará relacionada con:

1. quién o qué origina la necesidad;
2. quién realiza materialmente el trabajo;
3. quién revisa el estado o resultado;
4. quién autoriza la decisión cuando realmente se necesita autorización;
5. el estado actual de cada responsabilidad;
6. las funciones temporales, rotativas, compartidas o vacantes;
7. la pregunta específica que permita resolver una responsabilidad todavía no confirmada.

La asignación se realizará por función, no por nombre de una persona.

---

#### 2. Cuatro participaciones obligatorias

| Código | Participación | Pregunta que responde                                                         |
| ------ | ------------- | ----------------------------------------------------------------------------- |
| `INI`  | iniciador     | ¿Quién o qué hace que el trabajo deba comenzar?                               |
| `EJE`  | ejecutor      | ¿Quién realiza el trabajo o registra el resultado?                            |
| `SUP`  | supervisor    | ¿Quién revisa que el trabajo ocurra correctamente?                            |
| `APR`  | aprobador     | ¿Quién autoriza una decisión, gasto, excepción, corrección o efecto sensible? |

Cada subcapacidad tendrá los cuatro campos, aunque alguno contenga:

- `NO_REQUIERE_APROBACIÓN`;
- `NO_REQUIERE_SUPERVISIÓN_SEPARADA`;
- `PROCESO_AUTOMÁTICO`;
- `POR_IDENTIFICAR`;
- `FUTURA_SIN_ACTOR`.

No se inventará un aprobador únicamente para llenar una casilla.

---

#### 3. Participaciones adicionales que no deben perderse

Aunque el mapa principal utilice cuatro campos, también se conservarán cuando sean relevantes:

| Código | Participación                                           |
| ------ | ------------------------------------------------------- |
| `DPR`  | responde por el resultado general                       |
| `REV`  | comprueba cantidades, documentos o resultado            |
| `CUS`  | custodia dinero, bienes, documentos o accesos           |
| `REG`  | incorpora la operación a un sistema o soporte           |
| `REC`  | recibe el resultado o continúa el trabajo               |
| `COR`  | modifica, ajusta o revierte                             |
| `ESC`  | resuelve situaciones fuera de la autoridad ordinaria    |
| `AUD`  | revisa posteriormente mediante conciliación o auditoría |
| `EXT`  | participa como cliente, proveedor, técnico o tercero    |
| `SYS`  | aplicación o servicio que ejecuta una función técnica   |

Ejecutar, aprobar, custodiar, registrar y corregir no significan lo mismo.

---

#### 4. Estados de responsabilidad

| Estado             | Significado                                                       |
| ------------------ | ----------------------------------------------------------------- |
| `CONFIRMADA`       | la responsabilidad se conoce con evidencia suficiente             |
| `PROVISIONAL`      | existe una identificación inicial que debe contrastarse           |
| `TEMPORAL`         | una persona o función cubre transitoriamente otra responsabilidad |
| `ROTATIVA`         | cambia según turno, sede, área o disponibilidad                   |
| `COMPARTIDA`       | participan varias funciones sin un único ejecutor                 |
| `VACANTE`          | la responsabilidad existe, pero no tiene titular habitual         |
| `IMPLÍCITA`        | se ejerce por costumbre sin declaración formal                    |
| `POR_IDENTIFICAR`  | la evidencia actual no permite determinarla                       |
| `FUTURA_SIN_ACTOR` | la capacidad todavía no opera                                     |

Los estados AS-IS no se presentarán como diseño objetivo.

---

#### 5. Familias de actores ya confirmadas por la auditoría

| Código | Función reconocible                                    |
| ------ | ------------------------------------------------------ |
| `F01`  | gobierno y propiedad                                   |
| `F02`  | Gerencia General                                       |
| `F03`  | gerencia o supervisión de sede                         |
| `F04`  | coordinación de operaciones                            |
| `F05`  | administración y Contabilidad                          |
| `F06`  | marketing, comercial y atención de medios de venta     |
| `F07`  | caja, mostrador y venta directa                        |
| `F08`  | servicio de salón y mesas                              |
| `F09`  | operación integral de sede pequeña                     |
| `F10`  | producción especializada                               |
| `F11`  | bodega y abastecimiento                                |
| `F12`  | logística y transporte                                 |
| `F13`  | recepción en sede                                      |
| `F14`  | servicios generales                                    |
| `F15`  | custodia de activos y puntos externos                  |
| `F16`  | responsable de operación asociada, como Vaila Vainilla |
| `F17`  | proveedores, técnicos y prestadores externos           |
| `F18`  | clientes y empresas compradoras                        |
| `F19`  | plataformas, aplicaciones y medios                     |
| `F20`  | apoyo rotativo o sustitución temporal                  |
| `F21`  | proceso autónomo de un sistema                         |

Estas familias describen funciones observadas. No equivalen automáticamente a cargos, permisos ni cuentas de usuario.

---

#### 6. Reglas obligatorias

1. Se registrará la función y no el nombre de la persona.
2. Cuando una persona cubra varias funciones, cada función se registrará por separado.
3. Una cobertura temporal no se convertirá en responsabilidad permanente.
4. Una responsabilidad vacante no desaparecerá del mapa.
5. Un sistema puede iniciar o ejecutar una operación técnica, pero no asumir responsabilidad empresarial humana.
6. Un cliente o proveedor puede iniciar un proceso sin convertirse en dueño del proceso interno.
7. Realizar una acción no implica poder aprobarla o corregirla.
8. Supervisar no implica tener permiso para modificar.
9. Las acciones ordinarias podrán usar `NO_REQUIERE_APROBACIÓN`.
10. Descuentos, anulaciones, pagos, ajustes, bajas, contrataciones y excepciones deberán revisar si necesitan aprobación separada.
11. La concentración de iniciación, ejecución, aprobación y custodia se registrará como hallazgo.
12. Esta tarea documenta AS-IS y formula candidaturas; no concede autoridad.

---

#### 7. Regla de cobertura de las 217 subcapacidades

Cada subcapacidad heredará los actores base de su familia, salvo que aparezca en el apartado 9.

```text
ACTORES DE LA SUBCAPACIDAD
=
ACTORES BASE DE LA FAMILIA
+
EXCEPCIÓN ESPECÍFICA
```

Las excepciones reemplazan únicamente el campo indicado. Los demás campos continúan heredados.

---

#### 8. Mapa base por familia

| Familia                           | `INI` iniciador                                      | `EJE` ejecutor                                       | `SUP` supervisor                                  | `APR` aprobador                                                      |
| --------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------- | -------------------------------------------------------------------- |
| `CAP-01` Gobierno                 | F01 o F02                                            | F01, F02 o F05                                       | F01                                               | F01 cuando la decisión sea reservada                                 |
| `CAP-02` Personas                 | F02, F03 o trabajador según caso                     | F05, F02, F03 o trabajador                           | F02 y F03                                         | F02; F01 en decisiones reservadas                                    |
| `CAP-03` Seguridad y cumplimiento | trabajador, F03, F04, F14 u obligación externa       | responsable del área, F03, F04, F05 o F14            | F02, F03 o responsable designado                  | F02; F01 cuando corresponda a política o riesgo mayor                |
| `CAP-04` Productos y conocimiento | F06, F07, F10, F11, F16 o F02                        | responsable de catálogo, F10 o responsable comercial | F04, F06 o F02                                    | F02 o responsable autorizado del frente                              |
| `CAP-05` Compras                  | área solicitante, F10, F11, F03 o F04                | F02, F04 o F05 según compra                          | F02                                               | F02 según evidencia actual                                           |
| `CAP-06` Inventario               | área que necesita entrada, salida, traslado o conteo | F11; actualmente también F04, F10, F13 o F20         | F04 y responsable del lugar                       | no requiere en movimientos ordinarios; excepciones `POR_IDENTIFICAR` |
| `CAP-07` Activos                  | usuario, custodio, F03, F04 o F15                    | F04, F15, custodio o F17                             | F02, F03 o F04                                    | F02 para compra, baja, venta o disposición                           |
| `CAP-08` Producción               | necesidad de sede, plan, stock o F04                 | F10 y apoyos F20                                     | responsable productivo y F04                      | no requiere para ejecución ordinaria; F04 o F02 para excepción       |
| `CAP-09` Ventas                   | F18, plataforma F19 o F06                            | F07, F08, F09 o F16                                  | F03, F07 o F16 según frente                       | no requiere para venta ordinaria; excepción sensible por identificar |
| `CAP-10` Clientes                 | F18 o medio F19                                      | F06, F07, F08, F09 o F16                             | F03, F06 o F16                                    | responsable del frente para compensación o excepción                 |
| `CAP-11` Transporte               | pedido, remisión, F03, F11 o F16                     | F11, F12, F13 y apoyos F20                           | F04 y responsable receptor                        | F04 o F03 para cambios y excepciones                                 |
| `CAP-12` Finanzas                 | venta, compra, obligación, F02 o F05                 | F05; F07 o F09 para caja                             | F02 y F05                                         | F02, F01 o usuario bancario autorizado según acción                  |
| `CAP-13` Instalaciones            | cualquier trabajador, F03, F04 o F14                 | F14, F04 o F17                                       | F03 o F04                                         | F02 cuando genere contratación o gasto                               |
| `CAP-14` Mercadeo                 | F01, F02, F06 o F16                                  | F06                                                  | F01, F02, F06 o F16 según frente                  | responsable de marca o frente cuando requiera aprobación             |
| `CAP-15` Tecnología               | cualquier usuario o sistema F21                      | F04 actualmente, F17 o sistema F21                   | F02 o responsable funcional                       | según riesgo; situación actual concentrada en F04                    |
| `CAP-16` Información              | actor que produce el hecho o solicita información    | actor del área, F05 o custodio autorizado            | responsable del área y F02 cuando sea transversal | autoridad del documento para compartir, eliminar o corregir          |
| `CAP-17` Análisis                 | F01, F02, F03 o responsable del área                 | F05 o responsable analítico del área                 | F02 o dueño del resultado                         | F01 o F02 cuando se convierta en decisión                            |
| `CAP-18` Continuidad              | trabajador afectado, supervisor, tercero o sistema   | equipo del área afectada, F04, F17 o F21             | F03, F04 o F02                                    | F02 o F01 para alternativas de alto impacto                          |

---

#### 9. Excepciones específicas basadas en la auditoría

##### 9.1. Personas, turnos y asistencia

| Subcapacidad | Campo     | Actor                                                                 | Estado                       | Evidencia o frontera                                                 |
| ------------ | --------- | --------------------------------------------------------------------- | ---------------------------- | -------------------------------------------------------------------- |
| `CAP-02.02`  | `EJE`     | F02 para filtrar; apoyo administrativo cuando aplique                 | `CONFIRMADA`                 | revisión de hojas de vida                                            |
| `CAP-02.02`  | `APR`     | F01 y F02                                                             | `CONFIRMADA_PARCIAL`         | aprobación de candidato y prueba                                     |
| `CAP-02.03`  | `EJE`     | F17 para formalización documental después de decisión interna         | `CONFIRMADA`                 | abogados externos                                                    |
| `CAP-02.06`  | `EJE`     | F02 y F03 de Vento Café                                               | `CONFIRMADA`                 | creación actual de horarios                                          |
| `CAP-02.06`  | `APR`     | las mismas funciones según su operación                               | `CONFIRMADA`                 | publicación actual en VISO                                           |
| `CAP-02.07`  | `INI/EJE` | trabajador                                                            | `CONFIRMADA`                 | el trabajador registra su entrada o salida                           |
| `CAP-02.07`  | `SYS`     | ANIMA acepta y conserva la marcación                                  | `CONFIRMADA`                 | no sustituye supervisión humana                                      |
| `CAP-02.08`  | `COR/APR` | por identificar para correcciones de asistencia y horario             | `POR_IDENTIFICAR`            | auditoría dejó el flujo pendiente                                    |
| `CAP-02.12`  | `EJE/SUP` | F02 y F05                                                             | `CONFIRMADA_PARCIAL`         | preparación y revisión de información laboral                        |
| `CAP-02.12`  | `APR`     | usuario bancario autorizado para ejecutar pago                        | `CONFIRMADA`                 | control bancario externo                                             |
| `CAP-02.13`  | `INI/APR` | F02 para altas; no existe iniciador obligatorio confirmado para bajas | `CONFIRMADA_PARCIAL/AUSENTE` | la solicitud de baja depende actualmente del descubrimiento informal |
| `CAP-02.13`  | `EJE`     | F04 actualmente desactiva cuentas                                     | `CONFIRMADA_PARCIAL`         | ejecución manual posterior                                           |

##### 9.2. Compras, recepción e inventario

| Subcapacidad              | Campo     | Actor                                                 | Estado                | Evidencia o frontera                                    |
| ------------------------- | --------- | ----------------------------------------------------- | --------------------- | ------------------------------------------------------- |
| `CAP-05.01` y `CAP-05.02` | `INI`     | responsables de áreas, F03, F10 o F11                 | `COMPARTIDA`          | faltantes y avisos de las áreas                         |
| `CAP-05.01`               | `EJE/APR` | F02 consolida la necesidad                            | `CONFIRMADA`          | preguntas y experiencia                                 |
| `CAP-05.05` y `CAP-05.06` | `EJE/APR` | F02                                                   | `CONFIRMADA`          | acepta precios, cambios y decisión de compra            |
| `CAP-05.07`               | `EJE`     | F02 o apoyo administrativo autorizado                 | `CONFIRMADA_PARCIAL`  | pedido enviado por Gerencia o apoyo                     |
| `CAP-05.08` y `CAP-05.09` | `EJE`     | F04 en segundo piso; F10 en primer piso               | `TEMPORAL/COMPARTIDA` | recepción según ubicación                               |
| `CAP-05.09`               | `REV`     | quien recibe compara visualmente y contra factura     | `CONFIRMADA_PARCIAL`  | control manual                                          |
| `CAP-05.10`               | `APR`     | por identificar para rechazo o diferencia             | `POR_IDENTIFICAR`     | no existe procedimiento confirmado                      |
| `CAP-06.01` a `CAP-06.07` | `EJE`     | F11; cobertura actual F04 y áreas F10                 | `VACANTE/TEMPORAL`    | Bodega no tiene titular habitual                        |
| `CAP-06.07`               | `APR`     | no existe aprobación confirmada para retiro ordinario | `POR_IDENTIFICAR`     | actualmente hay acceso físico libre                     |
| `CAP-06.08` a `CAP-06.11` | `EJE`     | F11, F12 y F13                                        | `COMPARTIDA/ROTATIVA` | origen, conductor y receptor                            |
| `CAP-06.12`               | `EJE`     | F11 y responsables del lugar                          | `PROVISIONAL`         | conteo físico                                           |
| `CAP-06.13` y `CAP-06.14` | `APR/COR` | por identificar                                       | `POR_IDENTIFICAR`     | ajustes, merma y disposición sin segregación suficiente |

##### 9.3. Producción, despacho y transporte

| Subcapacidad              | Campo     | Actor                                        | Estado                   | Evidencia o frontera                                          |
| ------------------------- | --------- | -------------------------------------------- | ------------------------ | ------------------------------------------------------------- |
| `CAP-08.01` a `CAP-08.05` | `INI`     | solicitudes de sedes, stock observado y plan | `COMPARTIDA/IMPLÍCITA`   | no existe un único propietario integral                       |
| `CAP-08.02` a `CAP-08.05` | `EJE/SUP` | responsables productivos y F04               | `DEPENDIENTE_DE_PERSONA` | cantidades y prioridades usan experiencia                     |
| `CAP-08.06` a `CAP-08.14` | `EJE`     | subfamilia F10 correspondiente               | `CONFIRMADA`             | Panadería, Repostería, Pastelería, Galletería, Cocina o Barra |
| `CAP-08.07` y `CAP-08.10` | `SUP`     | responsable del área y F04                   | `CONFIRMADA`             | revisión productiva                                           |
| `CAP-08.12` y `CAP-08.13` | `APR`     | responsable productivo; escalamiento a F04   | `PROVISIONAL`            | liberación, rechazo o reproceso requiere formalización        |
| `CAP-11.04` a `CAP-11.06` | `EJE`     | F11, F12 y apoyos F20                        | `COMPARTIDA`             | carga y transferencia de custodia                             |
| `CAP-11.07`               | `EJE`     | F12                                          | `CONFIRMADA`             | conductor                                                     |
| `CAP-11.09`               | `EJE/REC` | F12 entrega y F13 recibe                     | `ROTATIVA`               | receptor varía según sede y turno                             |
| `CAP-11.10`               | `APR`     | F04 o F03 según origen y destino             | `PROVISIONAL`            | faltantes, daños y devoluciones                               |
| `CAP-11.11`               | `SUP`     | F04                                          | `CONFIRMADA`             | cierre y novedades de recorrido                               |

##### 9.4. Pedidos, venta, caja y clientes

| Subcapacidad              | Campo     | Actor                                                                         | Estado               | Evidencia o frontera                       |
| ------------------------- | --------- | ----------------------------------------------------------------------------- | -------------------- | ------------------------------------------ |
| `CAP-09.02`               | `INI`     | F18, Rappi, ManyChat, Shopify o comunicación directa                          | `CONFIRMADA`         | origen depende de la forma de pedido       |
| `CAP-09.02` a `CAP-09.07` | `EJE`     | F08 para mesas; F07 para caja, mostrador y plataformas; F09 en sedes pequeñas | `CONFIRMADA_PARCIAL` | funciones cambian por sede                 |
| `CAP-09.05`               | `APR/COR` | caja y supervisión; aprobador exacto por identificar                          | `POR_IDENTIFICAR`    | corrección, anulación y devolución         |
| `CAP-09.08` a `CAP-09.10` | `EJE`     | F07 o F09                                                                     | `CONFIRMADA`         | registro, cobro y soporte de venta         |
| `CAP-09.09`               | `EJE`     | cualquier trabajador puede procesar tarjeta; F07 registra el pago             | `COMPARTIDA`         | doble intervención actual                  |
| `CAP-09.09`               | `APR`     | cliente autoriza el pago; caja confirma registro                              | `CONFIRMADA_PARCIAL` | datáfono y aviso verbal                    |
| `CAP-09.11`               | `EJE`     | F08; apoyo eventual F07                                                       | `CONFIRMADA`         | servicio de mesa                           |
| `CAP-09.12` y `CAP-09.13` | `EJE`     | F07 o F09                                                                     | `CONFIRMADA`         | mostrador, Rappi y pedidos directos        |
| `CAP-09.14`               | `EJE/SUP` | F06; F16 para Vaila Vainilla                                                  | `CONFIRMADA`         | catering, empresa y frente asociado        |
| `CAP-09.15`               | `EJE`     | F07 o F09                                                                     | `CONFIRMADA`         | cierre de caja y jornada                   |
| `CAP-09.15`               | `SUP`     | F03 y revisión posterior F05                                                  | `PROVISIONAL`        | cierre, efectivo y Contabilidad            |
| `CAP-10.03` a `CAP-10.05` | `EJE`     | función que atiende el medio: F06, F07, F08, F09 o F16                        | `PROVISIONAL`        | debe conservarse el origen de la solicitud |
| `CAP-10.04` y `CAP-10.05` | `APR`     | responsable de sede o frente; escalamiento F02                                | `PROVISIONAL`        | reclamo, devolución o compensación         |

##### 9.5. Finanzas, activos, instalaciones y mercadeo

| Subcapacidad                            | Campo     | Actor                                              | Estado               | Evidencia o frontera                              |
| --------------------------------------- | --------- | -------------------------------------------------- | -------------------- | ------------------------------------------------- |
| `CAP-07.03` a `CAP-07.06`               | `CUS/EJE` | F15 o usuario del activo                           | `PROVISIONAL`        | custodia no implica propiedad                     |
| `CAP-07.07` a `CAP-07.09`               | `INI`     | usuario, custodio, F03 o F04                       | `CONFIRMADA_PARCIAL` | necesidad por falla o mantenimiento               |
| `CAP-07.10`                             | `APR`     | F02 o F01 según valor y efecto                     | `PROVISIONAL`        | baja, venta, descarte o reemplazo                 |
| `CAP-12.02`                             | `EJE`     | F07 o F09                                          | `CONFIRMADA`         | apertura, operación y cierre de caja              |
| `CAP-12.02`                             | `CUS`     | F07 durante turno; F02 recibe o custodia excedente | `CONFIRMADA`         | conteo y cierre físico                            |
| `CAP-12.03`                             | `EJE/APR` | usuario bancario autorizado                        | `CONFIRMADA`         | ejecución bancaria                                |
| `CAP-12.01` y `CAP-12.04` a `CAP-12.15` | `EJE`     | F05                                                | `CONFIRMADA_PARCIAL` | Contabilidad y administración                     |
| `CAP-12.07` y `CAP-12.08`               | `SUP/AUD` | F05 y F02 según materia                            | `PROVISIONAL`        | conciliación posterior                            |
| `CAP-13.03`                             | `INI/APR` | F02 para contratar técnico                         | `CONFIRMADA`         | contacto directo                                  |
| `CAP-13.03`                             | `EJE`     | F17                                                | `CONFIRMADA`         | técnico externo                                   |
| `CAP-13.03`                             | `REV`     | F02 o usuario del recurso                          | `CONFIRMADA_PARCIAL` | aceptación visual no formalizada                  |
| `CAP-13.04`                             | `EJE`     | F14 y cada área sobre su estación                  | `CONFIRMADA`         | servicios generales no sustituye cuidado del área |
| `CAP-14.03` a `CAP-14.05`               | `INI`     | F01, F02, F06 o F16                                | `CONFIRMADA`         | solicitud de contenido                            |
| `CAP-14.03` a `CAP-14.05`               | `EJE`     | F06                                                | `CONFIRMADA`         | creación y publicación                            |
| `CAP-14.03`                             | `APR`     | F01, F02 o F16 para publicación permanente         | `CONFIRMADA_PARCIAL` | historias pueden publicarse sin aprobación previa |
| `CAP-14.08` y `CAP-14.09`               | `EJE/SUP` | F06; F16 cuando aplique a Vaila Vainilla           | `CONFIRMADA`         | comercial, catering y eventos                     |

##### 9.6. Tecnología, información, análisis y continuidad

| Subcapacidad              | Campo         | Actor                                                     | Estado                   | Evidencia o frontera                                        |
| ------------------------- | ------------- | --------------------------------------------------------- | ------------------------ | ----------------------------------------------------------- |
| `CAP-15.01`               | `INI/APR`     | F02 solicita y autoriza alta                              | `CONFIRMADA_PARCIAL`     | baja obligatoria todavía ausente                            |
| `CAP-15.01`               | `EJE`         | F04 crea o desactiva cuentas actualmente                  | `CONFIRMADA_PARCIAL`     | ejecución manual                                            |
| `CAP-15.02` a `CAP-15.04` | `CUS`         | usuario, sede o F15                                       | `PROVISIONAL`            | ubicación y custodia requieren inventario                   |
| `CAP-15.06` y `CAP-15.07` | `INI`         | cualquier usuario afectado                                | `CONFIRMADA`             | reporte por WhatsApp o verbal                               |
| `CAP-15.06` a `CAP-15.09` | `EJE/SUP/APR` | F04 concentra actualmente priorización, cambio y prueba   | `DEPENDIENTE_DE_PERSONA` | no se presenta como modelo objetivo                         |
| `CAP-15.10`               | `APR`         | F02                                                       | `PROVISIONAL`            | licencias, contratos y costos                               |
| `CAP-16.01` a `CAP-16.11` | actores       | se heredan del proceso cuyo hecho se documenta            | `COMPARTIDA`             | no existe un único actor documental para todos los dominios |
| `CAP-17.01` a `CAP-17.12` | `INI/SUP`     | F01, F02 o responsable del área                           | `PROVISIONAL`            | análisis se activa por necesidad de decisión                |
| `CAP-17.01` a `CAP-17.12` | `EJE`         | F05 o responsable funcional que prepara el análisis       | `PROVISIONAL`            | distribución exacta pendiente por tipo de medida            |
| `CAP-18.03`               | `INI`         | usuario, tercero o sistema que detecta la falla           | `CONFIRMADA`             | no necesita aprobación para reportar                        |
| `CAP-18.04` a `CAP-18.06` | `EJE/SUP`     | F04 y responsable del área afectada                       | `PROVISIONAL`            | priorización por impacto                                    |
| `CAP-18.05`               | `APR`         | F02 para alternativa empresarial sensible                 | `PROVISIONAL`            | operación mínima                                            |
| `CAP-18.07` a `CAP-18.09` | `EJE/REV`     | actor que trabajó durante la falla y responsable del área | `PROVISIONAL`            | registro y reconciliación posterior                         |

---

#### 10. Concentraciones y vacíos que deben conservarse

| Hallazgo                                                                            | Estado AS-IS               |
| ----------------------------------------------------------------------------------- | -------------------------- |
| F04 cubre parcialmente Bodega además de operaciones y soporte                       | `TEMPORAL/CONCENTRADA`     |
| Bodega tiene responsabilidad real sin titular habitual                              | `VACANTE`                  |
| la demanda y planificación productiva no tienen un dueño integral                   | `COMPARTIDA/IMPLÍCITA`     |
| correcciones de pago, horarios y asistencia carecen de aprobador confirmado         | `POR_IDENTIFICAR`          |
| caja puede ejecutar, aprobar y corregir algunas acciones dentro de la misma función | `CONCENTRADA/PARCIAL`      |
| F02 concentra necesidad, aprobación y negociación de varias compras                 | `CONCENTRADA`              |
| soporte tecnológico concentra priorización, ejecución, prueba y aprobación en F04   | `DEPENDIENTE_DE_PERSONA`   |
| recepción de remisiones en sedes depende del trabajador disponible                  | `ROTATIVA`                 |
| retiro de Bodega no tiene aprobación o custodia suficiente                          | `AUSENTE/POR_IDENTIFICAR`  |
| varias operaciones usan cuentas compartidas y no identifican al ejecutor real       | `SIN_IDENTIDAD_INDIVIDUAL` |

Registrar estos hallazgos no significa aprobarlos como diseño futuro.

---

#### 11. Cuándo se necesita realmente aprobación

No se exigirá aprobación separada para cada acción ordinaria.

Se evaluará aprobación específica cuando la acción:

- comprometa dinero;
- cambie una obligación;
- modifique una venta ya confirmada;
- altere inventario sin movimiento ordinario;
- descarte o transfiera un activo;
- cambie un horario o una marcación registrada;
- cree o retire un acceso;
- publique contenido permanente o sensible;
- compense a un cliente;
- acepte una diferencia;
- elimine o comparta información protegida;
- active una alternativa durante una falla importante.

La definición de permisos y condiciones técnicas corresponde a `CAP-MAP-010`.

---

#### 12. Registro mínimo por subcapacidad

| Campo                       | Contenido                                             |
| --------------------------- | ----------------------------------------------------- |
| Código                      | subcapacidad canónica                                 |
| `INI`                       | función, tercero, sistema o evento iniciador          |
| `EJE`                       | función ejecutora                                     |
| `SUP`                       | función supervisora o estado sin supervisión separada |
| `APR`                       | función aprobadora o `NO_REQUIERE_APROBACIÓN`         |
| Participaciones adicionales | revisor, custodio, receptor, corrector u otra         |
| Sede o área                 | vínculo de `CAP-MAP-003`                              |
| Estado por actor            | valor del apartado 4                                  |
| Evidencia                   | auditoría, documento, pantalla u observación          |
| Concentración               | funciones incompatibles reunidas en el mismo actor    |
| Sustitución                 | actor habitual y actor temporal, si aplica            |
| Duda                        | una pregunta única no resuelta                        |
| Destino                     | auditoría o tarea posterior                           |

---

#### 13. Preguntas pendientes de validación operativa

Estas preguntas provienen de vacíos expresamente registrados en la auditoría; no repiten hechos confirmados.

| Código         | Pregunta de una sola respuesta                                                  | Quién puede responder                      | Formato esperado            |
| -------------- | ------------------------------------------------------------------------------- | ------------------------------------------ | --------------------------- |
| `D-CAP006-001` | ¿Qué función autoriza actualmente cambiar una solicitud de remisión ya enviada? | responsable de sede o área solicitante     | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-002` | ¿Qué función autoriza actualmente rechazar mercancía con diferencias?           | persona que recibe proveedores             | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-003` | ¿Qué función autoriza actualmente ajustar una diferencia de inventario?         | responsable de inventario o sede           | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-004` | ¿Qué función autoriza actualmente corregir un medio de pago registrado?         | cajero o responsable de sede               | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-005` | ¿Qué función autoriza actualmente cambiar un horario publicado?                 | persona que administra horarios            | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-006` | ¿Qué función autoriza actualmente corregir una marcación de asistencia?         | trabajador o persona que revisa asistencia | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-007` | ¿Qué función autoriza actualmente una devolución al cliente?                    | cajero o responsable de sede               | un cargo, `NADIE` o `NO SÉ` |
| `D-CAP006-008` | ¿Qué función autoriza actualmente una compensación al cliente?                  | cajero o responsable de sede               | un cargo, `NADIE` o `NO SÉ` |

Las respuestas se incorporarán a los campos correspondientes y conservarán fecha y evidencia.

---

#### 14. Autocuestionario breve para cualquier acción

Antes de enviarlo se reemplazará `[ACCIÓN]` por una acción concreta, por ejemplo: “cambiar un medio de pago” o “rechazar mercancía”.

```text
CAP006-ACTOR — [ACCIÓN]

Responde únicamente sobre lo que ocurre actualmente.

¿Quién realiza [ACCIÓN]?

Marca UNA:
[ ] Yo
[ ] Cajero
[ ] Mesero
[ ] Responsable de sede
[ ] Gerencia General
[ ] Administración
[ ] Contabilidad
[ ] Coordinación de Operaciones
[ ] Responsable de Bodega
[ ] Responsable de Producción
[ ] Conductor
[ ] Proveedor o técnico
[ ] El sistema lo hace automáticamente
[ ] Otra función
[ ] NADIE
[ ] NO SÉ

Si marcaste “otra función”, escribe el cargo o trabajo, no el nombre:
________________________________
```

Se enviarán mensajes separados para:

```text
¿Quién pide que comience [ACCIÓN]?
¿Quién realiza [ACCIÓN]?
¿Quién revisa el resultado de [ACCIÓN]?
¿Quién autoriza [ACCIÓN] antes de que produzca efecto?
```

Cada mensaje admite una sola respuesta. No se agruparán las cuatro preguntas en una sola respuesta.

---

#### 15. Preguntas reservadas para el usuario

Después de revisar respuestas anteriores, auditorías, controles documentados y decisiones canónicas:

```text
CAP-MAP-006
→ 0 preguntas RESPONDE_USUARIO
```

Los vacíos restantes son hechos operativos observables y deben responderlos las personas que ejecutan o supervisan actualmente las acciones.

---

#### 16. Puerta de deduplicación

Antes de crear una nueva pregunta se verificará:

1. respuesta previa del usuario;
2. auditoría de actores;
3. inventario de controles sensibles;
4. matrices de roles y permisos ya aprobadas;
5. proceso ordinario y excepciones documentadas;
6. código o configuración cuando el comportamiento sea comprobable;
7. posibilidad de respuesta por observación directa.

Una pregunta resuelta se convertirá en evidencia; no permanecerá como pendiente.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades tienen actores consultables mediante familia más excepción.
2. Iniciador, ejecutor, supervisor y aprobador permanecen separados.
3. No todas las acciones necesitan aprobación.
4. Las familias de actores AS-IS se reutilizan sin convertirlas automáticamente en cargos futuros.
5. Las coberturas temporales, rotativas, compartidas y vacantes permanecen visibles.
6. Los sistemas y terceros pueden participar, pero no asumir responsabilidad empresarial humana.
7. Las acciones sensibles conservan sus controles y vacíos reales.
8. Los nombres personales existentes en la auditoría no se convierten en estructura permanente.
9. Los vacíos operativos se consultan con quien observa el trabajo.
10. `CAP-MAP-006` no genera preguntas para el usuario.
11. Los permisos se definirán en `CAP-MAP-010`.
12. Esta tarea no cambia asignaciones, accesos, cargos ni procesos.

---

#### 18. Criterios de aceptación

`CAP-MAP-006` podrá aprobarse cuando:

- todas las subcapacidades tengan los cuatro campos de participación;
- una ausencia de aprobación esté expresada y no ocultada;
- se conserven estados confirmado, provisional, temporal, rotativo, compartido, vacante y por identificar;
- los actores ya confirmados por la auditoría no vuelvan a preguntarse;
- los controles sensibles de compras, inventario, producción, caja, pagos, personal, marketing y tecnología estén incluidos;
- las concentraciones AS-IS no se presenten como diseño objetivo;
- cada duda pendiente tenga una sola respuesta y un observador capaz de responderla;
- no se confundan actor, cargo, persona, aplicación o permiso;
- `CAP-MAP-007` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Con la aprobación quedará identificado quién activa, realiza, revisa y autoriza cada capacidad según la evidencia actual, sin inventar una estructura futura ni repetir auditorías ya resueltas.

La continuidad será exclusivamente:

```text
CAP-MAP-007
— Identificar información de entrada y resultado producido
```

`CAP-MAP-007` definirá qué información necesita cada capacidad para comenzar y qué resultado informativo produce, sin decidir todavía su fuente de verdad definitiva.


### ✅ CAP-MAP-007 — Identificar información de entrada y resultado producido

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de información
**Dependencia anterior:** `CAP-MAP-006`
**Continuidad reservada:** `CAP-MAP-008`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué hecho o necesidad permite comenzar;
- qué información mínima debe conocerse;
- qué regla o referencia se consulta;
- qué resultado informativo debe quedar al terminar;
- qué estado debe mostrar ese resultado;
- qué debe quedar registrado cuando el trabajo no termina normalmente.

La cobertura se construye mediante:

```text
información base de la familia
+ excepción de la subcapacidad
= entrada y resultado de la subcapacidad
```

Esto evita repetir 217 veces la misma información sin dejar subcapacidades sin definición.

Esta tarea **no decide todavía**:

- dónde se guarda la información: `CAP-MAP-008`;
- cómo se comunica entre aplicaciones o áreas: `CAP-MAP-009`;
- quién puede verla, cambiarla o aprobarla: `CAP-MAP-010`;
- qué pantalla, aparato, formato o documento la presenta: `CAP-MAP-011`.

---

#### 2. Diferencias que deben conservarse

| Concepto               | Pregunta que responde                           | Ejemplo                                     |
| ---------------------- | ----------------------------------------------- | ------------------------------------------- |
| Hecho que inicia       | ¿Qué ocurrió para que el trabajo deba comenzar? | llegó mercancía                             |
| Información de entrada | ¿Qué se necesita saber para actuar?             | proveedor, productos y cantidades esperadas |
| Objeto físico          | ¿Qué cosa se recibe, mueve o transforma?        | cajas de producto                           |
| Regla o referencia     | ¿Contra qué se revisa o calcula?                | orden de compra aprobada                    |
| Resultado empresarial  | ¿Para qué le sirve esto al negocio?             | inventario confiable                        |
| Resultado informativo  | ¿Qué dato, registro o estado queda producido?   | recepción aceptada con cantidades recibidas |
| Evidencia              | ¿Qué permite comprobar que ocurrió?             | firma, foto, factura o marcación            |

El **resultado empresarial** ya definido en `CAP-MAP-002` no se reemplaza.
`CAP-MAP-007` identifica el resultado informativo concreto que permite observarlo, controlarlo o continuarlo.

---

#### 3. Reglas obligatorias

1. Una persona, producto, dinero, equipo o mercancía no se tratará como información.
2. Cuando exista un objeto físico, se describirá por separado su información identificadora.
3. Una entrada deberá ser necesaria para comenzar, decidir, ejecutar o comprobar.
4. Un resultado deberá poder ser entendido por la siguiente persona o capacidad que lo use.
5. “Proceso realizado” no será un resultado suficiente.
6. No se exigirá información que no sea necesaria para la operación o el control.
7. No se copiarán contraseñas, secretos, números completos de identificación, datos bancarios ni datos personales innecesarios.
8. Cuando la práctica actual no produzca un registro, se declarará `NO EXISTE`; no se inventará uno.
9. Cuando el resultado pueda quedar incompleto, rechazado, cancelado o corregido, esa condición deberá conservarse.
10. Una corrección no borrará la existencia del resultado anterior; deberá poder distinguirse el valor corregido.
11. La información base se hereda desde la familia, salvo excepción expresa.
12. La fuente actual y la fuente objetivo se definirán únicamente en `CAP-MAP-008`.

---

#### 4. Estados mínimos del resultado

| Estado      | Significado sencillo                                 |
| ----------- | ---------------------------------------------------- |
| `PENDIENTE` | todavía falta trabajo o una decisión                 |
| `COMPLETO`  | produjo el resultado esperado                        |
| `PARCIAL`   | produjo solo una parte y falta identificar cuál      |
| `RECHAZADO` | se decidió no aceptar o no continuar                 |
| `CANCELADO` | se detuvo después de haber comenzado                 |
| `CORREGIDO` | reemplaza un dato anterior conservando la corrección |
| `NO_APLICA` | se confirmó que el resultado no corresponde al caso  |

Cada subcapacidad usará solo los estados que realmente necesite.

---

#### 5. Registro mínimo por subcapacidad

| Campo                     | Contenido                                                              |
| ------------------------- | ---------------------------------------------------------------------- |
| Código                    | código de la subcapacidad                                              |
| Hecho que inicia          | situación observable que activa el trabajo                             |
| Entradas obligatorias     | información sin la cual no puede comenzar correctamente                |
| Entradas opcionales       | información útil que puede no existir                                  |
| Regla o referencia        | política, cálculo, pedido, programación o documento usado para decidir |
| Objeto físico relacionado | producto, dinero, equipo o documento físico, cuando aplique            |
| Resultado producido       | dato, registro, decisión, estado o aviso que queda                     |
| Estado del resultado      | estado normal y estados alternos aplicables                            |
| Resultado ante excepción  | qué queda si se rechaza, cancela, corrige o termina parcialmente       |
| Evidencia disponible      | comprobación observada, sin decidir aún su diseño futuro               |
| Duda pendiente            | código del registro vivo, si falta confirmación                        |

---

#### 6. Mapa base por familia

| Familia                           | Hecho o información principal de entrada                              | Resultado informativo base                                                                                         |
| --------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `CAP-01` Dirección y gobierno     | situación actual, riesgo, obligación, propuesta o resultado anterior  | objetivo, decisión, política, riesgo aceptado, responsable o acción                                                |
| `CAP-02` Personas y trabajo       | necesidad de personal, trabajador, disponibilidad, turno o novedad    | candidato, vinculación, asignación, horario, asistencia, novedad, pago o retiro                                    |
| `CAP-03` Seguridad y salud        | obligación, peligro, incidente, inspección o condición insegura       | riesgo, control, incidente registrado, acción correctiva o comprobación                                            |
| `CAP-04` Productos y oferta       | necesidad del cliente, producto, componente, receta o presentación    | producto, clasificación, receta, rendimiento, menú, especificación o versión                                       |
| `CAP-05` Compras y proveedores    | necesidad, existencias, proveedor, oferta o solicitud aprobada        | solicitud, comparación, aprobación, orden, recepción, diferencia, devolución o evaluación                          |
| `CAP-06` Inventario y movimientos | producto, ubicación, cantidad, lote, necesidad o movimiento           | entrada, ubicación, reserva, consumo, traslado, remisión, conteo, ajuste, merma o condición                        |
| `CAP-07` Activos                  | activo, identificación, ubicación, custodia, estado o necesidad       | activo registrado, custodia, préstamo, conteo, condición, mantenimiento, reparación o baja                         |
| `CAP-08` Producción               | demanda, receta, disponibilidad, capacidad u orden                    | plan, orden, lote, cantidad producida, consumo, rendimiento, control, liberación o cierre                          |
| `CAP-09` Venta y servicio         | oferta, solicitud del cliente, disponibilidad, mesa, pedido o pago    | pedido, cambio, estado de preparación, venta, pago, factura, atención o cierre                                     |
| `CAP-10` Clientes                 | cliente, solicitud, autorización, pedido anterior o caso              | perfil, preferencia, caso, solución, devolución, satisfacción, reserva o aviso                                     |
| `CAP-11` Despacho y entrega       | origen, destino, carga, pedido, vehículo o necesidad                  | ruta, asignación, carga, custodia, novedad, entrega, retorno o cierre                                              |
| `CAP-12` Finanzas                 | hecho económico, soporte, periodo, cuenta o saldo anterior            | registro contable, caja, banco, cuenta por cobrar o pagar, conciliación, costo, presupuesto, impuesto o informe    |
| `CAP-13` Instalaciones            | espacio, activo, problema, solicitud, frecuencia o condición          | inventario, solicitud de trabajo, limpieza, control, inspección, calibración, acceso o cierre                      |
| `CAP-14` Mercadeo                 | objetivo, público, oferta, presupuesto, contenido o respuesta         | mensaje, publicación, campaña, cupón, contacto comercial, evento, resultado o reputación                           |
| `CAP-15` Tecnología               | usuario, dispositivo, aplicación, falla, solicitud o cambio           | cuenta, configuración, conexión, caso de soporte, incidente, cambio, prueba, licencia o constancia de capacitación |
| `CAP-16` Información y documentos | información, documento, política, solicitud o periodo de conservación | clasificación, documento, versión, acceso, registro de actividad, archivo, firma o investigación                   |
| `CAP-17` Datos y análisis         | definición, datos disponibles, periodo, comparación o problema        | indicador, datos validados, informe, análisis, causa, acción o resultado medido                                    |
| `CAP-18` Continuidad              | dependencia, incidente, estado actual, impacto o recurso disponible   | incidente, impacto, alternativa, operación mínima, recuperación, trabajo manual, conciliación, lección o aviso     |

---

#### 7. Excepciones específicas: personas, seguridad y productos

| Caso                      | Entrada adicional indispensable                               | Resultado específico                               |
| ------------------------- | ------------------------------------------------------------- | -------------------------------------------------- |
| Vinculación o retiro      | identidad mínima, relación, fecha y decisión autorizada       | estado de vinculación o retiro y fecha efectiva    |
| Horario y asignación      | trabajador, lugar, función, fecha y disponibilidad            | turno publicado o cambio identificado              |
| Asistencia                | trabajador, lugar, fecha y hora observada                     | entrada, salida, ausencia o novedad                |
| Pago laboral              | periodo, conceptos, novedades y base aprobada                 | valor calculado, descuentos, pago y estado         |
| Incidente de seguridad    | lugar, momento, personas afectadas y descripción observable   | incidente clasificado, atención y acción pendiente |
| Inspección de seguridad   | lugar, elemento revisado y criterio                           | hallazgo, cumplimiento y acción correctiva         |
| Receta o fórmula          | producto final, componentes, cantidades, unidad y rendimiento | versión de receta y rendimiento esperado           |
| Cambio de producto o menú | producto, motivo, vigencia y lugares afectados                | nueva versión, fecha de inicio y versión anterior  |

---

#### 8. Excepciones específicas: compras, inventario y activos

| Caso                       | Entrada adicional indispensable                            | Resultado específico                                     |
| -------------------------- | ---------------------------------------------------------- | -------------------------------------------------------- |
| Solicitud de compra        | producto o servicio, cantidad, necesidad y fecha requerida | solicitud con estado                                     |
| Comparación de proveedores | ofertas comparables, condiciones y criterio                | comparación y alternativa elegida o rechazada            |
| Recepción de proveedor     | orden esperada, proveedor y cantidades entregadas          | cantidades aceptadas, diferencias y rechazo              |
| Remisión entre lugares     | origen, destino, productos y cantidades                    | remisión enviada, recibida, parcial o rechazada          |
| Conteo de inventario       | lugar, momento, producto y cantidad contada                | diferencia frente al saldo esperado                      |
| Ajuste de inventario       | diferencia, causa conocida y autorización aplicable        | cantidad ajustada, motivo y referencia al valor anterior |
| Merma                      | producto, cantidad, motivo, lugar y momento                | merma registrada y afectación de existencias             |
| Custodia de activo         | activo, custodio, lugar, fecha y condición                 | custodia vigente y estado de entrega                     |
| Mantenimiento o baja       | activo, falla, diagnóstico o condición                     | trabajo realizado, condición final o baja                |

---

#### 9. Excepciones específicas: producción, venta, clientes y entrega

| Caso                                   | Entrada adicional indispensable                                         | Resultado específico                                           |
| -------------------------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------- |
| Plan de producción                     | demanda esperada, existencias, receta y capacidad                       | cantidades y fechas por producir                               |
| Ejecución de lote                      | orden, receta vigente, insumos y cantidades usadas                      | lote, cantidad producida, consumo y rendimiento                |
| Liberación de producto                 | lote, controles y resultado de calidad                                  | liberado, retenido o rechazado                                 |
| Pedido presencial                      | lugar, productos, cantidades, cambios y mesa o cliente cuando aplique   | pedido aceptado y estado de preparación                        |
| Pedido de Rappi, ManyChat u otro medio | solicitud recibida, productos, cantidades, cobro y lugar de preparación | pedido trasladado a operación con referencia al origen         |
| Venta y pago                           | pedido cerrado, valores, descuentos, propina y medios de pago           | venta, pagos aplicados, saldo y comprobante                    |
| Anulación                              | venta o pedido, motivo y autorización aplicable                         | anulación, valores afectados y referencia al registro anterior |
| Devolución o compensación              | pedido o venta, producto, motivo y solución acordada                    | devolución, reposición, descuento u otra solución              |
| Reserva                                | cliente, lugar, fecha, hora, cantidad de personas y condiciones         | reserva confirmada, modificada, rechazada o cancelada          |
| Despacho Vaila Vainilla                | pedido, cliente, destino, contenido y mensajería                        | paquete entregado a mensajería y estado del envío              |
| Entrega al cliente                     | pedido, destino, responsable y novedad                                  | entrega confirmada, fallida, parcial o devuelta                |

---

#### 10. Excepciones específicas: finanzas, instalaciones y mercadeo

| Caso                         | Entrada adicional indispensable                               | Resultado específico                                     |
| ---------------------------- | ------------------------------------------------------------- | -------------------------------------------------------- |
| Cierre de caja               | ventas, medios de pago, efectivo contado, novedades y periodo | diferencia, cierre y entrega de valores                  |
| Distribución de propinas     | propina recibida, periodo, reglas y personas aplicables       | valores distribuidos y saldo pendiente                   |
| Cuenta por cobrar o pagar    | tercero, concepto, valor, vencimiento y soporte               | saldo, vencimiento y estado de pago                      |
| Conciliación bancaria        | movimientos bancarios, registros internos y periodo           | coincidencias, diferencias y partidas pendientes         |
| Costo o rentabilidad         | cantidades, valores, periodo y regla de cálculo               | costo, margen o resultado con su periodo                 |
| Mantenimiento de instalación | lugar, problema, prioridad y recurso                          | trabajo cerrado, pendiente o rechazado y condición final |
| Campaña o publicación        | objetivo, público, mensaje, medio, fechas y presupuesto       | publicación o campaña y resultado observado              |
| Cupón o promoción            | regla, vigencia, productos, lugares y límites                 | promoción activa, usada, vencida o cancelada             |

---

#### 11. Excepciones específicas: tecnología, información, análisis y continuidad

| Caso                     | Entrada adicional indispensable                            | Resultado específico                                              |
| ------------------------ | ---------------------------------------------------------- | ----------------------------------------------------------------- |
| Cuenta o acceso          | persona, función, aplicación y vigencia                    | acceso creado, cambiado, suspendido o retirado                    |
| Falla tecnológica        | aplicación o equipo, momento, lugar, síntoma e impacto     | caso recibido, diagnóstico, solución o pendiente                  |
| Cambio de sistema        | necesidad, alcance, riesgo y comprobación esperada         | cambio probado, aprobado, rechazado o revertido                   |
| Documento controlado     | tipo, contenido, responsable, versión y vigencia           | documento vigente, reemplazado, archivado o eliminado según regla |
| Solicitud de información | solicitante, propósito, alcance y autorización aplicable   | información entregada, negada o entregada parcialmente            |
| Indicador                | definición, periodo, datos y regla de cálculo              | valor, comparación y advertencia de calidad                       |
| Análisis                 | pregunta, periodo, datos, supuestos y límites              | hallazgo, incertidumbre y acción propuesta                        |
| Caída de una dependencia | servicio afectado, momento, impacto y recursos disponibles | operación mínima, alternativa usada y pendientes por conciliar    |
| Recuperación             | incidente, respaldo o registro manual y punto de retorno   | servicio recuperado, datos conciliados y pérdida conocida         |

---

#### 12. Tratamiento de resultados incompletos o corregidos

Para cada subcapacidad deberá poder contestarse:

1. ¿Qué parte sí quedó terminada?
2. ¿Qué parte falta?
3. ¿Por qué se rechazó o canceló?
4. ¿Qué dato anterior fue corregido?
5. ¿Qué trabajo posterior queda pendiente?

No se aceptarán resultados ambiguos como:

```text
listo
hecho
resuelto
procesado
```

sin el dato, decisión o estado que realmente quedó producido.

---

#### 13. Evidencia AS-IS ya aprovechada

Esta tarea parte de hechos ya documentados y no vuelve a preguntarlos:

- Makos participa en pedidos, ventas, comandas y caja presencial.
- Los pedidos de Rappi y ManyChat se trasladan manualmente a la operación observada.
- Shopify participa en la operación comercial observada de Vaila Vainilla.
- Las remisiones usan actualmente combinaciones de Excel, capturas y WhatsApp.
- Producción usa capturas, tablas, llamadas, fotos y mensajes según el caso.
- Existen facturas y recibos físicos dentro de la operación observada.
- ANIMA registra marcaciones y VISO participa en horarios e informes de asistencia.
- El pago laboral usa el sistema contable y el medio bancario ya auditado.
- Las fallas tecnológicas suelen informarse por WhatsApp o verbalmente y no existe un historial consolidado confirmado.
- No existe un historial consolidado confirmado de mantenimiento.

Estos hechos describen el estado actual; no se convierten automáticamente en diseño objetivo.

---

#### 14. Dudas nuevas registradas aparte

Las preguntas completas se incorporaron al archivo independiente:

`docs/plan-canonico/REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES.md`

| Códigos             | Tema                                                              |
| ------------------- | ----------------------------------------------------------------- |
| `DAT-20` y `DAT-21` | documento de despacho y confirmación de entrega de Vaila Vainilla |
| `DAT-22`            | registro de distribución de propinas                              |
| `DAT-23` a `DAT-25` | registro de anulación, devolución y compensación                  |
| `DAT-26` y `DAT-27` | registro de ajuste de inventario y merma                          |

Estas dudas:

- no bloquean la aprobación documental de `CAP-MAP-007`;
- tienen una sola respuesta esperada;
- pueden ser respondidas por quien observa o realiza el trabajo;
- no se duplican dentro de esta tarea.

---

#### 15. Autocuestionario para cualquier trabajador

Para describir una actividad sin conocimientos técnicos:

1. ¿Qué tuvo que pasar para que empezaras?
2. ¿Qué datos miraste antes de actuar?
3. ¿Qué cosa física recibiste, moviste o cambiaste?
4. ¿Contra qué pedido, lista, regla o instrucción revisaste?
5. ¿Qué dato, decisión o estado dejaste al terminar?
6. Si no pudiste terminar, ¿qué quedó anotado?

Cada respuesta deberá referirse a **un caso real reciente** y no a cómo debería funcionar en el futuro.

---

#### 16. Puerta de deduplicación

Antes de crear una nueva pregunta se deberá revisar, en este orden:

1. respuestas previas del usuario;
2. auditorías y documentación existente;
3. código, configuración y datos autorizados;
4. registro vivo de preguntas;
5. observación del trabajador que realiza la actividad.

Solo se incorporará una pregunta nueva cuando la respuesta no pueda obtenerse de esas fuentes.
Cada duda nueva se añadirá al registro vivo y la tarea canónica conservará únicamente su código.

Toda pregunta dirigida a un trabajador deberá:

- poder copiarse y enviarse por WhatsApp sin explicación adicional;
- describir una situación concreta que la persona pueda reconocer;
- decir exactamente qué debe escribir como respuesta;
- usar palabras cotidianas como “quién”, “dónde”, “qué nombre” o “a quién pides permiso”;
- evitar expresiones de diseño como “función que autoriza”, “actor”, “fuente de verdad” o “resultado informativo”.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades heredan entrada y resultado desde su familia.
2. Los casos particulares reciben las excepciones definidas en esta tarea.
3. Se separan hecho iniciador, información, objeto físico, regla, resultado y evidencia.
4. Cada resultado puede expresar su condición normal o excepcional.
5. Un resultado corregido conserva referencia al estado anterior.
6. Una ausencia de registro se declara; no se completa por intuición.
7. Se recopila únicamente información necesaria.
8. Las dudas operativas viven en el registro independiente.
9. `CAP-MAP-007` no crea formularios, bases de datos, integraciones, permisos ni pantallas.
10. La fuente actual y la fuente objetivo quedan reservadas para `CAP-MAP-008`.

---

#### 18. Criterios de aceptación

`CAP-MAP-007` podrá aprobarse cuando:

- las 18 familias tengan entrada y resultado base;
- las 217 subcapacidades queden cubiertas por herencia más excepción;
- los casos con objetos físicos separen el objeto de su información;
- los resultados incompletos, rechazados, cancelados y corregidos no se oculten;
- ninguna fuente de verdad futura se decida anticipadamente;
- no se soliciten datos personales o secretos innecesarios;
- toda duda nueva esté deduplicada y registrada aparte;
- cada pregunta pendiente pueda responderse con observación y una única respuesta;
- `CAP-MAP-008` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definido:

```text
qué necesita conocer cada subcapacidad
        ↓
qué resultado informativo deja
        ↓
qué ocurre si queda parcial, rechazada, cancelada o corregida
```

La continuidad será exclusivamente:

```text
CAP-MAP-008
— Identificar fuente de verdad actual y fuente de verdad objetivo
```

`CAP-MAP-008` determinará dónde se origina, conserva y corrige hoy cada información y cuál deberá ser su fuente futura, sin confundir copias operativas con el registro principal.


### ✅ CAP-MAP-008 — Identificar fuente de verdad actual y fuente de verdad objetivo

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de propiedad de información
**Dependencia anterior:** `CAP-MAP-007`
**Continuidad reservada:** `CAP-MAP-009`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- dónde se origina actualmente la información;
- dónde se conserva hoy el registro que se usa para operar;
- dónde se corrige cuando contiene un error;
- qué copias, mensajes, archivos o informes existen;
- qué aplicación deberá gobernar el registro principal en el modelo objetivo;
- qué sistemas podrán consultarlo sin crear otra versión independiente.

La cobertura se construye mediante:

```text
fuente base de la familia
+ excepción de la subcapacidad
= fuente actual y fuente objetivo de la subcapacidad
```

Esta tarea define propiedad informativa. No crea tablas, migraciones, integraciones, permisos ni pantallas.

---

#### 2. Definiciones en lenguaje directo

| Concepto                  | Significado                                                                                   |
| ------------------------- | --------------------------------------------------------------------------------------------- |
| Lugar donde nace          | primer lugar donde se registra un hecho real                                                  |
| Registro principal actual | registro que hoy se consulta o corrige para continuar el trabajo                              |
| Copia operativa           | Excel, PDF, captura, papel, mensaje o informe usado sin gobernar el hecho original            |
| Fuente externa            | sistema de un tercero que origina o certifica información, como banco, Makos, Rappi o Shopify |
| Fuente objetivo           | aplicación VENTO que deberá aceptar, conservar, corregir y explicar el registro principal     |
| Consumidora               | aplicación que consulta o utiliza información gobernada por otra                              |
| Dato derivado             | cálculo, indicador o resumen que puede reconstruirse desde hechos de origen                   |

Una fuente de verdad no es simplemente “donde aparece el dato”. Debe poder responder:

1. ¿Dónde se registró primero?
2. ¿Dónde se corrige?
3. ¿Cuál versión se considera válida?
4. ¿Qué ocurrió con la versión anterior?
5. ¿Quién necesita consultarla sin volverla a crear?

---

#### 3. Estados de la fuente actual

| Estado          | Significado                                                           |
| --------------- | --------------------------------------------------------------------- |
| `CONFIRMADA`    | código, datos, documentos o auditoría permiten identificarla          |
| `DISTRIBUIDA`   | la operación depende de varios registros sin uno principal confirmado |
| `MANUAL`        | papel, Excel, captura, llamada o chat sostiene el registro            |
| `EXTERNA`       | el registro principal pertenece a un proveedor o autoridad            |
| `NO_EXISTE`     | no se confirmó que el resultado quede registrado                      |
| `POR_CONFIRMAR` | existe una pregunta sencilla pendiente en el registro vivo            |

`POR_CONFIRMAR` no bloquea esta propuesta cuando la fuente objetivo puede definirse sin inventar la práctica actual.

---

#### 4. Estados de la fuente objetivo

| Estado                  | Significado                                                              |
| ----------------------- | ------------------------------------------------------------------------ |
| `OBJETIVO_FUERTE`       | la aplicación coincide claramente con el resultado que debe gobernar     |
| `OBJETIVO_CON_FRONTERA` | la aplicación gobierna una parte y debe respetar la propiedad de otra    |
| `OBJETIVO_DIVIDIDO`     | la subcapacidad contiene resultados con fuentes principales diferentes   |
| `OBJETIVO_DIFERIDO`     | la dirección está definida, pero no habilita implementación en esta fase |
| `SIN_FUENTE_ADECUADA`   | ninguna aplicación actual puede gobernar limpiamente el resultado        |

La aplicación objetivo expresa responsabilidad empresarial. La tabla, esquema, API o almacenamiento físico se diseñará en los bloques técnicos posteriores.

---

#### 5. Reglas obligatorias

1. Cada hecho empresarial tendrá una sola fuente principal objetivo.
2. Una copia no podrá corregirse independientemente del registro principal.
3. Supabase será infraestructura, no propietario empresarial de la información.
4. `vento-shell` será repositorio técnico canónico para migraciones, no fuente empresarial universal.
5. SHELL coordinará acceso y navegación; no absorberá los datos de todas las aplicaciones.
6. Un informe no reemplazará los hechos utilizados para calcularlo.
7. NUMERA consolidará y analizará; no recreará ventas, compras, inventario o producción.
8. Un sistema externo podrá seguir siendo fuente del hecho externo, pero VENTO conservará su referencia y estado interno cuando deba operar con él.
9. WhatsApp, Excel, PDF, capturas y papel podrán conservarse como evidencia o contingencia, no como fuente objetivo duplicada.
10. Toda corrección conservará el valor anterior, motivo, momento y responsable cuando el riesgo lo justifique.
11. Si actualmente no existe registro, se declarará `NO_EXISTE`.
12. AURA seguirá como `OBJETIVO_DIFERIDO`; esta tarea no supone que ya exista.
13. No se almacenarán secretos, credenciales ni datos personales innecesarios para justificar la fuente.
14. Las preguntas dirigidas a trabajadores usarán “dónde lo escribes o corriges”, nunca “fuente de verdad”.

---

#### 6. Registro mínimo por subcapacidad

| Campo                      | Contenido                                                        |
| -------------------------- | ---------------------------------------------------------------- |
| Código                     | código de la subcapacidad                                        |
| Información producida      | resultado definido en `CAP-MAP-007`                              |
| Lugar donde nace hoy       | aplicación, proveedor, archivo, papel, chat o `NO EXISTE`        |
| Registro principal actual  | lugar que hoy se considera válido                                |
| Lugar de corrección actual | dónde se modifica o quién genera una nueva versión               |
| Copias conocidas           | archivos, mensajes, informes, capturas o documentos              |
| Estado AS-IS               | estado de la fuente actual                                       |
| Fuente objetivo            | aplicación que deberá gobernar el resultado                      |
| Estado objetivo            | fuerza, frontera, división o diferimiento                        |
| Consumidoras               | aplicaciones o áreas que necesitarán consultarlo                 |
| Regla de transición        | qué copia deja de ser principal cuando exista la fuente objetivo |
| Duda pendiente             | código del registro vivo, cuando aplique                         |

---

#### 7. Mapa AS-IS por familia

| Familia                           | Fuentes actuales confirmadas o utilizadas                                                               | Estado AS-IS  |
| --------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------- |
| `CAP-01` Dirección y gobierno     | documentos, archivos, mensajes y registros administrativos parciales                                    | `DISTRIBUIDA` |
| `CAP-02` Personas y trabajo       | VISO, ANIMA, sistema contable, medio bancario, documentos y archivos laborales                          | `DISTRIBUIDA` |
| `CAP-03` Seguridad y salud        | documentos, formatos, mensajes y registros administrativos sin cobertura integral confirmada            | `MANUAL`      |
| `CAP-04` Productos y oferta       | NEXO, FOGO, PULSO, Makos y archivos operativos según el resultado                                       | `DISTRIBUIDA` |
| `CAP-05` Compras y proveedores    | ORIGO, tablas de compras, Excel, documentos, WhatsApp y registros de recepción                          | `DISTRIBUIDA` |
| `CAP-06` Inventario y movimientos | NEXO y tablas de inventario, complementadas por Excel, capturas, papel y WhatsApp                       | `DISTRIBUIDA` |
| `CAP-07` Activos                  | NEXO para parte del inventario de activos; archivos y comunicación manual para custodia y mantenimiento | `DISTRIBUIDA` |
| `CAP-08` Producción               | FOGO y tablas productivas, complementadas por tablas, capturas, llamadas, fotos y mensajes              | `DISTRIBUIDA` |
| `CAP-09` Venta y servicio         | Makos, PULSO, esquemas `pos` y `payments`, pedidos internos y plataformas externas                      | `DISTRIBUIDA` |
| `CAP-10` Clientes                 | PULSO, PASS, pedidos, conversaciones y plataformas o chats externos                                     | `DISTRIBUIDA` |
| `CAP-11` Despacho y entrega       | NEXO, PULSO, Shopify, mensajería, remisiones, capturas y WhatsApp                                       | `DISTRIBUIDA` |
| `CAP-12` Finanzas                 | Makos, PULSO, pagos, bancos, sistema contable, documentos y NUMERA                                      | `DISTRIBUIDA` |
| `CAP-13` Instalaciones            | activos parciales en NEXO, comunicación verbal y WhatsApp; no existe historial consolidado confirmado   | `DISTRIBUIDA` |
| `CAP-14` Mercadeo                 | redes, plataformas externas, archivos y WhatsApp; AURA no existe todavía                                | `DISTRIBUIDA` |
| `CAP-15` Tecnología               | VISO, configuración de cada aplicación y Supabase para accesos; soporte por WhatsApp o verbal           | `DISTRIBUIDA` |
| `CAP-16` Información y documentos | aplicaciones de origen, documentos físicos, archivos, chats y carpetas                                  | `DISTRIBUIDA` |
| `CAP-17` Datos y análisis         | consultas e informes por aplicación y análisis inicial en NUMERA                                        | `DISTRIBUIDA` |
| `CAP-18` Continuidad              | estado de cada aplicación, WhatsApp, llamadas y trabajo manual sin registro transversal confirmado      | `DISTRIBUIDA` |

Este mapa describe la evidencia disponible. No afirma que toda función visible en código sea utilizada correctamente por la operación real.

---

#### 8. Mapa objetivo por familia

| Familia                           | Fuente principal objetivo                                                                     | Estado                  | Frontera obligatoria                                                                            |
| --------------------------------- | --------------------------------------------------------------------------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------- |
| `CAP-01` Dirección y gobierno     | VISO para estructura, políticas, riesgos, decisiones y seguimiento administrativo             | `OBJETIVO_CON_FRONTERA` | la decisión continúa siendo humana y los documentos legales conservan su validez propia         |
| `CAP-02` Personas y trabajo       | VISO para administración laboral; ANIMA para registros personales y asistencia                | `OBJETIVO_DIVIDIDO`     | nómina, banco y documentos externos no se convierten automáticamente en datos propios de NUMERA |
| `CAP-03` Seguridad y salud        | VISO                                                                                          | `OBJETIVO_CON_FRONTERA` | autoridades, aseguradoras y proveedores conservan sus documentos oficiales                      |
| `CAP-04` Productos y oferta       | NEXO para catálogo; FOGO para recetas; PULSO para oferta vendible                             | `OBJETIVO_DIVIDIDO`     | cada aplicación gobierna un resultado distinto y comparte referencias, no copias maestras       |
| `CAP-05` Compras y proveedores    | ORIGO                                                                                         | `OBJETIVO_FUERTE`       | NEXO recibe únicamente el efecto de inventario de la recepción aceptada                         |
| `CAP-06` Inventario y movimientos | NEXO                                                                                          | `OBJETIVO_FUERTE`       | compras, producción y ventas originan hechos; NEXO gobierna su efecto en existencias            |
| `CAP-07` Activos                  | NEXO                                                                                          | `OBJETIVO_CON_FRONTERA` | la ejecución técnica externa se relaciona con el activo sin reemplazar su registro              |
| `CAP-08` Producción               | FOGO                                                                                          | `OBJETIVO_FUERTE`       | NEXO conserva movimientos de insumo y producto aceptados, no la orden productiva                |
| `CAP-09` Venta y servicio         | PULSO                                                                                         | `OBJETIVO_FUERTE`       | Makos y plataformas externas serán orígenes externos mientras sigan vigentes                    |
| `CAP-10` Clientes                 | PULSO para relación operativa; PASS para identidad y acciones directas del cliente            | `OBJETIVO_DIVIDIDO`     | no se copiará información personal innecesaria entre ambas aplicaciones                         |
| `CAP-11` Despacho y entrega       | NEXO para traslado interno; PULSO para entrega asociada a un pedido                           | `OBJETIVO_DIVIDIDO`     | la mensajería externa aporta eventos sin gobernar el pedido interno                             |
| `CAP-12` Finanzas                 | PULSO para caja y pago de venta; NUMERA para hechos económicos, costos y análisis             | `OBJETIVO_DIVIDIDO`     | bancos, sistema contable y autoridades conservan los registros externos que les correspondan    |
| `CAP-13` Instalaciones            | NEXO para espacio, activo, novedad y estado                                                   | `OBJETIVO_CON_FRONTERA` | el proveedor técnico puede ejecutar el trabajo, pero no gobernar el estado interno              |
| `CAP-14` Mercadeo                 | AURA para comunicación y campaña; PULSO para promociones aplicadas a ventas                   | `OBJETIVO_DIFERIDO`     | AURA es solo una idea y no se implementa por esta definición                                    |
| `CAP-15` Tecnología               | VISO para identidad y acceso; NEXO para activo; cada aplicación para su configuración         | `OBJETIVO_DIVIDIDO`     | el soporte transversal continúa `SIN_FUENTE_ADECUADA` hasta definir su propietaria              |
| `CAP-16` Información y documentos | aplicación propietaria del hecho respaldado                                                   | `OBJETIVO_DIVIDIDO`     | el archivo documental conserva versiones y evidencia sin apropiarse del hecho                   |
| `CAP-17` Datos y análisis         | aplicación de origen para hechos; NUMERA para indicadores, comparaciones y análisis derivados | `OBJETIVO_CON_FRONTERA` | NUMERA no permitirá corregir hechos gobernados por otra aplicación                              |
| `CAP-18` Continuidad              | aplicación afectada para el incidente local; registro transversal todavía sin fuente adecuada | `OBJETIVO_DIVIDIDO`     | SHELL coordina acceso y navegación, no se vuelve propietaria de todos los incidentes            |

---

#### 9. Registros maestros compartidos

| Información maestra                                | Fuente objetivo | Regla para las demás aplicaciones                                   |
| -------------------------------------------------- | --------------- | ------------------------------------------------------------------- |
| personas trabajadoras, roles, sedes y áreas        | VISO            | consumir identificadores y atributos autorizados                    |
| asistencia individual                              | ANIMA           | VISO consulta y administra excepciones según permisos posteriores   |
| identidad del cliente                              | PASS            | PULSO conserva solo lo necesario para operar la venta y la relación |
| producto y presentación                            | NEXO            | FOGO, ORIGO, PULSO y NUMERA consumen la misma identidad             |
| receta y versión productiva                        | FOGO            | NEXO y NUMERA consultan efectos o costos sin editar la receta       |
| proveedor y ciclo de compra                        | ORIGO           | NEXO y NUMERA consumen recepción y efecto económico                 |
| existencia y movimiento                            | NEXO            | otras aplicaciones originan solicitudes o consumen saldos           |
| orden, lote y resultado de producción              | FOGO            | NEXO recibe movimientos aceptados; NUMERA analiza                   |
| pedido, venta, caja y pago aplicado                | PULSO           | NUMERA recibe hechos económicos sin recrear la venta                |
| centro de costo, presupuesto e indicador económico | NUMERA          | aplicaciones operativas aportan hechos y consultan resultados       |

Los tipos TypeScript repetidos encontrados en NEXO, FOGO, ORIGO, PULSO y NUMERA no crean fuentes maestras distintas. `TEC-18` confirma que deberán derivarse de contratos comunes o generados durante la remodelación técnica.

---

#### 10. Excepciones que no pueden simplificarse

##### 10.1. Pago laboral

- El sistema contable donde se calcula y conserva el pago actual sigue `POR_CONFIRMAR` mediante `DAT-14` y `DAT-15`.
- VISO gobernará personas, periodos y novedades laborales.
- ANIMA aportará asistencia y novedades personales autorizadas.
- El proveedor contable o bancario podrá conservar el cálculo o comprobante externo.
- NUMERA podrá analizar el efecto económico, pero no se declara sistema de nómina.

##### 10.2. Venta presencial y plataformas externas

- Makos continúa como fuente externa de la venta presencial mientras la operación dependa de él.
- Rappi, ManyChat y Shopify podrán originar solicitudes o pedidos externos.
- PULSO deberá conservar la referencia externa y gobernar el estado interno del pedido, la venta y el cobro.
- Copiar un pedido manualmente no convierte a la copia en integración ni elimina el origen.

##### 10.3. Bancos, impuestos y documentos oficiales

- El banco es fuente del movimiento bancario.
- El sistema contable puede ser fuente del asiento o cálculo fiscal.
- La autoridad es fuente del documento o estado oficial que emite.
- NUMERA conservará la referencia, conciliación, clasificación y análisis internos que le correspondan.

##### 10.4. Traslado interno y entrega al cliente

- NEXO gobernará origen, destino interno, carga, remisión y recepción entre lugares.
- PULSO gobernará el resultado de entrega cuando cierre o afecta un pedido del cliente.
- La guía o comprobación del transportador será evidencia externa vinculada, no una segunda venta.

##### 10.5. Documentos y análisis

- El documento controlado seguirá a la aplicación que gobierna el hecho respaldado.
- NUMERA podrá producir indicadores y reportes, pero la corrección del hecho se realizará en su aplicación de origen.
- Un PDF o Excel exportado será una fotografía de un momento, no un registro corregible independiente.

---

#### 11. Regla de corrección y trazabilidad

Cuando un dato esté equivocado:

```text
la corrección ocurre en la fuente principal
        ↓
se conserva referencia al valor anterior
        ↓
las consumidoras reciben o consultan la versión vigente
        ↓
las copias antiguas quedan identificadas como desactualizadas
```

No se aceptará como solución:

- cambiar únicamente un Excel exportado;
- editar una captura o PDF;
- corregir el dato en dos aplicaciones por separado;
- borrar el registro anterior sin rastro;
- crear un registro nuevo sin relacionarlo con el equivocado.

Las reglas exactas de autorización corresponden a `CAP-MAP-010`.

---

#### 12. Tratamiento de copias y operación manual

| Medio actual                 | Uso permitido en el objetivo                   | Condición                                                        |
| ---------------------------- | ---------------------------------------------- | ---------------------------------------------------------------- |
| WhatsApp                     | aviso, coordinación o evidencia complementaria | el estado principal debe quedar en la aplicación propietaria     |
| Excel                        | carga controlada, análisis o contingencia      | debe indicar origen, fecha y versión; no se corrige aisladamente |
| PDF                          | comprobante o versión cerrada                  | debe poder relacionarse con el registro que lo produjo           |
| captura o foto               | evidencia observable                           | no reemplaza cantidades, estados o aprobaciones estructuradas    |
| papel                        | contingencia o requisito físico                | debe existir regla posterior de registro y conciliación          |
| llamada o instrucción verbal | coordinación inmediata                         | las decisiones relevantes deberán quedar registradas             |

Esta tarea no elimina ningún medio actual. Define cuál dejará de considerarse principal cuando exista una fuente objetivo operativa y validada.

---

#### 13. Dudas pendientes reutilizadas

No se crean preguntas nuevas. Las incertidumbres actuales ya están cubiertas en:

`docs/plan-canonico/REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES.md`

| Códigos             | Información que permiten confirmar                              |
| ------------------- | --------------------------------------------------------------- |
| `DAT-01` a `DAT-03` | disponibilidad y detalle histórico de ventas en Makos           |
| `DAT-04` y `DAT-05` | lugar real donde se consultan existencias                       |
| `DAT-06` y `DAT-07` | historial real de compras y recepciones                         |
| `DAT-08` a `DAT-13` | remisiones, conteos, producción y hojas manuales                |
| `DAT-14` y `DAT-15` | cálculo y conservación del pago laboral                         |
| `DAT-16` y `DAT-17` | inspecciones y acciones de seguridad                            |
| `DAT-18` y `DAT-19` | instrucciones de Gerencia y correcciones                        |
| `DAT-20` a `DAT-27` | entregas, propinas, anulaciones, devoluciones, ajustes y mermas |

Sus respuestas completarán el detalle AS-IS sin reabrir la decisión objetivo de esta tarea.

---

#### 14. Autocuestionario sencillo

Para identificar el registro principal de una actividad, la persona que la realiza responderá sobre un caso reciente:

1. ¿Dónde escribiste por primera vez lo que ocurrió?
2. Si quedó equivocado, ¿en qué lugar lo corregiste?
3. ¿Qué lugar miraste después para saber cuál era el dato correcto?
4. ¿Enviaste una copia por WhatsApp, Excel, papel, foto o PDF?
5. Si las copias muestran datos diferentes, ¿cuál usas para continuar trabajando?

La respuesta deberá incluir un solo nombre concreto por pregunta: aplicación, archivo, papel, chat, proveedor o `NO EXISTE`.

---

#### 15. Evidencia técnica incorporada

Esta propuesta aprovecha y no vuelve a auditar:

- esquema y migraciones canónicas de Supabase en `vento-shell`;
- tablas y funciones remotas autorizadas de `vento-os-dev`;
- repositorios NEXO, FOGO, ORIGO, PULSO, NUMERA, VISO, ANIMA y PASS;
- auditoría de Makos, Shopify, Rappi y ManyChat;
- `TEC-05` a `TEC-09`, que ubican ventas, inventario, compras, producción y finanzas;
- `TEC-14` a `TEC-16`, que identifican correcciones disponibles o ausentes;
- `TEC-17`, que identifica exportaciones utilizables para auditoría;
- `TEC-18`, que confirma contratos duplicados y deriva entre aplicaciones;
- `TEC-19`, que documenta y cierra la función temporal retirada.

La incorporación de `vento-numera` confirma que NUMERA consulta información central para análisis y también repite contratos de sedes, empleados, sesión y navegación.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por fuente familiar más excepción.
2. Se separan origen, registro principal, lugar de corrección, copia y consumidora.
3. Las aplicaciones objetivo siguen la propiedad candidata de `CAP-MAP-004`.
4. Las consumidoras de `CAP-MAP-005` no adquieren derecho a recrear el dato.
5. Los resultados de `CAP-MAP-007` tendrán una única fuente principal objetivo.
6. VISO gobernará maestros organizacionales y laborales administrativos.
7. ANIMA gobernará asistencia y registros personales definidos.
8. NEXO gobernará catálogo, existencias, movimientos, activos y traslado interno.
9. ORIGO gobernará proveedores y compras.
10. FOGO gobernará recetas, órdenes, lotes y resultados productivos.
11. PULSO gobernará pedidos, ventas, caja, pagos aplicados y entrega al cliente.
12. PASS gobernará identidad y acciones directas del cliente.
13. NUMERA gobernará centros de costo, hechos económicos internos y análisis derivados, sin reemplazar hechos operativos.
14. AURA continúa como fuente objetivo diferida y sin existencia actual.
15. Los documentos siguen al hecho que respaldan.
16. Los sistemas externos conservan la propiedad del hecho externo y VENTO conserva su referencia operativa.
17. WhatsApp, Excel, PDF, capturas y papel no serán fuentes objetivo paralelas.
18. La duplicación técnica confirmada no se corrige en esta fase documental.

---

#### 17. Lo que esta tarea no autoriza

- crear o modificar tablas;
- ejecutar migraciones;
- cambiar Supabase;
- desarrollar AURA;
- retirar Makos, Shopify, Rappi, ManyChat, bancos o el sistema contable;
- eliminar archivos, chats, papeles o evidencias actuales;
- crear integraciones;
- definir permisos;
- reemplazar contratos TypeScript;
- iniciar remodelación de código.

---

#### 18. Criterios de aceptación

`CAP-MAP-008` podrá aprobarse cuando:

- las 18 familias tengan fuente actual y objetivo documentados;
- las 217 subcapacidades queden cubiertas mediante herencia y excepciones;
- cada resultado tenga una sola fuente principal objetivo o una división explícita;
- las fuentes externas se distingan de los registros internos;
- NUMERA no reemplace los hechos operativos que analiza;
- AURA permanezca diferida;
- las copias manuales no se confundan con registros principales;
- las correcciones ocurran en la fuente propietaria y conserven trazabilidad;
- las dudas AS-IS reutilicen el registro vivo sin duplicarse;
- no se anticipen tablas, integraciones, permisos ni pantallas;
- `CAP-MAP-009` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
dónde nace hoy la información
        ↓
qué registro se considera válido
        ↓
dónde se corrige
        ↓
qué aplicación deberá gobernarla
        ↓
qué aplicaciones solo podrán consumirla
```

La continuidad será exclusivamente:

```text
CAP-MAP-009
— Identificar eventos e integraciones requeridos
```

`CAP-MAP-009` definirá qué hechos deben comunicarse entre fuentes propietarias, qué aplicación los emite, cuál los recibe y cómo evitar copias manuales o integraciones ambiguas.

### ✅ CAP-MAP-009 — Identificar eventos e integraciones requeridos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de comunicaciones empresariales
**Dependencia anterior:** `CAP-MAP-008`
**Continuidad reservada:** `CAP-MAP-010`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué hecho debe conocer otra aplicación o área;
- cuál fuente propietaria confirma que el hecho ocurrió;
- quién necesita recibirlo o consultarlo;
- qué información mínima debe acompañarlo;
- qué comunicación existe actualmente;
- qué comunicación objetivo será necesaria;
- qué debe quedar registrado cuando la entrega falla, se repite o llega tarde.

La cobertura se construye mediante:

```text
comunicación base de la familia
+ excepción de la subcapacidad
= evento o integración requerida
```

Esta tarea define contratos funcionales. No selecciona todavía API, webhook, cola, función, tabla, proveedor ni lenguaje de programación.

---

#### 2. Definiciones en lenguaje directo

| Concepto         | Significado                                                                         |
| ---------------- | ----------------------------------------------------------------------------------- |
| Evento           | hecho que ya ocurrió y no es una orden, por ejemplo “recepción aceptada”            |
| Solicitud        | petición para que otra capacidad evalúe o realice un trabajo                        |
| Consulta         | lectura de información sin crear otra copia principal                               |
| Integración      | mecanismo controlado para trasladar una solicitud, evento o consulta                |
| Emisora          | fuente propietaria que confirma el hecho                                            |
| Receptora        | aplicación que necesita actuar o actualizar una vista derivada                      |
| Referencia común | identificador que permite reconocer el mismo pedido, producto, persona o movimiento |
| Entrega manual   | traslado por persona mediante chat, papel, captura, llamada o archivo               |
| Confirmación     | constancia de que la receptora aceptó, rechazó o dejó pendiente la comunicación     |

Un evento se redactará en pasado:

```text
pedido aceptado
recepción confirmada
lote terminado
pago aplicado
entrega fallida
```

No se usarán nombres ambiguos como `actualizarTodo`, `sincronizarDatos` o `procesar`.

---

#### 3. Tipos funcionales de comunicación

| Tipo           | Cuándo se usa                                         | Ejemplo                        |
| -------------- | ----------------------------------------------------- | ------------------------------ |
| `EVENTO`       | otra aplicación debe reaccionar a un hecho confirmado | lote liberado                  |
| `SOLICITUD`    | todavía falta que otra capacidad acepte o ejecute     | solicitud de abastecimiento    |
| `CONSULTA`     | solo se necesita leer el estado vigente               | disponibilidad de producto     |
| `IMPORTACIÓN`  | la fuente entrega un archivo estructurado             | Excel de ventas Makos          |
| `EXPORTACIÓN`  | se genera una copia para auditoría o tercero          | PDF de orden                   |
| `NOTIFICACIÓN` | se informa a una persona sin cambiar la fuente        | turno publicado                |
| `CONFIRMACIÓN` | se devuelve aceptación, rechazo o resultado           | remisión recibida parcialmente |

Una notificación no sustituye el evento ni demuestra por sí sola que la receptora procesó la información.

---

#### 4. Estados de una comunicación

| Estado                 | Significado                                           |
| ---------------------- | ----------------------------------------------------- |
| `CREADA`               | la fuente registró el hecho o solicitud               |
| `PENDIENTE_DE_ENTREGA` | todavía no ha llegado al destino                      |
| `ENTREGADA`            | el destino la recibió                                 |
| `ACEPTADA`             | el destino pudo aplicarla o continuar                 |
| `RECHAZADA`            | el destino no la aceptó y dejó motivo                 |
| `DUPLICADA`            | ya había sido recibida y no debe aplicarse otra vez   |
| `FALLIDA`              | ocurrió un error de comunicación o procesamiento      |
| `POR_CONCILIAR`        | existe diferencia entre origen y destino              |
| `CANCELADA`            | la solicitud se retiró antes de producir el resultado |

El estado técnico exacto se diseñará después, pero la operación deberá poder distinguir estas condiciones.

---

#### 5. Reglas obligatorias

1. Solo la fuente propietaria definida en `CAP-MAP-008` podrá emitir la versión oficial de un hecho.
2. La receptora no cambiará el hecho original; generará su propio resultado relacionado.
3. Cada comunicación tendrá una referencia estable al registro de origen.
4. Recibir dos veces la misma comunicación no deberá duplicar ventas, pagos, movimientos, lotes o gastos.
5. Un fallo en la receptora no borrará ni alterará silenciosamente el registro de origen.
6. Toda entrega manual crítica deberá poder conciliarse después.
7. La comunicación enviará únicamente la información necesaria.
8. Los secretos, tokens y credenciales nunca formarán parte del contenido empresarial.
9. Los datos personales se limitarán según finalidad y aplicación receptora.
10. NUMERA consumirá hechos confirmados; no corregirá ventas, compras, inventario o producción mediante una integración inversa.
11. SHELL podrá coordinar acceso o navegación, pero no retransmitirá todos los datos empresariales por defecto.
12. AURA no tendrá integraciones ejecutables mientras siga siendo una idea.
13. Una integración externa se validará separadamente por proveedor y contrato.
14. Que dos aplicaciones consulten la misma base de datos no elimina la necesidad de definir propiedad y responsabilidades.
15. Reintentos, idempotencia física, colas y tiempos técnicos permanecen reservados para diseño de integración.

---

#### 6. Registro mínimo por comunicación

| Campo                | Contenido                                                                          |
| -------------------- | ---------------------------------------------------------------------------------- |
| Código               | identificador documental de la comunicación                                        |
| Hecho o solicitud    | nombre concreto en pasado o petición clara                                         |
| Tipo                 | evento, solicitud, consulta, importación, exportación, notificación o confirmación |
| Emisora              | fuente propietaria                                                                 |
| Receptora            | aplicación, sistema externo o función humana                                       |
| Referencia de origen | identificador del registro principal                                               |
| Momento              | cuándo ocurrió el hecho                                                            |
| Contexto             | sede, área, pedido, periodo u otro alcance necesario                               |
| Contenido mínimo     | datos indispensables para actuar                                                   |
| Resultado esperado   | qué debe producir la receptora                                                     |
| Confirmación         | aceptación, rechazo, duplicado, fallo o conciliación                               |
| Situación actual     | automática, manual, inexistente o por confirmar                                    |
| Duda pendiente       | código del registro vivo, si aplica                                                |

---

#### 7. Comunicaciones AS-IS confirmadas

| Comunicación actual                    | Forma observada                                                                | Clasificación                    |
| -------------------------------------- | ------------------------------------------------------------------------------ | -------------------------------- |
| ventas de Makos hacia PULSO            | carga manual de Excel y mapeo de productos                                     | `IMPORTACIÓN_MANUAL`             |
| pedidos de Rappi hacia la operación    | traslado manual observado                                                      | `ENTREGA_MANUAL`                 |
| pedidos de ManyChat hacia la operación | traslado manual observado                                                      | `ENTREGA_MANUAL`                 |
| pedidos de Shopify para Vaila Vainilla | plataforma externa y operación posterior sin integración automática comprobada | `EXTERNA_MANUAL_O_NO_CONFIRMADA` |
| solicitudes y remisiones               | Excel, capturas, WhatsApp, papel y funciones parciales de NEXO                 | `DISTRIBUIDA`                    |
| instrucciones de producción            | tablas, capturas, llamadas, fotos y mensajes                                   | `DISTRIBUIDA`                    |
| pago digital                           | intención, webhook, eventos y conciliación en el dominio de pagos              | `AUTOMÁTICA_CONFIRMADA`          |
| horarios y asistencia                  | VISO y ANIMA comparten registros laborales y de asistencia                     | `INTERNA_CONFIRMADA`             |
| consultas empresariales                | varias aplicaciones leen directamente tablas centrales                         | `CONSULTA_COMPARTIDA`            |
| soporte tecnológico                    | WhatsApp o comunicación verbal                                                 | `ENTREGA_MANUAL`                 |

No se encontró integración automática con Shopify, Rappi o ManyChat. La referencia visual “tipo Rappi” no es una conexión con Rappi.

---

#### 8. Catálogo objetivo de eventos internos

| Código         | Evento o solicitud                                     | Emisora                           | Receptora principal                                   | Resultado esperado                                       |
| -------------- | ------------------------------------------------------ | --------------------------------- | ----------------------------------------------------- | -------------------------------------------------------- |
| `EVT-ORG-001`  | sede, área o estructura organizacional cambiada        | VISO                              | aplicaciones autorizadas                              | contexto organizacional vigente                          |
| `EVT-IAM-001`  | acceso laboral creado, cambiado, suspendido o retirado | VISO                              | SHELL y aplicación afectada                           | acceso alineado con la decisión                          |
| `EVT-WRK-001`  | turno publicado o corregido                            | VISO                              | ANIMA y trabajador                                    | turno visible con versión vigente                        |
| `EVT-ATT-001`  | marcación registrada                                   | ANIMA                             | VISO                                                  | asistencia disponible para revisión                      |
| `EVT-ATT-002`  | novedad de asistencia identificada                     | ANIMA o VISO según origen         | VISO y responsable autorizado                         | novedad revisada sin cambiar la marcación original       |
| `EVT-CAT-001`  | producto o presentación publicada                      | NEXO                              | ORIGO, FOGO, PULSO y NUMERA                           | misma identidad de producto disponible                   |
| `EVT-REC-001`  | receta o versión productiva publicada                  | FOGO                              | NEXO y NUMERA                                         | receta referenciable para consumo y costo                |
| `EVT-PUR-001`  | solicitud de compra aprobada                           | ORIGO                             | responsable de compra                                 | orden o rechazo relacionado                              |
| `EVT-PUR-002`  | orden de compra emitida o cambiada                     | ORIGO                             | recepción, NEXO y NUMERA                              | expectativa de recepción y obligación identificadas      |
| `EVT-PUR-003`  | recepción de proveedor aceptada, parcial o rechazada   | ORIGO                             | NEXO y NUMERA                                         | movimiento de inventario y efecto económico relacionados |
| `EVT-INV-001`  | existencia modificada por movimiento confirmado        | NEXO                              | FOGO, ORIGO, PULSO y NUMERA                           | disponibilidad y valoración derivada actualizadas        |
| `EVT-INV-002`  | conteo produjo una diferencia                          | NEXO                              | responsable autorizado y NUMERA cuando afecte costo   | diferencia revisable sin ajuste automático               |
| `EVT-TRF-001`  | traslado interno despachado                            | NEXO                              | lugar receptor                                        | carga pendiente de recepción                             |
| `EVT-TRF-002`  | traslado recibido, parcial o rechazado                 | NEXO                              | origen y NUMERA cuando aplique                        | remisión conciliada                                      |
| `EVT-PRD-001`  | necesidad de producción confirmada                     | aplicación que origina la demanda | FOGO                                                  | solicitud productiva trazable                            |
| `EVT-PRD-002`  | orden o lote productivo iniciado                       | FOGO                              | NEXO y responsables autorizados                       | insumos y ejecución relacionados                         |
| `EVT-PRD-003`  | lote terminado, retenido, liberado o rechazado         | FOGO                              | NEXO y NUMERA                                         | producto aceptado o excepción registrada                 |
| `EVT-SAL-001`  | pedido aceptado o modificado                           | PULSO                             | preparación, NEXO y tercero de entrega cuando aplique | pedido operativo vigente                                 |
| `EVT-SAL-002`  | venta cerrada, anulada o corregida                     | PULSO                             | NEXO y NUMERA                                         | efecto de existencias y económico relacionado            |
| `EVT-PAY-001`  | pago confirmado, rechazado o reversado                 | PULSO o dominio de pagos          | pedido, caja, PASS y NUMERA según finalidad           | estado financiero del pedido conciliado                  |
| `EVT-CASH-001` | cierre de caja realizado con diferencia                | PULSO                             | NUMERA y responsable autorizado                       | cierre económico disponible para conciliación            |
| `EVT-CUS-001`  | identidad o preferencia autorizada cambió              | PASS                              | PULSO                                                 | atención actualizada con datos mínimos                   |
| `EVT-DEL-001`  | pedido entregado a mensajería                          | PULSO                             | cliente, responsable y NUMERA cuando aplique          | custodia externa identificada                            |
| `EVT-DEL-002`  | entrega confirmada, fallida, parcial o devuelta        | PULSO                             | pedido, cliente, PASS y NUMERA según finalidad        | pedido cerrado o acción pendiente                        |
| `EVT-ECO-001`  | hecho económico operativo confirmado                   | aplicación propietaria del hecho  | NUMERA                                                | clasificación y análisis sin recrear el origen           |
| `EVT-ANA-001`  | indicador o análisis publicado                         | NUMERA                            | Gerencia y aplicaciones consumidoras                  | decisión informada sin alterar hechos                    |
| `EVT-DOC-001`  | documento vigente, reemplazado o archivado             | aplicación propietaria del hecho  | consumidoras autorizadas                              | versión documental correcta                              |
| `EVT-INC-001`  | incidente operativo o tecnológico declarado            | aplicación o área afectada        | responsable de continuidad o soporte                  | impacto, alternativa y seguimiento                       |
| `EVT-INC-002`  | servicio recuperado y conciliado                       | aplicación afectada               | responsables y consumidoras impactadas                | operación normal y pendientes conocidos                  |

Estos códigos identifican necesidades funcionales. No son nombres definitivos de tablas, topics, endpoints o funciones.

---

#### 9. Flujo objetivo de compras, inventario y producción

```text
necesidad de abastecimiento
        ↓
ORIGO aprueba y emite compra
        ↓
ORIGO confirma recepción real
        ↓
NEXO registra el efecto en existencias
        ↓
FOGO consulta disponibilidad y ejecuta producción
        ↓
FOGO confirma lote y resultado
        ↓
NEXO registra producto aceptado
        ↓
NUMERA consume efectos económicos confirmados
```

Reglas:

- una orden de compra no aumenta existencias;
- una recepción rechazada no crea entrada aceptada;
- una orden de producción no equivale a producto terminado;
- un lote retenido no queda disponible para venta;
- NUMERA no crea movimientos para cuadrar un informe.

---

#### 10. Flujo objetivo de pedido, venta, pago y entrega

```text
solicitud interna o externa
        ↓
PULSO acepta el pedido
        ↓
preparación y disponibilidad reciben la versión vigente
        ↓
pago se confirma o rechaza
        ↓
PULSO cierra la venta
        ↓
NEXO recibe el efecto de inventario
        ↓
entrega confirma resultado
        ↓
NUMERA consume el hecho económico
```

Reglas:

- una solicitud externa no es venta hasta ser aceptada internamente;
- un pago recibido dos veces no se aplica dos veces;
- una modificación del pedido conserva versión y referencia;
- la entrega fallida no se registra como entregada;
- anulación, devolución y compensación son resultados diferentes;
- el estado externo y el interno deberán poder conciliarse.

---

#### 11. Integraciones externas requeridas o candidatas

| Sistema externo    | Dirección funcional                | Situación actual                                | Necesidad objetivo                                                              |
| ------------------ | ---------------------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------- |
| Makos              | Makos → PULSO/NUMERA               | Excel manual                                    | conservar transición controlada, detalle y conciliación mientras siga vigente   |
| Rappi              | Rappi ↔ PULSO                      | traslado manual; sin API comprobada             | recibir pedido con referencia externa y devolver solo estados permitidos        |
| ManyChat           | ManyChat ↔ PULSO                   | traslado manual; sin integración comprobada     | convertir solicitud autorizada en pedido trazable y comunicar resultado mínimo  |
| Shopify            | Shopify ↔ PULSO                    | operación externa sin automatización comprobada | recibir pedido de Vaila Vainilla y conciliar pago, despacho y estado            |
| mensajería         | PULSO ↔ proveedor de entrega       | mensajes o comprobantes según operación         | asignar custodia y recibir entrega, fallo o devolución                          |
| banco              | banco → NUMERA                     | medio externo actual                            | importar o consultar movimientos para conciliación sin alterar el banco         |
| sistema contable   | sistema contable ↔ NUMERA/VISO     | alcance exacto por confirmar                    | intercambiar efectos económicos o laborales aprobados sin duplicar contabilidad |
| proveedor de pagos | proveedor ↔ dominio de pagos/PULSO | integración confirmada                          | conservar intención, webhook, conciliación, reversión y trazabilidad            |

Cada integración externa requerirá posteriormente confirmar contrato, titularidad, alcance, costo, ambiente de pruebas, límites y tratamiento de datos.

---

#### 12. Contenido mínimo común

Toda comunicación estructurada deberá poder relacionar:

| Dato                          | Regla                                         |
| ----------------------------- | --------------------------------------------- |
| identificador de comunicación | único para reconocer duplicados               |
| tipo y versión                | permite interpretar el contenido correcto     |
| aplicación de origen          | fuente propietaria                            |
| registro de origen            | identificador estable del hecho               |
| momento del hecho             | diferente del momento de entrega              |
| contexto empresarial          | sede, área, periodo o pedido cuando aplique   |
| versión del registro          | identifica correcciones y cambios             |
| relación anterior             | evento, solicitud o versión que la originó    |
| contenido mínimo              | únicamente datos necesarios para la receptora |
| clasificación de sensibilidad | indica restricciones posteriores de acceso    |

El correo, teléfono, dirección, documento personal o información bancaria solo se incluirán cuando la receptora los necesite para la finalidad autorizada.

---

#### 13. Fallos, duplicados y conciliación

Cuando una comunicación no termine correctamente:

```text
el origen conserva el hecho confirmado
        ↓
la entrega queda pendiente, fallida o rechazada
        ↓
no se aplica otra vez si ya fue aceptada
        ↓
se reintenta o revisa según diseño posterior
        ↓
origen y destino se concilian
```

Debe poder distinguirse:

1. la fuente nunca creó el hecho;
2. el hecho existe, pero no se envió;
3. se envió, pero el destino no lo recibió;
4. el destino lo recibió y lo rechazó;
5. el destino lo aceptó, pero no confirmó;
6. llegó repetido;
7. origen y destino muestran resultados diferentes.

`DIF-06` conserva para diseño técnico la selección de reintentos e idempotencia. Esta tarea fija el comportamiento empresarial esperado, no su implementación.

---

#### 14. Operación manual y contingencia

Una entrega manual podrá permanecer temporalmente cuando:

- la integración automática no exista;
- el proveedor externo no ofrezca acceso adecuado;
- se esté ejecutando una transición controlada;
- exista una contingencia documentada.

Cada entrega manual crítica deberá indicar:

- quién la preparó;
- de qué registro salió;
- fecha y periodo;
- qué archivo, papel o mensaje se entregó;
- quién lo recibió;
- qué resultado produjo;
- cómo se detectan filas faltantes o repetidas.

WhatsApp, llamadas y capturas seguirán siendo medios de coordinación, pero el estado final deberá quedar en la fuente propietaria.

---

#### 15. Dudas y comprobaciones

No se crean preguntas nuevas para trabajadores ni para el usuario.

La evidencia suficiente ya está distribuida en:

- `TEC-10` a `TEC-13`: estado real de Makos, Shopify, Rappi y ManyChat;
- `DAT-01` a `DAT-03`: capacidad de exportación e historia disponible en Makos;
- `DAT-08` a `DAT-13`: remisiones, producción y registros manuales;
- `DAT-20` y `DAT-21`: despacho y entrega de Vaila Vainilla;
- `DAT-23` a `DAT-27`: anulaciones, devoluciones, compensaciones, ajustes y mermas;
- `DIF-06`: mecanismo técnico de reintentos e idempotencia;
- `DIF-11`: separación entre traslado interno y entrega al cliente;
- `DIF-13`: separación entre hechos operativos y análisis consolidado.

Las preguntas pendientes completarán el detalle AS-IS. No impiden definir qué comunicación será necesaria entre las fuentes objetivo.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por comunicación familiar más excepción.
2. Se separan eventos, solicitudes, consultas, archivos, notificaciones y confirmaciones.
3. La fuente propietaria es la única emisora oficial del hecho.
4. Las receptoras producen resultados relacionados sin modificar el origen.
5. Toda comunicación conserva referencia estable, momento, versión y contexto.
6. Los duplicados no pueden duplicar efectos empresariales.
7. Compras, recepción e inventario son hechos diferentes.
8. Orden, lote y producto liberado son hechos diferentes.
9. Solicitud externa, pedido interno, venta, pago y entrega son hechos diferentes.
10. Traslado interno pertenece a NEXO y entrega al cliente pertenece a PULSO.
11. Los hechos operativos permanecen en sus aplicaciones; NUMERA recibe eventos para análisis.
12. Makos continúa mediante importación controlada durante la transición.
13. Shopify, Rappi y ManyChat no se declaran integrados automáticamente en el AS-IS.
14. Las integraciones externas futuras conservarán la referencia del proveedor.
15. AURA no recibe integraciones mientras siga sin diseño e implementación.
16. La operación manual deberá ser conciliable.
17. Los fallos no se ocultarán ni corregirán alterando otra fuente.
18. El mecanismo técnico se diseñará después de aprobar contratos funcionales.

---

#### 17. Lo que esta tarea no autoriza

- crear APIs, webhooks, colas, Edge Functions o trabajos programados;
- modificar tablas, migraciones o Supabase;
- desplegar integraciones con proveedores;
- solicitar credenciales, tokens o secretos;
- retirar Makos o cambiar plataformas externas;
- desarrollar AURA;
- definir permisos;
- elegir tiempos de reintento;
- implementar sincronización;
- modificar contratos TypeScript.

---

#### 18. Criterios de aceptación

`CAP-MAP-009` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades queden cubiertas;
- cada comunicación tenga emisora, receptora y resultado esperado;
- se distingan evento, solicitud, consulta, archivo, notificación y confirmación;
- compras, inventario, producción, ventas, pagos y entregas no compartan hechos ambiguos;
- las integraciones externas reflejen su estado real actual;
- Makos, Shopify, Rappi y ManyChat no se presenten como automatizados sin evidencia;
- los duplicados no puedan producir efectos repetidos;
- los fallos queden visibles y conciliables;
- NUMERA no se convierta en fuente de hechos operativos;
- no se anticipen mecanismos técnicos ni permisos;
- no se creen preguntas duplicadas;
- `CAP-MAP-010` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
hecho confirmado por su fuente
        ↓
evento o solicitud con referencia estable
        ↓
receptora produce su propio resultado
        ↓
aceptación, rechazo, duplicado o fallo visible
        ↓
conciliación entre origen y destino
```

La continuidad será exclusivamente:

```text
CAP-MAP-010
— Identificar permisos y controles de autorización requeridos
```

`CAP-MAP-010` definirá quién puede consultar, crear, cambiar, aprobar, rechazar o corregir cada resultado y cada comunicación, sin convertir cargos humanos en permisos técnicos ambiguos.


### ✅ CAP-MAP-010 — Identificar permisos y controles de autorización requeridos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de controles empresariales
**Dependencia anterior:** `CAP-MAP-009`
**Continuidad reservada:** `CAP-MAP-011`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué acciones necesitan autorización diferente;
- qué alcance territorial, organizacional o personal limita cada acción;
- cuándo basta con ejecutar el trabajo asignado;
- cuándo otra persona debe aprobar, rechazar o revisar;
- qué acciones sensibles exigen trazabilidad reforzada;
- qué ocurre cuando el equipo disponible no permite separar funciones;
- cómo se relacionan las capacidades empresariales con el modelo de autorización ya aprobado.

La cobertura se construye mediante:

```text
control base de la familia
+ riesgo de la acción
+ excepción de la subcapacidad
= autorización requerida
```

Esta tarea no crea un segundo catálogo de permisos. Reutiliza el catálogo canónico, las matrices `AUTH-RBAC-001` a `AUTH-RBAC-028`, los contratos de recurso y el ADR de autorización ya aprobados.

---

#### 2. Diferencias que deben conservarse

| Concepto           | Pregunta que responde                                              |
| ------------------ | ------------------------------------------------------------------ |
| Función humana     | ¿Qué trabajo realiza la persona?                                   |
| Rol base           | ¿Qué responsabilidades administrativas tiene normalmente?          |
| Rol operativo      | ¿Qué función está desempeñando durante una operación concreta?     |
| Permiso            | ¿Qué acción exacta puede solicitar?                                |
| Alcance            | ¿Sobre qué sedes, áreas, personas o registros puede hacerlo?       |
| Contexto           | ¿Está trabajando en el turno, lugar y dispositivo adecuados?       |
| Aprobación         | ¿Otra persona debe aceptar antes de que el resultado tenga efecto? |
| Revisión posterior | ¿Otra persona debe comprobar después lo realizado?                 |
| Propiedad del dato | ¿Qué aplicación gobierna el resultado?                             |

No equivalen:

```text
ser gerente = poder hacer cualquier cosa
tener check-in = recibir todos los permisos
usar una caja = convertirse en cajero autorizado
crear un registro = poder aprobarlo
ver un dato = poder cambiarlo
ser custodio = poder dar de baja un activo
```

---

#### 3. Acciones empresariales separadas

Cada subcapacidad utilizará únicamente las acciones que necesite:

| Acción             | Significado sencillo                               |
| ------------------ | -------------------------------------------------- |
| `CONSULTAR`        | ver el estado permitido                            |
| `CREAR`            | registrar un elemento nuevo                        |
| `SOLICITAR`        | pedir que otra persona o capacidad actúe           |
| `EJECUTAR`         | realizar el trabajo autorizado                     |
| `CAMBIAR_BORRADOR` | modificar antes de publicar, aprobar o cerrar      |
| `PUBLICAR`         | convertir un borrador en versión operativa         |
| `APROBAR`          | aceptar que una solicitud produzca efecto          |
| `RECHAZAR`         | impedir el efecto dejando motivo                   |
| `CORREGIR`         | reemplazar un dato vigente conservando el anterior |
| `CANCELAR`         | detener un trabajo o solicitud todavía reversible  |
| `ANULAR`           | dejar sin efecto un resultado ya confirmado        |
| `RECIBIR`          | aceptar custodia, mercancía o responsabilidad      |
| `CONCILIAR`        | comparar fuentes y registrar diferencias           |
| `EXPORTAR`         | producir una copia controlada                      |
| `ADMINISTRAR`      | cambiar reglas, catálogos, accesos o configuración |

Si el catálogo canónico ya contiene el permiso exacto, se reutilizará. Si falta una acción empresarial necesaria, se registrará como brecha para `CAP-MAP-014` y una futura versión del catálogo; no se inventará un código aislado dentro de esta tarea.

---

#### 4. Decisión de autorización canónica

Una acción solo podrá autorizarse cuando se cumpla:

```text
persona activa
+ permiso canónico exacto
+ carril base u operativo compatible
+ alcance válido
+ recurso real resuelto
+ contexto requerido
+ dispositivo permitido cuando aplique
+ ausencia de denegación
= acción autorizable
```

La autorización será denegada por defecto cuando:

- falte el permiso;
- el recurso no pueda ubicarse en un alcance válido;
- la sede o área no corresponda;
- el rol operativo no esté vigente;
- el turno o check-in sean obligatorios y no existan;
- el dispositivo no esté habilitado;
- exista una denegación individual o estructural;
- la acción necesite aprobación y todavía no la tenga;
- el estado del registro ya no permita esa acción.

---

#### 5. Modalidades ya aprobadas

| Modalidad              | Uso en esta tarea                                                       |
| ---------------------- | ----------------------------------------------------------------------- |
| `BASE_ONLY`            | administración que no depende de estar operando un turno                |
| `OPERATIONAL_ONLY`     | ejecución dentro de función, lugar y contexto operativo válidos         |
| `BASE_OR_OPERATIONAL`  | cualquiera de los dos carriles puede autorizar según sus propias reglas |
| `BASE_AND_OPERATIONAL` | necesita simultáneamente componente administrativo y contexto operativo |

Reglas:

1. El carril base no otorga autoridad operativa automática.
2. El carril operativo no crea alcance global.
3. El check-in demuestra presencia o contexto; no concede permisos por sí mismo.
4. El dispositivo compartido limita acciones, pero nunca reemplaza a la persona.
5. APP-REVIEW, pruebas y territorios aislados permanecen excluidos salvo autorización específica.
6. Ninguna tarea de este mapa modifica las matrices ya aprobadas.

---

#### 6. Niveles de control

| Nivel                       | Control requerido                                                      |
| --------------------------- | ---------------------------------------------------------------------- |
| `EJECUCIÓN_DIRECTA`         | la persona autorizada realiza y queda identificada                     |
| `APROBACIÓN_PREVIA`         | otra autoridad acepta antes de producir efecto                         |
| `DOBLE_CONTROL`             | quien ejecuta no puede ser quien aprueba                               |
| `REVISIÓN_POSTERIOR`        | otra persona revisa después dentro de un plazo definido posteriormente |
| `REAUTENTICACIÓN`           | se vuelve a comprobar identidad para una acción sensible               |
| `JUSTIFICACIÓN_OBLIGATORIA` | debe registrarse motivo y soporte                                      |
| `BLOQUEO`                   | la acción no está disponible hasta resolver una condición              |

Una misma acción puede combinar controles.

---

#### 7. Regla para equipos pequeños

Vento no siempre tendrá dos personas disponibles con la misma competencia. La falta de personal no eliminará el control.

Cuando una separación normal no pueda cumplirse:

```text
misma persona ejecuta excepcionalmente
        ↓
declara motivo de la excepción
        ↓
se conserva evidencia antes y después
        ↓
otra autoridad realiza revisión posterior
        ↓
la excepción queda visible en auditoría
```

No se permitirá excepción silenciosa para:

- creación o ampliación de accesos propios;
- eliminación de evidencia de auditoría;
- modificación oculta de ventas, pagos o inventario;
- pago a sí mismo;
- aprobación de una baja de activo bajo custodia propia;
- cambio directo de datos bancarios sin comprobación;
- acceso indiscriminado a documentos sensibles.

---

#### 8. Mapa base de control por familia

| Familia                           | Ejecución ordinaria                                    | Acciones de control reforzado                                                     |
| --------------------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------- |
| `CAP-01` Dirección y gobierno     | consulta, creación de borradores y seguimiento         | publicar política, aprobar decisión, aceptar riesgo y cambiar estructura          |
| `CAP-02` Personas y trabajo       | administrar información asignada y registrar novedades | contratar, retirar, cambiar pago, publicar horario y corregir información laboral |
| `CAP-03` Seguridad y salud        | registrar inspección, incidente o acción               | cerrar hallazgo crítico, aceptar riesgo o declarar cumplimiento                   |
| `CAP-04` Productos y oferta       | consultar y preparar catálogo o receta                 | publicar producto, receta, precio, promoción o cambio de vigencia                 |
| `CAP-05` Compras y proveedores    | solicitar, cotizar, ordenar y recibir según función    | aprobar compra, cambiar proveedor, aceptar diferencia y devolver                  |
| `CAP-06` Inventario y movimientos | recibir, mover, contar y despachar según contexto      | ajustar saldo, corregir movimiento, aprobar remisión y registrar merma            |
| `CAP-07` Activos                  | registrar, custodiar, contar y mantener                | transferir custodia, cambiar condición, aprobar reparación o dar de baja          |
| `CAP-08` Producción               | planear y ejecutar orden o lote                        | publicar receta, liberar lote, aceptar desviación y corregir rendimiento          |
| `CAP-09` Venta y servicio         | crear pedido, preparar, cobrar y cerrar según función  | descuentos, anulaciones, devoluciones, compensaciones y corrección de pago        |
| `CAP-10` Clientes                 | atender solicitud y consultar datos mínimos            | cambiar identidad, consentimiento, saldo, beneficio o información sensible        |
| `CAP-11` Despacho y entrega       | preparar, custodiar, transportar y confirmar           | cambiar destino, aceptar pérdida, cerrar entrega fallida o devolución             |
| `CAP-12` Finanzas                 | registrar, clasificar, consultar y conciliar           | aprobar pago, cambiar cuenta, cerrar periodo y modificar información económica    |
| `CAP-13` Instalaciones            | reportar, inspeccionar y ejecutar mantenimiento        | aprobar gasto, cerrar riesgo o cambiar condición crítica                          |
| `CAP-14` Mercadeo                 | preparar contenido o propuesta                         | publicar, activar promoción, comprometer presupuesto o usar datos personales      |
| `CAP-15` Tecnología               | reportar, diagnosticar y ejecutar soporte asignado     | conceder acceso, cambiar configuración crítica, desplegar o borrar información    |
| `CAP-16` Información y documentos | crear, consultar y archivar según responsabilidad      | publicar versión, entregar información sensible o eliminar según retención        |
| `CAP-17` Datos y análisis         | consultar, calcular y documentar                       | cambiar definición, publicar indicador o certificar calidad                       |
| `CAP-18` Continuidad              | reportar incidente y ejecutar alternativa asignada     | activar contingencia, aceptar pérdida, restaurar y cerrar conciliación            |

---

#### 9. Separaciones obligatorias o preferidas

| Caso                                       | Quien inicia o ejecuta   | Quien controla                                     | Nivel                |
| ------------------------------------------ | ------------------------ | -------------------------------------------------- | -------------------- |
| alta o cambio de proveedor                 | Compras                  | responsable autorizado distinto                    | `DOBLE_CONTROL`      |
| solicitud y aprobación de compra           | solicitante              | aprobador según alcance                            | `DOBLE_CONTROL`      |
| recepción con diferencia                   | receptor                 | responsable de compra o sede                       | `APROBACIÓN_PREVIA`  |
| conteo y ajuste de inventario              | contador                 | aprobador del ajuste                               | `DOBLE_CONTROL`      |
| remisión despachada y recibida             | origen                   | receptor del destino                               | `DOBLE_CONTROL`      |
| ejecución y liberación de lote             | producción               | responsable de calidad o supervisor cuando aplique | `DOBLE_CONTROL`      |
| venta y anulación                          | cajero                   | responsable autorizado                             | `DOBLE_CONTROL`      |
| devolución o compensación                  | persona que atiende      | responsable autorizado                             | `APROBACIÓN_PREVIA`  |
| corrección de medio de pago                | caja                     | Contabilidad o responsable autorizado              | `DOBLE_CONTROL`      |
| preparación y aprobación de pago           | Contabilidad             | Gerencia o titular autorizado                      | `DOBLE_CONTROL`      |
| registro y conciliación bancaria           | registrador              | revisor autorizado                                 | `REVISIÓN_POSTERIOR` |
| cálculo y aprobación de pago laboral       | Contabilidad o proveedor | Gerencia autorizada                                | `DOBLE_CONTROL`      |
| solicitud y concesión de acceso            | solicitante o jefe       | administrador autorizado diferente                 | `DOBLE_CONTROL`      |
| cambio de permisos propios                 | persona afectada         | autoridad distinta                                 | `BLOQUEO`            |
| custodia y baja de activo                  | custodio                 | aprobador de baja distinto                         | `DOBLE_CONTROL`      |
| autoría y publicación de documento crítico | autor                    | aprobador documental                               | `DOBLE_CONTROL`      |
| cambio técnico y paso a producción         | ejecutor técnico         | aprobador del cambio                               | `DOBLE_CONTROL`      |

Cuando el control figure como preferido y no haya dos personas disponibles, aplicará la excepción documentada del apartado 7. Los bloqueos expresos no admiten autocontrol.

---

#### 10. Controles específicos: personas y seguridad

1. Cada trabajador podrá consultar únicamente su información propia cuando el contrato `OWN` lo permita.
2. Consultar documentos o información de otra persona requerirá permiso y finalidad laboral.
3. Crear, cambiar o retirar una relación laboral será una acción diferente.
4. Publicar o corregir un horario conservará versión y responsable.
5. La hora original de una marcación no se reemplazará silenciosamente.
6. Una corrección de asistencia, si se diseña, distinguirá marcación observada, explicación y decisión administrativa.
7. El cálculo, aprobación y pago laboral serán controles separados.
8. Los incidentes de seguridad y salud tendrán visibilidad limitada por sensibilidad.
9. Cerrar una acción correctiva requerirá evidencia, no solo cambiar su estado.
10. Declarar cumplimiento no será una acción operativa ordinaria.

`TEC-14` y `TEC-15` se conservan como evidencia: horarios pueden editarse en VISO y ANIMA; la hora de asistencia no tiene corrección comprobada.

---

#### 11. Controles específicos: compras, inventario, activos y producción

1. Solicitar, aprobar, ordenar, recibir y devolver una compra serán acciones separadas.
2. Quien recibe podrá rechazar o registrar diferencia dentro de su alcance, pero no ampliar la orden por su cuenta.
3. Un ajuste de inventario requerirá motivo, referencia al conteo o hecho y autorización independiente.
4. La merma conservará producto, cantidad, lugar, momento, causa y responsable.
5. Despachar una remisión no permitirá confirmarla como recibida desde el mismo lado.
6. Cambiar origen o destino exigirá volver a evaluar ambos alcances.
7. El custodio de un activo no podrá aprobar su propia baja.
8. La reparación externa no autorizará a cambiar el maestro del activo.
9. Crear un lote y liberarlo serán acciones distintas cuando exista control de calidad.
10. Una desviación de receta o rendimiento requerirá justificación y revisión.

Las respuestas `OPE-04` a `OPE-06` completarán quién realiza hoy estas autorizaciones sin alterar el control objetivo.

---

#### 12. Controles específicos: ventas, clientes y entregas

1. Crear, modificar, cobrar, cerrar y anular un pedido o venta serán acciones diferentes.
2. Un descuento fuera de la regla ordinaria requerirá autorización identificable.
3. Devolución, reposición, descuento y entrega de dinero conservarán motivo y relación con la venta.
4. La corrección del medio de pago no existirá como edición silenciosa; deberá ser una operación auditable.
5. El cajero no aprobará su propia anulación o compensación cuando exista otra autoridad disponible.
6. Los datos del cliente se limitarán a la finalidad de atención, entrega o beneficio.
7. Cambiar identidad o consentimiento requerirá comprobación reforzada.
8. El domiciliario o mensajero recibirá solo información necesaria para entregar.
9. Confirmar entrega no permitirá modificar el pago.
10. Una entrega fallida conservará causa, evidencia y siguiente acción.

`TEC-16` confirma que no existe corrección manual auditable de medio de pago en PULSO. `OPE-07`, `OPE-10` y `OPE-11` permanecen como comprobaciones AS-IS.

---

#### 13. Controles específicos: finanzas, tecnología y documentos

1. Registrar un hecho económico, aprobar un pago y ejecutar el pago serán acciones distintas.
2. Cambiar datos bancarios requerirá comprobación fuera del mismo cambio y trazabilidad reforzada.
3. Cerrar un periodo bloqueará cambios ordinarios; las correcciones posteriores serán ajustes identificados.
4. NUMERA podrá clasificar y analizar, pero no cambiar los hechos operativos de origen.
5. Crear, ampliar, suspender y retirar accesos serán permisos diferentes cuando el catálogo lo requiera.
6. Nadie podrá concederse a sí mismo una ampliación de autoridad.
7. Una cuenta técnica no actuará como persona ni recibirá funciones empresariales.
8. Los dispositivos compartidos permitirán únicamente paquetes explícitos y contexto válido.
9. Publicar un cambio técnico requerirá evidencia de prueba y aprobación separada.
10. Eliminar un documento dependerá de retención, sensibilidad y autoridad, no solo de poder verlo.
11. Las exportaciones sensibles deberán registrar quién, qué alcance y cuándo.
12. Los informes no podrán mostrar sedes, personas o importes fuera del alcance autorizado.

---

#### 14. Sensibilidad y comprobación reforzada

| Nivel       | Ejemplos                                                | Control mínimo                                     |
| ----------- | ------------------------------------------------------- | -------------------------------------------------- |
| `ORDINARIO` | catálogo público, estado operativo permitido            | permiso y alcance                                  |
| `INTERNO`   | pedidos, existencias, producción y compras              | permiso, alcance y auditoría                       |
| `SENSIBLE`  | documentos laborales, costos, clientes y conciliaciones | permiso explícito, finalidad y auditoría reforzada |
| `CRÍTICO`   | accesos, datos bancarios, pagos, cierres y eliminación  | separación, reautenticación y evidencia            |

La clasificación exacta de campos ya definida en el modelo de autorización prevalecerá sobre cualquier ejemplo general de esta tarea.

---

#### 15. Dudas pendientes reutilizadas

No se crean preguntas nuevas.

Las prácticas actuales que todavía necesitan confirmación ya están expresadas de forma sencilla en el registro independiente:

| Códigos  | Qué permiten confirmar                         |
| -------- | ---------------------------------------------- |
| `OPE-04` | quién autoriza cambiar una remisión enviada    |
| `OPE-05` | quién decide rechazar mercancía diferente      |
| `OPE-06` | quién autoriza un ajuste después del conteo    |
| `OPE-07` | quién autoriza corregir un medio de pago       |
| `OPE-08` | quién autoriza cambiar un horario publicado    |
| `OPE-09` | quién autoriza tratar una marcación equivocada |
| `OPE-10` | quién decide una devolución                    |
| `OPE-11` | quién aprueba una compensación                 |

Estas respuestas describirán el AS-IS. No crearán permisos técnicos por nombre de persona o cargo.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por control familiar más excepción.
2. Consultar, crear, ejecutar, aprobar, corregir, cancelar y anular son acciones diferentes.
3. Se reutilizan los 112 permisos y matrices ya aprobados.
4. El acceso a una aplicación no concede sus acciones internas.
5. La autorización requiere permiso, alcance, recurso, contexto y ausencia de denegación.
6. El check-in y el dispositivo no crean autoridad.
7. El propietario y la Gerencia no reciben operación universal por su cargo.
8. El creador de un registro no obtiene automáticamente derecho a aprobarlo.
9. Las acciones financieras, de acceso y de corrección crítica requieren doble control.
10. Los equipos pequeños usarán excepción documentada y revisión posterior, nunca bypass silencioso.
11. Las fuentes propietarias de `CAP-MAP-008` conservan el control de sus datos.
12. Las integraciones de `CAP-MAP-009` no amplían los permisos de la receptora.
13. NUMERA no corrige hechos de otras aplicaciones.
14. AURA no recibe permisos funcionales ejecutables mientras no exista.
15. Toda corrección sensible conserva valor anterior, motivo y responsable.
16. Las preguntas AS-IS permanecen en el registro independiente.

---

#### 17. Lo que esta tarea no autoriza

- cambiar los 112 permisos aprobados;
- modificar matrices RBAC;
- insertar concesiones o denegaciones;
- crear usuarios, roles o accesos;
- modificar Supabase, RLS, RPC o migraciones;
- implementar pantallas o guards;
- asignar permisos a personas concretas;
- crear bypasses por cargo;
- inventar umbrales monetarios;
- desarrollar AURA;
- iniciar remodelación de código.

---

#### 18. Criterios de aceptación

`CAP-MAP-010` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades queden cubiertas;
- las acciones empresariales estén separadas;
- se reutilice el modelo de autorización aprobado;
- ninguna persona, cargo, dispositivo o check-in equivalga a autoridad universal;
- las acciones sensibles tengan control reforzado;
- las separaciones críticas estén identificadas;
- exista tratamiento realista para equipos pequeños;
- los alcances territoriales y de recurso permanezcan obligatorios;
- las correcciones conserven trazabilidad;
- las integraciones no amplíen permisos;
- no se creen preguntas duplicadas;
- no se modifiquen permisos ni matrices en esta fase;
- `CAP-MAP-011` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
acción empresarial exacta
        ↓
permiso canónico aplicable
        ↓
alcance, recurso y contexto
        ↓
aprobación o separación cuando corresponda
        ↓
autorización, denegación y trazabilidad
```

La continuidad será exclusivamente:

```text
CAP-MAP-011
— Identificar pantallas, dispositivos, documentos y evidencia requeridos
```

`CAP-MAP-011` definirá qué superficie permite realizar cada acción, qué dispositivo puede utilizarse y qué evidencia debe quedar, sin confundir una pantalla visible con autoridad suficiente.

### ✅ CAP-MAP-011 — Identificar pantallas, dispositivos, documentos y evidencia requeridos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** definición documental de superficies y evidencia
**Dependencia anterior:** `CAP-MAP-010`
**Continuidad reservada:** `CAP-MAP-012`

---

#### 1. Resultado de esta tarea

Esta tarea define, para las **217 subcapacidades**:

- qué tipo de pantalla o medio permite realizar el trabajo;
- qué dispositivo resulta adecuado para el lugar y la función;
- qué documento debe generarse, recibirse o conservarse;
- qué evidencia demuestra que ocurrió el resultado;
- qué información debe verse antes de decidir;
- qué debe quedar visible cuando existe un error, diferencia o pendiente;
- qué medios actuales son operación principal, evidencia, copia o contingencia.

La cobertura se construye mediante:

```text
superficie base de la familia
+ necesidad del lugar y actor
+ documento o evidencia crítica
= interfaz y evidencia requerida
```

Esta tarea define necesidades funcionales. No diseña todavía rutas definitivas, componentes visuales, hardware, formatos finales ni almacenamiento físico.

---

#### 2. Diferencias que deben conservarse

| Concepto     | Significado sencillo                                                |
| ------------ | ------------------------------------------------------------------- |
| Pantalla     | lugar visual donde una persona consulta o realiza una acción        |
| Dispositivo  | aparato desde el cual se usa una aplicación                         |
| Documento    | contenido con identidad, propósito, versión y conservación          |
| Comprobante  | documento que confirma un resultado concreto                        |
| Evidencia    | información que permite demostrar qué ocurrió                       |
| Adjunto      | foto, archivo, firma o soporte relacionado                          |
| Copia        | reproducción que no reemplaza el registro principal                 |
| Impresión    | copia física generada desde un registro                             |
| Contingencia | medio temporal usado cuando la superficie normal no está disponible |

No equivalen:

```text
ver un botón = tener permiso
tener una pantalla = proceso terminado
tomar una foto = registrar cantidades
imprimir un PDF = crear una segunda fuente de verdad
usar un dispositivo compartido = perder la identidad del trabajador
tener una firma = demostrar que todo el contenido es correcto
```

---

#### 3. Tipos de superficie requeridos

| Superficie         | Uso principal                                                             |
| ------------------ | ------------------------------------------------------------------------- |
| `BANDEJA`          | ver trabajo pendiente, prioridad, responsable y estado                    |
| `LISTA`            | buscar, filtrar y comparar varios registros                               |
| `DETALLE`          | consultar un registro completo, relaciones e historial                    |
| `FORMULARIO`       | crear o cambiar información permitida                                     |
| `ASISTENTE`        | guiar una actividad con pasos y validaciones                              |
| `APROBACIÓN`       | revisar diferencias, soportes y aceptar o rechazar                        |
| `OPERACIÓN_RÁPIDA` | registrar acciones frecuentes con pocos pasos                             |
| `CONTEO`           | capturar cantidades y diferencias sin revelar el saldo cuando corresponda |
| `RECEPCIÓN`        | comparar esperado, recibido, rechazado y pendiente                        |
| `DESPACHO`         | preparar, verificar, entregar custodia y confirmar salida                 |
| `SEGUIMIENTO`      | mostrar etapas, responsables, tiempos y novedades                         |
| `TABLERO`          | resumir indicadores sin permitir corregir hechos de origen                |
| `DOCUMENTO`        | visualizar, generar, firmar o descargar una versión                       |
| `AUDITORÍA`        | mostrar quién hizo qué, cuándo, antes y después                           |
| `CONTINGENCIA`     | capturar lo mínimo cuando la operación normal falla                       |

Una subcapacidad puede necesitar varias superficies, pero cada una deberá tener un propósito distinto.

---

#### 4. Principios de diseño funcional

1. La pantalla mostrará primero la decisión o trabajo principal.
2. Las acciones irreversibles o sensibles estarán separadas de la operación ordinaria.
3. Un cambio mostrará el valor actual y el valor propuesto.
4. Rechazos, diferencias y faltantes no se esconderán dentro de notas libres.
5. Los estados usarán palabras comprensibles para la persona que opera.
6. Las pantallas de dispositivo compartido evitarán información administrativa innecesaria.
7. Una persona no verá datos de otras sedes, áreas o personas fuera de su autorización.
8. La interfaz no confiará en ocultar botones como único control de seguridad.
9. Una acción exitosa dejará confirmación visible y referencia consultable.
10. Una acción fallida explicará qué quedó guardado y qué debe repetirse.
11. Los documentos generados indicarán origen, fecha, versión y estado.
12. Las copias exportadas advertirán que pueden quedar desactualizadas.
13. Las fotos y firmas se pedirán solo cuando aporten evidencia necesaria.
14. La operación deberá poder continuar sin conocimientos técnicos.

---

#### 5. Clases de dispositivo

| Clase                     | Uso                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------- |
| `PERSONAL_ADMINISTRATIVO` | computador personal autenticado para Gerencia, Contabilidad, Compras, VISO y configuración  |
| `PERSONAL_MÓVIL`          | teléfono de trabajador o cliente para ANIMA, PASS, notificaciones y acciones propias        |
| `COMPARTIDO_OPERATIVO`    | terminal de caja, barra, cocina, producción, bodega o recepción                             |
| `MÓVIL_DE_CAMPO`          | entrega, inspección, mantenimiento, conteo o traslado                                       |
| `PANTALLA_DE_SEGUIMIENTO` | visualización operativa sin autoridad por sí misma                                          |
| `IMPRESORA_PERIFÉRICO`    | comanda, etiqueta, recibo o documento; nunca representa una persona                         |
| `EXTERNO`                 | dispositivo o portal de banco, Makos, Shopify, Rappi, ManyChat, mensajería u otro proveedor |

Se reutilizan las 14 plantillas objetivo y reglas de `AUTH-RBAC-023`. Esta tarea no crea nuevas concesiones por dispositivo.

---

#### 6. Reglas para dispositivos compartidos

1. Solo habrá un actor humano efectivo por sesión.
2. La plantilla y la instancia podrán restringir, nunca ampliar permisos.
3. La sede y área del dispositivo deberán coincidir con la operación.
4. Cambiar de persona exigirá terminar o transferir claramente la sesión anterior.
5. Un PIN o código rápido identificará a la persona únicamente dentro del mecanismo aprobado; no será permiso.
6. La pantalla se bloqueará al abandonar la operación o vencer el contexto.
7. Caja, barra, cocina, producción, bodega y recepción conservarán funciones distintas.
8. El dispositivo no almacenará credenciales personales visibles.
9. Las acciones sensibles usarán reautenticación cuando el modelo aprobado lo exija.
10. Una impresora, escáner o cámara será periférico del actor efectivo, no actor independiente.

---

#### 7. Jerarquía de evidencia

| Nivel | Evidencia                                                           | Fuerza                             |
| ----- | ------------------------------------------------------------------- | ---------------------------------- |
| `E1`  | registro estructurado en la fuente propietaria                      | principal                          |
| `E2`  | evento de auditoría con actor, momento, alcance y cambio            | principal de trazabilidad          |
| `E3`  | confirmación independiente de otra persona o sistema                | reforzada                          |
| `E4`  | documento generado y relacionado con el registro                    | comprobante                        |
| `E5`  | documento externo, factura, extracto, guía o respuesta de proveedor | soporte externo                    |
| `E6`  | foto, firma, archivo o nota adjunta                                 | complemento                        |
| `E7`  | chat, llamada, captura, papel o relato                              | evidencia manual o de contingencia |

Un nivel inferior podrá complementar, pero no reemplazar silenciosamente un registro principal cuando este deba existir.

---

#### 8. Registro mínimo de evidencia

| Campo            | Contenido                                                |
| ---------------- | -------------------------------------------------------- |
| hecho respaldado | resultado de `CAP-MAP-007`                               |
| fuente           | aplicación propietaria de `CAP-MAP-008`                  |
| actor            | persona o sistema identificado                           |
| momento          | fecha y hora del hecho                                   |
| lugar            | sede, área o ubicación aplicable                         |
| versión          | estado o versión antes y después                         |
| referencia       | pedido, compra, remisión, lote, pago, activo o documento |
| resultado        | completo, parcial, rechazado, cancelado o corregido      |
| motivo           | obligatorio en excepciones o cambios sensibles           |
| soporte          | documento, foto, firma o archivo cuando corresponda      |
| revisión         | aprobación o comprobación independiente cuando aplique   |
| conservación     | regla posterior de retención y acceso                    |

---

#### 9. Mapa de superficies, dispositivos y evidencia por familia

| Familia                           | Superficie principal                                      | Dispositivo habitual objetivo                  | Evidencia principal                                     |
| --------------------------------- | --------------------------------------------------------- | ---------------------------------------------- | ------------------------------------------------------- |
| `CAP-01` Dirección y gobierno     | bandeja, detalle, aprobación y documento                  | personal administrativo                        | decisión, versión, aprobación y seguimiento             |
| `CAP-02` Personas y trabajo       | administración VISO y experiencia personal ANIMA          | computador administrativo y móvil personal     | relación laboral, turno, marcación, novedad y documento |
| `CAP-03` Seguridad y salud        | inspección, incidente, acción y seguimiento               | computador o móvil de campo                    | hallazgo, foto necesaria, acción y cierre comprobado    |
| `CAP-04` Productos y oferta       | catálogo, receta, publicación y consulta operativa        | computador administrativo y terminal operativa | versión de producto, receta, precio y vigencia          |
| `CAP-05` Compras y proveedores    | solicitud, comparación, orden, recepción y aprobación     | computador y terminal de recepción             | oferta, orden, factura, cantidades y diferencias        |
| `CAP-06` Inventario y movimientos | operación rápida, conteo, remisión, recepción y auditoría | kiosco de bodega o móvil de campo              | movimiento, conteo, ajuste, custodia y confirmación     |
| `CAP-07` Activos                  | ficha, custodia, conteo, mantenimiento y baja             | computador o móvil de campo                    | identificación, ubicación, condición, foto y entrega    |
| `CAP-08` Producción               | plan, orden, lote, consumo, control y liberación          | terminal de producción                         | receta usada, cantidades, rendimiento, control y lote   |
| `CAP-09` Venta y servicio         | punto de venta, preparación, pago y cierre                | terminal de caja, barra, cocina o mostrador    | pedido, comanda, venta, pago y comprobante              |
| `CAP-10` Clientes                 | atención PULSO y experiencia PASS                         | terminal autorizado y móvil personal           | consentimiento, solicitud, solución y comunicación      |
| `CAP-11` Despacho y entrega       | despacho, seguimiento y confirmación                      | kiosco, móvil de campo o portal externo        | carga, custodia, guía, entrega, fallo o devolución      |
| `CAP-12` Finanzas                 | registro, conciliación, aprobación y tablero              | computador personal administrativo             | soporte, movimiento, conciliación, cierre e informe     |
| `CAP-13` Instalaciones            | solicitud, inspección, orden de trabajo y cierre          | computador o móvil de campo                    | condición inicial, trabajo, gasto y condición final     |
| `CAP-14` Mercadeo                 | borrador, aprobación, publicación y medición              | computador administrativo                      | versión aprobada, publicación, presupuesto y resultado  |
| `CAP-15` Tecnología               | caso, diagnóstico, cambio, prueba y recuperación          | computador administrativo o móvil técnico      | ticket, cambio, prueba, aprobación y cierre             |
| `CAP-16` Información y documentos | documento, versión, búsqueda, entrega y auditoría         | dispositivo autorizado según sensibilidad      | versión, acceso, firma, entrega y conservación          |
| `CAP-17` Datos y análisis         | definición, tablero, informe y calidad                    | computador administrativo                      | definición, periodo, fuentes, cálculo y publicación     |
| `CAP-18` Continuidad              | incidente, operación mínima, recuperación y conciliación  | dispositivo disponible autorizado              | impacto, alternativa, recuperación y pendientes         |

---

#### 10. Superficies críticas por flujo

##### 10.1. Compra y recepción

Se requieren superficies separadas para:

1. solicitar;
2. comparar ofertas;
3. aprobar;
4. emitir orden;
5. recibir;
6. registrar diferencias;
7. aceptar, rechazar o devolver;
8. consultar evidencia y auditoría.

La pantalla de recepción mostrará esperado, recibido, aceptado, rechazado y pendiente sin convertir automáticamente la orden en inventario.

##### 10.2. Inventario y traslado

Se requieren:

- consulta de disponibilidad;
- conteo sin sesgo cuando aplique;
- explicación de diferencia;
- aprobación de ajuste;
- preparación de remisión;
- confirmación de despacho;
- recepción independiente;
- conciliación entre ambos extremos.

##### 10.3. Producción

Se requieren:

- necesidad y plan;
- orden priorizada;
- receta publicada;
- captura de consumo y resultado;
- control de calidad;
- liberación, retención o rechazo;
- cierre con rendimiento y diferencias.

##### 10.4. Venta, pago y entrega

Se requieren:

- pedido vigente;
- preparación por área;
- cobro y estado de pago;
- cierre o anulación separada;
- despacho y custodia;
- entrega, fallo o devolución;
- comprobante para cliente;
- auditoría de descuentos, compensaciones y correcciones.

---

#### 11. Documentos mínimos por dominio

| Dominio       | Documentos o comprobantes necesarios                                   |
| ------------- | ---------------------------------------------------------------------- |
| gobierno      | decisión, política, acta, riesgo aceptado y seguimiento                |
| personas      | vinculación, turno publicado, novedad, pago laboral y retiro           |
| seguridad     | inspección, incidente, acción correctiva y evidencia de cierre         |
| catálogo      | ficha de producto, versión de receta, especificación y publicación     |
| compras       | solicitud, comparación, orden, factura, recepción y devolución         |
| inventario    | remisión, conteo, ajuste, merma y constancia de recepción              |
| activos       | ficha, custodia, préstamo, mantenimiento, reparación y baja            |
| producción    | orden, hoja o registro de lote, control y liberación                   |
| ventas        | pedido, comanda, factura o documento equivalente, recibo y anulación   |
| clientes      | consentimiento, reserva, caso, devolución y solución                   |
| entrega       | manifiesto o guía, custodia, entrega, fallo y devolución               |
| finanzas      | soporte, cierre de caja, cuenta, conciliación, presupuesto e informe   |
| instalaciones | orden de trabajo, inspección, gasto y cierre                           |
| mercadeo      | aprobación, pieza, publicación, promoción y resultado                  |
| tecnología    | solicitud, incidente, cambio, prueba, acceso y cierre                  |
| información   | documento controlado, versión, firma, entrega y eliminación autorizada |
| análisis      | definición, fuente, periodo, cálculo, informe y limitaciones           |
| continuidad   | incidente, operación mínima, recuperación y conciliación               |

No todo documento necesita ser PDF o papel. Puede ser un registro estructurado con una vista o exportación verificable.

---

#### 12. Regla de facturación y titular documental

Las respuestas incorporadas en `GOV-05` y `GOV-08` a `GOV-12` confirman que marca, titular documental y emisor de factura no siempre coinciden.

Por tanto:

1. ningún documento asumirá el emisor únicamente por la marca mostrada;
2. la operación deberá seleccionar o derivar el emisor permitido para el caso;
3. la factura conservará el titular realmente utilizado;
4. Vaila Vainilla admite actualmente más de una alternativa según el caso;
5. catering se tratará según el titular confirmado en el registro;
6. el historial conservará cambios de emisor y soporte aplicable;
7. ninguna pantalla inventará RUT, Cámara de Comercio o relación jurídica inexistente;
8. la validación tributaria y jurídica continuará con los responsables profesionales.

La respuesta `ADM-02` confirma que la dirección registral usada por Vento Group corresponde al Centro de Producción. Los documentos deberán tomar la dirección desde la fuente administrativa vigente, sin copiarla manualmente en cada aplicación.

##### 12.1. Venta a consumidor final y factura solicitada

PULSO deberá separar dos decisiones:

```text
registrar íntegramente la venta y sus impuestos
        ≠
identificar al comprador para expedir el documento a su nombre
```

Reglas funcionales:

1. Toda venta se registrará con productos, valores, impuestos, medio de pago, emisor y documento fiscal aplicable.
2. Si el comprador no solicita que la factura electrónica o el documento equivalente electrónico POS sea expedido a su nombre, PULSO no obligará a registrar un cliente.
3. En ese caso se utilizará la identificación reglamentaria de `CONSUMIDOR FINAL`.
4. Si el comprador solicita el documento a su nombre, se pedirán únicamente los datos permitidos y necesarios.
5. El correo no será obligatorio cuando el comprador elija una representación gráfica impresa y la norma vigente lo permita.
6. La elección entre consumidor final y comprador identificado no modificará por sí sola impuestos, ingresos ni valores de la venta.
7. El medio de pago no decidirá si la venta se registra o si causa impuestos.
8. El flujo rápido de caja no exigirá crear perfiles de clientes ficticios.
9. La factura electrónica de venta y el documento equivalente electrónico POS serán tipos documentales distintos, relacionados con la misma venta.
10. PULSO deberá permitir cambiar al flujo identificado antes de cerrar el documento, sin rehacer el pedido.
11. Notas crédito, anulaciones o sustituciones posteriores seguirán la norma vigente y conservarán la relación con el documento original.
12. Las reglas tributarias se validarán nuevamente con Contabilidad antes de implementar o desplegar el POS.

Base normativa revisada para esta decisión:

- Resolución DIAN 000202 de 2025: cuando el adquirente no solicita que el documento sea expedido a su nombre, no se le piden datos y se expide a consumidor final;
- Resolución DIAN 000165 de 2023 y su compilación vigente: regula factura electrónica y documento equivalente electrónico POS.

---

#### 13. Evidencia ante correcciones y excepciones

| Acción                      | Evidencia mínima                                        |
| --------------------------- | ------------------------------------------------------- |
| corregir horario            | versión anterior, nueva versión, motivo y responsable   |
| tratar marcación equivocada | hora observada intacta, explicación y decisión          |
| ajustar inventario          | conteo o hecho origen, diferencia, motivo y aprobación  |
| cambiar remisión            | versión anterior, cambio y autorización                 |
| anular venta                | venta original, motivo, valores afectados y aprobador   |
| corregir pago               | pago original, operación correctiva y conciliación      |
| devolver o compensar        | pedido, producto o valor, motivo, solución y aprobación |
| cambiar receta o producto   | versión anterior, nueva versión, vigencia y publicación |
| liberar lote                | controles, resultado y responsable                      |
| aprobar pago                | soporte, beneficiario, valor y doble control            |
| cambiar acceso              | solicitud, decisión, alcance anterior y nuevo           |
| eliminar documento          | regla de retención, motivo, autoridad y constancia      |
| cerrar incidente            | impacto, recuperación, comprobación y pendientes        |

No se exigirá fotografía cuando el registro estructurado y la confirmación independiente sean suficientes.

---

#### 14. Exportaciones y evidencia de auditoría

La evidencia AS-IS confirma:

- NEXO exporta CSV o Excel en algunos flujos;
- VISO y ANIMA exportan Excel;
- ORIGO y FOGO generan PDF;
- PULSO importa Excel Makos, pero no tiene exportación comprobada;
- NUMERA no tiene exportación encontrada.

El objetivo exige:

1. exportar únicamente dentro del alcance autorizado;
2. identificar fecha, filtros, periodo y persona que exporta;
3. evitar que una exportación se considere editable como fuente;
4. proteger información personal, financiera o sensible;
5. permitir auditoría de resultados críticos aunque no exista descarga;
6. registrar las brechas de exportación durante `CODE-AUD-002`, `CODE-AUD-010` y diseño posterior.

---

#### 15. Fallos, impresión y contingencia

Cuando una pantalla, red, impresora o dispositivo falle:

- el sistema indicará si la operación quedó guardada;
- repetir una acción no duplicará el resultado;
- la impresión podrá repetirse identificándola como copia;
- el papel de contingencia tendrá referencia, fecha, persona y posterior conciliación;
- una foto o captura no sustituirá indefinidamente el registro pendiente;
- el cierre de contingencia confirmará qué fue registrado y qué sigue faltando;
- los datos sensibles no quedarán expuestos en pantallas o papeles abandonados.

El funcionamiento exacto sin internet permanece en `DIF-05` y se diseñará con continuidad y piloto.

---

#### 16. Dudas y auditorías reutilizadas

No se crean preguntas nuevas.

Esta tarea reutiliza:

- las respuestas `ADM-02`, `GOV-05` y `GOV-08` a `GOV-12`;
- `DAT-08` a `DAT-13` para remisiones, producción y registros manuales;
- `DAT-16` a `DAT-27` para inspecciones, decisiones, entregas, propinas, anulaciones, devoluciones, ajustes y mermas;
- `TEC-17` para exportaciones existentes;
- `AUTH-RBAC-023` para dispositivos compartidos;
- `OPS-PLAN-003` para autocuestionarios operativos;
- `CODE-AUD-002` para inventario de rutas, pantallas, componentes y formularios;
- `CODE-AUD-010` para detectar interfaces sin lógica completa;
- `CAP-SCOPE-015` para dispositivos, redes, impresión y soporte;
- `CAP-SCOPE-016` para privacidad, conservación y auditoría.

Las respuestas pendientes describirán el AS-IS, pero no bloquean esta definición funcional.

---

#### 17. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas por superficie familiar más excepción.
2. Pantalla, dispositivo, documento, evidencia, copia y contingencia son conceptos distintos.
3. Una pantalla visible no concede permiso.
4. Los dispositivos compartidos conservan actor humano, sede, área y plantilla.
5. Las 14 plantillas aprobadas se reutilizan y no amplían autoridad.
6. El registro estructurado y la auditoría son evidencia principal.
7. Fotos, firmas, chats y papeles son complementos o contingencia según el caso.
8. Compras, recepción, inventario, producción, ventas, pagos y entregas tendrán superficies separadas por resultado.
9. Las correcciones mostrarán antes, después, motivo y responsable.
10. Los documentos generados conservarán origen, versión y estado.
11. Las impresiones serán copias identificables.
12. Marca, titular y emisor de factura no se asumirán equivalentes.
13. Vaila Vainilla conservará la alternativa de facturación realmente utilizada en cada caso.
14. La dirección administrativa se tomará desde una fuente vigente, no se repetirá manualmente.
15. Las exportaciones respetarán alcance y sensibilidad.
16. No se crean preguntas nuevas ni se repiten las respondidas.

---

#### 18. Lo que esta tarea no autoriza

- diseñar UI de alta fidelidad;
- crear rutas, componentes o formularios;
- comprar o instalar dispositivos;
- cambiar plantillas de dispositivos;
- crear documentos productivos;
- modificar facturación;
- cambiar titulares o datos legales;
- crear exportaciones;
- modificar Supabase o migraciones;
- implementar modo sin conexión;
- desarrollar AURA;
- eliminar papeles, archivos o medios actuales.

---

#### 19. Criterios de aceptación

`CAP-MAP-011` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades queden cubiertas;
- cada resultado crítico tenga superficie y evidencia identificadas;
- pantalla, dispositivo, documento y evidencia no se confundan;
- los dispositivos compartidos no creen autoridad;
- las correcciones conserven antes, después, motivo y responsable;
- las diferencias y pendientes sean visibles;
- los documentos indiquen fuente, versión y estado;
- la facturación no asuma titular por marca;
- las exportaciones actuales y sus brechas estén reconocidas;
- las respuestas nuevas del registro se incorporen sin perder detalle;
- no se creen preguntas duplicadas;
- no se implemente interfaz, hardware o almacenamiento;
- `CAP-MAP-012` permanezca como única continuidad inmediata.

---

#### 20. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
acción autorizada
        ↓
superficie adecuada al trabajo
        ↓
dispositivo compatible con actor y lugar
        ↓
documento o registro producido
        ↓
evidencia y auditoría conservadas
```

La continuidad será exclusivamente:

```text
CAP-MAP-012
— Clasificar capacidad núcleo, soporte, transversal, futura o fuera de alcance
```

`CAP-MAP-012` clasificará cada capacidad según su importancia y relación con el alcance, sin confundir prioridad empresarial con existencia actual de una pantalla o aplicación.


### ✅ CAP-MAP-012 — Clasificar capacidad núcleo, soporte, transversal, futura o fuera de alcance

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** clasificación documental de capacidades
**Dependencia anterior:** `CAP-MAP-011`
**Continuidad reservada:** `CAP-MAP-013`

---

#### 1. Resultado de esta tarea

Esta tarea asigna una clasificación principal a las **217 subcapacidades**:

- `NÚCLEO`;
- `SOPORTE`;
- `TRANSVERSAL`;
- `FUTURA`;
- `FUERA_DE_ALCANCE`.

La clasificación responde:

```text
¿qué relación tiene esta capacidad con el funcionamiento empresarial de Vento?
```

No responde todavía:

- en qué orden se implementa;
- cuánto cuesta;
- qué aplicación está más avanzada;
- qué pantalla debe construirse primero;
- qué brecha es más urgente.

---

#### 2. Definiciones

| Clasificación      | Significado                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| `NÚCLEO`           | produce o protege directamente la oferta, abastecimiento, producción, venta, atención o entrega                                      |
| `SOPORTE`          | permite que el núcleo funcione con personas, activos, instalaciones o desarrollo comercial                                           |
| `TRANSVERSAL`      | gobierna, controla, informa o protege varias familias a la vez                                                                       |
| `FUTURA`           | resultado empresarial deliberadamente reservado para una etapa posterior y todavía no necesario para la operación objetivo inmediata |
| `FUERA_DE_ALCANCE` | actividad que no corresponde ejecutar a Vento, aunque deba relacionarse con quien la realiza                                         |

Cada subcapacidad tendrá una sola clasificación principal. Sus relaciones con otras familias se conservan sin duplicarla.

---

#### 3. Reglas obligatorias

1. La clasificación describe la capacidad empresarial, no la aplicación.
2. Una capacidad manual puede ser `NÚCLEO`.
3. Una capacidad implementada puede seguir siendo `SOPORTE` o `TRANSVERSAL`.
4. Que AURA no exista no vuelve futuras todas las capacidades de mercadeo.
5. Usar un proveedor externo no deja la responsabilidad empresarial fuera de alcance.
6. Una obligación legal puede ser transversal aunque no produzca una venta.
7. `NÚCLEO` no significa implementar primero sin análisis adicional.
8. `SOPORTE` no significa opcional.
9. `TRANSVERSAL` no significa que SHELL o NUMERA sean propietarias de todo.
10. `FUTURA` no se usará para ocultar una brecha actual.
11. `FUERA_DE_ALCANCE` no se usará para excluir tareas incómodas, manuales o sin sistema.
12. La ausencia de código no determina la clasificación.

---

#### 4. Regla de cobertura

```text
clasificación de la subcapacidad
=
clasificación base de la familia
+ excepción específica
```

Las excepciones de esta tarea son únicamente seis:

- `CAP-12.02`;
- `CAP-12.06`;
- `CAP-12.07`;
- `CAP-14.07`;
- `CAP-14.08`;
- `CAP-14.09`.

Las demás subcapacidades heredan la clasificación de su familia.

---

#### 5. Clasificación base por familia

| Familia                                  | Cantidad | Clasificación base | Razón                                                          |
| ---------------------------------------- | -------: | ------------------ | -------------------------------------------------------------- |
| `CAP-01` Dirección y gobierno            |       10 | `TRANSVERSAL`      | orienta y controla toda la organización                        |
| `CAP-02` Personas y trabajo              |       13 | `SOPORTE`          | permite disponer de personas preparadas y vinculadas           |
| `CAP-03` Seguridad y salud               |       10 | `TRANSVERSAL`      | protege personas y cumplimiento en toda la operación           |
| `CAP-04` Productos y oferta              |       10 | `NÚCLEO`           | define lo que Vento produce, ofrece y vende                    |
| `CAP-05` Compras y proveedores           |       12 | `NÚCLEO`           | asegura los insumos y servicios necesarios para operar         |
| `CAP-06` Inventario y movimientos        |       15 | `NÚCLEO`           | protege disponibilidad, custodia y flujo físico                |
| `CAP-07` Activos                         |       13 | `SOPORTE`          | provee equipos y reutilizables para ejecutar el núcleo         |
| `CAP-08` Producción                      |       14 | `NÚCLEO`           | transforma insumos en resultados vendibles                     |
| `CAP-09` Venta y servicio                |       15 | `NÚCLEO`           | recibe, cobra y cierra la promesa al cliente                   |
| `CAP-10` Clientes                        |       10 | `NÚCLEO`           | atiende y protege la relación con el cliente                   |
| `CAP-11` Despacho y entrega              |       12 | `NÚCLEO`           | completa traslados y entregas comprometidas                    |
| `CAP-12` Finanzas                        |       15 | `TRANSVERSAL`      | registra y controla efectos económicos de todas las familias   |
| `CAP-13` Instalaciones                   |       11 | `SOPORTE`          | mantiene condiciones físicas para operar                       |
| `CAP-14` Mercadeo y desarrollo comercial |       11 | `SOPORTE`          | genera demanda y comunica la oferta                            |
| `CAP-15` Tecnología                      |       11 | `TRANSVERSAL`      | habilita y protege herramientas utilizadas por todas las áreas |
| `CAP-16` Información y documentos        |       11 | `TRANSVERSAL`      | protege evidencia y conocimiento de toda la organización       |
| `CAP-17` Datos y análisis                |       12 | `TRANSVERSAL`      | mide y mejora resultados de todas las familias                 |
| `CAP-18` Continuidad                     |       12 | `TRANSVERSAL`      | sostiene y recupera la operación completa                      |

---

#### 6. Excepciones específicas

| Subcapacidad                                         | Clasificación | Razón                                                                      |
| ---------------------------------------------------- | ------------- | -------------------------------------------------------------------------- |
| `CAP-12.02` Gestionar caja                           | `NÚCLEO`      | forma parte directa del cierre de la venta presencial                      |
| `CAP-12.06` Facturar y controlar documentos          | `NÚCLEO`      | completa el soporte fiscal y comercial de la operación de venta            |
| `CAP-12.07` Conciliar ventas, pagos y entregas       | `NÚCLEO`      | confirma que la promesa comercial quedó económica y operativamente cerrada |
| `CAP-14.07` Captar oportunidades de venta            | `NÚCLEO`      | inicia una oportunidad comercial concreta                                  |
| `CAP-14.08` Gestionar ventas a empresas              | `NÚCLEO`      | produce ventas B2B, no solo comunicación                                   |
| `CAP-14.09` Gestionar catering y eventos comerciales | `NÚCLEO`      | produce una venta y una entrega empresarial completa                       |

Estas excepciones cambian la clasificación de la subcapacidad, no la propiedad definida en `CAP-MAP-004` ni su fuente de verdad.

---

#### 7. Resultado cuantitativo

| Clasificación      | Subcapacidades |
| ------------------ | -------------: |
| `NÚCLEO`           |         **94** |
| `SOPORTE`          |         **45** |
| `TRANSVERSAL`      |         **78** |
| `FUTURA`           |          **0** |
| `FUERA_DE_ALCANCE` |          **0** |
| **Total**          |        **217** |

El resultado `0` en `FUTURA` y `FUERA_DE_ALCANCE` es deliberado:

- las 217 subcapacidades describen necesidades empresariales reales o necesarias;
- no se excluye una capacidad porque hoy sea manual, externa o incompleta;
- las capacidades futuras que todavía no estén en la taxonomía se detectarán en `CAP-MAP-014`;
- los límites externos se documentan sin retirar la responsabilidad interna de Vento.

---

#### 8. Cadena de capacidades núcleo

```text
definir producto y oferta
        ↓
comprar y recibir
        ↓
controlar inventario
        ↓
producir
        ↓
recibir pedido y vender
        ↓
cobrar y documentar
        ↓
atender y entregar
        ↓
conciliar el resultado
```

Una ruptura de compras, inventario, producción, venta, pago o entrega afecta directamente la promesa al cliente.

---

#### 9. Capacidades de soporte

Las capacidades de soporte no son decorativas ni prescindibles.

```text
personas preparadas
+ activos disponibles
+ instalaciones aptas
+ comunicación comercial
= núcleo capaz de operar de forma repetible
```

La falta de mantenimiento, personal, capacitación o condiciones físicas puede detener una capacidad núcleo aunque no produzca directamente una venta.

---

#### 10. Capacidades transversales

Las capacidades transversales:

- definen dirección y límites;
- protegen personas y cumplimiento;
- controlan dinero y obligaciones;
- gestionan tecnología;
- conservan documentos y evidencia;
- miden resultados;
- mantienen continuidad.

No se implementarán como un único “sistema transversal” universal. Cada resultado permanecerá en la aplicación propietaria definida en `CAP-MAP-008`.

---

#### 11. Regla especial para PULSO y el POS

Las siguientes capacidades permanecen `NÚCLEO`:

- `CAP-09.04` Registrar pedidos;
- `CAP-09.08` Registrar ventas;
- `CAP-09.09` Cobrar y confirmar pagos;
- `CAP-09.10` Emitir factura o soporte;
- `CAP-09.15` Cerrar y revisar la jornada;
- `CAP-12.02` Gestionar caja;
- `CAP-12.06` Facturar y controlar documentos;
- `CAP-12.07` Conciliar ventas, pagos y entregas.

PULSO deberá soportar dos recorridos legales y operativamente distintos:

| Recorrido                        | Identificación del comprador                                          | Resultado                                                        |
| -------------------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------------- |
| consumidor final                 | no se obliga a crear cliente cuando no solicita documento a su nombre | venta completa con documento fiscal aplicable a consumidor final |
| documento a nombre del comprador | se solicitan únicamente los datos permitidos y necesarios             | factura electrónica o documento aplicable identificado           |

Reglas:

1. El recorrido de consumidor final es una función normal del núcleo, no una excepción sospechosa.
2. No registrar un perfil de cliente no significa dejar de registrar la venta.
3. Toda venta conserva productos, valores, impuestos, pago, emisor y documento.
4. La identificación del comprador no determina por sí sola los impuestos.
5. El medio de pago no determina si la venta se registra.
6. PULSO no obligará a identificar a todos los clientes para cerrar una venta ordinaria.
7. PULSO tampoco permitirá usar consumidor final para ocultar ventas, cambiar impuestos o evitar trazabilidad.
8. El tipo documental deberá cumplir la regla DIAN vigente al momento de implementación.

---

#### 12. AURA y la categoría futura

AURA continúa siendo una idea sin diseño ni funciones, pero:

- comunicar;
- crear contenido;
- administrar medios;
- gestionar campañas;
- captar oportunidades;
- medir promoción;
- atender reputación

son capacidades empresariales actuales o necesarias.

Por eso:

```text
AURA = aplicación futura
CAP-14 = capacidades actuales clasificadas como SOPORTE o NÚCLEO
```

No se clasificará una capacidad como `FUTURA` solo porque su aplicación candidata todavía no exista.

---

#### 13. Límites externos

Las siguientes actividades son externas y no se incorporan como capacidades ejecutadas por Vento:

| Actividad externa                                         | Responsabilidad que sí conserva Vento                    |
| --------------------------------------------------------- | -------------------------------------------------------- |
| decidir o validar obligaciones de la DIAN                 | facturar, documentar y cumplir la regla aplicable        |
| procesar internamente operaciones del banco               | autorizar, registrar y conciliar movimientos propios     |
| operar la infraestructura de Rappi, Shopify o ManyChat    | recibir, controlar y conciliar pedidos propios           |
| operar la empresa de mensajería                           | asignar custodia y confirmar entrega                     |
| emitir conceptos jurídicos o tributarios profesionales    | entregar evidencia y ejecutar decisiones aplicables      |
| administrar sistemas internos de proveedores tecnológicos | controlar accesos, contratos, datos e incidentes propios |

La actividad del tercero queda fuera de alcance; gestionar la relación y el efecto sobre Vento permanece dentro.

---

#### 14. Relación con implementación y prioridad

La clasificación no determina por sí sola el orden.

El orden posterior deberá considerar:

```text
clasificación
+ riesgo
+ dependencia
+ brecha actual
+ valor empresarial
+ esfuerzo
+ capacidad de adopción
= prioridad de implementación
```

Una capacidad transversal de seguridad o una capacidad de soporte que bloquea producción puede implementarse antes que una mejora de núcleo.

---

#### 15. Dudas y decisiones incorporadas

No se crean preguntas nuevas.

Esta tarea incorpora:

- `DEC-POS-001`, sobre consumidor final y facturación solicitada;
- las respuestas de titulares y facturación `GOV-05`, `GOV-08` a `GOV-12`;
- la inexistencia actual de AURA confirmada en `TEC-01` a `TEC-03`;
- las fuentes y propietarios definidos en `CAP-MAP-004` a `CAP-MAP-011`.

Las validaciones tributarias concretas deberán refrescarse con Contabilidad y fuentes oficiales antes de implementar el POS.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades tienen una clasificación principal.
2. Existen 94 subcapacidades núcleo, 45 de soporte y 78 transversales.
3. Ninguna de las 217 queda actualmente como futura o fuera de alcance.
4. Manual, incompleta o externa no significa fuera de alcance.
5. La aplicación candidata no determina la clasificación.
6. AURA es futura como aplicación, no como conjunto de necesidades empresariales.
7. Compras, inventario y producción forman parte del núcleo.
8. Venta, caja, facturación y conciliación forman parte del núcleo.
9. Ventas empresariales, catering y oportunidades concretas forman parte del núcleo.
10. Personas, activos, instalaciones y comunicación general son soporte.
11. Gobierno, cumplimiento, finanzas generales, tecnología, documentos, análisis y continuidad son transversales.
12. El POS a consumidor final es un recorrido núcleo legítimo.
13. Consumidor final no elimina registro, impuestos ni documento fiscal.
14. La clasificación no fija todavía prioridad de implementación.

---

#### 17. Lo que esta tarea no autoriza

- ocultar ventas o modificar impuestos;
- definir asesoría tributaria definitiva;
- implementar el POS;
- cambiar facturación actual;
- desarrollar AURA;
- retirar capacidades de la taxonomía;
- agregar capacidades sin análisis;
- cambiar propietarios, permisos o integraciones aprobados;
- modificar Supabase, código o migraciones;
- priorizar automáticamente todo lo clasificado como núcleo.

---

#### 18. Criterios de aceptación

`CAP-MAP-012` podrá aprobarse cuando:

- las 217 subcapacidades sumen exactamente el total clasificado;
- cada subcapacidad tenga una sola clasificación principal;
- núcleo, soporte y transversal se distingan claramente;
- ninguna capacidad se declare futura por falta de aplicación;
- ninguna capacidad se excluya por ser manual o externa;
- los límites con terceros conserven responsabilidad interna;
- PULSO contemple consumidor final sin registro obligatorio de cliente;
- toda venta conserve documento, impuestos y trazabilidad;
- la clasificación no se confunda con prioridad;
- no se creen preguntas duplicadas;
- no se autorice implementación;
- `CAP-MAP-013` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definido:

```text
qué capacidades producen directamente valor
        ↓
cuáles habilitan la operación
        ↓
cuáles gobiernan varias familias
        ↓
qué límites corresponden a terceros
        ↓
qué candidatas futuras deberán detectarse después
```

La continuidad será exclusivamente:

```text
CAP-MAP-013
— Detectar capacidades duplicadas o con propiedad competidora
```

`CAP-MAP-013` revisará dónde dos aplicaciones, áreas o prácticas intentan gobernar el mismo resultado y distinguirá cooperación válida de duplicación empresarial.

### ✅ CAP-MAP-013 — Detectar capacidades duplicadas o con propiedad competidora

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** análisis documental de solapamientos y fronteras de propiedad
**Dependencia anterior:** `CAP-MAP-012`
**Continuidad reservada:** `CAP-MAP-014`

---

#### 1. Resultado de esta tarea

Esta tarea revisa las **217 subcapacidades** para detectar:

- dos capacidades que parecen producir el mismo resultado;
- dos aplicaciones que podrían intentar gobernar el mismo hecho;
- dos áreas que podrían corregir o aprobar el mismo resultado sin una frontera clara;
- copias manuales o técnicas que podrían convertirse en registros paralelos;
- colaboraciones legítimas que no deben eliminarse.

El propósito no es escoger la aplicación más visible. Es asegurar que cada resultado empresarial tenga:

1. una definición reconocible;
2. una sola fuente principal objetivo;
3. una frontera clara con los resultados relacionados;
4. consumidoras que no puedan corregir el original;
5. un tratamiento explícito cuando hoy exista duplicación.

---

#### 2. Definiciones en lenguaje directo

| Término                    | Significado                                                                                                     |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `DUPLICACIÓN_DE_CAPACIDAD` | dos nombres describen realmente el mismo resultado empresarial                                                  |
| `PROPIEDAD_COMPETIDORA`    | dos aplicaciones o áreas pueden crear, corregir o cerrar versiones independientes del mismo hecho               |
| `COLABORACIÓN_VÁLIDA`      | varias aplicaciones o personas intervienen, pero cada una produce un resultado diferente y enlazado             |
| `COPIA_CONTROLADA`         | una aplicación conserva una referencia o lectura derivada sin poder alterar el original                         |
| `FUENTE_SOMBRA`            | Excel, chat, papel, archivo o sistema secundario termina gobernando un estado que debería tener una sola fuente |
| `DUPLICACIÓN_TÉCNICA`      | código, tipos o componentes repetidos; puede causar deriva, pero no crea por sí sola otra capacidad empresarial |

Dos pantallas parecidas no prueban duplicación. Dos lugares capaces de cambiar de manera independiente el mismo estado sí crean propiedad competidora.

---

#### 3. Prueba obligatoria para comparar dos candidatos

Cada posible cruce se evaluará con estas preguntas:

1. ¿Producen el mismo resultado para el mismo objeto?
2. ¿El resultado tiene el mismo momento de inicio y cierre?
3. ¿Ambos lugares pueden crearlo o corregirlo?
4. ¿Una modificación puede dejar versiones contradictorias?
5. ¿Uno de los registros podría ser solo una lectura o efecto derivado?
6. ¿La separación cambia por etapa, propósito, objeto o tipo de incidente?
7. ¿Puede señalarse una única fuente que explique el estado vigente?

Interpretación:

```text
mismo resultado + dos controles independientes
= duplicación o propiedad competidora

resultados distintos + enlace explícito
= colaboración válida
```

---

#### 4. Estados permitidos

| Estado                           | Uso                                                                                |
| -------------------------------- | ---------------------------------------------------------------------------------- |
| `SIN_DUPLICACIÓN`                | el resultado y su propietaria están suficientemente separados                      |
| `FRONTERA_DEFINIDA`              | existía solapamiento aparente y queda resuelto mediante una división explícita     |
| `DUPLICACIÓN_AS_IS_CONFIRMADA`   | hoy dos superficies o prácticas controlan el mismo resultado                       |
| `DUPLICACIÓN_TÉCNICA_CONFIRMADA` | existen contratos o estructuras de código repetidos que deberán converger          |
| `RIESGO_DE_FUENTE_SOMBRA`        | existe una copia manual que debe auditarse antes de tratarla como duplicación real |
| `PENDIENTE_DE_EVIDENCIA`         | no existe evidencia suficiente para decidir sin observación adicional              |

`PENDIENTE_DE_EVIDENCIA` solo se utilizará cuando las tareas y auditorías anteriores no permitan tomar una decisión. No se abrirán preguntas por precaución genérica.

---

#### 5. Regla de cobertura de las 217 subcapacidades

Las 217 subcapacidades quedan cubiertas así:

```text
resultado definido en CAP-MAP-001 y CAP-MAP-002
+ propietaria y consumidoras de CAP-MAP-004 y CAP-MAP-005
+ actores de CAP-MAP-006
+ información, fuente, eventos, permisos y evidencia de CAP-MAP-007 a CAP-MAP-011
+ frontera específica de esta tarea cuando exista solapamiento
= decisión de duplicación para cada subcapacidad
```

Si una subcapacidad no aparece en los apartados 7 a 11, conserva el resultado, la propietaria y la fuente ya aprobados y queda `SIN_DUPLICACIÓN`.

---

#### 6. Resultado general por familia

| Familia                | Cruce principal revisado                           | Decisión                                                                                                   |
| ---------------------- | -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `CAP-01` Dirección     | Gerencia frente a VISO                             | la decisión sigue siendo humana; VISO registra estructura, reglas y evidencia                              |
| `CAP-02` Personas      | VISO frente a ANIMA                                | administración laboral y experiencia personal se separan; existe una duplicación AS-IS puntual en horarios |
| `CAP-03` Cumplimiento  | VISO, responsables y asesores                      | VISO conserva seguimiento; responsables y asesores ejecutan o validan sin crear otra fuente                |
| `CAP-04` Producto      | NEXO, FOGO y PULSO                                 | identidad de producto, receta y oferta vendible son resultados distintos y enlazados                       |
| `CAP-05` Compras       | ORIGO frente a NEXO                                | ORIGO gobierna compra y aceptación; NEXO registra el efecto en existencias                                 |
| `CAP-06` Inventario    | NEXO frente a aplicaciones originadoras            | NEXO gobierna existencia; las demás originan hechos que producen movimientos                               |
| `CAP-07` Activos       | NEXO, mantenimiento e instalaciones                | activo móvil y condición de instalación se separan por objeto                                              |
| `CAP-08` Producción    | FOGO frente a NEXO                                 | FOGO gobierna orden, lote y rendimiento; NEXO gobierna el movimiento aceptado                              |
| `CAP-09` Ventas        | PULSO, plataformas externas y NEXO                 | PULSO gobierna pedido y venta; externos originan solicitudes y NEXO informa disponibilidad                 |
| `CAP-10` Clientes      | PULSO frente a PASS                                | PASS gobierna identidad y autorización del cliente; PULSO usa los datos mínimos para atender y vender      |
| `CAP-11` Entregas      | NEXO frente a PULSO                                | traslado entre lugares pertenece a NEXO; entrega de pedido al cliente pertenece a PULSO                    |
| `CAP-12` Finanzas      | PULSO, NUMERA y sistema contable                   | PULSO gobierna operación de venta y caja; NUMERA gobierna efecto económico interno y análisis              |
| `CAP-13` Instalaciones | NEXO, responsables y proveedores                   | NEXO registra activo, condición y novedad; la ejecución especializada puede ser externa                    |
| `CAP-14` Mercadeo      | AURA, PULSO, PASS y NUMERA                         | campaña, oportunidad, venta, identidad y medición son resultados distintos                                 |
| `CAP-15` Tecnología    | VISO, SHELL, NEXO y aplicación afectada            | acceso laboral, entrada al ecosistema, activo tecnológico y permiso funcional se separan                   |
| `CAP-16` Documentos    | gobierno transversal frente a aplicación del hecho | las reglas documentales son transversales; el documento permanece con el hecho respaldado                  |
| `CAP-17` Análisis      | NUMERA frente a fuentes operativas                 | NUMERA analiza; no recrea ventas, existencias, producción ni asistencia                                    |
| `CAP-18` Continuidad   | SHELL frente a aplicación afectada                 | cada aplicación recupera su resultado; SHELL coordina acceso y comunicación cuando corresponda             |

No se asigna una familia completa a SHELL, NUMERA o VISO únicamente porque sea transversal.

---

#### 7. Solapamientos de la propia taxonomía

##### 7.1. Riesgo, inspección y continuidad

| Capacidades relacionadas                             | Frontera aprobable                                                                                         | Estado              |
| ---------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-01.07`, `CAP-03.01` y `CAP-18.01`               | riesgo empresarial, peligro laboral y dependencia de continuidad son objetos diferentes                    | `FRONTERA_DEFINIDA` |
| `CAP-03.07` y `CAP-13.07`                            | la primera comprueba una obligación o control; la segunda comprueba la condición física de una instalación | `FRONTERA_DEFINIDA` |
| `CAP-03.04`, `CAP-15.07` y `CAP-18.03` a `CAP-18.10` | incidente laboral, falla tecnológica y coordinación de continuidad conservan ciclos separados              | `FRONTERA_DEFINIDA` |
| `CAP-03.10` y `CAP-17.11`                            | acción correctiva de cumplimiento frente a acción general de mejora                                        | `FRONTERA_DEFINIDA` |

Una falla tecnológica que interrumpe la operación puede originar simultáneamente un caso `CAP-15.07` y una respuesta `CAP-18`, pero ambos deben enlazarse y no convertirse en un único registro ambiguo.

##### 7.2. Activos, instalaciones y mantenimiento

| Capacidades relacionadas  | Frontera aprobable                                                                          | Estado              |
| ------------------------- | ------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-07.07` y `CAP-13.02` | mantenimiento de activo o equipo móvil frente a mantenimiento de espacio o instalación fija | `FRONTERA_DEFINIDA` |
| `CAP-07.08` y `CAP-13.03` | reparación del activo identificado frente a reparación de la instalación                    | `FRONTERA_DEFINIDA` |
| `CAP-07.06` y `CAP-13.11` | condición del activo frente a novedad de la instalación                                     | `FRONTERA_DEFINIDA` |

Si una instalación contiene un equipo identificable, la solicitud debe indicar cuál es el objeto principal. No se crearán dos reparaciones independientes para el mismo daño.

##### 7.3. Venta empresarial, catering, reservas y eventos

| Capacidades relacionadas  | Frontera aprobable                                                                                | Estado              |
| ------------------------- | ------------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-14.07`               | captura una oportunidad antes de que exista compromiso comercial                                  | `FRONTERA_DEFINIDA` |
| `CAP-14.08` y `CAP-14.09` | gestionan contacto, propuesta, negociación y aceptación comercial B2B o de evento                 | `FRONTERA_DEFINIDA` |
| `CAP-10.08`               | conserva la reserva, asistentes, fecha y compromisos de atención del cliente                      | `FRONTERA_DEFINIDA` |
| `CAP-09.14`               | ejecuta en PULSO el pedido especial ya aceptado: productos, cantidades, cobro, documento y estado | `FRONTERA_DEFINIDA` |

Por tanto:

```text
oportunidad
→ propuesta y negociación
→ reserva o compromiso
→ pedido aceptado
→ venta, preparación y entrega
```

No se eliminan estas subcapacidades. Se separan por etapa y resultado para evitar que AURA, PASS y PULSO creen tres ventas independientes.

##### 7.4. Venta, facturación y finanzas

| Capacidades relacionadas  | Frontera aprobable                                                                        | Estado              |
| ------------------------- | ----------------------------------------------------------------------------------------- | ------------------- |
| `CAP-09.09` y `CAP-12.02` | pago aplicado al pedido frente a sesión, arqueo y cierre de caja                          | `FRONTERA_DEFINIDA` |
| `CAP-09.10` y `CAP-12.06` | emisión del documento de la venta frente a gobierno, vigencia y control fiscal-documental | `FRONTERA_DEFINIDA` |
| `CAP-09.15` y `CAP-12.07` | cierre operativo de jornada frente a conciliación entre ventas, pagos y entregas          | `FRONTERA_DEFINIDA` |
| `CAP-12.01` y `CAP-17.09` | registro del efecto económico frente a análisis de costo y rentabilidad                   | `FRONTERA_DEFINIDA` |

PULSO conservará la venta, el pago aplicado, el documento emitido y la caja operativa. NUMERA recibirá efectos confirmados y no podrá corregir la venta original.

##### 7.5. Servicio al cliente y corrección de ventas

| Capacidades relacionadas  | Frontera aprobable                                                        | Estado              |
| ------------------------- | ------------------------------------------------------------------------- | ------------------- |
| `CAP-09.05` y `CAP-10.03` | cambiar el pedido vigente frente a atender una solicitud del cliente      | `FRONTERA_DEFINIDA` |
| `CAP-10.04` y `CAP-10.05` | investigar reclamo frente a ejecutar devolución o compensación autorizada | `FRONTERA_DEFINIDA` |
| `CAP-10.05` y `CAP-12.01` | decisión operativa de devolución frente a efecto económico confirmado     | `FRONTERA_DEFINIDA` |

La atención puede iniciar el caso, pero no modifica por sí sola la venta, el inventario o el hecho económico.

##### 7.6. Documentos, evidencia y análisis

| Capacidades relacionadas                                      | Frontera aprobable                                                                                                                      | Estado              |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-16.02` a `CAP-16.09` frente a documentos de cada familia | CAP-16 define clasificación, aprobación, vigencia, acceso y conservación; la aplicación del hecho crea y custodia el documento concreto | `FRONTERA_DEFINIDA` |
| `CAP-17.02` frente a registros operativos                     | recopilar para análisis no permite recrear o corregir el hecho fuente                                                                   | `FRONTERA_DEFINIDA` |
| `CAP-17.03` frente a controles de cada dominio                | NUMERA puede señalar un problema de calidad; la propietaria corrige el origen con trazabilidad                                          | `FRONTERA_DEFINIDA` |

---

#### 8. Fronteras entre aplicaciones que quedan confirmadas

##### 8.1. VISO y ANIMA

| Resultado                                                 | Propietaria objetivo | Participación de la otra aplicación                      |
| --------------------------------------------------------- | -------------------- | -------------------------------------------------------- |
| persona, relación laboral, sede, función y turno aprobado | VISO                 | ANIMA presenta al trabajador lo necesario                |
| marcación original de entrada o salida                    | ANIMA                | VISO revisa asistencia y gestiona novedades              |
| novedad laboral y decisión administrativa                 | VISO                 | ANIMA permite al trabajador informar o consultar         |
| documento personal aportado por el trabajador             | ANIMA                | VISO consume lo autorizado para administración           |
| cierre de relación y retiro de acceso laboral             | VISO                 | cada aplicación ejecuta el cierre de su sesión o permiso |

`TEC-14` confirma una propiedad competidora actual: **VISO y ANIMA pueden editar `employee_shifts`**. El objetivo será:

```text
VISO publica o corrige el turno
→ ANIMA lo consulta
→ ANIMA no mantiene una segunda edición independiente
```

Esta es una `DUPLICACIÓN_AS_IS_CONFIRMADA`. No se corrige todavía en código; se convierte en hallazgo obligatorio de remodelación.

`TEC-15` confirma que ninguna de las dos aplicaciones corrige actualmente la hora original de asistencia. La posibilidad de agregar una nota en ANIMA no constituye duplicación de la marcación.

##### 8.2. NEXO, ORIGO y FOGO

| Resultado                                             | Propietaria | Regla para las demás                                                        |
| ----------------------------------------------------- | ----------- | --------------------------------------------------------------------------- |
| proveedor, solicitud, orden y aceptación de compra    | ORIGO       | NEXO recibe únicamente el efecto aceptado                                   |
| producto, unidad, ubicación, existencia y movimiento  | NEXO        | ORIGO y FOGO referencian el mismo producto                                  |
| receta, orden, lote, consumo productivo y rendimiento | FOGO        | NEXO recibe movimientos confirmados                                         |
| recepción de proveedor                                | ORIGO       | NEXO no vuelve a aceptar o rechazar la compra; registra la entrada derivada |
| salida o liberación de producción                     | FOGO        | NEXO no vuelve a cerrar el lote; registra el producto aceptado              |

Las pantallas de recepción o despacho pueden requerir acciones coordinadas, pero no deben producir dos recepciones, dos lotes o dos movimientos.

##### 8.3. NEXO, PULSO y entrega

| Resultado                                   | Propietaria                                |
| ------------------------------------------- | ------------------------------------------ |
| disponibilidad física por lugar             | NEXO                                       |
| disponibilidad comercial mostrada al vender | PULSO, derivada de reglas y datos vigentes |
| pedido, venta y promesa al cliente          | PULSO                                      |
| traslado y recepción entre lugares Vento    | NEXO                                       |
| entrega que cierra un pedido del cliente    | PULSO                                      |

El destino determina la frontera:

- si la custodia pasa entre lugares internos, gobierna NEXO;
- si la custodia termina en el cliente por un pedido, gobierna PULSO;
- si interviene mensajería, PULSO conserva la entrega y la referencia externa.

##### 8.4. PULSO, PASS y NUMERA

| Resultado                                               | Propietaria |
| ------------------------------------------------------- | ----------- |
| identidad, consentimiento y acción directa del cliente  | PASS        |
| datos mínimos usados en un pedido o venta               | PULSO       |
| pedido, venta, pago aplicado, caja y documento de venta | PULSO       |
| hecho económico interno, costo, obligación y análisis   | NUMERA      |

PASS no crea ventas y NUMERA no corrige pedidos. PULSO tampoco se convierte en maestro universal de identidad por registrar un comprador identificado.

##### 8.5. AURA, PULSO y NUMERA

AURA continúa sin existir como producto implementado. Su propiedad futura se limita a:

- intención y calendario de comunicación;
- contenido y publicación;
- campaña;
- origen de oportunidad;
- intención de promoción.

PULSO gobernará cupón aplicado, pedido y venta. NUMERA gobernará el análisis económico derivado. Mientras AURA no exista, sus capacidades podrán ejecutarse manualmente, pero no se inventará una integración ni una segunda base de ventas.

##### 8.6. SHELL y las aplicaciones

SHELL podrá gobernar:

- entrada y navegación del ecosistema;
- catálogo visible de aplicaciones;
- selección de contexto autorizado;
- estado básico de disponibilidad para orientar al usuario.

SHELL no gobernará:

- datos laborales de VISO o ANIMA;
- productos o existencias de NEXO;
- compras de ORIGO;
- producción de FOGO;
- ventas de PULSO;
- identidad de cliente de PASS;
- hechos económicos de NUMERA;
- documentos propios de cada hecho.

Mostrar, enlazar o iniciar sesión no convierte a SHELL en propietaria.

---

#### 9. Áreas y personas que intervienen sin competir por la propiedad

Los actores de `CAP-MAP-006` conservan funciones distintas:

| Participación            | Qué puede hacer                             | Qué no significa                          |
| ------------------------ | ------------------------------------------- | ----------------------------------------- |
| iniciador                | solicitar o reportar una necesidad          | aprobarla automáticamente                 |
| ejecutor                 | realizar el trabajo autorizado              | gobernar todos los datos relacionados     |
| supervisor               | revisar avance, diferencia o cumplimiento   | cambiar el registro original sin permiso  |
| aprobador                | aceptar, rechazar o autorizar una excepción | ejecutar todos los pasos                  |
| propietario de la fuente | conservar estado y trazabilidad             | tomar por sí solo la decisión empresarial |

Gerencia, Contabilidad, responsables de sede y trabajadores pueden intervenir en la misma capacidad sin crear propiedad competidora cuando la decisión y el registro quedan enlazados.

Los pendientes `OPE-04` a `OPE-11` definirán cargos concretos para aprobar excepciones. No cambian la propiedad de ORIGO, NEXO, VISO, PULSO o la aplicación correspondiente.

---

#### 10. Sistemas externos, archivos y medios manuales

| Medio o sistema            | Puede conservar                                             | No puede convertirse automáticamente en           |
| -------------------------- | ----------------------------------------------------------- | ------------------------------------------------- |
| Rappi, Shopify o ManyChat  | solicitud, pedido o referencia externa                      | fuente interna paralela del pedido Vento          |
| banco o proveedor de pagos | confirmación externa de movimiento                          | venta, caja o conciliación interna completa       |
| sistema contable           | asiento o documento oficial que le corresponda              | fuente de pedidos, inventario o producción        |
| WhatsApp                   | solicitud, aviso o evidencia complementaria                 | estado final de compra, remisión, venta o novedad |
| Excel                      | importación, exportación o control transitorio identificado | maestro independiente sin conciliación            |
| PDF, captura o papel       | representación o evidencia                                  | sustituto silencioso del registro estructurado    |

Cuando una operación actual solo exista en estos medios se marca `RIESGO_DE_FUENTE_SOMBRA`, no `DUPLICACIÓN_AS_IS_CONFIRMADA`, hasta comprobar que dos versiones se controlan de manera independiente.

Las auditorías operativas pendientes ya registradas servirán para observar esos casos. No se crea un segundo cuestionario.

---

#### 11. Duplicación técnica confirmada

`TEC-18` confirma contratos y estructuras repetidos entre repositorios:

- tipos de sedes, personas y productos;
- compras repetidas entre FOGO y ORIGO;
- salidas de producción repetidas entre NEXO y FOGO;
- tipos de pedidos repetidos en PULSO;
- `SiteRow`, `SiteOption`, `EmployeeRow`, sesión operativa y componentes estándar repetidos en NUMERA;
- copias que ya presentan diferencias entre NUMERA y ORIGO.

La decisión es:

| Hallazgo                                 | Clasificación                     | Tratamiento posterior                        |
| ---------------------------------------- | --------------------------------- | -------------------------------------------- |
| contratos o tipos repetidos              | `DUPLICACIÓN_TÉCNICA_CONFIRMADA`  | derivar de contratos comunes o generados     |
| nombres iguales con significado distinto | no consolidar automáticamente     | separar nombre y contrato por dominio        |
| copias que ya divergen                   | riesgo de incompatibilidad        | comparar campo por campo antes de reemplazar |
| tablas de dominio distintas              | no fusionar por similitud técnica | conservar la fuente empresarial definida     |

Esta duplicación no modifica la taxonomía ni autoriza crear un paquete compartido en esta tarea. Queda como requisito verificable para el análisis y la remodelación técnica.

---

#### 12. Hallazgos consolidados

| Tipo de hallazgo                                       | Resultado |
| ------------------------------------------------------ | --------: |
| familias revisadas                                     |    **18** |
| subcapacidades cubiertas                               |   **217** |
| propiedad competidora funcional confirmada             |     **1** |
| conjunto de duplicaciones técnicas confirmado          |     **1** |
| solapamientos de taxonomía resueltos mediante frontera |    **21** |
| preguntas nuevas creadas                               |     **0** |

La propiedad competidora funcional confirmada es la edición de horarios en VISO y ANIMA.

El conjunto técnico confirmado corresponde a los contratos y estructuras repetidos documentados en `TEC-18`; contiene varios casos, pero se conserva como un solo frente de remodelación transversal.

Los riesgos de fuente sombra no se cuentan como duplicaciones confirmadas hasta que la observación operativa demuestre control paralelo del mismo estado.

---

#### 13. Decisiones para la remodelación posterior

1. Cada hecho tendrá una única fuente con autoridad para crear y corregir.
2. Las consumidoras recibirán identificador, versión y estado sin poder reescribir el original.
3. Un evento derivado no duplicará el efecto empresarial al reintentarse.
4. Toda corrección se realizará en la propietaria y se propagará con trazabilidad.
5. Las referencias externas conservarán el identificador del proveedor y el identificador interno.
6. Los contratos compartidos describirán intercambios; no convertirán una base compartida en propiedad universal.
7. La consolidación técnica no fusionará resultados empresariales diferentes.
8. Los controles manuales seguirán visibles hasta demostrar que su reemplazo funciona.
9. La edición de horarios deberá quedar en VISO; ANIMA será consumidora para el trabajador.
10. Los cruces comerciales conservarán la secuencia oportunidad, propuesta, reserva, pedido y venta.

---

#### 14. Dudas y comprobaciones

No se crean preguntas nuevas.

Esta tarea reutiliza:

- `OPE-04` a `OPE-11` para conocer aprobadores concretos de excepciones;
- `TEC-14` para la edición duplicada de horarios;
- `TEC-15` para la ausencia de corrección de marcaciones;
- `TEC-18` para contratos y estructuras repetidos;
- las auditorías operativas ya pendientes para comprobar fuentes sombra.

Las respuestas futuras se incorporarán al registro vivo y afinarán el estado AS-IS, sin reabrir las fronteras objetivo ya definidas.

---

#### 15. Lo que queda decidido

1. Las 217 subcapacidades fueron revisadas mediante herencia y excepciones.
2. Colaborar, consultar o analizar no concede propiedad.
3. VISO y ANIMA compiten actualmente por la edición de horarios.
4. La marcación original pertenece a ANIMA y la administración de novedades a VISO.
5. ORIGO acepta la compra y NEXO registra su efecto en existencias.
6. FOGO cierra producción y NEXO registra movimientos aceptados.
7. NEXO gobierna traslados internos y PULSO entregas de pedidos al cliente.
8. PASS gobierna identidad del cliente; PULSO gobierna la venta.
9. PULSO gobierna venta y caja; NUMERA recibe el efecto económico.
10. AURA no recreará pedidos, ventas ni costos.
11. SHELL no hereda propiedad de los dominios que enlaza.
12. Los documentos siguen perteneciendo al hecho que respaldan.
13. Las capacidades comerciales solapadas se separan por etapa.
14. Mantenimiento de activos e instalaciones se separa por el objeto afectado.
15. Los incidentes se separan por naturaleza y por la coordinación de continuidad.
16. Los contratos repetidos son duplicación técnica confirmada, no otra capacidad empresarial.
17. WhatsApp, Excel y papel conservan riesgo de fuente sombra hasta terminar la auditoría.
18. No se requieren preguntas nuevas para aprobar esta propuesta.

---

#### 16. Lo que esta tarea no autoriza

- eliminar pantallas o funciones;
- retirar la edición de horarios de ANIMA;
- fusionar tablas o bases de datos;
- crear contratos compartidos;
- modificar Supabase;
- implementar eventos o integraciones;
- reemplazar Excel, WhatsApp, papel o sistemas externos;
- desarrollar AURA;
- cambiar permisos;
- renombrar o eliminar subcapacidades aprobadas;
- iniciar la remodelación técnica.

---

#### 17. Criterios de aceptación

`CAP-MAP-013` podrá aprobarse cuando:

- las 217 subcapacidades queden cubiertas;
- los solapamientos de taxonomía tengan frontera verificable;
- consultar o analizar no se confunda con gobernar;
- VISO y ANIMA conserven la duplicación AS-IS visible y el objetivo sin doble edición;
- ORIGO/NEXO, NEXO/FOGO y NEXO/PULSO tengan resultados separados;
- PULSO/PASS, PULSO/NUMERA y AURA/PULSO tengan fronteras explícitas;
- SHELL no se convierta en propietaria universal;
- los actores humanos no se confundan con la fuente;
- las copias manuales se traten como riesgo y no como duplicación inventada;
- `TEC-18` quede incorporada como duplicación técnica;
- no se creen preguntas repetidas;
- no se autorice implementación;
- `CAP-MAP-014` permanezca como única continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
capacidad y resultado
        ↓
fuente propietaria
        ↓
colaboradoras y consumidoras
        ↓
frontera ante resultados parecidos
        ↓
duplicaciones reales que deberá resolver la remodelación
```

La continuidad será exclusivamente:

```text
CAP-MAP-014
— Detectar capacidades necesarias que no aparecen en código ni datos actuales
```

`CAP-MAP-014` comparará la taxonomía empresarial con la evidencia técnica y operativa para localizar necesidades reales que todavía no tengan representación comprobada.

### ✅ CAP-MAP-014 — Detectar capacidades necesarias que no aparecen en código ni datos actuales

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** contraste documental entre capacidad empresarial y representación técnica actual
**Dependencia anterior:** `CAP-MAP-013`
**Continuidad reservada:** `CAP-MAP-015`

---

#### 1. Resultado de esta tarea

Esta tarea compara las **217 subcapacidades** con:

- aplicaciones y rutas disponibles en los repositorios;
- tablas y datos del proyecto remoto `vento-os-dev`;
- migraciones canónicas de `vento-shell`;
- auditoría técnica `TEC-01` a `TEC-19`;
- formularios y auditorías operativas ya preparados;
- decisiones aprobadas en `CAP-MAP-001` a `CAP-MAP-013`.

El objetivo es distinguir:

1. capacidad comprobada y utilizada;
2. capacidad con código o tablas, pero sin uso comprobado;
3. capacidad cubierta solo parcialmente;
4. capacidad realizada manualmente o mediante un tercero;
5. capacidad necesaria sin representación canónica comprobada;
6. producto o repositorio que no pertenece a la línea base operativa de Vento Group.

No se declarará implementada una capacidad solo porque exista una tabla, una pantalla o un documento de diseño.

---

#### 2. Estados de cobertura

| Estado                             | Significado                                                                                               |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `COMPROBADA_EN_USO`                | existen superficie, estructura y datos o evidencia operativa suficiente                                   |
| `ESTRUCTURA_SIN_USO`               | existen código o tablas, pero no hay registros ni operación comprobada                                    |
| `PARCIAL`                          | una parte del resultado existe, pero faltan etapas, controles o evidencia                                 |
| `MANUAL_O_EXTERNA`                 | la necesidad se atiende mediante personas, archivos, mensajes o terceros                                  |
| `SIN_REPRESENTACIÓN_COMPROBADA`    | no se encontró una forma canónica de ejecutar y conservar el resultado                                    |
| `PROYECTO_FUTURO_CON_BASE_TÉCNICA` | existen código o estructuras preliminares, pero el producto todavía debe diseñarse, planearse y adoptarse |
| `FUERA_DE_LA_LÍNEA_BASE`           | existe técnicamente, pero no representa una capacidad operativa de Vento Group dentro de este mapa        |

Estos estados describen evidencia AS-IS. No equivalen a prioridad de implementación.

---

#### 3. Prueba obligatoria de representación

Una subcapacidad solo se considerará `COMPROBADA_EN_USO` cuando pueda responderse:

1. ¿Dónde inicia una persona el trabajo?
2. ¿Qué estructura conserva el resultado?
3. ¿Existe al menos un registro o evidencia real?
4. ¿Puede distinguirse borrador, aprobado, completado, rechazado o corregido?
5. ¿Existe una forma visible de consultar lo ocurrido?
6. ¿La aplicación coincide con la propietaria aprobada?

La evidencia se interpretará así:

```text
pantalla + estructura + datos + ciclo observable
= capacidad comprobada en uso

pantalla o tabla sin datos
= estructura sin uso comprobado

archivo, chat o proveedor externo
= capacidad manual o externa

ninguna evidencia localizada
= sin representación comprobada
```

---

#### 4. Regla de cobertura de las 217 subcapacidades

Cada subcapacidad hereda el estado general de su familia, salvo que aparezca en los apartados 6 a 12.

```text
COBERTURA DE SUBCAPACIDAD
=
EVIDENCIA BASE DE LA FAMILIA
+
EXCEPCIÓN ESPECÍFICA
+
LIMITACIÓN DE AUDITORÍA, SI EXISTE
```

Cuando una familia se marque `PARCIAL`, no se supone que todas sus subcapacidades estén implementadas. El apartado de brechas identifica cuáles requieren atención explícita.

---

#### 5. Cobertura general por familia

| Familia                                      | Evidencia actual principal                                                          | Estado general      |
| -------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------- |
| `CAP-01` Dirección y gobierno                | empresas, sedes, áreas, roles, permisos y mapa operativo en VISO                    | `PARCIAL`           |
| `CAP-02` Personas y trabajo                  | VISO, ANIMA, esquema `talento`, turnos, asistencia, vacantes y documentos           | `PARCIAL`           |
| `CAP-03` Seguridad, salud y cumplimiento     | documentos, reglas, auditoría operativa y controles dispersos                       | `PARCIAL`           |
| `CAP-04` Productos y conocimiento            | NEXO, FOGO, VISO, 959 productos, 276 recetas y configuraciones comerciales          | `COMPROBADA_EN_USO` |
| `CAP-05` Abastecimiento                      | ORIGO, proveedores, órdenes y estructuras de recepción                              | `PARCIAL`           |
| `CAP-06` Inventario                          | NEXO, saldos, ubicaciones, movimientos, conteos, solicitudes y traslados con datos  | `COMPROBADA_EN_USO` |
| `CAP-07` Activos                             | activos, grupos, movimientos y superficies de NEXO; mantenimiento y conteos sin uso | `PARCIAL`           |
| `CAP-08` Producción                          | recetas y rutas con datos; solicitudes y lotes sin registros                        | `PARCIAL`           |
| `CAP-09` Venta y pedidos                     | pedidos digitales con pocos datos, PULSO, salón y esquema POS vacío                 | `PARCIAL`           |
| `CAP-10` Clientes                            | usuarios, PASS, mensajes, facturación solicitada y lealtad parcial                  | `PARCIAL`           |
| `CAP-11` Transporte y entrega                | traslados existentes; remisiones nuevas y sesiones de entrega sin registros         | `PARCIAL`           |
| `CAP-12` Dinero y obligaciones               | pagos digitales, costos y NUMERA; contabilidad, bancos y cartera incompletos        | `PARCIAL`           |
| `CAP-13` Instalaciones                       | sedes, ubicaciones y activos; sin ciclo dedicado de instalaciones                   | `PARCIAL`           |
| `CAP-14` Comunicación y desarrollo comercial | CMS de VISO, sitio público y contenido; AURA inexistente                            | `PARCIAL`           |
| `CAP-15` Tecnología y soporte                | permisos, dispositivos, navegación, actualizaciones y tickets básicos               | `PARCIAL`           |
| `CAP-16` Información y evidencia             | documentos, tipos, reglas y algunas solicitudes de datos                            | `PARCIAL`           |
| `CAP-17` Medición y mejora                   | exportaciones puntuales, NUMERA y páginas de rentabilidad                           | `PARCIAL`           |
| `CAP-18` Continuidad e incidentes            | tickets, eventos y configuraciones aisladas; sin ciclo integral de continuidad      | `PARCIAL`           |

`COMPROBADA_EN_USO` a nivel de familia no significa que sus quince o diez subcapacidades estén completas. Significa que el ciclo principal tiene evidencia real y que las brechas son excepciones localizables.

---

#### 6. Evidencia que corrige o amplía el mapa anterior

##### 6.1. TALENTO es un proyecto futuro anterior a ANIMA

El usuario confirma que TALENTO se concibe como una **plataforma de empleo propia** y como el portal anterior a ANIMA.

Su propósito objetivo será:

1. publicar puestos de trabajo de Vento Group;
2. permitir que una persona consulte y seleccione una vacante;
3. registrar su postulación;
4. solicitar progresivamente los datos y documentos necesarios para evaluarla;
5. conservar entrevistas, evaluaciones, decisiones y oferta;
6. crear un pre-registro de persona candidata;
7. transferir a ANIMA únicamente a quien complete la selección y vinculación autorizada;
8. permitir operación con el estado laboral y los accesos correspondientes durante el período de prueba;
9. confirmar después la continuidad definitiva o ejecutar el cierre correspondiente.

La revisión técnica actual confirma:

- repositorio `vento-talento`;
- aplicación móvil Expo con vacantes, postulaciones, proceso, documentos y perfil;
- administración de vacantes en VISO;
- migraciones canónicas en `vento-shell`;
- esquema remoto `talento`;
- tablas de candidatos, vacantes, postulaciones, etapas, documentos, entrevistas, evaluaciones, ofertas y preingreso;
- cero registros actuales en las tablas del esquema `talento`.

La base técnica existente no convierte el producto en actual. TALENTO queda:

```text
PROYECTO_FUTURO_CON_BASE_TÉCNICA
```

Flujo objetivo:

```text
VISO o el responsable autorizado crea y publica la vacante
        ↓
TALENTO permite consultar y presentar la postulación
        ↓
TALENTO solicita los datos y documentos requeridos para esa etapa
        ↓
el equipo autorizado evalúa, entrevista, rechaza o selecciona
        ↓
TALENTO conserva el pre-registro y la trazabilidad de selección
        ↓
la vinculación autorizada crea o enlaza el trabajador en ANIMA/VISO
        ↓
el trabajador opera con estado EN_PERIODO_DE_PRUEBA y permisos provisionales acordes con su función
        ↓
se confirma continuidad definitiva o se cierra la vinculación y sus accesos
```

Reglas:

1. Una persona postulada es `CANDIDATO`, no trabajador.
2. El pre-registro no crea por sí solo relación laboral, turno, asistencia ni acceso operativo.
3. Solo una selección y vinculación autorizadas podrán crear o enlazar `employee_id`.
4. El período de prueba será un estado del trabajador ya vinculado, no una forma de mantenerlo como candidato informal.
5. Los permisos provisionales se asignarán por sede, función, fechas y aplicación, únicamente en la medida necesaria para operar.
6. La continuidad definitiva no requerirá crear otra persona; actualizará el estado del mismo vínculo.
7. Un rechazo, retiro o vencimiento cerrará la postulación sin borrar la trazabilidad obligatoria.
8. Los documentos se pedirán por etapa y finalidad; no se solicitará desde el inicio información que todavía no sea necesaria.
9. El candidato deberá conocer qué datos se solicitan, para qué se usan y cuánto tiempo se conservarán.
10. Una persona podrá postularse a varias vacantes sin duplicar su identidad.
11. ANIMA recibirá únicamente la información laboral necesaria después de la vinculación autorizada.
12. VISO conservará la administración empresarial de vacantes, selección, estado laboral y permisos; TALENTO conservará la experiencia de la persona candidata.

TALENTO es una aplicación candidata real que faltaba en el catálogo inicial de `CAP-MAP-004`, pero se incorporará como **aplicación futura**, no como operación actual.

Su diseño detallado, reglas documentales, estados, consentimiento, retención y traspaso a ANIMA deberán planearse antes de implementar o activar la base técnica existente.

##### 6.2. La comunicación digital no está totalmente ausente

Aunque AURA no tiene repositorio, pantallas ni funciones, existen:

- CMS de sitio web en VISO;
- administración de bloques y contenidos;
- repositorio `vento-group-web`;
- páginas de restaurantes, servicios, empleos, eventos y ecosistema;
- `website_items` con 9 registros;
- `website_blocks` con 7 registros;
- `app_content_blocks` con 9 registros.

Esto representa parcialmente:

- `CAP-14.01`;
- `CAP-14.03`;
- `CAP-14.04`;
- una parte de `CAP-14.11`.

No demuestra gestión de campañas, oportunidades, reputación multicanal ni medición promocional.

VISO y el sitio público son superficies actuales. AURA conserva la candidatura futura para coordinación de mercadeo, pero no podrá apropiarse retroactivamente de los hechos ya gobernados por otras fuentes.

##### 6.3. VITAL es un proyecto personal separado

El repositorio y esquema `vital` contienen programas personales de actividad física, deporte, nutrición, preparación y bienestar.

El usuario confirma que:

- VITAL es un proyecto aparte de salud y entrenamiento;
- su relación con Vento Group es nominal o secundaria;
- en la práctica es principalmente un proyecto personal;
- actualmente está parcialmente abandonado;
- no forma parte de la operación que este mapa debe remodelar.

No constituyen evidencia de:

- identificación de peligros laborales;
- investigación de accidentes;
- entrega de elementos de protección;
- inspecciones obligatorias;
- higiene e inocuidad empresarial;
- emergencias laborales.

Por tanto, VITAL queda `FUERA_DE_LA_LÍNEA_BASE` de estas 217 subcapacidades. Su código y datos se conservan como producto separado; no se eliminan ni se incluyen en la remodelación de Vento OS.

No se utilizará VITAL para declarar cubierta `CAP-03`.

---

#### 7. Estructuras existentes sin uso operativo comprobado

| Frente                                  | Evidencia técnica                                                                                                      | Estado                             |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| reclutamiento y selección               | TALENTO tiene aplicación y esquema con 0 registros, pero todavía debe diseñarse y planearse como portal previo a ANIMA | `PROYECTO_FUTURO_CON_BASE_TÉCNICA` |
| recepción de compras                    | `procurement_receptions` e ítems con 0 registros                                                                       | `ESTRUCTURA_SIN_USO`               |
| ejecución productiva                    | solicitudes, lotes, consumos, salidas y paquetes con 0 registros                                                       | `ESTRUCTURA_SIN_USO`               |
| operación POS propia                    | sesiones, pedidos de sesión, turnos, movimientos y pagos POS con 0 registros                                           | `ESTRUCTURA_SIN_USO`               |
| importación de ventas Makos             | lotes, filas, mapeos y consumos con 0 registros                                                                        | `ESTRUCTURA_SIN_USO`               |
| mantenimiento de activos                | registros nuevos de mantenimiento con 0 filas                                                                          | `ESTRUCTURA_SIN_USO`               |
| conteos patrimoniales                   | sesiones y líneas de conteo de activos con 0 filas                                                                     | `ESTRUCTURA_SIN_USO`               |
| documentos internos valorizados         | comprobantes POS internos y secuencias con 0 filas                                                                     | `ESTRUCTURA_SIN_USO`               |
| gastos y presupuestos NUMERA            | tablas disponibles con 0 gastos y 0 presupuestos                                                                       | `ESTRUCTURA_SIN_USO`               |
| solicitudes de facturación identificada | perfiles y solicitudes disponibles con 0 registros                                                                     | `ESTRUCTURA_SIN_USO`               |
| sesiones de entrega de pedidos          | estructura disponible con 0 registros                                                                                  | `ESTRUCTURA_SIN_USO`               |
| billetera y movimientos de lealtad      | estructura disponible con 0 movimientos                                                                                | `ESTRUCTURA_SIN_USO`               |

Estos frentes no se tratarán como capacidades inexistentes. Requieren:

1. prueba de flujo;
2. verificación de permisos;
3. adopción real;
4. datos controlados;
5. confirmación de que sustituyen el método manual.

---

#### 8. Capacidades con ausencia funcional específica confirmada

##### 8.1. Personas y asistencia

| Capacidad                 | Ausencia confirmada                                                               | Evidencia                  |
| ------------------------- | --------------------------------------------------------------------------------- | -------------------------- |
| `CAP-02.07` y `CAP-02.08` | no existe una corrección auditable de hora o tipo de marcación                    | `TEC-15`                   |
| `CAP-02.12`               | no existe nómina, liquidación ni gestión completa de pagos y beneficios laborales | esquema financiero parcial |

La nota de incidencia de ANIMA no equivale a corregir una marcación. La exportación de asistencia tampoco constituye nómina.

##### 8.2. Venta, pago y control de jornada

| Capacidad                     | Ausencia confirmada                                                                | Evidencia                         |
| ----------------------------- | ---------------------------------------------------------------------------------- | --------------------------------- |
| `CAP-09.09` y `CAP-12.07`     | no existe corrección manual auditable de medio de pago                             | `TEC-16`                          |
| `CAP-09.15`                   | no existe jornada POS propia comprobada con sesiones y cierres usados              | tablas POS con 0 registros        |
| `CAP-09.08` a `CAP-09.10`     | el flujo digital existe, pero el POS presencial objetivo todavía no está operativo | PULSO parcial y tablas POS vacías |
| `CAP-17.04` aplicado a ventas | PULSO no tiene exportación de auditoría comprobada                                 | `TEC-17`                          |

Makos puede seguir registrando ventas actuales. Su importación manual no demuestra que el POS futuro de PULSO esté listo.

##### 8.3. Finanzas y cartera

| Capacidad                                      | Ausencia confirmada                                                                         |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `CAP-12.03` Gestionar bancos y pagos           | no existe módulo bancario completo                                                          |
| `CAP-12.04` Gestionar cuentas por cobrar       | no existe cartera completa con documentos, aplicaciones de pago, vencimiento y saldo        |
| `CAP-12.05` Gestionar cuentas por pagar        | compras y condiciones de proveedor existen, pero no una cartera completa de obligaciones    |
| `CAP-12.12` Gestionar tesorería                | no existe ciclo canónico completo                                                           |
| `CAP-12.13` Gestionar impuestos y obligaciones | no existe sistema tributario interno completo; intervienen herramientas y asesores externos |
| `CAP-12.14` Cerrar períodos y emitir reportes  | NUMERA tiene una base parcial, no cierre contable completo                                  |

Los documentos POS internos de NEXO no son facturas fiscales y no constituyen por sí solos una cartera completa.

La arquitectura preliminar ya analizada se conserva como referencia, no como implementación:

- cuentas por cobrar internas apoyadas en documentos y pagos aplicados;
- cuentas por pagar apoyadas en órdenes, recepciones y condiciones de proveedores;
- migraciones y contratos de datos siempre desde `vento-shell`.

##### 8.4. Clientes y servicio

No se encontró ciclo canónico completo para:

- `CAP-10.04` recibir, investigar y resolver reclamos;
- `CAP-10.05` autorizar y ejecutar devoluciones o compensaciones;
- `CAP-10.06` medir satisfacción;
- `CAP-10.08` gestionar reservas y eventos de atención.

Mensajes asociados a pedidos y `user_feedback` vacío representan una base parcial, no los ciclos completos.

##### 8.5. Instalaciones

`CAP-13` carece de una aplicación o ciclo dedicado comprobado para:

- planear mantenimiento de instalaciones;
- solicitar y cerrar reparaciones;
- controlar limpieza y saneamiento;
- controlar plagas;
- controlar servicios;
- inspeccionar condiciones;
- calibrar equipos;
- gestionar llaves y acceso físico;
- controlar obras y adecuaciones;
- cerrar novedades de instalaciones.

Las sedes, ubicaciones y activos permiten identificar el lugar u objeto. No sustituyen la ejecución y evidencia de mantenimiento.

##### 8.6. Comunicación y desarrollo comercial

Sin representación canónica comprobada:

- `CAP-14.05` gestionar campañas completas;
- `CAP-14.07` administrar oportunidades comerciales;
- la parte de propuesta y negociación de `CAP-14.08` y `CAP-14.09`;
- `CAP-14.10` medir de extremo a extremo una promoción;
- `CAP-14.11` gestionar reputación y respuestas multicanal.

El CMS publica contenido; no es CRM, gestor de campaña ni sistema de reputación.

##### 8.7. Continuidad

No se encontró ciclo empresarial integral para:

- inventariar dependencias críticas;
- definir alternativas por capacidad;
- declarar y priorizar incidentes empresariales;
- operar temporalmente fuera de línea;
- incorporar lo ocurrido durante la falla;
- confirmar pendientes después de recuperar;
- probar respaldos y recuperación por dominio;
- aprender y actualizar el plan.

Tickets, eventos técnicos y respaldos de infraestructura pueden participar, pero no cubren por sí solos `CAP-18.01` a `CAP-18.12`.

---

#### 9. Coberturas parciales que no deben declararse cerradas

| Frente     | Parte existente                             | Parte faltante                                                               |
| ---------- | ------------------------------------------- | ---------------------------------------------------------------------------- |
| compras    | proveedor, orden y algunos costos           | adopción de recepción nueva, comparación, devoluciones y evaluación completa |
| activos    | inventario, grupos y movimientos            | mantenimiento, garantías, documentos, conteos y baja operativa comprobada    |
| producción | recetas, pasos y rutas                      | solicitud, ejecución, consumo, rendimiento y cierre con datos reales         |
| ventas     | pedido digital y pago digital limitado      | POS presencial, caja, consumidor final, correcciones y cierres               |
| entregas   | traslados internos                          | despacho sellado, recepción nueva y entrega de pedido con adopción           |
| finanzas   | centros, periodos, categorías y costos      | gastos reales, presupuestos, bancos, cartera, tesorería y cierre             |
| tecnología | accesos, navegación, dispositivos y tickets | gobierno de cambios, pruebas, licencias, costos y capacitación completa      |
| documentos | documentos, tipos y reglas                  | retención, eliminación, firmas, versiones y auditoría integral               |
| análisis   | exportaciones y páginas puntuales           | indicadores comunes, calidad, servicio, acciones y seguimiento               |

`PARCIAL` no significa fallido. Significa que la remodelación deberá preservar lo útil y completar el resultado sin declarar terminada la capacidad antes de tiempo.

---

#### 10. Operaciones manuales o externas que sí representan capacidad

| Operación                                | Representación actual                   | Decisión                                                             |
| ---------------------------------------- | --------------------------------------- | -------------------------------------------------------------------- |
| ventas Makos                             | sistema externo y Excel                 | capacidad existente, integración interna manual                      |
| pedidos Shopify                          | plataforma externa y traslado operativo | capacidad existente, automatización no comprobada                    |
| pedidos Rappi                            | plataforma externa y traslado operativo | capacidad existente, API no comprobada                               |
| solicitudes ManyChat o WhatsApp          | mensajes y copia humana                 | capacidad existente, fuente interna por confirmar                    |
| facturación electrónica actual           | Dataico u otro emisor según titular     | capacidad externa con control interno necesario                      |
| asesoría jurídica, contable o tributaria | profesional externo y documentos        | capacidad interna de gestionar la relación, no de emitir el concepto |
| transporte tercerizado                   | mensajería y comprobantes               | capacidad interna de asignar y confirmar entrega                     |

La ausencia de una integración automática no significa ausencia de la capacidad empresarial.

---

#### 11. Capacidades nuevas fuera de las 217

No se propone crear una familia ni una subcapacidad nueva.

Los elementos encontrados se absorben así:

| Elemento observado                        | Cobertura existente                                                                          |
| ----------------------------------------- | -------------------------------------------------------------------------------------------- |
| experiencia del candidato en TALENTO      | `CAP-02.02`, `CAP-02.03`, `CAP-02.11`, `CAP-15`, `CAP-16` y traspaso autorizado a ANIMA/VISO |
| sitio web y CMS                           | `CAP-14.01` a `CAP-14.04` y `CAP-14.11`                                                      |
| POS a consumidor final                    | `CAP-09.08` a `CAP-09.10`, `CAP-12.02`, `CAP-12.06` y `CAP-12.07`                            |
| cartera                                   | `CAP-12.04`, `CAP-12.05`, conciliación y documentos                                          |
| soporte por tickets                       | `CAP-15.06`, `CAP-15.07` y `CAP-18` cuando afecte continuidad                                |
| dispositivos compartidos y firma de actor | `CAP-15`, `CAP-16` y controles de autorización ya definidos                                  |

VITAL no obliga a ampliar la línea base porque es un proyecto personal separado de salud y entrenamiento, actualmente sin continuidad operativa dentro de Vento OS.

La taxonomía de 217 subcapacidades continúa siendo suficiente para aprobar una línea base, siempre que `CAP-MAP-015` incorpore TALENTO como proyecto futuro previo a ANIMA y conserve sus estados de cobertura.

---

#### 12. Frentes de brecha que deberá conservar la remodelación

| ID               | Frente                                                                                            | Capacidades principales                                                | Tipo                             |
| ---------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | -------------------------------- |
| `BRECHA-CAP-001` | corrección auditable de asistencia                                                                | `CAP-02.07`, `CAP-02.08`                                               | ausencia funcional               |
| `BRECHA-CAP-002` | nómina, pagos y beneficios laborales                                                              | `CAP-02.12`                                                            | sin representación comprobada    |
| `BRECHA-CAP-003` | seguridad, salud y cumplimiento integral                                                          | `CAP-03`                                                               | cobertura dispersa               |
| `BRECHA-CAP-004` | adopción real de compras, activos y producción nuevos                                             | `CAP-05`, `CAP-07`, `CAP-08`                                           | estructura sin uso               |
| `BRECHA-CAP-005` | POS presencial, caja, correcciones y auditoría de ventas                                          | `CAP-09`, `CAP-12.02`, `CAP-12.06`, `CAP-12.07`                        | cobertura parcial                |
| `BRECHA-CAP-006` | reclamos, devoluciones, satisfacción y reservas                                                   | `CAP-10.04` a `CAP-10.06`, `CAP-10.08`                                 | sin ciclo completo               |
| `BRECHA-CAP-007` | despacho nuevo y entrega trazable al cliente                                                      | `CAP-11`                                                               | estructura sin uso o parcial     |
| `BRECHA-CAP-008` | bancos, cartera, tesorería, impuestos y cierre                                                    | `CAP-12.03` a `CAP-12.05`, `CAP-12.12` a `CAP-12.14`                   | ausencia o cobertura parcial     |
| `BRECHA-CAP-009` | mantenimiento integral de instalaciones                                                           | `CAP-13`                                                               | sin representación comprobada    |
| `BRECHA-CAP-010` | campañas, oportunidades y reputación                                                              | `CAP-14.05`, `CAP-14.07` a `CAP-14.11`                                 | cobertura parcial                |
| `BRECHA-CAP-011` | gobierno tecnológico y documental completo                                                        | `CAP-15`, `CAP-16`                                                     | cobertura parcial                |
| `BRECHA-CAP-012` | indicadores, mejora y continuidad empresarial                                                     | `CAP-17`, `CAP-18`                                                     | cobertura parcial o ausente      |
| `BRECHA-CAP-013` | diseñar y validar TALENTO → ANIMA desde postulación hasta período de prueba, continuidad o cierre | `CAP-02.02`, `CAP-02.03`, `CAP-02.11`, `CAP-02.13`, `CAP-15`, `CAP-16` | proyecto futuro con base técnica |

Estas brechas se incorporan al plan como insumo obligatorio. No se dejan únicamente en el registro histórico de esta tarea.

---

#### 13. Dudas y comprobaciones

No se crean preguntas nuevas.

Esta tarea:

- utiliza las preguntas `OPE`, `DAT`, `ACT`, `EXT` y `GOV` ya registradas;
- utiliza `TEC-01` a `TEC-19`;
- incorpora la consulta actual de repositorios, rutas y tablas remotas;
- no convierte falta de respuesta operativa en ausencia técnica;
- no pide al usuario información que puede obtenerse de código o datos.

Las preguntas operativas pendientes servirán para determinar **cómo se ejecuta hoy** una capacidad manual, no para negar la brecha técnica ya observada.

---

#### 14. Decisiones para CAP-MAP-015

`CAP-MAP-015` deberá:

1. incorporar TALENTO al catálogo como proyecto futuro con base técnica;
2. definirlo como portal de vacantes, postulación, evaluación y pre-registro anterior a ANIMA;
3. conservar VISO como administración de vacantes, decisiones laborales y permisos;
4. conservar TALENTO como experiencia y expediente de la persona candidata;
5. registrar el traspaso autorizado hacia ANIMA/VISO sin duplicar identidad;
6. separar candidato, seleccionado pendiente de vinculación, trabajador en período de prueba, trabajador activo y vínculo cerrado;
7. reconocer VISO CMS y `vento-group-web` como cobertura actual de publicación;
8. mantener AURA como candidata futura de coordinación comercial;
9. excluir VITAL de la línea base operativa sin eliminar su producto personal;
10. conservar las trece brechas `BRECHA-CAP-001` a `BRECHA-CAP-013`;
11. impedir que tablas vacías se presenten como operación validada;
12. aprobar una línea base que pueda pasar después a análisis y remodelación.

---

#### 15. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas mediante familia y excepciones.
2. La taxonomía no necesita una capacidad adicional.
3. TALENTO es un proyecto futuro con base técnica, no una aplicación operativa actual.
4. TALENTO será el portal de empleo previo a ANIMA y faltaba en el catálogo inicial.
5. La persona empieza como candidata y solo se convierte en trabajadora después de una vinculación autorizada.
6. El período de prueba será un estado laboral controlado con permisos provisionales acordes con la función, no una identidad paralela.
7. El traspaso TALENTO → ANIMA/VISO reutilizará la identidad y conservará trazabilidad.
8. VISO CMS y el sitio web representan parte real de comunicación y publicación.
9. AURA sigue sin existir y no puede considerarse implementación.
10. VITAL es un proyecto personal separado y no cubre seguridad y salud laboral.
11. Productos e inventario tienen los ciclos más claramente comprobados.
12. Producción, POS, recepción nueva y activos avanzados tienen estructura sin uso.
13. Finanzas carece de contabilidad, bancos, cartera y tesorería completas.
14. No existe corrección auditable de marcación ni de medio de pago.
15. Instalaciones y continuidad no tienen ciclo canónico completo.
16. Las operaciones externas o manuales siguen siendo capacidades existentes.
17. Se conservan trece frentes de brecha para la remodelación.
18. No se requieren preguntas nuevas.

---

#### 16. Lo que esta tarea no autoriza

- crear o modificar tablas;
- ejecutar migraciones;
- desplegar o retirar funciones;
- poblar tablas vacías;
- crear datos de prueba productivos;
- integrar Shopify, Rappi, ManyChat o Makos;
- implementar TALENTO, AURA, POS, cartera o continuidad;
- mover migraciones fuera de `vento-shell`;
- eliminar VITAL;
- declarar fallida una capacidad únicamente por falta de código;
- iniciar análisis técnico detallado o remodelación antes de aprobar la línea base.

---

#### 17. Criterios de aceptación

`CAP-MAP-014` podrá aprobarse cuando:

- las 217 subcapacidades queden cubiertas;
- uso, estructura vacía, cobertura parcial, trabajo manual y ausencia se distingan;
- una tabla vacía no se presente como operación;
- TALENTO se reconozca como proyecto futuro anterior a ANIMA, sin declararlo adoptado;
- candidato, pre-registro, vinculación, período de prueba y trabajador activo queden separados;
- el traspaso a ANIMA/VISO no duplique identidad ni conceda acceso antes de la vinculación;
- el CMS y el sitio web se reconozcan sin fingir que AURA existe;
- VITAL se conserve como proyecto personal separado y no se confunda con salud laboral;
- las ausencias funcionales confirmadas queden explícitas;
- las operaciones manuales y externas no se borren;
- las trece brechas queden dentro del plan;
- no se creen preguntas duplicadas;
- no se autorice implementación;
- `CAP-MAP-015` permanezca como única continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
capacidad necesaria
        ↓
evidencia de código y datos
        ↓
uso, estructura vacía, parcial, manual o ausente
        ↓
brecha que debe conservar la remodelación
        ↓
línea base lista para aprobación
```

La continuidad será exclusivamente:

```text
CAP-MAP-015
— Aprobar la línea base de capacidades actuales, necesarias y candidatas de Vento Group
```

`CAP-MAP-015` consolidará las decisiones de `CAP-MAP-001` a `CAP-MAP-014` sin volver a abrir preguntas ya resueltas.

---

#### 19. Adición posterior incorporada: destino ejecutable de las brechas

Las brechas de esta tarea no quedan solamente como hallazgos. Cada una conserva
un destino canónico con marcador de tarea:

| Brecha           | Tareas canónicas de destino                                                                         |
| ---------------- | --------------------------------------------------------------------------------------------------- |
| `BRECHA-CAP-001` | `CAP-SCOPE-002`, `INT-WORK-003` y tareas posteriores de corrección auditable que deriven del diseño |
| `BRECHA-CAP-002` | `CAP-SCOPE-002` y alcance financiero/laboral que apruebe `CAP-MAP-015`                              |
| `BRECHA-CAP-003` | `CAP-SCOPE-003`                                                                                     |
| `BRECHA-CAP-004` | `CAP-SCOPE-005`, `CAP-SCOPE-007`, `CAP-SCOPE-008` y tareas ORIGO, NEXO y FOGO ya existentes         |
| `BRECHA-CAP-005` | `CAP-SCOPE-009`, tareas PULSO e `INT-POS-001` a `INT-POS-019` según alcance                         |
| `BRECHA-CAP-006` | `CAP-SCOPE-010`, `PULSO-UX-009`, `INT-POS-008` e `INT-POS-019`                                      |
| `BRECHA-CAP-007` | `CAP-SCOPE-011` y tareas NEXO/PULSO de despacho, recepción y entrega                                |
| `BRECHA-CAP-008` | `CAP-SCOPE-012`, `NUMERA-DOM-010`, `NUMERA-UX-020` y tareas financieras que se deriven              |
| `BRECHA-CAP-009` | `CAP-SCOPE-013`, `NEXO-DOM-012`, `NEXO-DOM-026` y tareas de instalaciones que se deriven            |
| `BRECHA-CAP-010` | `CAP-SCOPE-014`, `AURA-AUD-010` e `INT-MKT-001`                                                     |
| `BRECHA-CAP-011` | `CAP-SCOPE-015` y `CAP-SCOPE-016`                                                                   |
| `BRECHA-CAP-012` | `CAP-SCOPE-017` y `CAP-SCOPE-018`                                                                   |
| `BRECHA-CAP-013` | `CAP-TAL-001` a `CAP-TAL-006`                                                                       |

Reglas:

1. una referencia a una tarea amplia no sustituye sus subtareas derivadas;
2. las subtareas nuevas deberán añadirse al documento correspondiente cuando se detecten;
3. no se cerrará una brecha solo porque exista una tarea con nombre relacionado;
4. una brecha se cierra únicamente con resultado, evidencia y aceptación;
5. `CAP-MAP-015` deberá comprobar que los destinos continúan visibles antes de aprobar la línea base.

### ✅ CAP-MAP-015 — Aprobar la línea base de capacidades actuales, necesarias y candidatas de Vento Group

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** cierre documental y control de línea base
**Dependencia anterior:** `CAP-MAP-014`
**Continuidad reservada:** `CODE-AUD-001`

---

#### 1. Resultado propuesto

Esta tarea consolida `CAP-MAP-001` a `CAP-MAP-014` en la línea base:

| Campo                        | Valor                       |
| ---------------------------- | --------------------------- |
| Identificador                | `LB-CAP-VENTO-001`          |
| Versión                      | `1.0`                       |
| Fecha de corte               | 2026-07-23                  |
| Estado                       | `PROPUESTA PARA APROBACIÓN` |
| Familias de capacidad        | **18**                      |
| Subcapacidades               | **217**                     |
| Brechas confirmadas          | **13**                      |
| Destinos canónicos de brecha | **13 de 13**                |

La línea base define qué necesita hacer Vento Group, qué cobertura se ha
comprobado, qué aplicaciones son candidatas a gobernar cada resultado y qué
trabajo debe permanecer visible. No declara terminada una función porque exista
código, una tabla o una pantalla.

---

#### 2. Qué se aprueba y qué no

La aprobación de `LB-CAP-VENTO-001` significa:

1. aceptar las 18 familias y 217 subcapacidades como estructura de referencia;
2. aceptar las fronteras candidatas entre aplicaciones para orientar la
   auditoría y la remodelación;
3. conservar los estados actual, parcial, manual, externo, futuro y ausente;
4. conservar las trece brechas y sus tareas de destino;
5. permitir que `CODE-AUD-001` contraste esta línea base con la implementación.

La aprobación **no** significa:

- afirmar que todas las capacidades funcionan actualmente;
- cerrar preguntas operativas todavía pendientes;
- aprobar diseños, código, migraciones, despliegues o cambios de datos;
- autorizar creación o eliminación de aplicaciones;
- aprobar una conclusión contable, tributaria, laboral o jurídica;
- convertir una aplicación candidata en propietaria definitiva sin evidencia.

---

#### 3. Estructura empresarial congelada en esta versión

| Familia                                    | Resultado general esperado                              |
| ------------------------------------------ | ------------------------------------------------------- |
| `CAP-01` Gobierno y dirección              | decisiones, políticas y responsabilidades vigentes      |
| `CAP-02` Personas y trabajo                | vinculación, operación laboral y desarrollo trazables   |
| `CAP-03` Seguridad, salud y cumplimiento   | riesgos, obligaciones y acciones controladas            |
| `CAP-04` Producto, oferta y abastecimiento | oferta definida y abastecimiento coordinado             |
| `CAP-05` Compras y proveedores             | necesidad comprada, recibida y evaluada                 |
| `CAP-06` Inventario                        | existencias identificadas, disponibles y conciliadas    |
| `CAP-07` Logística interna y activos       | bienes trasladados, custodiados y mantenidos            |
| `CAP-08` Producción y transformación       | producción planeada, ejecutada y verificada             |
| `CAP-09` Venta y atención                  | solicitud convertida en venta y atendida correctamente  |
| `CAP-10` Clientes y experiencia            | identidad, relación, novedad y satisfacción conservadas |
| `CAP-11` Entregas y cumplimiento           | compromiso preparado, entregado y demostrado            |
| `CAP-12` Finanzas y contabilidad           | dinero, obligaciones y documentos conciliados           |
| `CAP-13` Instalaciones                     | espacios disponibles, seguros y mantenidos              |
| `CAP-14` Mercadeo y crecimiento            | oferta comunicada y oportunidad medida                  |
| `CAP-15` Tecnología y administración       | acceso, soporte, configuración y continuidad gobernados |
| `CAP-16` Información y documentos          | información íntegra, localizable y conservada           |
| `CAP-17` Analítica y mejora                | desempeño medido y decisiones sustentadas               |
| `CAP-18` Continuidad y control             | incidentes, excepciones y recuperación trazables        |

El detalle de las 217 subcapacidades permanece en `CAP-MAP-001` y
`CAP-MAP-002`. Esta tarea no crea una taxonomía paralela.

---

#### 4. Clasificación aprobable

| Clasificación      | Cantidad |
| ------------------ | -------: |
| `NÚCLEO`           |   **94** |
| `SOPORTE`          |   **45** |
| `TRANSVERSAL`      |   **78** |
| `FUTURA`           |    **0** |
| `FUERA_DE_ALCANCE` |    **0** |
| **Total**          |  **217** |

Una capacidad necesaria no se vuelve futura porque la aplicación destinada a
soportarla todavía no exista. Por eso TALENTO, AURA y el POS futuro se describen
como aplicaciones o coberturas futuras, mientras las necesidades empresariales
que deberán atender permanecen clasificadas como núcleo, soporte o transversal.

VITAL no se usa para retirar capacidades de salud laboral: esas capacidades
continúan en `CAP-03`, aunque VITAL sea un proyecto personal separado.

---

#### 5. Regla de lectura de la cobertura

La línea base usará estas categorías sin mezclarlas:

| Estado                          | Significado                                                                 |
| ------------------------------- | --------------------------------------------------------------------------- |
| `EN USO COMPROBADO`             | existe evidencia de operación real                                          |
| `PARCIAL`                       | una parte existe o se usa, pero el resultado no está completo               |
| `ESTRUCTURA SIN USO COMPROBADO` | existe código o dato, pero no prueba de adopción                            |
| `MANUAL`                        | la organización obtiene el resultado fuera de una automatización controlada |
| `EXTERNO`                       | interviene un tercero; Vento conserva responsabilidad sobre el resultado    |
| `FUTURO CON BASE TÉCNICA`       | existe base reutilizable, pero no producto operativo aprobado               |
| `IDEA FUTURA`                   | existe intención, sin diseño ni funciones aprobadas                         |
| `AUSENTE`                       | no se encontró representación suficiente del resultado                      |
| `POR COMPROBAR`                 | falta observación operativa y no debe inventarse el estado                  |

Productos e inventario presentan la cobertura en uso más sólida encontrada.
Compras, activos, producción, venta, entrega, finanzas y otras familias conservan
estados parciales, estructuras sin uso comprobado, trabajo manual, operación
externa o ausencia según `CAP-MAP-014`.

---

#### 6. Línea base de aplicaciones y proyectos

| Aplicación o proyecto | Posición en la línea base                                                                    |
| --------------------- | -------------------------------------------------------------------------------------------- |
| SHELL                 | entrada, navegación y contexto común actuales; no es propietaria universal                   |
| VISO                  | organización, administración laboral, roles, permisos y CMS actuales                         |
| ANIMA                 | experiencia personal del trabajador y asistencia actual                                      |
| TALENTO               | proyecto futuro con base técnica, anterior a ANIMA                                           |
| NEXO                  | inventario, logística interna y activos; cobertura actual más comprobada                     |
| FOGO                  | conocimiento de recetas actual; ejecución productiva parcial o sin uso comprobado            |
| ORIGO                 | proveedores y órdenes de compra actuales; recepción con cobertura parcial                    |
| PULSO                 | pedidos digitales parciales; POS y control completo de venta todavía futuros                 |
| PASS                  | identidad y experiencia de cliente con cobertura parcial                                     |
| NUMERA                | análisis económico y financiero parcial; no es contabilidad completa                         |
| AURA                  | idea futura; no existen diseño inicial ni funciones aprobadas                                |
| vento-group-web       | superficie pública actual; no gobierna capacidades empresariales                             |
| VITAL                 | proyecto personal separado de salud y entrenamiento, fuera de la línea operativa de Vento OS |

Makos, Rappi, Shopify, ManyChat, Dataico, bancos, proveedores contables y otros
terceros se conservan como medios o fuentes externas. Su participación no
transfiere automáticamente la responsabilidad empresarial de Vento.

---

#### 7. Propiedad candidata por familia

| Familia  | Aplicación candidata y frontera principal                                          |
| -------- | ---------------------------------------------------------------------------------- |
| `CAP-01` | VISO administra estructura; Gerencia conserva decisión y aprobación                |
| `CAP-02` | VISO administra; ANIMA sirve al trabajador; TALENTO servirá al candidato           |
| `CAP-03` | VISO y administración coordinan; especialistas externos pueden ejecutar            |
| `CAP-04` | NEXO gobierna producto físico; FOGO transformación; PULSO oferta vendible          |
| `CAP-05` | ORIGO gobierna proveedor, solicitud y orden de compra                              |
| `CAP-06` | NEXO gobierna inventario y movimientos internos                                    |
| `CAP-07` | NEXO gobierna traslados, custodia y activos                                        |
| `CAP-08` | FOGO gobierna receta, planeación y ejecución productiva                            |
| `CAP-09` | PULSO gobierna pedido, venta, caja y correcciones operativas                       |
| `CAP-10` | PASS gobierna identidad y relación; PULSO consume el contexto de venta             |
| `CAP-11` | NEXO gobierna movimiento interno; PULSO entrega al cliente                         |
| `CAP-12` | NUMERA gobierna consolidación; PULSO conserva hechos de venta y caja               |
| `CAP-13` | NEXO es candidato interno; ejecución puede apoyarse en terceros                    |
| `CAP-14` | VISO CMS y web cubren publicación actual; AURA es futura; PULSO aplica promociones |
| `CAP-15` | VISO, SHELL, NEXO o la aplicación afectada según el resultado administrado         |
| `CAP-16` | la aplicación que origina el hecho conserva su registro de autoridad               |
| `CAP-17` | NUMERA consolida; las aplicaciones fuente conservan los hechos                     |
| `CAP-18` | la aplicación afectada registra; SHELL coordina identidad y acceso común           |

Estas asignaciones son candidaturas de remodelación. La auditoría podrá
ratificarlas o proponer una versión nueva, pero no cambiarlas silenciosamente.

---

#### 8. Fronteras que no deben perderse

1. SHELL no absorberá la propiedad funcional de todas las aplicaciones.
2. VISO administra la relación laboral; ANIMA no crea ni aprueba trabajadores.
3. TALENTO administra la experiencia de la persona candidata; no concede acceso
   de trabajador.
4. NEXO conserva inventario y logística interna; PULSO conserva venta y entrega
   al cliente.
5. ORIGO origina compras; NEXO recibe y afecta inventario.
6. FOGO define y ejecuta transformación; NEXO registra los efectos de inventario.
7. PASS conserva identidad y relación del cliente; PULSO conserva la transacción.
8. NUMERA consolida y analiza; no reemplaza el hecho operativo de origen.
9. AURA no puede presentarse como sistema existente.
10. VITAL no representa seguridad y salud en el trabajo de Vento Group.

---

#### 9. TALENTO anterior a ANIMA

La línea base incorpora esta secuencia:

```text
vacante publicada
        ↓
persona candidata y postulación
        ↓
datos, documentos, consentimiento y evaluación
        ↓
selección pendiente de vinculación
        ↓
vinculación laboral autorizada y reutilización de identidad
        ↓
trabajador en período de prueba con permisos provisionales
        ↓
continuidad definitiva o cierre del vínculo
```

La persona candidata no será trabajadora ni recibirá permisos operativos antes
de la vinculación autorizada. El traspaso hacia VISO y ANIMA deberá ser trazable,
repetible sin duplicar registros y conservar el expediente permitido.

El trabajo quedó incorporado como tareas canónicas reales:

- `CAP-TAL-001` a `CAP-TAL-006`;
- las seis tareas forman parte de la secuencia activa;
- su existencia no significa que TALENTO ya esté diseñado o implementado.

---

#### 10. PULSO y venta a consumidor final

El POS futuro deberá separar:

1. venta a consumidor final cuando no se solicite documento identificado;
2. venta con identificación del comprador cuando se solicite o sea obligatoria;
3. emisión, corrección, anulación y conservación del documento correspondiente;
4. registro trazable de toda venta, pago, caja, impuesto y excepción.

El flujo de consumidor final no exigirá registrar individualmente a cada cliente
cuando la regla aplicable permita ese tratamiento. Esto no autoriza ventas por
fuera del sistema ni omisión de obligaciones. Las reglas jurídicas y tributarias
deberán volver a validarse al diseñar e implementar el POS.

---

#### 11. Duplicaciones y propiedad competidora

La única competencia funcional confirmada en esta fase es la edición de horarios
entre VISO y ANIMA. La remodelación deberá conservar una fuente gobernante y una
experiencia coherente para el trabajador.

También se conserva:

- el inventario técnico `TEC-18` de duplicaciones de implementación;
- copias manuales o archivos paralelos como riesgo de fuente sombra;
- integraciones válidas entre aplicaciones como cooperación, no duplicación;
- la obligación de comprobar una segunda propiedad antes de declararla.

---

#### 12. Brechas conservadas y ejecutables

| Brecha           | Resultado todavía insuficiente                   | Destino mínimo                                 |
| ---------------- | ------------------------------------------------ | ---------------------------------------------- |
| `BRECHA-CAP-001` | corrección auditable de asistencia               | `CAP-SCOPE-002`, `INT-WORK-003`                |
| `BRECHA-CAP-002` | nómina, prestaciones y obligaciones laborales    | `CAP-SCOPE-002` y derivadas                    |
| `BRECHA-CAP-003` | seguridad, salud y cumplimiento                  | `CAP-SCOPE-003`                                |
| `BRECHA-CAP-004` | adopción de compras, activos y producción        | `CAP-SCOPE-005`, `007`, `008`                  |
| `BRECHA-CAP-005` | POS, caja, correcciones y auditoría              | `CAP-SCOPE-009`, `INT-POS-001..019`            |
| `BRECHA-CAP-006` | novedades, devoluciones, satisfacción y reservas | `CAP-SCOPE-010` y derivadas                    |
| `BRECHA-CAP-007` | entrega al cliente                               | `CAP-SCOPE-011` y derivadas                    |
| `BRECHA-CAP-008` | bancos, cartera, tesorería, impuestos y cierre   | `CAP-SCOPE-012` y tareas NUMERA                |
| `BRECHA-CAP-009` | instalaciones                                    | `CAP-SCOPE-013` y tareas NEXO                  |
| `BRECHA-CAP-010` | campañas, oportunidades y reputación             | `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `BRECHA-CAP-011` | gobierno tecnológico y documental                | `CAP-SCOPE-015`, `016` y derivadas             |
| `BRECHA-CAP-012` | analítica, mejora y continuidad                  | `CAP-SCOPE-017`, `018` y derivadas             |
| `BRECHA-CAP-013` | recorrido TALENTO hacia ANIMA                    | `CAP-TAL-001..006`                             |

Las trece tienen destino documental. Ninguna se considera cerrada hasta que su
tarea produzca resultado, evidencia y aceptación.

---

#### 13. Preguntas e información todavía pendientes

Las preguntas operativas acumuladas permanecen en la lista separada acordada.
No se copian ni se vuelven a preguntar aquí.

Reglas:

1. una respuesta anterior conserva vigencia mientras no exista evidencia
   contradictoria;
2. lo comprobable en código, datos o repositorios corresponde al asistente;
3. lo observable en el trabajo se entrega como autocuestionario directo al
   trabajador adecuado;
4. cada pregunta solicita una sola respuesta concreta;
5. una respuesta pendiente ajustará el estado AS-IS, pero no bloquea la
   aprobación de la estructura empresarial;
6. ninguna ausencia de respuesta se convierte en una afirmación inventada.

Por tanto, `D-CAP004-008` y `D-CAP005-006` continúan como observaciones
operativas pendientes y no impiden iniciar la auditoría técnica.

---

#### 14. Control de cambios de la línea base

Después de aprobarse:

1. `LB-CAP-VENTO-001 v1.0` quedará congelada como referencia;
2. un hallazgo nuevo se registrará primero como evidencia o brecha;
3. cualquier cambio de capacidad, clasificación, frontera o propiedad indicará
   impacto, razón y tareas afectadas;
4. los ajustes menores usarán una adición trazable;
5. los cambios estructurales producirán una nueva versión;
6. `CODE-AUD-001` podrá proponer cambios, pero no reescribir esta versión de
   forma silenciosa;
7. una nueva tarea detectada se añadirá al documento canónico correspondiente,
   no solo al registro histórico.

---

#### 15. Uso de la línea base durante la auditoría

Cada superficie encontrada por `CODE-AUD-001` deberá poder relacionarse con:

```text
repositorio o servicio
        ↓
aplicación y superficie desplegada
        ↓
capacidad y resultado empresarial
        ↓
fuente, actor, permiso, evidencia y estado de uso
        ↓
coincidencia, duplicación, brecha o deuda
```

El código sin capacidad asociada quedará como candidato a deuda, utilidad
técnica o alcance no explicado. Una capacidad sin implementación suficiente
conservará su brecha. Ninguna de las dos conclusiones se asumirá sin evidencia.

---

#### 16. Decisiones propuestas

1. Se adopta `LB-CAP-VENTO-001 v1.0` como línea base documental.
2. Se conservan 18 familias y 217 subcapacidades.
3. Se conservan 94 capacidades núcleo, 45 de soporte y 78 transversales.
4. Se distinguen capacidad necesaria, aplicación actual y proyecto futuro.
5. Se aprueban las candidaturas y fronteras de aplicación como guía auditable.
6. Se conservan las trece brechas y todos sus destinos canónicos.
7. TALENTO queda como proyecto futuro anterior a ANIMA mediante `CAP-TAL-001..006`.
8. AURA permanece como idea futura sin funciones atribuidas.
9. VITAL permanece separado y no cubre salud laboral.
10. Las preguntas operativas pendientes no se duplican ni bloquean `CODE-AUD-001`.
11. Toda tarea adicional futura deberá incorporarse al plan ejecutable.
12. La siguiente continuidad única será `CODE-AUD-001`.

---

#### 17. Criterios de aceptación

`CAP-MAP-015` podrá aprobarse cuando:

- la línea base tenga identificador, versión y fecha;
- las 18 familias y 217 subcapacidades permanezcan visibles;
- clasificación y cobertura no se confundan;
- las aplicaciones actuales, futuras y separadas estén diferenciadas;
- las fronteras candidatas por familia estén registradas;
- TALENTO, ANIMA y VISO tengan un recorrido sin duplicar identidad;
- el POS futuro conserve consumidor final, trazabilidad y validación normativa;
- las duplicaciones confirmadas permanezcan visibles;
- las trece brechas tengan tareas de destino;
- las preguntas pendientes permanezcan aparte, simples y sin repetición;
- la aprobación no autorice implementación;
- el control de cambios impida reescrituras silenciosas;
- `CODE-AUD-001` sea la única continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse esta tarea quedará cerrada la cadena:

```text
necesidad empresarial
        ↓
capacidad y resultado
        ↓
actor, información, fuente, integración, permiso y evidencia
        ↓
clasificación, propiedad, duplicación y brecha
        ↓
LB-CAP-VENTO-001 v1.0 aprobada
```

La continuidad será exclusivamente:

```text
CODE-AUD-001
— Inventariar todos los repositorios y superficies desplegadas
```

`CODE-AUD-001` iniciará el contraste técnico sin reabrir decisiones ya
respondidas y sin tratar una estructura técnica como prueba automática de uso.
