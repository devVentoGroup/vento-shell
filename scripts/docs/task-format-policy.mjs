import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

export const TASK_DELIVERY_TEMPLATE = `### ✅ <TASK-ID> — <TASK-TITLE>

**Estado:** APROBADA
**Tarea anterior:** <PREVIOUS-ID> — <PREVIOUS-TITLE>
**Tarea siguiente:** <NEXT-ID> — <NEXT-TITLE>
**Tipo de tarea:** <TYPE>
**Bloque:** <BLOCK>
**Repositorio propietario:** \`devVentoGroup/vento-shell\`
**Archivo propietario:** \`<OWNER-FILE>\`
**Estado físico resultante:** \`<PHYSICAL-STATE>\`
**Cambios físicos autorizados:** <AUTHORIZED-CHANGES>
**Requisitos de prueba creados o modificados:** <TREQ-COUNT>

---

#### 1. Objetivo

...

---

#### N. Requisitos de prueba derivados

...

---

#### N. Evidencia de validación

| Clase     | Estado             | Evidencia            |
| --------- | ------------------ | -------------------- |
| BUILD     | <BUILD_STATUS>     | <BUILD_EVIDENCE>     |
| LOCAL     | <LOCAL_STATUS>     | <LOCAL_EVIDENCE>     |
| REMOTA    | <REMOTE_STATUS>    | <REMOTE_EVIDENCE>    |
| OPERATIVA | <OPERATION_STATUS> | <OPERATION_EVIDENCE> |
| FÍSICA    | <PHYSICAL_STATUS>  | <PHYSICAL_EVIDENCE>  |

---

#### N. Criterios de aceptación

...

---

#### N. Continuidad

**ÚLTIMA TAREA APROBADA**
\`<PREVIOUS-ID> — <PREVIOUS-TITLE>\`

**TAREA ACTUAL APROBADA**
\`<TASK-ID> — <TASK-TITLE>\`

**SIGUIENTE TAREA RESERVADA**
\`<NEXT-ID> — <NEXT-TITLE>\`
`;

function normalizeSource(source) {
  return String(source).replace(/\r\n?/gu, '\n').replace(/\n+$/u, '');
}

export function validateTaskFormatPolicySources({ policySource, templateSource }) {
  const errors = [];
  let policy = null;
  try {
    policy = JSON.parse(policySource);
  } catch (error) {
    return {
      errors: [`task-format-policy.json no es JSON válido: ${error instanceof Error ? error.message : String(error)}`],
      policy,
    };
  }

  const expected = {
    schema_version: 1,
    historical_policy: 'PRESERVE_BEFORE_BOUNDARY',
    header_style: 'COMPACT_METADATA_LIKE_SHELL_UI_005',
    continuity_style: 'STACKED_INLINE_CODE',
    identity_title_authority: 'PENDING_TASK_CONTEXT_SNAPSHOT',
    remove_redundant_no_start_sentence: true,
    automatic_scaffold: false,
  };
  for (const [field, value] of Object.entries(expected)) {
    if (policy[field] !== value) errors.push(`${field} debe ser ${JSON.stringify(value)}.`);
  }
  if (!/^[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3}$/u.test(policy.effective_from_task_id ?? '')) {
    errors.push('effective_from_task_id debe contener un ID canónico válido.');
  }
  if (normalizeSource(templateSource) !== normalizeSource(TASK_DELIVERY_TEMPLATE)) {
    errors.push('task-delivery-template.md no coincide con la plantilla derivada de la política vigente.');
  }
  return { errors, policy };
}

export function validateTaskFormatPolicy({ root = process.cwd() } = {}) {
  const baseDir = path.join(root, 'docs', 'plan-canonico', 'modular');
  const policyPath = path.join(baseDir, 'task-format-policy.json');
  const templatePath = path.join(baseDir, 'task-delivery-template.md');
  const result = validateTaskFormatPolicySources({
    policySource: fs.readFileSync(policyPath, 'utf8'),
    templateSource: fs.readFileSync(templatePath, 'utf8'),
  });
  if (result.errors.length > 0) {
    throw new Error(`política de presentación inválida:\n- ${result.errors.join('\n- ')}`);
  }
  return result.policy;
}

function main() {
  const policy = validateTaskFormatPolicy();
  console.log(
    `OK: política de presentación ${policy.policy_id}; frontera ${policy.effective_from_task_id}; plantilla vigente.`,
  );
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exit(1);
  }
}
