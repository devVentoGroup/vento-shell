### AUDITORÍA DE OPERACIÓN REAL

### ✅ OPS-AUD-001 — Inventariar todas las empresas, sedes, áreas, canales y puntos operativos

**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Estado:** APROBADA
**Naturaleza de las clasificaciones:** Línea base operativa inicial, sujeta a validación de campo y reconciliación técnica
**Naturaleza:** Definición documental canónica  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  

---

#### 1. Propósito

Construir el inventario canónico de la estructura real de Vento Group, distinguiendo de manera explícita:

- entidades y titulares jurídicos;
- marcas y líneas comerciales;
- sedes físicas;
- puntos operativos externos;
- áreas operativas;
- zonas físicas;
- estaciones y puntos de servicio;
- canales comerciales y corporativos;
- capacidades actuales;
- capacidades futuras deseadas.

Este inventario deberá servir como base para el diseño posterior de:

- responsabilidades operativas;
- asignaciones de personal;
- contextos activos de sede y área;
- procesos de producción, compras, inventario y distribución;
- vistas y navegación de Vento OS;
- mapas de mesas y POS;
- recetas y guías operativas;
- planificación de producción;
- trazabilidad, lotes y etiquetado;
- centros de costo y relaciones entre empresas y marcas.

---

#### 2. Alcance

OPS-AUD-001 define qué organizaciones, sedes, áreas, zonas, puntos y canales existen actualmente y cuáles se proyectan como capacidades futuras.

No define todavía:

- matrices detalladas de responsables;
- manuales de funciones;
- turnos y reemplazos;
- procesos completos paso a paso;
- permisos de software;
- estructura definitiva de base de datos;
- pantallas;
- código;
- migraciones;
- implementación en Supabase.

La asignación detallada de personas, cargos y responsabilidades continuará en `OPS-AUD-002`.

---

#### 3. Reglas canónicas de clasificación

##### 3.1 Entidad jurídica

Persona jurídica o natural responsable legal, tributaria o comercialmente de una operación.

##### 3.2 Marca

Identidad comercial con la que una operación se presenta ante clientes, trabajadores o terceros.

Una marca no equivale necesariamente a una entidad jurídica independiente.

##### 3.3 Sede

Ubicación física formal y estable donde se desarrolla una parte sustancial de la operación.

##### 3.4 Punto operativo externo

Ubicación privada, prestada o informal que participa de manera recurrente en la operación, pero que no constituye una sede formal de Vento Group.

##### 3.5 Área operativa

Unidad funcional con producción, inventario, responsabilidades o procesos diferenciables.

Un área puede existir aunque:

- comparta el mismo salón con otras áreas;
- no tenga paredes propias;
- el personal rote entre áreas;
- no tenga una persona fija todos los días.

##### 3.6 Zona física

Subdivisión espacial que facilita ubicación, organización o visualización, pero que no constituye por sí misma un área operativa.

##### 3.7 Estación o punto operativo

Punto específico dentro de un área desde el cual se realiza una función concreta, como:

- caja;
- mostrador;
- impresión;
- recepción;
- despacho;
- preparación;
- almacenamiento.

##### 3.8 Personal flexible

La pertenencia habitual de un trabajador a un área no impide su asignación temporal a otra.

El contexto operativo efectivo deberá depender de la labor realizada durante el turno, no exclusivamente del cargo o área habitual.

##### 3.9 Capacidades futuras

Toda capacidad futura deberá quedar marcada expresamente como:

- no implementada;
- ubicación por definir;
- condicionada a tareas previas;
- sin presentarse como parte de la operación actual.

##### 3.10 Estado de evidencia y validación

Cada afirmación de este inventario deberá distinguir entre:

- confirmación documental;
- confirmación operativa aportada por un responsable;
- clasificación inicial pendiente de observación;
- capacidad futura deseada.

Las clasificaciones de áreas, zonas, estaciones y unidades operativas constituyen una línea base inicial. Deberán validarse mediante `OPS-AUD-003` y `OPS-AUD-015` antes de convertirse en estructura técnica definitiva.

La coincidencia de una instalación física no determina por sí sola si el modelo objetivo utilizará una o varias unidades operativas lógicas. Esa reconciliación corresponde a `CAP-MAP-003`, `CODE-AUD-006`, `CAP-SCOPE-001` y `GAP-CTRL-006`.

---

#### 4. Estructura empresarial, jurídica y comercial

##### 4.1 Vento Group S.A.S.

Vento Group S.A.S. es la entidad jurídica central del grupo.

Actualmente concentra o soporta directamente:

- Vento Café;
- Vento Producción;
- catering;
- administración corporativa;
- dirección compartida del ecosistema de marcas.

En sus registros aparecen los establecimientos:

- Vento Café;
- Vento Producción.

###### Función operativa de Vento Group

```text
VENTO GROUP
├── dirección corporativa
├── administración compartida
├── gestión de propietarios
├── gerencia general
├── contabilidad
├── marketing
├── soporte administrativo
├── coordinación comercial
└── presentación pública del ecosistema de marcas
```

---

##### 4.2 Vento Café

Vento Café es:

- una marca del grupo;
- un establecimiento registrado de Vento Group S.A.S.;
- el satélite con mayor reconocimiento comercial;
- el principal referente público para varios servicios del grupo.

Cuenta con un único local físico activo.

---

##### 4.3 Vento Producción

Vento Producción es el establecimiento formal asociado al Centro de Producción.

Operativamente, el mismo inmueble cumple actualmente funciones de:

- producción central;
- almacenamiento;
- recepción de proveedores;
- alistamiento;
- distribución interna;
- apoyo administrativo local.

El denominado Centro de Distribución no funciona como una sede física separada.

```text
CENTRO DE PRODUCCIÓN Y DISTRIBUCIÓN
→ una sola ubicación física
→ varias funciones operativas integradas
```

---

##### 4.4 Saudo

Saudo es:

- una marca presentada públicamente como parte de Vento Group;
- un establecimiento de comercio registrado a nombre de Jefersson García Urrego;
- una operación administrada dentro de la misma dirección general del grupo;
- un único local físico activo.

Saudo factura actualmente con el RUT personal de Jefersson García.

---

##### 4.5 Molka

Molka es:

- una marca presentada públicamente como parte de Vento Group;
- un establecimiento registrado a nombre de Nathalia Carolina Ibarra Ariza;
- una operación administrada dentro de la misma dirección general del grupo;
- un único local físico activo.

---

##### 4.6 Vaila Vainilla

Vaila Vainilla constituye un caso operativo especial.

```text
VAILA VAINILLA
├── se vincula públicamente al ecosistema Vento Group
├── es gestionada principalmente por Jeo García
├── Jeo recibe sus ganancias
├── Jeo asume sus gastos
├── factura con el RUT personal de Jefersson García
├── no tiene entidad o establecimiento independiente identificado
└── recibe apoyo ocasional de trabajadores de Vento Group
    ├── ventas
    └── despacho
```

Su operación económica no se administra de la misma forma que las operaciones centrales de Vento Group.

---

##### 4.7 Catering

Catering es una línea comercial de Vento Group S.A.S.

Características actuales:

- se presenta como servicio de Vento Group;
- comercialmente está más asociado a Vento Café;
- no se ha desarrollado desde Saudo o Molka;
- es gestionado por gerentes o por la persona encargada de ventas;
- se factura a nombre de Vento Group S.A.S.;
- se produce y despacha principalmente desde el Centro de Producción;
- no cuenta con sede comercial independiente.

---

##### 4.8 Relación administrativa común

Aunque Vento Café, Saudo y Molka tienen estructuras jurídicas o titulares distintos, operativamente comparten:

- propietarios;
- gerente general;
- dirección administrativa;
- coordinación comercial;
- apoyo contable;
- marketing;
- procesos internos;
- presentación pública como parte de Vento Group.

```text
TITULARIDAD JURÍDICA DISTINTA
≠
DIRECCIÓN ADMINISTRATIVA SEPARADA
```

---

#### 5. Inventario de sedes y puntos físicos

##### 5.1 Complejo físico de Vento Café y oficinas de Vento Group

Vento Café y las oficinas administrativas se encuentran dentro del mismo inmueble general, propiedad de un tercero ajeno al grupo.

El inmueble está dividido en varios locales y oficinas independientes.

```text
PRIMER PISO
└── Vento Café
    └── Local 1

SEGUNDO PISO
└── Oficinas de Vento Group
    └── “oficinas de arriba”
    └── identificación provisional: Oficina 1
```

Comparten la misma dirección general, pero constituyen dos puntos operativos diferenciados.

###### Hallazgo registral

La dirección principal del RUT de Vento Group continúa asociada al Centro de Producción porque anteriormente las oficinas funcionaban allí.

La ubicación registral está desactualizada frente a la operación administrativa actual.

---

##### 5.2 Sede administrativa de Vento Group

Las oficinas administrativas tienen dos salas.

###### Sala administrativa compartida

```text
SALA ADMINISTRATIVA
├── contabilidad
├── gerente general
├── marketing
├── archivo
├── almacenamiento de insumos administrativos
└── atención interna a trabajadores
    └── pagos de propinas y otros trámites
```

###### Sala de propietarios

```text
SALA DE PROPIETARIOS
├── puestos de propietarios
├── reuniones privadas
├── reuniones administrativas reservadas
├── almacenamiento limitado de vainilla
└── despacho parcial de Vaila Vainilla
```

---

##### 5.3 Vento Café

Un único local físico activo.

Espacios principales:

- terraza;
- salón climatizado;
- caja y mostrador;
- cocina;
- barra.

---

##### 5.4 Saudo

Un único local físico activo.

Espacios principales:

- terraza;
- salón interior;
- punto integrado de caja, mostrador y barra;
- cocina integrada.

---

##### 5.5 Molka

Un único local físico activo.

Espacios principales:

- terraza;
- salón interior;
- punto integrado de caja, mostrador y barra.

Molka no cuenta con cocina productiva propia y recibe la mayoría de sus productos ya elaborados.

---

##### 5.6 Centro de Producción y Distribución

Sede de dos pisos que integra producción, almacenamiento, preparación y distribución.

###### Primer piso

- salón general de producción;
- Panadería y Bollería;
- Repostería;
- Pastelería y Tortas;
- Galletería;
- Producción de Barra;
- cámara fría;
- cuarto de congelación;
- punto informal de alistamiento junto a la salida;
- puesto administrativo operativo.

###### Segundo piso

- Cocina Caliente;
- Bodega y Abastecimiento;
- refrigerador de preparaciones de Cocina Caliente;
- punto informal de alistamiento junto a las escaleras;
- zona general de lavado;
- baño de trabajadores;
- casilleros;
- zona de descanso y alimentación;
- terraza con materiales y activos fuera de uso habitual.

###### Condiciones actuales

No existe:

- zona formal de recepción;
- zona formal de despacho;
- centro de pesaje;
- área central de etiquetado;
- ubicación definitiva para la impresora de etiquetas.

---

##### 5.7 Apartamento de Jeo García

