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
  eImplementation: path.join(
    BASE,
    'bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md'
  ),
};

const TASKS = [
  '### [ ] AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura',
  '### [ ] AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras',
  '### [ ] AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización',
];

const TASK_IDS = ['AUTH-DB-033', 'AUTH-DB-034', 'AUTH-DB-032'];
const R1_ANCHOR = '### [ ] AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales';
const R1_NEXT = '### [ ] AUTH-DB-012 — Implementar auditoría de cambios de permisos';

const ORDER_START = '<!-- AUTH-DB-032-034:START -->';
const ORDER_END = '<!-- AUTH-DB-032-034:END -->';
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

- \`AUTH-DB-033\` no puede ejecutarse antes de aprobar la arquitectura de esquemas, helpers, \`SECURITY DEFINER\`, grants y RLS;
- \`AUTH-DB-034\` depende del resolver canónico implementado por \`AUTH-DB-033\`;
- \`AUTH-DB-032\` integra la persistencia durable después de disponer de decisiones canónicas;
- \`AUTH-DB-006\` a \`AUTH-DB-010\` adoptan el resolver y el evaluador en RPC sensibles;
- ninguna función boolean legacy podrá retirarse antes de la compatibilidad, pruebas y certificación correspondientes.
${ORDER_END}`;

const PROTOCOL_START = '<!-- TASK-MATERIALIZATION-RULE:START -->';
const PROTOCOL_END = '<!-- TASK-MATERIALIZATION-RULE:END -->';
const PROTOCOL_BLOCK = `${PROTOCOL_START}
## Regla canónica de materialización inmediata de tareas nuevas

Cuando una tarea aprobada detecte una brecha y cree un identificador nuevo, la nueva tarea deberá quedar físicamente registrada antes de avanzar a la tarea siguiente.

La materialización obligatoria incluye:

1. insertar el encabezado con marcador en el bloque lógico propietario;
2. registrar su dependencia en el orden de implementación cuando afecte secuencia o puertas;
3. comprobar que el identificador aparece exactamente una vez en el plan modular;
4. ejecutar el compilador y el verificador;
5. conservar en la respuesta de aprobación una orden final explícita con archivo, ancla y acción pendiente cuando la materialización no haya sido automatizada.

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

function detectEol(text) {
  return text.includes('\r\n') ? '\r\n' : '\n';
}

function normalize(text) {
  return text.replace(/\r\n?/g, '\n');
}

function restore(text, eol) {
  const normalized = `${normalize(text).replace(/\n+$/u, '')}\n`;
  return eol === '\n' ? normalized : normalized.replace(/\n/g, '\r\n');
}

function replaceManagedBlock(text, startMarker, endMarker, block, anchor) {
  const normalized = normalize(text);
  const start = normalized.indexOf(startMarker);
  const end = normalized.indexOf(endMarker);

  if ((start >= 0) !== (end >= 0)) {
    fail(`Bloque administrado incompleto: ${startMarker}`);
  }

  if (start >= 0 && end >= 0) {
    if (end < start) fail(`Bloque administrado invertido: ${startMarker}`);
    const afterEnd = end + endMarker.length;
    return `${normalized.slice(0, start).trimEnd()}\n\n${block}\n\n${normalized.slice(afterEnd).trimStart()}`;
  }

  const anchorIndex = normalized.indexOf(anchor);
  if (anchorIndex < 0) fail(`No se encontró el ancla: ${anchor}`);
  return `${normalized.slice(0, anchorIndex).trimEnd()}\n\n${block}\n\n${normalized.slice(anchorIndex).trimStart()}`;
}

function normalizeR1(text) {
  let normalized = normalize(text);

  for (const id of TASK_IDS) {
    const taskLine = new RegExp(`^###\\s+(?:\\[[ x~]\\]|[✅🟡❌])\\s+${id}\\b.*(?:\\n|$)`, 'gmu');
    normalized = normalized.replace(taskLine, '');
  }

  if (!normalized.includes(R1_ANCHOR)) fail(`No se encontró el ancla R1: ${R1_ANCHOR}`);
  if (!normalized.includes(R1_NEXT)) fail(`No se encontró la tarea posterior R1: ${R1_NEXT}`);

  const anchorIndex = normalized.indexOf(R1_ANCHOR);
  const nextIndex = normalized.indexOf(R1_NEXT);
  if (nextIndex < anchorIndex) fail('AUTH-DB-012 aparece antes de AUTH-DB-019.');

  const insertionPoint = anchorIndex + R1_ANCHOR.length;
  const taskBlock = TASKS.join('\n');
  return `${normalized.slice(0, insertionPoint).trimEnd()}\n${taskBlock ? `\n${taskBlock}` : ''}\n\n${normalized.slice(insertionPoint).trimStart()}`;
}

