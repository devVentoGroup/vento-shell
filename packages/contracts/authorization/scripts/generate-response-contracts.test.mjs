import assert from 'node:assert/strict';
import test from 'node:test';

import { assertMarkdownTableRow } from './generate-response-contracts.mjs';

test('acepta padding de alineación en una fila Markdown canónica', () => {
  const source = [
    '| Propiedad        | Valor               |',
    '| ---------------- | ------------------- |',
    '| gate temporal    | `PRE_E5_FOUNDATION` |',
  ].join('\n');

  assert.doesNotThrow(() => assertMarkdownTableRow(
    source,
    ['gate temporal', '`PRE_E5_FOUNDATION`'],
    'SHELL-CON canonical source',
  ));
});

test('rechaza cambios en el valor contractual aunque la fila tenga padding', () => {
  const source = '| gate temporal    | `POST_E5_PACKAGE` |';

  assert.throws(
    () => assertMarkdownTableRow(
      source,
      ['gate temporal', '`PRE_E5_FOUNDATION`'],
      'SHELL-CON canonical source',
    ),
    /missing required canonical table row/u,
  );
});

test('rechaza filas con celdas adicionales', () => {
  const source = '| gate temporal | `PRE_E5_FOUNDATION` | extra |';

  assert.throws(
    () => assertMarkdownTableRow(
      source,
      ['gate temporal', '`PRE_E5_FOUNDATION`'],
      'SHELL-CON canonical source',
    ),
    /missing required canonical table row/u,
  );
});
