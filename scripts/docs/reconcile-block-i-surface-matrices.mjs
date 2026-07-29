import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const INVENTORY_PATH =
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/01_INVENTARIO_COMPLETO_DE_SUPERFICIES.md';
const BINDINGS_PATH =
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/02_VINCULACION_CON_PROCESOS_Y_APLICACIONES.md';
const CLASSIFICATION_PATH =
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/03_CLASIFICACION_FUNCIONAL_Y_CONTEXTO_DE_USO.md';

const passSurfaces = [
  {
    id: 'PASS-CUSTOMER-SURFACE-001',
    name: 'Auth — acceso del cliente',
    source: 'src/components/Auth.tsx',
    exposure: 'PRE_NAVIGATION_GATE',
    behavior: 'Autenticar o recuperar la sesión del cliente',
    process: 'VPROC-0059',
    processName: 'Gestionar ciclo de acceso tecnológico',
    step: 'VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER',
    label: 'Autenticar o recuperar la sesión',
    role: 'VALIDATE',
    position: 'INITIAL',
    primaryApp: 'shell',
    ownerApp: 'viso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_HANDOFF_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-002',
    name: 'CompleteProfile — completar perfil',
    source: 'src/components/CompleteProfile.tsx',
    exposure: 'PRE_NAVIGATION_GATE',
    behavior: 'Completar el perfil personal requerido',
    process: 'VPROC-0045',
    processName: 'Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados',
    step: 'VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT',
    label: 'Gestionar perfil, privacidad y consentimientos',
    role: 'SELF_SERVICE',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pass',
    consumerOnly: false,
    consumerMode: 'OWNER_GOVERNS_CAPABILITY',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-003',
    name: 'Home — inicio del cliente',
    source: 'src/components/Home.tsx',
    exposure: 'STACK_SCREEN',
    behavior: 'Presentar inicio, identidad, puntos, beneficios y accesos personales',
    process: 'VPROC-0045',
    processName: 'Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados',
    step: 'VPROC-0045::STEP-ENTER_LOYALTY_HOME',
    label: 'Entrar a fidelización personal',
    role: 'ENTRY',
    position: 'PRECONDITION',
    primaryApp: 'pass',
    ownerApp: 'pass',
    consumerOnly: false,
    consumerMode: 'OWNER_GOVERNS_CAPABILITY',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-004',
    name: 'Club — beneficios y recompensas',
    source: 'src/components/ClubScreen.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Consultar beneficios, recompensas y condiciones vigentes',
    process: 'VPROC-0045',
    processName: 'Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados',
    step: 'VPROC-0045::STEP-CONSULT_REWARDS_CATALOG',
    label: 'Consultar beneficios y recompensas',
    role: 'MONITOR',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pass',
    consumerOnly: false,
    consumerMode: 'OWNER_GOVERNS_CAPABILITY',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-005',
    name: 'MyOrders — pedidos propios',
    source: 'src/components/MyOrdersScreen.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Consultar pedidos propios y sus estados',
    process: 'VPROC-0039',
    processName: 'Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados',
    step: 'VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS',
    label: 'Consultar pedidos propios',
    role: 'MONITOR',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_EFECTO_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-006',
    name: 'ChooseSatellite — selección de marca o sede',
    source: 'src/components/ChooseSatelliteScreen.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Seleccionar el contexto de compra del cliente',
    process: 'VPROC-0039',
    processName: 'Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados',
    step: 'VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE',
    label: 'Entrar y seleccionar contexto de compra',
    role: 'ENTRY',
    position: 'PRECONDITION',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_EFECTO_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-007',
    name: 'DeliveryAddresses — direcciones de entrega',
    source: 'src/components/DeliveryAddressesScreen.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Gestionar direcciones y seleccionar modalidad de entrega',
    process: 'VPROC-0050',
    processName: 'Integrar entrega de tercero con seguimiento, prueba y conciliación interna',
    step: 'VPROC-0050::STEP-SELECT_FULFILLMENT',
    label: 'Seleccionar dirección, modalidad y programación',
    role: 'CAPTURE',
    position: 'INITIAL',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_EFECTO_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-008',
    name: 'AccountSettings — cuenta y privacidad',
    source: 'src/components/settings/AccountSettings.tsx',
    exposure: 'STACK_SCREEN',
    behavior: 'Gestionar perfil, preferencias y datos personales',
    process: 'VPROC-0045',
    processName: 'Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados',
    step: 'VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT',
    label: 'Gestionar perfil, privacidad y consentimientos',
    role: 'SELF_SERVICE',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pass',
    consumerOnly: false,
    consumerMode: 'OWNER_GOVERNS_CAPABILITY',
  },
  ...[
    ['009', 'VentoCafe — experiencia de marca', 'src/components/VentoCafe.tsx'],
    ['010', 'Saudo — experiencia de marca', 'src/components/Saudo.tsx'],
    ['011', 'SatelliteExperience — hub de experiencias', 'src/components/SatelliteHub.tsx'],
    ['012', 'SatellitePass — experiencia de sede', 'src/components/SatelliteExperience.tsx'],
  ].map(([suffix, name, source]) => ({
    id: `PASS-CUSTOMER-SURFACE-${suffix}`,
    name,
    source,
    exposure: suffix === '011' || suffix === '012' ? 'STACK_SCREEN' : 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Consultar experiencia, oferta y contenido comercial publicado',
    process: 'VPROC-0017',
    processName: 'Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales',
    step: 'VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER',
    label: 'Consultar menú y catálogo comercial',
    role: 'MONITOR',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'REFERENCIA_Y_EVENTO',
  })),
  {
    id: 'PASS-CUSTOMER-SURFACE-013',
    name: 'OrderHome — entrada al portal de compras',
    source: 'src/components/OrderHome.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Entrar al portal de compras y seleccionar contexto',
    process: 'VPROC-0039',
    processName: 'Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados',
    step: 'VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE',
    label: 'Entrar y seleccionar contexto de compra',
    role: 'ENTRY',
    position: 'PRECONDITION',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_EFECTO_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-014',
    name: 'OrderMenu — menú y configuración del pedido',
    source: 'src/components/OrderMenu.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Consultar oferta y configurar el carrito del pedido',
    process: 'VPROC-0017',
    processName: 'Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales',
    step: 'VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER',
    label: 'Consultar menú y catálogo comercial',
    role: 'MONITOR',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'REFERENCIA_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-015',
    name: 'OrderCheckout — revisión e inicio de pago',
    source: 'src/components/OrderCheckout.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Revisar el pedido e iniciar el pago',
    process: 'VPROC-0043',
    processName: 'Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable',
    step: 'VPROC-0043::STEP-REVIEW_AND_START_PAYMENT',
    label: 'Revisar pedido e iniciar pago',
    role: 'VALIDATE',
    position: 'DECISION',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_EFECTO_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-016',
    name: 'OrderPlaced — confirmación y retorno de pago',
    source: 'src/components/OrderPlacedScreen.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG_DEEP_LINK',
    behavior: 'Presentar confirmación del pedido y resultado de pago',
    process: 'VPROC-0043',
    processName: 'Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable',
    step: 'VPROC-0043::STEP-PRESENT_ORDER_RECEIPT',
    label: 'Presentar confirmación y resultado de pago',
    role: 'RECEIPT',
    position: 'TERMINAL',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_EFECTO_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-017',
    name: 'OrderChat — comunicación del pedido',
    source: 'src/components/OrderChatScreen.tsx',
    exposure: 'STACK_SCREEN_FEATURE_FLAG',
    behavior: 'Intercambiar mensajes vinculados con un pedido',
    process: 'VPROC-0047',
    processName: 'Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento',
    step: 'VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER',
    label: 'Comunicarse sobre un pedido',
    role: 'SELF_SERVICE',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pulso',
    consumerOnly: true,
    consumerMode: 'SOLICITUD_EFECTO_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-018',
    name: 'QrModal — identificación personal',
    source: 'src/components/home/QrModal.tsx',
    exposure: 'GLOBAL_MODAL',
    behavior: 'Presentar identificación QR personal del cliente',
    process: 'VPROC-0045',
    processName: 'Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados',
    step: 'VPROC-0045::STEP-PRESENT_CUSTOMER_ID',
    label: 'Presentar identificación personal',
    role: 'IDENTIFY',
    position: 'IN_PROGRESS',
    primaryApp: 'pass',
    ownerApp: 'pass',
    consumerOnly: false,
    consumerMode: 'OWNER_GOVERNS_CAPABILITY',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-019',
    name: 'AppUpdateGate — compatibilidad de versión',
    source: 'src/components/AppUpdateGate.js',
    exposure: 'GLOBAL_RECOVERY_SURFACE',
    behavior: 'Bloquear o advertir actualización de la aplicación',
    process: 'VPROC-0058',
    processName: 'Gestionar solicitudes e incidentes tecnológicos',
    step: 'VPROC-0058::STEP-RESTORE_APPLICATION_COMPATIBILITY',
    label: 'Restablecer compatibilidad mediante actualización',
    role: 'RECOVER',
    position: 'PRECONDITION',
    primaryApp: 'shell',
    ownerApp: 'viso',
    consumerOnly: true,
    consumerMode: 'PROYECCION_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-020',
    name: 'App runtime gates — carga, configuración y perfil',
    source: 'App.js',
    exposure: 'GLOBAL_STATE_SURFACE',
    behavior: 'Presentar carga, configuración incompleta, validación o error de perfil',
    process: 'VPROC-0058',
    processName: 'Gestionar solicitudes e incidentes tecnológicos',
    step: 'VPROC-0058::STEP-TRIAGE_TECHNOLOGY_REQUEST',
    label: 'Clasificar bloqueo técnico de aplicación',
    role: 'TRIAGE',
    position: 'PRECONDITION',
    primaryApp: 'shell',
    ownerApp: 'viso',
    consumerOnly: true,
    consumerMode: 'PROYECCION_Y_EVENTO',
  },
  {
    id: 'PASS-CUSTOMER-SURFACE-021',
    name: 'AppErrorBoundary — recuperación de error',
    source: 'src/components/AppErrorBoundary.js',
    exposure: 'GLOBAL_RECOVERY_SURFACE',
    behavior: 'Recuperar la experiencia después de un error no controlado',
    process: 'VPROC-0062',
    processName: 'Gestionar continuidad y recuperación',
    step: 'VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY',
    label: 'Recuperar operación después de error global',
    role: 'RECOVER',
    position: 'IN_PROGRESS',
    primaryApp: 'shell',
    ownerApp: 'viso',
    consumerOnly: true,
    consumerMode: 'PROYECCION_Y_EVENTO',
  },
];

