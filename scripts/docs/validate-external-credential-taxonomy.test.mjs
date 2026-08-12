import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

import {
  validateExternalCredentialTaxonomySource,
} from './validate-external-credential-taxonomy.mjs';

const validSource = fs.readFileSync(
  path.resolve(
    'docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md',
  ),
  'utf8',
).replace(/\r\n?/gu, '\n');

test('acepta la taxonomía reconciliada de credenciales externas', () => {
  const result = validateExternalCredentialTaxonomySource(validSource);
  assert.deepEqual(result, { classificationBlocks: 2, credentialClasses: 6 });
});

test('rechaza clasificar toda API key o token como secreto', () => {
  assert.throws(
    () => validateExternalCredentialTaxonomySource(
      `${validSource}\nAPI key, token o secret\n→ valor secreto almacenado fuera de tablas expuestas\n`,
    ),
    /generalización incompatible/u,
  );
});

test('rechaza omitir una clase del resumen taxonómico', () => {
  assert.throws(
    () => validateExternalCredentialTaxonomySource(
      validSource.replace(
        '`DESTINATION_TOKEN_OR_IDENTIFIER`\n→ dato técnico de destino sujeto a privacidad; no es secreto de autenticación externo',
        '`DESTINATION_IDENTIFIER_OMITTED`',
      ),
    ),
    /falta `DESTINATION_TOKEN_OR_IDENTIFIER`/u,
  );
});
