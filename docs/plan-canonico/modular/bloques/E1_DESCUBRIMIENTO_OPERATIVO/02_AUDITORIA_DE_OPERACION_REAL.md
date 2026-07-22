### AUDITORÍA DE OPERACIÓN REAL

### ✅ OPS-AUD-001 — Inventariar todas las empresas, sedes, áreas, canales y puntos operativos

**Bloque:** E1 — Auditoría y diseño operacional integral  
**Estado:** APROBADA 
**Naturaleza:** Definición documental canónica  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  

---

## 1. Propósito

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

## 2. Alcance

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

## 3. Reglas canónicas de clasificación

### 3.1 Entidad jurídica

Persona jurídica o natural responsable legal, tributaria o comercialmente de una operación.

### 3.2 Marca

Identidad comercial con la que una operación se presenta ante clientes, trabajadores o terceros.

Una marca no equivale necesariamente a una entidad jurídica independiente.

### 3.3 Sede

Ubicación física formal y estable donde se desarrolla una parte sustancial de la operación.

### 3.4 Punto operativo externo

Ubicación privada, prestada o informal que participa de manera recurrente en la operación, pero que no constituye una sede formal de Vento Group.

### 3.5 Área operativa

Unidad funcional con producción, inventario, responsabilidades o procesos diferenciables.

Un área puede existir aunque:

- comparta el mismo salón con otras áreas;
- no tenga paredes propias;
- el personal rote entre áreas;
- no tenga una persona fija todos los días.

### 3.6 Zona física

Subdivisión espacial que facilita ubicación, organización o visualización, pero que no constituye por sí misma un área operativa.

### 3.7 Estación o punto operativo

Punto específico dentro de un área desde el cual se realiza una función concreta, como:

- caja;
- mostrador;
- impresión;
- recepción;
- despacho;
- preparación;
- almacenamiento.

### 3.8 Personal flexible

La pertenencia habitual de un trabajador a un área no impide su asignación temporal a otra.

El contexto operativo efectivo deberá depender de la labor realizada durante el turno, no exclusivamente del cargo o área habitual.

### 3.9 Capacidades futuras

Toda capacidad futura deberá quedar marcada expresamente como:

- no implementada;
- ubicación por definir;
- condicionada a tareas previas;
- sin presentarse como parte de la operación actual.

---

# 4. Estructura empresarial, jurídica y comercial

## 4.1 Vento Group S.A.S.

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

### Función operativa de Vento Group

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

## 4.2 Vento Café

Vento Café es:

- una marca del grupo;
- un establecimiento registrado de Vento Group S.A.S.;
- el satélite con mayor reconocimiento comercial;
- el principal referente público para varios servicios del grupo.

Cuenta con un único local físico activo.

---

## 4.3 Vento Producción

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

## 4.4 Saudo

Saudo es:

- una marca presentada públicamente como parte de Vento Group;
- un establecimiento de comercio registrado a nombre de Jefersson García Urrego;
- una operación administrada dentro de la misma dirección general del grupo;
- un único local físico activo.

Saudo factura actualmente con el RUT personal de Jefersson García.

---

## 4.5 Molka

Molka es:

- una marca presentada públicamente como parte de Vento Group;
- un establecimiento registrado a nombre de Nathalia Carolina Ibarra Ariza;
- una operación administrada dentro de la misma dirección general del grupo;
- un único local físico activo.

---

## 4.6 Vaila Vainilla

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

## 4.7 Catering

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

## 4.8 Relación administrativa común

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

# 5. Inventario de sedes y puntos físicos

## 5.1 Complejo físico de Vento Café y oficinas de Vento Group

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

### Hallazgo registral

La dirección principal del RUT de Vento Group continúa asociada al Centro de Producción porque anteriormente las oficinas funcionaban allí.

La ubicación registral está desactualizada frente a la operación administrativa actual.

---

## 5.2 Sede administrativa de Vento Group

Las oficinas administrativas tienen dos salas.

### Sala administrativa compartida

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

### Sala de propietarios

```text
SALA DE PROPIETARIOS
├── puestos de propietarios
├── reuniones privadas
├── reuniones administrativas reservadas
├── almacenamiento limitado de vainilla
└── despacho parcial de Vaila Vainilla
```

