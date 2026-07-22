import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const modularDir = path.join(root, 'docs/plan-canonico/modular');

function read(relativePath) {
  return fs.readFileSync(path.join(root, relativePath), 'utf8').replace(/\r\n?/g, '\n');
}

function write(relativePath, content) {
  const fullPath = path.join(root, relativePath);
  fs.mkdirSync(path.dirname(fullPath), { recursive: true });
  const normalized = content.replace(/\r\n?/g, '\n').replace(/\s+$/u, '') + '\n';
  fs.writeFileSync(fullPath, normalized, 'utf8');
}

function replaceOnce(text, search, replacement, label) {
  if (!text.includes(search)) {
    throw new Error(`No se encontró el ancla requerida: ${label}`);
  }
  return text.replace(search, replacement);
}

function replaceSection(text, startHeading, endHeading, replacement) {
  const start = text.indexOf(startHeading);
  const end = text.indexOf(endHeading, start + startHeading.length);
  if (start < 0 || end < 0 || end <= start) {
    throw new Error(`No se pudo reemplazar la sección ${startHeading}.`);
  }
  return text.slice(0, start) + replacement + '\n\n' + text.slice(end);
}

function insertManifestFile(files, anchor, newPath) {
  if (files.includes(newPath)) return;
  const index = files.indexOf(anchor);
  if (index < 0) throw new Error(`No existe el ancla de manifest: ${anchor}`);
  files.splice(index + 1, 0, newPath);
}