Punto privado externo asociado a Vaila Vainilla.

Funciones:

- preparación;
- empaque;
- gestión directa de Vaila.

No se clasifica como sede formal de Vento Group.

---

##### 5.8 Apartamento de la gerente general

Punto privado externo de resguardo vehicular.

Funciones:

- almacenamiento nocturno de la camioneta de Vento Group;
- punto donde el conductor recoge el vehículo;
- punto desde el cual inicia su turno.

No se clasifica como sede formal.

---

##### 5.9 Apartamento del encargado de decoraciones

Punto privado externo utilizado como:

- taller de decoraciones;
- espacio de preparación y reparación;
- almacenamiento parcial del inventario de decoraciones de Vento.

No se clasifica como sede formal.

---

#### 6. Áreas operativas por sede

##### 6.1 Vento Café

```text
VENTO CAFÉ
├── Servicio / Salón
│   ├── Zona: terraza
│   ├── Zona: salón climatizado
│   ├── Punto: caja / mostrador
│   ├── Puesto: mesero
│   └── Puesto: cajero
├── Cocina
└── Barra
```

###### Reglas

- Terraza y salón climatizado pertenecen a una misma área operativa.
- El personal de servicio rota entre ambas zonas.
- Caja y mostrador constituyen un solo punto operativo.
- Caja y mostrador no son un área independiente.
- Las solicitudes de remisión de servicio, caja y mostrador se gestionan conjuntamente.
- El cajero puede realizar funciones de servicio.
- La manipulación de caja debe mantenerse restringida al puesto autorizado.

---

##### 6.2 Saudo

```text
SAUDO
└── Área Operativa Integral
    ├── servicio
    ├── salón
    ├── terraza
    ├── caja
    ├── mostrador
    ├── barra
    └── cocina
```

Cocina, barra, caja y servicio se manejan operativamente como una sola área integral debido al tamaño y a la dinámica real del local.

Las funciones internas podrán diferenciarse mediante:

- rol;
- estación;
- receta;
- tipo de tarea;
- contexto operativo.

No es necesario crear áreas administrativas separadas para cada función.

---

##### 6.3 Molka

```text
MOLKA
└── Área Operativa Integral
    ├── servicio
    ├── salón
    ├── terraza
    ├── caja
    ├── mostrador
    └── barra
```

Molka no tiene Cocina como área productiva.

---

##### 6.4 Centro de Producción — áreas productivas

El primer piso es un salón físico compartido, pero contiene áreas operativas diferenciadas.

```text
SALÓN GENERAL DE PRODUCCIÓN
├── Panadería y Bollería
├── Repostería
├── Pastelería y Tortas
├── Galletería
└── Producción de Barra
```

###### Panadería y Bollería

- dos panaderos dedicados actualmente;
- producción e insumos diferenciados;
- responsabilidades propias.

###### Repostería

- dos reposteras dedicadas actualmente;
- producción e insumos diferenciados;
- responsabilidades propias.

###### Galletería

- una galletera dedicada actualmente;
- producción e insumos diferenciados;
- responsabilidades propias.

###### Pastelería y Tortas

- línea fortalecida recientemente por la oferta de tortas de Molka;
- una persona actualmente responsable;
- área operativa diferenciada;
- puede compartir personal, mesas y equipos con Repostería.

###### Producción de Barra

```text
PRODUCCIÓN DE BARRA
├── espacio pequeño del primer piso
├── operación periódica
├── uno o dos días de producción por semana
├── sin personal fijo permanente
├── personal asignado desde los satélites
├── abastecimiento principal: Vento Café
├── abastecimiento secundario: Saudo
└── abastecimiento secundario: Molka
```

Se clasifica como área operativa de activación periódica.

---

##### 6.5 Cocina Caliente

Área operativa independiente del segundo piso.

Características:

- una persona encargada permanentemente;
- insumos propios;
- inventario propio;
- producción diferenciada;
- apoyo rotativo de cocineros de los satélites;
- uso de refrigerador para preparaciones pendientes de despacho.

---

##### 6.6 Bodega y Abastecimiento

Área operativa independiente, aunque actualmente el cargo de bodeguero esté vacante.

```text
BODEGA Y ABASTECIMIENTO
├── recepción de proveedores
├── almacenamiento
├── organización de inventario
├── recepción de producción interna
├── preparación de compras
├── conteos
├── alistamiento de remisiones
├── entrega de pedidos al conductor
└── apoyo en carga del vehículo
```

###### Estado actual

- el bodeguero anterior fue retirado;
- Carlos cubre temporalmente parte de las funciones;
- los procesos no están estandarizados;
- varias responsabilidades están mezcladas;
- no existe zona formal de recepción;
- no existe zona formal de despacho.

---

##### 6.7 Servicios Generales

Función transversal para todo el Centro de Producción.

Responsabilidades actuales:

- aseo general;
- organización;
- lavado de canastas;
- lavado de trapos;
- mantenimiento de zonas comunes.

No sustituye la obligación de cada área de mantener limpios:

- su estación;
- sus utensilios;
- sus equipos;
- sus superficies.

No se clasifica como área productiva.

---

#### 7. Zonas e infraestructura compartida del Centro de Producción

##### 7.1 Cámara fría

Zona física compartida.

Cada área debe contar con una subdivisión interna asignada.

La separación existe como criterio operativo, aunque se presentan episodios de desorden.

---

##### 7.2 Cuarto de congelación

Zona física compartida.

Cada área debe contar con una subdivisión interna asignada.

No constituye un área operativa independiente.

---

##### 7.3 Zona general de lavado

Sirve a todo el Centro de Producción.

Uso principal:

- Servicios Generales;
- lavado de canastas;
- lavado de trapos;
- limpieza de elementos comunes.

Cada área conserva la responsabilidad de limpiar sus propios utensilios y estación.

---

##### 7.4 Zona de bienestar

```text
ZONA DE BIENESTAR
├── baño
├── casilleros
└── mesa de descanso y alimentación
```

Se clasifica como zona de apoyo al personal.

---

##### 7.5 Terraza del segundo piso

No funciona como bodega de inventario habitual.

Almacena principalmente:

- sobrantes de construcción;
- mobiliario viejo;
- patas de sillas;
- lavabos pendientes de instalación;
- piezas y activos sin uso inmediato.

Se clasifica como zona auxiliar de materiales y activos fuera de operación.

---

##### 7.6 Punto administrativo operativo

Existe un escritorio dentro del Centro de Producción utilizado actualmente por Carlos.

```text
PUNTO ADMINISTRATIVO OPERATIVO
├── función permanente
├── ubicación física modificable
├── coordinación local
├── gestión operativa
└── apoyo administrativo
```

No constituye la sede administrativa principal de Vento Group.

---

#### 8. Recepción, alistamiento y despacho físico

##### 8.1 Recepción de proveedores

No existe una zona formal de recepción.

###### Estado actual

- los productos destinados al segundo piso son subidos y dejados temporalmente en el suelo;
- Carlos los recibe, desempaqueta y organiza;
- los productos del primer piso pueden ser recibidos directamente por los trabajadores de cada área;
- los horarios de proveedores son variables;
- las entregas pueden llegar aproximadamente entre las 7:00 a. m. y las 5:00 p. m.;
- una sola persona no puede cubrir consistentemente recepción, subida, distribución y organización.

---

##### 8.2 Alistamiento de remisiones

Existen dos puntos informales:

```text
PRIMER PISO
→ alistamiento de productos de las áreas productivas

SEGUNDO PISO
→ alistamiento de productos de bodega y Cocina Caliente
```

No existe una zona central formal de despacho.

---

##### 8.3 Canastas de transporte

- se separan por satélite;
- el conductor conoce su destino por memoria y por el orden de organización;
- no cuentan actualmente con identificación visible formal;
- son reutilizables;
- pueden regresar el mismo día o al día siguiente.

El detalle del control de canastas no se resuelve dentro de OPS-AUD-001.

---

#### 9. Canales comerciales y corporativos

##### 9.1 Vento Café

Canales actuales:

- atención en mesa;
- venta en mostrador;
- ManyChat;
- Rappi;
- Instagram;
- página web informativa.

La página web:

- contiene menú digital;
- no procesa pedidos;
- redirige a ManyChat o Instagram.

Los pedidos de Rappi y domicilios se entregan desde el mismo punto de caja y mostrador.

---

##### 9.2 Saudo

Canales actuales:

- atención en mesa;
- venta en mostrador;
- ManyChat;
- Rappi;
- Instagram;
- página web informativa.

La página web:

- contiene menú digital;
- no procesa pedidos;
- redirige a ManyChat o Instagram.

Los pedidos externos se entregan desde el mismo punto integrado de caja y mostrador.

---

##### 9.3 Molka

Canales actuales:

- atención en mesa;
- venta en mostrador;
- ManyChat;
- Rappi;
- Instagram.

Molka:

- no tiene página web propia identificada;
- tiene menú digital disponible en Instagram y ManyChat;
- entrega pedidos externos desde el mismo punto de caja y mostrador.

---

##### 9.4 Vaila Vainilla

Canales actuales:

- página web;
- WhatsApp;
- negocios directos con empresas.

---

##### 9.5 Vento Group

###### Instagram corporativo

Funciones:

- vitrina institucional;
- presentación del grupo;
- vinculación de cuentas de las marcas;
- campañas;
- vacantes;
- fechas especiales;
- publicaciones conjuntas;
- recepción secundaria de mensajes.

Responsables actuales de respuesta:

- propietaria;
- gerente general.

###### Página web corporativa

- en desarrollo;
- aún no operativa;
- desarrollada actualmente por Carlos;
- requiere definición específica de propósito y contenido.

###### WhatsApp corporativo

No existe actualmente un canal propio de WhatsApp para Vento Group.

###### Correo

El grupo utiliza principalmente correos bajo:

```text
@ventocafe.com
```

El dominio:

```text
@ventogroup.co
```

está vinculado al Workspace, pero no es el dominio de uso habitual.

Se utilizan alias funcionales como:

- gerencia@;
- contaduria@;
- soporte@;
- otros equivalentes.

No se inventariarán individualmente todos los alias dentro de OPS-AUD-001.

---

##### 9.6 Catering

Canal de servicio externo de Vento Group.

Los pedidos son gestionados principalmente por:

- gerentes;
- persona encargada de ventas;
- relaciones comerciales directas.

No cuenta todavía con un canal digital propio claramente separado.

---

##### 9.7 Centro de Producción — ventas externas

Actualmente:

- no vende directamente productos a clientes externos;
- abastece principalmente a Vento Café, Saudo y Molka;
- atiende producción asociada al catering.

Existe la intención de desarrollar un catálogo B2B, pero no está implementado.

---

#### 10. Capacidades futuras deseadas

##### 10.1 Centro de Pesaje, Premezclas y Porcionamiento

```text
ESTADO
→ capacidad futura deseada
→ no implementada
→ ubicación por definir
→ condicionada a planificación y recetas estandarizadas
```

Objetivo futuro:

- pesar ingredientes;
- preparar mezclas secas;
- porcionar insumos;
- formar kits por receta y lote;
- reducir errores;
- controlar consumo;
- mejorar trazabilidad;
- limitar exposición innecesaria de fórmulas sensibles.

###### Restricción actual

La mayoría de la producción se define con las remisiones nocturnas.

```text
14:00 → termina producción
17:00 → centro sin personal
Noche → llegan remisiones
06:00 → inicia producción
```

Por ello, el centro de pesaje no puede depender exclusivamente de preparar kits durante la tarde anterior.

Su implementación exige primero:

- auditoría de demanda;
- planificación base;
- análisis de datos;
- clasificación de productos previsibles;
- definición de reservas;
- manejo de excepciones;
- recetas versionadas.

---

##### 10.2 Punto central de impresión de etiquetas

Existe una impresora de etiquetas adquirida, pero actualmente:

- está guardada en el puesto administrativo;
- no está instalada;
- no está configurada;
- no tiene ubicación operativa definitiva;
- no existe formato canónico de etiqueta.

Se proyecta como punto técnico compartido, no como área operativa independiente.

---

##### 10.3 Catálogo B2B

Capacidad futura para vender productos del Centro de Producción a otras empresas.

Estado:

- deseado;
- no desarrollado;
- sin catálogo;
- sin canal comercial formal;
- sin definición de precios, presentación, producción o despacho.

---

##### 10.4 Centro de costo de Producción y Distribución

Se desea que el Centro de Producción y Distribución evolucione hacia una unidad con:

- costos identificables;
- producción valorizada;
- transferencias internas;
- control de abastecimiento a satélites;
- posible venta externa.

Actualmente las transferencias internas no funcionan como ventas o cargos formalmente estructurados.

---

#### 11. Brechas y tareas materializadas

Las brechas detectadas en esta tarea ya no se consideran destinos narrativos.
Sus definiciones canónicas se encuentran en los fragmentos propietarios y con
marcador formal.

| Necesidad detectada              | Tarea canónica | Bloque propietario           |
| -------------------------------- | -------------- | ---------------------------- |
| Sede administrativa y registros  | `OPS-ADM-001`  | E1                           |
| Gobernanza de marcas y titulares | `OPS-GOV-001`  | E1                           |
| Activos y custodias externas     | `OPS-ACT-001`  | E1                           |
| Programa de auditoría de demanda | `OPS-PLAN-001` | E1                           |
| Fuentes internas                 | `OPS-PLAN-002` | E1                           |
| Demanda y canales                | `OPS-PLAN-003` | E1                           |
| Registro prospectivo             | `OPS-PLAN-004` | E1                           |
| Canales corporativos             | `OPS-CAN-001`  | E2                           |
| Bodega y Abastecimiento TO-BE    | `OPS-LOG-001`  | E2                           |
| Venta B2B                        | `OPS-B2B-001`  | E2                           |
| Recetas y acceso contextual      | `OPS-REC-001`  | FOGO                         |
| Centro de Pesaje                 | `OPS-PRD-001`  | FOGO                         |
| Lotes, etiquetas y trazabilidad  | `OPS-TRZ-001`  | FOGO, con salida a NEXO y E4 |
| Zonas y mapas POS                | `OPS-POS-001`  | PULSO                        |
| Centro de costo y transferencias | `OPS-CST-001`  | NUMERA                       |

Las referencias narrativas `OPS-PLAN-001-A`, `OPS-PLAN-001-B` y
`OPS-PLAN-001-C` quedan sustituidas respectivamente por
`OPS-PLAN-002`, `OPS-PLAN-003` y `OPS-PLAN-004`, porque el contrato
del compilador exige que todo identificador canónico termine en tres dígitos.


#### 12. Decisiones canónicas resultantes

Estas decisiones constituyen la línea base operativa inicial aprobada para continuar el descubrimiento. No equivalen todavía a estructura técnica definitiva. Su validez de campo deberá confirmarse en `OPS-AUD-003` y `OPS-AUD-015`; cualquier diferencia generará o actualizará una tarea concreta mediante `GAP-CTRL-001` y `GAP-CTRL-006`.

1. Vento Group constituye el paraguas administrativo y público del ecosistema.

2. La titularidad jurídica y la pertenencia operativa al grupo no son equivalentes.

3. Vento Café y las oficinas de Vento Group comparten el mismo inmueble general, pero son puntos operativos distintos.

4. El Centro de Producción y el Centro de Distribución funcionan actualmente dentro de una sola instalación física integrada. Esta decisión no define todavía si el modelo objetivo conservará una o dos unidades operativas lógicas; esa resolución deberá considerar procesos, inventario, permisos, costos, turnos, rutas y reportes.

5. Vento Café tiene tres áreas operativas:
   - Servicio / Salón;
   - Cocina;
   - Barra.

6. Caja y mostrador de Vento Café constituyen un solo punto dentro de Servicio / Salón.

7. Saudo funciona como una única área operativa integral.

8. Molka funciona como una única área operativa integral.

9. Panadería, Repostería, Pastelería, Galletería y Producción de Barra son áreas operativas distintas aunque compartan espacio y personal.

10. El personal puede apoyar temporalmente otras áreas sin perder su vínculo habitual.

11. Cocina Caliente es un área independiente.

12. Bodega y Abastecimiento es un área independiente aunque el cargo de bodeguero esté vacante.

13. Servicios Generales es una función transversal, no un área productiva.

14. Cámara fría y cuarto de congelación son zonas compartidas con subdivisiones internas por área.

15. Los apartamentos asociados a Vaila, vehículo y decoraciones son puntos operativos externos, no sedes formales.

16. Las páginas web de Vento Café y Saudo son informativas y no procesan pedidos.

17. Molka no tiene página web propia identificada.

18. Vento Group tiene Instagram corporativo y una página web en desarrollo, pero no WhatsApp corporativo.

19. El Centro de Producción no vende actualmente productos directamente a terceros, salvo su participación en catering.

20. El catálogo B2B y el Centro de Pesaje son capacidades futuras, no actuales.

---

#### 13. Criterios de aceptación

OPS-AUD-001 se considera aprobada como inventario inicial cuando:

- las entidades, marcas, titulares, sedes y puntos conocidos están suficientemente identificados para continuar el levantamiento;
- cada elemento declara o permite determinar su tipo de evidencia;
- las clasificaciones pendientes de observación están vinculadas a `OPS-AUD-003` y `OPS-AUD-015`;
- sede física, unidad operativa lógica, área, zona y estación no se tratan como equivalentes;
- los canales actuales y las capacidades futuras están diferenciados;
- los elementos no inventariados individualmente, como alias, activos, impresoras, escáneres, terminales, LOC y estaciones, tienen una tarea propietaria explícita;
- las quince tareas derivadas están materializadas con identificador válido, bloque propietario, dependencias y momento de ejecución;
- no se han definido todavía responsabilidades detalladas propias de `OPS-AUD-002`;
- no se ha autorizado implementación técnica, migraciones ni cambios en Supabase.


#### 14. Resultado y continuidad

Con la aprobación de OPS-AUD-001 quedará establecido el mapa canónico inicial de:

- empresas;
- marcas;
- sedes;
- áreas;
- zonas;
- puntos operativos;
- canales;
- capacidades futuras.

La continuidad documental deberá realizarse exclusivamente conforme al orden del roadmap, manteniendo `OPS-AUD-002` como la siguiente tarea reservada y sin iniciar implementación técnica.

---

#### Soportes documentales consultados

- RUT de Vento Group S.A.S.
- RUT de Nathalia Carolina Ibarra Ariza / Molka.
- Cámara de Comercio de Saudo.


### ✅ OPS-AUD-002 — Identificar familias de actores y responsables reales por proceso

**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Estado:** APROBADO  
**Naturaleza:** Levantamiento documental AS-IS  
**Tarea anterior:** `OPS-AUD-001` — APROBADA  
**Siguiente tarea reservada:** `OPS-AUD-003`  
**Implementación técnica:** No autorizada  
**Migraciones o cambios en Supabase:** No autorizados  

---

#### 1. Propósito

Identificar las familias de actores que participan actualmente en la operación real de Vento Group y establecer, para cada familia de procesos conocida:

- quién gobierna el proceso;
- quién responde actualmente por su resultado;
- quién lo inicia;
- quién lo ejecuta;
- quién lo supervisa;
- quién lo aprueba cuando existe aprobación;
- quién conserva bienes, documentos o información;
- quién recibe el resultado;
- qué terceros o plataformas participan;
- dónde existen vacíos, coberturas temporales, responsabilidades compartidas o responsabilidades implícitas.

El resultado deberá permitir continuar el descubrimiento sin confundir:

```text
PERSONA
≠
CARGO CONTRACTUAL
≠
FAMILIA DE ACTOR
≠
ROL BASE
≠
ROL OPERATIVO
≠
RESPONSABILIDAD DE PROCESO
≠
PERMISO DE SOFTWARE
```

---

#### 2. Alcance

Esta tarea documenta el estado actual de responsabilidad operativa.

Incluye:

- familias humanas internas;
- responsables específicos conocidos;
- trabajadores operativos;
- responsables administrativos;
- trabajadores que cubren temporalmente funciones vacantes;
- personal rotativo entre áreas;
- terceros, proveedores y clientes;
- plataformas o sistemas que participan en un proceso;
- capacidades futuras que todavía no tienen responsable operativo real.

No define todavía:

- organigrama definitivo;
- catálogo contractual de cargos;
- matriz final RACI;
- segregación definitiva de funciones;
- permisos;
- roles de autorización;
- proceso detallado paso a paso;
- reemplazos formales;
- dotación necesaria;
- diseño TO-BE;
- pantallas;
- tablas;
- migraciones;
- implementación.

El flujo detallado continuará en `OPS-AUD-007`.

Las excepciones, correcciones, anulaciones, devoluciones y reversiones se documentarán en `OPS-AUD-008`.

Las aprobaciones y la segregación de funciones se resolverán en `OPS-AUD-009`.

La validación con trabajadores, supervisores y responsables reales se realizará en `OPS-AUD-015`.

---

#### 3. Principios obligatorios

##### 3.1 La familia de actor es una categoría operativa

Una familia de actor agrupa personas que participan de manera equivalente en uno o más procesos.

Ejemplo:

```text
FAMILIA
Operación productiva de Panadería

PERSONAS
Uno o varios trabajadores concretos

ROL OPERATIVO ACTUAL O FUTURO
produccion_panaderia
```

La familia no es por sí misma:

- una persona;
- un cargo contractual;
- un rol de autorización;
- un permiso;
- un área;
- una sede.

##### 3.2 La responsabilidad pertenece al proceso

Una persona puede participar en varias familias de procesos.

Ejemplo:

```text
Jefe de Operaciones
├── coordinación del Centro de Producción
├── cobertura temporal de Bodega
├── recepción de proveedores
├── soporte administrativo local
└── desarrollo de herramientas y canales internos
```

Cada participación deberá registrarse por separado.

