import assert from 'node:assert/strict';
import test from 'node:test';

import { evaluateLintRatchet, summarizeLintResults } from './lint-ratchet.mjs';

test('resume ESLint por archivo, regla y severidad', () => {
  const issues = summarizeLintResults([
    {
      filePath: 'src/example.ts',
      messages: [
        { ruleId: 'rule-a', severity: 2 },
        { ruleId: 'rule-a', severity: 2 },
        { ruleId: 'rule-b', severity: 1 },
      ],
    },
  ], { root: process.cwd() });
  assert.deepEqual(issues, [
    { file: 'src/example.ts', rule: 'rule-a', severity: 2, count: 2 },
    { file: 'src/example.ts', rule: 'rule-b', severity: 1, count: 1 },
  ]);
});

test('acepta deuda histórica sin aumentos en archivos no tocados', () => {
  const issue = { file: 'legacy.ts', rule: 'rule-a', severity: 2, count: 2 };
  const result = evaluateLintRatchet({
    baseline: { issues: [issue] },
    actualIssues: [issue],
    changedFiles: ['clean.ts'],
  });
  assert.deepEqual(result, { newDebt: [], touchedDebt: [] });
});

test('rechaza aumentos y cualquier hallazgo en un archivo tocado', () => {
  const issue = { file: 'legacy.ts', rule: 'rule-a', severity: 2, count: 3 };
  const result = evaluateLintRatchet({
    baseline: { issues: [{ ...issue, count: 2 }] },
    actualIssues: [issue],
    changedFiles: ['legacy.ts'],
  });
  assert.equal(result.newDebt[0].added, 1);
  assert.deepEqual(result.touchedDebt, [issue]);
});
