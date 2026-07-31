import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const SCRIPT_PATH = fileURLToPath(import.meta.url);
const ROOT = path.resolve(path.dirname(SCRIPT_PATH), '..', '..');
const PACKAGE_ID = 'VISO-SCHEDULE-MONTHLY-001';
const TEMP_FILES = [
  path.join(ROOT, '.github', 'workflows', 'apply-viso-schedule-plan-delta.yml'),
  path.join(ROOT, '.github', 'workflows', 'trigger-viso-schedule-plan-delta.yml'),
  path.join(ROOT, 'scripts', 'docs', 'run-viso-schedule-plan-delta.py'),
  SCRIPT_PATH,
];

function fail(message) {
  console.error(`\nERROR: ${message}`);
  process.exit(1);
}

function run(command, { capture = false, allowFailure = false } = {}) {
  console.log(`\n> ${command}`);
  const result = spawnSync(command, {
    cwd: ROOT,
    shell: true,
    encoding: 'utf8',
    stdio: capture ? ['ignore', 'pipe', 'pipe'] : 'inherit',
  });
  if (!allowFailure && result.status !== 0) {
    if (capture) {
      if (result.stdout) process.stdout.write(result.stdout);
      if (result.stderr) process.stderr.write(result.stderr);
    }
    process.exit(result.status ?? 1);
  }
  return result;
}

function read(relativePath) {
  return fs.readFileSync(path.join(ROOT, relativePath), 'utf8').replace(/\r\n?/g, '\n');
}

function write(relativePath, content) {
  fs.writeFileSync(path.join(ROOT, relativePath), content, 'utf8');
}

function insertAfter(items, anchor, value) {
  if (items.includes(value)) return;
  const index = items.indexOf(anchor);
  if (index < 0) fail(`No se encontró el ancla en manifest: ${anchor}`);
  items.splice(index + 1, 0, value);
}

function splitRow(line) {
  const body = line.trim().slice(1, -1);
  const cells = [];
  let current = '';
  let escaped = false;
  for (const char of body) {
    if (escaped) {
      current += char;
      escaped = false;
    } else if (char === '\\') {
      current += char;
      escaped = true;
    } else if (char === '|') {
      cells.push(current.trim());
      current = '';
    } else {
      current += char;
    }
  }
  cells.push(current.trim());
  return cells;
}

function clean(value) {
  return value.trim().replaceAll('**', '').replace(/^`|`$/g, '').trim();
}

function markdownCell(value) {
  return String(value).replaceAll('|', '\\|').replaceAll('\n', ' ');
}

function renderRow(cells) {
  return `| ${cells.map(markdownCell).join(' | ')} |`;
}

function replaceSummary(source, label, value) {
  const escaped = label.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const regex = new RegExp(`^(\\|\\s*${escaped}\\s*\\|).*?(\\|\\s*)$`, 'm');
  if (!regex.test(source)) fail(`No se pudo actualizar el resumen: ${label}.`);
  return source.replace(regex, `$1 ${value} $2`);
}

