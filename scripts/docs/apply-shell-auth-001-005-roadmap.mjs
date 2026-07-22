import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const ROOT = process.cwd();
const BASE = path.resolve(ROOT, 'docs/plan-canonico/modular');
const APPLY = process.argv.includes('--apply');

const PATHS = {
  manifest: path.join(BASE, 'manifest.json'),
  order: path.join(BASE, '90_ORDEN_DE_IMPLEMENTACION.md'),
  target: path.join(
    BASE,
    'bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_COMPARTIDA.md',
  ),
};

const TARGET_RELATIVE =
  'bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_COMPARTIDA.md';
const MANIFEST_ANCHOR =
  'bloques/H_FUNDACION_COMPARTIDA/02_NORMALIZACION_COMPARTIDA_DE_DATOS.md';

const TASKS = [
  {
    id: 'SHELL-AUTH-001',
    heading:
      '### [ ] SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización',
  },
  {
    id: 'SHELL-AUTH-002',
    heading:
      '### [ ] SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras',
  },
  {
    id: 'SHELL-AUTH-003',
    heading:
      '### [ ] SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores',
  },
  {
    id: 'SHELL-AUTH-004',
    heading:
      '### [ ] SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy',
  },
  {
    id: 'SHELL-AUTH-005',
    heading:
      '### [ ] SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios',
  },
];

const TASK_IDS = TASKS.map((task) => task.id);
const TASK_HEADING_REGEX =
  /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b[^\n]*$/gmu;

const FILE_START = '<!-- SHELL-AUTH-001-005:START -->';
const FILE_END = '<!-- SHELL-AUTH-001-005:END -->';
const ORDER_START = '<!-- SHELL-AUTH-001-005-ORDER:START -->';
const ORDER_END = '<!-- SHELL-AUTH-001-005-ORDER:END -->';

const FILE_BLOCK = `${FILE_START}
## AUTORIZACIÓN COMPARTIDA Y CONSUMO CENTRALIZADO

Estas tareas materializan el consumo centralizado definido por
\`AUTH-CTX-027\`. La fuente normativa permanece en los contratos del BLOQUE E;
BLOQUE H implementará el SDK, los adapters, las proyecciones, los controles de
deriva y la migración multi-repositorio.

${TASKS.map((task) => task.heading).join('\n')}

### Dependencias internas

\`\`\`text
SHELL-AUTH-001
        ↓
SHELL-AUTH-002
        ↓
SHELL-AUTH-003
        ↓
SHELL-AUTH-004
        ↓
SHELL-AUTH-005
\`\`\`

Reglas:

- \`SHELL-AUTH-001\` consolida el SDK sin adoptar todavía consumidores;
- \`SHELL-AUTH-002\` crea fronteras separadas para servidor, navegador, pruebas y compatibilidad;
- \`SHELL-AUTH-003\` impide contexto global mutable y registra cada consumidor;
- \`SHELL-AUTH-004\` convierte llamadas legacy, permisos manuales y lógica local en fallos verificables;
- \`SHELL-AUTH-005\` migra aplicaciones únicamente después de disponer del resolver y evaluador canónicos;
- ninguna aplicación podrá retirar su protección legacy antes de demostrar equivalencia y rollback.
${FILE_END}`;

const ORDER_BLOCK = `${ORDER_START}
### Secuencia de fundación compartida para autorización

\`\`\`text
SHELL-AUD-001 a SHELL-AUD-010
        ↓
SHELL-PKG-001 a SHELL-PKG-008
+
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001 a SHELL-AUTH-004
\`\`\`

La migración efectiva requiere además la rama física:

\`\`\`text
AUTH-DB-033
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
\`\`\`

Convergencia obligatoria:

\`\`\`text
SHELL-AUTH-001 a SHELL-AUTH-004
+
AUTH-DB-033 a AUTH-DB-034
+
pruebas AUTH-DB-027
        ↓
SHELL-AUTH-005
        ↓
adopción progresiva por aplicación
\`\`\`

\`SHELL-AUTH-005\` no podrá declararse completada mientras existan consumidores
directos de \`has_permission\`, \`has_operational_permission\`,
\`has_effective_permission_v1\`, \`get_operational_context\` o
\`get_effective_context_v1\` fuera de adapters de compatibilidad registrados.
${ORDER_END}`;

function fail(message) {
  throw new Error(message);
}

function requireFile(filePath) {
  if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) {
    fail(`No existe el archivo requerido: ${path.relative(ROOT, filePath)}`);
  }
}