const e1Derived = `### TAREAS E1 DERIVADAS DE OPS-AUD-001

Estas tareas materializan brechas AS-IS detectadas por \`OPS-AUD-001\`.
No diseñan todavía procesos TO-BE, pantallas, estructuras definitivas de datos
ni implementaciones físicas.

La ejecución formal de este conjunto ocurre después de \`OPS-AUD-015\` y antes
de \`CAP-MAP-001\`. La recolección de evidencia de \`OPS-PLAN-002\`,
\`OPS-PLAN-003\` y \`OPS-PLAN-004\` puede comenzar antes, sin alterar la tarea
actual ni permitir aprobaciones fuera de secuencia.

### [ ] OPS-ADM-001 — Documentar brecha registral y plan de regularización de la sede administrativa

**Dependencias:** \`OPS-AUD-015\`.  
**Propósito:** reconciliar la ubicación administrativa real, la dirección registral vigente, la identificación de Oficina 1 y la relación física con Vento Café.  
**Salida obligatoria:** evidencia, estado actual, responsables, documentos afectados, decisiones requeridas y tarea de ejecución externa cuando corresponda.  
**Límite:** esta tarea no modifica registros legales ni reemplaza asesoría contable o jurídica.

### [ ] OPS-GOV-001 — Documentar gobernanza AS-IS del ecosistema de marcas y titulares

**Dependencias:** \`OPS-AUD-015\`.  
**Propósito:** documentar la relación operativa, administrativa, económica y de recursos entre Vento Group, Vento Café, Saudo, Molka, Vaila Vainilla y catering.  
**Salida obligatoria:** fronteras actuales, servicios compartidos, uso de personal y activos, facturación observada, costos compartidos, riesgos y decisiones pendientes.  
**Límite:** el modelo financiero y contable objetivo se diseña posteriormente en NUMERA y las integraciones correspondientes.

### [ ] OPS-ACT-001 — Inventariar activos y puntos externos de custodia

**Dependencias:** \`OPS-AUD-015\`.  
**Propósito:** completar el inventario AS-IS de decoraciones, vehículo, materiales residuales, mobiliario, elementos pendientes de instalar y demás activos ubicados fuera de sedes formales.  
**Salida obligatoria:** activo o familia, propietario, custodio, ubicación, condición, uso, riesgo, evidencia y destino documental.  
**Continuidad:** alimenta \`NEXO-DOM-008\`, \`NEXO-DOM-010\`, \`NEXO-DOM-011\`, \`NEXO-DOM-017\` y \`NEXO-DOM-027\`.

### [ ] OPS-PLAN-001 — Definir el programa de auditoría de demanda y requisitos de planificación productiva

**Dependencias:** \`OPS-AUD-015\`.  
**Propósito:** establecer preguntas, periodos, granularidad, fuentes, responsables, calidad mínima, criterios de conciliación y límites de la auditoría de demanda.  
**Salida obligatoria:** protocolo de análisis AS-IS para ventas, pedidos, remisiones, faltantes, sobrantes, mermas, inventarios finales, productos previsibles y productos bajo pedido.  
**Límite:** no aprueba todavía el algoritmo, los mínimos, la producción base ni el proceso TO-BE.

### [ ] OPS-PLAN-002 — Consolidar fuentes internas para la auditoría de demanda

**Sustituye la referencia narrativa:** \`OPS-PLAN-001-A\`.  
**Dependencias:** \`OPS-PLAN-001\`.  
**Responsable inicial de evidencia:** contabilidad.  
**Salida obligatoria:** inventario de fuentes de Makos, inventarios, compras, recepciones, remisiones, periodos disponibles, periodos faltantes, formato, acceso, propietario y calidad conocida.

### [ ] OPS-PLAN-003 — Levantar demanda, faltantes y variaciones por canal

**Sustituye la referencia narrativa:** \`OPS-PLAN-001-B\`.  
**Dependencias:** \`OPS-PLAN-001\`.  
**Responsable inicial de evidencia:** responsable de pedidos.  
**Salida obligatoria:** fuentes de Rappi y ManyChat, entrevistas, productos faltantes, sobrantes, variaciones recurrentes, estacionalidad conocida y limitaciones de recuperación.

### [ ] OPS-PLAN-004 — Iniciar registro prospectivo de solicitud, entrega y diferencia

**Sustituye la referencia narrativa:** \`OPS-PLAN-001-C\`.  
**Dependencias:** \`OPS-PLAN-001\`.  
**Responsables iniciales de evidencia:** contabilidad y responsable de pedidos.  
**Registro mínimo:** fecha, sede solicitante, canal cuando aplique, producto, presentación, cantidad solicitada, cantidad recibida, faltante, sobrante reportado, ajuste y observación.  
**Límite:** el registro prospectivo no se convierte por sí solo en fuente de verdad ni autoriza automatización.
`;

const e2Derived = `### TAREAS TRANSVERSALES TO-BE DERIVADAS DE OPS-AUD-001

Estas tareas se ejecutan dentro de BLOQUE E2 después de consolidar la línea base
de E1. Deben reutilizar el catálogo de procesos, actores, pantallas y brechas; no
crearán inventarios paralelos.

### [ ] OPS-CAN-001 — Diseñar la arquitectura objetivo de canales corporativos y comerciales

**Dependencias:** cierre de E1, \`OPS-GOV-001\`, \`PROC-CAT-001\` y \`PROC-CAT-002\`.  
**Propósito:** definir propósito, propietario, actores, entradas, salidas, métricas y fronteras de la web corporativa, Instagram, correo, alias, catering, captación B2B y demás canales.  
**Continuidad:** alimenta BLOQUE X, contratos de pantallas y roadmaps de las aplicaciones consumidoras.

### [ ] OPS-LOG-001 — Diseñar el proceso transversal objetivo de Bodega y Abastecimiento

**Dependencias:** cierre de E1, \`OPS-GOV-001\`, \`OPS-ACT-001\` y \`PROC-CAT-002\`.  
**Propósito:** diseñar de extremo a extremo solicitud, compra, recepción de proveedor, recepción de producción, almacenamiento, conteo, alistamiento, despacho, entrega al conductor, carga, reemplazos y cobertura horaria.  
**Propiedad:** ORIGO conserva compras y recepción comercial; NEXO conserva inventario, ubicación, movimientos, alistamiento y logística; FOGO conserva producción; NUMERA consume hechos económicos.  
**Límite:** no duplica las tareas UX de ORIGO o NEXO; les entrega el contrato transversal aprobado.

### [ ] OPS-B2B-001 — Diseñar el proceso objetivo de venta B2B del Centro de Producción

**Dependencias:** cierre de E1, \`OPS-PLAN-001\`, \`OPS-GOV-001\` y \`PROC-CAT-002\`.  
**Propósito:** definir cliente objetivo, catálogo, presentaciones, precios, capacidad, toma de pedido, aprobación, producción, facturación, inventario, despacho, entrega, devoluciones y conciliación.  
**Continuidad:** deberá asignar propietarios entre PULSO o canal comercial, FOGO, NEXO, NUMERA y BLOQUE X antes de E5.  
**Límite:** continúa como capacidad futura hasta superar viabilidad, costeo, capacidad y readiness.
`;