function q(value) {
  return `\`${value}\``;
}

function tableRow(values) {
  return `| ${values.join(' | ')} |`;
}

function inventoryRows() {
  return passSurfaces.map((surface) => tableRow([
    q(surface.id),
    q(surface.exposure),
    q(surface.name),
    q(surface.source),
    surface.behavior,
    surface.primaryApp === 'shell' ? 'Frontera transversal de SHELL' : 'Experiencia personal del cliente',
    'Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015.',
  ])).join('\n');
}

function bindingRows() {
  return passSurfaces.map((surface) => tableRow([
    q(surface.id),
    q(surface.name),
    q(surface.process),
    surface.processName,
    q(surface.exposure === 'GLOBAL_RECOVERY_SURFACE' || surface.exposure === 'GLOBAL_STATE_SURFACE'
      ? 'GLOBAL_RECOVERY_SURFACE'
      : surface.exposure === 'GLOBAL_MODAL'
        ? 'SUBORDINATE_SURFACE'
        : surface.exposure === 'PRE_NAVIGATION_GATE'
          ? 'ACCESS_SURFACE'
          : 'DIRECT_MOBILE_SCREEN'),
    q('BOUND'),
    `La intención principal corresponde a «${surface.behavior.toLowerCase()}» dentro de ${surface.processName.toLowerCase()}.`,
  ])).join('\n');
}