function validateDocumentarySources(text) {
  for (const id of TASK_IDS) {
    if (!text.includes(id)) {
      fail(`La tarea ${id} no está justificada en 05_IMPLEMENTACION_Y_TRANSICION.md.`);
    }
  }

  const requiredApproved = ['### ✅ AUTH-CTX-024', '### ✅ AUTH-CTX-025', '### ✅ AUTH-CTX-026'];
  for (const heading of requiredApproved) {
    if (!text.includes(heading)) {
      fail(`La fuente documental todavía no contiene la aprobación requerida: ${heading}`);
    }
  }
}

function collectTaskOccurrences(manifest, overrides) {
  const taskRegex = /^###\s+(?:\[[ x~]\]|[✅🟡❌])\s+([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b/gmu;
  const occurrences = new Map();

  for (const relativePath of manifest.files) {
    const filePath = path.join(BASE, relativePath);
    const content = overrides.has(filePath) ? overrides.get(filePath) : read(filePath);
    for (const match of normalize(content).matchAll(taskRegex)) {
      const id = match[1];
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
    fail(
      `El plan contiene identificadores duplicados: ${duplicates
        .map(([id, files]) => `${id} (${files.join(', ')})`)
        .join('; ')}`
    );
  }

  for (const id of TASK_IDS) {
    const files = occurrences.get(id) ?? [];
    if (files.length !== 1 || files[0] !== 'bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md') {
      fail(`${id} debe existir exactamente una vez dentro de R1.`);
    }
  }
}

function showChange(label, before, after) {
  const changed = before !== after;
  console.log(`${changed ? 'CAMBIO' : 'OK'}: ${label}`);
  return changed;
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
  Object.values(PATHS).forEach(requireFile);

  const manifest = JSON.parse(read(PATHS.manifest));
  if (!Array.isArray(manifest.files) || manifest.files.length === 0) {
    fail('manifest.json no contiene files[].');
  }

  const sourceText = normalize(read(PATHS.eImplementation));
  validateDocumentarySources(sourceText);

  const originals = new Map([
    [PATHS.r1, read(PATHS.r1)],
    [PATHS.order, read(PATHS.order)],
    [PATHS.protocol, read(PATHS.protocol)],
  ]);

  const next = new Map();

  const r1Original = originals.get(PATHS.r1);
  const r1Next = restore(normalizeR1(r1Original), detectEol(r1Original));
  next.set(PATHS.r1, r1Next);

  const orderOriginal = originals.get(PATHS.order);
  const orderNextNormalized = replaceManagedBlock(
    orderOriginal,
    ORDER_START,
    ORDER_END,
    ORDER_BLOCK,
    'FASE 4 — HABILITADORES TRANSVERSALES'
  );
  const orderNext = restore(orderNextNormalized, detectEol(orderOriginal));
  next.set(PATHS.order, orderNext);

  const protocolOriginal = originals.get(PATHS.protocol);
  const protocolNextNormalized = replaceManagedBlock(
    protocolOriginal,
    PROTOCOL_START,
    PROTOCOL_END,
    PROTOCOL_BLOCK,
    '## Regla canónica de granularidad documental'
  );
  const protocolNext = restore(protocolNextNormalized, detectEol(protocolOriginal));
  next.set(PATHS.protocol, protocolNext);

  const occurrences = collectTaskOccurrences(manifest, next);
  validateInventory(occurrences);

  const changedFiles = [];
  for (const [filePath, after] of next) {
    const before = originals.get(filePath);
    if (showChange(path.relative(ROOT, filePath), before, after)) {
      changedFiles.push(filePath);
    }
  }

  console.log(`OK: ${TASK_IDS.join(', ')} existen exactamente una vez y en el bloque R1.`);

  if (!APPLY) {
    console.log('\nDRY RUN completado. No se escribieron archivos.');
    console.log('Ejecuta con --apply para aplicar, compilar y verificar.');
    return;
  }

  for (const filePath of changedFiles) {
    fs.writeFileSync(filePath, next.get(filePath), 'utf8');
  }

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
