import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = process.cwd();
const apply = process.argv.includes('--apply');

const files = {
  e: 'docs/plan-canonico/modular/bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md',
  h: 'docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md',
  r1: 'docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md',
  r2: 'docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md',
  order: 'docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md',
  continuity: 'scripts/docs/plan-continuity-global.mjs',
  activeConfig: 'docs/plan-canonico/modular/active-sequence.json',
  obsoleteTransition: 'scripts/docs/transition-auth-to-e1.mjs',
};

function fail(message) {
  throw new Error(message);
}

function absolute(relativePath) {
  return path.join(root, relativePath);
}

function read(relativePath) {
  const filePath = absolute(relativePath);
  if (!fs.existsSync(filePath)) fail(`no existe ${relativePath}.`);
  return fs.readFileSync(filePath, 'utf8').replace(/\r\n?/g, '\n');
}

function write(relativePath, content) {
  const filePath = absolute(relativePath);
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  fs.writeFileSync(filePath, content.replace(/(?:\n)+$/u, '') + '\n', 'utf8');
}

function replaceOnce(source, search, replacement, label) {
  if (source.includes(replacement)) return source;
  const first = source.indexOf(search);
  if (first < 0) fail(`no se encontró el ancla para ${label}.`);
  if (source.indexOf(search, first + search.length) >= 0) {
    fail(`el ancla para ${label} aparece más de una vez.`);
  }
  return source.replace(search, replacement);
}

function replaceRegexOnce(source, pattern, replacement, label) {
  const matches = [...source.matchAll(new RegExp(pattern.source, pattern.flags.includes('g') ? pattern.flags : `${pattern.flags}g`))];
  if (matches.length === 0) fail(`no se encontró el patrón para ${label}.`);
  if (matches.length > 1) fail(`el patrón para ${label} aparece más de una vez.`);
  return source.replace(pattern, replacement);
}

function assertContains(source, value, label) {
  if (!source.includes(value)) fail(`no se encontró ${label}.`);
}

function findFunctionRange(source, functionName) {
  const declaration = new RegExp(`function\\s+${functionName}\\s*\\(`, 'm');
  const match = declaration.exec(source);
  if (!match) fail(`no se encontró la función ${functionName}().`);

  const start = match.index;
  const openBrace = source.indexOf('{', start + match[0].length);
  if (openBrace < 0) fail(`no se encontró la llave inicial de ${functionName}().`);

  let depth = 0;
  let state = 'normal';
  let escaped = false;

  for (let index = openBrace; index < source.length; index += 1) {
    const char = source[index];
    const next = source[index + 1];

    if (state === 'line-comment') {
      if (char === '\n') state = 'normal';
      continue;
    }
    if (state === 'block-comment') {
      if (char === '*' && next === '/') {
        state = 'normal';
        index += 1;
      }
      continue;
    }
    if (state === 'single-quote') {
      if (escaped) escaped = false;
      else if (char === '\\') escaped = true;
      else if (char === "'") state = 'normal';
      continue;
    }
    if (state === 'double-quote') {
      if (escaped) escaped = false;
      else if (char === '\\') escaped = true;
      else if (char === '"') state = 'normal';
      continue;
    }
    if (state === 'template') {
      if (escaped) escaped = false;
      else if (char === '\\') escaped = true;
      else if (char === '`') state = 'normal';
      continue;
    }

    if (char === '/' && next === '/') {
      state = 'line-comment';
      index += 1;
      continue;
    }
    if (char === '/' && next === '*') {
      state = 'block-comment';
      index += 1;
      continue;
    }
    if (char === "'") {
      state = 'single-quote';
      continue;
    }
    if (char === '"') {
      state = 'double-quote';
      continue;
    }
    if (char === '`') {
      state = 'template';
      continue;
    }
    if (char === '{') {
      depth += 1;
      continue;
    }
    if (char === '}') {
      depth -= 1;
      if (depth === 0) {
        let end = index + 1;
        while (source[end] === '\r' || source[end] === '\n') end += 1;
        return { start, end };
      }
    }
  }

  fail(`no se encontró el cierre de ${functionName}().`);
}