function applyPatch() {
  const manifestPath = 'docs/plan-canonico/modular/manifest.json';
  const manifest = JSON.parse(read(manifestPath));
  const files = manifest.files;
  insertAfter(files, '02_ROADMAP_MAESTRO.md', 'deltas/DELTA-VISO-SCHEDULE-20260731-001.md');
  insertAfter(
    files,
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_04_VALIDACION_TECNICA_SEGURIDAD_RESILIENCIA_Y_BACKLOG.md',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04B_RECONCILIACION_DELTA_VISO_PROGRAMACION.md',
  );
  insertAfter(
    files,
    'bloques/G_VISO/01_GOBIERNO_DE_ACCESO_Y_SEGURIDAD.md',
    'bloques/G_VISO/01A_PROGRAMACION_LABORAL.md',
  );
  insertAfter(
    files,
    'bloques/I_NAVEGACION_Y_PANTALLAS/06_EXPERIENCIA_USABILIDAD_Y_APROBACION.md',
    'bloques/I_NAVEGACION_Y_PANTALLAS/07_RECONCILIACION_DE_DERIVA_POSTERIOR.md',
  );
  write(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`);

  const orderPath = 'docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md';
  let order = read(orderPath);
  const reconciliation = `\n### Reconciliación de deltas posteriores a snapshots E1\n\nUn cambio material posterior al cierre de E1 no reabre ni reescribe snapshots aprobados.\n\`CODE-AUD-021\` se ejecutará sobre el commit estable de\n\`DELTA-VISO-SCHEDULE-20260731-001\` antes de aprobar\n\`VISO-SCHEDULE-MONTHLY-001\`, sin modificar la tarea documental activa.\n`;
  if (!order.includes('### Reconciliación de deltas posteriores a snapshots E1')) {
    const anchor = '7. BLOQUE E1 está **CERRADO DOCUMENTALMENTE**';
    const position = order.indexOf(anchor);
    if (position < 0) fail('No se encontró el punto 7 para insertar reconciliación E1.');
    order = `${order.slice(0, position)}${reconciliation}\n${order.slice(position)}`;
  }

  const originalPoint9 = '9. Ejecutar `AUTH-UI-001` a `AUTH-UI-029` y aprobar propiedad funcional y contrato de pantallas';
  const replacementPoint9 = '9. Ejecutar `AUTH-UI-001` a `AUTH-UI-029` y aprobar propiedad funcional y contrato de pantallas. Las rutas posteriores a inventarios aprobados se reconciliarán mediante `AUTH-UI-061` sin renumerar identidades históricas.';
  if (!order.includes(replacementPoint9)) {
    if (!order.includes(originalPoint9)) fail('No se encontró el punto 9 del orden de implementación.');
    order = order.replace(originalPoint9, replacementPoint9);
  }

  const point15a = '15A. Para programación laboral VISO, completar `VISO-SCH-001` a `VISO-SCH-008`, `CODE-AUD-021` y `AUTH-UI-061` antes de materializar `VISO-SCHEDULE-MONTHLY-001`.';
  if (!order.includes(point15a)) {
    const anchor = '16. BLOQUE E5 — Convertir capacidades aprobadas en paquetes';
    const position = order.indexOf(anchor);
    if (position < 0) fail('No se encontró el punto 16 para insertar 15A.');
    order = `${order.slice(0, position)}${point15a}\n${order.slice(position)}`;
  }

  const packageSequence = `\n### Secuencia VISO-SCHEDULE-MONTHLY-001\n\n\`\`\`text\nCODE-AUD-021\n→ AUTH-UI-061\n→ VISO-SCH-001 a VISO-SCH-008\n→ VISO-UX / AUTH-UI / AUTH-SRV aplicables\n→ SUPA-TRANS aplicables\n→ DELIV-PKG-001 a DELIV-PKG-025::VISO-SCHEDULE-MONTHLY-001\n→ E5-GATE-008::VISO-SCHEDULE-MONTHLY-001\n→ SHELL-CI-020::VISO-SCHEDULE-MONTHLY-001\n→ BLOQUE R\n→ AUTH-QA / UX-QA\n→ SHELL-CI-021 a SHELL-CI-024::VISO-SCHEDULE-MONTHLY-001\n\`\`\`\n\nNo se agrega a \`priority-delivery-lanes.json\`.\n`;
  if (!order.includes('### Secuencia VISO-SCHEDULE-MONTHLY-001')) {
    const anchor = '### Ciclo obligatorio de ejecución de cada paquete aprobado';
    const position = order.indexOf(anchor);
    if (position < 0) fail('No se encontró el ciclo obligatorio por paquete.');
    const nextHeading = order.indexOf('\n### ', position + anchor.length);
    order = nextHeading < 0
      ? `${order}${packageSequence}`
      : `${order.slice(0, nextHeading)}${packageSequence}${order.slice(nextHeading)}`;
  }
  write(orderPath, order);

  const columns = [
    'ID', 'Dominio', 'Regla protegida', 'Origen', 'Riesgo / prioridad',
    'Tipo / modalidad', 'Tarea responsable', 'Paquete',
    'Repositorio / ambiente', 'Estado', 'Artefacto', 'Último resultado',
    'Evidencia', 'Relación',
  ];

  const registryPath = 'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md';
  let registry = read(registryPath);
  if (!registry.trim()) fail('04A está vacío; se aborta para no destruir el registro canónico.');

  let sectionStart = registry.indexOf('\n#### VISO\n');
  if (sectionStart < 0) fail('No se encontró la sección #### VISO en 04A.');
  sectionStart += 1;
  let sectionEnd = registry.indexOf('\n#### ', sectionStart + 1);
  if (sectionEnd < 0) sectionEnd = registry.indexOf('\n### Reglas obligatorias', sectionStart);
  if (sectionEnd < 0) fail('No se pudo determinar el final de la sección VISO.');

  const section = registry.slice(sectionStart, sectionEnd);
  const lines = section.split('\n');
  const tableIndexes = lines
    .map((line, index) => (line.trim().startsWith('|') ? index : -1))
    .filter((index) => index >= 0);
  if (tableIndexes.length < 3) fail('La tabla VISO de 04A no está completa.');
  const headerIndex = tableIndexes[0];
  const dataIndexes = tableIndexes.slice(2);
  const header = splitRow(lines[headerIndex]).map(clean);
  if (JSON.stringify(header) !== JSON.stringify(columns)) {
    fail(`Cabecera VISO inesperada: ${header.join(', ')}`);
  }

  const rows = new Map();
  for (const index of dataIndexes) {
    const cells = splitRow(lines[index]);
    if (cells.length !== 14) fail(`Fila VISO inválida con ${cells.length} columnas: ${lines[index].slice(0, 120)}`);
    const row = Object.fromEntries(columns.map((column, position) => [column, clean(cells[position])]));
    rows.set(row.ID, { index, row });
  }

  const requiredExisting = [4, 5, 6, 12, 13, 15, 23].map((number) => `TREQ-VISO-${String(number).padStart(3, '0')}`);
  const missing = requiredExisting.filter((identifier) => !rows.has(identifier));
  if (missing.length > 0) fail(`Faltan requisitos VISO existentes: ${missing.join(', ')}`);

  const existingUpdates = {
    'TREQ-VISO-004': { 'Regla protegida': 'El inventario reconciliado de VISO registra 61 páginas sobre un commit estable y conserva el snapshot histórico anterior.', Origen: 'CODE-AUD-021', 'Tarea responsable': 'CODE-AUD-021', Paquete: PACKAGE_ID, Artefacto: 'Inventario técnico reconciliado de rutas, layouts, componentes y acciones de VISO.', 'Último resultado': 'Pendiente de ejecutar sobre el commit estable del paquete.', Evidencia: 'Delta esperado: 61 páginas VISO; la cifra final se acepta únicamente después de CODE-AUD-021.', Relación: 'TREQ-VISO-023' },
    'TREQ-VISO-005': { 'Regla protegida': 'El registro estable de rutas VISO cubre VISO-ROUTE-001 a VISO-ROUTE-061 sin renumerar identidades históricas.', Origen: 'AUTH-UI-061', 'Tarea responsable': 'AUTH-UI-061', Paquete: PACKAGE_ID, Artefacto: 'Registro de rutas reconciliado hasta VISO-ROUTE-061.', 'Último resultado': 'Pendiente de reconciliación formal.', Evidencia: 'La ruta mensual se reserva como VISO-ROUTE-061 y debe contrastarse con el código desplegado.', Relación: 'TREQ-VISO-013' },
    'TREQ-VISO-006': { 'Regla protegida': 'La clasificación reconciliada mantiene 48 rutas estáticas y 13 dinámicas en VISO.', Origen: 'CODE-AUD-021', 'Tarea responsable': 'CODE-AUD-021', Paquete: PACKAGE_ID, Artefacto: 'Matriz de clasificación estática y dinámica actualizada.', 'Último resultado': 'Pendiente de verificación contra commit estable.', Evidencia: 'Delta esperado: una ruta estática adicional y ninguna ruta dinámica adicional.', Relación: 'TREQ-VISO-004' },
    'TREQ-VISO-012': { 'Regla protegida': 'La reconciliación confirma 59 rutas protegidas y conserva exactamente 2 rutas públicas controladas en VISO.', Origen: 'AUTH-UI-061', 'Tarea responsable': 'AUTH-UI-061; AUTH-UI-041', Paquete: PACKAGE_ID, Artefacto: 'Matriz de exposición y protección de rutas VISO.', 'Último resultado': 'Pendiente de prueba de acceso directo y sesión.', Evidencia: 'La ruta mensual debe heredar autenticación y guard especializado sin ampliar superficie pública.', Relación: 'TREQ-VISO-045' },
    'TREQ-VISO-013': { 'Regla protegida': 'La ruta /staff/schedule/month queda inventariada, vinculada con VPROC-0007 y protegida mediante autorización de servidor.', Origen: 'AUTH-UI-061; VISO-SCH-007', 'Tarea responsable': 'AUTH-UI-061; AUTH-UI-043', Paquete: PACKAGE_ID, Artefacto: 'Contrato de ruta VISO-ROUTE-061 y matriz de acciones.', 'Último resultado': 'Ruta reservada; implementación todavía no certificada.', Evidencia: 'Debe comprobarse navegación Semana/Mes, acceso directo y protección de cada escritura.', Relación: 'TREQ-VISO-005; TREQ-VISO-045' },
    'TREQ-VISO-015': { 'Regla protegida': 'Toda deriva del módulo mensual queda registrada como delta de ruta, layout, componentes y Server Actions antes del paquete.', Origen: 'CODE-AUD-021; AUTH-UI-061', 'Tarea responsable': 'CODE-AUD-021; AUTH-SRV-001', Paquete: PACKAGE_ID, Artefacto: 'Delta técnico trazable de programación mensual VISO.', 'Último resultado': 'Pendiente de inventario reproducible.', Evidencia: 'El delta no reabre snapshots aprobados y debe indicar commit, archivos y conteos finales.', Relación: 'TREQ-VISO-004; TREQ-VISO-023' },
    'TREQ-VISO-023': { 'Regla protegida': 'La reconciliación final cubre las 61 rutas VISO y vincula VISO-ROUTE-061 con proceso, aplicación, autorización y paquete.', Origen: 'CODE-AUD-021; AUTH-UI-061', 'Tarea responsable': 'CODE-AUD-021; AUTH-UI-061', Paquete: PACKAGE_ID, Artefacto: 'Acta de reconciliación integral de superficies VISO.', 'Último resultado': 'Pendiente de ejecutar después de estabilizar el commit.', Evidencia: 'Debe cerrar diferencias entre inventario histórico, código final y registro de rutas.', Relación: 'TREQ-VISO-004; TREQ-VISO-005; TREQ-VISO-015' },
  };

  for (const [identifier, updates] of Object.entries(existingUpdates)) {
    const entry = rows.get(identifier);
    Object.assign(entry.row, updates);
    lines[entry.index] = renderRow(columns.map((column) => entry.row[column]));
  }

  const lastRow = rows.get('TREQ-VISO-023').row;
  const newRules = {
    24: ['Los meses de 28, 29, 30 y 31 días muestran exclusivamente fechas válidas.', 'VISO-SCH-002', 'TREQ-VISO-006'],
    25: ['Las vistas Semana y Mes leen la misma fuente de programación y no generan turnos paralelos.', 'VISO-SCH-001', 'TREQ-VISO-013'],
    26: ['El preview mensual recalcula de forma reactiva minutos actuales, propuestos y proyectados.', 'VISO-SCH-003', 'TREQ-VISO-023'],
    27: ['La creación multibloque conserva fechas, horarios, pausas, rol, área y notas de cada bloque.', 'VISO-SCH-003', 'TREQ-VISO-026'],
    28: ['Una fecha pertenece a un solo bloque y cualquier movimiento entre bloques es explícito.', 'VISO-SCH-003', 'TREQ-VISO-027'],
    29: ['El máximo de bloques mensuales se valida de forma equivalente en cliente y servidor.', 'VISO-SCH-003', 'TREQ-VISO-027'],
    30: ['Cada horario valida inicio, fin, pausas y regla overnight sin producir duración inválida.', 'VISO-SCH-003', 'TREQ-VISO-026'],
    31: ['La política de descanso se aplica de forma visible y nunca se corrige silenciosamente.', 'VISO-SCH-003', 'TREQ-VISO-030'],
    32: ['El límite mensual se calcula con una política exacta, versionada y auditable.', 'VISO-SCH-004', 'TREQ-VISO-034'],
    33: ['El total mensual considera todas las sedes del trabajador sin ampliar el acceso visible del administrador.', 'VISO-SCH-004; AUTH-SRV-012', 'TREQ-VISO-032'],
    34: ['Umbral preventivo y límite de bloqueo provienen de una sola política y no divergen entre TypeScript y PostgreSQL.', 'VISO-SCH-004', 'TREQ-VISO-032'],
    35: ['Una proyección sobre el límite puede guardarse únicamente como borrador y no publicarse.', 'VISO-SCH-005', 'TREQ-VISO-032'],
    36: ['La publicación semanal y mensual aplica el mismo bloqueo y la misma política.', 'VISO-SCH-005; AUTH-DB-027', 'TREQ-VISO-035'],
    37: ['Guardar borrador y publicar son comandos separados, con permisos y resultados distintos.', 'VISO-SCH-005; AUTH-SRV-005', 'TREQ-VISO-035'],
    38: ['Los conflictos se recalculan en servidor inmediatamente antes de guardar o publicar.', 'VISO-SCH-006; AUTH-SRV-004', 'TREQ-VISO-037'],
    39: ['Dos publicaciones concurrentes no superan el límite ni dejan una publicación parcial.', 'VISO-SCH-006; AUTH-DB-027', 'TREQ-VISO-038'],
    40: ['El rollback restaura el estado anterior sin retirar la protección del límite vigente.', 'VISO-SCH-006; AUTH-DB-029', 'TREQ-VISO-039'],
    41: ['La eliminación masiva afecta solo borradores autorizados y conserva auditoría.', 'VISO-SCH-005; AUTH-SRV-011', 'TREQ-VISO-037'],
    42: ['Persona, sede, área, rol, fechas y alcance se validan nuevamente en servidor.', 'VISO-SCH-007; AUTH-SRV-005', 'TREQ-VISO-038'],
    43: ['La auditoría conserva actor real, actor efectivo, simulación, versión, política y published_by.', 'VISO-SCH-007; AUTH-SRV-014', 'TREQ-VISO-042'],
    44: ['La notificación hacia ANIMA es idempotente, recuperable y correlacionada con la versión publicada.', 'VISO-SCH-007; INT-APP-003', 'TREQ-VISO-036'],
    45: ['Una URL, formulario o Server Action manipulados quedan bloqueados con un error canónico comprensible.', 'AUTH-UI-061; AUTH-SRV-004', 'TREQ-VISO-013'],
  };

  for (const [number, [rule, taskRefs, relation]] of Object.entries(newRules)) {
    const identifier = `TREQ-VISO-${String(number).padStart(3, '0')}`;
    const row = {
      ID: identifier,
      Dominio: 'VISO',
      'Regla protegida': rule,
      Origen: taskRefs,
      'Riesgo / prioridad': lastRow['Riesgo / prioridad'],
      'Tipo / modalidad': lastRow['Tipo / modalidad'],
      'Tarea responsable': taskRefs,
      Paquete: PACKAGE_ID,
      'Repositorio / ambiente': 'vento-viso y vento-shell / staging y producción',
      Estado: lastRow.Estado,
      Artefacto: `Prueba y evidencia ${identifier} del paquete ${PACKAGE_ID}.`,
      'Último resultado': 'Pendiente de implementación y ejecución dentro del paquete.',
      Evidencia: `Requisito materializado por ${taskRefs}; debe vincularse mediante DELIV-PKG-016 y ejecutarse con SHELL-CI-020.`,
      Relación: relation,
    };
    if (rows.has(identifier)) {
      lines[rows.get(identifier).index] = renderRow(columns.map((column) => row[column]));
    } else {
      lines.push(renderRow(columns.map((column) => row[column])));
    }
  }

  const newSection = lines.join('\n');
  registry = `${registry.slice(0, sectionStart)}${newSection}${registry.slice(sectionEnd)}`;

  const registryStart = registry.indexOf('### Registro');
  const registryEnd = registry.indexOf('### Reglas obligatorias', registryStart);
  if (registryStart < 0 || registryEnd < 0) fail('No se encontró el registro TREQ completo.');
  const registryBody = registry.slice(registryStart, registryEnd);
  const allRows = [];
  const perDomain = new Map();
  for (const line of registryBody.split('\n')) {
    if (!line.trim().startsWith('|')) continue;
    const cells = splitRow(line);
    if (cells.length !== 14) continue;
    const identifier = clean(cells[0]);
    const match = /^TREQ-([A-Z]+)-(\d{3,})$/.exec(identifier);
    if (!match) continue;
    allRows.push(identifier);
    if (!perDomain.has(match[1])) perDomain.set(match[1], []);
    perDomain.get(match[1]).push(identifier);
  }

  const total = allRows.length;
  const domainsCount = [...perDomain.values()].filter((values) => values.length > 0).length;
  registry = replaceSummary(registry, 'Requisitos vigentes', `**${total}**`);
  registry = replaceSummary(registry, 'Dominios con requisitos', `**${domainsCount}**`);
  registry = replaceSummary(registry, 'Identificadores duplicados', '**0**');
  registry = replaceSummary(registry, 'Relaciones `TREQ-*` no resolubles', '**0**');
  registry = replaceSummary(registry, 'Filas con catorce columnas', `**${total} de ${total}**`);

  const distributionStart = registry.indexOf('Distribución vigente:');
  const distributionEnd = registry.indexOf('### Procedimiento obligatorio de actualización', distributionStart);
  if (distributionStart < 0 || distributionEnd < 0) fail('No se encontró la distribución vigente del registro TREQ.');
  let distribution = registry.slice(distributionStart, distributionEnd);
  for (const [domain, identifiers] of perDomain.entries()) {
    const expectedRange = identifiers.length === 1
      ? identifiers[0]
      : `${identifiers[0]} a ${identifiers.at(-1)}`;
    const regex = new RegExp(`^\\|\\s*\`?${domain}\`?\\s*\\|.*$`, 'm');
    if (!regex.test(distribution)) fail(`No se pudo actualizar distribución para ${domain}.`);
    distribution = distribution.replace(regex, `| \`${domain}\` | \`${expectedRange}\` | **${identifiers.length}** |`);
  }
  registry = `${registry.slice(0, distributionStart)}${distribution}${registry.slice(distributionEnd)}`;
  write(registryPath, registry);

  const migrationPath = 'supabase/migrations/20260731082600_viso_monthly_schedule_186_hour_publish_guard.sql';
  const absoluteMigrationPath = path.join(ROOT, migrationPath);
  if (fs.existsSync(absoluteMigrationPath)) {
    let migration = read(migrationPath);
    const packageHeader = '-- Package reservation: VISO-SCHEDULE-MONTHLY-001.\n-- Status: provisional policy; not authorized for production rollout.\n-- Canonical process: VPROC-0007.\n-- Canonical migration repository: vento-shell.\n';
    if (!migration.startsWith('-- Package reservation:')) migration = `${packageHeader}${migration}`;
    migration = migration.replace(
      '-- Regla operativa aprobada para esta implementación:',
      '-- Regla provisional local pendiente de aprobación canónica en VISO-SCH-004 y VISO-SCH-008:',
    );
    migration = migration.replace(
      /comment on function public\.viso_enforce_monthly_schedule_publish_limit\(\) is\n\s*'[^']*';/,
      "comment on function public.viso_enforce_monthly_schedule_publish_limit() is\n  'Reserved for package VISO-SCHEDULE-MONTHLY-001. Guards publication of VPROC-0007 scheduling against the provisional 186-hour monthly threshold. Value, validity, policy versioning and approved exception handling remain required before production rollout.';",
    );
    write(migrationPath, migration);
  }

  console.log(`\nCambios aplicados. Registro TREQ recalculado con ${total} requisitos y ${(perDomain.get('VISO') ?? []).length} requisitos VISO.`);
}

