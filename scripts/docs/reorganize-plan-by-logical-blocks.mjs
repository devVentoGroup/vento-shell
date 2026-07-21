import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

const ROOT = process.cwd();
const BASE_DIR = path.resolve(ROOT, 'docs/plan-canonico/modular');
const MANIFEST_PATH = path.join(BASE_DIR, 'manifest.json');
const APPLY = process.argv.includes('--apply');

const TASK_REGEX = /^###\s+(?:\[[ x~]\]|[✅🟡❌])\s+([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b/gmu;
const LOGICAL_SECTION_REGEX = /^###\s+(?!\[[ x~]\]|[✅🟡❌])(.+?)\s*$/gmu;

const E_GROUPS = [
  {
    prefix: 'bloques/E_CONTEXTO_Y_DECISION/01_CONTRATOS_BASE/',
    target: 'bloques/E_CONTEXTO_Y_DECISION/01_CONTRATOS_BASE.md',
    heading: '## CONTRATOS BASE',
  },
  {
    prefix: 'bloques/E_CONTEXTO_Y_DECISION/02_IDENTIDAD_Y_ACTOR/',
    target: 'bloques/E_CONTEXTO_Y_DECISION/02_IDENTIDAD_Y_ACTOR.md',
    heading: '## IDENTIDAD Y ACTOR',
  },
  {
    prefix: 'bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO/',
    target: 'bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md',
    heading: '## CONTEXTO LABORAL Y DISPOSITIVO',
  },
  {
    prefix: 'bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION/',
    target: 'bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md',
    heading: '## DECISIÓN DE AUTORIZACIÓN',
  },
  {
    prefix: 'bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION/',
    target: 'bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md',
    heading: '## DISEÑO DE IMPLEMENTACIÓN Y TRANSICIÓN',
  },
];

function fail(message) {
  throw new Error(message);
}

function normalize(text) {
  return text.replace(/\r\n?/g, '\n');
}

function finalNewline(text) {
  return `${normalize(text).replace(/\n+$/u, '')}\n`;
}

function read(relativePath) {
  const fullPath = path.join(BASE_DIR, relativePath);
  if (!fs.existsSync(fullPath)) fail(`No existe ${relativePath}.`);
  return normalize(fs.readFileSync(fullPath, 'utf8'));
}

function write(relativePath, content, stagedWrites) {
  stagedWrites.set(relativePath, finalNewline(content));
}

