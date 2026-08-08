import fs from 'node:fs';
import path from 'node:path';

export const TREQ_REGISTRY_LEGACY_RELATIVE_PATH =
  'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md';

const FRAGMENT_BASENAME_PATTERN = /^04A_\d{2}_.+\.md$/u;

function normalize(source) {
  return source.replace(/\r\n?/g, '\n');
}

function readManifest(baseDir) {
  return JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
}

export function getTreqRegistryFragmentPaths({ baseDir, manifest = readManifest(baseDir) }) {
  const directory = path.posix.dirname(TREQ_REGISTRY_LEGACY_RELATIVE_PATH);
  return manifest.files.filter((relativePath) => {
    const normalized = relativePath.replaceAll('\\', '/');
    return path.posix.dirname(normalized) === directory
      && FRAGMENT_BASENAME_PATTERN.test(path.posix.basename(normalized));
  });
}

export function readCanonicalTreqRegistry({ baseDir }) {
  const legacyPath = path.join(baseDir, TREQ_REGISTRY_LEGACY_RELATIVE_PATH);
  if (fs.existsSync(legacyPath)) {
    return normalize(fs.readFileSync(legacyPath, 'utf8'));
  }

  const fragments = getTreqRegistryFragmentPaths({ baseDir });
  if (fragments.length === 0) {
    throw new Error('No existe el registro TREQ monolítico ni su familia modular 04A.');
  }
  return fragments
    .map((relativePath) => normalize(fs.readFileSync(path.join(baseDir, relativePath), 'utf8')))
    .join('');
}

export function writeCanonicalTreqRegistry({ baseDir, source }) {
  const legacyPath = path.join(baseDir, TREQ_REGISTRY_LEGACY_RELATIVE_PATH);
  if (fs.existsSync(legacyPath)) {
    fs.writeFileSync(legacyPath, normalize(source), 'utf8');
    return;
  }

  const fragments = getTreqRegistryFragmentPaths({ baseDir });
  if (fragments.length === 0) {
    throw new Error('No existen fragmentos modulares 04A registrados en manifest.json.');
  }

  const normalized = normalize(source);
  const boundaries = [
    ...normalized.matchAll(/^####\s+([A-Z]+)\s*$/gmu),
    ...normalized.matchAll(/^###\s+Reglas obligatorias\s*$/gmu),
  ].sort((left, right) => left.index - right.index);
  const starts = [0, ...boundaries.map((match) => match.index)];
  const chunks = starts.map((start, index) =>
    normalized.slice(start, starts[index + 1] ?? normalized.length));

  if (chunks.length !== fragments.length) {
    throw new Error(
      `El registro se divide en ${chunks.length} secciones, pero manifest.json declara ${fragments.length} fragmentos 04A.`,
    );
  }

  chunks.forEach((chunk, index) => {
    if (!chunk.endsWith('\n')) {
      throw new Error(`La sección 04A ${index} no termina en salto de línea.`);
    }
    fs.writeFileSync(path.join(baseDir, fragments[index]), chunk, 'utf8');
  });
}
