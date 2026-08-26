import assert from 'node:assert/strict';
import test from 'node:test';

import { validateExecutableSource } from './validate-executable-delivery.mjs';

test('stdin-commonjs rechaza return ilegal a nivel superior', () => {
  assert.throws(
    () => validateExecutableSource('return;\n', { mode: 'stdin-commonjs', filename: 'broken.txt' }),
    /Illegal return statement/u,
  );
});

test('stdin-commonjs permite return dentro de funcion y catch sin return superior', () => {
  assert.equal(
    validateExecutableSource(
      "function stop() { return; }\ntry { stop(); } catch (error) { process.exitCode = 1; }\n",
      { mode: 'stdin-commonjs', filename: 'valid.txt' },
    ).mode,
    'stdin-commonjs',
  );
});

test('validador falla cerrado para modo desconocido o fuente vacia', () => {
  assert.throws(() => validateExecutableSource('const x = 1;', { mode: 'unknown' }), /UNSUPPORTED_EXECUTABLE_MODE/u);
  assert.throws(() => validateExecutableSource('   ', { mode: 'stdin-commonjs' }), /EXECUTABLE_SOURCE_EMPTY/u);
});
