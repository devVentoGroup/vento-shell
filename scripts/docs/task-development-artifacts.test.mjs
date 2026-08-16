import assert from 'node:assert/strict';
import test from 'node:test';

import { analyzeTaskSemanticDiff, renderSemanticDiff } from './task-development-artifacts.mjs';

const empty = `### [ ] TEST-DIFF-001 — Tarea
`;

const developed = `### ✅ TEST-DIFF-001 — Tarea

**Estado:** APROBADA
**Tarea anterior:** TEST-DIFF-000 — Anterior

---

#### 1. Propósito

Se adopta TEST-NEXT-002 y TREQ-TEST-001.
`;

test('clasifica desarrollo real, marcador, metadata, secciones y referencias', () => {
  const diff = analyzeTaskSemanticDiff(empty, developed);
  assert.equal(diff.classification, 'SEMANTIC');
  assert.equal(diff.marker.changed, true);
  assert.deepEqual(diff.sections_added, ['Propósito']);
  assert.deepEqual(diff.treq_added, ['TREQ-TEST-001']);
  assert.ok(diff.prose_lines_added > 0);
});

test('un bloque idéntico no produce cambios', () => {
  const diff = analyzeTaskSemanticDiff(developed, developed);
  assert.equal(diff.classification, 'NO_CHANGES');
  assert.equal(diff.marker.changed, false);
  assert.match(renderSemanticDiff('TEST-DIFF-001', diff), /\*\*Clasificación:\*\* NO_CHANGES/u);
});