function stepRows() {
  return passSurfaces.map((surface) => tableRow([
    q(surface.id),
    q(surface.name),
    q(surface.process),
    q(surface.step),
    surface.label,
    q(surface.role),
    q(surface.position),
    q('STEP_BOUND'),
    `El propósito dominante de la superficie es «${surface.label.toLowerCase()}» dentro de ${surface.processName.toLowerCase()}.`,
  ])).join('\n');
}

function applicationRows() {
  return passSurfaces.map((surface) => tableRow([
    q(surface.id),
    q(surface.name),
    q(surface.process),
    q(surface.step),
    q('pass'),
    q(surface.primaryApp),
    q(surface.ownerApp),
    q(surface.primaryApp === 'shell' ? 'TRANSVERSAL_SHELL_BOUNDARY' : 'CURRENT_APPLICATION_CONFIRMED'),
    q('APPLICATION_BOUND'),
    surface.primaryApp === 'shell'
      ? 'La superficie existe en PASS, pero su intención corresponde a acceso, compatibilidad o recuperación transversal gobernada por SHELL.'
      : 'La superficie pertenece a la experiencia personal, fidelización o canal de compra del cliente presentada por PASS.',
  ])).join('\n');
}

function consumptionRows() {
  return passSurfaces.map((surface) => {
    if (!surface.consumerOnly) {
      return tableRow([
        q(surface.id), q(surface.name), q(surface.process), q(surface.step),
        q(surface.primaryApp), q(surface.ownerApp), q('false'), q('OWNER_APPLICATION'),
        q('NOT_APPLICABLE_OWNER'), q('OWNER_GOVERNS_CAPABILITY'),
        q('CAPABILITY_OWNER_CONFIRMED'),
        'PASS gobierna la identidad, el perfil o el ledger presentado por esta superficie y no consume una fuente de verdad competidora.',
      ]);
    }
    return tableRow([
      q(surface.id), q(surface.name), q(surface.process), q(surface.step),
      q(surface.primaryApp), q(surface.ownerApp), q('true'), q('DIRECT_CONSUMER'),
      q('DECLARED_IN_PROC_CAT_006'), q(surface.consumerMode),
      q('CONSUMER_ONLY_DIRECT_CONFIRMED'),
      `${q(surface.primaryApp)} figura como consumidora directa de ${q(surface.process)}; la superficie presenta o solicita únicamente el efecto autorizado sin apropiarse del proceso gobernado por ${q(surface.ownerApp)}.`,
    ]);
  }).join('\n');
}

function operationalRows() {
  return passSurfaces.map((surface) => tableRow([
    q(surface.id), q(surface.name), q(surface.process), q(surface.step), q(surface.role),
    q(surface.primaryApp), q(surface.ownerApp), q(String(surface.consumerOnly)), q('false'),
    q('NOT_OPERATIONAL'), q('NONE'), q('NON_OPERATIONAL_CLASSIFIED'),
    'Es una superficie de cliente, acceso, compatibilidad o recuperación; no ejecuta trabajo operativo interno de primera línea.',
  ])).join('\n');
}

function replaceOnce(source, from, to, label) {
  const index = source.indexOf(from);
  if (index < 0) throw new Error(`no se encontró ${label}`);
  if (source.indexOf(from, index + from.length) >= 0) {
    throw new Error(`${label} aparece más de una vez`);
  }
  return source.replace(from, to);
}

function taskSlice(source, id, nextId) {
  const start = source.indexOf(`### ✅ ${id}`);
  const nextPattern = new RegExp(`^###\\s+(?:✅|🟡|❌|\\[[ x~]\\])\\s+${nextId}\\b`, 'm');
  const nextMatch = source.slice(start + 1).match(nextPattern);
  const end = nextMatch ? start + 1 + nextMatch.index : source.length;
  if (start < 0) throw new Error(`no se pudo aislar ${id}`);
  return { start, end, text: source.slice(start, end) };
}

function updateTask(source, id, nextId, transform) {
  const section = taskSlice(source, id, nextId);
  return source.slice(0, section.start) + transform(section.text) + source.slice(section.end);
}

function insertBeforeFirstPassLabor(section, rows, label) {
  if (section.includes('PASS-CUSTOMER-SURFACE-001')) return section;
  const marker = '| `PASS-LABOR-SURFACE-001`';
  const index = section.indexOf(marker);
  if (index < 0) throw new Error(`no se encontró la inserción PASS de ${label}`);
  return section.slice(0, index) + rows + '\n' + section.slice(index);
}