function replaceFunction(source, functionName, replacement) {
  if (source.includes(replacement.trim())) return source;
  const { start, end } = findFunctionRange(source, functionName);
  return source.slice(0, start) + replacement.trimEnd() + '\n\n' + source.slice(end);
}

const approved030 = '### ✅ AUTH-CTX-030 — Definir plan de pruebas contractuales del contexto y la decisión';
const eSource = read(files.e);
assertContains(eSource, approved030, 'AUTH-CTX-030 aprobada');

let h = read(files.h);
h = replaceOnce(
  h,
  '### [ ] SHELL-CTX-005 — Implementar razones seguras de bloqueo contextual',
  '### [ ] SHELL-CTX-005 — Implementar razones seguras de bloqueo contextual\n### [ ] SHELL-CTX-006 — Implementar caché compartida, single-flight y validación de frescura',
  'SHELL-CTX-006'
);
h = replaceOnce(
  h,
  'AUTH-DB-033\n        ↓\nAUTH-DB-034',
  'AUTH-DB-033\n        ↓\nAUTH-DB-035\n        ↓\nAUTH-DB-034',
  'orden AUTH-DB-035 en BLOQUE H'
);
h = replaceOnce(h, 'SHELL-CTX-002 a SHELL-CTX-005', 'SHELL-CTX-002 a SHELL-CTX-006', 'rango SHELL-CTX');
h = replaceOnce(
  h,
  '- `AUTH-DB-033`, `AUTH-DB-034` y `AUTH-DB-032` implementan contexto, decisión y persistencia autoritativos;',
  '- `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-032` implementan contexto, frescura, decisión y persistencia autoritativos;',
  'regla AUTH-DB-035'
);
h = replaceOnce(
  h,
  '- `SHELL-CTX-002..005` consumen el contexto canónico ya disponible y producen proyecciones contextuales seguras;',
  '- `SHELL-CTX-002..006` consumen el contexto canónico ya disponible y producen proyecciones contextuales seguras;\n- `AUTH-DB-035` implementa el token transaccional de frescura y los eventos de invalidación;\n- `SHELL-CTX-006` implementa la caché compartida validada y el single-flight sin decidir permisos;',
  'reglas de caché compartida'
);

let r1 = read(files.r1);
r1 = replaceOnce(
  r1,
  '### [ ] AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura\n### [ ] AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras',
  '### [ ] AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura\n### [ ] AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto\n### [ ] AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras',
  'AUTH-DB-035 en R1'
);

let r2 = read(files.r2);
r2 = replaceOnce(
  r2,
  '- disponer de `AUTH-DB-033`, `AUTH-DB-034` y `AUTH-DB-032` en R1;',
  '- disponer de `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-032` en R1;',
  'dependencia AUTH-DB-035 en R2'
);