##### 3.3 Una vacante no elimina la responsabilidad

Cuando un cargo o función se encuentra vacante:

```text
RESPONSABILIDAD DEL PROCESO
→ continúa existiendo

TITULAR HABITUAL
→ vacante

EJECUTOR ACTUAL
→ temporal, parcial o distribuido
```

##### 3.4 El apoyo no transfiere automáticamente la propiedad

Un trabajador que ayuda temporalmente a otra área:

- no se convierte automáticamente en responsable permanente;
- no adquiere autoridad completa sobre el proceso;
- no reemplaza al propietario funcional;
- deberá actuar bajo el contexto operativo correspondiente;
- deberá poder ser distinguido del responsable habitual.

##### 3.5 Una plataforma no es responsable empresarial

Makos, Rappi, ManyChat, correo, WhatsApp, Excel o cualquier aplicación pueden:

- recibir información;
- registrar información;
- transmitir solicitudes;
- producir documentos;
- disparar eventos.

No pueden asumir responsabilidad empresarial.

Siempre deberá existir:

- un actor humano responsable; o
- un proceso de sistema expresamente identificado y gobernado.

##### 3.6 El responsable real no se deduce del rol de software

No se considerará probado que una persona sea responsable de un proceso porque tenga:

- un rol base;
- un rol operativo;
- un permiso;
- acceso a una pantalla;
- una cuenta en una plataforma;
- un dispositivo asignado.

La responsabilidad deberá derivarse de la operación real y validarse posteriormente.

##### 3.7 El responsable habitual y el ejecutor efectivo pueden ser distintos

```text
RESPONSABLE HABITUAL
≠
EJECUTOR DEL TURNO
```

La documentación deberá conservar ambos cuando aplique.

##### 3.8 La propiedad puede ser provisional durante E1

Las asignaciones de esta tarea constituyen una línea base AS-IS inicial.

Deberán verificarse mediante:

- `OPS-AUD-003` — observación directa;
- `OPS-AUD-007` — levantamiento de flujo ordinario;
- `OPS-AUD-009` — aprobaciones y segregación;
- `OPS-AUD-015` — validación con responsables.

---

#### 4. Tipos de participación en un proceso

| Código | Participación            | Definición                                            |
| ------ | ------------------------ | ----------------------------------------------------- |
| `GOB`  | Gobierno                 | Define dirección, política o decisión institucional   |
| `DPR`  | Dueño actual del proceso | Responde por el resultado general del proceso         |
| `INI`  | Iniciador                | Origina la solicitud, necesidad o evento              |
| `EJE`  | Ejecutor                 | Realiza materialmente la actividad                    |
| `SUP`  | Supervisor               | Revisa ejecución, estado o cumplimiento               |
| `APR`  | Aprobador                | Autoriza una decisión, gasto, excepción o corrección  |
| `CUS`  | Custodio                 | Conserva bienes, documentos, inventario o recursos    |
| `REC`  | Receptor                 | Recibe el resultado o continúa el proceso             |
| `SOP`  | Apoyo                    | Ayuda sin asumir propiedad completa                   |
| `EXT`  | Externo                  | Tercero, cliente, proveedor o plataforma participante |
| `SYS`  | Sistema                  | Servicio o aplicación que ejecuta una función técnica |

Una misma familia puede asumir varias participaciones dentro de un proceso.

---

#### 5. Estados de responsabilidad

| Estado             | Significado                                                                     |
| ------------------ | ------------------------------------------------------------------------------- |
| `CONFIRMADA`       | Responsabilidad conocida con suficiente claridad documental u operativa         |
| `PROVISIONAL`      | Identificación inicial pendiente de observación directa                         |
| `TEMPORAL`         | Una persona cubre actualmente una función que no le pertenece de manera estable |
| `ROTATIVA`         | La ejecución cambia entre personas, turnos o áreas                              |
| `COMPARTIDA`       | Varias familias participan sin un único ejecutor                                |
| `VACANTE`          | Existe la responsabilidad, pero no tiene titular habitual                       |
| `IMPLÍCITA`        | La responsabilidad se ejerce, pero no está formalmente declarada                |
| `POR_IDENTIFICAR`  | No existe evidencia suficiente para determinar el responsable                   |
| `FUTURA_SIN_ACTOR` | La capacidad no opera actualmente y no tiene responsable vigente                |

---

#### 6. Familias canónicas iniciales de actores AS-IS

##### F01 — Gobierno y propiedad

Comprende a propietarios y autoridades de gobierno empresarial.

Participaciones habituales:

- gobierno institucional;
- decisiones estratégicas;
- aprobación de cambios estructurales;
- supervisión general;
- control final sobre excepciones reservadas.

No equivale automáticamente al rol base técnico `propietario`.

---

##### F02 — Dirección ejecutiva general

Comprende a la gerencia general.

Participaciones habituales:

- dirección administrativa;
- coordinación multisede;
- supervisión de responsables;
- seguimiento de operación;
- resolución de asuntos administrativos;
- comunicación institucional.

---

##### F03 — Gerencia o supervisión de sede

Comprende responsables administrativos u operativos de una sede o unidad.

Participaciones habituales:

- supervisión diaria;
- asignación y coordinación local;
- atención de excepciones;
- seguimiento de caja, servicio y producción;
- escalamiento a gerencia general.

La existencia y cobertura exacta de esta familia por sede deberá verificarse en `OPS-AUD-003` y `OPS-AUD-015`.

---

##### F04 — Coordinación de operaciones

Comprende la función de Jefatura de Operaciones y coordinación transversal del Centro de Producción, logística, inventario y soporte operativo.

Responsable identificado actualmente:

- Carlos Alejandro Ibarra Ariza — Jefe de Operaciones.

Participaciones actuales conocidas:

- coordinación operativa;
- soporte local del Centro de Producción;
- recepción y organización parcial de mercancía;
- cobertura temporal de responsabilidades de Bodega;
- coordinación de herramientas y sistemas operativos;
- desarrollo actual de la página corporativa.

Las responsabilidades deberán separarse por proceso y no tratarse como una asignación general ilimitada.

---

##### F05 — Administración y contabilidad

Comprende:

- contabilidad;
- auxiliares administrativas;
- archivo;
- trámites internos;
- pagos;
- información financiera;
- apoyo documental;
- gestión administrativa de trabajadores.

La distribución exacta entre contabilidad, auxiliares y gerencia deberá validarse en `OPS-AUD-003` y `OPS-AUD-015`.

---

##### F06 — Marketing, comercial y gestión de canales

Comprende:

- marketing;
- gestión de redes;
- atención comercial;
- gestión de pedidos;
- promoción;
- campañas;
- coordinación de catering;
- comunicación con clientes y empresas.

No deberá confundirse:

```text
RESPONDER UN MENSAJE
≠
SER DUEÑO DEL PROCESO COMERCIAL COMPLETO
```

---

##### F07 — Caja, mostrador y venta directa

Comprende trabajadores que:

- registran ventas;
- reciben pagos;
- operan caja;
- atienden mostrador;
- entregan pedidos;
- coordinan pedidos externos en el punto de venta.

Puede corresponder a funciones distintas aunque físicamente compartan una estación.

---

##### F08 — Servicio de salón

Comprende:

- meseros;
- atención de mesas;
- atención de terraza;
- entrega en salón;
- acompañamiento al cliente;
- apoyo al punto de caja cuando esté permitido.

---

##### F09 — Operación integral de satélite

Comprende trabajadores que, por la escala del establecimiento, combinan varias funciones:

- servicio;
- salón;
- caja;
- mostrador;
- barra;
- cocina o preparación simple.

Aplica como familia analítica inicial para Saudo y Molka.

No implica que una sola persona pueda ejecutar sin control todas las acciones sensibles.

---

##### F10 — Producción especializada

Subfamilias actuales:

```text
PRODUCCIÓN ESPECIALIZADA
├── Panadería y Bollería
├── Repostería
├── Pastelería y Tortas
├── Galletería
├── Cocina Caliente
├── Producción de Barra
└── Producción de cocina en satélites
```

Cada subfamilia mantiene:

- ejecución especializada;
- cuidado de insumos y equipos;
- registro de producción cuando exista;
- limpieza de su estación;
- entrega de producto terminado;
- reporte de faltantes, desperdicios y novedades.

---

##### F11 — Bodega y Abastecimiento

Comprende:

- recepción;
- almacenamiento;
- organización;
- conteos;
- preparación de compras;
- recepción de producción;
- alistamiento;
- entrega al conductor;
- apoyo en carga.

Estado actual:

```text
TITULAR HABITUAL
→ VACANTE

COBERTURA ACTUAL
→ PARCIAL Y TEMPORAL

EJECUTOR TEMPORAL IDENTIFICADO
→ Jefe de Operaciones, junto con trabajadores de las áreas
```

La responsabilidad objetivo se diseñará posteriormente en `OPS-LOG-001`.

---

##### F12 — Logística y transporte

Comprende principalmente al conductor y a quienes apoyan:

- recogida del vehículo;
- carga;
- transporte;
- entrega;
- recolección de retornables;
- retorno del vehículo;
- reporte de novedades de ruta.

---

##### F13 — Recepción en sede satélite

Comprende a los trabajadores que reciben:

- remisiones;
- productos;
- canastas;
- documentos;
- novedades de entrega.

La persona concreta puede variar por turno, sede y momento de llegada.

---

##### F14 — Servicios Generales

Comprende:

- limpieza de zonas comunes;
- lavado de canastas;
- lavado de trapos;
- organización general;
- mantenimiento básico de espacios comunes.

No sustituye la responsabilidad de cada área sobre su estación, equipos y utensilios.

---

##### F15 — Custodia de activos y puntos externos

Comprende a personas que custodian temporal o permanentemente:

- decoraciones;
- herramientas;
- materiales;
- vehículos;
- inventarios ubicados en puntos privados;
- activos fuera de las sedes formales.

La custodia no implica propiedad ni autorización para disponer del activo.

---

##### F16 — Responsable de operación asociada

Comprende personas que administran una marca, línea o negocio vinculado, pero con fronteras económicas u operativas particulares.

Caso identificado:

```text
VAILA VAINILLA
→ responsable operativo principal: Jeo García
→ apoyo ocasional: trabajadores de Vento Group
→ operación económica diferenciada
```

La frontera definitiva se documentará en `OPS-GOV-001`.

---

##### F17 — Proveedores y prestadores externos

Comprende:

- proveedores de productos;
- proveedores de servicios;
- transportadores externos;
- técnicos;
- contratistas;
- aliados comerciales.

Son participantes externos y no propietarios de procesos internos de Vento.

---

##### F18 — Clientes y empresas compradoras

Comprende:

- clientes en mesa;
- clientes de mostrador;
- clientes de domicilios;
- empresas de catering;
- futuros clientes B2B.

---

##### F19 — Plataformas y sistemas

Comprende:

- Makos;
- Rappi;
- ManyChat;
- páginas web;
- correo;
- WhatsApp;
- hojas de cálculo;
- Vento OS;
- servicios automáticos futuros.

