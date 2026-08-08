import fs from 'node:fs';
import path from 'node:path';

const MODULAR_ROOT = 'docs/plan-canonico/modular';

function normalize(text) {
  return text.replace(/\r\n?/g, '\n');
}

export function readPlanSection(root, legacyRelativePath) {
  const legacyFullPath = path.resolve(root, legacyRelativePath);
  if (fs.existsSync(legacyFullPath)) {
    return normalize(fs.readFileSync(legacyFullPath, 'utf8'));
  }

  const manifestPath = path.resolve(root, MODULAR_ROOT, 'manifest.json');
  if (!fs.existsSync(manifestPath)) {
    throw new Error(`no existe ${legacyRelativePath} ni manifest.json para componerlo.`);
  }

  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
  if (!Array.isArray(manifest.files)) throw new Error('manifest.json no contiene files[].');

  const relativeToModular = path
    .relative(path.resolve(root, MODULAR_ROOT), legacyFullPath)
    .replaceAll('\\', '/');
  const directory = path.posix.dirname(relativeToModular);
  const basename = path.posix.basename(relativeToModular);
  const numericPrefix = basename.match(/^(\d+[A-Z]?)_/u)?.[1];
  if (!numericPrefix) {
    throw new Error(`no se puede derivar la familia de fragmentos para ${legacyRelativePath}.`);
  }

  const fragmentPattern = new RegExp(`^${numericPrefix}_\\d{2}_.*\\.md$`, 'u');
  const fragments = manifest.files.filter((relativePath) => {
    const normalized = relativePath.replaceAll('\\', '/');
    return path.posix.dirname(normalized) === directory
      && fragmentPattern.test(path.posix.basename(normalized));
  });
  if (!fragments.length) {
    throw new Error(`no existen fragmentos registrados para ${legacyRelativePath}.`);
  }

  return normalize(fragments
    .map((relativePath) =>
      fs.readFileSync(path.resolve(root, MODULAR_ROOT, relativePath), 'utf8'))
    .join(''));
}
