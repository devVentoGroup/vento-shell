import fs from 'node:fs';
import path from 'node:path';
import { TextDecoder } from 'node:util';

export const TREQ_REGISTRY_LEGACY_RELATIVE_PATH =
  'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md';
export const TREQ_REGISTRY_HEADER_BASENAME =
  '04A_00_CABECERA_Y_GOBIERNO_DEL_REGISTRO.md';
export const TREQ_REGISTRY_RULES_BASENAME =
  '04A_20_REGLAS_OBLIGATORIAS.md';

const FRAGMENT_BASENAME_PATTERN = /^04A_\d{2}_.+\.md$/u;
const DOMAIN_FRAGMENT_PATTERN = /^04A_\d{2}_(?<domain>[A-Z]+)\.md$/u;

function normalize(source) {
  return source.replace(/\r\n?/g, '\n');
}

function readManifest(baseDir) {
  return JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
}

function decodeUtf8Strict(buffer, relativePath) {
  try {
    return normalize(new TextDecoder('utf-8', { fatal: true }).decode(buffer));
  } catch {
    throw new Error(`${relativePath}: el fragmento 04A no es UTF-8 válido.`);
  }
}

export function getTreqRegistryFragmentPaths({ baseDir, manifest = readManifest(baseDir) }) {
  if (!Array.isArray(manifest.files)) {
    throw new Error('manifest.json no declara files como arreglo.');
  }

  const directory = path.posix.dirname(TREQ_REGISTRY_LEGACY_RELATIVE_PATH);
  return manifest.files.filter((relativePath) => {
    const normalized = relativePath.replaceAll('\\', '/');
    return path.posix.dirname(normalized) === directory
      && FRAGMENT_BASENAME_PATTERN.test(path.posix.basename(normalized));
  });
}

export function readCanonicalTreqRegistryBundle({
  baseDir,
  manifest = readManifest(baseDir),
} = {}) {
  const fragments = getTreqRegistryFragmentPaths({ baseDir, manifest });
  if (fragments.length === 0) {
    throw new Error('manifest.json no registra la familia modular 04A.');
  }

  const duplicates = fragments.filter((item, index, all) => all.indexOf(item) !== index);
  if (duplicates.length > 0) {
    throw new Error(`manifest.json duplica fragmentos 04A: ${[...new Set(duplicates)].join(', ')}.`);
  }

  const basenames = fragments.map((relativePath) => path.posix.basename(relativePath.replaceAll('\\', '/')));
  if (basenames[0] !== TREQ_REGISTRY_HEADER_BASENAME) {
    throw new Error(`el primer fragmento 04A debe ser ${TREQ_REGISTRY_HEADER_BASENAME}.`);
  }
  if (basenames.at(-1) !== TREQ_REGISTRY_RULES_BASENAME) {
    throw new Error(`el último fragmento 04A debe ser ${TREQ_REGISTRY_RULES_BASENAME}.`);
  }

  const sources = [];
  const seenDomains = new Set();

  fragments.forEach((relativePath, index) => {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) {
      throw new Error(`${relativePath}: fragmento 04A registrado pero ausente.`);
    }

    const source = decodeUtf8Strict(fs.readFileSync(fullPath), relativePath);
    sources.push(source);

    if (index === 0) {
      if (!/^## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA\s*$/mu.test(source)) {
        throw new Error(`${relativePath}: la cabecera física 04A no contiene el encabezado canónico.`);
      }
      return;
    }

    if (index === fragments.length - 1) {
      if (!/^### Reglas obligatorias\s*$/mu.test(source)) {
        throw new Error(`${relativePath}: el fragmento final no contiene \`### Reglas obligatorias\`.`);
      }
      return;
    }

    const basename = basenames[index];
    const domainMatch = basename.match(DOMAIN_FRAGMENT_PATTERN);
    if (!domainMatch?.groups?.domain) {
      throw new Error(`${relativePath}: nombre de fragmento de dominio 04A no reconocido.`);
    }

    const expectedDomain = domainMatch.groups.domain;
    const headings = [...source.matchAll(/^####\s+([A-Z]+)\s*$/gmu)].map((match) => match[1]);
    if (headings.length !== 1 || headings[0] !== expectedDomain) {
      throw new Error(
        `${relativePath}: el dominio físico debe ser exactamente ${expectedDomain}; `
        + `se encontraron ${headings.length === 0 ? '0 encabezados' : headings.join(', ')}.`,
      );
    }
    if (seenDomains.has(expectedDomain)) {
      throw new Error(`${relativePath}: el dominio físico ${expectedDomain} está duplicado en la familia 04A.`);
    }
    seenDomains.add(expectedDomain);
  });

  return {
    fragments: [...fragments],
    domains: [...seenDomains],
    source: sources.join(''),
  };
}

export function readCanonicalTreqRegistry({ baseDir }) {
  return readCanonicalTreqRegistryBundle({ baseDir }).source;
}

export function writeCanonicalTreqRegistry({ baseDir, source }) {
  const fragments = getTreqRegistryFragmentPaths({ baseDir });
  if (fragments.length === 0) {
    throw new Error('No existen fragmentos modulares 04A registrados en manifest.json.');
  }

  for (const relativePath of fragments) {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) {
      throw new Error(`${relativePath}: no puede escribirse el registro porque el fragmento registrado está ausente.`);
    }
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