Su participación deberá registrarse como `SYS` o `EXT`, nunca como dueño del proceso.

---

##### F20 — Apoyo rotativo y sustitución temporal

Comprende a trabajadores que apoyan otra función por:

- ausencia;
- descanso;
- incapacidad;
- vacante;
- incremento de demanda;
- producción periódica;
- contingencia.

Cada apoyo deberá distinguir:

```text
FUNCIÓN HABITUAL
+
FUNCIÓN TEMPORAL
+
SEDE
+
ÁREA
+
TURNO
+
RESPONSABLE QUE AUTORIZÓ EL APOYO
```

---

##### F21 — Proceso autónomo del sistema

Comprende servicios, jobs, automatizaciones o integraciones que ejecutan una operación técnica sin actor humano inmediato.

Requisitos conceptuales:

- servicio identificado;
- operación permitida;
- propietario funcional;
- propietario técnico;
- origen de ejecución;
- evidencia y auditoría;
- tratamiento de errores;
- prohibición de asumir responsabilidad empresarial humana.

Esta familia no autoriza todavía ninguna automatización concreta.

---

#### 7. Matriz inicial de responsabilidades reales por familia de procesos

| Familia de proceso                                | Dueño o responsable actual             | Ejecutores actuales                           | Supervisión o apoyo                      | Estado             |
| ------------------------------------------------- | -------------------------------------- | --------------------------------------------- | ---------------------------------------- | ------------------ |
| Gobierno empresarial                              | F01 — Gobierno y propiedad             | F01                                           | F02                                      | `CONFIRMADA`       |
| Dirección administrativa general                  | F02 — Dirección ejecutiva              | F02, F05                                      | F01                                      | `CONFIRMADA`       |
| Coordinación operativa transversal                | F04 — Coordinación de operaciones      | F04                                           | F02, F03                                 | `CONFIRMADA`       |
| Gestión administrativa de trabajadores            | F02 y F05                              | F05                                           | F02, F03                                 | `PROVISIONAL`      |
| Contabilidad, archivo y pagos administrativos     | F05                                    | F05                                           | F02 y F01 según materia                  | `PROVISIONAL`      |
| Pago de propinas y trámites internos              | F05                                    | F05                                           | F02                                      | `PROVISIONAL`      |
| Marketing institucional y campañas                | F06                                    | F06                                           | F01, F02                                 | `CONFIRMADA`       |
| Respuesta de Instagram corporativo                | F01 y F02                              | Propiedad y gerencia general                  | F06                                      | `CONFIRMADA`       |
| Gestión comercial de catering                     | F06                                    | Gerentes o responsable de ventas              | F02; apoyo F04                           | `CONFIRMADA`       |
| Producción para catering                          | F10                                    | Áreas productivas requeridas                  | F04                                      | `PROVISIONAL`      |
| Despacho de catering                              | F11 y F12                              | Bodega, áreas y conductor                     | F04                                      | `PROVISIONAL`      |
| Operación de Vaila Vainilla                       | F16                                    | Jeo García                                    | Apoyo ocasional F06, F12 o F20           | `CONFIRMADA`       |
| Atención en mesa — Vento Café                     | F08                                    | Servicio de salón                             | F03                                      | `PROVISIONAL`      |
| Venta en caja y mostrador — Vento Café            | F07                                    | Cajero o trabajador autorizado                | F03                                      | `PROVISIONAL`      |
| Operación integral — Saudo                        | F09                                    | Equipo del turno                              | F03                                      | `PROVISIONAL`      |
| Operación integral — Molka                        | F09                                    | Equipo del turno                              | F03                                      | `PROVISIONAL`      |
| Pedidos por Rappi y ManyChat                      | F06                                    | Responsable de pedidos y punto de entrega     | F03, F07 o F09                           | `PROVISIONAL`      |
| Apertura, operación y cierre de caja              | F07 o F09                              | Cajero u operador autorizado                  | F03                                      | `POR_IDENTIFICAR`  |
| Correcciones, anulaciones y devoluciones de venta | Por determinar                         | Caja y supervisión                            | Gerencia o supervisor                    | `POR_IDENTIFICAR`  |
| Solicitud de remisión desde satélite              | F03 o responsable local                | F07, F08, F09 o F13 según sede                | F03                                      | `PROVISIONAL`      |
| Definición diaria de necesidad productiva         | Compartida entre satélite y producción | Responsables de pedidos, áreas y coordinación | F04                                      | `IMPLÍCITA`        |
| Producción de Panadería                           | F10 — Panadería                        | Panaderos del área                            | Responsable de área y F04                | `CONFIRMADA`       |
| Producción de Repostería                          | F10 — Repostería                       | Reposteras del área                           | Responsable de área y F04                | `CONFIRMADA`       |
| Producción de Pastelería y Tortas                 | F10 — Pastelería                       | Responsable y personal de apoyo               | F04                                      | `CONFIRMADA`       |
| Producción de Galletería                          | F10 — Galletería                       | Galletera del área                            | F04                                      | `CONFIRMADA`       |
| Producción de Cocina Caliente                     | F10 — Cocina Caliente                  | Responsable permanente y apoyos rotativos     | F04                                      | `CONFIRMADA`       |
| Producción periódica de Barra                     | F10 y F20                              | Personal enviado desde satélites              | F04 y responsables de sede               | `ROTATIVA`         |
| Decisión y emisión de compras                     | Por determinar                         | Administración u operaciones                  | Gerencia                                 | `POR_IDENTIFICAR`  |
| Recepción de proveedores — segundo piso           | F11, actualmente cubierta por F04      | Jefe de Operaciones                           | F02 o F04                                | `TEMPORAL`         |
| Recepción de proveedores — primer piso            | F10                                    | Trabajadores de las áreas destinatarias       | F04                                      | `COMPARTIDA`       |
| Organización y custodia de Bodega                 | F11                                    | Cobertura temporal de F04                     | F02, F04                                 | `VACANTE`          |
| Custodia de insumos por área productiva           | F10                                    | Trabajadores del área                         | Responsable de área                      | `PROVISIONAL`      |
| Recepción de producción terminada                 | F11                                    | Bodega o responsables que cubren la función   | F04                                      | `PROVISIONAL`      |
| Alistamiento de productos del primer piso         | F10                                    | Áreas productivas                             | F04                                      | `COMPARTIDA`       |
| Alistamiento de productos del segundo piso        | F11 y F10                              | Bodega y Cocina Caliente                      | F04                                      | `COMPARTIDA`       |
| Consolidación y entrega al conductor              | F11                                    | Bodega, áreas y apoyos                        | F04                                      | `PROVISIONAL`      |
| Carga del vehículo                                | F11, F12 y F20                         | Bodega, conductor y apoyos                    | F04                                      | `COMPARTIDA`       |
| Transporte entre sedes                            | F12                                    | Conductor                                     | F04                                      | `CONFIRMADA`       |
| Recepción de remisión en satélite                 | F13                                    | Trabajador disponible o asignado              | F03                                      | `ROTATIVA`         |
| Control de canastas retornables                   | Sin dueño formal confirmado            | F11, F12 y F13                                | F04                                      | `IMPLÍCITA`        |
| Limpieza de zonas comunes del Centro              | F14                                    | Servicios Generales                           | F04                                      | `CONFIRMADA`       |
| Limpieza de estaciones y utensilios               | Cada familia operativa                 | Trabajadores de cada área                     | Responsable de área                      | `CONFIRMADA`       |
| Custodia externa de decoraciones                  | F15                                    | Encargado de decoraciones                     | F04 o F01                                | `PROVISIONAL`      |
| Custodia nocturna del vehículo                    | F15                                    | Punto asociado a gerencia general             | F02                                      | `CONFIRMADA`       |
| Recogida y devolución del vehículo                | F12                                    | Conductor                                     | F04                                      | `CONFIRMADA`       |
| Desarrollo de página corporativa                  | F04 en función técnica actual          | Carlos Alejandro Ibarra Ariza                 | Propósito y contenido por F01, F02 y F06 | `TEMPORAL`         |
| Centro de Pesaje                                  | Ninguno                                | Ninguno                                       | Futuro: FOGO, NEXO y Operaciones         | `FUTURA_SIN_ACTOR` |
| Punto central de impresión                        | Ninguno formal                         | Ninguno                                       | Futuro: E4 y áreas consumidoras          | `FUTURA_SIN_ACTOR` |
| Venta B2B del Centro de Producción                | Ninguno                                | Ninguno                                       | Futuro: `OPS-B2B-001`                    | `FUTURA_SIN_ACTOR` |
| Centro de costo de Producción                     | Ninguno como proceso formal            | Registros parciales administrativos           | Futuro: NUMERA                           | `FUTURA_SIN_ACTOR` |

---

#### 8. Responsables específicos inicialmente identificados

Esta lista no constituye un organigrama definitivo.

| Persona o referencia              | Responsabilidad actualmente identificada                                                                                        | Condición                               |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| Propietarios                      | Gobierno empresarial, decisiones institucionales y supervisión final                                                            | Permanente                              |
| Gerente general                   | Dirección ejecutiva, supervisión administrativa y respuesta institucional                                                       | Permanente                              |
| Carlos Alejandro Ibarra Ariza     | Jefatura de Operaciones, coordinación local, recepción parcial, cobertura temporal de Bodega y desarrollo de página corporativa | Mixta: permanente y temporal            |
| Jeo García                        | Gestión principal de Vaila Vainilla                                                                                             | Operación asociada                      |
| Contabilidad                      | Información financiera, archivo y procesos administrativos vinculados                                                           | Requiere desglose                       |
| Marketing                         | Campañas, contenido y gestión de comunicación                                                                                   | Requiere desglose                       |
| Responsable de pedidos            | Gestión de canales y pedidos externos                                                                                           | Identidad concreta por validar          |
| Responsables de áreas productivas | Producción y cuidado de recursos de cada área                                                                                   | Requiere validación individual          |
| Conductor                         | Transporte, entrega y retorno del vehículo                                                                                      | Requiere validar límites exactos        |
| Encargado de decoraciones         | Custodia y trabajo sobre decoraciones en punto externo                                                                          | Requiere validar inventario y controles |
| Servicios Generales               | Limpieza y mantenimiento de zonas comunes                                                                                       | Requiere validar cobertura horaria      |

Los nombres y responsables no suficientemente confirmados deberán validarse en `OPS-AUD-015`.

---

#### 9. Brechas de responsabilidad detectadas y destino documental

##### 9.1 Bodega y Abastecimiento

```text
RESPONSABILIDAD EXISTENTE
+
TITULAR HABITUAL VACANTE
+
COBERTURA TEMPORAL PARCIAL
=
RIESGO DE PROPIEDAD Y CONTINUIDAD
```

Destino documental:

- observación: `OPS-AUD-003`;
- flujo real: `OPS-AUD-007`;
- segregación: `OPS-AUD-009`;
- dependencias: `OPS-AUD-011`;
- pérdida de responsabilidad: `OPS-AUD-013`;
- validación: `OPS-AUD-015`;
- diseño objetivo: `OPS-LOG-001`.