let order = read(files.order);
order = order.replaceAll('AUTH-DB-032-034', 'AUTH-DB-032-035');
order = replaceOnce(
  order,
  'AUTH-DB-033\n        ↓\nAUTH-DB-034',
  'AUTH-DB-033\n        ↓\nAUTH-DB-035\n        ↓\nAUTH-DB-034',
  'secuencia contractual R1'
);
order = replaceOnce(
  order,
  '- `AUTH-DB-033` requiere la arquitectura aprobada de esquemas, helpers, `SECURITY DEFINER`, grants y RLS;\n- `AUTH-DB-034` depende del resolver canónico implementado por `AUTH-DB-033`;',
  '- `AUTH-DB-033` requiere la arquitectura aprobada de esquemas, helpers, `SECURITY DEFINER`, grants y RLS;\n- `AUTH-DB-035` depende del resolver canónico y debe implementar generaciones transaccionales, token de frescura y outbox de invalidación;\n- `AUTH-DB-034` se implementa después de disponer del resolver y del contrato físico de frescura;',
  'reglas contractuales R1'
);
order = replaceOnce(
  order,
  '→ AUTH-DB-033\n→ AUTH-DB-034\n→ AUTH-DB-032',
  '→ AUTH-DB-033\n→ AUTH-DB-035\n→ AUTH-DB-034\n→ AUTH-DB-032',
  'secuencia canónica compartida'
);
order = replaceOnce(order, 'SHELL-CTX-002..005', 'SHELL-CTX-002..006', 'rango SHELL-CTX en orden maestro');
order = replaceOnce(
  order,
  'no puede completarse antes de resolver contexto, evaluar, persistir, adaptar\nRPC y RLS, demostrar rollback y bloquear nuevos consumos legacy.',
  'no puede completarse antes de resolver contexto, demostrar frescura e invalidación, evaluar, persistir, adaptar\nRPC y RLS, demostrar rollback y bloquear nuevos consumos legacy.',
  'explicación de frescura en orden maestro'
);

let continuity = read(files.continuity);
if (!continuity.includes("const ACTIVE_SEQUENCE_CONFIG = 'active-sequence.json';")) {
  continuity = replaceOnce(
    continuity,
    "const REGISTRY_OUTPUT = '.generated/REGISTRO_GLOBAL_DE_TAREAS.md';",
    "const REGISTRY_OUTPUT = '.generated/REGISTRO_GLOBAL_DE_TAREAS.md';\nconst ACTIVE_SEQUENCE_CONFIG = 'active-sequence.json';",
    'constante de secuencia activa'
  );
}

continuity = replaceFunction(
  continuity,
  'buildExecutionSequence',
  `function expandSequenceSegments(segments) {
  if (!Array.isArray(segments) || segments.length === 0) {
    fail('active-sequence.json no contiene segmentos válidos.');
  }

  const ids = segments.flatMap((segment) => {
    const { prefix, from, to } = segment ?? {};
    if (
      typeof prefix !== 'string'
      || !Number.isInteger(from)
      || !Number.isInteger(to)
      || from < 1
      || to < from
    ) {
      fail('active-sequence.json contiene un segmento inválido.');
    }

    return Array.from(
      { length: to - from + 1 },
      (_, index) => \`${prefix}-\${String(from + index).padStart(3, '0')}\`
    );
  });

  if (new Set(ids).size !== ids.length) {
    fail('active-sequence.json genera tareas duplicadas.');
  }
  return ids;
}

function readActiveSequenceConfig(baseDir) {
  const configPath = path.join(baseDir, ACTIVE_SEQUENCE_CONFIG);
  if (!fs.existsSync(configPath)) {
    fail(\`no existe \${path.relative(baseDir, configPath)}; debe definirse el bloque activo.\`);
  }

  const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
  if (config.schema_version !== 1) fail('active-sequence.json utiliza una versión no soportada.');
  if (typeof config.sequence_id !== 'string') fail('active-sequence.json no define sequence_id.');
  if (typeof config.block_code !== 'string') fail('active-sequence.json no define block_code.');
  if (typeof config.block_title !== 'string') fail('active-sequence.json no define block_title.');
  if (typeof config.previous_task_id !== 'string') fail('active-sequence.json no define previous_task_id.');

  return { ...config, taskIds: expandSequenceSegments(config.segments) };
}

function buildExecutionSequence(activeConfig) {
  return [activeConfig.previous_task_id, ...activeConfig.taskIds];
}`
);

continuity = replaceFunction(
  continuity,
  'buildProgressSummary',
  `function buildProgressSummary(continuity, activeConfig) {
  const approved = continuity.sequence.slice(1).filter((task) => task.state === 'APROBADA').length;
  return \`\${activeConfig.block_code}: \${approved} de \${continuity.sequence.length - 1} aprobadas; \${continuity.current.id} \${progressStatus(continuity.current)}\`;
}`
);