---

## 5.3 Vento Café

Un único local físico activo.

Espacios principales:

- terraza;
- salón climatizado;
- caja y mostrador;
- cocina;
- barra.

---

## 5.4 Saudo

Un único local físico activo.

Espacios principales:

- terraza;
- salón interior;
- punto integrado de caja, mostrador y barra;
- cocina integrada.

---

## 5.5 Molka

Un único local físico activo.

Espacios principales:

- terraza;
- salón interior;
- punto integrado de caja, mostrador y barra.

Molka no cuenta con cocina productiva propia y recibe la mayoría de sus productos ya elaborados.

---

## 5.6 Centro de Producción y Distribución

Sede de dos pisos que integra producción, almacenamiento, preparación y distribución.

### Primer piso

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

### Segundo piso

- Cocina Caliente;
- Bodega y Abastecimiento;
- refrigerador de preparaciones de Cocina Caliente;
- punto informal de alistamiento junto a las escaleras;
- zona general de lavado;
- baño de trabajadores;
- casilleros;
- zona de descanso y alimentación;
- terraza con materiales y activos fuera de uso habitual.

### Condiciones actuales

No existe:

- zona formal de recepción;
- zona formal de despacho;
- centro de pesaje;
- área central de etiquetado;
- ubicación definitiva para la impresora de etiquetas.

---

## 5.7 Apartamento de Jeo García

Punto privado externo asociado a Vaila Vainilla.

Funciones:

- preparación;
- empaque;
- gestión directa de Vaila.

No se clasifica como sede formal de Vento Group.

---

## 5.8 Apartamento de la gerente general

Punto privado externo de resguardo vehicular.

Funciones:

- almacenamiento nocturno de la camioneta de Vento Group;
- punto donde el conductor recoge el vehículo;
- punto desde el cual inicia su turno.

No se clasifica como sede formal.

---

## 5.9 Apartamento del encargado de decoraciones

Punto privado externo utilizado como:

- taller de decoraciones;
- espacio de preparación y reparación;
- almacenamiento parcial del inventario de decoraciones de Vento.

No se clasifica como sede formal.

---

# 6. Áreas operativas por sede

## 6.1 Vento Café

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

### Reglas

- Terraza y salón climatizado pertenecen a una misma área operativa.
- El personal de servicio rota entre ambas zonas.
- Caja y mostrador constituyen un solo punto operativo.
- Caja y mostrador no son un área independiente.
- Las solicitudes de remisión de servicio, caja y mostrador se gestionan conjuntamente.
- El cajero puede realizar funciones de servicio.
- La manipulación de caja debe mantenerse restringida al puesto autorizado.

---

## 6.2 Saudo

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

## 6.3 Molka

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

## 6.4 Centro de Producción — áreas productivas

El primer piso es un salón físico compartido, pero contiene áreas operativas diferenciadas.

```text
SALÓN GENERAL DE PRODUCCIÓN
├── Panadería y Bollería
├── Repostería
├── Pastelería y Tortas
├── Galletería
└── Producción de Barra
```

### Panadería y Bollería

- dos panaderos dedicados actualmente;
- producción e insumos diferenciados;
- responsabilidades propias.

### Repostería

- dos reposteras dedicadas actualmente;
- producción e insumos diferenciados;
- responsabilidades propias.

### Galletería

- una galletera dedicada actualmente;
- producción e insumos diferenciados;
- responsabilidades propias.

### Pastelería y Tortas

- línea fortalecida recientemente por la oferta de tortas de Molka;
- una persona actualmente responsable;
- área operativa diferenciada;
- puede compartir personal, mesas y equipos con Repostería.

### Producción de Barra

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

## 6.5 Cocina Caliente

Área operativa independiente del segundo piso.

Características:

- una persona encargada permanentemente;
- insumos propios;
- inventario propio;
- producción diferenciada;
- apoyo rotativo de cocineros de los satélites;
- uso de refrigerador para preparaciones pendientes de despacho.

---

## 6.6 Bodega y Abastecimiento

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

### Estado actual

- el bodeguero anterior fue retirado;
- Carlos cubre temporalmente parte de las funciones;
- los procesos no están estandarizados;
- varias responsabilidades están mezcladas;
- no existe zona formal de recepción;
- no existe zona formal de despacho.

