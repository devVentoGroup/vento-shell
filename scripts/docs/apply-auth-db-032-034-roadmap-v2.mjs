import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const ROOT = process.cwd();
const BASE = path.resolve(ROOT, 'docs/plan-canonico/modular');
const APPLY = process.argv.includes('--apply');

const PATHS = {
  manifest: path.join(BASE, 'manifest.json'),
  r1: path.join(BASE, 'bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md'),
  order: path.join(BASE, '90_ORDEN_DE_IMPLEMENTACION.md'),
  protocol: path.join(BASE, '01_PROTOCOLO.md'),
};

const MATERIALIZED_TASKS = [
  {
    id: 'AUTH-DB-033',
    heading: '### [ ] AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura',
    sourceTaskId: 'AUTH-CTX-025',
  },
  {
    id: 'AUTH-DB-034',
    heading: '### [ ] AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras',
    sourceTaskId: 'AUTH-CTX-026',
  },
  {
    id: 'AUTH-DB-032',
    heading: '### [ ] AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización',
    sourceTaskId: 'AUTH-CTX-024',
  },
];

const TASK_IDS = MATERIALIZED_TASKS.map((task) => task.id);
const R1_RELATIVE_PATH = 'bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md';
const R1_ANCHOR = '### [ ] AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales';
const R1_NEXT = '### [ ] AUTH-DB-012 — Implementar auditoría de cambios de permisos';

const TASK_HEADING_REGEX = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b[^\n]*$/gmu;
const ORDER_START = '<!-- AUTH-DB-032-034:START -->';
const ORDER_END = '<!-- AUTH-DB-032-034:END -->';
const PROTOCOL_START = '<!-- TASK-MATERIALIZATION-RULE:START -->';
const PROTOCOL_END = '<!-- TASK-MATERIALIZATION-RULE:END -->';

const ORDER_BLOCK = `${ORDER_START}
### Secuencia contractual obligatoria de autorización dentro de R1

\`\`\`text
AUTH-DB-019
        ↓
AUTH-DB-033
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
AUTH-DB-006 a AUTH-DB-010
\`\`\`

\`AUTH-DB-027\` deberá acompañar cada paquete como harness obligatorio.

Reglas:

- \`AUTH-DB-033\` requiere la arquitectura aprobada de esquemas, helpers, \`SECURITY DEFINER\`, grants y RLS;
- \`AUTH-DB-034\` depende del resolver canónico implementado por \`AUTH-DB-033\`;
- \`AUTH-DB-032\` integra persistencia durable después de disponer de decisiones canónicas;
- \`AUTH-DB-006\` a \`AUTH-DB-010\` adoptan el resolver y el evaluador en RPC sensibles;
- las funciones boolean legacy solo se retiran después de compatibilidad, pruebas y certificación.
${ORDER_END}`;

const PROTOCOL_BLOCK = `${PROTOCOL_START}
## Regla canónica de materialización inmediata de tareas nuevas

Cuando una tarea aprobada detecte una brecha y cree un identificador nuevo, la nueva tarea deberá quedar físicamente registrada antes de avanzar a la tarea siguiente.

La materialización obligatoria incluye:

1. insertar el encabezado con marcador en el bloque lógico propietario;
2. registrar su dependencia en el orden de implementación cuando afecte secuencia o puertas;
3. comprobar que el identificador aparece exactamente una vez en el plan modular;
4. ejecutar el compilador y el verificador;
5. cerrar la respuesta de aprobación con una orden explícita cuando quede una acción manual pendiente.

Una mención narrativa dentro de otra tarea no equivale a crear la tarea nueva.
${PROTOCOL_END}`;

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

function restore(text, eol) {
  const normalized = `${normalize(text).replace(/\n+$/u, '')}\n`;
  return eol === '\n' ? normalized : normalized.replace(/\n/g, '\r\n');
}

function maskFencedCode(text) {
  let insideFence = false;
  return normalize(text)
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

function stateFromMarker(marker) {
  if (marker === '✅' || marker === '[x]') return 'APROBADA';
  if (marker === '🟡' || marker === '[~]') return 'PROPUESTA';
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '❌') return 'RECHAZADA';
  return 'DESCONOCIDA';
}