function read(filePath) {
  requireFile(filePath);
  return fs.readFileSync(filePath, 'utf8');
}

function normalize(text) {
  return text.replace(/\r\n?/g, '\n');
}

function detectEol(text) {
  return text.includes('\r\n') ? '\r\n' : '\n';
}

function restore(text, eol = '\n') {
  const normalized = `${normalize(text).replace(/\n+$/u, '')}\n`;
  return eol === '\n' ? normalized : normalized.replace(/\n/g, '\r\n');
}

function maskFencedCode(text) {
  let insideFence = false;

  return normalize(text)
    .split('\n')
    .map((line) => {
      const maskedLine = ' '.repeat(line.length);
      if (/^\s*```/.test(line)) {
        insideFence = !insideFence;
        return maskedLine;
      }
      return insideFence ? maskedLine : line;
    })
    .join('\n');
}

function stateFromMarker(marker) {
  if (marker === '✅' || marker === '[x]') return 'APROBADA';
  if (marker === '🟡' || marker === '[~]') return 'PROPUESTA';
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '❌') return 'RECHAZADA';
  return 'DESCONOCIDA';
}

function scanTaskSections(manifest, overrides = new Map()) {
  const taskMap = new Map();

  for (const relativePath of manifest.files) {
    const filePath = path.join(BASE, relativePath);
    const original = normalize(
      overrides.has(filePath) ? overrides.get(filePath) : read(filePath),
    );
    const matches = [...maskFencedCode(original).matchAll(TASK_HEADING_REGEX)];

    for (let index = 0; index < matches.length; index += 1) {
      const match = matches[index];
      const id = match.groups?.id;
      if (!id) continue;

      const start = match.index;
      const lineEnd = original.indexOf('\n', start);
      const end =
        index + 1 < matches.length ? matches[index + 1].index : original.length;
      const entries = taskMap.get(id) ?? [];

      entries.push({
        id,
        marker: match.groups?.marker ?? '',
        state: stateFromMarker(match.groups?.marker ?? ''),
        relativePath,
        heading: original
          .slice(start, lineEnd < 0 ? original.length : lineEnd)
          .trim(),
        section: original.slice(start, end),
      });
      taskMap.set(id, entries);
    }
  }

  return taskMap;
}

function validateApprovedSource(manifest) {
  const taskMap = scanTaskSections(manifest);
  const entries = taskMap.get('AUTH-CTX-027') ?? [];

  if (entries.length !== 1) {
    fail(`AUTH-CTX-027 debe existir exactamente una vez; se encontraron ${entries.length}.`);
  }

  const source = entries[0];
  if (source.state !== 'APROBADA') {
    fail(
      `AUTH-CTX-027 está en ${source.relativePath}, pero su marcador indica ${source.state}: ${source.heading}`,
    );
  }

  const missing = TASK_IDS.filter((id) => !source.section.includes(id));
  if (missing.length) {
    fail(
      `AUTH-CTX-027 está aprobada, pero su bloque no justifica: ${missing.join(', ')}.`,
    );
  }

  console.log(
    `OK: AUTH-CTX-027 aprobada en ${source.relativePath} y vinculada a ${TASK_IDS.join(', ')}.`,
  );
}

function replaceManagedBlock(text, startMarker, endMarker, block, anchor) {
  const normalized = normalize(text);
  const start = normalized.indexOf(startMarker);
  const end = normalized.indexOf(endMarker);

  if ((start >= 0) !== (end >= 0)) {
    fail(`Bloque administrado incompleto: ${startMarker}`);
  }

  if (start >= 0) {
    if (end < start) fail(`Bloque administrado invertido: ${startMarker}`);
    return `${normalized.slice(0, start).trimEnd()}\n\n${block}\n\n${normalized
      .slice(end + endMarker.length)
      .trimStart()}`;
  }

  const anchorIndex = normalized.indexOf(anchor);
  if (anchorIndex < 0) fail(`No se encontró el ancla: ${anchor}`);
  return `${normalized.slice(0, anchorIndex).trimEnd()}\n\n${block}\n\n${normalized
    .slice(anchorIndex)
    .trimStart()}`;
}

function buildTargetFile() {
  if (!fs.existsSync(PATHS.target)) return restore(FILE_BLOCK);

  const original = read(PATHS.target);
  const eol = detectEol(original);
  const normalized = normalize(original);

  if (normalized.includes(FILE_START) || normalized.includes(FILE_END)) {
    return restore(
      replaceManagedBlock(normalized, FILE_START, FILE_END, FILE_BLOCK, '## '),
      eol,
    );
  }

  const existingTask = TASK_IDS.find((id) => normalized.includes(id));
  if (existingTask) {
    fail(
      `${TARGET_RELATIVE} contiene ${existingTask} fuera del bloque administrado; revísalo antes de aplicar.`,
    );
  }

  return restore(`${normalized.trimEnd()}\n\n${FILE_BLOCK}`, eol);
}

function updateManifest(manifest) {
  const files = manifest.files.filter((item) => item !== TARGET_RELATIVE);
  const anchorIndex = files.indexOf(MANIFEST_ANCHOR);
  if (anchorIndex < 0) {
    fail(`manifest.json no contiene el ancla ${MANIFEST_ANCHOR}.`);
  }
  files.splice(anchorIndex + 1, 0, TARGET_RELATIVE);
  return { ...manifest, files };
}

function validateInventory(taskMap) {
  const duplicates = [...taskMap.entries()].filter(([, entries]) => entries.length !== 1);
  if (duplicates.length) {
    fail(
      `Identificadores duplicados: ${duplicates
        .map(
          ([id, entries]) =>
            `${id} (${entries.map((entry) => entry.relativePath).join(', ')})`,
        )
        .join('; ')}`,
    );
  }

  for (const id of TASK_IDS) {
    const entries = taskMap.get(id) ?? [];
    if (entries.length !== 1 || entries[0].relativePath !== TARGET_RELATIVE) {
      fail(`${id} debe existir exactamente una vez dentro de ${TARGET_RELATIVE}.`);
    }
  }
}

function run(command, args) {
  const result = spawnSync(command, args, {
    cwd: ROOT,
    stdio: 'inherit',
    shell: false,
  });
  if (result.status !== 0) {
    fail(`${command} ${args.join(' ')} terminó con código ${result.status}.`);
  }
}

function main() {
  requireFile(PATHS.manifest);
  requireFile(PATHS.order);

  const manifestOriginal = JSON.parse(read(PATHS.manifest));
  if (!Array.isArray(manifestOriginal.files) || manifestOriginal.files.length === 0) {
    fail('manifest.json no contiene files[].');
  }

  validateApprovedSource(manifestOriginal);

  const targetNext = buildTargetFile();
  const manifestNext = updateManifest(manifestOriginal);

  const orderOriginal = read(PATHS.order);
  const orderNext = restore(
    replaceManagedBlock(
      orderOriginal,
      ORDER_START,
      ORDER_END,
      ORDER_BLOCK,
      '21. Ejecutar AUTH-UI-030 a AUTH-UI-039',
    ),
    detectEol(orderOriginal),
  );

  const manifestTextNext = `${JSON.stringify(manifestNext, null, 2)}\n`;
  const overrides = new Map([
    [PATHS.target, targetNext],
    [PATHS.order, orderNext],
  ]);

  validateInventory(scanTaskSections(manifestNext, overrides));

  const changes = [
    {
      label: TARGET_RELATIVE,
      before: fs.existsSync(PATHS.target) ? read(PATHS.target) : null,
      after: targetNext,
    },
    {
      label: 'manifest.json',
      before: read(PATHS.manifest),
      after: manifestTextNext,
    },
    {
      label: '90_ORDEN_DE_IMPLEMENTACION.md',
      before: orderOriginal,
      after: orderNext,
    },
  ];

  for (const change of changes) {
    console.log(`${change.before === change.after ? 'OK' : 'CAMBIO'}: ${change.label}`);
  }

  console.log(`OK: ${TASK_IDS.join(', ')} existirán exactamente una vez en BLOQUE H.`);

  if (!APPLY) {
    console.log('\nDRY RUN completado. No se escribieron archivos.');
    console.log('Ejecuta el mismo script con --apply para aplicar, compilar y verificar.');
    return;
  }

  fs.mkdirSync(path.dirname(PATHS.target), { recursive: true });
  fs.writeFileSync(PATHS.target, targetNext, 'utf8');
  fs.writeFileSync(PATHS.manifest, manifestTextNext, 'utf8');
  fs.writeFileSync(PATHS.order, orderNext, 'utf8');

  console.log('\n[1/2] Compilando plan canónico...');
  run(process.execPath, ['scripts/docs/build-plan-canonico.mjs']);

  console.log('\n[2/2] Verificando plan canónico...');
  run(process.execPath, ['scripts/docs/build-plan-canonico.mjs', '--check']);

  console.log('\nOK: SHELL-AUTH-001 a SHELL-AUTH-005 materializadas y verificadas.');
}

try {
  main();
} catch (error) {
  console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
}