function updateCommonCounts(section) {
  return section
    .replaceAll('243', '264')
    .replaceAll('236', '252')
    .replaceAll(
      'siete aliases documentales y cinco redirects',
      'doce referencias no renderizadas: siete aliases y cinco redirects'
    )
    .replaceAll(
      'siete aliases documentales',
      'doce referencias no renderizadas: siete aliases y cinco redirects'
    )
    .replaceAll(
      'doce referencias no renderizadas: siete aliases y cinco redirects y cinco redirects',
      'doce referencias no renderizadas: siete aliases y cinco redirects'
    )
    .replaceAll(/siete aliases(?! y cinco redirects)/g, 'siete aliases y cinco redirects')
    .replaceAll(/7 aliases(?! y 5 redirects)/g, '7 aliases y 5 redirects');
}

function reconcileRedirectRows(section, columns, taskId) {
  const targets = new Map([
    ['NEXO-ROUTE-055', 'NEXO-ROUTE-020'],
    ['NEXO-ROUTE-057', 'NEXO-ROUTE-022 o NEXO-ROUTE-026'],
    ['NEXO-ROUTE-058', 'NEXO-ROUTE-025'],
    ['NEXO-ROUTE-064', 'NEXO-ROUTE-020'],
    ['AURA-CURRENT-PUBLIC-007', 'AURA-CURRENT-PUBLIC-002'],
  ]);
  return section.split('\n').map((line) => {
    for (const [id, target] of targets) {
      if (!line.startsWith(`| \`${id}\``)) continue;
      const cells = line.slice(1, -1).split('|').map((cell) => cell.trim());
      if (cells.length !== columns) throw new Error(`${id} no tiene ${columns} columnas en ${taskId}`);
      if (taskId === 'AUTH-UI-011') {
        cells[5] = '`REDIRECT_INHERITED`';
        cells[6] = `Ruta de entrada sin render propio; hereda el proceso de \`${target}\` y no crea una vista única.`;
      } else if (taskId === 'AUTH-UI-013') {
        cells[7] = '`REDIRECT_APPLICATION_INHERITED`';
        cells[8] = '`APPLICATION_REDIRECT_INHERITED`';
        cells[9] = `Ruta de entrada sin render propio; hereda la aplicación de \`${target}\` sin crear propiedad independiente.`;
      } else if (taskId === 'AUTH-UI-014') {
        cells[10] = '`REDIRECT_CONSUMPTION_INHERITED`';
        cells[11] = `Ruta de entrada sin render propio; hereda consumer_only y relación de \`${target}\`.`;
      }
      return tableRow(cells);
    }
    return line;
  }).join('\n');
}

function updateSourceDistribution(section) {
  return section
    .replace('| Inventario fuente | Filas de vínculo | Vistas únicas | Aliases |',
      '| Inventario fuente | Filas de vínculo | Vistas renderizadas | Referencias |')
    .replace('| Inventario fuente | Filas | Vistas únicas | Aliases |',
      '| Inventario fuente | Filas | Vistas renderizadas | Referencias |')
    .replace('| `NEXO`            | 64               | 64            | 0       |',
      '| `NEXO`            | 64               | 60                  | 4           |')
    .replace('| `NEXO`            | 64    | 64            | 0       |',
      '| `NEXO`            | 64    | 60                  | 4           |')
    .replace('| `PASS`            | 10               | 10            | 0       |',
      '| `PASS`            | 31               | 31                  | 0           |')
    .replace('| `PASS`            | 10    | 10            | 0       |',
      '| `PASS`            | 31    | 31                  | 0           |')
    .replace('| `AURA`            | 30               | 23            | 7       |',
      '| `AURA`            | 30               | 22                  | 8           |')
    .replace('| `AURA`            | 30    | 23            | 7       |',
      '| `AURA`            | 30    | 22                  | 8           |');
}