---

## 6.7 Servicios Generales

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

# 7. Zonas e infraestructura compartida del Centro de Producción

## 7.1 Cámara fría

Zona física compartida.

Cada área debe contar con una subdivisión interna asignada.

La separación existe como criterio operativo, aunque se presentan episodios de desorden.

---

## 7.2 Cuarto de congelación

Zona física compartida.

Cada área debe contar con una subdivisión interna asignada.

No constituye un área operativa independiente.

---

## 7.3 Zona general de lavado

Sirve a todo el Centro de Producción.

Uso principal:

- Servicios Generales;
- lavado de canastas;
- lavado de trapos;
- limpieza de elementos comunes.

Cada área conserva la responsabilidad de limpiar sus propios utensilios y estación.

---

## 7.4 Zona de bienestar

```text
ZONA DE BIENESTAR
├── baño
├── casilleros
└── mesa de descanso y alimentación
```

Se clasifica como zona de apoyo al personal.

---

## 7.5 Terraza del segundo piso

No funciona como bodega de inventario habitual.

Almacena principalmente:

- sobrantes de construcción;
- mobiliario viejo;
- patas de sillas;
- lavabos pendientes de instalación;
- piezas y activos sin uso inmediato.

Se clasifica como zona auxiliar de materiales y activos fuera de operación.

---

## 7.6 Punto administrativo operativo

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

# 8. Recepción, alistamiento y despacho físico

## 8.1 Recepción de proveedores

No existe una zona formal de recepción.

### Estado actual

- los productos destinados al segundo piso son subidos y dejados temporalmente en el suelo;
- Carlos los recibe, desempaqueta y organiza;
- los productos del primer piso pueden ser recibidos directamente por los trabajadores de cada área;
- los horarios de proveedores son variables;
- las entregas pueden llegar aproximadamente entre las 7:00 a. m. y las 5:00 p. m.;
- una sola persona no puede cubrir consistentemente recepción, subida, distribución y organización.

---

## 8.2 Alistamiento de remisiones

Existen dos puntos informales:

```text
PRIMER PISO
→ alistamiento de productos de las áreas productivas

SEGUNDO PISO
→ alistamiento de productos de bodega y Cocina Caliente
```

No existe una zona central formal de despacho.

---

## 8.3 Canastas de transporte

- se separan por satélite;
- el conductor conoce su destino por memoria y por el orden de organización;
- no cuentan actualmente con identificación visible formal;
- son reutilizables;
- pueden regresar el mismo día o al día siguiente.

El detalle del control de canastas no se resuelve dentro de OPS-AUD-001.

---

# 9. Canales comerciales y corporativos

## 9.1 Vento Café

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

## 9.2 Saudo

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

## 9.3 Molka

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

## 9.4 Vaila Vainilla

Canales actuales:

- página web;
- WhatsApp;
- negocios directos con empresas.

---

## 9.5 Vento Group

### Instagram corporativo

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

### Página web corporativa

- en desarrollo;
- aún no operativa;
- desarrollada actualmente por Carlos;
- requiere definición específica de propósito y contenido.

### WhatsApp corporativo

No existe actualmente un canal propio de WhatsApp para Vento Group.

### Correo

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

## 9.6 Catering

Canal de servicio externo de Vento Group.

Los pedidos son gestionados principalmente por:

- gerentes;
- persona encargada de ventas;
- relaciones comerciales directas.

No cuenta todavía con un canal digital propio claramente separado.

---

## 9.7 Centro de Producción — ventas externas

Actualmente:

- no vende directamente productos a clientes externos;
- abastece principalmente a Vento Café, Saudo y Molka;
- atiende producción asociada al catering.

Existe la intención de desarrollar un catálogo B2B, pero no está implementado.

---

# 10. Capacidades futuras deseadas

## 10.1 Centro de Pesaje, Premezclas y Porcionamiento

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

### Restricción actual

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

## 10.2 Punto central de impresión de etiquetas

Existe una impresora de etiquetas adquirida, pero actualmente:

- está guardada en el puesto administrativo;
- no está instalada;
- no está configurada;
- no tiene ubicación operativa definitiva;
- no existe formato canónico de etiqueta.