##### 9.2 Compras y recepción

No está suficientemente diferenciada la responsabilidad entre:

- decidir la compra;
- solicitar;
- aprobar;
- emitir la orden;
- recibir;
- revisar cantidades;
- revisar calidad;
- registrar;
- ubicar;
- conciliar factura.

Destino documental:

- `OPS-AUD-003`;
- `OPS-AUD-007`;
- `OPS-AUD-009`;
- `OPS-AUD-012`;
- `OPS-AUD-015`;
- posteriormente ORIGO y `OPS-LOG-001`.

##### 9.3 Solicitudes, demanda y producción

Actualmente la responsabilidad parece distribuida entre:

- satélites;
- responsable de pedidos;
- áreas productivas;
- coordinación de operaciones;
- Bodega.

No existe todavía un propietario único documentado para la planificación integral.

Destino documental:

- `OPS-PLAN-001`;
- `OPS-PLAN-002`;
- `OPS-PLAN-003`;
- `OPS-PLAN-004`;
- `OPS-AUD-007`;
- `OPS-AUD-015`.

##### 9.4 Caja y excepciones comerciales

Debe confirmarse quién:

- abre caja;
- cierra caja;
- recibe diferencias;
- aprueba anulaciones;
- autoriza devoluciones;
- corrige pedidos;
- responde por medios de pago.

Destino documental:

- `OPS-AUD-003`;
- `OPS-AUD-008`;
- `OPS-AUD-009`;
- `OPS-AUD-015`;
- `OPS-POS-001`;
- PULSO.

##### 9.5 Canastas y retornables

Participan Bodega, conductor y satélites, pero no existe un dueño formal claramente identificado.

Destino documental:

- `OPS-AUD-003`;
- `OPS-AUD-007`;
- `OPS-AUD-013`;
- `OPS-ACT-001`;
- `NEXO-DOM-006`;
- `NEXO-DOM-008`;
- `NEXO-DOM-015`.

##### 9.6 Custodias externas

Debe diferenciarse:

- propietario;
- custodio;
- usuario;
- responsable de mantenimiento;
- responsable de conteo;
- persona autorizada para mover o disponer del activo.

Destino documental:

- `OPS-ACT-001`;
- `OPS-AUD-003`;
- `OPS-AUD-009`;
- `OPS-AUD-015`;
- NEXO.

##### 9.7 Fronteras de marcas y operaciones asociadas

La dirección común no elimina las diferencias de:

- titularidad;
- ingresos;
- gastos;
- personal;
- activos;
- facturación;
- responsabilidad.

Destino documental:

- `OPS-GOV-001`;
- `OPS-AUD-011`;
- `OPS-AUD-015`;
- `OPS-CST-001`.

##### 9.8 Marketing, ventas y atención de pedidos

Debe diferenciarse quién:

- crea contenido;
- publica;
- responde mensajes;
- cotiza;
- confirma pedidos;
- recibe pagos;
- transfiere información a producción;
- resuelve reclamos;
- conserva evidencia comercial.

Destino documental:

- `OPS-AUD-003`;
- `OPS-AUD-005`;
- `OPS-AUD-007`;
- `OPS-AUD-009`;
- `OPS-AUD-015`;
- `OPS-CAN-001`.

##### 9.9 Servicios Generales y limpieza por área

Debe verificarse la frontera entre:

- limpieza general;
- limpieza de zonas comunes;
- lavado de canastas y trapos;
- limpieza de estación;
- limpieza de utensilios;
- mantenimiento básico;
- reporte de daños.

Destino documental:

- `OPS-AUD-003`;
- `OPS-AUD-007`;
- `OPS-AUD-011`;
- `OPS-AUD-015`.

##### 9.10 Capacidades futuras sin actor

Las capacidades futuras no deberán recibir responsables ficticios antes de existir un proceso aprobado.

Destino documental:

| Capacidad                        | Tarea propietaria               |
| -------------------------------- | ------------------------------- |
| Centro de Pesaje                 | `OPS-PRD-001`                   |
| Catálogo B2B                     | `OPS-B2B-001`                   |
| Punto central de impresión       | `OPS-TRZ-001` y BLOQUE E4       |
| Centro de costo y transferencias | `OPS-CST-001`                   |
| Planificación de producción      | `OPS-PLAN-001` a `OPS-PLAN-004` |

---

#### 10. Relación con el modelo de autorización

Las familias identificadas en esta tarea serán una entrada para:

- `CAP-MAP-006` — identificar iniciador, ejecutor, supervisor y aprobador;
- `PROC-ACTOR-001` — vincular procesos con roles base;
- `PROC-ACTOR-002` — vincular procesos con roles operativos;
- `PROC-ACTOR-003` — diferenciar iniciador, ejecutor, supervisor y aprobador;
- matrices futuras de pantallas;
- definición de turnos;
- definición de sedes y áreas activas;
- permisos;
- auditoría de actor efectivo.

La transformación futura será:

```text
FAMILIA DE ACTOR AS-IS
        ↓
PROCESO APROBADO
        ↓
RESPONSABILIDAD OBJETIVO
        ↓
CARGO O PERFIL LABORAL
        ↓
ROL BASE, CUANDO APLIQUE
        +
ROL OPERATIVO, CUANDO APLIQUE
        +
PERMISOS
        +
CONTEXTO
```

No se realizará la conversión automática:

```text
familia de actor
→ rol de autorización
```

---

#### 11. Contrato mínimo para el levantamiento posterior

Cada proceso observado o documentado en las tareas siguientes deberá registrar, como mínimo:

| Campo                   | Descripción                                                                  |
| ----------------------- | ---------------------------------------------------------------------------- |
| `process_reference`     | Nombre provisional o identificador del proceso                               |
| `company_or_brand`      | Empresa, marca o unidad relacionada                                          |
| `site`                  | Sede o punto operativo                                                       |
| `area`                  | Área, cuando aplique                                                         |
| `actor_family`          | Familia F01 a F21                                                            |
| `participation_type`    | `GOB`, `DPR`, `INI`, `EJE`, `SUP`, `APR`, `CUS`, `REC`, `SOP`, `EXT` o `SYS` |
| `person_or_group`       | Persona concreta o grupo actual                                              |
| `responsibility_state`  | Estado definido en la sección 5                                              |
| `habitual_or_temporary` | Naturaleza habitual, temporal, rotativa o compartida                         |
| `evidence_source`       | Documento, entrevista, observación o sistema                                 |
| `validation_task`       | Tarea exacta que deberá confirmar el hallazgo                                |
| `gap_task`              | Tarea exacta propietaria de cualquier brecha                                 |

---

#### 12. Decisiones canónicas propuestas

1. La familia de actor es una categoría de levantamiento operativo, no un rol de software.

2. Toda operación empresarial deberá poder atribuirse a una persona, familia responsable o proceso de sistema identificado.

3. Una persona puede pertenecer simultáneamente a varias familias de actor dependiendo del proceso.

4. El dueño del proceso, el ejecutor, el supervisor, el aprobador y el custodio pueden ser actores distintos.

5. Una vacante no elimina la responsabilidad del proceso.

6. La cobertura temporal deberá registrarse expresamente y no convertirse en asignación permanente implícita.

7. El apoyo rotativo no transfiere automáticamente propiedad, aprobación ni custodia.

8. Las plataformas y sistemas participan como herramientas, integraciones o procesos técnicos, pero no sustituyen la responsabilidad empresarial.

9. Los roles base y operativos aprobados en el modelo de autorización no se utilizarán como evidencia automática de responsabilidad real.

10. Las familias F01 a F21 constituyen una taxonomía inicial AS-IS y podrán ajustarse durante `OPS-AUD-003` y `OPS-AUD-015` sin perder trazabilidad.

11. Bodega y Abastecimiento conserva una responsabilidad real aunque su titular habitual esté vacante.

12. La cobertura actual de Bodega por parte del Jefe de Operaciones se clasifica como temporal y parcial.

13. Las áreas productivas conservan responsabilidad sobre su producción, recursos, estación y novedades, aunque compartan espacio o personal.

14. Servicios Generales no sustituye la responsabilidad de limpieza propia de cada área.

15. La recepción de proveedores, el alistamiento, la carga, el transporte y la recepción en satélite son responsabilidades diferenciables aunque actualmente estén distribuidas.

16. La planificación de demanda y producción no tiene todavía un único propietario integral confirmado.

17. Las acciones sensibles de caja, compras, correcciones, anulaciones y disposición de activos requieren identificación específica de ejecutor y aprobador.

18. Las operaciones asociadas, como Vaila Vainilla, deberán conservar sus fronteras particulares de responsabilidad y no mezclarse automáticamente con las operaciones centrales.

19. Las capacidades futuras permanecerán sin actor operativo vigente hasta que su proceso TO-BE y su propiedad sean aprobados.

20. Ninguna decisión de esta tarea autoriza cambios de personal, permisos, datos, código, Supabase o estructura organizacional.

---

#### 13. Criterios de aceptación

`OPS-AUD-002` podrá aprobarse cuando se confirme que:

- existe una separación explícita entre persona, cargo, familia de actor, rol base, rol operativo, responsabilidad y permiso;
- las familias de actores internas, externas, técnicas y temporales están inventariadas;
- los responsables específicos conocidos están registrados sin presentar supuestos como hechos definitivos;
- las responsabilidades vacantes, temporales, rotativas, compartidas e implícitas están diferenciadas;
- cada familia de proceso conocida tiene al menos una hipótesis explícita de dueño, ejecutor o estado `POR_IDENTIFICAR`;
- las plataformas no aparecen como responsables empresariales;
- las capacidades futuras permanecen identificadas como `FUTURA_SIN_ACTOR`;
- cada brecha detectada está vinculada a tareas exactas del roadmap;
- no se ha definido todavía el proceso detallado propio de `OPS-AUD-007`;
- no se ha resuelto anticipadamente la segregación propia de `OPS-AUD-009`;
- no se ha iniciado `OPS-AUD-003`;
- no se ha autorizado implementación técnica.

---

#### 14. Resultado y continuidad

Con la aprobación de `OPS-AUD-002` quedará establecida la línea base inicial de:

