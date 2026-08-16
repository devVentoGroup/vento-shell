import assert from 'node:assert/strict';
import test from 'node:test';

import { parsePendingTaskTitleAuthority } from './pending-task-title-authority.mjs';

const guide = `# Guía

| Pendiente # | Orden canónico | Etapa | Estado | Identificador | Título canónico | Alcance resumido | Fragmento propietario |
| ---: | ---: | --- | --- | --- | --- | --- | --- |
| 1 | 10 | X | NO INICIADA | \`TEST-TITLE-010\` | Título estable | Texto | \`x.md\` |
| 2 | 11 | X | NO INICIADA | \`TEST-TITLE-011\` | Título con \\| separador | Texto | \`x.md\` |
`;

test('extrae títulos únicamente de la guía de tareas pendientes', () => {
  const titles = parsePendingTaskTitleAuthority(guide);
  assert.equal(titles.get('TEST-TITLE-010'), 'Título estable');
  assert.equal(titles.get('TEST-TITLE-011'), 'Título con | separador');
});

test('rechaza títulos contradictorios dentro de la autoridad pendiente', () => {
  const duplicated = `${guide}\n${guide.replace('Título estable', 'Título cambiado')}`;
  assert.throws(
    () => parsePendingTaskTitleAuthority(duplicated),
    /títulos contradictorios para TEST-TITLE-010/u,
  );
});