Se proyecta como punto técnico compartido, no como área operativa independiente.

---

## 10.3 Catálogo B2B

Capacidad futura para vender productos del Centro de Producción a otras empresas.

Estado:

- deseado;
- no desarrollado;
- sin catálogo;
- sin canal comercial formal;
- sin definición de precios, presentación, producción o despacho.

---

## 10.4 Centro de costo de Producción y Distribución

Se desea que el Centro de Producción y Distribución evolucione hacia una unidad con:

- costos identificables;
- producción valorizada;
- transferencias internas;
- control de abastecimiento a satélites;
- posible venta externa.

Actualmente las transferencias internas no funcionan como ventas o cargos formalmente estructurados.

---

# 11. Brechas y tareas vinculadas

Toda brecha identificada queda vinculada a una tarea explícita.

## OPS-ADM-001 — Regularizar sede administrativa y registros de ubicación

**Bloque:** E1  
**Momento:** después de OPS-AUD-002 y antes de implementar el modelo definitivo de sedes.

Debe resolver:

- dirección administrativa actual;
- dirección registral desactualizada;
- identificación formal de Oficina 1;
- relación física entre Local 1 y oficinas;
- documentos que deban actualizarse.

---

## OPS-GOV-001 — Definir gobernanza del ecosistema de marcas

**Bloque:** E1  
**Momento:** después de OPS-AUD-002 y antes de centros de costo e integraciones financieras.

Debe definir:

- relación entre Vento Group, Saudo, Molka y Vaila;
- servicios administrativos compartidos;
- uso de personal;
- uso de activos;
- costos compartidos;
- facturación;
- tratamiento de ingresos y gastos;
- límites entre operación corporativa y operación personal.

---

## OPS-CAN-001 — Diseñar la arquitectura de canales corporativos

**Bloque:** E1  
**Momento:** después de OPS-AUD-001.

Debe incluir:

- página web de Vento Group;
- propósito del canal;
- estructura de marcas;
- captación de catering;
- futura oferta B2B;
- Instagram corporativo;
- correos y alias;
- responsables;
- gobernanza de canales.

---

## OPS-POS-001 — Definir zonas físicas y mapas POS por sede

**Bloque:** E1  
**Momento:** después del inventario de áreas y antes del rediseño de PULSO.

Debe incluir:

- terraza y salón de Vento Café;
- numeración y agrupación de mesas;
- vistas por zona;
- puntos de caja;
- puntos de entrega de Rappi;
- configuración de Saudo y Molka.

---

## OPS-REC-001 — Definir catálogo y acceso contextual a recetas

**Bloque:** E1  
**Momento:** después de OPS-AUD-002 y antes de implementar vistas productivas.

Debe permitir filtrar recetas por:

- sede activa;
- área activa;
- estación;
- rol operativo;
- tipo de preparación;
- versión vigente.

---

## OPS-LOG-001 — Diseñar y estandarizar Bodega y Abastecimiento

**Bloque:** E1  
**Momento:** después de OPS-AUD-002.

Debe definir:

- compras;
- recepción de proveedores;
- recepción de producción interna;
- zona de recepción;
- almacenamiento;
- conteos;
- alistamiento;
- despacho;
- entrega al conductor;
- carga del vehículo;
- reemplazos cuando el cargo esté vacante;
- responsabilidad por franjas horarias.

---

## OPS-ACT-001 — Formalizar activos y puntos externos de custodia

**Bloque:** E1  
**Momento:** después de OPS-AUD-002.

Debe incluir:

- taller externo de decoraciones;
- inventario de decoraciones;
- materiales residuales de la terraza;
- mobiliario viejo;
- elementos pendientes de instalar;
- resguardo externo del vehículo;
- responsables y controles.

---

## OPS-PLAN-001 — Auditar demanda y diseñar planificación de producción

**Bloque:** E1  
**Momento:** iniciar en paralelo mientras continúa el documento canónico.

Debe analizar:

- ventas históricas de Makos;
- pedidos de Rappi;
- información recuperable de ManyChat;
- remisiones históricas disponibles;
- faltantes;
- sobrantes;
- mermas;
- inventarios finales;
- productos previsibles;
- productos bajo pedido;
- mínimos y máximos;
- producción base;
- ajustes nocturnos.