continuity = replaceFunction(
  continuity,
  'updateProgressSection',
  `function updateProgressSection(section, taskMap, continuity, activeConfig) {
  const gate = taskMap.get('AUTH-MOD-021');
  const gateValue = gate.state === 'APROBADA'
    ? '**APROBADA — PUERTA SUPERADA**'
    : \`**\${gate.state} — PUERTA ANTES DE AUTH-CTX-028**\`;

  let updated = replaceRow(section, '\`AUTH-MOD-021\`', gateValue);
  const firstCtxRow = updated.search(/^\\|\\s*\`AUTH-CTX-\\d{3}\`/m);
  const implementationRow = updated.search(/^\\|\\s*Implementación física\\s*\\|/m);
  if (firstCtxRow < 0 || implementationRow <= firstCtxRow) {
    fail('no se pudo localizar el bloque de progreso AUTH-CTX.');
  }

  const rows = \`\${buildCtxProgressRows(taskMap).join('\\n')}\\n\`;
  updated = updated.slice(0, firstCtxRow) + rows + updated.slice(implementationRow);

  const activePattern = new RegExp(
    \`^\\\\|\\\\s*\${escapeRegex(activeConfig.block_code)}\\\\s*\\\\|[^\\\\n]*\\\\|\\\\n?\`,
    'm'
  );
  updated = updated.replace(activePattern, '');

  const approved = continuity.sequence.slice(1).filter((task) => task.state === 'APROBADA').length;
  const activeRow = \`| \${activeConfig.block_code} | **\${approved} DE \${continuity.sequence.length - 1} APROBADAS — ACTUAL \${continuity.current.id}** |\`;
  const implementationPattern = /^\\|\\s*Implementación física\\s*\\|[^\\n]*\\|$/m;
  if (!implementationPattern.test(updated)) fail('no se encontró la fila Implementación física.');
  return updated.replace(implementationPattern, \`\${activeRow}\\n$&\`);
}`
);

continuity = replaceFunction(
  continuity,
  'buildControlBlock',
  `function buildControlBlock(continuity, activeConfig) {
  const approved = continuity.sequence.slice(1).filter((task) => task.state === 'APROBADA').length;
  const lines = [
    '## Control de continuidad',
    '',
    '\`\`\`text',
    'ÚLTIMA TAREA APROBADA',
    formatTask(continuity.lastApproved),
    '        ↓',
    'TAREA ACTUAL',
    formatTask(continuity.current),
  ];

  if (continuity.next) {
    lines.push('        ↓', 'SIGUIENTE TAREA RESERVADA', formatTask(continuity.next));
  }

  lines.push(
    '        ↓',
    'CONTINUIDAD DEL BLOQUE',
    \`\${activeConfig.block_code} — \${approved} de \${continuity.sequence.length - 1} tareas aprobadas\`,
    '\`\`\`'
  );
  return lines.join('\\n');
}`
);