function reconcileInventory(root) {
  const fullPath = path.join(root, INVENTORY_PATH);
  let source = fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/g, '\n');
  const oldTitle = 'Inventariar superficies laborales relacionadas con PASS';
  const newTitle = 'Inventariar todas las superficies de PASS y sus fronteras laborales';
  source = source.replaceAll(oldTitle, newTitle);

  const section = taskSlice(source, 'AUTH-UI-009', 'AUTH-UI-010');
  let task = section.text;
  task = task.replace(
    '**Tipo de tarea:** inventario técnico-documental transversal de superficies laborales embebidas en PASS y operaciones laborales de PULSO relacionadas con PASS; sin cambios de código, Supabase, navegación runtime ni despliegue',
    '**Tipo de tarea:** inventario técnico-documental integral de pantallas de cliente, superficies transversales y fronteras laborales relacionadas con PASS; sin cambios de código, Supabase, navegación runtime ni despliegue',
  );
  task = task.replace(
    'Inventariar de forma exhaustiva, reproducible y sin confundir audiencias todas las superficies laborales actuales relacionadas con PASS. La revisión cubre dos fronteras distintas:',
    'Inventariar de forma exhaustiva, reproducible y sin confundir audiencias todas las superficies actuales de PASS. La revisión cubre tres fronteras distintas:',
  );
  task = task.replace(
    '1. las superficies laborales embebidas dentro de la aplicación móvil de cliente `vento-pass`, donde se consulta perfil laboral y se ofrece un modo local de prueba de rol y sede;\n2. la superficie operativa de trabajadores en `vento-pulso`, donde caja identifica clientes, otorga puntos y valida redenciones de Vento Pass.',
    '1. las pantallas, gates y superficies globales de la aplicación móvil de cliente `vento-pass`;\n2. las superficies laborales embebidas dentro de PASS, separadas de la experiencia de cliente;\n3. la superficie operativa de trabajadores en `vento-pulso`, donde caja identifica clientes, otorga puntos y valida redenciones de Vento Pass.',
  );
  task = task.replace(
    '1. El stack de `App.js` se utiliza para comprobar si existe una ruta laboral dedicada dentro de PASS.',
    '1. `App.js`, sus retornos previos a navegación, el stack, modales globales y límites de error se inventarían por separado; el stack también permite comprobar si existe una ruta laboral dedicada.',
  );
  if (!task.includes('| Pantallas declaradas en el stack de PASS')) {
    task = task.replace(
      '| Rutas exclusivamente laborales dentro de PASS     |     **0** |',
      '| Pantallas declaradas en el stack de PASS          |    **15** |\n'
        + '| Superficies de cliente y transversales de PASS    |    **21** |\n'
        + '| Rutas exclusivamente laborales dentro de PASS     |     **0** |',
    );
  }
  task = task.replace(
    /(?:\| Pantallas declaradas en el stack de PASS\s+\|\s+\*\*15\*\* \|\n\| Superficies de cliente y transversales de PASS\s+\|\s+\*\*21\*\* \|\n)+/g,
    '| Pantallas declaradas en el stack de PASS          |    **15** |\n'
      + '| Superficies de cliente y transversales de PASS    |    **21** |\n',
  );
  task = task.replace(
    '| Superficies laborales runtime relacionadas, total |    **10** |\n| Requisitos nuevos                                 |    **22** |',
    '| Superficies laborales runtime relacionadas, total |    **10** |\n'
      + '| Superficies AS-IS incorporadas a AUTH-UI-011      |    **31** |\n'
      + '| Requisitos nuevos                                 |    **30** |',
  );

  if (!task.includes('PASS-CUSTOMER-SURFACE-INVENTORY-001')) {
    for (let number = 17; number >= 6; number -= 1) {
      task = task.replaceAll(`#### ${number}.`, `#### ${number + 1}.`);
    }
    const marker = '#### 7. `PASS-LABOR-SURFACE-INVENTORY-001`';
    const block = `#### 6. \`PASS-CUSTOMER-SURFACE-INVENTORY-001\`

Las siguientes 21 unidades son superficies lógicas AS-IS. Las primeras quince corresponden exactamente a los \`Stack.Screen\` montados por \`App.js\`; las restantes cubren acceso, perfil, QR, actualización, gates de runtime y recuperación. Los estados puramente decorativos internos no se convierten en vistas adicionales.

| ID | Tipo | Superficie | Archivo fuente | Comportamiento observado | Frontera | Límite documental |
| --- | --- | --- | --- | --- | --- | --- |
${inventoryRows()}

Los quince nombres de stack quedan congelados por el validador local contra \`vento-pass/App.js\`. Agregar, retirar o renombrar un \`Stack.Screen\` obliga a actualizar este inventario y las matrices \`AUTH-UI-011\` a \`AUTH-UI-015\`.

`;
    task = replaceOnce(task, marker, block + marker, 'sección laboral PASS renumerada');
  }
  task = task.replace(
    'El stack principal registra pantallas de cliente y comercio, pero no una pantalla dedicada a trabajo, administración laboral o caja.',
    'El stack principal registra quince pantallas de cliente y comercio inventariadas en `PASS-CUSTOMER-SURFACE-INVENTORY-001`, pero no una pantalla dedicada a trabajo, administración laboral o caja.',
  );
  task = task.replace(
    'TREQ-PASS-013 a TREQ-PASS-034',
    'TREQ-PASS-013 a TREQ-PASS-042',
  );
  task = task.replace(
    '- [x] Se registran exactamente tres superficies laborales embebidas activas en PASS.',
    '- [x] Se registran exactamente quince pantallas de stack y veintiuna superficies lógicas de cliente o transversales en PASS.\n'
      + '- [x] Se registran exactamente tres superficies laborales embebidas activas en PASS.',
  );

  source = source.slice(0, section.start) + task + source.slice(section.end);
  fs.writeFileSync(fullPath, source.endsWith('\n') ? source : `${source}\n`, 'utf8');
}