const fogoDerived = `### TAREAS PRODUCTIVAS DERIVADAS DE OPS-AUD-001

Estas tareas concretan necesidades productivas detectadas en E1. Sus salidas se
integran con las tareas FOGO existentes; no las sustituyen ni autorizan
implementación anticipada.

### [ ] OPS-REC-001 — Definir el contrato canónico de recetas y acceso contextual

**Dependencias:** cierre de E2 y línea base de capacidades productivas.  
**Propósito:** definir identidad, versión, vigencia, rendimiento, ingredientes, unidades, pasos, alérgenos, conservación, sensibilidad y acceso por sede, área, estación, rol y tipo de preparación.  
**Continuidad:** alimenta \`FOGO-UX-008\`, \`FOGO-UX-009\`, \`FOGO-AUTH-013\`, NEXO, NUMERA y E3.  
**Límite:** FOGO administra la receta y su ejecución; la autorización y la fuente de verdad física se aprueban en sus bloques propietarios.

### [ ] OPS-PRD-001 — Diseñar el Centro de Pesaje, Premezclas y Porcionamiento

**Dependencias:** \`OPS-PLAN-001\`, \`OPS-REC-001\` y diseño productivo de FOGO.  
**Propósito:** definir ubicación, actor, equipos, capacidad, kits, reservas, inventario, urgencias, alérgenos, contaminación cruzada, almacenamiento, devoluciones y protección de fórmulas.  
**Continuidad:** NEXO conserva existencias y movimientos; FOGO conserva planificación y ejecución; NUMERA consume costos; E5 define piloto e implementación.  
**Límite:** permanece como capacidad futura hasta validar demanda, recetas, espacio, personal y viabilidad.

### [ ] OPS-TRZ-001 — Definir el contrato empresarial de lotes, etiquetas y trazabilidad productiva

**Dependencias:** \`OPS-REC-001\`, \`OPS-PRD-001\` y diseño de lotes de FOGO.  
**Propósito:** definir identidad de lote, producto, receta y versión, fechas, vencimiento, área, actor, cantidad, conservación, relación con insumos y producto terminado, corrección y reetiquetado.  
**Continuidad:** FOGO origina el lote productivo; NEXO conserva existencias, ubicaciones y trazabilidad logística; BLOQUE E4 define plantillas, colas, enrutamiento, reimpresión y contingencia de impresión.  
**Límite:** esta tarea no duplica \`PRINT-ARC-001\` a \`PRINT-ARC-020\`.
`;

