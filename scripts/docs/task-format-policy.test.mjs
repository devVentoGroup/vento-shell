import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

import {
  TASK_DELIVERY_TEMPLATE,
  validateTaskFormatPolicySources,
} from './task-format-policy.mjs';

const policySource = fs.readFileSync(
  path.resolve('docs/plan-canonico/modular/task-format-policy.json'),
  'utf8',
);

test('la plantilla material coincide con la política prospectiva', () => {
  const templateSource = fs.readFileSync(
    path.resolve('docs/plan-canonico/modular/task-delivery-template.md'),
    'utf8',
  );
  assert.deepEqual(
    validateTaskFormatPolicySources({ policySource, templateSource }).errors,
    [],
  );
});

test('la plantilla cubre todas las secciones semánticas exigidas', () => {
  const developmentPolicy = JSON.parse(fs.readFileSync(
    path.resolve('docs/plan-canonico/modular/task-development-policy.json'),
    'utf8',
  ));
  for (const { label, pattern } of developmentPolicy.required_section_groups) {
    assert.match(
      TASK_DELIVERY_TEMPLATE,
      new RegExp(`^####(?:\\s+(?:\\d+|N)\\.)?\\s+(?:${pattern})`, 'imu'),
      `la plantilla no cubre la sección semántica ${label}`,
    );
  }
});

test('rechaza reintroducir continuidad fenced en la plantilla', () => {
  const staleTemplate = TASK_DELIVERY_TEMPLATE.replace(
    '`<TASK-ID> — <TASK-TITLE>`',
    '```text\n<TASK-ID> — <TASK-TITLE>\n```',
  );
  assert.deepEqual(
    validateTaskFormatPolicySources({
      policySource,
      templateSource: staleTemplate,
    }).errors,
    ['task-delivery-template.md no coincide con la plantilla derivada de la política vigente.'],
  );
});
