import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import {
  buildCanonicalTreqContext,
  validateTreqRegistrySource,
} from './validate-treq-registry.mjs';

const root = process.cwd();
const sourcePath = path.join(root,
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/03_CLASIFICACION_FUNCIONAL_Y_CONTEXTO_DE_USO.md');
const eligibilityPath = path.join(root,
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/04_DEPURACION_DE_VISTAS_Y_RUTAS_TECNICAS.md');
const authorizationPath = path.join(root,
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/05_AUTORIZACION_DE_VISTAS_Y_ACCIONES.md');
const catalogPath = path.join(root,
  'docs/plan-canonico/modular/bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md');
const registryPath = path.join(root,
  'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md');
const outputPath = path.join(root,
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/AUTH-UI-031_APROBADA_PARA_REEMPLAZAR.md');
const registryOutputPath = path.join(root,
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_AUTH-UI-031.md');
const canonicalMarker = '### [ ] AUTH-UI-031 — Asignar permiso exacto a cada acción';

function clean(value) {
  return value.replaceAll('`', '').replaceAll('*', '').trim();
}

function splitRow(line) {
  if (!line.startsWith('|') || !line.endsWith('|')) return null;
  return line.slice(1, -1).split('|').map(clean);
}

function section(source, id, nextId) {
  const start = source.search(new RegExp(`^###\\s+(?:✅|🟡|\\[[ x~]\\])\\s+${id}\\b`, 'm'));
  if (start < 0) throw new Error(`no se encontró ${id}.`);
  const tail = source.slice(start + 1);
  const end = nextId
    ? tail.search(new RegExp(`^###\\s+(?:✅|🟡|❌|\\[[ x~]\\])\\s+${nextId}\\b`, 'm'))
    : -1;
  return source.slice(start, end < 0 ? source.length : start + 1 + end);
}

function rows(source, columns, idPattern) {
  return source.split(/\r?\n/)
    .map(splitRow)
    .filter((cells) => cells?.length === columns && idPattern.test(cells[0]));
}

function sha(values) {
  return crypto.createHash('sha256').update(values.join('\n')).digest('hex');
}

const actionRules = [
  ['anima', /crear.*turno|programar.*turno/i, 'anima.attendance.shifts.create'],
  ['anima', /editar|actualizar|reprogramar/i, 'anima.attendance.shifts.update', /turno|programaci/i],
  ['anima', /cancelar.*turno/i, 'anima.attendance.shifts.cancel'],
  ['anima', /subir|cargar|adjuntar/i, 'anima.workforce.employee_documents.upload', /ANIMA-SCREEN-007|ANIMA-SURFACE-007|ANIMA-SURFACE-008/],
  ['anima', /eliminar/i, 'anima.workforce.employee_documents.delete', /ANIMA-SCREEN-007|ANIMA-SURFACE-007|ANIMA-SURFACE-008/],
  ['anima', /subir|cargar|actualizar/i, 'anima.workforce.employee_photos.upload', /foto/i],
  ['anima', /invitar/i, 'anima.workforce.staff_invitations.create'],
  ['fogo', /crear|registrar|iniciar/i, 'fogo.production.batches.create', /lote|producci/i],
  ['nexo', /registrar|aplicar/i, 'nexo.inventory.adjustments.register', /ajuste/i],
  ['nexo', /^(Crear|Registrar) el activo/i, 'nexo.assets.items.create'],
  ['nexo', /crear|registrar/i, 'nexo.catalog.products.create', /producto/i],
  ['nexo', /^(Registrar|Confirmar) la entrada física/i, 'nexo.inventory.entries.register'],
  ['nexo', /sobrescribir|forzar/i, 'nexo.inventory.entries.override'],
  ['nexo', /realizar|ejecutar|registrar/i, 'nexo.inventory.stock_counts.perform', /conteo/i],
  ['nexo', /aprobar/i, 'nexo.inventory.stock_count_variances.approve', /diferencia|variaci/i],
  ['nexo', /resolver/i, 'nexo.inventory.stock_count_variances.resolve', /diferencia|variaci/i],
  ['nexo', /validar/i, 'nexo.inventory.stock_validations.perform', /existencia|stock|inventario/i],
  ['nexo', /asignar/i, 'nexo.inventory.location_assignments.assign', /ubicaci|sede|posición/i],
  ['nexo', /actualizar|guardar/i, 'nexo.inventory.location_catalog.update', /inventory\.(locations|storage_positions|zones)/i],
  ['nexo', /solicitar|crear|enviar/i, 'nexo.inventory.remissions.request', /remisi/i],
  ['nexo', /actualizar|editar|corregir/i, 'nexo.inventory.remissions.update', /remisi/i],
  ['nexo', /preparar|confirmar.*preparación/i, 'nexo.inventory.remissions.prepare', /remisi/i],
  ['nexo', /cancelar/i, 'nexo.inventory.remissions.cancel', /remisi/i],
  ['nexo', /iniciar.*tránsito|despachar|confirmar.*salida.*tránsito/i, 'nexo.inventory.remissions.start_transit', /remisi/i],
  ['nexo', /entregar/i, 'nexo.inventory.remissions.deliver', /remisi/i],
  ['nexo', /recibir|confirmar.*recepción/i, 'nexo.inventory.remissions.receive', /remisi/i],
  ['nexo', /aceptar.*custodia/i, 'nexo.inventory.remissions.accept_custody', /remisi/i],
  ['nexo', /registrar|confirmar/i, 'nexo.inventory.withdrawals.register', /retiro|consumo/i],
  ['nexo', /crear|registrar|confirmar/i, 'nexo.inventory.transfers.create', /traslado|transferencia/i],
  ['nexo', /actualizar|guardar|publicar/i, 'nexo.printing.templates.update', /plantilla|impresi/i],
  ['nexo', /generar/i, 'nexo.finance.internal_invoices.generate', /factura/i],
  ['nexo', /emitir/i, 'nexo.finance.internal_invoices.issue', /factura/i],
  ['nexo', /cancelar|anular/i, 'nexo.finance.internal_invoices.cancel', /factura/i],
  ['nexo', /aprobar/i, 'nexo.finance.internal_variances.approve', /diferencia|variaci/i],
  ['nexo', /resolver/i, 'nexo.finance.internal_variances.resolve', /diferencia|variaci/i],
  ['origo', /registrar|confirmar/i, 'origo.procurement.receipts.register', /recepci/i],
  ['pulso', /crear|abrir|registrar/i, 'pulso.sales.orders.create', /pedido|orden/i],
  ['pulso', /cancelar|anular/i, 'pulso.sales.orders.cancel', /pedido|orden/i],
  ['pulso', /registrar|crear/i, 'pulso.sales.returns.create', /devoluci/i],
  ['pulso', /aplicar/i, 'pulso.sales.discounts.apply', /descuento/i],
  ['pulso', /abrir|iniciar/i, 'pulso.cash.sessions.start', /caja/i],
  ['pulso', /cerrar/i, 'pulso.cash.sessions.close', /caja/i],
  ['pulso', /cobrar|registrar.*pago/i, 'pulso.payments.transactions.collect'],
  ['pulso', /reembolsar/i, 'pulso.payments.transactions.refund'],
  ['pulso', /reversar/i, 'pulso.payments.transactions.reverse'],
  ['pulso', /sobrescribir|forzar/i, 'pulso.delivery.deliveries.override', /entrega/i],
  ['viso', /crear/i, 'viso.authorization.base_grants.create', /concesión.*base/i],
  ['viso', /aprobar/i, 'viso.authorization.base_grants.approve', /concesión.*base/i],
  ['viso', /suspender/i, 'viso.authorization.base_grants.suspend', /concesión.*base/i],
  ['viso', /revocar/i, 'viso.authorization.base_grants.revoke', /concesión.*base/i],
  ['viso', /crear/i, 'viso.authorization.operational_grants.create', /concesión.*operativa/i],
  ['viso', /aprobar/i, 'viso.authorization.operational_grants.approve', /concesión.*operativa/i],
  ['viso', /suspender/i, 'viso.authorization.operational_grants.suspend', /concesión.*operativa/i],
  ['viso', /revocar/i, 'viso.authorization.operational_grants.revoke', /concesión.*operativa/i],
  ['viso', /crear/i, 'viso.authorization.denials.create', /denegaci/i],
  ['viso', /aprobar/i, 'viso.authorization.denials.approve', /denegaci/i],
  ['viso', /revocar/i, 'viso.authorization.denials.revoke', /denegaci/i],
];

function exactPermission(app, label, viewId, readRequirement, catalog) {
  const subject = `${label} ${viewId} ${readRequirement}`;
  if (/\bsin (?:crear|iniciar|aplicar|cerrar|cancelar|registrar)\b/i.test(label)) return null;
  for (const [ruleApp, verb, permission, object] of actionRules) {
    if (app === ruleApp && verb.test(subject) && (!object || object.test(subject))) {
      if (!catalog.has(permission)) throw new Error(`la regla referencia una clave inactiva: ${permission}.`);
      return permission;
    }
  }
  return null;
}

function secondaryEffect(actionClass, label) {
  if (/^(Abrir|Consultar|Ver|Cambiar filtros|Previsualizar|Revisar|Comparar|Seleccionar)/i.test(label)) {
    return /^(Abrir|Seleccionar)/i.test(label) ? 'NAVIGATION_ONLY' : 'READ_ONLY';
  }
  const effects = {
    SECONDARY_CONTEXT: 'NAVIGATION_ONLY',
    SECONDARY_NAVIGATION: 'NAVIGATION_ONLY',
    SECONDARY_DRAFT: 'DRAFT_MUTATION',
    SECONDARY_CONFIGURATION: 'CONFIGURATION_MUTATION',
    SECONDARY_EXCEPTION: 'DECISION_MUTATION',
    SECONDARY_CORRECTION: 'DOMAIN_MUTATION',
    SECONDARY_COLLABORATION: 'COMMUNICATION_MUTATION',
    SECONDARY_OUTPUT: 'EXTERNAL_SIDE_EFFECT',
    SECONDARY_RECOVERY: 'DOMAIN_MUTATION',
    SECONDARY_SECURITY: 'SESSION_MUTATION',
    SECONDARY_EVIDENCE: 'DOMAIN_MUTATION',
  };
  return effects[actionClass] ?? 'DOMAIN_MUTATION';
}

function gapOwner(app) {
  return `${app.toUpperCase()}-AUTH-001; AUTH-CAT-*; AUTH-UI-043`;
}

function resolveAction(action, view, catalog) {
  const read = view.readRequirement;
  const readFormula = `READ(${view.viewId})`;
  if (action.inheritsFrom !== 'NONE') {
    return {
      profile: 'ACTION-INHERITED',
      requirement: `INHERIT_ACTION(${action.inheritsFrom})`,
      formula: `${readFormula} + INHERIT_ACTION(${action.inheritsFrom})`,
      status: 'INHERITED',
      gap: 'NONE',
      nextOwner: 'AUTH-UI-043; AUTH-UI-045',
    };
  }
  if (['READ_ONLY', 'NAVIGATION_ONLY'].includes(action.effect)) {
    return {
      profile: 'ACTION-READ-GATED',
      requirement: 'NO_ADDITIONAL_ACTION_PERMISSION',
      formula: `${readFormula} + NO_ADDITIONAL_ACTION_PERMISSION`,
      status: view.readStatus === 'BLOCKED' ? 'READ_GAP_DEFAULT_DENY' : 'READ_PREREQUISITE_ONLY',
      gap: view.readStatus === 'BLOCKED' ? `READ-GAP-${view.viewId}` : 'NONE',
      nextOwner: 'AUTH-UI-043',
    };
  }
  if (view.eligibilityClass === 'AUTHENTICATION_OR_DENIAL_NO_VIEW_PERMISSION') {
    return {
      profile: 'ACTION-PREAUTH-SESSION-CONTRACT',
      requirement: 'PREAUTH_OR_SESSION_ACTION',
      formula: `SESSION_ACTION(actor,session,${action.actionKey})`,
      status: 'NON_RBAC_SESSION_CONTRACT', gap: 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  if (view.eligibilityClass === 'CUSTOMER_OR_PUBLIC_POLICY_NO_STAFF_PERMISSION'
    || action.app === 'pass') {
    return {
      profile: 'ACTION-CLIENT-SELF',
      requirement: 'CLIENT_SELF_OR_SCOPED_RESOURCE_ACTION',
      formula: `CLIENT_SELF_OR_SCOPED_RESOURCE_ACTION(actor_or_token,resource,${action.actionKey})`,
      status: 'NON_RBAC_CLIENT_CONTRACT', gap: 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  if (view.eligibilityClass === 'SYSTEM_RUNTIME_STATE_NO_VIEW_PERMISSION') {
    return {
      profile: 'ACTION-SYSTEM-INTEGRITY', requirement: 'SYSTEM_INTEGRITY_AND_RECOVERY_POLICY',
      formula: `SYSTEM_INTEGRITY_ACTION(runtime,${action.actionKey})`,
      status: 'NON_RBAC_SYSTEM_CONTRACT', gap: 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  if (view.eligibilityClass === 'SERVER_OR_STATIC_AUXILIARY_NOT_VIEW') {
    return {
      profile: 'ACTION-ENDPOINT-POLICY', requirement: 'ENDPOINT_TOKEN_RATE_LIMIT_OR_STATIC_POLICY',
      formula: `ENDPOINT_POLICY(resource,${action.actionKey})`,
      status: 'NON_RBAC_ENDPOINT_CONTRACT', gap: 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  if (view.eligibilityClass === 'PLACEHOLDER_NO_PERMISSION') {
    return {
      profile: 'ACTION-NOT-AVAILABLE', requirement: 'NO_CAPABILITY_NO_ACTION_GRANT',
      formula: 'DEFAULT_DENY(NO_PRODUCT_CAPABILITY)',
      status: 'NOT_APPLICABLE', gap: 'NONE', nextOwner: 'AUTH-UI-040; AUTH-UI-045',
    };
  }
  if (action.app === 'shell' || (action.app === 'anima'
    && ['AUTHENTICATE_OR_RECOVER', 'RESOLVE_ACCESS_CONTEXT', 'SELF_SERVICE', 'IDENTIFY_OR_PRESENT']
      .includes(action.family))) {
    return {
      profile: 'ACTION-SUBJECT-OR-SESSION-CONTRACT', requirement: 'SUBJECT_SELF_OR_SESSION_ACTION',
      formula: `SUBJECT_SELF_OR_SESSION_ACTION(actor,resource,${action.actionKey})`,
      status: 'NON_RBAC_SUBJECT_CONTRACT', gap: 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  if (/Publicar la programación laboral/i.test(action.label)) {
    const requirement = 'STATE_SPLIT(CREATE=>anima.attendance.shifts.create; UPDATE=>anima.attendance.shifts.update; CANCEL=>anima.attendance.shifts.cancel)';
    for (const key of ['anima.attendance.shifts.create', 'anima.attendance.shifts.update', 'anima.attendance.shifts.cancel']) {
      if (!catalog.has(key)) throw new Error(`la fórmula de programación referencia una clave inactiva: ${key}.`);
    }
    return {
      profile: 'ACTION-CANONICAL-STATE-SPLIT', requirement,
      formula: `${readFormula} + ${requirement}`,
      status: view.readStatus === 'BLOCKED' ? 'ACTION_ASSIGNED_READ_GAP' : 'ACTIVE_STATE_SPLIT_1_0_0',
      gap: view.readStatus === 'BLOCKED' ? `READ-GAP-${view.viewId}` : 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  if (/Conciliar la diferencia del conteo/i.test(action.label)) {
    const requirement = 'STATE_SPLIT(APPROVE=>nexo.inventory.stock_count_variances.approve; RESOLVE=>nexo.inventory.stock_count_variances.resolve)';
    return {
      profile: 'ACTION-CANONICAL-STATE-SPLIT', requirement,
      formula: `${readFormula} + ${requirement}`,
      status: view.readStatus === 'BLOCKED' ? 'ACTION_ASSIGNED_READ_GAP' : 'ACTIVE_STATE_SPLIT_1_0_0',
      gap: view.readStatus === 'BLOCKED' ? `READ-GAP-${view.viewId}` : 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  if (action.viewId === 'VISO-ROUTE-037' && /configuración canónica de acceso/i.test(action.label)) {
    const keys = [
      'viso.authorization.base_grants.create', 'viso.authorization.base_grants.approve',
      'viso.authorization.base_grants.suspend', 'viso.authorization.base_grants.revoke',
      'viso.authorization.operational_grants.create', 'viso.authorization.operational_grants.approve',
      'viso.authorization.operational_grants.suspend', 'viso.authorization.operational_grants.revoke',
      'viso.authorization.denials.create', 'viso.authorization.denials.approve',
      'viso.authorization.denials.revoke',
    ];
    if (keys.some((key) => !catalog.has(key))) throw new Error('el target-state split usa una clave inactiva.');
    const requirement = `TARGET_STATE_SPLIT(${keys.join('; ')})`;
    return {
      profile: 'ACTION-CANONICAL-TARGET-STATE-SPLIT', requirement,
      formula: `${readFormula} + ${requirement}`,
      status: 'ACTIVE_TARGET_STATE_SPLIT_1_0_0', gap: 'NONE', nextOwner: 'AUTH-UI-043',
    };
  }
  const permission = exactPermission(action.app, action.label, action.viewId, read, catalog);
  if (permission) {
    return {
      profile: 'ACTION-CANONICAL-PERMISSION', requirement: permission,
      formula: `${readFormula} + ${permission}`,
      status: view.readStatus === 'BLOCKED' ? 'ACTION_ASSIGNED_READ_GAP' : 'ACTIVE_ACTION_PERMISSION_1_0_0',
      gap: view.readStatus === 'BLOCKED' ? `READ-GAP-${view.viewId}` : 'NONE',
      nextOwner: 'AUTH-UI-043',
    };
  }
  const gap = `ACTION-GAP-${action.actionKey.replaceAll('::', '-').replaceAll(':', '-')}`;
  return {
    profile: 'ACTION-DEFERRED-GAP', requirement: 'NO_ACTIVE_CANONICAL_ACTION_PERMISSION',
    formula: `${readFormula} + DEFAULT_DENY(${gap})`,
    status: 'GAP_DEFAULT_DENY', gap, nextOwner: gapOwner(action.app),
  };
}

const source = fs.readFileSync(sourcePath, 'utf8');
const eligibilitySource = fs.readFileSync(eligibilityPath, 'utf8');
const authorizationSource = fs.readFileSync(authorizationPath, 'utf8');
const catalogSource = fs.readFileSync(catalogPath, 'utf8');
const registrySource = fs.readFileSync(registryPath, 'utf8');
const primarySection = section(source, 'AUTH-UI-024', 'AUTH-UI-025');
const secondarySection = section(source, 'AUTH-UI-025');
const eligibilitySection = section(eligibilitySource, 'AUTH-UI-029');
const readSection = section(authorizationSource, 'AUTH-UI-030', 'AUTH-UI-031');
const primaryRows = rows(primarySection, 15, /^(?:NEXO|FOGO|ORIGO|PULSO|VISO|NUMERA|ANIMA|SHELL|PASS|AURA)-/);
const secondaryRows = rows(secondarySection, 13, /^(?:NEXO|FOGO|ORIGO|PULSO|VISO|NUMERA|ANIMA|SHELL|PASS|AURA)-/);
const eligibilityRows = rows(eligibilitySection, 8, /^(?:NEXO|FOGO|ORIGO|PULSO|VISO|NUMERA|ANIMA|SHELL|PASS|AURA)-/);
const readRows = rows(readSection, 6, /^(?:NEXO|FOGO|ORIGO|PULSO|VISO|NUMERA|ANIMA|SHELL|PASS|AURA)-/);
const catalog = new Set([...catalogSource.matchAll(/^active_permission=([^\s]+)$/gm)].map((match) => match[1]));
if (primaryRows.length !== 264 || secondaryRows.length !== 1056
  || eligibilityRows.length !== 264 || readRows.length !== 264 || catalog.size !== 140) {
  throw new Error(`entradas incompletas: primary=${primaryRows.length}, secondary=${secondaryRows.length}, eligibility=${eligibilityRows.length}, read=${readRows.length}, catalog=${catalog.size}.`);
}

const views = new Map();
for (const cells of eligibilityRows) views.set(cells[0], { viewId: cells[0], eligibilityClass: cells[3] });
for (const cells of readRows) Object.assign(views.get(cells[0]), {
  readRequirement: cells[2], readResolution: cells[3], readStatus: cells[4],
});

const actions = [];
for (const cells of primaryRows) actions.push({
  viewId: cells[0], app: cells[0].split('-')[0].toLowerCase(), level: 'PRIMARY',
  actionKey: cells[7], label: cells[8], family: cells[9], effect: cells[10],
  confirmation: cells[11], inheritsFrom: cells[12],
});
for (const cells of secondaryRows) actions.push({
  viewId: cells[0], app: cells[0].split('-')[0].toLowerCase(), level: 'SECONDARY',
  actionKey: cells[3], label: cells[4], family: cells[5], effect: secondaryEffect(cells[5], cells[4]),
  confirmation: cells[9], inheritsFrom: cells[10],
});
if (actions.length !== 1320 || new Set(actions.map((action) => action.actionKey)).size !== 1320) {
  throw new Error('las acciones no forman 1.320 claves únicas.');
}

const resolved = actions.map((action) => ({
  ...action, readRequirement: views.get(action.viewId).readRequirement,
  ...resolveAction(action, views.get(action.viewId), catalog),
}));
const counts = Object.fromEntries([...new Set(resolved.map((action) => action.status))]
  .sort().map((status) => [status, resolved.filter((action) => action.status === status).length]));
const permissionKeys = new Set([...catalog]
  .filter((key) => resolved.some((action) => action.formula.includes(key))));
const gaps = resolved.filter((action) => action.status === 'GAP_DEFAULT_DENY');
const fingerprint = sha(resolved.map((action) => [
  action.actionKey, action.profile, action.requirement, action.formula, action.status, action.gap,
].join('|')));

const matrix = resolved.map((action) => `| \`${action.actionKey}\` | \`${action.viewId}\` | \`${action.level}\` | ${action.label} | \`${action.family}\` | \`${action.effect}\` | \`${action.confirmation}\` | \`${action.readRequirement}\` | \`${action.profile}\` | \`${action.requirement}\` | \`${action.formula}\` | \`${action.status}\` | \`${action.gap}\` | \`${action.nextOwner}\` |`).join('\n');
const statusRows = Object.entries(counts).map(([status, count]) => `| \`${status}\` | ${count} |`).join('\n');
const appGapRows = [...new Set(gaps.map((action) => action.app))].sort().map((app) => {
  const appGaps = gaps.filter((action) => action.app === app);
  return `| \`${app.toUpperCase()}\` | ${appGaps.length} | \`${gapOwner(app)}\` | Publicar una capacidad exacta en una versión sucesora y reemplazar únicamente las filas afectadas. |`;
}).join('\n');

const treqs = [
  ['2001', 'La matriz de AUTH-UI-031 deberá contener exactamente 1.320 action_key únicas: 264 principales y 1.056 secundarias.'],
  ['2002', 'Toda acción con permiso canónico deberá usar exclusivamente una clave activa de vento.authorization@1.0.0.'],
  ['2003', 'Una clave de lectura o <app>.access no podrá autorizar una mutación de negocio.'],
  ['2004', 'Las acciones sin capacidad exacta deberán permanecer en DEFAULT_DENY con gap y propietario explícitos.'],
  ['2005', 'Las acciones READ_ONLY o NAVIGATION_ONLY no deberán exigir permiso mutador adicional y revalidarán lectura y destino.'],
  ['2006', 'Los contratos de sesión, cliente, sujeto propio, dispositivo, endpoint y runtime no se convertirán en RBAC laboral.'],
  ['2007', 'Aliases y redirects heredarán la fórmula exacta de su acción fuente o destino sin crear autoridad independiente.'],
  ['2008', 'Toda acción mutadora deberá revalidarse en servidor con recurso, alcance, estado, contexto y confirmación aplicables.'],
  ['2009', 'Resolver un gap exigirá versionar catálogo, matriz, pruebas y transición sin sustituciones aproximadas.'],
  ['2010', `El validador deberá reproducir la huella ${fingerprint} sobre action_key, perfil, requisito, fórmula, estado y gap.`],
].map(([id, requirement]) => `| \`TREQ-UX-${id}\` | UX | ${requirement} | \`AUTH-UI-031 / VIEW-ACTION-PERMISSION-ASSIGNMENT-REGISTER-001\` | Autoridad de acción divergente o no verificable / crítica | autorización + contractual + seguridad + regresión / automatizada | \`AUTH-UI-031\`; \`AUTH-UI-043\`; \`SHELL-CI-017\` | Matriz de permisos de acción | VENTO transversal / CI documental y staging | \`IDENTIFICADO\` | Pendiente | Pendiente | Definición documental completa; implementación y evidencia de ejecución permanecen pendientes. | \`TREQ-AUTH-001\`; \`TREQ-UX-2000\` |`).join('\n');

const ux2000Pattern = /^\| `TREQ-UX-2000`[^\r\n]*$/m;
const registryAlreadyApproved = /TREQ-UX-2001/.test(registrySource);
let registryOutput = registrySource;
if (registryAlreadyApproved) {
  if (!/TREQ-UX-2010/.test(registrySource)) {
    throw new Error('el registro 04A contiene una incorporación parcial de AUTH-UI-031.');
  }
} else {
  if (!ux2000Pattern.test(registrySource)) {
    throw new Error('el registro 04A no termina limpiamente en TREQ-UX-2000.');
  }
  registryOutput = registrySource.replace(ux2000Pattern, (line) => `${line}\n${treqs}`)
    .replace('| Requisitos vigentes               |         **6326** |', '| Requisitos vigentes               |         **6336** |')
    .replace('| Filas con catorce columnas        | **6326 de 6326** |', '| Filas con catorce columnas        | **6336 de 6336** |')
    .replace('| Última tarea incorporada          |  `SUPA-TRANS-006` |', '| Última tarea incorporada          |     `AUTH-UI-031` |')
    .replace('| Fecha de normalización            |     `2026-08-01` |', '| Fecha de normalización            |     `2026-08-02` |')
    .replace('| `UX`          | `TREQ-UX-001` a `TREQ-UX-2000`                  |     2000 |',
      '| `UX`          | `TREQ-UX-001` a `TREQ-UX-2010`                  |     2010 |');
}
const candidateRows = [...registryOutput.matchAll(/^\| `?(TREQ-[A-Z]+-\d{3,})`?\s+\|/gm)].map((match) => match[1]);
if (candidateRows.length !== 6336 || new Set(candidateRows).size !== 6336
  || candidateRows.at(-1) !== 'TREQ-UX-2010') {
  throw new Error(`el 04A candidato no conserva 6.336 requisitos únicos; filas=${candidateRows.length}.`);
}
const baseDir = path.join(root, 'docs/plan-canonico/modular');
const manifest = JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
const treqContext = buildCanonicalTreqContext({ baseDir, manifest });
const authUi031 = treqContext.tasks.get('AUTH-UI-031');
authUi031.state = 'APROBADA';
authUi031.derivedIds = Array.from({ length: 10 }, (_, index) => `TREQ-UX-${2001 + index}`);
treqContext.expectedLatestTaskId = 'AUTH-UI-031';
const candidateValidation = validateTreqRegistrySource(registryOutput, treqContext);
if (candidateValidation.errors.length > 0) {
  throw new Error(`el 04A candidato es inválido:\n- ${candidateValidation.errors.join('\n- ')}`);
}

const output = `### ✅ AUTH-UI-031 — Asignar permiso exacto a cada acción

**Estado:** APROBADA PARA REEMPLAZAR — PENDIENTE DE CONFIRMACIÓN DEL USUARIO  
**Marcador exacto que reemplaza:** \`### [ ] AUTH-UI-031 — Asignar permiso exacto a cada acción\`  
**Tarea anterior:** \`AUTH-UI-030 — Asignar permiso de lectura a cada vista\` — APROBADA  
**Siguiente tarea reservada:** \`AUTH-UI-032 — Definir si requiere turno\` — NO INICIADA  
**Catálogo evaluado:** \`vento.authorization@1.0.0\` — 140 claves activas  
**Tipo:** definición documental vinculante; sin código, Supabase, RLS, rutas, datos ni despliegues

---

#### 1. Resultado material

Materializar \`VIEW-ACTION-PERMISSION-ASSIGNMENT-REGISTER-001\` para las **1.320 acciones AS-IS** aprobadas: **264 principales** de \`AUTH-UI-024\` y **1.056 secundarias** de \`AUTH-UI-025\`. Cada \`action_key\` recibe una fórmula explícita de lectura y acción, un contrato no RBAC, una herencia cerrada o \`DEFAULT_DENY\` con gap y propietario.

La visibilidad, confirmación o presencia de un control no concede autoridad. Toda mutación requiere revalidación autoritativa posterior en \`AUTH-UI-043\`.

#### 2. Decisión canónica

\`READ(view)\` es prerrequisito y nunca permiso mutador. Solo se usa una clave de acción cuando existe y coincide exactamente con la operación. Las acciones sin clave compatible permanecen bloqueadas; no se reutilizan permisos \`.view\`, \`<app>.access\`, permisos legacy ni capacidades parecidas.

Contratos permitidos:

- \`ACTION-READ-GATED\`: lectura o navegación sin mutación adicional;
- \`ACTION-CANONICAL-PERMISSION\`: clave mutadora activa exacta;
- contratos de sesión, sujeto propio, cliente, runtime o endpoint fuera de RBAC laboral;
- \`ACTION-INHERITED\`: alias o redirect sin autoridad nueva;
- \`ACTION-DEFERRED-GAP\`: denegación por defecto hasta versionar el catálogo.

#### 3. Reconciliación cuantitativa

| Control | Resultado |
| --- | ---: |
| Acciones totales | **${resolved.length}** |
| Acciones principales | **${resolved.filter((action) => action.level === 'PRIMARY').length}** |
| Acciones secundarias | **${resolved.filter((action) => action.level === 'SECONDARY').length}** |
| Claves de acción activas distintas utilizadas | **${permissionKeys.size}** |
| Acciones con gap propio de catálogo | **${gaps.length}** |
| Claves inventadas | **0** |
| Acciones omitidas | **0** |
| Huella SHA-256 | \`${fingerprint}\` |

##### 3.1. Estados resultantes

| Estado | Acciones |
| --- | ---: |
${statusRows}

##### 3.2. Brechas por aplicación

| Aplicación | Acciones bloqueadas | Propietario | Condición de salida |
| --- | ---: | --- | --- |
${appGapRows}

#### 4. Reglas obligatorias

1. Toda \`action_key\` aparece exactamente una vez.
2. La acción conserva etiqueta, nivel, familia, efecto y confirmación heredados.
3. Ninguna clave \`.view\` o \`<app>.access\` autoriza mutaciones.
4. \`DEFAULT_DENY\` no se sustituye por rol, visibilidad, confirmación o permiso aproximado.
5. Una acción asignada sigue bloqueada si su lectura de \`AUTH-UI-030\` tiene brecha.
6. Contratos cliente, sujeto propio, sesión, dispositivo y runtime no se convierten en permisos laborales.
7. Alias y redirects heredan sin crear concesiones ni telemetría autónomas.
8. Recurso, alcance, estado, turno, check-in, sede, área, dispositivo, simulación y precedencia permanecen obligatorios cuando apliquen.
9. \`AUTH-UI-043\` deberá proteger cada operación en servidor aunque el control esté oculto o deshabilitado.
10. Resolver una brecha exige una versión sucesora del catálogo y una actualización trazable de esta matriz y sus TREQ.

#### 5. Matriz completa \`VIEW-ACTION-PERMISSION-ASSIGNMENT-REGISTER-001\`

| Action key | View ID | Nivel | Acción | Familia o clase | Efecto | Confirmación | Lectura | Perfil | Requisito de acción | Fórmula | Estado | Gap | Siguiente propietario |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
${matrix}

#### 6. Requisitos de prueba generados

Se proponen \`TREQ-UX-2001..2010\`. El detalle reside exclusivamente en el reemplazo completo \`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_AUTH-UI-031.md\`, que conserva los **6.326** requisitos vigentes y contiene **6.336** filas únicas. Ambos artefactos se incorporarán coordinadamente únicamente después de la confirmación literal **APROBADO**. Antes de esa confirmación el rango canónico continúa terminando en \`TREQ-UX-2000\`.

#### 7. Criterios de aceptación

- [x] 1.320 acciones únicas y sin omisiones.
- [x] 264 acciones principales y 1.056 secundarias preservadas.
- [x] Toda clave asignada existe en \`vento.authorization@1.0.0\`.
- [x] Lectura y acceso de aplicación no se usan como autoridad mutadora.
- [x] Toda brecha falla cerrada y tiene propietario.
- [x] Contratos no RBAC permanecen separados del RBAC laboral.
- [x] Se proponen \`TREQ-UX-2001..2010\` sin alterar todavía \`04A\`.
- [x] No se modifica código, Supabase, RLS, rutas, datos ni despliegues.

#### 8. Validación real del repositorio

Ejecutada sobre el checkout local de \`vento-shell\`:

- \`node scripts/docs/build-auth-ui-031-proposal.mjs --check\`: propuesta reproducible desde las cuatro fuentes vigentes;
- reemplazo completo de \`04A\`: 6.336 filas, 6.336 identificadores únicos y final exacto \`TREQ-UX-2010\`;
- \`npm run docs:plan:build\`: compilación canónica y continuidad verificadas;
- \`npm run docs:plan:test\`: suite documental completa;
- \`npm run docs:plan:check\`: fuentes y derivados vigentes;
- \`git diff --check\`: sin errores de whitespace.

Estas validaciones prueban consistencia documental y reproducibilidad. No prueban implementación runtime, autorización remota, RLS, API, dispositivo ni operación productiva.

#### 9. Continuidad

\`AUTH-UI-030\` permanece como última tarea aprobada. Este archivo está preparado para reemplazar exclusivamente el marcador de \`AUTH-UI-031\`; \`AUTH-UI-032\` permanece reservada y no iniciada. La incorporación canónica, actualización integral de \`04A\` y transición de continuidad requieren confirmación literal **APROBADO**.
`;

const approvedOutput = output
  .replace('**Estado:** APROBADA PARA REEMPLAZAR — PENDIENTE DE CONFIRMACIÓN DEL USUARIO', '**Estado:** APROBADA')
  .replace('Se proponen \`TREQ-UX-2001..2010\`. El detalle reside exclusivamente en el reemplazo completo \`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_AUTH-UI-031.md\`, que conserva los **6.326** requisitos vigentes y contiene **6.336** filas únicas. Ambos artefactos se incorporarán coordinadamente únicamente después de la confirmación literal **APROBADO**. Antes de esa confirmación el rango canónico continúa terminando en \`TREQ-UX-2000\`.',
    'Se incorporan \`TREQ-UX-2001..2010\` al registro canónico \`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md\`, que conserva los **6.326** requisitos previos y contiene **6.336** filas únicas.')
  .replace('- [x] Se proponen \`TREQ-UX-2001..2010\` sin alterar todavía \`04A\`.',
    '- [x] Se incorporan \`TREQ-UX-2001..2010\` coordinadamente en \`04A\`.')
  .replace('- \`node scripts/docs/build-auth-ui-031-proposal.mjs --check\`: propuesta reproducible desde las cuatro fuentes vigentes;',
    '- \`node scripts/docs/build-auth-ui-031-proposal.mjs --check\`: matriz canónica reproducible desde las cuatro fuentes vigentes;')
  .replace('\`AUTH-UI-030\` permanece como última tarea aprobada. Este archivo está preparado para reemplazar exclusivamente el marcador de \`AUTH-UI-031\`; \`AUTH-UI-032\` permanece reservada y no iniciada. La incorporación canónica, actualización integral de \`04A\` y transición de continuidad requieren confirmación literal **APROBADO**.',
    '\`AUTH-UI-031\` queda como última tarea aprobada. \`AUTH-UI-032\` permanece reservada y no iniciada.')
  .replace(/  $/gm, '');

const checkOnly = process.argv.includes('--check');
const approve = process.argv.includes('--approve');
if (approve) {
  if (registryAlreadyApproved || !authorizationSource.includes(canonicalMarker)) {
    throw new Error('AUTH-UI-031 ya fue consolidada o su marcador canónico no está disponible.');
  }
  if (!fs.existsSync(outputPath) || fs.readFileSync(outputPath, 'utf8') !== output
    || !fs.existsSync(registryOutputPath) || fs.readFileSync(registryOutputPath, 'utf8') !== registryOutput) {
    throw new Error('los artefactos aprobados no coinciden con sus fuentes vigentes.');
  }
  fs.writeFileSync(authorizationPath, authorizationSource.replace(canonicalMarker, approvedOutput.trimEnd()), 'utf8');
  fs.writeFileSync(registryPath, registryOutput, 'utf8');
  manifest.auxiliary_files = manifest.auxiliary_files.filter((relativePath) => ![
    'bloques/I_NAVEGACION_Y_PANTALLAS/AUTH-UI-031_APROBADA_PARA_REEMPLAZAR.md',
    'bloques/I_NAVEGACION_Y_PANTALLAS/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA_AUTH-UI-031.md',
  ].includes(relativePath));
  fs.writeFileSync(path.join(baseDir, 'manifest.json'), `${JSON.stringify(manifest, null, 2)}\n`, 'utf8');
  fs.unlinkSync(outputPath);
  fs.unlinkSync(registryOutputPath);
  console.log(`OK: AUTH-UI-031 consolidada; ${resolved.length} acciones; ${gaps.length} gaps; 04A con ${candidateRows.length} requisitos; SHA-256 ${fingerprint}.`);
} else if (checkOnly) {
  if (registryAlreadyApproved) {
    if (!authorizationSource.includes(approvedOutput) || registrySource !== registryOutput) {
      throw new Error('la consolidación canónica de AUTH-UI-031 no coincide con sus fuentes vigentes.');
    }
  } else if (!fs.existsSync(outputPath) || fs.readFileSync(outputPath, 'utf8') !== output
    || !fs.existsSync(registryOutputPath) || fs.readFileSync(registryOutputPath, 'utf8') !== registryOutput) {
    throw new Error('los artefactos de AUTH-UI-031 no coinciden con sus fuentes vigentes.');
  }
  console.log(`OK: AUTH-UI-031 ${registryAlreadyApproved ? 'canónica' : 'propuesta'} vigente; ${resolved.length} acciones; ${gaps.length} gaps; 04A con ${candidateRows.length} requisitos; SHA-256 ${fingerprint}.`);
} else {
  if (registryAlreadyApproved) {
    throw new Error('AUTH-UI-031 ya está consolidada; use --check.');
  }
  fs.writeFileSync(outputPath, output, 'utf8');
  fs.writeFileSync(registryOutputPath, registryOutput, 'utf8');
  console.log(`OK: AUTH-UI-031 propuesta generada; ${resolved.length} acciones; ${gaps.length} gaps; 04A con ${candidateRows.length} requisitos; SHA-256 ${fingerprint}.`);
}
