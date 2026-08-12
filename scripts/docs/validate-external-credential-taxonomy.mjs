import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const BLOCK_PATH =
  'docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md';

const FORBIDDEN_GENERALIZATIONS = [
  'API key, token o secret\n→ valor secreto almacenado fuera de tablas expuestas',
  'una API key, token o secret se invalida fuera de tablas expuestas',
];

const REQUIRED_CLASSES = [
  '`SECRET_STATIC_SERVER_SIDE` / `SECRET_DYNAMIC_RECOVERABLE`',
  '`SECRET_DYNAMIC_VERIFIER`',
  '`PUBLIC_CREDENTIAL_RESTRICTED` / `PUBLIC_CONFIGURATION`',
  '`CREDENTIAL_REFERENCE`',
  '`DESTINATION_TOKEN_OR_IDENTIFIER`',
  '`NO_SECRET_APPLICABLE`',
];

function fail(message) {
  throw new Error(message);
}

export function validateExternalCredentialTaxonomySource(source) {
  const normalized = source.replace(/\r\n?/gu, '\n');
  for (const forbidden of FORBIDDEN_GENERALIZATIONS) {
    if (normalized.includes(forbidden)) {
      fail(`INT-EXT conserva una generalización incompatible con la taxonomía aprobada: ${forbidden}.`);
    }
  }

  const classificationBlocks = [...normalized.matchAll(/```text\n(?<body>[\s\S]*?)\n```/gu)]
    .filter((match) => match.groups.body.includes('Material de credencial o identificador técnico'));
  if (classificationBlocks.length !== 2) {
    fail(`INT-EXT-020 debe materializar exactamente dos resúmenes taxonómicos; encontrados: ${classificationBlocks.length}.`);
  }

  for (const [index, match] of classificationBlocks.entries()) {
    for (const credentialClass of REQUIRED_CLASSES) {
      if (!match.groups.body.includes(credentialClass)) {
        fail(`resumen taxonómico ${index + 1}: falta ${credentialClass}.`);
      }
    }
  }

  const requiredDecisions = [
    'No todo material llamado `key`, `token`, `dsn` o `id` es un secreto ocultable.',
    '`PUBLIC_CREDENTIAL_RESTRICTED` no equivale a credencial universal reutilizable.',
    'Para Sentry se conserva el DSN publicable/restringido. Para Google Maps se conserva la API key cliente publicable/restringida.',
  ];
  for (const decision of requiredDecisions) {
    if (!normalized.includes(decision)) fail(`INT-EXT: falta la decisión canónica ${decision}`);
  }

  return { classificationBlocks: classificationBlocks.length, credentialClasses: REQUIRED_CLASSES.length };
}

export function validateExternalCredentialTaxonomy({ root = process.cwd() } = {}) {
  return validateExternalCredentialTaxonomySource(
    fs.readFileSync(path.join(root, BLOCK_PATH), 'utf8'),
  );
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const stats = validateExternalCredentialTaxonomy();
  console.log(
    `OK: taxonomía INT-EXT; ${stats.classificationBlocks} resúmenes; `
    + `${stats.credentialClasses} clases/grupos obligatorios por resumen.`,
  );
}