const pulsoDerived = `### TAREA POS DERIVADA DE OPS-AUD-001

### [ ] OPS-POS-001 — Definir zonas físicas, mesas y puntos de servicio del POS por sede

**Dependencias:** cierre de E2 y \`PULSO-UX-001\`.  
**Propósito:** definir para Vento Café, Saudo y Molka las zonas visibles, numeración y agrupación de mesas, puntos de caja, mostrador, entrega de domicilios y Rappi, estaciones y reglas de configuración por sede.  
**Continuidad:** alimenta \`PULSO-UX-002\` a \`PULSO-UX-006\`, \`PULSO-UX-015\`, dispositivos compartidos y contratos de pantallas.  
**Límite:** la zona física no se convierte automáticamente en área de autorización; la relación deberá validarse contra el contexto canónico.
`;

const numeraDerived = `### TAREA FINANCIERA DERIVADA DE OPS-AUD-001

### [ ] OPS-CST-001 — Definir el caso de centro de costo y transferencias internas de Producción y Distribución

**Dependencias:** \`OPS-GOV-001\`, auditoría productiva y \`NUMERA-AUD-008\` a \`NUMERA-AUD-009\`.  
**Propósito:** definir valorización de producción, costos por área, transferencias a satélites, consumos, desperdicios, variaciones, rentabilidad y tratamiento de ventas externas futuras.  
**Continuidad:** concreta el caso operativo para \`NUMERA-DOM-004\`, \`NUMERA-DOM-006\`, \`NUMERA-DOM-007\`, \`NUMERA-DOM-008\`, \`NUMERA-UX-019\` y \`NUMERA-UX-022\`.  
**Límite:** no crea un catálogo paralelo de centros de costo ni decide por sí sola el tratamiento fiscal o contable.
`;

write('docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/02A_TAREAS_DERIVADAS_OPS_AUD_001.md', e1Derived);
write('docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/01_TAREAS_DERIVADAS_OPS_AUD_001.md', e2Derived);
write('docs/plan-canonico/modular/bloques/L_FOGO/01_TAREAS_DERIVADAS_OPS_AUD_001.md', fogoDerived);
write('docs/plan-canonico/modular/bloques/N_PULSO/01_TAREA_DERIVADA_OPS_AUD_001.md', pulsoDerived);
write('docs/plan-canonico/modular/bloques/O_NUMERA/03_TAREA_DERIVADA_OPS_AUD_001.md', numeraDerived);

const manifestPath = 'docs/plan-canonico/modular/manifest.json';
const manifest = JSON.parse(read(manifestPath));
insertManifestFile(manifest.files, 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md', 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/02A_TAREAS_DERIVADAS_OPS_AUD_001.md');
insertManifestFile(manifest.files, 'bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md', 'bloques/E2_PROCESOS_Y_EXPERIENCIA/01_TAREAS_DERIVADAS_OPS_AUD_001.md');
insertManifestFile(manifest.files, 'bloques/L_FOGO/00_BLOQUE_L.md', 'bloques/L_FOGO/01_TAREAS_DERIVADAS_OPS_AUD_001.md');
insertManifestFile(manifest.files, 'bloques/N_PULSO/00_BLOQUE_N.md', 'bloques/N_PULSO/01_TAREA_DERIVADA_OPS_AUD_001.md');
insertManifestFile(manifest.files, 'bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md', 'bloques/O_NUMERA/03_TAREA_DERIVADA_OPS_AUD_001.md');
manifest.generated_at = new Date().toISOString();
write(manifestPath, JSON.stringify(manifest, null, 2));

const activePath = 'docs/plan-canonico/modular/active-sequence.json';
const active = JSON.parse(read(activePath));
const newSegments = [
  { prefix: 'OPS-ADM', from: 1, to: 1 },
  { prefix: 'OPS-GOV', from: 1, to: 1 },
  { prefix: 'OPS-ACT', from: 1, to: 1 },
  { prefix: 'OPS-PLAN', from: 1, to: 4 },
];
if (!active.segments.some((segment) => segment.prefix === 'OPS-ADM')) {
  const auditIndex = active.segments.findIndex((segment) => segment.prefix === 'OPS-AUD');
  if (auditIndex < 0) throw new Error('No existe el segmento OPS-AUD en active-sequence.json.');
  active.segments.splice(auditIndex + 1, 0, ...newSegments);
}
write(activePath, JSON.stringify(active, null, 2));