function reconcileBindings(root) {
  const fullPath = path.join(root, BINDINGS_PATH);
  let source = fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/g, '\n');

  source = updateTask(source, 'AUTH-UI-011', 'AUTH-UI-012', (initial) => {
    let section = updateSourceDistribution(updateCommonCounts(initial));
    section = insertBeforeFirstPassLabor(section, bindingRows(), 'AUTH-UI-011');
    section = section
      .replace('| Unidades de vista únicas                |                     **252** |',
        '| Vistas renderizadas únicas                |                     **252** |')
      .replace('| Aliases documentales sin nueva vista    |                       **7** |',
        '| Referencias sin vista renderizada         |                      **12** |\n'
          + '| Aliases documentales                     |                       **7** |\n'
          + '| Redirects de entrada                     |                       **5** |')
      .replace('`BOUND`, `ALIAS_INHERITED` o `LEGACY_AS_IS_BOUND`',
        '`BOUND`, `ALIAS_INHERITED`, `REDIRECT_INHERITED` o `LEGACY_AS_IS_BOUND`');
    return reconcileRedirectRows(section, 7, 'AUTH-UI-011');
  });

  source = updateTask(source, 'AUTH-UI-012', 'AUTH-UI-013', (initial) => {
    let section = updateSourceDistribution(updateCommonCounts(initial));
    section = insertBeforeFirstPassLabor(section, stepRows(), 'AUTH-UI-012');
    section = section
      .replace('| Unidades de vista únicas                          |      **252** |',
        '| Vistas renderizadas únicas                          |      **252** |')
      .replace('| Aliases documentales sin nueva vista              |        **7** |',
        '| Referencias sin vista renderizada                   |       **12** |')
      .replace('| Anclas distintas utilizadas                       |      **117** |',
        '| Anclas distintas utilizadas                       |      **129** |');
    return section;
  });

  source = updateTask(source, 'AUTH-UI-013', 'AUTH-UI-014', (initial) => {
    let section = updateSourceDistribution(updateCommonCounts(initial));
    section = insertBeforeFirstPassLabor(section, applicationRows(), 'AUTH-UI-013');
    section = section
      .replace('| Aliases documentales                                         |        **7** |',
        '| Referencias sin vista renderizada                            |       **12** |')
      .replace('| Vistas únicas alineadas con runtime actual                   |      **148** |',
        '| Vistas renderizadas alineadas con runtime actual             |      **161** |')
      .replace('| Vistas únicas con runtime distinto                           |       **88** |',
        '| Vistas renderizadas con runtime distinto                     |       **91** |')
      .replace('| Vistas cuya aplicación difiere de la propietaria del proceso |       **71** |',
        '| Vistas cuya aplicación difiere de la propietaria del proceso |       **87** |')
      .replace('| Vistas únicas asignadas a SHELL                              |       **42** |',
        '| Vistas renderizadas asignadas a SHELL                        |       **46** |')
      .replace(
        /(?:\| `REDIRECT_APPLICATION_INHERITED` \| una ruta de entrada sin render propio hereda aplicación de su destino\s+\|\n)+/g,
        '',
      );
    if (!section.includes('| `REDIRECT_APPLICATION_INHERITED` |')) {
      section = section.replace(
        '| `ALIAS_APPLICATION_INHERITED`   | una referencia documental hereda la aplicación primaria de su vista fuente                           |',
        '| `ALIAS_APPLICATION_INHERITED`   | una referencia documental hereda la aplicación primaria de su vista fuente                           |\n'
          + '| `REDIRECT_APPLICATION_INHERITED` | una ruta de entrada sin render propio hereda aplicación de su destino                              |',
      );
    }
    section = section
      .replaceAll('**71 vistas únicas**', '**87 vistas renderizadas**')
      .replaceAll('Las 71 diferencias aplicación–proceso', 'Las 87 diferencias aplicación–proceso')
      .replaceAll('Las 71 vistas cuya aplicación primaria difiere', 'Las 87 vistas cuya aplicación primaria difiere');
    return reconcileRedirectRows(section, 10, 'AUTH-UI-013');
  });

  source = updateTask(source, 'AUTH-UI-014', 'AUTH-UI-015', (initial) => {
    let section = updateCommonCounts(initial);
    section = insertBeforeFirstPassLabor(section, consumptionRows(), 'AUTH-UI-014');
    section = section
      .replaceAll('AUTH-UI-015 — Definir tipo de vista', 'AUTH-UI-015 — Clasificar vista operativa')
      .replace('| Aliases documentales                  |         **7** |',
        '| Referencias sin vista renderizada       |        **12** |')
      .replace('| `consumer_only = false`               | **172 filas** |',
        '| `consumer_only = false`               | **177 filas** |')
      .replace('| `consumer_only = true`                |  **71 filas** |',
        '| `consumer_only = true`                |  **87 filas** |')
      .replace('| Consumidoras directas declaradas      |  **69 filas** |',
        '| Consumidoras directas declaradas      |  **85 filas** |')
      .replace(
        'Las 172 filas propietarias incluyen los siete aliases de AURA. En términos de unidades de vista, existen **165 vistas propietarias**, **71 vistas consumidoras** y siete referencias alias sin identidad adicional.',
        'Las 177 filas propietarias incluyen doce referencias no renderizadas. En términos de vistas renderizadas, existen **165 vistas propietarias**, **87 vistas consumidoras** y doce referencias —siete aliases y cinco redirects— sin identidad adicional.',
      )
      .replace('| `shell`    |    42 |           0 |                  41 |                       0 |      1 |',
        '| `shell`    |    46 |           0 |                  45 |                       0 |      1 |')
      .replace('| `pass`     |     3 |           3 |                   0 |                       0 |      0 |',
        '| `pass`     |    20 |           8 |                  12 |                       0 |      0 |');
    section = section
      .replace('Las 172 filas propietarias incluyen los siete aliases y cinco redirects de AURA. En términos de unidades de vista, existen **165 vistas propietarias**, **71 vistas consumidoras** y siete referencias alias sin identidad adicional.',
        'Las 177 filas propietarias incluyen doce referencias no renderizadas. En términos de vistas renderizadas, existen **165 vistas propietarias**, **87 vistas consumidoras** y doce referencias —siete aliases y cinco redirects— sin identidad adicional.')
      .replaceAll('172 propietarias, 69 directas', '177 propietarias, 85 directas')
      .replaceAll('Las 172 filas cuya aplicación primaria coincide', 'Las 177 filas cuya aplicación primaria coincide')
      .replaceAll('Las 69 filas clasificadas como consumidoras directas', 'Las 85 filas clasificadas como consumidoras directas')
      .replaceAll('172/69/1/1', '177/85/1/1')
      .replaceAll('172 relaciones propietarias y 71 consumidoras', '177 relaciones propietarias y 87 consumidoras')
      .replaceAll('69 consumidoras directas', '85 consumidoras directas');
    return reconcileRedirectRows(section, 12, 'AUTH-UI-014');
  });

  fs.writeFileSync(fullPath, source.endsWith('\n') ? source : `${source}\n`, 'utf8');
}