- familias de actores;
- tipos de participación;
- estados de responsabilidad;
- responsables actuales conocidos;
- coberturas temporales;
- responsabilidades vacantes;
- procesos con propiedad implícita o por identificar;
- actores externos y sistemas participantes;
- destinos documentales de las brechas detectadas.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-003
— Observar el trabajo real de cada área en operación ordinaria
```

`OPS-AUD-003` deberá contrastar esta propuesta con la operación real y registrar cualquier diferencia sin modificar silenciosamente la trazabilidad aprobada.



### 🟡 OPS-AUD-003 — Observar el trabajo real de cada área en operación ordinaria

**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Estado:** PROPUESTA PARA APROBACIÓN  
**Naturaleza:** Auditoría de campo AS-IS  
**Tarea anterior:** `OPS-AUD-002` — APROBADA  
**Siguiente tarea reservada:** `OPS-AUD-004` — Inventariar procesos ejecutados en papel  
**Implementación técnica:** No autorizada  
**Migraciones o cambios en Supabase:** No autorizados  

---

#### 1. Propósito

Observar directamente cómo trabaja cada área de Vento Group durante la operación real, sin sustituir la evidencia de campo por:

- entrevistas aisladas;
- descripciones ideales;
- manuales;
- roles configurados en software;
- procedimientos que deberían cumplirse;
- supuestos administrativos;
- conocimiento parcial de una sola persona.

La tarea deberá producir una línea base verificable del trabajo ordinario, incluyendo:

- qué activa el trabajo;
- quién interviene realmente;
- qué pasos se ejecutan;
- en qué orden;
- qué decisiones se toman;
- qué información se consulta;
- qué documentos, aplicaciones, equipos y canales se utilizan;
- qué se entrega a otra persona o área;
- dónde existen esperas, interrupciones, retrabajos, atajos o controles informales;
- qué diferencias existen entre lo declarado y lo observado.

---

#### 2. Decisión metodológica principal

`OPS-AUD-003` no se resolverá mediante una visita general ni una conversación grupal.

Se ejecutará como una campaña estructurada de observación de campo:

```text
PREPARAR LA SESIÓN
        ↓
OBSERVAR SIN INTERRUMPIR
        ↓
REGISTRAR SECUENCIA Y EVIDENCIA
        ↓
PREGUNTAR DESPUÉS DE LA EJECUCIÓN
        ↓
CONTRASTAR CON OPS-AUD-001 Y OPS-AUD-002
        ↓
CLASIFICAR HALLAZGOS Y CONTRADICCIONES
        ↓
