import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

const repoRoot = process.cwd();
const checkOnly = process.argv.includes('--check');
const baseDir = path.resolve(repoRoot, 'docs/plan-canonico/modular');
const manifestPath = path.join(baseDir, 'manifest.json');

if (!fs.existsSync(manifestPath)) {
  console.error(`ERROR: no existe ${path.relative(repoRoot, manifestPath)}.`);
  process.exit(1);
}

const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
if (!Array.isArray(manifest.files) || manifest.files.length === 0) {
  console.error('ERROR: manifest.json no contiene una lista válida de archivos.');
  process.exit(1);
}

const duplicatedPaths = manifest.files.filter((file, index, all) => all.indexOf(file) !== index);
if (duplicatedPaths.length > 0) {
  console.error(`ERROR: rutas duplicadas en manifest.json: ${[...new Set(duplicatedPaths)].join(', ')}`);
  process.exit(1);
}

let compiled = '';
for (const relativePath of manifest.files) {
  const fullPath = path.join(baseDir, relativePath);
  if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) {
    console.error(`ERROR: falta el fragmento ${relativePath}`);
    process.exit(1);
  }
  compiled += fs.readFileSync(fullPath, 'utf8');
}

const outputPath = path.resolve(repoRoot, manifest.compiled_output);
const sha256 = (content) => crypto.createHash('sha256').update(content).digest('hex');
const currentHash = sha256(Buffer.from(compiled, 'utf8'));

const taskMatches = [...compiled.matchAll(/^### .*\b(AUTH-[A-Z0-9]+-\d{3})\b.*$/gm)].map((match) => match[1]);
const duplicates = taskMatches.filter((task, index, all) => all.indexOf(task) !== index);
if (duplicates.length > 0) {
  console.error(`ERROR: tareas duplicadas: ${[...new Set(duplicates)].join(', ')}`);
  process.exit(1);
}

for (let i = 1; i <= 28; i += 1) {
  const id = `AUTH-RBAC-${String(i).padStart(3, '0')}`;
  const count = taskMatches.filter((task) => task === id).length;
  if (count !== 1) {
    console.error(`ERROR: ${id} aparece ${count} veces; debe aparecer exactamente una.`);
    process.exit(1);
  }
}

if (checkOnly) {
  if (!fs.existsSync(outputPath)) {
    console.error('ERROR: todavía no existe el documento compilado. Ejecuta primero sin --check.');
    process.exit(1);
  }
  const existing = fs.readFileSync(outputPath, 'utf8');
  if (existing !== compiled) {
    console.error('ERROR: el compilado está desactualizado frente a los fragmentos.');
    process.exit(1);
  }
  console.log(`OK: compilado vigente; ${manifest.files.length} fragmentos; ${taskMatches.length} tareas AUTH únicas.`);
  console.log(`SHA-256: ${currentHash}`);
  process.exit(0);
}

fs.mkdirSync(path.dirname(outputPath), { recursive: true });
fs.writeFileSync(outputPath, compiled, 'utf8');
console.log(`OK: ${path.relative(repoRoot, outputPath)}`);
console.log(`Fragmentos: ${manifest.files.length}`);
console.log(`Tareas AUTH únicas: ${taskMatches.length}`);
console.log(`SHA-256: ${currentHash}`);