const auditPath = 'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md';
let audit = read(auditPath);
audit = audit.replace('**Bloque:** E1 — Auditoría y diseño operacional integral', '**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación');
audit = audit.replace('**Estado:** APROBADA ', '**Estado:** APROBADA');
if (!audit.includes('**Naturaleza de las clasificaciones:**')) {
  audit = replaceOnce(
    audit,
    '**Estado:** APROBADA\n',
    '**Estado:** APROBADA\n**Naturaleza de las clasificaciones:** Línea base operativa inicial, sujeta a validación de campo y reconciliación técnica\n',
    'metadatos de OPS-AUD-001'
  );
}
if (!audit.includes('### 3.10 Estado de evidencia y validación')) {
  audit = replaceOnce(
    audit,
    '- sin presentarse como parte de la operación actual.\n\n---',
    `- sin presentarse como parte de la operación actual.\n\n### 3.10 Estado de evidencia y validación\n\nCada afirmación de este inventario deberá distinguir entre:\n\n- confirmación documental;\n- confirmación operativa aportada por un responsable;\n- clasificación inicial pendiente de observación;\n- capacidad futura deseada.\n\nLas clasificaciones de áreas, zonas, estaciones y unidades operativas constituyen una línea base inicial. Deberán validarse mediante \`OPS-AUD-003\` y \`OPS-AUD-015\` antes de convertirse en estructura técnica definitiva.\n\nLa coincidencia de una instalación física no determina por sí sola si el modelo objetivo utilizará una o varias unidades operativas lógicas. Esa reconciliación corresponde a \`CAP-MAP-003\`, \`CODE-AUD-006\`, \`CAP-SCOPE-001\` y \`GAP-CTRL-006\`.\n\n---`,
    'estado de evidencia'
  );
}

const materializedSection = `# 11. Brechas y tareas materializadas

Las brechas detectadas en esta tarea ya no se consideran destinos narrativos.
Sus definiciones canónicas se encuentran en los fragmentos propietarios y con
marcador formal.

| Necesidad detectada | Tarea canónica | Bloque propietario |
| --- | --- | --- |
| Sede administrativa y registros | \`OPS-ADM-001\` | E1 |
| Gobernanza de marcas y titulares | \`OPS-GOV-001\` | E1 |
| Activos y custodias externas | \`OPS-ACT-001\` | E1 |
| Programa de auditoría de demanda | \`OPS-PLAN-001\` | E1 |
| Fuentes internas | \`OPS-PLAN-002\` | E1 |
| Demanda y canales | \`OPS-PLAN-003\` | E1 |
| Registro prospectivo | \`OPS-PLAN-004\` | E1 |
| Canales corporativos | \`OPS-CAN-001\` | E2 |
| Bodega y Abastecimiento TO-BE | \`OPS-LOG-001\` | E2 |
| Venta B2B | \`OPS-B2B-001\` | E2 |
| Recetas y acceso contextual | \`OPS-REC-001\` | FOGO |
| Centro de Pesaje | \`OPS-PRD-001\` | FOGO |
| Lotes, etiquetas y trazabilidad | \`OPS-TRZ-001\` | FOGO, con salida a NEXO y E4 |
| Zonas y mapas POS | \`OPS-POS-001\` | PULSO |
| Centro de costo y transferencias | \`OPS-CST-001\` | NUMERA |

Las referencias narrativas \`OPS-PLAN-001-A\`, \`OPS-PLAN-001-B\` y
\`OPS-PLAN-001-C\` quedan sustituidas respectivamente por
\`OPS-PLAN-002\`, \`OPS-PLAN-003\` y \`OPS-PLAN-004\`, porque el contrato
del compilador exige que todo identificador canónico termine en tres dígitos.
`;
audit = replaceSection(audit, '# 11. Brechas y tareas vinculadas', '# 12. Decisiones canónicas resultantes', materializedSection);