function main() {
  const branch = run('git branch --show-current', { capture: true }).stdout.trim();
  if (branch !== 'main') fail(`Debes estar en la rama main. Rama actual: ${branch || '(ninguna)'}.`);

  const status = run('git status --porcelain', { capture: true }).stdout.trim();
  if (status) fail('El repositorio tiene cambios locales sin guardar. No se modificó ningún archivo.');

  console.log('\nAplicando los cambios restantes del delta VISO Schedule...');
  applyPatch();

  const validations = [
    'npm run docs:plan:build',
    'npm run docs:plan:check',
    'npm run docs:plan:test',
    'npm run docs:treq:check',
    'npm run docs:treq:test',
    'npm run docs:process-apps:check',
    'npm run docs:screens:check',
    'npm run docs:screen-processes:check',
    'npm run docs:screen-matrices:check',
    'git diff --check',
  ];
  for (const command of validations) run(command);

  for (const file of TEMP_FILES) {
    if (fs.existsSync(file)) fs.unlinkSync(file);
  }

  run('git config user.name "vento-plan-bot"');
  run('git config user.email "dev.ventogroup@gmail.com"');
  run('git add -A');

  const staged = run('git diff --cached --quiet', { allowFailure: true });
  if (staged.status === 0) {
    console.log('\nNo había cambios restantes por confirmar.');
    return;
  }
  if (staged.status !== 1) process.exit(staged.status ?? 1);

  run('git commit -m "docs: complete VISO schedule plan cascade"');
  run('git push origin main');
  console.log('\nLISTO: cambios aplicados, validados, confirmados y enviados a main.');
}

main();