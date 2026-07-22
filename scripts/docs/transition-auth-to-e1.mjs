import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const root = process.cwd();
const apply = process.argv.includes('--apply');

const continuityPath = path.join(root, 'scripts/docs/plan-continuity-global.mjs');
const configPath = path.join(root, 'docs/plan-canonico/modular/active-sequence.json');
const headerPath = path.join(root, 'docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md');
const registryPath = path.join(root, 'docs/plan-canonico/modular/.generated/REGISTRO_GLOBAL_DE_TAREAS.md');
const compiledPath = path.join(
  root,
  'docs/plan-canonico/modular/.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md'
);
const manifestPath = path.join(root, 'docs/plan-canonico/modular/manifest.json');

function fail(message) {
  throw new Error(message);
}

function readOptional(filePath) {
  return fs.existsSync(filePath) ? fs.readFileSync(filePath, 'utf8') : null;
}

function restore(filePath, content) {
  if (content === null) {
    if (fs.existsSync(filePath)) fs.rmSync(filePath);
    return;
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  fs.writeFileSync(filePath, content, 'utf8');
}

function replaceRequired(source, pattern, replacement, label) {
  if (!pattern.test(source)) {
    fail(`no se encontró el bloque esperado: ${label}.`);
  }
  return source.replace(pattern, replacement);
}

function findFunctionRange(source, functionName) {
  const declaration = new RegExp(`function\\s+${functionName}\\s*\\(`, 'm');
  const match = declaration.exec(source);
  if (!match) {
    fail(`no se encontró la función ${functionName}().`);
  }

  const start = match.index;
  const openBrace = source.indexOf('{', start + match[0].length);
  if (openBrace < 0) {
    fail(`no se encontró la llave inicial de ${functionName}().`);
  }

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
      if (escaped) {
        escaped = false;
      } else if (char === '\\') {
        escaped = true;
      } else if (char === "'") {
        state = 'normal';
      }
      continue;
    }

    if (state === 'double-quote') {
      if (escaped) {
        escaped = false;
      } else if (char === '\\') {
        escaped = true;
      } else if (char === '"') {
        state = 'normal';
      }
      continue;
    }

    if (state === 'template') {
      if (escaped) {
        escaped = false;
      } else if (char === '\\') {
        escaped = true;
      } else if (char === '`') {
        state = 'normal';
      }
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
  const { start, end } = findFunctionRange(source, functionName);
  return source.slice(0, start) + replacement.trimEnd() + '\n\n' + source.slice(end);
}

function maskFencedCode(source) {
  let insideFence = false;

  return source
    .split('\n')
    .map((line) => {
      if (/^\s*```/.test(line)) {
        insideFence = !insideFence;
        return '';
      }
      return insideFence ? '' : line;
    })
    .join('\n');
}

function runNode(args) {
  const result = spawnSync(process.execPath, args, {
    cwd: root,
    encoding: 'utf8',
    stdio: 'pipe',
  });

  if (result.stdout) process.stdout.write(result.stdout);
  if (result.stderr) process.stderr.write(result.stderr);

  if (result.status !== 0) {
    fail(`${process.execPath} ${args.join(' ')} terminó con código ${result.status}.`);
  }
}

function taskStateFromSources(id) {
  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
  const escapedId = id.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const pattern = new RegExp(
    `^###\\s+(?<marker>\\[[ x~]\\]|[✅🟡❌])\\s+${escapedId}\\b`,
    'mu'
  );

  for (const relativePath of manifest.files) {
    const fullPath = path.join(root, 'docs/plan-canonico/modular', relativePath);
    const source = maskFencedCode(fs.readFileSync(fullPath, 'utf8'));
    const match = source.match(pattern);

    if (match) {
      return {
        marker: match.groups?.marker,
        relativePath,
      };
    }
  }

  return null;
}

const activeConfig = {
  schema_version: 1,
  sequence_id: 'E1-DISCOVERY-001',
  block_code: 'BLOQUE E1',
  block_title:
    'Descubrimiento integral de operación, capacidades y cobertura de implementación',
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

const originalContinuity = readOptional(continuityPath);
const originalConfig = readOptional(configPath);
const originalHeader = readOptional(headerPath);
const originalRegistry = readOptional(registryPath);
const originalCompiled = readOptional(compiledPath);

if (originalContinuity === null) {
  fail(`no existe ${path.relative(root, continuityPath)}.`);
}

if (readOptional(manifestPath) === null) {
  fail(`no existe ${path.relative(root, manifestPath)}.`);
}

for (const id of ['AUTH-CTX-028', 'AUTH-CTX-029', 'AUTH-CTX-030']) {
  const state = taskStateFromSources(id);

  if (!state) {
    fail(`no se encontró ${id} en los fragmentos canónicos.`);
  }

  if (state.marker !== '✅' && state.marker !== '[x]') {
    fail(`${id} todavía no está aprobada en ${state.relativePath}.`);
  }
}

for (const id of ['AUTH-DB-035', 'SHELL-CTX-006']) {
  const state = taskStateFromSources(id);

  if (!state) {
    fail(
      `falta materializar ${id}. Agrega primero las dos tareas nuevas aprobadas por AUTH-CTX-029.`
    );
  }

  if (state.marker !== '[ ]') {
    fail(`${id} debe estar NO INICIADA; marcador encontrado: ${state.marker}.`);
  }
}

let next = originalContinuity;

if (!next.includes("const ACTIVE_SEQUENCE_CONFIG = 'active-sequence.json';")) {
  next = replaceRequired(
    next,
    /const REGISTRY_OUTPUT = '\.generated\/REGISTRO_GLOBAL_DE_TAREAS\.md';/,
    "const REGISTRY_OUTPUT = '.generated/REGISTRO_GLOBAL_DE_TAREAS.md';\nconst ACTIVE_SEQUENCE_CONFIG = 'active-sequence.json';",
    'constante REGISTRY_OUTPUT'
  );
}

next = replaceFunction(
  next,
  'buildExecutionSequence',
  `function expandSequenceSegments(segments) {
  if (!Array.isArray(segments) || segments.length === 0) {
    fail('active-sequence.json no contiene segmentos válidos.');
  }

  return segments.flatMap((segment) => {
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
      (_, index) => \`\${prefix}-\${String(from + index).padStart(3, '0')}\`
    );
  });
}

function readActiveSequenceConfig(baseDir) {
  const configPath = path.join(baseDir, ACTIVE_SEQUENCE_CONFIG);

  if (!fs.existsSync(configPath)) {
    fail(\`no existe \${path.relative(baseDir, configPath)}; debe definirse el bloque activo.\`);
  }

  const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));

  if (config.schema_version !== 1) {
    fail('active-sequence.json utiliza una versión no soportada.');
  }

  if (typeof config.previous_task_id !== 'string') {
    fail('active-sequence.json no define previous_task_id.');
  }

  if (typeof config.block_code !== 'string') {
    fail('active-sequence.json no define block_code.');
  }

  if (typeof config.block_title !== 'string') {
    fail('active-sequence.json no define block_title.');
  }

  const taskIds = expandSequenceSegments(config.segments);

  if (new Set(taskIds).size !== taskIds.length) {
    fail('active-sequence.json genera tareas duplicadas.');
  }

  return {
    ...config,
    task_ids: taskIds,
  };
}

function buildExecutionSequence(activeConfig) {
  return [activeConfig.previous_task_id, ...activeConfig.task_ids];
}`
);

next = replaceFunction(
  next,
  'buildProgressSummary',
  `function buildProgressSummary(taskMap, continuity, activeConfig) {
  const tasks = activeConfig.task_ids.map((id) => taskMap.get(id));
  const approved = tasks.filter((task) => task?.state === 'APROBADA').length;

  return \`\${activeConfig.block_code}: \${approved} de \${tasks.length} aprobadas; \${continuity.current.id} \${progressStatus(continuity.current)}\`;
}`
);

next = replaceFunction(
  next,
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

  const activeTasks = activeConfig.task_ids.map((id) => taskMap.get(id));
  const approved = activeTasks.filter((task) => task?.state === 'APROBADA').length;
  const activeValue =
    \`**\${approved} DE \${activeTasks.length} APROBADAS — ACTUAL \${continuity.current.id}**\`;

  const activePattern = new RegExp(
    \`^\\\\|\\\\s*\${escapeRegex(activeConfig.block_code)}\\\\s*\\\\|[^\\\\n]*\\\\|$\`,
    'm'
  );

  if (activePattern.test(updated)) {
    updated = updated.replace(
      activePattern,
      \`| \${activeConfig.block_code} | \${activeValue} |\`
    );
  } else {
    const implementationPattern = /^\\|\\s*Implementación física\\s*\\|[^\\n]*\\|$/m;
    const implementation = updated.match(implementationPattern)?.[0];

    if (!implementation) {
      fail('no se encontró la fila Implementación física.');
    }

    updated = updated.replace(
      implementationPattern,
      \`| \${activeConfig.block_code} | \${activeValue} |\\n\${implementation}\`
    );
  }

  return updated;
}`
);

next = replaceFunction(
  next,
  'buildControlBlock',
  `function buildControlBlock(continuity, activeConfig) {
  const activeTasks = continuity.sequence.slice(1);
  const approved = activeTasks.filter((task) => task.state === 'APROBADA').length;

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
    lines.push(
      '        ↓',
      'SIGUIENTE TAREA RESERVADA',
      formatTask(continuity.next)
    );
  }

  lines.push(
    '        ↓',
    'CONTINUIDAD DEL BLOQUE',
    \`\${activeConfig.block_code} — \${approved} de \${activeTasks.length} tareas aprobadas\`,
    '\`\`\`'
  );

  return lines.join('\\n');
}`
);

next = replaceRequired(
  next,
  /function updateHeader\(header,\s*manifest,\s*taskMap,\s*stats,\s*continuity\)\s*\{/,
  'function updateHeader(header, manifest, taskMap, stats, continuity, activeConfig) {',
  'firma de updateHeader'
);

if (!next.includes("'Bloque actual',\n    `**${activeConfig.block_code}")) {
  next = replaceRequired(
    next,
    /updated = replaceRow\(\s*updated,\s*'Estado de la tarea actual',\s*`\*\*\$\{continuity\.current\.state\}\*\*`\s*\);/,
    `updated = replaceRow(updated, 'Estado de la tarea actual', \`**\${continuity.current.state}**\`);
  updated = replaceRow(
    updated,
    'Bloque actual',
    \`**\${activeConfig.block_code} — \${activeConfig.block_title}**\`
  );`,
    'actualización de Bloque actual'
  );
}

next = next.replace(
  /buildProgressSummary\(taskMap,\s*continuity\)/g,
  'buildProgressSummary(taskMap, continuity, activeConfig)'
);

next = next.replace(
  /\(section\)\s*=>\s*updateProgressSection\(section,\s*taskMap\)/g,
  '(section) => updateProgressSection(section, taskMap, continuity, activeConfig)'
);

next = next.replace(
  /buildControlBlock\(continuity\)/g,
  'buildControlBlock(continuity, activeConfig)'
);

next = replaceRequired(
  next,
  /const taskMap = readGlobalTaskRegistry\(baseDir,\s*manifest\);\s*const stats = summarizeRegistry\(taskMap\);\s*const sequenceIds = buildExecutionSequence\(\);\s*const continuity = resolveContinuity\(taskMap,\s*sequenceIds\);/,
  `const taskMap = readGlobalTaskRegistry(baseDir, manifest);
  const stats = summarizeRegistry(taskMap);
  const activeConfig = readActiveSequenceConfig(baseDir);
  const sequenceIds = buildExecutionSequence(activeConfig);
  const continuity = resolveContinuity(taskMap, sequenceIds);`,
  'lectura de la secuencia activa'
);

next = replaceRequired(
  next,
  /const nextHeader = updateHeader\(currentHeader,\s*manifest,\s*taskMap,\s*stats,\s*continuity\);/,
  'const nextHeader = updateHeader(currentHeader, manifest, taskMap, stats, continuity, activeConfig);',
  'llamada a updateHeader'
);

next = next.replace(
  /return \{\s*changed:\s*headerChanged \|\| registryChanged,\s*stats,\s*taskMap,\s*\.\.\.continuity\s*\};/,
  'return { changed: headerChanged || registryChanged, stats, taskMap, activeConfig, ...continuity };'
);

const configText = JSON.stringify(activeConfig, null, 2) + '\n';

console.log('CAMBIO: scripts/docs/plan-continuity-global.mjs');
console.log('NUEVO: docs/plan-canonico/modular/active-sequence.json');
console.log('TRANSICIÓN: AUTH-CTX-030 → OPS-AUD-001 → OPS-AUD-002');
console.log('SECUENCIA E1: 89 tareas');

if (!apply) {
  console.log('');
  console.log('DRY-RUN OK. Para aplicar:');
  console.log('node scripts/docs/transition-auth-to-e1.mjs --apply');
  process.exit(0);
}

try {
  fs.writeFileSync(continuityPath, next, 'utf8');
  fs.writeFileSync(configPath, configText, 'utf8');

  runNode(['--check', 'scripts/docs/plan-continuity-global.mjs']);
  runNode(['scripts/docs/build-plan-canonico.mjs']);
  runNode(['scripts/docs/build-plan-canonico.mjs', '--check']);

  const header = fs.readFileSync(headerPath, 'utf8');

  for (const expected of [
    'AUTH-CTX-030 — Definir plan de pruebas contractuales del contexto y la decisión',
    'OPS-AUD-001 — Inventariar todas las empresas, sedes, áreas, canales y puntos operativos',
    'OPS-AUD-002 — Identificar familias de actores y responsables reales por proceso',
    'BLOQUE E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación',
  ]) {
    if (!header.includes(expected)) {
      fail(`la cabecera final no contiene: ${expected}.`);
    }
  }

  console.log('');
  console.log('OK: transición canónica a BLOQUE E1 aplicada y verificada.');
  console.log('Última aprobada: AUTH-CTX-030');
  console.log('Actual: OPS-AUD-001');
  console.log('Siguiente: OPS-AUD-002');
} catch (error) {
  restore(continuityPath, originalContinuity);
  restore(configPath, originalConfig);
  restore(headerPath, originalHeader);
  restore(registryPath, originalRegistry);
  restore(compiledPath, originalCompiled);

  console.error('');
  console.error('ERROR: se revirtieron todos los cambios realizados por este script.');
  console.error(error instanceof Error ? error.message : String(error));
  process.exit(1);
}