function scanTaskSections(manifest) {
  const taskMap = new Map();

  for (const relativePath of manifest.files) {
    const filePath = path.join(BASE, relativePath);
    const original = normalize(read(filePath));
    const masked = maskFencedCode(original);
    const matches = [...masked.matchAll(TASK_HEADING_REGEX)];

    for (let index = 0; index < matches.length; index += 1) {
      const match = matches[index];
      const id = match.groups?.id;
      if (!id) continue;

      const start = match.index;
      const end = index + 1 < matches.length ? matches[index + 1].index : original.length;
      const entries = taskMap.get(id) ?? [];
      entries.push({
        id,
        marker: match.groups?.marker ?? '',
        state: stateFromMarker(match.groups?.marker ?? ''),
        relativePath,
        heading: original.slice(start, original.indexOf('\n', start) < 0 ? original.length : original.indexOf('\n', start)).trim(),
        section: original.slice(start, end),
      });
      taskMap.set(id, entries);
    }
  }

  return taskMap;
}

function validateSourceTasks(taskMap) {
  for (const requirement of MATERIALIZED_TASKS) {
    const entries = taskMap.get(requirement.sourceTaskId) ?? [];
    if (entries.length !== 1) {
      fail(`${requirement.sourceTaskId} debe existir exactamente una vez; se encontraron ${entries.length}.`);
    }

    const source = entries[0];
    if (source.state !== 'APROBADA') {
      fail(`${requirement.sourceTaskId} está en ${source.relativePath}, pero su marcador indica ${source.state}: ${source.heading}`);
    }

    if (!source.section.includes(requirement.id)) {
      fail(`${requirement.sourceTaskId} está aprobada en ${source.relativePath}, pero su bloque no justifica ${requirement.id}.`);
    }

    console.log(`OK: ${requirement.sourceTaskId} aprobada en ${source.relativePath} y vinculada a ${requirement.id}.`);
  }
}

function normalizeR1(text) {
  let normalized = normalize(text);

  for (const id of TASK_IDS) {
    const regex = new RegExp(`^###\\s+(?:\\[[ x~]\\]|[✅🟡❌])\\s+${id}\\b[^\\n]*(?:\\n|$)`, 'gmu');
    normalized = normalized.replace(regex, '');
  }

  const anchorIndex = normalized.indexOf(R1_ANCHOR);
  const nextIndex = normalized.indexOf(R1_NEXT);
  if (anchorIndex < 0) fail(`No se encontró el ancla R1: ${R1_ANCHOR}`);
  if (nextIndex < 0) fail(`No se encontró la tarea posterior R1: ${R1_NEXT}`);
  if (nextIndex < anchorIndex) fail('AUTH-DB-012 aparece antes de AUTH-DB-019.');

  const insertionPoint = anchorIndex + R1_ANCHOR.length;
  const block = MATERIALIZED_TASKS.map((task) => task.heading).join('\n');
  return `${normalized.slice(0, insertionPoint).trimEnd()}\n${block ? `\n${block}` : ''}\n\n${normalized.slice(insertionPoint).trimStart()}`;
}

function replaceManagedBlock(text, startMarker, endMarker, block, anchor) {
  const normalized = normalize(text);
  const start = normalized.indexOf(startMarker);
  const end = normalized.indexOf(endMarker);

  if ((start >= 0) !== (end >= 0)) fail(`Bloque administrado incompleto: ${startMarker}`);

  if (start >= 0) {
    if (end < start) fail(`Bloque administrado invertido: ${startMarker}`);
    return `${normalized.slice(0, start).trimEnd()}\n\n${block}\n\n${normalized.slice(end + endMarker.length).trimStart()}`;
  }

  const anchorIndex = normalized.indexOf(anchor);
  if (anchorIndex < 0) fail(`No se encontró el ancla: ${anchor}`);
  return `${normalized.slice(0, anchorIndex).trimEnd()}\n\n${block}\n\n${normalized.slice(anchorIndex).trimStart()}`;
}