### OPS-PLAN-001-A — Consolidar fuentes internas

**Responsable inicial:** contadora.

Debe recopilar:

- Makos;
- inventarios;
- compras;
- recepciones;
- formatos de remisión;
- periodos disponibles;
- periodos faltantes.

### OPS-PLAN-001-B — Levantar demanda y canales

**Responsable inicial:** encargada de pedidos.

Debe recopilar:

- Rappi;
- ManyChat;
- entrevistas con responsables de pedidos;
- productos que faltan;
- productos que sobran;
- variaciones recurrentes.

### OPS-PLAN-001-C — Iniciar registro prospectivo

**Responsables:** contadora y encargada de pedidos.

Registro mínimo:

- fecha;
- satélite;
- producto;
- cantidad solicitada;
- cantidad recibida;
- faltante;
- sobrante reportado;
- observación.

---

## OPS-PRD-001 — Diseñar el Centro de Pesaje, Premezclas y Porcionamiento

**Bloque:** E1  
**Momento:** después de OPS-PLAN-001 y de la estandarización de recetas.

Debe definir:

- ubicación;
- responsable;
- equipos;
- kits;
- lotes;
- inventario;
- reservas;
- planificación;
- urgencias;
- alérgenos;
- contaminación cruzada;
- almacenamiento;
- devoluciones;
- acceso a fórmulas.

---

## OPS-TRZ-001 — Definir lotes, etiquetas e impresión central

**Bloque:** E1  
**Momento:** después de definir recetas y producción, antes de implementar trazabilidad.

Debe incluir:

- formato de lote;
- producto;
- fecha de producción;
- vencimiento;
- área;
- responsable;
- cantidad;
- conservación;
- ubicación de la impresora;
- reimpresiones;
- contingencia manual.

---

## OPS-B2B-001 — Diseñar el catálogo B2B del Centro de Producción

**Bloque:** E1  
**Momento:** después de OPS-PLAN-001 y del costeo de productos.

Debe definir:

- catálogo;
- clientes objetivo;
- presentaciones;
- precios;
- capacidad;
- pedidos;
- producción;
- facturación;
- despacho.

---

## OPS-CST-001 — Diseñar centro de costo y transferencias internas

**Bloque:** E1  
**Momento:** después de OPS-GOV-001 y de la auditoría de procesos productivos.

Debe definir:

- valorización de producción;
- costos por área;
- transferencias a satélites;
- cargos internos;
- consumos;
- desperdicios;
- rentabilidad del Centro de Producción;
- ventas externas futuras.

---

# 12. Decisiones canónicas resultantes

1. Vento Group constituye el paraguas administrativo y público del ecosistema.

2. La titularidad jurídica y la pertenencia operativa al grupo no son equivalentes.

3. Vento Café y las oficinas de Vento Group comparten el mismo inmueble general, pero son puntos operativos distintos.

4. El Centro de Producción y el Centro de Distribución funcionan actualmente como una sola sede física integrada.

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

# 13. Criterios de aceptación

OPS-AUD-001 podrá aprobarse cuando se confirme que:

- todas las entidades y marcas actuales están inventariadas;
- todos los titulares jurídicos conocidos están diferenciados;
- todas las sedes físicas están registradas;
- todos los puntos externos recurrentes están registrados;
- todas las áreas operativas actuales están identificadas;
- las zonas físicas no se confunden con áreas;
- los canales actuales y futuros están diferenciados;
- las capacidades futuras no aparecen como implementadas;
- cada brecha tiene tarea, bloque y momento de resolución;
- no se han definido todavía responsabilidades detalladas propias de OPS-AUD-002;
- no se ha autorizado implementación técnica.

---

# 14. Resultado y continuidad

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

## Soportes documentales consultados

- RUT de Vento Group S.A.S.
- RUT de Nathalia Carolina Ibarra Ariza / Molka.
- Cámara de Comercio de Saudo.


### [ ] OPS-AUD-002 — Identificar familias de actores y responsables reales por proceso
### [ ] OPS-AUD-003 — Observar el trabajo real de cada área en operación ordinaria
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