function slugify(value) {
  const normalized = value
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toUpperCase()
    .replace(/`/g, '')
    .replace(/[^A-Z0-9]+/g, '_')
    .replace(/^_+|_+$/g, '');
  return normalized || 'SECCION';
}

function extractTasks(text) {
  return [...normalize(text).matchAll(TASK_REGEX)].map((match) => match[1]);
}

function taskInventory(files, stagedWrites = new Map()) {
  const occurrences = new Map();

  for (const relativePath of files) {
    const content = stagedWrites.has(relativePath)
      ? stagedWrites.get(relativePath)
      : read(relativePath);

    for (const id of extractTasks(content)) {
      const locations = occurrences.get(id) ?? [];
      locations.push(relativePath);
      occurrences.set(id, locations);
    }
  }

  return occurrences;
}

function assertNoDuplicates(inventory, label) {
  const duplicates = [...inventory.entries()].filter(([, locations]) => locations.length > 1);
  if (duplicates.length) {
    fail(`${label}: tareas duplicadas: ${duplicates.map(([id, locations]) => `${id} (${locations.join(', ')})`).join('; ')}`);
  }
}

function assertSameTasks(before, after) {
  const beforeIds = [...before.keys()].sort();
  const afterIds = [...after.keys()].sort();
  if (beforeIds.join('\n') !== afterIds.join('\n')) {
    const beforeSet = new Set(beforeIds);
    const afterSet = new Set(afterIds);
    const missing = beforeIds.filter((id) => !afterSet.has(id));
    const added = afterIds.filter((id) => !beforeSet.has(id));
    fail(`La reorganización alteraría el inventario de tareas. Faltantes: ${missing.join(', ') || 'ninguna'}. Nuevas: ${added.join(', ') || 'ninguna'}.`);
  }
}

function consolidateE(files, stagedWrites, stagedDeletes) {
  let nextFiles = [...files];

  for (const group of E_GROUPS) {
    const sources = nextFiles.filter((item) => item.startsWith(group.prefix));
    if (!sources.length) continue;

    const body = sources
      .map((source) => read(source).trim())
      .filter(Boolean)
      .join('\n\n');

    write(group.target, `${group.heading}\n\n${body}`, stagedWrites);

    const firstIndex = nextFiles.findIndex((item) => item === sources[0]);
    nextFiles = nextFiles.filter((item) => !sources.includes(item));
    nextFiles.splice(firstIndex, 0, group.target);

    for (const source of sources) stagedDeletes.add(source);
  }

  return nextFiles;
}

function splitMonolithicBlock(relativePath, stagedWrites, stagedDeletes) {
  const text = read(relativePath);
  const sections = [...text.matchAll(LOGICAL_SECTION_REGEX)];
  if (!sections.length) return null;

  const directory = path.posix.dirname(relativePath);
  const generated = [];
  const usedNames = new Set();

  const intro = text.slice(0, sections[0].index).trim();
  if (intro) {
    const introPath = `${directory}/00_INTRO.md`;
    write(introPath, intro, stagedWrites);
    generated.push(introPath);
    usedNames.add('00_INTRO.md');
  }

  sections.forEach((match, index) => {
    const start = match.index;
    const end = index + 1 < sections.length ? sections[index + 1].index : text.length;
    const chunk = text.slice(start, end).trim();
    const number = String(generated.length).padStart(2, '0');
    const baseSlug = slugify(match[1]);
    let filename = `${number}_${baseSlug}.md`;
    let suffix = 2;
    while (usedNames.has(filename)) {
      filename = `${number}_${baseSlug}_${suffix}.md`;
      suffix += 1;
    }
    usedNames.add(filename);

    const target = `${directory}/${filename}`;
    write(target, chunk, stagedWrites);
    generated.push(target);
  });

  stagedDeletes.add(relativePath);
  return generated;
}

function splitAllMonolithicBlocks(files, stagedWrites, stagedDeletes) {
  const nextFiles = [];

  for (const relativePath of files) {
    const isMonolithicBlock = /^bloques\/[^/]+\/00_BLOQUE_[^/]+\.md$/u.test(relativePath);
    if (!isMonolithicBlock) {
      nextFiles.push(relativePath);
      continue;
    }

    const generated = splitMonolithicBlock(relativePath, stagedWrites, stagedDeletes);
    if (generated?.length) nextFiles.push(...generated);
    else nextFiles.push(relativePath);
  }

  return nextFiles;
}

function updateProtocol(stagedWrites) {
  const relativePath = '01_PROTOCOLO.md';
  let text = stagedWrites.get(relativePath) ?? read(relativePath);
  const marker = '## Regla canónica de granularidad documental';
  if (text.includes(marker)) return;

  text = `${text.trimEnd()}\n\n${marker}\n\n` +
    `La unidad física del plan será la **sección o bloque lógico**, no cada tarea individual.\n\n` +
    `Reglas obligatorias:\n\n` +
    `- un archivo puede contener múltiples tareas con encabezado \`###\`;\n` +
    `- una tarea no deberá tener archivo propio cuando pertenece a una sección lógica común;\n` +
    `- los archivos se nombrarán por la responsabilidad documental que agrupan;\n` +
    `- el estado de cada tarea seguirá derivándose exclusivamente de su marcador;\n` +
    `- el compilador y el registro global deberán detectar todas las tareas dentro de cada archivo;\n` +
    `- una sección monolítica podrá dividirse cuando contenga responsabilidades documentales distintas;\n` +
    `- no se dividirá una tarea internamente entre varios archivos;\n` +
    `- toda reorganización deberá preservar orden, contenido e inventario de identificadores.\n`;

  write(relativePath, text, stagedWrites);
}

function checksum(content) {
  return crypto.createHash('sha256').update(content).digest('hex');
}

function applyChanges(stagedWrites, stagedDeletes, manifest) {
  for (const [relativePath, content] of stagedWrites) {
    const fullPath = path.join(BASE_DIR, relativePath);
    fs.mkdirSync(path.dirname(fullPath), { recursive: true });
    fs.writeFileSync(fullPath, content, 'utf8');
  }

  fs.writeFileSync(MANIFEST_PATH, `${JSON.stringify(manifest, null, 2)}\n`, 'utf8');

  for (const relativePath of stagedDeletes) {
    const fullPath = path.join(BASE_DIR, relativePath);
    if (fs.existsSync(fullPath)) fs.rmSync(fullPath);
  }

  const candidateDirectories = [...new Set([...stagedDeletes].map((item) => path.dirname(path.join(BASE_DIR, item))))]
    .sort((a, b) => b.length - a.length);
  for (const directory of candidateDirectories) {
    if (fs.existsSync(directory) && fs.readdirSync(directory).length === 0) fs.rmdirSync(directory);
  }
}

function main() {
  if (!fs.existsSync(MANIFEST_PATH)) fail('No existe manifest.json.');

  const manifest = JSON.parse(fs.readFileSync(MANIFEST_PATH, 'utf8'));
  if (!Array.isArray(manifest.files)) fail('manifest.json no contiene files[].');

  const beforeInventory = taskInventory(manifest.files);
  assertNoDuplicates(beforeInventory, 'Estado inicial');

  const stagedWrites = new Map();
  const stagedDeletes = new Set();

  let nextFiles = consolidateE(manifest.files, stagedWrites, stagedDeletes);
  nextFiles = splitAllMonolithicBlocks(nextFiles, stagedWrites, stagedDeletes);
  updateProtocol(stagedWrites);

  const nextManifest = {
    ...manifest,
    files: nextFiles,
  };

  const afterInventory = taskInventory(nextFiles, stagedWrites);
  assertNoDuplicates(afterInventory, 'Estado reorganizado');
  assertSameTasks(beforeInventory, afterInventory);

  const report = {
    mode: APPLY ? 'APPLY' : 'DRY_RUN',
    files_before: manifest.files.length,
    files_after: nextFiles.length,
    tasks: afterInventory.size,
    writes: stagedWrites.size,
    deletes: stagedDeletes.size,
    manifest_sha256: checksum(`${JSON.stringify(nextManifest, null, 2)}\n`),
  };

  console.log(JSON.stringify(report, null, 2));
  console.log('\nArchivos nuevos o actualizados:');
  for (const relativePath of stagedWrites.keys()) console.log(`  + ${relativePath}`);
  console.log('\nArchivos que se retirarán:');
  for (const relativePath of stagedDeletes) console.log(`  - ${relativePath}`);

  if (!APPLY) {
    console.log('\nDRY RUN completado. Ejecuta con --apply para escribir los cambios.');
    return;
  }

  applyChanges(stagedWrites, stagedDeletes, nextManifest);
  console.log('\nOK: plan reorganizado por bloques lógicos sin pérdida ni duplicación de tareas.');
}

main();