VINCULAR CADA BRECHA A UNA TAREA EXACTA
```

La observación deberá capturar el proceso como ocurre actualmente, incluso cuando sea:

- manual;
- informal;
- ineficiente;
- inconsistente;
- dependiente de memoria;
- contrario al proceso esperado;
- ejecutado por una persona distinta de la responsable habitual.

---

#### 3. Principios obligatorios

##### 3.1 Observar antes de diseñar

Durante la sesión no se rediseñará el proceso ni se indicará al trabajador cómo debería realizarlo.

```text
OBSERVACIÓN
≠
CAPACITACIÓN
≠
CORRECCIÓN
≠
IMPLEMENTACIÓN
```

Las mejoras se documentarán como hallazgos y se resolverán en sus tareas propietarias.

##### 3.2 Registrar trabajo real, no trabajo ideal

Cuando exista diferencia entre:

- lo que se cree que ocurre;
- lo que el trabajador dice que ocurre;
- lo que efectivamente se observa;

se conservarán las tres versiones por separado.

##### 3.3 No convertir una observación aislada en regla general

Cada hallazgo deberá indicar su nivel de evidencia:

| Estado de evidencia | Significado |
| --- | --- |
| `OBSERVADO_UNA_VEZ` | Ocurrió durante una sesión, sin repetición confirmada |
| `OBSERVADO_REPETIDO` | Ocurrió en dos o más sesiones comparables |
| `CONFIRMADO_POR_ACTOR` | Fue explicado por quien ejecuta el trabajo |
| `CONFIRMADO_POR_RESPONSABLE` | Fue validado por supervisor o dueño del proceso |
| `RESPALDADO_POR_ARTEFACTO` | Existe documento, registro, sistema, foto o evidencia asociada |
| `CONTRADICTORIO` | Existen versiones o evidencias incompatibles |
| `PENDIENTE_VALIDACION` | Requiere confirmación posterior en `OPS-AUD-015` |

##### 3.4 Observar handoffs, no solo tareas internas

El límite de una sesión no termina cuando el trabajador completa su actividad.

También deberá registrarse:

- a quién entrega;
- qué entrega;
- cómo informa que terminó;
- qué espera la siguiente persona;
- cómo se confirma la recepción;
- qué ocurre cuando la siguiente persona no está disponible.

##### 3.5 Separar área, zona, estación y actor

La observación deberá registrar por separado:

```text
SEDE
→ ÁREA OPERATIVA
→ ZONA FÍSICA
→ ESTACIÓN
→ ACTOR EFECTIVO
→ ACTIVIDAD
```

##### 3.6 No ocultar variabilidad

Si dos trabajadores realizan el mismo trabajo de manera distinta, deberán documentarse ambas variantes.

No se elegirá silenciosamente una como proceso oficial.

##### 3.7 Toda brecha tendrá destino documental

Ningún hallazgo podrá quedar únicamente como comentario narrativo.

Cada hallazgo deberá:

- vincularse a una tarea existente; o
- generar una nueva tarea explícita con identificador, bloque, propósito, dependencias y momento de resolución.

---

#### 4. Técnicas de observación obligatorias

##### 4.1 Shadowing operativo

Acompañar al trabajador durante una actividad completa sin asumir su función.

Se registrará:

- inicio;
- secuencia;
- interrupciones;
- decisiones;
- herramientas;
- desplazamientos;
- entrega final.

##### 4.2 Registro cronológico

Cada paso deberá conservar:

- hora de inicio;
- hora de finalización;
- actor;
- acción;
- entrada;
- salida;
- herramienta;
- espera;
- observación.

##### 4.3 Trazado de artefactos

Seguir físicamente o digitalmente un elemento representativo, por ejemplo:

- una remisión;
- un pedido;
- una compra;
- un producto recibido;
- un lote producido;
- una canasta;
- una devolución;
- un cierre de caja;
- una solicitud de producción.

##### 4.4 Observación de handoff

Acompañar el traspaso entre:

- área y área;
- sede y sede;
- trabajador y supervisor;
- proveedor y receptor;
- bodega y conductor;
- conductor y satélite;
- aplicación y operación física.

##### 4.5 Entrevista posterior breve

Las preguntas se realizarán después del paso observado, para no modificar la ejecución.

Preguntas mínimas:

1. ¿Qué activó esta tarea?
2. ¿Cómo supiste qué hacer?
3. ¿Qué información necesitaste?
4. ¿Qué haces cuando falta información o producto?
5. ¿Quién puede autorizar una excepción?
6. ¿Qué haces si la siguiente persona no está?
7. ¿Qué parte se repite o se registra dos veces?
8. ¿Qué error ocurre con mayor frecuencia?
9. ¿Qué parte depende de memoria o experiencia?
10. ¿Cómo se sabe que el trabajo quedó terminado?

---

#### 5. Cobertura mínima por sede y área

##### 5.1 Vento Café

Observar como mínimo:

- Servicio / Salón;
- terraza y salón interior cuando operen de forma diferente;
- Caja y Mostrador;
- recepción y entrega de pedidos externos;
- Cocina;
- Barra;
- apertura;
- periodo ordinario;
- periodo de mayor demanda;
- cierre;
- recepción de remisiones.

##### 5.2 Saudo

Aunque se mantenga inicialmente como área integral, deberán distinguirse las funciones observadas de:

- caja;
- mostrador;
- servicio;
- cocina;
- barra;
- pedidos externos;
- recepción de remisiones;
- apertura y cierre.

##### 5.3 Molka

Observar separadamente, aunque exista operación integral:

- venta;
- caja;
- atención;
- cocina o preparación;
- barra cuando aplique;
- pedidos de ManyChat y Rappi;
- recepción de remisiones;
- apertura y cierre.

##### 5.4 Centro de Producción y Distribución

Observar como unidades operativas diferenciables:

- Panadería y Bollería;
- Repostería;
- Pastelería y Tortas;
- Galletería;
- Producción de Barra en un día real de producción;
- Cocina Caliente;
- Bodega y Abastecimiento;
- recepción de proveedores;
- recepción de producción terminada;
- alistamiento de remisiones del primer piso;
- alistamiento de remisiones del segundo piso;
- consolidación de pedidos;
- entrega al conductor;
- carga del vehículo;
- Servicios Generales;
- punto administrativo operativo;
- uso de cámara fría;
- uso del cuarto de congelación;
- lavado y manejo de canastas.

##### 5.5 Logística y transporte

Observar al menos un ciclo completo:

```text
RECOGIDA O DISPONIBILIDAD DEL VEHÍCULO
→ RECEPCIÓN DE CARGA
→ VERIFICACIÓN
→ TRANSPORTE
→ ENTREGA EN SATÉLITE
→ NOVEDADES
→ RETORNABLES
→ CIERRE DE RUTA
→ DEVOLUCIÓN DEL VEHÍCULO
```

##### 5.6 Administración y canales

Observar tareas representativas de:

- contabilidad;
- gestión administrativa;
- marketing;
- atención de mensajes;
- gestión de pedidos;
- catering;
- coordinación operativa;
- gestión de incidencias entre sedes.

La observación administrativa deberá registrar también trabajo digital, reuniones, aprobaciones y esperas, no únicamente actividad física.

##### 5.7 Puntos externos recurrentes

Cuando exista actividad operativa real, observar o documentar mediante evidencia suficiente:

- custodia de decoraciones;
- custodia nocturna del vehículo;
- operación de Vaila Vainilla;
- cualquier punto externo con inventario, activos o trabajo recurrente.

---

#### 6. Cobertura temporal mínima

No será suficiente observar únicamente una franja tranquila.

Para cada área se deberá cubrir, cuando aplique:

| Momento | Propósito |
| --- | --- |
| Apertura o inicio de turno | Preparación, chequeos, faltantes iniciales y asignaciones |
| Operación ordinaria | Secuencia habitual sin presión extraordinaria |
| Pico de demanda o carga | Priorización, atajos, errores, comunicación y capacidad |
| Cambio de turno o relevo | Handoff de información, pendientes y custodia |
| Cierre | Conciliación, limpieza, reportes, devoluciones y preparación del día siguiente |
| Evento periódico | Actividades que no ocurren todos los días |
| Contingencia real, si ocurre | Respuesta ante fallos, faltantes, retrasos o ausencias |

Regla mínima recomendada:

- dos sesiones por área o familia de trabajo;
- una sesión ordinaria;
- una sesión de pico, apertura, cierre o evento crítico;
- una tercera sesión cuando las dos primeras sean contradictorias o insuficientes.

Para actividades poco frecuentes, se permitirá evidencia histórica o una sesión programada real, pero no una simulación presentada como observación ordinaria.

---

#### 7. Unidad mínima de observación

Cada registro deberá representar una actividad suficientemente concreta.

Ejemplo válido:

```text
07:42–07:49
Actor: responsable de Cocina Caliente
Actividad: recibe insumos entregados por proveedor
Entrada: productos, factura y pedido verbal
Acción: revisa visualmente, cuenta, separa y lleva al refrigerador
Herramientas: factura física y memoria
Salida: producto almacenado
Handoff: informa verbalmente a Jefe de Operaciones
Espera: 3 minutos por falta de espacio
Hallazgo: no existe confirmación formal de cantidad recibida
```

Ejemplo inválido:

```text
“La cocina recibe productos y los organiza.”
```

---

#### 8. Datos obligatorios por sesión

##### 8.1 Identificación

- código de sesión;
- fecha;
- sede;
- área;
- zona y estación;
- franja horaria;
- tipo de jornada;
- observador;
- actores presentes;
- condición de demanda;
- evento observado.

##### 8.2 Secuencia operativa

Por cada paso:

- número;
- hora inicial y final;
- actor efectivo;
- familia de actor;
- acción;
- entrada;
- fuente de información;
- herramienta o equipo;
- documento o sistema;
- decisión;
- aprobación, cuando exista;
- salida;
- receptor;
- espera;
- retrabajo;
- excepción;
- evidencia.

##### 8.3 Condiciones del entorno

- disponibilidad de personal;
- estado de equipos;
- conectividad;
- espacio;
- orden físico;
- disponibilidad de inventario;
- presión de demanda;
- interrupciones;
- dependencia de otras áreas.

##### 8.4 Hallazgos

Cada hallazgo deberá clasificarse como:

- diferencia frente a `OPS-AUD-001`;
- diferencia frente a `OPS-AUD-002`;
- proceso en papel;
- proceso en WhatsApp, correo, Excel u otra herramienta;
- artefacto o documento no inventariado;
- excepción o corrección;
- aprobación o segregación;
- volumen o tiempo relevante;
- dependencia;
- doble digitación;
- pérdida de trazabilidad;
- contingencia;
- capacidad ausente;
- riesgo de seguridad, calidad o continuidad.

---

#### 9. Código de observación y trazabilidad

Formato recomendado:

```text
OBS-{SEDE}-{AREA}-{AAAAMMDD}-{SECUENCIA}
```

Ejemplos:

```text
OBS-CP-PAN-20260723-01
OBS-VC-SALON-20260724-02
OBS-SA-INT-20260725-01
OBS-LOG-RUTA-20260726-01
```

Cada fotografía, nota, documento o evidencia deberá usar el mismo código de sesión.

No se incluirán datos personales, financieros o de clientes que no sean necesarios para el análisis.

---

#### 10. Reglas de evidencia

##### 10.1 Evidencia permitida

- notas estructuradas;
- fotografías de estaciones, documentos o equipos, cuando estén autorizadas;
- capturas de pantalla sin secretos ni datos personales innecesarios;
- copias o referencias de formatos;
- tiempos registrados;
- registros del sistema;
- ejemplos anonimizados;
- diagramas del recorrido;
- confirmación posterior del actor.

##### 10.2 Evidencia prohibida o restringida

No deberá capturarse sin necesidad y control:

- contraseñas;
- tokens;
- credenciales;
- datos completos de clientes;
- datos bancarios;
- conversaciones privadas irrelevantes;
- información sensible de trabajadores;
- fórmulas o recetas sensibles fuera del alcance aprobado.

##### 10.3 Separación entre hecho e interpretación

Cada registro distinguirá:

```text
HECHO OBSERVADO
INTERPRETACIÓN DEL OBSERVADOR
EXPLICACIÓN DEL ACTOR
DECISIÓN PENDIENTE
```

---

#### 11. Hallazgos que no deben corregirse durante la sesión

Durante la observación no se corregirán silenciosamente:

- pasos duplicados;
- formatos incompletos;
- uso de memoria;
- controles informales;
- responsabilidades mezcladas;
- uso de WhatsApp;
- diferencias entre áreas;
- espera por aprobaciones;
- falta de identificación de canastas;
- falta de zonas formales;
- accesos incorrectos en aplicaciones;
- ausencia de registros.

Solo se interrumpirá la observación cuando exista un riesgo inmediato para:

- personas;
- inocuidad;
- seguridad;
- activos;
- cumplimiento legal;
- continuidad crítica de la operación.

La intervención deberá quedar registrada como parte de la evidencia.

---

#### 12. Orden recomendado de ejecución

##### Ola 1 — Centro de Producción y Distribución

Prioridad alta porque concentra:

- producción;
- inventario;
- recepción;
- almacenamiento;
- remisiones;
- transporte;
- múltiples áreas y handoffs.

Orden sugerido:

1. Bodega y recepción de proveedores.
2. Panadería y Bollería.
3. Repostería.
4. Pastelería y Tortas.
5. Galletería.
6. Cocina Caliente.
7. Producción de Barra en su día real.
8. Alistamiento y consolidación de remisiones.
9. Carga y salida del conductor.
10. Servicios Generales y zonas compartidas.

##### Ola 2 — Logística y recepción en satélites

1. Carga.
2. Ruta.
3. Entrega en Vento Café.
4. Entrega en Saudo.
5. Entrega en Molka.
6. Retorno de canastas y novedades.

##### Ola 3 — Vento Café

1. Apertura.
2. Caja y mostrador.
3. Servicio / Salón.
4. Barra.
5. Cocina.
6. Pedidos externos.
7. Pico de demanda.
8. Cierre.

##### Ola 4 — Saudo y Molka

Observar primero la operación integral y después distinguir funciones internas reales.

##### Ola 5 — Administración, comercial y puntos externos

1. Gerencia y coordinación.
2. Contabilidad y administración.
3. Marketing y canales.
4. Catering.
5. Vaila Vainilla.
6. Custodias externas.

---

#### 13. Regla de saturación

Un área no se considerará suficientemente observada solo por completar un formulario.

Se considerará alcanzada la saturación cuando:

- las sesiones adicionales ya no revelen pasos ordinarios nuevos relevantes;
- los principales actores y handoffs estén identificados;
- las variantes conocidas estén registradas;
- las contradicciones tengan destino de validación;
- el inicio y el cierre del trabajo estén claros;
- los artefactos y sistemas utilizados estén inventariados o vinculados;
- las brechas estén asociadas con tareas exactas.

---

#### 14. Salidas obligatorias

`OPS-AUD-003` deberá producir:

1. Inventario de sesiones de observación.
2. Registro cronológico por sesión.
3. Mapa de actores efectivos por actividad.
4. Inventario de entradas y salidas observadas.
5. Inventario de documentos, sistemas, canales, equipos y estaciones utilizados.
6. Mapa de handoffs entre actores, áreas y sedes.
7. Registro de esperas, interrupciones y retrabajos.
8. Registro de decisiones y aprobaciones observadas.
9. Registro de diferencias frente a `OPS-AUD-001` y `OPS-AUD-002`.
10. Registro de variantes del mismo trabajo.
11. Lista de hallazgos vinculados a tareas posteriores.
12. Matriz de cobertura de áreas, franjas y eventos.
13. Lista de observaciones que requieren validación en `OPS-AUD-015`.

---

#### 15. Distribución obligatoria de hallazgos

| Hallazgo observado | Tarea propietaria |
| --- | --- |
| Formularios y procesos en papel | `OPS-AUD-004` |
| WhatsApp, correo, Excel y herramientas externas | `OPS-AUD-005` |
| Remisiones, órdenes, etiquetas, comprobantes y reportes | `OPS-AUD-006` |
| Flujo ordinario completo | `OPS-AUD-007` |
| Excepciones, correcciones, anulaciones y devoluciones | `OPS-AUD-008` |
| Aprobaciones y segregación | `OPS-AUD-009` |
| Frecuencia, volumen, criticidad y tiempos | `OPS-AUD-010` |
| Dependencias entre áreas, sedes y terceros | `OPS-AUD-011` |
| Doble digitación y conciliación manual | `OPS-AUD-012` |
| Pérdida de trazabilidad o responsabilidad | `OPS-AUD-013` |
| Contingencias de red, energía, dispositivo o proveedor | `OPS-AUD-014` |
| Confirmación con trabajadores y responsables | `OPS-AUD-015` |
| Brecha registral de sede administrativa | `OPS-ADM-001` |
| Gobernanza entre marcas y titulares | `OPS-GOV-001` |
| Activos y custodias externas | `OPS-ACT-001` |
| Auditoría de demanda | `OPS-PLAN-001` a `OPS-PLAN-004` |
| Diseño de Bodega y Abastecimiento | `OPS-LOG-001` |
| Diseño de recetas, pesaje y trazabilidad productiva | `OPS-REC-001`, `OPS-PRD-001`, `OPS-TRZ-001` |
| Zonas y puntos POS | `OPS-POS-001` |
| Costos y transferencias internas | `OPS-CST-001` |

---

#### 16. Criterios de aceptación

`OPS-AUD-003` podrá aprobarse cuando:

- todas las áreas y familias de trabajo actuales tengan cobertura registrada o una justificación explícita de imposibilidad;
- se hayan observado operación ordinaria y al menos una condición adicional relevante por área;
- se hayan registrado actores efectivos, secuencia, entradas, salidas, herramientas y handoffs;
- se distingan hechos, interpretaciones y explicaciones de los actores;
- las diferencias frente a `OPS-AUD-001` y `OPS-AUD-002` estén trazadas;
- las variantes entre trabajadores o turnos estén documentadas;
- las áreas integrales de Saudo y Molka hayan sido observadas sin asumir que todas sus funciones son idénticas;
- Bodega haya sido registrada como responsabilidad vacante con cobertura real observada;
- se haya seguido al menos un ciclo completo de remisión y transporte;
- se hayan identificado documentos, herramientas externas y artefactos para las tareas siguientes;
- ninguna brecha quede sin tarea propietaria;
- no se haya diseñado todavía el proceso TO-BE;
- no se hayan modificado permisos, código, datos o Supabase.

---

#### 17. Resultado y continuidad

Con la aprobación de `OPS-AUD-003` existirá evidencia de campo suficiente para continuar con:

```text
OPS-AUD-004
— Inventariar procesos ejecutados en papel
```

Las sesiones y evidencias de `OPS-AUD-003` serán fuente obligatoria para `OPS-AUD-004` a `OPS-AUD-015`.

No deberá reconstruirse posteriormente la operación únicamente desde memoria o entrevistas si existe evidencia directa de campo.



### [ ] OPS-AUD-004 — Inventariar procesos ejecutados en papel
### [ ] OPS-AUD-005 — Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas
### [ ] OPS-AUD-006 — Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes
### [ ] OPS-AUD-007 — Documentar flujo ordinario de cada proceso
### [ ] OPS-AUD-008 — Documentar excepciones, correcciones, anulaciones, devoluciones y reversión
### [ ] OPS-AUD-009 — Documentar aprobaciones, segregación de funciones y controles manuales
### [ ] OPS-AUD-010 — Medir frecuencia, volumen, criticidad, tiempos y estacionalidad
### [ ] OPS-AUD-011 — Identificar dependencias entre áreas, sedes, aplicaciones y terceros
### [ ] OPS-AUD-012 — Identificar puntos de doble digitación y conciliación manual
### [ ] OPS-AUD-013 — Identificar pérdidas de trazabilidad, información y responsabilidad
### [ ] OPS-AUD-014 — Identificar contingencias por caída de red, energía, dispositivo o proveedor
### [ ] OPS-AUD-015 — Validar hallazgos con trabajadores, supervisores y responsables del proceso