continuity = replaceRegexOnce(
  continuity,
  /function updateHeader\(header, manifest, taskMap, stats, continuity\) \{/,
  'function updateHeader(header, manifest, taskMap, stats, continuity, activeConfig) {',
  'firma updateHeader'
);

if (!continuity.includes("'Bloque actual', `**${activeConfig.block_code}")) {
  continuity = replaceOnce(
    continuity,
    "  updated = replaceRow(updated, 'Estado de la tarea actual', `**${continuity.current.state}**`);",
    "  updated = replaceRow(updated, 'Estado de la tarea actual', `**${continuity.current.state}**`);\n  updated = replaceRow(updated, 'Bloque actual', `**${activeConfig.block_code} — ${activeConfig.block_title}**`);",
    'fila Bloque actual'
  );
}
continuity = continuity.replace(
  "  if (continuity.next) {\n    updated = replaceRow(updated, 'Siguiente tarea', `**${formatTask(continuity.next)}**`);\n  }",
  "  updated = replaceRow(updated, 'Siguiente tarea', continuity.next ? `**${formatTask(continuity.next)}**` : '**NINGUNA — CIERRE DEL BLOQUE**');"
);
continuity = continuity.replaceAll('buildProgressSummary(taskMap, continuity)', 'buildProgressSummary(continuity, activeConfig)');
continuity = continuity.replaceAll('(section) => updateProgressSection(section, taskMap)', '(section) => updateProgressSection(section, taskMap, continuity, activeConfig)');
continuity = continuity.replaceAll('buildControlBlock(continuity)', 'buildControlBlock(continuity, activeConfig)');
continuity = replaceOnce(
  continuity,
  "    if (continuity.next) result = replaceRow(result, 'Siguiente tarea', formatTask(continuity.next, true));",
  "    result = replaceRow(result, 'Siguiente tarea', continuity.next ? formatTask(continuity.next, true) : 'NINGUNA — CIERRE DEL BLOQUE');",
  'continuidad inmediata siguiente'
);
continuity = replaceOnce(
  continuity,
  '  const taskMap = readGlobalTaskRegistry(baseDir, manifest);\n  const stats = summarizeRegistry(taskMap);\n  const sequenceIds = buildExecutionSequence();\n  const continuity = resolveContinuity(taskMap, sequenceIds);',
  '  const taskMap = readGlobalTaskRegistry(baseDir, manifest);\n  const stats = summarizeRegistry(taskMap);\n  const activeConfig = readActiveSequenceConfig(baseDir);\n  const sequenceIds = buildExecutionSequence(activeConfig);\n  const continuity = resolveContinuity(taskMap, sequenceIds);',
  'lectura de secuencia activa'
);
continuity = replaceOnce(
  continuity,
  '  const nextHeader = updateHeader(currentHeader, manifest, taskMap, stats, continuity);',
  '  const nextHeader = updateHeader(currentHeader, manifest, taskMap, stats, continuity, activeConfig);',
  'llamada updateHeader'
);
continuity = continuity.replace(
  '  return { changed: headerChanged || registryChanged, stats, taskMap, ...continuity };',
  '  return { changed: headerChanged || registryChanged, stats, taskMap, activeConfig, ...continuity };'
);

const activeConfig = {
  schema_version: 1,
  sequence_id: 'E1-DISCOVERY-001',
  block_code: 'BLOQUE E1',
  block_title: 'Descubrimiento integral de operación, capacidades y cobertura de implementación',
  previous_task_id: 'AUTH-CTX-030',
  segments: [
    { prefix: 'OPS-AUD', from: 1, to: 15 },
    { prefix: 'CAP-MAP', from: 1, to: 15 },
    { prefix: 'CODE-AUD', from: 1, to: 20 },
    { prefix: 'CAP-SCOPE', from: 1, to: 19 },
    { prefix: 'CAP-COVER', from: 1, to: 12 },
    { prefix: 'GAP-CTRL', from: 1, to: 8 },
  ],
};

console.log('AUTH-CTX-030 aprobada: OK');
console.log('AUTH-DB-035 y SHELL-CTX-006: LISTAS PARA MATERIALIZAR');
console.log('Continuidad: AUTH-CTX-030 → OPS-AUD-001 → OPS-AUD-002');

if (!apply) {
  console.log('DRY-RUN OK');
  process.exit(0);
}

write(files.h, h);
write(files.r1, r1);
write(files.r2, r2);
write(files.order, order);
write(files.continuity, continuity);
write(files.activeConfig, JSON.stringify(activeConfig, null, 2));

const obsoletePath = absolute(files.obsoleteTransition);
if (fs.existsSync(obsoletePath)) fs.rmSync(obsoletePath);

const selfPath = fileURLToPath(import.meta.url);
if (fs.existsSync(selfPath)) fs.rmSync(selfPath);

console.log('OK: materialización y transición documental aplicadas.');