function reconcileClassification(root) {
  const fullPath = path.join(root, CLASSIFICATION_PATH);
  let source = fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/g, '\n');
  source = updateTask(source, 'AUTH-UI-015', 'AUTH-UI-016', (initial) => {
    let section = initial
      .replaceAll('243', '264')
      .replaceAll('236', '252')
      .replace(
        'La expresión «Definir tipo de vista» utilizada en la continuidad de `AUTH-UI-014` se conserva únicamente como descripción informal del handoff y no crea otra tarea ni modifica la secuencia.',
        'La continuidad de `AUTH-UI-014` utiliza el mismo título canónico; no existe un alias nominal para esta tarea.',
      )
      .replace('`DIRECT_OPERATION`, `HYBRID_OPERATION`, `NOT_OPERATIONAL` o `ALIAS_INHERITED`',
        '`DIRECT_OPERATION`, `HYBRID_OPERATION`, `NOT_OPERATIONAL`, `ALIAS_INHERITED` o `REDIRECT_INHERITED`')
      .replace('| Filas clasificadas           |   **264** |', '| Filas clasificadas           |   **264** |')
      .replace('| Vistas únicas                |   **252** |', '| Vistas renderizadas únicas   |   **252** |')
      .replace(/(?:\| Referencias no renderizadas\s+\|\s+\*\*12\*\* \|\n)+/g, '')
      .replace(/(?:\| Redirects de entrada\s+\|\s+\*\*5\*\* \|\n)+/g, '')
      .replace(/(?:\| `REDIRECT_INHERITED`\s+\|\s+\*\*5\*\* \|\n)+/g, '')
      .replace('| `is_operational = true`      |    **63** |', '| `is_operational = true`      |    **59** |')
      .replace('| `is_operational = false`     |   **180** |', '| `is_operational = false`     |   **205** |')
      .replace('| `DIRECT_OPERATION`           |    **29** |', '| `DIRECT_OPERATION`           |    **28** |')
      .replace('| `HYBRID_OPERATION`           |    **34** |', '| `HYBRID_OPERATION`           |    **31** |')
      .replace('| `NOT_OPERATIONAL`            |   **173** |', '| `NOT_OPERATIONAL`            |   **193** |')
      .replace('| `ALIAS_INHERITED`            |     **7** |',
        '| `ALIAS_INHERITED`            |     **7** |')
      .replace('| Requisitos nuevos            |    **24** |', '| Requisitos nuevos            |    **26** |')
      .replace('| `NEXO`     |    64 |         39 |       14 |       25 |            25 |       0 |',
        '| `NEXO`     |    64 |         35 |       13 |       22 |            25 |       4 |')
      .replace('| `PASS`     |    10 |          7 |        7 |        0 |             3 |       0 |',
        '| `PASS`     |    31 |          7 |        7 |        0 |            24 |       0 |')
      .replace('| `AURA`     |    30 |          0 |        0 |        0 |            23 |       7 |',
        '| `AURA`     |    30 |          0 |        0 |        0 |            22 |       8 |')
      .replace('| Inventario | Filas | Operativas | Directas | Híbridas | No operativas | Aliases |',
        '| Inventario | Filas | Operativas | Directas | Híbridas | No operativas | Referencias |')
      .replace('NEXO concentra 39 vistas operativas.', 'NEXO concentra 35 vistas operativas renderizadas.')
      .replace(
        'Las rutas comerciales de PULSO son operativas excepto `/no-access`. Las siete superficies laborales de fidelización embebidas en PULSO son operación directa; las tres superficies laborales de PASS dedicadas a contexto o simulación no lo son.',
        'Las rutas comerciales de PULSO son operativas excepto `/no-access`. Las siete superficies laborales de fidelización embebidas en PULSO son operación directa; las tres superficies laborales y las veintiuna superficies de cliente o transversales de PASS no constituyen operación interna.',
      )
      .replace(
        'AURA conserva cero vistas operativas: sus placeholders no habilitan producto, sus superficies CMS son administrativas/editoriales, sus páginas públicas consumen contenido y los siete aliases heredan `false` de VISO.',
        'AURA conserva cero vistas operativas: sus placeholders no habilitan producto, sus superficies CMS son administrativas/editoriales, sus páginas públicas consumen contenido, siete aliases heredan `false` de VISO y `/eventos` hereda de `/restaurantes` como redirect.',
      );
    section = section
      .replace('| Aliases documentales         |     **7** |',
        '| Referencias no renderizadas  |    **12** |\n'
          + '| Aliases documentales         |     **7** |\n'
          + '| Redirects de entrada         |     **5** |')
      .replace('| `ALIAS_INHERITED`            |     **7** |',
        '| `ALIAS_INHERITED`            |     **7** |\n'
          + '| `REDIRECT_INHERITED`         |     **5** |');
    section = insertBeforeFirstPassLabor(section, operationalRows(), 'AUTH-UI-015');

    const redirectReplacements = new Map([
      ['NEXO-ROUTE-055', ['NEXO-ROUTE-020', '/inventory/locations']],
      ['NEXO-ROUTE-057', ['NEXO-ROUTE-022 o NEXO-ROUTE-026', 'destino resuelto por slug']],
      ['NEXO-ROUTE-058', ['NEXO-ROUTE-025', '/inventory/locations/open']],
      ['NEXO-ROUTE-064', ['NEXO-ROUTE-020', '/inventory/locations']],
      ['AURA-CURRENT-PUBLIC-007', ['AURA-CURRENT-PUBLIC-002', '/restaurantes']],
    ]);
    const lines = section.split('\n').map((line) => {
      for (const [id, [target, route]] of redirectReplacements) {
        if (!line.startsWith(`| \`${id}\``)) continue;
        const cells = line.slice(1, -1).split('|').map((cell) => cell.trim());
        if (cells.length !== 13) throw new Error(`${id} no tiene 13 columnas en AUTH-UI-015`);
        cells[8] = '`false`';
        cells[9] = '`REDIRECT_INHERITED`';
        cells[10] = '`INHERITED`';
        cells[11] = '`REDIRECT_CLASSIFICATION_INHERITED`';
        cells[12] = `Ruta de entrada sin render propio; hereda proceso, aplicación y clasificación de \`${target}\` (${route}) y no crea una vista única.`;
        return tableRow(cells);
      }
      return line;
    });
    section = lines.join('\n');
    section = section
      .replaceAll('`NOT_OPERATIONAL` o `ALIAS_INHERITED`', '`NOT_OPERATIONAL`, `ALIAS_INHERITED` o `REDIRECT_INHERITED`')
      .replaceAll('un alias difiera de su fuente', 'un alias o redirect difiera de su fuente o destino')
      .replace(
        'los conteos no sean 29 directas, 34 híbridas, 173 no operativas, siete aliases y 63 operativas',
        'los conteos no sean 28 directas, 31 híbridas, 193 no operativas, siete aliases, cinco redirects y 59 operativas',
      )
      .replaceAll('Las 29 filas DIRECT_OPERATION', 'Las 28 filas DIRECT_OPERATION')
      .replaceAll('Las 34 filas HYBRID_OPERATION', 'Las 31 filas HYBRID_OPERATION')
      .replaceAll('Las 173 filas NOT_OPERATIONAL', 'Las 193 filas NOT_OPERATIONAL')
      .replaceAll('39 vistas operativas: 14 de operación directa y 25 híbridas', '35 vistas operativas: 13 de operación directa y 22 híbridas')
      .replaceAll('Las 30 filas AURA deberán conservar is_operational=false: siete placeholders, siete aliases heredados, nueve superficies CMS y siete superficies públicas',
        'Las 30 filas AURA deberán conservar is_operational=false: siete placeholders, siete aliases heredados, nueve superficies CMS, seis vistas públicas renderizadas y un redirect público')
      .replace(
        'los conteos no son 29 DIRECT_OPERATION, 34 HYBRID_OPERATION, 173 NOT_OPERATIONAL, siete ALIAS_INHERITED y 63 vistas operativas',
        'los conteos no son 28 DIRECT_OPERATION, 31 HYBRID_OPERATION, 193 NOT_OPERATIONAL, siete ALIAS_INHERITED, cinco REDIRECT_INHERITED y 59 vistas operativas',
      )
      .replaceAll('Se identifican 63 vistas operativas y 180 no operativas',
        'Se identifican 59 vistas operativas y 205 no operativas')
      .replace('- [x] Los siete aliases heredan clasificación sin crear conteos adicionales.',
        '- [x] Los siete aliases y cinco redirects heredan clasificación sin crear vistas renderizadas adicionales.')
      .replace('| Filas de clasificación          | **264**', '| Filas de clasificación          | **264**');
    section = section.replace(
      /OPERATIONAL_CLASSIFICATION_REGISTRY_SHA256 = [a-f0-9]{64}\nDIRECT_OPERATION_SHA256 = [a-f0-9]{64}\nHYBRID_OPERATION_SHA256 = [a-f0-9]{64}\nNOT_OPERATIONAL_SHA256 = [a-f0-9]{64}\n(?:ALIAS_OPERATIONAL_INHERITANCE|ALIAS_INHERITED)_SHA256 = [a-f0-9]{64}(?:\nREDIRECT_INHERITED_SHA256 = [a-f0-9]{64})?/,
      'DIRECT_OPERATION_SHA256 = e650197c18c257d92b3251780dede8199949932ffb100b6e248aea429cc2c499\n'
        + 'HYBRID_OPERATION_SHA256 = 48a9c6feb87ea52cc9384eeb56aa5077d9ffd1314df1bafe1ead2ca2f7eb056b\n'
        + 'NOT_OPERATIONAL_SHA256 = 1ecdcd63757007abded53df1bd5929b3ac0e3fc2b174f0593c29d7531ebad90e\n'
        + 'ALIAS_INHERITED_SHA256 = 46012de473ee15732be4ba25976be5aef8436c4ac02b630e804cb8c7d6eba2ff\n'
        + 'REDIRECT_INHERITED_SHA256 = 8195896851fdb764e4920092a6097c1c03bb14ad876119007c55ad2f93ecce4c',
    );
    return section;
  });
  fs.writeFileSync(fullPath, source.endsWith('\n') ? source : `${source}\n`, 'utf8');
}

export function reconcileBlockISurfaceMatrices({ root = process.cwd() } = {}) {
  reconcileInventory(root);
  reconcileBindings(root);
  reconcileClassification(root);
  return { passSurfaces: passSurfaces.length };
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (isCli) {
  try {
    const result = reconcileBlockISurfaceMatrices();
    console.log(`OK: reconciliación BLOQUE I; ${result.passSurfaces} superficies integrales de PASS.`);
  } catch (error) {
    console.error(`ERROR: no se pudo reconciliar BLOQUE I:\n- ${error instanceof Error ? error.message : String(error)}`);
    process.exit(1);
  }
}
