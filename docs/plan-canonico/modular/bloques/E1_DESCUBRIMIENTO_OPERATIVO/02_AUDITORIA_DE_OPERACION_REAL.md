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



### ✅ OPS-AUD-003 — Observar el trabajo real de cada área en operación ordinaria

**Estado:** APROBADO  
**Fecha:** 2026-07-22  
**Método:** entrevista estructurada con el Jefe de Operaciones y validación posterior con responsables reales.  
**Alcance:** fotografía representativa de la operación ordinaria. Los documentos, excepciones, aprobaciones, tiempos, conciliaciones y trazabilidad detallada se desarrollan en `OPS-AUD-004` a `OPS-AUD-015`.

---

#### 1. Objetivo        

Registrar por área:

1. qué inicia el trabajo;
2. quién lo recibe;
3. qué se hace normalmente;
4. qué herramientas se usan;
5. quién recibe el resultado;
6. cuál es el bloqueo habitual;
7. qué debe validarse o profundizarse después.

---

#### 2. Centro de Producción

##### 2.1. Bodega, abastecimiento y logística

**Inicio.** El conductor llega aproximadamente a las 05:30, abre el Centro de Producción y prepara las remisiones enviadas el día anterior. Las áreas solicitan mediante Excel enviado como fotografía o captura a grupos operativos.

**Operación.**
- Vento Café solicita por separado para Servicio, Cocina y Barra.
- Saudo y Molka realizan una solicitud única por sede.
- El conductor prepara por experiencia, señalización y conocimiento visual.
- Los faltantes suelen enviarse como parciales sin aviso previo.
- En la recepción de sedes, el responsable del área o su delegado cuenta y guarda los productos.
- Durante el día llegan proveedores. El Jefe de Operaciones recibe cuando está presente, revisa físicamente, contrasta con factura, firma y remite el soporte a Gerencia.
- Cualquier trabajador puede ingresar a Bodega y retirar insumos.
- Los sobrantes normalmente se conservan en las áreas y no regresan a Bodega.
- En la tarde, las áreas productivas dejan productos listos en canastas, bandejas, cuartos fríos, congeladores o mesones.
- El conductor recoge, completa Bodega y Cocina Caliente, organiza por destino y carga. El proceso toma aproximadamente entre 1,5 y 2 horas.
- Las canastas retornables regresan sin control formal. Servicios Generales las lava cuando se solicita y se dejan secar sin identificación de estado.

**Herramientas.** Excel, WhatsApp/grupos, fotografías, facturas físicas, tableros, teléfono, canastas, frío, vehículo y conocimiento práctico.

**Bloqueos.** Solicitudes olvidadas, faltantes sin aviso, llegada tardía de insumos, ausencia de inventario confiable, retiros sin registro y canastas sin control.

**Remisiones.**
- documentos y canales: `OPS-AUD-004` y `OPS-AUD-005`;
- flujo detallado: `OPS-AUD-007`;
- faltantes y parciales: `OPS-AUD-008`;
- autorizaciones: `OPS-AUD-009`;
- conciliación: `OPS-AUD-012`;
- trazabilidad: `OPS-AUD-013`;
- validaciones pendientes: `OPS-AUD-015`.

##### 2.2. Cocina Caliente

Trabaja con un plan semanal fijo y mantiene preparaciones refrigeradas. La responsable aplica un esquema heredado y su propio criterio. No recibe directamente las remisiones: el conductor las consulta y retira porciones empacadas al vacío en cantidades predefinidas. Las sedes solicitan múltiplos de esas presentaciones. Cuando no alcanza, se envía lo disponible y se prioriza la reposición.

**Pendiente:** confirmar si el plan está escrito o memorizado (`OPS-AUD-015`).

##### 2.3. Panadería y Bollería

Combina fermentaciones de varios días, stock anticipado y horneado según remisiones. El jefe de Panadería decide cantidades por experiencia y distribuye el trabajo. Los productos terminados se dejan como fondo común sin separación formal por sede. El conductor cuenta y distribuye.

El reporte final de producción se publica en un grupo para supervisión, pero no controla el despacho. Cuando no alcanza, la prioridad es:

1. Vento Café;
2. Saudo;
3. Molka.

El cuello de botella está en los tiempos técnicos de fermentación, reposo y horneado.

##### 2.4. Repostería

Angélica revisa remisiones y distribuye el trabajo entre Chelsy y Valentina. Los productos se separan por sede en canastas, reconocidas por su combinación de referencias y no por una etiqueta formal. Si no se alcanza la cantidad solicitada, se deja lo producido y normalmente solo se explica el faltante cuando la sede reclama.

##### 2.5. Pastelería y Tortas

Angélica coordina y Valentina ejecuta habitualmente el proceso completo. Las tortas son referencias estandarizadas, no personalizadas. Se dejan listas sin identificación formal por sede y el conductor reconoce el destino.

##### 2.6. Galletería

Mantiene stock anticipado. Una trabajadora dedicada prepara, controla y hornea, consultando a Angélica antes de producir más masa. Una o dos recetas producen aproximadamente 104 galletas y suelen cubrir cerca de una semana. Los productos se separan por sede.

**Pendiente:** confirmar nombre y alcance exacto de la responsable (`OPS-AUD-015`).

##### 2.7. Producción semanal de Barra

Se realiza los martes con una persona de Barra de Vento Café o Saudo, asignada por rotación. La cantidad es estandarizada, no calculada desde remisiones. El producto se porciona y almacena congelado o refrigerado. El conductor retira según solicitud. Si no alcanza, envía menos sin aviso.

**Pendiente:** confirmar si la lista estándar está escrita (`OPS-AUD-015`).

##### 2.8. Servicios Generales

Prioriza instrucciones directas de Nathalia, Carlos o responsables de área. Después atiende rutina, necesidades observadas y criterio propio. No utiliza checklist ni reporte. El lavado de canastas se activa por solicitud, normalmente después de acumulación de suciedad.

---

#### 3. Vento Café

##### 3.1. Servicio y Caja

Normalmente existen dos meseros: uno para interior y otro para exterior. La asignación se define al iniciar el turno, pero ambos apoyan entregas.

Los meseros registran pedidos desde una tablet compartida con una cuenta conjunta de Servicio. Seleccionan la mesa, agregan pedidos sucesivos y mantienen una cuenta única hasta el pago.

Caja abre Makos, cuenta la base, activa Rappi, mantiene ManyChat y organiza la vitrina. Los pedidos de Rappi se transcriben manualmente como “Rappi” y los pedidos directos como “Domicilio”.

Cualquier trabajador puede imprimir un resumen para el cliente. El efectivo se paga en Caja. El datáfono puede llevarlo cualquier trabajador; después informa verbalmente al cajero, quien registra tarjeta, cierra la mesa e imprime la factura legal.

Vento Café maneja dos turnos de Caja con cierres independientes.

**Brechas.**
- cuenta compartida sin identidad individual;
- doble digitación de canales externos;
- confirmación verbal del pago con tarjeta;
- diferencia entre producto visible en Makos y existencia física.

**Necesidad detectada:** impresoras de resumen cercanas a zona exterior, interior y sala. Esta necesidad pasa a planificación funcional posterior.

##### 3.2. Cocina

Makos imprime la comanda. El cocinero más cercano la coloca en la comandera y el equipo distribuye las tareas internamente. Se trabaja por orden de llegada. Las entradas deberían priorizarse, aunque a veces se omite.

El plato listo se coloca en la ventana, se toca una campana y se dice verbalmente la mesa. Lo recoge cualquier mesero disponible.

No existe confirmación digital de plato listo, recogido o entregado.

##### 3.3. Bar y Barra

Existen dos impresoras:

- Bar o zona caliente;
- Barra o zona fría.

Makos dirige cada producto a la estación. Puede trabajar una o dos personas. Si son dos, se coordinan sin asignación rígida; si es una, cubre ambas colas. Preparan por orden de llegada y usan campana para entregar a Servicio.

Los faltantes habituales corresponden a productos terminados de vitrina. Makos no los desactiva. La disponibilidad se verifica visualmente antes o después de ordenar. Si ya fue registrado, el cajero elimina el producto con comentario obligatorio y el mesero agrega la alternativa como pedido adicional.

---

#### 4. Saudo

Los pedidos entran por:

- mesa: mesero;
- vitrina: cajero;
- Rappi y domicilios: cajero.

Normalmente existe un mesero, que usa tablet compartida o celular con cuenta operativa conjunta. Cuando hay alta carga, el cajero apoya mesas, Cocina y bebidas además de Caja.

Existe una impresora, pero no se usan comandas impresas. Caja está aproximadamente a un metro de Cocina y el pedido se comunica verbalmente. Cuando hay varias órdenes, Cocina consulta Makos.

Trabajan dos cocineros: uno principal y otro de apoyo. Se coordinan sin asignación rígida. El pedido listo se anuncia verbalmente y puede entregarlo el mesero o el cajero.

El pago funciona como en Vento Café.

**Cuello de botella:** acumulación de pizzas frente a la capacidad de dos hornos napolitanos.

---

#### 5. Molka

No existe toma de pedidos en mesa. Todo se recibe en mostrador, se registra y se cobra antes de preparar.

Una persona puede ejecutar el ciclo completo: atender, cobrar, consultar Makos, preparar, servir y entregar. Algunas veces trabajan dos y ambas realizan cualquiera de esas funciones, coordinándose según el flujo.

Los pedidos se atienden por orden de llegada. La entrega puede hacerse en mostrador o llevarse a la mesa según el cliente.

**Bloqueos:** acumulación de clientes y preparación de bebidas calientes.

---

#### 6. Centro de Distribución — corrección canónica

Se confirmó que:

- no existe físicamente;
- no opera como sede independiente;
- toda la logística se ejecuta desde el Centro de Producción;
- no se prevé razonablemente su implementación.

**Decisión derivada:** debe eliminarse como sede actual o futura del inventario canónico, catálogos, matrices y referencias. La corrección queda vinculada a `OPS-AUD-001`.

---

#### 7. Gerencia General, Administración y Contabilidad

##### 7.1. Gerencia

El trabajo se activa por necesidades, novedades y problemas. No existe un flujo administrativo uniforme. La gerente general actúa como puente entre sedes, propietarios, Contabilidad, auxiliares, proveedores y terceros.

##### 7.2. Efectivo y Contabilidad

Cada sede conserva una base de Caja y entrega a la gerente general el excedente del día anterior junto con el cierre impreso de Makos. Ella cuenta, compara y administra el efectivo según las necesidades del grupo.

Los pagos deberían quedar respaldados por factura y las facturas se cargan al sistema contable.

El problema más habitual es registrar como “gasto” lo que realmente es un retiro de efectivo entregado a la gerente general. El movimiento real es una transferencia de custodia, no un gasto definitivo.

**Remisiones:** `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 8. Programación, asistencia, propinas y nómina

La gerente general y la gerente de Vento Café definen los horarios de todas las sedes. Vento Café aporta la mayor parte del personal rotativo.

Los turnos se publican en VISO. El trabajador los consulta en ANIMA; no debe aceptarlos. Al llegar hace check-in, que constituye el registro oficial de asistencia.

La gerente general descarga informes de retrasos y ausencias.

Las propinas no ingresan al sistema contable ni a Vento OS. Se calculan manualmente, se aplican ajustes por retrasos o ausencias y se entregan en efectivo. No queda registro formal del valor original, descuento, motivo y valor final.

La nómina formal se carga en Bancolombia Nóminas.

---

#### 9. Marketing

Las solicitudes provienen de Nathalia o Jeo y llegan verbalmente o por WhatsApp. No existe calendario, sistema formal de tareas ni criterios estables de objetivo, prioridad, fecha o formato.

Las historias normalmente no requieren aprobación previa. Las publicaciones permanentes deben ser aprobadas por Nathalia o Jeo. Publica quien creó la pieza.

El bloqueo principal es la expectativa creativa subjetiva y no documentada, lo que dificulta medir rendimiento y ha contribuido a la rotación.

**Pendiente:** validar cómo se comunican las correcciones (`OPS-AUD-015`).

---

#### 10. Compras y proveedores

Existen compras semanales, pero las necesidades se determinan principalmente preguntando a las áreas qué falta o recibiendo avisos.

La gerente general consolida la lista. Ella o Leidy realizan el pedido por WhatsApp. El proveedor confirma cantidades, precios y fecha.

La mayoría entrega en el Centro de Producción.

La excepción es el fruver, que llega directamente a Vento Café y lo recibe Cocina o Barra según lo solicitado. Molka no usa fruver. Se presume que Vento Café redistribuye parte a Saudo.

**Problema central:** sin inventario confiable no se sabe qué comprar ni cuánto.

**Pendientes:** ruta exacta de fruver, comparación contra factura, diferencias de calidad/cantidad y llegada de soportes (`OPS-AUD-015`).

---

#### 11. Vaila Vainilla

Información confirmada:

- unidad activa;
- Shopify es el canal principal;
- también recibe pedidos por WhatsApp y redes;
- Jeo recibe y administra;
- existe stock amplio;
- la trabajadora de ventas en línea empaca;
- los pedidos se acumulan;
- una mensajería recoge en la oficina;
- la trabajadora entrega los paquetes.

**Pendientes directos con Jeo y la responsable:** control de inventario, criterio de despacho, guías, notificación, demoras, devoluciones y entregas fallidas (`OPS-AUD-015`).

---

#### 12. Jefatura de Operaciones, desarrollo y soporte

El trabajo principal actual es el desarrollo de aplicaciones. Los incidentes tecnológicos tienen prioridad y se reportan por WhatsApp o verbalmente.

Se atienden computadores, impresoras, cámaras, sonido, redes y otros equipos. El desarrollo se pausa hasta resolver.

No queda registro del incidente, causa, solución o activo afectado.

**Brecha:** pérdida de historial técnico (`OPS-AUD-013`).

---

#### 13. Gestión laboral, inducción y accesos

Las vacantes se publican en Instagram. La gerente general filtra hojas de vida, llama y entrevista. El candidato pasa por un período de prueba. Evalúan el responsable del área, la gerente general y Nathalia. Si aprueban, se remite a la empresa externa de abogados para formalización.

La inducción se realiza trabajando con el equipo. Acompaña quien esté disponible. En Vento Café participa directamente su gerente. No existe documento obligatorio, lista de capacidades ni evidencia de aprendizaje.

Gerencia solicita al Jefe de Operaciones crear cuentas de ANIMA y Vento OS. Makos utiliza cuentas compartidas por función o área, no por persona.

La baja debería notificarse, pero el Jefe de Operaciones suele descubrir el retiro durante la operación y después desactiva manualmente.

**Riesgo:** accesos activos después del retiro y trazabilidad limitada.

---

#### 14. Mantenimiento

El modelo predominante es correctivo. Cuando aparece una falla, se informa a la gerente general, quien contacta al técnico.

Los retrasos principales son:

- técnico no disponible;
- repuesto difícil de conseguir.

**Pendiente:** confirmar el circuito de factura y soporte contable (`OPS-AUD-015`).

---

#### 15. Hallazgos transversales

1. **Polivalencia real.** El trabajador efectivo puede desempeñar varias funciones según la carga.
2. **Cuentas y dispositivos compartidos.** El sistema identifica el área, no siempre a la persona.
3. **WhatsApp y comunicación verbal.** Sostienen procesos críticos sin estructura.
4. **La operación física es la fuente real de verdad.** Vitrina, conteos, memoria y observación prevalecen sobre sistemas.
5. **Alta centralización en Gerencia General.**
6. **Inventario no confiable.** Recepciones, retiros y producción no se registran completamente.
7. **Trazabilidad posterior limitada.**
8. **Cuellos de botella físicos.** Hornos, fermentaciones, dotación, insumos, técnicos y repuestos.

---

#### 16. Cierre propuesto

La cobertura representativa inicial está completa. La siguiente acción no es profundizar indefinidamente esta entrevista, sino validar las fichas con los responsables reales y consolidar correcciones mediante `OPS-AUD-015`.

**Estado:** APROBADO  
No se marca como aprobada hasta recibir la instrucción explícita `APROBADO`.


### ✅ OPS-AUD-004 — Inventariar procesos ejecutados en papel

**Estado:** APROBADO 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de procesos soportados total o parcialmente en papel  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** información operativa consolidada en `OPS-AUD-001` a `OPS-AUD-003`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando la evidencia no sea suficiente

---

#### 1. Propósito

Inventariar los procesos actuales de Vento Group que utilizan papel como:

- fuente primaria de información;
- soporte operativo;
- evidencia de una transacción;
- medio de entrega entre áreas;
- respaldo temporal;
- comprobante para clientes, proveedores, Gerencia o Contabilidad.

Esta tarea no diseña el proceso objetivo ni concluye que el papel deba conservarse.

```text
PAPEL ACTUAL
→ evidencia del proceso AS-IS

PAPEL ACTUAL
≠ requisito obligatorio del sistema TO-BE
```

El inventario deberá permitir identificar posteriormente:

- qué información nace en papel;
- qué información se imprime desde un sistema;
- qué soporte se firma o entrega;
- quién conserva el documento;
- qué efecto operativo depende de ese papel;
- dónde existe doble digitación;
- dónde se pierde trazabilidad;
- qué soporte deberá digitalizarse, reemplazarse o conservarse por obligación.

---

#### 2. Alcance

Incluye:

- cierres impresos;
- facturas físicas;
- comprobantes entregados al cliente;
- resúmenes de cuenta;
- hojas manuales de merma;
- remisiones físicas utilizadas como apoyo o respaldo;
- soportes físicos de pagos y reparaciones;
- documentos trasladados entre sedes, Gerencia y Contabilidad;
- cualquier proceso cuyo avance dependa de recibir, firmar, revisar o archivar un documento físico.

No incluye todavía:

- WhatsApp, correo, Excel, Shopify, Makos, Rappi, ManyChat u otras herramientas digitales, salvo cuando producen una impresión física;
- diseño detallado de formularios;
- estructura definitiva de campos;
- flujo completo paso a paso;
- excepciones, correcciones o anulaciones;
- reglas de aprobación;
- medición de volumen;
- arquitectura documental;
- digitalización;
- implementación.

Destinos documentales:

| Tema                                               | Tarea propietaria |
| -------------------------------------------------- | ----------------- |
| Herramientas digitales y canales                   | `OPS-AUD-005`     |
| Inventario detallado de formularios y comprobantes | `OPS-AUD-006`     |
| Flujo ordinario                                    | `OPS-AUD-007`     |
| Excepciones y reversión                            | `OPS-AUD-008`     |
| Aprobaciones y controles                           | `OPS-AUD-009`     |
| Frecuencia, volumen y tiempos                      | `OPS-AUD-010`     |
| Dependencias                                       | `OPS-AUD-011`     |
| Doble digitación y conciliación                    | `OPS-AUD-012`     |
| Pérdida de trazabilidad                            | `OPS-AUD-013`     |
| Contingencias                                      | `OPS-AUD-014`     |
| Confirmación con responsables                      | `OPS-AUD-015`     |

---

#### 3. Criterios de clasificación

##### 3.1. Tipo de uso del papel

| Código         | Tipo                 | Definición                                                            |
| -------------- | -------------------- | --------------------------------------------------------------------- |
| `ORIGEN`       | Fuente primaria      | La información se registra inicialmente en papel                      |
| `SALIDA`       | Impresión de sistema | El documento se genera desde una aplicación                           |
| `SOPORTE`      | Evidencia            | Respalda una compra, pago, recepción o movimiento                     |
| `TRASPASO`     | Entrega física       | Transporta información entre personas o áreas                         |
| `CONTROL`      | Revisión manual      | Permite comparar, contar, firmar o conciliar                          |
| `ARCHIVO`      | Conservación         | Se almacena como evidencia histórica                                  |
| `CONTINGENCIA` | Respaldo temporal    | Se usa cuando el proceso digital no está disponible o no es confiable |

##### 3.2. Estado de evidencia

| Estado               | Significado                                                                      |
| -------------------- | -------------------------------------------------------------------------------- |
| `CONFIRMADO`         | Descrito directamente y con uso actual conocido                                  |
| `CONFIRMADO_PARCIAL` | Existe evidencia suficiente, pero falta precisar custodia, frecuencia o vigencia |
| `PROBABLE`           | El soporte suele existir, pero no fue confirmado de forma directa                |
| `TRANSITORIO`        | Se utiliza durante una implementación o período de coexistencia                  |
| `POR_VALIDAR`        | Debe ser confirmado en `OPS-AUD-015`                                             |

---

#### 4. Inventario consolidado de procesos ejecutados o soportados en papel

| Código   | Proceso                                       | Sede o área                     | Documento o soporte físico                                             | Uso                                         | Estado               |
| -------- | --------------------------------------------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------- | -------------------- |
| `PAP-01` | Cierre diario de caja                         | Vento Café, Saudo y Molka       | Cierre impreso de Makos                                                | `SALIDA`, `CONTROL`, `TRASPASO`, `ARCHIVO`  | `CONFIRMADO`         |
| `PAP-02` | Entrega de efectivo a Gerencia                | Sedes → Gerencia General        | Cierre impreso entregado junto con el excedente de caja                | `CONTROL`, `TRASPASO`, `SOPORTE`            | `CONFIRMADO`         |
| `PAP-03` | Recepción de proveedores                      | Centro de Producción            | Factura física o documento entregado por el proveedor                  | `SOPORTE`, `CONTROL`, `TRASPASO`, `ARCHIVO` | `CONFIRMADO`         |
| `PAP-04` | Firma de recepción                            | Centro de Producción            | Factura o copia firmada por quien recibe                               | `CONTROL`, `SOPORTE`                        | `CONFIRMADO`         |
| `PAP-05` | Entrega documental a Gerencia                 | Centro de Producción → Gerencia | Factura física conservada y transportada                               | `TRASPASO`, `ARCHIVO`                       | `CONFIRMADO`         |
| `PAP-06` | Soporte de pagos realizados en efectivo       | Gerencia / Contabilidad         | Factura o comprobante físico del gasto                                 | `SOPORTE`, `CONTROL`, `ARCHIVO`             | `CONFIRMADO`         |
| `PAP-07` | Registro de mermas                            | Sedes y áreas operativas        | Hoja manual de mermas                                                  | `ORIGEN`, `CONTROL`, `ARCHIVO`              | `CONFIRMADO`         |
| `PAP-08` | Resumen de cuenta para cliente                | Vento Café y Saudo              | Resumen no fiscal impreso desde Makos                                  | `SALIDA`, `TRASPASO`                        | `CONFIRMADO`         |
| `PAP-09` | Factura legal de venta                        | Vento Café, Saudo y Molka       | Factura impresa entregada al cliente                                   | `SALIDA`, `SOPORTE`, `TRASPASO`             | `CONFIRMADO`         |
| `PAP-10` | Comandas de cocina                            | Vento Café                      | Comanda impresa desde Makos                                            | `SALIDA`, `TRASPASO`, `CONTROL`             | `CONFIRMADO`         |
| `PAP-11` | Comandas de Bar y Barra                       | Vento Café                      | Comandas impresas y separadas por estación                             | `SALIDA`, `TRASPASO`, `CONTROL`             | `CONFIRMADO`         |
| `PAP-12` | Comandas disponibles pero no utilizadas       | Saudo                           | Impresora existente, sin uso ordinario actual                          | `SALIDA` potencial                          | `CONFIRMADO`         |
| `PAP-13` | Remisión física paralela durante transición   | Producción, logística y sedes   | Hoja física de remisión utilizada junto con el sistema durante pruebas | `CONTINGENCIA`, `CONTROL`, `TRASPASO`       | `TRANSITORIO`        |
| `PAP-14` | Soporte de reparaciones y mantenimiento       | Gerencia General                | Factura o comprobante del técnico                                      | `SOPORTE`, `ARCHIVO`                        | `PROBABLE`           |
| `PAP-15` | Hojas de vida o documentos laborales impresos | Gerencia General                | Documentos físicos asociados a selección o contratación                | `SOPORTE`, `ARCHIVO`                        | `POR_VALIDAR`        |
| `PAP-16` | Etiquetas o marcaciones físicas existentes    | Centro de Producción y Bodega   | Rótulos de productos, estantes o ubicaciones                           | `CONTROL`, `TRASPASO` de información visual | `CONFIRMADO_PARCIAL` |

---

#### 5. Procesos confirmados

##### 5.1. Cierre diario y entrega de efectivo

Cada sede conserva una base de caja y entrega a la gerente general el excedente del día anterior.

El traspaso incluye:

```text
EFECTIVO
+
CIERRE IMPRESO DE MAKOS
        ↓
REVISIÓN Y CONTEO POR GERENCIA GENERAL
```

La gerente general:

- recibe el dinero;
- cuenta el efectivo;
- compara el valor con el cierre impreso;
- conserva o administra los recursos según las necesidades del grupo.

Hallazgos:

- el documento impreso funciona como soporte de conciliación;
- la entrega física no cuenta con una trazabilidad digital integral confirmada;
- algunos retiros se registran erróneamente como gasto cuando realmente representan transferencia de custodia;
- el detalle de diferencias, firma, responsable y conservación deberá desarrollarse en `OPS-AUD-006`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.2. Recepción de proveedores y facturas

Cuando el Jefe de Operaciones recibe mercancía en el Centro de Producción:

1. revisa visualmente los productos;
2. organiza o dirige su ubicación;
3. contrasta lo recibido con la factura;
4. firma el documento;
5. entrega una copia al proveedor cuando corresponde;
6. conserva la otra copia;
7. la factura física llega posteriormente a Gerencia.

El soporte físico cumple simultáneamente funciones de:

- verificación;
- aceptación;
- evidencia de recepción;
- traspaso entre Centro de Producción y Gerencia;
- soporte contable.

Brechas vinculadas:

- recepción realizada por otras personas sin procedimiento confirmado: `OPS-AUD-009` y `OPS-AUD-015`;
- ruta y custodia del documento: `OPS-AUD-011` y `OPS-AUD-013`;
- comparación detallada contra pedido y diferencias: `OPS-AUD-007` y `OPS-AUD-008`;
- posible digitación posterior al sistema contable: `OPS-AUD-012`.

##### 5.3. Soportes de pagos y gastos

Los pagos efectuados con efectivo administrado por Gerencia deberían estar respaldados por factura.

Las facturas deben llegar al sistema contable, pero el proceso actual combina:

```text
PAGO FÍSICO
→ FACTURA O COMPROBANTE
→ ENTREGA O CUSTODIA MANUAL
→ CARGA POSTERIOR AL SISTEMA CONTABLE
```

La ausencia de una factura se detecta posteriormente durante conciliación.

El papel es actualmente evidencia necesaria, pero no garantiza por sí solo:

- vinculación con el retiro de efectivo;
- identificación de quien realizó el pago;
- relación con sede, área o centro de costo;
- fecha de entrega a Contabilidad;
- estado de carga al sistema;
- detección inmediata de soportes faltantes.

Estos puntos corresponden a `OPS-AUD-006`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.4. Hoja manual de mermas

Cuando un trabajador identifica un producto dañado:

- evalúa olor, sabor, moho o defecto físico;
- decide desecharlo;
- realiza la disposición;
- registra producto y cantidad en una hoja manual de mermas.

La misma persona puede:

```text
DETECTAR
→ DECIDIR
→ DESECHAR
→ REGISTRAR
```

El papel constituye la fuente primaria del registro.

Riesgos identificados:

- ausencia de segunda validación;
- fecha, lote, causa y responsable no confirmados;
- posible pérdida o deterioro de la hoja;
- digitación posterior no confirmada;
- falta de vínculo con inventario;
- dificultad para consolidar por sede, producto o causa.

Destinos:

- estructura del formato: `OPS-AUD-006`;
- flujo ordinario: `OPS-AUD-007`;
- correcciones o anulaciones: `OPS-AUD-008`;
- segregación de funciones: `OPS-AUD-009`;
- doble digitación: `OPS-AUD-012`;
- trazabilidad: `OPS-AUD-013`.

##### 5.5. Resúmenes de cuenta y facturas al cliente

En Vento Café y Saudo cualquier trabajador autorizado operativamente puede imprimir un resumen no fiscal para el cliente.

Después del pago, Caja cierra la cuenta y genera la factura legal impresa.

```text
RESUMEN
→ INFORMACIÓN PREVIA AL PAGO

FACTURA LEGAL
→ SOPORTE POSTERIOR AL CIERRE
```

El resumen y la factura cumplen propósitos distintos y no deben tratarse como el mismo documento.

El inventario detallado de:

- contenido;
- numeración;
- copias;
- impresora;
- conservación;
- reimpresión;
- anulaciones;
- entrega al cliente;

corresponde a `OPS-AUD-006` y `OPS-AUD-008`.

##### 5.6. Comandas impresas en Vento Café

Makos imprime comandas físicas para:

- Cocina;
- Bar;
- Barra.

Las comandas:

- trasladan el pedido desde el punto de registro hacia la estación;
- permiten ordenar la preparación;
- se colocan en una comandera o cola física;
- se distribuyen por impresora según el producto.

En Cocina, el cocinero más cercano recoge la comanda y la ubica en la comandera.

En Bar y Barra, Makos divide la orden entre dos impresoras según la estación.

El papel es parte directa de la ejecución operativa.

Brechas:

- no existe confirmación digital de recepción, inicio, terminación o entrega;
- una orden puede quedar dividida entre estaciones;
- la pérdida, duplicación o falta de impresión no tiene trazabilidad confirmada;
- el tratamiento de reimpresiones y modificaciones corresponde a `OPS-AUD-008`;
- rutas y colas de impresión deberán diseñarse en BLOQUE E4, sin anticiparse en esta tarea.

##### 5.7. Impresora de comandas no utilizada en Saudo

Saudo cuenta con una impresora, pero el proceso ordinario no utiliza comandas impresas.

Los pedidos se comunican verbalmente y Cocina consulta Makos cuando existen varias órdenes.

Este caso se registra porque demuestra:

```text
INFRAESTRUCTURA FÍSICA EXISTENTE
≠
PROCESO REALMENTE UTILIZADO
```

La impresora no debe considerarse evidencia de que exista un proceso en papel activo.

La razón técnica u operativa de su no utilización corresponde a:

- `OPS-AUD-005`;
- `OPS-AUD-011`;
- `CODE-AUD-016`;
- BLOQUE E4.

##### 5.8. Remisión física paralela durante pruebas

Existe evidencia operativa de utilización de una hoja física de remisión en paralelo con la aplicación durante etapas de prueba, con el propósito de no afectar el flujo ordinario mientras el inventario digital no sea autoritativo.

Este proceso se clasifica como `TRANSITORIO` y `CONTINGENCIA`.

No se asume que siga siendo la fuente primaria actual para todas las sedes.

Debe validarse en `OPS-AUD-015`:

- si continúa vigente;
- en qué sedes;
- quién la diligencia;
- quién la firma;
- si acompaña físicamente la mercancía;
- dónde se archiva;
- si se compara contra Excel, Makos o Vento OS.

El tratamiento objetivo de transición deberá definirse en E5, no en esta tarea.

---

#### 6. Soportes probables o pendientes de confirmación

##### 6.1. Reparaciones y mantenimiento

La gerente general contacta al técnico cuando se presenta una falla.

Es probable que la factura o comprobante físico llegue a Gerencia y después a Contabilidad, pero esta ruta no fue confirmada directamente.

Estado:

```text
EXISTENCIA DEL MANTENIMIENTO
→ CONFIRMADA

CIRCUITO DEL SOPORTE FÍSICO
→ POR VALIDAR EN OPS-AUD-015
```

##### 6.2. Documentos laborales

La selección y contratación involucran:

- hojas de vida;
- período de prueba;
- remisión de información a abogados;
- formalización contractual.

No existe evidencia suficiente para afirmar qué documentos se imprimen, quién conserva originales o cómo se trasladan.

Se mantiene como `POR_VALIDAR` en `OPS-AUD-015`.

##### 6.3. Etiquetas y marcaciones físicas

En Bodega y producción existen productos, estantes o zonas marcadas físicamente.

La marcación ayuda al conductor y trabajadores a ubicar productos, pero todavía no se ha confirmado:

- si son etiquetas impresas o manuscritas;
- su estructura;
- responsable de actualización;
- relación con códigos de ubicación;
- vigencia;
- tratamiento cuando cambia un producto.

El detalle corresponde a `OPS-AUD-006` y `OPS-AUD-015`.

---

#### 7. Exclusiones expresas

No se clasifican como procesos en papel:

- solicitudes creadas en Excel y enviadas como captura;
- mensajes de WhatsApp;
- órdenes registradas únicamente en Makos;
- turnos publicados en VISO y consultados en ANIMA;
- pedidos recibidos por Shopify, Rappi o ManyChat;
- listas en teléfonos;
- información memorizada;
- tableros o pizarras de producción.

Estos elementos serán tratados principalmente en `OPS-AUD-005` y `OPS-AUD-006`.

Una captura impresa o una hoja generada desde Excel solo entrará en este inventario cuando exista evidencia de uso físico real.

---

#### 8. Hallazgos transversales

##### 8.1. El papel cumple funciones distintas

No todo papel representa el mismo problema.

```text
PAPEL COMO EVIDENCIA LEGAL
≠
PAPEL COMO COLA OPERATIVA
≠
PAPEL COMO FUENTE PRIMARIA
≠
PAPEL COMO CONTINGENCIA
```

El diseño TO-BE deberá decidir por tipo:

- conservar;
- digitalizar;
- reemplazar;
- generar desde el sistema;
- firmar electrónicamente;
- mantener como contingencia.

##### 8.2. La mayor dependencia física está en dinero, compras y producción

Los usos más críticos identificados son:

- cierre y entrega de efectivo;
- facturas de proveedores;
- soportes de pagos;
- hoja de mermas;
- comandas impresas;
- factura entregada al cliente.

##### 8.3. El papel no garantiza trazabilidad

Un documento puede existir y aun así no registrar:

- actor efectivo;
- fecha y hora exactas;
- sede;
- área;
- estado;
- aprobación;
- modificación;
- entrega;
- carga al sistema;
- pérdida o duplicación.

##### 8.4. Existen procesos híbridos

Varios procesos combinan:

```text
SISTEMA
→ IMPRESIÓN
→ EJECUCIÓN FÍSICA
→ ENTREGA MANUAL
→ REGISTRO DIGITAL POSTERIOR
```

Estos casos serán prioritarios para `OPS-AUD-012`.

##### 8.5. El papel transitorio no debe convertirse automáticamente en diseño permanente

La coexistencia entre remisión física y aplicación durante pruebas responde a una necesidad de control de riesgo.

No implica que el sistema objetivo deba conservar doble registro indefinidamente.

---

#### 9. Matriz de destino de hallazgos

| Hallazgo                                                                  | Tarea exacta                  |
| ------------------------------------------------------------------------- | ----------------------------- |
| Campos y estructura de cada documento                                     | `OPS-AUD-006`                 |
| Quién crea, firma, recibe y archiva                                       | `OPS-AUD-007` y `OPS-AUD-009` |
| Anulación, corrección, reimpresión o pérdida                              | `OPS-AUD-008`                 |
| Frecuencia y volumen de impresiones                                       | `OPS-AUD-010`                 |
| Traslado entre sedes, Gerencia y Contabilidad                             | `OPS-AUD-011`                 |
| Digitación posterior desde papel                                          | `OPS-AUD-012`                 |
| Documentos sin actor, estado o custodia                                   | `OPS-AUD-013`                 |
| Uso del papel ante caída de sistemas                                      | `OPS-AUD-014`                 |
| Vigencia real de remisiones físicas, mantenimiento y documentos laborales | `OPS-AUD-015`                 |
| Arquitectura futura de impresión                                          | BLOQUE E4                     |
| Estrategia de transición y retiro                                         | BLOQUE E5                     |

---

#### 10. Decisiones propuestas

1. El inventario de papel se limita a procesos con evidencia operativa suficiente.
2. El papel actual se considera evidencia AS-IS y no requisito automático del diseño TO-BE.
3. El cierre impreso de Makos es soporte actual de la entrega de efectivo a Gerencia.
4. Las facturas físicas soportan recepción de proveedores, pagos y archivo contable.
5. La hoja manual de mermas constituye una fuente primaria no integrada al inventario.
6. Los resúmenes de cuenta y facturas legales son documentos distintos.
7. Las comandas impresas forman parte del proceso ordinario de Vento Café.
8. La existencia de una impresora en Saudo no prueba uso efectivo de comandas.
9. La remisión física paralela se clasifica como mecanismo transitorio o de contingencia, no como modelo definitivo.
10. Los soportes de mantenimiento, documentos laborales y características de etiquetas físicas quedan expresamente vinculados a `OPS-AUD-015`.
11. Ninguna decisión de esta tarea autoriza digitalización, eliminación de documentos, cambios de proceso, código, migraciones o modificaciones en Supabase.
12. La decisión de conservar o reemplazar cada soporte se tomará después del diseño TO-BE y de revisar requisitos legales, contables y operativos.

---

#### 11. Criterios de aceptación

`OPS-AUD-004` podrá aprobarse cuando se confirme que:

- los procesos actuales soportados en papel están inventariados;
- se diferencia entre fuente primaria, impresión de sistema, soporte, traspaso, control, archivo y contingencia;
- los cierres impresos, facturas, mermas, resúmenes, facturas de venta y comandas están registrados;
- los elementos probables no se presentan como confirmados;
- el uso transitorio de remisiones físicas no se convierte en requisito permanente;
- los procesos digitales permanecen reservados para `OPS-AUD-005`;
- la estructura detallada de formularios permanece reservada para `OPS-AUD-006`;
- cada brecha y duda tiene un destino documental exacto;
- no se ha diseñado el proceso TO-BE;
- no se ha autorizado implementación.

---

#### 12. Resultado y continuidad

Con la aprobación de `OPS-AUD-004` quedará establecida la línea base inicial de:

- procesos cuyo origen está en papel;
- documentos impresos desde sistemas;
- soportes físicos de recepción, pagos y ventas;
- documentos trasladados entre sedes y Gerencia;
- registros manuales no integrados;
- papeles transitorios o de contingencia;
- documentos cuya vigencia o custodia debe validarse.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-005
— Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas
```

`OPS-AUD-005` deberá reutilizar este inventario para identificar procesos híbridos, duplicaciones entre papel y herramientas digitales y puntos de conciliación, sin modificar silenciosamente las decisiones aprobadas en `OPS-AUD-004`.



### ✅ OPS-AUD-005 — Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas

**Estado:** APROBADO  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de procesos ejecutados total o parcialmente mediante herramientas digitales externas, aplicaciones actuales y canales no integrados  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** información consolidada en `OPS-AUD-001` a `OPS-AUD-004`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando la evidencia no sea suficiente

---

#### 1. Propósito

Inventariar las herramientas digitales y canales actuales que participan en la operación de Vento Group, determinando:

- qué proceso soporta cada herramienta;
- quién la utiliza;
- qué información recibe o produce;
- si funciona como fuente primaria, apoyo, canal, registro o sistema de ejecución;
- si la información se transcribe posteriormente;
- si existe duplicación con papel u otra plataforma;
- si el proceso depende de cuentas compartidas;
- si la herramienta conserva trazabilidad suficiente;
- si el dato queda aislado, fragmentado o sin propietario claro.

Esta tarea documenta la realidad actual.

```text
HERRAMIENTA ACTUAL
→ evidencia del proceso AS-IS

HERRAMIENTA ACTUAL
≠ arquitectura obligatoria del sistema TO-BE
```

La existencia de WhatsApp, Excel, Makos, Shopify, Rappi, ManyChat, VISO, ANIMA u otra plataforma no implica que:

- deba conservarse como fuente de verdad;
- deba integrarse de forma permanente;
- pueda sustituir al propietario empresarial del proceso;
- sus cuentas compartidas sean aceptables en el modelo objetivo;
- sus estados sean suficientes para Vento OS.

---

#### 2. Alcance

Incluye:

- WhatsApp;
- correo electrónico;
- Excel;
- Makos;
- Rappi;
- ManyChat;
- Shopify;
- VISO;
- ANIMA;
- sistema contable;
- Bancolombia Nóminas;
- Instagram y otras redes sociales;
- notas, fotografías, capturas y archivos en teléfonos;
- herramientas técnicas utilizadas para soporte o coordinación;
- cualquier plataforma externa o interna que reciba, transforme, almacene o transmita información operativa.

No incluye todavía:

- estructura detallada de formularios o archivos;
- campos exactos de cada Excel;
- diseño de mensajes;
- flujo completo paso a paso;
- excepciones, anulaciones o reversiones;
- definición de integraciones;
- selección de herramientas futuras;
- contratos de API;
- propiedad definitiva de datos;
- arquitectura TO-BE;
- implementación.

Destinos documentales:

| Tema                                                    | Tarea propietaria |
| ------------------------------------------------------- | ----------------- |
| Formularios, archivos, remisiones, etiquetas y reportes | `OPS-AUD-006`     |
| Flujo ordinario                                         | `OPS-AUD-007`     |
| Excepciones, correcciones y reversión                   | `OPS-AUD-008`     |
| Aprobaciones y segregación                              | `OPS-AUD-009`     |
| Frecuencia, volumen, tiempos y criticidad               | `OPS-AUD-010`     |
| Dependencias entre herramientas y actores               | `OPS-AUD-011`     |
| Doble digitación y conciliación                         | `OPS-AUD-012`     |
| Pérdida de trazabilidad                                 | `OPS-AUD-013`     |
| Contingencias por caída o indisponibilidad              | `OPS-AUD-014`     |
| Validación con responsables                             | `OPS-AUD-015`     |
| Contratos de integración                                | BLOQUE X          |
| Servicios de colas, impresión y notificaciones          | BLOQUE E4         |
| Paquetes de transición, piloto y rollback               | BLOQUE E5         |

---

#### 3. Criterios de clasificación

##### 3.1. Función de la herramienta

| Código          | Función                 | Definición                                              |
| --------------- | ----------------------- | ------------------------------------------------------- |
| `CAPTURA`       | Registro inicial        | La información nace en la herramienta                   |
| `CANAL`         | Comunicación            | Transmite instrucciones, solicitudes o novedades        |
| `EJECUCIÓN`     | Operación               | El proceso se ejecuta directamente en la herramienta    |
| `FUENTE`        | Fuente de verdad actual | La operación consulta el dato como referencia principal |
| `CONSOLIDACIÓN` | Agrupación              | Reúne información de varias personas o áreas            |
| `EVIDENCIA`     | Soporte                 | Conserva prueba o histórico parcial                     |
| `NOTIFICACIÓN`  | Aviso                   | Informa un evento o cambio                              |
| `PAGO`          | Ejecución financiera    | Permite realizar o registrar pagos                      |
| `PUBLICACIÓN`   | Canal externo           | Publica contenido o información a clientes              |
| `SOPORTE`       | Atención técnica        | Se utiliza para reportar o resolver incidentes          |

##### 3.2. Estado de integración

| Estado        | Significado                                                      |
| ------------- | ---------------------------------------------------------------- |
| `AISLADA`     | No comparte datos automáticamente                                |
| `MANUAL`      | Requiere transcripción o copia                                   |
| `PARCIAL`     | Existe alguna conexión, pero el proceso sigue incompleto         |
| `INTEGRADA`   | Intercambio automático confirmado                                |
| `DESCONOCIDA` | No existe evidencia suficiente                                   |
| `LEGACY`      | Herramienta vigente, pero contractual o técnicamente provisional |

##### 3.3. Identidad del usuario

| Estado          | Significado                                     |
| --------------- | ----------------------------------------------- |
| `INDIVIDUAL`    | La cuenta identifica a una persona concreta     |
| `COMPARTIDA`    | Varias personas utilizan la misma cuenta        |
| `MIXTA`         | Combina cuentas individuales y compartidas      |
| `NO_CONFIRMADA` | No se conoce con precisión                      |
| `EXTERNA`       | La identidad pertenece a un tercero o proveedor |

---

#### 4. Inventario maestro de herramientas

| Código   | Herramienta                                           | Procesos principales                                                                                | Función                                                 | Integración                        | Identidad                                  |
| -------- | ----------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------- | ------------------------------------------ |
| `DIG-01` | WhatsApp                                              | Remisiones, compras, proveedores, marketing, soporte, personal, mantenimiento, coordinación general | `CANAL`, `CAPTURA`, `NOTIFICACIÓN`, `EVIDENCIA` parcial | `MANUAL`                           | `MIXTA`                                    |
| `DIG-02` | Excel                                                 | Solicitudes de remisión, consolidaciones, reportes administrativos y apoyo de control               | `CAPTURA`, `CONSOLIDACIÓN`, `EVIDENCIA`                 | `AISLADA` / `MANUAL`               | `INDIVIDUAL` o `NO_CONFIRMADA`             |
| `DIG-03` | Makos                                                 | POS, mesas, pedidos, caja, cierres, facturas, comandas y reportes                                   | `EJECUCIÓN`, `FUENTE`, `EVIDENCIA`                      | `LEGACY`, mayormente `AISLADA`     | `COMPARTIDA` por función                   |
| `DIG-04` | Rappi                                                 | Pedidos externos                                                                                    | `CAPTURA`, `CANAL`, `EJECUCIÓN` externa                 | `MANUAL` hacia Makos               | `NO_CONFIRMADA`                            |
| `DIG-05` | ManyChat                                              | Pedidos directos y atención por mensajería                                                          | `CAPTURA`, `CANAL`                                      | `MANUAL` hacia Makos               | `COMPARTIDA` o `NO_CONFIRMADA`             |
| `DIG-06` | Shopify                                               | Ventas de Vaila Vainilla                                                                            | `CAPTURA`, `EJECUCIÓN`, `FUENTE` comercial              | `AISLADA` respecto a Vento OS      | `INDIVIDUAL` / `NO_CONFIRMADA`             |
| `DIG-07` | VISO                                                  | Programación, consulta administrativa y reportes de asistencia                                      | `CAPTURA`, `EJECUCIÓN`, `FUENTE`, `CONSOLIDACIÓN`       | `PARCIAL` con ANIMA                | `INDIVIDUAL`                               |
| `DIG-08` | ANIMA                                                 | Consulta de turnos y check-in                                                                       | `EJECUCIÓN`, `FUENTE`, `NOTIFICACIÓN`                   | `PARCIAL` con VISO y Vento OS      | `INDIVIDUAL`                               |
| `DIG-09` | Sistema contable                                      | Registro financiero, tributario, laboral y bancario                                                 | `EJECUCIÓN`, `FUENTE`, `CONSOLIDACIÓN`, `EVIDENCIA`     | `MANUAL` desde soportes y reportes | `INDIVIDUAL`                               |
| `DIG-10` | Bancolombia Nóminas                                   | Pago de nómina formal                                                                               | `PAGO`, `EJECUCIÓN`, `EVIDENCIA`                        | `MANUAL` desde cálculo previo      | `INDIVIDUAL`                               |
| `DIG-11` | Instagram y redes sociales                            | Vacantes, marketing, ventas y comunicación comercial                                                | `PUBLICACIÓN`, `CANAL`, `CAPTURA`                       | `AISLADA`                          | `COMPARTIDA` / `MIXTA`                     |
| `DIG-12` | Correo electrónico                                    | Intercambio administrativo, legal o contable                                                        | `CANAL`, `EVIDENCIA`                                    | `DESCONOCIDA`                      | `INDIVIDUAL` / `NO_CONFIRMADA`             |
| `DIG-13` | Fotografías y capturas                                | Evidencia de remisiones, producción, faltantes, productos y novedades                               | `CAPTURA`, `CANAL`, `EVIDENCIA` parcial                 | `MANUAL`                           | Depende del teléfono personal o compartido |
| `DIG-14` | Notas en teléfono                                     | Totales, recordatorios y consolidación informal                                                     | `CAPTURA`, `CONSOLIDACIÓN`                              | `AISLADA`                          | `INDIVIDUAL`                               |
| `DIG-15` | Herramientas de soporte técnico                       | Diagnóstico y resolución de computadores, impresoras, cámaras, sonido y redes                       | `SOPORTE`, `EJECUCIÓN`                                  | `AISLADA`                          | `INDIVIDUAL`                               |
| `DIG-16` | Vento OS en pruebas                                   | Remisiones, inventario y procesos operativos parciales                                              | `EJECUCIÓN`, `EVIDENCIA` experimental                   | `PARCIAL` / `LEGACY`               | `INDIVIDUAL` y dispositivos compartidos    |
| `DIG-17` | Aplicación de inventario en tablet o kiosco           | Registro experimental de retiros                                                                    | `CAPTURA`, `EJECUCIÓN` experimental                     | `PARCIAL`                          | `COMPARTIDA` o por trabajador              |
| `DIG-18` | Sistemas o portales de terceros jurídicos y laborales | Contratos y formalización                                                                           | `CANAL`, `EVIDENCIA`, `EJECUCIÓN` externa               | `DESCONOCIDA`                      | `EXTERNA`                                  |

---

#### 5. WhatsApp

##### 5.1. Uso general

WhatsApp funciona actualmente como la principal capa informal de coordinación transversal.

Se utiliza para:

- enviar solicitudes;
- recibir fotografías;
- reportar faltantes;
- coordinar producción;
- realizar pedidos a proveedores;
- confirmar disponibilidad y fechas;
- solicitar domicilios;
- comunicar incidentes;
- pedir soporte técnico;
- solicitar contenido de Marketing;
- informar novedades laborales;
- contactar técnicos;
- coordinar entregas y recolecciones;
- comunicar decisiones operativas.

```text
OPERACIÓN REAL
→ MENSAJE O GRUPO DE WHATSAPP
→ INTERPRETACIÓN HUMANA
→ ACCIÓN MANUAL
```

##### 5.2. Remisiones y producción

Cada área o sede prepara una solicitud en Excel y envía una fotografía o captura al grupo correspondiente.

Participan:

- Servicio de Vento Café;
- Cocina de Vento Café;
- Barra de Vento Café;
- Saudo;
- Molka;
- áreas productivas del Centro de Producción;
- conductor;
- responsables o supervisores.

Las áreas productivas consultan capturas y consolidan cantidades manualmente.

En algunos casos se envían fotografías de:

- cantidades producidas;
- productos extra;
- novedades;
- faltantes;
- productos dejados en frío o mesón.

Hallazgos:

- WhatsApp no estructura el estado de una solicitud;
- no diferencia claramente solicitado, confirmado, producido, despachado y recibido;
- una fotografía puede quedar desactualizada después de un cambio;
- la búsqueda histórica depende del grupo, fecha y memoria;
- no existe vínculo automático con productos, presentaciones, sedes o inventario;
- el silencio no permite distinguir entre leído, aceptado, omitido o rechazado.

Destinos: `OPS-AUD-006`, `OPS-AUD-007`, `OPS-AUD-008`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.3. Compras y proveedores

La gerente general o Leidy realizan pedidos a proveedores mediante WhatsApp.

El proveedor confirma:

- disponibilidad;
- cantidades;
- precios;
- fecha estimada.

La necesidad de compra proviene de:

- preguntas a las áreas;
- avisos de faltantes;
- experiencia;
- urgencias.

Hallazgos:

- el mensaje puede actuar simultáneamente como solicitud, cotización y confirmación;
- no existe separación confirmada entre propuesta, aprobación y orden definitiva;
- no existe vínculo automático con inventario;
- el pedido no se convierte automáticamente en recepción;
- cambios del proveedor pueden quedar dispersos en la conversación;
- el soporte debe reconciliarse posteriormente con factura física.

Destinos: `OPS-AUD-007`, `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-011`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.4. Soporte técnico

Los incidentes tecnológicos se reportan normalmente por WhatsApp o verbalmente.

El Jefe de Operaciones recibe solicitudes relacionadas con:

- computadores;
- impresoras;
- cámaras;
- sonido;
- redes;
- dispositivos;
- aplicaciones.

Después de resolver, no queda un ticket estructurado con:

- activo;
- sede;
- síntoma;
- causa;
- acción aplicada;
- repuesto;
- tiempo;
- responsable;
- resultado.

WhatsApp funciona como canal de entrada, pero no como sistema de gestión de incidentes.

Destino principal: `OPS-AUD-013`.

##### 5.5. Marketing

Nathalia o Jeo solicitan contenido por WhatsApp o verbalmente.

Normalmente no se estructura:

- objetivo;
- audiencia;
- formato;
- prioridad;
- fecha;
- criterio de aprobación;
- responsable;
- estado;
- retroalimentación.

El mensaje puede quedar como instrucción ambigua y la expectativa creativa se completa por interpretación.

Destinos: `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-010`, `OPS-AUD-013` y `OPS-AUD-015`.

##### 5.6. Personal y accesos

Gerencia solicita al Jefe de Operaciones crear cuentas de ANIMA o Vento OS mediante comunicación informal.

No existe un flujo estructurado de:

- alta;
- cambio de cargo;
- cambio de sede;
- cambio de área;
- suspensión;
- retiro;
- baja de accesos.

La ausencia de notificación formal provoca que el retiro pueda descubrirse durante la operación.

Destinos: `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-011`, `OPS-AUD-013` y `OPS-AUD-015`.

##### 5.7. Mantenimiento

La falla se informa a la gerente general y ella contacta al técnico.

WhatsApp puede intervenir para:

- describir la falla;
- enviar fotografías;
- coordinar visita;
- consultar repuestos;
- confirmar disponibilidad.

No existe historial consolidado del activo ni de la reparación.

Destinos: `OPS-AUD-011`, `OPS-AUD-013` y `OPS-AUD-015`.

---

#### 6. Excel

##### 6.1. Solicitudes de remisión

Excel se utiliza como formato de solicitud por sede o área.

Proceso conocido:

```text
TRABAJADOR RESPONSABLE
→ ABRE O EDITA EXCEL
→ REGISTRA CANTIDADES
→ TOMA CAPTURA O FOTOGRAFÍA
→ ENVÍA AL GRUPO
```

Vento Café separa solicitudes de:

- Servicio;
- Cocina;
- Barra.

Saudo y Molka realizan una solicitud única por sede.

Hallazgos:

- el archivo no es necesariamente el artefacto que recibe producción; con frecuencia se recibe una imagen;
- la versión definitiva puede no estar identificada;
- no existe control automático de producto, presentación o cantidad mínima;
- no existe confirmación de recepción;
- la consolidación se realiza manualmente;
- el dato no afecta inventario;
- el archivo no acompaña automáticamente el estado posterior.

##### 6.2. Reportes y consolidaciones administrativas

Gerencia y Contabilidad reciben o utilizan Excel para reportes y consolidaciones.

Se ha confirmado la recepción de:

- archivos o reportes operativos;
- información combinada con cierres de Makos;
- necesidades de compra;
- información administrativa.

No se ha confirmado un catálogo único de archivos, propietarios, ubicaciones o versiones.

Destino: `OPS-AUD-006` y `OPS-AUD-015`.

##### 6.3. Limitaciones transversales de Excel

- archivos duplicados;
- copias locales;
- versiones no identificadas;
- uso de capturas en lugar del archivo;
- ausencia de validaciones maestras;
- nombres escritos de forma variable;
- consolidación manual;
- dificultad de auditoría;
- ausencia de relación con IDs canónicos;
- posibilidad de sobrescritura;
- dependencia de conocimiento del usuario.

La estructura de cada archivo se inventariará en `OPS-AUD-006`.

---

#### 7. Makos

##### 7.1. Funciones actuales

Makos soporta:

- apertura y cierre de caja;
- base inicial;
- registro de ventas;
- mesas;
- pedidos adicionales;
- cuentas abiertas;
- medios de pago;
- facturas;
- resúmenes;
- comandas;
- reportes;
- pedidos clasificados como Rappi o Domicilio.

##### 7.2. Uso por sede

**Vento Café**

- Caja utiliza una cuenta operativa.
- Servicio utiliza una cuenta compartida.
- Los meseros registran mesas desde tablet.
- Makos imprime comandas de Cocina, Bar y Barra.
- Caja registra el pago y cierra la cuenta.

**Saudo**

- El mesero utiliza tablet o celular.
- Cocina consulta Makos.
- La comunicación principal con Cocina es verbal.
- Existe impresora, pero no se utiliza ordinariamente.

**Molka**

- La persona registra, cobra y luego consulta Makos para preparar.
- No existen comandas impresas como flujo ordinario.

##### 7.3. Identidad y cuentas compartidas

Makos no identifica de forma consistente al trabajador efectivo.

La configuración exacta debe validarse, pero se conoce que:

- existen cuentas operativas compartidas;
- una cuenta puede representar Caja o Servicio;
- el registro permite atribuir una acción a una función, no necesariamente a una persona;
- varios trabajadores pueden utilizar el mismo dispositivo o sesión.

Esto produce:

```text
ACCIÓN REGISTRADA
→ FUNCIÓN O CUENTA OPERATIVA CONOCIDA

PERSONA EFECTIVA
→ NO SIEMPRE DETERMINABLE
```

Destino: `OPS-AUD-009`, `OPS-AUD-013` y `OPS-AUD-015`.

##### 7.4. Limitaciones conocidas

- no refleja correctamente productos agotados;
- Rappi y ManyChat requieren transcripción;
- el pago con datáfono puede comunicarse verbalmente;
- no registra listo, recogido y entregado;
- no identifica al mesero efectivo;
- no integra inventario confiable;
- no registra el flujo interno completo;
- no reemplaza las necesidades de Vento OS;
- su papel futuro debe definirse mediante BLOQUE X y el contrato temporal de POS externo.

---

#### 8. Rappi y ManyChat

##### 8.1. Rappi

Rappi recibe el pedido del cliente.

Caja:

1. consulta el pedido;
2. lo transcribe manualmente a Makos;
3. lo clasifica como Rappi;
4. coordina la preparación;
5. entrega al domiciliario.

No existe integración automática confirmada.

Riesgos:

- doble digitación;
- diferencia entre pedido original y pedido transcrito;
- cambios o cancelaciones no sincronizados;
- estados distintos entre plataformas;
- conciliación manual;
- identidad del operador no siempre individual.

##### 8.2. ManyChat

ManyChat se mantiene abierto en el computador de Caja para recibir pedidos directos.

Caja transcribe el pedido a Makos como Domicilio.

El proceso puede incluir:

- datos del cliente;
- dirección;
- teléfono;
- método de pago;
- coordinación de mensajería;
- aviso de salida.

No existe evidencia de integración automática con Makos, inventario o logística.

Destinos comunes: `OPS-AUD-007`, `OPS-AUD-008`, `OPS-AUD-011`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 9. Shopify y operación de Vaila Vainilla

Shopify es el canal principal de venta de Vaila Vainilla.

Jeo recibe, revisa y gestiona los pedidos.

La trabajadora de ventas en línea:

- empaca;
- agrupa pedidos;
- entrega paquetes a la mensajería.

Información no confirmada:

- fuente real de inventario;
- descuento de stock;
- generación de guía;
- sincronización con mensajería;
- notificación al cliente;
- tratamiento de devoluciones;
- conciliación de pagos;
- exportación a Contabilidad.

Estos puntos se mantienen en `OPS-AUD-015`.

Shopify se clasifica como fuente comercial actual de Vaila Vainilla, pero no como fuente canónica aprobada de inventario, clientes o finanzas para todo Vento Group.

---

#### 10. VISO y ANIMA

##### 10.1. VISO

VISO se utiliza para:

- crear o publicar horarios;
- consultar información administrativa;
- obtener reportes de asistencia;
- apoyar la gestión de trabajadores.

La gerente general y la gerente de Vento Café definen los horarios.

##### 10.2. ANIMA

ANIMA permite al trabajador:

- recibir notificación;
- consultar turno;
- ver sede y horario;
- realizar check-in.

El trabajador no confirma formalmente la aceptación del turno.

##### 10.3. Relación actual

```text
GERENCIA
→ PUBLICA EN VISO
→ TRABAJADOR CONSULTA EN ANIMA
→ REALIZA CHECK-IN
→ GERENCIA DESCARGA REPORTE
```

La relación es parcial y no cubre integralmente:

- aceptación;
- cambio de turno;
- ausencia justificada;
- reemplazo;
- baja laboral;
- baja de acceso;
- efecto económico de propinas;
- rol operativo efectivo;
- dispositivo compartido.

Los contratos objetivo deberán definirse en BLOQUES F, G, H2 y X.

---

#### 11. Sistema contable y Bancolombia Nóminas

##### 11.1. Sistema contable

El sistema contable recibe información:

- financiera;
- tributaria;
- laboral;
- bancaria;
- facturas;
- soportes de gastos;
- datos de cierre.

La carga depende de documentos, Excel, reportes de Makos y procesos manuales.

No existe evidencia de integración automática completa con:

- Makos;
- inventario;
- compras;
- producción;
- Vento OS;
- propinas.

##### 11.2. Bancolombia Nóminas

La nómina formal se carga y paga mediante Bancolombia Nóminas.

El sistema ejecuta el pago, pero el cálculo y preparación ocurren previamente.

Las propinas permanecen fuera de este flujo y se liquidan manualmente.

Destinos: `OPS-AUD-007`, `OPS-AUD-011`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 12. Redes sociales

Instagram y otras redes se utilizan para:

- publicar vacantes;
- publicar contenido;
- recibir contactos;
- promocionar marcas;
- dirigir conversaciones comerciales;
- apoyar ventas.

Las cuentas pueden ser gestionadas por Nathalia, Jeo o Marketing.

No existe un flujo único para:

- solicitud;
- creación;
- aprobación;
- publicación;
- conservación de archivos;
- respuesta;
- conversión a pedido;
- medición de resultado.

La publicación de vacantes inicia el proceso de selección, pero las hojas de vida y entrevistas se administran posteriormente por Gerencia.

Destinos: `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-010`, `OPS-AUD-011` y `OPS-AUD-015`.

---

#### 13. Correo electrónico

No se identificó un proceso operativo ordinario cuya fuente principal confirmada sea el correo electrónico.

Es probable que participe en:

- comunicación contable;
- contratos;
- abogados;
- proveedores;
- facturación;
- documentos administrativos;
- accesos a plataformas.

No deberá inventariarse como canal crítico confirmado sin evidencia.

Estado:

```text
USO ADMINISTRATIVO GENERAL
→ PROBABLE

PROCESO OPERATIVO ESPECÍFICO
→ POR VALIDAR EN OPS-AUD-015
```

---

#### 14. Fotografías, capturas y notas en teléfono

##### 14.1. Fotografías y capturas

Se utilizan para:

- enviar remisiones;
- mostrar cantidades producidas;
- evidenciar productos extra;
- informar novedades;
- mostrar daños;
- documentar equipos;
- comunicar productos o canastas;
- apoyar solicitudes.

Una imagen suele perder:

- estructura;
- identificadores;
- versión;
- autor;
- relación con proceso;
- capacidad de búsqueda;
- validación automática.

##### 14.2. Notas en teléfono

Algunas áreas consolidan cantidades en el teléfono.

El registro:

- depende de una persona;
- puede no compartirse;
- no tiene formato común;
- puede eliminarse;
- no se relaciona con productos canónicos;
- no produce un historial empresarial.

Destinos: `OPS-AUD-006`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 15. Vento OS y herramientas experimentales

##### 15.1. Registro de remisiones en paralelo

Vento OS ha sido utilizado en pruebas para registrar eventos y movimientos, manteniendo en paralelo soportes físicos o procesos actuales.

Durante esta etapa, el sistema no debe considerarse fuente autoritativa cuando:

- no registra todas las recepciones;
- no registra producción completa;
- no registra todos los retiros;
- no concilia stock físico;
- las sedes continúan usando Excel o papel.

##### 15.2. Kiosco o tablet de retiros

Se realizó una prueba en la que:

- se tomó conteo inicial;
- trabajadores registraron retiros;
- las entradas y otros movimientos no se registraron completamente;
- el inventario dejó de ser confiable en pocos días.

Hallazgo:

```text
REGISTRAR SOLO SALIDAS
SIN REGISTRAR ENTRADAS, PRODUCCIÓN Y AJUSTES
→ INVENTARIO DIGITAL INVÁLIDO
```

Destinos: `OPS-AUD-007`, `OPS-AUD-012`, `OPS-AUD-013`, E3 y paquetes posteriores de NEXO.

---

#### 16. Procesos híbridos principales

| Proceso                      | Herramientas combinadas                                                      |
| ---------------------------- | ---------------------------------------------------------------------------- |
| Remisión                     | Excel → captura → WhatsApp → interpretación manual → preparación física      |
| Producción                   | Captura de remisión → tablero o teléfono → producción → fotografía o mensaje |
| Compra                       | Aviso de faltante → WhatsApp → proveedor → factura física → sistema contable |
| Venta Rappi                  | Rappi → transcripción a Makos → comanda → entrega                            |
| Venta directa por mensajería | ManyChat → transcripción a Makos → mensajería externa                        |
| Caja                         | Makos → cierre impreso → efectivo → Gerencia → sistema contable              |
| Asistencia                   | VISO → ANIMA → reporte → cálculo manual de consecuencias                     |
| Propinas                     | Reporte de asistencia → cálculo manual → efectivo                            |
| Soporte técnico              | WhatsApp o verbal → diagnóstico → solución sin historial                     |
| Accesos                      | Solicitud informal → creación manual → retiro descubierto informalmente      |
| Vaila Vainilla               | Shopify/redes → gestión humana → empaque → mensajería                        |

---

#### 17. Hallazgos transversales

##### 17.1. WhatsApp funciona como bus operativo informal

Conecta prácticamente todas las áreas, pero no ofrece por sí solo:

- estados canónicos;
- validaciones;
- propietarios de datos;
- control de versiones;
- segregación;
- auditoría confiable;
- integración con inventario.

##### 17.2. Excel funciona como formulario, base y reporte al mismo tiempo

Esto dificulta distinguir:

- dato original;
- versión vigente;
- consolidación;
- aprobación;
- histórico;
- fuente de verdad.

##### 17.3. Makos es crítico pero no cubre el proceso empresarial completo

Registra venta y caja, pero deja fuera:

- identidad efectiva;
- inventario real;
- preparación detallada;
- entrega;
- logística;
- producción;
- compras;
- contexto laboral.

##### 17.4. Existen múltiples fuentes parciales

```text
WHATSAPP
+
EXCEL
+
MAKOS
+
PAPEL
+
MEMORIA
+
OBSERVACIÓN FÍSICA
        ↓
VERDAD OPERATIVA FRAGMENTADA
```

##### 17.5. La información se mueve por transcripción

Los principales puntos conocidos son:

- Excel a captura;
- captura a interpretación;
- Rappi a Makos;
- ManyChat a Makos;
- factura física a sistema contable;
- asistencia a cálculo manual de propinas;
- pedido de proveedor a recepción;
- soporte técnico a memoria del responsable.

##### 17.6. Las cuentas compartidas impiden atribución individual

Especialmente en:

- Makos Servicio;
- Makos Caja según configuración;
- tablets;
- cuentas de redes;
- herramientas de mensajería;
- dispositivos operativos.

##### 17.7. La herramienta no define el propietario del proceso

Makos, WhatsApp, Shopify, VISO o ANIMA pueden registrar o transmitir, pero la responsabilidad continúa perteneciendo a actores empresariales.

---

#### 18. Matriz de destino de hallazgos

| Hallazgo                                                     | Tarea exacta  |
| ------------------------------------------------------------ | ------------- |
| Archivos, campos, grupos, reportes y formatos                | `OPS-AUD-006` |
| Secuencia entre herramientas y actores                       | `OPS-AUD-007` |
| Cambios, cancelaciones, mensajes perdidos y reintentos       | `OPS-AUD-008` |
| Quién puede ordenar, aprobar, registrar o corregir           | `OPS-AUD-009` |
| Volumen de mensajes, pedidos y archivos                      | `OPS-AUD-010` |
| Dependencias entre plataformas, sedes y terceros             | `OPS-AUD-011` |
| Transcripciones y conciliaciones                             | `OPS-AUD-012` |
| Falta de autor, estado, versión o custodia                   | `OPS-AUD-013` |
| Caída de internet, plataforma o dispositivo                  | `OPS-AUD-014` |
| Correo, Shopify, cuentas Makos y herramientas no confirmadas | `OPS-AUD-015` |
| Integraciones internas y externas                            | BLOQUE X      |
| Colas, notificaciones, impresión y evidencia                 | BLOQUE E4     |
| Transición, piloto y retiro de herramientas legacy           | BLOQUE E5     |

---

#### 19. Decisiones propuestas

1. WhatsApp se reconoce como el principal canal operativo informal actual.
2. Excel se reconoce como fuente primaria de solicitudes de remisión y herramienta de consolidación manual.
3. Las capturas de Excel son un artefacto distinto del archivo original y pueden perder versión y estructura.
4. Makos es la plataforma actual de venta, caja y comandas, pero no representa el proceso empresarial completo.
5. Rappi y ManyChat requieren transcripción manual a Makos.
6. Shopify es la fuente comercial actual de Vaila Vainilla, pero su relación con inventario, mensajería y Contabilidad queda pendiente de validación.
7. VISO y ANIMA soportan programación y asistencia de forma parcial.
8. El sistema contable recibe información desde múltiples fuentes manuales.
9. Bancolombia Nóminas ejecuta pagos formales, pero no incluye propinas.
10. Instagram y redes sociales participan en Marketing, ventas y reclutamiento sin un flujo único.
11. El correo electrónico no se clasificará como canal operativo crítico sin validación.
12. Las fotografías, capturas y notas de teléfono son evidencia débil y no estructurada.
13. Vento OS en pruebas no puede considerarse fuente autoritativa mientras los movimientos estén incompletos.
14. Ninguna herramienta actual se convierte automáticamente en propietaria canónica del dato o proceso.
15. Ninguna decisión autoriza integraciones, reemplazos, código, migraciones o cambios en Supabase.

---

#### 20. Criterios de aceptación

`OPS-AUD-005` podrá aprobarse cuando se confirme que:

- las herramientas operativas actuales están inventariadas;
- se distingue su función, integración e identidad;
- WhatsApp, Excel, Makos, Rappi, ManyChat, Shopify, VISO, ANIMA, sistema contable y Bancolombia Nóminas están cubiertos;
- se identifican los procesos híbridos;
- se registran cuentas compartidas;
- se separan hechos confirmados de usos probables;
- el correo no se presenta como crítico sin evidencia;
- cada brecha tiene destino documental exacto;
- no se ha diseñado todavía la integración TO-BE;
- no se ha autorizado implementación.

---

#### 21. Resultado y continuidad

Con la aprobación de `OPS-AUD-005` quedará establecida la línea base inicial de:

- herramientas digitales actuales;
- canales informales;
- procesos ejecutados en plataformas externas;
- transcripciones manuales;
- cuentas compartidas;
- fuentes de verdad parciales;
- procesos híbridos papel-digital;
- herramientas experimentales;
- brechas de integración y trazabilidad.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-006
— Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes
```

`OPS-AUD-006` deberá convertir los artefactos detectados en un inventario documental estructurado, sin diseñar todavía las pantallas, tablas o integraciones definitivas.



### ✅ OPS-AUD-006 — Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de artefactos documentales, operativos y de evidencia  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** información consolidada en `OPS-AUD-001` a `OPS-AUD-005`  
**Validación pendiente:** exclusivamente mediante `OPS-AUD-015` cuando el contenido, custodio, vigencia o uso real no esté suficientemente confirmado

---

#### 1. Propósito

Inventariar los artefactos utilizados actualmente para iniciar, ejecutar, controlar, demostrar o cerrar procesos de Vento Group.

Se consideran artefactos:

- formularios;
- remisiones;
- solicitudes;
- órdenes;
- facturas;
- comprobantes;
- cierres;
- comandas;
- reportes;
- hojas manuales;
- etiquetas;
- rótulos;
- fotografías;
- capturas;
- archivos de Excel;
- registros emitidos por plataformas;
- documentos laborales;
- guías de transporte;
- cualquier evidencia que permita reconstruir parcial o totalmente una operación.

Esta tarea identifica **qué artefactos existen y para qué se utilizan**.

No define todavía:

- el formulario definitivo;
- la pantalla futura;
- la tabla o esquema de base de datos;
- el contrato de API;
- la integración;
- el flujo completo;
- las reglas de aprobación;
- la conservación legal definitiva;
- el mecanismo de firma;
- la arquitectura de impresión;
- la eliminación o reemplazo de documentos actuales.

```text
ARTEFACTO AS-IS
→ evidencia de una necesidad, decisión, movimiento o resultado actual

ARTEFACTO AS-IS
≠ formulario TO-BE obligatorio
```

---

#### 2. Relación con las tareas anteriores

`OPS-AUD-004` identificó los procesos soportados en papel.

`OPS-AUD-005` identificó las herramientas y canales que producen, reciben o transmiten información.

`OPS-AUD-006` convierte esa evidencia en un inventario estructurado de artefactos.

```text
PROCESO
+
HERRAMIENTA
+
DOCUMENTO, REGISTRO O EVIDENCIA
        ↓
INVENTARIO DOCUMENTAL AS-IS
```

La tarea no deberá duplicar el flujo detallado de `OPS-AUD-007` ni resolver anticipadamente:

- excepciones de `OPS-AUD-008`;
- aprobaciones de `OPS-AUD-009`;
- volúmenes y tiempos de `OPS-AUD-010`;
- dependencias de `OPS-AUD-011`;
- conciliaciones de `OPS-AUD-012`;
- trazabilidad de `OPS-AUD-013`;
- contingencias de `OPS-AUD-014`;
- validación de `OPS-AUD-015`.

---

#### 3. Clasificación canónica de artefactos

##### 3.1. Familia documental

| Código | Familia           | Definición                                                          |
| ------ | ----------------- | ------------------------------------------------------------------- |
| `SOL`  | Solicitud         | Expresa una necesidad o requerimiento                               |
| `ORD`  | Orden             | Comunica una instrucción de compra, producción, entrega o ejecución |
| `REM`  | Remisión          | Relaciona productos solicitados, preparados, enviados o recibidos   |
| `REC`  | Recepción         | Evidencia entrega de proveedor o ingreso físico                     |
| `VEN`  | Venta             | Registra pedido, cuenta, pago o factura a cliente                   |
| `PRD`  | Producción        | Registra necesidad, cantidad, resultado o novedad productiva        |
| `INV`  | Inventario        | Registra conteo, retiro, movimiento, merma o ajuste                 |
| `LOG`  | Logística         | Identifica carga, destino, transporte, guía o entrega               |
| `FIN`  | Financiero        | Soporta efectivo, gasto, cierre, pago o conciliación                |
| `LAB`  | Laboral           | Registra vacante, candidato, contrato, turno, asistencia o nómina   |
| `MKT`  | Marketing         | Registra solicitud, pieza, aprobación o publicación                 |
| `MNT`  | Mantenimiento     | Registra falla, diagnóstico, reparación, repuesto o factura         |
| `TEC`  | Soporte técnico   | Registra incidente tecnológico, diagnóstico o solución              |
| `ETQ`  | Etiqueta o rótulo | Identifica producto, ubicación, recipiente, activo o destino        |
| `REP`  | Reporte           | Consolida datos, resultados, estados o indicadores                  |
| `EVI`  | Evidencia         | Fotografía, captura, archivo o soporte auxiliar                     |

##### 3.2. Medio actual

| Código       | Medio                                                                                       |
| ------------ | ------------------------------------------------------------------------------------------- |
| `PAPEL`      | Documento físico manuscrito o impreso                                                       |
| `EXCEL`      | Libro, hoja o formato de Excel                                                              |
| `IMAGEN`     | Fotografía o captura de pantalla                                                            |
| `WHATSAPP`   | Mensaje, archivo o conversación                                                             |
| `MAKOS`      | Registro o salida del POS                                                                   |
| `VISO`       | Registro o reporte administrativo                                                           |
| `ANIMA`      | Registro laboral del trabajador                                                             |
| `SHOPIFY`    | Registro comercial de Vaila Vainilla                                                        |
| `RAPPI`      | Pedido o estado de plataforma externa                                                       |
| `MANYCHAT`   | Conversación o pedido directo                                                               |
| `CONTABLE`   | Registro del sistema contable                                                               |
| `BANCO`      | Registro o archivo de plataforma bancaria                                                   |
| `RED_SOCIAL` | Publicación, mensaje o formulario externo                                                   |
| `TELEFONO`   | Nota, lista o archivo local                                                                 |
| `TABLERO`    | Registro temporal en pizarra o superficie física                                            |
| `VERBAL`     | Información sin artefacto persistente; se registra solo para evidenciar ausencia documental |

##### 3.3. Función dentro del proceso

| Código         | Función                                      |
| -------------- | -------------------------------------------- |
| `INICIA`       | Origina el proceso                           |
| `INSTRUYE`     | Comunica qué debe ejecutarse                 |
| `EJECUTA`      | Se utiliza durante la ejecución              |
| `CONTROLA`     | Permite verificar o comparar                 |
| `TRANSFIERE`   | Acompaña el traspaso entre actores o áreas   |
| `CONFIRMA`     | Evidencia aceptación o terminación           |
| `FACTURA`      | Formaliza una venta o compra                 |
| `CONCILIA`     | Permite comparar fuentes o cantidades        |
| `AUDITA`       | Permite reconstruir la operación             |
| `ARCHIVA`      | Conserva evidencia histórica                 |
| `NOTIFICA`     | Comunica un evento o novedad                 |
| `CONTINGENCIA` | Sustituye temporalmente un sistema o proceso |

##### 3.4. Estado de evidencia

| Estado               | Significado                                              |
| -------------------- | -------------------------------------------------------- |
| `CONFIRMADO`         | Existencia y uso actual suficientemente descritos        |
| `CONFIRMADO_PARCIAL` | Existe, pero faltan campos, custodio, vigencia o alcance |
| `TRANSITORIO`        | Utilizado durante pruebas o coexistencia                 |
| `PROBABLE`           | Razonablemente esperado, pero no confirmado              |
| `POR_VALIDAR`        | Requiere confirmación en `OPS-AUD-015`                   |
| `AUSENTE`            | El proceso ocurre sin artefacto persistente conocido     |
| `NO_APLICA`          | No corresponde al proceso actual                         |

---

#### 4. Contrato mínimo de inventario

Cada artefacto deberá poder describirse posteriormente con los siguientes campos mínimos:

| Campo                  | Descripción                           |
| ---------------------- | ------------------------------------- |
| `artifact_code`        | Código provisional de este inventario |
| `artifact_name`        | Nombre operativo conocido             |
| `artifact_family`      | Familia documental                    |
| `process_reference`    | Proceso donde participa               |
| `company_or_brand`     | Empresa, marca o unidad               |
| `site`                 | Sede o punto operativo                |
| `area`                 | Área responsable o usuaria            |
| `medium`               | Papel, Excel, sistema, imagen u otro  |
| `created_by`           | Actor que lo genera                   |
| `received_by`          | Actor que lo recibe                   |
| `purpose`              | Función del artefacto                 |
| `source_data`          | Origen de la información              |
| `current_fields_known` | Datos observados o confirmados        |
| `status`               | Estado de evidencia                   |
| `custody`              | Responsable o lugar de conservación   |
| `downstream_use`       | Uso posterior                         |
| `validation_task`      | Tarea exacta que valida pendientes    |
| `gap_task`             | Tarea exacta que recibe la brecha     |

Este contrato no constituye todavía una tabla, interfaz ni esquema físico.

---

#### 5. Inventario maestro de artefactos

| Código    | Artefacto                                                  | Familia             | Medio                                         | Proceso principal                     | Estado                    |
| --------- | ---------------------------------------------------------- | ------------------- | --------------------------------------------- | ------------------------------------- | ------------------------- |
| `ART-001` | Solicitud de remisión por área o sede                      | `SOL`, `REM`        | `EXCEL`                                       | Abastecimiento interno                | `CONFIRMADO`              |
| `ART-002` | Captura o fotografía de la solicitud de remisión           | `REM`, `EVI`        | `IMAGEN`, `WHATSAPP`                          | Envío de solicitud                    | `CONFIRMADO`              |
| `ART-003` | Hoja física de remisión paralela                           | `REM`               | `PAPEL`                                       | Prueba y contingencia de remisiones   | `TRANSITORIO`             |
| `ART-004` | Consolidado manual por área productiva                     | `PRD`, `REP`        | `TABLERO`, `TELEFONO`                         | Planificación inmediata de producción | `CONFIRMADO_PARCIAL`      |
| `ART-005` | Reporte o mensaje de producción terminada                  | `PRD`, `REP`, `EVI` | `WHATSAPP`, `IMAGEN`                          | Supervisión de producción             | `CONFIRMADO`              |
| `ART-006` | Aviso de producto extra                                    | `PRD`, `EVI`        | `WHATSAPP`, `IMAGEN`                          | Redistribución o despacho             | `CONFIRMADO`              |
| `ART-007` | Aviso o explicación de faltante                            | `PRD`, `REM`, `EVI` | `WHATSAPP`, `VERBAL`                          | Gestión de parciales                  | `CONFIRMADO_PARCIAL`      |
| `ART-008` | Lista de compra consolidada                                | `SOL`, `ORD`        | `EXCEL`, `WHATSAPP`, `TELEFONO`               | Compras                               | `CONFIRMADO_PARCIAL`      |
| `ART-009` | Pedido enviado al proveedor                                | `ORD`               | `WHATSAPP`                                    | Compra a proveedor                    | `CONFIRMADO`              |
| `ART-010` | Confirmación del proveedor                                 | `ORD`, `EVI`        | `WHATSAPP`                                    | Disponibilidad, precio y fecha        | `CONFIRMADO`              |
| `ART-011` | Factura o remisión del proveedor                           | `REC`, `FIN`        | `PAPEL`                                       | Recepción y Contabilidad              | `CONFIRMADO`              |
| `ART-012` | Copia firmada de recepción                                 | `REC`, `EVI`        | `PAPEL`                                       | Aceptación de entrega                 | `CONFIRMADO`              |
| `ART-013` | Soporte contable de compra o gasto                         | `FIN`, `EVI`        | `PAPEL`, `CONTABLE`                           | Registro contable                     | `CONFIRMADO`              |
| `ART-014` | Hoja manual de mermas                                      | `INV`, `EVI`        | `PAPEL`                                       | Baja física de producto               | `CONFIRMADO`              |
| `ART-015` | Conteo inicial de inventario                               | `INV`, `REP`        | Vento OS / tablet                             | Piloto de inventario                  | `CONFIRMADO`              |
| `ART-016` | Registro experimental de retiro                            | `INV`               | Vento OS / kiosco                             | Salida de Bodega                      | `CONFIRMADO`              |
| `ART-017` | Cierre impreso de Makos                                    | `FIN`, `REP`        | `MAKOS`, `PAPEL`                              | Cierre y entrega de efectivo          | `CONFIRMADO`              |
| `ART-018` | Registro de apertura de caja                               | `FIN`               | `MAKOS`                                       | Inicio de turno de Caja               | `CONFIRMADO`              |
| `ART-019` | Resumen no fiscal de cuenta                                | `VEN`, `REP`        | `MAKOS`, `PAPEL`                              | Presentación de cuenta al cliente     | `CONFIRMADO`              |
| `ART-020` | Factura legal de venta                                     | `VEN`, `FIN`        | `MAKOS`, `PAPEL`                              | Cierre de venta                       | `CONFIRMADO`              |
| `ART-021` | Comanda de Cocina                                          | `VEN`, `ORD`        | `MAKOS`, `PAPEL`                              | Preparación en Cocina                 | `CONFIRMADO`              |
| `ART-022` | Comanda de Bar                                             | `VEN`, `ORD`        | `MAKOS`, `PAPEL`                              | Preparación caliente                  | `CONFIRMADO`              |
| `ART-023` | Comanda de Barra                                           | `VEN`, `ORD`        | `MAKOS`, `PAPEL`                              | Preparación fría                      | `CONFIRMADO`              |
| `ART-024` | Pedido de mesa en Makos                                    | `VEN`, `ORD`        | `MAKOS`                                       | Servicio de salón                     | `CONFIRMADO`              |
| `ART-025` | Pedido Rappi                                               | `VEN`, `ORD`        | `RAPPI`                                       | Venta por plataforma                  | `CONFIRMADO`              |
| `ART-026` | Pedido transcrito como Rappi en Makos                      | `VEN`, `ORD`        | `MAKOS`                                       | Ejecución interna del pedido          | `CONFIRMADO`              |
| `ART-027` | Conversación o pedido por ManyChat                         | `VEN`, `SOL`        | `MANYCHAT`                                    | Venta directa y domicilio             | `CONFIRMADO`              |
| `ART-028` | Pedido transcrito como Domicilio en Makos                  | `VEN`, `ORD`        | `MAKOS`                                       | Ejecución interna del domicilio       | `CONFIRMADO`              |
| `ART-029` | Datos de cliente para domicilio                            | `VEN`, `LOG`        | `MANYCHAT`, `MAKOS`, `WHATSAPP`               | Entrega a cliente                     | `CONFIRMADO_PARCIAL`      |
| `ART-030` | Comprobante de transferencia del cliente                   | `FIN`, `EVI`        | `IMAGEN`, `BANCO`, `WHATSAPP`                 | Confirmación de pago                  | `CONFIRMADO_PARCIAL`      |
| `ART-031` | Registro de pago con datáfono                              | `FIN`, `EVI`        | Datáfono / Makos                              | Pago con tarjeta                      | `CONFIRMADO_PARCIAL`      |
| `ART-032` | Pedido Shopify                                             | `VEN`, `ORD`        | `SHOPIFY`                                     | Venta Vaila Vainilla                  | `CONFIRMADO`              |
| `ART-033` | Guía o etiqueta de envío Vaila Vainilla                    | `LOG`, `ETQ`        | Plataforma o impresión                        | Despacho de venta en línea            | `POR_VALIDAR`             |
| `ART-034` | Confirmación o notificación al cliente Vaila Vainilla      | `VEN`, `LOG`, `EVI` | `SHOPIFY`, `WHATSAPP`, correo u otro          | Seguimiento de envío                  | `POR_VALIDAR`             |
| `ART-035` | Horario publicado                                          | `LAB`, `REP`        | `VISO`                                        | Programación laboral                  | `CONFIRMADO`              |
| `ART-036` | Notificación y consulta de turno                           | `LAB`, `EVI`        | `ANIMA`                                       | Comunicación al trabajador            | `CONFIRMADO`              |
| `ART-037` | Registro de check-in                                       | `LAB`, `EVI`        | `ANIMA`                                       | Asistencia                            | `CONFIRMADO`              |
| `ART-038` | Reporte de asistencia                                      | `LAB`, `REP`        | `VISO`                                        | Revisión de retrasos y ausencias      | `CONFIRMADO`              |
| `ART-039` | Cálculo manual de propinas                                 | `LAB`, `FIN`, `REP` | Herramienta no confirmada                     | Liquidación de propinas               | `CONFIRMADO_PARCIAL`      |
| `ART-040` | Archivo o carga de nómina                                  | `LAB`, `FIN`        | `BANCO`                                       | Pago de nómina formal                 | `CONFIRMADO`              |
| `ART-041` | Hoja de vida                                               | `LAB`, `EVI`        | `RED_SOCIAL`, correo, archivo digital o papel | Reclutamiento                         | `CONFIRMADO_PARCIAL`      |
| `ART-042` | Registro de entrevista o evaluación de prueba              | `LAB`, `REP`        | `VERBAL` o medio no confirmado                | Selección                             | `AUSENTE` / `POR_VALIDAR` |
| `ART-043` | Contrato y documentos laborales                            | `LAB`, `EVI`        | Abogados / papel / digital                    | Formalización                         | `CONFIRMADO_PARCIAL`      |
| `ART-044` | Solicitud de creación de acceso                            | `LAB`, `TEC`        | `WHATSAPP`, `VERBAL`                          | Alta de ANIMA y Vento OS              | `CONFIRMADO_PARCIAL`      |
| `ART-045` | Solicitud de baja de acceso                                | `LAB`, `TEC`        | No existe flujo formal                        | Retiro laboral                        | `AUSENTE`                 |
| `ART-046` | Solicitud de contenido de Marketing                        | `MKT`, `SOL`        | `WHATSAPP`, `VERBAL`                          | Producción de contenido               | `CONFIRMADO`              |
| `ART-047` | Pieza de historia                                          | `MKT`, `EVI`        | `RED_SOCIAL` / archivo digital                | Publicación temporal                  | `CONFIRMADO`              |
| `ART-048` | Pieza de publicación permanente                            | `MKT`, `EVI`        | `RED_SOCIAL` / archivo digital                | Publicación permanente                | `CONFIRMADO`              |
| `ART-049` | Aprobación de publicación permanente                       | `MKT`, `EVI`        | `WHATSAPP`, `VERBAL` u otro                   | Autorización de publicación           | `CONFIRMADO_PARCIAL`      |
| `ART-050` | Reporte de incidente tecnológico                           | `TEC`, `SOL`        | `WHATSAPP`, `VERBAL`                          | Soporte técnico                       | `CONFIRMADO`              |
| `ART-051` | Registro de diagnóstico y solución técnica                 | `TEC`, `REP`        | No existe registro consolidado                | Historial de soporte                  | `AUSENTE`                 |
| `ART-052` | Reporte de falla de infraestructura o equipo               | `MNT`, `SOL`        | `WHATSAPP`, `VERBAL`, `IMAGEN`                | Mantenimiento correctivo              | `CONFIRMADO_PARCIAL`      |
| `ART-053` | Factura o comprobante de reparación                        | `MNT`, `FIN`, `EVI` | `PAPEL`                                       | Soporte contable                      | `PROBABLE`                |
| `ART-054` | Etiqueta o rótulo de producto o estante                    | `ETQ`, `INV`        | `PAPEL` / adhesivo / marcación                | Ubicación visual                      | `CONFIRMADO_PARCIAL`      |
| `ART-055` | Identificación de canasta por marca o propietario          | `ETQ`, `LOG`, `INV` | Rótulo físico                                 | Gestión visual de canastas            | `CONFIRMADO`              |
| `ART-056` | Registro de lavado o estado de canasta                     | `LOG`, `REP`        | No existe                                     | Limpieza y disponibilidad             | `AUSENTE`                 |
| `ART-057` | Registro de transferencia de producto a Molka              | `INV`, `LOG`        | `VERBAL`                                      | Reasignación de producto              | `AUSENTE`                 |
| `ART-058` | Registro de fecha, lote o vida útil de producto reasignado | `INV`, `ETQ`        | No existe                                     | Control de vencimiento                | `AUSENTE`                 |
| `ART-059` | Registro de recepción en sede                              | `REC`, `REM`        | Conteo físico y comunicación informal         | Confirmación de entrega               | `CONFIRMADO_PARCIAL`      |
| `ART-060` | Registro de diferencia de recepción                        | `REC`, `REM`, `EVI` | `VERBAL`, `WHATSAPP` o inexistente            | Reclamo de faltante                   | `CONFIRMADO_PARCIAL`      |

---

#### 6. Solicitudes y remisiones internas

##### 6.1. Solicitud de remisión por sede o área — `ART-001`

La solicitud se crea actualmente en Excel.

Emisores conocidos:

- Caja o Servicio de Vento Café;
- Cocina de Vento Café;
- Barra de Vento Café;
- responsable de Saudo;
- responsable de Molka.

Distribución conocida:

```text
VENTO CAFÉ
├── Servicio
├── Cocina
└── Barra

SAUDO
└── solicitud unificada

MOLKA
└── solicitud unificada
```

Datos observados o inferidos con suficiente base:

- productos;
- cantidades solicitadas;
- sede o área solicitante;
- momento de envío;
- presentación o unidad utilizada según el producto.

Datos todavía no confirmados:

- identificador único;
- fecha requerida;
- solicitante individual;
- versión;
- estado;
- prioridad;
- observaciones estructuradas;
- motivo;
- sustituciones;
- cantidad confirmada;
- cantidad producida;
- cantidad despachada;
- cantidad recibida.

Los campos exactos deben validarse mediante `OPS-AUD-015`.

##### 6.2. Captura de la solicitud — `ART-002`

La captura o fotografía suele convertirse en el artefacto que realmente recibe producción.

Consecuencias:

- pierde fórmulas y validaciones del Excel;
- no permite distinguir fácilmente versión anterior y final;
- no es consultable por producto;
- no conserva IDs;
- puede ser recortada;
- depende de legibilidad;
- no se actualiza si cambia el archivo original.

La divergencia entre archivo y captura deberá documentarse en `OPS-AUD-012`.

##### 6.3. Remisión física transitoria — `ART-003`

La hoja física se ha utilizado en paralelo durante pruebas para evitar que una falla del sistema afecte la operación.

Estado:

- no se declara como documento permanente;
- no se presume vigente en todas las sedes;
- su formato exacto queda pendiente;
- su relación con Excel y Vento OS deberá validarse.

Destino: `OPS-AUD-015`.

##### 6.4. Recepción y diferencias — `ART-059` y `ART-060`

En la sede, la persona responsable del área o su delegado recibe, cuenta y guarda.

No existe un artefacto estructurado confirmado que registre:

- quién recibió;
- hora;
- cantidad recibida;
- diferencia;
- estado del producto;
- rechazo;
- observación;
- evidencia;
- cierre de la remisión.

Cuando falta producto, la sede lo descubre y consulta posteriormente.

Esto no se resuelve en esta tarea; deberá detallarse en `OPS-AUD-007`, `OPS-AUD-008` y `OPS-AUD-013`.

---

#### 7. Artefactos de producción

##### 7.1. Consolidado por área — `ART-004`

Las áreas productivas agregan cantidades de varias sedes.

El consolidado puede quedar:

- en tablero;
- en teléfono;
- en memoria;
- en una nota temporal.

No se confirmó un formato único.

Riesgos:

- ausencia de versión;
- falta de vínculo con cada solicitud;
- totales sin desglose;
- modificación sin evidencia;
- pérdida al borrar el tablero o la nota.

##### 7.2. Reporte de producción terminada — `ART-005`

El equipo publica cantidades finales en un grupo, principalmente para supervisión.

El conductor no utiliza necesariamente ese reporte para el despacho; cuenta físicamente.

Por tanto:

```text
REPORTE DIGITAL
≠
FUENTE OPERATIVA DEL DESPACHO
```

La diferencia entre producción reportada, producto disponible y producto cargado deberá tratarse en `OPS-AUD-012`.

##### 7.3. Productos extra y faltantes — `ART-006` y `ART-007`

Los productos extra pueden informarse mediante fotografía o mensaje.

Los faltantes no siempre se informan preventivamente.

No existe una razón estructurada confirmada.

Causas conocidas:

- falta de insumos;
- llegada tardía del proveedor;
- tiempo insuficiente;
- limitación técnica;
- producción no alcanzada.

La clasificación definitiva de motivos corresponde a `OPS-AUD-008`.

---

#### 8. Artefactos de compra y recepción

##### 8.1. Lista de compra — `ART-008`

La gerente general reúne necesidades a partir de:

- avisos de faltantes;
- preguntas a las áreas;
- experiencia;
- urgencia.

No se confirmó un formato único.

Puede existir como:

- lista en WhatsApp;
- nota;
- Excel;
- consolidación mental.

Campos no confirmados:

- producto canónico;
- presentación;
- cantidad solicitada;
- existencias;
- consumo esperado;
- proveedor;
- precio objetivo;
- prioridad;
- fecha requerida;
- aprobación.

##### 8.2. Pedido al proveedor — `ART-009`

El pedido se envía normalmente por WhatsApp.

Puede contener:

- producto;
- cantidad;
- presentación;
- sede de entrega;
- fecha;
- observación.

No existe una orden de compra formal confirmada con:

- número;
- versión;
- estado;
- aprobador;
- total esperado;
- impuestos;
- centro de costo;
- condiciones de pago.

La ausencia de una orden formal no implica que deba crearse todavía una estructura TO-BE; esa decisión dependerá del diseño posterior.

##### 8.3. Confirmación del proveedor — `ART-010`

El proveedor responde disponibilidad, cantidades, precios y fecha estimada.

La conversación puede modificar el pedido original sin crear una versión consolidada.

La comparación entre:

```text
SOLICITADO
→ CONFIRMADO
→ FACTURADO
→ RECIBIDO
```

deberá analizarse en `OPS-AUD-007`, `OPS-AUD-008` y `OPS-AUD-012`.

##### 8.4. Factura y copia firmada — `ART-011` y `ART-012`

Cuando recibe el Jefe de Operaciones:

- compara físicamente;
- firma;
- entrega una copia;
- conserva otra para Gerencia.

Datos esperables, pero no todos confirmados:

- proveedor;
- fecha;
- número;
- productos;
- cantidades;
- precios;
- impuestos;
- total;
- receptor;
- firma;
- observaciones.

El contenido exacto depende del documento del proveedor y se validará en `OPS-AUD-015`.

---

#### 9. Artefactos de inventario y merma

##### 9.1. Hoja de mermas — `ART-014`

El mismo trabajador puede:

- detectar el daño;
- decidir la baja;
- desechar;
- registrar producto y cantidad.

Campos confirmados:

- producto;
- cantidad.

Campos no confirmados:

- fecha;
- hora;
- sede;
- área;
- lote;
- vencimiento;
- causa;
- estado;
- fotografía;
- responsable;
- aprobador;
- método de disposición;
- costo;
- efecto en inventario.

Los campos no se asumirán como existentes.

##### 9.2. Conteo inicial y retiro experimental — `ART-015` y `ART-016`

El piloto registró:

- conteo inicial;
- retiros posteriores.

No registró integralmente:

- recepciones;
- producción terminada;
- transferencias;
- devoluciones;
- ajustes;
- mermas;
- conversiones.

El artefacto digital perdió confiabilidad en pocos días.

Este hallazgo deberá alimentar `OPS-AUD-012` y `OPS-AUD-013`.

##### 9.3. Reasignación a Molka — `ART-057` y `ART-058`

Los productos menos frescos, pero todavía consumibles, pueden enviarse a Molka.

La decisión se comunica verbalmente.

No existe artefacto confirmado para:

- origen;
- destino;
- producto;
- cantidad;
- fecha;
- vida útil restante;
- lote;
- causa;
- responsable;
- aceptación;
- efecto sobre inventarios.

La ausencia queda registrada y deberá profundizarse en `OPS-AUD-007`, `OPS-AUD-008` y `OPS-AUD-013`.

---

#### 10. Artefactos de venta y Caja

##### 10.1. Apertura y cierre — `ART-018` y `ART-017`

Makos registra la apertura de Caja y genera el cierre impreso.

El cierre se utiliza para:

- comparar efectivo;
- separar turnos;
- entregar excedente a Gerencia;
- respaldar el recaudo.

No se confirmó:

- firma de quien entrega;
- firma de quien recibe;
- registro de diferencia;
- identificación del retiro;
- destino posterior;
- relación con gastos;
- archivo final.

##### 10.2. Resumen y factura — `ART-019` y `ART-020`

**Resumen no fiscal**

- se imprime antes del pago;
- puede imprimirlo un trabajador de Servicio;
- informa el valor de la cuenta.

**Factura legal**

- se genera después de registrar el pago;
- la emite Caja;
- se entrega al cliente.

No deben consolidarse como un único artefacto.

##### 10.3. Comandas — `ART-021` a `ART-023`

Vento Café utiliza:

- comanda de Cocina;
- comanda de Bar;
- comanda de Barra.

Datos previsibles:

- mesa;
- productos;
- cantidades;
- observaciones;
- hora;
- número de pedido.

No se confirmará ningún campo específico que no haya sido observado directamente hasta `OPS-AUD-015`.

Saudo cuenta con impresora, pero no utiliza la comanda como artefacto operativo ordinario.

##### 10.4. Pedido registrado — `ART-024`

Makos conserva la mesa y sus pedidos adicionales hasta el pago.

La cuenta puede contener varias rondas.

La cuenta de Servicio es compartida, por lo que el artefacto no identifica necesariamente al mesero efectivo.

---

#### 11. Pedidos externos y domicilios

##### 11.1. Rappi — `ART-025` y `ART-026`

Existen dos registros del mismo pedido:

```text
PEDIDO ORIGINAL EN RAPPI
→ TRANSCRIPCIÓN EN MAKOS
```

El pedido de Makos se clasifica como Rappi.

Los campos y diferencias deberán compararse en `OPS-AUD-012`.

##### 11.2. ManyChat — `ART-027` y `ART-028`

La conversación o pedido directo contiene información que Caja transcribe como Domicilio en Makos.

Posibles datos:

- nombre;
- dirección;
- teléfono;
- productos;
- método de pago;
- observaciones.

Solo se considerarán confirmados después de revisar el formato real en `OPS-AUD-015`.

##### 11.3. Pago y mensajería — `ART-029` a `ART-031`

En domicilios pueden existir:

- datos de contacto;
- comprobante de transferencia;
- indicación de pago anticipado o efectivo;
- factura;
- instrucciones verbales al mensajero.

No existe un comprobante estructurado confirmado que conecte:

```text
PEDIDO
→ PAGO
→ MENSAJERO
→ ENTREGA
→ CIERRE
```

El flujo corresponde a `OPS-AUD-007`.

---

#### 12. Vaila Vainilla

##### 12.1. Pedido Shopify — `ART-032`

Shopify registra el pedido comercial.

Campos concretos deberán validarse con Jeo o la responsable.

##### 12.2. Guía, etiqueta y notificación — `ART-033` y `ART-034`

La operación utiliza mensajería externa, pero no se confirmó:

- quién genera la guía;
- plataforma utilizada;
- impresión de etiqueta;
- asociación con el pedido;
- número de seguimiento;
- notificación al cliente;
- prueba de entrega;
- devolución.

Todos quedan vinculados a `OPS-AUD-015`.

---

#### 13. Artefactos laborales

##### 13.1. Horario — `ART-035` y `ART-036`

Gerencia publica en VISO y el trabajador consulta en ANIMA.

El artefacto digital comunica:

- turno;
- sede;
- horario;
- otros datos operativos disponibles.

No existe aceptación del trabajador.

##### 13.2. Check-in y reporte — `ART-037` y `ART-038`

El check-in constituye el registro oficial de asistencia.

Gerencia descarga un reporte de:

- retrasos;
- ausencias;
- novedades disponibles.

El detalle exacto del reporte debe revisarse en `OPS-AUD-015`.

##### 13.3. Propinas — `ART-039`

La gerente general calcula manualmente promedios y ajustes.

No existe un artefacto canónico confirmado que muestre por trabajador:

- valor base;
- criterio;
- días;
- retrasos;
- descuentos;
- motivo;
- aprobación;
- valor final;
- entrega;
- firma o aceptación.

Se registra como `CONFIRMADO_PARCIAL`.

##### 13.4. Nómina — `ART-040`

La nómina formal se carga en Bancolombia Nóminas.

No se documenta en esta tarea la estructura del archivo bancario.

##### 13.5. Selección y contratación — `ART-041` a `ART-043`

Existen hojas de vida y contratos.

No existe evidencia de un formato estructurado de:

- entrevista;
- evaluación de prueba;
- decisión;
- capacidades;
- inducción;
- aprobación final.

La evaluación puede ser verbal.

##### 13.6. Altas y bajas de acceso — `ART-044` y `ART-045`

El alta se solicita informalmente.

La baja no tiene un artefacto obligatorio y puede depender de que el Jefe de Operaciones descubra el retiro.

Esta ausencia es crítica y deberá profundizarse en `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-011` y `OPS-AUD-013`.

---

#### 14. Artefactos de Marketing

##### 14.1. Solicitud de contenido — `ART-046`

Puede llegar por WhatsApp o verbalmente.

No existe formato confirmado con:

- marca;
- objetivo;
- audiencia;
- canal;
- formato;
- fecha;
- prioridad;
- referencia;
- responsable;
- aprobación.

##### 14.2. Pieza y aprobación — `ART-047` a `ART-049`

Las historias suelen publicarse sin aprobación previa.

Las publicaciones permanentes requieren aprobación de Nathalia o Jeo.

La aprobación puede quedar:

- en WhatsApp;
- verbalmente;
- implícita.

El método exacto deberá validarse en `OPS-AUD-015`.

---

#### 15. Soporte técnico y mantenimiento

##### 15.1. Incidente tecnológico — `ART-050` y `ART-051`

El reporte llega por WhatsApp o verbalmente.

No existe un registro consolidado posterior.

Por tanto, faltan artefactos persistentes de:

- ticket;
- activo;
- sede;
- prioridad;
- diagnóstico;
- causa;
- solución;
- repuesto;
- tiempo;
- evidencia;
- cierre.

La ausencia se asigna a `OPS-AUD-013`.

##### 15.2. Mantenimiento correctivo — `ART-052` y `ART-053`

La falla se comunica a la gerente general.

Es probable que exista factura o comprobante del técnico, pero no se confirmó el circuito.

Destino: `OPS-AUD-015`.

---

#### 16. Etiquetas, rótulos y marcaciones

##### 16.1. Producto o estante — `ART-054`

El conductor ubica productos mediante experiencia, visualización y marcaciones existentes.

No se confirmó:

- formato;
- código;
- responsable;
- fecha;
- actualización;
- relación con ubicación canónica;
- material;
- impresora.

##### 16.2. Canastas — `ART-055`

Existen canastas identificadas visualmente por:

- Vento;
- Saudo;
- proveedores o marcas como Colanta;
- color, forma o etiqueta.

La identificación no constituye un sistema de custodia ni seguimiento.

##### 16.3. Estado de lavado — `ART-056`

No existe etiqueta o registro que diferencie:

- sucia;
- pendiente;
- lavada;
- húmeda;
- seca;
- disponible;
- asignada;
- en ruta.

El conductor verifica visualmente.

##### 16.4. Lotes y vida útil — `ART-058`

Los productos reasignados a Molka no llevan una etiqueta confirmada de:

- fecha;
- origen;
- lote;
- vida útil;
- vencimiento.

La necesidad futura de etiquetado no se diseña aquí. La brecha será vinculada por `GAP-CTRL-006` con la tarea funcional exacta correspondiente y deberá considerar `OPS-TRZ-001`.

---

#### 17. Reportes actuales identificados

| Código    | Reporte                  | Fuente                | Uso                                |
| --------- | ------------------------ | --------------------- | ---------------------------------- |
| `REP-001` | Cierre de Caja           | Makos                 | Conciliación y entrega de efectivo |
| `REP-002` | Producción final         | Mensaje o fotografía  | Supervisión                        |
| `REP-003` | Reporte de asistencia    | VISO                  | Retrasos y ausencias               |
| `REP-004` | Reportes administrativos | Excel / Makos         | Gerencia y Contabilidad            |
| `REP-005` | Reporte contable         | Sistema contable      | Gestión financiera y tributaria    |
| `REP-006` | Estado de pedido         | Rappi                 | Operación del canal                |
| `REP-007` | Estado de pedido         | Shopify               | Operación Vaila Vainilla           |
| `REP-008` | Conteo inicial           | Vento OS experimental | Piloto de inventario               |
| `REP-009` | Registro de retiros      | Kiosco experimental   | Piloto de inventario               |
| `REP-010` | Reporte de propinas      | No confirmado         | Liquidación manual                 |

No se asume que todos sean exportables, archivados o utilizados sistemáticamente.

---

#### 18. Artefactos ausentes relevantes

La ausencia de un artefacto también constituye un hallazgo.

| Código    | Artefacto ausente                                         | Consecuencia                                            |
| --------- | --------------------------------------------------------- | ------------------------------------------------------- |
| `AUS-001` | Confirmación estructurada de remisión recibida            | No se prueba recepción completa                         |
| `AUS-002` | Registro de faltante antes del despacho                   | La sede descubre la diferencia tarde                    |
| `AUS-003` | Transferencia de producto entre sedes                     | Inventario y responsabilidad no trazables               |
| `AUS-004` | Registro de canastas                                      | No se conoce custodia, estado o ubicación               |
| `AUS-005` | Alta y baja formal de accesos                             | Riesgo de cuentas activas                               |
| `AUS-006` | Ticket de soporte técnico                                 | Se pierde historial                                     |
| `AUS-007` | Registro de mantenimiento por activo                      | No existe historial preventivo o correctivo consolidado |
| `AUS-008` | Evaluación estructurada de período de prueba              | Decisión laboral no reconstruible                       |
| `AUS-009` | Liquidación trazable de propina                           | No se prueba cálculo ni descuento                       |
| `AUS-010` | Aprobación estructurada de Marketing                      | Criterio y decisión ambiguos                            |
| `AUS-011` | Estado de producto preparado: listo, recogido y entregado | No existe trazabilidad de servicio                      |
| `AUS-012` | Estado de canasta lavada o disponible                     | Uso depende de revisión visual                          |
| `AUS-013` | Etiqueta de fecha/lote/origen en reasignaciones           | Riesgo de vencimiento y pérdida de origen               |

Estas ausencias se profundizarán en `OPS-AUD-007` a `OPS-AUD-015` y serán consolidadas en `GAP-CTRL-001`.

---

#### 19. Matriz de duplicación documental

| Información           | Artefactos duplicados o paralelos                                          |
| --------------------- | -------------------------------------------------------------------------- |
| Solicitud de remisión | Excel + captura + WhatsApp + posible hoja física + Vento OS                |
| Pedido Rappi          | Rappi + Makos                                                              |
| Pedido directo        | ManyChat + Makos                                                           |
| Venta                 | Makos + resumen + factura                                                  |
| Caja                  | Makos + cierre impreso + efectivo + sistema contable                       |
| Compra                | Lista informal + WhatsApp proveedor + factura + sistema contable           |
| Producción            | Captura de remisión + tablero/teléfono + reporte por grupo + conteo físico |
| Asistencia            | VISO + ANIMA + reporte descargado + cálculo manual                         |
| Inventario piloto     | Conteo inicial + retiros, sin resto de movimientos                         |
| Mantenimiento         | WhatsApp/verbal + factura probable, sin historial                          |
| Accesos               | Solicitud informal + creación manual, sin baja formal                      |

La duplicación y conciliación pertenecen a `OPS-AUD-012`.

---

#### 20. Hallazgos transversales

##### 20.1. El artefacto que inicia no siempre es el que ejecuta

Ejemplo:

```text
EXCEL
→ CAPTURA
→ WHATSAPP
→ TABLERO O TELÉFONO
→ CONTEO FÍSICO
```

El proceso cambia de soporte varias veces.

##### 20.2. Varios artefactos no tienen identificador común

No existe una clave confirmada que conecte:

- solicitud;
- producción;
- despacho;
- recepción;
- faltante;
- movimiento de inventario;
- factura;
- pago.

##### 20.3. La firma física no equivale a trazabilidad integral

Una factura firmada puede confirmar recepción general, pero no necesariamente:

- diferencias;
- condición;
- ubicación;
- responsable final;
- ingreso a inventario;
- carga contable.

##### 20.4. Las imágenes sustituyen datos estructurados

Las capturas facilitan comunicación inmediata, pero eliminan capacidad de:

- validar;
- buscar;
- relacionar;
- calcular;
- versionar;
- auditar automáticamente.

##### 20.5. Existen artefactos críticos ausentes

Las ausencias más sensibles afectan:

- acceso de trabajadores;
- inventario;
- remisiones;
- mermas;
- dinero;
- soporte técnico;
- mantenimiento;
- propinas.

##### 20.6. El diseño futuro deberá distinguir documento, registro y evento

```text
DOCUMENTO
→ representación legible

REGISTRO
→ dato persistente

EVENTO
→ hecho ocurrido

EVIDENCIA
→ prueba asociada
```

No deberán tratarse como equivalentes.

---

#### 21. Matriz de destino de hallazgos

| Hallazgo                                                   | Tarea exacta   |
| ---------------------------------------------------------- | -------------- |
| Secuencia de creación, uso y cierre                        | `OPS-AUD-007`  |
| Corrección, anulación, reimpresión, devolución y reversión | `OPS-AUD-008`  |
| Firma, aprobación, custodio y segregación                  | `OPS-AUD-009`  |
| Frecuencia, cantidad, tamaño y retención operativa         | `OPS-AUD-010`  |
| Traspasos entre sedes, áreas, herramientas y terceros      | `OPS-AUD-011`  |
| Duplicación entre artefactos y conciliación                | `OPS-AUD-012`  |
| Falta de ID, actor, versión, estado y custodia             | `OPS-AUD-013`  |
| Artefactos de contingencia y operación offline             | `OPS-AUD-014`  |
| Campos, formatos, cuentas y usos no confirmados            | `OPS-AUD-015`  |
| Consolidación retrospectiva de brechas                     | `GAP-CTRL-001` |
| Vinculación con tareas y paquetes futuros                  | `GAP-CTRL-006` |
| Etiquetado y trazabilidad operativa                        | `OPS-TRZ-001`  |

---

#### 22. Decisiones propuestas

1. El inventario incluye documentos físicos, registros digitales, imágenes, reportes y ausencias documentales relevantes.
2. La solicitud de remisión en Excel y su captura se consideran artefactos distintos.
3. La remisión física paralela se clasifica como transitoria.
4. El consolidado productivo en tablero o teléfono no se considera registro empresarial confiable.
5. Los mensajes de producción final no sustituyen el conteo de despacho.
6. El pedido de proveedor por WhatsApp no equivale a una orden de compra formal.
7. La factura del proveedor y la copia firmada cumplen funciones diferentes.
8. La hoja de mermas es actualmente una fuente primaria manual.
9. El cierre, el resumen y la factura de Makos son artefactos distintos.
10. Las comandas se inventarían por estación.
11. El pedido original de Rappi y su transcripción en Makos son registros duplicados.
12. La conversación de ManyChat y el pedido Domicilio de Makos son registros distintos.
13. El check-in de ANIMA y el reporte de VISO no sustituyen la liquidación de propinas.
14. El alta de accesos tiene una solicitud informal; la baja carece de artefacto obligatorio.
15. Soporte técnico y mantenimiento carecen de historial estructurado.
16. Las canastas tienen identificación visual, pero no trazabilidad.
17. Las transferencias informales de producto a Molka carecen de registro y etiqueta de origen o vida útil.
18. Los artefactos no confirmados permanecen vinculados a `OPS-AUD-015`.
19. Ningún artefacto AS-IS se adopta automáticamente como formulario TO-BE.
20. Ninguna decisión autoriza creación de tablas, pantallas, integraciones, impresiones, código, migraciones o cambios en Supabase.

---

#### 23. Criterios de aceptación

`OPS-AUD-006` podrá aprobarse cuando se confirme que:

- existe un inventario estructurado de formularios, remisiones, órdenes, etiquetas, comprobantes y reportes;
- los artefactos están clasificados por familia, medio, función y evidencia;
- se cubren solicitudes, producción, compras, inventario, venta, domicilios, trabajo, Marketing, soporte, mantenimiento y etiquetas;
- se distinguen documentos físicos, registros digitales, imágenes y artefactos ausentes;
- se separan artefactos duplicados;
- no se presentan campos inferidos como confirmados;
- cada incertidumbre tiene destino en `OPS-AUD-015`;
- cada brecha tiene destino exacto;
- no se ha diseñado el flujo detallado de `OPS-AUD-007`;
- no se han definido aprobaciones de `OPS-AUD-009`;
- no se ha diseñado el modelo TO-BE;
- no se ha autorizado implementación.

---

#### 24. Resultado y continuidad

Con la aprobación de `OPS-AUD-006` quedará establecida la línea base inicial de:

- solicitudes;
- remisiones;
- órdenes;
- documentos de recepción;
- facturas y comprobantes;
- artefactos de producción;
- registros de inventario y merma;
- documentos de venta;
- pedidos externos;
- reportes laborales;
- documentos de Marketing;
- soportes de mantenimiento;
- etiquetas y rótulos;
- reportes actuales;
- artefactos ausentes;
- duplicaciones documentales.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-007
— Documentar flujo ordinario de cada proceso
```

`OPS-AUD-007` deberá utilizar este inventario para describir cómo cada artefacto nace, cambia de actor, cambia de herramienta, produce un efecto y termina, sin diseñar todavía el proceso TO-BE.



### ✅ OPS-AUD-007 — Documentar flujo ordinario de cada proceso

**Estado:** APROBADO  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Documentación AS-IS de los flujos ordinarios actuales  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-006`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando un paso, actor, artefacto o traspaso no esté suficientemente confirmado

---

#### 1. Propósito

Documentar cómo se ejecutan actualmente los procesos ordinarios de Vento Group, desde su evento de inicio hasta su resultado operativo inmediato.

Cada flujo deberá identificar:

- evento de inicio;
- actor iniciador;
- actor ejecutor;
- herramientas y artefactos;
- secuencia habitual;
- traspasos entre personas, áreas, sedes o sistemas;
- resultado;
- receptor;
- punto de cierre operativo actual;
- puntos donde el flujo depende de memoria, comunicación verbal, papel o transcripción.

Esta tarea describe el proceso ordinario.

No resuelve todavía:

- excepciones;
- anulaciones;
- devoluciones;
- reversiones;
- faltantes no ordinarios;
- aprobaciones;
- segregación de funciones;
- tiempos medidos;
- volumen;
- contingencias;
- diseño TO-BE;
- pantallas;
- datos;
- integraciones;
- implementación.

```text
FLUJO AS-IS
→ describe cómo ocurre hoy

FLUJO AS-IS
≠ flujo TO-BE obligatorio
```

---

#### 2. Convención de modelado

Cada proceso se describe con esta estructura:

```text
INICIO
→ RECEPCIÓN
→ EJECUCIÓN
→ TRASPASO
→ RESULTADO
→ CIERRE ACTUAL
```

Campos mínimos:

| Campo           | Descripción                              |
| --------------- | ---------------------------------------- |
| `process_code`  | Código provisional del proceso           |
| `process_name`  | Nombre operativo                         |
| `trigger`       | Evento que lo inicia                     |
| `initiator`     | Actor que lo origina                     |
| `executor`      | Actor que realiza la actividad principal |
| `tools`         | Herramientas y artefactos utilizados     |
| `ordinary_flow` | Secuencia habitual                       |
| `handoff`       | Traspasos entre actores o sistemas       |
| `result`        | Resultado inmediato                      |
| `receiver`      | Actor que recibe el resultado            |
| `current_close` | Condición actual de cierre               |
| `known_gap`     | Brecha conocida                          |
| `next_task`     | Tarea exacta que profundiza              |

---

#### 3. Inventario maestro de procesos ordinarios

| Código     | Proceso                              | Inicio                                         | Resultado ordinario                          |
| ---------- | ------------------------------------ | ---------------------------------------------- | -------------------------------------------- |
| `PROC-001` | Solicitud de remisión interna        | Área detecta necesidad                         | Solicitud enviada al grupo                   |
| `PROC-002` | Consolidación productiva             | Llegan solicitudes de sedes                    | Cantidad total definida por producto         |
| `PROC-003` | Preparación matutina de remisión     | Conductor inicia jornada                       | Canastas organizadas por destino             |
| `PROC-004` | Producción de Panadería y Bollería   | Plan anticipado y remisiones                   | Producto disponible para despacho            |
| `PROC-005` | Producción de Repostería             | Remisiones recibidas                           | Producto separado por sede                   |
| `PROC-006` | Producción de Tortas                 | Remisiones recibidas                           | Tortas estandarizadas terminadas             |
| `PROC-007` | Producción de Galletería             | Stock bajo y remisiones                        | Galletas disponibles por sede                |
| `PROC-008` | Producción de Cocina Caliente        | Plan semanal                                   | Preparaciones porcionadas en frío            |
| `PROC-009` | Producción semanal de Barra          | Día fijo de producción                         | Producto porcionado y almacenado             |
| `PROC-010` | Alistamiento y despacho de la tarde  | Producción deja producto terminado             | Vehículo cargado por destino                 |
| `PROC-011` | Transporte y entrega a sede          | Vehículo sale del Centro de Producción         | Productos recibidos en sede                  |
| `PROC-012` | Retorno y lavado de canastas         | Canasta vacía o sucia                          | Canasta seca y reutilizable                  |
| `PROC-013` | Recepción de proveedor               | Proveedor llega                                | Mercancía ubicada y factura firmada          |
| `PROC-014` | Retiro de insumos de Bodega          | Área necesita producto                         | Insumo trasladado al área                    |
| `PROC-015` | Compra a proveedor                   | Se detecta faltante                            | Pedido confirmado                            |
| `PROC-016` | Recepción de fruver                  | Proveedor llega a Vento Café                   | Producto recibido por área                   |
| `PROC-017` | Apertura de Vento Café               | Inicia turno                                   | Local, Caja y canales habilitados            |
| `PROC-018` | Atención de mesa en Vento Café       | Cliente ocupa mesa                             | Pedido servido y cuenta abierta              |
| `PROC-019` | Preparación en Cocina de Vento Café  | Comanda impresa                                | Plato listo en ventana                       |
| `PROC-020` | Preparación en Bar y Barra           | Comanda impresa                                | Bebida o producto listo                      |
| `PROC-021` | Pago en Vento Café                   | Cliente solicita cuenta                        | Venta cerrada y facturada                    |
| `PROC-022` | Pedido Rappi                         | Pedido entra en Rappi                          | Pedido transcrito, preparado y entregado     |
| `PROC-023` | Pedido directo o domicilio           | Pedido entra por ManyChat                      | Pedido registrado y despachado               |
| `PROC-024` | Atención ordinaria en Saudo          | Cliente pide en mesa, vitrina o canal externo  | Pedido servido y cobrado                     |
| `PROC-025` | Preparación ordinaria en Saudo       | Pedido registrado o comunicado                 | Producto listo                               |
| `PROC-026` | Atención ordinaria en Molka          | Cliente pide en mostrador                      | Pedido pagado y entregado                    |
| `PROC-027` | Cierre y relevo de Caja              | Termina turno                                  | Caja cerrada y siguiente turno abierto       |
| `PROC-028` | Entrega de efectivo a Gerencia       | Existe excedente del cierre                    | Dinero contado y recibido                    |
| `PROC-029` | Registro contable de soporte         | Gerencia recibe factura o comprobante          | Documento cargado o entregado a Contabilidad |
| `PROC-030` | Programación de turnos               | Gerencia organiza personal                     | Horario publicado en VISO                    |
| `PROC-031` | Consulta y check-in                  | Trabajador llega al turno                      | Asistencia registrada en ANIMA               |
| `PROC-032` | Revisión de asistencia               | Gerencia descarga reporte                      | Novedades identificadas                      |
| `PROC-033` | Liquidación de propinas              | Existen reportes y valor a distribuir          | Dinero entregado al trabajador               |
| `PROC-034` | Pago de nómina                       | Nómina preparada                               | Pago ejecutado por Bancolombia Nóminas       |
| `PROC-035` | Reclutamiento y contratación         | Se abre vacante                                | Trabajador contratado                        |
| `PROC-036` | Inducción operativa                  | Trabajador inicia                              | Trabajador acompaña y aprende en operación   |
| `PROC-037` | Alta de acceso                       | Gerencia solicita cuenta                       | Cuenta creada en ANIMA o Vento OS            |
| `PROC-038` | Baja de acceso                       | Jefe de Operaciones descubre retiro            | Cuenta desactivada                           |
| `PROC-039` | Solicitud y publicación de Marketing | Nathalia o Jeo solicitan contenido             | Pieza publicada                              |
| `PROC-040` | Venta y despacho de Vaila Vainilla   | Pedido entra en Shopify o canal complementario | Paquete entregado a mensajería               |
| `PROC-041` | Soporte tecnológico                  | Se reporta una falla                           | Equipo o servicio restablecido               |
| `PROC-042` | Mantenimiento correctivo             | Se detecta una falla física                    | Técnico repara                               |
| `PROC-043` | Disposición de merma                 | Trabajador detecta producto dañado             | Producto eliminado y registrado              |
| `PROC-044` | Reasignación de producto a Molka     | Producto pierde frescura comercial             | Producto recibido por Molka                  |
| `PROC-045` | Servicios Generales                  | Inicia jornada o llega instrucción             | Área o elemento limpio                       |

---

#### 4. Abastecimiento interno y remisiones

##### 4.1. Solicitud de remisión interna — `PROC-001`

**Inicio**

El área o sede determina qué productos necesita para la siguiente jornada o período inmediato.

**Actores**

- Caja o Servicio de Vento Café;
- Cocina de Vento Café;
- Barra de Vento Café;
- responsable de Saudo;
- responsable de Molka.

**Flujo ordinario**

```text
RESPONSABLE DEL ÁREA
→ REVISA NECESIDADES
→ ABRE O COMPLETA EXCEL
→ REGISTRA CANTIDADES
→ TOMA CAPTURA O FOTOGRAFÍA
→ ENVÍA AL GRUPO
→ PRODUCCIÓN Y CONDUCTOR RECIBEN
```

La solicitud suele enviarse al final del turno.

Vento Café envía solicitudes separadas por área.

Saudo y Molka envían una solicitud unificada.

**Herramientas**

- Excel;
- captura o fotografía;
- WhatsApp.

**Resultado**

Solicitud visible en el grupo operativo.

**Cierre actual**

El proceso se considera iniciado cuando la captura ha sido enviada. No existe confirmación estructurada de recepción.

**Brechas relacionadas**

- solicitud olvidada;
- versión no controlada;
- ausencia de confirmación;
- identificación individual incompleta.

Destinos: `OPS-AUD-008`, `OPS-AUD-012`, `OPS-AUD-013` y `OPS-AUD-015`.

---

##### 4.2. Consolidación por área productiva — `PROC-002`

**Inicio**

Las áreas productivas reciben varias solicitudes.

**Actores**

- responsables de Panadería;
- Repostería;
- Pastelería;
- Galletería;
- otras áreas productivas.

**Flujo ordinario**

```text
CAPTURAS DE VARIAS SEDES
→ RESPONSABLE REVISA PRODUCTOS
→ SUMA CANTIDADES
→ REGISTRA TOTAL EN TABLERO O TELÉFONO
→ DISTRIBUYE EL TRABAJO
```

**Resultado**

Cantidad total aproximada que debe producir el área.

**Cierre actual**

El responsable considera consolidada la necesidad cuando dispone de un total utilizable.

**Brecha**

El consolidado no queda necesariamente relacionado con cada solicitud original.

Destino: `OPS-AUD-012` y `OPS-AUD-013`.

---

##### 4.3. Preparación matutina de remisión — `PROC-003`

**Inicio**

El conductor llega aproximadamente a las 05:30 al Centro de Producción.

**Flujo ordinario**

```text
CONDUCTOR ABRE EL CENTRO
→ REVISA REMISIONES DEL DÍA ANTERIOR
→ RECORRE BODEGA Y COCINA CALIENTE
→ UBICA PRODUCTOS POR EXPERIENCIA
→ RETIRA CANTIDADES DISPONIBLES
→ ORGANIZA CANASTAS POR DESTINO
→ CARGA EL VEHÍCULO
```

Los productos se ubican mediante:

- memoria;
- experiencia;
- marcaciones;
- conocimiento visual.

**Resultado**

Remisiones de la mañana preparadas, principalmente para Vento Café, Saudo y Molka.

**Cierre actual**

El conductor sale con las canastas organizadas.

**Brecha**

La cantidad faltante puede no notificarse antes de la entrega.

Destino: `OPS-AUD-008`.

---

#### 5. Producción central

##### 5.1. Panadería y Bollería — `PROC-004`

**Inicio**

El flujo combina:

- planificación anticipada;
- fermentaciones;
- stock de masas;
- remisiones del día.

**Flujo ordinario**

```text
JEFE DE PANADERÍA REVISA NECESIDADES
→ DEFINE CANTIDADES POR EXPERIENCIA
→ DISTRIBUYE TAREAS
→ EQUIPO PREPARA MASAS
→ FERMENTA O REPOSA
→ HORNEA SEGÚN REMISIONES
→ EMPACA
→ DEJA PRODUCTO EN CANASTAS O BANDEJAS
```

Los productos no se separan formalmente por sede.

El conductor reconoce y distribuye.

**Resultado**

Producto terminado disponible para despacho.

**Cierre actual**

El área deja la producción en el punto acordado y puede reportar el resultado en el grupo.

**Brechas**

- reporte no controla despacho;
- faltantes sin aviso preventivo;
- prioridad cultural entre sedes.

Destinos: `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

---

##### 5.2. Repostería — `PROC-005`

**Inicio**

Angélica revisa las remisiones.

**Flujo ordinario**

```text
ANGÉLICA REVISA SOLICITUDES
→ PRIORIZA PRODUCTOS
→ DISTRIBUYE A CHELSY Y VALENTINA
→ EQUIPO PRODUCE
→ EMPACA
→ SEPARA POR SEDE
→ DEJA EN CANASTAS
```

La sede se reconoce por la combinación de productos, no por etiqueta formal.

**Resultado**

Productos de Repostería separados por sede.

**Cierre actual**

Canastas disponibles para el conductor.

---

##### 5.3. Pastelería y Tortas — `PROC-006`

**Inicio**

Angélica identifica las tortas requeridas.

**Flujo ordinario**

```text
ANGÉLICA REVISA REMISIONES
→ INSTRUYE A VALENTINA
→ VALENTINA EJECUTA PROCESO COMPLETO
→ TERMINA TORTAS ESTANDARIZADAS
→ DEJA PRODUCTO DISPONIBLE
```

Después, Valentina puede apoyar otras áreas.

**Resultado**

Tortas listas para distribución.

**Cierre actual**

El conductor identifica el destino.

**Brecha**

No existe identificación formal por sede.

Destino: `OPS-AUD-013`.

---

##### 5.4. Galletería — `PROC-007`

**Inicio**

El stock disponible disminuye o se requiere hornear para cubrir remisiones.

**Flujo ordinario**

```text
TRABAJADORA REVISA STOCK
→ CONSULTA A ANGÉLICA
→ PREPARA MASA SI SE AUTORIZA OPERATIVAMENTE
→ HORNEA CANTIDAD NECESARIA
→ SEPARA POR SEDE
```

Una o dos recetas producen aproximadamente 104 galletas.

**Resultado**

Stock disponible y producto separado por sede.

**Cierre actual**

Canastas listas para despacho.

**Pendiente**

Nombre y alcance exacto de la responsable: `OPS-AUD-015`.

---

##### 5.5. Cocina Caliente — `PROC-008`

**Inicio**

Día de producción definido por el plan semanal.

**Flujo ordinario**

```text
COCINERA REVISA PLAN Y EXISTENCIAS
→ PRIORIZA PREPARACIONES FALTANTES
→ PRODUCE
→ PORCIONA
→ EMPACA AL VACÍO
→ REFRIGERA
```

La cocinera no trabaja directamente desde la remisión.

Después:

```text
CONDUCTOR REVISA REMISIÓN
→ RETIRA MÚLTIPLOS DE LA PRESENTACIÓN
→ DESPACHA
```

**Resultado**

Preparaciones disponibles en frío.

**Cierre actual**

Producto almacenado y accesible para el conductor.

**Pendiente**

Confirmar si el plan está escrito: `OPS-AUD-015`.

---

##### 5.6. Producción semanal de Barra — `PROC-009`

**Inicio**

Llega el martes y existe una persona programada.

**Flujo ordinario**

```text
RESPONSABLE DE PROGRAMACIÓN DEFINE ROTACIÓN
→ TRABAJADOR DE VENTO CAFÉ O SAUDO ASISTE
→ PRODUCE CANTIDAD ESTÁNDAR
→ PORCIONA
→ CONGELA O REFRIGERA
→ CONDUCTOR RETIRA SEGÚN REMISIÓN
```

**Resultado**

Preparaciones de Barra almacenadas.

**Cierre actual**

Producto disponible para Vento Café o Saudo.

---

#### 6. Alistamiento, transporte y recepción

##### 6.1. Alistamiento de la tarde — `PROC-010`

**Inicio**

Las áreas productivas terminan el trabajo del día.

**Flujo ordinario**

```text
ÁREA PRODUCTIVA EMPACA
→ PRODUCTO REFRIGERADO VA A CUARTO FRÍO
→ PRODUCTO CONGELADO VA A CONGELADOR
→ PRODUCTO SECO QUEDA EN MESÓN O CANASTA
→ CONDUCTOR LLEGA APROXIMADAMENTE A LAS 17:00
→ RECOGE PRODUCCIÓN
→ COMPLETA BODEGA Y COCINA CALIENTE
→ ORGANIZA POR DESTINO
→ CARGA VEHÍCULO
```

El proceso puede tomar entre 1,5 y 2 horas.

**Resultado**

Vehículo cargado.

**Cierre actual**

El conductor sale del Centro de Producción.

---

##### 6.2. Transporte y recepción en sede — `PROC-011`

**Inicio**

El conductor llega a la sede.

**Flujo ordinario**

```text
CONDUCTOR DESCARGA CANASTAS
→ RESPONSABLE DEL ÁREA O DELEGADO RECIBE
→ CUENTA O REVISA
→ GUARDA PRODUCTOS
```

Prioridad de almacenamiento:

1. congelados;
2. refrigerados;
3. productos secos.

En momentos de carga:

- Caja o mostrador puede dejar productos en canastas o bandejas;
- Cocina y Barra pueden dejarlos temporalmente sobre mesones.

**Resultado**

Producto disponible en sede.

**Cierre actual**

El área guarda lo recibido.

**Brecha**

No existe confirmación estructurada de recepción completa o diferencia.

Destino: `OPS-AUD-008` y `OPS-AUD-013`.

---

##### 6.3. Retorno y lavado de canastas — `PROC-012`

**Inicio**

Una canasta queda vacía o se acumula suciedad.

**Flujo ordinario**

```text
SEDE ENTREGA CANASTAS VACÍAS
→ CONDUCTOR LAS RECOGE
→ REGRESA AL CENTRO DE PRODUCCIÓN
→ DEJA EN BODEGA O PASILLO
→ NATHALIA O RESPONSABLE SOLICITA LAVADO
→ SERVICIOS GENERALES LAVA
→ CANASTAS SECAN EN ZONA ABIERTA
→ CONDUCTOR VERIFICA VISUALMENTE
→ REUTILIZA
```

**Resultado**

Canasta disponible.

**Cierre actual**

El conductor considera que está seca y la usa.

**Brechas**

- sin custodio;
- sin estado;
- sin conteo;
- sin trazabilidad por sede.

Destinos: `OPS-AUD-010`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 7. Compras, proveedores y Bodega

##### 7.1. Recepción de proveedor — `PROC-013`

**Inicio**

El proveedor llega al Centro de Producción.

**Flujo ordinario confirmado cuando recibe el Jefe de Operaciones**

```text
PROVEEDOR ENTREGA MERCANCÍA
→ RECEPTOR REVISA VISUALMENTE
→ INDICA UBICACIÓN
→ SUPERVISA ORGANIZACIÓN
→ COMPARA CONTRA FACTURA
→ FIRMA
→ ENTREGA COPIA AL PROVEEDOR
→ CONSERVA SOPORTE
→ FACTURA LLEGA A GERENCIA
```

**Resultado**

Mercancía ubicada y documento firmado.

**Cierre actual**

El proveedor se retira y la factura continúa hacia Gerencia.

**Pendiente**

Flujo cuando recibe otra persona: `OPS-AUD-015`.

---

##### 7.2. Retiro de insumos de Bodega — `PROC-014`

**Inicio**

Un área necesita insumos.

**Flujo ordinario**

```text
TRABAJADOR INGRESA A BODEGA
→ IDENTIFICA PRODUCTO
→ DEFINE CANTIDAD POR RECETA, PEDIDO, SOLICITUD O EXPERIENCIA
→ RETIRA
→ LLEVA AL ÁREA
→ UTILIZA
→ SOBRANTE PERMANECE EN EL ÁREA
```

**Resultado**

Área abastecida.

**Cierre actual**

El producto queda en la estación o almacenamiento interno del área.

**Brechas**

- ingreso libre;
- sin registro completo;
- sin devolución de sobrantes;
- sin inventario confiable.

Destinos: `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

---

##### 7.3. Compra a proveedor — `PROC-015`

**Inicio**

Un área reporta faltante o Gerencia pregunta qué hace falta.

**Flujo ordinario**

```text
ÁREAS INFORMAN NECESIDADES
→ GERENTE GENERAL CONSOLIDA
→ DEFINE CANTIDADES POR EXPERIENCIA Y URGENCIA
→ GERENTE GENERAL O LEIDY ESCRIBE AL PROVEEDOR
→ PROVEEDOR CONFIRMA DISPONIBILIDAD, PRECIO Y FECHA
→ PEDIDO QUEDA ACORDADO
→ PROVEEDOR ENTREGA
```

**Resultado**

Pedido confirmado.

**Cierre actual**

La compra continúa con la recepción física.

**Brechas**

- sin inventario confiable;
- sin orden formal confirmada;
- aprobación y comparación de precios no documentadas.

Destinos: `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-015`.

---

##### 7.4. Recepción de fruver — `PROC-016`

**Inicio**

Proveedor de fruver llega a Vento Café.

**Flujo ordinario conocido**

```text
PROVEEDOR ENTREGA
→ COCINA O BARRA RECIBE SEGÚN SOLICITANTE
→ PRODUCTO SE UTILIZA EN VENTO CAFÉ
→ PARTE PUEDE REDISTRIBUIRSE A SAUDO
```

**Resultado**

Fruver disponible para producción o servicio.

**Pendientes**

- comparación contra pedido;
- factura;
- redistribución a Saudo;
- registro de diferencia.

Destino: `OPS-AUD-015`.

---

#### 8. Vento Café

##### 8.1. Apertura — `PROC-017`

**Inicio**

Comienza el turno.

**Flujo ordinario**

```text
EQUIPO ABRE EL LOCAL
→ PREPARA ZONAS
→ CAJERO INICIA SESIÓN
→ CUENTA EFECTIVO
→ REGISTRA BASE
→ ACTIVA RAPPI
→ ABRE MANYCHAT
→ ORGANIZA VITRINA
→ MESEROS DEFINEN ZONAS
```

**Resultado**

Vento Café listo para operar.

**Cierre actual**

Canales, Caja y áreas habilitados.

---

##### 8.2. Atención de mesa — `PROC-018`

**Inicio**

Cliente ocupa una mesa.

**Flujo ordinario**

```text
MESERO ATIENDE
→ REGISTRA PEDIDO EN TABLET
→ SELECCIONA MESA
→ MAKOS ABRE CUENTA
→ IMPRIME COMANDAS POR ESTACIÓN
→ ÁREAS PREPARAN
→ MESERO DISPONIBLE RECOGE
→ ENTREGA A MESA
→ NUEVOS PEDIDOS SE AGREGAN A LA MISMA CUENTA
```

**Resultado**

Productos servidos y cuenta abierta.

**Cierre actual**

El proceso termina cuando el cliente solicita pagar.

---

##### 8.3. Cocina — `PROC-019`

**Inicio**

Se imprime una comanda.

**Flujo ordinario**

```text
COCINERO CERCANO RECOGE
→ COLOCA EN COMANDERA
→ EQUIPO DISTRIBUYE TAREAS
→ PREPARA POR ORDEN DE LLEGADA
→ COLOCA PLATO EN VENTANA
→ TOCA CAMPANA
→ DICE MESA
→ MESERO RECOGE
```

**Resultado**

Plato entregado a Servicio.

**Cierre actual**

El mesero retira el plato.

**Brecha**

No existe estado digital de listo, recogido o entregado.

---

##### 8.4. Bar y Barra — `PROC-020`

**Inicio**

Makos imprime en estación caliente o fría.

**Flujo ordinario**

```text
TRABAJADOR REVISA COMANDA
→ PREPARA POR ORDEN DE LLEGADA
→ TERMINA PRODUCTO
→ TOCA CAMPANA
→ MESERO DISPONIBLE RECOGE
```

Cuando trabajan dos personas se reparten de manera flexible.

Cuando trabaja una, cubre ambas estaciones.

**Resultado**

Bebida o producto entregado a Servicio.

---

##### 8.5. Pago — `PROC-021`

**Inicio**

Cliente solicita cuenta.

**Flujo ordinario**

```text
TRABAJADOR IMPRIME RESUMEN
→ CLIENTE REVISA
→ DEFINE MEDIO DE PAGO
```

**Efectivo**

```text
CLIENTE PAGA EN CAJA
→ CAJERO RECIBE
→ REGISTRA
→ ENTREGA CAMBIO
→ CIERRA MESA
→ IMPRIME FACTURA
```

**Tarjeta**

```text
TRABAJADOR LLEVA DATÁFONO
→ PROCESA PAGO
→ INFORMA VERBALMENTE A CAJA
→ CAJERO REGISTRA TARJETA
→ CIERRA MESA
→ IMPRIME FACTURA
```

**Resultado**

Venta cerrada.

**Brecha**

La persona que procesa físicamente la tarjeta puede ser distinta de quien registra el pago.

Destino: `OPS-AUD-009` y `OPS-AUD-013`.

---

##### 8.6. Pedido Rappi — `PROC-022`

**Inicio**

Rappi recibe un pedido.

**Flujo ordinario**

```text
CAJERO REVISA RAPPI
→ TRANSCRIBE A MAKOS
→ CLASIFICA COMO RAPPI
→ MAKOS ENVÍA A ESTACIONES
→ ÁREAS PREPARAN
→ PEDIDO SE EMPACA
→ DOMICILIARIO RECOGE
```

**Resultado**

Pedido entregado al domiciliario.

**Cierre actual**

La entrega al domiciliario cierra el proceso interno ordinario.

**Brecha**

No se confirmó conciliación automática entre estados de Rappi y Makos.

---

##### 8.7. Pedido directo o domicilio — `PROC-023`

**Inicio**

Cliente solicita por ManyChat u otro canal directo.

**Flujo ordinario**

```text
CAJERO RECIBE DATOS
→ CONFIRMA PEDIDO Y PAGO
→ TRANSCRIBE A MAKOS COMO DOMICILIO
→ SOLICITA MENSAJERO
→ ÁREAS PREPARAN
→ FACTURA INCLUYE DATOS DEL CLIENTE
→ CAJERO INDICA AL MENSAJERO SI DEBE PAGAR
→ MENSAJERO RECOGE
→ CAJERO AVISA AL CLIENTE QUE VA EN CAMINO
```

**Modalidad prepagada**

Vento paga en efectivo el valor del domicilio.

**Modalidad efectivo**

El mensajero entrega previamente a Vento el valor del pedido y después cobra al cliente pedido más domicilio.

**Resultado**

Pedido en ruta.

**Cierre actual**

No existe confirmación rutinaria de entrega; se considera cerrado salvo incidente.

---

#### 9. Saudo

##### 9.1. Atención y servicio — `PROC-024`

**Inicio**

El cliente:

- ocupa una mesa;
- compra en vitrina;
- pide por Rappi;
- solicita domicilio.

**Flujo de mesa**

```text
MESERO REGISTRA EN TABLET O CELULAR
→ ASOCIA A MESA
→ CAJA Y COCINA CONOCEN PEDIDO
→ COCINA PREPARA
→ MESERO O CAJERO ENTREGA
→ CUENTA PERMANECE ABIERTA
→ CLIENTE PAGA
```

**Flujo de vitrina**

```text
CLIENTE PIDE EN CAJA
→ CAJERO REGISTRA
→ ENTREGA O COORDINA PREPARACIÓN
→ COBRA
```

**Resultado**

Pedido servido y venta cerrada.

---

##### 9.2. Cocina de Saudo — `PROC-025`

**Inicio**

Pedido registrado o comunicado verbalmente.

**Flujo ordinario**

```text
CAJA O SERVICIO COMUNICA
→ COCINEROS CONSULTAN MAKOS CUANDO HAY VARIOS
→ COCINERO PRINCIPAL Y APOYO SE COORDINAN
→ PREPARAN
→ ANUNCIAN VERBALMENTE
→ MESERO O CAJERO ENTREGA
```

Las pizzas se preparan según capacidad de dos hornos.

**Resultado**

Producto entregado a Servicio.

**Cierre actual**

El pedido sale de Cocina.

---

#### 10. Molka

##### 10.1. Atención integral — `PROC-026`

**Inicio**

Cliente pide en mostrador.

**Flujo ordinario**

```text
TRABAJADOR RECIBE PEDIDO
→ REGISTRA EN MAKOS
→ COBRA
→ CONSULTA PEDIDO
→ PREPARA O CALIENTA
→ ENTREGA EN MOSTRADOR O MESA
```

Cuando trabajan dos personas, ambas pueden ejecutar cualquier paso y se coordinan según la carga.

**Resultado**

Pedido pagado y entregado.

**Cierre actual**

Entrega al cliente.

---

#### 11. Caja, Gerencia y Contabilidad

##### 11.1. Cierre y relevo de Caja — `PROC-027`

**Inicio**

Termina el turno del cajero.

**Flujo ordinario**

```text
CAJERO CIERRA MAKOS
→ CUENTA EFECTIVO
→ COMPARA
→ TERMINA SESIÓN
→ SIGUIENTE CAJERO CUENTA BASE
→ ABRE SU SESIÓN
```

Vento Café maneja dos cierres por día.

Otras sedes normalmente un cierre.

**Resultado**

Turnos separados operativamente.

---

##### 11.2. Entrega de efectivo a Gerencia — `PROC-028`

**Inicio**

La sede dispone del excedente del día anterior.

**Flujo ordinario**

```text
SEDE CONSERVA BASE
→ ENTREGA EXCEDENTE
→ ENTREGA CIERRE IMPRESO
→ GERENTE GENERAL CUENTA
→ COMPARA CONTRA CIERRE
→ RECIBE CUSTODIA
→ ADMINISTRA SEGÚN NECESIDADES
```

**Resultado**

Efectivo bajo custodia de Gerencia.

**Brecha**

Algunos movimientos se registran como gasto en lugar de retiro.

---

##### 11.3. Registro contable — `PROC-029`

**Inicio**

Gerencia recibe una factura o comprobante.

**Flujo ordinario**

```text
SOPORTE LLEGA A GERENCIA
→ SE ENTREGA O CARGA PARA CONTABILIDAD
→ CONTABILIDAD REGISTRA
→ CONCILIACIÓN DETECTA FALTANTES
```

**Resultado**

Transacción soportada en el sistema contable.

**Pendiente**

Ruta exacta por tipo de soporte: `OPS-AUD-015`.

---

#### 12. Programación, asistencia, propinas y nómina

##### 12.1. Programación — `PROC-030`

**Inicio**

Se requiere organizar los turnos siguientes.

**Flujo ordinario**

```text
GERENTE GENERAL + GERENTE VENTO CAFÉ
→ REVISAN NECESIDADES
→ ASIGNAN PERSONAS, HORAS Y SEDES
→ PUBLICAN EN VISO
→ ANIMA NOTIFICA
```

**Resultado**

Horario visible para el trabajador.

**Cierre actual**

Turno publicado; no requiere aceptación.

---

##### 12.2. Consulta y check-in — `PROC-031`

**Inicio**

Trabajador consulta su horario y llega a la sede.

**Flujo ordinario**

```text
TRABAJADOR ABRE ANIMA
→ CONSULTA TURNO
→ LLEGA
→ REALIZA CHECK-IN
```

**Resultado**

Asistencia registrada.

---

##### 12.3. Revisión de asistencia — `PROC-032`

**Inicio**

Gerencia necesita revisar cumplimiento.

**Flujo ordinario**

```text
GERENTE GENERAL DESCARGA REPORTE DE VISO
→ REVISA RETRASOS Y AUSENCIAS
→ IDENTIFICA NOVEDADES
→ UTILIZA INFORMACIÓN EN DECISIONES POSTERIORES
```

**Resultado**

Novedades laborales conocidas.

---

##### 12.4. Propinas — `PROC-033`

**Inicio**

Existe un valor de propinas por distribuir.

**Flujo ordinario**

```text
GERENTE GENERAL CALCULA PROMEDIO
→ DISTRIBUYE POR TRABAJADOR
→ REVISA RETRASOS O AUSENCIAS
→ APLICA AJUSTES MANUALES
→ ENTREGA EFECTIVO
```

**Resultado**

Trabajador recibe propina.

**Cierre actual**

Entrega en efectivo.

**Brecha**

No existe registro estructurado de valor original, descuento, motivo y valor final.

---

##### 12.5. Nómina — `PROC-034`

**Inicio**

Se prepara el período de nómina.

**Flujo ordinario**

```text
GERENCIA O CONTABILIDAD PREPARA INFORMACIÓN
→ CARGA EN BANCOLOMBIA NÓMINAS
→ EJECUTA PAGO CONJUNTO
```

**Resultado**

Nómina formal pagada.

---

#### 13. Gestión laboral y accesos

##### 13.1. Reclutamiento y contratación — `PROC-035`

**Inicio**

Existe una vacante.

**Flujo ordinario**

```text
VACANTE SE PUBLICA EN INSTAGRAM
→ CANDIDATOS ENVÍAN HOJA DE VIDA
→ GERENTE GENERAL FILTRA
→ LLAMA
→ ENTREVISTA
→ CANDIDATO REALIZA PRUEBA
→ ÁREA + GERENTE GENERAL + NATHALIA OBSERVAN
→ NATHALIA Y GERENTE GENERAL DECIDEN
→ INFORMACIÓN VA A ABOGADOS
→ ABOGADOS FORMALIZAN
```

**Resultado**

Trabajador contratado.

**Brecha**

La evaluación de prueba no cuenta con formato estructurado confirmado.

---

##### 13.2. Inducción — `PROC-036`

**Inicio**

Trabajador comienza.

**Flujo ordinario**

```text
TRABAJADOR SE PRESENTA
→ ACOMPAÑA A EQUIPO O PERSONA DISPONIBLE
→ OBSERVA
→ EJECUTA CON APOYO
→ APRENDE DURANTE EL TRABAJO
```

En Vento Café, la gerente de sede guía el proceso.

Saudo y Molka no tienen modelo formal confirmado.

**Resultado**

Trabajador empieza a operar.

**Cierre actual**

No existe evaluación formal de capacidades.

---

##### 13.3. Alta de acceso — `PROC-037`

**Inicio**

Gerencia informa que una persona requiere acceso.

**Flujo ordinario**

```text
GERENCIA CONTACTA AL JEFE DE OPERACIONES
→ ENVÍA DATOS
→ JEFE DE OPERACIONES CREA CUENTA
→ TRABAJADOR RECIBE ACCESO
```

Aplica a ANIMA y Vento OS.

**Resultado**

Cuenta habilitada.

---

##### 13.4. Baja de acceso — `PROC-038`

**Inicio real**

El Jefe de Operaciones descubre durante la operación que la persona se retiró.

**Flujo ordinario**

```text
RETIRO LABORAL OCURRE
→ NO HAY NOTIFICACIÓN FORMAL
→ JEFE DE OPERACIONES SE ENTERA INFORMALMENTE
→ IDENTIFICA CUENTAS
→ DESACTIVA MANUALMENTE
```

**Resultado**

Cuenta desactivada.

**Brecha crítica**

Puede existir un período en el que el ex trabajador conserve acceso.

Destinos: `OPS-AUD-009`, `OPS-AUD-011` y `OPS-AUD-013`.

---

#### 14. Marketing

##### 14.1. Solicitud y publicación — `PROC-039`

**Inicio**

Nathalia o Jeo solicitan contenido.

**Flujo ordinario**

```text
SOLICITUD VERBAL O WHATSAPP
→ TRABAJADOR INTERPRETA
→ TOMA FOTO, VIDEO O DISEÑA
→ PREPARA PIEZA
```

**Historia**

```text
PIEZA TERMINADA
→ PUBLICACIÓN NORMALMENTE DIRECTA
```

**Publicación permanente**

```text
PIEZA TERMINADA
→ NATHALIA O JEO REVISA
→ APRUEBA
→ QUIEN CREÓ PUBLICA
```

**Resultado**

Contenido publicado.

**Cierre actual**

Pieza visible en la red social.

**Pendiente**

Método de corrección cuando se rechaza: `OPS-AUD-015`.

---

#### 15. Vaila Vainilla

##### 15.1. Venta y despacho — `PROC-040`

**Inicio**

Pedido entra principalmente por Shopify o por un canal complementario.

**Flujo confirmado**

```text
JEO RECIBE Y REVISA
→ CANALIZA A TRABAJADORA DE VENTAS EN LÍNEA
→ TRABAJADORA PREPARA Y EMPACA
→ PEDIDOS SE ACUMULAN
→ MENSAJERÍA LLEGA A OFICINA
→ TRABAJADORA ENTREGA PAQUETES
```

**Resultado**

Paquete entregado al transportador.

**Cierre actual**

No está confirmado si el cierre ocurre al entregar al mensajero o al recibir prueba de entrega.

**Pendientes**

- guía;
- notificación;
- inventario;
- pago;
- devolución;
- entrega fallida.

Destino: `OPS-AUD-015`.

---

#### 16. Soporte y mantenimiento

##### 16.1. Soporte tecnológico — `PROC-041`

**Inicio**

Trabajador reporta una falla por WhatsApp o verbalmente.

**Flujo ordinario**

```text
JEFE DE OPERACIONES RECIBE
→ PRIORIZA SEGÚN IMPACTO
→ PAUSA DESARROLLO CUANDO ES NECESARIO
→ DIAGNOSTICA
→ APLICA SOLUCIÓN
→ CONFIRMA FUNCIONAMIENTO
```

**Resultado**

Equipo o servicio restablecido.

**Cierre actual**

Se considera cerrado cuando vuelve a funcionar.

**Brecha**

No se documenta causa, solución ni activo.

Destino: `OPS-AUD-013`.

---

##### 16.2. Mantenimiento correctivo — `PROC-042`

**Inicio**

Un equipo o instalación presenta una falla.

**Flujo ordinario**

```text
TRABAJADOR DETECTA
→ INFORMA A GERENTE GENERAL
→ GERENTE GENERAL CONTACTA TÉCNICO
→ TÉCNICO REVISA
→ CONSIGUE REPUESTO SI ES NECESARIO
→ REPARA
→ EQUIPO VUELVE A OPERAR
```

**Resultado**

Equipo restablecido.

**Cierre actual**

Reparación terminada.

**Bloqueos ordinarios conocidos**

- técnico no disponible;
- repuesto no disponible.

**Pendiente**

Circuito de factura: `OPS-AUD-015`.

---

#### 17. Mermas y transferencias informales

##### 17.1. Disposición de merma — `PROC-043`

**Inicio**

Trabajador detecta daño por olor, sabor, moho o defecto.

**Flujo ordinario**

```text
TRABAJADOR DETECTA
→ DECIDE DESCARTAR
→ ELIMINA PRODUCTO
→ REGISTRA PRODUCTO Y CANTIDAD EN HOJA DE MERMAS
```

**Resultado**

Producto retirado físicamente.

**Cierre actual**

Registro escrito en la hoja.

**Brechas**

- misma persona decide y registra;
- inventario no se actualiza;
- causa y lote no confirmados.

Destinos: `OPS-AUD-008`, `OPS-AUD-009` y `OPS-AUD-013`.

---

##### 17.2. Reasignación a Molka — `PROC-044`

**Inicio**

Un producto está menos fresco para la sede original, pero todavía es consumible.

**Flujo ordinario**

```text
TRABAJADOR IDENTIFICA PRODUCTO
→ DECIDE QUE PUEDE IR A MOLKA
→ ENTREGA AL CONDUCTOR
→ INFORMA VERBALMENTE QUE ESTÁ VIEJO
→ CONDUCTOR TRANSPORTA
→ MOLKA INCORPORA A SU STOCK
```

**Resultado**

Producto disponible en Molka.

**Cierre actual**

Molka lo recibe sin transferencia formal.

**Brechas**

- sin fecha;
- sin lote;
- sin cantidad documentada;
- sin origen;
- sin efecto de inventario;
- sin vida útil restante.

Destinos: `OPS-AUD-008`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 18. Servicios Generales

##### 18.1. Limpieza ordinaria — `PROC-045`

**Inicio**

Comienza la jornada, se detecta una necesidad o llega una instrucción.

**Flujo ordinario**

```text
SERVICIOS GENERALES RECIBE INSTRUCCIÓN
→ PRIORIZA PEDIDO DIRECTO
→ CONTINÚA RUTINA
→ OBSERVA NECESIDADES
→ LIMPIA ÁREAS, ZONAS O ELEMENTOS
→ RESULTADO SE VERIFICA VISUALMENTE
```

Jerarquía de prioridad:

1. Nathalia o Carlos;
2. responsables de área;
3. rutina;
4. criterio propio.

**Resultado**

Zona o elemento limpio.

**Cierre actual**

Resultado visible; no existe checklist.

---

#### 19. Traspasos ordinarios entre actores y sistemas

| Origen               | Traspaso                  | Destino                 |
| -------------------- | ------------------------- | ----------------------- |
| Área solicitante     | Captura de Excel          | Grupo operativo         |
| Grupo operativo      | Solicitud interpretada    | Área productiva         |
| Producción           | Producto terminado        | Conductor               |
| Conductor            | Canastas                  | Sede                    |
| Sede                 | Canastas vacías           | Conductor               |
| Proveedor            | Mercancía y factura       | Centro de Producción    |
| Centro de Producción | Factura                   | Gerencia                |
| Gerencia             | Soporte                   | Contabilidad            |
| Rappi                | Pedido                    | Caja                    |
| Caja                 | Transcripción             | Makos                   |
| ManyChat             | Pedido                    | Caja                    |
| Makos                | Comanda                   | Cocina, Bar o Barra     |
| Cocina               | Plato listo               | Servicio                |
| Servicio             | Aviso de pago con tarjeta | Caja                    |
| VISO                 | Turno                     | ANIMA                   |
| ANIMA                | Check-in                  | VISO                    |
| Gerencia             | Solicitud de acceso       | Jefatura de Operaciones |
| Nathalia o Jeo       | Solicitud de contenido    | Marketing               |
| Shopify              | Pedido                    | Jeo                     |
| Jeo                  | Pedido                    | Trabajadora de ventas   |
| Trabajadora          | Paquete                   | Mensajería              |

---

#### 20. Puntos ordinarios de cierre insuficiente

Un proceso puede considerarse terminado operativamente sin que exista evidencia completa.

| Proceso         | Cierre actual              | Evidencia faltante                     |
| --------------- | -------------------------- | -------------------------------------- |
| Solicitud       | Captura enviada            | Confirmación de recepción              |
| Producción      | Producto dejado en canasta | Relación exacta con solicitud          |
| Despacho        | Vehículo sale              | Lista confirmada de carga              |
| Recepción       | Producto guardado          | Confirmación y diferencia              |
| Domicilio       | Pedido sale                | Entrega al cliente                     |
| Soporte técnico | Equipo funciona            | Causa y solución                       |
| Mantenimiento   | Equipo reparado            | Historial y soporte asociado           |
| Inducción       | Trabajador empieza         | Validación de competencia              |
| Baja de acceso  | Cuenta desactivada         | Fecha de retiro y tiempo de exposición |
| Propina         | Efectivo entregado         | Cálculo y aceptación                   |
| Marketing       | Publicación visible        | Encargo, aprobación y resultado        |
| Vaila Vainilla  | Paquete al mensajero       | Entrega final                          |

Estos cierres se profundizarán en `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-011` y `OPS-AUD-013`.

---

#### 21. Hallazgos transversales

##### 21.1. Los procesos cambian de medio varias veces

```text
EXCEL
→ IMAGEN
→ WHATSAPP
→ TABLERO
→ PRODUCTO FÍSICO
→ CONTEO
```

La continuidad depende de interpretación humana.

##### 21.2. El traspaso suele ser el punto de pérdida de información

Los principales traspasos sensibles son:

- solicitud a producción;
- producción a conductor;
- conductor a sede;
- proveedor a receptor;
- receptor a Gerencia;
- Gerencia a Contabilidad;
- plataforma externa a Makos;
- trabajador a Caja;
- Gerencia a Jefatura de Operaciones.

##### 21.3. El proceso ordinario no siempre registra al actor efectivo

Esto ocurre en:

- cuentas Makos compartidas;
- tablets;
- recepción delegada;
- retiro libre de Bodega;
- registro de merma;
- cuentas de redes;
- Marketing;
- canastas;
- dispositivos compartidos.

##### 21.4. El resultado físico puede diferir del registro

Ejemplos:

- producción reportada frente a producto recogido;
- solicitud frente a cantidad enviada;
- Rappi frente a Makos;
- cierre frente a efectivo;
- inventario digital frente a inventario físico.

##### 21.5. Varios flujos terminan antes del resultado empresarial real

Ejemplos:

```text
DOMICILIO
→ termina internamente cuando sale
→ no cuando el cliente recibe

VAILA VAINILLA
→ termina al entregar al mensajero
→ entrega final no confirmada

SOPORTE
→ termina cuando funciona
→ causa no queda registrada
```

##### 21.6. La polivalencia es parte del flujo ordinario

En Saudo, Molka, Servicio, Bar, Barra y soporte:

- la misma persona puede cambiar de función;
- la función depende de la carga;
- el cargo fijo no describe toda la ejecución.

---

#### 22. Separación frente a tareas siguientes

##### 22.1. `OPS-AUD-008`

Deberá documentar:

- solicitud olvidada;
- faltante;
- parcial;
- sustitución;
- rechazo;
- producto dañado;
- corrección;
- anulación;
- devolución;
- reimpresión;
- entrega fallida;
- reversión de pago;
- cancelación externa.

##### 22.2. `OPS-AUD-009`

Deberá definir el estado AS-IS de:

- aprobadores;
- custodios;
- doble control;
- segregación;
- acciones sensibles;
- responsabilidad de dinero;
- acceso;
- compra;
- merma;
- transferencia;
- publicación.

##### 22.3. `OPS-AUD-010`

Deberá medir:

- frecuencia;
- volumen;
- duración;
- carga;
- estacionalidad;
- criticidad;
- ventanas de corte.

##### 22.4. `OPS-AUD-011`

Deberá modelar dependencias entre:

- sedes;
- áreas;
- sistemas;
- personas;
- proveedores;
- mensajerías;
- técnicos;
- abogados;
- bancos.

##### 22.5. `OPS-AUD-012`

Deberá identificar conciliaciones entre:

- Excel y captura;
- captura y producción;
- producción y despacho;
- despacho y recepción;
- Rappi y Makos;
- ManyChat y Makos;
- cierre y efectivo;
- factura y sistema contable;
- asistencia y propina;
- inventario físico y digital.

##### 22.6. `OPS-AUD-013`

Deberá consolidar pérdida de:

- actor;
- fecha;
- versión;
- estado;
- custodia;
- origen;
- destino;
- causa;
- evidencia;
- responsabilidad.

---

#### 23. Decisiones propuestas

1. El flujo ordinario se documenta desde el evento de inicio hasta el cierre operativo actual.
2. La solicitud de remisión inicia en el área y se ejecuta mediante Excel, captura y WhatsApp.
3. La consolidación productiva ocurre manualmente por área.
4. El conductor prepara las remisiones matutinas por experiencia y disponibilidad física.
5. La producción central combina planes anticipados, stock y solicitudes.
6. El alistamiento de la tarde depende de que cada área deje producto en puntos conocidos.
7. La recepción en sede se confirma físicamente, pero no mediante un registro estructurado.
8. Las canastas retornan y se lavan sin trazabilidad.
9. La recepción de proveedores se soporta en revisión física y factura.
10. Los retiros de Bodega se realizan sin control completo.
11. Las compras nacen de faltantes reportados y se acuerdan por WhatsApp.
12. Vento Café opera con comandas impresas y coordinación verbal.
13. Saudo opera con Makos, comunicación verbal y capacidad física limitada.
14. Molka opera con personal polivalente y pago previo.
15. Rappi y ManyChat requieren transcripción manual.
16. El cierre de Caja y la entrega de efectivo son procesos distintos.
17. VISO y ANIMA cubren programación y asistencia, pero no aceptación, reemplazo ni consecuencias económicas completas.
18. La propina se liquida manualmente fuera de los sistemas.
19. La contratación y la inducción carecen de evaluación estructurada confirmada.
20. La baja de acceso inicia tarde porque no existe notificación formal.
21. Marketing opera por encargos informales.
22. Vaila Vainilla cierra internamente al entregar a mensajería, sin prueba final confirmada.
23. Soporte y mantenimiento cierran cuando el activo vuelve a funcionar, sin historial consolidado.
24. La merma y la reasignación a Molka carecen de integración con inventario.
25. Ningún flujo AS-IS se adopta automáticamente como flujo TO-BE.
26. Ninguna decisión autoriza pantallas, tablas, código, migraciones, integraciones ni cambios en Supabase.

---

#### 24. Criterios de aceptación

`OPS-AUD-007` podrá aprobarse cuando se confirme que:

- los principales procesos ordinarios tienen inicio, ejecución, traspaso, resultado y cierre;
- se cubren remisiones, producción, logística, compras, venta, Caja, trabajo, Marketing, soporte, mantenimiento, merma y Vaila Vainilla;
- se identifican herramientas y artefactos;
- se documentan los traspasos;
- se separan hechos confirmados de pendientes;
- las excepciones permanecen reservadas para `OPS-AUD-008`;
- las aprobaciones permanecen reservadas para `OPS-AUD-009`;
- las mediciones permanecen reservadas para `OPS-AUD-010`;
- cada incertidumbre tiene destino exacto;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 25. Resultado y continuidad

Con la aprobación de `OPS-AUD-007` quedará establecida la línea base inicial de:

- flujos ordinarios;
- actores;
- eventos de inicio;
- herramientas;
- artefactos;
- traspasos;
- resultados;
- cierres actuales;
- puntos de pérdida;
- procesos híbridos;
- dependencias humanas y manuales.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-008
— Documentar excepciones, correcciones, anulaciones, devoluciones y reversión
```

`OPS-AUD-008` deberá utilizar estos flujos como línea base y documentar únicamente las desviaciones del camino ordinario, sin rediseñar todavía el proceso TO-BE.



### ✅ OPS-AUD-008 — Documentar excepciones, correcciones, anulaciones, devoluciones y reversión

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Documentación AS-IS de desviaciones frente al flujo ordinario  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-007`  
**Validación pendiente:** exclusivamente mediante `OPS-AUD-015` cuando una excepción, responsable, criterio o mecanismo de reversión no esté suficientemente confirmado

---

#### 1. Propósito

Documentar qué ocurre actualmente cuando un proceso no sigue su camino ordinario y requiere:

- corrección;
- modificación;
- anulación;
- rechazo;
- devolución;
- sustitución;
- reintento;
- regularización;
- reversión;
- compensación;
- cierre manual;
- escalamiento;
- aceptación parcial.

La tarea deberá identificar:

- evento que rompe el flujo ordinario;
- actor que detecta la desviación;
- actor que decide;
- acción correctiva actual;
- herramienta o soporte utilizado;
- efecto físico, financiero, documental o de inventario;
- punto donde se pierde trazabilidad;
- existencia o ausencia de reversión real;
- tarea posterior responsable de controles, medición o diseño.

```text
FLUJO ORDINARIO
→ DESVIACIÓN
→ RESPUESTA ACTUAL
→ EFECTO
→ CIERRE O PENDIENTE
```

Esta tarea documenta cómo se atienden hoy las desviaciones.

No define todavía:

- política objetivo;
- catálogo definitivo de motivos;
- permisos;
- niveles de aprobación;
- estados de base de datos;
- compensaciones automáticas;
- reglas contables;
- contratos entre aplicaciones;
- diseño de pantallas;
- implementación.

---

#### 2. Principio obligatorio

Una excepción no deberá confundirse con una nueva versión silenciosa del proceso.

```text
SOLICITADO
≠
CONFIRMADO
≠
PRODUCIDO
≠
DESPACHADO
≠
RECIBIDO
≠
ACEPTADO
```

Cuando una cantidad, actor, estado, documento o resultado cambia, el sistema objetivo deberá poder conservar:

- valor anterior;
- valor nuevo;
- causa;
- actor;
- fecha;
- evidencia;
- aprobación, cuando corresponda;
- efecto derivado.

`OPS-AUD-008` únicamente registra dónde esa capacidad existe, es manual, parcial o está ausente.

---

#### 3. Clasificación canónica de desviaciones

##### 3.1. Tipo de desviación

| Código | Tipo                | Definición                                                     |
| ------ | ------------------- | -------------------------------------------------------------- |
| `OMI`  | Omisión             | Una acción obligatoria no se realizó                           |
| `ERR`  | Error               | Se registró, preparó, cobró o entregó algo incorrecto          |
| `PAR`  | Parcial             | Se completa solo una parte                                     |
| `FAL`  | Faltante            | No existe cantidad suficiente                                  |
| `SOB`  | Sobrante            | Existe cantidad adicional                                      |
| `SUS`  | Sustitución         | Se reemplaza un producto, actor o recurso                      |
| `MOD`  | Modificación        | Se cambia una instrucción o registro vigente                   |
| `ANU`  | Anulación           | Se invalida una operación antes o después de ejecutarse        |
| `REC`  | Rechazo             | El receptor no acepta total o parcialmente                     |
| `DEV`  | Devolución          | Un bien o documento regresa al origen o a otro responsable     |
| `REV`  | Reversión           | Se deshace formalmente un efecto previo                        |
| `AJU`  | Ajuste              | Se corrige una diferencia sin repetir todo el proceso          |
| `REI`  | Reintento           | Se ejecuta nuevamente una acción fallida                       |
| `COM`  | Compensación        | Se crea una acción posterior para corregir el efecto           |
| `ESC`  | Escalamiento        | La decisión pasa a un responsable superior                     |
| `CAN`  | Cancelación externa | Cliente, proveedor o tercero cancela                           |
| `EXP`  | Expiración          | El proceso pierde vigencia por tiempo o vencimiento            |
| `INC`  | Incumplimiento      | El resultado no satisface cantidad, calidad, plazo o condición |
| `CON`  | Contingencia        | Se usa un camino alterno temporal                              |

##### 3.2. Naturaleza del efecto

| Código         | Efecto                                                |
| -------------- | ----------------------------------------------------- |
| `FISICO`       | Producto, insumo, activo o dinero cambia físicamente  |
| `INVENTARIO`   | Debería cambiar una existencia                        |
| `FINANCIERO`   | Afecta cobro, pago, caja, gasto o conciliación        |
| `DOCUMENTAL`   | Cambia, invalida o reemplaza un soporte               |
| `OPERATIVO`    | Cambia secuencia, prioridad o responsable             |
| `LABORAL`      | Afecta turno, asistencia, acceso o pago al trabajador |
| `COMERCIAL`    | Afecta cliente, venta, pedido o promesa               |
| `CONTABLE`     | Requiere clasificación o asiento diferente            |
| `SEGURIDAD`    | Afecta acceso, identidad o autorización               |
| `TRAZABILIDAD` | Pierde actor, estado, causa o relación entre eventos  |

##### 3.3. Estado de respuesta actual

| Estado             | Significado                                            |
| ------------------ | ------------------------------------------------------ |
| `RESUELTA_MANUAL`  | Existe una práctica manual conocida                    |
| `RESUELTA_PARCIAL` | Se corrige una parte, pero quedan efectos sin resolver |
| `ESCALADA`         | Se consulta a Gerencia, propietario o responsable      |
| `COMPENSADA`       | Se corrige con una operación posterior                 |
| `SIN_REVERSIÓN`    | El efecto original no se deshace formalmente           |
| `SIN_REGISTRO`     | La respuesta ocurre, pero no queda evidencia           |
| `NO_DEFINIDA`      | No existe práctica consistente                         |
| `POR_VALIDAR`      | La respuesta real debe confirmarse en `OPS-AUD-015`    |

---

#### 4. Inventario maestro de excepciones

| Código    | Proceso               | Excepción                                   | Respuesta actual                                             | Estado             |
| --------- | --------------------- | ------------------------------------------- | ------------------------------------------------------------ | ------------------ |
| `EXC-001` | Solicitud de remisión | Solicitud olvidada                          | Conductor o producción pregunta; se envía tarde              | `RESUELTA_MANUAL`  |
| `EXC-002` | Solicitud de remisión | Cambio después del envío                    | Mensaje o nueva captura                                      | `SIN_REGISTRO`     |
| `EXC-003` | Producción            | Cantidad producida inferior                 | Se deja lo alcanzado                                         | `RESUELTA_PARCIAL` |
| `EXC-004` | Producción            | Cantidad producida superior                 | Se informa ocasionalmente y se redistribuye                  | `RESUELTA_MANUAL`  |
| `EXC-005` | Despacho              | Producto faltante                           | Conductor envía parcial, normalmente sin aviso               | `SIN_REGISTRO`     |
| `EXC-006` | Recepción             | Sede detecta faltante                       | Consulta posteriormente al conductor                         | `RESUELTA_PARCIAL` |
| `EXC-007` | Recepción             | Producto incorrecto o calidad inadecuada    | No existe flujo confirmado                                   | `POR_VALIDAR`      |
| `EXC-008` | Bodega                | Retiro no registrado                        | Inventario queda desactualizado                              | `SIN_REVERSIÓN`    |
| `EXC-009` | Inventario            | Conteo digital difiere del físico           | Sistema deja de ser confiable                                | `NO_DEFINIDA`      |
| `EXC-010` | Producción            | Insumo no llega                             | Se produce menos o se prioriza otro producto                 | `RESUELTA_MANUAL`  |
| `EXC-011` | Panadería             | Capacidad o tiempo insuficiente             | Se distribuye lo disponible por prioridad                    | `RESUELTA_MANUAL`  |
| `EXC-012` | Cocina Caliente       | Stock insuficiente                          | Se envía lo disponible y se repone después                   | `COMPENSADA`       |
| `EXC-013` | Barra central         | Producto insuficiente                       | Se envía menos sin aviso                                     | `SIN_REGISTRO`     |
| `EXC-014` | Venta                 | Producto agotado después de ordenar         | Caja elimina con comentario y se agrega reemplazo            | `RESUELTA_MANUAL`  |
| `EXC-015` | Venta                 | Cliente cambia producto                     | Se agrega nuevo pedido; eliminación depende de Caja          | `RESUELTA_MANUAL`  |
| `EXC-016` | Pago                  | Tarjeta aprobada pero Caja no ha registrado | Aviso verbal al cajero                                       | `SIN_REGISTRO`     |
| `EXC-017` | Pago                  | Error de medio de pago                      | Corrección en Makos no documentada                           | `POR_VALIDAR`      |
| `EXC-018` | Rappi                 | Diferencia entre Rappi y Makos              | Corrección manual                                            | `RESUELTA_MANUAL`  |
| `EXC-019` | Domicilio             | Cliente cancela o cambia pedido             | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-020` | Domicilio             | Entrega tardía o fallida                    | Caja atiende el incidente                                    | `RESUELTA_MANUAL`  |
| `EXC-021` | Caja                  | Diferencia entre efectivo y cierre          | Se cuenta y revisa; resolución exacta no confirmada          | `POR_VALIDAR`      |
| `EXC-022` | Caja/Gerencia         | Retiro registrado como gasto                | Debe reinterpretarse como transferencia de custodia          | `RESUELTA_PARCIAL` |
| `EXC-023` | Compra                | Proveedor no tiene cantidad completa        | Confirma disponibilidad parcial                              | `RESUELTA_MANUAL`  |
| `EXC-024` | Compra                | Precio o fecha cambia                       | Se acuerda por conversación                                  | `SIN_REGISTRO`     |
| `EXC-025` | Recepción proveedor   | Diferencia entre factura y físico           | No se han presentado casos confirmados; flujo no definido    | `POR_VALIDAR`      |
| `EXC-026` | Recepción proveedor   | Recibe persona distinta                     | Procedimiento desconocido                                    | `POR_VALIDAR`      |
| `EXC-027` | Factura               | Soporte no llega a Contabilidad             | Se detecta en conciliación posterior                         | `RESUELTA_PARCIAL` |
| `EXC-028` | Merma                 | Producto dañado                             | Se desecha y registra manualmente                            | `RESUELTA_MANUAL`  |
| `EXC-029` | Merma                 | Registro errado o duplicado                 | No existe reversión confirmada                               | `SIN_REVERSIÓN`    |
| `EXC-030` | Transferencia a Molka | Producto envejecido pero consumible         | Se transfiere verbalmente                                    | `SIN_REGISTRO`     |
| `EXC-031` | Transferencia a Molka | Producto se deteriora allí                  | Se elimina como merma                                        | `RESUELTA_MANUAL`  |
| `EXC-032` | Canastas              | Canasta sucia                               | Se solicita lavado                                           | `RESUELTA_MANUAL`  |
| `EXC-033` | Canastas              | Canasta no disponible o no retorna          | No existe control                                            | `NO_DEFINIDA`      |
| `EXC-034` | Turnos                | Cambio de turno                             | Mecanismo exacto no confirmado                               | `POR_VALIDAR`      |
| `EXC-035` | Asistencia            | Check-in faltante                           | Se refleja como ausencia o novedad; corrección no confirmada | `POR_VALIDAR`      |
| `EXC-036` | Propinas              | Retraso o ausencia                          | Ajuste manual sobre propina                                  | `RESUELTA_MANUAL`  |
| `EXC-037` | Accesos               | Trabajador se retira sin aviso              | Se desactiva cuando se descubre                              | `RESUELTA_PARCIAL` |
| `EXC-038` | Accesos               | Cambio de sede, área o función              | Ajuste manual no formalizado                                 | `POR_VALIDAR`      |
| `EXC-039` | Marketing             | Pieza no satisface expectativa              | Se corrige por retroalimentación informal                    | `POR_VALIDAR`      |
| `EXC-040` | Vaila Vainilla        | Entrega fallida o devolución                | Flujo desconocido                                            | `POR_VALIDAR`      |
| `EXC-041` | Soporte técnico       | Solución inicial falla                      | Se reintenta o busca otra alternativa                        | `RESUELTA_MANUAL`  |
| `EXC-042` | Mantenimiento         | Técnico no disponible                       | Se espera o adapta la operación                              | `CON`              |
| `EXC-043` | Mantenimiento         | Repuesto no disponible                      | Se posterga o aplica solución temporal                       | `CON`              |
| `EXC-044` | Servicios Generales   | Limpieza insuficiente                       | Responsable vuelve a solicitar                               | `RESUELTA_MANUAL`  |
| `EXC-045` | Makos                 | Comanda no impresa o perdida                | Reimpresión o comunicación verbal no confirmada              | `POR_VALIDAR`      |
| `EXC-046` | Makos                 | Pedido duplicado                            | Corrección o anulación no confirmada                         | `POR_VALIDAR`      |
| `EXC-047` | Facturación           | Factura requiere anulación o corrección     | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-048` | Nómina                | Archivo o pago rechazado                    | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-049` | Shopify               | Pedido cancelado                            | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-050` | Producción            | Producto ya terminado cambia de destino     | Conductor redistribuye según necesidad                       | `SIN_REGISTRO`     |

---

#### 5. Remisiones internas

##### 5.1. Solicitud olvidada — `EXC-001`

**Desviación**

El área no envía la solicitud al final del turno.

**Detección**

- conductor;
- área productiva;
- responsable que nota la ausencia.

**Respuesta actual**

```text
NO EXISTE SOLICITUD
→ CONDUCTOR O PRODUCCIÓN PREGUNTA
→ ÁREA PREPARA EXCEL
→ ENVÍA CAPTURA TARDE
→ SE INTENTA ATENDER
```

**Efecto**

- preparación tardía;
- posible salida incompleta;
- alteración de prioridades;
- riesgo de omitir productos.

**Registro**

La evidencia queda dispersa en mensajes.

**Reversión**

No aplica reversión formal; se compensa enviando la solicitud tarde.

**Destino**

`OPS-AUD-010`, `OPS-AUD-011`, `OPS-AUD-013`.

---

##### 5.2. Modificación después del envío — `EXC-002`

**Desviación**

La cantidad o producto cambia después de enviar la captura.

**Respuesta probable**

- mensaje adicional;
- nueva captura;
- instrucción verbal.

No existe evidencia de:

- versión cancelada;
- versión vigente;
- confirmación de quien prepara;
- diferencia frente al original.

**Estado**

`POR_VALIDAR` en `OPS-AUD-015`.

---

##### 5.3. Preparación parcial — `EXC-005`

**Desviación**

No existe cantidad suficiente para completar la remisión.

**Respuesta actual**

```text
CONDUCTOR ENCUENTRA MENOS
→ TOMA LO DISPONIBLE
→ ENVÍA PARCIAL
→ NORMALMENTE NO AVISA
```

**Efecto**

- sede recibe menos;
- solicitud queda aparentemente abierta solo en la memoria;
- producción puede intentar compensar al día siguiente si recuerda;
- si no llega una nueva solicitud, el faltante puede no producirse.

**Reversión**

No existe una reversión; el efecto se compensa, a veces, mediante una producción posterior.

**Brecha**

No existe saldo pendiente estructurado.

---

##### 5.4. Diferencia detectada en sede — `EXC-006`

**Desviación**

La sede nota que falta producto después de solicitarlo repetidamente.

**Respuesta actual**

```text
SEDE REVISA
→ PREGUNTA AL CONDUCTOR
→ CONDUCTOR INDICA QUE NO SABE O NO HABÍA
→ SE GENERA FRUSTRACIÓN
```

**Efecto**

- pérdida de confianza;
- incertidumbre sobre dónde ocurrió la diferencia;
- no existe evidencia de si no se produjo, no se cargó o no se entregó.

**Cierre**

Generalmente queda como conversación, sin cierre formal.

---

##### 5.5. Producto incorrecto, dañado o rechazado — `EXC-007`

No se confirmó un flujo ordinario para:

- producto equivocado;
- cantidad excesiva;
- empaque dañado;
- temperatura inadecuada;
- rechazo por calidad;
- devolución desde sede.

Se vincula a `OPS-AUD-015`.

---

#### 6. Producción

##### 6.1. Producción inferior — `EXC-003`

**Desviación**

El área no alcanza la cantidad solicitada.

**Causas conocidas**

- falta de insumos;
- llegada tardía;
- falta de tiempo;
- capacidad física;
- proceso técnico;
- fermentación;
- prioridad de otra producción.

**Respuesta actual**

```text
ÁREA PRODUCE LO POSIBLE
→ DEJA CANTIDAD LOGRADA
→ NO AVISA PREVENTIVAMENTE
→ EXPLICA SI LA SEDE RECLAMA
```

**Efecto**

El faltante se descubre tarde.

**Reversión**

No existe; puede compensarse en otra jornada.

---

##### 6.2. Producción superior — `EXC-004`

**Desviación**

Quedan unidades adicionales.

**Respuesta actual**

- se informa en algunos casos;
- se envía fotografía;
- se reasigna a Saudo o Molka;
- se conserva como stock.

Ejemplo conocido: cinco panes adicionales distribuidos entre Saudo y Molka.

**Brecha**

No se registra formalmente:

- origen del excedente;
- cantidad;
- destino;
- inventario;
- decisión.

---

##### 6.3. Prioridad entre sedes — `EXC-011`

Cuando la cantidad no alcanza, la distribución conocida es:

1. Vento Café;
2. Saudo;
3. Molka.

La prioridad fue definida por Nathalia y se entiende culturalmente.

**Riesgo**

La prioridad no está representada como regla documentada, vigente y configurable.

**Destino**

`OPS-AUD-009` y diseño TO-BE posterior.

---

##### 6.4. Reposición posterior — `EXC-012`

Cocina Caliente repone según disponibilidad.

```text
STOCK INSUFICIENTE
→ CONDUCTOR ENVÍA LO DISPONIBLE
→ INFORMA A COCINERA
→ COCINERA PRIORIZA FALTANTE
→ PRODUCE CUANDO PUEDE
```

No existe plazo formal ni saldo pendiente confirmado.

---

##### 6.5. Cambio de destino — `EXC-050`

Cuando existe sobrante o una sede tiene mayor necesidad, el conductor puede redistribuir.

No existe registro formal de:

- decisión;
- origen;
- destino;
- cantidad;
- responsable;
- aceptación.

---

#### 7. Compras y proveedores

##### 7.1. Disponibilidad parcial — `EXC-023`

**Desviación**

El proveedor no dispone de todo lo solicitado.

**Respuesta actual**

El proveedor confirma por WhatsApp:

- cantidad disponible;
- precio;
- fecha estimada.

Gerencia acepta o ajusta mediante conversación.

**Brecha**

No existe una versión consolidada de la orden final confirmada.

---

##### 7.2. Cambio de precio o fecha — `EXC-024`

El proveedor puede modificar:

- precio;
- cantidad;
- fecha;
- presentación.

La decisión queda en la conversación.

No se confirmó:

- quién puede aceptar;
- cuándo requiere aprobación;
- cómo se actualiza el total esperado;
- cómo se compara con factura.

---

##### 7.3. Diferencia en recepción — `EXC-025`

No se han presentado casos confirmados de faltante o sobrante cuando recibe el Jefe de Operaciones.

No existe evidencia suficiente del procedimiento para:

- cantidad menor;
- cantidad mayor;
- producto distinto;
- calidad deficiente;
- precio distinto;
- factura incorrecta;
- rechazo;
- devolución al proveedor.

Debe validarse en `OPS-AUD-015`.

---

##### 7.4. Recepción por sustituto — `EXC-026`

Cuando Carlos no está, puede recibir:

- conductor;
- otro trabajador considerado capaz.

No se confirmó:

- criterio de designación;
- revisión;
- firma;
- entrega de factura;
- reporte de diferencia;
- responsabilidad.

---

##### 7.5. Soporte faltante — `EXC-027`

La falta de factura o comprobante se detecta posteriormente en conciliación.

**Respuesta actual**

- se busca el documento;
- se consulta a quien pagó o recibió;
- se regulariza si se encuentra.

El mecanismo exacto no fue confirmado.

---

#### 8. Inventario, merma y transferencias

##### 8.1. Retiro no registrado — `EXC-008`

**Desviación**

Un trabajador retira producto sin registrarlo.

**Efecto**

El inventario digital queda por encima del físico.

**Respuesta actual**

No existe corrección inmediata.

La diferencia aparece en conteos posteriores o el sistema pierde credibilidad.

**Reversión**

No existe una reversión del retiro físico; corresponde registrar un movimiento compensatorio, pero hoy no ocurre de forma sistemática.

---

##### 8.2. Inventario digital inválido — `EXC-009`

El piloto registró retiros, pero no todas las entradas, producciones y transferencias.

Resultado:

```text
MOVIMIENTOS INCOMPLETOS
→ STOCK DIGITAL INCORRECTO
→ TRABAJADORES DEJAN DE CONFIAR
→ PRUEBA PIERDE UTILIDAD
```

No existe proceso estructurado de:

- congelar;
- conciliar;
- ajustar;
- reabrir;
- certificar.

---

##### 8.3. Merma — `EXC-028`

**Desviación**

Producto no apto.

**Respuesta**

```text
TRABAJADOR DETECTA
→ DECIDE
→ DESCARTA
→ ANOTA PRODUCTO Y CANTIDAD
```

**Problemas**

- misma persona ejecuta todo;
- no existe aprobación confirmada;
- no se descuenta inventario;
- no se conserva lote;
- no existe evidencia fotográfica obligatoria;
- no se confirma causa estructurada.

---

##### 8.4. Corrección de merma — `EXC-029`

No existe procedimiento confirmado para:

- registro duplicado;
- cantidad equivocada;
- producto equivocado;
- merma anotada y luego recuperada;
- anulación de una hoja.

Estado: `SIN_REVERSIÓN`.

---

##### 8.5. Transferencia a Molka — `EXC-030`

**Desviación frente al abastecimiento normal**

Producto con menor frescura comercial se envía a Molka.

**Respuesta**

```text
TRABAJADOR ENTREGA AL CONDUCTOR
→ INDICA VERBALMENTE QUE ESTÁ VIEJO
→ CONDUCTOR TRANSPORTA
→ MOLKA INCORPORA
```

**Ausencias**

- transferencia;
- cantidad;
- fecha;
- vida útil;
- origen;
- lote;
- responsable;
- aceptación;
- efecto de inventario.

---

##### 8.6. Producto se daña en Molka — `EXC-031`

Se descarta y pasa a hoja de merma.

No existe vínculo entre la transferencia original y la merma final.

---

#### 9. Venta, comandas y productos agotados

##### 9.1. Producto agotado — `EXC-014`

**Desviación**

Makos permite registrar un producto que ya no está físicamente disponible.

**Detección**

- visual antes de ordenar;
- área productiva después de recibir la comanda;
- cliente informado posteriormente.

**Respuesta actual**

```text
CAJA ELIMINA PRODUCTO
→ ESCRIBE COMENTARIO OBLIGATORIO
→ MESERO ACUERDA REEMPLAZO
→ AGREGA PRODUCTO NUEVO COMO PEDIDO ADICIONAL
```

**Efectos**

- historial dividido;
- sustitución no vinculada formalmente;
- precio puede cambiar;
- cliente recibe explicación;
- no existe agotado automático.

---

##### 9.2. Modificación del pedido — `EXC-015`

El cliente puede cambiar o adicionar productos.

Las adiciones se registran como una nueva comanda en la misma cuenta.

Las eliminaciones dependen de Caja.

No se confirmó:

- quién puede anular;
- cuándo requiere comentario;
- si queda producto preparado;
- efecto sobre Cocina;
- reversión de inventario;
- tratamiento de descuentos.

---

##### 9.3. Comanda no impresa — `EXC-045`

No existe evidencia confirmada del procedimiento cuando:

- impresora está apagada;
- papel se acaba;
- impresión falla;
- comanda se pierde;
- comanda se duplica;
- se imprime en estación incorrecta.

Posibles respuestas:

- revisar Makos;
- reimprimir;
- informar verbalmente.

Debe validarse en `OPS-AUD-015`.

---

##### 9.4. Pedido duplicado — `EXC-046`

No se confirmó cómo se diferencia entre:

- pedido adicional legítimo;
- doble toque;
- doble transcripción;
- reimpresión;
- pedido duplicado por plataforma.

---

##### 9.5. Factura anulada o corregida — `EXC-047`

No se confirmó el flujo actual para:

- factura emitida con error;
- cambio de medio de pago;
- devolución;
- nota crédito;
- anulación fiscal;
- reimpresión;
- cierre incorrecto.

Se vincula a `OPS-AUD-015`, `OPS-AUD-009` y posteriormente NUMERA/PULSO.

---

#### 10. Pagos y Caja

##### 10.1. Pago con tarjeta no registrado aún — `EXC-016`

**Desviación**

El datáfono fue operado por un trabajador distinto al cajero.

**Respuesta**

```text
TRABAJADOR PROCESA
→ AVISA VERBALMENTE
→ CAJERO REGISTRA
```

**Riesgo**

- olvido;
- medio de pago incorrecto;
- mesa abierta;
- duplicación;
- falta de comprobante vinculado.

No existe confirmación digital entre datáfono y Makos.

---

##### 10.2. Error de medio de pago — `EXC-017`

No se confirmó el procedimiento para corregir:

- efectivo registrado como tarjeta;
- tarjeta registrada como efectivo;
- pago dividido;
- pago duplicado;
- transacción rechazada;
- reversión del datáfono.

---

##### 10.3. Diferencia de Caja — `EXC-021`

La gerente general cuenta el efectivo y compara con el cierre.

No se confirmó:

- tolerancia;
- responsable;
- acta;
- descuento;
- ajuste;
- investigación;
- aprobación;
- registro contable.

Destino: `OPS-AUD-009`, `OPS-AUD-012`, `OPS-AUD-015`.

---

##### 10.4. Retiro clasificado como gasto — `EXC-022`

**Desviación**

Dinero entregado a Gerencia se registra como gasto.

**Realidad operativa**

Es una transferencia de custodia.

**Efecto**

- gasto inflado;
- caja reducida;
- responsabilidad del efectivo no representada;
- conciliación confusa.

**Corrección actual**

Interpretación manual posterior.

**Reversión**

No se confirmó cómo se reclasifica en Makos o Contabilidad.

---

#### 11. Pedidos externos y domicilios

##### 11.1. Diferencia entre plataforma y Makos — `EXC-018`

Puede ocurrir por:

- transcripción;
- producto omitido;
- cantidad distinta;
- observación no copiada;
- precio diferente;
- modificación posterior.

**Respuesta actual**

Corrección manual en una o ambas plataformas, según disponibilidad.

No existe reconciliación automática.

---

##### 11.2. Cancelación o cambio del cliente — `EXC-019`

No se confirmó qué ocurre cuando el cliente:

- cancela antes de preparar;
- cancela después de preparar;
- cambia dirección;
- cambia medio de pago;
- agrega producto;
- solicita devolución.

Debe validarse en `OPS-AUD-015`.

---

##### 11.3. Entrega tardía o fallida — `EXC-020`

**Detección**

El cliente contacta o surge un incidente.

**Respuesta**

Caja atiende:

- retraso;
- conflicto con mensajero;
- dirección;
- pago;
- pedido faltante.

No existe seguimiento rutinario después de salida.

**Cierre**

Se resuelve caso por caso.

---

#### 12. Turnos, asistencia, propinas y accesos

##### 12.1. Cambio de turno — `EXC-034`

No se confirmó el mecanismo para:

- intercambio entre trabajadores;
- cambio de sede;
- reemplazo;
- ausencia anticipada;
- modificación después de publicar.

Debe validarse en `OPS-AUD-015`.

---

##### 12.2. Check-in faltante o incorrecto — `EXC-035`

No se confirmó:

- solicitud de corrección;
- evidencia;
- aprobador;
- modificación de hora;
- diferencia entre olvido y ausencia;
- registro posterior.

---

##### 12.3. Descuento de propina — `EXC-036`

La gerente general aplica ajustes manuales por retrasos o ausencias.

No queda registro estructurado de:

- regla;
- valor base;
- motivo;
- aprobación;
- valor descontado;
- aceptación del trabajador;
- reversión si la asistencia se corrige.

---

##### 12.4. Retiro sin baja inmediata — `EXC-037`

**Desviación**

El trabajador deja la empresa, pero no existe notificación formal a quien administra accesos.

**Respuesta**

```text
RETIRO
→ ACCESO PUEDE SEGUIR ACTIVO
→ JEFE DE OPERACIONES SE ENTERA
→ DESACTIVA MANUALMENTE
```

**Efecto**

Riesgo de seguridad y trazabilidad.

**Reversión**

No es posible revertir un acceso indebido ya utilizado; se requiere revocación y auditoría.

---

##### 12.5. Cambio de función — `EXC-038`

No existe flujo confirmado para modificar:

- sede asignada;
- área;
- cargo;
- rol operativo;
- permisos;
- turno;
- dispositivo.

Estado: `POR_VALIDAR`.

---

#### 13. Marketing

##### 13.1. Pieza rechazada o corregida — `EXC-039`

**Desviación**

La pieza no cumple la expectativa de Nathalia o Jeo.

**Respuesta probable**

```text
SE COMUNICA INCONFORMIDAD
→ TRABAJADOR INTERPRETA CAMBIO
→ EDITA O REPITE
→ SOLICITA NUEVA REVISIÓN
```

No se confirmó:

- canal;
- criterio;
- versión;
- responsable;
- aprobación final;
- archivo de versiones.

---

##### 13.2. Publicación errónea

No se confirmó el proceso para:

- eliminar publicación;
- corregir texto;
- reemplazar imagen;
- responder reclamo;
- conservar evidencia;
- aprobar una corrección urgente.

Debe validarse en `OPS-AUD-015`.

---

#### 14. Vaila Vainilla

##### 14.1. Entrega fallida, devolución o cancelación — `EXC-040`, `EXC-049`

No se confirmó el tratamiento de:

- pedido cancelado;
- dirección incorrecta;
- cliente ausente;
- paquete devuelto;
- producto dañado;
- pérdida;
- reenvío;
- reembolso;
- reintegro al stock.

Todos permanecen en `OPS-AUD-015`.

---

#### 15. Soporte técnico y mantenimiento

##### 15.1. Reintento técnico — `EXC-041`

Cuando una solución no funciona:

```text
JEFE DE OPERACIONES PRUEBA OTRA CONFIGURACIÓN
→ CAMBIA EQUIPO, RED, DRIVER O MÉTODO
→ VUELVE A PROBAR
```

No existe registro de intentos fallidos.

---

##### 15.2. Técnico no disponible — `EXC-042`

Respuesta:

- esperar;
- contactar otro;
- operar parcialmente;
- adaptar temporalmente el proceso.

La decisión depende de Gerencia.

No existe contingencia general documentada.

---

##### 15.3. Repuesto no disponible — `EXC-043`

Respuesta:

- buscar otro proveedor;
- esperar;
- aplicar reparación temporal;
- dejar equipo fuera de servicio.

No se registra impacto acumulado ni fecha comprometida.

---

#### 16. Servicios Generales y canastas

##### 16.1. Limpieza insuficiente — `EXC-044`

El resultado se verifica visualmente.

Si no cumple:

- Nathalia;
- Carlos;
- responsable de área;

solicita repetir.

No existe inspección, evidencia o cierre formal.

---

##### 16.2. Canasta sucia — `EXC-032`

La limpieza se solicita después de:

- queja;
- acumulación;
- observación visual.

No existe frecuencia ni estado.

---

##### 16.3. Canasta faltante — `EXC-033`

No se conoce:

- sede;
- custodio;
- ruta;
- fecha;
- pérdida;
- proveedor propietario.

No existe mecanismo actual de búsqueda o compensación.

---

#### 17. Tipos de reversión requeridos por el dominio

Esta sección no diseña la implementación; identifica categorías que el modelo TO-BE deberá resolver.

##### 17.1. Reversión documental

Aplicable a:

- factura;
- remisión;
- cierre;
- hoja de merma;
- pedido;
- reporte;
- turno.

Debe conservar original y corrección.

##### 17.2. Reversión de inventario

Aplicable a:

- retiro errado;
- recepción errada;
- merma errada;
- transferencia errada;
- devolución;
- producto rechazado.

No debe borrar el movimiento original; deberá existir movimiento compensatorio en el diseño posterior.

##### 17.3. Reversión financiera

Aplicable a:

- medio de pago incorrecto;
- cobro duplicado;
- devolución;
- retiro mal clasificado;
- gasto errado;
- pago rechazado.

##### 17.4. Reversión de autorización

Aplicable a:

- cuenta creada por error;
- baja tardía;
- permiso incorrecto;
- cambio de sede;
- sesión compartida.

La revocación futura debe impedir nuevas acciones y conservar auditoría de las anteriores.

##### 17.5. Reversión operativa

Aplicable a:

- pedido cancelado;
- producción ya iniciada;
- destino modificado;
- entrega rechazada;
- turno cambiado;
- publicación retirada.

---

#### 18. Excepciones sin procedimiento confirmado

Quedan expresamente para `OPS-AUD-015`:

1. rechazo de proveedor;
2. factura con diferencia;
3. devolución a proveedor;
4. devolución de cliente;
5. nota crédito;
6. anulación fiscal;
7. corrección de medio de pago;
8. diferencia de Caja;
9. reimpresión de comanda;
10. pedido duplicado;
11. cambio de turno;
12. corrección de check-in;
13. pago de nómina rechazado;
14. pedido Shopify cancelado;
15. devolución de Vaila Vainilla;
16. publicación errónea;
17. recepción por sustituto;
18. producto incorrecto recibido en sede;
19. deterioro durante transporte;
20. pérdida o robo de canasta;
21. corrección de hoja de merma;
22. cambio de acceso por traslado interno.

Estos pendientes no bloquean la continuidad documental porque tienen propietario explícito en `OPS-AUD-015`.

---

#### 19. Matriz de pérdida de control por excepción

| Excepción             | Control que falta                  |
| --------------------- | ---------------------------------- |
| Solicitud tardía      | corte, alerta y confirmación       |
| Cantidad parcial      | saldo pendiente y motivo           |
| Sobrante              | destino y movimiento               |
| Cambio de pedido      | versión y aprobación               |
| Producto agotado      | disponibilidad y sustitución       |
| Pago verbal           | confirmación vinculada             |
| Retiro como gasto     | naturaleza y custodia              |
| Factura faltante      | trazabilidad documental            |
| Merma                 | aprobación, lote y movimiento      |
| Transferencia a Molka | origen, destino y vida útil        |
| Baja tardía           | evento obligatorio de revocación   |
| Cambio de turno       | solicitud, aprobación y versión    |
| Pieza rechazada       | criterio y versiones               |
| Entrega fallida       | estado, responsable y compensación |
| Repuesto ausente      | contingencia y seguimiento         |

---

#### 20. Relación con `OPS-AUD-009`

`OPS-AUD-009` deberá identificar quién puede:

- aprobar una compra modificada;
- aceptar un precio distinto;
- autorizar una anulación;
- corregir un medio de pago;
- aceptar una diferencia de Caja;
- aprobar una merma;
- autorizar transferencia entre sedes;
- cambiar un turno;
- corregir asistencia;
- aplicar descuento;
- aprobar publicación;
- crear o revocar acceso;
- aceptar una devolución;
- cerrar una diferencia.

`OPS-AUD-008` no asigna todavía permisos ni autoridad definitiva.

---

#### 21. Relación con `OPS-AUD-012`

Deberán conciliarse especialmente:

```text
SOLICITUD ORIGINAL
↔ SOLICITUD MODIFICADA
↔ PRODUCIDO
↔ DESPACHADO
↔ RECIBIDO
```

```text
RAPPI
↔ MAKOS
↔ FACTURA
↔ PAGO
```

```text
CIERRE
↔ EFECTIVO
↔ RETIROS
↔ GASTOS
↔ CONTABILIDAD
```

```text
INVENTARIO FÍSICO
↔ MOVIMIENTOS DIGITALES
↔ MERMAS
↔ TRANSFERENCIAS
```

---

#### 22. Hallazgos transversales

##### 22.1. La mayoría de excepciones se resuelve por conversación

WhatsApp y comunicación verbal sustituyen:

- motivo;
- estado;
- responsable;
- aprobación;
- evidencia;
- cierre.

##### 22.2. La compensación reemplaza a la reversión

Ejemplos:

- producir al día siguiente;
- enviar otro producto;
- registrar otro pedido;
- corregir en Contabilidad;
- desactivar acceso tarde.

Esto corrige parcialmente el resultado, pero no deshace ni documenta el hecho original.

##### 22.3. El sistema actual permite corregir sin vincular

Una eliminación en Makos y un nuevo pedido pueden resolver al cliente, pero no conservar una relación explícita de sustitución.

##### 22.4. Las excepciones afectan varios dominios al mismo tiempo

Una remisión parcial afecta:

- producción;
- inventario;
- logística;
- sede;
- venta futura;
- compras;
- planeación.

##### 22.5. Una excepción no documentada se convierte en conocimiento informal

El aprendizaje queda en personas y no en el sistema.

##### 22.6. Borrar no equivale a revertir

El diseño objetivo deberá privilegiar:

```text
EVENTO ORIGINAL
+
EVENTO CORRECTIVO
+
RELACIÓN ENTRE AMBOS
```

No eliminación silenciosa.

---

#### 23. Matriz de destino de hallazgos

| Hallazgo                                         | Tarea exacta   |
| ------------------------------------------------ | -------------- |
| Quién detecta, decide, autoriza y ejecuta        | `OPS-AUD-009`  |
| Frecuencia, impacto y tiempo de recuperación     | `OPS-AUD-010`  |
| Dependencia de áreas, sedes, terceros y sistemas | `OPS-AUD-011`  |
| Reconciliación entre original y corrección       | `OPS-AUD-012`  |
| Pérdida de causa, actor, versión y evidencia     | `OPS-AUD-013`  |
| Respuesta ante indisponibilidad tecnológica      | `OPS-AUD-014`  |
| Procedimientos no confirmados                    | `OPS-AUD-015`  |
| Consolidación de brechas                         | `GAP-CTRL-001` |
| Vinculación a diseño y paquete de implementación | `GAP-CTRL-006` |
| Procesos TO-BE de reversión                      | BLOQUE E2      |
| Arquitectura de eventos y datos                  | BLOQUE E3      |
| Colas, reintentos y evidencia                    | BLOQUE E4      |
| Piloto, rollback y cutover                       | BLOQUE E5      |

---

#### 24. Decisiones propuestas

1. Toda diferencia frente al flujo ordinario deberá conservarse como excepción explícita.
2. Las solicitudes olvidadas se resuelven hoy mediante seguimiento manual.
3. Las cantidades parciales no generan saldo pendiente estructurado.
4. Los sobrantes se redistribuyen sin movimiento formal.
5. Los faltantes se descubren con frecuencia en la sede.
6. Producción compensa faltantes en jornadas posteriores solo cuando existe memoria o nueva solicitud.
7. Las prioridades entre sedes son culturales y no están configuradas formalmente.
8. Los cambios de compra quedan en conversaciones con proveedores.
9. No existe procedimiento confirmado para diferencias de recepción de proveedor.
10. Los retiros no registrados invalidan el inventario digital.
11. Las mermas no tienen reversión ni aprobación estructurada confirmada.
12. Las transferencias a Molka carecen de registro.
13. Los agotados en Makos se corrigen eliminando y agregando productos.
14. Los pagos con tarjeta dependen de confirmación verbal.
15. No existe flujo confirmado de corrección fiscal o de medio de pago.
16. Los incidentes de domicilio se resuelven caso por caso.
17. Las diferencias de Caja no tienen procedimiento suficientemente documentado.
18. Los ajustes de propinas no dejan evidencia completa.
19. Las bajas de acceso pueden ocurrir tarde.
20. Marketing corrige mediante retroalimentación informal.
21. Vaila Vainilla no tiene devoluciones o entregas fallidas documentadas.
22. Soporte y mantenimiento utilizan reintentos y contingencias manuales.
23. La corrección actual suele compensar, pero no revertir formalmente.
24. El diseño futuro deberá conservar evento original y evento correctivo.
25. Ninguna decisión autoriza estados, permisos, código, migraciones, RPC, RLS o cambios en Supabase.

---

#### 25. Criterios de aceptación

`OPS-AUD-008` podrá aprobarse cuando se confirme que:

- se inventariaron las principales desviaciones;
- se distinguen omisión, error, parcial, faltante, sobrante, modificación, anulación, rechazo, devolución, reversión, ajuste y compensación;
- se documentan respuestas actuales;
- se identifican efectos físicos, financieros, operativos, laborales y de seguridad;
- se separan prácticas confirmadas de procedimientos pendientes;
- cada incertidumbre está vinculada a `OPS-AUD-015`;
- cada brecha tiene destino exacto;
- no se han definido aprobaciones propias de `OPS-AUD-009`;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 26. Resultado y continuidad

Con la aprobación de `OPS-AUD-008` quedará establecida la línea base inicial de:

- excepciones operativas;
- correcciones manuales;
- cantidades parciales;
- faltantes y sobrantes;
- sustituciones;
- cambios de pedido;
- anulaciones pendientes de validar;
- devoluciones;
- compensaciones;
- reintentos;
- contingencias;
- reversión ausente o parcial;
- efectos derivados;
- excepciones sin procedimiento confirmado.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-009
— Documentar aprobaciones, segregación de funciones y controles manuales
```

`OPS-AUD-009` deberá utilizar este inventario para identificar quién inicia, ejecuta, revisa, aprueba, custodia y corrige cada acción sensible, sin convertir todavía esas responsabilidades en roles o permisos técnicos.



### ✅ OPS-AUD-009 — Documentar aprobaciones, segregación de funciones y controles manuales

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Documentación AS-IS de aprobaciones, separación de responsabilidades y controles actuales  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-008`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando el aprobador, custodio, sustituto o control real no esté suficientemente confirmado

---

#### 1. Propósito

Documentar cómo se autorizan, revisan, controlan y custodian actualmente las acciones sensibles de Vento Group.

La tarea deberá distinguir, para cada proceso:

- quién inicia;
- quién ejecuta;
- quién revisa;
- quién aprueba;
- quién custodia;
- quién recibe;
- quién corrige;
- qué control manual existe;
- qué evidencia queda;
- qué funciones se encuentran concentradas en una misma persona;
- qué acciones se realizan sin aprobación explícita;
- qué controles dependen de memoria, confianza, presencia física o comunicación verbal.

```text
RESPONSABILIDAD OPERATIVA
≠
APROBACIÓN
≠
CUSTODIA
≠
PERMISO DE SOFTWARE
```

Esta tarea documenta el modelo actual.

No define todavía:

- matriz RACI objetivo;
- catálogo de cargos;
- roles base;
- roles operativos;
- permisos;
- reglas de autorización;
- políticas RLS;
- flujos de aprobación digitales;
- límites monetarios;
- niveles jerárquicos futuros;
- implementación técnica.

---

#### 2. Principios obligatorios

##### 2.1. Ejecutar no implica aprobar

Una persona puede realizar una acción sin tener autoridad para decidirla.

Ejemplos:

- un trabajador prepara una producción, pero la prioridad puede provenir de Nathalia;
- Leidy puede enviar un pedido, pero la necesidad y cantidad son consolidadas por Gerencia;
- un mesero lleva el datáfono, pero Caja registra el pago;
- un trabajador desecha una merma, aunque no exista aprobación separada.

##### 2.2. Aprobar no implica custodiar

Quien autoriza una compra no necesariamente:

- recibe la mercancía;
- conserva la factura;
- registra Contabilidad;
- custodia el producto;
- paga.

##### 2.3. El control manual puede existir sin ser suficiente

Ejemplos:

- comparar factura contra mercancía;
- contar efectivo contra cierre;
- exigir comentario al eliminar un producto en Makos;
- observar visualmente una canasta;
- revisar una pieza de Marketing.

El control deberá registrarse aunque sea informal, incompleto o no deje evidencia.

##### 2.4. La concentración de funciones es un hallazgo, no una autorización

Cuando una persona:

```text
INICIA
→ EJECUTA
→ APRUEBA
→ CUSTODIA
→ CORRIGE
```

la tarea deberá registrarlo como concentración AS-IS.

No deberá presentarse como modelo objetivo.

##### 2.5. La confianza personal no sustituye la segregación

La práctica de permitir una acción porque una persona “sabe hacerlo” o “es de confianza” constituye una regla operativa informal, no un control verificable.

---

#### 3. Tipos de participación de control

| Código | Participación         | Definición                                             |
| ------ | --------------------- | ------------------------------------------------------ |
| `INI`  | Iniciador             | Origina la necesidad, solicitud o evento               |
| `EJE`  | Ejecutor              | Realiza materialmente la acción                        |
| `REV`  | Revisor               | Comprueba cantidades, documentos o resultado           |
| `APR`  | Aprobador             | Autoriza que la acción continúe o se confirme          |
| `CUS`  | Custodio              | Conserva dinero, bienes, documentos o accesos          |
| `REG`  | Registrador           | Incorpora la operación a un sistema o soporte          |
| `REC`  | Receptor              | Recibe el resultado o continúa el proceso              |
| `COR`  | Corrector             | Modifica, ajusta o revierte                            |
| `SUP`  | Supervisor            | Vigila cumplimiento general                            |
| `ESC`  | Escalamiento          | Resuelve una situación fuera de la autoridad ordinaria |
| `AUD`  | Verificador posterior | Revisa después mediante conciliación o auditoría       |

Una misma persona puede ocupar varios tipos de participación.

---

#### 4. Clasificación de controles manuales

##### 4.1. Tipo de control

| Código | Control                 | Ejemplo                                       |
| ------ | ----------------------- | --------------------------------------------- |
| `VIS`  | Inspección visual       | Revisar mercancía, vitrina o producto         |
| `CON`  | Conteo                  | Contar efectivo, producto o canastas          |
| `CMP`  | Comparación             | Factura contra físico; cierre contra efectivo |
| `FIR`  | Firma                   | Firmar recepción o documento                  |
| `COM`  | Comentario obligatorio  | Justificar eliminación en Makos               |
| `DOB`  | Doble intervención      | Una persona ejecuta y otra registra           |
| `JER`  | Escalamiento jerárquico | Consultar a Nathalia, Jeo o Gerencia          |
| `PRE`  | Presencia física        | Control depende de estar en el lugar          |
| `MEM`  | Memoria o experiencia   | Decisión basada en conocimiento práctico      |
| `CUL`  | Regla cultural          | Prioridad conocida por costumbre              |
| `DOC`  | Soporte documental      | Factura, cierre, hoja o reporte               |
| `SIS`  | Restricción del sistema | Campo obligatorio, sesión o estado            |
| `POS`  | Revisión posterior      | La diferencia se detecta después              |
| `VER`  | Comunicación verbal     | Confirmación entre trabajadores               |
| `MSG`  | Evidencia en mensaje    | WhatsApp o chat                               |
| `SIN`  | Sin control confirmado  | No existe evidencia suficiente                |

##### 4.2. Estado del control

| Estado                   | Significado                                            |
| ------------------------ | ------------------------------------------------------ |
| `CONFIRMADO`             | Existe y se utiliza de forma conocida                  |
| `IMPLÍCITO`              | Se aplica por costumbre, criterio o jerarquía informal |
| `PARCIAL`                | Cubre una parte, pero deja riesgos abiertos            |
| `POSTERIOR`              | Detecta después de ocurrido el efecto                  |
| `DEPENDIENTE_DE_PERSONA` | Depende de experiencia o presencia de alguien          |
| `AUSENTE`                | No existe control identificado                         |
| `POR_VALIDAR`            | Debe confirmarse en `OPS-AUD-015`                      |

---

#### 5. Inventario maestro de acciones sensibles

| Código    | Proceso                  | Acción sensible                | Ejecuta                                      | Aprueba o decide                          | Control actual                  | Estado                              |
| --------- | ------------------------ | ------------------------------ | -------------------------------------------- | ----------------------------------------- | ------------------------------- | ----------------------------------- |
| `CTL-001` | Remisiones               | Crear solicitud                | Responsable de área                          | Implícito en la responsabilidad del área  | Excel + envío al grupo          | `PARCIAL`                           |
| `CTL-002` | Remisiones               | Cambiar solicitud              | Responsable de área                          | No confirmado                             | Mensaje o nueva captura         | `POR_VALIDAR`                       |
| `CTL-003` | Producción               | Definir cantidades             | Responsable productivo                       | Criterio propio y remisiones              | Experiencia + consolidado       | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-004` | Producción               | Priorizar sedes                | Área productiva o conductor                  | Regla definida por Nathalia               | Regla cultural                  | `IMPLÍCITO`                         |
| `CTL-005` | Despacho                 | Enviar parcial                 | Conductor / producción                       | No existe aprobación separada             | Disponibilidad física           | `AUSENTE`                           |
| `CTL-006` | Despacho                 | Cambiar destino                | Conductor o responsable                      | Criterio operativo                        | Comunicación verbal             | `IMPLÍCITO`                         |
| `CTL-007` | Recepción interna        | Aceptar mercancía              | Responsable de área o delegado               | No confirmado                             | Conteo físico                   | `PARCIAL`                           |
| `CTL-008` | Bodega                   | Retirar insumos                | Cualquier trabajador                         | No confirmado                             | Acceso físico libre             | `AUSENTE`                           |
| `CTL-009` | Bodega                   | Conservar sobrantes en área    | Trabajador del área                          | Decisión local                            | Control visual                  | `IMPLÍCITO`                         |
| `CTL-010` | Compras                  | Consolidar necesidad           | Gerente general                              | Gerente general                           | Preguntas + experiencia         | `CONFIRMADO`                        |
| `CTL-011` | Compras                  | Enviar pedido                  | Gerente general o Leidy                      | Gerente general o criterio no formalizado | WhatsApp                        | `PARCIAL`                           |
| `CTL-012` | Compras                  | Aceptar precio/cambio          | Gerente general                              | Gerente general                           | Conversación con proveedor      | `PARCIAL`                           |
| `CTL-013` | Proveedores              | Recibir mercancía              | Carlos u otro trabajador capaz               | No confirmado                             | Visual + factura                | `PARCIAL`                           |
| `CTL-014` | Proveedores              | Firmar recepción               | Receptor                                     | El mismo receptor                         | Firma física                    | `CONFIRMADO`                        |
| `CTL-015` | Proveedores              | Rechazar diferencia            | No confirmado                                | No confirmado                             | Sin procedimiento conocido      | `POR_VALIDAR`                       |
| `CTL-016` | Merma                    | Declarar producto no apto      | Trabajador que detecta                       | El mismo trabajador                       | Evaluación sensorial            | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-017` | Merma                    | Desechar producto              | Mismo trabajador                             | Mismo trabajador                          | Hoja manual posterior           | `PARCIAL`                           |
| `CTL-018` | Transferencia a Molka    | Autorizar reasignación         | Trabajador o responsable                     | No formalizado                            | Aviso verbal                    | `AUSENTE`                           |
| `CTL-019` | Caja                     | Abrir turno                    | Cajero                                       | Rol operativo de Caja                     | Conteo de base + Makos          | `CONFIRMADO`                        |
| `CTL-020` | Caja                     | Cerrar turno                   | Cajero                                       | Cajero                                    | Cierre Makos + conteo           | `CONFIRMADO`                        |
| `CTL-021` | Caja                     | Eliminar producto              | Cajero                                       | Cajero                                    | Comentario obligatorio en Makos | `PARCIAL`                           |
| `CTL-022` | Caja                     | Corregir medio de pago         | No confirmado                                | No confirmado                             | Flujo desconocido               | `POR_VALIDAR`                       |
| `CTL-023` | Pago                     | Procesar tarjeta               | Cualquier trabajador disponible              | Cliente autoriza pago                     | Datáfono                        | `PARCIAL`                           |
| `CTL-024` | Pago                     | Registrar tarjeta en Makos     | Cajero                                       | Cajero                                    | Aviso verbal del trabajador     | `PARCIAL`                           |
| `CTL-025` | Efectivo                 | Entregar excedente             | Cajero o sede                                | Gerencia recibe                           | Cierre impreso + conteo         | `CONFIRMADO`                        |
| `CTL-026` | Efectivo                 | Custodiar excedente            | Gerente general                              | Gerente general                           | Conteo físico                   | `CONFIRMADO`                        |
| `CTL-027` | Efectivo                 | Usar recursos                  | Gerente general                              | Según necesidades del grupo               | Factura esperada                | `PARCIAL`                           |
| `CTL-028` | Contabilidad             | Registrar soporte              | Contabilidad                                 | Procedimiento contable                    | Factura/comprobante             | `CONFIRMADO_PARCIAL`                |
| `CTL-029` | Turnos                   | Crear horario                  | Gerente general y gerente de Vento Café      | Ambas según operación                     | Publicación en VISO             | `CONFIRMADO`                        |
| `CTL-030` | Turnos                   | Cambiar horario                | No confirmado                                | No confirmado                             | Flujo pendiente                 | `POR_VALIDAR`                       |
| `CTL-031` | Asistencia               | Registrar check-in             | Trabajador                                   | Sistema acepta                            | ANIMA                           | `CONFIRMADO`                        |
| `CTL-032` | Asistencia               | Corregir check-in              | No confirmado                                | No confirmado                             | Flujo pendiente                 | `POR_VALIDAR`                       |
| `CTL-033` | Propinas                 | Calcular distribución          | Gerente general                              | Gerente general                           | Cálculo manual                  | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-034` | Propinas                 | Aplicar descuento              | Gerente general                              | Gerente general                           | Retrasos/ausencias              | `PARCIAL`                           |
| `CTL-035` | Nómina                   | Preparar información           | Gerencia/Contabilidad                        | Gerencia/Contabilidad                     | Revisión previa                 | `CONFIRMADO_PARCIAL`                |
| `CTL-036` | Nómina                   | Ejecutar pago                  | Usuario bancario autorizado                  | Autoridad bancaria interna                | Bancolombia Nóminas             | `CONFIRMADO`                        |
| `CTL-037` | Contratación             | Filtrar candidatos             | Gerente general                              | Gerente general                           | Revisión de hojas de vida       | `CONFIRMADO`                        |
| `CTL-038` | Contratación             | Aprobar candidato              | Nathalia y gerente general                   | Nathalia y gerente general                | Observación de prueba           | `CONFIRMADO_PARCIAL`                |
| `CTL-039` | Contratación             | Formalizar                     | Abogados externos                            | Decisión previa interna                   | Documentos contractuales        | `CONFIRMADO`                        |
| `CTL-040` | Accesos                  | Solicitar alta                 | Gerencia                                     | Gerencia                                  | Solicitud informal              | `PARCIAL`                           |
| `CTL-041` | Accesos                  | Crear cuenta                   | Jefe de Operaciones                          | Solicitud de Gerencia                     | Creación manual                 | `PARCIAL`                           |
| `CTL-042` | Accesos                  | Solicitar baja                 | No existe flujo obligatorio                  | No definido                               | Descubrimiento informal         | `AUSENTE`                           |
| `CTL-043` | Accesos                  | Desactivar cuenta              | Jefe de Operaciones                          | Decisión derivada del retiro              | Acción manual                   | `POSTERIOR`                         |
| `CTL-044` | Marketing                | Solicitar contenido            | Nathalia o Jeo                               | Nathalia o Jeo                            | WhatsApp/verbal                 | `CONFIRMADO`                        |
| `CTL-045` | Marketing                | Publicar historia              | Quien crea la pieza                          | Normalmente sin aprobación previa         | Criterio del creador            | `IMPLÍCITO`                         |
| `CTL-046` | Marketing                | Aprobar publicación permanente | Nathalia o Jeo                               | Nathalia o Jeo                            | Revisión informal               | `CONFIRMADO_PARCIAL`                |
| `CTL-047` | Vaila Vainilla           | Gestionar pedido               | Jeo                                          | Jeo                                       | Shopify + coordinación humana   | `CONFIRMADO`                        |
| `CTL-048` | Vaila Vainilla           | Empacar y entregar             | Trabajadora de ventas                        | Jeo o flujo implícito                     | Pedido + revisión               | `PARCIAL`                           |
| `CTL-049` | Soporte técnico          | Priorizar incidente            | Jefe de Operaciones                          | Criterio por impacto                      | Experiencia                     | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-050` | Soporte técnico          | Aplicar cambio                 | Jefe de Operaciones                          | El mismo ejecutor                         | Prueba de funcionamiento        | `PARCIAL`                           |
| `CTL-051` | Mantenimiento            | Contratar técnico              | Gerente general                              | Gerente general                           | Contacto directo                | `CONFIRMADO`                        |
| `CTL-052` | Mantenimiento            | Aceptar reparación             | Gerente general o usuario                    | No formalizado                            | Funcionamiento visible          | `PARCIAL`                           |
| `CTL-053` | Servicios Generales      | Priorizar limpieza             | Nathalia, Carlos, responsables o trabajadora | Jerarquía informal                        | Instrucción directa             | `IMPLÍCITO`                         |
| `CTL-054` | Servicios Generales      | Aceptar resultado              | Quien observa                                | Quien solicitó                            | Revisión visual                 | `PARCIAL`                           |
| `CTL-055` | Dispositivos compartidos | Ejecutar acción                | Trabajador presente                          | Cuenta funcional ya abierta               | Sesión compartida               | `AUSENTE` para identidad individual |

---

#### 6. Remisiones, producción y logística

##### 6.1. Creación de solicitudes

La responsabilidad de elaborar la solicitud recae en el área.

No existe una aprobación separada confirmada antes de enviarla.

```text
ÁREA IDENTIFICA NECESIDAD
→ MISMA ÁREA DEFINE CANTIDAD
→ MISMA ÁREA ENVÍA
```

Control actual:

- experiencia del responsable;
- conocimiento de consumo;
- revisión visual;
- formato de Excel.

Riesgos:

- sobrepedido;
- subpedido;
- solicitud tardía;
- duplicación;
- producto incorrecto;
- ausencia de responsable individual.

##### 6.2. Consolidación productiva

El responsable del área productiva:

- recibe solicitudes;
- suma cantidades;
- decide ejecución;
- distribuye trabajo;
- informa resultado.

En varios casos no existe segunda revisión.

```text
CONSOLIDA
+
PLANIFICA
+
ASIGNA
+
REPORTA
```

Esta concentración debe conservarse como hallazgo AS-IS.

##### 6.3. Prioridad entre sedes

La prioridad conocida fue definida por Nathalia:

1. Vento Café;
2. Saudo;
3. Molka.

Actualmente funciona como una regla cultural.

No existe evidencia de:

- documento vigente;
- condiciones de excepción;
- fecha de aprobación;
- criterio cuantitativo;
- responsable de modificarla.

##### 6.4. Preparación y despacho

El conductor:

- consulta solicitudes;
- localiza productos;
- define disponibilidad física;
- organiza canastas;
- puede enviar parciales;
- distribuye por destino;
- carga;
- transporta.

Control actual:

- experiencia;
- conteo;
- conocimiento de productos;
- marcaciones visuales.

No existe un revisor independiente confirmado de la carga.

##### 6.5. Recepción en sede

Recibe:

- responsable del área;
- trabajador disponible;
- delegado.

Control:

- conteo;
- revisión visual;
- almacenamiento.

No existe evidencia de:

- firma;
- aprobación;
- aceptación estructurada;
- registro de diferencia;
- separación entre recibir y custodiar.

---

#### 7. Bodega e inventario

##### 7.1. Acceso a Bodega

Cualquier trabajador puede entrar y retirar insumos.

No existe una aprobación obligatoria confirmada.

```text
NECESIDAD
→ INGRESO
→ RETIRO
→ USO
```

Control actual:

- ubicación física;
- conocimiento de producto;
- presencia ocasional de Carlos;
- revisión posterior cuando falta inventario.

Estado: `AUSENTE` como segregación formal.

##### 7.2. Custodia de inventario

La responsabilidad habitual de Bodega existe, pero su titular está vacante.

Carlos cubre parcialmente:

- recepción;
- organización;
- supervisión;
- soporte.

El conductor cubre:

- apertura;
- retiro;
- alistamiento;
- carga;
- cierre.

Las áreas conservan sobrantes.

Resultado:

```text
CUSTODIA
→ DISTRIBUIDA
→ TEMPORAL
→ SIN ÚNICO RESPONSABLE EFECTIVO TODO EL DÍA
```

##### 7.3. Conteos y ajustes

No existe procedimiento confirmado para aprobar:

- conteo inicial;
- diferencia;
- ajuste;
- reapertura;
- corrección;
- regularización.

El piloto permitió movimientos incompletos y perdió confiabilidad.

---

#### 8. Compras y recepción de proveedores

##### 8.1. Necesidad de compra

Las áreas informan faltantes.

La gerente general consolida y define cantidades.

Control:

- experiencia;
- urgencia;
- consulta directa;
- conocimiento de compras previas.

No existe cálculo confiable desde inventario.

##### 8.2. Envío del pedido

La gerente general o Leidy envían el pedido.

Debe distinguirse:

```text
GERENTE GENERAL
→ CONSOLIDA Y DECIDE

LEIDY
→ PUEDE EJECUTAR EL ENVÍO
```

No se confirmó si Leidy puede modificar cantidades o aceptar cambios sin consultar.

Se vincula a `OPS-AUD-015`.

##### 8.3. Aceptación de precio y condiciones

La gerente general concentra actualmente la decisión.

Control:

- conversación con proveedor;
- experiencia;
- conocimiento de urgencia.

No existe comparación formal confirmada entre varias cotizaciones.

##### 8.4. Recepción física

Cuando recibe Carlos:

```text
RECIBE
→ REVISA
→ COMPARA
→ FIRMA
→ CUSTODIA SOPORTE TEMPORALMENTE
```

La misma persona ejecuta revisión y aceptación.

No existe segundo control confirmado.

##### 8.5. Recepción por sustituto

Puede recibir el conductor u otra persona capaz.

No se conoce:

- quién lo designa;
- qué puede firmar;
- qué diferencias puede aceptar;
- cuándo debe escalar;
- quién responde por el soporte.

---

#### 9. Merma y disposición

##### 9.1. Concentración actual

El trabajador puede:

```text
DETECTAR
→ EVALUAR
→ DECIDIR
→ DESECHAR
→ REGISTRAR
```

No existe aprobación separada confirmada.

Control:

- inspección sensorial;
- hoja manual de merma.

Riesgos:

- abuso;
- error;
- merma duplicada;
- falta de lote;
- falta de evidencia;
- inventario no actualizado.

##### 9.2. Transferencia de producto a Molka

La decisión puede tomarla el trabajador que considera que el producto ya no tiene la frescura comercial esperada.

No existe:

- aprobación formal;
- registro de transferencia;
- aceptación de Molka;
- fecha de vencimiento;
- límite de vida útil;
- control de inventario.

---

#### 10. Caja, ventas y pagos

##### 10.1. Apertura y cierre

El cajero:

- cuenta la base;
- abre;
- opera;
- cierra;
- cuenta efectivo.

Makos separa sesiones o turnos.

Control:

- conteo;
- cierre impreso;
- comparación posterior.

La persona que ejecuta el turno realiza también su cierre.

##### 10.2. Eliminación de productos

Makos exige comentario al eliminar un producto.

Este es un control de sistema actual.

Sin embargo:

- el cajero ejecuta y justifica;
- no se confirmó revisión posterior;
- no se vincula formalmente con el reemplazo;
- no se confirma efecto en producción o inventario.

##### 10.3. Pago con tarjeta

Cualquier trabajador puede llevar el datáfono.

Después informa al cajero.

Segregación actual:

```text
TRABAJADOR
→ EJECUTA PAGO FÍSICO

CAJERO
→ REGISTRA Y CIERRA
```

Este doble paso podría ser un control, pero depende de comunicación verbal y no de confirmación automática.

##### 10.4. Efectivo

El cajero entrega excedente y cierre.

La gerente general:

- recibe;
- cuenta;
- compara;
- custodia;
- administra.

Existe separación entre Caja y custodia posterior, pero Gerencia concentra:

- recepción;
- verificación;
- custodia;
- uso posterior.

##### 10.5. Diferencia de Caja

No se confirmó:

- quién investiga;
- quién aprueba ajuste;
- quién asume;
- si hay tolerancia;
- cómo se documenta;
- si puede afectar propina o nómina.

---

#### 11. Contabilidad y soportes

##### 11.1. Facturas y comprobantes

Control actual:

```text
PAGO O RECEPCIÓN
→ FACTURA
→ ENTREGA A GERENCIA
→ CARGA A CONTABILIDAD
→ CONCILIACIÓN POSTERIOR
```

La conciliación posterior detecta faltantes.

Es un control `POSTERIOR`, no preventivo.

##### 11.2. Clasificación de movimientos

El caso de retiros registrados como gastos demuestra que:

- existe registro;
- la clasificación económica puede ser incorrecta;
- el control se realiza mediante interpretación posterior.

No se confirmó quién puede reclasificar ni qué evidencia requiere.

---

#### 12. Turnos y asistencia

##### 12.1. Programación

La gerente general y la gerente de Vento Café elaboran horarios.

La participación exacta puede variar:

- Vento Café aporta conocimiento de personal operativo;
- Gerencia coordina el conjunto.

Control:

- revisión conjunta;
- publicación en VISO.

No existe aceptación obligatoria del trabajador.

##### 12.2. Check-in

El trabajador registra su propia asistencia.

El sistema conserva el evento.

No se confirmó un supervisor que valide presencia física en cada caso.

##### 12.3. Correcciones

No se conoce:

- quién solicita;
- quién aprueba;
- qué evidencia se exige;
- quién modifica;
- cómo afecta reportes y propinas.

Se vincula a `OPS-AUD-015`.

---

#### 13. Propinas y nómina

##### 13.1. Propinas

La gerente general:

- calcula;
- aplica ajustes;
- entrega dinero.

Concentración:

```text
CALCULA
+
DECIDE AJUSTE
+
CUSTODIA
+
ENTREGA
```

No existe control separado confirmado.

Los retrasos y ausencias actúan como insumo, pero no se conserva:

- cálculo inicial;
- regla;
- descuento;
- motivo;
- aprobación;
- aceptación.

##### 13.2. Nómina

La preparación involucra a Gerencia y Contabilidad.

Bancolombia Nóminas controla el pago bancario mediante credenciales autorizadas.

No se confirmó:

- quién prepara;
- quién revisa;
- quién autoriza definitivamente;
- si existe doble aprobación bancaria.

---

#### 14. Contratación, inducción y accesos

##### 14.1. Contratación

Participaciones conocidas:

```text
GERENTE GENERAL
→ PUBLICA, FILTRA, LLAMA, ENTREVISTA

RESPONSABLE DE ÁREA
→ OBSERVA PRUEBA

NATHALIA + GERENTE GENERAL
→ DECIDEN

ABOGADOS
→ FORMALIZAN
```

Existe separación entre evaluación interna y formalización jurídica.

No existe una ficha de evaluación confirmada.

##### 14.2. Inducción

La realiza quien esté disponible.

En Vento Café participa la gerente.

No existe:

- responsable único;
- lista de capacidades;
- firma;
- evaluación;
- aprobación de habilitación.

##### 14.3. Alta de accesos

Gerencia solicita.

Jefe de Operaciones ejecuta.

Esto separa parcialmente:

```text
NECESIDAD Y AUTORIZACIÓN
→ GERENCIA

CREACIÓN TÉCNICA
→ JEFE DE OPERACIONES
```

Pero la solicitud es informal y puede carecer de:

- sede;
- área;
- rol;
- fecha;
- vencimiento;
- responsable;
- evidencia.

##### 14.4. Baja de accesos

No existe iniciador obligatorio.

El Jefe de Operaciones:

- descubre;
- decide que corresponde desactivar;
- ejecuta.

No existe control preventivo ni SLA.

Este es uno de los principales riesgos de seguridad detectados.

---

#### 15. Marketing

##### 15.1. Solicitud

Nathalia o Jeo actúan como iniciadores y autoridades de negocio.

##### 15.2. Historias

Quien crea puede publicar sin aprobación previa.

Concentración:

```text
CREA
→ REVISA PROPIAMENTE
→ PUBLICA
```

##### 15.3. Publicaciones permanentes

Nathalia o Jeo aprueban.

Quien creó la pieza publica.

Existe separación parcial entre:

- creador;
- aprobador;
- publicador.

Sin embargo, la evidencia de aprobación no está estructurada.

##### 15.4. Correcciones

No se confirmó:

- quién decide versión final;
- cuántas revisiones;
- cuándo una pieza se considera aprobada;
- cómo se conserva la decisión.

---

#### 16. Vaila Vainilla

Jeo concentra:

- recepción;
- administración;
- priorización;
- coordinación.

La trabajadora de ventas:

- empaca;
- custodia temporalmente;
- entrega a mensajería.

No se confirmó:

- segundo control de contenido del paquete;
- validación de pago;
- conciliación de inventario;
- autorización de devolución;
- aprobación de reembolso;
- control de entrega final.

---

#### 17. Soporte tecnológico

##### 17.1. Priorización

El Jefe de Operaciones recibe el incidente y decide prioridad según impacto.

No existe cola ni supervisor separado.

##### 17.2. Ejecución y cierre

La misma persona:

- diagnostica;
- modifica;
- prueba;
- declara resuelto.

Control:

- funcionamiento visible;
- confirmación informal del usuario.

No existe revisión independiente ni historial técnico.

Esta concentración es operativamente comprensible, pero debe registrarse como riesgo y dependencia personal.

---

#### 18. Mantenimiento

La gerente general:

- recibe reporte;
- decide contactar técnico;
- selecciona o usa proveedor conocido;
- coordina;
- puede aceptar el resultado.

El técnico:

- diagnostica;
- propone;
- repara.

No existe registro confirmado de:

- cotización;
- aprobación de costo;
- orden;
- recepción técnica;
- garantía;
- repuesto retirado;
- evidencia de cierre.

---

#### 19. Servicios Generales

La prioridad se define mediante una jerarquía informal:

1. Nathalia o Carlos;
2. responsables de área;
3. rutina;
4. criterio propio.

La misma trabajadora ejecuta y autoevalúa inicialmente.

El solicitante puede pedir repetición.

No existe checklist ni supervisor formal permanente.

---

#### 20. Dispositivos y cuentas compartidas

##### 20.1. Makos Servicio

La cuenta identifica una función, no necesariamente a la persona.

##### 20.2. Tablets y celulares

Varias personas pueden ejecutar:

- pedidos;
- consultas;
- impresión;
- cambios.

##### 20.3. Redes y canales

Las cuentas pueden ser compartidas.

##### 20.4. Efecto sobre segregación

Aunque la operación física separe actores, el sistema puede registrar una sola identidad.

```text
PERSONA A EJECUTA
→ CUENTA COMPARTIDA

PERSONA B CORRIGE
→ MISMA CUENTA

AUDITORÍA
→ NO DISTINGUE
```

Esta brecha deberá alimentar:

- `CAP-MAP-006`;
- `PROC-ACTOR-001`;
- `PROC-ACTOR-002`;
- `PROC-ACTOR-003`;
- diseño de actor efectivo;
- dispositivos compartidos;
- autorización posterior.

---

#### 21. Concentraciones críticas de funciones

| Código     | Concentración                                                  | Riesgo                                    |
| ---------- | -------------------------------------------------------------- | ----------------------------------------- |
| `CONC-001` | Trabajador detecta, decide, desecha y registra merma           | Pérdida o abuso sin revisión              |
| `CONC-002` | Gerente general calcula, ajusta y entrega propinas             | Falta de transparencia                    |
| `CONC-003` | Gerente general recibe, cuenta, custodia y usa efectivo        | Custodia centralizada                     |
| `CONC-004` | Jefe de Operaciones diagnostica, cambia y cierra soporte       | Dependencia personal y falta de auditoría |
| `CONC-005` | Conductor localiza, alista, cambia cantidades, carga y entrega | Diferencias sin segunda revisión          |
| `CONC-006` | Responsable productivo consolida, asigna y reporta             | Producción sin verificación independiente |
| `CONC-007` | Cajero elimina producto y registra sustitución                 | Corrección sin aprobación separada        |
| `CONC-008` | Trabajador puede retirar libremente de Bodega                  | Inventario sin custodia                   |
| `CONC-009` | Jefe de Operaciones descubre y ejecuta baja de acceso          | Revocación tardía                         |
| `CONC-010` | Creador publica historias sin aprobación previa                | Riesgo reputacional                       |
| `CONC-011` | Jeo administra pedido y decisión comercial de Vaila            | Dependencia de una persona                |
| `CONC-012` | Gerente general concentra compras y proveedores                | Cuello de botella y poca trazabilidad     |

---

#### 22. Segregaciones existentes aunque sean informales

No todo el modelo actual carece de separación.

##### 22.1. Pago con tarjeta

- trabajador opera datáfono;
- cajero registra y cierra.

##### 22.2. Contratación

- Gerencia filtra;
- área observa;
- Nathalia y Gerencia deciden;
- abogados formalizan.

##### 22.3. Alta de acceso

- Gerencia solicita;
- Jefe de Operaciones crea.

##### 22.4. Publicación permanente

- creador produce;
- Nathalia o Jeo aprueba;
- creador publica.

##### 22.5. Contabilidad

- operación produce soporte;
- Gerencia recibe;
- Contabilidad registra.

##### 22.6. Entrega de efectivo

- sede entrega;
- Gerencia recibe y cuenta.

Estas separaciones deberán evaluarse después para determinar si son suficientes, redundantes o deben formalizarse.

---

#### 23. Controles posteriores

Los siguientes controles detectan el problema después de ocurrido:

| Control posterior                 | Problema detectado                      |
| --------------------------------- | --------------------------------------- |
| Conteo de efectivo contra cierre  | Diferencia de Caja                      |
| Conciliación contable             | Factura faltante o clasificación errada |
| Conteo físico                     | Inventario digital incorrecto           |
| Reclamo de sede                   | Faltante de remisión                    |
| Reclamo del cliente               | Entrega fallida o pedido incorrecto     |
| Descubrimiento del retiro laboral | Cuenta aún activa                       |
| Queja por suciedad                | Canasta requiere lavado                 |
| Equipo vuelve a fallar            | Solución técnica incompleta             |
| Producto se daña                  | Reasignación o vida útil inadecuada     |

El control posterior no evita el efecto inicial.

---

#### 24. Acciones sensibles sin control suficiente confirmado

1. retirar insumos de Bodega;
2. enviar remisión parcial;
3. cambiar destino de producto;
4. transferir producto a Molka;
5. desechar merma;
6. corregir una merma;
7. aceptar diferencia de proveedor;
8. recibir cuando Carlos no está;
9. corregir medio de pago;
10. anular factura;
11. resolver diferencia de Caja;
12. cambiar turno;
13. corregir check-in;
14. aplicar descuento de propina;
15. revocar accesos al retiro;
16. aprobar devolución de Vaila Vainilla;
17. aprobar reparación y costo;
18. retirar una publicación errónea;
19. ajustar inventario;
20. declarar una remisión completamente recibida.

Todos quedan vinculados a `OPS-AUD-015` cuando el procedimiento actual deba confirmarse.

---

#### 25. Relación con autorización futura

La transformación posterior deberá seguir esta secuencia:

```text
ACCIÓN SENSIBLE AS-IS
→ PROCESO TO-BE
→ RESPONSABILIDAD OBJETIVO
→ APROBACIÓN OBJETIVO
→ ROL BASE
+
ROL OPERATIVO
+
CONTEXTO
+
PERMISO
+
AUDITORÍA
```

No deberá realizarse la conversión automática:

```text
PERSONA QUE HOY LO HACE
→ PERSONA QUE DEBE PODER HACERLO SIEMPRE
```

Tampoco:

```text
APROBADOR EMPRESARIAL
→ ROL TÉCNICO CON ACCESO ILIMITADO
```

---

#### 26. Matriz de validaciones pendientes

| Tema                  | Validación requerida                          |
| --------------------- | --------------------------------------------- |
| Cambios de remisión   | Quién puede modificar y hasta cuándo          |
| Parciales             | Quién puede aceptar o cerrar saldo            |
| Recepción en sede     | Quién firma o acepta diferencias              |
| Leidy en compras      | Alcance de decisión y modificación            |
| Recepción sustituta   | Designación, firma y responsabilidad          |
| Diferencias proveedor | Rechazo, devolución y aprobación              |
| Ajustes de inventario | Iniciador, aprobador y evidencia              |
| Merma                 | Si existe revisión superior                   |
| Caja                  | Corrección de medios de pago y diferencias    |
| Facturación           | Anulación, nota crédito y reimpresión         |
| Turnos                | Cambio, reemplazo y aprobación                |
| Check-in              | Corrección y evidencia                        |
| Nómina                | Preparación, revisión y autorización bancaria |
| Propinas              | Regla, revisión y reclamo                     |
| Accesos               | Alta, modificación, suspensión y baja         |
| Marketing             | Evidencia y correcciones                      |
| Vaila Vainilla        | Devoluciones, reembolsos y entrega fallida    |
| Mantenimiento         | Aprobación de costo y aceptación              |
| Canastas              | Responsable de custodia y pérdida             |

Destino: `OPS-AUD-015`.

---

#### 27. Matriz de destino de hallazgos

| Hallazgo                                                  | Tarea exacta          |
| --------------------------------------------------------- | --------------------- |
| Frecuencia y criticidad de controles                      | `OPS-AUD-010`         |
| Dependencias de personas, sedes y terceros                | `OPS-AUD-011`         |
| Conciliaciones y doble intervención                       | `OPS-AUD-012`         |
| Pérdida de actor, aprobación y custodia                   | `OPS-AUD-013`         |
| Controles ante caída tecnológica                          | `OPS-AUD-014`         |
| Aprobadores y procedimientos no confirmados               | `OPS-AUD-015`         |
| Iniciador, ejecutor, supervisor y aprobador por capacidad | `CAP-MAP-006`         |
| Vinculación con roles base                                | `PROC-ACTOR-001`      |
| Vinculación con roles operativos                          | `PROC-ACTOR-002`      |
| Separación de iniciador, ejecutor, supervisor y aprobador | `PROC-ACTOR-003`      |
| Consolidación de brechas                                  | `GAP-CTRL-001`        |
| Vinculación a tarea y paquete futuro                      | `GAP-CTRL-006`        |
| Diseño TO-BE de aprobaciones                              | BLOQUE E2             |
| Implementación física de autorización                     | BLOQUES H, J, R0 y R1 |

---

#### 28. Decisiones propuestas

1. La documentación separa iniciador, ejecutor, revisor, aprobador, custodio, registrador y corrector.
2. La operación actual combina controles visuales, conteos, comparaciones, firmas, comentarios y escalamiento informal.
3. Varias aprobaciones son implícitas o culturales.
4. El conductor concentra alistamiento, ajuste, carga, transporte y entrega.
5. Las áreas productivas concentran consolidación, asignación y reporte.
6. Los retiros de Bodega no tienen aprobación ni registro completo.
7. La gerente general concentra consolidación y decisión de compras.
8. El alcance de Leidy al ordenar compras debe validarse.
9. La recepción de proveedor concentra revisión y firma en el receptor.
10. La merma concentra detección, decisión, disposición y registro en una persona.
11. La transferencia a Molka carece de aprobación y control formal.
12. Makos exige comentario al eliminar productos, pero no una aprobación separada.
13. El pago con tarjeta tiene doble intervención, pero depende de comunicación verbal.
14. La entrega de efectivo separa sede y Gerencia, aunque Gerencia concentra verificación, custodia y uso.
15. La conciliación contable es principalmente posterior.
16. La programación de turnos se comparte entre Gerencia General y Gerencia de Vento Café.
17. El trabajador registra su propio check-in.
18. La propina concentra cálculo, ajuste, custodia y entrega en Gerencia General.
19. La contratación separa evaluación interna y formalización jurídica.
20. La inducción no tiene responsable ni aprobación de competencia formal.
21. El alta de accesos separa solicitud y ejecución técnica.
22. La baja de accesos carece de iniciador obligatorio.
23. Las historias pueden publicarse sin aprobación previa.
24. Las publicaciones permanentes requieren aprobación de Nathalia o Jeo.
25. Soporte tecnológico depende del criterio y ejecución del Jefe de Operaciones.
26. Mantenimiento depende de Gerencia General y técnicos externos.
27. Las cuentas compartidas invalidan parte de la segregación real al nivel de auditoría.
28. Las concentraciones AS-IS no se convierten automáticamente en diseño objetivo.
29. Ninguna decisión autoriza roles, permisos, RLS, RPC, código, migraciones o cambios en Supabase.

---

#### 29. Criterios de aceptación

`OPS-AUD-009` podrá aprobarse cuando se confirme que:

- las acciones sensibles principales están inventariadas;
- se distinguen ejecución, aprobación, revisión, custodia y registro;
- los controles manuales actuales están descritos;
- se identifican controles preventivos y posteriores;
- se documentan concentraciones de funciones;
- se documentan segregaciones existentes;
- se registran cuentas y dispositivos compartidos;
- las acciones sin control suficiente quedan explícitas;
- cada duda tiene propietario en `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se han creado roles ni permisos;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 30. Resultado y continuidad

Con la aprobación de `OPS-AUD-009` quedará establecida la línea base inicial de:

- aprobaciones actuales;
- controles manuales;
- custodios;
- revisores;
- ejecutores;
- correctores;
- escalamiento;
- concentraciones de funciones;
- segregaciones informales;
- controles posteriores;
- acciones sensibles sin control;
- riesgos de cuentas compartidas;
- dependencias de personas clave.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-010
— Medir frecuencia, volumen, criticidad, tiempos y estacionalidad
```

`OPS-AUD-010` deberá utilizar estos procesos, excepciones y controles para establecer qué ocurre con mayor frecuencia, qué moviliza más trabajo, qué es más crítico y qué requiere ventanas, capacidad o respuesta prioritaria, sin diseñar todavía la solución TO-BE.



### ✅ OPS-AUD-010 — Medir frecuencia, volumen, criticidad, tiempos y estacionalidad

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Línea base AS-IS de carga operativa, frecuencia, tiempos, criticidad y variación temporal  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-009`  
**Método:** consolidación de datos confirmados, intervalos aproximados aportados por responsables y clasificación cualitativa cuando todavía no existe medición confiable  
**Validación pendiente:** `OPS-AUD-015` para cifras, frecuencias o temporadas no confirmadas

---

#### 1. Propósito

Establecer una línea base inicial de:

- frecuencia de ejecución;
- volumen operativo;
- duración;
- hora o ventana crítica;
- tiempo máximo tolerable;
- criticidad;
- estacionalidad;
- concentración de carga;
- dependencia de capacidad física o humana.

Esta tarea deberá diferenciar expresamente entre:

```text
DATO MEDIDO O CONFIRMADO
≠
ESTIMACIÓN OPERATIVA
≠
CLASIFICACIÓN CUALITATIVA
≠
DATO TODAVÍA DESCONOCIDO
```

El objetivo no es producir cifras artificiales.

Cuando no exista evidencia suficiente, el resultado correcto será:

- declarar el dato como no medido;
- clasificar su relevancia;
- definir la unidad que deberá medirse;
- vincular la validación a una tarea concreta.

---

#### 2. Alcance

Incluye los procesos ordinarios y excepciones identificados en:

- abastecimiento interno;
- remisiones;
- producción;
- Bodega;
- compras;
- proveedores;
- transporte;
- recepción;
- ventas;
- Caja;
- domicilios;
- Contabilidad;
- turnos;
- asistencia;
- propinas;
- nómina;
- contratación;
- accesos;
- Marketing;
- Vaila Vainilla;
- soporte tecnológico;
- mantenimiento;
- mermas;
- transferencias;
- Servicios Generales.

No define todavía:

- SLA objetivo;
- capacidad futura;
- dotación óptima;
- turnos objetivo;
- stock mínimo;
- punto de reorden;
- frecuencia TO-BE;
- programación automática;
- colas;
- alertas;
- dimensionamiento de infraestructura;
- arquitectura de datos;
- implementación.

---

#### 3. Escala de evidencia

| Código | Estado de evidencia | Uso                                                   |
| ------ | ------------------- | ----------------------------------------------------- |
| `M`    | Medido              | Existe una duración o cantidad observada directamente |
| `C`    | Confirmado          | El responsable confirmó frecuencia, horario o volumen |
| `A`    | Aproximado          | Existe un intervalo razonable aportado por operación  |
| `Q`    | Cualitativo         | Solo puede clasificarse como alto, medio o bajo       |
| `N`    | No medido           | No existe evidencia suficiente                        |
| `V`    | Por validar         | Debe confirmarse en `OPS-AUD-015`                     |

Toda cifra aproximada deberá mantener términos como:

- aproximadamente;
- normalmente;
- entre;
- cerca de;
- al menos;
- según carga.

---

#### 4. Escala de frecuencia

| Código       | Frecuencia                                | Definición                                   |
| ------------ | ----------------------------------------- | -------------------------------------------- |
| `CONT`       | Continua                                  | Ocurre repetidamente durante toda la jornada |
| `INTRA`      | Varias veces al día                       | Se repite dentro de una jornada              |
| `DIARIA`     | Una o más veces cada día operativo        |
| `SEMANAL`    | Una o varias veces por semana             |
| `QUINCENAL`  | Aproximadamente cada dos semanas          |
| `MENSUAL`    | Una o varias veces por mes                |
| `POR_TURNO`  | Una vez por turno                         |
| `POR_PEDIDO` | Cada vez que existe una venta o solicitud |
| `POR_EVENTO` | Solo cuando ocurre una condición          |
| `ESTACIONAL` | Se concentra en fechas o temporadas       |
| `IRREGULAR`  | Sin frecuencia estable                    |
| `NO_MEDIDA`  | Frecuencia desconocida                    |

---

#### 5. Escala cualitativa de volumen

El volumen se clasifica según carga operativa relativa, no según ingresos.

| Nivel            | Interpretación                                       |
| ---------------- | ---------------------------------------------------- |
| `V1 — MUY BAJO`  | Casos excepcionales o esporádicos                    |
| `V2 — BAJO`      | Pocos eventos por período                            |
| `V3 — MEDIO`     | Carga recurrente controlable                         |
| `V4 — ALTO`      | Muchas transacciones, productos o intervenciones     |
| `V5 — MUY ALTO`  | Flujo continuo o concentrado que domina la operación |
| `VN — NO MEDIDO` | No existe evidencia suficiente                       |

La clasificación deberá validarse posteriormente mediante conteos reales.

---

#### 6. Escala de criticidad

| Nivel            | Descripción                                                        | Consecuencia típica                  |
| ---------------- | ------------------------------------------------------------------ | ------------------------------------ |
| `CR1 — BAJA`     | Puede esperar sin afectar operación principal                      | Retraso administrativo menor         |
| `CR2 — MODERADA` | Afecta eficiencia o experiencia, pero existe alternativa           | Trabajo manual adicional             |
| `CR3 — ALTA`     | Afecta un área, sede o proceso relevante                           | Retraso, reproceso o pérdida parcial |
| `CR4 — CRÍTICA`  | Detiene venta, producción, despacho, pago o acceso                 | Interrupción operativa importante    |
| `CR5 — SEVERA`   | Puede producir pérdida financiera, sanitaria, legal o de seguridad | Riesgo empresarial inmediato         |

La criticidad no equivale a frecuencia.

```text
POCO FRECUENTE
+
ALTO IMPACTO
→ PUEDE SER CRÍTICO
```

---

#### 7. Escala de sensibilidad temporal

| Código | Tolerancia aproximada AS-IS         |
| ------ | ----------------------------------- |
| `T0`   | Debe resolverse inmediatamente      |
| `T1`   | Menos de 15 minutos                 |
| `T2`   | Durante la hora                     |
| `T3`   | Durante el turno                    |
| `T4`   | Antes del siguiente ciclo operativo |
| `T5`   | Durante el día                      |
| `T6`   | Durante la semana                   |
| `T7`   | Puede programarse                   |
| `TN`   | No definida                         |

Esta escala no constituye un SLA objetivo.

---

#### 8. Ventanas operativas confirmadas

| Código    | Ventana o duración                                                                        | Evidencia       | Proceso                                                  |
| --------- | ----------------------------------------------------------------------------------------- | --------------- | -------------------------------------------------------- |
| `TMP-001` | Conductor llega aproximadamente a las **05:30**                                           | `A`             | Apertura del Centro de Producción y remisiones matutinas |
| `TMP-002` | Jefatura de Operaciones está habitualmente de **08:00 a 12:00** y de **14:00 a 17:00**    | `C`             | Recepción de proveedores, Bodega y soporte               |
| `TMP-003` | Conductor regresa aproximadamente a las **17:00**                                         | `A`             | Recolección de producción y carga                        |
| `TMP-004` | Alistamiento y carga de la tarde toma aproximadamente **1,5 a 2 horas**                   | `A`             | Despacho interno                                         |
| `TMP-005` | Vento Café tiene **dos turnos y dos cierres de Caja diarios**                             | `C`             | Caja                                                     |
| `TMP-006` | Producción central de Barra ocurre los **martes**                                         | `C`             | Producción semanal de Barra                              |
| `TMP-007` | Una o dos recetas de Galletería producen aproximadamente **104 galletas**                 | `A`             | Producción de Galletería                                 |
| `TMP-008` | Esa producción suele cubrir aproximadamente **una semana**                                | `A`             | Stock de Galletería                                      |
| `TMP-009` | Panadería utiliza procesos de **varios días** por fermentación y reposo                   | `C` cualitativo | Panadería y Bollería                                     |
| `TMP-010` | Las solicitudes suelen prepararse al **final del turno** y a veces en la mañana siguiente | `C` cualitativo | Remisiones                                               |
| `TMP-011` | Compras principales tienen comportamiento **semanal**, con urgencias adicionales          | `C` cualitativo | Compras                                                  |
| `TMP-012` | Servicios Generales opera durante la jornada con rutina y solicitudes variables           | `C` cualitativo | Limpieza                                                 |
| `TMP-013` | Soporte y mantenimiento son reactivos, sin agenda fija                                    | `C`             | Tecnología y mantenimiento                               |

---

#### 9. Volumen mínimo conocido de solicitudes internas

Cuando todas las unidades operativas envían solicitud en el mismo ciclo, existe al menos la siguiente estructura:

| Origen                                       | Solicitudes diferenciadas |
| -------------------------------------------- | ------------------------: |
| Vento Café — Servicio                        |                         1 |
| Vento Café — Cocina                          |                         1 |
| Vento Café — Barra                           |                         1 |
| Saudo                                        |                         1 |
| Molka                                        |                         1 |
| **Total mínimo conocido por ciclo completo** |                     **5** |

Este total:

- representa conjuntos de solicitud, no líneas de producto;
- no incluye compras;
- no incluye solicitudes extraordinarias;
- no implica que todas se envíen todos los días;
- debe validarse por día de operación en `OPS-AUD-015`.

El volumen real de líneas, productos, presentaciones y cantidades no está medido.

---

#### 10. Matriz maestra de frecuencia, volumen y criticidad

| Código     | Proceso                      | Frecuencia AS-IS                        | Volumen          | Criticidad | Sensibilidad          |
| ---------- | ---------------------------- | --------------------------------------- | ---------------- | ---------- | --------------------- |
| `PROC-001` | Solicitud de remisión        | `DIARIA` / fin de turno                 | `V4` estimado    | `CR4`      | `T4`                  |
| `PROC-002` | Consolidación productiva     | `DIARIA`                                | `V4`             | `CR4`      | `T4`                  |
| `PROC-003` | Preparación matutina         | `DIARIA`                                | `V4`             | `CR4`      | `T2`                  |
| `PROC-004` | Panadería y Bollería         | `DIARIA` + ciclos multiday              | `V4`             | `CR4`      | `T4`                  |
| `PROC-005` | Repostería                   | `DIARIA` según remisión                 | `V3`             | `CR3`      | `T4`                  |
| `PROC-006` | Tortas estandarizadas        | `POR_PEDIDO` / remisión                 | `V2-V3`          | `CR3`      | `T4`                  |
| `PROC-007` | Galletería                   | `SEMANAL` aproximada                    | `V2`             | `CR2`      | `T6`                  |
| `PROC-008` | Cocina Caliente              | `SEMANAL` planificada + retiros diarios | `V3`             | `CR4`      | `T4`                  |
| `PROC-009` | Producción de Barra          | `SEMANAL`, martes                       | `V2-V3`          | `CR3`      | `T4`                  |
| `PROC-010` | Alistamiento de la tarde     | `DIARIA`                                | `V4`             | `CR4`      | `T2`                  |
| `PROC-011` | Transporte y recepción       | `DIARIA`                                | `V4`             | `CR4`      | `T3`                  |
| `PROC-012` | Retorno y lavado de canastas | `DIARIA` / `POR_EVENTO`                 | `V3`             | `CR2`      | `T5`                  |
| `PROC-013` | Recepción de proveedor       | `IRREGULAR` / frecuente                 | `VN`             | `CR4`      | `T2`                  |
| `PROC-014` | Retiro de Bodega             | `CONT` / `INTRA`                        | `V5` estimado    | `CR4`      | `T1-T3`               |
| `PROC-015` | Compra a proveedor           | `SEMANAL` + urgencias                   | `V3`             | `CR4`      | `T4-T6`               |
| `PROC-016` | Recepción de fruver          | `NO_MEDIDA`                             | `VN`             | `CR3`      | `T2`                  |
| `PROC-017` | Apertura de Vento Café       | `DIARIA`                                | `V2`             | `CR4`      | `T0`                  |
| `PROC-018` | Atención de mesa Vento Café  | `CONT`                                  | `V5`             | `CR4`      | `T0-T1`               |
| `PROC-019` | Cocina Vento Café            | `CONT`                                  | `V5`             | `CR4`      | `T1-T2`               |
| `PROC-020` | Bar y Barra Vento Café       | `CONT`                                  | `V5`             | `CR4`      | `T1-T2`               |
| `PROC-021` | Pago Vento Café              | `POR_PEDIDO`                            | `V5`             | `CR5`      | `T0-T1`               |
| `PROC-022` | Pedido Rappi                 | `POR_PEDIDO`                            | `VN`             | `CR4`      | `T1-T2`               |
| `PROC-023` | Domicilio directo            | `POR_PEDIDO`                            | `VN`             | `CR4`      | `T1-T3`               |
| `PROC-024` | Atención Saudo               | `CONT`                                  | `V4-V5`          | `CR4`      | `T0-T1`               |
| `PROC-025` | Cocina Saudo                 | `CONT`                                  | `V4`             | `CR4`      | `T1-T2`               |
| `PROC-026` | Atención Molka               | `CONT`                                  | `V3-V4`          | `CR4`      | `T0-T2`               |
| `PROC-027` | Cierre y relevo de Caja      | `POR_TURNO`                             | `V2`             | `CR5`      | `T3`                  |
| `PROC-028` | Entrega de efectivo          | `DIARIA`                                | `V2`             | `CR5`      | `T5`                  |
| `PROC-029` | Registro contable            | `DIARIA` / `SEMANAL`                    | `VN`             | `CR5`      | `T5-T6`               |
| `PROC-030` | Programación de turnos       | `SEMANAL`                               | `V3`             | `CR4`      | `T6`                  |
| `PROC-031` | Consulta y check-in          | `POR_TURNO`                             | `V4`             | `CR4`      | `T0-T1`               |
| `PROC-032` | Revisión de asistencia       | `DIARIA` / periódica                    | `V3`             | `CR3`      | `T5`                  |
| `PROC-033` | Liquidación de propinas      | `NO_MEDIDA`                             | `VN`             | `CR4`      | `T6`                  |
| `PROC-034` | Pago de nómina               | Periódica, frecuencia no confirmada     | `V3`             | `CR5`      | `T0` en fecha de pago |
| `PROC-035` | Reclutamiento                | `POR_EVENTO`                            | `V2`             | `CR3`      | `T7`                  |
| `PROC-036` | Inducción                    | `POR_EVENTO`                            | `V2`             | `CR4`      | `T3-T6`               |
| `PROC-037` | Alta de acceso               | `POR_EVENTO`                            | `V2`             | `CR5`      | `T3-T5`               |
| `PROC-038` | Baja de acceso               | `POR_EVENTO`                            | `V2`             | `CR5`      | `T0`                  |
| `PROC-039` | Marketing                    | `IRREGULAR`                             | `V3`             | `CR2-CR3`  | `TN`                  |
| `PROC-040` | Vaila Vainilla               | `POR_PEDIDO` / por lote de despacho     | `VN`             | `CR4`      | `T3-T5`               |
| `PROC-041` | Soporte tecnológico          | `POR_EVENTO`, reactivo                  | `V3` cualitativo | `CR2-CR5`  | `T0-T5`               |
| `PROC-042` | Mantenimiento                | `POR_EVENTO`, reactivo                  | `V2`             | `CR3-CR5`  | `T0-T7`               |
| `PROC-043` | Merma                        | `POR_EVENTO`                            | `VN`             | `CR4`      | `T2-T5`               |
| `PROC-044` | Reasignación a Molka         | `POR_EVENTO`                            | `V1-V2`          | `CR3`      | `T3-T5`               |
| `PROC-045` | Servicios Generales          | `DIARIA` / `CONT`                       | `V4`             | `CR3-CR4`  | `T2-T5`               |

Las bandas `V`, `CR` y `T` representan una primera clasificación AS-IS y deberán recalibrarse con observación real.

---

#### 11. Remisiones y abastecimiento interno

##### 11.1. Frecuencia

La solicitud de remisión tiene comportamiento predominantemente diario.

Se prepara:

- al final del turno;
- excepcionalmente en la mañana siguiente.

La recepción tardía reduce el tiempo disponible para:

- consolidar;
- producir;
- alistar;
- transportar.

##### 11.2. Volumen

El volumen mínimo conocido por ciclo completo es de cinco solicitudes diferenciadas.

No se conoce todavía:

- número promedio de líneas por solicitud;
- número de productos únicos;
- unidades solicitadas;
- frecuencia de repetición;
- número de correcciones;
- porcentaje de solicitudes tardías;
- porcentaje de faltantes.

##### 11.3. Criticidad

`CR4 — CRÍTICA`.

Una solicitud ausente o tardía puede afectar:

- producción;
- abastecimiento;
- ventas;
- disponibilidad de producto;
- carga del conductor;
- compras urgentes.

##### 11.4. Ventana crítica

La ventana más sensible es:

```text
CIERRE DE LA SEDE
→ ENVÍO DE SOLICITUD
→ PREPARACIÓN O PRODUCCIÓN ANTES DEL DESPACHO
```

No existe hora de corte formal confirmada.

##### 11.5. Métricas futuras mínimas

- solicitudes esperadas por día;
- solicitudes recibidas;
- hora de envío;
- líneas por solicitud;
- correcciones;
- faltantes;
- cumplimiento total;
- tiempo hasta confirmación;
- tiempo hasta recepción.

---

#### 12. Producción central

##### 12.1. Panadería y Bollería

**Frecuencia:** diaria, con ciclos que pueden comenzar varios días antes.

**Restricción temporal:**

- fermentación;
- reposo;
- horneado;
- disponibilidad de horno;
- anticipación.

**Criticidad:** `CR4`.

Un faltante no siempre puede recuperarse el mismo día.

**Estacionalidad conocida:** no cuantificada.

Debe medirse:

- lotes diarios;
- unidades por referencia;
- horas de fermentación;
- capacidad de horno;
- utilización;
- reproceso;
- cumplimiento por sede.

##### 12.2. Repostería

**Frecuencia:** diaria según remisiones.

**Volumen:** `V3` inicial.

**Criticidad:** `CR3`.

Debe medirse:

- referencias por día;
- unidades;
- personas asignadas;
- tiempo por familia;
- cumplimiento;
- productos dejados sin identificación.

##### 12.3. Pastelería y Tortas

**Frecuencia:** por remisión o necesidad.

**Dependencia:** una ejecutora habitual.

**Criticidad:** `CR3`, con riesgo de capacidad por persona única.

Debe medirse:

- tortas diarias;
- tiempo estándar;
- carga por ejecutora;
- anticipación requerida;
- fallos;
- demanda por sede.

##### 12.4. Galletería

Datos aproximados:

- una o dos recetas;
- aproximadamente 104 galletas;
- cobertura cercana a una semana.

Este es uno de los pocos procesos con una relación inicial entre lote y duración de stock.

Debe validarse:

- cantidad por receta;
- merma;
- consumo por sede;
- punto de reposición;
- duración real.

##### 12.5. Cocina Caliente

**Frecuencia:** producción planificada semanalmente.

**Consumo:** retiro diario o según remisión.

**Criticidad:** `CR4`.

Debe medirse:

- presentaciones producidas;
- inventario inicial y final;
- días de cobertura;
- tiempo de reposición;
- productos críticos;
- frecuencia de stock insuficiente.

##### 12.6. Producción de Barra

**Frecuencia confirmada:** semanal, los martes.

**Volumen:** cantidad estandarizada, no medida.

**Criticidad:** `CR3`.

Debe medirse:

- referencias;
- porciones;
- tiempo;
- consumo semanal;
- sobrantes;
- faltantes antes del siguiente martes.

---

#### 13. Alistamiento y logística

##### 13.1. Alistamiento de la tarde

Duración aproximada confirmada:

- entre 1,5 y 2 horas.

Inicio aproximado:

- conductor regresa cerca de las 17:00.

El trabajo incluye:

- recoger producción;
- completar Bodega;
- completar Cocina Caliente;
- separar destinos;
- cargar.

**Criticidad:** `CR4`.

**Cuello de botella:** una persona concentra múltiples actividades.

##### 13.2. Transporte

La frecuencia es diaria, pero no se conocen:

- número de recorridos;
- kilómetros;
- duración por ruta;
- orden de sedes;
- tiempo de descarga;
- retrasos;
- capacidad del vehículo;
- ocupación.

##### 13.3. Recepción

La recepción ocurre en cada entrega.

No se conocen:

- minutos por sede;
- líneas contadas;
- diferencias;
- tiempo para refrigerar;
- porcentaje de recepción parcial;
- productos dejados temporalmente fuera de almacenamiento.

##### 13.4. Canastas

El retorno es recurrente.

No existe conteo de:

- canastas por sede;
- canastas en tránsito;
- canastas sucias;
- canastas lavadas;
- canastas perdidas;
- tiempo de ciclo;
- utilización.

---

#### 14. Bodega e inventario

##### 14.1. Retiros

Los retiros ocurren varias veces durante la jornada y pueden ser continuos.

**Volumen estimado:** `V5`.

**Criticidad:** `CR4`.

La ausencia de registro significa que el volumen real es desconocido.

##### 14.2. Recepciones

Las recepciones de proveedor son irregulares y dependen de programación externa.

No existe conteo confirmado de:

- proveedores por día;
- líneas;
- unidades;
- duración;
- diferencias;
- rechazos.

##### 14.3. Conteo físico

No existe periodicidad estable confirmada después del piloto inicial.

##### 14.4. Métricas prioritarias

- retiros por hora;
- productos por retiro;
- actor;
- área;
- entradas;
- movimientos;
- ajustes;
- exactitud;
- diferencias;
- duración del conteo;
- productos sin ubicación;
- movimientos fuera de horario.

---

#### 15. Compras

##### 15.1. Frecuencia

Las compras principales presentan comportamiento semanal.

Existen compras urgentes por:

- faltantes;
- inventario desconocido;
- cambios de consumo;
- proveedor;
- producción.

##### 15.2. Volumen

No se conoce:

- número de órdenes;
- líneas;
- proveedores;
- monto;
- compras urgentes;
- entregas parciales.

##### 15.3. Criticidad

`CR4`.

Una compra tardía puede detener producción y abastecimiento.

##### 15.4. Tiempo

Debe medirse:

```text
NECESIDAD DETECTADA
→ PEDIDO ENVIADO
→ CONFIRMACIÓN
→ ENTREGA
→ RECEPCIÓN
```

##### 15.5. Estacionalidad

No existe estacionalidad cuantificada.

Es razonable esperar variaciones comerciales, pero no se registrarán como hecho hasta `OPS-AUD-015`.

---

#### 16. Ventas y servicio

##### 16.1. Vento Café

Los procesos de:

- toma de pedido;
- preparación;
- servicio;
- pago;

ocurren continuamente durante la apertura.

**Volumen:** `V5`.

**Criticidad:** `CR4-CR5`.

No se conocen:

- ventas por hora;
- mesas;
- tiempo de espera;
- tiempo de Cocina;
- tiempo de Barra;
- tiempo de pago;
- pedidos por mesero;
- capacidad de asientos;
- ocupación.

##### 16.2. Saudo

**Volumen:** `V4-V5`.

Cuello de botella confirmado:

- dos hornos napolitanos.

Debe medirse:

- pizzas por hora;
- tiempo por pizza;
- ocupación de horno;
- cola;
- pedidos simultáneos;
- tiempo hasta entrega.

##### 16.3. Molka

**Volumen:** `V3-V4`.

Cuello de botella conocido:

- acumulación de clientes;
- bebidas calientes;
- personal polivalente.

Debe medirse:

- pedidos por hora;
- tiempo de cobro;
- tiempo de preparación;
- personas activas;
- cola máxima;
- porcentaje de entrega en mesa.

##### 16.4. Estacionalidad comercial

No está cuantificada.

Deberán distinguirse posteriormente:

- día de semana;
- hora;
- quincena;
- fin de mes;
- festivos;
- vacaciones;
- temporadas;
- campañas;
- clima;
- eventos.

---

#### 17. Rappi, ManyChat y domicilios

##### 17.1. Frecuencia

`POR_PEDIDO`, sin volumen confirmado.

##### 17.2. Trabajo adicional

Cada pedido requiere transcripción manual.

Debe medirse:

- pedidos por canal;
- tiempo de transcripción;
- errores;
- cancelaciones;
- tiempo de mensajería;
- entregas fallidas;
- conciliación de pagos.

##### 17.3. Criticidad

`CR4`.

La demora afecta:

- promesa al cliente;
- temperatura;
- calidad;
- reputación;
- carga de Caja.

##### 17.4. Ventana

La sensibilidad es intraturno.

No existe seguimiento rutinario después de que sale el pedido.

---

#### 18. Caja, efectivo y Contabilidad

##### 18.1. Apertura y cierre

Vento Café realiza dos cierres diarios.

Saudo y Molka operan normalmente con un cierre diario, pendiente de confirmación formal.

##### 18.2. Pago

El pago es un evento de sensibilidad inmediata.

**Criticidad:** `CR5`.

Debe medirse:

- pagos por medio;
- tiempo;
- reversos;
- diferencias;
- mesas cerradas tarde;
- pagos comunicados verbalmente;
- fallos de datáfono.

##### 18.3. Entrega de efectivo

Ocurre diariamente para el excedente del día anterior.

Debe medirse:

- valor;
- hora;
- responsable;
- diferencia;
- retiros;
- gastos;
- tiempo hasta registro contable.

##### 18.4. Registro contable

No existe tiempo medido entre:

- compra o pago;
- recepción del soporte;
- entrega;
- carga;
- conciliación.

**Criticidad:** `CR5`.

---

#### 19. Turnos, asistencia, propinas y nómina

##### 19.1. Programación

Frecuencia: semanal.

Debe medirse:

- trabajadores;
- turnos;
- cambios;
- reemplazos;
- horas;
- sedes;
- errores;
- tiempo de elaboración.

##### 19.2. Check-in

Frecuencia: por trabajador y turno.

Debe medirse:

- check-ins esperados;
- realizados;
- tardíos;
- ausentes;
- corregidos;
- fallidos;
- duración del proceso.

##### 19.3. Propinas

Frecuencia y período de liquidación no confirmados.

Debe medirse:

- valor total;
- trabajadores;
- ajustes;
- descuentos;
- tiempo de cálculo;
- tiempo de entrega;
- reclamos.

##### 19.4. Nómina

La frecuencia de pago no se documentará sin confirmación.

**Criticidad:** `CR5` en la fecha de pago.

Debe medirse:

- empleados;
- novedades;
- correcciones;
- archivo rechazado;
- tiempo de preparación;
- aprobación;
- pago fallido.

---

#### 20. Contratación, inducción y accesos

##### 20.1. Contratación

Frecuencia: por vacante.

Volumen actual no medido.

Debe medirse:

- vacantes;
- hojas de vida;
- entrevistas;
- pruebas;
- tiempo de cobertura;
- candidatos rechazados;
- rotación.

##### 20.2. Inducción

Frecuencia: por ingreso.

**Criticidad:** `CR4`.

Debe medirse:

- horas de acompañamiento;
- responsable;
- capacidades;
- errores iniciales;
- tiempo hasta autonomía.

##### 20.3. Altas y bajas

Frecuencia: por evento.

**Baja de acceso:** `CR5`, `T0`.

Debe medirse:

- tiempo desde contratación hasta acceso;
- tiempo desde retiro hasta revocación;
- cuentas activas sin empleado;
- cambios internos;
- errores de permisos.

---

#### 21. Marketing

##### 21.1. Frecuencia

Irregular y reactiva.

##### 21.2. Volumen

No existe calendario ni conteo confirmado.

Debe medirse:

- solicitudes;
- piezas;
- historias;
- publicaciones;
- revisiones;
- tiempo de producción;
- rechazos;
- fecha solicitada frente a publicación.

##### 21.3. Criticidad

Generalmente `CR2-CR3`.

Puede aumentar en:

- lanzamiento;
- evento;
- promoción;
- crisis;
- publicación errónea.

##### 21.4. Estacionalidad

Probablemente vinculada a campañas y fechas comerciales, pero no está documentada.

---

#### 22. Vaila Vainilla

##### 22.1. Frecuencia

Por pedido, con acumulación por lotes antes de la recolección.

##### 22.2. Volumen

No medido.

Debe medirse:

- pedidos;
- unidades;
- tiempo hasta empaque;
- pedidos por lote;
- frecuencia de mensajería;
- entregas;
- devoluciones;
- cancelaciones;
- stock.

##### 22.3. Criticidad

`CR4`.

La falta de guía, seguimiento e inventario puede afectar cliente y dinero.

##### 22.4. Estacionalidad

No confirmada.

---

#### 23. Soporte tecnológico

##### 23.1. Frecuencia

Reactiva, por evento.

Se considera cualitativamente recurrente porque interrumpe el desarrollo.

No existe conteo histórico.

##### 23.2. Criticidad variable

| Tipo de incidente                | Criticidad probable |
| -------------------------------- | ------------------- |
| Impresora de comandas o Caja     | `CR4`               |
| Red o internet operativo         | `CR4-CR5`           |
| Equipo administrativo secundario | `CR2-CR3`           |
| Cámara                           | `CR2-CR4`           |
| Sonido                           | `CR2-CR3`           |
| Aplicación central               | `CR4-CR5`           |
| Dispositivo de check-in o acceso | `CR3-CR5`           |

##### 23.3. Tiempos

No se registran:

- apertura;
- diagnóstico;
- espera;
- intervención;
- resolución;
- recurrencia.

##### 23.4. Impacto

Cada incidente puede desplazar trabajo de desarrollo.

Debe medirse:

- incidentes por sede;
- horas;
- activo;
- causa;
- reincidencia;
- tiempo perdido de desarrollo.

---

#### 24. Mantenimiento

##### 24.1. Frecuencia

Correctiva y por evento.

No existe plan preventivo confirmado.

##### 24.2. Criticidad

Varía entre `CR3` y `CR5`.

Depende de:

- activo;
- impacto;
- alternativa;
- repuesto;
- técnico.

##### 24.3. Tiempos críticos

```text
FALLA
→ REPORTE
→ CONTACTO
→ VISITA
→ DIAGNÓSTICO
→ REPUESTO
→ REPARACIÓN
```

Los principales retrasos conocidos son:

- técnico no disponible;
- repuesto difícil de conseguir.

##### 24.4. Métricas

- fallas por activo;
- tiempo fuera de servicio;
- espera de técnico;
- espera de repuesto;
- costo;
- repetición;
- pérdida operativa.

---

#### 25. Mermas y reasignaciones

##### 25.1. Frecuencia

No medida.

##### 25.2. Volumen

No medido por:

- producto;
- sede;
- causa;
- cantidad;
- costo.

##### 25.3. Criticidad

`CR4`.

Afecta:

- seguridad alimentaria;
- inventario;
- costo;
- calidad;
- responsabilidad.

##### 25.4. Tiempo

La decisión es inmediata cuando se detecta deterioro.

El registro se realiza manualmente.

##### 25.5. Estacionalidad

No confirmada.

Puede depender de demanda, temperatura y rotación, pero no se asumirá sin evidencia.

---

#### 26. Servicios Generales

##### 26.1. Frecuencia

Diaria y continua.

##### 26.2. Volumen

`V4` cualitativo.

Incluye:

- rutina;
- instrucciones;
- necesidades observadas;
- canastas;
- zonas comunes;
- apoyos.

##### 26.3. Criticidad

`CR3-CR4`.

Aumenta cuando afecta:

- inocuidad;
- producción;
- atención al cliente;
- apertura;
- equipos;
- canastas.

##### 26.4. Tiempo

No existe checklist ni duración estándar.

---

#### 27. Estacionalidad: estado actual

No existe una medición empresarial consolidada de estacionalidad.

Se deben distinguir cinco tipos futuros:

| Tipo       | Ejemplo                           |
| ---------- | --------------------------------- |
| Intradía   | apertura, almuerzo, tarde, cierre |
| Semanal    | lunes frente a fin de semana      |
| Mensual    | quincena, fin de mes              |
| Calendario | festivos, vacaciones, Navidad     |
| Comercial  | campañas, lanzamientos, eventos   |

Información confirmada actualmente:

- Producción de Barra tiene estacionalidad semanal: martes.
- Galletería opera por ciclos aproximados de una semana.
- Compras principales tienen comportamiento semanal.
- Programación de turnos tiene comportamiento semanal.
- La demanda comercial cambia, pero no se han cuantificado patrones.
- Soporte y mantenimiento no son estacionales; son reactivos.

No se deberán crear pronósticos hasta contar con datos.

---

#### 28. Procesos de mayor criticidad inicial

##### 28.1. `CR5 — SEVERA`

- pago y cierre;
- efectivo y Contabilidad;
- nómina;
- baja de accesos;
- incidentes tecnológicos que detienen operación;
- riesgos sanitarios de merma o producto no apto.

##### 28.2. `CR4 — CRÍTICA`

- remisiones;
- producción;
- alistamiento;
- transporte;
- recepción;
- Bodega;
- compras;
- ventas;
- Cocina;
- Barra;
- turnos;
- check-in;
- Vaila Vainilla;
- inducción.

##### 28.3. `CR3 — ALTA`

- Marketing permanente;
- limpieza no sanitaria;
- mantenimiento con alternativa;
- Repostería y Tortas según producto;
- reasignaciones.

Estas clasificaciones deberán validarse con impacto real y no solo con percepción.

---

#### 29. Picos operativos conocidos o previsibles

| Pico                            | Evidencia actual                                |
| ------------------------------- | ----------------------------------------------- |
| Inicio de jornada del conductor | Confirmado aproximadamente a las 05:30          |
| Cierre de solicitudes           | Confirmado al final del turno, sin hora fija    |
| Retorno del conductor           | Aproximadamente a las 17:00                     |
| Alistamiento y carga            | 1,5 a 2 horas                                   |
| Apertura y cierre de Caja       | Por turno                                       |
| Producción de Barra             | Martes                                          |
| Preparación de Panadería        | Condicionada por fermentación y ciclos multiday |
| Demanda de restaurantes         | Existe variación, no cuantificada               |
| Incidentes tecnológicos         | Reactivos y capaces de interrumpir desarrollo   |

---

#### 30. Vacíos de medición prioritarios

1. líneas por remisión;
2. cumplimiento de remisiones;
3. faltantes y sobrantes;
4. producción por referencia;
5. tiempo por lote;
6. capacidad por estación;
7. carga del conductor;
8. tiempo por ruta;
9. diferencias de recepción;
10. retiros de Bodega;
11. exactitud de inventario;
12. compras urgentes;
13. entregas de proveedores;
14. ventas por hora;
15. tiempos de Cocina y Barra;
16. capacidad de hornos;
17. domicilios por canal;
18. errores de transcripción;
19. diferencias de Caja;
20. tiempo de registro contable;
21. cambios de turno;
22. check-ins fallidos;
23. liquidación de propinas;
24. altas y bajas de acceso;
25. producción de Marketing;
26. pedidos Vaila Vainilla;
27. incidentes técnicos;
28. tiempo fuera de servicio;
29. mermas;
30. ciclo de canastas.

Todos deberán convertirse en métricas concretas durante el diseño TO-BE o los pilotos correspondientes.

---

#### 31. Instrumentación futura mínima

Esta sección no autoriza implementación. Define qué deberá poder medirse después.

##### 31.1. Para todo proceso

- `started_at`;
- `completed_at`;
- `actor_id`;
- `site_id`;
- `area_id`;
- `status`;
- `outcome`;
- `exception_code`;
- `source_channel`.

##### 31.2. Para cantidades

- solicitado;
- confirmado;
- producido;
- cargado;
- recibido;
- aceptado;
- rechazado;
- pendiente;
- desperdiciado.

##### 31.3. Para colas

- entrada;
- inicio;
- espera;
- ejecución;
- cierre;
- reintento;
- cancelación.

##### 31.4. Para criticidad

- impacto;
- urgencia;
- sede afectada;
- capacidad afectada;
- personas afectadas;
- valor comprometido;
- riesgo sanitario o de seguridad.

La estructura definitiva corresponde a E2, E3 y E4.

---

#### 32. Reglas para no convertir estimaciones en hechos

1. Una clasificación `V4` no significa que exista una cifra exacta.
2. Una duración aproximada no debe tratarse como estándar contractual.
3. Una frecuencia semanal no implica un día fijo, salvo confirmación.
4. La ausencia de datos no implica baja frecuencia.
5. La baja frecuencia no implica baja criticidad.
6. La frecuencia observada no define la frecuencia TO-BE.
7. Los picos percibidos deberán contrastarse con datos.
8. La estacionalidad no deberá inferirse únicamente por experiencia.
9. Las métricas futuras deberán conservar contexto de sede, área, producto y canal.
10. Toda métrica deberá tener un propietario y una decisión asociada.

---

#### 33. Validaciones pendientes para `OPS-AUD-015`

| Tema           | Validación                                 |
| -------------- | ------------------------------------------ |
| Remisiones     | Días, hora de corte, líneas y correcciones |
| Producción     | Volumen por área y tiempos                 |
| Conductor      | Rutas, frecuencia y duración               |
| Proveedores    | Entregas por día y duración                |
| Fruver         | Frecuencia y volumen                       |
| Bodega         | Retiros diarios                            |
| Vento Café     | Ventas, mesas y tiempos                    |
| Saudo          | Capacidad real de hornos y picos           |
| Molka          | Pedidos y tiempo de bebidas                |
| Rappi/ManyChat | Pedidos por canal                          |
| Caja           | Cierres de Saudo y Molka                   |
| Contabilidad   | Tiempo de carga y conciliación             |
| Turnos         | Ciclo de publicación y cambios             |
| Propinas       | Periodicidad                               |
| Nómina         | Frecuencia y responsables                  |
| Marketing      | Volumen de piezas                          |
| Vaila Vainilla | Lotes y frecuencia de mensajería           |
| Soporte        | Incidentes y horas                         |
| Mantenimiento  | Fallas y tiempos                           |
| Mermas         | Frecuencia y costo                         |
| Canastas       | Cantidades y ciclo                         |

---

#### 34. Matriz de destino de hallazgos

| Hallazgo                                    | Tarea exacta                      |
| ------------------------------------------- | --------------------------------- |
| Dependencias que explican tiempos y picos   | `OPS-AUD-011`                     |
| Conciliaciones que consumen tiempo          | `OPS-AUD-012`                     |
| Falta de datos y pérdida de medición        | `OPS-AUD-013`                     |
| Tiempos ante caídas y contingencias         | `OPS-AUD-014`                     |
| Confirmación de cifras y períodos           | `OPS-AUD-015`                     |
| Mapa de capacidades críticas                | `CAP-MAP-001` a `CAP-MAP-015`     |
| Brechas de cobertura                        | `CAP-COVER-001` a `CAP-COVER-012` |
| Consolidación de brechas                    | `GAP-CTRL-001`                    |
| Vinculación a paquetes                      | `GAP-CTRL-006`                    |
| Definición de SLA, estados y métricas TO-BE | BLOQUE E2                         |
| Modelo de eventos y métricas                | BLOQUE E3                         |
| Colas, observabilidad y alertas             | BLOQUE E4                         |
| Pilotos y criterios de aceptación           | BLOQUE E5                         |

---

#### 35. Decisiones propuestas

1. La tarea distingue datos medidos, confirmados, aproximados, cualitativos y no medidos.
2. No se inventan cifras para completar la matriz.
3. Las remisiones tienen comportamiento predominantemente diario.
4. Existe un mínimo estructural conocido de cinco solicitudes diferenciadas por ciclo completo.
5. El conductor inicia aproximadamente a las 05:30.
6. El alistamiento de la tarde comienza cerca de las 17:00 y toma entre 1,5 y 2 horas.
7. Vento Café realiza dos cierres de Caja diarios.
8. Producción de Barra ocurre semanalmente los martes.
9. Galletería produce aproximadamente 104 unidades por una o dos recetas y suele cubrir cerca de una semana.
10. Panadería depende de ciclos de varios días.
11. Las compras principales tienen comportamiento semanal, con urgencias adicionales.
12. Los retiros de Bodega son frecuentes, pero no están medidos.
13. Ventas y preparación son procesos continuos de alto volumen relativo.
14. Los pagos, efectivo, nómina, accesos y riesgos sanitarios tienen criticidad severa.
15. Las bajas de acceso requieren respuesta inmediata.
16. Soporte y mantenimiento son reactivos.
17. No existe medición consolidada de estacionalidad.
18. No se establecerán SLA, dotación, capacidad o stock objetivo en esta tarea.
19. La instrumentación futura deberá medir inicio, espera, ejecución, cierre, resultado y excepción.
20. Ninguna decisión autoriza código, tablas, métricas físicas, alertas, integraciones, migraciones o cambios en Supabase.

---

#### 36. Criterios de aceptación

`OPS-AUD-010` podrá aprobarse cuando se confirme que:

- existe una escala explícita de evidencia;
- se documentan frecuencia, volumen, criticidad y sensibilidad temporal;
- los tiempos conocidos se presentan como confirmados o aproximados;
- no se inventan cifras;
- se identifican ventanas y picos;
- se clasifican procesos críticos;
- se registran vacíos de medición;
- se describe el estado de estacionalidad;
- se define qué deberá medirse posteriormente;
- cada incertidumbre queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino exacto;
- no se han definido SLA ni capacidad objetivo;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 37. Resultado y continuidad

Con la aprobación de `OPS-AUD-010` quedará establecida la línea base inicial de:

- frecuencias;
- volúmenes cualitativos;
- tiempos confirmados;
- ventanas críticas;
- sensibilidad temporal;
- criticidad;
- cuellos de botella;
- picos;
- estacionalidad conocida;
- métricas ausentes;
- necesidades de instrumentación.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-011
— Identificar dependencias entre áreas, sedes, aplicaciones y terceros
```

`OPS-AUD-011` deberá utilizar esta línea base para explicar qué procesos dependen de otros actores, capacidades, herramientas, horarios, instalaciones o terceros, y cómo una falla se propaga por la operación.



### ✅ OPS-AUD-011 — Identificar dependencias entre áreas, sedes, aplicaciones y terceros

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Mapa AS-IS de dependencias operativas, tecnológicas, físicas y externas  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-010`  
**Validación pendiente:** `OPS-AUD-015` para dependencias, responsables, frecuencias o terceros no suficientemente confirmados

---

#### 1. Propósito

Identificar de qué depende cada proceso actual para poder iniciar, continuar y cerrar correctamente.

La tarea deberá documentar dependencias entre:

- empresas y marcas;
- sedes;
- áreas;
- trabajadores;
- responsables;
- aplicaciones;
- dispositivos;
- documentos;
- inventario;
- producción;
- transporte;
- proveedores;
- mensajerías;
- bancos;
- abogados;
- técnicos;
- servicios públicos;
- infraestructura física.

El objetivo es entender cómo una falla en un punto se propaga al resto de la operación.

```text
DEPENDENCIA NO DISPONIBLE
→ PROCESO AFECTADO
→ ÁREAS AFECTADAS
→ SEDES AFECTADAS
→ EFECTO OPERATIVO
→ EFECTO FINANCIERO O DE SERVICIO
```

Esta tarea describe el estado actual.

No define todavía:

- arquitectura TO-BE;
- integraciones;
- contratos entre aplicaciones;
- redundancia;
- SLA;
- colas;
- reintentos;
- contingencias;
- priorización técnica;
- implementación.

---

#### 2. Definición canónica de dependencia

Una dependencia existe cuando un proceso necesita que otro elemento esté disponible, correcto o terminado.

##### 2.1. Dependencia de información

El proceso necesita:

- solicitud;
- cantidad;
- horario;
- estado;
- precio;
- factura;
- dirección;
- permiso;
- aprobación.

##### 2.2. Dependencia operativa

El proceso necesita que otra persona o área ejecute una actividad previa.

##### 2.3. Dependencia física

El proceso necesita:

- insumo;
- producto;
- espacio;
- equipo;
- vehículo;
- canasta;
- horno;
- frío;
- energía;
- conectividad.

##### 2.4. Dependencia tecnológica

El proceso necesita:

- aplicación;
- sesión;
- cuenta;
- dispositivo;
- impresora;
- red;
- base de datos;
- servicio externo.

##### 2.5. Dependencia externa

El proceso depende de un tercero fuera del control directo de Vento Group.

##### 2.6. Dependencia temporal

El proceso debe ocurrir antes, después o dentro de una ventana específica.

##### 2.7. Dependencia de decisión

El proceso no puede continuar sin criterio, aprobación o priorización de una persona.

---

#### 3. Clasificación de dependencias

| Código | Tipo           | Definición                                                  |
| ------ | -------------- | ----------------------------------------------------------- |
| `INF`  | Información    | Dato, documento, solicitud o estado previo                  |
| `PER`  | Persona        | Conocimiento, presencia o decisión individual               |
| `ARE`  | Área           | Capacidad previa de otra área                               |
| `SED`  | Sede           | Disponibilidad o respuesta de otra sede                     |
| `APP`  | Aplicación     | Sistema interno o externo                                   |
| `DEV`  | Dispositivo    | Tablet, computador, celular, datáfono o impresora           |
| `NET`  | Red            | Internet, Wi-Fi, LAN o conectividad                         |
| `DAT`  | Datos          | Catálogo, inventario, usuario, producto o configuración     |
| `INV`  | Inventario     | Existencia física o digital                                 |
| `EQP`  | Equipo         | Horno, cámara fría, congelador u otro activo                |
| `LOG`  | Logística      | Vehículo, conductor, ruta, canasta o mensajería             |
| `DOC`  | Documento      | Factura, remisión, cierre, guía o contrato                  |
| `TER`  | Tercero        | Proveedor, banco, técnico, abogado, plataforma o mensajería |
| `ENE`  | Energía        | Servicio eléctrico                                          |
| `TMP`  | Tiempo         | Ventana, secuencia o anticipación                           |
| `DEC`  | Decisión       | Aprobación, prioridad o criterio                            |
| `LEG`  | Legal/contable | Requisito fiscal, laboral o contractual                     |

---

#### 4. Estado de dependencia

| Estado          | Significado                                         |
| --------------- | --------------------------------------------------- |
| `OBLIGATORIA`   | Sin ella el proceso no puede continuar              |
| `CRÍTICA`       | Su ausencia detiene o compromete gravemente         |
| `ALTA`          | Su ausencia genera retraso o reproceso importante   |
| `MEDIA`         | Existe alternativa manual o parcial                 |
| `BAJA`          | Afecta eficiencia, pero no bloquea                  |
| `INFORMAL`      | Existe por costumbre o comunicación no estructurada |
| `PERSONA_CLAVE` | Depende especialmente de una persona                |
| `TERCERO_CLAVE` | Depende de un actor externo                         |
| `NO_CONFIRMADA` | Requiere validación en `OPS-AUD-015`                |

---

#### 5. Inventario maestro de dependencias

| Código    | Proceso                  | Depende de                                         | Tipo                       | Estado          |
| --------- | ------------------------ | -------------------------------------------------- | -------------------------- | --------------- |
| `DEP-001` | Solicitud de remisión    | Responsable del área prepare y envíe Excel         | `PER`, `INF`, `APP`        | `OBLIGATORIA`   |
| `DEP-002` | Consolidación productiva | Solicitudes lleguen completas y legibles           | `INF`, `TMP`               | `CRÍTICA`       |
| `DEP-003` | Producción               | Disponibilidad de insumos                          | `INV`, `TER`               | `CRÍTICA`       |
| `DEP-004` | Panadería                | Fermentación, reposo y hornos                      | `TMP`, `EQP`               | `CRÍTICA`       |
| `DEP-005` | Repostería               | Angélica distribuya trabajo                        | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-006` | Tortas                   | Disponibilidad de Valentina                        | `PER`                      | `PERSONA_CLAVE` |
| `DEP-007` | Galletería               | Responsable y autorización de Angélica             | `PER`, `DEC`               | `ALTA`          |
| `DEP-008` | Cocina Caliente          | Plan semanal y cocinera responsable                | `INF`, `PER`               | `PERSONA_CLAVE` |
| `DEP-009` | Producción de Barra      | Rotación de trabajador entre sedes                 | `PER`, `ARE`, `SED`        | `ALTA`          |
| `DEP-010` | Despacho                 | Conductor disponible                               | `PER`, `LOG`               | `CRÍTICA`       |
| `DEP-011` | Despacho                 | Vehículo disponible                                | `LOG`, `EQP`               | `CRÍTICA`       |
| `DEP-012` | Despacho                 | Canastas disponibles                               | `LOG`, `EQP`               | `ALTA`          |
| `DEP-013` | Recepción en sede        | Responsable disponible                             | `PER`, `ARE`               | `ALTA`          |
| `DEP-014` | Recepción proveedor      | Receptor competente                                | `PER`                      | `ALTA`          |
| `DEP-015` | Recepción proveedor      | Factura o soporte                                  | `DOC`, `TER`               | `ALTA`          |
| `DEP-016` | Compra                   | Áreas informen faltantes                           | `ARE`, `INF`               | `CRÍTICA`       |
| `DEP-017` | Compra                   | Gerente general consolide y decida                 | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-018` | Compra                   | Proveedor confirme                                 | `TER`, `INF`               | `TERCERO_CLAVE` |
| `DEP-019` | Bodega                   | Inventario físico y ubicación                      | `INV`, `DAT`               | `CRÍTICA`       |
| `DEP-020` | Inventario digital       | Todos los movimientos sean registrados             | `ARE`, `APP`, `DAT`        | `CRÍTICA`       |
| `DEP-021` | Venta                    | Makos disponible                                   | `APP`, `DEV`, `NET`        | `CRÍTICA`       |
| `DEP-022` | Comandas Vento Café      | Impresoras y red local                             | `DEV`, `NET`               | `CRÍTICA`       |
| `DEP-023` | Servicio de mesa         | Tablet o dispositivo disponible                    | `DEV`, `APP`               | `ALTA`          |
| `DEP-024` | Pago tarjeta             | Datáfono y conectividad bancaria                   | `DEV`, `NET`, `TER`        | `CRÍTICA`       |
| `DEP-025` | Rappi                    | Plataforma externa operativa                       | `APP`, `TER`, `NET`        | `TERCERO_CLAVE` |
| `DEP-026` | Domicilio directo        | ManyChat y mensajero                               | `APP`, `TER`, `NET`        | `ALTA`          |
| `DEP-027` | Cierre de Caja           | Makos y conteo físico                              | `APP`, `DOC`, `PER`        | `CRÍTICA`       |
| `DEP-028` | Entrega de efectivo      | Cierre impreso y Gerencia                          | `DOC`, `PER`               | `CRÍTICA`       |
| `DEP-029` | Contabilidad             | Soportes lleguen completos                         | `DOC`, `ARE`, `PER`        | `CRÍTICA`       |
| `DEP-030` | Programación laboral     | Gerente general y gerente Vento Café               | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-031` | Consulta de turno        | VISO publique y ANIMA funcione                     | `APP`, `DAT`, `NET`        | `CRÍTICA`       |
| `DEP-032` | Check-in                 | Cuenta activa, turno y dispositivo                 | `APP`, `DAT`, `DEV`, `NET` | `CRÍTICA`       |
| `DEP-033` | Propinas                 | Reportes de asistencia correctos                   | `APP`, `DAT`, `INF`        | `ALTA`          |
| `DEP-034` | Nómina                   | Información laboral, Contabilidad y banco          | `DAT`, `ARE`, `TER`, `LEG` | `CRÍTICA`       |
| `DEP-035` | Contratación             | Gerencia, responsable de área, Nathalia y abogados | `PER`, `ARE`, `TER`, `LEG` | `ALTA`          |
| `DEP-036` | Alta de acceso           | Gerencia solicite y Operaciones ejecute            | `PER`, `INF`, `APP`        | `CRÍTICA`       |
| `DEP-037` | Baja de acceso           | Notificación de retiro                             | `INF`, `ARE`, `PER`        | `CRÍTICA`       |
| `DEP-038` | Marketing                | Solicitud y criterio de Nathalia o Jeo             | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-039` | Vaila Vainilla           | Shopify                                            | `APP`, `TER`, `NET`        | `CRÍTICA`       |
| `DEP-040` | Vaila Vainilla           | Jeo y trabajadora de ventas                        | `PER`                      | `PERSONA_CLAVE` |
| `DEP-041` | Vaila Vainilla           | Mensajería externa                                 | `TER`, `LOG`               | `TERCERO_CLAVE` |
| `DEP-042` | Soporte técnico          | Jefe de Operaciones disponible                     | `PER`                      | `PERSONA_CLAVE` |
| `DEP-043` | Mantenimiento            | Gerencia contacte técnico                          | `PER`, `TER`               | `TERCERO_CLAVE` |
| `DEP-044` | Mantenimiento            | Repuesto disponible                                | `TER`, `EQP`               | `CRÍTICA`       |
| `DEP-045` | Servicios Generales      | Instrucciones y criterio de priorización           | `PER`, `DEC`               | `INFORMAL`      |
| `DEP-046` | Frío                     | Energía y equipos                                  | `ENE`, `EQP`               | `CRÍTICA`       |
| `DEP-047` | Aplicaciones             | Internet y red local                               | `NET`                      | `CRÍTICA`       |
| `DEP-048` | Impresión                | Energía, red, impresora y consumibles              | `ENE`, `NET`, `DEV`, `INV` | `CRÍTICA`       |
| `DEP-049` | Operación administrativa | Computadores y cuentas                             | `DEV`, `APP`, `DAT`        | `ALTA`          |
| `DEP-050` | Trazabilidad             | Identidad individual y registros completos         | `DAT`, `APP`, `PER`        | `CRÍTICA`       |

---

#### 6. Dependencias entre sedes

##### 6.1. Vento Café → Centro de Producción

Vento Café depende del Centro de Producción para:

- Panadería;
- Repostería;
- Tortas;
- Galletería;
- preparaciones de Cocina Caliente;
- producción central de Barra;
- abastecimiento de Bodega;
- remisiones;
- transporte.

```text
VENTO CAFÉ SOLICITA
→ CENTRO PRODUCE O ALISTA
→ CONDUCTOR TRANSPORTA
→ VENTO CAFÉ RECIBE
```

Una falla del Centro puede afectar:

- vitrina;
- Cocina;
- Barra;
- Servicio;
- ventas.

##### 6.2. Saudo → Centro de Producción

Saudo depende del Centro para:

- productos terminados;
- ingredientes;
- postres;
- productos de vitrina;
- preparaciones de Barra;
- abastecimiento interno.

También depende de Vento Café para parte del fruver, según la operación actual presumida.

Esta ruta debe validarse en `OPS-AUD-015`.

##### 6.3. Molka → Centro de Producción

Molka no tiene cocina productiva propia.

Depende fuertemente de:

- productos terminados;
- inventario central;
- remisiones;
- conductor;
- productos reasignados desde otras sedes.

La falla de abastecimiento tiene impacto directo en su capacidad de venta.

##### 6.4. Centro de Producción → sedes

El Centro depende de las sedes para:

- solicitudes oportunas;
- cantidades correctas;
- devolución de canastas;
- retroalimentación de faltantes;
- información de consumo;
- información de sobrantes.

##### 6.5. Oficinas administrativas → todas las sedes

Gerencia, Contabilidad, Marketing y Operaciones soportan transversalmente:

- compras;
- dinero;
- personal;
- accesos;
- horarios;
- sistemas;
- proveedores;
- técnicos;
- decisiones.

Las sedes dependen de decisiones centralizadas.

---

#### 7. Dependencias entre áreas del Centro de Producción

##### 7.1. Bodega → producción

Todas las áreas productivas dependen de Bodega para:

- insumos;
- empaques;
- utensilios;
- disponibilidad;
- recepción de proveedores.

##### 7.2. Producción → conductor

El conductor depende de que cada área:

- termine;
- empaque;
- separe;
- almacene en el lugar correcto;
- informe productos extra o faltantes.

##### 7.3. Conductor → Bodega y Cocina Caliente

El conductor completa las remisiones usando:

- Bodega;
- Cocina Caliente;
- producto terminado de áreas.

##### 7.4. Servicios Generales → producción y logística

La operación depende de limpieza de:

- zonas;
- utensilios;
- canastas;
- superficies;
- espacios de circulación.

##### 7.5. Frío → producción y logística

Cámara fría y congelación sostienen:

- producto terminado;
- preparaciones;
- insumos;
- conservación hasta despacho.

---

#### 8. Dependencias de personas clave

##### 8.1. Gerente general

Dependencias actuales:

- compras;
- proveedores;
- efectivo;
- Contabilidad;
- turnos;
- propinas;
- contratación;
- mantenimiento;
- decisiones transversales;
- coordinación entre sedes.

Riesgo:

```text
ALTA CENTRALIZACIÓN
→ COLA DE DECISIONES
→ DEMORA
→ DEPENDENCIA DE DISPONIBILIDAD PERSONAL
```

##### 8.2. Nathalia

Participa en:

- prioridades;
- contratación;
- Marketing;
- decisiones operativas;
- instrucciones a Servicios Generales;
- revisión de asuntos empresariales.

##### 8.3. Jeo

Dependencias:

- Vaila Vainilla;
- Marketing;
- pedidos;
- decisiones comerciales;
- aprobaciones de contenido.

##### 8.4. Jefe de Operaciones

Dependencias:

- soporte tecnológico;
- desarrollo;
- accesos;
- recepción de proveedores;
- Bodega;
- implementación;
- equipos;
- redes;
- aplicaciones.

La atención de incidentes desplaza desarrollo.

##### 8.5. Conductor

Dependencias:

- apertura del Centro;
- remisiones;
- alistamiento;
- transporte;
- distribución;
- retorno de canastas;
- cierre físico.

##### 8.6. Angélica

Dependencias:

- coordinación de Repostería;
- Tortas;
- Galletería;
- distribución de trabajo;
- decisiones productivas.

##### 8.7. Valentina

Dependencia crítica en ejecución habitual de Tortas.

##### 8.8. Gerente de Vento Café

Dependencias:

- programación;
- operación de sede;
- inducción;
- control de personal;
- coordinación con Gerencia General.

---

#### 9. Dependencias de aplicaciones

##### 9.1. Makos

Procesos dependientes:

- mesas;
- pedidos;
- Caja;
- cierres;
- facturas;
- comandas;
- Rappi transcrito;
- domicilios transcritos.

Una caída puede afectar simultáneamente:

- Servicio;
- Cocina;
- Barra;
- Caja;
- facturación;
- reportes.

##### 9.2. VISO

Procesos dependientes:

- creación y publicación de turnos;
- revisión administrativa;
- reportes de asistencia.

##### 9.3. ANIMA

Procesos dependientes:

- consulta de turnos;
- notificaciones;
- check-in;
- identidad laboral del trabajador.

##### 9.4. WhatsApp

Procesos dependientes:

- remisiones;
- compras;
- proveedores;
- Marketing;
- soporte;
- mantenimiento;
- accesos;
- coordinación general.

WhatsApp funciona como infraestructura operacional informal.

##### 9.5. Excel

Procesos dependientes:

- solicitudes de remisión;
- consolidaciones;
- controles administrativos;
- algunos reportes.

##### 9.6. Shopify

Vaila Vainilla depende de Shopify para recibir y consultar pedidos principales.

##### 9.7. Rappi

Vento Café y Saudo dependen de Rappi para el canal de plataforma.

##### 9.8. ManyChat

Vento Café depende de ManyChat para pedidos directos y domicilios.

##### 9.9. Sistema contable

Gerencia y Contabilidad dependen de:

- registro financiero;
- soportes;
- información tributaria;
- conciliación.

##### 9.10. Bancolombia Nóminas

La nómina formal depende del portal bancario.

##### 9.11. Vento OS experimental

Los procesos en prueba dependen de:

- integridad de datos;
- registro completo;
- cuentas;
- dispositivos;
- Supabase;
- conectividad.

Actualmente no puede ser fuente autoritativa donde los movimientos estén incompletos.

---

#### 10. Dependencias entre aplicaciones

| Origen     | Destino           | Mecanismo actual         | Riesgo                          |
| ---------- | ----------------- | ------------------------ | ------------------------------- |
| Excel      | WhatsApp          | Captura o fotografía     | Pérdida de estructura y versión |
| WhatsApp   | Producción        | Interpretación humana    | Omisión o lectura tardía        |
| Rappi      | Makos             | Transcripción manual     | Error y duplicación             |
| ManyChat   | Makos             | Transcripción manual     | Error y pérdida de datos        |
| Makos      | Contabilidad      | Reporte y soporte manual | Conciliación tardía             |
| VISO       | ANIMA             | Integración parcial      | Dependencia de datos laborales  |
| ANIMA      | VISO              | Check-in y reporte       | Correcciones no confirmadas     |
| Asistencia | Propinas          | Cálculo manual           | Reglas no trazables             |
| Shopify    | Mensajería        | Coordinación humana      | Seguimiento incompleto          |
| Gerencia   | Accesos           | Solicitud informal       | Datos incompletos               |
| Vento OS   | Inventario físico | Registro parcial         | Stock inválido                  |

---

#### 11. Dependencias de dispositivos

##### 11.1. Tablets de Servicio

Afectan:

- pedidos;
- mesas;
- consulta;
- cuentas compartidas.

##### 11.2. Computador de Caja

Afecta:

- Makos;
- Rappi;
- ManyChat;
- facturación;
- cierres.

##### 11.3. Impresoras térmicas

Afectan:

- comandas;
- resúmenes;
- facturas;
- operación por estación.

##### 11.4. Datáfono

Afecta pagos con tarjeta.

##### 11.5. Celulares

Afectan:

- WhatsApp;
- pedidos;
- fotografías;
- soporte;
- coordinación;
- notas informales.

##### 11.6. Computadores administrativos

Afectan:

- Contabilidad;
- Gerencia;
- Marketing;
- desarrollo;
- reportes;
- banca.

##### 11.7. Dispositivos compartidos

La dependencia de un dispositivo compartido crea además dependencia de:

- sesión;
- cuenta;
- contexto;
- identidad efectiva;
- disponibilidad física.

---

#### 12. Dependencias de red y energía

##### 12.1. Internet

Dependencias:

- WhatsApp;
- Rappi;
- ManyChat;
- Shopify;
- VISO;
- ANIMA;
- Vento OS;
- sistema contable en línea;
- banca;
- soporte remoto.

##### 12.2. Red local

Dependencias:

- impresoras LAN;
- computadores;
- tablets;
- servicios locales;
- dispositivos POS.

##### 12.3. Energía

Dependencias críticas:

- hornos;
- refrigeración;
- congelación;
- computadores;
- impresoras;
- red;
- cámaras;
- iluminación;
- datáfonos;
- equipos de producción.

##### 12.4. Frío

La cámara fría y congelación dependen de energía continua.

Una falla puede afectar:

- seguridad alimentaria;
- mermas;
- producción;
- inventario;
- venta;
- responsabilidad.

---

#### 13. Dependencias de equipos y capacidad física

##### 13.1. Hornos de Saudo

La capacidad depende de dos hornos napolitanos.

Cuando se acumulan pizzas:

```text
DEMANDA
> CAPACIDAD DE HORNO
→ COLA
→ RETRASO
→ AFECTACIÓN AL CLIENTE
```

##### 13.2. Hornos y fermentación de Panadería

Dependencias:

- tiempo técnico;
- capacidad;
- secuencia;
- disponibilidad;
- programación anticipada.

##### 13.3. Equipos de frío

Dependencias:

- conservación;
- almacenamiento;
- despacho;
- vida útil.

##### 13.4. Empaque al vacío

Cocina Caliente depende de la capacidad de porcionar y empacar.

##### 13.5. Vehículo

Todas las sedes satélite dependen del vehículo para abastecimiento interno.

##### 13.6. Canastas

La distribución depende de suficientes canastas limpias y disponibles.

---

#### 14. Dependencias de proveedores

##### 14.1. Insumos de producción

La producción depende de:

- disponibilidad;
- calidad;
- presentación;
- precio;
- fecha de entrega.

##### 14.2. Fruver

Vento Café depende de entrega directa.

Saudo puede depender indirectamente de redistribución desde Vento Café.

##### 14.3. Proveedores especializados

Ciertos insumos o repuestos pueden tener pocos proveedores.

##### 14.4. Proveedor como fuente de información

El proveedor confirma:

- cantidad;
- precio;
- fecha.

La información queda en WhatsApp y puede convertirse en fuente informal de verdad.

---

#### 15. Dependencias de terceros no proveedores

##### 15.1. Mensajería de domicilios

Dependencias:

- disponibilidad;
- tiempo de recogida;
- dirección;
- pago;
- entrega.

##### 15.2. Mensajería de Vaila Vainilla

Dependencias:

- frecuencia de recolección;
- capacidad;
- guía;
- entrega final;
- devoluciones.

##### 15.3. Abogados externos

La contratación formal depende de abogados.

##### 15.4. Técnicos

El mantenimiento depende de:

- disponibilidad;
- diagnóstico;
- repuesto;
- visita.

##### 15.5. Bancos

Dependencias:

- datáfonos;
- transferencias;
- nómina;
- portales;
- conectividad.

##### 15.6. Plataformas externas

Dependencias:

- Rappi;
- Shopify;
- ManyChat;
- redes sociales;
- servicios de mensajería.

---

#### 16. Dependencias documentales

##### 16.1. Factura de proveedor

Necesaria para:

- recepción;
- soporte;
- Contabilidad;
- pago;
- conciliación.

##### 16.2. Cierre de Makos

Necesario para:

- entrega de efectivo;
- comparación;
- custodia;
- registro.

##### 16.3. Hoja de merma

Actualmente es el único soporte conocido de descarte.

##### 16.4. Reporte de asistencia

Necesario para:

- revisión laboral;
- propinas;
- novedades.

##### 16.5. Contrato laboral

Necesario para formalización.

##### 16.6. Guía de envío

Probable dependencia de Vaila Vainilla, pendiente de validación.

---

#### 17. Dependencias de datos maestros

La operación tecnológica futura depende de catálogos confiables.

Dependencias actuales o necesarias:

- empresas;
- marcas;
- sedes;
- áreas;
- personas;
- roles;
- productos;
- presentaciones;
- unidades;
- ubicaciones;
- proveedores;
- clientes;
- medios de pago;
- equipos;
- canastas;
- permisos.

Cuando estos datos faltan o están duplicados:

- los flujos no pueden relacionarse;
- los reportes pierden precisión;
- las reglas se escriben manualmente;
- la integración se vuelve inconsistente.

---

#### 18. Dependencias temporales

##### 18.1. Solicitud antes de producción

La solicitud debe llegar antes de la ventana productiva.

##### 18.2. Producción antes de despacho

El producto debe quedar listo antes de que el conductor cargue.

##### 18.3. Frío antes de transporte

El producto debe estar conservado correctamente.

##### 18.4. Horario antes del turno

El trabajador depende de publicación previa.

##### 18.5. Alta antes del inicio laboral

La cuenta debe existir antes de utilizar ANIMA o Vento OS.

##### 18.6. Baja inmediatamente después del retiro

La revocación depende de notificación inmediata.

##### 18.7. Factura antes del registro contable

Contabilidad depende del soporte.

##### 18.8. Repuesto antes de reparación completa

Mantenimiento puede quedar suspendido.

---

#### 19. Cadenas de dependencia críticas

##### 19.1. Abastecimiento interno

```text
SEDE DETECTA NECESIDAD
→ RESPONSABLE PREPARA EXCEL
→ WHATSAPP ENTREGA CAPTURA
→ PRODUCCIÓN CONSOLIDA
→ BODEGA ENTREGA INSUMOS
→ EQUIPO PRODUCE
→ CONDUCTOR ALISTA
→ VEHÍCULO TRANSPORTA
→ SEDE RECIBE
→ ÁREA ALMACENA
```

Falla en cualquier punto puede producir faltante.

##### 19.2. Compra y recepción

```text
ÁREA REPORTA FALTANTE
→ GERENCIA CONSOLIDA
→ PROVEEDOR CONFIRMA
→ PROVEEDOR ENTREGA
→ RECEPTOR REVISA
→ FACTURA SE FIRMA
→ GERENCIA RECIBE SOPORTE
→ CONTABILIDAD REGISTRA
```

##### 19.3. Venta de mesa

```text
TABLET
→ MAKOS
→ IMPRESORA
→ COCINA/BARRA
→ MESERO
→ DATÁFONO O EFECTIVO
→ CAJA
→ FACTURA
→ CIERRE
```

##### 19.4. Turno y asistencia

```text
GERENCIA PLANIFICA
→ VISO PUBLICA
→ ANIMA NOTIFICA
→ TRABAJADOR CONSULTA
→ TRABAJADOR HACE CHECK-IN
→ VISO REPORTA
→ GERENCIA REVISA
→ PROPINA O NOVEDAD LABORAL
```

##### 19.5. Alta y baja de acceso

```text
CONTRATACIÓN
→ GERENCIA SOLICITA
→ OPERACIONES CREA
→ TRABAJADOR USA
```

```text
RETIRO
→ GERENCIA DEBERÍA INFORMAR
→ OPERACIONES DEBERÍA REVOCAR
```

La segunda cadena no funciona de forma obligatoria.

---

#### 20. Propagación de fallas

##### 20.1. Solicitud no enviada

```text
NO HAY SOLICITUD
→ PRODUCCIÓN NO PLANIFICA
→ CONDUCTOR NO ALISTA
→ SEDE NO RECIBE
→ PRODUCTO SE AGOTA
→ VENTA SE PIERDE
```

##### 20.2. Inventario incorrecto

```text
MOVIMIENTOS INCOMPLETOS
→ STOCK DIGITAL INCORRECTO
→ COMPRA INCORRECTA
→ PRODUCCIÓN SIN INSUMO
→ REMISIÓN PARCIAL
→ SEDE SIN PRODUCTO
```

##### 20.3. Conductor ausente

```text
NO HAY APERTURA O ALISTAMIENTO
→ PRODUCCIÓN NO SE RECOGE
→ REMISIONES NO SALEN
→ SEDES NO RECIBEN
```

##### 20.4. Makos caído

```text
NO HAY REGISTRO NORMAL
→ COMANDAS FALLAN
→ CAJA SE AFECTA
→ FACTURACIÓN SE AFECTA
→ CIERRE SE AFECTA
```

##### 20.5. Internet caído

```text
WHATSAPP/RAPPI/MANYCHAT/VISO/ANIMA/SHOPIFY
→ INDISPONIBLES O DEGRADADOS
→ COMUNICACIÓN Y VENTAS AFECTADAS
```

##### 20.6. Energía o frío caído

```text
EQUIPOS SE DETIENEN
→ PRODUCCIÓN Y CONSERVACIÓN FALLAN
→ MERMA Y RIESGO SANITARIO
```

##### 20.7. Gerente general no disponible

```text
COMPRAS
+ EFECTIVO
+ TURNOS
+ PROPINA
+ MANTENIMIENTO
+ DECISIONES
→ PUEDEN ACUMULARSE
```

##### 20.8. Jefe de Operaciones no disponible

```text
SOPORTE
+ ACCESOS
+ RECEPCIÓN
+ DESARROLLO
+ INFRAESTRUCTURA
→ RESPUESTA DEGRADADA
```

---

#### 21. Puntos únicos de falla humanos

| Código     | Persona o función              | Procesos afectados                               |
| ---------- | ------------------------------ | ------------------------------------------------ |
| `SPOF-001` | Gerente general                | Compras, dinero, turnos, propinas, mantenimiento |
| `SPOF-002` | Jefe de Operaciones            | Soporte, accesos, desarrollo, recepción, Bodega  |
| `SPOF-003` | Conductor                      | Apertura, alistamiento, transporte, canastas     |
| `SPOF-004` | Angélica                       | Repostería, Tortas, Galletería                   |
| `SPOF-005` | Valentina                      | Ejecución habitual de Tortas                     |
| `SPOF-006` | Jeo                            | Vaila Vainilla y decisiones comerciales          |
| `SPOF-007` | Gerente de Vento Café          | Operación, personal, programación e inducción    |
| `SPOF-008` | Responsable de Cocina Caliente | Plan y reposición de preparaciones               |
| `SPOF-009` | Jefe de Panadería              | Planificación y asignación de Panadería          |

El término `SPOF` describe el riesgo AS-IS; no implica que cada persona sea absolutamente irreemplazable.

---

#### 22. Puntos únicos de falla tecnológicos y físicos

| Código     | Dependencia                 | Impacto                               |
| ---------- | --------------------------- | ------------------------------------- |
| `SPOF-T01` | Makos                       | Venta, Caja, facturación y comandas   |
| `SPOF-T02` | Computador de Caja          | Makos, Rappi y ManyChat               |
| `SPOF-T03` | Impresoras operativas       | Comandas, facturas y resúmenes        |
| `SPOF-T04` | Internet                    | Canales, aplicaciones y comunicación  |
| `SPOF-T05` | Red local                   | Impresión y dispositivos              |
| `SPOF-T06` | Vehículo                    | Abastecimiento interno                |
| `SPOF-T07` | Cámara fría y congelación   | Conservación                          |
| `SPOF-T08` | Hornos Saudo                | Capacidad de pizzas                   |
| `SPOF-T09` | Shopify                     | Pedidos principales de Vaila Vainilla |
| `SPOF-T10` | Datáfono                    | Pagos con tarjeta                     |
| `SPOF-T11` | WhatsApp                    | Coordinación transversal informal     |
| `SPOF-T12` | Supabase/servicios Vento OS | Aplicaciones internas                 |

---

#### 23. Dependencias circulares

##### 23.1. Inventario y compras

```text
COMPRAS NECESITA INVENTARIO CONFIABLE
↔
INVENTARIO CONFIABLE NECESITA RECEPCIONES Y RETIROS COMPLETOS
```

##### 23.2. Producción y remisiones

```text
PRODUCCIÓN NECESITA SOLICITUDES
↔
SEDES NECESITAN CONOCER DISPONIBILIDAD PARA SOLICITAR
```

##### 23.3. Soporte y desarrollo

```text
APLICACIONES NECESITAN DESARROLLO
↔
DESARROLLO SE INTERRUMPE POR SOPORTE DE LAS APLICACIONES Y EQUIPOS
```

##### 23.4. Datos y adopción

```text
SISTEMA NECESITA DATOS COMPLETOS
↔
TRABAJADORES SOLO CONFÍAN SI EL SISTEMA YA ES CORRECTO
```

Estas dependencias deberán resolverse mediante transición controlada en E5.

---

#### 24. Dependencias ocultas o informales

1. memoria del conductor para identificar productos;
2. reconocimiento visual de canastas;
3. conocimiento de Angélica para distribuir trabajo;
4. conocimiento del jefe de Panadería;
5. experiencia de Gerencia para comprar;
6. comunicación verbal de pago con tarjeta;
7. mensajes de WhatsApp para cambios;
8. criterio del trabajador para declarar merma;
9. aviso informal de retiro laboral;
10. disponibilidad personal del Jefe de Operaciones;
11. prioridad cultural de sedes;
12. conocimiento de quién puede reemplazar a otro;
13. información guardada en teléfonos;
14. relación personal con técnicos y proveedores.

---

#### 25. Dependencias legales, laborales y contables

##### 25.1. Facturación

Depende de:

- Makos;
- configuración fiscal;
- titular jurídico;
- documento correcto;
- medio de pago.

##### 25.2. Contabilidad

Depende de:

- facturas;
- cierres;
- comprobantes;
- clasificación;
- responsables.

##### 25.3. Contratación

Depende de:

- decisión interna;
- documentación;
- abogados externos.

##### 25.4. Nómina

Depende de:

- datos laborales;
- novedades;
- cálculo;
- banco.

##### 25.5. Accesos

Dependen del evento laboral de ingreso, cambio o retiro.

La desconexión entre RR. HH. y tecnología genera riesgo de seguridad.

---

#### 26. Dependencias para la experiencia del cliente

##### 26.1. Disponibilidad

Depende de:

- compras;
- inventario;
- producción;
- remisiones;
- transporte;
- almacenamiento;
- actualización de agotados.

##### 26.2. Tiempo de entrega

Depende de:

- toma de pedido;
- Makos;
- impresora;
- estación;
- capacidad;
- mesero;
- pago.

##### 26.3. Domicilio

Depende de:

- canal;
- transcripción;
- producción;
- empaque;
- mensajero;
- dirección;
- pago.

##### 26.4. Factura

Depende de Caja, Makos e impresora.

---

#### 27. Dependencias para trazabilidad

La trazabilidad completa depende de que todos los procesos compartan identificadores.

Actualmente no existe una relación canónica entre:

- solicitud;
- producción;
- despacho;
- recepción;
- inventario;
- faltante;
- compra;
- proveedor;
- factura;
- pago;
- persona;
- sede;
- área.

Por eso, la trazabilidad depende de reconstrucción manual.

---

#### 28. Dependencias que deberán convertirse en contratos

Esta sección no diseña contratos; identifica candidatos.

##### 28.1. ANIMA ↔ VISO

- trabajadores;
- turnos;
- check-in;
- estados laborales.

##### 28.2. NEXO ↔ FOGO

- solicitudes;
- producción;
- disponibilidad;
- despachos.

##### 28.3. NEXO ↔ ORIGO

- faltantes;
- compras;
- recepciones;
- inventario.

##### 28.4. PULSO ↔ inventario

- ventas;
- agotados;
- consumos;
- devoluciones.

##### 28.5. NUMERA ↔ PULSO/ORIGO/NEXO

- ventas;
- pagos;
- compras;
- inventario;
- costos;
- soportes.

##### 28.6. VISO ↔ todas las aplicaciones

- indicadores;
- alertas;
- decisiones;
- auditoría.

##### 28.7. SHELL ↔ todas las aplicaciones

- identidad;
- sesión;
- contexto;
- permisos;
- navegación.

La definición formal corresponde al BLOQUE X y fases posteriores.

---

#### 29. Dependencias no confirmadas para `OPS-AUD-015`

| Tema                | Duda                                         |
| ------------------- | -------------------------------------------- |
| Fruver              | Ruta exacta hacia Saudo                      |
| Recepción sustituta | Quién puede recibir y firmar                 |
| Compras             | Alcance de Leidy                             |
| Vaila Vainilla      | Guías, mensajería, inventario y devoluciones |
| Correo              | Procesos administrativos críticos            |
| Nómina              | Responsables y doble aprobación              |
| Propinas            | Periodicidad y soportes                      |
| Turnos              | Cambios y reemplazos                         |
| Canastas            | Cantidad, propiedad y pérdidas               |
| Mantenimiento       | Técnicos, facturas y garantías               |
| Marketing           | Correcciones y aprobación                    |
| Proveedores         | Rechazos y devoluciones                      |
| Contabilidad        | Ruta de soportes                             |
| Frío                | Respuesta ante falla                         |
| Conductor           | Sustituto y rutas                            |
| Producción          | Sustitutos de personas clave                 |

---

#### 30. Relación con `OPS-AUD-012`

`OPS-AUD-012` deberá identificar dónde estas dependencias provocan doble digitación o conciliación manual.

Casos principales:

- Excel ↔ captura;
- WhatsApp ↔ producción;
- Rappi ↔ Makos;
- ManyChat ↔ Makos;
- factura ↔ sistema contable;
- cierre ↔ efectivo;
- VISO ↔ cálculo de propinas;
- inventario físico ↔ digital;
- producción reportada ↔ producto cargado;
- despacho ↔ recepción.

---

#### 31. Relación con `OPS-AUD-013`

`OPS-AUD-013` deberá consolidar dónde una dependencia provoca pérdida de:

- actor;
- origen;
- destino;
- estado;
- tiempo;
- versión;
- cantidad;
- responsabilidad;
- evidencia.

---

#### 32. Relación con `OPS-AUD-014`

`OPS-AUD-014` deberá documentar qué ocurre cuando fallan:

- red;
- internet;
- energía;
- dispositivo;
- aplicación;
- impresora;
- vehículo;
- proveedor;
- técnico;
- banco;
- frío;
- persona clave.

---

#### 33. Hallazgos transversales

##### 33.1. La operación está altamente acoplada

Una falla local puede propagarse a varias sedes y aplicaciones.

##### 33.2. WhatsApp conecta procesos, pero no administra dependencias

El canal transmite información, pero no garantiza:

- entrega;
- lectura;
- aceptación;
- ejecución;
- cierre.

##### 33.3. Las personas clave sustituyen al sistema

La memoria y experiencia resuelven vacíos de:

- datos;
- reglas;
- ubicación;
- prioridad;
- aprobación;
- contingencia.

##### 33.4. Las dependencias no están visibles

No existe un tablero que muestre:

- qué está esperando;
- de quién depende;
- desde cuándo;
- qué bloquea;
- qué sedes afecta.

##### 33.5. La falta de inventario confiable se propaga a todo el sistema

Afecta:

- compras;
- producción;
- remisiones;
- venta;
- costos;
- planeación.

##### 33.6. La ausencia de integración crea dependencias humanas

La información debe ser copiada, interpretada y conciliada.

##### 33.7. La centralización genera cuellos de decisión

Gerencia General, Operaciones, conductor y responsables productivos concentran procesos críticos.

---

#### 34. Matriz de riesgo de dependencia

| Riesgo                  | Dependencia          | Consecuencia             |
| ----------------------- | -------------------- | ------------------------ |
| Abastecimiento detenido | Conductor o vehículo | Sedes sin producto       |
| Producción detenida     | Insumos o energía    | Remisiones parciales     |
| Venta detenida          | Makos o Caja         | Pérdida de ingresos      |
| Comandas detenidas      | Impresora o red      | Coordinación verbal      |
| Accesos incorrectos     | Notificación laboral | Riesgo de seguridad      |
| Nómina fallida          | Datos o banco        | Incumplimiento laboral   |
| Contabilidad incompleta | Soportes             | Riesgo financiero        |
| Producto deteriorado    | Frío                 | Merma y riesgo sanitario |
| Desarrollo detenido     | Incidentes           | Retraso del roadmap      |
| Compra incorrecta       | Inventario           | Exceso o faltante        |
| Domicilio fallido       | Mensajería           | Reclamo y devolución     |
| Vaila detenida          | Shopify o Jeo        | Pedidos sin gestionar    |

---

#### 35. Matriz de destino de hallazgos

| Hallazgo                                         | Tarea exacta                      |
| ------------------------------------------------ | --------------------------------- |
| Doble digitación causada por dependencias        | `OPS-AUD-012`                     |
| Pérdida de trazabilidad y responsabilidad        | `OPS-AUD-013`                     |
| Contingencias por caída                          | `OPS-AUD-014`                     |
| Dependencias no confirmadas                      | `OPS-AUD-015`                     |
| Mapa de capacidades                              | `CAP-MAP-001` a `CAP-MAP-015`     |
| Auditoría de código e integraciones              | `CODE-AUD-001` a `CODE-AUD-020`   |
| Alcance por aplicación                           | `CAP-SCOPE-001` a `CAP-SCOPE-019` |
| Cobertura de capacidades                         | `CAP-COVER-001` a `CAP-COVER-012` |
| Consolidación de brechas                         | `GAP-CTRL-001`                    |
| Vinculación a tareas y paquetes                  | `GAP-CTRL-006`                    |
| Contratos entre aplicaciones                     | BLOQUE X                          |
| Arquitectura de datos y eventos                  | BLOQUE E3                         |
| Colas, reintentos, observabilidad y notificación | BLOQUE E4                         |
| Pilotos, transición y contingencia               | BLOQUE E5                         |

---

#### 36. Decisiones propuestas

1. Toda dependencia deberá clasificarse por tipo, criticidad y estado.
2. Las sedes comerciales dependen del Centro de Producción para abastecimiento.
3. El Centro depende de solicitudes oportunas y devolución de canastas.
4. Gerencia General constituye un punto de concentración transversal.
5. El Jefe de Operaciones concentra soporte, accesos, desarrollo e infraestructura.
6. El conductor constituye una dependencia crítica de logística interna.
7. Varias áreas productivas dependen de personas clave.
8. Makos es dependencia crítica para venta, Caja y comandas.
9. WhatsApp es dependencia operacional informal para múltiples procesos.
10. Excel es dependencia actual de remisiones.
11. VISO y ANIMA dependen de datos laborales consistentes.
12. Shopify, Rappi, ManyChat, bancos, mensajerías, abogados y técnicos son dependencias externas.
13. Energía, internet, red, frío, hornos, vehículo, impresoras y datáfonos son dependencias físicas o tecnológicas críticas.
14. La falta de inventario confiable se propaga a compras, producción, remisiones y venta.
15. Las aplicaciones actuales dependen de transcripción manual.
16. La identidad compartida reduce la trazabilidad de las dependencias.
17. Existen cadenas críticas que atraviesan varias sedes y áreas.
18. Existen dependencias circulares entre inventario, compras, producción y adopción.
19. El diseño TO-BE deberá hacer visibles las esperas, bloqueos y responsables.
20. Ninguna dependencia AS-IS se convierte automáticamente en arquitectura definitiva.
21. Ninguna decisión autoriza integraciones, colas, redundancia, código, migraciones o cambios en Supabase.

---

#### 37. Criterios de aceptación

`OPS-AUD-011` podrá aprobarse cuando se confirme que:

- se identifican dependencias entre áreas, sedes, aplicaciones y terceros;
- se distinguen dependencias humanas, físicas, tecnológicas, documentales y externas;
- se documentan cadenas críticas;
- se identifican puntos únicos de falla;
- se identifica propagación de fallas;
- se registran dependencias informales;
- se documentan dependencias circulares;
- se identifican candidatos a contratos futuros sin diseñarlos;
- cada duda queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 38. Resultado y continuidad

Con la aprobación de `OPS-AUD-011` quedará establecida la línea base inicial de:

- dependencias entre sedes;
- dependencias entre áreas;
- aplicaciones críticas;
- dispositivos;
- red;
- energía;
- equipos;
- proveedores;
- mensajerías;
- bancos;
- abogados;
- técnicos;
- personas clave;
- puntos únicos de falla;
- cadenas de propagación;
- dependencias circulares;
- candidatos a contratos entre aplicaciones.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-012
— Identificar puntos de doble digitación y conciliación manual
```

`OPS-AUD-012` deberá utilizar este mapa para documentar dónde una misma información se copia, interpreta, compara o reconcilia entre herramientas, documentos, sedes y responsables.



### ✅ OPS-AUD-012 — Identificar puntos de doble digitación y conciliación manual

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de duplicación de captura, transcripción, comparación y regularización manual  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-011`  
**Validación pendiente:** `OPS-AUD-015` para campos, responsables, frecuencias o mecanismos no suficientemente confirmados

---

#### 1. Propósito

Identificar dónde la misma información:

- se registra más de una vez;
- se copia entre herramientas;
- se transcribe desde una plataforma hacia otra;
- se convierte en captura o fotografía;
- se compara manualmente;
- se suma o consolida fuera del sistema original;
- se corrige en una fuente sin actualizar las demás;
- se regulariza después mediante conteos, facturas o reportes.

La tarea deberá documentar:

- dato original;
- fuente de origen;
- fuente secundaria;
- actor que copia o compara;
- momento de la duplicación;
- motivo operativo;
- riesgo de divergencia;
- forma actual de conciliación;
- efecto cuando no coincide;
- sistema o proceso que debería resolverlo posteriormente.

```text
MISMO HECHO
→ DOS O MÁS REGISTROS
→ POSIBLE DIFERENCIA
→ COMPARACIÓN MANUAL
→ AJUSTE O DECISIÓN HUMANA
```

Esta tarea describe la realidad actual.

No define todavía:

- fuente de verdad objetivo;
- contrato de integración;
- sincronización automática;
- reconciliación contable futura;
- diseño de tablas;
- eventos;
- colas;
- RPC;
- pantallas;
- implementación.

---

#### 2. Definiciones canónicas

##### 2.1. Doble digitación

La misma información se escribe nuevamente en otra herramienta o documento.

Ejemplo:

```text
PEDIDO RAPPI
→ CAJERO TRANSCRIBE A MAKOS
```

##### 2.2. Duplicación documental

La misma operación existe en varios artefactos.

Ejemplo:

```text
SOLICITUD EN EXCEL
+
CAPTURA
+
MENSAJE DE WHATSAPP
+
REMISIÓN FÍSICA
+
REGISTRO EN VENTO OS
```

##### 2.3. Conciliación manual

Una persona compara fuentes para determinar cuál representa mejor la realidad.

Ejemplo:

```text
CIERRE MAKOS
↔ EFECTIVO FÍSICO
```

##### 2.4. Consolidación manual

Varias entradas se suman o combinan fuera de un sistema estructurado.

Ejemplo:

```text
SOLICITUDES DE SEDES
→ TOTAL EN TABLERO O TELÉFONO
```

##### 2.5. Regularización posterior

La diferencia se corrige después de que el hecho físico ya ocurrió.

Ejemplo:

```text
INVENTARIO DIGITAL INCORRECTO
→ CONTEO FÍSICO
→ AJUSTE POSTERIOR
```

##### 2.6. Divergencia

Dos fuentes que deberían representar el mismo hecho contienen valores distintos.

---

#### 3. Clasificación de puntos de duplicación

| Código   | Tipo                   | Definición                                                |
| -------- | ---------------------- | --------------------------------------------------------- |
| `DD-CAP` | Captura duplicada      | El dato se escribe nuevamente                             |
| `DD-IMG` | Conversión a imagen    | El archivo se reemplaza por fotografía o captura          |
| `DD-TRN` | Transcripción          | El dato se copia entre plataformas                        |
| `DD-CNS` | Consolidación          | Varias fuentes se suman manualmente                       |
| `DD-IMP` | Impresión              | Un registro digital se convierte en papel operativo       |
| `DD-REC` | Reconciliación         | Se comparan fuentes para aceptar una                      |
| `DD-AJU` | Ajuste                 | Se corrige una diferencia                                 |
| `DD-REP` | Reporte derivado       | Se exporta o reconstruye información                      |
| `DD-MEM` | Memoria humana         | La información se retiene sin artefacto estructurado      |
| `DD-VER` | Confirmación verbal    | Un dato se transmite sin vínculo digital                  |
| `DD-PAR` | Registro paralelo      | Dos procesos se mantienen simultáneamente                 |
| `DD-CON` | Contabilidad posterior | Un soporte operativo se carga después al sistema contable |

---

#### 4. Estado de evidencia

| Estado               | Significado                                              |
| -------------------- | -------------------------------------------------------- |
| `CONFIRMADO`         | La duplicación o conciliación está descrita directamente |
| `CONFIRMADO_PARCIAL` | Existe, pero faltan campos, frecuencia o responsables    |
| `TRANSITORIO`        | Se usa durante pruebas o coexistencia                    |
| `PROBABLE`           | Es razonable, pero no fue confirmado                     |
| `POR_VALIDAR`        | Debe verificarse en `OPS-AUD-015`                        |
| `AUSENTE`            | No existe conciliación aunque debería existir            |

---

#### 5. Inventario maestro

| Código    | Proceso                  | Fuente 1                   | Fuente 2 o destino              | Tipo                  | Estado               |
| --------- | ------------------------ | -------------------------- | ------------------------------- | --------------------- | -------------------- |
| `DUP-001` | Solicitud de remisión    | Excel                      | Captura o fotografía            | `DD-IMG`              | `CONFIRMADO`         |
| `DUP-002` | Solicitud de remisión    | Captura                    | WhatsApp                        | `DD-PAR`              | `CONFIRMADO`         |
| `DUP-003` | Remisiones en prueba     | Excel/WhatsApp             | Hoja física                     | `DD-PAR`              | `TRANSITORIO`        |
| `DUP-004` | Remisiones en prueba     | Hoja física                | Vento OS                        | `DD-PAR`, `DD-CAP`    | `TRANSITORIO`        |
| `DUP-005` | Consolidación productiva | Solicitudes de sedes       | Tablero/teléfono                | `DD-CNS`              | `CONFIRMADO`         |
| `DUP-006` | Producción               | Consolidado                | Reporte por WhatsApp            | `DD-REP`              | `CONFIRMADO`         |
| `DUP-007` | Despacho                 | Reporte de producción      | Conteo físico del conductor     | `DD-REC`              | `CONFIRMADO`         |
| `DUP-008` | Recepción en sede        | Cantidad solicitada        | Cantidad física recibida        | `DD-REC`              | `CONFIRMADO_PARCIAL` |
| `DUP-009` | Compra                   | Necesidad de áreas         | Lista consolidada de Gerencia   | `DD-CNS`              | `CONFIRMADO_PARCIAL` |
| `DUP-010` | Compra                   | Pedido WhatsApp            | Confirmación del proveedor      | `DD-REC`              | `CONFIRMADO`         |
| `DUP-011` | Recepción proveedor      | Pedido acordado            | Factura del proveedor           | `DD-REC`              | `CONFIRMADO_PARCIAL` |
| `DUP-012` | Recepción proveedor      | Factura                    | Mercancía física                | `DD-REC`              | `CONFIRMADO`         |
| `DUP-013` | Contabilidad             | Factura física             | Sistema contable                | `DD-CON`, `DD-CAP`    | `CONFIRMADO`         |
| `DUP-014` | Venta Rappi              | Pedido Rappi               | Pedido Makos                    | `DD-TRN`              | `CONFIRMADO`         |
| `DUP-015` | Domicilio directo        | ManyChat                   | Pedido Makos                    | `DD-TRN`              | `CONFIRMADO`         |
| `DUP-016` | Venta                    | Pedido Makos               | Comandas impresas               | `DD-IMP`              | `CONFIRMADO`         |
| `DUP-017` | Pago tarjeta             | Datáfono                   | Makos                           | `DD-TRN`, `DD-VER`    | `CONFIRMADO`         |
| `DUP-018` | Cierre de Caja           | Makos                      | Cierre impreso                  | `DD-IMP`              | `CONFIRMADO`         |
| `DUP-019` | Cierre de Caja           | Cierre Makos               | Efectivo físico                 | `DD-REC`              | `CONFIRMADO`         |
| `DUP-020` | Efectivo                 | Entrega a Gerencia         | Registro como gasto o retiro    | `DD-CAP`, `DD-AJU`    | `CONFIRMADO`         |
| `DUP-021` | Propinas                 | Reporte de asistencia      | Cálculo manual                  | `DD-CNS`, `DD-CAP`    | `CONFIRMADO`         |
| `DUP-022` | Nómina                   | Información preparada      | Bancolombia Nóminas             | `DD-CAP`              | `CONFIRMADO_PARCIAL` |
| `DUP-023` | Asistencia               | Check-in ANIMA             | Reporte VISO                    | `DD-REP`              | `CONFIRMADO`         |
| `DUP-024` | Accesos                  | Solicitud informal         | Creación manual en aplicaciones | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-025` | Marketing                | Solicitud WhatsApp/verbal  | Pieza final                     | `DD-MEM`, `DD-CAP`    | `CONFIRMADO_PARCIAL` |
| `DUP-026` | Vaila Vainilla           | Pedido Shopify             | Preparación y despacho manual   | `DD-CAP`, `DD-MEM`    | `CONFIRMADO_PARCIAL` |
| `DUP-027` | Inventario piloto        | Conteo inicial             | Stock digital                   | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-028` | Inventario piloto        | Retiros físicos            | Registro kiosco                 | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-029` | Inventario               | Stock digital              | Conteo físico                   | `DD-REC`, `DD-AJU`    | `CONFIRMADO`         |
| `DUP-030` | Merma                    | Producto físico descartado | Hoja manual                     | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-031` | Transferencia a Molka    | Movimiento físico          | Comunicación verbal             | `DD-VER`              | `CONFIRMADO`         |
| `DUP-032` | Soporte técnico          | Incidente WhatsApp/verbal  | Memoria del responsable         | `DD-MEM`              | `CONFIRMADO`         |
| `DUP-033` | Mantenimiento            | Reporte informal           | Factura o comprobante           | `DD-CON`              | `PROBABLE`           |
| `DUP-034` | Canastas                 | Ubicación física           | Reconocimiento visual           | `DD-MEM`              | `CONFIRMADO`         |
| `DUP-035` | Disponibilidad de venta  | Inventario físico/vitrina  | Catálogo Makos                  | `DD-REC` ausente      | `CONFIRMADO`         |
| `DUP-036` | Productos agotados       | Estado físico              | Eliminación manual en Makos     | `DD-AJU`              | `CONFIRMADO`         |
| `DUP-037` | Venta sustituida         | Producto eliminado         | Nuevo pedido adicional          | `DD-PAR`              | `CONFIRMADO`         |
| `DUP-038` | Recepción interna        | Despachado                 | Recibido                        | `DD-REC` insuficiente | `CONFIRMADO_PARCIAL` |
| `DUP-039` | Producción               | Solicitado                 | Producido                       | `DD-REC` informal     | `CONFIRMADO_PARCIAL` |
| `DUP-040` | Logística                | Producido                  | Cargado                         | `DD-REC` manual       | `CONFIRMADO`         |
| `DUP-041` | Pagos y gastos           | Efectivo entregado         | Factura posterior               | `DD-REC`              | `CONFIRMADO`         |
| `DUP-042` | Reclutamiento            | Hoja de vida               | Datos enviados a abogados       | `DD-CAP`              | `CONFIRMADO_PARCIAL` |
| `DUP-043` | Turnos                   | Programación de Gerencia   | Publicación VISO                | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-044` | Incidencias de acceso    | Estado laboral             | Estado de cuenta                | `DD-REC` ausente      | `CONFIRMADO`         |

---

#### 6. Remisiones internas

##### 6.1. Excel → captura → WhatsApp

El dato original se registra en Excel.

Después:

```text
EXCEL
→ CAPTURA
→ WHATSAPP
→ INTERPRETACIÓN HUMANA
```

En esta transformación pueden perderse:

- fórmulas;
- validaciones;
- filas ocultas;
- versión;
- autor;
- fecha de modificación;
- identificadores;
- capacidad de búsqueda.

La captura se convierte en la referencia operativa aunque el archivo original cambie.

##### 6.2. Registro paralelo durante pruebas

En la transición coexistieron:

- solicitud en Excel;
- captura;
- hoja física;
- Vento OS.

Cada soporte podía representar un estado distinto.

```text
CUATRO FUENTES
→ SIN IDENTIFICADOR COMÚN
→ CONCILIACIÓN POR PERSONAS
```

Este esquema se clasifica como transitorio, no como diseño permanente.

##### 6.3. Solicitado → producido → despachado → recibido

Actualmente estas cantidades pueden existir en fuentes distintas:

| Etapa       | Fuente actual          |
| ----------- | ---------------------- |
| Solicitado  | Excel/captura          |
| Consolidado | tablero/teléfono       |
| Producido   | mensaje o conteo       |
| Cargado     | conteo del conductor   |
| Recibido    | conteo en sede         |
| Diferencia  | conversación posterior |

No existe una conciliación estructurada que conecte las cinco etapas.

---

#### 7. Consolidación de producción

##### 7.1. Suma manual por área

El responsable productivo toma varias solicitudes y calcula un total.

```text
VENTO CAFÉ
+
SAUDO
+
MOLKA
→ TOTAL MANUAL
```

Riesgos:

- doble conteo;
- omisión;
- suma incorrecta;
- uso de una versión anterior;
- pérdida del desglose por sede.

##### 7.2. Reporte final frente a producto físico

El área puede publicar un total producido.

El conductor cuenta físicamente y organiza.

El reporte no es necesariamente la fuente del despacho.

```text
PRODUCCIÓN REPORTADA
↔ PRODUCCIÓN ENCONTRADA
↔ PRODUCCIÓN CARGADA
```

No existe conciliación formal confirmada.

##### 7.3. Distribución de faltantes y sobrantes

Cuando no alcanza:

- se distribuye lo disponible;
- se prioriza por sede;
- se explica después si preguntan.

Cuando sobra:

- se conserva;
- se redistribuye;
- se envía a Molka;
- se informa ocasionalmente.

No existe una conciliación de saldo pendiente o excedente.

---

#### 8. Compras y proveedores

##### 8.1. Necesidad → lista de compra

Las necesidades nacen en varias áreas.

Gerencia las consolida mediante:

- preguntas;
- WhatsApp;
- experiencia;
- memoria;
- notas.

La consolidación puede cambiar nombres, cantidades o prioridades.

##### 8.2. Lista → pedido al proveedor

El pedido se escribe de nuevo en WhatsApp.

No existe evidencia de que el proveedor reciba un documento estructurado idéntico a la lista interna.

##### 8.3. Pedido → confirmación

El proveedor responde:

- disponibilidad;
- precio;
- fecha;
- cantidad.

La conversación produce una versión final implícita.

No existe un documento consolidado confirmado con:

```text
SOLICITADO
→ MODIFICADO
→ CONFIRMADO
```

##### 8.4. Confirmado → factura

Cuando llega la mercancía, la factura se compara con el físico.

No se confirmó una comparación sistemática contra el pedido acordado.

Por tanto, pueden existir tres fuentes:

1. conversación de compra;
2. factura;
3. mercancía física.

##### 8.5. Factura → sistema contable

La información se carga nuevamente.

Riesgos:

- digitación incorrecta;
- clasificación errada;
- soporte faltante;
- duplicado;
- fecha distinta;
- centro de costo equivocado.

---

#### 9. Inventario

##### 9.1. Conteo inicial

El inventario físico se registra digitalmente.

Este proceso es una primera digitación necesaria, pero se convierte en duplicación problemática cuando:

- el físico cambia;
- no se registran todos los movimientos;
- el sistema sigue mostrando el dato anterior.

##### 9.2. Retiros

El retiro físico y el registro en kiosco deben representar el mismo hecho.

El piloto falló porque:

- algunos retiros se registraron;
- otros movimientos no;
- recepciones y producción no se capturaron integralmente.

Resultado:

```text
FÍSICO
≠
DIGITAL
```

##### 9.3. Conteo correctivo

Cuando el stock digital pierde confiabilidad, la única referencia vuelve a ser el conteo físico.

La conciliación se hace:

```text
STOCK SISTEMA
↔ CONTEO
→ DIFERENCIA
→ AJUSTE
```

No existe procedimiento estable confirmado para autorizar o explicar el ajuste.

##### 9.4. Sobrantes en áreas

El inventario puede permanecer:

- en Bodega;
- en Cocina;
- en Barra;
- en áreas productivas;
- en canastas;
- en frío.

El sistema no refleja necesariamente esas ubicaciones.

La conciliación depende de búsqueda física.

---

#### 10. Ventas y Makos

##### 10.1. Rappi → Makos

El cajero transcribe manualmente:

- productos;
- cantidades;
- observaciones;
- clasificación del canal.

Riesgos:

- producto omitido;
- cantidad errada;
- observación perdida;
- pedido duplicado;
- cambio no replicado.

##### 10.2. ManyChat → Makos

El pedido directo puede contener:

- cliente;
- dirección;
- teléfono;
- productos;
- forma de pago.

Caja vuelve a escribir la información en Makos.

No existe vínculo automático entre conversación y pedido.

##### 10.3. Makos → comanda impresa

Makos genera una representación física para Cocina, Bar o Barra.

Cuando la comanda:

- no imprime;
- se pierde;
- se duplica;
- se modifica;

el equipo debe reconciliar con la pantalla o comunicación verbal.

##### 10.4. Producto físico → disponibilidad en Makos

Makos puede mostrar un producto disponible aunque esté agotado.

La conciliación actual ocurre visualmente.

```text
CATÁLOGO MAKOS
↔ VITRINA O STOCK FÍSICO
```

No existe actualización automática.

##### 10.5. Eliminación → sustitución

Cuando falta un producto:

1. Caja elimina la línea;
2. escribe un comentario;
3. Servicio acuerda reemplazo;
4. agrega un nuevo pedido.

Son dos operaciones relacionadas solo por contexto humano.

---

#### 11. Pagos y Caja

##### 11.1. Datáfono → Makos

El pago con tarjeta ocurre en el datáfono.

Después el cajero registra el medio de pago en Makos.

La conciliación depende de aviso verbal.

Riesgos:

- pago aprobado no registrado;
- medio equivocado;
- duplicado;
- mesa abierta;
- pago rechazado registrado.

##### 11.2. Makos → cierre impreso

El cierre digital se imprime para acompañar el efectivo.

El papel se convierte en soporte de conciliación.

##### 11.3. Cierre → efectivo

Gerencia compara:

- total del cierre;
- efectivo entregado;
- base retenida;
- pagos registrados.

No se confirmó un documento estructurado de diferencias.

##### 11.4. Retiro → gasto

Un retiro de efectivo entregado a Gerencia puede registrarse como gasto.

Esto crea divergencia entre:

- naturaleza operativa;
- clasificación en Makos;
- registro contable;
- custodia real.

##### 11.5. Efectivo → factura

Cuando Gerencia utiliza dinero, el soporte llega después.

La conciliación depende de que cada salida tenga factura.

---

#### 12. Contabilidad

##### 12.1. Soportes múltiples

Contabilidad puede recibir:

- factura de proveedor;
- comprobante;
- cierre;
- Excel;
- reporte de Makos;
- información bancaria.

La misma operación puede aparecer en varios soportes.

##### 12.2. Conciliación posterior

Las diferencias se detectan después mediante revisión.

Esto puede identificar:

- factura faltante;
- gasto duplicado;
- clasificación incorrecta;
- valor distinto;
- soporte sin relación clara.

##### 12.3. Ausencia de identificador común

No existe evidencia de una clave única compartida entre:

- compra;
- recepción;
- factura;
- pago;
- movimiento de inventario;
- registro contable.

La conciliación depende de fecha, proveedor, valor y memoria.

---

#### 13. Turnos, asistencia, propinas y nómina

##### 13.1. Programación → VISO

Gerencia define el horario y luego lo registra o publica en VISO.

Debe validarse si existe una herramienta previa o si la programación nace directamente allí.

##### 13.2. ANIMA → VISO

El trabajador hace check-in en ANIMA.

Gerencia consulta reportes en VISO.

Esta derivación es legítima si existe integración consistente.

Las correcciones no están documentadas.

##### 13.3. Reporte → propinas

La información de retrasos y ausencias se utiliza para calcular propinas manualmente.

```text
REPORTE DE ASISTENCIA
→ CÁLCULO EXTERNO
→ AJUSTE
→ ENTREGA EN EFECTIVO
```

No existe vínculo entre cada novedad y cada descuento.

##### 13.4. Nómina → banco

La información de nómina se prepara y luego se carga en Bancolombia Nóminas.

No se confirmó:

- archivo;
- campos;
- revisión;
- conciliación posterior.

---

#### 14. Accesos

##### 14.1. Solicitud informal → creación técnica

Gerencia comunica datos.

El Jefe de Operaciones vuelve a registrarlos en:

- ANIMA;
- Vento OS;
- otras cuentas necesarias.

Riesgos:

- nombre distinto;
- correo equivocado;
- sede incorrecta;
- área incorrecta;
- permiso incompleto;
- falta de fecha.

##### 14.2. Estado laboral → estado de acceso

No existe conciliación automática entre:

- trabajador activo;
- contrato;
- asignación;
- cuentas;
- sesiones.

El retiro puede existir en la realidad y no reflejarse en tecnología.

##### 14.3. Múltiples aplicaciones

La misma persona puede requerir alta o baja en varias plataformas.

Sin un evento central, la actualización se repite manualmente.

---

#### 15. Marketing

##### 15.1. Solicitud → interpretación

La solicitud puede ser verbal o por WhatsApp.

El trabajador convierte esa instrucción en:

- fotografía;
- video;
- diseño;
- texto;
- publicación.

No existe un brief estructurado que permita conciliar:

```text
SOLICITADO
↔ PRODUCIDO
↔ APROBADO
↔ PUBLICADO
```

##### 15.2. Correcciones

Las modificaciones se comunican informalmente.

No existe control de versiones confirmado.

---

#### 16. Vaila Vainilla

##### 16.1. Shopify → operación física

El pedido digital debe convertirse en:

- picking;
- empaque;
- etiqueta o guía;
- lote de despacho;
- entrega a mensajería.

Parte de esa información puede volver a capturarse manualmente.

##### 16.2. Pedido → inventario

No se confirmó una conciliación entre:

- pedido;
- stock;
- producto empacado;
- producto entregado.

##### 16.3. Mensajería → cierre

No se confirmó una relación automática con:

- guía;
- estado;
- prueba de entrega;
- devolución;
- reembolso.

---

#### 17. Soporte técnico y mantenimiento

##### 17.1. Reporte → diagnóstico

El incidente llega por WhatsApp o verbalmente.

El diagnóstico y solución quedan en memoria.

No existe ticket que consolide:

- reporte;
- activo;
- causa;
- acciones;
- repuesto;
- cierre.

##### 17.2. Mantenimiento → factura

La reparación física puede producir una factura posterior.

No existe registro estructurado que relacione:

- falla;
- técnico;
- diagnóstico;
- reparación;
- repuesto;
- costo;
- garantía.

---

#### 18. Canastas y logística física

##### 18.1. Identidad visual

Las canastas se reconocen por:

- color;
- forma;
- marca;
- experiencia.

No existe un registro digital equivalente.

##### 18.2. Conteo

No existe conciliación sistemática entre:

- canastas enviadas;
- canastas recibidas;
- canastas retornadas;
- canastas lavadas;
- canastas perdidas.

##### 18.3. Estado

El estado se determina visualmente.

No existe registro de:

- sucia;
- en lavado;
- húmeda;
- seca;
- disponible;
- en tránsito.

---

#### 19. Conciliaciones críticas

##### 19.1. Remisiones

```text
SOLICITADO
↔ CONSOLIDADO
↔ PRODUCIDO
↔ CARGADO
↔ RECIBIDO
```

##### 19.2. Inventario

```text
ENTRADAS
+
PRODUCCIÓN
+
RETIROS
+
VENTAS
+
MERMAS
+
TRANSFERENCIAS
↔
CONTEO FÍSICO
```

##### 19.3. Ventas

```text
CANAL EXTERNO
↔ MAKOS
↔ COMANDA
↔ FACTURA
↔ PAGO
```

##### 19.4. Caja

```text
VENTAS
↔ MEDIOS DE PAGO
↔ CIERRE
↔ EFECTIVO
↔ RETIROS
↔ GASTOS
```

##### 19.5. Compras

```text
NECESIDAD
↔ PEDIDO
↔ CONFIRMACIÓN
↔ RECEPCIÓN
↔ FACTURA
↔ PAGO
↔ INVENTARIO
```

##### 19.6. Laboral

```text
CONTRATACIÓN
↔ TRABAJADOR
↔ TURNO
↔ ASISTENCIA
↔ PROPINA
↔ NÓMINA
↔ ACCESOS
```

---

#### 20. Puntos sin conciliación suficiente

1. remisión solicitada frente a recibida;
2. producción reportada frente a cargada;
3. cargado frente a recibido;
4. transferencias a Molka;
5. sobrantes por área;
6. inventario digital frente a físico;
7. producto disponible frente a Makos;
8. Rappi frente a Makos;
9. ManyChat frente a Makos;
10. datáfono frente a medio registrado;
11. retiro de efectivo frente a gasto;
12. factura frente a compra original;
13. factura frente a inventario recibido;
14. reporte de asistencia frente a descuento de propina;
15. estado laboral frente a cuentas activas;
16. pedido Shopify frente a inventario;
17. paquete entregado frente a entrega final;
18. canastas por sede;
19. mantenimiento realizado frente a activo;
20. soporte resuelto frente a historial técnico.

---

#### 21. Causas principales de doble digitación

##### 21.1. Aplicaciones aisladas

Cada herramienta resuelve una parte del proceso.

##### 21.2. Falta de integración

No existe intercambio automático entre:

- Rappi y Makos;
- ManyChat y Makos;
- operación y Contabilidad;
- asistencia y propinas;
- Shopify y logística;
- estado laboral y accesos.

##### 21.3. Uso de imágenes

La captura reemplaza el dato estructurado.

##### 21.4. Papel como puente

El cierre, factura o remisión física conecta sistemas.

##### 21.5. Falta de fuente de verdad

Las personas comparan varias fuentes para decidir.

##### 21.6. Implementación parcial

Vento OS registra algunos eventos, pero no el ciclo completo.

##### 21.7. Identidad compartida

El dato debe reconstruirse porque el sistema no identifica a la persona efectiva.

---

#### 22. Consecuencias operativas

- errores de cantidad;
- información desactualizada;
- pérdida de tiempo;
- imposibilidad de saber cuál versión es válida;
- conciliaciones posteriores;
- inventario incorrecto;
- compras urgentes;
- faltantes;
- cobros errados;
- diferencias de Caja;
- soportes faltantes;
- baja trazabilidad;
- dependencia de personas;
- retraso de decisiones;
- dificultad para medir rendimiento;
- desconfianza en las aplicaciones.

---

#### 23. Consecuencias técnicas

- múltiples fuentes de verdad;
- registros huérfanos;
- ausencia de IDs compartidos;
- estados inconsistentes;
- datos duplicados;
- imposibilidad de sincronización segura;
- necesidad de ajustes manuales;
- reportes contradictorios;
- auditoría incompleta;
- riesgo de reintentos duplicados;
- dificultad para migrar.

---

#### 24. Reglas futuras que deberá considerar el TO-BE

Esta sección no diseña la solución; identifica principios obligatorios.

##### 24.1. Una captura no deberá sustituir al registro estructurado

##### 24.2. Toda operación deberá tener identificador común

##### 24.3. Los sistemas externos deberán conservar referencia cruzada

##### 24.4. La corrección deberá conservar original y ajuste

##### 24.5. La conciliación deberá distinguir diferencia esperada y anomalía

##### 24.6. El dato no deberá volver a escribirse cuando pueda reutilizarse

##### 24.7. El papel podrá ser salida o contingencia, no fuente paralela indefinida

##### 24.8. Cada fuente deberá declarar autoridad y alcance

##### 24.9. La sincronización deberá ser idempotente

##### 24.10. Los procesos parciales deberán mostrar pendientes, no aparentar cierre

---

#### 25. Candidatos a fuente de verdad futura

No se aprueban todavía; se registran para diseño posterior.

| Dominio                 | Candidato futuro                        |
| ----------------------- | --------------------------------------- |
| Identidad y acceso      | SHELL / modelo central de identidad     |
| Turnos y asistencia     | VISO + ANIMA según contrato             |
| Inventario y remisiones | NEXO                                    |
| Producción              | FOGO                                    |
| Compras y recepciones   | ORIGO                                   |
| Venta y POS             | PULSO o contrato temporal Makos         |
| Contabilidad y costos   | NUMERA                                  |
| Clientes y fidelización | PASS                                    |
| Vaila Vainilla          | Shopify integrado con contratos propios |
| Indicadores             | VISO                                    |
| Eventos transversales   | Infraestructura compartida de Vento OS  |

La decisión final corresponde a E2, E3, X y fases funcionales.

---

#### 26. Métricas necesarias

##### 26.1. Doble digitación

- campos copiados por proceso;
- minutos de transcripción;
- actores involucrados;
- errores detectados;
- correcciones;
- duplicados;
- pedidos omitidos.

##### 26.2. Conciliación

- conciliaciones por período;
- tiempo invertido;
- diferencias encontradas;
- valor económico;
- tiempo hasta cierre;
- fuente elegida como válida.

##### 26.3. Calidad de datos

- registros sin ID;
- registros sin actor;
- registros sin sede;
- diferencias de cantidades;
- documentos sin soporte;
- cuentas activas sin trabajador.

---

#### 27. Validaciones pendientes para `OPS-AUD-015`

| Tema              | Validación                                   |
| ----------------- | -------------------------------------------- |
| Remisiones        | Cuántos soportes se usan simultáneamente hoy |
| Producción        | Cómo se calcula y conserva el consolidado    |
| Recepción interna | Cómo se confirma diferencia                  |
| Compras           | Formato real de lista y pedido               |
| Proveedores       | Comparación contra pedido original           |
| Contabilidad      | Campos digitados y sistemas utilizados       |
| Rappi             | Campos transcritos                           |
| ManyChat          | Campos transcritos                           |
| Datáfono          | Comprobantes y conciliación                  |
| Caja              | Procedimiento de diferencias                 |
| Propinas          | Herramienta de cálculo                       |
| Nómina            | Archivo o captura bancaria                   |
| Accesos           | Aplicaciones actualizadas por persona        |
| Vaila Vainilla    | Guías, inventario y mensajería               |
| Mantenimiento     | Relación entre factura y activo              |
| Canastas          | Existencia de conteos informales             |
| Makos             | Reportes exportados y conciliados            |

---

#### 28. Relación con `OPS-AUD-013`

`OPS-AUD-013` deberá identificar qué información se pierde durante cada copia o conciliación.

Ejemplos:

- autor;
- hora;
- versión;
- producto canónico;
- actor efectivo;
- motivo;
- estado;
- origen;
- destino;
- relación entre eventos.

---

#### 29. Relación con `OPS-AUD-014`

`OPS-AUD-014` deberá diferenciar:

- duplicación innecesaria;
- respaldo de contingencia;
- operación offline;
- registro temporal durante una caída;
- reconciliación posterior obligatoria.

No todo registro paralelo es incorrecto si existe una contingencia controlada.

---

#### 30. Hallazgos transversales

##### 30.1. La misma operación cambia varias veces de soporte

```text
ARCHIVO
→ IMAGEN
→ CHAT
→ TABLERO
→ PAPEL
→ SISTEMA
```

##### 30.2. La conciliación ocurre tarde

Muchas diferencias se descubren cuando:

- llega la sede;
- se cuenta Caja;
- se hace inventario;
- Contabilidad revisa;
- el cliente reclama;
- falta un producto.

##### 30.3. El dato estructurado se degrada

Excel o plataforma externa contienen campos; la captura o conversación los reduce a información visual.

##### 30.4. El físico sigue siendo la referencia final

Cuando sistema y operación difieren, prevalece:

- conteo;
- producto visible;
- efectivo;
- factura;
- observación.

##### 30.5. La doble digitación oculta responsabilidades

No siempre se sabe quién produjo el error:

- origen;
- transcripción;
- ejecución;
- conciliación.

##### 30.6. El registro paralelo puede generar cierres falsos

Un proceso puede aparecer completo en una fuente y pendiente en otra.

##### 30.7. El problema no es únicamente técnico

También proviene de:

- reglas no definidas;
- propietarios ambiguos;
- falta de identificadores;
- procesos incompletos;
- transición sin cierre.

---

#### 31. Matriz de prioridad inicial

| Prioridad | Puntos                                                         |
| --------- | -------------------------------------------------------------- |
| `P0`      | Inventario físico/digital, pagos, Caja, estado laboral/accesos |
| `P1`      | Remisiones, producción, despacho, recepción, compras           |
| `P2`      | Rappi, ManyChat, Contabilidad, propinas, Vaila Vainilla        |
| `P3`      | Marketing, soporte, mantenimiento, canastas                    |

La prioridad es documental y deberá validarse mediante criticidad, frecuencia e impacto.

---

#### 32. Matriz de destino de hallazgos

| Hallazgo                                             | Tarea exacta                      |
| ---------------------------------------------------- | --------------------------------- |
| Información perdida durante la copia                 | `OPS-AUD-013`                     |
| Registro paralelo por contingencia                   | `OPS-AUD-014`                     |
| Campos y procesos no confirmados                     | `OPS-AUD-015`                     |
| Mapa de capacidades                                  | `CAP-MAP-001` a `CAP-MAP-015`     |
| Auditoría de integraciones y duplicaciones de código | `CODE-AUD-001` a `CODE-AUD-020`   |
| Definición de aplicación propietaria                 | `CAP-SCOPE-001` a `CAP-SCOPE-019` |
| Cobertura faltante                                   | `CAP-COVER-001` a `CAP-COVER-012` |
| Consolidación de brechas                             | `GAP-CTRL-001`                    |
| Vinculación con paquete futuro                       | `GAP-CTRL-006`                    |
| Fuente de verdad y flujo TO-BE                       | BLOQUE E2                         |
| Identificadores, eventos y reconciliación            | BLOQUE E3                         |
| Integraciones, colas e idempotencia                  | BLOQUE E4 y BLOQUE X              |
| Transición y coexistencia                            | BLOQUE E5                         |

---

#### 33. Decisiones propuestas

1. Excel, captura y WhatsApp se consideran artefactos distintos de una misma solicitud.
2. La coexistencia de papel y Vento OS se clasifica como transición, no como modelo permanente.
3. El consolidado productivo constituye una segunda representación de las solicitudes.
4. El reporte de producción y el conteo del conductor no están conciliados formalmente.
5. Solicitado, producido, cargado y recibido no comparten actualmente un registro único.
6. La lista de compra, el pedido, la confirmación, la factura y la recepción son fuentes separadas.
7. Rappi y ManyChat requieren transcripción manual a Makos.
8. El datáfono y Makos dependen de registro y confirmación humana.
9. El cierre de Makos se concilia manualmente con efectivo.
10. La clasificación de retiro como gasto demuestra divergencia semántica.
11. Las facturas se vuelven a registrar en Contabilidad.
12. El inventario digital debe conciliarse con el físico porque los movimientos actuales son incompletos.
13. El reporte de asistencia alimenta un cálculo manual de propinas.
14. La nómina requiere carga posterior en Bancolombia.
15. Las altas y bajas se repiten por aplicación.
16. El estado laboral no está conciliado automáticamente con los accesos.
17. Shopify no tiene conciliación confirmada con inventario y mensajería.
18. Soporte y mantenimiento carecen de un registro que conecte inicio, ejecución y cierre.
19. Las canastas no cuentan con conciliación por ubicación o estado.
20. El TO-BE deberá eliminar duplicación innecesaria y conservar únicamente la redundancia controlada.
21. Ninguna decisión autoriza integraciones, fuentes de verdad definitivas, código, migraciones o cambios en Supabase.

---

#### 34. Criterios de aceptación

`OPS-AUD-012` podrá aprobarse cuando se confirme que:

- se identifican los principales puntos de doble digitación;
- se documentan conciliaciones manuales;
- se distinguen captura, transcripción, consolidación, impresión, ajuste y registro paralelo;
- se cubren remisiones, producción, compras, inventario, ventas, Caja, Contabilidad, trabajo, accesos y terceros;
- se identifican puntos sin conciliación suficiente;
- se documentan consecuencias operativas y técnicas;
- las cifras o campos no confirmados quedan vinculados a `OPS-AUD-015`;
- cada brecha tiene destino documental;
- no se ha definido todavía la fuente de verdad TO-BE;
- no se ha autorizado implementación.

---

#### 35. Resultado y continuidad

Con la aprobación de `OPS-AUD-012` quedará establecida la línea base inicial de:

- datos capturados más de una vez;
- transcripciones entre plataformas;
- documentos paralelos;
- consolidaciones manuales;
- conciliaciones;
- ajustes posteriores;
- divergencias;
- registros sin identificador común;
- puntos sin conciliación;
- prioridades de corrección;
- candidatos a fuentes de verdad futuras.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-013
— Identificar pérdidas de trazabilidad, información y responsabilidad
```

`OPS-AUD-013` deberá utilizar este inventario para determinar exactamente qué datos, actores, causas, estados y responsabilidades se pierden durante cada traspaso, copia, corrección o conciliación.



### ✅ OPS-AUD-013 — Identificar pérdidas de trazabilidad, información y responsabilidad

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de pérdidas de trazabilidad, degradación de información y vacíos de responsabilidad  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-012`  
**Validación pendiente:** `OPS-AUD-015` para actores, campos, custodios, procedimientos o consecuencias no suficientemente confirmados

---

#### 1. Propósito

Identificar en qué puntos de la operación actual se pierde la capacidad de responder de forma inequívoca:

- qué ocurrió;
- quién lo hizo;
- quién lo ordenó;
- quién lo aprobó;
- cuándo ocurrió;
- dónde ocurrió;
- sobre qué producto, dinero, documento, activo o trabajador;
- cuál era el estado anterior;
- cuál fue el estado posterior;
- por qué cambió;
- qué evidencia lo respalda;
- quién quedó responsable;
- qué proceso debía continuar;
- qué quedó pendiente.

La tarea deberá diferenciar tres problemas relacionados, pero no equivalentes:

```text
PÉRDIDA DE TRAZABILIDAD
→ no se puede reconstruir el recorrido completo

PÉRDIDA DE INFORMACIÓN
→ un dato se omite, degrada, transforma o desaparece

PÉRDIDA DE RESPONSABILIDAD
→ no se puede atribuir decisión, ejecución, custodia o corrección
```

Esta tarea describe el estado actual.

No define todavía:

- modelo de auditoría objetivo;
- campos definitivos;
- eventos de dominio;
- retención;
- permisos;
- RLS;
- firma electrónica;
- evidencia inmutable;
- arquitectura de observabilidad;
- implementación.

---

#### 2. Principio obligatorio

Una operación no se considera trazable únicamente porque exista un mensaje, una factura, una captura o un registro en una aplicación.

La trazabilidad suficiente requiere poder relacionar:

```text
ACTOR
+
ACCIÓN
+
OBJETO
+
CONTEXTO
+
FECHA Y HORA
+
ESTADO ANTERIOR
+
ESTADO POSTERIOR
+
MOTIVO
+
EVIDENCIA
+
RESPONSABILIDAD
```

La ausencia de cualquiera de estos elementos puede ser tolerable en procesos de baja sensibilidad, pero es crítica cuando afecta:

- dinero;
- inventario;
- seguridad alimentaria;
- acceso;
- nómina;
- facturación;
- compras;
- producción;
- clientes;
- activos;
- obligaciones legales o contables.

---

#### 3. Tipos de pérdida

##### 3.1. Pérdida de identidad

No se conoce la persona efectiva que realizó la acción.

Ejemplos:

- cuenta compartida;
- dispositivo compartido;
- sesión abierta;
- acción registrada a nombre de una función.

##### 3.2. Pérdida de contexto

No se conoce:

- sede;
- área;
- turno;
- dispositivo;
- rol operativo;
- aplicación;
- proceso;
- recurso afectado.

##### 3.3. Pérdida temporal

No existe fecha u hora suficiente para ordenar los hechos.

##### 3.4. Pérdida de causalidad

No se puede relacionar:

- una solicitud con su producción;
- una compra con su recepción;
- una venta con su pago;
- una merma con el lote;
- una baja laboral con la revocación de acceso.

##### 3.5. Pérdida de versión

No se sabe cuál archivo, captura, mensaje o instrucción era la vigente.

##### 3.6. Pérdida de cantidad

No se distinguen cantidades:

- solicitadas;
- confirmadas;
- producidas;
- cargadas;
- recibidas;
- rechazadas;
- pendientes.

##### 3.7. Pérdida de motivo

La corrección, faltante, rechazo, anulación o ajuste carece de razón estructurada.

##### 3.8. Pérdida de custodia

No se sabe quién tuvo:

- dinero;
- factura;
- mercancía;
- canasta;
- equipo;
- acceso;
- documento.

##### 3.9. Pérdida de estado

No se conoce si un proceso está:

- pendiente;
- en curso;
- parcial;
- bloqueado;
- cancelado;
- cerrado;
- corregido.

##### 3.10. Pérdida de evidencia

La operación depende de memoria, conversación o percepción sin soporte durable.

##### 3.11. Pérdida de responsabilidad

No se puede determinar quién debía:

- iniciar;
- ejecutar;
- revisar;
- aprobar;
- recibir;
- corregir;
- escalar;
- cerrar.

---

#### 4. Clasificación de severidad

| Nivel            | Descripción                                                | Ejemplo                                            |
| ---------------- | ---------------------------------------------------------- | -------------------------------------------------- |
| `TR1 — MENOR`    | Dificulta consulta, pero el efecto es limitado             | No saber quién pidió una corrección de diseño      |
| `TR2 — MODERADA` | Genera reproceso o demora                                  | No identificar la versión vigente de una solicitud |
| `TR3 — ALTA`     | Afecta operación, inventario o servicio                    | No saber dónde ocurrió un faltante                 |
| `TR4 — CRÍTICA`  | Afecta dinero, acceso, cumplimiento o seguridad            | Cuenta activa de un trabajador retirado            |
| `TR5 — SEVERA`   | Puede producir pérdida legal, sanitaria o financiera grave | Merma sin lote o pago sin conciliación             |

---

#### 5. Clasificación del estado de evidencia

| Estado                | Significado                                         |
| --------------------- | --------------------------------------------------- |
| `CONFIRMADO`          | La pérdida fue descrita directamente                |
| `CONFIRMADO_PARCIAL`  | Existe evidencia, pero no se conoce todo su alcance |
| `INFERIDO_CONTROLADO` | Se deduce directamente de procesos ya confirmados   |
| `POR_VALIDAR`         | Debe confirmarse en `OPS-AUD-015`                   |
| `AUSENTE`             | No existe mecanismo identificado                    |
| `TRANSITORIO`         | Surge de coexistencia durante pruebas               |

---

#### 6. Inventario maestro de pérdidas

| Código     | Dominio                  | Pérdida principal                                                                     | Severidad | Estado                |
| ---------- | ------------------------ | ------------------------------------------------------------------------------------- | --------- | --------------------- |
| `LOSS-001` | Remisiones               | No existe ID común entre solicitud, producción, despacho y recepción                  | `TR4`     | `CONFIRMADO`          |
| `LOSS-002` | Remisiones               | Captura no conserva versión ni estructura del Excel                                   | `TR3`     | `CONFIRMADO`          |
| `LOSS-003` | Remisiones               | No se identifica siempre quién elaboró o modificó                                     | `TR3`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-004` | Producción               | Consolidado manual pierde desglose por sede                                           | `TR3`     | `CONFIRMADO`          |
| `LOSS-005` | Producción               | Reporte final no se relaciona con solicitud original                                  | `TR3`     | `CONFIRMADO`          |
| `LOSS-006` | Despacho                 | No se registra quién cambió cantidad o destino                                        | `TR4`     | `CONFIRMADO`          |
| `LOSS-007` | Recepción                | No existe confirmación estructurada de recibido                                       | `TR4`     | `CONFIRMADO`          |
| `LOSS-008` | Recepción                | No se distingue no producido, no cargado, no entregado o no recibido                  | `TR4`     | `CONFIRMADO`          |
| `LOSS-009` | Canastas                 | No existe historial de ubicación, custodio o estado                                   | `TR3`     | `CONFIRMADO`          |
| `LOSS-010` | Bodega                   | Retiro físico sin actor, cantidad y destino registrados                               | `TR5`     | `CONFIRMADO`          |
| `LOSS-011` | Inventario               | Stock digital no explica cada diferencia física                                       | `TR5`     | `CONFIRMADO`          |
| `LOSS-012` | Inventario               | Sobrantes permanecen en áreas sin ubicación trazable                                  | `TR4`     | `CONFIRMADO`          |
| `LOSS-013` | Merma                    | No se conserva lote, causa, aprobador ni evidencia                                    | `TR5`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-014` | Merma                    | Misma persona detecta, decide, descarta y registra                                    | `TR5`     | `CONFIRMADO`          |
| `LOSS-015` | Transferencia a Molka    | Sin origen, lote, vida útil, cantidad ni aceptación                                   | `TR5`     | `CONFIRMADO`          |
| `LOSS-016` | Compras                  | Lista, pedido y confirmación no comparten versión única                               | `TR4`     | `CONFIRMADO`          |
| `LOSS-017` | Compras                  | No se conoce siempre quién autorizó cambios de precio o cantidad                      | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-018` | Recepción proveedor      | Receptor sustituto y responsabilidad no formalizados                                  | `TR4`     | `POR_VALIDAR`         |
| `LOSS-019` | Proveedores              | Diferencia entre pedido, factura y físico no queda estructurada                       | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-020` | Contabilidad             | Soporte puede perder relación con compra, recepción y pago                            | `TR5`     | `CONFIRMADO`          |
| `LOSS-021` | Caja                     | Cuenta compartida no identifica al trabajador efectivo                                | `TR5`     | `CONFIRMADO`          |
| `LOSS-022` | Servicio                 | Pedido registrado no identifica siempre al mesero efectivo                            | `TR4`     | `CONFIRMADO`          |
| `LOSS-023` | Pago                     | Datáfono y Makos no comparten confirmación automática                                 | `TR5`     | `CONFIRMADO`          |
| `LOSS-024` | Pago                     | Aviso verbal no deja evidencia de quién procesó                                       | `TR5`     | `CONFIRMADO`          |
| `LOSS-025` | Caja                     | Diferencia de efectivo no tiene flujo documental confirmado                           | `TR5`     | `POR_VALIDAR`         |
| `LOSS-026` | Efectivo                 | Retiro registrado como gasto pierde naturaleza y custodia                             | `TR5`     | `CONFIRMADO`          |
| `LOSS-027` | Venta                    | Eliminación y sustitución no quedan vinculadas                                        | `TR4`     | `CONFIRMADO`          |
| `LOSS-028` | Comandas                 | No existe estado de recibida, iniciada, lista, recogida y entregada                   | `TR4`     | `CONFIRMADO`          |
| `LOSS-029` | Rappi                    | Pedido original y transcripción pueden divergir sin relación automática               | `TR4`     | `CONFIRMADO`          |
| `LOSS-030` | ManyChat                 | Conversación y pedido Makos no comparten ID                                           | `TR4`     | `CONFIRMADO`          |
| `LOSS-031` | Domicilios               | No existe confirmación rutinaria de entrega final                                     | `TR4`     | `CONFIRMADO`          |
| `LOSS-032` | Shopify                  | Pedido, empaque, guía, entrega y devolución no están relacionados de forma confirmada | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-033` | Turnos                   | No se conserva aceptación del trabajador                                              | `TR3`     | `CONFIRMADO`          |
| `LOSS-034` | Turnos                   | Cambios y reemplazos no tienen flujo confirmado                                       | `TR4`     | `POR_VALIDAR`         |
| `LOSS-035` | Asistencia               | Corrección de check-in no tiene trazabilidad confirmada                               | `TR4`     | `POR_VALIDAR`         |
| `LOSS-036` | Propinas                 | No se conserva cálculo base, ajuste, motivo y valor final                             | `TR5`     | `CONFIRMADO`          |
| `LOSS-037` | Nómina                   | Preparación, revisión y aprobación no están completamente documentadas                | `TR5`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-038` | Contratación             | Evaluación de prueba no queda estructurada                                            | `TR4`     | `CONFIRMADO`          |
| `LOSS-039` | Inducción                | No existe evidencia de capacidades aprendidas                                         | `TR4`     | `CONFIRMADO`          |
| `LOSS-040` | Accesos                  | Alta informal puede omitir contexto de sede, área o rol                               | `TR5`     | `CONFIRMADO`          |
| `LOSS-041` | Accesos                  | Baja laboral no dispara revocación obligatoria                                        | `TR5`     | `CONFIRMADO`          |
| `LOSS-042` | Accesos                  | No existe relación central entre empleado y todas sus cuentas                         | `TR5`     | `CONFIRMADO`          |
| `LOSS-043` | Marketing                | Solicitud, versión, aprobación y publicación no comparten registro                    | `TR3`     | `CONFIRMADO`          |
| `LOSS-044` | Soporte                  | Incidente, causa, cambio y solución no quedan registrados                             | `TR4`     | `CONFIRMADO`          |
| `LOSS-045` | Mantenimiento            | Falla, técnico, repuesto, costo y garantía no comparten historial                     | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-046` | Servicios Generales      | No existe checklist, actor de cierre ni evidencia                                     | `TR3`     | `CONFIRMADO`          |
| `LOSS-047` | Dispositivos compartidos | El sistema registra cuenta, no persona efectiva                                       | `TR5`     | `CONFIRMADO`          |
| `LOSS-048` | Aplicaciones             | Estados parciales pueden aparentar cierre completo                                    | `TR4`     | `CONFIRMADO`          |
| `LOSS-049` | Datos maestros           | Nombres y conceptos pueden variar entre herramientas                                  | `TR4`     | `INFERIDO_CONTROLADO` |
| `LOSS-050` | Excepciones              | Corrección puede borrar o reemplazar sin relación con el original                     | `TR5`     | `CONFIRMADO_PARCIAL`  |

---

#### 7. Remisiones internas

##### 7.1. Pérdida de identificación común

No existe un identificador confirmado que conecte:

```text
SOLICITUD
→ CONSOLIDACIÓN
→ PRODUCCIÓN
→ CARGA
→ TRANSPORTE
→ RECEPCIÓN
→ DIFERENCIA
```

Consecuencia:

- el reclamo no puede ubicarse en una etapa concreta;
- no se sabe quién tenía la responsabilidad cuando apareció el faltante;
- una compensación posterior no queda vinculada al faltante original.

##### 7.2. Pérdida de versión

El Excel puede modificarse después de tomar la captura.

La captura enviada puede no ser la versión vigente.

No existe:

- número de versión;
- estado de reemplazada;
- confirmación de lectura;
- aceptación por producción.

##### 7.3. Pérdida de actor

La captura enviada al grupo puede mostrar quién envió el mensaje, pero no necesariamente quién:

- calculó;
- revisó;
- autorizó;
- modificó;
- consolidó.

##### 7.4. Pérdida de cantidades intermedias

No se conservan estructuradamente:

- cantidad confirmada por producción;
- cantidad realmente producida;
- cantidad cargada;
- cantidad entregada;
- cantidad aceptada;
- saldo pendiente.

---

#### 8. Producción

##### 8.1. Consolidación sin desglose

El total registrado en tablero o teléfono puede perder la relación con:

- sede;
- solicitud;
- versión;
- fecha requerida.

##### 8.2. Resultado sin causalidad

El reporte de producción final no se vincula formalmente con:

- insumos consumidos;
- lote;
- responsable;
- remisión;
- faltante;
- sobrante;
- destino.

##### 8.3. Producto físico sin identificación suficiente

En varias áreas el producto se deja en:

- canastas;
- bandejas;
- mesones;
- cuarto frío;
- congelador.

El conductor lo reconoce por experiencia.

Puede perderse:

- área productora;
- hora de terminación;
- sede destino;
- lote;
- vida útil;
- cantidad;
- responsable.

##### 8.4. Responsabilidad distribuida

Cuando varias personas producen, empacan y mueven, no existe un registro que separe su participación.

---

#### 9. Despacho y recepción

##### 9.1. Carga sin segunda verificación

El conductor:

- localiza;
- cuenta;
- organiza;
- cambia cantidades;
- carga.

No existe revisor independiente confirmado.

##### 9.2. Cambio de destino sin registro

Un sobrante puede cambiar de sede por criterio operativo.

El cambio no conserva:

- motivo;
- autorizador;
- origen;
- destino;
- cantidad.

##### 9.3. Recepción sin aceptación formal

La sede cuenta y guarda.

No existe registro estructurado de:

- receptor efectivo;
- hora;
- condición;
- diferencia;
- rechazo;
- observación;
- fotografía.

##### 9.4. Faltante sin localización causal

Cuando la sede reclama, no se puede determinar automáticamente si:

- no se solicitó;
- no se consolidó;
- no se produjo;
- no se cargó;
- se descargó en otra sede;
- se recibió y no se ubicó;
- se consumió antes de contar.

---

#### 10. Bodega e inventario

##### 10.1. Retiro sin registro completo

La pérdida es severa porque no se conserva:

- persona;
- producto;
- presentación;
- cantidad;
- ubicación origen;
- área destino;
- motivo;
- fecha;
- turno.

##### 10.2. Inventario sin cadena de movimientos

El stock digital no puede explicarse mediante la suma completa de:

```text
INICIAL
+
RECEPCIONES
+
PRODUCCIÓN
+
TRANSFERENCIAS ENTRANTES
-
RETIROS
-
VENTAS
-
MERMAS
-
TRANSFERENCIAS SALIENTES
±
AJUSTES
```

Cuando faltan eventos, la diferencia no tiene causa verificable.

##### 10.3. Inventario distribuido

Producto retirado de Bodega puede permanecer en un área.

No se sabe si está:

- disponible;
- reservado;
- abierto;
- en uso;
- sobrante;
- dañado;
- transferido.

##### 10.4. Ajuste sin explicación suficiente

No existe procedimiento confirmado que preserve:

- stock esperado;
- conteo;
- diferencia;
- causa;
- aprobador;
- movimiento correctivo.

---

#### 11. Mermas y reasignaciones

##### 11.1. Merma

La hoja manual registra producto y cantidad, pero no se confirmó:

- lote;
- vencimiento;
- causa codificada;
- fotografía;
- costo;
- aprobador;
- método de disposición;
- vínculo al inventario.

##### 11.2. Responsabilidad concentrada

La misma persona puede decidir y ejecutar.

No puede distinguirse:

- error;
- deterioro real;
- uso indebido;
- producto recuperable;
- duplicación.

##### 11.3. Reasignación a Molka

Se pierde información crítica de seguridad y rotación:

- fecha de producción;
- origen;
- vida útil;
- lote;
- condición;
- responsable;
- fecha límite de uso.

---

#### 12. Compras y proveedores

##### 12.1. Necesidad sin origen trazable

Gerencia consulta qué hace falta.

La necesidad puede provenir de:

- aviso;
- experiencia;
- urgencia;
- inventario visual.

No siempre queda:

- área solicitante;
- motivo;
- cantidad estimada;
- fecha requerida.

##### 12.2. Pedido sin versión final consolidada

Los cambios del proveedor quedan dentro de la conversación.

No existe una orden final inequívoca con:

- líneas;
- cantidades;
- precios;
- condiciones;
- aprobador.

##### 12.3. Recepción sin vínculo integral

La factura se compara con el físico, pero no se confirmó una relación formal con el pedido original.

##### 12.4. Sustituto sin responsabilidad formal

Si recibe otra persona, no se conoce:

- designación;
- alcance;
- capacidad de aceptar;
- obligación de reportar;
- custodia del soporte.

---

#### 13. Caja, pagos y efectivo

##### 13.1. Cuenta compartida

Makos puede identificar:

- Caja;
- Servicio;
- función.

No necesariamente identifica a la persona.

Esto impide atribuir con certeza:

- eliminación;
- modificación;
- apertura;
- registro de pago;
- impresión;
- corrección.

##### 13.2. Datáfono separado de Makos

La persona que procesa puede ser distinta de quien registra.

No existe vínculo automático entre:

- comprobante;
- transacción bancaria;
- mesa;
- factura;
- cajero;
- operador del datáfono.

##### 13.3. Diferencia de Caja

No se confirmó un expediente que conserve:

- cierre esperado;
- efectivo real;
- diferencia;
- explicación;
- responsable;
- revisión;
- decisión;
- ajuste.

##### 13.4. Transferencia de custodia mal clasificada

Registrar como gasto oculta que el dinero continúa dentro del grupo bajo otra custodia.

Se pierde:

- origen;
- receptor;
- saldo bajo custodia;
- uso posterior;
- soporte de cada salida.

---

#### 14. Ventas y servicio

##### 14.1. Pedido y actor efectivo

Una cuenta compartida no permite saber quién tomó el pedido.

##### 14.2. Comanda sin estados operativos

La impresión demuestra emisión, pero no:

- recepción por estación;
- inicio;
- asignación;
- terminación;
- recogida;
- entrega.

##### 14.3. Sustitución sin relación

El producto eliminado y el nuevo producto quedan como acciones separadas.

Se pierde:

- motivo de sustitución;
- aceptación del cliente;
- diferencia de precio;
- producto originalmente solicitado.

##### 14.4. Agotado no sincronizado

El sistema puede permitir venta de un producto que no existe.

No queda evidencia de:

- momento del agotado;
- responsable de desactivarlo;
- pedidos afectados;
- duración.

---

#### 15. Rappi, ManyChat y domicilios

##### 15.1. Rappi

Se puede perder durante la transcripción:

- modificador;
- observación;
- cantidad;
- precio;
- estado;
- cancelación.

##### 15.2. ManyChat

La conversación contiene información no estructurada.

No existe ID común con Makos.

##### 15.3. Domicilio

Después de la salida no existe confirmación rutinaria de:

- entrega;
- hora;
- receptor;
- pago;
- novedad;
- devolución.

##### 15.4. Responsabilidad de entrega

No se separa claramente responsabilidad de:

- Caja;
- mensajero;
- plataforma;
- cliente.

---

#### 16. Contabilidad

##### 16.1. Soporte sin relación empresarial completa

Una factura puede llegar sin estar vinculada a:

- solicitud;
- aprobación;
- recepción;
- inventario;
- pago;
- centro de costo.

##### 16.2. Conciliación por aproximación

La relación puede reconstruirse por:

- proveedor;
- fecha;
- valor;
- memoria.

##### 16.3. Clasificación semántica

Un movimiento puede existir, pero con naturaleza incorrecta.

La pérdida no es de existencia, sino de significado.

---

#### 17. Turnos, asistencia, propinas y nómina

##### 17.1. Turno sin aceptación

Se sabe que fue publicado, pero no que el trabajador:

- lo vio;
- lo entendió;
- lo aceptó;
- solicitó cambio.

##### 17.2. Cambio sin historial confirmado

No se conoce versión anterior, solicitante, aprobador y motivo.

##### 17.3. Check-in

El evento registra asistencia, pero la corrección posterior no tiene flujo confirmado.

##### 17.4. Propinas

La liquidación manual no conserva integralmente:

- fondo total;
- criterio;
- base individual;
- días trabajados;
- ajustes;
- motivos;
- valor final;
- entrega;
- aceptación.

##### 17.5. Nómina

No está completamente documentado quién:

- prepara;
- revisa;
- autoriza;
- carga;
- ejecuta;
- corrige.

---

#### 18. Contratación, inducción y accesos

##### 18.1. Contratación

La observación de la prueba no queda en un instrumento estructurado.

Se pierde:

- criterio;
- evaluador;
- resultado;
- capacidades;
- motivo de aceptación o rechazo.

##### 18.2. Inducción

No existe evidencia de:

- contenidos;
- duración;
- responsable;
- capacidades demostradas;
- riesgos explicados;
- aprobación para operar solo.

##### 18.3. Alta de acceso

La solicitud informal puede perder:

- fecha de inicio;
- sede;
- área;
- rol;
- permisos;
- dispositivo;
- vigencia.

##### 18.4. Baja

El retiro laboral y la baja técnica no comparten un evento obligatorio.

No se puede demostrar siempre:

- cuándo terminó;
- cuándo se informó;
- cuándo se revocó;
- qué sesiones quedaron activas;
- qué acciones ocurrieron en el intervalo.

---

#### 19. Marketing

##### 19.1. Solicitud sin brief

Se pierde:

- objetivo;
- audiencia;
- canal;
- formato;
- fecha;
- responsable;
- criterio de aceptación.

##### 19.2. Versiones

No existe control confirmado de:

- versión inicial;
- comentarios;
- versión aprobada;
- publicador;
- fecha de aprobación.

##### 19.3. Historias

Pueden publicarse sin aprobación previa.

No queda separación entre:

- creador;
- revisor;
- aprobador;
- publicador.

---

#### 20. Vaila Vainilla

##### 20.1. Pedido a paquete

No se confirmó una trazabilidad integral entre:

- pedido Shopify;
- inventario;
- producto seleccionado;
- empaque;
- guía;
- mensajería.

##### 20.2. Entrega final

No se confirmó evidencia de:

- entregado;
- destinatario;
- fecha;
- devolución;
- pérdida;
- reembolso.

##### 20.3. Responsabilidad

La dependencia de Jeo y la trabajadora concentra decisiones y ejecución sin un historial empresarial completo.

---

#### 21. Soporte tecnológico

##### 21.1. Incidente

Se pierde:

- activo;
- sede;
- usuario;
- síntoma;
- prioridad;
- hora;
- causa;
- solución;
- cambio aplicado;
- resultado;
- recurrencia.

##### 21.2. Responsabilidad técnica

El Jefe de Operaciones diagnostica, cambia y cierra.

No existe:

- revisión;
- bitácora;
- aprobación del cambio;
- historial del activo.

##### 21.3. Impacto sobre desarrollo

No queda medido:

- tiempo interrumpido;
- tarea desplazada;
- costo de oportunidad;
- reincidencia.

---

#### 22. Mantenimiento

##### 22.1. Historial por activo

No existe un registro consolidado de:

- fallas;
- visitas;
- diagnóstico;
- repuestos;
- técnico;
- costo;
- garantía;
- fecha de próxima revisión.

##### 22.2. Aceptación

El equipo vuelve a funcionar, pero no queda un cierre técnico estructurado.

##### 22.3. Responsabilidad de garantía

Sin historial, es difícil determinar:

- si la falla reapareció;
- si estaba cubierta;
- quién realizó la intervención;
- qué repuesto se instaló.

---

#### 23. Canastas y activos físicos menores

##### 23.1. Canastas

Se pierde:

- propietario;
- sede;
- estado;
- ruta;
- número;
- fecha de envío;
- fecha de retorno.

##### 23.2. Limpieza

No se sabe:

- quién lavó;
- cuándo;
- estado previo;
- estado final;
- tiempo de secado.

##### 23.3. Otros activos

La misma brecha puede aplicar a:

- moldes;
- vajilla;
- utensilios;
- repuestos;
- decoraciones;
- equipos menores.

Su inventario detallado deberá quedar cubierto por las tareas funcionales y de activos posteriores.

---

#### 24. Dispositivos y cuentas compartidas

##### 24.1. Identidad funcional frente a identidad humana

```text
CUENTA: SERVICIO
→ ACCIÓN REGISTRADA

PERSONA EFECTIVA
→ NO DETERMINABLE CON CERTEZA
```

##### 24.2. Sesión persistente

Una acción puede realizarse desde una sesión iniciada por otra persona.

##### 24.3. Contexto incorrecto

Una cuenta puede estar asociada a una sede o área, pero el dispositivo puede ser utilizado por otra persona en otro contexto.

##### 24.4. Responsabilidad posterior

Cuando ocurre un error, la investigación depende de:

- turno;
- memoria;
- cámaras;
- testimonios.

No del registro de aplicación.

---

#### 25. Pérdida durante la doble digitación

Cada transcripción puede perder:

| Origen → destino              | Información vulnerable          |
| ----------------------------- | ------------------------------- |
| Excel → captura               | estructura, versión, validación |
| Captura → interpretación      | identificadores, precisión      |
| Rappi → Makos                 | observaciones, estados          |
| ManyChat → Makos              | cliente, dirección, contexto    |
| Datáfono → Makos              | referencia bancaria, operador   |
| Factura → Contabilidad        | relación con proceso            |
| VISO → cálculo manual         | reglas y vínculo de ajustes     |
| Estado laboral → aplicaciones | oportunidad y cobertura         |
| Shopify → empaque             | inventario y responsable        |

---

#### 26. Pérdidas por cierre aparente

Un proceso puede marcarse o asumirse como terminado aunque falten etapas.

| Proceso        | Cierre aparente      | Etapa no demostrada                         |
| -------------- | -------------------- | ------------------------------------------- |
| Remisión       | Vehículo salió       | Recepción completa                          |
| Domicilio      | Pedido salió         | Entrega al cliente                          |
| Vaila Vainilla | Paquete a mensajería | Entrega final                               |
| Soporte        | Equipo funciona      | Causa y solución documentadas               |
| Mantenimiento  | Equipo prende        | Aceptación y garantía                       |
| Alta           | Cuenta creada        | Acceso correcto y recibido                  |
| Baja           | Cuenta desactivada   | Todas las sesiones y aplicaciones revocadas |
| Propina        | Dinero entregado     | Cálculo verificable                         |
| Compra         | Factura recibida     | Inventario y Contabilidad conciliados       |

---

#### 27. Pérdidas de responsabilidad

##### 27.1. Sin iniciador claro

- ajustes de inventario;
- transferencias a Molka;
- lavado de canastas;
- baja de accesos.

##### 27.2. Sin aprobador claro

- remisión parcial;
- cambio de destino;
- merma;
- diferencia de proveedor;
- corrección de pago;
- diferencia de Caja.

##### 27.3. Sin custodio claro

- canastas;
- sobrantes;
- facturas en tránsito;
- equipos menores;
- algunos documentos.

##### 27.4. Sin responsable de cierre

- domicilio;
- Vaila Vainilla;
- soporte;
- mantenimiento;
- recepción de remisión;
- corrección de acceso.

##### 27.5. Responsabilidad concentrada

- Gerencia General;
- Jefe de Operaciones;
- conductor;
- responsables productivos;
- trabajador que registra merma.

---

#### 28. Consecuencias operativas

- faltantes sin causa;
- compras urgentes;
- inventario no confiable;
- imposibilidad de medir cumplimiento;
- repetición de errores;
- reclamos sin responsable;
- retrasos;
- retrabajo;
- pérdida de confianza;
- dependencia de memoria;
- decisiones tardías;
- riesgo de fraude o abuso;
- riesgo sanitario;
- accesos activos indebidamente;
- dificultad de escalar la operación.

---

#### 29. Consecuencias técnicas

- registros sin actor efectivo;
- entidades sin identificador común;
- eventos no relacionados;
- estados incompletos;
- auditoría no determinista;
- imposibilidad de reconstrucción;
- ajustes sin causalidad;
- datos incompatibles;
- fuentes de verdad múltiples;
- reportes contradictorios;
- integraciones inseguras;
- migración difícil;
- permisos imposibles de verificar correctamente.

---

#### 30. Información mínima que el TO-BE deberá preservar

Esta sección no diseña tablas ni interfaces.

##### 30.1. Identidad

- persona;
- cuenta;
- sesión;
- dispositivo;
- rol base;
- rol operativo;
- sede;
- área.

##### 30.2. Acción

- tipo;
- recurso;
- cantidad;
- unidad;
- estado anterior;
- estado posterior;
- fecha y hora.

##### 30.3. Causalidad

- proceso origen;
- solicitud;
- evento anterior;
- corrección;
- motivo;
- evidencia.

##### 30.4. Responsabilidad

- iniciador;
- ejecutor;
- revisor;
- aprobador;
- custodio;
- receptor;
- corrector.

##### 30.5. Resultado

- completado;
- parcial;
- rechazado;
- pendiente;
- cancelado;
- revertido;
- compensado.

---

#### 31. Principios futuros de trazabilidad

1. Toda acción sensible deberá tener actor efectivo.
2. La cuenta compartida no deberá eliminar la identidad individual.
3. Todo evento deberá conservar contexto.
4. Toda corrección deberá relacionarse con el original.
5. Todo movimiento físico deberá tener efecto rastreable.
6. Toda diferencia deberá tener causa o estado pendiente.
7. Toda transferencia deberá registrar origen y destino.
8. Toda custodia deberá poder reconstruirse.
9. Todo acceso deberá relacionarse con estado laboral.
10. Todo cierre deberá demostrar el resultado final real.
11. La evidencia no deberá depender únicamente de WhatsApp.
12. Los registros no deberán borrarse silenciosamente.
13. La auditoría deberá ser consultable por persona, proceso, sede, recurso y tiempo.
14. Las aplicaciones deberán compartir identificadores canónicos.
15. La trazabilidad deberá sobrevivir a reintentos, errores y contingencias.

---

#### 32. Prioridad inicial de pérdidas

##### 32.1. `P0 — Inmediata`

- accesos activos después del retiro;
- pagos sin relación automática;
- diferencias de Caja;
- inventario sin movimientos completos;
- mermas sin lote y aprobación;
- retiros de Bodega sin registro;
- efectivo mal clasificado;
- identidad efectiva ausente en cuentas compartidas.

##### 32.2. `P1 — Alta`

- remisiones sin ID común;
- recepción sin confirmación;
- transferencias a Molka;
- compras sin versión consolidada;
- facturas sin relación integral;
- producción sin lote y destino;
- domicilios sin entrega final.

##### 32.3. `P2 — Media`

- turnos sin aceptación;
- inducción sin evidencia;
- Marketing sin versiones;
- soporte sin historial;
- mantenimiento sin expediente;
- Vaila Vainilla sin trazabilidad logística completa.

##### 32.4. `P3 — Estructural`

- canastas;
- Servicios Generales;
- activos menores;
- conocimiento informal.

La prioridad deberá validarse con criticidad, frecuencia, impacto y requisitos legales.

---

#### 33. Validaciones pendientes para `OPS-AUD-015`

| Tema           | Validación requerida                     |
| -------------- | ---------------------------------------- |
| Remisiones     | Quién prepara, modifica y recibe         |
| Producción     | Lotes, responsables y reportes           |
| Despacho       | Cambios de cantidad y destino            |
| Recepción      | Evidencia y responsable                  |
| Bodega         | Personas con acceso y práctica real      |
| Merma          | Campos, revisión y archivo               |
| Compras        | Autorización de cambios                  |
| Proveedores    | Rechazo y devolución                     |
| Caja           | Diferencias, anulaciones y reimpresiones |
| Datáfono       | Referencias y operadores                 |
| Contabilidad   | Identificadores y custodios              |
| Turnos         | Cambios, reemplazos y aceptación         |
| Propinas       | Hoja o herramienta de cálculo            |
| Nómina         | Revisión y aprobación                    |
| Accesos        | Todas las plataformas involucradas       |
| Vaila Vainilla | Guía, entrega, devolución y reembolso    |
| Marketing      | Versiones y aprobación                   |
| Mantenimiento  | Factura, garantía y activo               |
| Canastas       | Cantidad, propiedad y responsables       |

---

#### 34. Relación con `OPS-AUD-014`

`OPS-AUD-014` deberá determinar cómo se preserva o pierde la trazabilidad cuando fallan:

- internet;
- red;
- energía;
- dispositivo;
- impresora;
- aplicación;
- proveedor;
- vehículo;
- técnico;
- persona clave.

La contingencia no deberá crear un registro paralelo sin reconciliación posterior.

---

#### 35. Relación con `OPS-AUD-015`

`OPS-AUD-015` deberá:

- confirmar los hallazgos con responsables reales;
- corregir supuestos;
- identificar controles no observados;
- validar campos;
- confirmar propietarios;
- cerrar dudas;
- mantener brechas con tarea futura explícita.

No deberá intentar resolver todavía el diseño TO-BE.

---

#### 36. Relación con tareas posteriores

| Necesidad                                 | Destino                                                                 |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| Definir actor efectivo                    | `PROC-ACTOR-001` a `PROC-ACTOR-003`                                     |
| Mapear capacidad y propietario            | `CAP-MAP-001` a `CAP-MAP-015`                                           |
| Definir aplicación propietaria            | `CAP-SCOPE-001` a `CAP-SCOPE-019`                                       |
| Auditar cobertura tecnológica             | `CAP-COVER-001` a `CAP-COVER-012`                                       |
| Consolidar brechas                        | `GAP-CTRL-001`                                                          |
| Vincular brecha a paquete                 | `GAP-CTRL-006`                                                          |
| Diseñar flujo TO-BE                       | BLOQUE E2                                                               |
| Diseñar eventos, IDs y auditoría          | BLOQUE E3                                                               |
| Diseñar observabilidad, evidencia y colas | BLOQUE E4                                                               |
| Diseñar transición y reconciliación       | BLOQUE E5                                                               |
| Implementar identidad y autorización      | BLOQUES H, J, R0 y R1                                                   |
| Implementar dominios funcionales          | Roadmaps de NEXO, FOGO, ORIGO, PULSO, NUMERA, VISO y demás aplicaciones |

---

#### 37. Hallazgos transversales

##### 37.1. El problema principal es la falta de relación entre hechos

Los datos existen parcialmente, pero no están conectados.

##### 37.2. La memoria humana reconstruye la operación

La empresa depende de personas para explicar:

- qué pasó;
- por qué;
- quién estaba;
- dónde quedó.

##### 37.3. La identidad técnica no siempre representa a la persona

Las cuentas compartidas degradan toda auditoría posterior.

##### 37.4. El físico prevalece sobre el sistema

Cuando existe contradicción, se confía en:

- producto;
- conteo;
- dinero;
- factura;
- observación.

##### 37.5. La corrección no siempre conserva el error original

Esto impide analizar recurrencia y responsabilidad.

##### 37.6. La trazabilidad termina antes que el proceso real

Especialmente en:

- domicilios;
- Vaila Vainilla;
- soporte;
- mantenimiento;
- remisiones.

##### 37.7. La responsabilidad puede existir en la práctica y estar ausente del registro

Una persona puede asumir el problema, pero el sistema no demuestra que era responsable.

---

#### 38. Decisiones propuestas

1. La trazabilidad se evaluará por actor, contexto, tiempo, causalidad, estado, evidencia y responsabilidad.
2. Un mensaje o documento aislado no constituye trazabilidad integral.
3. Las remisiones carecen de identificador común de extremo a extremo.
4. Producción, carga y recepción no están relacionadas formalmente.
5. Los retiros de Bodega presentan pérdida severa de identidad y cantidad.
6. El inventario digital no puede explicar todas las diferencias físicas.
7. Las mermas carecen de información crítica y segregación suficiente.
8. Las transferencias a Molka carecen de trazabilidad sanitaria y de inventario.
9. Compras, recepción, factura y Contabilidad no comparten un identificador integral.
10. Las cuentas compartidas impiden atribuir acciones a personas.
11. El datáfono y Makos no vinculan automáticamente pago, operador y factura.
12. La diferencia de Caja carece de procedimiento documentado confirmado.
13. El retiro registrado como gasto pierde significado y custodia.
14. Las sustituciones de venta no quedan vinculadas al producto original.
15. Las comandas no registran estados de ejecución y entrega.
16. Rappi, ManyChat y Makos no comparten identificadores.
17. Los domicilios no tienen cierre final rutinario.
18. Turnos y cambios no conservan aceptación e historial completo.
19. Propinas no conservan cálculo verificable.
20. La contratación e inducción no conservan evaluación suficiente.
21. El estado laboral y el acceso tecnológico no están sincronizados.
22. Marketing carece de brief, versión y aprobación estructurados.
23. Vaila Vainilla no tiene trazabilidad logística integral confirmada.
24. Soporte y mantenimiento carecen de historial por incidente o activo.
25. Canastas y activos menores no tienen custodia rastreable.
26. El TO-BE deberá preservar evento original, corrección y relación causal.
27. Ninguna decisión autoriza tablas, eventos, logs, permisos, código, migraciones o cambios en Supabase.

---

#### 39. Criterios de aceptación

`OPS-AUD-013` podrá aprobarse cuando se confirme que:

- se distinguen pérdidas de trazabilidad, información y responsabilidad;
- se cubren los procesos críticos;
- se identifican pérdidas de actor, contexto, tiempo, causalidad, versión, cantidad, motivo, custodia, estado y evidencia;
- se registran pérdidas producidas por cuentas compartidas;
- se identifican cierres aparentes;
- se identifican responsabilidades ausentes o concentradas;
- se clasifican prioridades;
- cada incertidumbre queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se ha diseñado el modelo TO-BE;
- no se ha autorizado implementación.

---

#### 40. Resultado y continuidad

Con la aprobación de `OPS-AUD-013` quedará establecida la línea base inicial de:

- pérdidas de identidad;
- pérdidas de contexto;
- pérdidas temporales;
- pérdidas de causalidad;
- pérdidas de versión;
- pérdidas de cantidades;
- pérdidas de motivos;
- pérdidas de custodia;
- pérdidas de estado;
- pérdidas de evidencia;
- pérdidas de responsabilidad;
- cierres aparentes;
- prioridades de trazabilidad.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-014
— Identificar contingencias por caída de red, energía, dispositivo o proveedor
```

`OPS-AUD-014` deberá utilizar este inventario para documentar cómo una contingencia afecta continuidad, evidencia, reconciliación y responsabilidad, sin diseñar todavía la solución técnica definitiva.



### ✅ OPS-AUD-014 — Identificar contingencias por caída de red, energía, dispositivo o proveedor

**Estado:** APROBADO  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de continuidad operativa, respuestas manuales y vacíos ante indisponibilidad  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-013`  
**Validación pendiente:** `OPS-AUD-015` para procedimientos, responsables, autonomía, equipos de respaldo o tiempos no suficientemente confirmados

---

#### 1. Propósito

Identificar qué ocurre actualmente cuando una dependencia necesaria para operar deja de estar disponible, funciona de manera degradada o responde fuera del tiempo requerido.

La tarea cubre contingencias asociadas con:

- internet;
- red local;
- energía;
- aplicaciones;
- Supabase y servicios en nube;
- computadores;
- tablets;
- celulares;
- impresoras;
- datáfonos;
- equipos de producción;
- refrigeración y congelación;
- vehículo;
- conductor;
- proveedores;
- mensajerías;
- bancos;
- técnicos;
- repuestos;
- personas clave;
- documentos y datos necesarios.

Para cada contingencia deberán identificarse:

- evento de falla;
- proceso afectado;
- actor que detecta;
- respuesta actual;
- alternativa manual;
- datos que se dejan de registrar;
- evidencia que se conserva;
- riesgo de duplicación;
- necesidad de conciliación posterior;
- condición de retorno;
- responsable de cierre;
- vacíos sin procedimiento confirmado.

```text
DEPENDENCIA FALLA
→ OPERACIÓN SE DETIENE O DEGRADA
→ SE ACTIVA RESPUESTA MANUAL O IMPROVISADA
→ SE ACUMULAN OPERACIONES PENDIENTES
→ DEPENDENCIA REGRESA
→ DEBERÍA EXISTIR RECONCILIACIÓN
```

Esta tarea documenta el estado actual.

No diseña todavía:

- modo offline;
- sincronización;
- colas;
- reintentos;
- respaldo;
- recuperación automática;
- RTO;
- RPO;
- redundancia;
- UPS;
- generadores;
- contratos de disponibilidad;
- procedimientos TO-BE;
- implementación técnica.

---

#### 2. Principio obligatorio

Una contingencia válida no puede consistir únicamente en “seguir trabajando como sea”.

Debe distinguirse entre:

```text
CONTINUIDAD
→ mantener la capacidad empresarial mínima

DEGRADACIÓN CONTROLADA
→ operar con alcance reducido y reglas explícitas

REGISTRO TEMPORAL
→ conservar datos para carga posterior

RECUPERACIÓN
→ restablecer la dependencia

RECONCILIACIÓN
→ incorporar lo ocurrido durante la caída

CIERRE
→ demostrar que no quedaron operaciones huérfanas
```

Actualmente varios procesos poseen alternativas manuales, pero no existe evidencia de que incluyan todas estas etapas.

---

#### 3. Definiciones canónicas

##### 3.1. Caída total

La dependencia queda completamente indisponible.

##### 3.2. Degradación

La dependencia funciona parcialmente, con lentitud o resultados intermitentes.

##### 3.3. Contingencia

Práctica temporal usada para continuar total o parcialmente.

##### 3.4. Operación manual temporal

Registro o ejecución fuera de la aplicación habitual.

##### 3.5. Acumulación pendiente

Operaciones realizadas o solicitadas que no han sido incorporadas al sistema.

##### 3.6. Recuperación

Restablecimiento técnico o físico de la dependencia.

##### 3.7. Reconciliación posterior

Comparación e incorporación de lo ocurrido durante la contingencia.

##### 3.8. Retorno controlado

Decisión explícita de abandonar el modo de contingencia y volver al flujo ordinario.

##### 3.9. Pérdida de operación

Acción que no pudo ejecutarse ni conservarse.

##### 3.10. Punto único de falla

Dependencia sin sustituto o alternativa suficiente.

---

#### 4. Clasificación de contingencias

| Código     | Tipo                     | Definición                                                |
| ---------- | ------------------------ | --------------------------------------------------------- |
| `CON-NET`  | Internet                 | Caída o degradación de conexión externa                   |
| `CON-LAN`  | Red local                | Falla de Wi-Fi, LAN, router, switch o direccionamiento    |
| `CON-ENE`  | Energía                  | Corte, fluctuación o pérdida eléctrica                    |
| `CON-APP`  | Aplicación               | Sistema no abre, no responde o devuelve errores           |
| `CON-DAT`  | Datos                    | Catálogo, inventario, sesión o configuración incorrectos  |
| `CON-DEV`  | Dispositivo              | Computador, tablet, celular o periférico indisponible     |
| `CON-PRN`  | Impresión                | Impresora, papel, cola o comunicación de impresión fallan |
| `CON-PAY`  | Pago                     | Datáfono, banco, transferencia o confirmación fallan      |
| `CON-COLD` | Frío                     | Refrigeración o congelación dejan de proteger producto    |
| `CON-EQP`  | Equipo operativo         | Horno, empacadora u otro equipo no funciona               |
| `CON-LOG`  | Logística                | Vehículo, conductor, ruta o canasta indisponibles         |
| `CON-SUP`  | Proveedor                | No entrega, entrega tarde o no tiene disponibilidad       |
| `CON-EXT`  | Plataforma externa       | Rappi, Shopify, ManyChat, red social o mensajería fallan  |
| `CON-PER`  | Persona clave            | Responsable crítico no está disponible                    |
| `CON-DOC`  | Documento                | Factura, cierre, guía o soporte no está disponible        |
| `CON-SEC`  | Acceso                   | Usuario, sesión, permiso o cuenta impiden operar          |
| `CON-INC`  | Incidente no clasificado | Evento que requiere evaluación manual                     |

---

#### 5. Estados de respuesta actual

| Estado                   | Significado                                   |
| ------------------------ | --------------------------------------------- |
| `MANUAL_CONFIRMADA`      | Existe una práctica manual conocida           |
| `DEGRADADA`              | Se continúa solo parcialmente                 |
| `IMPROVISADA`            | La respuesta depende del criterio del momento |
| `DEPENDIENTE_DE_PERSONA` | Solo una persona sabe resolver                |
| `PAPEL_TRANSITORIO`      | Se utiliza documento físico temporal          |
| `CANAL_ALTERNO`          | Se utiliza otra herramienta o medio           |
| `ESPERA`                 | El proceso queda detenido hasta recuperación  |
| `REPROGRAMACIÓN`         | Se aplaza para otra ventana                   |
| `SIN_RECONCILIACIÓN`     | No existe carga posterior confirmada          |
| `NO_DEFINIDA`            | No se identificó respuesta consistente        |
| `POR_VALIDAR`            | Requiere confirmación en `OPS-AUD-015`        |

---

#### 6. Escala de impacto

| Nivel            | Impacto                                            |
| ---------------- | -------------------------------------------------- |
| `IC1 — MENOR`    | Afecta comodidad o eficiencia                      |
| `IC2 — MODERADO` | Genera trabajo manual y demora controlable         |
| `IC3 — ALTO`     | Afecta un proceso o área crítica                   |
| `IC4 — CRÍTICO`  | Detiene venta, producción, logística o pago        |
| `IC5 — SEVERO`   | Riesgo sanitario, financiero, legal o de seguridad |

---

#### 7. Inventario maestro de contingencias

| Código    | Dependencia                   | Procesos afectados                                               | Respuesta actual conocida                                        | Impacto   | Estado                   |
| --------- | ----------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- | --------- | ------------------------ |
| `CNT-001` | Internet                      | WhatsApp, Rappi, ManyChat, Shopify, VISO, ANIMA, Vento OS, banca | Uso parcial de datos móviles o espera, no confirmado globalmente | `IC4`     | `POR_VALIDAR`            |
| `CNT-002` | Red local                     | Makos, impresoras LAN, computadores, tablets                     | Revisión de red, cambio de conexión o comunicación verbal        | `IC4`     | `IMPROVISADA`            |
| `CNT-003` | Energía                       | Venta, producción, frío, red, impresión, iluminación             | Operación se detiene o degrada; respaldo no confirmado           | `IC5`     | `POR_VALIDAR`            |
| `CNT-004` | Makos                         | Mesas, pedidos, Caja, facturación, comandas                      | Comunicación manual probable; procedimiento formal no confirmado | `IC5`     | `POR_VALIDAR`            |
| `CNT-005` | Impresora de comandas         | Cocina, Bar, Barra                                               | Consultar pantalla, reimprimir o comunicar verbalmente           | `IC4`     | `POR_VALIDAR`            |
| `CNT-006` | Impresora de factura          | Caja y cliente                                                   | Espera, reintento o impresión posterior                          | `IC4`     | `POR_VALIDAR`            |
| `CNT-007` | Computador de Caja            | Makos, Rappi, ManyChat, facturación                              | Uso de otro dispositivo no confirmado                            | `IC5`     | `NO_DEFINIDA`            |
| `CNT-008` | Tablet de Servicio            | Toma de pedidos                                                  | Uso de otro dispositivo o registro verbal                        | `IC3`     | `IMPROVISADA`            |
| `CNT-009` | Datáfono                      | Pagos con tarjeta                                                | Solicitar efectivo o transferencia; flujo no confirmado          | `IC5`     | `POR_VALIDAR`            |
| `CNT-010` | VISO                          | Programación y reportes                                          | Información puede comunicarse por otro canal                     | `IC3`     | `CANAL_ALTERNO` probable |
| `CNT-011` | ANIMA                         | Consulta de turno y check-in                                     | Comunicación manual y corrección posterior no confirmadas        | `IC4`     | `POR_VALIDAR`            |
| `CNT-012` | Vento OS / Supabase           | Remisiones, inventario y pruebas                                 | Papel, Excel o procesos anteriores en paralelo                   | `IC4`     | `PAPEL_TRANSITORIO`      |
| `CNT-013` | WhatsApp                      | Remisiones, compras, soporte y coordinación                      | Llamada, comunicación verbal o espera                            | `IC4`     | `IMPROVISADA`            |
| `CNT-014` | Excel o archivo               | Solicitud de remisión                                            | Reconstrucción manual o mensaje libre                            | `IC3`     | `IMPROVISADA`            |
| `CNT-015` | Cámara fría o congelación     | Conservación e inventario                                        | Reubicación o evaluación manual no documentada                   | `IC5`     | `NO_DEFINIDA`            |
| `CNT-016` | Horno de Panadería            | Producción                                                       | Reprogramar, priorizar o reducir producción                      | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-017` | Hornos de Saudo               | Pizzas y servicio                                                | Cola, retraso o reducción de capacidad                           | `IC4`     | `DEGRADADA`              |
| `CNT-018` | Empaque al vacío              | Cocina Caliente                                                  | Reprogramación o método alterno no confirmado                    | `IC4`     | `POR_VALIDAR`            |
| `CNT-019` | Vehículo                      | Remisiones y abastecimiento                                      | Reprogramar o buscar alternativa no confirmada                   | `IC5`     | `NO_DEFINIDA`            |
| `CNT-020` | Conductor                     | Apertura, alistamiento, transporte, canastas                     | Sustituto no confirmado                                          | `IC5`     | `NO_DEFINIDA`            |
| `CNT-021` | Canastas                      | Alistamiento y transporte                                        | Reutilizar disponibles o adaptar empaque                         | `IC3`     | `IMPROVISADA`            |
| `CNT-022` | Proveedor sin stock           | Compras y producción                                             | Aceptar parcial, esperar o buscar otro proveedor                 | `IC4`     | `MANUAL_CONFIRMADA`      |
| `CNT-023` | Proveedor llega tarde         | Producción                                                       | Reducir, priorizar o reprogramar producción                      | `IC4`     | `MANUAL_CONFIRMADA`      |
| `CNT-024` | Proveedor no entrega          | Producción y venta                                               | Compra urgente o producción parcial                              | `IC4`     | `IMPROVISADA`            |
| `CNT-025` | Técnico no disponible         | Mantenimiento                                                    | Esperar, buscar otro o operar parcialmente                       | `IC3-IC5` | `MANUAL_CONFIRMADA`      |
| `CNT-026` | Repuesto no disponible        | Mantenimiento                                                    | Espera o solución temporal                                       | `IC3-IC5` | `MANUAL_CONFIRMADA`      |
| `CNT-027` | Rappi                         | Pedidos externos                                                 | Canal no disponible; ventas por otros canales                    | `IC3`     | `DEGRADADA`              |
| `CNT-028` | ManyChat                      | Domicilios directos                                              | WhatsApp u otro canal, no confirmado                             | `IC3`     | `POR_VALIDAR`            |
| `CNT-029` | Shopify                       | Vaila Vainilla                                                   | Gestión por canal alterno no confirmada                          | `IC4`     | `NO_DEFINIDA`            |
| `CNT-030` | Mensajería                    | Domicilios y Vaila                                               | Espera, reasignación o reprogramación                            | `IC3-IC4` | `IMPROVISADA`            |
| `CNT-031` | Banco / portal nómina         | Pagos                                                            | Espera y reintento posterior                                     | `IC5`     | `POR_VALIDAR`            |
| `CNT-032` | Cuenta o permiso              | Aplicaciones internas                                            | Solicitar soporte a Operaciones                                  | `IC3-IC5` | `DEPENDIENTE_DE_PERSONA` |
| `CNT-033` | Gerente general               | Compras, dinero, turnos, propinas, mantenimiento                 | Decisiones se acumulan o escalan informalmente                   | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-034` | Jefe de Operaciones           | Soporte, accesos, infraestructura                                | Espera o resolución parcial por terceros                         | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-035` | Angélica                      | Repostería, Tortas y Galletería                                  | Redistribución por experiencia del equipo                        | `IC3-IC4` | `POR_VALIDAR`            |
| `CNT-036` | Valentina                     | Tortas                                                           | Reprogramación o sustituto no confirmado                         | `IC3`     | `POR_VALIDAR`            |
| `CNT-037` | Documento físico              | Recepción, Contabilidad, Caja                                    | Buscar copia o reconstruir                                       | `IC4-IC5` | `IMPROVISADA`            |
| `CNT-038` | Datos maestros incorrectos    | Inventario, compras, permisos y reportes                         | Corrección manual o bloqueo del proceso                          | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-039` | Sesión compartida o bloqueada | Operación en dispositivo                                         | Cambiar cuenta, pedir ayuda o seguir con sesión existente        | `IC4`     | `IMPROVISADA`            |
| `CNT-040` | Cámaras                       | Seguridad y revisión posterior                                   | Sin evidencia visual hasta recuperación                          | `IC3-IC4` | `ESPERA`                 |

---

#### 8. Caída de internet

##### 8.1. Procesos afectados

- WhatsApp;
- Rappi;
- ManyChat;
- Shopify;
- VISO;
- ANIMA;
- Vento OS;
- banca;
- correo;
- soporte remoto;
- redes sociales.

##### 8.2. Respuesta actual

No existe un procedimiento empresarial único confirmado.

Posibles respuestas observables o razonables:

- usar datos móviles;
- cambiar de red;
- llamar;
- comunicar verbalmente;
- esperar;
- registrar en papel;
- ejecutar después.

Solo deberán considerarse prácticas confirmadas cuando se validen en `OPS-AUD-015`.

##### 8.3. Riesgos

- solicitudes no enviadas;
- pedidos externos no vistos;
- check-ins no registrados;
- pagos no confirmados;
- altas o bajas no ejecutadas;
- operaciones duplicadas cuando vuelve la conexión;
- pérdida del orden temporal;
- falta de evidencia.

##### 8.4. Reconciliación necesaria

Después de la recuperación debería verificarse:

- mensajes pendientes;
- pedidos recibidos durante la caída;
- check-ins faltantes;
- transacciones;
- remisiones;
- operaciones en papel;
- duplicados.

No existe un procedimiento transversal confirmado.

---

#### 9. Falla de red local

##### 9.1. Procesos afectados

- impresoras LAN;
- computadores;
- tablets;
- Makos;
- dispositivos compartidos;
- comunicación con periféricos.

##### 9.2. Estado actual

Los incidentes de impresoras y direccionamiento se resuelven técnicamente caso por caso.

La operación puede recurrir a:

- revisar IP;
- cambiar red;
- reiniciar;
- reconectar;
- imprimir desde otro medio;
- comunicar verbalmente.

##### 9.3. Riesgo específico

La red puede parecer disponible para internet y seguir sin comunicar dispositivos internos.

Por tanto:

```text
INTERNET FUNCIONA
≠
IMPRESORA O DISPOSITIVO LAN FUNCIONA
```

##### 9.4. Pérdida de evidencia

Los intentos, cambios de IP y soluciones no quedan registrados en un historial técnico.

---

#### 10. Corte o fluctuación de energía

##### 10.1. Procesos afectados

- frío;
- producción;
- hornos;
- computadores;
- red;
- impresoras;
- datáfonos;
- iluminación;
- cámaras;
- aplicaciones;
- venta.

##### 10.2. Riesgos

- detención inmediata;
- pérdida de producto;
- temperatura fuera de rango;
- producción incompleta;
- masa o preparación afectada;
- venta no registrada;
- dispositivo apagado;
- corrupción o pérdida de datos locales;
- interrupción de cadena de frío.

##### 10.3. Estado actual

No se confirmó:

- generador;
- UPS por sede;
- autonomía;
- prioridad de circuitos;
- protocolo de temperatura;
- traslado de producto;
- responsable;
- criterio de descarte;
- registro del incidente.

##### 10.4. Severidad

`IC5 — SEVERO` cuando afecta:

- refrigeración;
- congelación;
- inocuidad;
- Caja;
- facturación;
- producción crítica.

---

#### 11. Caída de Makos

##### 11.1. Procesos afectados

- mesas;
- pedidos;
- adiciones;
- comandas;
- Caja;
- medios de pago;
- facturación;
- cierres;
- reportes;
- transcripción de Rappi y domicilios.

##### 11.2. Respuesta actual no confirmada

No existe evidencia suficiente de un procedimiento único para operar sin Makos.

Podrían ocurrir:

- pedidos verbales;
- notas;
- espera;
- cálculo manual;
- registro posterior;
- emisión posterior de factura.

Estas opciones no deberán declararse aprobadas hasta `OPS-AUD-015`.

##### 11.3. Riesgos

- pedidos perdidos;
- cuentas incompletas;
- precios incorrectos;
- duplicación al cargar después;
- impuestos o factura incorrectos;
- cierre imposible;
- producto preparado sin venta registrada.

##### 11.4. Retorno

La recuperación requeriría distinguir:

- pedido ya preparado;
- pedido entregado;
- pago recibido;
- factura pendiente;
- operación ya registrada después.

No existe conciliación confirmada.

---

#### 12. Falla de impresión

##### 12.1. Comandas

Una impresora puede fallar por:

- energía;
- red;
- IP;
- papel;
- cola;
- driver;
- configuración;
- aplicación.

Respuesta probable:

- revisar Makos;
- reimprimir;
- avisar verbalmente;
- usar otra estación.

##### 12.2. Facturas y resúmenes

La falla afecta:

- presentación de cuenta;
- entrega de factura;
- cierre;
- soporte.

##### 12.3. Riesgos

- pedido no preparado;
- duplicado al reimprimir;
- estación equivocada;
- cliente esperando;
- factura pendiente;
- pérdida de orden de llegada.

##### 12.4. Estado

El procedimiento exacto debe validarse en `OPS-AUD-015`.

---

#### 13. Falla de dispositivos operativos

##### 13.1. Computador de Caja

Concentra:

- Makos;
- Rappi;
- ManyChat;
- facturación.

No se confirmó un equipo alterno preparado.

##### 13.2. Tablet de Servicio

Puede sustituirse por otro dispositivo si existe disponibilidad y sesión, pero no se ha validado una regla formal.

##### 13.3. Celular

La pérdida, descarga o falta de conectividad afecta:

- WhatsApp;
- fotografías;
- pedidos;
- coordinación;
- autenticación.

##### 13.4. Dispositivo compartido

Cuando falla, puede bloquear a varias personas y procesos simultáneamente.

##### 13.5. Riesgo de retorno

Cambiar de dispositivo puede alterar:

- cuenta;
- contexto;
- sede;
- área;
- actor efectivo;
- cola pendiente.

---

#### 14. Falla de VISO, ANIMA o acceso laboral

##### 14.1. VISO

Puede impedir:

- publicar;
- consultar;
- descargar reportes.

##### 14.2. ANIMA

Puede impedir:

- consultar turno;
- hacer check-in;
- recibir notificación.

##### 14.3. Cuenta o permiso

El trabajador puede estar presente, pero técnicamente bloqueado.

##### 14.4. Respuesta actual

Depende de contactar al Jefe de Operaciones o utilizar comunicación informal.

No se confirmó:

- registro manual de asistencia;
- evidencia aceptada;
- corrección posterior;
- aprobador;
- tiempo máximo.

##### 14.5. Riesgo

La falta técnica puede confundirse con:

- retraso;
- ausencia;
- incumplimiento;
- falta de permiso.

---

#### 15. Caída de Vento OS o Supabase

##### 15.1. Estado actual

Vento OS todavía opera parcialmente y en pruebas en varios procesos.

La contingencia conocida ha consistido en mantener:

- Excel;
- WhatsApp;
- hojas físicas;
- flujo anterior.

##### 15.2. Riesgo

La coexistencia puede crear:

- versiones distintas;
- operaciones duplicadas;
- movimientos parciales;
- inventario inválido;
- falsa sensación de cierre.

##### 15.3. Condición obligatoria futura

Una contingencia de Vento OS deberá registrar después:

- operación temporal;
- actor;
- hora real;
- origen;
- referencia;
- reconciliación;
- duplicado detectado;
- cierre.

No se implementa en esta tarea.

---

#### 16. Falla de datáfono o banco

##### 16.1. Procesos afectados

- pagos con tarjeta;
- cierre de venta;
- conciliación;
- experiencia del cliente.

##### 16.2. Alternativas probables

- efectivo;
- transferencia;
- otro datáfono;
- espera.

No se confirmó qué alternativas están autorizadas por sede.

##### 16.3. Riesgos

- comprobante no vinculado;
- transferencia sin confirmar;
- doble cobro;
- venta entregada sin pago;
- medio registrado incorrectamente;
- reverso posterior.

##### 16.4. Conciliación

Debería compararse:

```text
VENTA
↔ TRANSACCIÓN BANCARIA
↔ MEDIO REGISTRADO
↔ FACTURA
```

No existe flujo de contingencia confirmado.

---

#### 17. Falla de frío

##### 17.1. Dependencias afectadas

- cámara fría;
- congeladores;
- refrigeradores;
- preparaciones;
- insumos;
- productos terminados;
- vida útil.

##### 17.2. Riesgos

- pérdida de cadena de frío;
- deterioro;
- merma;
- riesgo sanitario;
- suspensión de despacho;
- reclasificación de producto;
- pérdida financiera.

##### 17.3. Estado actual

No se confirmó un protocolo para:

- detectar;
- medir temperatura;
- registrar hora;
- trasladar;
- aislar;
- evaluar;
- aprobar uso;
- descartar;
- informar.

##### 17.4. Severidad

`IC5 — SEVERO`.

La decisión no puede depender únicamente de percepción cuando exista riesgo de inocuidad.

---

#### 18. Falla de equipos de producción

##### 18.1. Panadería

La falla de horno o equipo puede impedir cumplir ciclos ya iniciados.

Respuesta actual:

- reprogramar;
- priorizar;
- producir menos;
- buscar reparación.

##### 18.2. Saudo

Con dos hornos, la pérdida de uno reduce capacidad.

```text
2 HORNOS
→ 1 HORNO DISPONIBLE
→ OPERACIÓN DEGRADADA
→ COLA Y DEMORA
```

##### 18.3. Cocina Caliente

Una falla de empacado, cocción o conservación puede bloquear producción o almacenamiento.

##### 18.4. Estado de contingencia

No se confirmó:

- equipo sustituto;
- capacidad degradada permitida;
- criterios de suspensión;
- comunicación al cliente o sede;
- registro de producción afectada.

---

#### 19. Falla de vehículo o indisponibilidad del conductor

##### 19.1. Vehículo

Afecta:

- remisiones;
- abastecimiento;
- canastas;
- entregas;
- retorno.

##### 19.2. Conductor

Además del transporte, el conductor participa en:

- apertura;
- alistamiento;
- conteo;
- clasificación;
- carga;
- cierre físico.

##### 19.3. Riesgo

La dependencia no se limita al manejo del vehículo.

```text
CONDUCTOR AUSENTE
→ APERTURA Y ALISTAMIENTO TAMBIÉN AFECTADOS
```

##### 19.4. Estado actual

No se confirmó:

- sustituto;
- segundo conductor;
- vehículo alterno;
- servicio contratado;
- transferencia documentada de responsabilidades;
- prioridad de entregas.

---

#### 20. Escasez de canastas o empaques

##### 20.1. Causas

- no retorno;
- suciedad;
- humedad;
- pérdida;
- uso en otra sede;
- daño;
- proveedor propietario.

##### 20.2. Respuesta actual

- buscar disponibles;
- lavar;
- reutilizar;
- adaptar otro soporte.

##### 20.3. Riesgos

- mezcla de destinos;
- daño de producto;
- retraso;
- contaminación;
- pérdida de custodia.

No existe un inventario que permita anticipar el bloqueo.

---

#### 21. Falla de proveedor

##### 21.1. Sin disponibilidad

El proveedor informa cantidad parcial o inexistencia.

Respuesta:

- aceptar parcial;
- esperar;
- buscar otro;
- cambiar producto;
- reducir producción.

##### 21.2. Entrega tardía

La producción puede:

- iniciar tarde;
- reducir cantidades;
- cambiar prioridades;
- compensar después.

##### 21.3. No entrega

Puede generar:

- compra urgente;
- remisión parcial;
- agotado;
- pérdida de venta.

##### 21.4. Dependencia de conversación

La contingencia se resuelve por WhatsApp y criterio de Gerencia.

No existe una orden actualizada y una razón estructurada confirmadas.

##### 21.5. Riesgo de sustitución

Cambiar proveedor o presentación puede afectar:

- receta;
- costo;
- unidad;
- calidad;
- inventario;
- recepción.

---

#### 22. Falla de plataformas externas

##### 22.1. Rappi

La sede puede continuar con mesas y otros canales, pero pierde ventas del canal.

Debe distinguirse:

- pedido no recibido;
- pedido recibido antes de la caída;
- cancelación;
- estado pendiente.

##### 22.2. ManyChat

Puede perderse el canal de domicilio directo.

No se confirmó migración temporal a WhatsApp.

##### 22.3. Shopify

Vaila Vainilla puede dejar de recibir o gestionar pedidos.

No existe contingencia confirmada para:

- pedido recibido pero no visible;
- pago confirmado sin preparación;
- recuperación posterior;
- duplicado.

##### 22.4. Redes sociales

Marketing y reclutamiento pueden degradarse sin detener la operación principal.

---

#### 23. Falla de mensajería

##### 23.1. Domicilios

Puede ocurrir:

- demora en asignación;
- mensajero no llega;
- rechazo;
- pérdida;
- entrega fallida.

##### 23.2. Vaila Vainilla

La acumulación de paquetes depende de la recolección.

##### 23.3. Respuesta actual

Se resuelve caso por caso.

No se confirmó:

- proveedor alterno;
- reasignación;
- tiempo máximo;
- notificación automática;
- prueba de entrega;
- devolución.

---

#### 24. Indisponibilidad de técnico o repuesto

##### 24.1. Técnico

La gerente general:

- espera;
- busca otro;
- adapta la operación.

##### 24.2. Repuesto

Puede producir:

- reparación temporal;
- equipo detenido;
- compra urgente;
- espera.

##### 24.3. Riesgos

- solución no documentada;
- equipo operando degradado;
- reincidencia;
- pérdida de garantía;
- dependencia de una relación personal.

---

#### 25. Indisponibilidad de personas clave

##### 25.1. Gerente general

Puede retrasar:

- compras;
- pagos;
- turnos;
- propinas;
- mantenimiento;
- decisiones.

##### 25.2. Jefe de Operaciones

Puede retrasar:

- soporte;
- accesos;
- infraestructura;
- desarrollo;
- recepción;
- Bodega.

##### 25.3. Conductor

Puede detener:

- apertura;
- alistamiento;
- transporte;
- canastas.

##### 25.4. Responsables productivos

Puede afectar:

- planificación;
- distribución;
- priorización;
- conocimiento técnico.

##### 25.5. Estado actual

No existe una matriz confirmada de:

- sustitutos;
- autoridad temporal;
- entrega de contexto;
- accesos;
- responsabilidades mínimas.

---

#### 26. Pérdida de documentos o información

##### 26.1. Factura

Sin factura puede fallar:

- recepción;
- pago;
- Contabilidad;
- conciliación.

##### 26.2. Cierre

Sin cierre impreso o accesible se dificulta entregar efectivo.

##### 26.3. Solicitud

Sin Excel o captura, producción no conoce necesidad.

##### 26.4. Guía

Sin guía, Vaila Vainilla puede perder trazabilidad logística.

##### 26.5. Respuesta actual

- buscar;
- pedir copia;
- reconstruir;
- consultar mensajes;
- esperar.

No existe un procedimiento transversal de recuperación documental.

---

#### 27. Falla de datos maestros o configuración

Una aplicación puede estar disponible y aun así no permitir operar porque faltan o son incorrectos:

- productos;
- presentaciones;
- unidades;
- ubicaciones;
- sedes;
- áreas;
- usuarios;
- permisos;
- impresoras;
- proveedores.

```text
SISTEMA DISPONIBLE
+
DATOS INVÁLIDOS
→ CAPACIDAD OPERATIVA INDISPONIBLE
```

Respuesta actual:

- contactar al Jefe de Operaciones;
- corregir manualmente;
- usar canal alterno;
- posponer.

---

#### 28. Contingencia y trazabilidad

Toda contingencia manual puede perder:

- actor;
- hora real;
- sede;
- producto;
- cantidad;
- precio;
- medio de pago;
- estado;
- motivo;
- evidencia.

Los principales riesgos son:

1. no registrar;
2. registrar dos veces;
3. registrar con hora de carga en vez de hora real;
4. perder el orden;
5. no vincular con el proceso original;
6. no identificar quién autorizó;
7. cerrar sin reconciliar.

---

#### 29. Registro temporal versus fuente paralela

##### 29.1. Registro temporal válido

Debe existir solo durante la caída y contener lo necesario para carga posterior.

##### 29.2. Fuente paralela peligrosa

Permanece activa sin reconciliación ni retiro.

Ejemplo:

```text
PAPEL
+
EXCEL
+
WHATSAPP
+
VENTO OS
→ TODOS PARECEN VÁLIDOS
```

##### 29.3. Regla futura

La contingencia deberá definir:

- cuándo inicia;
- quién la activa;
- qué formato se usa;
- qué número o referencia genera;
- quién custodia;
- cuándo termina;
- quién carga;
- cómo se detecta duplicado;
- quién certifica cierre.

---

#### 30. Conciliación posterior mínima

Después de una contingencia deberá poder verificarse:

##### 30.1. Operaciones

- solicitudes;
- pedidos;
- ventas;
- pagos;
- recepciones;
- retiros;
- producción;
- remisiones;
- mermas;
- transferencias.

##### 30.2. Identidad

- quién ejecutó;
- bajo qué contexto;
- con qué autorización.

##### 30.3. Tiempo

- hora real;
- hora de registro;
- duración de la caída.

##### 30.4. Resultado

- cargado;
- duplicado;
- rechazado;
- pendiente;
- corregido.

Esta capacidad corresponde al diseño futuro, no a esta tarea.

---

#### 31. Puntos actuales sin contingencia suficiente

1. caída total de Makos;
2. caída prolongada de energía;
3. pérdida de frío;
4. falla del computador principal de Caja;
5. ausencia del conductor;
6. vehículo fuera de servicio;
7. indisponibilidad de Shopify;
8. caída simultánea de internet y datos móviles;
9. corrección posterior de check-ins offline;
10. pago con tarjeta sin datáfono;
11. conciliación de ventas manuales;
12. reposición de comandas perdidas;
13. operación de inventario durante caída;
14. falla de Supabase;
15. recuperación de documentos perdidos;
16. proveedor crítico sin sustituto;
17. técnico y repuesto no disponibles;
18. baja de acceso cuando Operaciones no está disponible;
19. respaldo de programación de turnos;
20. sustitución formal de personas clave.

Todos quedan vinculados a `OPS-AUD-015` y a las tareas posteriores correspondientes.

---

#### 32. Matriz de continuidad por dominio

| Dominio        | Continuidad actual              | Reconciliación confirmada | Riesgo |
| -------------- | ------------------------------- | ------------------------- | ------ |
| Remisiones     | Excel, WhatsApp y papel         | No                        | Alto   |
| Inventario     | Físico prevalece                | No                        | Severo |
| Producción     | Experiencia y comunicación      | No                        | Alto   |
| Venta          | Alternativa no confirmada       | No                        | Severo |
| Caja           | Papel y conteo                  | Parcial                   | Severo |
| Pagos          | Medios alternos probables       | No                        | Severo |
| Turnos         | Comunicación informal           | No                        | Alto   |
| Check-in       | Corrección posterior probable   | No                        | Alto   |
| Compras        | WhatsApp y proveedores alternos | Parcial                   | Alto   |
| Contabilidad   | Soportes físicos                | Posterior                 | Severo |
| Vaila Vainilla | No confirmada                   | No                        | Alto   |
| Soporte        | Resolución manual               | No                        | Alto   |
| Mantenimiento  | Espera o adaptación             | No                        | Alto   |
| Accesos        | Dependencia de Operaciones      | No                        | Severo |

---

#### 33. Prioridad inicial

##### 33.1. `P0 — Continuidad vital`

- energía;
- frío;
- Caja y pagos;
- Makos;
- acceso y seguridad;
- inventario;
- vehículo y conductor;
- respaldo de datos esenciales.

##### 33.2. `P1 — Continuidad operativa`

- remisiones;
- producción;
- compras;
- proveedores;
- impresoras;
- red;
- internet;
- VISO y ANIMA.

##### 33.3. `P2 — Continuidad comercial`

- Rappi;
- ManyChat;
- Shopify;
- mensajerías;
- Marketing.

##### 33.4. `P3 — Continuidad de soporte`

- mantenimiento;
- soporte técnico;
- documentación;
- canastas;
- activos menores.

La prioridad deberá validarse por impacto, duración y alternativas reales.

---

#### 34. Métricas futuras necesarias

- incidentes por tipo;
- sede afectada;
- inicio;
- detección;
- recuperación;
- duración;
- operaciones afectadas;
- operaciones manuales;
- operaciones reconciliadas;
- duplicados;
- pérdidas;
- valor económico;
- producto comprometido;
- tiempo fuera de servicio;
- causa;
- responsable;
- recurrencia.

---

#### 35. Validaciones pendientes para `OPS-AUD-015`

| Tema           | Validación requerida                             |
| -------------- | ------------------------------------------------ |
| Internet       | Datos móviles, redes alternas y responsables     |
| Energía        | UPS, plantas, autonomía y circuitos              |
| Frío           | Protocolo, temperatura, traslado y descarte      |
| Makos          | Operación manual y carga posterior               |
| Impresión      | Reimpresión, duplicados y canal alterno          |
| Caja           | Equipo alterno y cierre manual                   |
| Datáfono       | Medios autorizados y conciliación                |
| ANIMA          | Check-in manual y corrección                     |
| Vento OS       | Papel actual y reconciliación                    |
| Vehículo       | Alternativa y prioridad de rutas                 |
| Conductor      | Sustituto                                        |
| Proveedores    | Proveedores alternos                             |
| Shopify        | Operación durante caída                          |
| Mensajería     | Reasignación y entrega fallida                   |
| Técnicos       | Sustitución y garantías                          |
| Personas clave | Matriz real de reemplazos                        |
| Documentos     | Copias, custodia y recuperación                  |
| Supabase       | Comportamiento actual de aplicaciones ante caída |
| Canastas       | Alternativas de empaque                          |
| Banco          | Reintento y contingencia de nómina               |

---

#### 36. Relación con tareas posteriores

| Necesidad                                    | Destino         |
| -------------------------------------------- | --------------- |
| Validar prácticas reales                     | `OPS-AUD-015`   |
| Definir criticidad y disponibilidad objetivo | `NFR-REQ-001`   |
| Definir comportamiento offline               | `NFR-REQ-004`   |
| Definir hardware, red y periféricos          | `NFR-REQ-008`   |
| Definir observabilidad y alertas             | `NFR-REQ-009`   |
| Definir respaldo, RTO y RPO                  | `NFR-REQ-010`   |
| Definir compatibilidad por dispositivo       | `NFR-REQ-011`   |
| Diseñar reanudación de procesos              | `UX-BASE-014`   |
| Auditar offline, reintentos e idempotencia   | `CODE-AUD-018`  |
| Evaluar continuidad empresarial              | `CAP-SCOPE-018` |
| Registrar dependencias y bloqueos            | `CAP-COVER-010` |
| Consolidar brechas                           | `GAP-CTRL-001`  |
| Vincular brechas a paquetes                  | `GAP-CTRL-006`  |
| Diseñar procesos TO-BE de contingencia       | BLOQUE E2       |
| Diseñar datos, eventos y reconciliación      | BLOQUE E3       |
| Diseñar colas, reintentos y observabilidad   | BLOQUE E4       |
| Diseñar piloto, rollback y cutover           | BLOQUE E5       |
| Definir contratos externos                   | BLOQUE X        |

---

#### 37. Principios obligatorios para el diseño futuro

1. Toda capacidad crítica deberá declarar su comportamiento degradado.
2. Toda contingencia deberá tener inicio y cierre explícitos.
3. Toda operación manual deberá conservar una referencia única.
4. La carga posterior deberá ser idempotente.
5. El sistema deberá distinguir hora real y hora de sincronización.
6. La recuperación no implica conciliación terminada.
7. Ningún proceso deberá aparentar cierre mientras existan pendientes offline.
8. Las operaciones financieras deberán impedir doble cobro.
9. Los movimientos de inventario deberán impedir doble aplicación.
10. La contingencia deberá conservar actor efectivo y contexto.
11. El papel deberá retirarse después de reconciliar.
12. Las colas deberán exponer errores y reintentos.
13. La pérdida de frío deberá tratarse como riesgo sanitario, no solo técnico.
14. La ausencia de una persona clave deberá tener sustitución gobernada.
15. Las aplicaciones externas deberán tener estados de indisponibilidad diferenciados.
16. El retorno deberá ser autorizado cuando exista riesgo de duplicación.
17. Toda contingencia deberá producir evidencia auditable.

---

#### 38. Hallazgos transversales

##### 38.1. Las contingencias actuales son principalmente reactivas

La respuesta comienza después de que la operación ya fue afectada.

##### 38.2. La operación manual no tiene reconciliación transversal

Se puede continuar, pero no se garantiza que lo ocurrido llegue correctamente al sistema.

##### 38.3. La continuidad depende de personas

Gerencia, Operaciones, conductor y responsables técnicos sustituyen procedimientos formales.

##### 38.4. El papel puede proteger la operación y dañar la trazabilidad

Es útil durante una caída, pero crea múltiples fuentes si no se retira correctamente.

##### 38.5. Energía y frío tienen impacto empresarial superior

No son únicamente incidentes tecnológicos.

##### 38.6. El retorno es tan riesgoso como la caída

Al restablecerse la aplicación pueden aparecer:

- duplicados;
- operaciones fuera de orden;
- pagos repetidos;
- movimientos de inventario repetidos;
- estados incompatibles.

##### 38.7. No todas las capacidades requieren la misma continuidad

El diseño posterior deberá diferenciar:

- operación vital;
- operación crítica;
- operación diferible;
- soporte administrativo.

---

#### 39. Decisiones propuestas

1. La contingencia se documentará como ciclo de detección, continuidad, recuperación, reconciliación y cierre.
2. Internet, red local y energía se tratarán como dependencias distintas.
3. La disponibilidad de una aplicación no garantiza disponibilidad operativa si faltan datos o permisos.
4. No existe un procedimiento empresarial único confirmado para caída de internet.
5. La red local puede fallar aunque internet funcione.
6. La caída de energía y frío tiene severidad potencial máxima.
7. No existe operación manual de Makos suficientemente confirmada.
8. Las fallas de impresión pueden producir omisiones y duplicados.
9. El computador de Caja constituye un punto de concentración crítica.
10. El datáfono requiere contingencia y conciliación financiera explícitas.
11. VISO y ANIMA necesitan procedimiento para registro y corrección durante indisponibilidad.
12. Vento OS utiliza coexistencia con papel, Excel o WhatsApp durante pruebas.
13. La contingencia actual de Vento OS no cuenta con reconciliación integral confirmada.
14. Vehículo y conductor son dependencias distintas y ambas críticas.
15. Proveedores se gestionan mediante aceptación parcial, espera o sustitución manual.
16. La falla de proveedor puede propagarse hasta producción, remisiones y ventas.
17. Rappi, ManyChat, Shopify y mensajerías requieren contingencia propia.
18. Técnico y repuesto son dependencias externas separadas.
19. Las personas clave constituyen puntos únicos de falla operativa.
20. La pérdida documental también constituye una contingencia.
21. El retorno deberá impedir duplicación y cierre falso.
22. Ninguna decisión autoriza modo offline, sincronización, colas, infraestructura, código, migraciones o cambios en Supabase.

---

#### 40. Criterios de aceptación

`OPS-AUD-014` podrá aprobarse cuando se confirme que:

- se identifican contingencias de red, energía, dispositivo y proveedor;
- se incluyen aplicaciones, impresión, pagos, frío, logística y terceros;
- se distingue caída total y degradación;
- se documentan respuestas actuales sin presentarlas como diseño objetivo;
- se identifican puntos sin contingencia suficiente;
- se registra el riesgo de operación paralela;
- se documenta la necesidad de reconciliación posterior;
- se identifican personas clave y puntos únicos de falla;
- cada duda queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se han definido RTO, RPO o SLA;
- no se ha diseñado el modo offline;
- no se ha autorizado implementación.

---

#### 41. Resultado y continuidad

Con la aprobación de `OPS-AUD-014` quedará establecida la línea base inicial de:

- caídas de internet;
- fallas de red local;
- cortes de energía;
- indisponibilidad de aplicaciones;
- fallas de impresión;
- fallas de dispositivos;
- fallas de pagos;
- pérdida de frío;
- fallas de equipos;
- indisponibilidad logística;
- fallas de proveedores;
- fallas de plataformas externas;
- indisponibilidad de personas clave;
- respuestas manuales;
- registros temporales;
- vacíos de reconciliación;
- riesgos de retorno.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-015
— Validar hallazgos con trabajadores, supervisores y responsables del proceso
```

`OPS-AUD-015` deberá contrastar con responsables reales todos los hallazgos, prácticas, cifras, dependencias, contingencias y dudas pendientes de `OPS-AUD-001` a `OPS-AUD-014`, corregir lo que no corresponda y cerrar la auditoría AS-IS sin diseñar todavía el proceso TO-BE.



### ✅ OPS-AUD-015 — Validar hallazgos con trabajadores, supervisores y responsables del proceso

**Estado:** APROBADA — VALIDACIÓN SUFICIENTE PARA CONTINUIDAD  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Cierre por suficiencia de evidencia de la auditoría AS-IS  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados

---

#### 1. Decisión de cierre

La validación de `OPS-AUD-001` a `OPS-AUD-014` se considera suficiente para continuar la secuencia canónica.

La decisión se sustenta en que:

- la Jefatura de Operaciones aportó evidencia directa y transversal de la operación;
- los hallazgos fueron revisados progresivamente durante el desarrollo de cada tarea;
- las tareas `OPS-AUD-001` a `OPS-AUD-014` fueron aprobadas expresamente;
- los procesos, actores, herramientas, documentos, excepciones, controles, dependencias, duplicaciones, pérdidas de trazabilidad y contingencias principales quedaron identificados;
- no se requiere resolver cada variación menor antes de avanzar;
- las dudas no bloqueantes podrán validarse durante el diseño, prototipo o piloto correspondiente.

```text
EVIDENCIA SUFICIENTE PARA DISEÑAR
≠
CONOCIMIENTO ABSOLUTO DE TODAS LAS VARIANTES
```

---

#### 2. Criterio de suficiencia aplicado

Una duda solo bloqueará el avance cuando pueda modificar materialmente:

- la propiedad funcional o técnica de un proceso;
- la fuente de verdad de un dato;
- dinero, impuestos, Contabilidad o responsabilidad legal;
- autorización, segregación de funciones o seguridad;
- el contrato entre aplicaciones;
- una transición, reversión o estado crítico;
- una migración irreversible o de alto riesgo.

Las demás incertidumbres:

1. permanecen registradas;
2. conservan su nivel de evidencia;
3. deberán resolverse antes del diseño definitivo de la capacidad afectada o durante su prototipo y piloto;
4. no justifican entrevistas masivas ni la detención de la secuencia.

---

#### 3. Validación consolidada

Se consideran suficientemente validados para continuar:

- estructura operativa actual;
- sedes y áreas principales;
- actores y responsabilidades reales;
- procesos ordinarios;
- procesos en papel, Excel, WhatsApp y herramientas externas;
- artefactos documentales;
- excepciones y correcciones;
- controles y concentraciones de funciones;
- frecuencia y criticidad inicial;
- dependencias;
- puntos de doble digitación;
- pérdidas de trazabilidad;
- contingencias principales.

La aprobación no convierte las prácticas actuales en requisitos TO-BE.

---

#### 4. Incertidumbres diferidas con propietario documental

| Incertidumbre                                | Momento obligatorio de resolución                                |
| -------------------------------------------- | ---------------------------------------------------------------- |
| Propiedad funcional y aplicación propietaria | `CAP-MAP-*`, `CAP-SCOPE-*` y BLOQUE E2                           |
| Fuente de verdad de datos                    | BLOQUE E3                                                        |
| Anulaciones, devoluciones y reversión        | `PROC-CAT-013`, `PROC-CAT-014` y dominio funcional aplicable     |
| Dinero, Caja, medios de pago y Contabilidad  | BLOQUE E2, NUMERA y PULSO antes de implementación                |
| Alta, modificación y baja de accesos         | `PROC-ACTOR-*` y bloques de autorización antes de implementación |
| Contratos entre aplicaciones                 | BLOQUE X                                                         |
| Modo offline, reintentos e idempotencia      | `NFR-REQ-004`, `CODE-AUD-018`, BLOQUES E4 y E5                   |
| Energía, red, dispositivos y recuperación    | `NFR-REQ-008`, `NFR-REQ-010` y BLOQUE E5                         |
| Variantes menores por sede, turno o persona  | Prototipo y piloto de la capacidad correspondiente               |
| Cifras no medidas                            | Instrumentación y piloto del proceso correspondiente             |

Ninguna de estas incertidumbres podrá quedar como pendiente narrativo sin tarea.

---

#### 5. Regla de validación posterior

Durante el desarrollo de una capacidad:

```text
DISEÑO O PROTOTIPO
→ PRESENTACIÓN AL USUARIO REAL
→ VALIDACIÓN DEL FLUJO
→ CORRECCIÓN
→ PILOTO
→ ACEPTACIÓN
```

Solo se consultará nuevamente a trabajadores o responsables cuando:

- exista una duda material;
- aparezca una contradicción;
- el flujo diseñado afecte su ejecución;
- se vaya a activar la capacidad en producción.

No se realizarán once paquetes de entrevistas generales antes de continuar.

---

#### 6. Resultado

Con `OPS-AUD-015` queda cerrada la auditoría inicial AS-IS con evidencia suficiente para continuar.

Queda establecido que:

- la operación real fue levantada con detalle suficiente;
- las brechas principales están identificadas;
- las incertidumbres restantes tienen momento de resolución;
- no se exige validación exhaustiva antes de avanzar;
- la validación final de cada capacidad ocurrirá durante diseño, prototipo y piloto.

---

#### 7. Continuidad

La continuidad canónica deberá realizarse exclusivamente con:

```text
OPS-ADM-001
— Documentar brecha registral y plan de regularización de la sede administrativa
```

`OPS-AUD-015` no autoriza todavía código, migraciones, cambios físicos en Supabase ni implementación de capacidades.