if (!audit.includes('Estas decisiones constituyen la línea base operativa inicial')) {
  audit = replaceOnce(
    audit,
    '# 12. Decisiones canónicas resultantes\n\n1.',
    `# 12. Decisiones canónicas resultantes\n\nEstas decisiones constituyen la línea base operativa inicial aprobada para continuar el descubrimiento. No equivalen todavía a estructura técnica definitiva. Su validez de campo deberá confirmarse en \`OPS-AUD-003\` y \`OPS-AUD-015\`; cualquier diferencia generará o actualizará una tarea concreta mediante \`GAP-CTRL-001\` y \`GAP-CTRL-006\`.\n\n1.`,
    'introducción de decisiones'
  );
}
audit = audit.replace(
  '4. El Centro de Producción y el Centro de Distribución funcionan actualmente como una sola sede física integrada.',
  '4. El Centro de Producción y el Centro de Distribución funcionan actualmente dentro de una sola instalación física integrada. Esta decisión no define todavía si el modelo objetivo conservará una o dos unidades operativas lógicas; esa resolución deberá considerar procesos, inventario, permisos, costos, turnos, rutas y reportes.'
);

const acceptanceSection = `# 13. Criterios de aceptación

OPS-AUD-001 se considera aprobada como inventario inicial cuando:

- las entidades, marcas, titulares, sedes y puntos conocidos están suficientemente identificados para continuar el levantamiento;
- cada elemento declara o permite determinar su tipo de evidencia;
- las clasificaciones pendientes de observación están vinculadas a \`OPS-AUD-003\` y \`OPS-AUD-015\`;
- sede física, unidad operativa lógica, área, zona y estación no se tratan como equivalentes;
- los canales actuales y las capacidades futuras están diferenciados;
- los elementos no inventariados individualmente, como alias, activos, impresoras, escáneres, terminales, LOC y estaciones, tienen una tarea propietaria explícita;
- las quince tareas derivadas están materializadas con identificador válido, bloque propietario, dependencias y momento de ejecución;
- no se han definido todavía responsabilidades detalladas propias de \`OPS-AUD-002\`;
- no se ha autorizado implementación técnica, migraciones ni cambios en Supabase.
`;
audit = replaceSection(audit, '# 13. Criterios de aceptación', '# 14. Resultado y continuidad', acceptanceSection);