function collectOccurrences(manifest, overrides) {
  const occurrences = new Map();

  for (const relativePath of manifest.files) {
    const filePath = path.join(BASE, relativePath);
    const content = overrides.has(filePath) ? overrides.get(filePath) : read(filePath);
    for (const match of maskFencedCode(content).matchAll(TASK_HEADING_REGEX)) {
      const id = match.groups?.id;
      if (!id) continue;
      const files = occurrences.get(id) ?? [];
      files.push(relativePath);
      occurrences.set(id, files);
    }
  }

  return occurrences;
}

function validateInventory(occurrences) {
  const duplicates = [...occurrences.entries()].filter(([, files]) => files.length !== 1);
  if (duplicates.length) {
    fail(`Identificadores duplicados: ${duplicates.map(([id, files]) => `${id} (${files.join(', ')})`).join('; ')}`);
  }

  for (const id of TASK_IDS) {
    const files = occurrences.get(id) ?? [];
    if (files.length !== 1 || files[0] !== R1_RELATIVE_PATH) {
      fail(`${id} debe existir exactamente una vez dentro de ${R1_RELATIVE_PATH}.`);
    }
  }
}

function run(command, args) {
  const result = spawnSync(command, args, { cwd: ROOT, stdio: 'inherit', shell: false });
  if (result.status !== 0) fail(`${command} ${args.join(' ')} terminó con código ${result.status}.`);
}

function main() {
  Object.values(PATHS).forEach(requireFile);

  const manifest = JSON.parse(read(PATHS.manifest));
  if (!Array.isArray(manifest.files) || manifest.files.length === 0) fail('manifest.json no contiene files[].');

  const sourceTasks = scanTaskSections(manifest);
  validateSourceTasks(sourceTasks);

  const originals = new Map([
    [PATHS.r1, read(PATHS.r1)],
    [PATHS.order, read(PATHS.order)],
    [PATHS.protocol, read(PATHS.protocol)],
  ]);

  const next = new Map();

  const r1Original = originals.get(PATHS.r1);
  next.set(PATHS.r1, restore(normalizeR1(r1Original), detectEol(r1Original)));

  const orderOriginal = originals.get(PATHS.order);
  next.set(
    PATHS.order,
    restore(
      replaceManagedBlock(orderOriginal, ORDER_START, ORDER_END, ORDER_BLOCK, 'FASE 4 — HABILITADORES TRANSVERSALES'),
      detectEol(orderOriginal)
    )
  );

  const protocolOriginal = originals.get(PATHS.protocol);
  next.set(
    PATHS.protocol,
    restore(
      replaceManagedBlock(protocolOriginal, PROTOCOL_START, PROTOCOL_END, PROTOCOL_BLOCK, '## Regla canónica de granularidad documental'),
      detectEol(protocolOriginal)
    )
  );

  validateInventory(collectOccurrences(manifest, next));

  const changedFiles = [];
  for (const [filePath, after] of next) {
    const before = originals.get(filePath);
    const changed = before !== after;
    console.log(`${changed ? 'CAMBIO' : 'OK'}: ${path.relative(ROOT, filePath)}`);
    if (changed) changedFiles.push(filePath);
  }

  console.log(`OK: ${TASK_IDS.join(', ')} existen exactamente una vez y en R1.`);

  if (!APPLY) {
    console.log('\nDRY RUN completado. No se escribieron archivos.');
    console.log('Ejecuta el mismo script con --apply para aplicar, compilar y verificar.');
    return;
  }

  for (const filePath of changedFiles) fs.writeFileSync(filePath, next.get(filePath), 'utf8');

  console.log('\n[1/2] Compilando plan canónico...');
  run(process.execPath, ['scripts/docs/build-plan-canonico.mjs']);

  console.log('\n[2/2] Verificando plan canónico...');
  run(process.execPath, ['scripts/docs/build-plan-canonico.mjs', '--check']);

  console.log('\nOK: tareas AUTH-DB-032 a AUTH-DB-034 registradas, ordenadas y verificadas.');
}

try {
  main();
} catch (error) {
  console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
}