// Mantener la tarea como unidad jerárquica dentro del fragmento modular.
audit = audit.replace(/^# (\d+\..*)$/gm, '#### $1');
audit = audit.replace(/^#{2,3} (\d+\.\d+.*)$/gm, '##### $1');
audit = audit.replace(/^### (?!✅|🟡|❌|\[[ x~]\]|AUDITORÍA)(.+)$/gm, '###### $1');
audit = audit.replace(/^## Soportes documentales consultados$/gm, '#### Soportes documentales consultados');
write(auditPath, audit);

let roadmap = read('docs/plan-canonico/modular/02_ROADMAP_MAESTRO.md');
if (!roadmap.includes('### Distribución canónica de tareas derivadas de OPS-AUD-001')) {
  roadmap = replaceOnce(
    roadmap,
    'BLOQUE E5\n→ convierte el diseño aprobado en paquetes implementables\n```\n',
    `BLOQUE E5\n→ convierte el diseño aprobado en paquetes implementables\n\`\`\`\n\n### Distribución canónica de tareas derivadas de OPS-AUD-001\n\n| Responsabilidad | Tareas | Bloque |\n| --- | --- | --- |\n| Evidencia y línea base AS-IS | \`OPS-ADM-001\`, \`OPS-GOV-001\`, \`OPS-ACT-001\`, \`OPS-PLAN-001\` a \`OPS-PLAN-004\` | E1 |\n| Procesos transversales TO-BE | \`OPS-CAN-001\`, \`OPS-LOG-001\`, \`OPS-B2B-001\` | E2 |\n| Diseño productivo | \`OPS-REC-001\`, \`OPS-PRD-001\`, \`OPS-TRZ-001\` | FOGO, con salidas a NEXO, E4 y NUMERA |\n| Configuración comercial por sede | \`OPS-POS-001\` | PULSO |\n| Caso financiero de producción | \`OPS-CST-001\` | NUMERA |\n\nUna tarea derivada conserva su identificador transversal \`OPS-*\`, pero se\nmaterializa en el bloque que posee su resultado. El prefijo no determina por sí\nsolo el bloque propietario.\n`,
    'distribución de tareas en roadmap maestro'
  );
}
write('docs/plan-canonico/modular/02_ROADMAP_MAESTRO.md', roadmap);

let order = read('docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md');
if (!order.includes('Secuencia interna obligatoria de BLOQUE E1')) {
  order = replaceOnce(
    order,
    '6. BLOQUE E1 — Auditar operación real, capacidades, dominios y cobertura de implementación\n',
    `6. BLOQUE E1 — Auditar operación real, capacidades, dominios y cobertura de implementación\n\n   Secuencia interna obligatoria de BLOQUE E1:\n\n   \`OPS-AUD-001\` a \`OPS-AUD-015\`\n   → \`OPS-ADM-001\`\n   → \`OPS-GOV-001\`\n   → \`OPS-ACT-001\`\n   → \`OPS-PLAN-001\` a \`OPS-PLAN-004\`\n   → \`CAP-MAP-001\` y continuidad vigente de E1.\n\n   La recolección de evidencia de \`OPS-PLAN-002\` a \`OPS-PLAN-004\` puede comenzar en paralelo, pero su aprobación formal respetará esta secuencia.\n`,
    'secuencia interna de E1'
  );
  order = replaceOnce(
    order,
    '8. BLOQUE E2 — Diseñar procesos TO-BE, actores, pantallas, experiencia y requisitos no funcionales\n',
    '8. BLOQUE E2 — Diseñar procesos TO-BE, actores, pantallas, experiencia y requisitos no funcionales, incluyendo `OPS-CAN-001`, `OPS-LOG-001` y `OPS-B2B-001`\n',
    'tareas E2 derivadas'
  );
  order = order.replace('42. Auditar y diseñar FOGO', '42. Auditar y diseñar FOGO, incluyendo `OPS-REC-001`, `OPS-PRD-001` y `OPS-TRZ-001`');
  order = order.replace('52. Auditar venta, caja, pagos, mesas, comandas, preparación, entrega y salón', '52. Auditar venta, caja, pagos, mesas, comandas, preparación, entrega y salón, y ejecutar `OPS-POS-001` antes del diseño detallado del POS');
  order = order.replace('60. Consumir la matriz E1 y ejecutar NUMERA-AUD-001 a NUMERA-AUD-012', '60. Consumir la matriz E1, ejecutar NUMERA-AUD-001 a NUMERA-AUD-012 y resolver `OPS-CST-001` antes de cerrar el alcance financiero objetivo');
}
write('docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md', order);

let header = read('docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md');
header = header.replace(/^\| Versión\s*\|[^\n]*\|$/m, '| Versión | 2026-07-22 |');
header = header.replace(/^\| Revisión documental\s*\|[^\n]*\|$/m, '| Revisión documental | **40** |');
header = header.replace(/^\| Fragmentos canónicos\s*\|[^\n]*\|$/m, `| Fragmentos canónicos | **${manifest.files.length}** |`);
write('docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md', header);

console.log('Integración documental de OPS-AUD-001 aplicada.');
console.log(`Fragmentos canónicos: ${manifest.files.length}`);
console.log('Tareas nuevas materializadas: 15');
